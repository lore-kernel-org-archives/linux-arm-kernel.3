Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02CC3E7719C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 21:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lyiNOWbmdtmWOrcLITIi/XBGt3YUaPeNJdlK20cyaDo=; b=UWUROcRm6VHdFO+PXWpDB3m0qH
	6AUsWqXErNjxgbBXbxBq9LrK85zKd8MxNmwYytt5iDZkQaEnrRh+CJ9f56KMJDeC57JgUYzv7WICl
	24Lafju9LLU0BoDhIzYiaeCOT16TinNy/hwg6pEKLy2QkE/PVNxMaBRBdOHVVQjXqsVqhHrJuez7e
	z8tfgJvX3CdaIkeXEGiV9LcacacZlLwqsmEe5B+k4kpV9Pnsn/Ex7qR3QyyYgenlZyGpEXiXzb1f7
	nsee1QD475Zagq0NYtGnH4mMYrwGNNPK2rINTn2qXDes0hha9BxBwGtZAlVIHmGGFTroUJT6b8wV4
	ppWywHBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWMdv-0000000H20Z-2Ms0;
	Fri, 10 Jan 2025 21:34:11 +0000
Received: from mail-northcentralusazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c105::5] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWMch-0000000H1mR-0hHl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 21:32:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gGxTyUtQKvd7T57UgzrDyh3ooNuF4tbxxBtQG+kvYoBVmUY/r2y8J8KUD0dhFFn7SJ7uP75NHHPDdsXqmJXb0UIUyS5X4xL+P95yQ/qpk2QzvNJJM3uiZdi3JIs9uWPk8Ma411JWNRNuyzDbqDaPNHwrF/jRbVQjS8yOIXLHmQW5SdHqNa9dJGhe7fbBu5+4loRiY3fhBA/Zk5HUe0+UxuXN8N1mRBR/5qIAV39HGAZYTTwoknWB/6WUVjPmPrDM4kjl8RkHMcm6Bw/9wSMTpIHOsWRCqmJmei42fsLaT+QqdPF4MyD4dV4bRWUXNLJN1m3RpDvKGxg0z04c6OoAyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lyiNOWbmdtmWOrcLITIi/XBGt3YUaPeNJdlK20cyaDo=;
 b=LQNw7yGT4PgXdgxyGl/t+WxwLKTY1U7fdDoX/rUIA78GiPLZ7ukOB+9DdcFxl5v8/kuQ7DqUz4sViEqIzCb9RnG16c0sJNv2fn5FBI0e2p4PKRAPy4zIAB5jjRcmCdva0KqSh20x3ZoxDxMQn12YpJqNwkpQF8sCAtc/mWrQp6ArGK1pCISRzWGuoofKdYcEI/CfirU+DGSDS0vbSXGv9CayDToo1wEGmqhIjqUp1LB4hwzultR9mXJE5XIzNnF9yEf7rWYIZCM9oDS6rSFGan1jfLZUyzYKsaeOltKoJZD/IziyAA7iK8hJ9bOuEVU1ri+wrJ3bBiFhr1ymgp8J1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lyiNOWbmdtmWOrcLITIi/XBGt3YUaPeNJdlK20cyaDo=;
 b=QNRsTyQ2KkoW5w9Ev2ajYRetIOWgVaP4peXfQVW0SUEIKP/04iaTvvgxW9PDRUNXpX2/VPBpRUgwurUyEgoj9sTgaKAPJdXUqe9gBS8S+Xp5ubJcQrLTOUokkakFECcCtm1bmS6jJlNgXFGD8xkQsiFWt2D9srU6tSOlhBzWeKM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from MW4PR01MB6228.prod.exchangelabs.com (2603:10b6:303:76::7) by
 MW4PR01MB6259.prod.exchangelabs.com (2603:10b6:303:78::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8335.9; Fri, 10 Jan 2025 21:32:49 +0000
Received: from MW4PR01MB6228.prod.exchangelabs.com
 ([fe80::13ba:df5b:8558:8bba]) by MW4PR01MB6228.prod.exchangelabs.com
 ([fe80::13ba:df5b:8558:8bba%7]) with mapi id 15.20.8335.010; Fri, 10 Jan 2025
 21:32:48 +0000
Date: Fri, 10 Jan 2025 13:32:43 -0800 (PST)
From: Ilkka Koskinen <ilkka@os.amperecomputing.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
cc: Ilkka Koskinen <ilkka@os.amperecomputing.com>, 
    Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
    Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
    coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] coresight: catu: Fix number of pages while using 64k
 pages
In-Reply-To: <7fa2c7c2-0bbf-4d45-bc90-71c4a4a82c0c@arm.com>
Message-ID: <6d6128d4-778f-fc9c-651b-53de199d023@os.amperecomputing.com>
References: <20250109215348.5483-1-ilkka@os.amperecomputing.com> <7fa2c7c2-0bbf-4d45-bc90-71c4a4a82c0c@arm.com>
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-ClientProxiedBy: SN7PR04CA0057.namprd04.prod.outlook.com
 (2603:10b6:806:120::32) To MW4PR01MB6228.prod.exchangelabs.com
 (2603:10b6:303:76::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR01MB6228:EE_|MW4PR01MB6259:EE_
X-MS-Office365-Filtering-Correlation-Id: 564668fb-f183-4439-1dd6-08dd31be5470
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jodCWywUORophD95QvH+oRLoV44ZMijZEXgNelkAubCVV/LfDtUJWLBAoB2k?=
 =?us-ascii?Q?vvCuGH74qiqGVoeKdZYkeakuMAjHK+0LyJPNBaZSqUKCd95Cnhn0lGFDMdV3?=
 =?us-ascii?Q?SMI9ExlKfT8ILV6YVb02+tUXZ0J3hiVjln2+j4hb0B0aQDXLbzEt7NDwDep0?=
 =?us-ascii?Q?M7WruFEu/HEozPBJDbuj35I/czcjyM+U12DjEX1VOg20B89ywETjUS/iQ0Ju?=
 =?us-ascii?Q?JYV3d9Ng21YwK68//9uqTRQAUWd4EfZ4uZ4JT/cAFFpgeOfi+Sxyt/BlASnu?=
 =?us-ascii?Q?GgntCVRra5fjKD+/dMEcLtuwiug2lUYZgmAo1jJyqKy8h8o53X9YfHM1R9sf?=
 =?us-ascii?Q?kcQtGBQxKrHHhJIxLcdgTWzqQmcjE7eYAKy8iEwh651cT0QtqyXR5bIhWEsK?=
 =?us-ascii?Q?ifNvhYDEuL34HpyIrcHje7t2TWVuwN4xTvkOnC0XA81CsO3GdJ4Eh2CRJeAt?=
 =?us-ascii?Q?z+dfpruYfwVZJgJC/8iNICpPk8h5/uGWFWZxrCTgOcPg9SvOG1ZZVHQJmgOw?=
 =?us-ascii?Q?jz2VNA4aJnO0ISHMMKpk0HX4gPjVSwnaDfeo5LHP49uDb8xLnQL3msqFS1Vs?=
 =?us-ascii?Q?sunrS/DR+/b+Lxg1z/yhd7FtQ3P2o85S9TYmRr5Zdz6YYmE0uWVzRA/jpGmc?=
 =?us-ascii?Q?RtNIO3TIf8rP3PRJDDQaQIxKWpRTh1AuJKy6+WSo6KqLDgg+0UD6Vm4SWtm0?=
 =?us-ascii?Q?yklvInPQY1TWk/TuNlgsEIxjWcWgCI43wGdgEmIFSdBD0T2FThZdWdIBFUH0?=
 =?us-ascii?Q?RGjngbezTnzMcVsZWQbOPDKByMjU1/Mk38V7Q2iFyEkj5GyacC8jWaOlG7jA?=
 =?us-ascii?Q?1Sl1eRWpkKwEY/rLRS1dItspsYrPKW1ooqu8zaCf89G2NSJeEABCB9CO6Rq8?=
 =?us-ascii?Q?Ru3INZ/P9gg8Bn3qE+lWxdZ6zKlIOb9OXqEWdvco6hNT6WpI5e/z+Y6DuT7B?=
 =?us-ascii?Q?z4znvkEkJeMfzhn1DJgX6BEacJ3XtCBKgiw0+sjGcRYX03b3ZVaVmXOKIa5x?=
 =?us-ascii?Q?3yw4R7sc7Z9IPKr+O91G5ehEFR1FztGbg8I18ZsptIbgKe0RQlgoumpGOoyp?=
 =?us-ascii?Q?PSntkYVrzPEvt/iXjroVos20vwy/AzY5j9DV5I5E9AcAR0gfLmQCIi27Lqhe?=
 =?us-ascii?Q?MSXhbo+5Lq6wQSWWF7Nz8g5S4AQISsASPu5RltyOJKo7OUP/Rp2kT/47kOtw?=
 =?us-ascii?Q?Tx/MFJPqY0Upz31rNujWSwZC3EA/qIBd1Pn28tTjtL0jZKUuGXs5xmqHqaUh?=
 =?us-ascii?Q?BeD4uM8+Xl2VdbIL/3sFp9hMZxTVvz8eoTFyy1Xsnmogi3TxlPhEm+zKZJaH?=
 =?us-ascii?Q?3IGP4zUo56xdicj4AAGRqhuph7EWbemn7pXM+W9MWNqRe00Ogzld4yl5hUHE?=
 =?us-ascii?Q?QRRP99N0YqT240/BpsyTz7/Y4C57hJ9ZP1oWlNPIAMLQcQGhvWGYeZLc9+8x?=
 =?us-ascii?Q?eKO4g7uz2YzIeCRNfSP3MdBvE+TkpuHA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR01MB6228.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?STAMtER9vt6LwO/UATKkKbw9sIhW0Qn6vKCKPG4nuX3Dg6iBh9I4KIxUxfrQ?=
 =?us-ascii?Q?sikPzERjefUT4+GS3zfibzM7WaR8YeeEqujqfKdh/WiaCiBXC1lh5RC3c7Hr?=
 =?us-ascii?Q?TOMRbQXSo8VM64SiwfKXPgYOs6VHsP+IeTL78iunaRI/nAM9Zk9kj/o29FQs?=
 =?us-ascii?Q?UI2RJi6l12cTvZGSswWluy/UbBsAke205wVPm/IbDv+37HKwAFGU+QAeM+3l?=
 =?us-ascii?Q?nR7jDOHoDpGR9Al9W3y1cEIMS9nu8/CHb19SpV67UG9E3HzF+7y9n+ZrlImD?=
 =?us-ascii?Q?Ax9VjJZ+/KlKJBNF7bAUOmrS4PtomYx92UYFt6bAwovSOQ8LYzKJJKNw8fUZ?=
 =?us-ascii?Q?a9odLzWUe5Pk//Z5dCAWbWpSs6z5taZ7fGtSxDJKumM+3Iy9MN7Rul0FDGhm?=
 =?us-ascii?Q?tKU/f+a32N35q3ygDu00WQFPXACF2r+FH+ivE2R8FlgqEm9Dgtyw77D+WOUZ?=
 =?us-ascii?Q?SY1U6HHdIGTnk0aZBB0zXj4JrHazxBcIFsd+Xv/bviQUr4PmQDy3G0zrs3lE?=
 =?us-ascii?Q?oZXg9EgCnte4HS1r5wqXhqI2fOHpWxfSSeDby+6idtpFzmu9Ncv+b7JcueCL?=
 =?us-ascii?Q?H6Gn4MaCJqdALhzTDFyBmDX0K5pICBX37NH1wS6js8VEpSWIjaKLZWlj6v9Z?=
 =?us-ascii?Q?Fr1jnghxN3AEqmTPTFIw7duNmMutJ6yApKcJwttWi2llNW84+uOsrmeJq/V5?=
 =?us-ascii?Q?f4uw7hW41kcu/ynxB+cif+MHxVRoKNg4SmWNBL+VHYYNTrwmtdkihzs5SLG8?=
 =?us-ascii?Q?XEn4cz57RGgvyqRegjvrpWBOGD8NbxKp0SwfegDVpR16eI4G2nwxohsHFuqi?=
 =?us-ascii?Q?Yoa6xBxIbE4J26BwUZ4yc4sMzQGtapgveE0X7aKKu+g1xS0a3VEG+v5HqF9M?=
 =?us-ascii?Q?2Ol6cisaVz94JH2hqc9l/mIEUeOt09HVX7wfy8Qb/w1n73mWEAJd8SQCC7p7?=
 =?us-ascii?Q?MBCoWWrG3ZedPayS+JFw9OM0QvNTdZ8FncayoLqwvJpfNOENrXJ1ICr2PY68?=
 =?us-ascii?Q?3vYp9kdtux9UBWiASLpxdDVSwjzkVKLLbdE2K+RaC6+Gt41qsL9lu4KW6h20?=
 =?us-ascii?Q?e/kMzK6x2PbicbnNspxNe1qj+5YOOwiBDfNgQI6upzO1bCf5YeFgdjVE7atb?=
 =?us-ascii?Q?c6W4S8FWcENmatPIvp0wxtl920jDpzELHwSXWJVplfyMjwjgSS/AF97vZJJB?=
 =?us-ascii?Q?KoRmgvBI5fp0a1yq/cWaZTNHIfgp2EPvho9kYknOS9+8b4TvI/m+SO+t7FOR?=
 =?us-ascii?Q?7oKOcaHdXDu6bodeWM+04e2F8c8lPTTVDPM8kREM4zJzUWgOHTh2wAggS+0w?=
 =?us-ascii?Q?fumXlrz+IFCMdBpXsiZIWw+LMNmUhwpAYgp3K30Ld4tSbrQsmMRupjA8+IEV?=
 =?us-ascii?Q?LwgoSJRfN1LJ6osAvB1cpqgpoe6r5BnKNCRKlJ4NfsNPisxyqeyVPRgeGn5O?=
 =?us-ascii?Q?PS0wRp1e18AHqbljD+itIimUAE/jDBKV0rpp+qqbkMdv9r7KluM9mU6tsjld?=
 =?us-ascii?Q?7tRn6JfyJZN1u8ldsETSkHVnDd4G6gZ4+NlIzUxLemhD6lMzc0B2l9Vi7Q4G?=
 =?us-ascii?Q?eYETdBNeldJDvyYVhq8rxCC1YBoo5FWY/F+uIuhmd3uuY3vznfKPUaae6qiZ?=
 =?us-ascii?Q?40KEtKbW1sxS4zUw6wW/3To=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 564668fb-f183-4439-1dd6-08dd31be5470
X-MS-Exchange-CrossTenant-AuthSource: MW4PR01MB6228.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 21:32:48.8106
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FuUxM0Pb41tX+Fy+u1TiJPxhrf7EPRmwa9QImUiGdQ7WdDPmvqp54PSI/ZBGUU8Dqyvq11lplVikeWXVnN5XDAlI1Ne71kCAPzwSo5jflSwJJd7uQ+OtDu84Olr0AgbN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR01MB6259
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_133255_221733_3E3BE1A2 
X-CRM114-Status: GOOD (  16.43  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


Hi Suzuko,

On Fri, 10 Jan 2025, Suzuki K Poulose wrote:
> On 09/01/2025 21:53, Ilkka Koskinen wrote:
>> Trying to record a trace on kernel with 64k pages resulted in -ENOMEM.
>> This happens due to a bug in calculating the number of table pages, which
>> returns zero. Fix the issue by rounding up.
>> 
>> $ perf record --kcore -e cs_etm/@tmc_etr55,cycacc,branch_broadcast/k 
>> --per-thread taskset --cpu-list 1 dd if=/dev/zero of=/dev/null
>> failed to mmap with 12 (Cannot allocate memory)
>> 
>
> Needs a Fixes tag.
>
> Fixes : 8ed536b1e283 ("coresight: catu: Add support for scatter gather 
> tables")

That's a good point

>
>> Signed-off-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>
>> ---
>>   drivers/hwtracing/coresight/coresight-catu.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/drivers/hwtracing/coresight/coresight-catu.c 
>> b/drivers/hwtracing/coresight/coresight-catu.c
>> index 275cc0d9f505..3378bb77e6b4 100644
>> --- a/drivers/hwtracing/coresight/coresight-catu.c
>> +++ b/drivers/hwtracing/coresight/coresight-catu.c
>> @@ -269,7 +269,7 @@ catu_init_sg_table(struct device *catu_dev, int node,
>>   	 * Each table can address upto 1MB and we can have
>>   	 * CATU_PAGES_PER_SYSPAGE tables in a system page.
>>   	 */
>> -	nr_tpages = DIV_ROUND_UP(size, SZ_1M) / CATU_PAGES_PER_SYSPAGE;
>> +	nr_tpages = DIV_ROUND_UP(size, CATU_PAGES_PER_SYSPAGE * SZ_1M);
>>   	catu_table = tmc_alloc_sg_table(catu_dev, node, nr_tpages,
>>   					size >> PAGE_SHIFT, pages);
>>   	if (IS_ERR(catu_table))
>
> Looks good to me, I will queue this later for v6.15.
>
> Suzuki

Sounds great. Just to confirm, are you ok to add the fixes line or would 
you prefer me to submit v2 with it?

Cheers, Ilkka

