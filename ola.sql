create database ola;
use ola;

create view Successful_bookings as
select * from bookings
where booking_status = 'Success';
#1. Retrieve all successful bookings:
SELECT * FROM Successful_bookings;


#2. Find the average ride distance for each vehicle type:
create view ride_distance_for_each_vehicle as
select Vehicle_Type ,avg(Ride_Distance)
as avg_distance FROM bookings
GROUP BY Vehicle_Type;
select * from ride_distance_for_each_vehicle;

#3. Get the total number of cancelled rides by customers:
create View canceled_ride_customer AS
select count(*) from bookings WHERE Booking_Status ="Canceled by Customer" ;

select * from canceled_ride_customer ;

#4. List the top 5 customers who booked the highest number of rides:
create view Top_5_Customer as 
select Customer_ID ,count(Booking_ID)as Total_rides
from bookings
group by Customer_ID 
order by total_rides DESC limit 5;

select * from Top_5_Customer;

#5. Get the number of rides cancelled by drivers due to personal and car-related issues:
create view Canceled_Rides_By_driver as
select count(*) From bookings
where Canceled_Rides_by_Driver = 'Personal & Car related issue';

select * from Canceled_Rides_By_driver;
#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
create view MAX_MIN_ratings as
select max(Driver_Ratings) as max_rating,
min(Driver_Ratings) as min_rating
from bookings where Vehicle_Type = "Prime Sedan";

select * from MAX_MIN_ratings ;
#7. Retrieve all rides where payment was made using UPI:
create view Payment_method as
select Booking_ID, Payment_Method from bookings where Payment_Method ="UPI";

select * from Payment_method ;

#8. Find the average customer rating per vehicle type:
create view Avg_Vehicle_rating as
select Vehicle_Type ,avg(Customer_Rating) from bookings
group by Vehicle_Type 
order by avg(Customer_Rating) desc;

select * from Avg_Vehicle_rating ;

#9. Calculate the total booking value of rides completed successfully:
create view total_successful_ride_value as
select sum(Booking_value)as total_successful_ride_value from bookings
where Booking_Status ="Success";

select *from total_successful_ride_value;

#10. List all incomplete rides along with the reason:
create view Incomplete_Rides_Reason as
select Booking_Id ,Incomplete_Rides_Reason
from bookings  
where Incomplete_Rides ="Yes";
select * from  Incomplete_Rides_Reason;