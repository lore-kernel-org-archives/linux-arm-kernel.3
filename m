Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BB74C5DF7E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 11:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SaEjOw4bbiHU5AmfGRZhXDiP9GNCNd/Ccf5O6WZJkXI=; b=LN9nKK7JDpPUZXJDtDMJswwpH5
	hKfg7aW7J903m8/+TSUOAzVLtm8TcA7ES96lnxyNc7rJqKhEHFuw9w7ZRZxQXnxJCuH+DrqWl29Jd
	90zfwnRHkH3KKzVKvxSBnccOcpLa+JKlTK3R8AgzzyA5g//mWCfXvHm6YyqIKlXIAcb9eyUDa5slk
	wku6+ZRzARAugNPfaXT6us2FvhdZzKEnUAdxuYW6Phs2Mpympx9g0LGOfX0uYUjxsqXNeVu9GwKED
	tFWbhv4/VdnpRUF+xuV332QuCld8I1aEcqrlZqlA+rchzvowxxIufvvaWDPmlaU5dbQScjrSBstF6
	zekF1ESw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwHpi-00000007pcK-2GsQ;
	Tue, 18 Aug 2026 11:18:18 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwHpg-00000007pbZ-3sJJ;
	Tue, 18 Aug 2026 11:18:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787051897; x=1818587897;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=iQxwt+KKNJrxnZ8Ca7dkL0+b5brNgExl/o7kNkx20Zg=;
  b=VAEN+XtHXXgBGZRKsvnG3Of2Bj6bs8TsBbCI6lVe/HTamH207MEdWGqi
   205r7fK4wH4GoxUZxF0C5UT/PWgc+UYwDnNgRfJAzL4AozHLIuEN01tA4
   hNogDkbAbth7MZePiG3df7KJLoxuzSUY+LIm2EPr5fLdzo6ssEphut4vh
   2igUBTLSTnLyO0yEhDUSbokRFOD31/O3pbdV5aPl+AgKrQAMsQm44Ch4W
   DgkJ3elnfpbNNteOmOXFqwLr/jpns1xi4aZC2oKPLvuqYZSGkSCS9Fhn5
   TnERz4On4j2qv7QVJJXMcVY5XV7b+Xnvl4IBDM+A3X1Konze7thN/iZ9q
   Q==;
X-CSE-ConnectionGUID: /aR+R3VYSLOf0HqsLvFb8g==
X-CSE-MsgGUID: 9crdrRTISjGEtj5CIGh7+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="87607752"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="87607752"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 04:18:15 -0700
X-CSE-ConnectionGUID: fnLdnda7S/e6pH4Orp/cZQ==
X-CSE-MsgGUID: rSqB3HqaS8an+Ry6LKeQYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="261916584"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 04:18:15 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 04:18:14 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 18 Aug 2026 04:18:14 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.12) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 04:18:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S8CFMttPZI0WrM9pDlPtbTNLf27pYErzw4dkJLY8AoILOlVwhZ0l5NnpAaHCv5kcYnaeCUdyGcrj2GQmxKoIhKbRlnygdC8Mc4r4xLG+ZSXDJS/uPrV7VIIK4plQaJfasZRIQVzQE6RZ4l94OVkjJWtJiQ6KAOZPCPxQm7rlWGDzD3+GBVm9MvTv2ItMYQL8kS0sJZ/tsIWHz/Ya2VgElIaOm47pDyP0BCs4T1068ccv1rjd6azYg+5RuICfHt+mIeH8Jta7Bo6ZHiJlrOi03dkXThzA6HpyY2V/+bnwCOudqAVMyAB7OXbs4pUbf8sUZmQkl7wp7/X9G5uqmWwYUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SaEjOw4bbiHU5AmfGRZhXDiP9GNCNd/Ccf5O6WZJkXI=;
 b=OaHnEilcJVMy8EXeyVClugDJxRkn2N8XNZaOrSD99EZZdRSEN+ZHtxTcnTsqg6wxxGo4eoizDdPbkDTn59KnxetGbzf4jELYZOkyXqKUimqEEMxZetMZF9n2Bs2tD8HcCOI5XhQca2u5tucU8mXIBuBDcFWmyMq/pncR8C4+6xciBsgA/ggXc7qagQfHqk1QgEW3x+KUDK5htzKi/GFZDWrVrZgdEN72+oMgfVS3sEH+mOvLaJyWi6l6HlWX1cV71YeBnJ/6Ri5/NQjv4tVW5Ky+ZigjV4ul01RA0LRLulrrgIk1/REcfrNPA5l/5k5Ub5EKgj7lTOQ1HxaErdGJ/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13)
 by PH3PPFAB4263235.namprd11.prod.outlook.com (2603:10b6:518:1::d41) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Tue, 18 Aug
 2026 11:18:11 +0000
Received: from PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd]) by PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd%5]) with mapi id 15.21.0339.007; Tue, 18 Aug 2026
 11:18:11 +0000
Message-ID: <24e7e485-625a-47f8-8aa7-d172aae80053@intel.com>
Date: Tue, 18 Aug 2026 13:18:04 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] ASoC: mediatek: mt2701: Use devm_clk_get_optional()
 for audio_mrgif_pd
To: Bui Duc Phuc <phucduc.bui@gmail.com>
CC: Liam Girdwood <lgirdwood@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Rosen Penev <rosenp@gmail.com>, Daniel Golle
	<daniel@makrotopia.org>, <linux-sound@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>
References: <20260817104929.63152-1-phucduc.bui@gmail.com>
 <b3dad816-469b-478a-b6a8-a08ac8610ac9@intel.com>
 <CAABR9nFME5kYrLZUMn86sT1RaJiqzJeC7QJzqqxedL1NkZUYwA@mail.gmail.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <CAABR9nFME5kYrLZUMn86sT1RaJiqzJeC7QJzqqxedL1NkZUYwA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIUP296CA0051.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:34b::6) To PH7PR11MB6006.namprd11.prod.outlook.com
 (2603:10b6:510:1e1::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6006:EE_|PH3PPFAB4263235:EE_
X-MS-Office365-Filtering-Correlation-Id: d563ac1c-9d87-4f11-347e-08defd1a634a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|376014|56012099006|10067099003|22082099003|18002099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: HGy9sOWhVen1Ko1BWQGD9S0oog25Tnv7AISq9Tjbh/59VAP60PP+at2o/J01KwS0BctimQCku/y7ZS2MbJJ6CGP3jAq3v/6evkwj67IJ6E8QXi16EUyhs8UZa+sOChlPfq/QcVWisOuNuRba/TdXYAcGreCRu4DzHPr7D9qPcQRTzYlHc4BJOKYReHkZmhQfTWR5YbRQ7kNB/REKfIky9pv7mL7mHjYJwxSCOZwQfAhEvrvfgZ28JVPxsVVQc6/sL4pbxGslLKGb8IX9M3F+7ghtig7Ngf6gmMTEdWThOhX+nEpdfi91BsvS8cfPyodA23IbICVT0oQB98Ifu/UNxrL5WPIRUiLta/k/nkk6p0d/3n5w1c3UO92vTgWbo3lGHShqOwMEz6ZnikKG5PCDuxXJy6+3kSoDXdf8BKDzv2Ku9BfdsWbyq7MTIcliCzBnVpuaG4BudEOwNjPbYNtnF5Mjj4sn6fWIrXJH4mAK+nhOz5gMhTYkwFhUVbbG0VM//l7kWFhMcpN+0k+kvbiQff38MUlWm1MkdGki6B+DyAAZnh1ey2MX1fBXA3k+/+S86LlQ6JcV76xB7AnCF5KukY4JqGx0wpZ/BPrf4a45OW7R1lgWoTx+L1dBd30TPXbkqWffD3Du2Ufo/TdrOSfyYUz6Erc7huknF3DBTZ7uB3Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(376014)(56012099006)(10067099003)(22082099003)(18002099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q1ZHTkl4WUp2QmE3Uk1YejBZV1dWUVNoR2FUdkZTRGREWGJMbWwxWC9La3c2?=
 =?utf-8?B?U25ZY01VYmFXTnZmaVV6SEpZYWJXRUZsdmdjUitmTzRCOFNsTUYyNzNMTFJ6?=
 =?utf-8?B?a1hHcnJkTWJSVGxseEhhS0xiZDFJdGtYaXFXSkNabmlVYVp2V09sM3R1bFpu?=
 =?utf-8?B?OEtWLzNPTEl2Rm43cTRMaGlkb0Q0MUcxdXRZSzJaSGY3OWJQWWZaZElKamRK?=
 =?utf-8?B?Uk9ONlJXUmFESWI4YnFsOU1HSFR2RVgyRWEyV083TVNEOEdCUFFBUDNKMnhq?=
 =?utf-8?B?TUZTckcxUGdaem9CSHFQS2MzWU9uU2dwZUYvZFRsMnowTi9BcnRaVC9nQTZh?=
 =?utf-8?B?N1BtTjlFbHZkektRL1k2ZDd1TzZ3MWpWRFVvWkt6SVgzYWhyei9lTTkvNm1Y?=
 =?utf-8?B?QjBQNWsxSzR6M1hEamRaSHowVGI4VkhzZEdNTjZ0NXRxcjVZVTd3dkZrdTd5?=
 =?utf-8?B?VEZla2xjVTZEY09tUHJ6RC9nWTBDMjhUdGY2eEZpb1ArTVhwZklDb3NnMllw?=
 =?utf-8?B?NHBSR3c0OWlkNjVlZFY1UTJtc0syV3lWQkxKZi8xRzJIV3JRc21naUdDR0xh?=
 =?utf-8?B?Ym8zTVc1YzQyeVdWaU1lRmppM2E1N1pmSmkyL1NFMVdTVW1XZlQyNXRsQ09Z?=
 =?utf-8?B?SnNaZ203bUZ4d05rRjFRWjNCaVhGTWwzL242ZWhsWDdLd2xBaU1qSklTMS9E?=
 =?utf-8?B?dFQ5YzQwVHoyU01ISzdLR3ZCVWF4UTNUL2JTelNubVJZOHhuNkR2YWNHYXkr?=
 =?utf-8?B?dG1rejlobDNyYnJLZGNrVU1Jemg2cjU2NVNrMEo0dytqeGpHR29FUkV5ejMr?=
 =?utf-8?B?VTlFR0RWTUxkL3ZaekxnN08xcGxzYWhRUE9MRXZDVks1WGI4TjlSRUZQWFpB?=
 =?utf-8?B?bnNCRUhIWFFuTmJkbVhaTjRUQzFoUTBhdFplbVV6M2lqWlhZdVhMVWxzb3cv?=
 =?utf-8?B?SlpvL3c4NEhFNk1IVWJiNS9IblgvK0pnSXdWYnh0SkhTSkJUWXRCOThDMWp1?=
 =?utf-8?B?TDV4QWxTY3daNU0xMkF2bXBDa1VXMUhrRkJyM2w2RUtCQnFqNzE0aWNWTmph?=
 =?utf-8?B?bEpTZGU1SjdlL2RmcEJibkN5dE5PNGM4bzZoc0lVbjE3LzRuZDRNRlJJUm5o?=
 =?utf-8?B?UTBlbXIwK2hCS044RHNwVEI0eGxkVGM1RkRMTXRNWFQ5R0Nibm9pcWk1ZWJZ?=
 =?utf-8?B?RExNd08relhXVHNtWXJsMHVWeVJXSUk0Y09wMXJhUkkrdnliZWFsY3h5ZDF0?=
 =?utf-8?B?REJObDU4ZXV6bURwL082dEhiemFBTDlJbHNkZzlyUml2bklUV0l1M2ZhaTA2?=
 =?utf-8?B?QW8vYk8vWG1ZQ290NDNjV2FSenk5SHJVQzNCTkQ1TU5WWmpKRndPMXFJK2xX?=
 =?utf-8?B?TEJPV0FjekpvSHBLcHpEdDNoekpqYzBXc0hSWnUxZHdFTTFGZ0NsdmpsbW9t?=
 =?utf-8?B?MW5DMUFVT08xL0s3NHlqKzlvZjBrOWNnemV1KzhqOHg1aDFVdS9mSUpURE11?=
 =?utf-8?B?UlpwTEFQYWczUVh6MFp2Q1RlY1c1RmYyU0xVdHAwWStGMWdia1JENHBDZ1ls?=
 =?utf-8?B?NEh1R09jY1BPUjdSK09vWWJDVnVVNkxtTUNMdGVCUXdTUW5OcmY4dHQ2dlZH?=
 =?utf-8?B?WXNOcjQ0NzhYSFBBWmxBMjhTdi8xZUlwOHRkZXNqcmRiODI1cWJEVTRMM2pW?=
 =?utf-8?B?SCtkQ2lCNk9DMk03clVTR0RmNE0vYjV1RWVlWURVVGVmQ29tOGlnM0NzbWRL?=
 =?utf-8?B?K0NwZCtaZ1RLNEFHZ2NzaHFFOVMzbVFMekVxOHg5QXE3dkRCdmdDZ0sxb0Zy?=
 =?utf-8?B?N3A3RGFBYUhHU3FrN1ZUNmtOa1QzZDNBYnd4d29iTVJTRW9XbXc2aFJnSE5N?=
 =?utf-8?B?MWFJbnVBY0Q1a2E5Z095a3NSVVJESW1jSUt0NHowWUhSUzRGZ2ozeGh5Tysy?=
 =?utf-8?B?UFFHQWRVb3VrTG9lZ2RIVHVvY1VVaUc5V1p1a0twdERKSVNHUzRqdlRNNGtM?=
 =?utf-8?B?eXdTSkdPa1NkZEJDMGVNa1FSUEVsM2pWRzA0MVZXb0htYzQzNEUrSDJ2MTJz?=
 =?utf-8?B?Ry9IN3FvZWNqaEQrTU1hd3dQVEdUVnNqZDBqT2FwY1N0SzhFcURaODFpeGtv?=
 =?utf-8?B?eDNERWUyQUFMM2VxcHpsdFdTV2VadE5yOVJBbVM4UWgwMG9TdGZ1Z0pBT1ZN?=
 =?utf-8?B?Qk9SVTFPMjdhdXhuMXdlNDBmMytNZE5BMzE1RkdtK1F6MzlRM2NubVM4T0d5?=
 =?utf-8?B?dmp4aDRiR2NxWEhGMmFrcXUxL0plSWJVUUMwUXcvek1PRU0xNjNlb1NpQW54?=
 =?utf-8?B?YVNORk5YbzZWT2k4WmNIN3A1VXMwcnBWcjdhN2x1cGdZTlA2ZWZ0Mjhua0c4?=
 =?utf-8?Q?MozpvN9zVWR7Ktbo=3D?=
X-Exchange-RoutingPolicyChecked: nwQ1ScKcoOLHwGu2OARlEqpUpJ3IaNBfras0PLBYmrJVxA3knWZ/U6kume2ib6mVEBJppXeS6EkXL1oXdq2/7S08+X9YdwXKvjX2iWh9NoLhzOE6Ou/DTniD+lUxUn49foYmx4B9FrcqXC9JBAnFytG5xiNgBLIFGG4ZsOr2BU0zeH/viIIFolja9poCNAGCGV0Eur+sM9UYml/n02YdJ4gJkHmUyp/N8eRcUFqnDjxrsF4MkkT/3oSMa0ld2XZkSStjMWLxOqdStOP+qyKNaDU08CeiXgkuX46+/UIfhM0Hiyk3VwReylVVyOOoDZLc+WXL/XgtByaPkjJz1lcjQQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: d563ac1c-9d87-4f11-347e-08defd1a634a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 11:18:11.3128
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rvk7jxq+WkgVfaaHRQhdlSSMSf/Y+p3gt/obU2c0SrHMEGPY/SEQ6vwOkl1PHu0uEHebZf7KlnD78oyQFJhnjJMuG7TTSvGFmSNsFeHOu6s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFAB4263235
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_041817_015070_B7AECAB8 
X-CRM114-Status: GOOD (  18.64  )
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

On 8/18/2026 1:02 PM, Bui Duc Phuc wrote:

>>> Propagate other errors to the caller.
>>
>> What does that mean? Did the functional path change?
>>
> 
> Previously, the code only returned an error for -EPROBE_DEFER and
> ignored other errors.
> After switching to devm_clk_get_optional(), all other errors are
> propagated to the caller as well.
> 
> Regarding the functional path, I don't think it changes on platforms
> where the clock is present.
> The change only allows platforms without this optional clock to
> continue probing.

>> This should be part of a mediatek-patch-series with a cover letter.
>> Yeah, the mt6797 changes should be here too.
> 
> Currently, the MediaTek ASoC drivers are split into multiple groups by SoC.
> I am handling them one group at a time to make the review easier.
> 
> I will send each group once it is completed, rather than waiting for the entire
> MediaTek cleanup, which would take quite a long time. A single series
> covering all
> MediaTek SoCs would also be very long and harder to follow,
> especially if changes are requested during review.
> 
> I hope this approach works for you.
Thanks for the explanations. I see only benefits from these changes.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>

