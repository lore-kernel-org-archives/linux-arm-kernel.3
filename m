Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FA6EC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 10:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AklerkohkR0+itr5AkvJP0qTU7Y7xB3yY6iA75i9xiM=; b=1QT1OJAbzOUvAhvbyjB95+qLU8
	EJHelb1dRr7rr6znnWdOOZy6VYMhTZy0yAnjtqDUmIV2uyOs4UQX9oQb7feJlzobFbP9a/ieGzH4U
	EC3rGhY4uHXAGBlb5Dxc8aN2eU8DRGl5U33CYzTkWLUL7Qv9KVZurIW8jKPAOtUFufW45Zn/R7Qgl
	AbVbH/ELlD30SjTznMDBdVHD6D3NaJQiLUqyDl0bF20Wigu45QqldOvjHx3um09Bf+Km5JjpjYbBL
	GXreN8UyYZPkBN/U2S3MkAa1fDC5NYG7kv2zvFeOHbLCv3Tn9LPzzRoZmM3+m4u7eGG4UJ22XD6Ok
	6Ja4/xWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKaaY-0000000FWBn-17vG;
	Thu, 29 May 2025 10:34:18 +0000
Received: from mail-dm6nam10on20709.outbound.protection.outlook.com ([2a01:111:f403:2413::709] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKaX5-0000000FVow-2yxv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 10:30:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cf3bhLfUITLCsaG56o8zCHPDSSFs717NVoHUdHI7TjgosEgk0I8Tgi5DZgVNXcgM6qbaIMjR1s1uWqZc79+5S8IZ5L2JOTjiDntom2Ew4AfYjdyxzL0y2b1ceT4rrl2QrSqfw68NXO5yDtPJfL5dm9ZqzdxnNrB21v4DJMo5H4LMdV5yKr3hZEwD7pN15vzzrP0JUhHSNVOBl4JUjzod1hBE96cVxUcE+Uye3zdN8SQP06D/6hVX141GL0l+wgWhV0xr9/jdSKBVoPJM6MbLa4Tnz/beB4u0tS9XnAd1/MT3iLLamVPk+GdAvbWm8mZpFDG5osBeXNVRxk7wV1SeJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AklerkohkR0+itr5AkvJP0qTU7Y7xB3yY6iA75i9xiM=;
 b=oYDedXdHCq6M1t9TX6BwL99+eLKcw2NINbUfkpaabWMHY6IQc5PdesO32+pGkDvxSI9aA1fBuuizA6VlOTpfs1kDs/DjIzOMURrLjHKBBeB7bGK528mV+J1yLslh+GWac4wlsSyomC7LMyXZx8buC+IDvV1dHduz2mA5VQutjaMjaII64S54YQaWUFgz66hmd0g/qFyv8jSi4o1KbO5p1elcm1HQahkTwyUw6PWzS8u5I/d/nREBPr0Lizu11tiyM7nNyWPzOkAq2tyQZmBynh46WVAZv6UxFkr2Vt5XOcr/MBbl5J7s8qYtdyUocdte5/8fyKtozbOK5CRGxYEqCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AklerkohkR0+itr5AkvJP0qTU7Y7xB3yY6iA75i9xiM=;
 b=vCplEBGSoD6MILNGVJqYg0YR3tLGjPZqkP8twdSj/dOzGXSszzoDyKzgcipkLCkfquDVAgf0eIo1lxDEZrbjxn+TtcB9oFzzG39uXGAJ366b/QHvKsISgDRWAXDkTilNqcH888iYlKZIm/Sdjc6VKUAAXGeEeTy1MnylDCevuog=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ2PR01MB8101.prod.exchangelabs.com (2603:10b6:a03:4f6::10) by
 BL1PR01MB7650.prod.exchangelabs.com (2603:10b6:208:395::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.27; Thu, 29 May 2025 10:30:16 +0000
Received: from SJ2PR01MB8101.prod.exchangelabs.com
 ([fe80::292:6d9c:eb9a:95c9]) by SJ2PR01MB8101.prod.exchangelabs.com
 ([fe80::292:6d9c:eb9a:95c9%6]) with mapi id 15.20.8722.027; Thu, 29 May 2025
 10:30:15 +0000
Message-ID: <7bf7bd52-7553-42a7-afdb-a5e95f8699b5@os.amperecomputing.com>
Date: Thu, 29 May 2025 15:59:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 0/9] KVM: Enable Nested Virt selftests
To: Eric Auger <eauger@redhat.com>, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
 suzuki.poulose@arm.com, yuzenghui@huawei.com, seanjc@google.com,
 darren@os.amperecomputing.com
References: <20250512105251.577874-1-gankulkarni@os.amperecomputing.com>
 <92c7e99c-5574-422c-92f1-62d5cde58fec@redhat.com>
Content-Language: en-US
From: Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>
In-Reply-To: <92c7e99c-5574-422c-92f1-62d5cde58fec@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0065.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::9) To SJ2PR01MB8101.prod.exchangelabs.com
 (2603:10b6:a03:4f6::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR01MB8101:EE_|BL1PR01MB7650:EE_
X-MS-Office365-Filtering-Correlation-Id: 907c9744-79b2-436e-f450-08dd9e9bcd4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cXhHeW51QlR1TnZLQnRqeUtGZkVzYXdEYjM0Qk13RlQrcUdyeXFRQURnRVZ1?=
 =?utf-8?B?RWgzYXl5TE5ITGZKcEVhSEwybDRhLzZOUFRxZjBLMWhldzZzcjlCcUl2cXZ5?=
 =?utf-8?B?NEp3VkpHcVpCMTc1Q09CWGxqdTY0b05YQyt1amEzZExoU3hocFRocE80RzdC?=
 =?utf-8?B?OFgrM1lxK3hPcGllMktuSlM0U2xYdlYxRVRTR1lnUkowQm9JeExnWHZKT01i?=
 =?utf-8?B?Y1dhbFpmcW9VVkp0bkIxWUlrRUpBYlRPbi9HNmNCRWVGKzk5eDJEa2JRTGR5?=
 =?utf-8?B?NktzY2tyYlZYc0Fzdzk1UG56Vmx3L3F4cGVZdFRiMGdUSzNzeTdQT0l1eGJz?=
 =?utf-8?B?MlZkZlFrTWJzTHRjMitoU2V3RU5KVFhKWXd4VUdhT2Rwci9pemZ3MXpIOFhL?=
 =?utf-8?B?dk50S1VHQ1hwb1JQdlByZUExYnYvcllHU2JsamMzc0NCdm1YdXBYSjVScmtL?=
 =?utf-8?B?Nk5HdWFtOUhmdTZkQm8weUVwMldqZ0xpRHUxWEV6SWVqRDB3NVExQjVCdnhw?=
 =?utf-8?B?YXJhM1lvWVlXSEpYdktVWE5jZkk4dmt5L0RPSmEvM1ByUm9idXp0anNCZGFO?=
 =?utf-8?B?bVBjSlVKWW5aZ20vMVczNzk5MzB3TzhjZU52WHhHRTZkQmtucDdtS0hIc01o?=
 =?utf-8?B?SkRuc3hvSnZDbjZhRk9nZkltUU0rZytKT3NKS053VVpWK0dVWnN0UG1LVVEz?=
 =?utf-8?B?ZFl3bVg4NmpsR0FqL2U5M2QzZ3Q5YnhVK3NFbzRoVEN0NVhMeHBzQ2ZCZHQ3?=
 =?utf-8?B?WlQ1WTZrQzB1Z3BZRVRHbHlRdVA2VW16bTRlUWJQUzY4YThtQzc1ckU5VE1B?=
 =?utf-8?B?UEtHSTVuOWVFWFBRUWl2K0FYWUtWNlZCbGpHZFVMTHJOK1pMcTNBMnBGbEhu?=
 =?utf-8?B?SENscXBnRi96UnNCeDRta2oyTVA0U1pBcjdlZXRyaDB5amdSMDBnVWdvMTBQ?=
 =?utf-8?B?dmQ0ZTFjZWNRd1lROTQ1NlBuOGdaRmtGeXEzZkRJZzV6QVMyWGlWL0JKQ3hF?=
 =?utf-8?B?YTVtNVBzYTJlRzVRNnhGNGNaUjlGM3RaRzR2YWFydllXM0VMK1VsMnlia25I?=
 =?utf-8?B?VERwWjh6Nm1kaUtsMUMrWHh0NzFkb0xNbmdDaVZPU09ONlJNWFlHTC9OL1JH?=
 =?utf-8?B?eHVMclZEL0JYbFdEOTgrOHpNWWxQQkZuZzN1azNyN2VyRTJqRWNxUXZpNTJU?=
 =?utf-8?B?NkpoQ1ZTUytsSWtzWVdhekRlRFBNem5zTWNGdnVpZWY2cVFxYllnL04vRzlM?=
 =?utf-8?B?aG91aXNma1FsVGZFSTEvZUFXd2lyWjZpcDRWN2FadHJ2N2d2eEo5WitDakdI?=
 =?utf-8?B?ZERtam01a3JDa1d6aE9GYWcyWS94a0xNdW1EWU5wY3BSbU93MDNONTZCSCs4?=
 =?utf-8?B?U3lHbDQ4d3RRMjNSQUQrTzhhNWtQNjNVbFQ0Q3ZYWDdpQ0lsN3lodEJEUW93?=
 =?utf-8?B?WU92VmM4NkxNdmh6MVluQm8xUHdvb3luRGl3ZzNiVm5jSkorUHNOWEZnak4x?=
 =?utf-8?B?L2hTK0o4dk1GQzIzSGV3eE56dVg3TTZCRGN0WlMvSkxXUU5oQTR4Sjc4Vnhr?=
 =?utf-8?B?M3RwNnN1Rys2S202aWhQYkI5clo1ejVyK3MvcHFrRUxhdDRPbUZYZmcyMFA1?=
 =?utf-8?B?dU9zbHZISVJKVk9jSXFPdTBDaXdVZk9Ic3EveHpGTWpTRGpYNnRENG9kUm9u?=
 =?utf-8?B?b3pGNXlabjZRUUM3ZTlEbVdoSlJWZWVsTVNqaURYL0tSOWJoOUVSekV6QjA4?=
 =?utf-8?B?Y0orVmUzWE9OQzlaWERvYnB1UitXUG5IWXQwTW5BVTAxWnpzZ3VsVExrcXJN?=
 =?utf-8?B?THlhanFDUUo1dUtXa2h1bkgrMVJEZmVobTBZbzBVbVhYY0tnbHFoNysrQm9F?=
 =?utf-8?B?ZkU4bGY1TEZibUN2ZWtXY2ZRSnNEVHNJOHlPUGNFQk1tazR1Q29mYnZmbTNy?=
 =?utf-8?Q?SZyvcNf0qGo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR01MB8101.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L3VMUTV3L2VxdmgrYjhaVTlkbjc1dnFHZkVaQmgwY0kvMEJuQmJ4bzcrNit2?=
 =?utf-8?B?UTFJcTFjeEViTHlFcjRMdUtqNHNmSU92LzJzS2JQOCs4SkpEUnhmbS8zRWYr?=
 =?utf-8?B?TFhqWWNucTBTWDBaSjZjYW9TZlFuemF4R2I4MEtnemNJL0MvdmpGa0pxdDUr?=
 =?utf-8?B?d1k1SUxLTVdIMk1ualJpVDB1WjV1dzlNbkJFdkF2VFR5SkZBYi9rc0Jwbmlq?=
 =?utf-8?B?NFZlK0hyQWdxMXltMWtjTXVNTEdzK0hoTVVVaDczMFhqUnA1Mmx5QWFPUE90?=
 =?utf-8?B?VVE0OXVoWXkvMkZBWnlyZ1FzUW40WVhnR1ZrUlFWd0tERFA1VWhSWUVLZVlU?=
 =?utf-8?B?MDMyUmgvRm8vUDJWYnd3UXdubDhFMTIyckVkRE1QM1VPcmxmSUl2SFJ2Uloy?=
 =?utf-8?B?bVFYVW1IVDkyYTR2WEY0RlJmWVFSUFZkM2pJNnowRXhpTTg5K1pCS0pHOXdK?=
 =?utf-8?B?VWJQeGJwbE41b080c1NSSWFyZEpwb3FWOG10dElMTHRBa0d3blZxMG9OZHNz?=
 =?utf-8?B?M2hmOUdnUlQvVFF4cTFaTmU5VE5XZ3RhMm5qWmNYU3ZZVVpkZkd5VEJEaG1R?=
 =?utf-8?B?T1FlK1ByekYydXR6Mkt3SXdhVEJLRTV1VzN6WkVNVWJ3K29GUTdxbmlybEZa?=
 =?utf-8?B?elFjRjRPOXBhRTlSaE0zTk1MQ0JkY092a2t1d0djMXdaREEydG1SYWorQWp3?=
 =?utf-8?B?V055THJ4WC9MMm5xUnE0SzlkeFVMUzVxNFdrOVI2RzZyWHlZQWlzU0tkdkc4?=
 =?utf-8?B?SG04TGNMQ2Zscm1HRXhkNEJnNlRNQVpLSzFqTmpZUnpQY1Fhakw3eHJKdERM?=
 =?utf-8?B?cjJqajZDcHNKT0k5VW9ZMkx5R0NPZXVxdjdiaWlaRUdlajhzdXRKMGNvekRH?=
 =?utf-8?B?bjBsMFFmY2M1cnBKRFdWWHc0aXdOMnVJNzJjb1hCdzNOc1lNSkV1OTRHVUMy?=
 =?utf-8?B?MncvNXN2a0YwRjFrdk1EY3g4UWlLMFVYNFJGRFZtN1ZFK1BMSW1HbklGbFhV?=
 =?utf-8?B?OEJhb2g2dzdEUk9QcDY1QmZoZEx5OGpUWXRVNkVVV3BsSDZDLytiTDZQOFhD?=
 =?utf-8?B?cm9VV004TGpNSnlvMGMyVmVrdkh0bDNjVzFOaThuZm56ZFh0U25mYWdzRVph?=
 =?utf-8?B?VjhIS2ZyNFRHNEZaU2VsdXpvQzdObWZvT1dwdFEySW0rZWI1MFpFL29zRkl4?=
 =?utf-8?B?Ymo0elhja0VzUVhuSGpZUitDZ0dMd09wSnYwbmd1dDhrb0g0anAvN3V1MFhG?=
 =?utf-8?B?VExrQXltS3EvTTF2bGNqMzNXSXV6cWh1ZE01c3puYVRHQ1ZZRVZ0TzFMUzlJ?=
 =?utf-8?B?L1dIbmJvLzMyNHhiT1Z6bXB2RGRpU09iZGxqejFyNExWelJ4enl6NlZOeFNv?=
 =?utf-8?B?eW9PU09FM0NJWE0ySVcyWjZadXdYMGZXcjA0bHhkRHNoR0MrNHZ3TS8vdVBw?=
 =?utf-8?B?NTR4NUlTTXhtWXVmWFBtTmtVTm95STRFVk1jOHRlZ3pwbjdXdk1MU3djOTFS?=
 =?utf-8?B?ZWpUY1BBL1BjVTdhRUFWYTh5bysxM0JpMU41WFJzOWFYVlk1d2E2SWVBMm9t?=
 =?utf-8?B?TG1iWGlDSWhQdkpvQU9zQis2dzQ2OTJBcU1zNUk5UVgyczlvWlRmY1FrdnFk?=
 =?utf-8?B?b0V2VU81QVBTWDZqOHFERC9yRi9NQk9OYWwzVUFHekl3VjdYeHlOMnZaOWVh?=
 =?utf-8?B?MjRGTVRSWXRTUDliZGl3Ykc3ajBhWGo1WEw2aDVZQUtSUmg5SXYvQmhHc1l4?=
 =?utf-8?B?VGt0ang1bWVyOU5PeVRjejBKbm1sQytxQXVBTWRYeTNTd3hWcFhna1dTQjN0?=
 =?utf-8?B?eHJJdXV5cTR4NzZuaG8va0NmeXFMNDNUVjAyQlk2QThxMXEyVDkvVitHb09j?=
 =?utf-8?B?V2ZkdWk1VXQ4VitLcFp6SmhZUFd2ZlFMK28yaVcvYXVDUkNGb3NjOFRmZUhm?=
 =?utf-8?B?R2tCZSsvRGxFRk1NQmFoeFJOY090d2pTb0tXV2NsamU2YXRZYWVManF2Zno4?=
 =?utf-8?B?LzlGYXJubUxWSTVWWWZrV1dIcFRSNDFJOGJkOTRIWitRZWJod1BMY1JUd05a?=
 =?utf-8?B?clVQSkhCSFNpZE5ZRzM0bDBPM0JqRkZ5eU85RHBqTGRvUEwyV0NFUGJoZWR2?=
 =?utf-8?B?SmNUMkxTZFhrcVZuQlIxTDdkakdFWFYwaUVub2JidHRxZWt0WFozKy81REE3?=
 =?utf-8?Q?vC9Mbu3OxBZOt7OwkFu/ggQ=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 907c9744-79b2-436e-f450-08dd9e9bcd4c
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR01MB8101.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 10:30:15.9132
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qngvslE4qKzZ70+X9wQmUHHRHGzF0hcVaIqWXvTOMgmRm4aT3KCW4ZAXi42ysmVBccyyvCCKaYFfCD4TTZituo+Zp2SP+8g4SbAuVYyRyfUfgH8XIw13fPIUcxZnsiOb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR01MB7650
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_033043_769681_85EA0BB6 
X-CRM114-Status: GOOD (  13.69  )
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


Hi Eric,

On 5/28/2025 6:58 PM, Eric Auger wrote:
> Hi Ganapatrao,
> 
> On 5/12/25 12:52 PM, Ganapatrao Kulkarni wrote:
>> This patch series makes the selftest work with NV enabled. The guest code
>> is run in vEL2 instead of EL1. We add a command line option to enable
>> testing of NV. The NV tests are disabled by default.
> 
> For commodity, I would add in the coverletter that for all tests
> enhanced with vEL2 testing "-g 1" option shall be added to force that mode.

Sure, will do.

> 
> I don't really get how you chose tests capable to run at vEL2 and
> excluded others? Wouldn't it make sense to have a way to run all tests
> in either mode?
There is no selection as such. I have worked on around 50% of the tests and sent for the early review.
Yes, almost all tests can/should run in vEL2 except few.

-- 
Thanks,
Gk

