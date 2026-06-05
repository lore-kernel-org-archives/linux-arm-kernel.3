Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17BEBCD6E7B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 18:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P73K3lXSth4KKX8QznOjgRNgyjaRANX055XP2prgico=; b=VjcvxmQwQqDFluzIjp0MHIR2cC
	z4aUA+uslStd3NtlA+/PI6YZbkKH3FHbLR9Z7qTi9L8G8wqN03Ef/bKTn+d4fe63AIQbxcf8yyQdy
	FJWPdkvA2FbLYQVx82sahK1UWjNJE9hYN72bsgBvrzPPc459IB+JTIYNn/ptKUNRXCjBs0PM2eaii
	f7+Vhe1kcTz7usLyOusVqGZi5Y1AoKWBSaasNbScRwSFoxt8DBVhbVJqju+6SmQuiexzxlu6OxZsx
	svHUS7BCgP+jZIoXI44oW/9DJkC5rqXHhrShEwmXIWCyYhrjgaNr6fKe0PMmXxe9QqYCV1UO+Iph+
	JEb2IciA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVZU5-000000013sr-2G1d;
	Fri, 05 Jun 2026 18:41:33 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVZU2-000000013sU-3a9t
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 18:41:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780684891; x=1812220891;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=P73K3lXSth4KKX8QznOjgRNgyjaRANX055XP2prgico=;
  b=MP4TV5NV1ymjGF/vsGvHUuE0AdzptWWUzfn69yMQq43eNz9nexKiVeG7
   aHzds9X9n3/4mPKxduaSBCQAImrVbHMj5nSmKIcUpksGC8ydexd34RoH/
   sAvYtddseFtx6t2/p3AMQjnvKghSQxx3eMttjxnrpEUGCRXk42cHgP+fN
   7qo84Sjo47+bfeoJURa3QkjLZ7JxpyqhVu8o6bXgKcHlf74+SRBeQDema
   Qn3rg4rcZJVhTAU8LrTMTm+1wTalYfdFB28d3t8WgALGoATUWLwbJ6mOP
   R+sTsSdUO6K0XZdE31TigQ4KAcRP6l9g9JWWU7EM9XtipSBGKbPkWVxZi
   Q==;
X-CSE-ConnectionGUID: 7wNjpkgRS+6hC/oBK+rLXA==
X-CSE-MsgGUID: JNxt3IHQQLyNxHcpbYVoTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11808"; a="92093008"
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; 
   d="scan'208";a="92093008"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 11:41:28 -0700
X-CSE-ConnectionGUID: zMm2VjFRR5a8gFNUrCXQeg==
X-CSE-MsgGUID: +pBhLdQoR8ig2pSjWC4yGw==
X-ExtLoop1: 1
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 11:41:26 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 5 Jun 2026 11:41:25 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 5 Jun 2026 11:41:25 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.69) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 5 Jun 2026 11:41:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sueF5lQrcSmlgFgGrI/6aejdQjQ+2o9xJ+qG0hwkGmQqp1cYFfMMpKzW4Jko5XfUuYKnUZ20C6kv8tSW2UZIOHQVQg1j8Zxco4CWBWMkvVJbnueU+apr1sb9IzE5yAjrdDTP663ToeL955zinYsS3oVvLcaczoema2mpyFSHu6dTuxgVX+ymBNt5OwUCRsePrL698k+brV3jjIE6TAZjEmxxA4sBWiP6YU5BwYr3bWYtnVH8RYdkT5TyI8JhCQr4YlSXwFouzlbZQoqFXhlb5+04G3yTsvg8Ghp279qjW7wAfVAC/QiRrWHtsUFiYa+/W0vkzApOnh0ln9r7OzQZdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P73K3lXSth4KKX8QznOjgRNgyjaRANX055XP2prgico=;
 b=fNeiYsFtJpj3XNrVmUwHnj/RRfh0YdZKw3os23QHHUHYIf+6xxLGb2IBqPBsAqQZvBKK1F5LAKdrUDj7io8NXygm+O5AiA5+lURq7vY+T/5BxU11Y3DO7WUaZ3tYu3mzAwrVHPOlk405sbU1rCnVi8z3sPJbSBFFsQBHfh+36VwH18dTYoIwG1JITNy+Oq+gKakXIn4NIdBCcIu1zKSCbhSkxSVvVC5DyitaASejCQzk7Q3Gpj6KFn9bpwXynVEbYtvNYBrzF4R7oLojoEyLUixxkAAerEDUPeEvzt7spxoWcSmBdPLXLghVmozP0bELJ/uRIuCBDrLovayI9KRHVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by SN7PR11MB7490.namprd11.prod.outlook.com (2603:10b6:806:346::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Fri, 5 Jun 2026
 18:41:20 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%4]) with mapi id 15.21.0092.006; Fri, 5 Jun 2026
 18:41:20 +0000
Message-ID: <d53df455-437e-458e-a7f8-72681ab4d3fa@intel.com>
Date: Fri, 5 Jun 2026 11:41:18 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] x86,fs/resctrl,arm_mpam: Factor MBA parse-time
 conversion to be per-arch
To: Ben Horgan <ben.horgan@arm.com>
CC: <james.morse@arm.com>, <fenghuay@nvidia.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <corbet@lwn.net>,
	<x86@kernel.org>, <linux-doc@vger.kernel.org>, <dave.martin@arm.com>
References: <20260515140612.1205251-1-ben.horgan@arm.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <20260515140612.1205251-1-ben.horgan@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0054.namprd03.prod.outlook.com
 (2603:10b6:303:8e::29) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|SN7PR11MB7490:EE_
X-MS-Office365-Filtering-Correlation-Id: 19e021b2-1fcd-4510-09f6-08dec332093d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: YO24geJFe69klrsQyblzhcVIUCxu2RVlBdTDLA2N4ugWTB+GkhQ8AIc4PPjUtIMiiX5Wz6knLFD2xbcZE1rGAPOvmmx49Od3+KPXLXQUUPBrQnC1nYeimRo2XcBt3UZl9nkU41XXB12AjqwO41rjmzT5sAQqlsiH6OWgQvdetCEu1sSzM5++Bayg0cn4ZCHbGS2GTwWXeKZ22a27L9puA4o2aWr83EIbBk0kDMwdkyAi9udN3EzwU0zM4bTobp7PNAyiYpH4piorkdnAfgpATF1yk4K7nrMPhX0oIl0wSLiutkrfchTLqnfeciOA6fXxAP63QSbLKD7cPpyShGIqR8UyzZs8XKs+BvkjYgNKSFSeBPd6jlwvSyu5txK3JEQO06HHrNhPJjCf8y1FDZG7jIn0+HvFPZrvemiTW1qYOBd3BtNB5EI2gW7LaOzNmk9M/50mcIruSUlh3vTu7N4HhyBl0sod5VlYEIFQ93NLF60G2aoTzHxagf3rbImFf0iyz4FwEKtgN8DNDHPaMqU9G/TDtVGW8+zbBUY6K1gPxgY2uYkgGmg1n1/pW8VXYq+Osz/+CUQVcMyW1FUBx4C8kSyiZkJG2p2+raNCYnRBCWqLwzkMjOq09Z2WKQ9t6+0/28keRm3cA0Wqxla2Okb92AVEn3X1qllr87hJljjGb7gQGlEfDKyTT5NDGH9aoo6+
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHZicy80Sml6aUlDZmE4SzJ1NWNnNUNsaXlCd3lNMVFKODR1eTlXb3ZHMkJ2?=
 =?utf-8?B?MGVna0J5WGRVTHc1ZU9GZVhqeE1RSzNFTzhKdHo4WHhGanB6MW1wVlptaENn?=
 =?utf-8?B?M2JlTWlCQUFVaS90L2RQLzlSWEdGTmRidStQUGp2am1zN0NXZm55Tkg2MHpL?=
 =?utf-8?B?OUZKM1FCNytneE5Db0U2WG4wSS8zeUl1SW1aZUwzYWltSkMrUjdaWHpLZHly?=
 =?utf-8?B?TkFnZ09wUjE4TnZ0clhWRDdWazhnYjlKK05mUVlNajlEREF6YURUNGpTMmtr?=
 =?utf-8?B?b1VENk4zbkgraTlNT3lsRUcrd0JydFVCWGZsaU5IdjdCa01pSSsyenlHTC9a?=
 =?utf-8?B?dWV6UWRnbGVLL25veXl2b2s4MXJLUGdIK2lEMnFJV1o4MFFIWU5IeEMxY0dK?=
 =?utf-8?B?dGJvK1NkUnQ0M0I1cUg1UFpDWWFVVEQzSmxEaGw2SmFhWjMrZHdOazZjTkt3?=
 =?utf-8?B?dGVJUU96bjV2ampONzRibmIvWWF4bHcwanlSUGZaU2kwRnVwM2REYWQ3eVJI?=
 =?utf-8?B?S0ZlTk9MbXJtaHBCcXhGVzM2cXUwekNRbnFkc09XOEFEZEdpZW1iVndVUXJX?=
 =?utf-8?B?dHhnUjdFRDhMQnRzeW9WdXhvRVhxQWZEN1VIYXhYZ05xRHpodEU5K1R2ZzRM?=
 =?utf-8?B?RWFwODNUa1FzSFZiZXhkQjNCa0dHVlJyMmlRSmJFV3NYTFN2NFBOb3c0Slpa?=
 =?utf-8?B?cWt1bDFrL3dNRFJKMWJjWDJXREF1SjR3UkF1VUExOWRTUEhDcVY0dWV6bklN?=
 =?utf-8?B?eFJHeUFkZzZ1cVBxdzNaUDNUMG1mNUZYUTBiMDl2ZUhxU1dnYW5WdE5RUGRP?=
 =?utf-8?B?MmFrcHBjNC8yR1JyZndKRDZnQU1rRXRCZ2p4M3hEamJTRFBXb3E1Z1BmR21P?=
 =?utf-8?B?Ly9YenZNaDI4SGtwbS95ajlacDVCYmRtY3RaSDdSWUlSRis4NEYyL25WSHFy?=
 =?utf-8?B?VjBZRm1ZQW0wd2ZKNC85WWc2UGhVbFRydmlkdHJXNGFzblR6SWpsUy9kbXha?=
 =?utf-8?B?QzFISFdka3dBK1pnN29KZS80TlRYeExodUcrRWpMNjJFMzMxQ20zM1FhbFZw?=
 =?utf-8?B?RnZNc1BkR3MyV3NaRXNFNmV5SHduWDhXaWJ6WVpwWmpNS1J1SlkzZ0oyVnZh?=
 =?utf-8?B?bFVCVVFaOWl2c0lFUi81WUxVVmErZGo3UmxzYkcvWm5ycWRZZnVGSkJhS0Yz?=
 =?utf-8?B?OFFkdE1xbUxyZGlzbFh2bXVpdW9aYTZWNlhsKzYzUFUwRjd1bjJzZnYyVEM0?=
 =?utf-8?B?K0RxOTl1WVQ4ejRhSDZXWWtkMFF4alNlRnNTRGVCdGRjWmdYQ3huSzJBdVo3?=
 =?utf-8?B?TW5SWTNmYUFaRDdyK1BmSjZ2SXJtZEZRUzJjZEx2blFsdFlDb2hvbHJhNGlO?=
 =?utf-8?B?TG1QRmdQRGhDcG9sVERzaHBGVGVvVnlISlk2dEVpd25sSi9jVlRpTUg5d1lZ?=
 =?utf-8?B?RUVOdmw5YXdYb0FOQXNjT1VBWGIrUXh6YjQzQnU4YkdnY1U2OFBmSXdmWEMv?=
 =?utf-8?B?aElxZE52VXVZVThNZ3dHNUJQWTNlb2p4L2xHWWowcE9lRUFQUWhVSGFGNDlw?=
 =?utf-8?B?MWU0U0c0bG45cnlmV0hpbXRkZ05Gb3VsNldQakZKQWFLNkd5bkxqbWdRZmVn?=
 =?utf-8?B?UjlyaUJoQ0FlanFLN2xLM29hMWFyUFdsLytvU2dheEg2czNiTmxrUkJJWWVG?=
 =?utf-8?B?ZlV1Ti96SW5yZnpsYnE3UDU5dWpCS0ZldjFGbzMyY0Z3aHRudzNKQ1laRUx1?=
 =?utf-8?B?RFFPNGNCVjlwNXh1RDFKMU5CL3FGM3BIMExBT3hwWGdOaFlrRVBlT2RzbnM2?=
 =?utf-8?B?WXI2ZmZWWDRreDVPUTYxQS9ZeUVkM2dJQzhXczZDNXlPNnZDM215ZGk1Sm9X?=
 =?utf-8?B?Y083OTlYYUprM2dUeE1NOENlY0lhbVYwSStlZERNWndTbzllTURIa2R4YzRQ?=
 =?utf-8?B?dDdjV3FzZ2x6Q3pVcjZ5SE5Eb3N2Qi9ZUWJzNDVjZFBlM1ZqdzIvOFFlN1JK?=
 =?utf-8?B?V1JIdVI1UWw3clc0dFY2SFNZSmVQWldMT3g1WWxTNzBObExiTWpTTGpSakJp?=
 =?utf-8?B?QVIrbVcvSXNDSTBvYnM1RjBDVXYxS1VNYm1ZRzVnOXJOMnpZV0JIMitHWnRL?=
 =?utf-8?B?dHNwNXRnKzlSUDZ4Si9WVlBnMzdaRmZpb2lLbkpEeEc3eVJINk9XWjBvajdO?=
 =?utf-8?B?dmNjektwRlFtMkFQdXJVelpRc0Uxd0JqVWdhNEsxZTB0NzcrK202QXZ1V3o0?=
 =?utf-8?B?MksvTUFBV205eEIxWnY0KzlxaEttSGthR3NBWGpUQWRKUm1FaTAyRGtGdmJL?=
 =?utf-8?B?K1pnMnY1Q1hQenlTZGlTVG5tV0ptQUhpS1A5blZUMzVtMjRvZktYOUxwRFZ1?=
 =?utf-8?Q?0HyLcbAYJ/0x6t2o=3D?=
X-Exchange-RoutingPolicyChecked: oMl3XYFm1RP0TBJZnpdDZVQkwSTOKnbAY5/XYB5uhmaZSyiUavTvxW5gGfWepsdcXN7mJ5TG8/xkXBMPGdhS8NGKbed/ZuSrUPvcXbyhs9jp9siCSaXtw72+KcV3M6F+IPRa/o/FANngYxRGVSlhXTXICgto1Bkrbn8OS2F4+OYatEnzFn/f3urzIf+FSPryxWk8CuHoa7xkZBAwzDZEf2C0qqnyBKClmScoc47iuvPmhANcit4ZpjbtKcSuyelItNiYQNHD1H2zRbFncoweO9pZqguQyivTRzpKsK2BGmh3i9+LB1iam9FnyWSLkDmEA7+lazFmDg33ojrYg1WXnQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 19e021b2-1fcd-4510-09f6-08dec332093d
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 18:41:20.5675
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: otzWrz1f7AAhS7rhL1RfQIT86moA+y+Z/3O1UxWUBdKPFy6JIIVSiJq0fXUm4B3q20Nl066kXGKMiSygzMYqBsyD9zD8GuBS4PInsSK7Pm0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7490
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_114130_914430_ADB84D9D 
X-CRM114-Status: GOOD (  13.52  )
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

Hi Ben,

On 5/15/26 7:06 AM, Ben Horgan wrote:
> This is a new version of Dave Martin's patch [1] to delegate rounding of
> bandwidth control user values to the arch code. As there is now more than one
> architecture using resctrl, I split the original patch into two, a core resctrl
> patch and an x86 patch, and added an MPAM patch. Please let me know if the patch
> break down and ordering is sensible and whether the pattern should be followed
> for any future similar changes.

This ordering is sensible to me. I find the patch breakdown a bit fragmented since
the logical resctrl fs change is split yet I also find that you did what was best
to ensure bisectability. I find small changes that are local to subsystems easier to
consider and believe it would be ideal to only have patches touching multiple
subsystems when it cannot be avoided, for example when doing otherwise would break
bisect. Even so, we may learn of better ways to do this when this series is considered
for x86 inclusion.

Reinette


