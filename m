Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD81CCD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 12:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:References:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9WcfxJyAZRZiNsYUofIwRgwx1e7H+FY47R+TfNgabfI=; b=RzEEipaA0lE2PFF/hUfqeiHaoA
	/NlbNZ5mduUm9AizXtw2fCBXX4b/UKAWnEMar65py9ho8+D0ZQllGqOx8fTgPA7z58gFrReEDfUId
	ikYLab1VoIpRh5qD+CEjBkACpkuZyt3oe2dgyaLPdf7UhSneVb093rkcCRo5Fz/f3JHW/sb+4AP+C
	uNDceJoeiK+XABqyOSZNIlopnkGX1yxkytzT9jOUyLsCZvzm8gayO0qXeHdwOTYVszxysYvksbyrk
	ITobkoez+ywFo9uXziCeDKrYhyma0iboUEt9BYfrCguqk5+d35NF0lp92oNYCTWRQXadWX8ZniFyy
	wiNwoNTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOxZT-0000000Fjgi-1bGw;
	Mon, 18 May 2026 12:59:47 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOxZR-0000000Fjfk-0hWU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 12:59:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779109185; x=1810645185;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=54FLWHpdUuBkR0CRavWNGqqh32eehGX8mFCs5/BxUfo=;
  b=MUcc+k/iJ+WseqRNwpLBCuTyfjHYTIgs8bjNzs1kpJcchuKc90t0cOXL
   LYVeCCBCGebZZC7RrGeE26YXjs7zOaYXJwO+c57GeyYjGzz07CfImQ7EC
   mkJlhJdrcChiKu/dAL21vvQM37sgXGXx5U766n1pfMhW8nH/4WjPuUcBT
   6Pb9Rt8z+yZ+hfFJbVAsJmoRAnz7gaF0kAZUBcFPWFcycJYGdgustNQeh
   6UOURDLZzYBUcXIM9Wr7J/ckUfHIobHVfJOQjKeknvPdC++rVlyb6jsaQ
   PhqKfmtqx9+GT7nxUww65V8IJXVR/o+lCAbpfIUAfwzu0h9dIIpWXF9QN
   Q==;
X-CSE-ConnectionGUID: uBkxTyBaSeC+lNORCRNI3g==
X-CSE-MsgGUID: rbQ0agXXRtWbyH+m4S30Yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="82524548"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="82524548"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 05:59:43 -0700
X-CSE-ConnectionGUID: AG5pXFVfS6Wnjk6CqejVLw==
X-CSE-MsgGUID: s/6GwNUjSkyjbaIF9I501w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="277520833"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 05:59:43 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 18 May 2026 05:59:42 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 18 May 2026 05:59:42 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.43) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 18 May 2026 05:59:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BZRECSe55AeX0g+GWcI8lemGqAEMZvxk7GQSR6Hybhr5vX2TbSR9Jq+NdmGHvkes1uI/dmzSoTHfSzWvtxUaYLZG17Et/HB6CrjQ7BZrKLJ7kyNBIfz83XcxpuhK/rMu0rHVDUiKDA3LnaMTHeNSwiRuP0LoIVHj+GZuO4XFqBd/MqjsCiGtm91nkkL5xp3FYotbbup2Ymgp0CYIqkxWz13Wcnry1PEcydJjJW7fuORcqKnJYNiljxsvE3QkDe8TSht9mCckSRwgmM8lbhZnX1OCw/17YTseldzUX9PJqJowCbBydolCoWOLt9J2I8uxnlA5F9BoHWqC4nejZJFyfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n30la12sgif6kFO9AeRIwr+iPnDLxmKXP9C+1qpweC0=;
 b=Mi77BYVHmiWLEeXAmU/eG4AJK2K86iuu/ZiqGP8bV9vYSwgYxLYRC1rAJiny+xupQk7o1WZkNg5cBnSeLI1nenrFtbVv7dS+jt07aG5XQo/LSbgNaRezyxNQdBDlbSJt9RaO8ku9GTCdqjhxUxaF6LJplXaUZKqTr4IVFT8ZNVdkKdcuxldJUlYX+ImYoc0yLVI8ljn/NNXf7HoYRdGJA4Ruf4uc0YQxrdQ4XuOwYuhW/DlNk6+GC6rRvPxDxLRFI29OXIQ47X3vcQoQotW1LV39MqGGxFJ81Xek5cvB/evWLYndpo7jjX9T3QE3UydRZ7wM3FulGmEDmOq02PkgUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB3282.namprd11.prod.outlook.com (2603:10b6:208:6a::32)
 by DM3PPF1B59FAA3B.namprd11.prod.outlook.com (2603:10b6:f:fc00::f0f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Mon, 18 May
 2026 12:59:38 +0000
Received: from BL0PR11MB3282.namprd11.prod.outlook.com
 ([fe80::5050:537c:f8b:6a19]) by BL0PR11MB3282.namprd11.prod.outlook.com
 ([fe80::5050:537c:f8b:6a19%4]) with mapi id 15.21.0025.020; Mon, 18 May 2026
 12:59:36 +0000
Date: Mon, 18 May 2026 14:59:04 +0200
From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
To: Will Deacon <will@kernel.org>
CC: Maciej Wieczor-Retman <m.wieczorretman@pm.me>, Catalin Marinas
	<catalin.marinas@arm.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>, Andrey Konovalov
	<andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino
	<vincenzo.frascino@arm.com>, Andrew Morton <akpm@linux-foundation.org>,
	"David Hildenbrand" <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
	<vbabka@kernel.org>, "Mike Rapoport" <rppt@kernel.org>, Suren Baghdasaryan
	<surenb@google.com>, "Michal Hocko" <mhocko@suse.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<kasan-dev@googlegroups.com>, <linux-mm@kvack.org>
Subject: Re: [PATCH v12 06/15] kasan: arm64: x86: Make page_to_virt() KASAN
 aware
Message-ID: <agsLtbLUDz8_BMn9@wieczorr-mobl1.localdomain>
References: <cover.1774872838.git.m.wieczorretman@pm.me>
 <b9f7bd991dd2ba0b4c187f5c63962626f00c6a62.1774872838.git.m.wieczorretman@pm.me>
 <agr-g38q5RiahqaA@willie-the-truck>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <agr-g38q5RiahqaA@willie-the-truck>
X-ClientProxiedBy: DB8PR06CA0051.eurprd06.prod.outlook.com
 (2603:10a6:10:120::25) To BL0PR11MB3282.namprd11.prod.outlook.com
 (2603:10b6:208:6a::32)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB3282:EE_|DM3PPF1B59FAA3B:EE_
X-MS-Office365-Filtering-Correlation-Id: 26457fbf-94ef-4c4d-7e77-08deb4dd4ef6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014|56012099003|18002099003|11063799003|22082099003|4143699003;
X-Microsoft-Antispam-Message-Info: so6YHyyCMLyk3d933lnVdSXnEjDv0pTlfZR7nkHmrDesj3oDec1R1G6efg1fjLFfrBBkvvauLy6xBMrdkXbOjXTn0q5oVIpR/rz0Gt4Mo5Hp2kcWezbYJF791PrOZardR1Nuu0yUVghapNwa/HW2GKj+zAHazXsNDIvBfq6XS7lAhWarV2R+p+J33ByjOjSoWbs426rozN+9CPDM61yAPr5aG+lP8MLPitQAUpGYwNW1tfm2Ajt3Mtg/aobBjSHLybQ6yyNHi6/X9v9b+B0chjAPTuDSNPdp7cedlARdPeCftsQtPTTJkC2Rz/tAK/fLSjTJebZ6msZ+qAPDocUUOsVvo5EHqmiwXW5BT7ylASSaiblaYENW/1Igi8hEgWfDWm5yQ0iyAlgZWggWFG+O8K/w94AWxN7ve2YjV9iJki1QQxGw5hOQzQ19ZJJrJMnJ8zm37gyyRWi860ViWa5SQF1PBFAr4TQqzh/YeRBffznOKJLsRwQ/N4ItKbf4DkCqNCVAxLO8O7eAx4jrQLx1eRRJ6KeKa5BylTTY2et9FP6JKt4T2U7tiKbhxKMhHc1AVbU/kTC5t0E2j05Lm4smGGF3ZDWzoDHCsWVdOxCuHQO0SoxWyGzWePzVe7jomZCgFDD/Zb6vAKFkYlqXMQ5KbRjS7axWK4rnQrm1Uyisqpym68hBNRsLjV34S8a2yfpD
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB3282.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(56012099003)(18002099003)(11063799003)(22082099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ax2VHqlo1gfuAHU5d3SnATSDP9pzWVcz66AlZYK2rzGamvxfla9i0jqCJD?=
 =?iso-8859-1?Q?em7gOTVdkTNttYYqwcy97RlxkDX6aF0BWEhNwrX+T+qmUSDydIeqIUIhIm?=
 =?iso-8859-1?Q?CAy3+6wVQknFbW9MWBRlQKbKW2elkY2Q4FumIGe8Q7D54r0mJEN02gHKfl?=
 =?iso-8859-1?Q?DelcrvXI7P3ZTRQNdN7y9hpIN0dPJ8Xh80W7YM3qMXVFg1Z9rnUYKutFfq?=
 =?iso-8859-1?Q?6+3kAeKwM4SALJCs7FcBKPIGQ+xNGeyZllM+uUXVHMmq3DjO6bcKqX75Zf?=
 =?iso-8859-1?Q?wAxKvQDk7zvyQOpP0Tc9mA1daVTul6Q5RCloQ1yuz+znCH5YsTfch8diQ/?=
 =?iso-8859-1?Q?gN0PtlfTD65XXBzt1t24J/QTu7IMAFKqYN++hCEEDLS5KmmjKel4ay9a1f?=
 =?iso-8859-1?Q?Kpl5wDehritjIRBXIVZJJWGBprZOLqPpLpdMrautyXiB6cr+MFGR3gGMml?=
 =?iso-8859-1?Q?1ruJsCRLXhaqb5oiP0BOOt60lyRDJHDVstDfbM9gYhedBgDgxLFWD3Kvfw?=
 =?iso-8859-1?Q?QsFv2khlnTM0cRkEPpIgSdx5eh4wbvKn2hI3CryfeLhtLMiy4EBOWMrg23?=
 =?iso-8859-1?Q?ykF17cwPrRtO/7z3gillkGG3A13Fse8/rwauxq1eU5YtnZ1/OGvgWr2h5l?=
 =?iso-8859-1?Q?LnIcPC/e6jveFX+n8aiDxOllx2RjI6Y0tUlsq+dwrKv3RbdDVIhFMub20r?=
 =?iso-8859-1?Q?bSLgLXiSU8lYylrZWsEiz5jux7YRsA2h33NN6HbQqh2qtvi3iihpzzhpex?=
 =?iso-8859-1?Q?kc6Ep7OghZ4UHEgdMSazjnINwRIi7SVcz8j5lZjFefBo/KogWttGA/O4o6?=
 =?iso-8859-1?Q?xcI5qhGTJE+gPN7p7vQWJCei+g8CcKXPMbsdbTiaCwaPepPhFfVFM1Ad+Y?=
 =?iso-8859-1?Q?zhe/AoXCQJJ14kuQnBLfAjca01ec9w0OutLZiZIfrQC8eUhu/6zu3+KxCz?=
 =?iso-8859-1?Q?wF8BuUmSRHtFvI7qj9eXMKccbO6JmYsLCAwvn95ngByJHGAunVpGHGfd3K?=
 =?iso-8859-1?Q?EDFzEH1pdoMJK91Z7xbjELG49956Y2zfwqEoXos2A0oothwq0kGjgpp2X/?=
 =?iso-8859-1?Q?GYn92B7OtMlsKz9fkRORe3w48dqSL/eiyCDGeNGca1JXu4zkH4ZUJyH+i0?=
 =?iso-8859-1?Q?+Yrt7gfU7kVtl9xOJJkLf/4L8ZK2pY+hARyQbQ/uf5hQqPhdnl/uAV1OtY?=
 =?iso-8859-1?Q?xoWye3RdPEEuMNR5wbIjZcYW1aInHU7ZaUpuDTlICojpfS+wGEVrv3C6qB?=
 =?iso-8859-1?Q?OkbH1fVlyYLyn8ecKG3E/JkkupA4XqOc5CnEy3U2DAhpm9MLScFN+aVw/Q?=
 =?iso-8859-1?Q?4t/2uTXuV5/ADCz7Jdu5wmcxXzYbocKunayoW4mHuAmEAcV9/01nM8HZbp?=
 =?iso-8859-1?Q?MZRQAZVxD8RW57zp11HCW5YYxckuyYK54TLeLRIwE1wIs6q9tYjqKwGH9v?=
 =?iso-8859-1?Q?I3wFPOJcd2qgyCgetNWeLP9hbbt3WOV61UG00q71+nbiwHpZAY6FBQ+ckv?=
 =?iso-8859-1?Q?dU/pbKWN+EcvuX+r+7gT1ZeMPZ8263O2RYAEaS1O2bUF6ggLI+blz0IFlL?=
 =?iso-8859-1?Q?fIdih/ois9uO41tYDlcQeOAHyzfaFSPs4jSrsnTJrywWTL9sJgG3CTLHdG?=
 =?iso-8859-1?Q?fSK0Mjcb2GbrpIScMd6Z/xJhhE7ONevJa4yMDI0bC7AAMsZaGPWlJXPrZw?=
 =?iso-8859-1?Q?4StYDSMZDD+pwGVYfdApCG9OwSjw40T0gvuKov5h1dnq4r/+d1QQkNNWTU?=
 =?iso-8859-1?Q?JBqyxbgPLZvjfddAxszgOO7Kjx64Pd2lBS1r2Zo6iNWXsDI2AVkzjQQqgu?=
 =?iso-8859-1?Q?C9Yc4BoszAst5iUvgDV39Zm4aCkPY71Ejdu1PXJLUD/nqY1jHjS4?=
X-Exchange-RoutingPolicyChecked: pclBoVWdx56CwUpSr6at9PNDlRSRjwvMAiqOw8S6KJCzu3LKpNOMDoRx9PUxy5mP/EdQlepcjfCFCR+B+BzgJB6O66KF4Qp92x3zzbP3P/ui1WAbfSJAau0uGKCW5KHtJgGemWG4FCM1g4Yv68JakC2uRbDlFcfmiQjQRMlbt1UFnj594Q3w1HfyRoFuLybJou131G7mYPrhLxZ3jVh+77Jb80bJBV7i6lHeIG0zs7MOw3ERfa+hQJX3w0zXjeIVkanXeE7DFOVSmcnFpUC+X7d1uXftdhLIlhowzFLDkITTYu6VOIKgBgkna5jstZHyv46nlYTNPnzou9pdxKDEtg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 26457fbf-94ef-4c4d-7e77-08deb4dd4ef6
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 12:59:35.9792
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GbzLblfsj5Gkd3D3OQPSANQ7fUWjUnYtMxHhy6PPaD9VfuAQtYgj/qicuQLqgXOc4RjiTzCX6qG0KfeJnL8pQ5u3GeE1/zxttn1jw8Y8pi0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF1B59FAA3B
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_055945_219682_D11BCE2A 
X-CRM114-Status: GOOD (  13.28  )
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

On 2026-05-18 at 12:56:51 +0100, Will Deacon wrote:
>On Mon, Mar 30, 2026 at 02:33:43PM +0000, Maciej Wieczor-Retman wrote:
>> From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
>> diff --git a/arch/arm64/include/asm/memory.h b/arch/arm64/include/asm/memory.h
>> index 875c0bd0d85a..39dd0071d3ec 100644
>> --- a/arch/arm64/include/asm/memory.h
>> +++ b/arch/arm64/include/asm/memory.h
>> @@ -411,11 +411,6 @@ static inline unsigned long virt_to_pfn(const void *kaddr)
>>   */
>>  
>>  #if defined(CONFIG_DEBUG_VIRTUAL)
>> -#define page_to_virt(x)	({						\
>> -	__typeof__(x) __page = x;					\
>> -	void *__addr = __va(page_to_phys(__page));			\
>> -	(void *)__tag_set((const void *)__addr, page_kasan_tag(__page));\
>> -})
>
>So here we're using '__page' to avoid multiple evaluations of 'x'...
>
...
>> diff --git a/include/linux/mm.h b/include/linux/mm.h
>> index 09044934dda8..f234650a4edf 100644
>> --- a/include/linux/mm.h
>> +++ b/include/linux/mm.h
>> @@ -117,7 +117,10 @@ extern int mmap_rnd_compat_bits __read_mostly;
>>  #endif
>>  
>>  #ifndef page_to_virt
>> -#define page_to_virt(x)	__va(PFN_PHYS(page_to_pfn(x)))
>> +#define page_to_virt(x) ({							\
>> +	void *__addr = __va(PFN_PHYS(page_to_pfn((struct page *)x)));		\
>> +	kasan_set_tag(__addr, page_kasan_tag(x));				\
>> +})
>
>... but in the new code you're proposing, you evaluate 'x' twice.
>
>Is there a reason not to take the arm64 code as-is?
>
>Will

I was going for less lines in this macro when I initially wrote it. But you're
right, the arm64 version is better, I'll switch to it.

Thanks!

-- 
Kind regards
Maciej Wieczór-Retman

