Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3142CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 06:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vH1DfstfVLBPA+ro/2/uh2z9wln5mohoDRnyTm3neMc=; b=sWWG2ovLAZE3sLe0iYzRNfW0gJ
	dZVJkBCX6lYR+rZ+9mf2Gyd/kCGjPXtloQ96IabKuBgCZzGR9FWjiekoS5YCwlJUfBrphmbp29krm
	JgmCukunI54+7XxKU+jImnBl+h/pc0p0DBZdToBZ24QQwUYAyGpZmVa7OqUYEyYCzynDy8erSPTm7
	rDbUQlXgXCvorY5cwr336CmmmP85IVVacwjdXdHPc5VqvmQ/lpgewF67wGheHjI6p8Bx4wdmX5/JV
	uR/MGHvWHX4EvBGMT8Bv1GQKiR/vATUmJ0PNqlpx9uGiYYUmlk5N+t4UZODLUic+APKtfdZCvcTI3
	z+4hk25Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCBGz-00000008LcS-1sgs;
	Fri, 24 Oct 2025 06:27:37 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCBGw-00000008Lc3-3jE5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 06:27:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761287255; x=1792823255;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=cqusTmCdb7QIuIAl0QfmegO7uuR1nxeni+Wrgr+ei28=;
  b=MBNVtgO9n+3fl73dTEK3P+gXF8XrSVhNqujjUcaOEkpKpurngffB67Ln
   U7AwPb0eXljLFu6haM9LlPjO6TPfHFDE5/N5fkLPFVRqeqBkbM5J1JnRn
   Aqc+ZJXV8yvWYw49A7z4p1NbTNdNqaQL7Upzn0xbSrnMpQUd5Rrmmtblt
   pUInwd77xIE0jw0+kQvNBiTNLe+0t99moCb2JBw7JqO8hdOxYuJ2MEx4q
   plcy/lJkEU/JUWEXYwnu9Sn60Aj7HLsYln61JeKDtpdjYwgjA0Go/nSWJ
   /s9hBUJxBGCHJGahmD1GS5daL7gYK7CTg4/wLx33HjA/2wtoJvIvck6Pl
   A==;
X-CSE-ConnectionGUID: HFmF+h/cTQKKe3SwUN43xw==
X-CSE-MsgGUID: eTU0PRT2SXeYAohfjQus9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63389290"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63389290"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 23:27:35 -0700
X-CSE-ConnectionGUID: TDpOYWAUQHaeHKl24/ZURA==
X-CSE-MsgGUID: z+v3ik0dQCWoe4iwhh14EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; 
   d="scan'208";a="183579882"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 23:27:34 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 23:27:33 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 23 Oct 2025 23:27:33 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.32) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 23:27:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K0+7UYUDsLXqR8oFb8P5vCPZMjb5yooqllJ4Vk8h72Uytc9mbaXmhBPvdbISzvXX6fz2zuvyFz+ZmMj1Ezht+rv7UjDnajbcKXuIGzeN1XJr+VhOE2nmRL4QtGdLYqAgH+0L6ugCCegVEtMBm3HMONtXvX/lL6vpFlbWE0Kp2oanrw/8Kp2lKdLDymairpeDjMXm11pAZynW/lwTaB73tXF6KYXhMrHm5LB/ckAAlUVhjoiBLEB7eXOCUM96uBIEeOSxJAdgfBZSMo/AkNLXeg3rEHErzGX+Di3gMnSzMKlOHUjpr8WjfxxHWu1aFLOPKypZWXg9R4gW8OhOItzgtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vH1DfstfVLBPA+ro/2/uh2z9wln5mohoDRnyTm3neMc=;
 b=ZkNGP6XzxXgHsfRzesjMhA3XzzUTZhc1cD7Aix3oCPrj4iKrZHGnlV+SWIer0T14el2H/0qHavrQCGKD6sg7r0NcS0KEOqoywa9x/NCyR99omr/W7F9rfmHnJfQ8CDmU9W+FaT1fgCTskaSlUjEuaei3wl0ATxrhOEtCNlRDFMAKM7R7mlhlmFHsJFbPC7DOOZ13AWLynit/oua8W/XKiUT8dXMJPgjO0gqkVX8JAk5HrYFKHrGUPiPGiDFqH/r34ddltWbhh0Ned5FI5lLLvOGzfMvfIsibb/lFDnuies5c3z3ZTBuzS+zzleicLAzgx8bayIlXtBgne24Hj+rdeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by SA1PR11MB6734.namprd11.prod.outlook.com (2603:10b6:806:25d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 06:27:31 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::eeac:69b0:1990:4905]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::eeac:69b0:1990:4905%7]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 06:27:30 +0000
Message-ID: <22b7b11e-b1fe-4d9d-8749-afe57ea1c35c@intel.com>
Date: Fri, 24 Oct 2025 09:27:25 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] perf arm_spe: Add a macro definition to handle offset
 value
To: tanze <tanze@kylinos.cn>, <james.clark@linaro.org>, <leo.yan@linux.dev>,
	<irogers@google.com>, <john.g.garry@oracle.com>
CC: <linux-arm-kernel@lists.infradead.org>,
	<linux-perf-users@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<graham.woodward@arm.com>, <mike.leach@linaro.org>
References: <20251016083019.27935-1-tanze@kylinos.cn>
 <20251017021540.45930-1-tanze@kylinos.cn>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <20251017021540.45930-1-tanze@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU2PR04CA0081.eurprd04.prod.outlook.com
 (2603:10a6:10:232::26) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|SA1PR11MB6734:EE_
X-MS-Office365-Filtering-Correlation-Id: abbe1022-970a-4840-a39c-08de12c668bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OHJxMStHZVBnRlBITnI1RlBpMXJVOExtVEkvSHU1NWd1Vnd2UmRRVHV2QWpT?=
 =?utf-8?B?dElxSGJFU2oxTmkwR2FnYzVJRGxjZEU2MGJaWE94ZXFobzJ6bEdoVGtQQk8w?=
 =?utf-8?B?VXQzZFVqTnNBbFIwdkVMbGs3cDMxWkNscm84SUdpRE82M2JteUVESURZblN6?=
 =?utf-8?B?ZXd4aFZaUU52dmQ0UVFMQldBcHRGcHdCOXpYYTlSNEY5U3J6NThkQXF4bTNL?=
 =?utf-8?B?QW54bWc4U3ZGWUdQTWdWZmxoQk1sVzVnSjdSSlA2Qm1tSDBYRDJNTWgwTjdj?=
 =?utf-8?B?SlJVZXNpYk52eVBSOWd5YjAwS0R6WWdrSmQraTZmUXBIWTlPTEs0M0tJK1Rx?=
 =?utf-8?B?M1ZWc0VCcVZNdE5HL1ZvZmxNbnVCMjRRbjJtQklqdUwwQXM3Mk5Ma3BIa2Nv?=
 =?utf-8?B?TGRBR0tyR2FFUThnb01WZ1BtejhuUnF0YjJYY2s5c1NveENDN252VnBwZk51?=
 =?utf-8?B?TUthRE5jbnd5K2dPa2wrNmZUcndPL2M3VTlaSXNTbnE5Syt4ayt1TVdyVGtK?=
 =?utf-8?B?bHhRRUNwUnpuelBERDBQbUQwUFhiS0Nhblh6NUV3b29mcFdPZS9OYUYrYXor?=
 =?utf-8?B?elBHbHQ0eUwyc0padmUrWkcyNkdxYXdDQUFPOUFvcDc0LzdpOXl2aEkzTmVo?=
 =?utf-8?B?ZlR4MzJOVnRGK3dNbkplVjlPZU5TR3JHNEdwakkrK1RsZVl3V2Nva2szN2x4?=
 =?utf-8?B?VUtvR25jM212ZFVhWkY0MGtCc0M5YTlMVjBZb05NaVk5R0ZLVGlOaVdJZWtF?=
 =?utf-8?B?cUFnZDR1SGoxbEx5WE4xVjdXK3R1NFBRMU5QeXRvVjYyUzduZ3ZmWmtQaG16?=
 =?utf-8?B?dlgrQlViNjhtMXg4c1hTbHR3NjZ1UlJubHJmZ3UvZ25wRzJJTHdob3Z2V1pl?=
 =?utf-8?B?TE5rcHZQR2FJNzRjQk1lYWJWQ2xTZVpPRjkvdFFJUUYzK0RxUXlGWmY1dFFj?=
 =?utf-8?B?Vk02b1JsSVJkU21jQ25QK2tNZlQwR21US255ak96b1dqeVVJRGR3U2U2TEhB?=
 =?utf-8?B?WWFMVy8vT3d2WHpTS3REMy92R3RIR0EzSjlwZncvNXpaMVhhakFvYVM0bDFx?=
 =?utf-8?B?R0lKR3FBaENqMTZid0ovS1kydDMza3JvOXlvR0ZycDZmN1JlM3B0eVlJN0w1?=
 =?utf-8?B?UGQzaGl1cFYxVW8wdXdWOXFuS1NYMzB1MzNOeUNWOENBd2twS3pTa1ZBYjAy?=
 =?utf-8?B?MTJuZ1ZXU212d3FKREl6SndiZWZkdjY1QlBnbTJJaE9OYTNiaWNZRkFVOGlL?=
 =?utf-8?B?TVYxRDExdUNBWWU0azc5dFU5UFlDeHVLY0k5YTliS3dTa3BIWVpHbHlkakFZ?=
 =?utf-8?B?bU51Smo1THhVcTBQYlBlN0Y2QzhJZVRDSVd4RHh4NXhFSlJ6d0ZCbEVZSFR4?=
 =?utf-8?B?dUdkR1FLaU1HOE1VMFVWNmNxMXlEU1AyNnpNcTZxaGZuVU1YenFidGtBQTdX?=
 =?utf-8?B?ZFgzdFNYZzFsZXlOSjZ2N3kycTVQaFVVdHY0YVZYRytSL0I2ME0yL3RwUnll?=
 =?utf-8?B?cUVqNWJ3RFpDZHdlZkdIeVNENjlWaW50UHo3K1BwZGplK3ZVNVZEbGowOUdk?=
 =?utf-8?B?MHR2WjZrZ0F4czdDMVBxL2szOHR5dDlVOGlwcjlhU0N6ck5MckFVenZnbXZG?=
 =?utf-8?B?MnFTaDBOa05wQ2djUnMwTVlUUTExYTBGWXl1cE5LRkJ0MlhKaWhOK1RBL1NR?=
 =?utf-8?B?VTZFWjhRMkhTc1pBU293Q1duTUM3dkMxZWdlaGE0MEYrb1VVdlJ1UnJsWm9v?=
 =?utf-8?B?R3FxYWJMTEdKSk1ZaGk5SDZXNFhNN3R0WHViS3ZNdUNKS3BtWDlOQmprWklw?=
 =?utf-8?B?THBybGVoZStDVkhleWRGMEtOY3g4aVZQR3BFSkdXSDg1VWZydHBKUFIxVi9P?=
 =?utf-8?B?QlZkVytSb1FJcGZOdXpMaElGSmJMQm8rNmRGOXoxRFhoemdvZHNiRDdsMWNr?=
 =?utf-8?Q?npind0FW+EozwUuzaRzrfFKnHD4UHAW6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUlxRHdFaTlBSGhIcWxteEhBZ0xsMHk4MkNYK2M5NTF4NUFOdHUycDN2RVhh?=
 =?utf-8?B?eDJNY250MHV5T2UzaXVuOWVIOVN1cDBXdEpnczNCaStRNjk4ZktWL0ZtbkRG?=
 =?utf-8?B?WmFDbU5BbDdqNjBzeWZ4NWNOVEVkdU1Wb0hEdVpXaFJrVVBHaHF3d09oNmtj?=
 =?utf-8?B?M3JQMHBUNmxnSXUydDM3MjZ0bGw5UHYyM3FnZjlrcmRwL3kxQU5rcWozUkRt?=
 =?utf-8?B?YWFUempLTUZDTzRUNnl4UGNDaWVqSDlGUGNLSHFYNTAzYURCZGVVNEJoN2ty?=
 =?utf-8?B?NkU3UGdaWk5DaWZLMDBudXVQZjZVcDRkbkVtbDJKcWxoUE5meUs2YWhkZWtk?=
 =?utf-8?B?aGQ1clpxQ3dWbzJjNFRIWDA5UzVEUlB2M0lsV0c0aDY0TGhxYXhwalhBTnI3?=
 =?utf-8?B?dEpQOEo4MWNCMDdON3dkY2VvcW5WcEVOdU51U3doMnJBMXVndEpiZkVTUndR?=
 =?utf-8?B?YVkzMUlIYWhBSm4xemhjQVdOeHlmUGlNb2dtWklOZ2dkdXNLb0JMODllU1lk?=
 =?utf-8?B?c3d5dE1tKytuYkI0Skw1VjU0dmphNUFKZzFKTXFHTFlQRjhnekZQTEFXaGZi?=
 =?utf-8?B?OGNUMEVzOUdrK1JObm9pZExZeUtVMTdiRU5wRklkTGZIRUJUY1Fva0xxNXYw?=
 =?utf-8?B?S0V1d1NtM2ZQcDI0TlpXQmFZaWZyV0dzdWJaQ215SGdCOTBPRHZnNmYxOUll?=
 =?utf-8?B?NmttSnFvK0VSdHV1UUtXY0t4bDd5RXVvODhLSmsvZFVpa2ZqU0pnY3JkdzJP?=
 =?utf-8?B?bXNaU2FOeXZMZ1ViQ0lNakJuWXQ3U2lnaThwdnpRbUJERlgrL2dJcURJejcr?=
 =?utf-8?B?aVNZc3czRHhXZnJYTVNSYkhOUVZSQWpmRkdOYm92NXY5MlpHMHZDNjdaSTg3?=
 =?utf-8?B?VkpDNGwxTVJGeWJINVN2OUtYSlRXV2pWc2F2d0F2RWVsYWx6cGVXRWdTcDJR?=
 =?utf-8?B?d2dQNk5nTDZERjA1OElad1BGaDdBaGxIOWJ1Y0Y0MW4rSVZlc2dQMHNmc1Jz?=
 =?utf-8?B?QldrS3pCUlF3c1B5RU1COU9PTFgrL2NJZVFJeGZXUTVOdEF4VXpiN0RXaTB4?=
 =?utf-8?B?eitBQzl3NmNielMrdzZqQzd3RGNvczQ1MjdzQ2wybHlRWHhjbStzWm16S2du?=
 =?utf-8?B?ci9wSTRNWTdZUFZrRjI2bWhzLzFrYThJNnJ2bEdCSU41N0NLd0g2T0lNOUVW?=
 =?utf-8?B?cFpqMW0reC85VnowWUxudU50ZWlrRnFqQzNlK2lkdmh2WHVzNWtaZmFIc2xm?=
 =?utf-8?B?eGlycGp2ZXlpUFNCWldGQWxpMTRSZktLV1FKRzhjOWNYdDJHRk5RWlVhbk9C?=
 =?utf-8?B?TGtPYUNtTlpnbm5qcjh2aGc2eW9tQTVtekJNUjEwUkZmSW5FRUtKUVNlamFY?=
 =?utf-8?B?bWV5NzZQZTBiNGMrZGFQNzFrSVBNSEVRSlJHMXl6ay9Jck1DNjFXcDdxMXJO?=
 =?utf-8?B?S0g5YXJiVm1aZW1vSmFZMUhnbXJQNHhCSit6RGViZnNjL1hrNmNiNklUQUQx?=
 =?utf-8?B?Nnl1bkI2THVzcVRFUitZRTc2SXhZaENXckczMVB6MVF2SFRpUkJadjdHbDJt?=
 =?utf-8?B?a0pDOWY4SFVXOFE5eXpQZGVHVXlhMTloL01FOUFTc0g3aE5qaEk4cXpHNE80?=
 =?utf-8?B?SjN5K2tBNFExRzFXcUtYU3hHSXpvM3d0QzNFUFJ0aE9lb2IxT29pSzVIUVpP?=
 =?utf-8?B?b0RKbThUSGxnR3VUVzRpYWt5Ui9ua2RicW1Xc2JndVNubWlnclJ3ZlBHeTF0?=
 =?utf-8?B?WWRBQTVTR0oxTzRiN29vdnY3a2FxYnprU3hGdHdsYWpYL0dpZkJXa05QUDVy?=
 =?utf-8?B?L3hsZmI5YlVsYmJtQ3YwUEE3cEF0cHA0U3AxTUdtQTYyTklGaWtYL1ZnQUU5?=
 =?utf-8?B?VlRIUWFELzMwb1hRMWc2L2tnTjRYM1BMMW82VXFHY29nVHZpVy81Uy9vT2M3?=
 =?utf-8?B?MndvWEw0d1ZzNFJZL3NFZWRtelF2TGxFdkFNY25jQkpuQm1vN1FUK0RRK2RC?=
 =?utf-8?B?cnFhNnpRejRCSWZoWWlzL2dEaEFnUFZOcFR2NEZYckFTbUZ3d081a0dSbDlG?=
 =?utf-8?B?ZE5iQk9hdy9lRFFjbHRQUWpCZUlMb0V1dXQzOWROdkQxRk5wMDI5c2FPN0d1?=
 =?utf-8?B?TnZmNFpqem12STczSFltdm9PR2NDbnBCZVJ5WkZ1UmNYb0l3aTh3ODFhTllP?=
 =?utf-8?B?M0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: abbe1022-970a-4840-a39c-08de12c668bf
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 06:27:30.8918
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zyL1XFkSbxPAwo4xmmmvxQSGCe0st8jmSJKgomyXZs5Zm+IOZTsZNQ/vdCrSi4oobY7EkP9OIlclK8GWpDEbqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6734
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_232735_037844_66C5B4DA 
X-CRM114-Status: GOOD (  19.06  )
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

On 17/10/2025 05:15, tanze wrote:
> Add a macro definition SPE_SYNTH_ID_OFFSET to handle the offset value
> and improve readability.
> 
> Signed-off-by: tanze <tanze@kylinos.cn>
> ---
> Hi, Leo Yan
> 
> Thank you for your guidance and suggestions. I have made revisions according to your requirements. 
> Do you have any further suggestions?
> ---
> Changes in v2:
> - Migrate the macro definitions to the synthetic-events.h file
> - Add modifications to other source files that use the offset value
> ---
>  tools/perf/util/arm-spe.c          | 2 +-
>  tools/perf/util/cs-etm.c           | 2 +-
>  tools/perf/util/intel-bts.c        | 2 +-
>  tools/perf/util/intel-pt.c         | 2 +-
>  tools/perf/util/powerpc-vpadtl.c   | 3 ++-
>  tools/perf/util/synthetic-events.h | 2 ++
>  6 files changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
> index 71be979f5077..b082cb1666a6 100644
> --- a/tools/perf/util/arm-spe.c
> +++ b/tools/perf/util/arm-spe.c
> @@ -1732,7 +1732,7 @@ arm_spe_synth_events(struct arm_spe *spe, struct perf_session *session)
>  	attr.sample_period = spe->synth_opts.period;
>  
>  	/* create new id val to be a fixed offset from evsel id */
> -	id = evsel->core.id[0] + 1000000000;
> +	id = evsel->core.id[0] + PERF_SYNTH_EVENT_ID_OFFSET;
>  
>  	if (!id)
>  		id = 1;

Functionally this is to find a free range of IDs for synthesized events,
but also the range can only have one user e.g. in this case auxtrace

So add to auxtrace.c

#define AUXTRACE_SYNTH_EVENT_ID_OFFSET	1000000000ULL

/*
 * Event IDs are allocated sequentially, so a big offset from any
 * existing ID will reach a unused range.
 */
u64 auxtrace_synth_id_range_start(struct evsel *evsel)
{
	u64 id = evsel->core.id[0] + AUXTRACE_SYNTH_EVENT_ID_OFFSET;

  	if (!id)
  		id = 1;

	return id;
}

And then use that:

- 	/* create new id val to be a fixed offset from evsel id */
-	id = evsel->core.id[0] + 1000000000;
+	id = auxtrace_synth_id_range_start(evsel);
-
-	if (!id)
-		id = 1;

> diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
> index 30f4bb3e7fa3..46902f7b69f1 100644
> --- a/tools/perf/util/cs-etm.c
> +++ b/tools/perf/util/cs-etm.c
> @@ -1726,7 +1726,7 @@ static int cs_etm__synth_events(struct cs_etm_auxtrace *etm,
>  	attr.read_format = evsel->core.attr.read_format;
>  
>  	/* create new id val to be a fixed offset from evsel id */
> -	id = evsel->core.id[0] + 1000000000;
> +	id = evsel->core.id[0] + PERF_SYNTH_EVENT_ID_OFFSET;
>  
>  	if (!id)
>  		id = 1;
> diff --git a/tools/perf/util/intel-bts.c b/tools/perf/util/intel-bts.c
> index 3625c6224750..98b928eca724 100644
> --- a/tools/perf/util/intel-bts.c
> +++ b/tools/perf/util/intel-bts.c
> @@ -777,7 +777,7 @@ static int intel_bts_synth_events(struct intel_bts *bts,
>  	attr.sample_id_all = evsel->core.attr.sample_id_all;
>  	attr.read_format = evsel->core.attr.read_format;
>  
> -	id = evsel->core.id[0] + 1000000000;
> +	id = evsel->core.id[0] + PERF_SYNTH_EVENT_ID_OFFSET;
>  	if (!id)
>  		id = 1;
>  
> diff --git a/tools/perf/util/intel-pt.c b/tools/perf/util/intel-pt.c
> index 9b1011fe4826..4fb9600a7369 100644
> --- a/tools/perf/util/intel-pt.c
> +++ b/tools/perf/util/intel-pt.c
> @@ -3987,7 +3987,7 @@ static int intel_pt_synth_events(struct intel_pt *pt,
>  	attr.sample_id_all = evsel->core.attr.sample_id_all;
>  	attr.read_format = evsel->core.attr.read_format;
>  
> -	id = evsel->core.id[0] + 1000000000;
> +	id = evsel->core.id[0] + PERF_SYNTH_EVENT_ID_OFFSET;
>  	if (!id)
>  		id = 1;
>  
> diff --git a/tools/perf/util/powerpc-vpadtl.c b/tools/perf/util/powerpc-vpadtl.c
> index 39a3fb3f1330..5ce5d2bf4c6c 100644
> --- a/tools/perf/util/powerpc-vpadtl.c
> +++ b/tools/perf/util/powerpc-vpadtl.c
> @@ -15,6 +15,7 @@
>  #include "powerpc-vpadtl.h"
>  #include "sample.h"
>  #include "tool.h"
> +#include "util/synthetic-events.h"
>  
>  /*
>   * Structure to save the auxtrace queue
> @@ -656,7 +657,7 @@ powerpc_vpadtl_synth_events(struct powerpc_vpadtl *vpa, struct perf_session *ses
>  	attr.config = PERF_SYNTH_POWERPC_VPA_DTL;
>  
>  	/* create new id val to be a fixed offset from evsel id */
> -	id = evsel->core.id[0] + 1000000000;
> +	id = evsel->core.id[0] + PERF_SYNTH_EVENT_ID_OFFSET;
>  	if (!id)
>  		id = 1;
>  
> diff --git a/tools/perf/util/synthetic-events.h b/tools/perf/util/synthetic-events.h
> index ee29615d68e5..c8a1fe7a3fa4 100644
> --- a/tools/perf/util/synthetic-events.h
> +++ b/tools/perf/util/synthetic-events.h
> @@ -39,6 +39,8 @@ enum perf_record_synth {
>  };
>  #define PERF_SYNTH_ALL  (PERF_SYNTH_MAX - 1)
>  
> +#define PERF_SYNTH_EVENT_ID_OFFSET	(1000000000ULL)
> +
>  int parse_synth_opt(char *str);
>  
>  typedef int (*perf_event__handler_t)(const struct perf_tool *tool, union perf_event *event,


