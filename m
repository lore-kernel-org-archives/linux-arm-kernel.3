Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D98F6EA3F10
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 06:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=99rLVnFT7zz77DdpD4tefDoKWFDN9c2cfmMAAsW1mwM=; b=E15+Y7TjrJiC5wbzqTGTFBffb8
	QU4mE3mo/rfpsu9hP5c/luaTpjPiYx8gFVAZogSlZaXgiBAyD+AnMasV62gv3SQlZI1WkdIVgIw/G
	q782T2ZkWi2mb08422tWIlhkI8+3P4B1hRxct376KHP7i+iM7iLoJjzcZB+rDwBfwJlU67p4nLrPy
	Xplfb5/VvVHRzdaipsNuuT2ch9bFKAIZ4Z4AXMRgUATHU4snc7imJ63JUb9Zdfc7G1CXBBCmnnnX5
	77hGNVyknj7tvTsWNmgjtphYLpipQTTjWrhA06aSnRH78DnOvn2phH4fWk0Hsqo9V1rCIPtCf/huG
	wPrFHcUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vphO6-0000000GXiu-2h5c;
	Tue, 10 Feb 2026 06:38:18 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vphO2-0000000GXiM-3r29;
	Tue, 10 Feb 2026 06:38:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770705495; x=1802241495;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=iLSKsdkrPit6NeLuu98fcs5+mhF/YPqnne0B3MYrqJ8=;
  b=WhTiLxw8HzqNcAAkx0osyE8yBJCXww79SHIl4/oRwopFq3m4CAUw05w1
   4HgFRThLQSJVo9LOS9Cizkz/2GEx1yRExTEN3/RFqhf+qqYZj4wpHTn+M
   geC4ijx4CyTlKR0wsqFTHtz7q1JYTlWa9gUAigNHcOs44M3K7qF/pRUwH
   Cwszl8ylYQhUeiwZq6LIxMiqCwVpMSjksX2HGYXJ4cmVZV4UrSxZEGCma
   UfviAM/O5sf3OetGc5VCt5NU8aiVZo7kzt0maKffvwHduGGxe0Qb2RR5l
   t+aRBi8MHuaISzSq+rjCduHuN6K/ItFtIHQV3tdi/W1Kv5C2hydPY5T/L
   g==;
X-CSE-ConnectionGUID: fywm4jqBSUOJXBXw/4l1zA==
X-CSE-MsgGUID: TqVlxD8LRI24oR/94un5Rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="71813477"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="71813477"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 22:38:12 -0800
X-CSE-ConnectionGUID: n9UZxZHGSsaMbL08RLVZNg==
X-CSE-MsgGUID: fctEt9j1Rpu8b2rUu4bk+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="210922269"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 22:38:11 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 22:38:10 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 9 Feb 2026 22:38:10 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.62) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 22:38:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NXRysPcxHa/mNFU/qMULI7Q9Zy9E4XO8bJAHEiULWwOZokBoYTG9MtSWROzAJmFjSbSfn1gB+uYo1/BeAyRPIANkbETmiRCqlZsHfYi39kUD6d3TweZxPMCF1/McZcSoAK2SFt50I0eTwuz6qpyI6Ch6wPH6bzaMEP08+iSmj3SgLN80uwRWkNTuxNP4tETIw8FJ29GSBhzqWVyMOgJmXClnfFyQrP3FH05SGEIqMDvWb5hFX/TbsT3iZLuYK/gfNgvY6zMopx4Q1DGc/aPbMSX4E+jk9UMu4Watoa8CGRVrkDvA97G8fRpDW75UKvaL0mP11zETUwbzM117u9JbpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=99rLVnFT7zz77DdpD4tefDoKWFDN9c2cfmMAAsW1mwM=;
 b=RX0U8TVxu/WRhwTJXUo+taLUiM2kJIZKEmiA5cTCpRBZs9xGuq9MoD0tyVHOaxmmfox0qnOWkuvjXezhGuNMurZv2HJ7Z02KfK3x5LbMJsZjad5oTNEIHMPBguDHHpVwwo4C4lBIUaFYsOQE3rAt1HO3j73nx0hER9D18FuIGmvLn2haJGNKWDjr5pd1Zxxnh3BNb9+DzOkEIDE+nrXWOr7/9ZlhzAhQmO05kINxV17Uzv9Q/FT/a3MYl25aL7G3DRbWfihrwl1JKm4BF+z4yi94Y0+kGmvDf08rsytPXoe2l3kPw9YcKHbV5LCQSJ2/c8Io17YAGJ8wrU2Bb+Wi5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by SJ0PR11MB5085.namprd11.prod.outlook.com (2603:10b6:a03:2db::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 06:38:08 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%6]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 06:38:08 +0000
Message-ID: <3cfcc4b1-9b7a-4c83-9323-9f37f76271c2@intel.com>
Date: Tue, 10 Feb 2026 08:38:03 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] mmc: sdhci-of-arasan: add support on Axiado AX3000
 SoC
To: Tzu-Hao Wei <twei@axiado.com>, SriNavmani A <srinavmani@axiado.com>,
	Prasad Bolisetty <pbolisetty@axiado.com>, Vinod Koul <vkoul@kernel.org>,
	"Neil Armstrong" <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>, Michal Simek <michal.simek@amd.com>
CC: <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mmc@vger.kernel.org>, <openbmc@lists.ozlabs.org>
References: <20260206-axiado-ax3000-add-emmc-host-driver-support-v3-0-ef83b09325be@axiado.com>
 <20260206-axiado-ax3000-add-emmc-host-driver-support-v3-2-ef83b09325be@axiado.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <20260206-axiado-ax3000-add-emmc-host-driver-support-v3-2-ef83b09325be@axiado.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DUZP191CA0036.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4f8::28) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|SJ0PR11MB5085:EE_
X-MS-Office365-Filtering-Correlation-Id: 243b8f89-dfbc-4299-020d-08de686ef412
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|921020|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L2pwVkFXM2ZrQjBpSFFIeFZKeFphVCtmRHFoS3AyZzJQVHo5eS9BZldiN1NQ?=
 =?utf-8?B?b01JcWhBelAzN0xPTC8zY0NnaU1rWUtIU2ZzaFBPYWovakFmeVVNYXNjUUJW?=
 =?utf-8?B?OUNtMEkxWDNJWUE3NVlyem45Q0wyVWp6djU2SDZmc0VZVE53MlRRaWdzTEtX?=
 =?utf-8?B?ajBmWVVLSGtXMGFBZXgxNnZNaDdpSDRQN2doclZRQTRudGNrZFNnK3RJT2h1?=
 =?utf-8?B?SThQWW1Wbkdjc05EWTdvSTkwVXMwdDlrQXZJNkFlQmtUSC9FZHhLamdPckRR?=
 =?utf-8?B?SHpiQXVqWWppM1pmamJDamFsdEhLMzFnMTRnQUJTd1lIZTV0T1FtVVBtVGJp?=
 =?utf-8?B?K2VWZmxhT1RPdVlXQ2RJZDV0eG4zamdiMktwQnV2SWg0a0lrZWFiWDVhWGMr?=
 =?utf-8?B?YUlXWmRZUU9jMjlOeTVDU09pUEpHUERjbk51cDRReStpdEZwTVZjUWNxMUNG?=
 =?utf-8?B?elFZNjZSeTQrRnRqTER4NDhlbjN3SThjeU1WSFh1OVNjZjl4UlJ5Nm9yN2VP?=
 =?utf-8?B?cmpMSUlUQzhwd05EY2VGcTlSdm55Z2M4amN4Yy9BTkRNU3V5M0JDUkZTRkhi?=
 =?utf-8?B?THA1VkFiNlZTTjJyN1UwdnNXY2FCTkhNcEMvZUpZazZOZEtKdUhRN1FvMnUz?=
 =?utf-8?B?YkhsbEpPTzdvcXZFelZlcVdJMjZXbkZaaHNiYnZzUkZLZlRheTlBanRsamxO?=
 =?utf-8?B?M3liMGtoSHNtT1N0V2pkKzdPSmFQWFdjMHVpVUpHSEtrQ2FkV1FibGRiNkFy?=
 =?utf-8?B?UlBXaDlxZ1A2ek00ZXBadHMvTFZWblNQUTBuTERLSHdkYXo0amNnVUdya0kw?=
 =?utf-8?B?UGJublp0MzN1S0ZXengzZmk0QUJwbHdvUGlpM09EWTdzZlUrNzB4aWovZmFS?=
 =?utf-8?B?cTF4d3BnMFdxYVF0NFcvVGxlVTlqZERXMkM5d2tKdm9jNWdUUFdlbVN5VFc4?=
 =?utf-8?B?MXZXdnJqOEJsSU8vcmhMY1N3elJKcTBqTzdPY0FyZW9SSnZYVFFubThXU3BB?=
 =?utf-8?B?VVJvTUdpYVV0cU53WkZONFQ3VDNEdXJCRWRsazI0ODY0OEpBeVhrNm92Qng3?=
 =?utf-8?B?am9STVZmUTNHUTJDbklIMlR2Y1JmSkRjdzV4UTNVdTF3Z296ODBWN2JLd01M?=
 =?utf-8?B?WlRISE1tNzg3Mmo4L0xoam1zYWpIaFdmT05EWmdwUWFXTVhWZDd2VG9lQ01D?=
 =?utf-8?B?Q25NQWlLeFNxaldXOVA3R0FuaWtBbU14N1ZNdDg2YW5qSnRMajFlazJPZkQv?=
 =?utf-8?B?WklDWW1COEtzc2FaUm12SXpuSzlKbkRpZk1iV0Z1R0dmZklWWjRpeWdQcVBO?=
 =?utf-8?B?b1pCM2ZGM2xSOGFFWi9xK1l3MDQ1d1lEd2JYUDlEL0dSdGRxOW1vU2xmUDhG?=
 =?utf-8?B?WDlSS2w5L3h2akNGMGZnaDhvSFhjYzNmVzJQQzROdTBKZ1NFc1BOK2k5eGZ1?=
 =?utf-8?B?eDlQOXNLZG5jbWRVVm52cFY3NXc2ZGhUUXo5eVRmaHJuVkd1QVZzUVhNZGhr?=
 =?utf-8?B?TDlocnFNZjAzdzVpZldXVDExYU5VNEpVSEFFcDYwK2hDTW1ncnNLN1Z6YWdn?=
 =?utf-8?B?bFl1T1A5RU4xSStQcG5oQUxRNWgwOXZnTk9PeDIwNUFqbVFsQjROdGFxblkx?=
 =?utf-8?B?dTAwNDM2a0l1emNaVG1YL0tTOFhYZWRDQ2F5d0lPMk1EcmkzKzVVSWRiTWg3?=
 =?utf-8?B?TzlxMGtkaHNsckdYS0JybUFPVmM2ZkI3Vno0NVlMU1dGV3hmRXVCUVk2YTVp?=
 =?utf-8?B?c0Fxd24zTythSTdKNVRvejA4VXZuNnVUU2ZVMURlbkw3TXBwb2RaNXVZYzdL?=
 =?utf-8?B?bGFQZmRnc0UrSHRtWjlpN1dYUGwxQnZCZGxuNHZ1Uy8yeFl3WGFkMWhlTmx0?=
 =?utf-8?B?L0JxYVB4WHBOb2l5amlBMWRhYU5nS2wwVWlBWkJabHlJZ293UDM0OTMwWnps?=
 =?utf-8?B?OUhQbnJES3pRYi9jU1N3NE0ycGlsTEZlMU1CWTV3eW56amNUM1JFMFJSSmJt?=
 =?utf-8?B?NHBrVk1WQUNFZ3E0T0hGSllZYS95MkFSK2ExQThKMmVGN25FQVNPOHBPUUli?=
 =?utf-8?B?Vzc3c3RYUmx4azBRUjF4MVUycC84ckk0SEx0aWNsaFhBb1ZsT1lZYUtwOUJ2?=
 =?utf-8?B?dUlQUTF4MTJGV0NtcWVydmpHd1Nya3JKeDNFOHdJZnZGVVF0V096bU9JZDFF?=
 =?utf-8?B?Y0E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(921020)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Uk9GU3c2Q0xkRnVlaG10cXFjWGVzMzBVeXVOV2RwU0x6UncyRVhQY2VGeUZr?=
 =?utf-8?B?TWc1OFNpV1djeDQ0bUY5WGdmNWMrODNoeGw3ZWF0ODRROXpSZW85YTRoTnlm?=
 =?utf-8?B?YVMyK0xOeDVaY3hkUUdRV1ViUDhoRFFuTk45WXhpUGFJaUU2alZkV1JINjkr?=
 =?utf-8?B?ZmVnVDRCZkRsL2FiN3ZXS2dSa2liWTR2V0l4emZtVDRVWGhyaktJaXhpd1B5?=
 =?utf-8?B?WVEvUXV0bFp4R3dDNVYwckVOZks1TmlHYkRNUTFodGdaSjA0MzVxZERvWnFz?=
 =?utf-8?B?cWU3NVRoY3RtSFI2SDMwTlB4YVRvZVZzZmkvN1JveUVhYnB2RWxDSjhwcEZU?=
 =?utf-8?B?ZVdId25sWlNkU0pNNWV1am1OSFErUjhmUk1KWVNoWUlpemI3VjVyNlpKU3l0?=
 =?utf-8?B?VTU0Q2p2OUZzUnNiZ25YeVJzYzBGWnNUd0EyRmFvREs5akNFbjI0OWg3T25X?=
 =?utf-8?B?RVVRd0FieFRjOVc0VENRakNibnZ0MElyVS9wNUZCMldITHYxblRDYlBFdXl3?=
 =?utf-8?B?OU8xbVFqVEx3RkJEUW5OaGVwem5CMW43MC9tc2c1d3M4TjhRdG96N1JMZGVX?=
 =?utf-8?B?c2VJMTFlN0hzVExZRHVvdkw4ZTNTWXZ4MWNObWtUdzVPQXo5a1g0WjUvSTJW?=
 =?utf-8?B?cFozOGRRNEVtSU9uTkhJYk1JS09HMklZM3I2UmVNY0Z0OTJuUVJkZkFRbWFF?=
 =?utf-8?B?YVNFQkZsOHR5WTZ3aUI5L0lnaUVMcnp1SkpBYnR6YkJZMFA0T29qdFkrUEJT?=
 =?utf-8?B?WnVBQStIRzY4OFRIdjlPa2dYV1RhbS9VeEdINDd3TmVjWno0SGtiQ1pKcGox?=
 =?utf-8?B?R01acTZES3NuTWRmK0xmV3dSem42dlQxdlpjMjd6V1lQc21melNvNVBLS0M4?=
 =?utf-8?B?KzJUbG02UDhMdjFDVVdXRllxUi9kdHowRlRHRHhTaXYyTjJmcDVTOEM4Rm5L?=
 =?utf-8?B?Vy9oTVdIeTE2dW80UUJtaGpmaDZpUVJOS05wY012VVdsK0RadUlLdjFwU3BY?=
 =?utf-8?B?YUt2RStFV0tTM3pDQ0x3RGhnQk0wV1RUM1V4S2hsTGwyOUNrSHJ5OUwrSm43?=
 =?utf-8?B?L1dFcTlkeEFHYkJ2SjJadE9zVW51SEpFZ3c5QmlGVkRZSDVzemtLWThHeXZl?=
 =?utf-8?B?Z1FPR01SUDJsUkpEeHQwaFhmbkp4OCtrKzFtSzZybGhoU0FRTEtld1JJQTZ2?=
 =?utf-8?B?cUdHdHkyaDByT0tudmJ1TldPeGEzTDNzV21KSXFmV1doa0ttMHJ2cGw0Z01M?=
 =?utf-8?B?dTdkd05CSzUzUSs0NUgwWnA2VTFIc1dnS1RtK2xJUmxCK1JwbXBqTzR3THlj?=
 =?utf-8?B?WW1YV3BabmxRdnRGK0dHREtlY1JGcURqWFNodTd3L3pCSUlsdlcvN1VCamNN?=
 =?utf-8?B?bm9XTXV5MW51eXNxamZiYXk5Sy81OVpyNkRPaHdpTHNzRWJTTWJFUkIrME1h?=
 =?utf-8?B?NDJpMEdOcEFjNWhjNm5PNjhWeG9lTVBmWldmR3FqdFRpRmVJVCtqNDJ6SmJU?=
 =?utf-8?B?bGJRWWZWN3FrWlN4emdHOGVCdGhVeUJwRHZnNjJ6aFhnNFFCdVpOOFc1T3Ja?=
 =?utf-8?B?S3hiemtqSEM2YVk5clNtdzBiTXQ5MVNBYVJRUjg5Yks1ZXc0N012aHcxTjR4?=
 =?utf-8?B?VXd5aTBmdnFNL2lmVWpUbUh5MnBmRE5HcFlSRVMwMWg5NmJER0NlVkJTLzZC?=
 =?utf-8?B?RWtMUlZiRXF1eE9sUURQSWx3SkJaV0pyY3dlVWJzbWFqczVtaHJSbUc2eE5H?=
 =?utf-8?B?WUZtdk5aNng5NHZOK0FhdnVjZm5xVkhvUmc2SjVERFlJRmhUUnR5NWhJd0Fm?=
 =?utf-8?B?Mm5iUlJORkY0T3pOMUJMN3BDKzVUSW4rZHpIZFpCUHVQN3I4UDZKL2VGOWNm?=
 =?utf-8?B?OEdRYmlzRFAxTXRmUm11S1dQZ2JsVUdTVGQ1SWJqVVBSWm0wZGpSYnFidmZs?=
 =?utf-8?B?NldJa2kxSGtTQnZ1UlNuYnJ2Nm5Uak9WRm81aENkMGJ0ZzM4WDVoWUplakc5?=
 =?utf-8?B?ODBWR1F2eXpsQlYvNVJNK3VncDF0TUR5SkoyL0FjcmUyeFB1dk5USjVXZlEw?=
 =?utf-8?B?UkNmVXFOczFJRjRtenRaaWw0NStzbFVhVnVqbHFrSE9BVUgrNmJaRmtKMDkz?=
 =?utf-8?B?ZklFMTVRQnBSZ1Z0em5IcStWQ00vOFNzdzhyMzVqdmJqaXdHUk9oTElWaStm?=
 =?utf-8?B?OTAvN3NlcHpwSjV5eUYzeXF2emdqcDZFYndkWlBoVTcyTWdLSUUyWEVLT0Nk?=
 =?utf-8?B?OFY3TVRSYlg5dzNtc1VhZHBnV0pWbWRBbDJGYzl2ZXRLNEtRcVhjUGV6S3NP?=
 =?utf-8?B?M0o3cFpyQXd6aGRHZ1NWS0wwMmVCdjBrZklhUVlWcWRZRWxCU2crdz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 243b8f89-dfbc-4299-020d-08de686ef412
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 06:38:08.6767
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y727dBO85GLuyLPxs3D8VgAyfXfA9v1Ne6+8wd8GSxybZBWTfHa50YMe2fIrde/GbjEyCZROQf2y4ZFLkkgkfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5085
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_223815_056253_4A12E52A 
X-CRM114-Status: GOOD (  14.01  )
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

On 06/02/2026 10:23, Tzu-Hao Wei wrote:
> From: SriNavmani A <srinavmani@axiado.com>
> 
> Axiado AX3000 SoC eMMC controller is based on Arasan eMMC 5.1 host
> controller IP.
> 
> Signed-off-by: SriNavmani A <srinavmani@axiado.com>
> Signed-off-by: Tzu-Hao Wei <twei@axiado.com>
> ---

Acked-by: Adrian Hunter <adrian.hunter@intel.com>

>  drivers/mmc/host/sdhci-of-arasan.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/mmc/host/sdhci-of-arasan.c b/drivers/mmc/host/sdhci-of-arasan.c
> index ab7f0ffe7b4f007a58eb0a26868b08b0b02b40f3..caf97238a58b487312d6cc2b7a868913ace60f22 100644
> --- a/drivers/mmc/host/sdhci-of-arasan.c
> +++ b/drivers/mmc/host/sdhci-of-arasan.c
> @@ -1512,6 +1512,17 @@ static struct sdhci_arasan_of_data intel_keembay_sdio_data = {
>  	.clk_ops = &arasan_clk_ops,
>  };
>  
> +static const struct sdhci_pltfm_data sdhci_arasan_axiado_pdata = {
> +	.ops = &sdhci_arasan_ops,
> +	.quirks = SDHCI_QUIRK_CAP_CLOCK_BASE_BROKEN |
> +			SDHCI_QUIRK_BROKEN_CQE,
> +};
> +
> +static struct sdhci_arasan_of_data sdhci_arasan_axiado_data = {
> +	.pdata = &sdhci_arasan_axiado_pdata,
> +	.clk_ops = &arasan_clk_ops,
> +};
> +
>  static const struct of_device_id sdhci_arasan_of_match[] = {
>  	/* SoC-specific compatible strings w/ soc_ctl_map */
>  	{
> @@ -1538,6 +1549,10 @@ static const struct of_device_id sdhci_arasan_of_match[] = {
>  		.compatible = "intel,keembay-sdhci-5.1-sdio",
>  		.data = &intel_keembay_sdio_data,
>  	},
> +	{
> +		.compatible = "axiado,ax3000-sdhci-5.1-emmc",
> +		.data = &sdhci_arasan_axiado_data,
> +	},
>  	/* Generic compatible below here */
>  	{
>  		.compatible = "arasan,sdhci-8.9a",
> 


