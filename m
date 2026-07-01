Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1467C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 22:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dx9Eyv3mEzQX8HvF0MKQR63uFP3BPp/PcHHkKsf1W5k=; b=N4sfaJnXVv+BAEk4NEAX/sLlH3
	Bt4K8Jch8RcFa5//lxS/w3/PQF7Yq13HoKaxmEJw9geXQ1cdSsPplRGL2OWOGjUCDoe5J91TPG4ex
	uSDwyYI5DrBuVmH7CXllvbb04ZxtD92zf+sYxW0bceq/Y8c4uS0yAN7ik6vrT0ZW/+D1sDLvyRs24
	wn6wChygqTV1WFjG4Kg4GdSmeXn1czNUqcwKai/HkGKm2IVNqiERjT8TNPae+t4OWcC+Ih6WM1vah
	FW2DqGbD0RTlFtHVY2n8ZSiy2MngUAA3WxdMo5GbxGfpM9SpXrX+F7dpKeokguJEzNLbnh1jz3ADl
	b/sEq0Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf3c6-0000000374W-2DGg;
	Wed, 01 Jul 2026 22:41:02 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf3c3-000000036y4-3sxu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 22:41:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782945660; x=1814481660;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=cRl3T5tkxbFQcLtdcX6/cgKv/MeNYqYtdAcDXlPIfCE=;
  b=LKaXsx54TUpT/n/UhER3+EdwetB35GZ1tJHV5G1cmyjlDqc1qGZk/dYj
   kk+5GpIxqcO9BBhEzVFJUbzpv43AWSjkmcL0UOE9mnRCJRfdJFFgTG6x+
   N+M4cQ99OXl1itE5xLsk0z7NXcHhvvcnmaeG8Hooauf907Iy49UgcUlFF
   /KddhmIZNzz3uh+ka5YXECvTvFrof+cTHyOqvkmR7H1L3YC9mpPHxTfC3
   KBpbezHvDyA0C5X9tcM8hjoeVsTmyX5MPqCZuCyeeNmeR4XmmnAqmFAQu
   1SKiN5e03wOinWfOntgNUPz2ebGiBfIS2h79wfDu7Nf6VH+itOvF0eTKg
   Q==;
X-CSE-ConnectionGUID: m+9TNPTpREmv51ROoybMgQ==
X-CSE-MsgGUID: W+vfDgVFQuOr6wsE49chFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="87370739"
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="87370739"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 15:38:42 -0700
X-CSE-ConnectionGUID: 76N7naHiT5is8HsiuJMLKw==
X-CSE-MsgGUID: x4kzALH0Rciw4hR7NSFwVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="290809166"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 15:38:43 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 1 Jul 2026 15:38:41 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 1 Jul 2026 15:38:41 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.31) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 1 Jul 2026 15:38:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TQm6t7wQPXy5ZOf45zdvxSSo1Unix1jjnDFlzCkJY+Bvsfr8dHu2awi0tc2QdcYtIsCJjKezRtTiCm4fwXM70yB9Ivg9ZMt1H/Rc5JProdjsohz9IoSyMzcNTJFAbFL/WoBCoWuAMRq6f62QCs+UavefSeNdd7ZiqEc6B/uTg64NtXVG9gPAVNWjey6BoDjz/C9SwMdasbJkJriBPVaWKHc0lur+lWOJpirzaJ6mwTF05eD6bOCDhKxqj6ETj0pTLSxfzoL4NXNu3i9bScvbHsFTYd5lteN+lTwmRZxwg6Or3u5qtiWRsq6USP9sSsyWlxHLy/p90TwXgePH5Lz+Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dx9Eyv3mEzQX8HvF0MKQR63uFP3BPp/PcHHkKsf1W5k=;
 b=Q+v8IHt51C+Tu/tSMUJbUsFerAUVyZ6wkOAXmAGZ0CtE4SaR3kd0F/nd6z0rpkJV18hLdhmEHaBjb0EgjHx4sK/UhvlLUVq7lOJ+e7Nvz8JwNqcD/j+RkHegjjFP6EeXOG8JddQYaTVqaAgo52t5o2tg65myhYgkOPdx8RrIf86+m77OO6tO/nMKP+n+/Ol1uOVEHq59gmM/iQKZL/VstL4+EbiplgHAxAAHrhGy31zIo4bxDg2N8ccQZa8toEPtLJa6VOfP7TI2H3X5IozJurX2XiIHDyosouTixGrZgJM04ytUr/AcxSkB7VbviRyNohfoJZE5c/+XpuAOFjKtAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by DS0PR11MB8135.namprd11.prod.outlook.com (2603:10b6:8:155::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Wed, 1 Jul
 2026 22:38:35 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0159.018; Wed, 1 Jul 2026
 22:38:35 +0000
Message-ID: <4b0552cc-85cc-40b6-ab65-6b7620149f74@intel.com>
Date: Wed, 1 Jul 2026 15:38:32 -0700
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
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <20260520212458.1797221-6-ben.horgan@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0343.namprd03.prod.outlook.com
 (2603:10b6:303:dc::18) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|DS0PR11MB8135:EE_
X-MS-Office365-Filtering-Correlation-Id: 628e2f07-475e-493b-f5dd-08ded7c17cbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|23010399003|4143699003|6133799003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 56wu/xPA5k4UNECR/8N2F4Zl38C6bvYw9kgnh0THZmRWrmPr4B/5SI/KBMAioOG7njFH4YVY6aVpiSqfVvKJFVmFkh5rgGk4N1MUvyuW9TsuV4PQsvciQzqTE1I5AcwjRWWl51GPAL/qR4+luSPYjERcyFZehW+uvsWAbJ7F6agkHJ8mr5COTWmEo1kJfwPaIDGmD6ZzhVoqkXobhyUtQ6QUM5dxUYszS/9yDH+B5KNAjI07jKVIw7fbvZiuB6PgGslPLR4SSmoVfmrX/BU9RxwDs67UhqkLt8dhHq5k6wwpFmMKYKpgbdQj6pqtxaoMzVeRLKtzj+VP2iV9i/FXmdv95gDRPzgzBO+pJfV8+4xTHoQrV21NfSr6EDQrBmbitc1IK6hhzQhbbOAjcsd4SWAbfH+X92A8bzZZxoygiSjsqKLdiYDoK1f48BzDWM9sXFOM82VOap+ENDxEJL1eDwNY8PzcTc3zHJhp2j/0YJhHVIgn4Fef+WEbyhxDjg+017r2mWYTGovyiO1xlovTxfO66N/+/Df34/EUA3ttezay/l7w7XWeCp9pi7D+ImcgB25e0LUSvQUhoD7stxpx51Ofn6YPiCL5JfZ4H5RBICTXY/P34yx/Jyi6vOwBgmBVROtAlZD7jYaM1Y82W53drKId8EaSKIn/sAHIHC8KNRw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(23010399003)(4143699003)(6133799003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWJuS3JWenVJRThKei9GemNxV0hWNHZEelUrTHhmRGdrYkhkc0s5aDFhLzVU?=
 =?utf-8?B?bzczVnhGNkM3Ti83VjlCaHVPSXZucUU5Q1BMNmd1MVdiYUFJL1dPOVVva2tR?=
 =?utf-8?B?aDlzWXkwRUU4WnAxWXZWSFZhcTJ4eVFSWEJaYk1EbUpXN085OVQ5VkZjK0Fx?=
 =?utf-8?B?cUsyWlo3RjNwWFZOajF0OVhMaldjc1NZNFlwYSt5L1UxYlRhZGZHTDc4dms2?=
 =?utf-8?B?bTRMQTZCT2NPS2VVclErcDVUNFRvRkVySG1DWU5kOTRNUHNoK3RiWVc5UmJN?=
 =?utf-8?B?Q0tPeUV0S1dsUGtRU0ptQXdUQXdESGcydFYvdkZwNGU5WVdLUk1WeHlFN1RN?=
 =?utf-8?B?azZvY2hrd1NML1RNalVYbzc0SER6OVIwQ2lRQnVDVGVyOVp1VDYrNnZnb1U4?=
 =?utf-8?B?eUxrNC92SmhSaWIyRlZwUDFxalNwUURsZ2VBQ2hoSS9DUUd0UHFWV25VaHAz?=
 =?utf-8?B?R3crcVhjWHZRTFdqR3phN2xkMlJrcXpxN0NqQmd2NVBucG8wYVZoZlk4SWQ3?=
 =?utf-8?B?VHFtQk41ZE0wSWZ1dkU0VmZvNEozR05SZy8yVlBoZFJiYTRPVDhydTdCNlY5?=
 =?utf-8?B?NlFFM0tXTC94TEFycU42dUtnN1NIRzFmZWU4RDRGSm8xOXBLMDB4TmNDeDlU?=
 =?utf-8?B?Q3RaZnd0eitmcnplaC9TSjVLQW0veWQrRUd5ZDBkYTV6clB2L3U1Uzc0MmxB?=
 =?utf-8?B?TmVvMEhzNHVOK3NxM2pJbEYrNGV0VXA0WXVOVFdRK2NNMXRtTFpkYndWckZ1?=
 =?utf-8?B?amVWQ3lESjlXVnlMdkxYREROQkFMSENwODBCcFNMQmRzV0hTVytMNVV2eDlN?=
 =?utf-8?B?dGpiTkdMUWhNb3FVUXQ0REhYeVpwZUlKZmowN2ZEMDZYdCtTVjZrd1diWTZn?=
 =?utf-8?B?QmFhb094enlYcUlkaWwzNDRRQW1TcDRjOHlaYTM2OHM4dlJvTS9Ja1FZc2hP?=
 =?utf-8?B?aDhZSmhSQWplSkZHY0t1UWx0QmRMc2hTKytZOTRqSG8ySXY2aW1BUlI2aU45?=
 =?utf-8?B?YkxoaEQ4dXV0VmxPV1JNcUdVNnJQNiswZFVxWTBaWEViU3BHRCtVOURGejlG?=
 =?utf-8?B?L0RGMHFTTDF0Rm5JQ1ZoTU5zV1J3NlFCRzJMR3F0c00xMUNMT3ZNc0IzdmND?=
 =?utf-8?B?RmN4eWhMWDl3Rmg4T0g2KzV4SUFnc3NnSjBnNURDRzRyQkxJTkdlY2xKRFFj?=
 =?utf-8?B?T1dRZ1ZTOFdOVTVXL2hvdTJkZS9DK2ZwSnBEUTNpZi9DMmZjUTVETWxWOTZp?=
 =?utf-8?B?OGE1bis4ZThUUWUrZkltZy9kbzROd2ZPK1VtY0VUa01SQmtGVnFWRHBiU3g5?=
 =?utf-8?B?SUhPOGttSDZxejJINXRHQVY5RTdCUGVHbjM2Um8ySFIrRUoydFYrSE5lbVE4?=
 =?utf-8?B?MWpvMVFsRWtSRDhmOW5USGM3bWRkWGQ2MWNROFhDaUNRWk9JUTgvWnFVVkZi?=
 =?utf-8?B?cFFQR0pOV2gwUmdzVWRWTVNqakVTeGczWiszQUFLaG1hSXo5TEdsWmh6KzZ0?=
 =?utf-8?B?QmJJTm0yMHorOEFPL0sybzAxQ3BCVEdLZ0gwWTRaOHc1ZVlJKzl3Qk5GbzJl?=
 =?utf-8?B?eXliNHkvR0wvcW1vVzNZNjlDQjhmaVRnRmJBL1VDcy84c3BjKzRIRmRmZGk5?=
 =?utf-8?B?OGVUbkh3NDF1MmZlZllPbU84akpQc3IxYnJ1RmlTQWRhWThXUitqb0k4WWdF?=
 =?utf-8?B?REYweWVWL2lQZTlWZndQQUNnQXRRVkw2MDdxSTYxVjdkVXlIcllnbnp3MCtE?=
 =?utf-8?B?UmtiamlaVkE4eHg4dnpUMm91c2ZKSnJjQ1I0UHE4NXE2cnd1cEo3SnFYTzdw?=
 =?utf-8?B?RTkvVEpoWGVIOGtQeTFMdm40TythdFFhNE94b09VOVpZbk5JQTNpUkNuY2Jh?=
 =?utf-8?B?OWc0MTNZalc3azBBaEJvRlhwa1pjN2JtSFNVRW5VUlV5OWRjT3ZhT25qckFs?=
 =?utf-8?B?Vmc4ZC94MVJUMWhjZG1pZWxXbUwzaGpqbFN5SmZlaUFobVdSK01WRnFLODcw?=
 =?utf-8?B?RytDQjU0ZkVMRnQwQjVCNHdDQWR1RWJ4cUEzdjFTUzFXMFV6K0E2d08vR21D?=
 =?utf-8?B?YytQb0hZaVZuaEQ5c2tQU2lhdEJQRFNLYi9IazFQa1dqamdRS0lhcjVXVnRH?=
 =?utf-8?B?WnM2ZmkzV2FiMk5qWUUwQ1VqOWVNTVRKT0hXNHFOTHM5RjkycDRpeXpRcXhJ?=
 =?utf-8?B?L0pkZFFOS1c3WXFJTFRxbk5GU0FCd3lnQVRWb2lyVi9HRlF3ZEl4L1ZzVUJF?=
 =?utf-8?B?bnJMQ21aNnFTSWFTOUFDY09uSktXdGs3WktpNm5KeVFhT0tOK25YMk0wL2hS?=
 =?utf-8?B?T2xSdjhQS3RrclRPVitNOFVCck1JdVhtL0lzR1FSa3I1U0UvYmZJMnp3ZGVZ?=
 =?utf-8?Q?/KfSa0ovbBKH9iPE=3D?=
X-Exchange-RoutingPolicyChecked: M3NscZ42vfbEO+80QO/g9XABiNYotTXsaEf5LvB3u9pbQ+FZQNGraW2PdHH1Jj2fSyz4LRfChmdaM3vlxaVReXi6PuRZ7bxM/uDQsJatmeoex90zuxlUbtMhp6atXzAnjSGfYQNlb4DviQVp/aBUG+Zm69LxgWqeb568cu1R1+vHny46S3eOX5W8OGiHsVWdAnpyiHFbLrHGui7P9qetNVyUTGFcXoE4io1gaxiYJoWoAnNY5m0zjzR1tT6nPI7/rPlOkwzyMfI55xZ3EkGfL7CsC2PX/YfhAHOWZ/db7Agylzy3xMp+29sZK+gJbdlWoFYlG1E2EnQ3pyo7j30KqA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 628e2f07-475e-493b-f5dd-08ded7c17cbf
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 22:38:35.6468
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ep9txykCx789/RE3trt1iwu3LQWfMj5RBaGRjapagkhiMoHvkMti7Cs3n74teAT/bbncW62T0rZh/GpcgBm6qn3dP3HoaGBTEvQQuclbCQ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8135
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_154100_037298_288C619A 
X-CRM114-Status: GOOD (  22.03  )
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

On 5/20/26 2:24 PM, Ben Horgan wrote:
> Memory bandwidth monitoring make uses of MBWU monitors and is now exposed
> to the user via resctrl. Add some documentation so the user knows what to
> expect.
> 
> Co-developed-by: James Morse <james.morse@arm.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
>  Documentation/arch/arm64/mpam.rst | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/Documentation/arch/arm64/mpam.rst b/Documentation/arch/arm64/mpam.rst
> index 570f51a8d4eb..208ff17068c4 100644
> --- a/Documentation/arch/arm64/mpam.rst
> +++ b/Documentation/arch/arm64/mpam.rst
> @@ -65,6 +65,23 @@ The supported features are:
>    there is at least one CSU monitor on each MSC that makes up the L3 group.
>    Exposing CSU counters from other caches or devices is not supported.
>  
> +* Memory Bandwidth Usage (MBWU) on or after the L3 cache.  resctrl uses the
> +  L3 cache-id to identify where the memory bandwidth is measured. For this
> +  reason the platform must have an L3 cache with cache-id's supplied by
> +  firmware. (It doesn't need to support MPAM.)
> +
> +  Memory bandwidth monitoring makes use of MBWU monitors in each MSC that
> +  makes up the L3 group. If the memory bandwidth monitoring is on the memory
> +  rather than the L3 then there must be a single global L3 as otherwise it
> +  is unknown which L3 the traffic came from.
> +
> +  To expose 'mbm_total_bytes', the topology of the group of MSC chosen must
> +  match the topology of the L3 cache so that the cache-id's can be
> +  repainted. For example: Platforms with Memory bandwidth monitors on
> +  CPU-less NUMA nodes cannot expose 'mbm_total_bytes' as these nodes do not
> +  have a corresponding L3 cache. 'mbm_local_bytes' is not exposed as MPAM
> +  cannot distinguish local traffic from global traffic.

Hopefully we can get to a point where memory bandwidth monitoring data from
CPU-less NUMA nodes can be exposed via resctrl. When considering such possible
future I think it may make this work easier to build on if the documentation
focuses on what the current implementation supports and leave room for
future enhancements by not constraining user space expectation with an absolute
like "CPU-less NUMA nodes cannot expose 'mbm_total_bytes'".

Reinette

