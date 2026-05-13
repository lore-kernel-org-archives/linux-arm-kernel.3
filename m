Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A077CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 20:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ql2BFZ6hIlaRWfrmaKY6b4ErsGDOpy8XiGPhWyw/HD0=; b=T7zWXI5Q4657nc2n+p+HueCN3H
	eKEY3bsPaCk60d8HZnTR+M67rav/+hIjGH8t6v4lO/5VRW4Relbl+agQ9r/LFUQC/P0Fddo+22Kpg
	8k0tsIAgH4VS2R3nyCboaeAnmrCnyeu9vKwrcSdwmWC3QZvFY9TbYEKIQJAVZkO+MrK1g3Vubd7/A
	GYQsQX+LL0giFalPN/Zbp16si5JLlpe4p72m0RURXZxA5lMfrzzAAeJUS8kpSHy9apDEnRss8BvJ3
	jPxUjNeVoXU8lFsEScWAf2qMBDomwcFzkJ+n9xVr/mEUcDJY1EwgG1X9fL1DaR/bYYzPSnlUVsYUT
	n5Wdxzfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNFml-00000003eR4-3tSx;
	Wed, 13 May 2026 20:02:27 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNFmj-00000003eEg-0tG0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 20:02:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778702545; x=1810238545;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Thlx3Pj37/vzZGa/YzC7+OS57t+OnLvc5vLmvw45AoE=;
  b=PJBy+GxmMuxdKyIi9hzzC31QmQAdBi5ugY+ATBeBEDE383MWyiq+gfYz
   TVGG35J5x5tKhRcv+Y9FeuUU1BC8tR613Y9FJ2CUz5cZVTw2x/EVC+/R4
   1+4R5eGt9qyQ/P84efsDaYwrwRUtbusWfYmifWP95+IwuCsmfgzMmT4kp
   sOhqPb7kshExTpCWJkkJJAJYvM8iZuGgar76gwLt9tmElkIgNONGS6eSr
   DAriNLixInse3nY63hLvHMk098S0ZIRfXNuS3dY95GcpFPC0I96lCXzfb
   9rYpO/RC5Kz0mJC5E1FfUuI0J7yAG/eMQyOFgip1LHddireFLBjl9rubd
   g==;
X-CSE-ConnectionGUID: j4EL/KPnSlKDIThzMYhjvA==
X-CSE-MsgGUID: j2wTIZD6Sgm9yd//8wa3pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="79497646"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="79497646"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 13:00:22 -0700
X-CSE-ConnectionGUID: +wWBu5jvQGaMZGUiW6C6Fg==
X-CSE-MsgGUID: dkShG1jzQOiolYgrMHhr6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="235114324"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 13:00:21 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 13 May 2026 13:00:20 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 13 May 2026 13:00:20 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.8) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 13 May 2026 13:00:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ch7Tlvwscs1NKqud74whJypFrgtsYbnMoUC/dqKMBJYIx9mHq9GYozoNxMOniKFzXqt1Ip3wT3xLlaUZTtrDdDyty3kq9PSYJ60JALT7Li8AFWcE5AdmTlaHN0Tuu5wqUn287/ufgSynW5sHJYJGJz9C68eIhw28vqmjSXQi3Xnrmc/sJ9+0Mvp+ViXCPR1r8JKgZ7PtyS+wXLXAB6ArgcYBFKwZVuIriYvZACUb4Itk/nCajaZtGXNIa5+O3yHfcNlPhUPMG9BF2QgklAOUBfJEYjvm7WNbiedoaltGBd33sLjpvsZdlvnZh5vkOkyaykyRsqze+oHYmSfx3CdcUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ql2BFZ6hIlaRWfrmaKY6b4ErsGDOpy8XiGPhWyw/HD0=;
 b=U3X+XNYhiL5RijGrFrN6b4pFPyrpUT0cRaiVvWv8FFOlRZ8hnZnI+5ItdO9Fx6KH02VIJt46tudjrnabVeAbYwRTMDIRSWizzhIIG77etgUDr2INsmFaFkBpAaIZZhn19WYGV2LImNESLVMOoLrk0TrAT/MS0JOst1gDexuKi6ak9CrFGPDtP5Vizr3vzEaWwcc6zL3RFU9rlJF/jcWBmEplOYy4P5VBDmlgcAzpRHVjadHvztzU7CCs3tRD+S/30xFU02uoZNveQnWxO9wqTYa7vCEAf02O4+/j4ZemrXic5+Mw8C9eQs9v20GxXib5hiJxoQjNMYApJ74PAZT86Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7592.namprd11.prod.outlook.com (2603:10b6:806:343::16)
 by DS7PR11MB7860.namprd11.prod.outlook.com (2603:10b6:8:e9::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9913.12; Wed, 13 May 2026 20:00:11 +0000
Received: from SN7PR11MB7592.namprd11.prod.outlook.com
 ([fe80::3e09:8700:df72:37b6]) by SN7PR11MB7592.namprd11.prod.outlook.com
 ([fe80::3e09:8700:df72:37b6%6]) with mapi id 15.20.9891.021; Wed, 13 May 2026
 20:00:09 +0000
Message-ID: <9fbf6682-b521-4b7e-b5b6-af91694ed051@intel.com>
Date: Wed, 13 May 2026 13:00:05 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/2] net: ti: icssg: Derive stats array lengths
 from ARRAY_SIZE
To: MD Danish Anwar <danishanwar@ti.com>, David CARLIER <devnexen@gmail.com>
CC: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Jonathan Corbet
	<corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Roger Quadros
	<rogerq@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, Meghana Malladi
	<m-malladi@ti.com>, Kevin Hao <haokexin@gmail.com>, Vadim Fedorenko
	<vadim.fedorenko@linux.dev>, <netdev@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Vignesh Raghavendra <vigneshr@ti.com>
References: <20260512060627.3781329-1-danishanwar@ti.com>
 <20260512060627.3781329-2-danishanwar@ti.com>
 <CA+XhMqykBWcMdk+iNnOtUxM4MX6jpDyUwfuAVZFbjAShO9_v7Q@mail.gmail.com>
 <6a1f411c-d7ed-463b-abf1-277d8cc0c184@ti.com>
Content-Language: en-US
From: Jacob Keller <jacob.e.keller@intel.com>
In-Reply-To: <6a1f411c-d7ed-463b-abf1-277d8cc0c184@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0189.namprd03.prod.outlook.com
 (2603:10b6:303:b8::14) To SN7PR11MB7592.namprd11.prod.outlook.com
 (2603:10b6:806:343::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7592:EE_|DS7PR11MB7860:EE_
X-MS-Office365-Filtering-Correlation-Id: e421620d-6e37-447c-b636-08deb12a3c14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|11063799003|4143699003|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: AYlc5/mZxv2BPJdveoKRjRSrdqPzvJCR0X+/Xp1ZfR/n3sMvoyWSrOVnD5BxEH4DwRhuDxREeN+LWbM3RxOwarhbidBrVxTv6LvsgTWt+Z/HmhzyfOeeQgOv7c8/PSAi5sxTTQ3qq3EoCm7PaQsFN9reerfwaH8ukW1eJ08cVPuMR0P0X+2Tz/V22E/C20s7zqRisNwQve0AyJIUzqjKjghbwGfClDye1LYWYgMnTcLmrqG/zTJ+O+9xOGe0yDpuhvLmEeyyX2w5+PH0r+noCy0AnbBK2T/k0ibT4bB8XpoR8Ql+Sun3emIXzAx8lk7Y03AJy+hsEd736cKojzzyZq+/YZTp9MxOxLXHfzlh9vmPe7QWwWlmyr8sXF9CKYMzvIsCDplMrvvhYTN0aSYI5ogdh2SFkg1M1ThmxaBy27pdI0sz4Y7AT2tpOnt+wXsLm8RJKsbhbC71vLp3lBPQKLYaEjfx0LIyXFo0Pwia7N370VYYaIKQkSC9OS8bqvHWkxYizvmgYKDk165lBzl5tjT+I3yWBKbBBl/vMeMZc3OzHsma5ozKn8qWEz19Gq1Q+GHyQsAdVphl7zou1ayQ3zGyefx+61OclbiJmxz5b5JsDbffoK9uc2sRlovGMAOaxGA0R6APIB4sXCaist+/iZBZGBernHc5FD2NORiVvPPfJnMGkV5gFDiYLHALGGIH
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7592.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(11063799003)(4143699003)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OEp6cXd3OEVLYWNJTFFVTXdoaC80L25HMm5XUm1odzNBUUVSaEhSN3AySW1Q?=
 =?utf-8?B?cUI1aXhTZmt1OGN1TGV4S1dVaEZkanl6Y2RYc2RzaHl5aFR2ZEhTakgyZ3Zq?=
 =?utf-8?B?Uis2VEwrR1kzeWJQNXdxYWhYdkplS2pNN21SWEtHVjRUWVpGSjdmeURxTWNu?=
 =?utf-8?B?YjUxdXVFRThGWmdabEpuc1U5R3BJRThEb3VzK2diSjkwZ05MWDNsdHZTY3Rt?=
 =?utf-8?B?ZU52OWgzam5CUC9XWEpRWExMaGhXYXdzWEt0aVRqSVJUbkxVdjNPays3VWNh?=
 =?utf-8?B?ZHUvRGpmek0xa1ZHNCtPVXdoeGZkeElZT1JDTkczdVBqTjljS3B4UXN6Mmdo?=
 =?utf-8?B?UzdzbjVlemNzWVg3bjBWWmhyZ1lFdlFwbThyb2h5cGRmTUhIcWRndU9xU1lr?=
 =?utf-8?B?SlAxc1BMSmhTZ3hQSUlMWC8wRTJRVWIzZzVLckt3UFBKMnIrazNCNnAvRGNH?=
 =?utf-8?B?dXpOWU42RmZlUm9yL1pMR2hYUmcvS0dDck5iZ1p6Q05XR09HcjAzaktYT1Zl?=
 =?utf-8?B?VEtqMkZ3Y1JQNGJWTElCVUhwdHBzUW5QeDgxdFVBNU9YOElYYk5zM1JxRHZZ?=
 =?utf-8?B?R0JWOVJJUnRTckpRRGUxZjNnSWxwNEs0SjNpeGFqbHFKSHBiS1c2VVg3ZFNP?=
 =?utf-8?B?Zmg4WDROU01CVzBZOTNObHRhNVVWd2pvanpCMUluS3MrWnNvYUY2V3BlaGgr?=
 =?utf-8?B?RHVpcGxKVkI1T3d5ZXBQSEp1ZzBYZXEzTGVYWjFUckhkN0dkSkJwT0RRSGUz?=
 =?utf-8?B?ditnNVFUZGtieXFmRG9ncXFUREJ1bUJDeDJxOXlmaEJ4WVVMT3ZvY0xCTFY0?=
 =?utf-8?B?ZWRLcVZYL1ZianpJblZRZWNZUW5nWWc0RnBaRHZiQ1BTdUdTLzVuWUlMRUFU?=
 =?utf-8?B?OXZxUEFwSE8vRk1DZVpjOHFTZTU0T2FmZ3lSdEZsbjN3alE0UFVsQnhhSFNH?=
 =?utf-8?B?aGppOXVING5OWmtLUUxKdXJhcGdUTUM2cGMxZVNxTmRLVEJTM2Z6azFEWCsz?=
 =?utf-8?B?b1hiU2svdkprY1NDT1Y3eDlUV283NW0vL0FTcCtIWlV0cENZUzNEbUUyWXNN?=
 =?utf-8?B?WXZCS1dmWSt5bVg4Y1k5SkRBekFpM3NyOE5ib2M4R2tUUVR0T2R1ZDJmVkcw?=
 =?utf-8?B?TWZPWVZ5T050Zm9Nd1pMZ21YbVRjYmYrNHJpbkJVV3RSVVlWMlAzUkJvTzZK?=
 =?utf-8?B?MlQ3b3hvcmN4WkVIVU9STjZMbXF0TlM3MjZUME1rYkdzRVJXYmt5aHlHMHZR?=
 =?utf-8?B?RC8xVXZyNzhvbkh5Y1B1RG1xaTFJWnZKeEtwUlg2VjkrK1FuQmgvdm9EZ0xw?=
 =?utf-8?B?Y05ObXBSQU1zM3BjR05kcTI1VDNRZFRscVplby80ME1mN0s3cHpqN29yV0F2?=
 =?utf-8?B?dVphaVF3NE9oa2txendnN0ZYN2ZFUHFKeGFqZ05sUVkwOC93V0ovaUhnT3Fr?=
 =?utf-8?B?ckt0Ym1zM3pOc3B4RVN4QUE4anFDVXplYk43QzRsUWkzWjR0NzBDQjUrbm9y?=
 =?utf-8?B?c0V1alBuaDh2c2VHcUI3ZnJBbUNSUnEyaVk2N1VTVnlVTXlWMXlGOTUzWENn?=
 =?utf-8?B?Q0hhV045endaWG9FYWs2Wlo4RzBmUTl1SGdNTUtUWGVnRmI2N0huano3TVg4?=
 =?utf-8?B?QkczZ3BDVUV0b0xSQitINU9lNVNweWpNeXRWSjVRMytxbVgvdk42aGI1UFBj?=
 =?utf-8?B?ZnBtRWJPTE15ZEl3aWl3YW85KzhiZVYvSUVkUnNmSHJzSDhzZ0kySTZDdTZt?=
 =?utf-8?B?eWFLajNzUkozVzN5QnFWM2x5N05NbnVUZTRLOS82UmozK292QVMvWjFsNzgy?=
 =?utf-8?B?QUV6WThCb1VYeFVrVmYzbDJjbUc5UVFjL3d3azhzNEp4ekhjcGFnOUp1c213?=
 =?utf-8?B?T1ZBeFR3bUw4STNSVmRRWnlSWTgwejdSZldEQWFNK0plK244ZW9Lc2VaejBl?=
 =?utf-8?B?VmZCS01xNVdSL3hvUmFwYWxEcEhla3lRNVNCWG4vc0dVTktOc2hZbmRFc0xv?=
 =?utf-8?B?OGlIcGtmbEdhUzBOWGxhR3k5TFk5eGxUNGZad3lyQURINjF2R3J2QjEvNEZU?=
 =?utf-8?B?TW9xZUVWN3AzUU01dUtVZmFWL2t0aWpiZ3pIeldpRC81ek9UVkhldlcrbVda?=
 =?utf-8?B?QkQwbzhlZGJpZ3NmTUQ5bm0xVmRCWkRrTWJyWk83SlRxQTVYa2l6eVhYZjJR?=
 =?utf-8?B?VVBZS3oxL0N2V0kwdzUycGFMeFB2TFhEWFA2MXp1eHE0TkM1REdzSHNZOTRi?=
 =?utf-8?B?dVBPZTFlS2t0N0NnWXZlaG9meGtSalpTbFJHLzcwZ0dKOTd3eGEyZGdMQkZr?=
 =?utf-8?B?eUVTZDZ5VnZiNjJVY2xockxlQVpacHA0UzlWQ3FOdzk3WVJXVVBCZWRwZkJs?=
 =?utf-8?Q?y2NH4X8vGEcHL1Ek=3D?=
X-Exchange-RoutingPolicyChecked: hU/vzk57BNmPj9HtRQeOfhBQcIM6IeDkhD+1j0wkue/T/LZdoU65xtKWu9nfIHO3/41RjwPG8Im36Tri+k6PH7swxAxZtffsz1l2IHBBigfIZTD/bO4woiS7z2V1b5M4OTwxbmPpM6RxqlPjowNqpCwbg0CMBGUB0JqfILtm5XmPEyMKD2phmknhS0V5eSlAKzbu/oTqAGCt7qghMOQT1HYRg+cU+rNnQ6DGwBX2Bxp42R3ymwAdoYzjQbsjJzL6AHNuhIVih0k3nUbZrggJFh6QLa7cQXf3mbkPDhcPSqf8Ep+b+FLQ4RC90UftdFOev5rJPhHod7dpItibdAF+nw==
X-MS-Exchange-CrossTenant-Network-Message-Id: e421620d-6e37-447c-b636-08deb12a3c14
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7592.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 20:00:09.2619
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IYvdXjFF4TuPBGLmGgsLXPFHncn0Q7PDPrk06k1rP0Nh7kjUtA+8gNYtKDR9Lu9yBh6hantJworlbfoWkqTmOnfkOYCNuU+olAvulQ9h/rQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7860
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_130225_280645_D4ED92A1 
X-CRM114-Status: GOOD (  24.46  )
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

On 5/12/2026 2:40 AM, MD Danish Anwar wrote:
> Hi David,
> 
> On 12/05/26 1:28 pm, David CARLIER wrote:
>> Hi MD,
>>
>> On Tue, 12 May 2026 at 07:06, MD Danish Anwar <danishanwar@ti.com> wrote:
>>>
>>> Replace the manually maintained ICSSG_NUM_MIIG_STATS and
>>> ICSSG_NUM_PA_STATS constants with ARRAY_SIZE() expressions derived
>>> directly from the corresponding stat descriptor arrays, so that adding
>>> new entries to icssg_all_miig_stats[] or icssg_all_pa_stats[] no longer
>>> requires a separate update to a numeric constant.
>>>
>>> To make this self-contained, break the circular include dependency
>>> between icssg_stats.h and icssg_prueth.h:
>>>
>>>   - icssg_stats.h previously included icssg_prueth.h (transitively
>>>     pulling in icssg_switch_map.h and ETH_GSTRING_LEN).  Replace that
>>>     with direct includes of <linux/ethtool.h>, <linux/kernel.h> and
>>>     "icssg_switch_map.h".
>>>
>>>   - icssg_prueth.h now includes icssg_stats.h, giving it access to
>>>     the ARRAY_SIZE-based ICSSG_NUM_MIIG_STATS and ICSSG_NUM_PA_STATS
>>>     before they are used in the prueth_emac struct and ICSSG_NUM_STATS.
>>>
>>> Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
>>> ---
>>>  drivers/net/ethernet/ti/icssg/icssg_prueth.h | 3 +--
>>>  drivers/net/ethernet/ti/icssg/icssg_stats.h  | 7 ++++++-
>>>  2 files changed, 7 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.h b/drivers/net/ethernet/ti/icssg/icssg_prueth.h
>>> index df93d15c5b78..e2ccecb0a0dd 100644
>>> --- a/drivers/net/ethernet/ti/icssg/icssg_prueth.h
>>> +++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.h
>>> @@ -43,6 +43,7 @@
>>>
>>>  #include "icssg_config.h"
>>>  #include "icss_iep.h"
>>> +#include "icssg_stats.h"
>>>  #include "icssg_switch_map.h"
>>>
>>>  #define PRUETH_MAX_MTU          (2000 - ETH_HLEN - ETH_FCS_LEN)
>>> @@ -57,8 +58,6 @@
>>>
>>>  #define ICSSG_MAX_RFLOWS       8       /* per slice */
>>>
>>> -#define ICSSG_NUM_PA_STATS     32
>>> -#define ICSSG_NUM_MIIG_STATS   60
>>>  /* Number of ICSSG related stats */
>>>  #define ICSSG_NUM_STATS (ICSSG_NUM_MIIG_STATS + ICSSG_NUM_PA_STATS)
>>>  #define ICSSG_NUM_STANDARD_STATS 31
>>> diff --git a/drivers/net/ethernet/ti/icssg/icssg_stats.h b/drivers/net/ethernet/ti/icssg/icssg_stats.h
>>> index 5ec0b38e0c67..b854eb587c1e 100644
>>> --- a/drivers/net/ethernet/ti/icssg/icssg_stats.h
>>> +++ b/drivers/net/ethernet/ti/icssg/icssg_stats.h
>>> @@ -8,10 +8,15 @@
>>>  #ifndef __NET_TI_ICSSG_STATS_H
>>>  #define __NET_TI_ICSSG_STATS_H
>>>
>>> -#include "icssg_prueth.h"
>>> +#include <linux/ethtool.h>
>>> +#include <linux/kernel.h>
>>> +#include "icssg_switch_map.h"
>>>
>>>  #define STATS_TIME_LIMIT_1G_MS    25000    /* 25 seconds @ 1G */
>>>
>>> +#define ICSSG_NUM_MIIG_STATS   ARRAY_SIZE(icssg_all_miig_stats)
>>> +#define ICSSG_NUM_PA_STATS     ARRAY_SIZE(icssg_all_pa_stats)
>>> +
>>>  struct miig_stats_regs {
>>>         /* Rx */
>>>         u32 rx_packets;
>>> --
>>> 2.34.1
>>>
>>
>> One thing that caught my eye: icssg_all_miig_stats[] and
>>   icssg_all_pa_stats[] are 'static const' arrays in icssg_stats.h with
>>   ETH_GSTRING_LEN name buffers per entry. Right now only icssg_stats.c
>>   and icssg_ethtool.c pull them in. After this patch icssg_prueth.h
>>   includes icssg_stats.h, so every .c in the driver (classifier,
>>   common, config, mii_cfg, queues, switchdev, ...) ends up with its own
>>   static-const copy of both tables.
>>
>>   Would a static_assert() work for what you're after? Something like:
>>
> 
> While adding more stats manually, The ARRAY_SIZE() approach was
> explicitly requested by maintainer [1]:
> 
> This patch is a direct response to that feedback. static_assert() would
> still require updating the numeric constant on every array change. The
> goal here is to eliminate the need of manually incrementing stats count
> whenever new stats are added
> 
> Your concern about multiple copies of table is noted and valid. Could
> you advise on the preferred way to reconcile these two requirements? I
> am happy to restructure if there is an approach that satisfies both.
> 
The way we solved this in the Intel drivers is to use a single array
which contains both the stat name as well as the offset from the
structure where the stat resides.

The stat string code just iterates over the stat list for the strings,
while the stat value code iterates the array and computes the stat
address from the offset and size and base structure pointer. Each object
that has stats has its own stat array structure.

This is probably overkill, but the advantage is that the strings and
their values are stored together and adding a new stat is as simple as
adding a new entry to that list.

I.e.

struct ice_stats {
        char stat_string[ETH_GSTRING_LEN];
        int sizeof_stat;
        int stat_offset;
};

#define ICE_STAT(_type, _name, _stat) { \
        .stat_string = _name, \
        .sizeof_stat = sizeof_field(_type, _stat), \
        .stat_offset = offsetof(_type, _stat) \
}

#define ICE_VSI_STAT(_name, _stat) \
                ICE_STAT(struct ice_vsi, _name, _stat)
#define ICE_PF_STAT(_name, _stat) \
                ICE_STAT(struct ice_pf, _name, _stat)


Then the stats for the individial arrays are defined like this:

static const struct ice_stats ice_gstrings_vsi_stats[] = {
        ICE_VSI_STAT(ICE_RX_UNICAST, eth_stats.rx_unicast),
        ICE_VSI_STAT(ICE_TX_UNICAST, eth_stats.tx_unicast),
        ICE_VSI_STAT(ICE_RX_MULTICAST, eth_stats.rx_multicast),
        ICE_VSI_STAT(ICE_TX_MULTICAST, eth_stats.tx_multicast),
        ICE_VSI_STAT(ICE_RX_BROADCAST, eth_stats.rx_broadcast),
        ICE_VSI_STAT(ICE_TX_BROADCAST, eth_stats.tx_broadcast),
	...
};

(Note, ICE_RX_UNICAST is a macro that defines the string value.. I don't
recall who changed this to macros or why vs just having the strings be
directly in the definition...)

This is probably a lot bigger refactor to make work, and may not be
exactly suitable for your driver. I've considered "upgrading" these data
structures and logic as helpers to the core ethtool code (or perhaps
now, to libeth) but never got around to it.

