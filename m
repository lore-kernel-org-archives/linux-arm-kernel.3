Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86311C87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 00:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hjWwcl7tNgcmLA/P++PShJdEX5xVzopDrEaNHCPWoNQ=; b=Un5kEx6m0NXHlv5vQsqGUxTP99
	e5zSFd+bpeWEjJW/Mzg6tvW3lxSwm1+PFiZZJdArf8G5c7maRS06mtStE6b3IjOH6XbbqxvgZcl85
	VHNvugmqesjX9ilvAiSGes9z1r/IANwOoYAuJW6B9sQk01+kQJYXoR0J6TLOK9iA9iJ432OqdDNx9
	KylnMqR/DPX3pRX0kG9N7QModfMiDBBoqHfRqXI1bl9flvrzTVZFAN1o208H2olNQFeFcxkplB6qx
	f8Q8suLd464Ygpb5vtibIkb20MlfI4AhhUryaDVYl2GeUlCrneBOCqPqmwpjWGO9sv7nBLPe9pC9z
	e53vS4Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujomb-0000000GwZK-0BsL;
	Thu, 07 Aug 2025 00:47:01 +0000
Received: from mail-dm6nam12on2070e.outbound.protection.outlook.com ([2a01:111:f403:2417::70e] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujok4-0000000GwJC-0frG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 00:44:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OB0Y/MEoNFTwc45GaC0lcHXRBMUtMWf/SyVbAq1GmX+d9PNBZoEPrEUicPh1X72sSOd/L9n45moBbAJ0ibeOKDyctHdYqK0+/a7JVKFgCvqHuxAyaNpUqXjBNOFCMTAxIOF9DRGrawNP5UtyDQEHtvvp4FOJ6JUDZzRp8pTfOAlL9dV0VdUWMJS+8ZPteeyx02kImsf0+19x2XjgyIjuSIUGVxUnH18kOTdPiBXdKK2rXbEmqY6gCM6GuhJC4oXcJQjC52LaIzpQqnEdPgm+bUwDd4ZVVXeNZdbLlCsVN7HnTtgkXQ7y69FpR0ij24ygYXRNrjYeB9CBeMeu2XVpJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hjWwcl7tNgcmLA/P++PShJdEX5xVzopDrEaNHCPWoNQ=;
 b=k2dssdMlf6mrO+d1ErQaeuwWRSalD7vM7yYFiAXU51QNSDS0N7MpqkN3vsAVgOF6wd9XMVFwbjbPrh+M83w4PkVauGPEXT6J5JI8mvXPybE13Jjweu+L/9ZiQ7TbVq37MDqb8AhuT98uzT7TR56LHY+gmKb5rlv+jUzPWnzNuZchx2RFJVOynr8APlJKEfuInZkCqcsin5onz7rtLtc9oOvlY4pPzX/nuOjZ7LZMDLgALhOsZIXhkMperBYloXtzUChyTg+ZbfJcUfy6sPTxBAY1bsbifh51su159zJphyvnNHcW//7m6BgY8etBlbc72y2sErA01068tedGp4xVQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hjWwcl7tNgcmLA/P++PShJdEX5xVzopDrEaNHCPWoNQ=;
 b=AsvgfU+aWLWn5aJS6aPUeLTNqcCUS6bzexfTfl7Gun+40lrDOHUoUhbgOHIaxLpU5rqTzSpbUP5FN4Zk8MHu+K61vSx/oro0WcrJqukxe1OXeh6y0IWbbFiFCVUH0qbocgzK18qyDLIBcg1SmNsk4Ogp9KEVl2ESUiA1kzkJT40=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 LV2PR01MB7671.prod.exchangelabs.com (2603:10b6:408:174::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9009.14; Thu, 7 Aug 2025 00:44:19 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460%2]) with mapi id 15.20.9009.013; Thu, 7 Aug 2025
 00:44:19 +0000
Message-ID: <e1283b35-dcab-4d0c-a1e0-3ef938fa496a@os.amperecomputing.com>
Date: Wed, 6 Aug 2025 17:44:16 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: mm: support large block mapping when
 rodata=full
To: Ryan Roberts <ryan.roberts@arm.com>, will@kernel.org,
 catalin.marinas@arm.com, akpm@linux-foundation.org, Miko.Lenczewski@arm.com,
 dev.jain@arm.com, scott@os.amperecomputing.com, cl@gentwo.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250724221216.1998696-1-yang@os.amperecomputing.com>
 <20250724221216.1998696-4-yang@os.amperecomputing.com>
 <0e86671e-18bb-4f3b-9294-c583299ad49e@arm.com>
 <e65ed11d-68ef-4b9c-80ad-7e880743b3d3@os.amperecomputing.com>
 <b2d3e684-e3dc-41b5-9708-ca5926c55ebf@arm.com>
Content-Language: en-US
From: Yang Shi <yang@os.amperecomputing.com>
In-Reply-To: <b2d3e684-e3dc-41b5-9708-ca5926c55ebf@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0229.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::24) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|LV2PR01MB7671:EE_
X-MS-Office365-Filtering-Correlation-Id: 177146ce-b512-43d3-20ee-08ddd54b8b55
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d1RNZUhPMjJ4Y0JDM2d4cFBSSzhoNDJYWHVHZmtYSzMwUEdlb0xzck02T012?=
 =?utf-8?B?ejZUb0dNbWJqQ3d5VncwVXdpVDE0emhweVJDRFBDMVRBS1QvOTBkYmlGNDBE?=
 =?utf-8?B?UkpTc08wSjNHWWVIdnk2bEdwQUovMVg2MW5sSWluNFI0bHRWK3lpcFphOCtl?=
 =?utf-8?B?eEhzZGtQdjVyOG50SWFYQ0NDZzNYUnBqbnRwcitXUFUyWmVRSzRaUmFOZG1r?=
 =?utf-8?B?bldLcUo4WjNDNnhPNW9MUEJsVm1PdDFtZ1ZGK2s3OCtJTTVBeisxQ2JSejhH?=
 =?utf-8?B?LzI2dHFxNW1xSGdrMVhTVVl1aWxuT3RSaWlXbGtHb2ZMRFRvWlA3VmJXekt5?=
 =?utf-8?B?Ni9Ecm5HK0daUHhKbmd3U3hMTE4vVStvTkVhdG4rSm9BUm1xYnVtcGhDWHhU?=
 =?utf-8?B?TExxMWtXL3I2Q3M4cWh0REd6ZEp6OFZvbjBqWEdMbDgxTDBnOWV3ejl2Q1h5?=
 =?utf-8?B?Zjh5K2pNbkRjMzM4VVlyTWJwRS9ENUxhTTR4T0hySlJLMGpzeWxxZzk2Ynkv?=
 =?utf-8?B?NkxWUFg4aGNFSzlvbXFLK0hpbVJMOSsweHI3OVkza3RDNkxvV1R5TjMxeUxn?=
 =?utf-8?B?SU9SdlNDejE3MGZmVG82Q2xOdC9CeUFRTVpyLzBGUTMzSEFuSkRuR1pkTllF?=
 =?utf-8?B?cllZUEtGbDZDNFhCdHpwV3NvTHMycm95b0FEcVBNRjltS3k1MnQzT1dndlVR?=
 =?utf-8?B?VzFRTUFoRU9mNjRkY2F1MXdZT2piN3BXVmFkZk9yRmJvaGlpR3Y3Qzd3bEVq?=
 =?utf-8?B?WVcvNkYwZDRScDRjWmNQeU5iTXNGWlRHOCtmT0N5dmRSZFdYVUlVa1pDL0tt?=
 =?utf-8?B?bm9yVTkvVmRVVjFadHdwaWFpNlRNOUVOemI1QjhIRFV3a0p3MUtEZlk3NDBG?=
 =?utf-8?B?djNuV3ZyVEhMNEtQQ2ZuWXlINHYxclYxUCt3MUl1Wlp6M1UvVDN5aC9XRmlw?=
 =?utf-8?B?ZFRIZUdJdWlEakZKN3M0THZPZ0g3cXMrTyt6aWkxbzhqbGh1enczcUtxOG1Y?=
 =?utf-8?B?bXl6RlY3bDFiWklnU1VwdUdnUlRYRHcxWGdrZHZBYm03VU5EMWFrM3cvRnpE?=
 =?utf-8?B?UStKakVhSkNwclFMUTJSTWlEcHpKMWlMRXp3YTVTQlVOYUtYN2hGTHlMdjBF?=
 =?utf-8?B?WjBDTDZEQU85djVUQm5ucE9KdlhNQldYbHM4RGNvM2FMMXB5YmlQQ0xpOGZu?=
 =?utf-8?B?N09ndVhOQ1A5UWxaSEMwOEwxYXMyK1AvSVNBTDIvTFN3bnFjVzdvQkRVMGRp?=
 =?utf-8?B?b3BxTW1UeGpPTWZTcVd3UUsrRTJMU0lveGFXU2N6YmQrTmVJaFl6eVpOckxk?=
 =?utf-8?B?bkU2WmFROUZqR0Z6ZzFHenZFRVlLVXZxeUdNbHRhRzJPdys2OW1iaCt4MnRW?=
 =?utf-8?B?Y3YwVXQvRGswdGY3NnY5dmMzaXZhWG5vYS9RdHBqRmlVTlA0bzgvK2RjWmEx?=
 =?utf-8?B?UXNyK2JiUjRiS1hINDdZWlBlZUpYbVRwejBLRXRGcWNsaytKK1NSZDRPbkNS?=
 =?utf-8?B?SXJaSkdQNVJEdWhjamZzcVFsSXZGU25YYUlmYnBwZ1EzYkloOHZsMFh4Ym4r?=
 =?utf-8?B?OFR5eVVLTkd2aWt6N2VaUGlqMzh2K0wrTFdRekZuUWpoK1VBeEhiM3V4dHdV?=
 =?utf-8?B?dkZwY2wrMDBzTlVONGJmb0p2b2lvelZFM3B6b245ZEZ3SFpZS3hUUXpzcXRI?=
 =?utf-8?B?VS92b21oajZaL2RWZ2g3TmkyTjlMdi8reFhSZWJ4cUI2Zk5GdWNSNWlTQ055?=
 =?utf-8?B?Y0xpSlpQY1RUUTBuOG1jWG85QiswWStsZVduVWM4YjR4dkhlVzQ0SHRXdTJj?=
 =?utf-8?B?VGIzVkUyQW1LelRKakRCa2hyQVpickVXYVl2OUNtbnlxc0RDR0pTSDhObWJB?=
 =?utf-8?B?aitpbUN1Z3ZxWEdVTEdHN0MweGw0V2NRazlPZElST1U5Y0E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bzBGOGExVmV3WXdxeDZUd3dudTJwYTJnd2RkTWNOUWpvRzBYRVh0ejVBb2Ja?=
 =?utf-8?B?WDlveEFXMUphUGNhYVFaYjJ6eTJBN0s2bXdJYW5FdkxsdVA0UjVkWGdHS1Na?=
 =?utf-8?B?QUMwejlxTEpXVkVBbEgzeXh5QzY4UGNGVTB0TGJtcENaQ0h3dEtaWXI5eTAx?=
 =?utf-8?B?N0xhcHUzVmNwbXA1aG8wUHNHbnB2ZTc5WWFNRFNSaGsreDdVZlEwTG5ZQ3U2?=
 =?utf-8?B?WFNidDVzaXMrSmZvMGVKNW5NVjU1Wkp3eXgvZitPcTVrQk9ydTM1MjhWNkwr?=
 =?utf-8?B?dnBIcnJDYys2OFNIUFJOUmJEVEJWd0gvN0xoTVRlYU5jWEVXaU4xVmVMUmdV?=
 =?utf-8?B?SEo0K1JPSWtldExkd2lqRitTa3hiSjAyV0pTaUMzN2VvY3JrbkJCa21heitj?=
 =?utf-8?B?bWlQekI4cHNwcTh3QXFQRktBa2F1bFVTY3NnaEhjQ3lYM0lVa2N2bUNrbENm?=
 =?utf-8?B?d04ySnJIT0JOV1NmZ3hiZ1F6Ni9QM0czWmkyS2RJckxubUFpbnBFNjl1RGFG?=
 =?utf-8?B?eVAzQnZjdkF6OVJFQWxXUG51K1IvSUhJY3A0RXZ1ekJLU1lLRzZ5QVQyVENh?=
 =?utf-8?B?Z2RPUm5Qa3QyaWdVL21CaEk1bVVuME5HMmE4ZG5KTFlTejA4WThwNDh1dXlo?=
 =?utf-8?B?cDQ0SC9nR1VlVFliWVJna0Mva2c2a0lqWnk0S2FYanJiRFM3c1VudTNiTVJj?=
 =?utf-8?B?Z0xDNmp2Mkw5amxhQ0ljWStFUmRuQWZGd0NYbmhBNis4b05RU1QrSlU0Vzdp?=
 =?utf-8?B?T0Zza2xsazcvY2JDOU1BNWUzSWY5b2dLT0RYSzIzNm9RK1ZLRFZ6TVZsb1ow?=
 =?utf-8?B?bVFuUUJSaldReVltZGlnZFJXc2JnaFVrcjhHMWxxMHRpMFBSUDFGZnMwV2JE?=
 =?utf-8?B?TFVNUWRnZGhjRjIvNUFzRFNORTJYMWlPdEc3T2M2UExPNlYrVWNoN1dHdkEy?=
 =?utf-8?B?RmlvUXhNTUFKa1lRdEhwUjlhdjNKNEs1bEJWRTdwUlpCVmRlVVJyWlBTMGZP?=
 =?utf-8?B?TENXYzZ6UHJ4NU1HRHQvdnpmMG1jbFp2bTkwS2xuS1pLQjUzUEpHQjFMd0V4?=
 =?utf-8?B?UWxVYUdzRWFvL3lFQ0Z4RkZKNm1JeXJvZW5PV1JNSDBJMldXTXR0S282ZHVB?=
 =?utf-8?B?TWx6aW9KckNkd1NHWGZIQVp4RUV4Wm1DSWJxeG1XZWIxWFYxcThaclNKckY1?=
 =?utf-8?B?OWZzUWc5OHM0MGRHMW9uK2FJak5IOGp0dWFlNWIrdFhLcWxkekNZNTZhYXo0?=
 =?utf-8?B?TmRtQ1EyTWkzQnpSMUROVXN0bnJnNnRvT0MyWFgzTmFUcGlNSnRVSXFxKy8v?=
 =?utf-8?B?R0hyNldoblVPZ2N1dmtzRE1WM2tHa1BEajZiOFk3N3kxSHA4OWRrVTA5R00v?=
 =?utf-8?B?M01nYWp1cytXaExEL0w0M0JsQWhHdzdoNEw3TVlXL1hlWlpzdGhUYkhLcjFa?=
 =?utf-8?B?MkVNRDlNNFNnbVMxU1pzWnFLY1ZoTHBVV1hnNkx1NE5zRUd1QW4zTVR3aGNm?=
 =?utf-8?B?cVMrS3UxbC80YVZkRWVFazV3REg4M2YvaXN0M25saHk3RndyNGc3aDluTHFq?=
 =?utf-8?B?TzFQbXpJNWphZWNTdWFnM0FEOHRCWmFtSDBReDRXZ0JTamVacnExcndNSEpS?=
 =?utf-8?B?U3lNVmFvUW9rSG1YdURTTHJQM0xkMElZa2NIZ1QwcDlsL1ZhK1dFUnY5UWlU?=
 =?utf-8?B?Wm90U2Z1L0ptRkkrNDczZ0l5SGxmUVRCak5EZXRPZ3BPRDYzWTVsU205VkZs?=
 =?utf-8?B?NlZZa25qTjUxU0JHaWNVT1NaTU5iY25zVFc5TE9haXYxN2R2UHdEMzlaNTR5?=
 =?utf-8?B?RUdRRy9rOGk4YUkwQ3dJdmp5RTNyWk5JRVVnQSs0SnZ0UzhwVkdNc1lNM1VI?=
 =?utf-8?B?cVR3YytITU5QQXpFczFpbG8zekVkMkFmZ2s5NUtHdThWeUdsT2VRZzFQT05D?=
 =?utf-8?B?Q21GcGxNdkM3WlVQS1BpTlk3UTB3WHpGanJwZlpmc0NLemJURXQzSHBwdjhR?=
 =?utf-8?B?UXQzYVcrUjVHYURBcDV2SmpkcVMwQ3R2WURlQ2pZb01tWmdqZ01CRkhYakNw?=
 =?utf-8?B?aWdiKzJqYnpadHVPSjByTE9qUC9yT3lYWW5RQ2R0cXR3ZHJwd3VVM0ZyNk1G?=
 =?utf-8?B?OHlaTGhPdlBqRlRRQnJpT3BYN1BkSjJsVm1DSzhFcjVEZ1JZUTJxOEh6akJl?=
 =?utf-8?Q?sarjYnV7mSWHMgmnCaJ5jz8=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 177146ce-b512-43d3-20ee-08ddd54b8b55
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2025 00:44:19.6609
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +kbXiei7pZZaF6QIELJpeJPg2lFSd70Y1TkEQ6ifIi9nwB/Aa2VhLpobNS4o2kXojTUtEVPbwYQAkrjF0vTY8CfgzWoc6ixAmGAZ45airus=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR01MB7671
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_174424_201920_81E842C6 
X-CRM114-Status: GOOD (  16.36  )
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



On 8/6/25 12:20 AM, Ryan Roberts wrote:
> On 05/08/2025 19:53, Yang Shi wrote:
>
> [...]
>
>>>> +    arch_enter_lazy_mmu_mode();
>>>> +    ret = split_pgd(pgd_offset_k(start), start, end);
>>> My instinct still remains that it would be better not to iterate over the range
>>> here, but instead call a "split(start); split(end);" since we just want to split
>>> the start and end. So the code would be simpler and probably more performant if
>>> we get rid of all the iteration.
>> It should be more performant for splitting large range, especially the range
>> includes leaf mappings at different levels. But I had some optimization to skip
>> leaf mappings in this version, so it should be close to your implementation from
>> performance perspective. And it just walks the page table once instead of twice.
>> It should be more efficient for small split, for example, 4K.
> I guess this is the crux of our disagreement. I think the "walks the table once
> for 4K" is a micro optimization, which I doubt we would see on any benchmark
> results. In the absence of data, I'd prefer the simpler, smaller, easier to
> understand version.

I did a simple benchmark with module stressor from stress-ng. I used the 
below command line:
stress-ng --module 1 --module-name loop --module-ops 1000

It basically loads loop module 1000 times. I saw a slight slowdown (2% - 
3% slowdown, average time spent in 5 iterations) with your 
implementation on my AmpereOne machine. It shouldn't result in any 
noticeable slowdown for real life workloads per the data.

Thanks,
Yang

>
> Both implementations are on list now; perhaps the maintainers can steer us.
>
> Thanks,
> Ryan


