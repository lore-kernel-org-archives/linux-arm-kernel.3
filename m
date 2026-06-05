Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 710E8CD6E7C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 18:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JC8dGyTC8whQEeTaDa20nEHZeb2NAN/VxacXf3l144g=; b=iVfhDUoD0IGsTGFSYsrYb8u+D8
	xscsg9I99G3lL6hwA7AZnoA/P1C+vLDOH6/6yotefbuGQcfnqEx/a3Z523bQfy/OiaLvL9Tpd15iT
	hcpnXWrHgqH9jyBjmQgDgeiBNpnLcehIXDAlvGrVZDHAKE2fgq5zZpc/JaSUUf0PV5tcKr7WSrcI7
	6A45Vo8jF98qnCF3cqqQ+29QvitWk4iAtY3qI+PVA0zaG6arTZcG71jl8IzjZuVeVVJIC9XYlOK+0
	HQ9A8Vl2TARQSuErusU+Ah7jwe4HMRziVvGOMMjX8BJ5al/phMKERDCHNYjoWCiH/E7YmAbcn3Cg6
	LlUm/cIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVZWb-000000014Eh-0tqC;
	Fri, 05 Jun 2026 18:44:09 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVZWY-000000014E2-2c6q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 18:44:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780685047; x=1812221047;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=TsQNBw32WHMGl3lpaZges5PBhoNmnvfq96c9zT6hzug=;
  b=fqVEtu7XJY44JdNJt/mUk+tAs+mGNorPZ8Y17a2Go2THMAa/ot0vI54c
   h4Hr17vEPzNgg+ExBjSTwf5duWeMtfqMBALLDYrBlvdqi5xRn/ak5Nq1u
   QOFGdxQI9quYb8rVRNfAjlyKx505mFMFh4xNSSTVAy4nPLCXkwxAXRpxi
   Bg9X/vUuHe/sh309dr2vk6Q6/qcsWy25pCuaa+qAlfE6T5IGwLgrxlm85
   p0C8O15uHJtyedqEgjF/2fkN80Hv3/rHdUOc3Q3O17SjMUPBCgqPLupY5
   wLU4NTuJ4fEgUgq9KfXsjXYsMqXJLoF1pdk3kLbstXvoBDh7HOVuXQ++N
   g==;
X-CSE-ConnectionGUID: Lac9DTtVQf+HzPqSrQW+3Q==
X-CSE-MsgGUID: yxIxb5ZQQky2agXtMp4Zsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11808"; a="85145942"
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; 
   d="scan'208";a="85145942"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 11:44:06 -0700
X-CSE-ConnectionGUID: v4l0NzdmQXujSFD1UWpdkA==
X-CSE-MsgGUID: IhTSR4lgR0qpT/74QJP1dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; 
   d="scan'208";a="243815132"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 11:44:06 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 5 Jun 2026 11:44:05 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 5 Jun 2026 11:44:05 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.45) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 5 Jun 2026 11:44:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=llbvMVaozmEzyQolqiE8y4qv/r7+56C9E/tzRM2oy7py5IeiKl+kO3Sad063QNZGYR1JyqdpYFhZcGgJHerGpu420ipREBjOpaWP+P+15321CCE7suYPPDoHwqupP0eUD5qvtDT0ddmdIEwYwyZMlQOl9RHuLaKFN2hvMalNbAlugMybs/vn4TWPVuUKVFgSI2Pnf6Y+rtD6WkULijjvl6OmXJ37rS/xHF9oVU1/tW8mT15yrb3J7MTj/l0E5cdsrskJ3rIeNFV+ol6jim9ffVsYg+S3tJMTVXuoE6aEVAxHrBwQv0ZYwChquvqjioSVABxnO7ECh05t/171dSntjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JC8dGyTC8whQEeTaDa20nEHZeb2NAN/VxacXf3l144g=;
 b=HdSSB1K4okHzRlSgRD028qS183kxjvjVPx8QRUhW21l1Hh8cb6oMTGFwWJo6RmrgrZLNyIgY2410fSemYys5sljf6enZapFozlf8RsUFN11875Mo7OlwcCsX60khWEw7QjuiBAS4LNjmkrQfcfWSwbZq4fS+Y+K4lSMQNQCP/C6Yz4+q0J/Rv9Drjyyxms6w/YyZmcmxMXbD+4KFDuBHG/IeYYkFpQMjMI9Uu01SKHPZowYYTM4k7ZvZn4HhWxy12HUpu97j6Rg9V9wsGdvyieBGKnHzh9hDwU+bfN7RO+grD/Ha9O9p6mhxbul+OpjDly+B5RLU509z+PmHyfLZ0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by BY1PR11MB7981.namprd11.prod.outlook.com (2603:10b6:a03:52f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.9; Fri, 5 Jun 2026
 18:43:57 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%4]) with mapi id 15.21.0092.006; Fri, 5 Jun 2026
 18:43:56 +0000
Message-ID: <0f67bab2-e809-406b-9ad5-ec6005c38d1d@intel.com>
Date: Fri, 5 Jun 2026 11:43:54 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] fs/resctrl: Factor MBA parse-time conversion to be
 per-arch
To: Ben Horgan <ben.horgan@arm.com>
CC: <james.morse@arm.com>, <fenghuay@nvidia.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <corbet@lwn.net>,
	<x86@kernel.org>, <linux-doc@vger.kernel.org>, <dave.martin@arm.com>
References: <20260515140612.1205251-1-ben.horgan@arm.com>
 <20260515140612.1205251-4-ben.horgan@arm.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <20260515140612.1205251-4-ben.horgan@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0174.namprd04.prod.outlook.com
 (2603:10b6:303:85::29) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|BY1PR11MB7981:EE_
X-MS-Office365-Filtering-Correlation-Id: 38a23f85-8bd4-48cb-55c4-08dec3326631
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|22082099003|18002099003|4143699003|11063799006|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info: pakGcSyismIMMcESqYeDOFsRPPnLZ4c25W+Jq/pmJ/T6jDfKVrgp9QIucyQVHe5yyMDz5vE7GCHPaSxmObbL0boKp+Dahm4qqe0GdRi3KPjqMs1cVvl2zUAgybv3BTAIVPXy+b0451Y3VsF+g9b0XK8cNMVWgUCK8Y8fdlsIvht7tzEY02qzGVsbdH9aFhpkqG2kmF23t2NnQ9C/ncxlOSqTvkTJIpanwXpoRtGvdnClVlFM5Cfjwvard6jz+VwmcC4Vt7VCDnc/j0JHLfX+MATxUAJR0/nJ2if+z/oYsOhis1q8B4k39qvsUR79Ifme4ePnvYQLQH5+CCXPww6ebwoGEUMy+6D1rXYcDqkG+/W8WkI+n7hf+0EcB2KS4TJKNavWvYnGecTjb8e0YMANP6xmNrn/phrn8AvHG/sc8dtuGrunq0H2uu+28HebsPrKIPAseZsbZ0QNb87Jqn6DwRpwhLUWtMSXb7Raf9sovrdbD0CKsckUY6Gzwd1J1aXETnxFP3Hlgy9Tl+IsiHCIbHMK5JBRkgaibyv3g9eX/adDIHyuV/v+A3CPtyBLDv4njrf2UlitdsTRMU4iW7PvPlOTUy1ZW26LlB8DRC/DpPMwie3P8mioVXgKq834dPUPGPxgtEKXNbx3erSrvfdFeqxxr7vryV71ZNiA78rZGRzAFzQnc8LqIG7sjPkv4enGk+S0E8KM9y3fww1B5tJctA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmxGZVhWdWdjZ0w2MHlTeXpER2I4NFFNRURJR2FvODNJWm1aMkwwdVgwZXMz?=
 =?utf-8?B?d2l2Y0dtZzFGZldRTFd3dVdyU2RsbFlBTStNem0vQW5NaXJSbXFTVURIYVFL?=
 =?utf-8?B?VE9jVTUwNkZLV3VaL2hVM2xpcE83azBRWEVST1RmSVcwN1VPUTZ3QW9rZENx?=
 =?utf-8?B?QnZEQWhmb05XVHA2SnZFdStYUFZDNitRdEJiYVN6c0RKL2VTTHZRM21DbXpG?=
 =?utf-8?B?VzIvU09qNnFyL25hQnZNa0I5VmRLODNpSjdGZ0Z6MTRic1h1N0xnRTVBY241?=
 =?utf-8?B?eWxVUU5VN0Q0ZzNPR3hpZXVWV0ZkelFQMnVSSndiK0lhdUp0SVo3RkowZXQ0?=
 =?utf-8?B?RG5mRHNEcThVWlZWZzhySUMwL25UVkhCOGtaQmhPLzNjcDh5TlBtTExoWVZB?=
 =?utf-8?B?Q3dDUWczcGpTMjV0N1pMTWFUVUV3UEdhRTFNS1QvRHRMVlR0V3NvZ201dktF?=
 =?utf-8?B?S01ueTA4VXNUZlN3RnhlTnpKT21tK3dKRVRZNFFodWZReXI3OFBFL05mUHZi?=
 =?utf-8?B?RjI2SytvRjU2YThYVWtiY2k5QnRiYkVLcUxNQVVMOGdNK3lqZ2ZTK3pVZ1Ew?=
 =?utf-8?B?RXpvMWhiNjBPRHhwRGN0eTJ5bXlYZ2pCaFUwd2xFb0hzVE9HZnRzRkVDQk1T?=
 =?utf-8?B?SDJsUGhCTUpOVnFBS2V6QzloaDNvWCt1NUNKTEJPOHpuM3g0elRvZXhNUWF6?=
 =?utf-8?B?ZjFJVWFZbXYxMm5VZ2xGU3kxdnZ5RDdiMnRCS3Q4SjF1a1BRRjdoWnZjL3Ax?=
 =?utf-8?B?elRHdWJrek1iY1cxdksvd3ZjeGRZRlBmSzJLVHV3THNSeWgzWXA0KzV0dis1?=
 =?utf-8?B?R3hZb2JHZytvK2R6Q1hMM3lPbDhDVW92NXBUbmRzUnNPYTRGdHZRRVFJYzVQ?=
 =?utf-8?B?RTVwMFp5bzdyWTA0MGs2RU51WHdKYVdzc2dEQWhqdjNHTWJFT0VSMDRqQjN2?=
 =?utf-8?B?eFVGSXNjM0FPcHNsL0dxR2ZmbDljRFNBY3JzR001VWx4K0YvOXp5dEp3ejVV?=
 =?utf-8?B?bFZFKzlWd0ZvNWxsRE53YlJWUDl6Q3ZxU0lXL2QyeXVvTUgzM0NRNWpPNmtF?=
 =?utf-8?B?UGUyOW1rcnJEbnZPck1peVJmR0pLdFVpY3hLTUNJUEJWK2R5UjkwelQ4bnd1?=
 =?utf-8?B?NmJiejhRWTJoaDBhU0l5cDFORFFDNjNEMjl6N2ZKTUF0M0JUS085dENBVUtY?=
 =?utf-8?B?M3hoSUxDWkt2SGp2RmF6NjRIdEQxZlNVckJna0RSSFJQM3B6L3N1MmUvS0g1?=
 =?utf-8?B?OXdQODZsMi9FczFhQUxYWXlKajJlM2Z1U1krdjhLa0tQd1hoaWZrdjFDaGxs?=
 =?utf-8?B?cHFlcmhqc1k0MXQ3ZFh0aG5CSFZ1SzVXTEdnUStUZXJLcU9SM1pKZ2xHKzBO?=
 =?utf-8?B?Vys1ZFVndFYwckduMktOVmpuNWU0N2FxVXJSUkoyclEvKzI3Mm5YQTJISHNO?=
 =?utf-8?B?WFUyWWlCN3UwRzNYOU80cGdnRkdsSk9jZzFydGNPS1pEelBUNlRFRWtRUUxi?=
 =?utf-8?B?YWthMU82ZUo1bHdYc25YVWRPUG9lL0xSQ1RmcDE0WHhDU0JwNWliK3VQcXBs?=
 =?utf-8?B?cFc1c25tekVhcHpoOUgwNUgwSkN0WTRwUVpqMkR0SVlwOU1KSVFxMno1S0lQ?=
 =?utf-8?B?a05jRE1JSFFxVXNrRVRlaWRNQlV1YUlCT3pCSjNkYmlmZWpROUp2R3M4WG9D?=
 =?utf-8?B?N25kYUdaVWpDc2hEZDBoMm5hSU9zWGJ5aGN0eHJKdTFlZk1tcU5ybUN4MEJs?=
 =?utf-8?B?WGJqSkNHL3RqUlhjVGtYakEwQnBaaUxZd3F3ZE54L3EzU0xZVitlSlAwNzlp?=
 =?utf-8?B?K0ExOXYxYVFxa3lkVWJQNkI3bk9BUFRPdDh4aWhWa0ZMdldONi82bU9qZlln?=
 =?utf-8?B?dGtkVUNFbzJ6ZWRjQktPNkxPZlR2RjRxdWw4YXY1dzNmd1RhSFRSb083VElJ?=
 =?utf-8?B?Mi9zTUpGZGpaZXFNc0VMbmw0V0tqWnRCdXBJTnp1WU9tdTFNamVXNGNDK25K?=
 =?utf-8?B?RFhuUkUzc3NxblYwbDluYk9MSTdIaEJqaWZzZkhyOVk1SEZVOUpURDB4citS?=
 =?utf-8?B?d2ZkemhFUFAxR0xlVllZVDZ1UURoM2hZTGx3SjVmQjBpWnVEbFVOMXRSRE5q?=
 =?utf-8?B?Zkc2UGl4MVMvMlZRWEV1VmVXd1ZQbmUvYy91cVRDOUV2Nis4MjB4MFV5SDlV?=
 =?utf-8?B?c0VQNktyMVJYQitmSG50bit3bzBieTU1WVl3M29WV1RSM2xvbWwyRU5WRjBk?=
 =?utf-8?B?OVlTdU5uak5JUnl0K2xkVHYxN3Q2SisxQWNvenU3ZWxPMVpIMW9idDVOQjlI?=
 =?utf-8?B?QXhhejlLNEE2K3F0aVYwcGNORnRYMUx2SDFoUUJDemxPMFRqd0EyV0J0c1do?=
 =?utf-8?Q?su20JB7H+zqRsoSI=3D?=
X-Exchange-RoutingPolicyChecked: lq+5ZL0MDFoD+DJRpX1RgE/7/Afxu9wm+u0VzNvG+NPNRtLHKb9UD8AhebQ77W93nafnetAMFoNM0OMdqVuDimOdkVaIr/DxY44jVcsJA0DUTnpH/+YBObK8OnYOGfRzV5uLV0w7JjTRl5xPUxdYIneTSyOcCp2JZFpO2sXI5J6VNt5P/31/R9Z3po73AKU9/nRPtl5Evjvk+0MTxSOfCosBpg0jKvWHWMFFasMChSKlYEoqmPUt38HX5d8sQZ1ZcdAttqYMa9s2pNw+HaMSQX62HDZym3myuN1J8Bml1VyZd0eWXlw/7kJQsxEXWBI96K5YAp1a8dhKkPnSAJ636w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 38a23f85-8bd4-48cb-55c4-08dec3326631
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 18:43:56.4712
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X1+O8iOUPyG8AlG4CT2Ha/BIKT0d/KzdcrAy9D2tOsaT4XPdcPBzFAl7FEo/SI7Li5vE/5VK17BR0AUuoFhIdXbNt/vDXWSQUMRFgqAH78I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB7981
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_114406_708400_C2E200E1 
X-CRM114-Status: GOOD (  20.75  )
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
> From: Dave Martin <Dave.Martin@arm.com>
> 
> The control value parser for the MB resource currently coerces the
> memory bandwidth percentage value from userspace to be an exact
> multiple of the rdt_resource::resctrl_membw::bw_gran parameter.
> 
> On MPAM systems, this results in somewhat worse-than-worst-case
> rounding, since the bandwidth granularity advertised to resctrl by the
> MPAM driver is in general only an approximation to the actual hardware
> granularity on these systems, and the hardware bandwidth allocation
> control value is not natively a percentage -- necessitating a further
> conversion in the resctrl_arch_update_domains() path, regardless of the
> conversion done at parse time.
> 
> For MPAM and x86 use their custom pre-prepared parse-time conversion,
> resctrl_arch_preconvert_bw(). This will avoid accumulated error
> from rounding the value twice on MPAM systems. For x86 systems there
> is no functional change.
> 
> Clarify the documentation, but avoid overly exact promises.
> 
> Clamping to bw_min and bw_max still feels generic: leave it in the core
> code, for now.

Same comment as v2: please use max line length available. Some more context here:
When resctrl patches are formatted as above the x86 maintainers end up reformatting
them if they can afford to spend the time doing so. Having changelog formatted
correctly from beginning avoids this extra churn.
You can find related comment from Boris at 
https://lore.kernel.org/lkml/20250916105447.GCaMlB976WLxHHeNMD@fat_crate.local/

...

> diff --git a/fs/resctrl/ctrlmondata.c b/fs/resctrl/ctrlmondata.c
> index 9a7dfc48cb2e..934e12f5d145 100644
> --- a/fs/resctrl/ctrlmondata.c
> +++ b/fs/resctrl/ctrlmondata.c
> @@ -37,8 +37,8 @@ typedef int (ctrlval_parser_t)(struct rdt_parse_data *data,
>  /*
>   * Check whether MBA bandwidth percentage value is correct. The value is
>   * checked against the minimum and max bandwidth values specified by the
> - * hardware. The allocated bandwidth percentage is rounded to the next
> - * control step available on the hardware.
> + * hardware. The allocated bandwidth percentage is converted as
> + * appropriate for consumption by the specific hardware driver.

Same comment as v2: Adjusting right margin mid-paragraph looks awkward.

>   */
>  static bool bw_validate(char *buf, u32 *data, struct rdt_resource *r)
>  {
> @@ -71,7 +71,7 @@ static bool bw_validate(char *buf, u32 *data, struct rdt_resource *r)
>  		return false;
>  	}
>  
> -	*data = roundup(bw, (unsigned long)r->membw.bw_gran);
> +	*data = resctrl_arch_preconvert_bw(bw, r);
>  	return true;
>  }
>  

With line lengths adjusted (and rebased on patch #1 proposed changes):
| Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>

Reinette


