Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AFE1CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 22:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jo7zKdiVOAJYhtqSZP04bD0izo8tVND92N94TbY9xmg=; b=EYa9A9LMkm6Fg3kb0b6XQxxRnh
	jv75HqvuaFPZlF1XF0YmLzQmWlbOiT40TtbiY0NJKnXUowoHAeE0UJiQhiK430F0ILWvlJY1KWR6Z
	GqpJcx0sssp7u4tg7uYPR8K2e/lFKt/apBT482XnJo5CR3fyI4VMW6jFJjtsdnRns4Fw6v0RajXsO
	PaK5Hgi0i07dxJWqdvW5Mr8nQPnv30A9mFHIwMgOxWo+TNtsi6AGFpZ48ECxiBigjBDU0R2dh0clP
	BS2q2gP8zPlt4GwOHjEFJzk5He8vdJj+2mfQk0heuRgQpvcSwVqS5+XOHdL6WhyuD96zBfH8tUkVE
	azzSKyMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUtfU-0000000FsO4-0y9K;
	Wed, 03 Jun 2026 22:02:32 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUtfR-0000000FsNP-2R0M
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 22:02:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780524150; x=1812060150;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=1uir/V1PD/sIRdGqSlt5ldKcEDM9EuTxHKYWicJecGE=;
  b=O3P8sik4BiATaBQrs7fWVVAOCdO5TVGPDwkxlQKiNgAX6/I5ciMI0hGe
   CgBs4bLRte6r8TfFfMnrrTG+D7ZTpChir9pDXw+YYoHYzLo3K/a0JKZqj
   pO67FbTOO96HKKPoN7m0mOHZ5xJUmifZgg3xAza7A/iLlH1i2KWBDl48L
   qHFXlQiLnRYbOFCNR19GeMYMO+dRIVRWJwfKIxmP5uYfT9kLOQdVofdVY
   uvfb5t2+KX+ItlwJf+RDZy+Afq9oXgbdYvJ4cjp7qf0LavRzvEWxKFTCK
   XhbB7kBQWC8kf+auMTSIBc55ErttHOOvXbLvAllRjs4HWvOEUkGv7VngU
   w==;
X-CSE-ConnectionGUID: zBEtaqbLRkaBTqFWplyg4Q==
X-CSE-MsgGUID: an4MJyVzQyOkcz7X7MHOAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="81324284"
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; 
   d="scan'208";a="81324284"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 15:02:27 -0700
X-CSE-ConnectionGUID: tWJd9qNvRiy9GTi+dNmKMA==
X-CSE-MsgGUID: w6AxMuaoSLCtdlKm8KGhGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; 
   d="scan'208";a="268268923"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 15:02:26 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 15:02:26 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 3 Jun 2026 15:02:26 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.10) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 15:02:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H0rNYegl19wqCUflscb9zGUTQH3RdFzzYIvAjKvFF6KieKRCCsTvrOw7OF+IOsI4FLVSS0iQj86HohdVu3bhEsXlp9dlheLG2IGZfo/u9X1L605QGbrY1OnqJKgIjeW9i4ZPjmP9LDm3GIWmU9OZFJ7RLfsC1vt/Y0U2FeMFqVxJuVxDqndOXVBafT8VbNjkgUZBXw48omJ2PEqdSDORGMRC93qCqF4lN/ErJKEIv8HuNla1KIC7T+06esq4jYmIC4627XIjhXxUHlgypqwdK4HJqAGpixqkrNL1kimKfBC+z2XvsxmbU9iR8BmtfIKQ2sCPYSiFMldvo31RkF4tgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jo7zKdiVOAJYhtqSZP04bD0izo8tVND92N94TbY9xmg=;
 b=hikFXn6cJLWxVpfCu8Nbldu7GrKuWY95FUgKAvM3H4OHcKZz3V+skgSVCmRFGw+xI9pm7/FcI0v5C0m1b3ep4/OEZ+Feoj1cJIm2iyTzN3qEPN6joM4XAc6thplfvF88rnRMAZqSjyMPS+mWRSXnOB6cmlV5HSOBcPPAbcU93uoByePEwo2W1QfjNdS/YcR2lqcL+CxDdbGGup0FB/X6aEpTR5+C+jEoKaIl3GoJUkXxf4sED69wQMv3pCQp4RvMhUe+u/kbXC+L+3GoP1xUOcjFhYc7MVtI5S5KAfp9DwQ8BeJb1ce8kCcjZQSUfXyR7GVtUaraFZVH3yVMFbw6VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7381.namprd11.prod.outlook.com (2603:10b6:8:134::14)
 by MN2PR11MB4552.namprd11.prod.outlook.com (2603:10b6:208:263::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 22:02:16 +0000
Received: from DS0PR11MB7381.namprd11.prod.outlook.com
 ([fe80::4c39:dfe6:d6dc:6f58]) by DS0PR11MB7381.namprd11.prod.outlook.com
 ([fe80::4c39:dfe6:d6dc:6f58%5]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 22:02:16 +0000
Message-ID: <a46235bb-e935-4a2b-b638-6e9621640a30@intel.com>
Date: Wed, 3 Jun 2026 15:02:12 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net next] net: axienet: Use dedicated ethtool_ops for the
 dmaengine path
To: Suraj Gupta <suraj.gupta2@amd.com>, <andrew+netdev@lunn.ch>,
	<davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <michal.simek@amd.com>, <sean.anderson@linux.dev>,
	<radhey.shyam.pandey@amd.com>, <horms@kernel.org>
CC: <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <harini.katakam@amd.com>
References: <20260601124454.3384601-1-suraj.gupta2@amd.com>
Content-Language: en-US
From: Jacob Keller <jacob.e.keller@intel.com>
In-Reply-To: <20260601124454.3384601-1-suraj.gupta2@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0027.namprd03.prod.outlook.com
 (2603:10b6:303:8f::32) To DS0PR11MB7381.namprd11.prod.outlook.com
 (2603:10b6:8:134::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7381:EE_|MN2PR11MB4552:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a6001a3-2826-4413-ffc4-08dec1bbc5ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|921020|56012099006|11063799006|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: R7Crle3gSn9rQ8UqFhjqbiinQ4JQffWuruKaUOIE3j3/PGWRwBU2SkL4g5BUk1UxnQ/ZyGQz216mmrKDyji5+o3P4pFTPreRxFdRouaRgL50KxSS1leCKX6Aiq+NIx9YAXHLoIpMwh1i206XwD9OzBz13AybW+2KFH35PkyNgpCec7yUlFN/E+aQ0Q2uZUj9fT1kbZdfDmz4m69qD1wjxrd8qrSLUW11ggcZnmsSeRM7HyYRP7J4JaY4cu36b6Olih/K2V3UgTsK7OsDpI8OPp7loodtKVh/WFhrNTymKWDZYUdnzl3eXuobgzrpzSPIn182aK4wYFTz1bmf0Mzaoz1NqWn7eyZJvAbA0gGBJZXfpfWEW4ghgTZ+BYFBgRQvBh7LtEx0Uf59CysH+oA1HzRYXtRuBXSDFAzWLeiP4JHadgGLlpD7GvPcv3Zb0n6fGz2XDt1guk0vBzBkoqT9vKJvA0mhGfRHotukZFGGym56yy3sBrd1GXrVlp0bmlfZgXT/qN4wAb57ytNvyf8rUzKNzZYP2J2boSmNSjRQp0vcUinkrTINWMjKvbJ2Eeblv+lvKm2CO7Or4KNVleKp87kHKkh1MESVI4GVbOjnZGyUhRoUe/v9dFighnWWIO73tFL7nJWYuDNdhZANSpcqoPLZ49Gd6sumtkACWw55NBpTs6pekSNYajMPp8sTXdnN16X6YCH9RbfpkvLtGGfQI16hlx1wKRK3xA4dad5OitU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7381.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020)(56012099006)(11063799006)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?STBocFVMMXNPc3RDcnlMWHF2cG8zZkF5RDA1dEhLMElycXhKWXBUUklSZ1ly?=
 =?utf-8?B?Sy95VlBJdStieTRHbEZxNmNTS3RldE5wWFRkMkFzcENiVmRsNDJNK3l5cWdl?=
 =?utf-8?B?UDB0ZEs4bHd2SGIxbFJGM2cvSFBHTENxTlB3ejN0UGtjZnh4QWJtRGY1M3dL?=
 =?utf-8?B?c3VIbnl3WDBFYXpNZzFpdllNZXlDTFM2ZUcySElzZXM1NHNBQTNLZVJGQ1BP?=
 =?utf-8?B?dFBWR25BemVnTzk0S0lMWDBhV2JSL2ZwNkduUGxHTUVMajNreVhJZmlueUtO?=
 =?utf-8?B?bG5hTE5GTHVsODBpb3FSditJY0I1cmN0NUhYTDFCdUNXdExIeVJpaHJpT3A1?=
 =?utf-8?B?TURhOXd2SUh1VDZkSElTbTRlc3E3RStwMDlTYWsxQ01GbEx0SExVTGw3UXdO?=
 =?utf-8?B?NjZCQVEzVGM3OVlzbnUzcWVGSGVVaERHRElPaUpXc0pzK1lFOW4xYkkzMnhG?=
 =?utf-8?B?YmNEQW1nMGtMeTNoMU1hbHh5aTJjaGl4cWMyc1BmZ0lESHF3Q29iOEVOOU9H?=
 =?utf-8?B?eDlDNHQxeHgzTFFuY2Q3b3VOVjMxL2FhUEh0STZtUHVkMEJ4WTI5Wnh5bmto?=
 =?utf-8?B?dklvY1FZZDRuY0JqK2wxblE4Mzg2UU9LelVwSzVmQW94ZytxWUJoMkhRcEQ4?=
 =?utf-8?B?bi9JM2s5VUw0QzI2Z215NGgxbU9IeE1OVDZqNFZQTmdzbHF3VW00cms2UmNO?=
 =?utf-8?B?Z0JKVyszeURRWUhVUkRkZFRPTUNkZ0VFbjUzNDlsRGtSbXdpd1NkKzI2VnJL?=
 =?utf-8?B?aXlJb2JyK0EvZFV0aWo2NEc5ekN5anVBT2JVRngxRGZ6anA4KzRoRmdZVGpS?=
 =?utf-8?B?Z2ZidEJiZzViRWdFem5yWFFlNy9PRGJpN3YyREZOTGphbUNSN2VtNFcyV3pp?=
 =?utf-8?B?bTBhTkFmcXpjK2pURGY3SldtRk9abk5vQjFQOVhmNk8rQ2NOa3p1R3lqWk1w?=
 =?utf-8?B?bC9YejdsVG9JcmE2cWpUUG12NHVhREdnN3Q3TFc3ZFc4MmRUQ3FocjVtaC8v?=
 =?utf-8?B?NDhlTEh2djlic1pmKzk3WTNYdTRCR1BUNEV2VjFGSTZaY1lQTi9CZXFRd2lC?=
 =?utf-8?B?eXNraDhyZy8vNGJwZnN6aHVmL2xTNGNsYUF1UFhJOXEwUkxYWVRJOWZQcllp?=
 =?utf-8?B?dGUrWGo2a0ltMjlmOGxRNXlTbDBMNUgrTzBKRGMwVEp0diswWEVjSDdzdWM1?=
 =?utf-8?B?dWhIc0RKL0k2SHlQMEFnREJxZHpCOXRVdldXLzFkMThqVWRaaCtMaTliZkxq?=
 =?utf-8?B?My92L0VRZlZ4Q0VCVmJkaGtnRlJydjcvQ2RUem9zY1NtSTZsaGxZS01BTStz?=
 =?utf-8?B?YVN4U1BZcWhCZHZHUVE2cmlJVGZrRzJtNGIzSUQ3aWJlMDdqZFJVNjY2UnRB?=
 =?utf-8?B?cHUrMHBZUFpxYjhqKzNBV0Z2OEl4NVc2WWdRZFVOeFNvS0EvL0VHSDE0OUg3?=
 =?utf-8?B?Z2VSY3ZiMjk2U2Y1eW1kMmRuc29ZcXA0cVo2NUYxakpxR2FBVDFpQ1R1R3dB?=
 =?utf-8?B?eE1JMkNGSFNrbmtvQ2NMdGZzSHpoRG96TVRibzdtMFBmbXROM0ZBTmhiRFVP?=
 =?utf-8?B?V3ZvQ1RSRCtrRFd5TC9ORGNIV2U1WWNVOEdONTEwbHdFN3BkWUVUYmQxQlA3?=
 =?utf-8?B?WFZYdkFTZVdPVDRPYTFyVUpkcFdMaitvVi9JVzBvSjBUeXZobFpSY3lsekkv?=
 =?utf-8?B?THpCelNibUZJVlVjb1c4blFXNUVsMlZxaW9XVzJMZEFNbzY5bEVzS1BCUDR1?=
 =?utf-8?B?aUVIWm10enFMOEwxNk1PNXZSWWJjWFNGaHhoY1dyTkM4TlRkRzMvMHlRWTUr?=
 =?utf-8?B?L004WGRnbmlhcCt2MkV4MGRSaFJDeHNUUXR1RmJoUzNwZ0tBMzhmVlFqY0ln?=
 =?utf-8?B?VitzOXVXSHM5ditkeDNNS1FFYXhzOWp0a1NKSE1JdTZGT3ZCQjNYOTRNYjFN?=
 =?utf-8?B?bFpYNy9KN2FvTGdETVhueUNFa044TGpiQVlUV2RSeDFFSDVsV2xiT0g2aXpU?=
 =?utf-8?B?UDE5NmVSQkZnNXZxRlpnNFJ2VDBqak1ZR2NBbzMzZTYyWWtuNnhaRVpKQzJv?=
 =?utf-8?B?Vlk2VkVvTTlMWTZycEhtb1FWeXVNdzd1RncvV21LNzdIeHBKOUJ2bld5SzdU?=
 =?utf-8?B?VjgvWU9QN1QzaTJxNHg0UU0xMTI3QlhVOHRtTkN6YjZrMVRqdUx0eG1nNDNU?=
 =?utf-8?B?cHJ5Znk2WTcyd215WHJxblZBZzM1ZGlBNmVPV0dKQ01nVjVXYmMybkZLWFZX?=
 =?utf-8?B?NkFzV05iR3NCSmJwL0JnVTFJeERrRXphN2JFZUh2cWtIYlVvdTc4Q0VnODF3?=
 =?utf-8?B?cFFLTTZVa1BCMno0eTFqMEZueVhMczk4UG5XYmNPbDcrYWZGTFFBcUV3QmRD?=
 =?utf-8?Q?a2WcMNcTcx2GivO4=3D?=
X-Exchange-RoutingPolicyChecked: YPuJ154eXZSjS8kDr9zcU7JeFJJHL0FA62fJ/02Z8GVNYhiLGeromY8lof3YaLiW+gwyIMs56UH7a/qm2BmoBavhqj9lgO9gYf7nkBmWDyYabruxbw9LEs0LYHFI4+SjdQk4kxXfnkdYbXvinpzljdxIBT7SWM02tQbR+RWJE8ctrqX7FrkuxcvqWoaexCeJjVFJ7o2vGWSQmRYGKIOLgavOWE1k/GMd9KRG2bm5sV492sEsoiZe+72X+CcszW+dr4j4JTkP8OIaDIk5Gh0l0A8C2ka/YyqDbzAjU+3FcBzZ545dLHAHEM4lvow7rcg254AfPAhB/w3JS6qvz5VrwQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a6001a3-2826-4413-ffc4-08dec1bbc5ef
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7381.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 22:02:15.9145
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PVV+Ioxw6ImWM9yhvgw/X1sinOWQkMhheiKHkiCtM3ck+6wf2uq1clVmlzWYEF1XvNAGLX0uxaig1l6KzUV0otcIhqgQzoXP1CzX+MHrQto=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4552
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_150229_685505_33FA064B 
X-CRM114-Status: GOOD (  21.99  )
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

On 6/1/2026 5:44 AM, Suraj Gupta wrote:
> The dmaengine path shares ethtool_ops with the legacy AXI DMA path,
> including .get_coalesce/.set_coalesce that poke XAXIDMA_*_CR_OFFSET
> directly. In dmaengine mode lp->dma_regs is not mapped by axienet, so
> those ethtool calls touch unmapped/unrelated memory and report values
> unrelated to the channel actually in use.
> 
> .get_ringparam/.set_ringparam only touch lp->rx_bd_num/lp->tx_bd_num,
> fields used only by the legacy path for BD ring sizing. In dmaengine
> mode the descriptor ring is owned by the dmaengine provider and these
> fields are not consulted, so reporting them is misleading.
> 
> No dmaengine API exists today to query or program either coalescing
> or ring size on behalf of the client, so neither can be exposed
> meaningfully in dmaengine mode.
> 
> Add axienet_ethtool_dmaengine_ops without the coalesce and ringparam
> hooks. Also move the ethtool_ops assignment from early probe into the
> if/else alongside netdev_ops, so the legacy and dmaengine paths pick
> their respective ops in one place. No functional change for the
> legacy DMA path.
> 
> Signed-off-by: Suraj Gupta <suraj.gupta2@amd.com>
> ---

Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>

>  .../net/ethernet/xilinx/xilinx_axienet_main.c | 27 ++++++++++++++++---
>  1 file changed, 24 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> index 263c4b67fd5a..fcf517069d16 100644
> --- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> +++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> @@ -2536,6 +2536,25 @@ static const struct ethtool_ops axienet_ethtool_ops = {
>  	.get_rmon_stats = axienet_ethtool_get_rmon_stats,
>  };
>  
> +static const struct ethtool_ops axienet_ethtool_dmaengine_ops = {
> +	.get_drvinfo    = axienet_ethtools_get_drvinfo,
> +	.get_regs_len   = axienet_ethtools_get_regs_len,
> +	.get_regs       = axienet_ethtools_get_regs,
> +	.get_link       = ethtool_op_get_link,
> +	.get_pauseparam = axienet_ethtools_get_pauseparam,
> +	.set_pauseparam = axienet_ethtools_set_pauseparam,
> +	.get_link_ksettings = axienet_ethtools_get_link_ksettings,
> +	.set_link_ksettings = axienet_ethtools_set_link_ksettings,
> +	.nway_reset	= axienet_ethtools_nway_reset,
> +	.get_ethtool_stats = axienet_ethtools_get_ethtool_stats,
> +	.get_strings    = axienet_ethtools_get_strings,
> +	.get_sset_count = axienet_ethtools_get_sset_count,
> +	.get_pause_stats = axienet_ethtools_get_pause_stats,
> +	.get_eth_mac_stats = axienet_ethtool_get_eth_mac_stats,
> +	.get_eth_ctrl_stats = axienet_ethtool_get_eth_ctrl_stats,
> +	.get_rmon_stats = axienet_ethtool_get_rmon_stats,
> +};
> +
>  static struct axienet_local *pcs_to_axienet_local(struct phylink_pcs *pcs)
>  {
>  	return container_of(pcs, struct axienet_local, pcs);
> @@ -2792,7 +2811,6 @@ static int axienet_probe(struct platform_device *pdev)
>  
>  	SET_NETDEV_DEV(ndev, &pdev->dev);
>  	ndev->features = NETIF_F_SG;
> -	ndev->ethtool_ops = &axienet_ethtool_ops;
>  
>  	/* MTU range: 64 - 9000 */
>  	ndev->min_mtu = 64;
> @@ -3021,10 +3039,13 @@ static int axienet_probe(struct platform_device *pdev)
>  		lp->use_dmaengine = 1;
>  	}
>  
> -	if (lp->use_dmaengine)
> +	if (lp->use_dmaengine) {
>  		ndev->netdev_ops = &axienet_netdev_dmaengine_ops;
> -	else
> +		ndev->ethtool_ops = &axienet_ethtool_dmaengine_ops;
> +	} else {
>  		ndev->netdev_ops = &axienet_netdev_ops;
> +		ndev->ethtool_ops = &axienet_ethtool_ops;
> +	}
>  	/* Check for Ethernet core IRQ (optional) */
>  	if (lp->eth_irq <= 0)
>  		dev_info(&pdev->dev, "Ethernet core IRQ not defined\n");


