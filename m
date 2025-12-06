Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D69BD3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Dec 2025 00:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=etomm4gjmujI2X2y35Pl0dCdVNVPJb0OrN4s5rp6Uhs=; b=lSSYL9l05S6OQwYzMPWRLPJdUU
	eQ/WjM0lm4FWMI9fmVH1MbXs6Er/sX8fnZxx6JRlJnZ4BTnfA9gkDWd7ANJ7isFV7p0cTxOjoi5gn
	jeidZWD1dEVeZQgee3/tDLZ48LiLYkXnTRAK1ADKAfqeEYJCXYPHG5GXBkukrAH5pW6j6AckalDxR
	ppMtLz7xymtdZWQ0O01/ZeIt+Z6NgphPtv5lmk5/IxI0RuZ6V6wVlIPMffaCsmzinVdyPslo6aif7
	voAZDIdVXqawEmhIKw7LtF+S8Oj30aXZAUIeHNl60g1n9L4VGYo+TwLQifmw3NHlD5J6P2ufQOMdE
	ZUe4Ctrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRfqQ-0000000ADev-2gpn;
	Sat, 06 Dec 2025 00:08:14 +0000
Received: from mail-southcentralusazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c10d::3] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRfqN-0000000ADe2-3xLY
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Dec 2025 00:08:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FRU5MOcJZEHgwFg9/t6cucsYw/Gryoaw40kDKfDRQRagye7INmisJVF0nrLUp4XR/6ZyZkCWyShERuOaN0zpMOOxoVJdks8I8yyxhJeXmVwOP8JyZyPRICgtLgWU1M/E1VXI4Gl+zggB5WBuXkdV5NxqOP9E5c6VPQh25ZZvJuPwFVsTIFTvvxVCf6agcHWFyrIgA9WQDJa7Mp7HG6o7P021VkhH/2vXJytwPitTCWbcmVVR8gU1o+dYnXOfKXWx0uXPehvsHtKyiR1I7Is+BKIcE3B7/G2lIqmqMf5IpysQNlDilTxXcQXePxkDiQ+kA/NEMTgHAIt5v6N5Fiio8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=etomm4gjmujI2X2y35Pl0dCdVNVPJb0OrN4s5rp6Uhs=;
 b=y6jEa0x46SxsBAiskH546D4MVnGZ8I+IJXVZAC7UIYbEqzZncOJB1e6spkHg4mh4H5qEKVdvIadL2YYJrQ+YIliUNzO3TdG0AIWSQWactHYh1CN30Y6ZMYoYnl6jzcWCGIkNeWDYyY5t2iEFrq2oSM/xzYnUCHK42N+3cHi4EGksIPephTpoTLManGbkAxflUVCBLXu61fioFBrXJGR/21dZk2s5l92qK8rl1lt891Y5jTpo/itYnGZ7tau8uThqfMGSjRYcP3T57Hm1iX55nxNkz+s53AI82vDJvmFU5UhIodSPyBv8jMeDUppUjLZ+Fqc2LsloRif1T77tynxLrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=etomm4gjmujI2X2y35Pl0dCdVNVPJb0OrN4s5rp6Uhs=;
 b=iul2ywH3Db+AH2fbxNYL5ZIPnUobNo9EDZsaWysxl+sXfb+dAYrjj9yzyCFAb98WyG4NVMeOOGqrEf4z+81/MAu+B2g8RAksAnh4ltP0TNFerj3AAfTNnOn18FmU7Nqdp/3QUqyn87iPCeGAPamE5t4xSGGcF9sGDf8dRm0FeJiHx7JS7XGpLcp/tzV6aY2t8c5Ay8ZjK1CXnxioWXDiBn9B/K53PEnwARITJrCbkztLC+zU1kPJKfjlOBzPAcMYnv8v7mTdmmKVdutEUBLJhvjv8FZNK1FJfSQ3hCSp31vPfB2TXUNJD3R8k4+DHAlrhiHFwxzvb24X/abqR5RFGA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB2667.namprd12.prod.outlook.com (2603:10b6:5:42::28) by
 CH3PR12MB8185.namprd12.prod.outlook.com (2603:10b6:610:123::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Sat, 6 Dec
 2025 00:07:01 +0000
Received: from DM6PR12MB2667.namprd12.prod.outlook.com
 ([fe80::bd88:b883:813d:54a2]) by DM6PR12MB2667.namprd12.prod.outlook.com
 ([fe80::bd88:b883:813d:54a2%6]) with mapi id 15.20.9388.003; Sat, 6 Dec 2025
 00:07:01 +0000
Message-ID: <1cc804d5-9d14-4d71-9da1-a660a2569e4e@nvidia.com>
Date: Fri, 5 Dec 2025 16:06:58 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 31/38] arm_mpam: resctrl: Update the rmid reallocation
 limit
To: James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@kernel.org>, Dave Martin <dave.martin@arm.com>,
 Koba Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 baisheng.gao@unisoc.com, Jonathan Cameron <jonathan.cameron@huawei.com>,
 Gavin Shan <gshan@redhat.com>, Ben Horgan <ben.horgan@arm.com>,
 rohit.mathew@arm.com, reinette.chatre@intel.com,
 Punit Agrawal <punit.agrawal@oss.qualcomm.com>
References: <20251205215901.17772-1-james.morse@arm.com>
 <20251205215901.17772-32-james.morse@arm.com>
Content-Language: en-US
From: Fenghua Yu <fenghuay@nvidia.com>
In-Reply-To: <20251205215901.17772-32-james.morse@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR06CA0040.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::17) To DM6PR12MB2667.namprd12.prod.outlook.com
 (2603:10b6:5:42::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB2667:EE_|CH3PR12MB8185:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d176dda-0433-4ccf-0dbe-08de345b6102
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WE03RmtmM3ZBa3o3MkVVOUxHWWpaR0RnU1J0VWkrZ0l3VE9GcHNhaTRyMkpC?=
 =?utf-8?B?UlpZSzBZZi9ucm03UjYwWFhBVWhWK3dEMHZaNlFSYlZUbytIVWYwcXZNNmEz?=
 =?utf-8?B?QzBTZWp0N29LWUlQQ0gwWkk1Zk82S0tEOGNmM1JWa2JwMDgvb1djMU0vcGJH?=
 =?utf-8?B?SzlPSWVOUzlTRUR6Mk9aTWRzYXVEQXZzUVBLeVU1VkEyZy9rWGZCaHhMNCs0?=
 =?utf-8?B?UlR2U010YTBLNUJGeU9CeFJHZEhTcWFiZFFIU1NtZUVuSTJVbndLZncyZ2tP?=
 =?utf-8?B?VW43eFBmSzhVZjJrdXUyaHIzSmNueHJSeFEvdDcrakRwSDNlV0tSQ2dFUFlY?=
 =?utf-8?B?OGJPbEtmeGM5WTVOMnhDOXlHam1tNFV2YXpxT1lmTVhnNmpxc3hFLzJkeWdX?=
 =?utf-8?B?V2ZMMHIxNi9RUmQ1aG94M2gzekFBWTl3ZkN3dEk3aUtncE4vZ0lYZHBZTkJr?=
 =?utf-8?B?TXFUV0pQc0d2aVFFT2grcG9rYUtiNUhXZ3d1RWZyZjFYYnVwTG1vbGVXV0pl?=
 =?utf-8?B?SnV3c1ZIVW1DZEdUalBqSXhNdEhLY0hwN2RMQVl0WGxnN2lBTnBpVWxUbDM3?=
 =?utf-8?B?UDBDa0tkRzh3aGt3Q2tEcy9odU5rdDUzaTBuUDM3YnNiN2JLbjh4Qm1LSXhU?=
 =?utf-8?B?UXpDejBZT0pGbUFLSGhsV000ajdCNmdwdHpBODdidjNWa1FIbyttanpPK09X?=
 =?utf-8?B?MGVGWGZYSXBiS0hTQlB1REtVcXV6WlBnRnBHbDBPZWdTdEl0QitXZ3R5N1ZZ?=
 =?utf-8?B?b2pDS3U5VlBwY0Q2Mjl1UmdtdjNlYTZlaW5STU8vM0t3NERZY2VzUW51UWdZ?=
 =?utf-8?B?WS9LRWlJeHNxL0RZVDAxRFZVbm5iUzBVQ2RaVzEwazJRSjFrVllrNk9ZaWg1?=
 =?utf-8?B?RzI5cFBNa1JvTW9IRzFoaUJDNCtMa2diMUM0bUpCZWRjZ21PVDdud1VKM2JL?=
 =?utf-8?B?bWxWV2wwRVZBV2ZBK1NGVEhmY2RpaTJXYmVXNGZvbHVnbHowUitxaGxjdzNQ?=
 =?utf-8?B?U3ppbTA2STYrOXdTT2dWd0d6SEZHSVlJUjJubVZNb3djSUhrVGErNk5oTzdP?=
 =?utf-8?B?emR3RFlsYUQ4UWtkZXlNdS9ENFIvY0JiZ0thS0ZyaUtwQlkwOFFNVG5qVyt1?=
 =?utf-8?B?NGZVWFBqTFB0NDBzWGh5SmtHMFY5MkRvenZuTlhrczF0dmhsU29Fem5GMHRt?=
 =?utf-8?B?c1cvcW1HWHVDTjlIU0t3MldZM0s0MnJnY0p6UjZiUzBmOVFlTVdudXo4WUhW?=
 =?utf-8?B?bGtUZEZRM2U1MHk3Y1lWemcwNC83dmdma1d0SU5OdHFhKzIzRlZBUmU4cjAw?=
 =?utf-8?B?UUxkSGUyNmQvbWJIZUdiZ0JYamFYdE5FeGdqNVFWQUlXdWQyQW91WGlOdnUy?=
 =?utf-8?B?ZkVsL2hFaTJ5dDhPQXZYdEZjSjhzR0JwNUlPRlp5RVB2TURhenN6d0ZNR3N6?=
 =?utf-8?B?SnF1b2h5UXpPamFyRVBKNHNxUzA2MkVmSkFJY0lhcWh6NmxMejVSTG90RHVv?=
 =?utf-8?B?NnU5QWhrSEhFTVN5TTN2SzdPVDVJNjl0Sm43UzZmcVkwaGlPOUoxUHdwaUVS?=
 =?utf-8?B?bXlVMXNGdEhnWFVBaEJCZzRNZWdKOGZDYTh3WFRPa2M3OCtoeUhERS9XQlJy?=
 =?utf-8?B?ZXpZSEVLQVVFVzVBcjVoc0tsT09wOWdiYkVmY1ZhM2xIWCtXdU4wOFJJb2hl?=
 =?utf-8?B?M3RHbCtQdy83Y3RTczdnRGtWVWRzYlc1ODVQLzZ5ZFJDM3dmVnlvRW1HV0pr?=
 =?utf-8?B?S0szSm5JdGZORnNsR0JrM1NndGVhSHk5MStidW03aFBlbWd4emR6Q2NoWXV4?=
 =?utf-8?B?a2d2aGJCV1ZURmZzSlpRMXNCNm55cDM2U3NGNXJPVGNuSmlyaHo2YW5rY1dp?=
 =?utf-8?B?Q3ZtVlFYYjlWVG1mMHJCQUM4aCtmblhHdFZ1NFdiU3RqRDY0ZW0rOVlxWDFF?=
 =?utf-8?Q?u+Dn46X5zKipHlNH7w7N/rBvQ+rMT2UR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB2667.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YmJpR3k3OTkydm5JSFI0akIxaVVWWmY5NW9meGQxekRCNndyaDMyejFqYjVR?=
 =?utf-8?B?dFdmZmZYb1BFeVlOK0xKU0tqV0lFa01wWVgrajhrK0ozdGFOUnRUQzJYSVVM?=
 =?utf-8?B?N1RSSFNmRFBkcDB3TVY5SG1jYUh6ZGFadFFWc0Q1MzMyQkdzMXpzNnZOTFNj?=
 =?utf-8?B?WEJndzBpZCtWcFhwRWwwbm14MUR5NXdGTXJEbVBXbjFzY3dUVnZZQ2xYUVZ2?=
 =?utf-8?B?KzRwTGM2MEhGQmNUaS9IT29WQWtvYlZMMi9ZZk9JM3BrWUlzRDFaUFkrU0pi?=
 =?utf-8?B?NHVpdFlINk5pZk4xOU5jQmtCRCtqRExZK2FjaUN6NzV0ZVpoblE5S0F1a0pz?=
 =?utf-8?B?RVg2NDk0K1RUZTdORW9MUXNpbDd5ZjEvY01vSUl0Wkptc0dZUUFYZGZWc3BM?=
 =?utf-8?B?LzZ4S05XSW1TNEpIeVAyMG5QeFdNN2xlSDBJQy9sY0FJZnN4NmtXWTJFWVAz?=
 =?utf-8?B?THA2c0F4Ky80VVBjR2llTWZaY2pYc1JPSmxsZis5OURjTWV1Uk1STEhWa1BX?=
 =?utf-8?B?UFlZU1F1L0FIeXZIQjl6aWFETHVuMU1xbWN2eTJFa09Qa1h3bUVvVmFBR0sx?=
 =?utf-8?B?Q1FVQXpsQWl3a1lITDBEZHU3QzZNbi9ZcXFreHNiSklYZzdIYlZqb0w5OWpI?=
 =?utf-8?B?RlRVRkpsbWJaTlQvME5Jcm92TFhiejVHSjJpVmkydnV5Nnd0eDY1TjJ6WTNV?=
 =?utf-8?B?alBNalVIS1F2V0M2ZFZxTXZjQlZBVlNLWlhFZWk5UE0veVNqVkRRbUlrOFdN?=
 =?utf-8?B?ajJob0hKMTA2OU5xRUpJS2JWaFdOQ2FxZjZXU3RtQVZTbVIzMUxMNmQyZ2VB?=
 =?utf-8?B?VElNc2tjZHl6ZVR3YkROMXFOQU10NUt5R2VhNjRSYWxsSWQvT1VkVVRybTNU?=
 =?utf-8?B?ZnpPUXg2dW1sQmt3T2E2Zm9DZEd0ZTFkVm1ueWh0RHVTTFNjSW5vQmhsTEJR?=
 =?utf-8?B?a1JYTG93cXZqSllZV2pvSlNsNXNFR1doVTNXWXJrSUc1bEJ2S0xMY3FwQzMy?=
 =?utf-8?B?MUpXWTlRVkFjeVJBdDdOMk9CTTZtT05Ma0NHQzRjTWFnSXlDUzJJVlNuRkRN?=
 =?utf-8?B?L0VnbkZWekJUdGt6S2NJS1hqNUNvNnJVRGpQb004UkJhd2F1ZitwalJMN0E1?=
 =?utf-8?B?ek8rYTZSNlg2a3ZIR1dPL0l6Nk9TQ2hSaytSUVBmVTU3WUJROEsyeGNwNXFy?=
 =?utf-8?B?by9BWDJyZlF1V1VTbC9nVXFCN2VUbTZNVGZTam1KTVpTRTE4SFhSVFVta0ZJ?=
 =?utf-8?B?Wkl0eDdBdXRtWDlaNTg4aFZOcy91Z2ZXVHRJaTBkdExOTFZJbEdPZ0c3blNq?=
 =?utf-8?B?Wkd1bHR1aHdXeDJUb1VTVTNmb3lGRE1sTkcxTURyaGJqUGFEOHFZU1hab3N3?=
 =?utf-8?B?bDcwT05MZlJEOU5nZWFGN0tHaENPR3pGOXkvd3BPbCthWEI0emJWcUdIU0dK?=
 =?utf-8?B?aDhYUmUzNWZ4WG9oN1JkOU5QVHFPVUFzRkxNYlJPZ3NjbTd1VGRnbHowUy9q?=
 =?utf-8?B?RWVaZGlrVlJwUllPNU1KUklGM29jSWhqWHJEL0FxQmxJNC9McnJ3c2pkMTNs?=
 =?utf-8?B?ZDA4dWJiZ1U5TjhobXNaR0lmd2RkVWxDTUlNQkswK3FjVnJ2RllKSFZzK0pM?=
 =?utf-8?B?ODhMY0FZUzFjN2N1Mzh2eGxWZERoQVZUenNnM01IUWdqazBRQWE4cnhoTzl0?=
 =?utf-8?B?cDA3YlVveDZaenIzV0ltSjdic3NQMW1KWUhsd0txZWxCVUxlaDVXSitEdUdG?=
 =?utf-8?B?VExXd3JIRFlDUkpBZFdpM0FHTE01dHZWOHpYQmUxSGdDQlRMYW9xeHFMU0Zy?=
 =?utf-8?B?L3BNT1lxSzU2S01rZ3VqZ1BpR2FjeUovYVZOWEh4WWRXTFNpeERmdVNzdHU1?=
 =?utf-8?B?OXNvQUhWd25sWHBYSHFWZUZWUWFQdjJ1RXNGd3h3UDUyaklERGVTWkgrMWts?=
 =?utf-8?B?VXJHYUU0dTNwQUVGeGU2cmlLS0huNmV2UVlPNDMyQVJlRDhUYm9WYllwN0xs?=
 =?utf-8?B?N2MyTlZIbldCOXFBa29VOWoyMjdUbkNlUEFTaXlEZDlqUUZOc21RT0ZMcHFW?=
 =?utf-8?B?aFRyMC9sYlFmanowTEJ1cHhtOW11bnNIQUpjM0xESXIwMGMyc1BuYUM4ZmN1?=
 =?utf-8?Q?6ycxDlwvXcnPxVYYliueOhagi?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d176dda-0433-4ccf-0dbe-08de345b6102
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2025 00:07:00.9602
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l/ege5LG/bSBxLervGr5VWEhPjvBQbCJs3utBUtTQqGjzayUKwj1hkvhNdcWWALvHouW8yDJPqhxN1+Hh6sRdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8185
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_160812_009005_A61CCE77 
X-CRM114-Status: GOOD (  26.76  )
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

Hi, James,

On 12/5/25 13:58, James Morse wrote:
> resctrl's limbo code needs to be told when the data left in a cache is
> small enough for the partid+pmg value to be re-allocated.
> 
> x86 uses the cache size divided by the number of rmid users the cache
> may have. Do the same, but for the smallest cache, and with the
> number of partid-and-pmg users.
> 
> Querying the cache size can't happen until after cacheinfo_sysfs_init()
> has run, so mpam_resctrl_setup() must wait until then.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> ---
>   drivers/resctrl/mpam_resctrl.c | 54 ++++++++++++++++++++++++++++++++++
>   1 file changed, 54 insertions(+)
> 
> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
> index 506063bd3348..ccdf8db742c9 100644
> --- a/drivers/resctrl/mpam_resctrl.c
> +++ b/drivers/resctrl/mpam_resctrl.c
> @@ -16,6 +16,7 @@
>   #include <linux/resctrl.h>
>   #include <linux/slab.h>
>   #include <linux/types.h>
> +#include <linux/wait.h>
>   
>   #include <asm/mpam.h>
>   
> @@ -58,6 +59,13 @@ static bool cdp_enabled;
>    */
>   static bool resctrl_enabled;
>   
> +/*
> + * mpam_resctrl_pick_caches() needs to know the size of the caches. cacheinfo
> + * populates this from a device_initcall(). mpam_resctrl_setup() must wait.
> + */
> +static bool cacheinfo_ready;
> +static DECLARE_WAIT_QUEUE_HEAD(wait_cacheinfo_ready);
> +
>   /*
>    * L3 local/total may come from different classes - what is the number of MBWU
>    * 'on L3'?
> @@ -584,6 +592,38 @@ void resctrl_arch_reset_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
>   	reset_mon_cdp_safe(mon, mon_comp, USE_PRE_ALLOCATED, closid, rmid);
>   }
>   
> +/*
> + * The rmid realloc threshold should be for the smallest cache exposed to
> + * resctrl.
> + */
> +static int update_rmid_limits(struct mpam_class *class)
> +{
> +	u32 num_unique_pmg = resctrl_arch_system_num_rmid_idx();
> +	struct mpam_props *cprops = &class->props;
> +	struct cacheinfo *ci;
> +
> +	lockdep_assert_cpus_held();
> +
> +	/* Assume cache levels are the same size for all CPUs... */
> +	ci = get_cpu_cacheinfo_level(smp_processor_id(), class->level);
> +	if (!ci || ci->size == 0) {
> +		pr_debug("Could not read cache size for class %u\n",
> +			 class->level);
> +		return -EINVAL;
> +	}
> +
> +	if (!mpam_has_feature(mpam_feat_msmon_csu, cprops))
> +		return 0;
> +
> +	if (!resctrl_rmid_realloc_limit ||
> +	    ci->size < resctrl_rmid_realloc_limit) {
> +		resctrl_rmid_realloc_limit = ci->size;
> +		resctrl_rmid_realloc_threshold = ci->size / num_unique_pmg;
> +	}
> +
> +	return 0;
> +}
> +
>   static bool cache_has_usable_cpor(struct mpam_class *class)
>   {
>   	struct mpam_props *cprops = &class->props;
> @@ -1025,6 +1065,9 @@ static void mpam_resctrl_pick_counters(void)
>   			/* CSU counters only make sense on a cache. */
>   			switch (class->type) {
>   			case MPAM_CLASS_CACHE:
> +				if (update_rmid_limits(class))
> +					continue;
> +
>   				counter_update_class(QOS_L3_OCCUP_EVENT_ID, class);
>   				return;
>   			default:
> @@ -1731,6 +1774,8 @@ int mpam_resctrl_setup(void)
>   	struct mpam_resctrl_res *res;
>   	struct mpam_resctrl_mon *mon;
>   
> +	wait_event(wait_cacheinfo_ready, cacheinfo_ready);

This may cause system hang for any hw/fw issue that causes cacheinfo 
failure. Instead of hang, is it better to have a timeout wait here? Like
	errowait_event_timeout(wait_cache_info_read, cacheinfo_ready, 5 * HZ);
and report failure when cacheinfo is not ready.

Thanks.

-Fenghua

