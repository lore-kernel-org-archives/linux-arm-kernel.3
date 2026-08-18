Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13F4FC5DF70
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 11:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s4HVsCF4B3I5QS3+w4yTEC4tk9RmIIaCy8dsdFO1A4w=; b=o//lT5YJCQRQYdJ+RL8VxXTNzi
	OfucysoL79BWGd0xbCeQ3gdjkkkW1H3NedTzyUHF0Yuh5PphTssm3LTGkyrzB+lVKzODng1ZdXnwP
	tvaZ7ePgvk/ooOoO0RCRmnogY6lcu0ZY3VdSTB/NVsSjRw7T3w1GgWa0OAVts3SJetlMia0lLKUF7
	ZDGJE9D/wL4T23uKrTMJQXJB5FO5UFUlAcUGk38duez1G3wQaahGskjVHrE0YK9q1BrcyG9tROiRr
	G7vgaLO6K32fyRMwo0ln4hHdDuFMSPTxITw+FdOo/RcvUAIC1S3qsKCo6vFWCzX+DI1/3Juy6DTDC
	M5u/oKZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwHsj-00000007q2k-1SIQ;
	Tue, 18 Aug 2026 11:21:25 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwHsg-00000007q1v-1umV;
	Tue, 18 Aug 2026 11:21:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787052082; x=1818588082;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Xuxyxc8KW8wj/oSc1GxCpn00C64KETlrmu437RFz8jM=;
  b=i2eXUNLT3RP/2PvgrHk8mTJ0C8XqiS/Nijdgr4nP48P3ReWhTZGyGHIV
   0PScBlq1GTsSmopOhm2Qguzc2tk86NCoE4ai0R+VCuIASEkBneeEEVSiN
   +Lvh7Ve0o36B+NZyd+ey+jG/N6RIuCcD42JICfgRISN7kjQmJFb/WbMAb
   ZCfYxca5BJM8Dkudvgmr/kpNSrsBPaF605S62c1OHI/m/EUzqNKshc/FW
   c48A47qfPH5T3w27YhHc0OMbDZEBRUT4Y31VciErn7GpTSGa1pgHqgxzs
   FQ8xdZK2AoO9RnpV0zDI5PMZv2U4cbRL6+iGVuuUGYX0b3130KJh36AUw
   Q==;
X-CSE-ConnectionGUID: hEP2pMNTQdq1xw6PuOhw6Q==
X-CSE-MsgGUID: fbXsmMpgT1yIJPT/QojosQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="105074484"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="105074484"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 04:21:21 -0700
X-CSE-ConnectionGUID: kNSB/mPaSe6zwKp/3WHjpA==
X-CSE-MsgGUID: lYDjqOaJQSGhtchL7J7btQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="269039206"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 04:21:21 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 04:21:20 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 18 Aug 2026 04:21:20 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.7) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 04:21:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zc6GuPpt9WHtSeVlL0jt0qlkHK8CbF8WH8jW8RNL28HkDz8hFE7y/UPubfvBMFg67HtC3yEVOuQeo8xaNhFoLCfbLykYPW49lcqxYQU1SNFaCoFsDm4taxhoYQEZUXd430C9Qt+87YLcCr6fg47DGxQf5GLwRZJp56m494VCAHOddbhciVt4MNT5E/D3xeLvbq1tk3NtpS2ww19LNTZWJwADkwBBLpRS5F9oqUacxoZGyVhjPpYUGXj5cN4UVhkrLcpCnAiJm9Y9e5J5Ch0eW/SPWWOLxFK4vVgafDWxDnSUoyhEgjVwaFN/WyAIYTCwnrX1bDZwHzYxNjLFpqXMLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s4HVsCF4B3I5QS3+w4yTEC4tk9RmIIaCy8dsdFO1A4w=;
 b=A/syQeSUE09w2WTcuBv9HlVWoKmeBaUWPuUd5WzgaeCO3S30M3bl1nMWecG/H9AbenLH26WL44Wwcz1zOWEfNa5cHynMOVN+h+JjXUiArCE5LkiKfCSXLjRg8AfI8vw8VXcghsHKu4qNVh0TPFhmBql5TAWHzN6IRFDGihjd9xXXt5+5ZlpHTRMuvlpBSdEyOsTDFZTInKVr+8tREbuUPaidS8YTtaH6BW2Epo0KSZm8GjAzoc7XJDHhLePgVR/ghiFT2/GEodkopbeaiURPtl7YUOCCa0eYGE9jGZdN3Y8kUY9IvvpQ63HzOzdw+mm2jKzDQbcIYmcXDGnuxmiStw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13)
 by PH3PPFAB4263235.namprd11.prod.outlook.com (2603:10b6:518:1::d41) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Tue, 18 Aug
 2026 11:21:17 +0000
Received: from PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd]) by PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd%5]) with mapi id 15.21.0339.007; Tue, 18 Aug 2026
 11:21:17 +0000
Message-ID: <a35d864b-0766-490d-8abd-25e70d3c0300@intel.com>
Date: Tue, 18 Aug 2026 13:21:10 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] ASoC: mediatek: mt2701: Drop redundant probe error
 messages
To: <phucduc.bui@gmail.com>
CC: Liam Girdwood <lgirdwood@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Rosen Penev <rosenp@gmail.com>, Daniel Golle
	<daniel@makrotopia.org>, <linux-sound@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>
References: <20260817104929.63152-1-phucduc.bui@gmail.com>
 <20260817104929.63152-3-phucduc.bui@gmail.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20260817104929.63152-3-phucduc.bui@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM9P250CA0013.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:21c::18) To PH7PR11MB6006.namprd11.prod.outlook.com
 (2603:10b6:510:1e1::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6006:EE_|PH3PPFAB4263235:EE_
X-MS-Office365-Filtering-Correlation-Id: b47e898c-476c-4a08-60f9-08defd1ad1c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|376014|56012099006|10067099003|6133799003|22082099003|18002099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: xiltgvNSlPNMudeq3wuMbwS2QjEHVmUr2hbrmtaWwwkw2d4UbTrWJa8cd+p15zanpDkjA3HyKzmOJxqbSKfb9gh+u25+/vX9Sse8flJHgrjXt1uMdRt2gIxKp0Yhd6aGVEN+ll4R231/1yx/lGBFTJ6RkHvx8HuEkpV122PrWMMGedhPr5O/BGhDf34zbaVmfrmjla7tQj4zc3zLlAPvHL3b0o4XTpkOSpBr03zvcuAP3nQs/ki1lSU/g8KcFjD/0OZOi6Cp/FrRSDojUAMqUqoYcHGX25zDIn0B0TRV/CWUPcl5pBIBGrU3HKr/bhraL+kT3Gf6XhXxFSxy6b3aALaqlh5yE72Bf5R10MTbrldDHi5QzT3kXKwJB6Hw+nuIPsZGGFOrGvppYUXHoP6bYBVhZ8Pqgr9JsHYt75ZRp978Zn7dXF3cY7hTBu/jERR9qP+cZnhnIePq3IFtF/LkDJpDuSIRl3/FelEzGm4g6ENHQYhilxjjp7KfFBlwJEgAQWGX2wHXinfl0CjBqSCtNMXcASyZb32HBMtHzIrhzRY5hsHR4mGP8/zSenG/XDvkCLoGIZ/8j4ktjUaMeC33i+RHs1TljJvq8IYPnmAjbSVLUs5kMr6yTUu9S4YlVCg6fLC0gjUNMLn4DGhvO+wtww==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(376014)(56012099006)(10067099003)(6133799003)(22082099003)(18002099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eVpCVjBJUXA1TmVtamFCYndXSkQxdCtsREhrQ3A4MjFjejlvRVl1WVB1MXFs?=
 =?utf-8?B?YVliQktnOWhHcTdIdk13b1pTbkxtZHljRjVaUW8yNmgyZEtMU0o0b1BnNERI?=
 =?utf-8?B?VkUvTFBLdmxGYVpnZnVKQWEySXV6b1FNYVhsS0ROTElONk4vNXpHdzVGcWNC?=
 =?utf-8?B?ZGFyRFZReDBON0x6QTVkeUtRdkhhVXVtaTdZYVprRklCT3QwMW90NUFad0l3?=
 =?utf-8?B?Z3NSMWtKcnRKenRZZVlYZFRjOG5QQ0hxYituZ3JDdU81aFdhNmpadXc5NFhO?=
 =?utf-8?B?QmZiQ2dKM3VTb04yQTRsN3pOektnbUZTRzFiQitqUXlvZCtHdUZOQXhGTzh6?=
 =?utf-8?B?U3AvRGp6K2VtWkxzL3VuTWhSNmpaTU5yNWRER1dJMmJFUXJOUnVBaGFnTUJP?=
 =?utf-8?B?MDd4cFFvM0RFaFV3L0lVSHNyeDhUcVpna2s0M1ZUWVpucU5EU2NVU0w5Y21J?=
 =?utf-8?B?UExzVWp2Y0JzYWZkbHlHOWxNckFEVjcvdXRPa0Y1eHNIK2ROVFVUaThvNDhv?=
 =?utf-8?B?c0ZyUWwrYUxWQkxXSXduS1BvdElOYmdpanlhdjZtVU5lSk9RSXpJeTBib3N2?=
 =?utf-8?B?Smd1UERqN0E1Ym1MYitoODcxd01PTXBJenBXK3kwampoSjlvQTlxT2dmZEdl?=
 =?utf-8?B?SHFZQUVuQjRKK28xenRPVWVlWHBXNFdyNzJ1WHRqWHhkNklrb3ZjL05BdW1I?=
 =?utf-8?B?cytBWDl2aDVxWFhMMzFjajJDVTVMbWIwcXpMM2tMN2tyajNFbm15SWUyTTVn?=
 =?utf-8?B?WTVHUW00aW1WM25qWjQ1aFpySlN3SVdWaXVIRWV2MUpEcjFpWWhXbmxCaDlS?=
 =?utf-8?B?U3EzZkRUMnRKT2lmOU5NWkpsSHdvRGNpcG9HeU1uS0QvTzdCTEk3Vzh2MmQx?=
 =?utf-8?B?SVQ3VG4zUFp2QS9KaW1oSW9BamMwaGhsa2ovYXROVnpjMmVCbzZPYnR6bVdT?=
 =?utf-8?B?OFFZTm5YMzg1YXBhRlNPWXNPaVljZ0w2bDZWRk9yQW83V1VjcXA3dURpQ2tY?=
 =?utf-8?B?ekpQbG9sN0tkUnFHSXVIWU8yNFhndHdaKzY4YjlacFJFaUQrd3BNZ3BBYTJ0?=
 =?utf-8?B?SnZtL2kvc05CVWdEK2NLeWFUMFpVWmNUakVQOG9wM2lJaXlGaXdTUFE2TVhY?=
 =?utf-8?B?YmJ1NFM1dnY0bXFMcGt2aFhCV2wyY3IwT2ZZS0p1Y1NoS3IvMmkrZjRFV2lY?=
 =?utf-8?B?K2FYTlc5SXdyYnFhcmhuQ2xnTDY1aFhnUWxMM0J1QWxZNmFlai9jejg4Vzhu?=
 =?utf-8?B?amtyVlRQOWhmeWtjTWc3d2pvVGhNdXA3Z1ZTaG40Y0JTWk0wdTIwWnJFa0JB?=
 =?utf-8?B?VGJlenV0NmxsWWo1TWVpY1o1bmthb21jSDZnbjIxSTdTZ3N6OU5mY3F1MEpv?=
 =?utf-8?B?KzREekMrZkZrYWhRYzd2a2RnN1dsQWhHQkZZV2dqZ3FvNzROVUd4TTNBWkF6?=
 =?utf-8?B?c2E4UVEwYzU3ZHV1eW9oQVJ5R0U5RkNnU2lDaVNNdjhxYlZkVkt1bGpIcVVj?=
 =?utf-8?B?T0kzOUR3bDFodzhLK0QzMXg0WmF4Z1RIYjBSMXhtakxXL1hFc0VjOWJtbW82?=
 =?utf-8?B?T2xTcFFHb1hMVUdYNkRNMGVHbHpSQkh4MDZaU1NRU0RnZDV3RERUYTBqMGMy?=
 =?utf-8?B?MWMrNHY3OG1uZDJPVHNNQTduR2pPYmNvN2ZaZDM5T2piWldpdUJlcmFkMmt4?=
 =?utf-8?B?ckNoM0dpaVcwbG15bVBtQ3NkcWMxT1dKYzE4c0xQTExXam1NcnRxRlA1U1hw?=
 =?utf-8?B?TTVIREVPQ0l3TENTMXZ3UkVsNHppM21mRG8raHBFYTM5djhBVDh2NU9ldG5D?=
 =?utf-8?B?VjlmeEgvU0pDUCt6STd5K05hRzBQM2h3S29HSm9CSEtOZE81dlA0Sm5vekpI?=
 =?utf-8?B?cS9rWTZuSEhnRVNqZlAyTU9nZmhYR2xsaXAwdDMwZVljOHNKd3JvbkFJd0xX?=
 =?utf-8?B?ZVNuVmp5eHBSUUt3b2hDaWpwZUlZVnkvcm4yRHBWaVB4K2ltTjhzV3RQenFH?=
 =?utf-8?B?RHYxeXgrcmU2ZERBVEM1TlViaUVDUkhHazdONUt6WlVnY2lmZWhBK0VBRUw0?=
 =?utf-8?B?dUhLS25xY2lJYlkvczZHM0tjcEVrNDJ1SHdYdlNlWEJaZlZLRThsVXVVTDlp?=
 =?utf-8?B?WTlzWnZNNzNPdzVIUTVRQUhEVHpROWFqRlpCMnFqNjlUaUNudEtJam5qbGs4?=
 =?utf-8?B?MmhlbEhEOFUvSUpUa0FjTi9iS1VwSmNka2kzTFB1WFNuRVVEK1FNbU0xdC8y?=
 =?utf-8?B?OTVrNVRlbnUycjlyYld0SGZhVjl1TzJ2TVNJaTB6WHllUzJUMklSSlZGTm9K?=
 =?utf-8?B?Tzc5VG1vV2hsTTl5bWlGY1pLR2FpYmlDeGNWYjNGVzBLY25NMlp4amFxVDE4?=
 =?utf-8?Q?+Vo9eSvYmBQqq2OI=3D?=
X-Exchange-RoutingPolicyChecked: nm+m3uwtNlgg/RiAjTJeqlkH5JBc+B6SYlUb62w9cTk8mL4Ym5tl4CfQ9VGJ9qolSBTbRcBRWMIq9ZCFdyYV3DE4MrDRJnQ6fOkR/PfBZQvL76VleeEQU3qPUHOG9gZ2WYFJhQavzz5/Zw9SoWI93D7TUXACzmLC/TYb+LtG1jWzgTm3biLm1upqBbH+B6ZtvBfXuscK1e/meM7RHw2WU5D1CRgsF/jSL2KjdN4q7uQBhYD/dBFSyhuGIb3vY5TP75FWFtX449LADwx+S831M1RJwaLBPmS7a7uiiN6O3AP7XCD4KAgZYLq3JAeZQ8dhYYCyl5XI4WS0hihP5Uj3Ww==
X-MS-Exchange-CrossTenant-Network-Message-Id: b47e898c-476c-4a08-60f9-08defd1ad1c9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 11:21:16.9563
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tILLyHFznv3ZfaLmQI3G/qo5VKL9IO0cfXhtwp8UVTii2H+AKYuFreEHN49YNZVfo4fZ0H0RBiKLgYRkGmjIIp1Xx346Fnn//5xL/ojzwF4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFAB4263235
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_042122_511675_0DD53F12 
X-CRM114-Status: UNSURE (   8.87  )
X-CRM114-Notice: Please train this message.
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

On 8/17/2026 12:49 PM, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> The errors handled here are already reported by the called functions,
> either directly or deeper in the call chain. Therefore, the additional
> dev_err() calls are redundant and can be removed.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>

