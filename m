Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E262C44500
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 14:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BD9GYw9ihqYik5miY2P1lq/yLL0Vjw9/KmsnegsiKOM=; b=gA8Wni4qooBjJb4Fna3QDsZIRU
	PteUrvon6+xK4Covx/A78GZrRv4En/89835sXo9h0Y+qlhN0EAWRb7rxDl+nXVxtRoTIP/cu/+Bq9
	1izATDzcZuAIxuLhl3GfmHyj+SFbNRybdtOvxsBY4uNeCvLmWdg9DGM60qPUqwVGXuij4Jrrb8tU+
	fM36mRnHanhrj0dwU1ukeXurkJClmdD0x9oJfh/Qfwks+zR8sQblCw24uhbv4d8hm50hHhiTrxouL
	Bu4Ubr21YuTmlx3gMpeYCzCTXU1zqlp/Tnga3/AdUhd9f91NO3k3rbl5Y/eY86whuKjQxZ+4tm9WJ
	PUVPT2sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfIho-00000004hWG-1HDW;
	Thu, 02 Jul 2026 14:47:56 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfIgt-00000004fHG-1wNk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 14:47:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783003619; x=1814539619;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=RC5j0GhU3ujEvHzgiX4dxMjKu0f4PJGLFYGkAqFeDrE=;
  b=SN+UFNN+hnsPUb6exnibNcfIm77xNU4714efiYD3A/UAQXczVO/uEwQ2
   RIxKW05cAkULhxzOAwfDKV2efGGbSQKRPmCHeoN1xTfljR//X9bKjmOV/
   9vi11mgtFH9Dsu9EBS3RANbYrcLs7oIisRv/6vWhiH1FK7pj1fT6vW6yr
   axy3V9UxX56Y76w01UXJcBVPATZXQq3TUI2e1zi7SY4JnCtK0SgiY+K4v
   HE4FlBGegSHvmAZNvIUgSbZVIhbQvWUQWSRtHUVtkRGVVH25I/biShLkw
   C0w2dPW6JZ7+Vri2eCzWmbQu6tQKBZJqB8xLtf8cfKvQWuKOToOQAObXo
   g==;
X-CSE-ConnectionGUID: 1WeitR1YTM2iSCJ0aSFSWA==
X-CSE-MsgGUID: mBPljwgcSsCGpf6YJSBJ4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="71281126"
X-IronPort-AV: E=Sophos;i="6.25,144,1779174000"; 
   d="scan'208";a="71281126"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 07:46:58 -0700
X-CSE-ConnectionGUID: BidCn2nPRhu/UXJ+yLb8Aw==
X-CSE-MsgGUID: HZIvwnwTS5+GeyTnp6AMnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,144,1779174000"; 
   d="scan'208";a="251817654"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 07:46:57 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 2 Jul 2026 07:46:57 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 2 Jul 2026 07:46:57 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.41) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 2 Jul 2026 07:46:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=reCjq4uK+cFKgC7ug01/1mYCski4D12MmzcyPQyD5A2LGUAjREVarptMzJBMDW5c/8THmYIT+1am801pttHB9nOaAStP+efmOSoxo894wic69168S0yWiZXUe0GFrKFwgOhxidaXb+DnnJQ8zATeFT41wO7wkbWRGLg0sCyAQoE/VdiF9tjGCY1TxhHrJ5FZPFkRtkZPT/E6xl46SXzych7QE90pAKo+l3MR1zP8n7TFlCCmqftQ7wnPZQ+Yk5t54Na5mfofCD/BH1xkJ4Zq1LFQd03ShUqxXZQg/5vx6+MVQQJV2H3Lf3+H2rdFmN9gB55POcdmbyiIuobmDFgt0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BD9GYw9ihqYik5miY2P1lq/yLL0Vjw9/KmsnegsiKOM=;
 b=qS4IPJThXIgNPIpzQRVV5lxLnXHQujdsSsbNeW+oyczqjT6GD4t30UIbpJhuR8uEsnOGIHzdSD58J15pfgs+HZh0TQgfHfjyngK09zoPuyDFP3yWP/SOV08UGgiDeG42N9buw1El3kCdrypDqRxSAG904h8zKa4SrR9F4UcKr8FC/Z6oh0uShkU3zFo8eYsDSYH1gho7ntDKMIY8iS1WnW02Ha/T1euThGNaA/zjMxKvVPjn9HzP9L+HiazYiVvzMiUl3Ky8Z6UEbGDckBQVg5/u/QiKvR7ZVhUxfRuHZ4bO80lIKva6dLhh2ZbZ7DaQ1+GcGV0geXqcWlViFlMGsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by SJ2PR11MB8323.namprd11.prod.outlook.com (2603:10b6:a03:53f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Thu, 2 Jul 2026
 14:46:49 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0159.018; Thu, 2 Jul 2026
 14:46:49 +0000
Message-ID: <b2dae9c4-d0b3-4ec2-884a-569020039b5f@intel.com>
Date: Thu, 2 Jul 2026 07:46:46 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] arm64: mpam: Add memory bandwidth usage (MBWU)
 documentation
To: Ben Horgan <ben.horgan@arm.com>
CC: <amitsinght@marvell.com>, <baisheng.gao@unisoc.com>,
	<baolin.wang@linux.alibaba.com>, <carl@os.amperecomputing.com>,
	<dave.martin@arm.com>, <david@kernel.org>, <dfustini@baylibre.com>,
	<fenghuay@nvidia.com>, <gshan@redhat.com>, <james.morse@arm.com>,
	<jic23@kernel.org>, <kobak@nvidia.com>, <lcherian@marvell.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<peternewman@google.com>, <punit.agrawal@oss.qualcomm.com>,
	<quic_jiles@quicinc.com>, <rohit.mathew@arm.com>,
	<scott@os.amperecomputing.com>, <sdonthineni@nvidia.com>,
	<tan.shaopeng@fujitsu.com>, <xhao@linux.alibaba.com>, <zengheng4@huawei.com>,
	<x86@kernel.org>
References: <20260520212458.1797221-1-ben.horgan@arm.com>
 <20260520212458.1797221-6-ben.horgan@arm.com>
 <4b0552cc-85cc-40b6-ab65-6b7620149f74@intel.com>
 <0ebb1365-9883-4974-9e8f-05c2eaa01fb1@arm.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <0ebb1365-9883-4974-9e8f-05c2eaa01fb1@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0333.namprd04.prod.outlook.com
 (2603:10b6:303:8a::8) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|SJ2PR11MB8323:EE_
X-MS-Office365-Filtering-Correlation-Id: 63afb3d1-891e-4c0b-934c-08ded848bf12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|23010399003|366016|3023799007|11063799006|18002099003|4143699003|56012099006|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: 5BX/i81hlSQpKUklEHt3lsVhoILxkVUi2aP4zWDITkCDdY8Jxw77y8uhek9okv/t7hFJQnLesnuDYF9sNfmqH/uVjkQ1r4B2qeeHcOemOudRkeEs1dMpaA4P6R3l2fGQgpYsMwLtMZf4RUaB7A680oZJ9jbyMC1/GXhYpJB6QrL3cgmGxVIre27hEe4ldmDwGP5wbO1nG8O07pS6aUWxHr7LN103ADkA74e/2ORH6UL8Hv+GqY48ecIz0hoQnUXeeuSkIXMv11WaIulKmr4IMJBRy8MUZtpg0yOof49xMegTxBaeKx493sLu+8UzofAqZiU4H30oAnIIn86t9XkbSDOIqIJWoUFREzhXLUvZ0NGTl9XFbunEwoEOt0aHVjJzpRy73hgG7siRINEOjeXwFPkPg078fnWMHdkrx2jlCHwsj+aFAZO62P3BnB4Prbs2OdJmBOjl5Lohr+J5p2erktHhD+TtanMdh3ASUFNRX6/dhv4GUUVCa1XymXf2RDAjWdkwAgFSQRpCVWZiRYJZi3fhOGEwuq8AB/V3OY++webC4L9JnBtJm9/KL+J20GzkhbfxRDSVDSrMxTVCR+A+qPWyj7lWDHpWcLoQx4kg9f6/2nPAmH2CDEhZ8ux4tS31z0OqxCbsaZbVC1lkNGVrL4Xqwv+Na/5ItJLDGszFaHg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(23010399003)(366016)(3023799007)(11063799006)(18002099003)(4143699003)(56012099006)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UmZXK0VtQTU1RHFxN1JJcktBOExUaUtlWk51ZjVQSWhiQ1FBTEhCUk9OS3pB?=
 =?utf-8?B?a09Wek1FcG9RalZzREttaWNxNVhJcUxMNnBMUlpERVlia2xFckhwK2dXVFYv?=
 =?utf-8?B?ZGxDM1J2ZE5Yekkxak9jTVJhdDRrUWx2VWgxY3o3V2hEaElNRkpwRDBoOGtL?=
 =?utf-8?B?ZkFxK1hKNHdpZlJpbVVZMHZmUUxwdTV4dUgrbTFtUS80akJZRExmQkNYd2lX?=
 =?utf-8?B?ZG15NnQ4OFFMbmpqaWdUeDRPNktGdXNXVDRvek4wQk9EUGFZUS96Z2sxaVZn?=
 =?utf-8?B?TFhkeHJWWlpBMGFCWlpEdzQ2cThkbmFGT0FyVEl0dFV0Qm9LSVZrNy9QcVlt?=
 =?utf-8?B?MWFuMjJmTHFMZG44KzQ0UGtVRU5PQStuQUtncjRoOGxHQnhmWWdsN1V6N1Nu?=
 =?utf-8?B?Y1h2a1BJU280RXpmSFNiNjR3VnY0ckJTam5DRmpZSGMvVHdQYXNtR0g3dGh3?=
 =?utf-8?B?UDlTSmxoZVg0bCtxWHBRU3dFbWVCbGNmUStHUTA5OWdKRnNuaHllUUlrK05y?=
 =?utf-8?B?SHlXOHFZcVFDbVdNOWl6VlZ3akxXcnQ1N2JwVlJJYnY1ZUNDMHVKQjZoVURx?=
 =?utf-8?B?RDVHNXcvZHZ1a3ZNL0VxRkQ3aVZWTyt0MjRrR3NoT3dCUXV0SzBiZW5aOHJE?=
 =?utf-8?B?cksrRHVpV3gwTU5xb3BsdGRLZUhWcG5yenBWYlZ4Y1RmcE02cUt4WGdmVGNJ?=
 =?utf-8?B?aVRTUEhBNHV5dHJyWVRLUFFOYmROWWhMQ21JWWdHRUtXTDFWUDhyU3lrZWZJ?=
 =?utf-8?B?N2Rnd2VzUjNZRWhkMlpkMlVsbldmdDZTMHRBUjR2UDhSWXUxWUt4ZzcxNHY0?=
 =?utf-8?B?MGZuOUE1aVpRSElDVEpXa05xOHZaZWRMSEVzSTdVbExBM0FmOEdJVmNyNXRX?=
 =?utf-8?B?TytIWFBlRjI5WnZ0aGZRakxiYi8wL0xKRExxZG03UmhnU0FYem5FVE9YQkht?=
 =?utf-8?B?K0R6bmIvL3NmdlUrM3RDOHZiL2tVYnBYZVl2Sk5Ic2FOTzVBaEt2WE0veUdP?=
 =?utf-8?B?MWt4Q0xQYTNTVWVUWjNZTTE0aW5LbWw4OFFWOTNPK2dZZGhsSTZ0UUFGd0Jo?=
 =?utf-8?B?NTI3eVNna1h0UW53WGl1cVJYWTdwMTJ6c0RueFpnLzhXRkdPa0RTenVKVUEw?=
 =?utf-8?B?RkFhR0ZMUkxLL3VxRGR6ZUFWKys1SmdiYk5uUThwdjAvU3BxQk5MQnZGbXlQ?=
 =?utf-8?B?RHkzd0h0a3dNVGlMKzBuaitMQnpRYzF4SmxoRXMrMTFNbGVPOUVtWi95N2p4?=
 =?utf-8?B?NWpoZ2ZUQWFpaUphMDlnSDMyZXlMMWpJUTIvYkVSYjl1ak9iNk5MSFR0Z2k0?=
 =?utf-8?B?WkpMOG1qa2RkNmV0Nk5GaDE3ZTdFdmgvZmxhdktJMXF3WnJqRE1TQ2hESHNQ?=
 =?utf-8?B?UDFOekR1WThtSm84L2NnaTk0YmROb3c1MDI4RUtmbTJPQ3ZRT2puME1vOEk1?=
 =?utf-8?B?cWwvTlBkakxQMHdhR28zaDFRRmYyNzVuZ3huRnRCOUdzQldzQlhBSGRFdldT?=
 =?utf-8?B?VElLYWpxcFBZdnZpVXN2Tk9mUUlLT1FLbmkra2hGbExzWEE4bGxKak5maStY?=
 =?utf-8?B?TFlCTGxTMzlIdUdWR2FpVDBIa1MvTW4yWkdkM2hwUlMrUVZnMmMvSG5ZYXJ4?=
 =?utf-8?B?Z3JjMlNFa0pjU0t4V2ZvbVNFckNsa1JNR2prTjVZOHNTSS9jMTBkRy84REFh?=
 =?utf-8?B?K3FHd3UvNkF6OGxlVy9UcTJEUzAra3dSNGNSUXNweWE0UWRTOExQTEk4ZGJL?=
 =?utf-8?B?QzN3ZjYrTEd5ekp0T1ZPVHlEUmtNRVZObTFlL1MvL0R1bmM5OERsZUU1RHlW?=
 =?utf-8?B?WlFOdWFCTXZTc0hZTTVxSllpdmtoOXRDa1F2N2JXUWRCTlNtcUFrc1ZLQXdk?=
 =?utf-8?B?VkdpWmlMZm1jSDljeGVIOFZLQnFuK3ByVmdDZEdVQXJnUHQ5TGtjanpjbXZL?=
 =?utf-8?B?dEdITzFROHk0dVFWMkRWRU90TGpvN1Urc1hSWW51cHVWWUtGT3RQbzg1dTlk?=
 =?utf-8?B?V1N1cENucnhmaVdCbTJsK0NRbW1nNWRMblNkYlhCMHB4ZU1hYWRhZTluYStL?=
 =?utf-8?B?WGNBZmRzZDZUUWpIRnZQNWo3SndLdmxZZHJZbkdORFlzZnJ4dTh4eFI3Y1hH?=
 =?utf-8?B?Q3AwU0lUcWpzcmlVZXRIbG9hVnIrbmpPVHpRQnAySXpINzVjYXI3dzhsck1H?=
 =?utf-8?B?aEkzZzJLNjVRV0Q2cXlleW1SV0tkS0VheExPZDFWdk4zb29zcFdQOXdRbTQ0?=
 =?utf-8?B?dVl4ZG54dE1kdEc3M2RRTnZES2JRdkkzL0lZSWtxSUw0d0JoTnR6anM2OTNV?=
 =?utf-8?B?KzlvVlFrcFoydXoybWpVL1JYNVdoTHk4V1pyaTB4NTFhV085VURXL1cyRS9X?=
 =?utf-8?Q?+NEN7Dk+WTgQjAP8=3D?=
X-Exchange-RoutingPolicyChecked: gV9NjyrbFdqoAV7El3NAuAswROUWUUyry+fhP/bNIm1A1zJHzpjhjeIc94RUS2g2u70vdcJJoNy6T7PH6Y3wmYmoFAOegz3xsMuDBcZpSsKTnTxpk5YnGTygrM5bsXz3Sf3dJzJmBstfANeMGLPx9GwNtF6dKafpHuHgI0MpuEXH5hf911xXrEcoshzwaoHu1ZJoaxxj8b7P6XpDx/I3hzFNcjPBtCjCXGetiwnypN3+YuApW4+P1LeeD0/xrodXpCwXfB6IwZmi/BknTdDZextGw9StpQ6YZwXvBYJTsEUdk16RKC13sYW/J8v604dUD/oSrKmOoEjGL2mznKDMzA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 63afb3d1-891e-4c0b-934c-08ded848bf12
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 14:46:49.0152
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mhWHVk9BVWaxjPiXQvHtp3EqlaqMYrXi/96zgp702QUy/kkb4SJy9KGTxIqtvEpSTSAb/Tn6KRPmozwzmnu5Q0HjZujepatASodUj8Ryj+M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8323
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_074659_664157_6811A922 
X-CRM114-Status: GOOD (  23.34  )
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

Hi Ben,

On 7/2/26 2:20 AM, Ben Horgan wrote:
> On 7/1/26 23:38, Reinette Chatre wrote:
>> On 5/20/26 2:24 PM, Ben Horgan wrote:

...

>>> --- a/Documentation/arch/arm64/mpam.rst
>>> +++ b/Documentation/arch/arm64/mpam.rst
>>> @@ -65,6 +65,23 @@ The supported features are:
>>>    there is at least one CSU monitor on each MSC that makes up the L3 group.
>>>    Exposing CSU counters from other caches or devices is not supported.
>>>  
>>> +* Memory Bandwidth Usage (MBWU) on or after the L3 cache.  resctrl uses the
>>> +  L3 cache-id to identify where the memory bandwidth is measured. For this
>>> +  reason the platform must have an L3 cache with cache-id's supplied by
>>> +  firmware. (It doesn't need to support MPAM.)
>>> +
>>> +  Memory bandwidth monitoring makes use of MBWU monitors in each MSC that
>>> +  makes up the L3 group. If the memory bandwidth monitoring is on the memory
>>> +  rather than the L3 then there must be a single global L3 as otherwise it
>>> +  is unknown which L3 the traffic came from.
>>> +
>>> +  To expose 'mbm_total_bytes', the topology of the group of MSC chosen must
>>> +  match the topology of the L3 cache so that the cache-id's can be
>>> +  repainted. For example: Platforms with Memory bandwidth monitors on
>>> +  CPU-less NUMA nodes cannot expose 'mbm_total_bytes' as these nodes do not
>>> +  have a corresponding L3 cache. 'mbm_local_bytes' is not exposed as MPAM
>>> +  cannot distinguish local traffic from global traffic.
>>
>> Hopefully we can get to a point where memory bandwidth monitoring data from
>> CPU-less NUMA nodes can be exposed via resctrl. When considering such possible
> 
> Thank you for your interest here. I hope so too.
> 
>> future I think it may make this work easier to build on if the documentation
>> focuses on what the current implementation supports and leave room for
>> future enhancements by not constraining user space expectation with an absolute
>> like "CPU-less NUMA nodes cannot expose 'mbm_total_bytes'".
> 
> The intention was to describe the current limitations but I do see how
> this can come across as fundamental problems rather than just that we
> need to do some more work to establish how this can be done and
> implement it.
> 
> How about if I add this paragraph at the end?
> 
> All these restrictions based on L3 cache are due to resctrl, currently,
> only supporting monitoring at the scope of the L3 scope. It is expected

How about "at L3 scope" instead of "at the scope of the L3 scope"?

> that going forward more MBWU monitors can be exposed to the user after
> support for more monitoring scopes is added to resctrl.
Looks good to me, thank you.

Reinette

