--Ref URL - https://www.linkedin.com/groupItem?view=&gid=4884099&type=member&item=5954352632352038915&commentID=5955216134612537344&report%2Esuccess=8ULbKyXO6NDvmoK7o030UNOYGZKrvdhBhypZ_w8EpQrrQI-BBjkmxwkEOwBjLE28YyDIxcyEO7_TA_giuRN#commentID_5955216134612537344
drop view view1;
drop table tab1;
drop table tab2;
drop table tab3;

create table tab1 as
select 6 mykey, 'ABC' from_name, 'XYZ' to_name;

create table tab2 as
select 8 mykey, 'DEF' from_name, 'LMN' to_name;

create table tab3 as
select 4 mykey, 'BIO' from_name, 'FYI' to_name;
--select 4, 'BIO', 'FYI';

---My version
create view view1 as
SELECT mykey Provider_key
, CAST(upper(from_name) as VARCHAR(3)) as From_Network_Name
, CAST(to_name as VARCHAR(3)) as Sm_Network_Name
FROM tab1 --where mykey = 6
union
select mykey Provider_key
, upper(from_name) as From_Network_Name
, to_name as Sm_Network_Name
from tab2 --where mykey = 9
union
select mykey Provider_key
, upper(from_name) as From_Network_Name
, to_name as Sm_Network_Name
from tab3

-----Your version
--create view view1 as
--SELECT mykey Provider_key, CAST(upper(from_name) as VARCHAR(3)) as From_Network_Name, CAST(to_name as VARCHAR(3)) as Sm_Network_Name
--FROM tab1 --where mykey = 6
--union
--select mykey Provider_key, upper(from_name) as From_Network_Name, to_name as Sm_Network_Name
--from tab2 --where mykey = 9
--union
--select 4 mykey, 'BIO' from_name, 'FYI' to_name;

select * from view1; -- Works as expected
select * from view1 where provider_key = 6; -- Works as expected
SELECT * FROM view1 WHERE from_network_name = 'W'; --Works as expected with tab3 introduction.
