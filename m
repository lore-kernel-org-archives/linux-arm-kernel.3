Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A4CDC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 17:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:References:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nMW3wCS9nZe5k3SwnVVJOklWs6b9dvODX9j/FCLtiWU=; b=fE8gOpXgRwvncbeEp9uvlf5YCR
	Gen3g3LX2qVucuFQBZSbblg66DN69hlngKrxxAl4GZ3pYOTOAX12clAjX9q6dJcvclyna0zptEk53
	PaUn/At22+AHL2dj/fjKpI0bV2KRk5sW9dMamAPobJnVsbz3AcX4kNx7/U6dDxPVjM7MVBvtnORi2
	Mz5KPJZu3mzDwml7PztTkbT+icYn5R7RVgQ/kuGRMCWJtesKwNzOomqgDEAQT9LT4qgF5aMof/R4D
	Gz2wG2KlSwGjXLAXCacqDJr+CeTJGyVii4p/debZVGleADP3bJmFRuCTApKPtKO5IxxHU0piuxkf/
	bAHgfJ0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tidBx-0000000C2xL-2VWw;
	Thu, 13 Feb 2025 17:40:01 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tibxT-0000000BjxP-1dGT;
	Thu, 13 Feb 2025 16:21:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739463659; x=1770999659;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=yQ6bH4WBUkeP9KwdGNl7Bqn+HK4/BZNDxj45KYhFOyM=;
  b=iD4GrhY5yZ8ZF1rI1cq84HWbVrIRlfdaYBNV8kamUXfjTh+f5VTAMP9E
   av5inrVjckPaCDv1wXEhP3OLAhe12hLpU2MD83kSJdwuEAexdoJOdHkM7
   ySRYJRP37C2i4NMxrR+/HRqiwszkG2tG+e3tzi7N7oeCxVvwwWsJklu6g
   EqanEPCnFIDX57NV8AMIiUFzL7KM2LIp8omtnsgxkbYeRKEWuKhxjGAk9
   K0AEpSDn/NXGq/+xKV1ctq1iIDiJwvL5V769o/44El5zVR3eXJ4pFmUjX
   u24CHdQZoUMBbr9t5vTxFb9qyb3kPgyz/KaLmdoNu79HN0Fsv7RwwrnpO
   w==;
X-CSE-ConnectionGUID: 2uW1QT3OTz2LcbLrSWq65A==
X-CSE-MsgGUID: yB+30/1BTX6ByZYTr6YYRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="51604436"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="51604436"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 08:20:57 -0800
X-CSE-ConnectionGUID: hAeHJFrxQnuWnc53LNOEkA==
X-CSE-MsgGUID: tr1BDeLXQYSjsl5dy3aFtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="113678855"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 13 Feb 2025 08:20:57 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 13 Feb 2025 08:20:56 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 13 Feb 2025 08:20:56 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 13 Feb 2025 08:20:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RPcOK60QiL7TaPRmbU/JhrOCmIq4OgF+FCk6Xy0dNAvjRn8/eVnCWcJ3eejYDk1kn/vyek5cgFjK/jT5LdWJBs+VD9ahHjn3tzWBJfJoqhXoWQSIqPMYJ1Pw0JqcH/d6/0inMUWjjbEQGSq4VtFNgGhxFxUT7N2d7vVpHkkYdbEc1pbcyTdC+tFdKL7f5bdwjDKD9TJgM7NlmBy42tnE7h1ei9xn0w/hlm0f9KK3uBY4H4a/kkzWgRU+u64JnfBrw11nevPgfpMYH5n4upwlRvIHgc3dOn03KFq1JUVWkuQuKdaId9KLRq8om2i1d45GoMZnNq8AzbvlP0/BPIj1Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nMW3wCS9nZe5k3SwnVVJOklWs6b9dvODX9j/FCLtiWU=;
 b=qC8MUyKM87MY10P1dUcraaFVbcPy/X+ZS+OyMWFbjIldAMnrFIl9aBBsURuI7AUNsGDbqldL7WivI+V5WdhmqjlniJ4m5IkxHoXPprlf2wg0Dc29lISzsnaz4SAIv1Vw909lgb/T77+SocbaMxBUH5Lx/XRMvqiwDQp20+5vYem07KILUbuxlYL2l1Jg/7/YnhtOp50zeQhRpcI9MYa80cSOb6DbMBy6ILs8JI47qRhdNotbS3Qk0DS5mUxYTwL75DtNeV0ROtpS5hsotw+R87nPKnkJwEBrSYR43iCRzLAnaRwpcNuLu6KrAEVXJS9euHuzylZuhbBojcg99teqKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6231.namprd11.prod.outlook.com (2603:10b6:208:3c4::15)
 by DM4PR11MB5279.namprd11.prod.outlook.com (2603:10b6:5:38a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Thu, 13 Feb
 2025 16:20:51 +0000
Received: from MN0PR11MB6231.namprd11.prod.outlook.com
 ([fe80::a137:ffd0:97a3:1db4]) by MN0PR11MB6231.namprd11.prod.outlook.com
 ([fe80::a137:ffd0:97a3:1db4%4]) with mapi id 15.20.8445.015; Thu, 13 Feb 2025
 16:20:51 +0000
Date: Thu, 13 Feb 2025 17:20:22 +0100
From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
To: Andrey Konovalov <andreyknvl@gmail.com>
CC: Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, <linux-riscv@lists.infradead.org>, Andrey Ryabinin
	<ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, "Dmitry
 Vyukov" <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>,
	<kasan-dev@googlegroups.com>, <llvm@lists.linux.dev>, Catalin Marinas
	<catalin.marinas@arm.com>, <linux-kernel@vger.kernel.org>,
	<linux-mm@kvack.org>, Alexandre Ghiti <alexghiti@rivosinc.com>, Will Deacon
	<will@kernel.org>, Evgenii Stepanov <eugenis@google.com>, Andrew Morton
	<akpm@linux-foundation.org>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 1/9] kasan: sw_tags: Use arithmetic shift for shadow
 computation
Message-ID: <sjownmnyf4ygi5rtbedan6oauzvyk2d7xcummo5rykiryrpcrt@kasomz5imkkm>
References: <20241022015913.3524425-1-samuel.holland@sifive.com>
 <20241022015913.3524425-2-samuel.holland@sifive.com>
 <CA+fCnZeBEe3VWm=VfYvG-f4eh2jAFP-p4Xn4SLEeFCGTudVuEw@mail.gmail.com>
 <e7t5yzfw3dq5stp5xjy5yclcx6ikne4vwz7d6w2ukfw2b7gr6t@oomoynf3b2jl>
 <zjuvfdbl7q76ahdxk3lrgaznk7vjj43f5ftzfgrnca6dqtcd5x@5qj24womzgyq>
 <CA+fCnZfySpeRy0FCFidLdUUeqp97eBdjAqQyYPpz1WxYwcsW9A@mail.gmail.com>
 <aqhm7lc57srsfuff3bceb3dcmsdyxksb7t6bgwbqi54ppevpoh@apolj3nteaz6>
 <CA+fCnZdjTkreTcoo+J8wMhwDuAFM4g33U5BFy0OPtE0UCvyJbQ@mail.gmail.com>
 <CA+fCnZcoVdfXVN8VBFLx835cV0eGAT6Ewror2whLW761JnHjNQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+fCnZcoVdfXVN8VBFLx835cV0eGAT6Ewror2whLW761JnHjNQ@mail.gmail.com>
X-ClientProxiedBy: DB9PR06CA0002.eurprd06.prod.outlook.com
 (2603:10a6:10:1db::7) To MN0PR11MB6231.namprd11.prod.outlook.com
 (2603:10b6:208:3c4::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6231:EE_|DM4PR11MB5279:EE_
X-MS-Office365-Filtering-Correlation-Id: 924283cd-e1ee-49b7-deed-08dd4c4a6233
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VEdGQzRoNEt3M0NhL1J3TFNWdTFVM0d0aGxwOXNoNVJzV1BJL1AwUWwwRzVS?=
 =?utf-8?B?bUk3R0FNaG9ZWGJpYmN0V3JPNldDT0lOOEpqZ2twSisyTHpZUkcrc1NxdFpT?=
 =?utf-8?B?Uk9La0JHb21UMFkyK3YrVkNEUzVrSk1hZlBtQSswUWxXZy9yNERhdWdBRzVI?=
 =?utf-8?B?ZGxSTHJPSmxnOGFyQlJ1L2JhdEdUY1AyM1UwZHM3L1NTdm9PL1RYR0VMYmdj?=
 =?utf-8?B?clhIR1RrV3kyZEExQ0s1SytmMlFDaWdQbXN5UGVGTHlMZm15SlRVM051K3lq?=
 =?utf-8?B?YWQwOTF1aTdudnBiZjJUd2lNUXRNTVRaTVAyTVV6cEhjVXkxZDlRVnVJb3BD?=
 =?utf-8?B?c0w5eUFYQkRhaDZhbTU1bG4zcDViNHBycDdQT1lncEZjSnNUOGNMYjU2cWpE?=
 =?utf-8?B?amRacDhuLytIUGpNQjEwN1d4Vkxmb2FhWlc2a1JNRzEzWlBuSzV4Y2F4ZU1i?=
 =?utf-8?B?R3A0dHR5eEhIRWUxSEhxclJoNzhCb2o4ZzZIMU56VG0zR3BCQ1dyRTJMZ0pS?=
 =?utf-8?B?R0NzN2hxc3ZuK0ZuQkMvcXZCQUpnZlFBZ3NFZHoxQVpGbkFrYzR1YVI1VWdi?=
 =?utf-8?B?Ym5ibjk1NG5UbWRTSG9kalltYUFtekQxVmQvU1NYT0FsNFpNa3lpYnB4bGFH?=
 =?utf-8?B?VmNlVHpPSHJuWXh5LzhndmFocjhuU0hSQ2c4cndGUFNCZTcyVmJzWmJMeWNq?=
 =?utf-8?B?VDdLTStuSzBHclhhR2k0OFQ4RGVJeHpvL2JtcnIyYlpsSEhsVDQ2TjdhUHlp?=
 =?utf-8?B?K2JDNVlYeG11V2t2U2pqWTZNT2lsR2FYUlBOT3hhOFQ1Z3Rwc3FTcTlUTUVX?=
 =?utf-8?B?R3dCWEV4c1UwZVZ6TzZyUk5XYlFkUitjOXhQd0x2L2dYTXRqMi9obENTUlE2?=
 =?utf-8?B?VDE2QjdRK29iandOMkpYU0crMEI3bjNicThWbDE2VzlLaVZHdnFHZGN3Slhr?=
 =?utf-8?B?SURpdWkwd3JwTUIwU005eDRPZDhyNXYyTHdvR1ZjenAzRFRDdXpDQndjV0p0?=
 =?utf-8?B?TVl3cmVKSUF3aTJ5a3V4cWJtRiswUWhZUXRCSndTQUdBaGk2dWNSSUJNU3Vk?=
 =?utf-8?B?dldxNW1xUnFxbnNwTGlMY2srSnFCZmpmS3owSXdmeXpORHJtWFBzT082YTlJ?=
 =?utf-8?B?aHFSWi9qeGs4aTdNOGZGSXVwMWRidEVOMWQvbUQ4TmhRQ3dDbGszMEFSYjh1?=
 =?utf-8?B?T2xaZUhTakZZM2ZkMy8zNDZ6T25mYVM1eEp2OTJHTnpISEtkbUg4WUcwTUhH?=
 =?utf-8?B?NGJkc3JDUWVwa3VHSEVhUFdLZWVzVFl5Y3RFTlQzWG1FbVFMOWxGUlBFQ2Zt?=
 =?utf-8?B?R25mK0RGYmNvMjJ4V3VCZmg1VVF2ZVQ4RlFiUWFVUmt2Tmg0RTRxL3M3K1ZN?=
 =?utf-8?B?SGtDcERDcGp3VkM5VnRKUnFSZUxTOE4zUG9zM0tQbDBXUnhoSENKT0J0cFpz?=
 =?utf-8?B?NUdTb2R1VUlXY0NaNzk3MTdHRG9uUy9rR1Uxcmc5NUpwSEY2MFVjSEU1U09l?=
 =?utf-8?B?TEdzdUJEbTgvNWtCTEkzZE9UNGNlM0dncGlxeCtVRlF3Sk1oZS9yMjV0K0hL?=
 =?utf-8?B?TitLYUYvYVVzb0tEaDE2NE85QThtZTdydzVsZ3Fnenl4ODZVcHgzbmxmUlJW?=
 =?utf-8?B?Ukg4ODY2dTZRdmdZbVBuK0lwSzR3Q3pRaHl4VVM5WDdtNjk2RzBiVi9Sam9V?=
 =?utf-8?B?MTk5dFE2cnM0RmRVcXB2aWZ4S1ZKRVczUGR3S1pBOHJwNU0veWtHK2dBOHFo?=
 =?utf-8?B?ckIzZ3kzUTNmem1JQmhRUGdQN3ExMlgrZC95ZkhIOUc3aEZIRHhseS9kVlB1?=
 =?utf-8?B?ZlVKSlFDWUN6NkNaM1BEdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB6231.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cisvL2xta2NMMnJ5OVdrbGV5VmVCTEx5VXlTNDYwWGNyK3M5ZHpkTy9acWJt?=
 =?utf-8?B?NWZKTllsRTk1OGhQL1ZXb3F0NkFPR0c4SUJ3OU9HNzJsV01GQ2FnMkZHVFNB?=
 =?utf-8?B?cnl4NUdhdXlGRDRhTHRnc3pnbTNCK1U5L1BibUxBWjdvak5EK2pzbzAyeVZU?=
 =?utf-8?B?VDlsOVo1OUs5d1B4U2lsL1RQeS9mQ3VweldhK0QrdWE3QkVnTzh2TWJZcWpn?=
 =?utf-8?B?ZGtsUks0YmZXVjdhWUlVNENpOGJYVWVJa0toSFYva0FzNFNTMDgwa1JYekw2?=
 =?utf-8?B?KzhvU3Q2L1pleXFjOHJBY3kwQTQ5bk9PT0VyZFF3V2lRWWdVTHBtSnBKYkxw?=
 =?utf-8?B?Y0NvbVZPNDNWTWRwSjJxZ3NlSXd0L2E4QTZtUHJ0ci85cG0ydTVYREt5UnBN?=
 =?utf-8?B?L3laNElHdEYxdGN3S2QyQzhHTWVpZ28xN0JtSGplaCtTbDJ2anNOQ2owejBS?=
 =?utf-8?B?QlB4SFdkcTg0YWx4dG5IVFN1YWV6ZHFPbzl6OUo2bWhkSEYvUkhEZGl6dS9H?=
 =?utf-8?B?SHhmWWUyL1c4c09qZTBta1o1bHBWQTBsNWFxMDFidmlSdExpOG5mMjRRbWNY?=
 =?utf-8?B?NmRLQy9mL204cVI3L1V3c3ViQUJUQ1hnWUZ1NnM0cGN3c0l4Y1doRnNPWW50?=
 =?utf-8?B?cHg3ZTMvdWFmRWY3OXBWUDRsSXlrSWEyZHFzbVNkS0lac1ZUMGtEL2RXV2cr?=
 =?utf-8?B?c1hDU3lHSXBDcjJ6K0psMW9GODJYczJIMVFvOVBIb25XSkJlMS82WDJTL2J0?=
 =?utf-8?B?UGtSSFRPQzlvOERsY1l6WmpGZHZoUVdMMGRHNHoxclBBMHgxOWw4Y3U0d2Zi?=
 =?utf-8?B?TGpwcVVxNEZIKzE2TlJJZXcwSXBFNTU2YXhIRE1URDdwc3d5REJQQ3VnUHY4?=
 =?utf-8?B?aFduSVgvamVRYkptRzE2aU9tN0ZaUkk2bWRvd2ZiYmtjY0kwSXVFMWtZeE9y?=
 =?utf-8?B?RzRoYVBNVWlDcGdWdy83NElzbEVGOEdiajJCdmQzV1BKUXZxZmlDMmRpUUJm?=
 =?utf-8?B?bUM4UkJsd240TkZNbEtLNFNSU2N4UnhlNGUrTG1TaXd5S2piTlZEWTN5NEtw?=
 =?utf-8?B?SHhGM1V2TThhZ2FHMDJyVG56RUhaWmVkeUs2WkZiSGxnUkJ2Ri8zYkp4SUl6?=
 =?utf-8?B?dnRscDlhVk9Ba1pNYUlBM1FBMWV1WWRXK0Vta1p5QkRWZ3BPRVJiOG5pZ2Zq?=
 =?utf-8?B?QnlGVXNwUG11aXN5ZUNuWHFNSzFqL2U1em5JeUFqVWJaYVJDSlhYRS84dEMx?=
 =?utf-8?B?WjcrSUs4aS81MVBvVE5oQ0NzN0VlcXZ5Ly9ST1l2Rkd3MmRwbk9Za0hKcGlU?=
 =?utf-8?B?TTcyYzlyVnlBSithRWFtY29lUGMrVU9KVFZUMnF2Y0l6U0t1TjJxbkViSVFa?=
 =?utf-8?B?aGcraDlnZm5DSWhoUHpseUpMV2RrUVZ2Ymc1bFVsQzVnMmNBT0ZjL1BKT082?=
 =?utf-8?B?Y0lKREc5Y0hSOGR1Z0lsTENjUSt4ZUlSRnAxNHhJTkZEaThoTG1uVGRsT2cr?=
 =?utf-8?B?Ni9qdndBL3RRcC9QdGVTRWQ0OXR2MHg2YW5DN3ZUbERnUFo3MzlZbVdONm42?=
 =?utf-8?B?aytTcUdCZkNWUmxGK2ZOdWRvcG5CUGZhUUJlTGZkeDlsWXVXaXZiQWZkWjJa?=
 =?utf-8?B?REZ5VzduOVhMWEpJVUF0Z3llVll4WndFY2h0amI3aFdzRUw0dmt3Nm5nMDQ4?=
 =?utf-8?B?THFjOVNmSk53aW5SN0EweDgvNkZaQUJoQXE5c2k2RENKT3ZvOWlOcGptZUJP?=
 =?utf-8?B?T2NlRWo5OHZicFFpaHhHRGV4WWovQ3hMQ1ZOMDlmY0JoUERaUE9NQ0N0RUd4?=
 =?utf-8?B?SkNGM3ljWkcxTmY3d3ZJYTY3Y0grRGVOd0xFU1RtQUZXQ3ROSUUwL0pCSkFx?=
 =?utf-8?B?YUFFeFV0cHFBdXVaZHR5ZXJ5cEFzQXBoTTh6YStMeDdITDJ0Qk1oVjR0ZFI4?=
 =?utf-8?B?Qm9sRGJuTEYvc202a2ZWcHJOdE1Kcm9TaVFwQ0ErN2NWTUM1NUk2ajcvTWll?=
 =?utf-8?B?cEVxMElZL3BhemtuSnlSUzdWc1JwVFZVcDA4NlAyWXJVOEt6UTB5eFl1MUtG?=
 =?utf-8?B?SGJXVTlJazhyU1FNeUd5WjE0QlU3MWRwNS9hWFVGcStDbWxVQWQvd1pZUDEr?=
 =?utf-8?B?ODVmb1oxNjBLc05BangxWi9EUmRQQ0wrQmtJcC9RcVl0bUNtdjM2Nkl5NXZR?=
 =?utf-8?Q?cE3GKtcmwfjo0OEqHkbJhf0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 924283cd-e1ee-49b7-deed-08dd4c4a6233
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6231.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2025 16:20:51.7032
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b1wKfKhKhwxQUseYhuZSSh7Lq6GP0HdYOUwd8Pqv5iq10sp2OaUI7/3Hq2PvPjeiMD8s304LrQne2zYcaI7dxOH/EbjfHE7kjzPYNmd1sjY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5279
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_082059_457836_5789B78D 
X-CRM114-Status: GOOD (  25.53  )
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

On 2025-02-13 at 02:28:08 +0100, Andrey Konovalov wrote:
>On Thu, Feb 13, 2025 at 2:21 AM Andrey Konovalov <andreyknvl@gmail.com> wrote:
>>
>> On Tue, Feb 11, 2025 at 7:07 PM Maciej Wieczor-Retman
>> <maciej.wieczor-retman@intel.com> wrote:
>> >
>> > I did some experiments with multiple addresses passed through
>> > kasan_mem_to_shadow(). And it seems like we can get almost any address out when
>> > we consider any random bogus pointers.
>> >
>> > I used the KASAN_SHADOW_OFFSET from your example above. Userspace addresses seem
>> > to map to the range [KASAN_SHADOW_OFFSET - 0xffff8fffffffffff]. Then going
>> > through non-canonical addresses until 0x0007ffffffffffff we reach the end of
>> > kernel LA and we loop around. Then the addresses seem to go from 0 until we
>> > again start reaching the kernel space and then it maps into the proper shadow
>> > memory.
>> >
>> > It gave me the same results when using the previous version of
>> > kasan_mem_to_shadow() so I'm wondering whether I'm doing this experiment
>> > incorrectly or if there aren't any addresses we can rule out here?
>>
>> By the definition of the shadow mapping, if we apply that mapping to
>> the whole 64-bit address space, the result will only contain 1/8th
>> (1/16th for SW/HW_TAGS) of that space.
>>
>> For example, with the current upstream value of KASAN_SHADOW_OFFSET on
>> x86 and arm64, the value of the top 3 bits (4 for SW/HW_TAGS) of any
>> shadow address are always the same: KASAN_SHADOW_OFFSET's value is
>> such that the shadow address calculation never overflows. Addresses
>> that have a different value for those top 3 bits are the once we can
>> rule out.
>
>Eh, scratch that, the 3rd bit from the top changes, as
>KASAN_SHADOW_OFFSET is not a that-well-aligned value, the overall size
>of the mapping holds.
>
>> The KASAN_SHADOW_OFFSET value from my example does rely on the
>> overflow (arguably, this makes things more confusing [1]). But still,
>> the possible values of shadow addresses should only cover 1/16th of
>> the address space.
>>
>> So whether the address belongs to that 1/8th (1/16th) of the address
>> space is what we want to check in kasan_non_canonical_hook().
>>

Right, I somehow forgot that obviously the whole LA has to map to 1/16th of the
address space and it shold stay contiguous.

After rethinking how the mapping worked before and will work after making stuff
signed I thought this patch could make use of the overflow?

From what I noticed, all the Kconfig values for KASAN_SHADOW_OFFSET should make
it so there will be overflow when inputing more and more positive addresses.

So maybe we should first find what the most negative and most positive (signed)
addresses map to in shadow memory address space. And then when looking for
invalid values that aren't the product of kasan_mem_to_shadow() we should check

	if (addr > kasan_mem_to_shadow(biggest_positive_address) &&
	    addr < kasan_mem_to_shadow(smallest_negative_address))
		return;

Is this correct?

I think this works with TBI because valid kernel addresses depending on the top
bit value will go both up and down from the KASAN_SHADOW_OFFSET. And the same
will work for x86 where the (negative) kernel addresses are mapped down of
KASAN_SHADOW_OFFSET and positive user addresses are mapped above and also
overflow (in tag-based mode).

>> The current upstream version of kasan_non_canonical_hook() actually
>> does a simplified check by only checking for the lower bound (e.g. for
>> x86, there's also an upper bound: KASAN_SHADOW_OFFSET +
>> (0xffffffffffffffff >> 3) == 0xfffffbffffffffff), so we could improve
>> it.

Right, Samuel's check for generic KASAN seems to cover that case.

>>
>> [1] https://bugzilla.kernel.org/show_bug.cgi?id=218043
>
>_______________________________________________
>linux-riscv mailing list
>linux-riscv@lists.infradead.org
>http://lists.infradead.org/mailman/listinfo/linux-riscv

-- 
Kind regards
Maciej Wieczór-Retman

