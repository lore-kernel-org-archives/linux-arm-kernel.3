Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ABA3CD6E44
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 13:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gd1DHxxfGusL+vMhQNbMsasLYwmdeR0Mm6edwsg+rDQ=; b=wMKpKzWdnk2b8iGl8y4VRKATKX
	FaX4M8op2/Iz/nJ5TI5xFrm+D+VOzBnvNCuYEhOvTOjj8d5a+LCALmuOYw/qLIV+fduLLgeIxm23z
	MJonWH4S1Wta8bY9Pyi4ZZYgSpNZYGtWQFT1SOh7fZLAvxhdLKeXE6S52656WCZo/5ytJuqK8GmaR
	IUo3VVyLM84I5ZoXR+NBRmAgpN3UpFm2JZPXnEduZYXrYhcj/X2FEnHBqzS23zelleoGyK5hZi5WU
	vQVT0pXzjiGdLI97WMVMeWlnymCtJk4bSF4PU9tB/Do/ToZ0WtxpbdRMOQ3BxKCZjx+fooYRKOvXr
	UYJLqWUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSb0O-00000005nbL-0ksE;
	Thu, 28 May 2026 13:42:36 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSb0L-00000005nai-3v23;
	Thu, 28 May 2026 13:42:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779975754; x=1811511754;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=fsH2tVcVISWYC17P2a4z1DQ/1dQVU+cruUm0NciGbrA=;
  b=P+EcTAhFq6ZMTExC9WmOF/OswuHATA6Ho9B/Co1nW+4ZUPaUlFDF6R9D
   RuhL+qO+EzqtZ5jcsqPemUIVybCcczYstBZwKxAobrmmQiEB7FhE30TOS
   FWR7jWSIgNf/EBR4V21WPhq66qtNi4nTNdKQ4z8Nup9N0IZoihbmHxurR
   3VxeMtcqsjR1nt+JMHFaBuq8e6MqMxsK7Fh9a+VMTDI2WUC8rNQkTQPPG
   fZhRWGHTGhaFXbDimAZuMwTbDn3RnM/+hETs+hyE15WGpyH60KUd35eXr
   8nTAfwihFauR+jTGaaVhdS6/MvOHGrEFmwej8T9wRBGPFaq08kepbfHj/
   g==;
X-CSE-ConnectionGUID: 8m2hHWLdQqiO0KfOSzV44A==
X-CSE-MsgGUID: CbRz0PinR1CmdiQOWNP5OQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="80809388"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="80809388"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 06:42:33 -0700
X-CSE-ConnectionGUID: gOy+CWT1RACUdJJzdnBJMQ==
X-CSE-MsgGUID: Uo9Vw152T4yaMsfmP2Z3Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="244377481"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 06:42:32 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 28 May 2026 06:42:32 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 28 May 2026 06:42:32 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.22) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 28 May 2026 06:42:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FsJRO038vk06q3EMytk7BbFI5K8A+3zWEByK+ee/MPZTwoBLFdhAraDH7ZC1nyCJTTpoSGelCv0upEf6YqwSuS4AYUkbO5Iz+2FnBXAxHDX4D0QVC6Y+2Lrt3T1MDqgNVfSy2JfIzAOvRsGBkMl9K6jEHu8j4i1PUaYtmG2jpLAyhCbnlUBGnKZJjz/0y+40g84GEV7fkwgQg/tPpyX/yYe24lMGSQjxBLdUrAhGxZ4zR0GzhNicH4bPIRNdoWnAw7VPhloQlZPAE18keqrisQEtNo79dw1Ve9qV7dIPVZ8T69oO/QmgHG7kZAsfOjHJzaNfSEURkKwvd+8Nj0cGUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gd1DHxxfGusL+vMhQNbMsasLYwmdeR0Mm6edwsg+rDQ=;
 b=UUYtz7vaDWAWpqDjFXkMn8wDcp0+GB6YW9jzvO+YZ3PjeMQe8/i4r4tw+SiVYz3pbTgD4k8gT/Ce8vtm199GEpMAmeMEZ2pooD0M926AHd3loiJlHHJ5s16qCc4Futae3dOGmwVqTpsSKIiALosLFxGgXu8kVotlFON7YAQUSg2P1ctgUtJrTm5u/03FJfVnFlhRK54EYXsdUIGcEr1/eH2oD5OHrUMMEzgci1w232NfYCP7unALPaMPjpqC6c3i17WzEjnxTUl81xqTM4LN7gWsgDD8WRAKKdlNIVJVfLPwPUmwOjxPRVu1ke6hIvf0KTr60YQD7ibpDKtJhmj+7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by DSSPR11MB9666.namprd11.prod.outlook.com (2603:10b6:8:377::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.14; Thu, 28 May
 2026 13:42:24 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c%5]) with mapi id 15.21.0071.011; Thu, 28 May 2026
 13:42:23 +0000
Message-ID: <433b9d9a-bd7c-44ad-b387-a789b326488e@intel.com>
Date: Thu, 28 May 2026 15:42:18 +0200
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
Content-Language: en-US
From: Alexander Lobakin <aleksander.lobakin@intel.com>
In-Reply-To: <20260527-airoha-eth-multi-serdes-preliminary-v1-1-ec6ed73ef7fc@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DUZPR01CA0090.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::8) To DS0PR11MB8718.namprd11.prod.outlook.com
 (2603:10b6:8:1b9::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8718:EE_|DSSPR11MB9666:EE_
X-MS-Office365-Filtering-Correlation-Id: 948e62f1-ea66-490b-c10d-08debcbef297
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|56012099006|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: QKEtRq1BBoypbA1LvI+xgdHgD552KP2nD51ywDgLiJCnLMWO/Kdqc33ZB23EVcXqUtZpZ+CRqxXHsdHZEDcjObjd18T9LzqDtF/d5OCj7JKeOZF4sE2iw5glpUU11mixV3D5NbId1GQBcIFQei9dNGI2Fl8brX/SOvYzo/XOdYPnG+UFKxzTVyiyD8UkW2D+j/W9StkLNDhSQCbNOZP1z96o/4glZ+/dF3hphM8O6zTcjDb4rX7DgkxeWQ4aa293gv2NH0akrMd6Cp6ooqkoKAu7kgagc5bt7AdftrMHr9WLvBKyopyF34z0SSKCXcp8x7Ul6oofwAvfBRt7tNavBG3QKu9vxeRiTrHG/c4XA+k61d+a1j/Kg5R4Rhal7bzE/DNVNdvOA/G7B/o47xLh+0kGSsJQMncovnhp6E4Sl6GCl2GUVXc/bw4p1B8qfDCidrfzJPpuVmyWbOhItdpqpo99DJ8evgX8wILD259pf4AoO9+3blDKAvcdsS4znugmMiB0+bPqV9d5EgA6htoCWVA8Tvy9GNlwz+/Z9qM4shHtVU4iugYyJOwbMqdppdO+GSISooImPZXaP82Lfwtwj/A3+9q22ehzDygXUE5dasoOY2inu0C5KG2Mb0XvLj7rNt3OepOnsa3BymzJynhq3lr378mekQTOPvxzLWSbOx14aY9z1eoSTTXOzJRtWoIn
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8718.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NUdwN3JOaFM2VDZTc3lOb1lkcVdyMXZuOHd4M1BVR1BuMGN3bGgrbUd1c3hB?=
 =?utf-8?B?bFFGVG5Rajc4MERNWGFON2tTcGV6SGJacldHNmdkaEJvb2ZtUS9FeG10eVZR?=
 =?utf-8?B?NEhVdzkrSmsxQ3RQb3FYbUtjUnFZNUlEa1JWRXFOeFQwRmtTeFN3M3J3ZVYz?=
 =?utf-8?B?VjBhVGl1K0ljdUJFWG1iR1QvdkZBQjhzVHIwQ2ZOaXRZTTdzdzgxeHk1RlBD?=
 =?utf-8?B?VEFWUUlOWXNwRFFiVERRaWtBcGxZSHB1cU1oTW12R056bEY2cGdYSHdDdkV2?=
 =?utf-8?B?aWVsbGhNMEZPVXhhK1R3bG15djVjazhlSEYwNTdBTmcvSlVoVXpTenZBMHJm?=
 =?utf-8?B?UU9QUEFxNnlyR1lnVk1HalFJL2tXcXlDWWl2RnlObklUbkU2eUlNSEdNcDhD?=
 =?utf-8?B?V1RZUUJTTDE2UGxodHBjVUxrbzg3cEFqZUIwYTBzNEtGVFRkdDhnOGczTy8w?=
 =?utf-8?B?ZkM5VmQ1bWtreUd0WGo5Vlg2TVBNNitTMHJDOUJmVGdrTWg2eVlvT3IyM2hR?=
 =?utf-8?B?M2VjRmwvUW1KRXNOUUxCemRnVk1mcHNGaXVIYkhtSlBmekZ3dE9MNkdiVCtp?=
 =?utf-8?B?RmhPd3ZYMndRUWZGOTBHd3lzT1JWaFIwcHlobDlrS1JjWTZpRi9mdHdiMi9I?=
 =?utf-8?B?Zlp1bXh0VjFQdXBWL1BrbGZwanFCUUFVVCtGUlhxQU1KUG8wRGFNZThMT0pE?=
 =?utf-8?B?ZXZLVFZLWUkwbVpnNXpLek5KajFKSkVZd3hqZmx5SU9RbmNwRTlGdGpVSkxM?=
 =?utf-8?B?NlJkcG1rd2wrU2I5UVRQS21PSlg3aHErNER2WTVBMUxQRlBLSU1kR3hpbXBE?=
 =?utf-8?B?V3lIUndKaXRtaE1sZnhPek5jelM2NUtzOCtXRi9OL01MRDJ3U0ZtZWNQYVBh?=
 =?utf-8?B?bTNZNFdqL0Urb0VuVFRGbDI4Y3Vwc25uLzNkMG1kaEM3NTMzZUwxNDhSYmxS?=
 =?utf-8?B?cnlwQ2swNHVQTE1oOFdSS3VjUGJzZ2RnYXozZFRlNmhiNGhJTi9WRmxVOXdK?=
 =?utf-8?B?dXRadXVDQ0FnakV2dy8wYTlLMk9VMnFGeDl3V29kajE2aUkyQkU1YU5vUmx1?=
 =?utf-8?B?YnBVS0l0WjM4U0g1Z3QwOWlpanBsYk5kTHhzbmFkVnFnWGNSZWZBc2xhZWJE?=
 =?utf-8?B?R3lNSGNDY0pGTkNvaGRvTzBnRzRLcjY2OUk4UFVpcTlqZDFVWHV2blZXZmdK?=
 =?utf-8?B?VHZUSVF6b3I0TXZQcWtKZjVRbDhDZFZuOVROK3BvcEdFcmFQY283T1d1eTNU?=
 =?utf-8?B?NXc4RlZpaUxhSUIrTFJ2SWpDbjhXVzZOOFg4ckE5ekdGNVVKaVpUQ2lydEhC?=
 =?utf-8?B?VUJDbUpsMmpqalp3Wi9ERVVRNVRwUnBOdk5DdG1ib2dPK3p0TVRianF6M2Zq?=
 =?utf-8?B?T20yWWZuaVVTcW5aQjZkQm9ncTVzL0l4eU84UTJmQy9OTXA4TmU1N29LV1M0?=
 =?utf-8?B?Y0NUY2UvcHZIQlVKUkVGa0dHYzRIbmEvb3VET1NTVFpwUWZXUnVvNm9tZWVz?=
 =?utf-8?B?ekZXcTA1RmZqQ1N5azhqTEFJcFRUblVmRjd1QThQTUk5a25MVkNzeFJnY2Z3?=
 =?utf-8?B?WXhrb1J1VlpMY0wwSEhRajdmZU5hRm0wOHIvcE02Y0ZHVGx3Nm1tWFovc09X?=
 =?utf-8?B?K3VKTGE5cU5sejdubTFBeHFNVmRXSFJ2a0xndndEOWFhNWV6WDJoODAwdXFI?=
 =?utf-8?B?Um1qY3lJZmczMy8rV1BnekZqN0V3MUwydmhGQTJqVmVUak9BMlBUdlE0V056?=
 =?utf-8?B?VENiMnFRd3ltR25xcjdHdkwrNW8wL0FJbXNEUGMyR2FUeGVZdWFqSVUxa1l6?=
 =?utf-8?B?ZWxkNUFYUEJLd0FUUi81RTBVZVNNYmRSM2k5QkxjVmhtSVFZT3h6SHJWcHFZ?=
 =?utf-8?B?dVFUcGN0bXZHZE1ERkxoZG9CWXhaendndUg1MnNGT2dXQnJia0dJQWZrT2Jt?=
 =?utf-8?B?SG1HRy9QbVMzK1RkZFRoZXVqb0x4RzFaR0Nvbktab0ROd2Z2ajBLUkNTZG9j?=
 =?utf-8?B?MUFLN2szS1Y3VHRTZjN5OXlocnpJdThBbFBFOEZkR3doUWQwZ2FJZVhlVHN4?=
 =?utf-8?B?ZVY3TFBTQ2FmMUM4Q0Jzd2NYM0E4bTlsYVVNSUxaaEh1L3gzMkVmQWUvS0Vu?=
 =?utf-8?B?aUIrY3hGeW9rVzkyMzlnY3RiKy9zTkgrdzlOS3RSbUhTc1JDUlptMXNwOGlx?=
 =?utf-8?B?S28vajFUb1RQaVNBcUV5WU1rb2VHZ3NJNEwvUE1QcDVWazhRMGJuNjhZdG8x?=
 =?utf-8?B?ZjhnY0t2RWtMVkcxU3Fpd1plbzhHZWpNRDFCbDZkSXhHMGxOdEltd0JTRllW?=
 =?utf-8?B?RWtmT1ZSTGJkWHhWcDU2NERSOTNyOXlhV2N5YTZXZmJoaXBxOVlQbGoybE55?=
 =?utf-8?Q?mDqZ+xSsTYK1oGoM=3D?=
X-Exchange-RoutingPolicyChecked: MzCRj5MVrv2UbGwCVpP1bnD7A1cSZL2HF+GGA1IGPEtZnVT5KUkdPfLJbtkLS3zUahfot9MnVRq7+WAsiY5C+l5HqpvNnR9BvhMNizqjEechbN4ATyL2aOIkso6XztQydQphA0yqDcEayFEzUt3KGaUuC9s4Her2iy4fguS0KzZyzfdLFGcEOlppVSU44IMgiPALbEiLmaKINz4pe5ZN2OItVi68Jno9jqHz0SGBuQibflIPThnOx+M0k235S4/StudFiu/BWD2Z4blLVk/n13mdtxIVrLN5eJZX6U4B4FX0eAaSyzm3UKm6kuzca2pwCbqbgXkdvZw/vJLzVw0WOQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 948e62f1-ea66-490b-c10d-08debcbef297
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 13:42:23.7287
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: efhUnCs8bsDT6SamyC0FP7MQ2M7FS+sS+lH6FinpZRnRtlicG4TqfJn/RPOxmlRFdRVlygDPwC/gn4ViABsM99fKF7SEpqgh9ypNy7NW47k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSSPR11MB9666
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_064234_052817_409CE721 
X-CRM114-Status: GOOD (  15.77  )
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
Date: Wed, 27 May 2026 12:21:15 +0200

> EN7581 and AN7583 SoCs support connecting multiple external SerDes to GDM3
> or GDM4 ports via a hw arbiter that manages the traffic in a TDM manner.
> As a result multiple net_devices can connect to the same GDM{3,4} port
> and there is a theoretical "1:n" relation between GDM port and
> net_devices.
> Introduce airoha_gdm_dev struct to collect net_device related info (e.g.
> net_device and external phy pointer). Please note this is just a
> preliminary patch and we are still supporting a single net_device for
> each GDM port. Subsequent patches will add support for multiple net_devices
> connected to the same GDM port.
> 
> Tested-by: Xuegang Lu <xuegang.lu@airoha.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

[...]

> diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
> index d3781103abb5..c78cabbec753 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.h
> +++ b/drivers/net/ethernet/airoha/airoha_eth.h
> @@ -535,10 +535,15 @@ struct airoha_qdma {
>  	struct airoha_queue q_rx[AIROHA_NUM_RX_RING];
>  };
>  
> +struct airoha_gdm_dev {
> +	struct airoha_gdm_port *port;
> +	struct net_device *dev;

Nit: we now have priv_to_netdev() (I hope I remember its name
correctly), so that we no longer need to store a netdev backpointer in
netdev_priv structures.
Just an option, up to you.

> +	struct airoha_eth *eth;
> +};
> +
>  struct airoha_gdm_port {
>  	struct airoha_qdma *qdma;
> -	struct airoha_eth *eth;
> -	struct net_device *dev;
> +	struct airoha_gdm_dev *dev;
>  	int id;
>  	int nbq;
>  
Thanks,
Olek

