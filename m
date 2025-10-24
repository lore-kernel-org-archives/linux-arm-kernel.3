Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B1ADCCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 10:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mUn7Z/lcLPAR9rW1oQLxzJO0fIGLnrsE/9pxxOzkm90=; b=XW9ematzrikJ1Xs4u7dDa/HIGE
	nh5FVuULqfq2GHhWdDk9JjrCuqPeYB2kI2yJPEQ5uM7YyHmMxG0t0iuvGlhiYHC4IL2EWfmM8gGvR
	RL04TF7u/iO7v/q73FTptTl0sf1A7WRv6oQX8Cui4lZwVuky+AZdpE5/++zMW18cx5LzSt++YjutK
	JXUQ0FD6H7ao2wfSkvtwjvu6/6VN2XMQOmnNcFmsr6vtWnGydkgoerA5M2vhn877pCq4GFBBva1pD
	Bfi6IOh4W/uKUGjEZrqTzNbP9H2kGy+GL1C32CR9O4UR5YGnqzNgb90L+QWDD7AECK2aX58Lix+Rn
	dB6XuDXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCEt3-000000090PM-42Zv;
	Fri, 24 Oct 2025 10:19:09 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCEt1-000000090Ol-28es
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 10:19:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761301147; x=1792837147;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=McXyirFN2LXLQc0gIoJhHItk2i/3jITEGzP3vyphDOc=;
  b=HNsIGhAE9Lv1U1PS3M00A+cTGLN1e/3R+y3/l3980NN3HlPNrW+4/wLh
   zYZb9WYA02seXuguEaZc//q/Wcs5VpFHbxjeGniXncXfuGhpaphc1pbs6
   2OPYfVmjWw/tlj7cJIvDJNz692sImgMuFlQRBz91gdzI9MDMhDtcEQpfZ
   krJ+q+EfwMYiKI2fjFJu2jtVRJCEKdbJ05dPNVGXPMZYvCCGZJNVVB0i6
   4a5g7xppTn7siJQKI7kFNtro+MA79w35eY7CPDZXrpBuk/g1rmpjJ0tvB
   gsrRpCeFRcB2//1lGEvszXSK1QfYsI59TZDoDtQUzVSeHgrPuDtJOaKqP
   A==;
X-CSE-ConnectionGUID: AxvXan9NS8G2GUah2AMRLQ==
X-CSE-MsgGUID: ZJWLptkgRry5B6PmRaTrAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63518981"
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; 
   d="scan'208";a="63518981"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 03:19:05 -0700
X-CSE-ConnectionGUID: X6PLpRGoQz+3KOYzYiscuA==
X-CSE-MsgGUID: njJ1n3cxTSqTt/29b9c2tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; 
   d="scan'208";a="189522293"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 03:19:03 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 03:19:05 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 24 Oct 2025 03:19:05 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.70) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 03:19:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vMnpCGp/AH0uybT9qn9SBuEEheXu9XVAw6L/4zYuKec7gYV4ZHLPt0nADDIhyEcu6lJUobDpX15fVtIc1EPPOp2ymQuvWgSJr+23KubWCVQ9MxxpxKunkURpAHY7EwvvnZAqschZhVDi3TlCA4Ms/ZLeFjxs1TV9nonQv40zZTDfzKTMvawhHEzvCX7WsGVIsWAnucLsfjXAgXCDj2xjevSSHa04gUCdpj0aNBYKwjQW3JnqnYRzjfXJvC8Gif66QufYgIarvjw/s9uc7dp47rg/JUhoG4ZYMK6Be3CPtYJ5rG8PItAjwRNfE+NVKffRrJxUGon5IFGcAQkb/lPLRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mUn7Z/lcLPAR9rW1oQLxzJO0fIGLnrsE/9pxxOzkm90=;
 b=AUZyINYe4h2nSVDRBqcxnU53qnZsZ8YTZ8k3W+6Q11NQGrZEd4znWwPpfoNysxW5xNnDvEkVPuq6eehyky+MG9SvfOTSvPhbjbVHGqWgXvzO1VqXK3fvj7ehOEjESklmRJcv/xSRtpZ2i760n9yRqdAR1sihoMI1XEcpcCyHTj5uutiU9+B6fMW3IlEtYB6HFTYaqqRkGNjuQ7lmVEAUwVug8wzGHINlwVGHVK5xy8rb7F4Cve4g1eU451w2X9a9w6Qstt0gQyqbAnObczNg1UsHfXhJ7M1alNlSUUkYQ+XXGWm1r8i2QrGQWZ01CutV2TAYmgXrDzX8LM9pFxtqBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by DS4PPF69154114F.namprd11.prod.outlook.com (2603:10b6:f:fc02::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 10:19:03 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::eeac:69b0:1990:4905]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::eeac:69b0:1990:4905%7]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 10:19:03 +0000
Message-ID: <029c123a-461a-4444-bd92-0317be833334@intel.com>
Date: Fri, 24 Oct 2025 13:18:58 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] perf auxtrace: Add auxtrace_synth_id_range_start()
 helper
To: tanze <tanze@kylinos.cn>, <leo.yan@arm.com>, <namhyung@kernel.org>,
	<mingo@redhat.com>
CC: <graham.woodward@arm.com>, <irogers@google.com>, <james.clark@linaro.org>,
	<john.g.garry@oracle.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-perf-users@vger.kernel.org>,
	<mike.leach@linaro.org>
References: <20251024085625.175688-1-tanze@kylinos.cn>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <20251024085625.175688-1-tanze@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DUZPR01CA0278.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::23) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|DS4PPF69154114F:EE_
X-MS-Office365-Filtering-Correlation-Id: 42e0e0af-dfd3-4ff1-2972-08de12e6c117
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V29Pb0RSSW9PWDZOem1odktPc2NLSEJ2R3FPTnAwbmpKRDdKZ251VmJQc2U5?=
 =?utf-8?B?S29UaEYzd0xpOEZlQmdEV29vV1NyVkVBNHppRUVsZjRwWS9mQkkvVTlSa1c2?=
 =?utf-8?B?eHZ4cmlHWkZLRktmWG5YS3Nnd0VtT05LaGNjb1A4S2lVM2ZmNkx1THUyRlds?=
 =?utf-8?B?bUtFazZOM0VLUjl1NkdnWnkybENSUmVpRVNmSHdWSng1YURCbHlkeFNzbmNj?=
 =?utf-8?B?cDNkVFcyKzVCd2F4L1ZDUnZ1cWFzRExlcXlELzlLNklFUGpDdmx6SlZHWmtB?=
 =?utf-8?B?Y1prOW5hdGdiVk9xTzhpZDVZN1YrN0xLVllValMyZHhKMFVuZ0dMZ09iOXNj?=
 =?utf-8?B?ZTVyNUlnZ01XeU91c2JwK3lnZlliTVBRR1VPMDYzRnJrRkR1cTVNbVVDaGo3?=
 =?utf-8?B?WkFiWUREcFE4S0plaXoyS2prbCtla2x0TWY1Yml3bHc2bFFsdDBieVhOV0xs?=
 =?utf-8?B?SFJOdXVOREszRzBuRTBZaEVsVEJRcTFtQzc2ZDBoRXR5K3dNUEE5N3hqZDhi?=
 =?utf-8?B?RFRrUHp2dkk0aHo3bmp4T0xBUCszczNxSmt2dWsyNDRZcW5LdjRnS2ZGcmwv?=
 =?utf-8?B?dDRzd0Fac0trekdUYVVJUG9SZDJhRm04Nk8rREZXOWpDRFF6OTlYek5hdlp3?=
 =?utf-8?B?WVZFbitpcElRMFFsdC9wT2t0cmJ0Q3hjTU9kQ1o4TUxSV0pIZmZJckpzWUtI?=
 =?utf-8?B?Q3hWNUtsYnhobktoR003MUc3QlpkeFMxTkxoNkNBcC9yUVNLcjlGRE9Db0dw?=
 =?utf-8?B?Ym56QXZBR1YrVWF0RXVXQm9rdHBBazBudEtmNkF0dUNEQVgzcE13WW5hYjR0?=
 =?utf-8?B?YkVwWmkxSXllaVdOV2Y0Ni9rSDdBSTVyTGYwRUtDcURYOUZJMkZBYUFqUUxC?=
 =?utf-8?B?VkxsWEYxMDU3Y3VsWHNxMUM4SGVTb0Y0aWF2dGJSbDBiVXNCT0dxNENXSjVr?=
 =?utf-8?B?VWsyTkFuTXIrRURYaGNUNTZWYmx4M3N2NmlTNWRaU1NIVER4b3l5UDk0My9m?=
 =?utf-8?B?RUFYZ1VkWmRIeW1EQUpZYzVoclQ3VTRlQUN1WnZSdytIcy9TTHdQNlRoRHBN?=
 =?utf-8?B?UHMrRzFUMURSMmRaOUx5bGpXWkczaGkybVk2WlBPZ1Q3VGRtUU5pOVlENVV3?=
 =?utf-8?B?WVIrZk5FMkNPSzFxK1ZoR2wxUHlUc1NpOXQ3cWhwODkrOWZGOEcvd3lxUVBM?=
 =?utf-8?B?b0N3UWhWaW9iY2dKRFBUMmhmVElVNzI1UVI4SnhFMzJHRk9aWkRoWUxxMVpo?=
 =?utf-8?B?aTN6SEJPUkdqWXp2UU5TZkxBc3N5czJQYUxSRkZTMkFZOGxERW1lY0ZWdThN?=
 =?utf-8?B?ZWU1QzVYRWoza2RPODA4cU1jWFBYRFU5MG00RStnTVVKU1hxWW90bzZkTUl3?=
 =?utf-8?B?S2hpd0VuYVpleE04cll4UkV2clFnYVlFMGlxZnRYUkRzMjZ2dzA5enk3ak0x?=
 =?utf-8?B?R2JZTHd0bFI5VG5iSFBWcHFlcDNSck5DN2tCMm40VzNSVmFWUVdlK3RvMHp5?=
 =?utf-8?B?WWJWRGFGeUJpeTJ2RktZZSsycGwybjRpbDArV08vYnQxcFUwMUlIanRoWlp6?=
 =?utf-8?B?UExsRmVDWWIxZHRzL1FGVXRzVUtoUVdsdHcvN1NDSndNbFJLQjFoT3Zha0FY?=
 =?utf-8?B?VnRUVHhZcTM1OGswSVp0ZUVIK0NFZS9iK1V4bS9qYlJqQjdUWFpiTzFDTlZj?=
 =?utf-8?B?dHdnWWd0SFF3Vm53VnFBU0tnVm9oOHRoMmovc3djR3JmcXNQcU0zaHA4NDRQ?=
 =?utf-8?B?RGc1M3d5Z2ZlMisrNDNTOG82QnI5N2RKVG9JRlB0K0hJaGUyMWxBTUJhQU9l?=
 =?utf-8?B?b3l2Rk8ycVpReVQ3d3R4R2V1N2FvSURJek5vWlpBaEUraFg5ZVRSZDQ4WUpl?=
 =?utf-8?B?MlpBQW0za0tockZDbWN2My9PRU9HZS9lb01qU3gzcEpBd3d2elhaa0RxOWFy?=
 =?utf-8?B?dVYwWXlNVzZPSCtJekZmMXJaajRLN3Vhc1lEK3djV0J0c3JrMVFqY3pRR2ZH?=
 =?utf-8?B?cHN0eXc3VDRnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z09naHpOakszUUZZMlc5UklFTEYxcE5uWTY3MjRadTV0N3dSdE9TRHhmaDEv?=
 =?utf-8?B?eHYxQ3pLVWtyam9nS285djE5QXkxWVllU0wvV3p5TVFqblpVSUM4TjdoNnp0?=
 =?utf-8?B?WDhYQUtrMlU3UTlwSjdveTR3eTYwK09yaHJrY210UEtnd1NTcHd5NGZKVmlP?=
 =?utf-8?B?OTNDbjJSaUhXaVNwbDZGbGt1WUh2UFJKV2JKbUllRkV2RnVSVkY5OWNXRTky?=
 =?utf-8?B?Z0l0MGtkOHBuOFhEbnlCSUlzT1I1QjlWMXF1N3RZdHNQSkNWcXc0bk9GVXhn?=
 =?utf-8?B?Q0tYYTdQYkc5N0x5VnlLRkYwdWZ5QTdoeEw2aWxYYmFxUzM0QmxSTy9RQzV5?=
 =?utf-8?B?TDhLKzR2dHdQMjUvb0ttOTdRcjFTbkxUSTBYSUtrT2NobDJ5OEp6a1NZdnBL?=
 =?utf-8?B?anhHbTBNQ1poYmM1cTNWcGJWTFdmZ3hReWNrS21zcXk4a2VPbE9Qd21pSXZG?=
 =?utf-8?B?MlFvMlNGSlh4R3hBRGJRbE1KVURHOHY0U21kNUphOHkwb0NjRVlSYTI0cXdy?=
 =?utf-8?B?bFc0WDVSZG1VZlNvMEE4VHl2bllCYzNHN0JEWlZSZmlIOERLVkxIWWdzUGRI?=
 =?utf-8?B?NTN2QmcyZ09EZlNWdnM2ZFg4b3hqdlJBNzc5b0NtN24rQm5mb3hZVkZnOVJU?=
 =?utf-8?B?bHZ6eVQ3dzVDa0o1dHBVWkpSWUpaVGNqK2lLbm9Ia1VOc2F6bXJtTUR1MEk1?=
 =?utf-8?B?TlRoajBuWTZHRVhBcVgyODY4bUxjSHhrQ28rdDdhRGJMS091eGQ4djYzcUZK?=
 =?utf-8?B?R3ZpaTNqVGdnZW9ucHpheUdwOWhaYjhlUUM1eFBYS0lUR0xqU3VtZ1EvYmVX?=
 =?utf-8?B?TThsQlpIZzJVKzc0YzVkTFJDS2w0L3ZMVDVzV1lNV2dlbkp5Ymo2ZkJlYXhB?=
 =?utf-8?B?djdkWDM0WjRQdFYzWHdvejRBWXA1RDZtSDZDUHgrYitmMVR2MDFJbHlHS2VG?=
 =?utf-8?B?ZCtvNmhHTHdkRk5HMVJTNHpteGwwTHFKK1pkbkNza3BSMEtKa01kYWZvWFVm?=
 =?utf-8?B?SVF1bUpVcXF5akl3Y0VETHNqdUN5U1h0NWhwNDlreDBXcUtPQVozcEMrekNm?=
 =?utf-8?B?TkxLTnZjY0tPMnZVYXRCaHFvd1RjOFAwckFmcU1GY2JpbE04cFdrOXVibmN5?=
 =?utf-8?B?VzBjWHR2L3hNSVVyNHJ0RXlEUmZudEtkVkJDSWVQSnFXdHlJOWlPRy94akR5?=
 =?utf-8?B?MUxZZy9vcjU0SHp5akljTm1EN28xTVQwYytxZXk2ekZONVhaTzVyVUh4NXRk?=
 =?utf-8?B?UW92c0hMQ0dvMUcxV0VHaXBHNW9RaTlDbXlZUS8wNDZaNUtpdHpXRThjL1Zw?=
 =?utf-8?B?Y3hVZzI3eG4zOW5zeE44QWI3ZmtLWnorZHBBRkVzcHBkS2EyS2NRdkx0NEsw?=
 =?utf-8?B?dW8yclB2K2lTUXRwUHFTaWV5RExheHcrT2xaQTM5c3hJTWZPV1FqOUs2dG9H?=
 =?utf-8?B?S2NqR01sQTQ1YXFXVjE4S2Z0UG5iUStpRVR3azQ0dXFqLzFEYjg5V0Q4Mkw2?=
 =?utf-8?B?NXZ5eXZxVmxENTU0a0tpME9zME44R1lVbzhYdHBqbEJQYzZ3Ky9yZjhPSlRi?=
 =?utf-8?B?MEFXYTZyTmdITGVaV2tsK3FSQzZVd1lweUtKcEM3am4wMTZqeXJySUt2YStL?=
 =?utf-8?B?UDB4UjJ4WmRaeGZHdzIrM2NiUUpyaEpWYUtIVFhPd0lTSi9ncGd5aUhQM3F0?=
 =?utf-8?B?SmYyU0dFL1dLYktzdTZxU1lBWXQ4R1ZOZnhHTENScWtNMkt0QnRWa0I5ZW5U?=
 =?utf-8?B?Q0pEREdncE9wUGE5QSs0eEJWQUlDN09OeVJaTWl6V1ptdnA5dmxQbkJBSmEr?=
 =?utf-8?B?bVUveFk3Q1loWVNqd2dGLzVyajl4Y2hiYmc2VS81WW1NUHEyaHA0ekxoZXEx?=
 =?utf-8?B?bkprOVVtc2ZkeHgxamxEVCtPWFBSOUdtejlLTXRCaVJua0s0eGgySUhXbU5D?=
 =?utf-8?B?bmVpdzFqZStuUXpuMm52TlM3aUwvNEJvdUovMmdwQ2dEVlpzTmVsTGMwOXZO?=
 =?utf-8?B?L2ZqMXpuejlud282d0NOVHYzQWh4bzRUNnFRSFl2THd5RGRPSVFEWkJhNzlP?=
 =?utf-8?B?eTJEczFhTHlSMFdYc1ZabXdBMGxDZVlFMTVXNjBCT2cxZmxSd1JqVVdUQWxo?=
 =?utf-8?B?ZVU2Y2QzeHg2Q1BQVXdPMjBEMnNkK0N4dWxxbUt5aitIS055U3VKSWsyNGZE?=
 =?utf-8?B?Tmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 42e0e0af-dfd3-4ff1-2972-08de12e6c117
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 10:19:02.9200
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nZhx9y8b9ARmi3Duer+PJl4+M/xdeKG9m/Fk/RXJQRRHDYQhcFavW14uJb8PhgWUbTaqhYJf+vtW41LjLC3K/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF69154114F
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_031907_570686_F40A025B 
X-CRM114-Status: GOOD (  24.47  )
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

On 24/10/2025 11:56, tanze wrote:
> To avoid hardcoding the offset value for synthetic event IDs 
> in multiple auxtrace modules (arm-spe, cs-etm, intel-pt, etc.), 
> and to improve code reusability, this patch unifies 
> the handling of the ID offset via a dedicated helper function.
> 
> Signed-off-by: tanze <tanze@kylinos.cn>

Reviewed-by: Adrian Hunter <adrian.hunter@intel.com>

> ---
> 
> Hi Leo Yan, Adrian Hunter,
> 
> Thank you for your valuable comments. I have modified my code according to your suggestions.
> 
> Best regards,
> Ze Tan 
> ---
> Changes in v3: 
>  - Removed PERF_SYNTH_EVENT_ID_OFFSET from synthetic-events.h
>  - Added AUXTRACE_SYNTH_EVENT_ID_OFFSET macro in auxtrace.c
>  - Introduced auxtrace_synth_id_range_start() helper function in auxtrace.c 
>    to unify ID calculation
>  - Updated all auxtrace modules to use the new helper function
> 
> Changes in v2: 
>  - Migrated the macro definitions to the synthetic-events.h file
>  - Added modifications to other source files that use the offset value
> 
> v2:
>  -patch: https://lore.kernel.org/all/20251017021540.45930-1-tanze@kylinos.cn/
> 
> ---
>  tools/perf/util/arm-spe.c        |  5 +----
>  tools/perf/util/auxtrace.c       | 16 ++++++++++++++++
>  tools/perf/util/auxtrace.h       |  1 +
>  tools/perf/util/cs-etm.c         |  5 +----
>  tools/perf/util/intel-bts.c      |  4 +---
>  tools/perf/util/intel-pt.c       |  4 +---
>  tools/perf/util/powerpc-vpadtl.c |  4 +---
>  7 files changed, 22 insertions(+), 17 deletions(-)
> 
> diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
> index 71be979f5077..4fd47600d9e4 100644
> --- a/tools/perf/util/arm-spe.c
> +++ b/tools/perf/util/arm-spe.c
> @@ -1732,10 +1732,7 @@ arm_spe_synth_events(struct arm_spe *spe, struct perf_session *session)
>  	attr.sample_period = spe->synth_opts.period;
>  
>  	/* create new id val to be a fixed offset from evsel id */
> -	id = evsel->core.id[0] + 1000000000;
> -
> -	if (!id)
> -		id = 1;
> +	id = auxtrace_synth_id_range_start(evsel);
>  
>  	if (spe->synth_opts.flc) {
>  		spe->sample_flc = true;
> diff --git a/tools/perf/util/auxtrace.c b/tools/perf/util/auxtrace.c
> index 1539c1dc823c..35f4745f6b2b 100644
> --- a/tools/perf/util/auxtrace.c
> +++ b/tools/perf/util/auxtrace.c
> @@ -62,6 +62,22 @@
>  #include <internal/lib.h>
>  #include "util/sample.h"
>  
> +#define AUXTRACE_SYNTH_EVENT_ID_OFFSET	1000000000ULL
> +
> +/*
> + * Event IDs are allocated sequentially, so a big offset from any
> + * existing ID will reach a unused range.
> + */
> +u64 auxtrace_synth_id_range_start(struct evsel *evsel)
> +{
> +	u64 id = evsel->core.id[0] + AUXTRACE_SYNTH_EVENT_ID_OFFSET;
> +
> +	if (!id)
> +		id = 1;
> +
> +	return id;
> +}
> +
>  /*
>   * Make a group from 'leader' to 'last', requiring that the events were not
>   * already grouped to a different leader.
> diff --git a/tools/perf/util/auxtrace.h b/tools/perf/util/auxtrace.h
> index e0a5b39fed12..ed3a1aaaf5d9 100644
> --- a/tools/perf/util/auxtrace.h
> +++ b/tools/perf/util/auxtrace.h
> @@ -648,6 +648,7 @@ void auxtrace__free_events(struct perf_session *session);
>  void auxtrace__free(struct perf_session *session);
>  bool auxtrace__evsel_is_auxtrace(struct perf_session *session,
>  				 struct evsel *evsel);
> +u64 auxtrace_synth_id_range_start(struct evsel *evsel);
>  
>  #define ITRACE_HELP \
>  "				i[period]:    		synthesize instructions events\n" \
> diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
> index 30f4bb3e7fa3..62812bef1edf 100644
> --- a/tools/perf/util/cs-etm.c
> +++ b/tools/perf/util/cs-etm.c
> @@ -1726,10 +1726,7 @@ static int cs_etm__synth_events(struct cs_etm_auxtrace *etm,
>  	attr.read_format = evsel->core.attr.read_format;
>  
>  	/* create new id val to be a fixed offset from evsel id */
> -	id = evsel->core.id[0] + 1000000000;
> -
> -	if (!id)
> -		id = 1;
> +	id = auxtrace_synth_id_range_start(evsel);
>  
>  	if (etm->synth_opts.branches) {
>  		attr.config = PERF_COUNT_HW_BRANCH_INSTRUCTIONS;
> diff --git a/tools/perf/util/intel-bts.c b/tools/perf/util/intel-bts.c
> index 3625c6224750..382255393fb3 100644
> --- a/tools/perf/util/intel-bts.c
> +++ b/tools/perf/util/intel-bts.c
> @@ -777,9 +777,7 @@ static int intel_bts_synth_events(struct intel_bts *bts,
>  	attr.sample_id_all = evsel->core.attr.sample_id_all;
>  	attr.read_format = evsel->core.attr.read_format;
>  
> -	id = evsel->core.id[0] + 1000000000;
> -	if (!id)
> -		id = 1;
> +	id = auxtrace_synth_id_range_start(evsel);
>  
>  	if (bts->synth_opts.branches) {
>  		attr.config = PERF_COUNT_HW_BRANCH_INSTRUCTIONS;
> diff --git a/tools/perf/util/intel-pt.c b/tools/perf/util/intel-pt.c
> index 9b1011fe4826..fc9eec8b54b8 100644
> --- a/tools/perf/util/intel-pt.c
> +++ b/tools/perf/util/intel-pt.c
> @@ -3987,9 +3987,7 @@ static int intel_pt_synth_events(struct intel_pt *pt,
>  	attr.sample_id_all = evsel->core.attr.sample_id_all;
>  	attr.read_format = evsel->core.attr.read_format;
>  
> -	id = evsel->core.id[0] + 1000000000;
> -	if (!id)
> -		id = 1;
> +	id = auxtrace_synth_id_range_start(evsel);
>  
>  	if (pt->synth_opts.branches) {
>  		attr.config = PERF_COUNT_HW_BRANCH_INSTRUCTIONS;
> diff --git a/tools/perf/util/powerpc-vpadtl.c b/tools/perf/util/powerpc-vpadtl.c
> index 39a3fb3f1330..bfa4156d7a97 100644
> --- a/tools/perf/util/powerpc-vpadtl.c
> +++ b/tools/perf/util/powerpc-vpadtl.c
> @@ -656,9 +656,7 @@ powerpc_vpadtl_synth_events(struct powerpc_vpadtl *vpa, struct perf_session *ses
>  	attr.config = PERF_SYNTH_POWERPC_VPA_DTL;
>  
>  	/* create new id val to be a fixed offset from evsel id */
> -	id = evsel->core.id[0] + 1000000000;
> -	if (!id)
> -		id = 1;
> +	id = auxtrace_synth_id_range_start(evsel);
>  
>  	err = perf_session__deliver_synth_attr_event(session, &attr, id);
>  	if (err)


