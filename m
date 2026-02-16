Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C25CFE63F08
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 00:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ndEd5zjGhvYJF6NpiNN+0Vjvr1rWfKqBk4/HIq6ERlM=; b=f0KAreqB26JeKGXT5mQEDSkKPO
	Ebv05VjGX80E1qX8g92hGWkFVyoX8QG5yIloS6iZk11iw6Ty8uoc+Rf8pQKYiUQWYJwSKEwtt+qQx
	GX6vIL6Oio+0RpzwBFba/kPkCdvQ6mTs4k/7vokFTp1ric45Ljm7Rpbvw0N2YPDzWGntOM6q+tSFP
	pM6pm1a78EFJWisoNx2xbmhu1TRO07vTTBf4aR8sR86Wjb1rw0z0j5DSBcETkrAyTKeK0233NOHRl
	rZpF40GUA22f8egaD85lpedZhID/OvF4LCG+F78BcBBn1B0jnQwvZLxYMZ7JADdIymWa6DVSaQLKx
	Ip/GfM7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrmPg-00000005o4D-023Q;
	Mon, 16 Feb 2026 00:24:32 +0000
Received: from mail-westusazon11012011.outbound.protection.outlook.com ([52.101.43.11] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrmPd-00000005o3s-1KBB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 00:24:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V837r898Q+ofxpCrIZS9gqITtV1210bf+j79aLHEvjo7uuEhrXeoy8V2tS4I3fJirbLK/i5tLCRGan993DFYhLEXEvSr7SAiP0tbzhNOrtP4u/PujYvzQZ1aqfwDS3K3EOuHX2CfgLsOlTV17bEiAyXC5OzlQEwmXvHnNPHRFDKB3D+2FLxFOj2RIzNigSm8hpx3JLiEJpq+xK48b7NyHDL2wN5yDzFjdfqfFhPM6TyW/bHwTDi7aphIyu0HQeNe5STtp8pqbQ81iOcv1m7qn/1VNpVN8dGbgx6hazXFuwu0bdHHxp+OE4/a6m23+iP6d0yZ7YidMSzXBLZd3W6dDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ndEd5zjGhvYJF6NpiNN+0Vjvr1rWfKqBk4/HIq6ERlM=;
 b=qVPZGOlESTBkApnmevssnLzgkjJtXk8Cl935o0irv++5+kxU85ScjckZx3s1MOm26vZG6Ta1GA9S4AtkLIyl2RVHAHVbkwLG/cDcpO+3NhtKdRyD3fFAJatmATkjHIdrmsHtlzpdBqIjKY/Stk78NYbR/6Ct0w+drghn6f0vrlrA4i0f8O+ccv1JWwXj5Bs0OKywe2pV4asJTZGM8t281fkW2rx5unXzbTPm7xwK1sZZrF7R8qR2aMobEuWYa9EU1qp4KcRyN3L16oKvsGim5eHPENWHxeb1HYXPeKzmupzR7vrJOB6WVHByONTkdCa6F4I9HvKO0mNKcyGFPZEzpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ndEd5zjGhvYJF6NpiNN+0Vjvr1rWfKqBk4/HIq6ERlM=;
 b=dBwimynNrLqYjPP2nWXvnV/cW8Z6PGfHZf4I9H+W4cwBgJwxZojw4OVFu0VmiHhE5vG67ueTHgGUnwU64k2hjTkwP5f6k1hq/Vfg63hmJXdDEs4wWx4cp9sM6JbYG+jtbzMBsZvsC2aquNexZYDYb12uLfgBNYQ0cEQJLSWBet930tS4/Rvm1FRKIg7Dca4dsEOc5hWlRbp2SEyQ5ZlWP1xhjILLtpuQeMB2HTCwxolJ950afoKafWecpPMDBK2Jk6GkTUb1Cg/MWUKCyXXAcSYhoSses8vyWcqsjN3NLDar236Vqgz5E/ejdbywQdUZ4tWJ1q+/UtWbCcw6AqghoQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 DS0PR12MB7928.namprd12.prod.outlook.com (2603:10b6:8:14c::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.16; Mon, 16 Feb 2026 00:24:20 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::5807:8e24:69b0:f6c0]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::5807:8e24:69b0:f6c0%4]) with mapi id 15.20.9611.013; Mon, 16 Feb 2026
 00:24:20 +0000
Date: Mon, 16 Feb 2026 11:24:14 +1100
From: Alistair Popple <apopple@nvidia.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, 
	Chris Mason <clm@meta.com>, akpm@linux-foundation.org, catalin.marinas@arm.com, 
	will@kernel.org, lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, 
	Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org, surenb@google.com, 
	mhocko@suse.com, riel@surriel.com, harry.yoo@oracle.com, jannh@google.com, 
	willy@infradead.org, baohua@kernel.org, dev.jain@arm.com, linux-mm@kvack.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 4/5] arm64: mm: implement the architecture-specific
 clear_flush_young_ptes()
Message-ID: <ag74mc4znhx2uozuhim4cm343jq3eewzmowij5fehdibfoap7h@thkofam3wjip>
References: <cover.1766631066.git.baolin.wang@linux.alibaba.com>
 <9d866a2644051e13a41ef4d6ca3909c6e1f9e229.1766631066.git.baolin.wang@linux.alibaba.com>
 <20260128114936.72280-1-clm@meta.com>
 <de141225-a0c1-41fd-b3e1-bcab09827ddd@linux.alibaba.com>
 <07d55759-a50a-457a-badd-85697174116f@kernel.org>
 <280ae63e-d66e-438f-8045-6c870420fe76@linux.alibaba.com>
 <16fb7985-ec0f-4b56-91e7-404c5114f899@kernel.org>
 <6817c7b9-e67c-46b6-b3b5-1bc3d9eed4a2@linux.alibaba.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6817c7b9-e67c-46b6-b3b5-1bc3d9eed4a2@linux.alibaba.com>
X-ClientProxiedBy: SY6PR01CA0134.ausprd01.prod.outlook.com
 (2603:10c6:10:1b9::12) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|DS0PR12MB7928:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d827877-48c6-4ecb-acda-08de6cf1ba3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?KzZOVDNxZjF5b1lkTmNwWUw0QVErWmZyM0V6cjdhTjF5dkp3Vm1xS1NQZ20z?=
 =?utf-8?B?d0xTK3B2dHdaRU5kbXI5TlRsV2lCbTg5UjFaMFJlMFBFa2l6SGR2a1hkS0Fl?=
 =?utf-8?B?a3VMZ0dpQkxLYTh4VlRVME5PM0VxQ3B4OW1uVm44NVNCcDNOQnJMSWJaVGxR?=
 =?utf-8?B?REk2NllPc2w0VlM1b283cVg2bUliVXF3cy8zWmF1aE1mbjJlTWNST0V2aXh5?=
 =?utf-8?B?WkVqQVJZblVheFFMYmlKVzlscU52VFJQWXRNb2dZVzNuZldoeFdXY0xpbVVr?=
 =?utf-8?B?TUdlTXhTZ1kwdzNSR2IyeDNLRjZ5V09Ha2pwV1NpM2dJSzc0NCs0RUwva3V1?=
 =?utf-8?B?WkwwK2lBQXZMOXVXK1IwYnNXcENjMzQrMEJYcGJuTEpZOGZKUGdqU3BvTVZp?=
 =?utf-8?B?NkFla0kwcmpyRkV5TUp5YVl3SjR0U2tJWWZtYm43TW1YQldmUjJOL09RSHRB?=
 =?utf-8?B?bkdPeVJzZkVDcnZ6M2lLTDAzVC9LY0VKRm1DUVhnUW1kV29VZ1JWWWE4WCs4?=
 =?utf-8?B?dUxxNXcwbytVVkJjTmc2ZWhXQXVWRGREODNVUDBaRHI2bXVWdnoxdGNlV2JN?=
 =?utf-8?B?d1pTZ284MWJuT1JVeWVHYm5ycy9xa2VxU1U4YnR0b1RkWTNCclRiRS9qTkJ3?=
 =?utf-8?B?MGxENnlmTEg3dVgxaE44ejRRVnBCVVlMV3A3TDFCUWsvOTlHKzBHSC9DZWlD?=
 =?utf-8?B?RWR3ZzRlZHlxTmFhekFBM01yTnNMTXZsMHBFOXMvWUFJc25UWjRMQWdkUEh6?=
 =?utf-8?B?SGZnVmVTSFdQSWRMaFNmVThBMm40VlNHeFZaTW5BT0svOTUzekp4QzR5ekQ3?=
 =?utf-8?B?YXBGZG1EdkcvV1FXSXprYlNCY2R6UkhmTEdIa2cyL0s4NDFWd2FTdFNJOXRG?=
 =?utf-8?B?aWUySFB5eStSVGFFY0VWeHplNFZBbzc0MVcvRXNpWElEV2lxcmtCZm1CWnhz?=
 =?utf-8?B?SmpObFlIb01FVzFJa2gyTWRQUG43Unkyazg5T3NIQVZER240WFpqdUNIcVlD?=
 =?utf-8?B?bGFob1ZMOVRXK2tkYmlYUXNpdWRTNXRnY0hGM1Z3MktPRkhWR0x6U3pOTkVQ?=
 =?utf-8?B?c2orKzBGKzRYMlFtdW1QS0xnWnQ1OTBmL0RJMVdPZUVJR1cyT255b1g2WW93?=
 =?utf-8?B?Zk1XRURRQml3a2c2Ym1ZdW91RDQzeFVQMnNvakNnd2tFTzdLd3VsOGhKZm5j?=
 =?utf-8?B?cDBuYWpDNkh6VzVaaDc0S3NJVGVLc3dlNktBdjRraytMOE11cmhuS0FPKzRw?=
 =?utf-8?B?NDdxb0JINGdWUElNU0djWHJrNjNONDN4SlZrZnpBT1VXWUxFNkpLZzZ3Q0Z2?=
 =?utf-8?B?dlVYZVJYUUo4dmJlWXVyTE42M0JZbVpHQm1LZ1YrOE5vMmxLeUQyQ1VYakE1?=
 =?utf-8?B?T0RYQ2Q5cTEvMWdVTlpBU3hIS1dDMWMvTlhEcHYyU2UxQTN6bDNLb2pPWG45?=
 =?utf-8?B?RVQwdmI0dnd6emcyQUYrMEVNQmx1YSs0SjdjOUNTRTg5TmxMYm9BSytQb3ZX?=
 =?utf-8?B?Tlgxcyt0R1JKK1p6TzUzZTh1VTYzK21HeDB5THE4MUxZRXI0SEk1citFRSs5?=
 =?utf-8?B?OEJjOHNBbFV3d3M4UE14VUV6RGVjZkg3c3dmUnJueGVsT3pZWEVKWklUcFAx?=
 =?utf-8?B?VDFTK2VwcEJLYXkyTjYvNGwyTnNIc2lIWDJEWExSMFZlc0ozOFhuR1Z6bm5j?=
 =?utf-8?B?ZllwNUU5Sk5VZGdLYjZlTTR3MGxkem9Sd0MvMUtIcGhWZ003bXEzcGhrL2N4?=
 =?utf-8?B?REM5TG45QUNsNndsVFo3WFBZQjNjNlUwOThaYjFlb2V6c2QxQ1Ivd2pDa1pt?=
 =?utf-8?B?MGI5OXYwMlBwTzhibmRJS041R1JLK0FnbDJxQWtsdGlWZGY1ckR3NEpsOWFW?=
 =?utf-8?B?UW5tS0JkbkNwc0RYQUt2MzZBZld2UVM4ZnBMU2dRQ3BrYzJhdm91TjZnUTlR?=
 =?utf-8?B?d1VUZ1JsbXRvdWZnOWoyQnhvY0c0TTBvNFpVZ0E2YmNqeEh4WFhGOHNVNkRl?=
 =?utf-8?B?RVpUY2Jtb2kwaENVKzFEZXJEN1NXK0V1VTRBOWt6SnFleEM3djdRRDdkVnVJ?=
 =?utf-8?B?WTVFbnFpQXprcFY5bFRVY0d2SEgwV1Z4MTd2dC9tNkNKUkR4OGp0TCtQQVZY?=
 =?utf-8?Q?ohyQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWpBL3NQVmp2b1ZKeC96RnVsMTU5akhHVFdyN1J3dDZoR3NoNDZKQmNPR2lp?=
 =?utf-8?B?amxaK2hlSExvSlY4MmpDQ203ZmJGaUsrN0lEdmxEa1NjcUNWOHBpRVZPaitY?=
 =?utf-8?B?dDliODlld3lOSVZ4cTZtUW5YVHJkYmRBQTBVaXpMTVA3dDlHYUhjZWlla1M3?=
 =?utf-8?B?RkJaZEpyVHVFNGJ5cGV1R25kVTdhRGVoeFFJN0RyemRGUklVZ1FHd2xXelFu?=
 =?utf-8?B?TmxzcmFFOW9JYkExMEpkUDdySGgwWENsWUhwNkQ1VFh3alBpSkNwY0F5YVJy?=
 =?utf-8?B?NVZMYjI4MnZ0US81NEtUV05MU0VLSUlkZXFnNUswQk5Gb0JDcGh5MGtCQkla?=
 =?utf-8?B?QVZpQk1nZFI3MmhibDdwMjJqWUczVXU0UkpkUkRyelhiS05wM01FVDV2VmJH?=
 =?utf-8?B?TFdsekdZeUwzRTB4eVZYNUVVWXFEUThZTUNHMVVXelpWbnd3a3Y0eENzVVRx?=
 =?utf-8?B?L25zTGVuWmxGWGZYbXJKL053OFVXb3MrcjF5a0kyekNkRjNiL2dYR0k1cVpr?=
 =?utf-8?B?b0ZGVm0zVk9nVmdhQnRRMmo2NVd5ZGk1NE01MTRMOU5pSENaMmdLaWVkdWU2?=
 =?utf-8?B?emZ1aXM3eXN4cXJFdmpKQ1l0VFZua1VVNlRDbVExYkZNMklWY1JNZkh0bklM?=
 =?utf-8?B?NFdnUUk5NnZUUnVoT0hJYklZZmtGbEFtVGd6UXMyekx6NHZnYktGWC9LYktR?=
 =?utf-8?B?UXp0NWdPbFJ1VGVGMktyVlljSmpaMmxDU1VIUUNkTzV3dGpZZU40dW9aSFZa?=
 =?utf-8?B?VzJ2R0t5MVJaak1FcEdkTWVoWHVpVS8rL2dDb3llTWY2d0JzT0U1bWJLbTcv?=
 =?utf-8?B?eEcrcEVZa29jVkE1YnhLS1U4UHR3bjZWcWNiak5uSzA4Rk90ZVRGWjhFUE51?=
 =?utf-8?B?ZzA2cjFnUXNyUGlPcWtoYmlLYzh1QTdLOFVJV1FpTUQyQVFOT3JqM3ZPdVBw?=
 =?utf-8?B?QzIrbTVHNWRuTXlpQ3ByNXJveDlueXYwc1BFdTQ5WmE3djdUYXV6T25zNGFS?=
 =?utf-8?B?R3RGRTV0a1VhWitBN0w4bVRJRHM2RnE4aHFqNUZBT1B2TWZjNFk3dTZudkds?=
 =?utf-8?B?Q3lmeGE3bXJmUEdTWEg5SUdxakVVdjllUVBGY0dnM1ArOC9JRGpRd1VHRGRh?=
 =?utf-8?B?N1c3Z1EyVTBERmFNWmt3NWhJNEZqZ1gxRDlaMEhWbFB3RWtyb2ZZTWlTY1Rh?=
 =?utf-8?B?azkvRWpQTk9uNjBWTmE1ckN0VXRBaGg5aExya2Y2dXEvY1N2b2FLLzBzUThL?=
 =?utf-8?B?bnJLdkdHaU5LQXFsekhEMHFGbXVtUXJ3SGVDTEt2REZoZ2pXY053UmUwazN4?=
 =?utf-8?B?SXhCTkYrZ0phenJ3MHJ6dzgwcUJCUUs0N3JtN2pkY0J5d1BFY0oxeFVwTmJC?=
 =?utf-8?B?WFBKcU9wVUZCTUIvcVQ1eHpZa0pvRVRuOVBPM0VnYTYyeVRieHA1K0tMMG4r?=
 =?utf-8?B?bW5MTHRSU2dUMjBteElRemVaUllQQXNJU29mY2dXcXVRWTB2azNMVU5QM0VO?=
 =?utf-8?B?Sk8zcUZTUjBSc0RERG0zWDEwdlZDUXVsSUtYems1blBmZXZCTDJKazZsNERW?=
 =?utf-8?B?aG9Yb2RiVkRGTUpVbzAyWi8wY2JEWFd3aSt3NGN5YW1RcFNEN2ZGRGJHYWl3?=
 =?utf-8?B?M1NnNTROblEvWkRKNzJnVnNNamY4NEhEVXRqZGcwUm00TWZYRjBXZkdUbmV0?=
 =?utf-8?B?L096RzlxU1p5ZUhYZkUrVGNwWlRmMUFaYVlaNlpQdkRxSmpOSW5UZGlCYzVn?=
 =?utf-8?B?WUpmVFp2amZFVG1UTkIwb3lqQjJQMGh0d05pMDN5MHJCSGZQV2FJKzdqY01i?=
 =?utf-8?B?U0ZSaEZEcENidjZzTVRITExGdjQyU010NzZhdFNhbU4rVFN4eHA5cmxpZk5N?=
 =?utf-8?B?dnBnay9iVU5qSEw1M0RwbU10UU9oK0RjRUtwdXlpMGZycyt5cldUMW1OaEk3?=
 =?utf-8?B?RXNNVk1NeFJVWWNhUFlKdTQ1VCtxam80QzVnY1h0MVEvOHpIbjlXdE4vTjQx?=
 =?utf-8?B?UERYa1VPVTREajkxcnZ3U2FHbk5CQ0VFdzlEWEV0bkNjQVg1NktoUy9GR1hM?=
 =?utf-8?B?UFJ3UGpjbW5hWG9ETXgwZHJCMEFwdG5laVdZUDFrK0pZbzdwNzl2SGxXblRC?=
 =?utf-8?B?M3ZkTUZhYlYxWGVxQnB1WVltRWlRR2JyOVJxNFBET1M3YTJld2wvblUvL2Zl?=
 =?utf-8?B?V3U3cTVvMDV5a0x0ZDlSY1l2NzJqVHh3Y21lZ0ZZNDFzaDYxZWZaRU43K2hB?=
 =?utf-8?B?c3dRK1F3M2RKVzk1Yi8yOHptdzdiTzBtcFJDT2FWbjRnUDQ3MEpKYXA4cm40?=
 =?utf-8?B?YVNkZ1I5ZkhtYXo2N2FEWG9aYlJ0bmhObjl5MkFRZUZXb253ekgyQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d827877-48c6-4ecb-acda-08de6cf1ba3c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 00:24:20.4599
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oWf15HYTYpUEGcd6gOOkPAO8ljR+hqga0P1afezVhD77G1LyzsQiVVuyc15a6V8aqpXXe13T+fc55LObMcNLVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7928
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260215_162429_372570_A3113BF0 
X-CRM114-Status: GOOD (  29.12  )
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

On 2026-02-09 at 21:13 +1100, Baolin Wang <baolin.wang@linux.alibaba.com> wrote...
> 
> 
> On 2/9/26 5:55 PM, David Hildenbrand (Arm) wrote:
> > On 2/9/26 10:36, Baolin Wang wrote:
> > > 
> > > 
> > > On 2/9/26 5:09 PM, David Hildenbrand (Arm) wrote:
> > > > On 1/29/26 02:42, Baolin Wang wrote:
> > > > > 
> > > > > 
> > > > > 
> > > > > Indeed. I previously discussed with Ryan whether using
> > > > > pte_cont() was enough, and we believed that invalid PTEs
> > > > > wouldn’t have the PTE_CONT bit set. But we clearly missed
> > > > > the device-folio cases. Thanks for reporting.
> > > > > 
> > > > > Andrew, could you please squash the following fix into this
> > > > > patch? If you prefer a new version, please let me know.
> > > > > Thanks.
> > > > 
> > > > Isn't the real problem that we should never ever ever ever, try
> > > > clearing the young bit on a non-present pte?
> > > > 
> > > > See damon_ptep_mkold() how that is handled with the flushing/notify.
> > > > 
> > > > There needs to be a pte_present() check in the caller.
> > > 
> > > The handling of ZONE_DEVICE memory in check_pte() makes me me doubt
> > > my earlier understanding. And I think you are right.
> > > 
> > >      } else if (pte_present(ptent)) {
> > >          pfn = pte_pfn(ptent);
> > >      } else {
> > >          const softleaf_t entry = softleaf_from_pte(ptent);
> > > 
> > >          /* Handle un-addressable ZONE_DEVICE memory */
> > >          if (!softleaf_is_device_private(entry) &&
> > >              !softleaf_is_device_exclusive(entry))
> > >              return false;
> > > 
> > >          pfn = softleaf_to_pfn(entry);
> > >      }
> > > 
> > > 
> > > > BUT
> > > > 
> > > > I recall that folio_referenced() should never apply to
> > > > ZONE_DEVICE folios. folio_referenced() is only called from
> > > > memory reclaim code, and ZONE_DEVICE pages never get reclaimed
> > > > through vmscan.c

Agree this is true, although I've always found the reason somewhat difficult to
see in code because there are no explicit checks for ZONE_DEVICE pages. Instead
it relies on the fact ZONE_DEVICE pages can't be put on any LRU in the first
place, hence reclaim can't find them.

> > > 
> > > Thanks for clarifying. So I can drop the pte valid check.
> > 
> > We should probably add a safety check in folio_referenced(), warning
> > if we would ever get a ZONE_DEVICE folio passed.
> > 
> > Can someone look into that ? :)
> 
> Sure, I can take a close look and address that in my follow-up patchset.
> 

