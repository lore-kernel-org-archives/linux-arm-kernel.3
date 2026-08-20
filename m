Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DCBCC5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 08:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+LV8oOivXofhCA0/FCV2aSDFbHgFgNiYNM/iSXbl9EI=; b=nTda0qr4e+yN9sdJGUCGq1dLPe
	iS86Vp1RMGlr2W5oWPb0OdBG6/meLidwFQmM4dxEr3OmIpqE1OPhlEJju9IBwvpPZVbXdK0aceu/6
	9cCqM+1i2EpoIC7QlNCG3xQXLjlImULH7mEM1SAZXLL6djHtBCSwJnaDD4AiuEzsAwK4mC1oZt08b
	KeTeOJ9VzR9EePCovu6tz75YNk9apTAt1WDj8UMlBaUzLaLvNwWlDWH5NdIaJuwJC0C3eh917aDdK
	Iczz8MoJyI9xLX5NXB2heyhSX14ib6OtaS8VQQFuc9xheCgvxhWtN3b1POweBt2jo6m9LGtt2HnCg
	yEIbzNvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwyHy-0000000BAvd-1dk6;
	Thu, 20 Aug 2026 08:38:18 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwyHw-0000000BAvE-0IUl;
	Thu, 20 Aug 2026 08:38:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787215097; x=1818751097;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=JrJaI9a5T3StwQVqBnlu3mhvwgt9jcu3x0Q4JFAUyMc=;
  b=QDU5Nb1HH6H//vV65eBMC3qmiSf6QT7ygktHkRtB+jraylAbEou2VQv+
   m0WE7RB04vBLbqHMslUKeUhdtEU55yvUXUp3tmM/3AC8bxmP198KvEs90
   8szGRwHiApQih6julGDbOZqU6horBjyPTlyHRlYMudx7vjn3A1hGH262M
   czzqd1X9DtqJCXNI5c7I1nnXymKD97YSAinghFwgpqOUvnWHb+G+Imd6G
   bSYoD71f5joz9IHW+L6U6UvAYN8L/va5qdLtZUHxhHByPaFifgVatQzYA
   sKzZO/99v1donsf/sS2+Y9/uaRsnlwXNKJ4iCs7IvcsK0FI935G1hrPgz
   g==;
X-CSE-ConnectionGUID: di/u+LDcTgqOde/7EPUDwQ==
X-CSE-MsgGUID: vpUzOF41QeipyqCrvyaokQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="87949323"
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; 
   d="scan'208";a="87949323"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 01:38:16 -0700
X-CSE-ConnectionGUID: zCFLwBYQQ6y0cq7Q02d0ew==
X-CSE-MsgGUID: 6agynuA/Q/ip4Z6tw1UjJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; 
   d="scan'208";a="266534686"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 01:38:15 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 20 Aug 2026 01:38:14 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 20 Aug 2026 01:38:14 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.41)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 20 Aug 2026 01:38:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sP0nXgETTxXMoD2LDxX65nLntGZa/vRQZbaAmGzNpQC6u/ef8fy1V89yDUk2qzDfWl2MIMNpOpDJkS6b/1uAdViHkt2S/wfl2O80E40CfEjYvu7WoK5soQH4SEgiiRZNm9EVGj08TDqg7m5M3WlrxysSy10YC9G0I0a1M05gcO3HjerQYOBBM7xCNQwXzo61aCVjqZck+/A43bdNSn700tEQ/092WTH3vIAFfk43m8hrcULMiIz2GNmSWInnR02wuXu4KoV/shrX71CF2jLWtKAxw9uwJC8U8gRQ0egBTRwTLDPuPhHVLBDREe3bcq8fRjT5kigwxEh3nd8MqAJ99g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+LV8oOivXofhCA0/FCV2aSDFbHgFgNiYNM/iSXbl9EI=;
 b=T0EC0+Vx/3pQK9vZn67BVEDKPzs1YtUHNq8INd3x8vNOmD6kwSuYwSccJXVSaWtzTmKxCiCQpt2PbLd1asro/4xvkZzE9w7IZ7MNg3JCoC9MfpJIHww7qXllCFEkmsTKdcFclYI5cYpUb86h938DFhXunfeqLCItgKzug01ceitf3iI7VoXZx8LoTc9gjjOlAJWoZ0PjwuNSy4MWiTUaQ7xlI+Bdm9j+U+DSwaYkG2lWh+EnEc2ud6+qIRcHpCc4Wrxqd7kytxQsF4BWshetgEP42T1CNVSr207+L38/a1Lr07OnqIsNtqq2KQFpnQhhfzjsMp75cIb6S6UVx/dL7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13)
 by CO1PR11MB4772.namprd11.prod.outlook.com (2603:10b6:303:97::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.9; Thu, 20 Aug
 2026 08:38:11 +0000
Received: from PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd]) by PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd%5]) with mapi id 15.21.0339.008; Thu, 20 Aug 2026
 08:38:11 +0000
Message-ID: <b85a7eff-10bc-44fa-96c7-601e80eefc3b@intel.com>
Date: Thu, 20 Aug 2026 10:38:05 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] ASoC: mediatek: mt6797: fix wrong unwind order and
 error code in enable_clock
To: <phucduc.bui@gmail.com>
CC: Liam Girdwood <lgirdwood@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, <linux-sound@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>
References: <20260819101736.67632-1-phucduc.bui@gmail.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20260819101736.67632-1-phucduc.bui@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIVP296CA0087.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:35b::17) To PH7PR11MB6006.namprd11.prod.outlook.com
 (2603:10b6:510:1e1::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6006:EE_|CO1PR11MB4772:EE_
X-MS-Office365-Filtering-Correlation-Id: 23953ef8-cc5c-4153-8aa0-08defe965e77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|366016|1800799024|18002099003|22082099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: onabsct3tHx/IsU+FhUijtPgVXUqHInsLJt2P+9a3HjB4UH2cBbK2p89siuts/Ejq8XqwcXfkSHdXha+5I2OmrpVyTEWEHh3EPtdtepzz5d5XF8eHQ6t8tpFgtfhx8k6p8GqSicvsTGttVVNFzhOfjtUVuC722iAHtpqjZLguQaDo7CMBXi1kmj4M7gE+w90ewyS8zHgy99bFw+WoeXfrNrKcuyHCpZG+Aj4oKvOfTjh59qu4BOJKfUDolA+zpA10EWoCKZgnWs9qIf255zwEWwRP0lpYquJ8+pivEgS9M0y3cTuYVXj1BO03GhixywJjxy2vQDKl1cd8dBUXhboxO2qMEGehb7QI6QLDPcjWi6S3HbqkMNbwvBnLWhly+HsgiyGEUaafue8BYyqFZvAM7fTiHtjuzDaguVTxX7w2JluaN4ODT9kJzfgZtrabKNqAZXhDap0wpZRV9Qndy1jAYq5Vs0qxATLnKESuJfYBfEP+iGWQ4PqQ8sOQ1cLEGPPuZY+3vlk/JrEH0JZfG4xAtsY5M6tsF82eC9BTlgL0e6/B4wpz93e/3VCmePm6fZNAFYYq7BFVY7xX/V55xA87wPRczziIhEjQYdm4M2dZ7L4g6ZZxzYPNkD96JWl091ib6iDBRXlQgDsbVd4P+0tWnw7Fb7Bt5ZenCPo1Khp6yM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(1800799024)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R1VSV3ZJQVhNcUhLdTR3aW5pSHcrTFVWaDRRR0JNL3RNb2IzMnlFcllMNUh6?=
 =?utf-8?B?K05rVXBtMnZxNzBjb0plYU1rbXFZWkcrSHJ0VXlnV2ZBNGEzQlF0TVREb0J6?=
 =?utf-8?B?cExtWlgxUXMyK2U5MWZad1FVbm5ySjhXK0lYTWJFa0R5ZXU1SFJsR2NLVWo5?=
 =?utf-8?B?WjdDYktNTkxJWVhFRHp0Z0NFMExSWTFaMTI2cllWeXR6aXp1akFwdkZ4cFRG?=
 =?utf-8?B?UnYzWmVtTDZBRDU0TmFMaXh1dWxIcEVhOTJnZnNxa0tJTmxTbk9GcG1hVHdF?=
 =?utf-8?B?YVpVM3V4SzFOMFhvKzAwdnVPcVJMaGJLZ3VZZzh2d0RpVStTUFNLWmNIdEli?=
 =?utf-8?B?OHgwdUFFSHo0R0U2K3V6d1Qyajk3eVVyWmU1MUlmaGdIUERKMmo4c0JrekFF?=
 =?utf-8?B?cE9Wa2JWZ2tzaG1qTHdscG9WamRndzhtNW5BWlZOWmozS2VZbVRNbkRuWlBk?=
 =?utf-8?B?M2ZTYkNkdXJGZFcrcHRrVWNKYUIrQTYrcWhHRUVad29mSDlUQ0pobUovdi9u?=
 =?utf-8?B?NnJoc3BVQWVLQXh6ZkliZS83S2J0dFF5QWpmblJNbVVQTGpHd0dkV3J4TTRp?=
 =?utf-8?B?SGpBN2tLU3gwRUV5VlRSR1JyVkc2SzV5MXlxT2JKL1R1V1VzSEREMndTU290?=
 =?utf-8?B?eEZTQldKOU15NCtoSmg3Zm1pUmJSMVVDNFlhc1dGUzhyNTlCNzdsZm9aQ2Nh?=
 =?utf-8?B?NEg3aXA5aWcxaGFGRTM4bGtOSTg5N0RnekZMUTc2SUx2enhVN2FpMjRRUVhV?=
 =?utf-8?B?d2k5UTZ6YWJYQkh3VFBXaHZDUlpiRlA2RnRUdk1XbjdWMUF0d3E3WTNnLzQ3?=
 =?utf-8?B?anMwVFN3ZGhTdGhISVFXQ2EzRmdZaEp3YWlRZXBFd2R2SjFNdElMb0FVRWNR?=
 =?utf-8?B?RVFkYnRDSkxCbDMxN2Q0SHNsc0RDeFNwUTlyOUYvU3h2RDNFOHV3dkw4bkc1?=
 =?utf-8?B?dW11cjVLK0ZyOGdheUZBRWJqUVFqcTFjMEZCMURXcWJYVzdiR3N6b25iOGRt?=
 =?utf-8?B?ZEFGVENQaHdWSUVJNllONFZ4QmNQdEV3d3d3MWVPVWw4MmU1eWVDcFN6bDF5?=
 =?utf-8?B?RHh6REd2S05ybXhBMlJxcDFYWnB3dTlySFlCQ2JCbnBCQVFrcnFxTlFrVEtJ?=
 =?utf-8?B?WGRsWmE0UmxjTFc3Y0ZmVmtqODJ6UW44ZVJzNFkrMnpZOU9pVWl3STloYUUr?=
 =?utf-8?B?cXR2TjhtV1ZTZlhlZWsyY0dZajBjMTdCS253bkpERHNKbzRmaEN6Zk1uNlk1?=
 =?utf-8?B?azZNKzRQWll0TncyQkhwZ2pZUnJqUFZub3JISFFnZ3BibnplS2ZBaVFaQmVh?=
 =?utf-8?B?ekxJRDN3c0xSZDFkaFFCV1c3VTc2OW5oYmpZZ2pIQ3ZwLzY2dTZCNy9OZzNZ?=
 =?utf-8?B?QW0vN3Q0M05sODVYanlxRWpPNks2cWtOeDYyUE9kZCtaV1dCUW9McGsvYzZt?=
 =?utf-8?B?R3R0cWpESUU5L2NqNEh6VE5kbVp4RmtwblpFSlZvN2JaM09YMTFzakpLaFV2?=
 =?utf-8?B?QklCNzgvSTBGYkYrSGhxYlZiaDZ2RkRTVFBaOUJmdlVoT1RuZDdUMEVSUW1J?=
 =?utf-8?B?bmZrNG81bmRManBib1ZCR1JiYmhwTmQ2V25OYzI3T2Uvbmo0OUFDb1FVd1Nz?=
 =?utf-8?B?WHR3TVRING9jcjlDRFZOYVczeE00WWVKNVZ1UmM3amI0ZnlTbmFHTzVGbVBY?=
 =?utf-8?B?ZXd2Nm96UFFVOXE4KzNiM2JyNWtMOXQxZyt1NmJRbE5VY2JRc2swUFIzbFFx?=
 =?utf-8?B?MWQrWDdCeUc2K3ZtUWptY0xvQnE4eGZmYk5QVWx5MHpQNTNMb1A0YWpETTB3?=
 =?utf-8?B?dEgxTGkvVXRjOWFkSWlmVlVYMmN0T3c0UlVWVWF5ZW5ZVlVpc2FTZTNnU3lh?=
 =?utf-8?B?RWVtanE4TXhPcENUN3YrOFQ0dlFlVjZCc3U5T3JIcjhIcWxNU3pJRWhpR01F?=
 =?utf-8?B?ajRwQVAyeUNwbEl0TTRyam0zMjJZS2xGUVZyTDhZTW5jODFHcHFmQ1pVU1VK?=
 =?utf-8?B?bGUyOVdLM1hDSU9DcnlaaG9YMjBHZ1BhVUh3SWlSNTIrMDRwNXkwRGpDbnQr?=
 =?utf-8?B?MXgyK1YwL05JamJ0cGVQZERMYU4xWHVpL0pud3dJUzNQbEl0dFg3dVlQdmNh?=
 =?utf-8?B?RExKRkJzWERNSVpCM0h2WmRYU0JnQTgrcndvdVR5MFVabk10Y1VmM2djdG1L?=
 =?utf-8?B?VlpDYmhmZmt6RXUvb2ZsMktwaUZZVWRyNGFNYS9uczhPNFNtU2lJQURzaDBm?=
 =?utf-8?B?THlSTEJpQWNVSjZGaEgxRmdXSzFWWUdSYXJ2Z0lFM1h5WGN5NzFlTW9HRDZo?=
 =?utf-8?B?QVBLaWlzODNrQVBHV3dsZ05rd21JOTk2a0FwTE5yQ2dQUmxjSFJ0MXkvamRW?=
 =?utf-8?Q?uphyn+Cx4wt7d8wY=3D?=
X-Exchange-RoutingPolicyChecked: gsh0yxn0roHOZha/ky1+FJkl7VT4OIQ25SXfmPf6KNY5sZHUI0VE5SkimZYPn0u6Fq4sQwFLETF7bdsV29m7dTw6IZl5wZIbn3Y9WqRzQ16jOWC6IkwbGGKqecSAoa/U/rNnKac44XBZt7S22RIAd3323FB1BE5FabYx3yPg+MMTmglvywX56+4XpONjnuVcq58VUKRNYL+BqeVFiKx9fa3dTlfe6XCIpML90VGBE/fWlpZO5pQ9ca+t13ZXOWI+yvesvmqa678yOAltydsl0FMV6NpVxa+wQBHRoX0my4jMAxInmBE+WUi/qbJDamUNUB/IU4487HbNyhfLwJwsfA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 23953ef8-cc5c-4153-8aa0-08defe965e77
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 08:38:11.7424
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ec8UaDMufh1N8XrZShXfEEoW0h/Gfe0NPvvaUa67hTRwD34Iajmu5RaELtJB4e3QXKKriHhp1uP//z/IjsNy2y2AZK3JwtF2sbPV+V0ro18=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4772
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_013816_210241_EAEDF751 
X-CRM114-Status: GOOD (  16.48  )
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

On 8/19/2026 12:17 PM, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> The error paths in mt6797_afe_enable_clock() use incorrect goto labels,
> causing clocks that failed to enable to be disabled during cleanup.
> 
> Fix the goto labels to only unwind clocks that were successfully
> enabled, and return the actual error code.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---

There is no changelog in this series so reviewers have harder job 
analyzing the v2 patches. If there is no cover-letter, you can always 
paste the update here, after '---'.

>   sound/soc/mediatek/mt6797/mt6797-afe-clk.c | 14 ++++++--------
>   1 file changed, 6 insertions(+), 8 deletions(-)

...

> @@ -93,13 +93,11 @@ int mt6797_afe_enable_clock(struct mtk_base_afe *afe)
>   	if (ret) {
>   		dev_err(afe->dev, "%s(), clk_prepare_enable %s fail %d\n",
>   			__func__, aud_clks[CLK_TOP_MUX_AUD_BUS], ret);
> -		goto CLK_MUX_AUDIO_INTBUS_ERR;
> +		goto CLK_MUX_AUDIO_ERR;
>   	}
>   
> -	return ret;
> +	return 0;
>   
> -CLK_MUX_AUDIO_INTBUS_ERR:
> -	clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_BUS]);
>   CLK_MUX_AUDIO_ERR:
>   	clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD]);
>   CLK_INFRA_SYS_AUD_26M_ERR:
> @@ -107,7 +105,7 @@ int mt6797_afe_enable_clock(struct mtk_base_afe *afe)
>   CLK_INFRA_SYS_AUDIO_ERR:
>   	clk_disable_unprepare(afe_priv->clk[CLK_INFRA_SYS_AUD]);
>   
> -	return 0;
> +	return ret;
>   }

In regard to the patch, the fix looks good - given the number of errors 
in the existing code with invalid return code on top, perhaps someone 
wanted the function to be permissive.

Otherwise it's just bunch of untested stuff and your change should be 
tagged with: Fixes: and propagated downstream.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>

