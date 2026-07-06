Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BE54C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 21:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZfitGOsUZyC1sEeeo+s0ufB1ngEzWJL14+auf643IxM=; b=popQIRw+qRQc1TVua10I5veDKW
	UTnAiB7/FHzigCB0V8eehxK3x16w6ae/7DxwfG0VUIXOwuSjq4URNy40K5RRbmRjC58jbrLVl/TlP
	PzSkMbm6S9aGRKAdH/Chxq29e0VLGDiOzk1Cz/KSqiJN1zj0qAjMSGp54olkp5Cl+QphrNM9CP6yZ
	KPlwUnHR+KBBuLevOh6T0fsK/zjY5LMylCVHoL2bZn/ZcR5d2XeihAc0e9k0MPmSwb5XI+VnScTid
	4kNr75ex4+q0iY00nbvG9r6ymvWQMmeOUqO1+NPPb26IZ0itpga/F2wtKOAX3bxIoOUJuHwlAFYI9
	CacsPe9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgqwb-0000000DeAv-3BYE;
	Mon, 06 Jul 2026 21:33:37 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgqwY-0000000De9k-39XK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 21:33:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783373615; x=1814909615;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=D4fEVN/KeliWUZurR2xD/BB81l1M80prDV/wytM9vYo=;
  b=k/AWolRNqMQUotAkZJu+fbvzsKIVO4jO4FjpRtKXGIIUHM757svDp0gw
   jP5zeMNa0qDTn5eNRoCa/Xv301RBks8/qJYWls/4KbKjd7S3wtl7qo4k/
   wJFImBuc6WbNnHVUQMfPtxhrbrsa44vQy9drAlWmkU/o2sYvZHva0SLkA
   SXN7VQCigH8MYAuxTTMHhs9WVYPfXDKUxU56AnxmkLpDUKKRR2VxMKX7N
   Q2l64AyGZgA6/I4lZLGUJJcs81Xfm4ICpN3MkHN++AdzbTgLX5DCz83I7
   zF0lkoUFVl1VjBbcTt+Z0fRFZKYhSZwidM/xa9h2inS5Jc6g0W8/npk/l
   w==;
X-CSE-ConnectionGUID: 1d1GH08bSDq6oCw+dUL1hg==
X-CSE-MsgGUID: /SdqsraxT5aiIJ9sIYCYoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11839"; a="87696897"
X-IronPort-AV: E=Sophos;i="6.25,151,1779174000"; 
   d="scan'208";a="87696897"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 14:33:34 -0700
X-CSE-ConnectionGUID: FiECwVLMQ+ejxmCDxrCDCw==
X-CSE-MsgGUID: 8zbEh2/XSEKEUFPryb1sxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,151,1779174000"; 
   d="scan'208";a="249828835"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 14:33:34 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 6 Jul 2026 14:33:33 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 6 Jul 2026 14:33:33 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.16) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 6 Jul 2026 14:33:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dx8SaQyVuiioznKYW+ZWAeuJ0U5TOfdz5wgeWOGp0e/KEFlVP4vtDdB5xDl+Qc5Z+4OeIikEE0PUFCJnluAfT+Q57PqwbcjH1oRAgJJ4D6Cdsj9Q1BTEDdkEBQ9GYyBuiuj0ftSum6OU90z4W9mWdHXY7Tmv9NzyKd0DPOopmd9LgiEoF3ENoBS6Ky1vXudSn9HQ/q2XmeEWZYHKp6iMdtvvZfMgvSeEeYOLYMXFmPuK99aqPApRP5JHFHbiMBIarO6WOG1bBtRSwWExSCcVscIoGlzx12UCXx+WVYeMO8+llv7lxE3E06ZeAcyaGNW7M8dHQ/nDIqHquKPHq2Fmfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZfitGOsUZyC1sEeeo+s0ufB1ngEzWJL14+auf643IxM=;
 b=fPII5JYZf2lZvxwSf2/p0hufvIPfqNwGeHQSVK18GCpa8MRvLSvj0POiDJeEBSZTvGj6ExiaBu6cbxMY3tU2ao5aDGzrs2zVnaNomZV/epRju1umEm+jJOANUXrE8JJEhqaUbQtVvFURnoNXtRDguSdAw88eWgJCgvj9LshwSexGfz1hpWN/xgoP6geWVQU7bXLt+x5kp0d8MIiL8lIXlEbjDU5nNSp0zrtuMzhtrYPa5K/KPpu0xFtV6ocx8/IA5Hzp1F5fuAsZj3sCAFkXSsZp8H/Slqcv1WIZ1zc4NvFtA4Q1LymbCJUFdO4iItW4SK+6MbWD99Oo6fd6qT+NIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by BL1PR11MB5317.namprd11.prod.outlook.com (2603:10b6:208:309::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Mon, 6 Jul
 2026 21:33:30 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0159.018; Mon, 6 Jul 2026
 21:33:30 +0000
Message-ID: <4c520a28-9a72-4abd-8e5b-654a312c92fd@intel.com>
Date: Mon, 6 Jul 2026 14:33:29 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] arm_mpam: resctrl: Add pass-through
 resctrl_arch_preconvert_bw()
To: Ben Horgan <ben.horgan@arm.com>
CC: <james.morse@arm.com>, <fenghuay@nvidia.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <corbet@lwn.net>,
	<x86@kernel.org>, <linux-doc@vger.kernel.org>, <dave.martin@arm.com>
References: <20260706160639.2136674-1-ben.horgan@arm.com>
 <20260706160639.2136674-3-ben.horgan@arm.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <20260706160639.2136674-3-ben.horgan@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0202.namprd03.prod.outlook.com
 (2603:10b6:303:b8::27) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|BL1PR11MB5317:EE_
X-MS-Office365-Filtering-Correlation-Id: 83f5763c-e980-4509-39a9-08dedba6394c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|7416014|376014|3023799007|11063799006|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: EUBkjwESRE2sqKpv99Eci8G2fxsa7K0irS4OnJM2BTWEclDic3NdWTvpRB4aMMFIivzo/16JSlC9h1omZYAf1q94qU+j09zDv5TO/1dPzPefO9Q/EkkkN5e/tiazhm2W55nqXzunL0SIhOqO82CJOnvUO3Vmd1AwLqi28QbzPJzU21pMr6wFz+4QHxhjQy7YvInvGxmAU6kOBVoYZ9Bl6Tidz8OhKnsG0Krhgudn2Jxc6S8F7m742Zyzd3Q17iy4vnEzBAOpF8IpoX1RjbY7uAVDFGK0kOrMw1uq+JLC53DqCKzfh65XawhN7dElS9T9EO91axaDbOOEhG9IC7yMOpmXqkHyWh2g++PtZ6QQI2T90Y/5AHbTY7uMXDYFPuB+/VniAs98A00qaEuAbUwqrF+czvVQP48pnHGUzQB8OJE+teJGWXYa++5+h3DJD1jSsqPBEFUK+ddQhuswfJIbiW4JzbnaUf7becVQ8L7SbfPaHJ2uu2RwvdkjW1W54XGcBagwenFL23gwiijC3qJqq99goGoqTi7NCHPG7qZ1gyhG+NltxStl7co0elF0JcKZ+a0V+/MzvrYRRtB1uNMnhTjCQykef8AOC6cT2VDROoJlUeSqAK3sYzac0/qJ33UliteBByY7SpBH96hSzp2JSDnzHQBWXdcjvZSYXavX5r0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(3023799007)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eDhDLzBFMXp5Ui9aUHl3ME5vV1REeGlFVDVwTHc3ektTYWpmUVR0U3BkTlg1?=
 =?utf-8?B?Nko3VGQ2emQ0T2syaWRKWFNwQjdBU3lBOTh5NXdjdlhobzg5ZHdmM2RxM09h?=
 =?utf-8?B?UHZZa1NpcWtycTZ4K0JwRGx5RllsNHQzejRUNnQ2NnpsOVl3bHFrZ3dWZ2Ev?=
 =?utf-8?B?YzVrM3F2WlNDT1BacHhCcDFUTlNMaHZBWGFITjE1bnk1WDdMbU9uT2ZFaGRa?=
 =?utf-8?B?WUNYbEhRMjUvc29yN3R0ZGdYU1dLQ0ovdE9ObTdlL2ZvUEFkRisvY0tMaFRH?=
 =?utf-8?B?WCthZGg2Qndydnp1VEE1UHI0b2x0azByeUtzYlN2UjZPdFl1UGRnT3p3UFNi?=
 =?utf-8?B?ZExUNzhrSkIwdmRGSUlaNXROY3JGN0lXWUxRSnJDa0dsSG9odzRFQUtXL2F5?=
 =?utf-8?B?MEJYK0JVanpUNTJsNFpEdkJ2cm9oeFVGZlA2Q0hRdDhyOGw5cUUwZVVjaUVC?=
 =?utf-8?B?UmZQOUFpVG12VGlScWVFanJId1doSWdrQ0MwV0ozVnlQZ2p1K0luOFNBZXhW?=
 =?utf-8?B?a0RJVENQYTlXS3ZZMGVVb1hEMmtaRWhkVFBFdzJCUitKOCt3MUdpOXFGdE9t?=
 =?utf-8?B?YmxBL3hqNnByQVJDZ2JnT3hBNGoyMVdvL3h1Y0EzQmJJN3RUMnl5MTcvRitM?=
 =?utf-8?B?UytvcGRyOWdFaWYvaTFYTXp0RXpkTzBlWWdaWExYNWh1YkFGT29zSnR4bXBC?=
 =?utf-8?B?WkpCbTEvZjl3d2tqUVdiYkVBbFVrcy9YaUtoK0VRcHFrUmlXVERtc1IzdHMz?=
 =?utf-8?B?T2J4cnd6Sm1zUnJXQzEvNnJaRjRSYUJLNUhNSkEvMklod3N2QWE4c1Z0Z2dV?=
 =?utf-8?B?SXRHQXBVcmRkMjJvRXlPcUNReE9rbzhpTWJWaWZNK0FJcHA1aE42Ulcxa2dz?=
 =?utf-8?B?OEZaMFBkZkRGaXZwdzd2YzV0YnB6aWhFcXBsaCtUOFZWUFhKK2hza25RZVBO?=
 =?utf-8?B?djQrUTdsSEZUNFNKNFJxMXV4MHgxNlg3bXk5YVVoYmxZT1pqNEdJemgyS1NF?=
 =?utf-8?B?eDFBWjVSWnI4TGhKK2U2YTZvSGszcHNhcC84N3IxZTd4Mk5HTXg5UmcyMlhQ?=
 =?utf-8?B?dUtFaDVHN1FyOFV5NDVIRGJCNXVlaWJtVXM1am50OU40QTlRMHkzNmhqYVdV?=
 =?utf-8?B?aGNCNVIwQTFNQllsekRsRU0zbzYwTEYxeXp0Ym9IVU5CQksyVVJYeS9Xazk3?=
 =?utf-8?B?UjFWQVY4dHpJbGxyZDZWL1RsMVJNMHY3Y1Y0cmdqOWo3dlBtSVF5T1JScVps?=
 =?utf-8?B?eElJRnltTlJiaHhIaEQ5R1l0bEpMQXBNa0hVS0R5dkVlWlVNa2tOVmFZUVZI?=
 =?utf-8?B?dFlGcC9rKzltS2Vldmh3VFJQbHdBVDlTZFRUZDRDREpzOEx6U084RXpsbjg1?=
 =?utf-8?B?TEV3NG5LV1dMK2pEczlUM2owSno2ZkZBOEFtSTkzYTVDRlQxNHgxUUUrY1FZ?=
 =?utf-8?B?TmE4Q1liMytoUGR6djhESGYyaXY5dEFJR2s0QnpwT3k4ZWVPemt4OU9yZmln?=
 =?utf-8?B?WndTYTZuYXVxN3M1QUlLTk1OdEQxSjVaSkVIcmdsQk5uc0QvTWZNUUczOWI4?=
 =?utf-8?B?QzhEU1FkWDFyNFJaOW9RY3pUZFZoZlg3a0M2bUFodWFSeVVuNU1PQTI1eWJt?=
 =?utf-8?B?cFJMZ2VMRUF2b25ubStVRnNBU0NhVUN1TG1ZUUkybWIya2x1L05JNW8wRnJX?=
 =?utf-8?B?WE9qZm9RYW5sU09DR0RsK00zTENrZDN1eGVsTW15TVV1dTRMTVNZLzNlenFR?=
 =?utf-8?B?ejc2cERFREJHTmNOT2JGTnlmWHFVUnBhU1hxdDU3eWdaSzYzOXJHT28wd1B5?=
 =?utf-8?B?emVDUy96YTU3RFVnVWQ4eHpJMUkzTGorQUx5UjZEemtvVVlYZ2dHZVNLVXIr?=
 =?utf-8?B?cU9aR0oyQVdPZTBLZjE0NE40dldjajFqS2tLRlp3UVB2U29lNS9DZVk4Z3ha?=
 =?utf-8?B?QWgwRnV5VUEvbEgvTlRoMkRmZDU3ODZyVGV2aHNKWUhBL1M3ZDJvYXEwTmVO?=
 =?utf-8?B?djhEb3BnaitDN0t0eG5TYkd4NTN2RjVoODZlUEgrMlA5R3daQ1VmSk5yejBi?=
 =?utf-8?B?ajB0MjV1MGJDd0dtMnpQNTJDTitYZDJhTmszd0JPYkk3eGJjaGpFZmxONkxX?=
 =?utf-8?B?NHBIalhWYml2Mm9oYnN4UU5IeVBwb2JkL0FmNDRxMFdNdkp2Yml4QWxidnhl?=
 =?utf-8?B?MGJoejVIdmF2TFZaK1VQTldRb3o4MG5jeVhWZ1Z4WDVkbTJSSDRzY1NLNFM0?=
 =?utf-8?B?R0ZzbWVaZnRTd1lxOTRna0FQUGNkbFdScG5mMGFSN2VSZ0JpQTFpd1VTc2J1?=
 =?utf-8?B?QzJYNjVVZ0hkblZuTzIxTTZQVGcrcVNrUXJRUTZKYVVEcHI1VWltenFIS04r?=
 =?utf-8?Q?n6FzPUuSqnZJ0q6s=3D?=
X-Exchange-RoutingPolicyChecked: OdBu9b5XSv/IgmETrVoIUXamsyTdR3G7hLOaswRaJqXEShqrPgBrpi43XbTwYoFM1836KAN13p6pCmcrt9KcLWInjIVbRbjQZSL83ULgFkc9adywpolcEXFOgeGtuceCAj0zCPXAkM5DLlQeaMvs8szGFcuOmSNpYohiyRM6oyKE+zOvoREsrB2YjU/D+dlb6gszM6CIil1u+3+5cVxk8zOqpr6sViaSfDckZ8Pn2IKde1bZmVIrVarO9/n/78qDxbIiSCKj2+UkirUTIfisIgtZ8bpbyGXeDSRmWRA5z4vkMbYSnSdcg5P5TTpXWHg5BRIQPsOXt+b1XFJH5iioBA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 83f5763c-e980-4509-39a9-08dedba6394c
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 21:33:30.6509
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E52P+IUuUjYWEvYED5OoxnGY+Zf/p30ssTGO6QjubRpY8KHg73M1uiysIAT4a7TAMHV4zfF1YujHtWOpFF3dxo6rq9C462ql++Nmrz67wYA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5317
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_143334_836238_1DD228AF 
X-CRM114-Status: GOOD (  11.11  )
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

On 7/6/26 9:06 AM, Ben Horgan wrote:
> resctrl rounds up the percentage value of the MBA based on the bw_gran. As
> MPAM uses a binary fixed point fraction format for MBA rather than a
> decimal percentage, this introduces rounding errors.
> 
> Without this additional rounding, if the user reads the value in an MB
> schema and then writes it back to the schema, the value in hardware won't
> change. However, with this additional rounding, this guarantee is broken
> for systems with mbw_wd < 7.
> 
> resctrl is introducing resctrl_arch_preconvert_bw() to allow the arch code
> to specify the conversion resctrl does to the user-provided bandwidth
> value. Add the MPAM version of resctrl_arch_preconvert_bw(). This does no
> conversion.
> 
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
> 

Unfortunately the "---" separator is missing here.

> Changes since v3:
> Parameter order switch (Reinette)
> Add Reinette's R-b
> ---
Reinette

