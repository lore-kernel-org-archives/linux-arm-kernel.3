Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20E6BCD6E7B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 18:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5YSdjb8mLW2RtGsYkyCpT0fhrgp1Qsgwj3f/xvtkTmc=; b=oAlYoLiGxoORqvlisgj1aT+3Fc
	1dt12uN9+ZULIRZNjmUfh550l35csqzInwLE40hRAcubi+LmUX3WI7WKDgfGuukRu2jZ2Vv/fqaKf
	VWsLduK8Kki4Yga0YJEE7vQSEiSoGlPtsjkaVtrDHUcUXJzUTPyT84dVJsPDN8shwVVDe8tbbwtkP
	0kTUeCeAqIIlCbXK3PylgzWYNG0XkjPXl1Uxx6b+7WMmYFKmuP2E8rRJfKKhqAYeT+5tY++gfNlEc
	G4v+Uol1JXL59Ov46/c25YywTaO4BrPStAAp28OVUnwGokRpRdUSn9Jd6z/vw3OeWoBO1wEGKMNm+
	JFQFDWvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVZVv-0000000147m-0Elg;
	Fri, 05 Jun 2026 18:43:27 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVZVs-0000000147M-3KYs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 18:43:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780685005; x=1812221005;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=3B1fMcLE6iIK4Kc+52lxJ+lkzMFTqsq//XMK6iJOV+k=;
  b=dIgeTlgyWY7j3X/Gu1qOK6kEjDt0rCelwbIgsG+/JxqhZ2Ke+Dz8Jxdn
   Lo7QVStgySmc3uKM+4DaufI036JJxrZvRCcB3JCumW5gUJ4uImdcjnRMM
   DMG3R40JgS7kF6hOc8iJF57I7aOoKuUd8elPD/QWsA9+ASHBMAp1ezqpE
   Ksegfhw/iZjCB89RzPiknVtOAdn45LE/U9IN/Z0p7LyQc1Snlp0dTHzd6
   RLFdjLeXauawzwRu4Tm8+3mgD2zlbXlNuaUFqQ+aRS1M5lCe863w6b1cu
   /MLeTQo96OIbIccfMJgvcRMgxFp7+Rvd59i1aWzHYwKu5/bv33rcgPyRl
   Q==;
X-CSE-ConnectionGUID: BD3lm0/CRva7Fo4VIxX30w==
X-CSE-MsgGUID: Jv4tmgs+TmOJVmPbwBe10w==
X-IronPort-AV: E=McAfee;i="6800,10657,11808"; a="85145783"
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; 
   d="scan'208";a="85145783"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 11:43:24 -0700
X-CSE-ConnectionGUID: SDOOv8E9TyGLNl3eRBfweA==
X-CSE-MsgGUID: VkEdTIylS/2o22Bw8DbXyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; 
   d="scan'208";a="282999519"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 11:43:24 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 5 Jun 2026 11:43:23 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 5 Jun 2026 11:43:23 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.35) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 5 Jun 2026 11:43:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yeirbOd4yVjcJX7uEEpspHF5H5kFjI/4VDMv4Lbuq/PwIQB4ffdSeQMeBzPJwbXxGhpC3Xsr/MWd7RH2XEsAy2+loz5RieD8uYKeHrBefsVYvMIw/lC6rTEPAjF8YdA8LemCxA1hHmQF9BjnOxmdMnrJ9EUr4+FbygFnsHDGJzq21ZjyewP0Oa+hUEnL3tK0cLT7J6GIoC7wno/DCtcNRFI7jkUbjJRkvSqWDwJx3PoLbRnlRYlQrcV2l54QaDxoSpufEJoCL9o10jur8y7FucUfGBSopfKsxZZhpSmIXEA96PheZc67q3EvoeY1pi5dTIX1FEgRYF6SXjQBBrnWzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5YSdjb8mLW2RtGsYkyCpT0fhrgp1Qsgwj3f/xvtkTmc=;
 b=djJ/cA5QxCf77I2U6uhOJE1UFJpEAu1kKBye9Yh5vxgPECZKMSE3XkPATVoTRYpDmNvjTlLdkjY+1GQswnB2ncPlQZWT2Bb5tlWCjn7kfB/kPdlj9dY8yAhji+GLKn7TZqD7qOWQkZPj7fbuWjIwnXDKt4s8fRC5rjK7F1v7E4hbLK4ODlCTie9aqYkFTsc44Ies+rIE2Gl0+Iouj9XWINfgjYKQaEpSLkXbQTaqCjGSYmXcpIpw8FuKco72K1leVWR6a0XoOHti6Wj6h7Seg6iXvLGbvuOJPvmZ0dLY2qD4/bAV5BViqULCoM9AgJghQui0nbwyQ0y73gjFLhU6HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by BY1PR11MB7981.namprd11.prod.outlook.com (2603:10b6:a03:52f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.9; Fri, 5 Jun 2026
 18:43:21 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%4]) with mapi id 15.21.0092.006; Fri, 5 Jun 2026
 18:43:21 +0000
Message-ID: <03e7cff2-bbfb-4c26-aa2c-a70127683a24@intel.com>
Date: Fri, 5 Jun 2026 11:43:19 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] arm_mpam: resctrl: Add pass-through
 resctrl_arch_preconvert_bw()
To: Ben Horgan <ben.horgan@arm.com>
CC: <james.morse@arm.com>, <fenghuay@nvidia.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <corbet@lwn.net>,
	<x86@kernel.org>, <linux-doc@vger.kernel.org>, <dave.martin@arm.com>
References: <20260515140612.1205251-1-ben.horgan@arm.com>
 <20260515140612.1205251-3-ben.horgan@arm.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <20260515140612.1205251-3-ben.horgan@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0152.namprd04.prod.outlook.com
 (2603:10b6:303:85::7) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|BY1PR11MB7981:EE_
X-MS-Office365-Filtering-Correlation-Id: 1260062e-3278-4434-6d99-08dec3325185
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|22082099003|18002099003|4143699003|11063799006|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info: 0yDx13dvtTwtL7Tv6S4LjTjknNgpxGQooA4VicZwZJy6J5A+HZVSJqypHxh/+r/S9DLXSJVaIcD+xd+0LTWvs3YuVEkrzAOcfzwNUFfj4Pj2ZnloujwjYTptfKPky6LmQpoO6b1SHrcFV1sgrsc+S+VAbjnuY9Q/tsVG6Skg76Dx68umkii/J0+L+LucYWqYwHV3AwwoanVvKSNMYYWkzJpcM73S9qwTqUQOldbftJbpqxeVeiRPjVWd1AZQuf88qDbL+UbEtBvg2sqgbk22k60RZjmjKZfmS6PnYaqcT0bl2tyu9PfRRoj07vILjEtPwqzGzHsR6t60unNMmngxkzFDtItd+ORpTdl8Q0juWlaTUsLxukIvdLQ5lxwBtDi1r7O2Cdvw2/3lb48rwJ8u3BfQ3X8LR8XKg7xPzXZw5kWYHErQQz1DWE1jeC3uaPRawja8dvV22qW552sqaaY1mbaWWhN15/96HPbXbHPIRgos0oLLUUrh/VVcQXw5jFSWjDijhmhYHuVLuWixyXFa3I4zh1akjOT/WFTeLOKQRGExv/xnBLExZBeUOSW9okwBAoBS5eyXBbPp/UInsPVLpkD4h/EXBTqenbYJbrAEqz9Hvg3wn1hIxNzQgo8lcXKQAOy+8LHvX9mhjwfSIxnfflj1qUj+qDg+LN/YuFbNdqaUgnVybW+hNsgC22/6UJvo
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWFCZUNKbWwxM2QwVnV3dkY2S0RyeElDbFRPZE1uNWxwMDF0eDBPWWpvclh1?=
 =?utf-8?B?ZWJrQ3drTE56RlRZTCs0NVlVbGhuUTd6NVh1dGVuKzI1dDNvSUNHdy9obXRT?=
 =?utf-8?B?N0JVbTR0dm1CeE5PTksrbHJ4R3dUZE5GdmxJTlZBZ01SVXVMaUoyUE9HYkxh?=
 =?utf-8?B?cjBXcmRuUEtJV0YrUU5TdTJ5NkRaeXExRnpwU3o4TmFsZkowUDRoUDFVVFB4?=
 =?utf-8?B?SVVqTzFOMU1zNHlyOGRXY2RUQUkvcTNBdllaQVh4N0V4OFl6Q01zRzBtM3gv?=
 =?utf-8?B?RVpWdGFtM25hUnRBQVJCRzB4dUZ6K2pOVDdkcDBZMWs0cVdEbm1nalZlb1Uy?=
 =?utf-8?B?c25MMkNTOVBOZmZaUThjRmdDaGpCeG5QMkRJTG9TeEJ1SGROOWwxK1JNYkM1?=
 =?utf-8?B?U0FNQlVHcWxyZ0JXUmRIV2FDdWF1OFh6c0k3V2dDVWFsUVJRaHpxWXhRWHZj?=
 =?utf-8?B?SERXTmZ1RXAyYktQM3VycnVHZGM3VmhGVkdESzVVRGFDRVd5UFBvdTdScVNo?=
 =?utf-8?B?Wks5bHJNK2dEVVpKTFhBRmtmMHM4OGlvUXlNVGFCVUl3aGlHS2lPSVV3R3Rt?=
 =?utf-8?B?anZmcWJaYVI5Ujkyc3VVSjRySy9MM1pwTWFmWXlqUjg5YThjRE9EQjM4TXBO?=
 =?utf-8?B?Q0IwWHo3NzBlSlAxRHZDeHVRTHpnYmlKTVdzM1RBYS9nOXlBaXlrYXBCL0xp?=
 =?utf-8?B?WUxTQ3QwYm90N0F1VkY3TWl3RGpndW1qT2ZXM3E2UzcvV0hxbmJyY0tEQ3Yy?=
 =?utf-8?B?R3lEYzYrbHhQYUtmWnVYRlpramMzUSt3Y2VJUVB1K2dyRHBiQUhqcloyWVZF?=
 =?utf-8?B?dU1vMytLT0FqSFpWU3VBa0hWOGtoY1dTemx0cGRienpTbVpmaXJYQmIxdFk5?=
 =?utf-8?B?VDYvT2w3UUMvMmY5WlFhZ2UxakxxQzNHd2h3QzFwTklJUjVQT09CbVJoV3JU?=
 =?utf-8?B?aXhBU3hudWcycTkwWWJDdXdQTFpmTldWZEVJV2ZmQjNLdW80YkJndlg4Wk55?=
 =?utf-8?B?b3c0WVVybTlqMHVXK0l3dng5d28xajd4L3orRkNpZnFkdXV3U0FtT3JOdUd0?=
 =?utf-8?B?UStkdDl5R0hWMVBieVAvK0RRZEttNFp2TDlIZGwrTE5jdWxrYjBjY1dwdXFq?=
 =?utf-8?B?M1VObTQ4ZlFCVmFnTlNJRG5GWW9pcEFsU29qV0VUWTJMd05GaXdGTnJaNjFw?=
 =?utf-8?B?azJyOFhqcW13RmdCUDNEejVjNG1iZ2Z6c0RwSEI4UVJMUlkyT3NRWDVzZUxD?=
 =?utf-8?B?dWtTQ0syREc5eGdQSWtCSWtRRmVTcVo0VnN4NWM3Ty8zb3ZyclF3RUhrSEQ1?=
 =?utf-8?B?cTZGQzNmbXFhRGRNVlRPcVpNSkxIc2I0LzAyS29sUWovVE9iY3JFa0hiRUF4?=
 =?utf-8?B?bEl0eUgvVnZ5cmYrWnRjSHJOUFhVdUQ1Ri9ZUVliN2lNQXM1TzhOWkZuTXRk?=
 =?utf-8?B?YXdvTVhmc1BFNHpEQ1ZYWjZVeXFSU2RqT3BHcFQ2UGpBZXFsbTVWUy9ObjUw?=
 =?utf-8?B?NmRJTkt5LzdxZVdlODlvVHp4aDA1bmlSbzBiTzQ1bDZqM2JJMnU2akVPdWpS?=
 =?utf-8?B?S2hoKzBYRUpCR0hWZW0rcWowZExZUGY1U3BxbHd0MlJZK0QxMElvdG5HN0Vs?=
 =?utf-8?B?VTlYYXlHT2ZzM1lmOUVhL216M0U2aS91ajhNbTYvUnQrWE43VFZVTlFDZXpV?=
 =?utf-8?B?Yis1eERoUlNGVzFTVmpIOUdBOTdGQWJiWEVqdXl1RkhFTXlWMDRreHM0TCtD?=
 =?utf-8?B?eFZVTHRmclhEOVBOZWJHdHQ3cGlIbWJXZWRsdG1LNXV3SlZQelltZFpCcW51?=
 =?utf-8?B?dUYvQzNURWpHT3NYcVpZZ2hkL01PbFNvR3ZENXA3MzBadFhMY3dtcTlLVEdY?=
 =?utf-8?B?Q3E4ZDdSK0t4NlcxZWVmWW5FcWpaRDhCRkxlMGE3MURwOERtTzU1NGhYVFVq?=
 =?utf-8?B?MjRQbDNYZHZDWTBwalFQVW1QU3hrRloyQlBhK09yWk9KYzUwZHFnUGFpTG9w?=
 =?utf-8?B?MDdmaFFCSVZuY05kcWpDWEFueWNCa2RtQlkveW1WZUMrUld5WjZQZncvSDdp?=
 =?utf-8?B?SGMzZDFuR0dZVU85dHZ0bVpqY1Y1bWFIbVZkcUZEUDE1ck5nekNBWjdrcXdF?=
 =?utf-8?B?S2I0VVVEY29CaW5MOHFIdHN0aXNyMGJ0SjJxcGloZURkRkVFSjBsWE02U3VF?=
 =?utf-8?B?V1RpbmRHeDQybUpObjZMdmJ6YTdScEU4WU8vRFBlRHlxS2ZYWkVIRUs1N3FF?=
 =?utf-8?B?K2FjYzAwNFgxQmFKQk0zT3JrZ3Q2SWk1QkNsNGpqd1FoMGlTSnBIMzVjY1dl?=
 =?utf-8?B?NU82U3RwbFc2V0FFUWNFOE1EekJBY0hPdEI1c0JHSnp5UzZoQTlwRzFsQXIy?=
 =?utf-8?Q?QKwHYq7EGSpnqSLs=3D?=
X-Exchange-RoutingPolicyChecked: VxMkHFnTHtKx0y1IL5suw5TggNHMzrDraHenYfPZa8qgJ0BjjGfENCvYpuutMhQomVuU8vabIwoxYyDFrzYYRMBgDabpUSd4/v9B2ImKCrAwmCo1cf1Sq2IZyNpNjZcbg4nMS6tfSKKbrkOORi+rrXuiba2hlBhy42FLqlo72SxikcvnV7p9HfrNEUjtejI1zDZNa9wolz6z9RgRmCRrhDurHx5xDZ2vNuVGlJ4j+QDJYImbzxeqcQHjg8EmnzN0N7KfPSrG7JY9nigTmSAfZSMWCtr2Af23w86s+zc5u30HC1oUDjzDj721FEB0fxiDMlnZtSMKgmmKXlNAavSaSQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1260062e-3278-4434-6d99-08dec3325185
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 18:43:21.8221
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y5t2v8qoJTP++ZEI3y6OLPHi6+89+VnhrzUkV8qM5B5xAVt6LLhNr9YiFBoU2G471VfebKSp8bfBrnSlR68OJcqw2m5xIS8xfdxPK3MHFPE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB7981
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_114324_895079_6F733CD7 
X-CRM114-Status: GOOD (  10.34  )
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
> resctrl rounds up the percentage value of the MBA based on the bw_gran. As
> MPAM uses a binary fixed point fraction format for MBA rather than a
> decimal percentage, this introduces rounding errors.
> 
> Without this additional rounding, if the user reads the value in an MB
> schema and then writes it back to the schema, the value in hardware won't
> change. However, with this additional rounding, this guarantee is broken
> for systems with mbw_wd < 7.
> 
> resctrl is introducing resctrl_arch_preconvert_bw() to allow the arch code
> to specify the conversion resctrl does to the user-provided bandwidth
> value. Add the MPAM version of resctrl_arch_preconvert_bw(). This does no
> conversion.
> 
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---


If rebased on patch #1 proposed changes:
| Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>

Reinette


