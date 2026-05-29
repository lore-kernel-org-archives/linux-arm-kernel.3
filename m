Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17A2ECD6E50
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 15:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wPvLvZkNDunTT3FmElHZV0UttRGIej6eJaAOkuz9N+s=; b=Nu6sUNr2/wIF/CRE33PcrJS+XF
	BYwoXNOJmVt6Ocgg6kZAfH8Cf7NZqqJTgab69jBNE50xgu4riXGcBO1DcqKn2dW+0q6nZ924Mmd/v
	N/ryDU3mVBrOTovMWzNrB2vd9xuj/0msgGVPMYzXl65/MkssNqmvwcbxrMcz1V2tLW+7O/ukLcA3T
	oXEsxGnYKeEOY8AIGyRVq/RWGPNnbhPAvZY6/a0j8livgC9RIyur+smvbKx6tedZDHksckM85+rZJ
	ByqqxmN2V2xok5iFHQfImoLqypvNK5463xOcLMy3Jl8F6M255Jbja3Hz0LiQZbzpnIsn8FjlB+T1/
	OU8t1vtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSylj-00000007dJ6-3a48;
	Fri, 29 May 2026 15:05:03 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSylh-00000007dIK-1eMj;
	Fri, 29 May 2026 15:05:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780067101; x=1811603101;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=6rz8AORpS+Ak8hE7dRMzWXd1J3f16kNp1O4DOTGJIp0=;
  b=i6ACsm/4W2tPrvrW17GmgxrqNjN+GU8eC5+lPg6InIq6TdylUP5jYptj
   CrA6i2sydWQJF4C2ZktIpx9AFBy7jhdSght3zPUeBYhGLW8NS+Og2RDxs
   nIKwvFSVm9Dish84sH3nYp917OaplS3fQFy0oJxjpQCKyaAw4P3FxI4uD
   S+jM3Bd1aEOh3/Sq7ObgDD9RBEacQ2wRldzuWB0f8xmOzF4LB6ClgIYF5
   bBR0s8HoXpLglN+PSkI3QwksnkYfntq1CAuAlsYYNZjpDCTCYybrpB3e4
   50oOcGbJCXTmGQIw2oGsc4+snRq7bb83fB6GmGqUUBCNloVGWAZrVlqe1
   w==;
X-CSE-ConnectionGUID: NXMQCg8XRXmyyeB2qM4aSQ==
X-CSE-MsgGUID: Zv11cDn0QtaIIfE0AZ4Z0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="83495723"
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; 
   d="scan'208";a="83495723"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2026 08:04:59 -0700
X-CSE-ConnectionGUID: UHdoT7RCTG2AwD7TqtGALA==
X-CSE-MsgGUID: cUeDzqeZTl23fD8VFem0Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; 
   d="scan'208";a="238691357"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2026 08:04:59 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 29 May 2026 08:04:58 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 29 May 2026 08:04:58 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.66) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 29 May 2026 08:04:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y87xZqqcBVaRNNeo5tIHxVReozytE0xDyfxb0x2HA0GjVLaCoiXuBQZg0MYZW9oHifAlGnakkzcNEyK3+/cmuJrhwdrTKk2DL1Yzjeqm9QxGSXCtoTcUp1uJYf377k4DQKeeVRN7liACgQWD/K8UQncGdiq04AYWn9/jg4yHoWn2spxiGacQj32YfPhn0B6CfJpqTS02L0bxWUkZgWOVfY03YIjDDd4Gee26ZiKJMJANjMsnzk1jaQAM2Rgt3LzMWmISMwCvCvwhp2BZWvg/48kMgmhn72ZvpTXW/KUFjEMrEJpq4Hhci/pzf5oI3fKXO275N5WhfvsVBedMTJvH/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wPvLvZkNDunTT3FmElHZV0UttRGIej6eJaAOkuz9N+s=;
 b=pm/1DAuCiDeBdUtA8PlHedzIv9iznrKiAO3e8iJ/FAY2KjnA55kfh3k1GRCyUFKQUlDMuauuNmHCp43lqQUY2ivp7Wc5aAzfFBXxXiikmXXi7nk/QC9kN07QzDDCS3CiJ1iZhaVfHPLHQsjG3IqctfQMQZbZVIlEGMJ+wTypHPBhBeWF14ySYIkNHLkwz+4Qh6JqUYv63CPDF1TSLbsw4f4lpqLzWtWFAqT4injLyfZ8RvizbP3uEqbzZQExFumHik0obf8NTwvfYhqBHucAiTqnxxkFmCOk9Bfp044hggxsjxK9yDysyUVumwmbnpLb7Lr7K6YTyRGcvEDkxVbakA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by MN2PR11MB4598.namprd11.prod.outlook.com (2603:10b6:208:26f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.14; Fri, 29 May
 2026 15:04:44 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c%5]) with mapi id 15.21.0071.011; Fri, 29 May 2026
 15:04:44 +0000
Message-ID: <722f177c-0578-4b0b-b2fa-2acd45b2e299@intel.com>
Date: Fri, 29 May 2026 17:04:37 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/6] net: airoha: Introduce airoha_gdm_dev struct
To: Lorenzo Bianconi <lorenzo@kernel.org>
CC: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
	<horms@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <netdev@vger.kernel.org>, Xuegang Lu
	<xuegang.lu@airoha.com>
References: <20260527-airoha-eth-multi-serdes-preliminary-v1-0-ec6ed73ef7fc@kernel.org>
 <20260527-airoha-eth-multi-serdes-preliminary-v1-1-ec6ed73ef7fc@kernel.org>
 <433b9d9a-bd7c-44ad-b387-a789b326488e@intel.com> <ahhonoI-oJ6gJqZ0@lore-desk>
Content-Language: en-US
From: Alexander Lobakin <aleksander.lobakin@intel.com>
In-Reply-To: <ahhonoI-oJ6gJqZ0@lore-desk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI4PEPF0000014C.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:808:1::893) To DS0PR11MB8718.namprd11.prod.outlook.com
 (2603:10b6:8:1b9::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8718:EE_|MN2PR11MB4598:EE_
X-MS-Office365-Filtering-Correlation-Id: ba596218-0492-44aa-2e5c-08debd939dbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|22082099003|56012099006|18002099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: jqATmvIGJ2OyoRz9C2C7q7GtiIpPaKDASgXNjexpf4g0QI221lGPeBLZxOvBw6IDwJzh8iuHCr6Wfzu3oUgZdVJbA6fS72e3bmLkZAQR0m5vxJfknxmqEFtYI9kbfnwxLQ/8bRFeF2XxgxNHsYqOTYxvPC9N1oCokXHGLymoJlnfGA77fU0rTiJZF5ZE2YOpQcIiF/xQq6haPP/B461mGKXR45PWuh5+ELC0YPRGppHYhvZbrbGhQLptrOSoqhKjpgR594mbH4jQ1EBeZxJF+E+tTpuXuLRbWruEkltOl+Ko/gS38yB1IXdPczrm74xX0/7NusrEj+Tp+Tx4jNd7ldi0LU9sCHpAoU8B1nkf5VJHMjYHSceK53k33ExBrE4GwaR+VIjREO2+RH1y0yxiJ7Acova2yz3ZtAm+2XixiMTGvYZ9DtEha9qtL0FGFW+dmgyUXAM6mPdj4dYMSU4IE06pYKkMLl38cFQnl19XarnUAric5PODgLKll9Rs28bXegh9Pex7f4yzU6F/1nes6qaeZlhe0KQCFA1nRs8bWoqQYhcPgVZfgyE/7WAslpN2NPU9ov5++T6eUGIh6axE4YQFO8bcl6m/RdztDSfYBJv2ccGmWoHx75gaRpxs8MLiA2DE3UEh5DKxRLpC1/JpDnwn99whHJQzemPRqttV+zasq+y0MWwoFCcbXbg6RNa/RZHxSzsh1SgHgWE6Z7ByUQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8718.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(22082099003)(56012099006)(18002099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K2JWbmtJcTl5cXJZS3dkcDdlWkdjL1B1WC9taTAvQ3VScDBxYnFmZG5ZUmE0?=
 =?utf-8?B?TmU4MnFLdnIzK3M0SjRCWTlGZzlzb2dmQmRGR1MxdXdIdVdIT2Z6U29HTnNV?=
 =?utf-8?B?ZllRTlM2TVRVNlJvNkdaVDlQRWkvUHNWVG85clhyL2p2VWZXcFhKRWE1QU5x?=
 =?utf-8?B?cWphNS90eTI1ODR6SzNDYTJIbGVIb1NwTXhtNThKWDZlak1zQ25zT0VCaVlK?=
 =?utf-8?B?TFhOTGtFVmExQ25IbERaNXNETVRWME05b0ZwL2hDSGduYzZDZEtTUjZiV1ZH?=
 =?utf-8?B?ZDM5UTRVbVR1d2ZLQ1pJYWFPcjkvQTdkZk1xQjc4RU0vY1RNOTRwdFdneTNo?=
 =?utf-8?B?eHloN0VsRXRCUDQzTGhrS2s5ZU5YdmRSZDlEVWdNa1FqblZSQzlrcTMzRFh4?=
 =?utf-8?B?dTdxYkxPT1dVMGx4RGg5T0RoTFozQi83Rm1lMnJYNHpleU10Sko3VXdFVmVw?=
 =?utf-8?B?TittL2NRVkd6THJ5c29kdm54Y2czMXhFYVZQL3UzUmxhcEgrd2RhTVU1bkpM?=
 =?utf-8?B?V3BwWVFlVGczcEx4WmU1WHpkSnpiTjJieEwzamVxUVgyTFp1ZUpXdUtsTGVQ?=
 =?utf-8?B?N05TZnBCaHdqNG9jWnJuNnNzdjlNem8rdjJneVdIWVdBajFsUkc4TlFLNnN4?=
 =?utf-8?B?VUVDaEIvenhwaHc3UWhlVWFhckJOMzdNcHZXZnlwSlRGa2R6ODIybkVtM2dK?=
 =?utf-8?B?QURBckJYakptZmtUV1gzVEwvWGc5SmhJdzdtSUhJV25aTjV4NncyY1g1T3pG?=
 =?utf-8?B?TnZCSWhoUVJYKzdva3BMUW1Tc3gyOHpRTFFLL21NTGdCTVNqZUwwSmdkenpZ?=
 =?utf-8?B?cGorQ0pqbzZlQ0RFWWw2c3VQL3lZNS8xamIxMzh2QzNDT3lSN0gxQWFQQ1kx?=
 =?utf-8?B?SkdScWlJMS9xMC90M09LNWZvK3FSdmhRQkhrNi80QjBjWkU5MTRJNWNNWEVV?=
 =?utf-8?B?VEZUYmdQMk5xWWxZMmhTaTBGV0FxeCtRSWlTQXZVWFRWN1EwQUhkZEQvQklk?=
 =?utf-8?B?SktuRUZzUUZSY1J0RmFMelk3RFRseWxhenQ4cGpWVmJoaVFZV3ZlSHZVSkxR?=
 =?utf-8?B?YlZlbW1aWDFjYVJabWJmaVpKcE1QcDhlWnllTmU1SGhzUVlZY08zbjZpcXJq?=
 =?utf-8?B?NjNhblVjckFscldHbTB6TEphdUU5YjdkeGF6RVp2NlNwU0YrdXI3NHErUjZ6?=
 =?utf-8?B?VStscFgzMm5tOFY4WU1xR1VaQTRncEt6U09vNy93QnNWc0RvRi81SWVmWFY2?=
 =?utf-8?B?QzhiNFBISER4NUxtbjIxZzk4VTVtNFZhTWRHcS85V2FxQmlmR3NoMWZ0emlW?=
 =?utf-8?B?NGR5aFcvTWwxZEd4TTNkREF6YVo0dFRjdDlkR3ZLM0x0ZlluWXdlRGVqMXRO?=
 =?utf-8?B?RUcxNFcvQi9KbittTlZsTlprWXBIRmlvR1FyZHV3RUpLV2FiZlFkQVlTa2Rr?=
 =?utf-8?B?MkhCQVI1a1drTVRqY0JuWklKakFiYnJ6cXJ6Rml5Z0dkc21EdUVJN29MV3ZZ?=
 =?utf-8?B?M0VXU2J5VmNWdWkrWjhEdllZcXpBd0w3OFpGcFgxVWlwelBXSHllc2tRQTJJ?=
 =?utf-8?B?emVsRFBENGpKMzFmRTJONk4xMFdZUkpCSG0veXRzSjMyT2Zob1VzcjUweTBo?=
 =?utf-8?B?YnJkVnJPekFxbTZEN2pBYS9VMUdRdzNWZGJvSW5wcHlFd0R6ckpiVDNoS3dv?=
 =?utf-8?B?RWZBZWtsUi9vVkFjVHBPRHVoRStOelphTXpBVU5DMnJpOHdLaVg2MTN6ekJS?=
 =?utf-8?B?b3o3VVAremFId04xaWhKaGFBaURYZkhXTlE1OU9NMGlCTy9sK3BxQ0x2aFVz?=
 =?utf-8?B?M0dzUFhwZWswWWg4Y3JKL3MzS3dWdlh4VnZiZFFzcDI0UzlVdDBhellPRG01?=
 =?utf-8?B?UkFPRE9qTC9zNmhwdkVNZi9xS0ZQSnB3K1doU3NmZzBJUC94S0FyUkFVd2JQ?=
 =?utf-8?B?UVM0OGd5ZGJpak5tQ201N2w0MitjRm10aTh3cXQ3VUlzVnpsV3k2d0FjLzlZ?=
 =?utf-8?B?YVMvc1lOeE50N0pPcm15dUtzUDMxNElJQmh6Q3FGbTU4ZjYwQ0g3S3l6QmI2?=
 =?utf-8?B?RFJCS2JDSUo1UUNEZ0Y2Q1FWa2p4cEVyc1dWK09rUGtFcWJ2Qk40bEZoRjUv?=
 =?utf-8?B?VStISHdjM2FYL0JkbmJjVEltYmhMNjlqTDBnTjNDUlNBeDZqQlJTazV4U2lx?=
 =?utf-8?B?RFhiSXd0N0RhTUlwbGJVT0lHN1h3eGJIVmllWnZZUnZnOGl6NHJ5VThQeDln?=
 =?utf-8?B?SHhSNmR0L3R3ZnFGWEJCNEpsZkZHTE5pQ2JNVjIvYkhZQkxaUDJ1bWQrRVlI?=
 =?utf-8?B?U0dmWkpFT2Y2Y3J5OWFvdXFYK1R0b21JMXJmVjFDb1ZXc2dka2Zya2l6UHdC?=
 =?utf-8?Q?+Kw1rw1BLtST31Bw=3D?=
X-Exchange-RoutingPolicyChecked: rVCkXQw77f1E0gDRnrEo86kmyduMbtWZH8On4liwyPs6xKU8cj/v5h4AH1JsaPUA8FQY4m6+gJ0J+veHc10OTgyKyEyFoJRa3Ipp/0utvnz5lNBC6YWLGrHRN+VZf0X7cTu/RPUpLd2DV11ADev7L5JSa7NbgGiVB5Iu+2Xyhr2jjDmxaOW99SYE/dNbrDPaHenCJvPp4i1JarrQkmMHLDK4vgyG0KlPdvXEgA15By7AdYxvrEQMs84dwuoIN1Vf6FLy9ZFAoFrlbr3q2tprM1zmgYxY6v87EdrGcavD3Yc6HOEJGNredOIl98cdT65oNbQTPXFlmzvsgh6epSyI8A==
X-MS-Exchange-CrossTenant-Network-Message-Id: ba596218-0492-44aa-2e5c-08debd939dbf
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 15:04:44.0445
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MTILb4PuUKuQ2b3J5lhtuVmEzjNPOrYW7I0GIWfj2J1bLLwFwyYIrwnTKchQE4Z7w8oBKedEoXUltesdbVbSE4QknxsM8yxzXDsrwsThUaM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4598
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_080501_503830_5F8BB4A5 
X-CRM114-Status: GOOD (  16.73  )
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

From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 28 May 2026 18:09:02 +0200

> On May 28, Alexander Lobakin wrote:
>> From: Lorenzo Bianconi <lorenzo@kernel.org>
>> Date: Wed, 27 May 2026 12:21:15 +0200
>>
>>> EN7581 and AN7583 SoCs support connecting multiple external SerDes to GDM3
>>> or GDM4 ports via a hw arbiter that manages the traffic in a TDM manner.
>>> As a result multiple net_devices can connect to the same GDM{3,4} port
>>> and there is a theoretical "1:n" relation between GDM port and
>>> net_devices.
>>> Introduce airoha_gdm_dev struct to collect net_device related info (e.g.
>>> net_device and external phy pointer). Please note this is just a
>>> preliminary patch and we are still supporting a single net_device for
>>> each GDM port. Subsequent patches will add support for multiple net_devices
>>> connected to the same GDM port.
>>>
>>> Tested-by: Xuegang Lu <xuegang.lu@airoha.com>
>>> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
>>
>> [...]
>>
>>> diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
>>> index d3781103abb5..c78cabbec753 100644
>>> --- a/drivers/net/ethernet/airoha/airoha_eth.h
>>> +++ b/drivers/net/ethernet/airoha/airoha_eth.h
>>> @@ -535,10 +535,15 @@ struct airoha_qdma {
>>>  	struct airoha_queue q_rx[AIROHA_NUM_RX_RING];
>>>  };
>>>  
>>> +struct airoha_gdm_dev {
>>> +	struct airoha_gdm_port *port;
>>> +	struct net_device *dev;
>>
>> Nit: we now have priv_to_netdev() (I hope I remember its name
>> correctly), so that we no longer need to store a netdev backpointer in
>> netdev_priv structures.
>> Just an option, up to you.
> 
> I think you mean netdev_from_priv(), right?

Yep, priv_to_netdev() is something I used in the past locally, it went
to the kernel as netdev_from_priv() from a different author.

> I guess I can fix if I need to repost, otherwise I will fix with with a
> dedicated patch. Agree?

Sure, up to you anyway whether to use it. Most drivers still use
backpointers to netdev in their private structures.
From the optimization PoV, netdev_from_priv() should generate a bit
better code as it's then clear that it's just a fixed offset from the
private structure, not a separate piece of memory.

> 
> Regards,
> Lorenzo

Thanks,
Olek

