Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D200DCCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 10:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m83MUlSweMZO5FNuYDQe1ZZZC2JFD9znStVw+rpq3yw=; b=T2QfHeVgFe0aTCUaJUJwmRu9dn
	IkTnAGp7SbcehvMdW5c4PXy2EJXJo68s5gcuLSyK1rJ9jGQ3sXYbdmcG+j77Nnwrtx1+zosTKnQ2T
	VwwYUi0OyXVJy7+Uqm2tz09TvJrm792JUxhNAJfF6q02jTMuU/6VfyB3EgJijsQOWXyqAhL7yWRi/
	hW61vjxSNZzJ2b3s2wxnbEF/qi7yFdDlNZzEWcyOVCf6fM5d8VXb/n+v4XKB9TK0/nMf07aIGOwbd
	uZB1TBK6A0qZGQjblP1SqTYxZGaQEKHrCpVGyAW2WHV3wD/f184rO+Dl5ouxk9CU77l8OsXzDn0iC
	qM38G3MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDKiW-0000000DgFj-1NKS;
	Mon, 27 Oct 2025 10:44:48 +0000
Received: from mail-northeuropeazon11010021.outbound.protection.outlook.com ([52.101.84.21] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDKiR-0000000DgEU-0hmx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 10:44:46 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=L3Bdl65VNHG40F+C3FD13IvT1CvrEd6XowDfWKxTE6fS/UcDv8oRtNqcErC0YqET0HhZmmqKgs9IPNtfPVlH6OtgOHFMO2qrGVoOq6UQcXYdpM6s+1KziOvWg2ANocuM24JLzE+ZyRtPB8+eCMnY5Bmv2riruu+BsOk+31rSSqJhIcUE6Qa7q2sV/g3xghowQx5S1CKcXtZ2E1WH63wgFIs3TvMF0WR7YkF6hg5aBg4P4nAHCD854HWd+e0M1+irzuqP0H4n0Dqi975eJqnrbSUO1UWEDcxvBHBG3PihLL2kQPJdRmXKbKRrmRZyXfKMCjK+Fl18JiAHz0t+7x3YQQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m83MUlSweMZO5FNuYDQe1ZZZC2JFD9znStVw+rpq3yw=;
 b=Mc0ClCfgaadogRlkbJZf3hy09HWktJz6SylcXmLTBFiZHjpdv5QFSwYMFLg5kWLW7Bi7n+S+nvqxbJ6qCU7LF9LApaGggUgq19Kb4xnVibRbxgrOyRMf7RiGFPZuVRmksN0vxhB1EA99s7AtHTH/irvxDbvmmRGRVcPM7ID4+frmI3jje3UJSSNgsoAdzQ557ha776PTiAUJrbdazrQ7WWfEjY3ib2Q6iSO8mSmptih+ODIkYSc7cYkfnSmUS9ZVTY8waZX6WpFI4aLcYQJCh9iTqHib6/T99lOSKMt+Di+YpsQYQciX2DQMOgcRWD3FAR9zenU6twNedT5B3hIg8Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m83MUlSweMZO5FNuYDQe1ZZZC2JFD9znStVw+rpq3yw=;
 b=IZCR+kK4V1N/ZbM4oSvoIQzGRYvds5JZTwWqidzzevXrEC9dui/HrER7JwqBvBdU/Shumgt5sShL1Kj1HD+26emyi/dHqfE00YNM/s5jhK9tIa71Xiq4y7ZvLD5scClu8bYeFSWu1polWTYB9oqTSt+xWMAR9eJJeYcwbEEIG6o=
Received: from DUZP191CA0047.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f8::14)
 by AS4PR08MB7501.eurprd08.prod.outlook.com (2603:10a6:20b:4e5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 10:44:35 +0000
Received: from DB5PEPF00014B8C.eurprd02.prod.outlook.com
 (2603:10a6:10:4f8:cafe::57) by DUZP191CA0047.outlook.office365.com
 (2603:10a6:10:4f8::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.19 via Frontend Transport; Mon,
 27 Oct 2025 10:44:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B8C.mail.protection.outlook.com (10.167.8.200) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.10
 via Frontend Transport; Mon, 27 Oct 2025 10:44:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TG7X69i7zW1QpD85dhtMRyvXW9SMBAHzCf/5L41cguBQYw5EIzYABLgX+BHBBu4SZO+KXDmc9jOZn1BP4UG9HQ1gPUXqssNuJXZ4qac4tZVdgIpaJ9Nrz5Fk0bkS2cuuHzCiCjQHcN+7nFJfNV3TMMg2GCCats/2wu6Yzd8girLd7OxlOY2w+ntYoTT9ZcI5bUDwLZAtEfi3J6uqIZb+fiQm26X0XXxdGeyAVRnYdh81UE1rlTYnVIPE6Xnup2CBiniFyasl3H2heGUwU7NlIxUm33qYemk2K1Zjjw0PU6XXkXq3bSIsc5m5WYlqk4ADpWdPR46Yg5OM56dpvHwN7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m83MUlSweMZO5FNuYDQe1ZZZC2JFD9znStVw+rpq3yw=;
 b=dweazPtNCKnARLtufB0mnf46u10Bmk4JpbmOnYFNrO8tKhxhzVCZlXR6QwgzV/ikBcoUnb5pvRUVLvp90s2+Cy6jcRfj3LeY0AYFeNJiFjgUsli4uG8RHLfWg7EupEcaEAX+br1qAgFht1p3z2e5tqvhf4+D3SiY7kF2VMy6y+I4Mwqoe3/zC/JaFFAZruTOytZrxgqcCANlaefz4z9BOrvTcUeF3drG2Fu1K/Y/6caymzdRfPiJfpvuVMXVYadt53xO6dseAWy31SKOjVJ3s1e/fV5nWf+pDXBTvVa0PjuVAv2lYZ2YLJTpGdFgIMh9y1cG/3e8GGwCjZeF777yKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m83MUlSweMZO5FNuYDQe1ZZZC2JFD9znStVw+rpq3yw=;
 b=IZCR+kK4V1N/ZbM4oSvoIQzGRYvds5JZTwWqidzzevXrEC9dui/HrER7JwqBvBdU/Shumgt5sShL1Kj1HD+26emyi/dHqfE00YNM/s5jhK9tIa71Xiq4y7ZvLD5scClu8bYeFSWu1polWTYB9oqTSt+xWMAR9eJJeYcwbEEIG6o=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by DU0PR08MB8731.eurprd08.prod.outlook.com
 (2603:10a6:10:401::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 10:44:00 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%3]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 10:44:00 +0000
Date: Mon, 27 Oct 2025 10:43:57 +0000
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>,
	Yuanfang Zhang <quic_yuanfang@quicinc.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 05/11] coresight: etm4x: Ensure context
 synchronization is not ignored
Message-ID: <aP9M7W9ufz0NGt80@e129823.arm.com>
References: <20251024-arm_coresight_power_management_fix-v4-0-690e69ae6977@arm.com>
 <20251024-arm_coresight_power_management_fix-v4-5-690e69ae6977@arm.com>
 <503e673c-441b-46dc-89d0-fb54ac81ec60@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <503e673c-441b-46dc-89d0-fb54ac81ec60@arm.com>
X-ClientProxiedBy: LO2P123CA0077.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::10) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: GV1PR08MB10521:EE_|DU0PR08MB8731:EE_|DB5PEPF00014B8C:EE_|AS4PR08MB7501:EE_
X-MS-Office365-Filtering-Correlation-Id: 532a9c0a-5ed2-442e-11c2-08de1545d1f3
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?TVA4UWVtcy9va0lRS2ZDbGFwSHUvS2ZIME9kZXI0QkdlUk9SUlFRR1lmQUlj?=
 =?utf-8?B?SXRsSk0vSnZsdHo5MmQwN01kL2pIQTcvU2N6SmpmcUF6OGNIZlZMUTFlSEN0?=
 =?utf-8?B?NTZnWkk1clVJa3NvT0NEQjhzUUo4VEd4Qk01R0U1TFVsK1I3b2JaNHc4Nk9m?=
 =?utf-8?B?UkRMcHJIUVN0SjFMZThDeXY0UWwvcERQTEZTOFRpR1Zyd1NvVUFoZ3MySWNz?=
 =?utf-8?B?YzRyaXBIVDBuSk1NSjRkVGlDU1BURFhpb3RsUmpqaTN6NkRKRnlVVm83UEpM?=
 =?utf-8?B?L3pkYng1R2d3NHBNNzZRamh1LzBHNlhVNE41c1luZ2FCVkE2UWxraFVMMHRw?=
 =?utf-8?B?dXBJa2JmQ2NUVXZDcWVPV2VoZmVPeXRBblExYWNyMHNRVU9xL0V6WTc5dEli?=
 =?utf-8?B?Q0pUOTA1dzBzL2ZqZ2ozRi8yWmdPNnZqMDZibFpJWTB2KytEWktIRjJCU0RJ?=
 =?utf-8?B?Wm1mTm9xUzBrYUxUSGduZ0FlQUtJYy9WM3ErWlYrNi9xQjZKQ0ZjN3ROZjZB?=
 =?utf-8?B?R2doc0VabDRLUWdKSm0zTGVLaDhmRyt0QVdOeGFUeWRpdE1IL0pJYTc5R2wx?=
 =?utf-8?B?alplWGZqaEtNb25yRW5tRU1VWERnbTBMdEVhalpoWU9ZcStmYzFqcUprTmp2?=
 =?utf-8?B?NDFFSS90cWZGeHM3RG9lV0Y0ZGh3YnVXOXh5Q09CR1pKQmp6Zk9xVkY1a1F0?=
 =?utf-8?B?ZGdJQzlIZ0RJUUNJbHkxK04xTHRtRzRJSVVBS2tRcEV0cnJmK0liWnliQ2Ro?=
 =?utf-8?B?dkV5UGo2RnZwSzhwZWxIZ1JCSWQrV2x5L1ZOL2t6U1lqclU3eDhWMGhIYUh4?=
 =?utf-8?B?cXRxNEg1cHF5aURhelZFQ3BJUVJ5dHRyR2x3a3JKOElSNkV0Q1E0QUR3RFpB?=
 =?utf-8?B?Q3hMbzRwc1JRYnpuTUhyYWRraldPeVVEQUFvOW1XREY2aUJ3SE9pZHZYUFZp?=
 =?utf-8?B?cEdraFE5dk1jZ3lPM1hyVGd6YnFZN3p2dFFUY1gvVEVVazlxY2NQL0NqUURR?=
 =?utf-8?B?ZkJFb1kxcmhWMytoSEY2NDhYdW1aaWRZd0dFcE9rVmRRbVNHOHVIcWt4VHIr?=
 =?utf-8?B?cWg2WmcwUDdLR0c4QlNoTmRhVUFKOUR1a3hPeTIrQjc5SHQzb3p6NzlsWVNt?=
 =?utf-8?B?SVp3aGltd21YcXdKcHNKa2pjTXhPdk56TXVHcUVUQ3Z5NWlxZmdsUW9tMWZG?=
 =?utf-8?B?WDZ6SVVrWkJIOWsvanRvZ2ZFYk5UZVB5cnp5RmtlODhqNHV4OTZ2QkNwWjNs?=
 =?utf-8?B?WTIzM1BwN0dRS2FIbFR3VWlOL3c1U2RZMlRNWXYrbDVtUEdveGdkOWFKWlM3?=
 =?utf-8?B?WU5ieHNKQ3NKNHNtcnAweXpRVUwzNXRYRUhqS3RNa0RXZSs1ZmVaVWlvQjFa?=
 =?utf-8?B?a2wrSk5nMXBKRVdyT1lQdXdOR1ZEbkVReGZnNEhNMVpMdXJLeWIzYkRjb2Vn?=
 =?utf-8?B?ZXN0L0pIMXR5ZHJZejZvaU1oenltUWw3U1hmY3RjRmJ5NVdSTXZueldFSVVw?=
 =?utf-8?B?RVVDUGRnRU9aSlBOOUFUNGlFZUN2T0FJVVpBT2JSd2hnTDRTY3NkUWRJdnJw?=
 =?utf-8?B?YkN2cDluL2JmZklQWHcvZVdXbUtTQmlRS2RQQzhkL1EwcmlWNGg0d0R3NzM3?=
 =?utf-8?B?eWpTdTVHQ1F6MUVlN3pJTldRM3d1ZUdTKzJKRGptY3lXWTY2c21IcEpEME9x?=
 =?utf-8?B?WUNURUUwaUhSakd6Y1pOVlFlMHVXZUg1bGpyblMzbjhtalFLWDhXV1FKV0NP?=
 =?utf-8?B?ZG5kK3ZRY2FKdTNERTBreHpIMmdqdDVoVWdyeU9KYW5iZE9yU0lGU3laQmlw?=
 =?utf-8?B?dksxVnl4MnJkeTY2MDZxZldKMVdYSGlXVGZ1WHhTU1ZoYk5IZ1p1akxvT1FG?=
 =?utf-8?B?WnRzc1pHYkFNejczUkV0OUNnNG9yM1kvRk5EK0dLWktWWmd0SUMzdnVLQjF0?=
 =?utf-8?Q?WNPiZhdvby168G5SeO81GuVa2ye/+Hd4?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8731
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5PEPF00014B8C.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 30e5793f-3ec6-4aa8-c049-08de1545bcee
X-Microsoft-Antispam: BCL:0;ARA:13230040|14060799003|376014|82310400026|1800799024|36860700013|35042699022;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YnpYRGtoRDhXNWFwakNEZDd6YThlVWVxblpmNXJPY2d1TGFKbmNOWHp2bjly?=
 =?utf-8?B?TEJJVmlmQnZZL3dGMmpEd1Q0U1RvKy9FSVVPMTNGd1F1VW1JK0tmY1pXOGJL?=
 =?utf-8?B?MG11dVZvSHIyMU9EMXFaL3dkYzhMTDk2VmVPVVIzZ25XcEl2VkdYbDhyWndo?=
 =?utf-8?B?WGh4aUtKZ25LcnZIQ1ExZStmQzNHM1M0MjlzQitkWUpoemVzaDBla29GUnA2?=
 =?utf-8?B?RC9OeTh0aU5wMmlIejg5V0hUQmZZYnZSR2JyRmxNcXlQeW9nTUhVbEtyc09u?=
 =?utf-8?B?V3NuL2FDa1A5S1EwVnBaTCtCSkNTM3llOUVsdnh4ZzZmRUp5WGZISXdudXpJ?=
 =?utf-8?B?OEFONEtDd1ZTOW5xNHJXdGk4RktiQVJNSGd5alRMU1F4ampiRksvZDMvMm9N?=
 =?utf-8?B?R2IvTzhoUWhkSm9yZm0zaW4waFg2UTZWaDlaam4wOU52ZnJDQUhWSXEwaVNm?=
 =?utf-8?B?VHRRZUI2amtxU211M0tTRStWTnp3WEtEQlBHdmRFcEEvZnI0ZFlSVCtyYVA1?=
 =?utf-8?B?dUVKVHNzL0g3RmJNNXNla0FVRVFFTUlOU1d1RkptYnN1MjZYRXJxM2E3S2N5?=
 =?utf-8?B?R3F2dkxlNlZ2NVc3YnBzbFdMa2lwbkpKS0JFQjBaZmpURkZhYXd1UzV2aEl2?=
 =?utf-8?B?d1AvaDI3MG42V29ROWxxZGpZaWpuamp3MWZBYkZSaW5VdzhPUVRHTWVtS1Jt?=
 =?utf-8?B?TFgxQnY3Z2RmRHFMcmNhWktYSExwaUFEdTBQeFNyY1IzV1hWMFR4WWczelZV?=
 =?utf-8?B?emZpaHhDZ1RXd24zblkzM0ZpcUpzeW1jSW5Xbm5EcFlIZjlLQ1lEU3JDWnEy?=
 =?utf-8?B?Ym90NEpmV2lJenJUWEVZSkM1c0p2SUp0Rll0OHN6VFNkc0c4V3R2ZXl5cytP?=
 =?utf-8?B?bTBvYkxlVC9qand6S3E5enJCK2l1RFVTa3psdFA5ZlVVaGJzZUhqVWZZTEpT?=
 =?utf-8?B?cThaUi9kc29mV3pOaFRRWXNDODdxK0lhMnRzNHNDclBvbTV6eEhQK1Q0Rk1F?=
 =?utf-8?B?MmlTTWwzY3J4WFZJd0FsK1JJWTBiUEZXMU4zKy9Bemo1Rzl5c0VyaHBnQzFw?=
 =?utf-8?B?QVlDQUpHaThkREhrZTNoby8razFLUkUrbTJqdEZIbGxwRS84eDIyY0JVNlQ0?=
 =?utf-8?B?NTdDTVY4UmdISUVreGloNWdwVmNjVTg1QkNMNDdFYVBjd2pUU1V3MWIwQjhT?=
 =?utf-8?B?cjBNUVdJWXU3ZzNTWGhTYnRyQWZlYTRHaUczMGRyOUNnTVg3dnJGRENIblc5?=
 =?utf-8?B?TTE2N2E5YkhGZjZ4L3Rqa2pHMUxkR1dmeUE5NUo5K3pwdG5obko3ZHZzbGN6?=
 =?utf-8?B?ZXpqeFNQcm1zTnhYSVh4UjNiR1AvWHZydDU4TEp3N2lHbjdIZ0tMNWFSZGY2?=
 =?utf-8?B?MkFFdU1FNU5pVjA1dnNuWmJaN0JJZVNRWnRFcmZWOFVnaGNlbUcvd0hvaklz?=
 =?utf-8?B?YVR3YlhPTVBta1V1KzlLSUpvTU8rcnFTcWFuYnVqOWxDdnkwSlptY0xHeXFs?=
 =?utf-8?B?K1ZmWHZQNlpPQlFqbnpFVjRNUFd0Y1dWbTEvMEFTcXNXR2JPUUo3R1lFK2Vw?=
 =?utf-8?B?WkcvQ3JUMDJaYll3SVQ5SFk0ZXRiZTFvbnNmMkFzUEhzOGE1bVl0MjZidW1C?=
 =?utf-8?B?cEdLZXppbmRIbFFUQlBJeTEzQTN5TEhZNm84MGNTem5xbTBLeTFoK2NGY2ZZ?=
 =?utf-8?B?MUdTZjlPdzM2aUhDYlNPOTRZTlBEVkZVUmI4b092QkZWYWlaMzJYeTBsU0s5?=
 =?utf-8?B?WjczalFWR29OaSt6enhxMW5RbnFEZEVKSHh4bENocGRBWE11QlROWGRvMlZY?=
 =?utf-8?B?aTlEeWw5QUhYaUE3bXdDamY2WldkVEZJUHRqK2dzaHlXS1pZMk1yc0tTUFNx?=
 =?utf-8?B?c1dLUVZkckJpM1g1T1hzVEs1ZTFUUE12UTkybGFkd0tPVEZwS29EdEFHRXJh?=
 =?utf-8?B?cjFlNGN1Tk9MVFY3RlYvRmhqekhRZ0NWUUtpOVNLSUErL1dYQXNJVHM4bEZV?=
 =?utf-8?B?OGw5S2R6dHEveTZnTUZkZll0eEhHemRpcTQrSzB4S1Y0bzczbWhpaE14YmxS?=
 =?utf-8?B?RHN3SjRaRWU3eWd4K3pLb2ZVdEc2MWhjclNId21IRWVndFpjUXBGcm1aMkti?=
 =?utf-8?Q?emTU=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(376014)(82310400026)(1800799024)(36860700013)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 10:44:35.1469
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 532a9c0a-5ed2-442e-11c2-08de1545d1f3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B8C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7501
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_034443_704384_123E3805 
X-CRM114-Status: GOOD (  11.84  )
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

Hi Suzuki,
> On 24/10/2025 17:45, Leo Yan wrote:
> > As recommended in section 4.3.7 "Synchronization of register updates" of
> > ARM IHI0064H.b, a self-hosted trace analyzer should always executes an
> > ISB instruction after programming the trace unit registers.
> >
> > An ISB works as a context synchronization event; a DSB is not required.
> > Removes the redundant barrier in the enabling flow.
>
> It is required for MMIO based instances and must be retained.

I think it seems fine. since the the etm4x device mmio is mapped as
Device-nGnRE and according to the section Leo mention:

  Synchronization when using the memory-mapped interface
  ..
  When disabling or enabling the trace unit, the trace analyzer must poll TRCSTATR to check the trace unit is either
  idle or not idle, as described in Use of the trace unit main enable bit on page 4-169:
    • When the memory is marked as Device-nGnRE or stronger.
      — Write to enable or disable the trace unit.
      — Poll TRCSTATR to ensure the previous write has completed.
      — Execute an ISB operation.

Therefore, we can omit the dsb in here.

[...]

Thanks.

--
Sincerely,
Yeoreum Yun

