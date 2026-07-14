Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28578C44508
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 17:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1ro1+iVkrnYmiF/FgzDC+gio7P45OsEP9wjtqAwhHSg=; b=2pYwllpPZyAaVLj1C5LL2pr7HQ
	j26OzZz7ABXjlUWOe6jqxk8GEYlUnEGJbeN5K0ReufNLxOvqoSXIWJf5K+SOpCqWipQIi8FnRI7YW
	xVIbBqmnvXk6O3K69Ovc8R0uwNvP+b5vsmqlywHoTHY1bMJMFGO6PnJTcendgtRRIF4bkiQxVGzO7
	s8rWYutr4GN6OoYHKg5473PkfE30ESX0DDTPFLwuFgG7xE7ZiE917TXKJ43KNmliYtA94ReXTylag
	Wt1izedDNpbcEPqT6r3dVW2gApUdjTu4q8gJPJDyvGYG9ClyRBbe9bkHzWk2IPQ38ZlScOeXVtOnS
	nNWVxtNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjhCX-0000000CoSt-1xAT;
	Tue, 14 Jul 2026 17:45:49 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjhCU-0000000CoSP-3OOV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 17:45:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784051147; x=1815587147;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=SWb4s/NtLbCE5yrfjNpK6Xb4cG50Xm/uPI8siu40/x4=;
  b=PKVUaf6tP+VbdINMfRC1t9mbZtlBUz3VRZuTgisAHoFqe92tK24QNnCO
   yFqLNiyDwFNRHUJSlSqL1c+PFAnX7cjxvPjiGYfSoIGu3UDxvJ9Uqx/qP
   DKQf7LOxsdbmLhzN1KyDmRGtJRSj8lU8+CE5WowLaFTsnVYZvoKTh3p3A
   yO21iMdxp3YQgukOiHhXIsE7wSInpIKNab5inkOCVMallzjNqdBY+ETUf
   5bJ52kOFreliAYWkVCL3fIpdN3rFUHu2PGSr073McYOxE9c9YmcBqDdO1
   AiZXQbwcE9CJSOtR1TqPUG0QWJKLb4pLFkPVydvGq344bpRu/L5rVe/0q
   Q==;
X-CSE-ConnectionGUID: D2vq8iC6TAWTWB6MWednEA==
X-CSE-MsgGUID: eb+rXo6ZQM+IBb7n7dH4Bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="72204770"
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; 
   d="scan'208";a="72204770"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 10:45:42 -0700
X-CSE-ConnectionGUID: MctsmJgIT2GBhf/FU7bRPw==
X-CSE-MsgGUID: 8qrqx+PBRTO7vK66BQeECA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; 
   d="scan'208";a="249564615"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 10:45:41 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 14 Jul 2026 10:45:41 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 14 Jul 2026 10:45:41 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.65) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 14 Jul 2026 10:45:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wzLzhUsaEdUmvfh3SAomSvvgrqn/wXE/Ik2CALFkMbagwFH0XisyIVPyqaR8DLIS4cAUoqr1kt1TP8j6+0vdTzIN9y0+ymHmftKib4OEaHQfHRli+rQqTnwwYd1Rup0bRT+6106nFCQG2h6jsmmqE+AcEptawpK4QmFy6Vw3FHURsReK+Sctw+tHgeucT4gdC+EdCk0YfAeRg19F071gmaR1o7nP0b5s6jFF98AngYsv/7LwdiBTvRR8wr39cKe/j9+/xEdEFeffvsTnTEbnKNYrVxHF1TwNBfmYVmC+TLgp6vLjhLXckOgTH+bMrxQ5xdQ9n3+RkXFhgRk9FvyNfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ro1+iVkrnYmiF/FgzDC+gio7P45OsEP9wjtqAwhHSg=;
 b=KxK/59RHijn3fFi6vLR65TFfX/tudNcJ+XlPPvd3Wjrcfy8Wc4NQBTMA2YXf89L8CsxhaazAUvLPEU8PKBupEogS/cl7Dv1yb1tz+2G1MF1zrJpdDKH6j2NJK3AAhCRZ8m7WcSLXjVPxF3tOeWXvee09ThxJHoedcAe4igzr4RlnkgbEmJM2yrAw5lFTcYHwsmsq1GgqBvMASfnlw/Zp2rz1gSxCY69qka7wf8b6Uo6naOHuL8vU1dk3vVdIwBsQZKVGPbqULez/u4HhvOGgiuVHZjuLcDXn/yEQP7Jsguv2D6YqJpjOMlFl4N16FlJTXOOc11zWPeBvo8tHTfzLcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by CH3PR11MB8095.namprd11.prod.outlook.com (2603:10b6:610:154::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Tue, 14 Jul
 2026 17:45:37 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0202.014; Tue, 14 Jul 2026
 17:45:37 +0000
Message-ID: <165e7636-d7e9-4d16-aad1-657b4a9698d0@intel.com>
Date: Tue, 14 Jul 2026 10:45:35 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/3] x86,fs/resctrl,arm_mpam: Factor MBA parse-time
 conversion to be per-arch
To: Ben Horgan <ben.horgan@arm.com>, <bp@alien8.de>, <x86@kernel.org>
CC: <james.morse@arm.com>, <fenghuay@nvidia.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<tglx@linutronix.de>, <mingo@redhat.com>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <corbet@lwn.net>, <linux-doc@vger.kernel.org>,
	<dave.martin@arm.com>
References: <20260709093111.367851-1-ben.horgan@arm.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <20260709093111.367851-1-ben.horgan@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0197.namprd04.prod.outlook.com
 (2603:10b6:303:86::22) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|CH3PR11MB8095:EE_
X-MS-Office365-Filtering-Correlation-Id: f0df42e3-b750-44cd-bb3c-08dee1cfb6b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|23010399003|3023799007|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: a3xtb1BJvMRZW6KW2NTbddtwNyTmrtDFw2UhrsGQ4UDd9O2zASSWPVpaSRrMLuh/QtZrLGpVRRPafMevV4DBSKRy/Y++hmheZT91n4qnM606U+yCFDbBixcFe4+SpTSYFtT88LrXmk/OTW6CAdJVi+TW0zr0eTZ4LQYwd9OyX6Cdc2maP1gp6zecCGaoJbDoMsjjTEHZjixY+RzPdK3bRyxQOzKVJJTgdS7s0I6k18aXf3adZGRAVPpLlw/PJeEhWHdwpEM3jG8XCyrC+qtMvzzoe/9tNbbTe3AtlPfNbKyYNz2yHXjQJ45CohY41jZ4wU5vDBrvWpR4ZXtY2bjL3QiULQoTQ9y8hxt88Sg9R8B+wmsAH7NEwhTGenN/Pa9UnoV2WP5XbdA3vRJkmjvKxEeEulvn2AL2sdHd9R1CJE3ueTxPnQW1DZShBp5quGIsYWx5zW/WQZx2ri1+PgRWSdaCK2z7TqvnoeSMvrQs/WrEfZ8tBAGP1uStchQQcTNnJ0dd2EnGnr87VKt8aC31rgWZHeqJ7bjGZ7P0IO5aDq3H2j9fbAi8z2rDZMgkARfpRWoNXkmK15wHQ4hKYM+N/R20DCzIEamY4u9L3wnUh2f3LrMST0eMqwJ6eYCdgA1VDK42/WhVFifevoh2b5k1dD9aGjWGrrz5B22HveYyO7Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(23010399003)(3023799007)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZnJ0YmI1MTZ4U3c4VmRoRXRJdElxZTRJWGxsV081TXZqR0ZDcDVuV041MXNv?=
 =?utf-8?B?N1hHOUtOTjg1TWlFQjFRZ3BwcllRSnUzME0xN3p4Y3QwZDhJMTBpbTFOek1m?=
 =?utf-8?B?eUkzVE1KT3hXWGRFdlF6cFJhZmVZVElxcVZiSk1uZ2RxOEM2enowQTZ4aWxP?=
 =?utf-8?B?QXpBMHFrTVYydGY3dnhZNmdWaDBOZ2ZZQkFoUkp1THpnSGRxRHlIUTExZ0Y5?=
 =?utf-8?B?akJvdFhNSklaaVVLVXdYb212ZXk0bGhsSTU3aEdGWlE5WWJJdThqc2NjVWYx?=
 =?utf-8?B?KytITndnVzkwSW0yOXpCVE1zWTFxOVJDN0xqeUtxMmp2UGk4RFpwZjNIa3A4?=
 =?utf-8?B?M1lvYXY3RFlSbHh5NVN6a0N2ZkNCdnRSMitzRXhLaUFQekVXZENDV002dTZt?=
 =?utf-8?B?ZW1peWFkN0M0NVVvaThYWUpZdUQzakJDcVVmUThZb3o5Y0o2M0d3YUlMczNo?=
 =?utf-8?B?bi9Hb3ptTDJESVpCOE9PNkZpZU1pZEVabXBoVDdmaTBQeURiOGR3dlhzcTVq?=
 =?utf-8?B?QXBBUk5SNHN5UEk3OHk1MDlCaVVLYzhycU41djJXLzZzMHdLRWs2RmVUY3Nr?=
 =?utf-8?B?TDJvdkt6NGkzMmE5S1cydFhjc3hTQXczKzFLRXZtRlloeE5oSmxsTWVpSHNu?=
 =?utf-8?B?T1NuWUF6aE5nMTFvdlhIQlJ4NjI1VzA1Z1ZEazRLY2Y1dDJCUGZPazF4R3di?=
 =?utf-8?B?dzNKaFQzZW1NZnNzNW5QMitBQmlFWG5vQWYvVUxlVFlTaXF5QzZEWXpVS3Aw?=
 =?utf-8?B?NWtrOFE4bjFVS2sxeDFjRVQreW84QjBUZDQvNXQ4QkZrWjVubnk0U0RJMFp4?=
 =?utf-8?B?QW5xN0hLSlZqWFhqbjNuSkk4aDFrNGtBdFJZQVZmd0wrdUhiWWdLK2JQZWVJ?=
 =?utf-8?B?eEZscmRMMytMc2lkY3lDNXpFd2hUQlRhdVpYazcwSTVPK214Mzg5akpJL0Rz?=
 =?utf-8?B?ZHNaN3NjYXpPbHRjeXJtZUVRSXVwb1FSNWZXc29uaU1aY05vQVlnRll2MS9Q?=
 =?utf-8?B?Ym5CV29aUGZ4aGNOVWRlWjV6cVg3UHRoVmF5aW1ncVB3UEhZbjdyYnR3d3Jr?=
 =?utf-8?B?REtudDVNa2dhQW1BcXRlaDMraFA1S0tYaE8vSVBHck90akc3ZDQ5VmVqOVVu?=
 =?utf-8?B?R2dBVXJ0ZVhrMXAyT1V4OXhnT3g4eWYyZXRKY1k0Wkd5SUVTVGtlanB1Y1NU?=
 =?utf-8?B?Z3NRVm05Ly9uV1prMXZGTzI5dm9uWEZDSnRQUitHa0xzMFROR1M4WGhaVEtn?=
 =?utf-8?B?eXZUZWp3MFRoY2tyUG9NU0RRU2xvMkFoaDJYM1A3cWZneCtoa0VWcE9ObUtW?=
 =?utf-8?B?RGFON2k2ZmpBVXZoYURmdCtZR1R0Y2krTkxlRWpNL25JUEZ5MGxvMlhIZnow?=
 =?utf-8?B?YVRhTjI4MXVyNG1PM2I5RFhJUGtkZGFGeThmb2VGa0NlL0tBOE9Ic3o4NFN6?=
 =?utf-8?B?UkdqNDRVK2tWeTZUZmMyQ2EvNnBCSkJXbzdtWlZMRFFmaGZjZHJpdDlVWXg5?=
 =?utf-8?B?bUpmVTA4WDFFT1JPbTBvS2ZnR1NyWksxSHlyUitKU3ZyU2NKL3lYOHNaVWRP?=
 =?utf-8?B?ZzdiWEhha1pDRzJNak03VlQyblF2MHZJMmkwakt5S2VXZldjYlM4dUZZc0NO?=
 =?utf-8?B?ZXNheXJEQ2hlNU91Skl0bzkvUTJBL1hocTBldHdJM0M4NnNITjl6YU1sQUhu?=
 =?utf-8?B?cktIVnVEZGdJUmNMcllPcEQ1QlJKeGdDS3FLdG42QVFzejgzc0dES3J1ZFJo?=
 =?utf-8?B?UHY1azR4bmxscHo0ZndOakVpdk5JbTU0MEdzQWExUXVwcHVXc1R5RDh4TkRB?=
 =?utf-8?B?S2dtVCt5elBleHhlVUNJWGVCT3RJSmNueFBCQktCRlZkdXdQN0pUeDJ4WEJM?=
 =?utf-8?B?N0ZjcHZoeklLVnJMUlZtZFZnY3pFSklHcWlLTmZPNk1kTFRkbkxMaW5WalAv?=
 =?utf-8?B?OHcyVktBdDRLR2xFL21ucXo4cjNDQnBjRlU1TTZEK2ZVelNqSGg1QXFxRkc0?=
 =?utf-8?B?MXhUNFMzOGM3L3pmVUVoRWxsRmtZRCs0NmtaUjhNYmRKMCtmQncrcjN4dDBF?=
 =?utf-8?B?cktWeit2RENNQjRKWmZOeEd5WlRRbWlxUXZidUc3alFMOTdLNlg3WDNoaW5x?=
 =?utf-8?B?T0R0WXY1ZnB1Q2wrNEU3UDkrWDI0b0hDTUl4VUVzZUJZdlZLU1FZeURGRXFw?=
 =?utf-8?B?MHRPVVpINmFESW1BOEovdzJZeVA1NlUwSm93cnloeHFnMDJSZE5UbXJNWlZa?=
 =?utf-8?B?aEJtcmVaRmJobDJjM0VSZW9BRTFVTkROb2FuTmg3MzNYWE9oNFFqaWJpMFMw?=
 =?utf-8?B?WmY4UmI4UUxCL3BYdTdWLzFvZDkvNGE5OWtyS0Q5ZkYxenRpajJxOUZtRzZl?=
 =?utf-8?Q?saY5wmsuoeIhjBb0=3D?=
X-Exchange-RoutingPolicyChecked: rSTfG5pVVx/wCA6OrG1nWk0CSaKbiCqan2jONmzBqVWgiIdwSZpStCnVKEU+shwmQPuSmGtBd7yL7P025xfqWyyoMLq+Rtt9vQWC10MRF4E1sr0bPUPGIOV5fCdwJHrkoKm/DXj0BY1FxODa1YcibRtxZOsFuCIAgzzV6c/l5tywzr7eipm4QldkPRJ/83BAF4lvfMcnnbBdzYdG6v7O7h9zyGrXonJ8T1xEJqoMVQtXfA6BylWtH2oWmi1AJ6IL+fH1SRFL9RPFwmlPxbrhjtbpK1hBSy1VUKeSp93PMhz11EMaL0jCMOha9hhVqgUs1ChTGuIqieV/CXbK3PAg3A==
X-MS-Exchange-CrossTenant-Network-Message-Id: f0df42e3-b750-44cd-bb3c-08dee1cfb6b1
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 17:45:37.4121
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J5VvaWk84kLYfc1zSQc1+45D0O5lpYerSmT3QFrmvd8vgjsKVA5+rUucMgndRh+P3SLijh0Ld4rdDcRdkG66/NT0wfbPHwYIBuzKxmQXJ/8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8095
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_104546_901832_CF208F0B 
X-CRM114-Status: GOOD (  23.33  )
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

Dear x86 maintainers,

Could you please consider this series for inclusion? It applies cleanly on top
of x86/cache with HEAD at
	 2566b5cd6a27 ("fs/resctrl: Fix UAF from worker threads when domains are removed")

Please note that this is the first instance of a series that touches resctrl fs, x86, and
Arm. Since this is a resctrl fs API change these patches should stay together. You will
find in Ben's message below that patch routing via tip is supported by Arm.

Thank you very much

Reinette

On 7/9/26 2:31 AM, Ben Horgan wrote:
> This version fixes a couple of non-functional mistakes in v4 pointed out by Reinette.
> 
> The patches should stay together so please could this all go via tip.
> 
> Changelogs in patches.
> 
> From cover letter of v3:
> 
> This is a new version of Dave Martin's patch [1] to delegate rounding of
> bandwidth control user values to the arch code. As there is now more than one
> architecture using resctrl, I split the original patch into two, a core resctrl
> patch and an x86 patch, and added an MPAM patch. Please let me know if the patch
> break down and ordering is sensible and whether the pattern should be followed
> for any future similar changes.
> 
> This does have a user visible effect on MB schema when using MPAM hardware
> with 'bandwidth_gran' greater than 1. I'm not sure if MPAM hardware with such
> coarse controls exists in the wild but it is spec compliant and I've tested it
> on a model.
> 
> [1] https://lore.kernel.org/lkml/20251031154225.14799-1-Dave.Martin@arm.com/
> 
> v3: https://lore.kernel.org/lkml/20260515140612.1205251-1-ben.horgan@arm.com/
> v4: https://lore.kernel.org/lkml/20260706160639.2136674-1-ben.horgan@arm.com/
> 
> Based on v7.2-rc2
> 
> Ben Horgan (1):
>   arm_mpam: resctrl: Add pass-through resctrl_arch_preconvert_bw()
> 
> Dave Martin (2):
>   x86,fs/resctrl: Add resctrl_arch_preconvert_bw()
>   fs/resctrl: Factor MBA parse-time conversion to be per-arch
> 
>  Documentation/filesystems/resctrl.rst     | 17 +++++++++--------
>  arch/x86/kernel/cpu/resctrl/ctrlmondata.c |  6 ++++++
>  drivers/resctrl/mpam_resctrl.c            |  5 +++++
>  fs/resctrl/ctrlmondata.c                  |  6 +++---
>  include/linux/resctrl.h                   | 19 +++++++++++++++++++
>  5 files changed, 42 insertions(+), 11 deletions(-)
> 


