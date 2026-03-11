Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50D071049524
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 09:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kFcAjIJ6O0CvlOxqzdrtnQsQdgglA6S73jBPTUIaU1c=; b=PY4qT6RN4ztyHzhhYN41iRFTo5
	WDqfCT5Fg30NBpo16pk9NeSVHGIgmOFp6pSy8xe+7AYZBWrzy+5vepizzkTo5/TmMdT3Hz7cEY2Ee
	WF/xlAPAbFyuubID7YCgNFzTqXvSmStprQnBSb7AYwk8hN8hx2TxugniNhWn10u7OtFRNCTVfCPYc
	RQMyeGxDlYbzDO2AyobKQ3jbKDPXSnT8epXZ1EHiLc/F0Fff7Zqc6JujRelR/YTX39zUHyQCCNqMf
	zx4nH2C8HH2ciJf2LRaKg9YQ+gFW5Pq9jx7+4GuXvFs24ZDXqYIG0XCIckexKoxuCnRqgp7haCAui
	9Uwem5jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0GL0-0000000BMDi-2HfJ;
	Wed, 11 Mar 2026 09:58:46 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0GKv-0000000BMCQ-2LxJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 09:58:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773223122; x=1804759122;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=EhBIBA5+InhrODQ1XrR9rmP5LRNMINcYZE1GVOFRXk0=;
  b=bohe6EPRH0hgQAgOhnQeURQ6c7qMUNdcWKCpN0/ltvi61nY+CR2lvlGd
   xbL7PqcDubbqdPRYWUJpdtpcdPWROUvS/hWKqjIWc0QBsffnDNyGHdGIm
   Jp6Wk73jMm/RpIfRq/l0w+Dy+bKYmoKKQc1AImaoVaI5Pcn8t+qRiGekT
   p3qbdffwRWXkooRM+8YNHRrOW4Imn7I3umlQ4/ZjtTqZtq+QtiPC8iq/6
   TMp/P0BUjMkLpQ4+P1BtSP5LByXVv20fDSPtF3Nhz7MIH484kijvr+qtt
   Clj8YH6l7c+7DvbPYkBinE6b0ymElGR+IuYSLY/IIROWWjEvIilDmX7NT
   Q==;
X-CSE-ConnectionGUID: 4RcplhuiTO244kOmciibXg==
X-CSE-MsgGUID: hqBa09pwQTy7SDiNAbDMqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="74477437"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="74477437"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 02:58:37 -0700
X-CSE-ConnectionGUID: Bx+cNOeVSjiPUaB5t0AYcA==
X-CSE-MsgGUID: C2JsdO+KTQSQ+gzz6IzPLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="224881274"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 02:58:37 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 02:58:36 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 11 Mar 2026 02:58:36 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.41) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 02:58:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C9aVW7tfziEm4ByrYvkQN9mQeYzpW0kRjAsNKPtPyWjsjeqKkX7/N1ci9I3nuE9oRCSKv+ybbVHFwnkFNUfYk1WrMrXawpl5PREOKk0HtqEUbt0ZHZNw5RNn1xG8sXZpMECz6sdVebq7S4bd9ArX5r5Gjg4sWMT2Sh/1CkuY3qraYTtyoTa7j3QzUvpmgJYJFcZk4Hxz0gYqXhKcozoZwPYtL+kw735J0c+TADuviHSG76lNJwjQX7Y7KAoSJkhVoBxE25bgS5clEND5TSqktlVy6Kt+r/NQ3dmtDHH3HCb+H4fljhjW9K9qHDxfQ/gBWurIma1Y5khKOQxQ36eu4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kFcAjIJ6O0CvlOxqzdrtnQsQdgglA6S73jBPTUIaU1c=;
 b=euSVc+12DStcyX1dgiOAuqwQUkuz4Z6I5uVukAl5WM6EqzIELPtJ/JSt9aHyBrlK7Cv1t4uX1Mf1TUC079sG+2f7hH1r8/95vP5Mxb6RHC55/MCWWkKEsLbgpaFMg0/covj+BJSzkmPT347zNtSnsVqxIV1U2DMpVPcwxX5A6Dik/GJ8j1s2gZ6G8SvTTjXXmCnudYYQuzAu2pUjVd7yudY0Le7d8JjR336mDPg+MonDg30yvY2hu9Xm4AYRef7Ed9D/uX1aQTfS7oSftvv/pyYnyLj8BscJKJdsZpuZdQkisnKDu3ZCRfo8yOJWvbwfX56hlu9BdO/zUpMODyftSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by DM6PR11MB4675.namprd11.prod.outlook.com (2603:10b6:5:2ac::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Wed, 11 Mar
 2026 09:58:34 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%6]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 09:58:34 +0000
Message-ID: <3d8b190a-36c3-4196-9b45-b67e4cc96a20@intel.com>
Date: Wed, 11 Mar 2026 11:58:29 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] mmc: sdhci: fix timing selection for 1-bit bus
 width
To: <ziniu.wang_1@nxp.com>, <ulf.hansson@linaro.org>, <haibo.chen@nxp.com>
CC: <Frank.Li@nxp.com>, <s.hauer@pengutronix.de>, <kernel@pengutronix.de>,
	<festevam@gmail.com>, <imx@lists.linux.dev>, <linux-mmc@vger.kernel.org>,
	<s32@nxp.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20260311095009.1254556-1-ziniu.wang_1@nxp.com>
 <20260311095009.1254556-2-ziniu.wang_1@nxp.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <20260311095009.1254556-2-ziniu.wang_1@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DUZPR01CA0040.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::18) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|DM6PR11MB4675:EE_
X-MS-Office365-Filtering-Correlation-Id: 0afa5178-fea5-4831-42bd-08de7f54c1e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|22082099003|18002099003|56012099003|7053199007;
X-Microsoft-Antispam-Message-Info: nC/6hAe+ASVaIr+h1gIFqccmsi6cmf9ykwzrFqx7X2In3DlXjfyMPufdKlgOSKnU6r1rs6UmK0ecWygjT5HrU/lKtMb8RaW01I9K7nmRsZGza1xPWESntwXbXPgbkHWTX/eSxU6AwEXzYgnkyXPSBsghUU0ZpTFsoPbe622/U7B3tfJ1E4DEhYJyx5l2+0oqfCXWYP9tICjDSsnaY15nk5bCtMPYWNaOrwIAW4Diw2J6/Sf6u1zkGTPpwnMDJN57UCzIgJYO/uID+GwDJ33kRQaxeJMqu5LYHY5PNGXl8oZ0CfPyefSTqTdbdn8W7n/LaiT64vQg3BOlG45zhI8y+kL39CMDEz7Cf1YfqyBcXojiWrhORFLbGl/VyRUb2zibJoyHmwKSmgEBKL4xuuodGoHHnaKMhGvQ4+uJWm4MwKgrMGMIxVDu+ozQaiJAaGk0ntuI6WrjTOIwALlMix9AdC1jse8JY8ft0TqPssdAEkbMHhwncM8vJJhp4yNR35F+9CdSFkUpMGmXLga85ZOtN27E0Wx5q6i9Yko4SbWMMDBT4i6r2Rljt/sUHo0Wlzv3/JlfwCcYZCy/sDBT3urjex4BBYsSxNUUfluacnrtTR+WE9Kz4st/K3BCE8bCk4cwA+46s7lZZyYjrjseKFhcf/CW1VW1SQuhNyT91sca4nN8gHedbguZzKnPsuuS8leBGasa69neC11nnoC8kdMp+txQS2RrggIICOSIIBm1q8c=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(22082099003)(18002099003)(56012099003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vy9EVE02em10SmNOUUs1OTI1NlY5SzE5ZnpKMitIRnM1ZXlPVk1McmdEcS9q?=
 =?utf-8?B?UGNLTG41TmVpTzZDelZEYlNGWldTNC93bWRoM2RVMkl1QmVSVkpjTzdVQWUr?=
 =?utf-8?B?ajJMbWltR3J4L1FOUmd4enZtODVwMVpraWdTNmppSU5sQld5a1RldFllQThH?=
 =?utf-8?B?WU5yOHVLU0hhNXdLVVpJNWNRUFVOVWNFeEFxZ0ZtaGFwdjBUZTdUTDAwV0t4?=
 =?utf-8?B?Unkzb3kxOURUdE5GbUYwY3VnRWRGS3RaS1VCZzVCSlo1eDJyYVhHbVZnV1oz?=
 =?utf-8?B?UDRwOW9CUktCcmxESU1JYVZQMEQwdWVIOElzVzIwZGxLRldUaGJNdWJKdjAr?=
 =?utf-8?B?aDdSamxodEE1TEFXSVJEMHZmdTNvOFYwU1ZyRkN1NUc4VUR3MW1oMHBiUVRp?=
 =?utf-8?B?cVpQR2ZDOWhldmcvT1BzekExSXV0aEdmSEVqT3FxN3h4aXdRWFh4S3dKY2hP?=
 =?utf-8?B?NDUycEhSdjB1ZnNtUnI4K1FOUGdYcUhVT2JycEpoMHZ2N2FJVytJeEJjVVRD?=
 =?utf-8?B?NFNJNkdaMnR5Q2FRdVFadlBsSEY3VEQyaGV6Q3pXNUw5cnpjZ05qSkgrbDNj?=
 =?utf-8?B?K1pXdGNIOHhvdnRNMUtiTnUxZjRjbk9RbEI4MjJrWHkrYVJMV1l6UVhINkxW?=
 =?utf-8?B?R0xZdDVlTUZYZ2tQS0xtY0lpMEFjRERhdkRzbC8vdEo2WndwRVUxaU5pQTZC?=
 =?utf-8?B?WUlUZHlQN05vbkY3SUhIWkQ2dXZCd2F1ZnhtanZKYitpQnlaczF3Rllqa2Y2?=
 =?utf-8?B?eWZLeDlvdXZRYVJ4SXJKQ3FMd2tTMjREZU9sQXNEd3NoYktRVGQwd09JZmNh?=
 =?utf-8?B?MVpDKzlmVGozYWtCTER5akxNVlJvU0VyYkpLNnRsTjBNKzVwb0ltUEl1c1FH?=
 =?utf-8?B?MlhOd1daYzkrelRWNVV2TkVBZVRKdGMveFpwa3dEZlU2d3FSWnJhVklZV3k2?=
 =?utf-8?B?dUlsTGt4TXJsTnY3MUlsVER4MW55ZzBBcGQyeEIwbzJ0aWt2b1BrTGtJS3I5?=
 =?utf-8?B?V0NxNXpCc3hxQTc2UUdSOWxwMFA4UEJFMjI4c1JKSXBZYXhld0NKa1NYZ1J5?=
 =?utf-8?B?cGNqQ3VOb0RxSHVGS0E5NXM4TFpQMnRUbjJNRHgzL2IyM1dCUEc1OGl5VTJ5?=
 =?utf-8?B?WnRSM3l2Z1NYRDVyeFJPbysrT29IK2NjNytDay9SMFNFNE1PYXBaN1YxMzVU?=
 =?utf-8?B?b1dMaWMyVTlid05GbHlVQUJCaWcwWHo2eXNBbi8zSGVvZzNTRHVrakdzdXl0?=
 =?utf-8?B?NVVjU2xDMGNDaWt2Q0YxMzdiMnVmQWd3Sk5GTXJKM3lwa0xRV1BrdTE5Y3dt?=
 =?utf-8?B?YS8xZmxMTHZIOXBCVHdpVVkvM1JRd0kwRkdsNnFWU1ArNlNPcktlbDdNWlA0?=
 =?utf-8?B?eitBTnBEVE1nUGh5Mk55d0VwUDk3YXVWdVZTa054KzEwZkFwclZWdGhTVHAx?=
 =?utf-8?B?dEQ0WFF5VTI0TUZndXoxRkh3cTMrdEgyVmxKdmgyeXRxWFdiM29mQkhCZHVo?=
 =?utf-8?B?a0xMVVI5SVY1V3I0R2U2MHRwYkM3SWkza1FaSmJZOXZjNUduOHRzcVAvQXVK?=
 =?utf-8?B?ZDlJMENNcm9ySzM4ZlkxM0RobFVhaEJHL05taHlaNGdVdkFsNUExS0xWbkYx?=
 =?utf-8?B?aUMyZHRFNjIyTTlwSFFZR0hGSTZTb2Q3NzdxSmI5REkxV0NGazNjdWttaUo0?=
 =?utf-8?B?TXFHM2JXM2FocmpHV21GWE9yenV1SFVSVFZrdGQ4RkM1ZStSM0JtVjY5dmp3?=
 =?utf-8?B?QWdSdncxelBZWU9CQVpwRTB2L1hhOGl4L0F5VGpqT2hyWFI5Q0N5QU91bzRp?=
 =?utf-8?B?b1kzNjFNQ1d6NHh4SUtNa096YVN1OHk1cHpaNi9tdGRSQzh0ZzFUWE1wSit1?=
 =?utf-8?B?R1ducjBCQ3pka3BtS0l0UHZtM0tpcGVqZjQ2TWE2cHNWU1ppc012ZnN6emdM?=
 =?utf-8?B?Ris5WVRqNXJvYU1nUXdhSEZhRlVwdHE3NjY4MjVPZHh5TUNXTnpuWnNZM2lQ?=
 =?utf-8?B?NFdxSFhMT3J1Y29iRS9MWVMwZ2Q0d3pDRnA3UkZoNEhMQ1IvMlZ3VFM1eWRl?=
 =?utf-8?B?ZE5EMVpTRmR2NmRnM0N4MVBrS2NYeTBlajVhdVFTUmJMTGwvNlRobGRtODdH?=
 =?utf-8?B?Zkh2eEJVM1dvUkhFbVpzamZLRG5nbGdtcmxBaVhqVGpKbjVDdHBYMVN2UXR5?=
 =?utf-8?B?RXBLRndzbi9FMS9acmw4NlNGVm43NjFSVGFXSHpHSG9NNjBoRC9OM2k1d050?=
 =?utf-8?B?ZElZVzZ1eS9yQ3k5V3pMNnEwNDJDbXRzbEpLd0dlNWJoQnlKYWNqbGl0eko5?=
 =?utf-8?B?UzJrb240UG5VS1NNSklPeFZhWTJiYWErMjVpSVBLSFVLektMTFRNeThUUmV4?=
 =?utf-8?Q?ilQyrUCkyOeRNhKg=3D?=
X-Exchange-RoutingPolicyChecked: MhtmURWkx2F97dIkz9m15cTo1EIw17pKS1DwV9tt6F8Rxvl+bS1uJtL0377m42bYjVDIUBcRsS4z9kaZ0R5iLjKJKnfZkq3s9U9wBgab3CkISH/AVGcyVeDjBXO9rVLpezaMdECr9BR55Plakx834/En9vqep2al2n+fXUxZqzVf0T9Si25/Dg2o7QWxhUNaR982fULgcXXkVLJDNgmuWB6IBqEtP49hZbq5/c3GZlVa7GN7pSRn33ilr0IgFLko3i7p5K9TmkJlZserQqNBFsOoxep6k7eNR9/toXZwTS8fyaJAqzk0WBjVNozR7aX3bijD1MHuDTVfgy7OzeAgYg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0afa5178-fea5-4831-42bd-08de7f54c1e4
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 09:58:34.1942
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W3zI/1OAz86qrfaeWclw56rn5r/LtWt7x7u9cZnU+DcofpIZOkySkUYbiUbsjF7q0Sz6X9tsCr9/fQBj9S9C5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4675
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_025841_646511_0FAABE01 
X-CRM114-Status: GOOD (  16.19  )
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

On 11/03/2026 11:50, ziniu.wang_1@nxp.com wrote:
> From: Luke Wang <ziniu.wang_1@nxp.com>
> 
> When 1-bit bus width is used with HS200/HS400 capabilities set,
> mmc_select_hs200() returns 0 without actually switching. This
> causes mmc_select_timing() to skip mmc_select_hs(), leaving eMMC
> in legacy mode (26MHz) instead of High Speed SDR (52MHz).
> 
> Per JEDEC eMMC spec section 5.3.2, 1-bit mode supports High Speed
> SDR. Drop incompatible HS200/HS400/UHS/DDR caps early so timing
> selection falls through to mmc_select_hs() correctly.
> 
> Fixes: f2119df6b7646 ("mmc: sd: add support for signal voltage switch procedure")
> Signed-off-by: Luke Wang <ziniu.wang_1@nxp.com>

Acked-by: Adrian Hunter <adrian.hunter@intel.com>

> ---
>  drivers/mmc/host/sdhci.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
> index b1a3cd574c84..605be55f8d2d 100644
> --- a/drivers/mmc/host/sdhci.c
> +++ b/drivers/mmc/host/sdhci.c
> @@ -4539,8 +4539,15 @@ int sdhci_setup_host(struct sdhci_host *host)
>  	 * their platform code before calling sdhci_add_host(), and we
>  	 * won't assume 8-bit width for hosts without that CAP.
>  	 */
> -	if (!(host->quirks & SDHCI_QUIRK_FORCE_1_BIT_DATA))
> +	if (host->quirks & SDHCI_QUIRK_FORCE_1_BIT_DATA) {
> +		host->caps1 &= ~(SDHCI_SUPPORT_SDR104 | SDHCI_SUPPORT_SDR50 | SDHCI_SUPPORT_DDR50);
> +		if (host->quirks2 & SDHCI_QUIRK2_CAPS_BIT63_FOR_HS400)
> +			host->caps1 &= ~SDHCI_SUPPORT_HS400;
> +		mmc->caps2 &= ~(MMC_CAP2_HS200 | MMC_CAP2_HS400 | MMC_CAP2_HS400_ES);
> +		mmc->caps &= ~(MMC_CAP_DDR | MMC_CAP_UHS);
> +	} else {
>  		mmc->caps |= MMC_CAP_4_BIT_DATA;
> +	}
>  
>  	if (host->quirks2 & SDHCI_QUIRK2_HOST_NO_CMD23)
>  		mmc->caps &= ~MMC_CAP_CMD23;


