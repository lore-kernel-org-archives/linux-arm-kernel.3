Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38291E77199
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 21:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4FMvKpwn06CwLDJ3y2HvrddZiSBH1RttXUEp8yc3GW0=; b=Efjbw6GPQUCUqzrp3O1v2ResBS
	FOgwQoGMWNiSY+09Bd3L7xY8oBNHj9qb1ousHKVoHQAfETQwx6RUvaVAwibTZ6geMTsTYcYpQXibu
	eKxQZskUp5BHZndV765T1UBiFy4VI+ofOWiohYz5gCvy3vPAqip3rxJZY/ZFJoEG/R6RG1wWIG20l
	RSoOU6eoZTzsgjXhaCkR9CdBA/O2ptzP4KC/isNHJkNoCsINdm3AG0XsLoBzlapogIxl47smiMnM4
	ccQRgGeFfeXAoWiCbwG6Lsy3F+wAYnxHKHtVE2Y4Ad5VvQFX8iVLEundsgXkKSI4QOMKEKW/Y1Jtz
	F/NA2DMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVdzW-00000009wjx-0556;
	Wed, 08 Jan 2025 21:53:30 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVdyG-00000009wR1-10W4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 21:52:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736373132; x=1767909132;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=KiAmBIUuV+En4f0W1609LSCOyBlQmJhL4abuUH3TUtA=;
  b=C5hmA8tdb3XyToegja4sctC5MDbmVZCLP/ZZrYrNImyCmYIG9vR0nbb/
   OFSqQxKQ1oN0Ix5/xvdDzvyZF+0iIj4h3TRBbxwIKpANzY4Dl9sOzdYcZ
   uCxTDKx47QxaBLx0EP9SlWAySmQRJzAsadPcQ8j8nMm8RuJ9c0EBn0TEY
   9ZWx10LBzJnDuxCqonCOCpxBn7GrFLC7pae/ZGf1c4tTNgd0f98/UKAXC
   x2TXku0dByj7OxFQjiwLc+ou6Du45ne7WAi5rEyo2YKs8JV33vOFTl0Il
   Hbc1ErKuyyFViO/PgCr4NM4oVnIfZnJ5rXAO7SxdVTnZisSqB23BEs0fN
   w==;
X-CSE-ConnectionGUID: WYpNi6iTS1uozHUPgVDuwA==
X-CSE-MsgGUID: 1OlwbLHNSVKdABj/sZnQ0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="54034459"
X-IronPort-AV: E=Sophos;i="6.12,299,1728975600"; 
   d="scan'208";a="54034459"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 13:52:07 -0800
X-CSE-ConnectionGUID: uYUh7DFcT9S5gmND+zQnzA==
X-CSE-MsgGUID: RZGrm8k6RXeRCbsyG2U7Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,299,1728975600"; 
   d="scan'208";a="108209888"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 08 Jan 2025 13:52:07 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 8 Jan 2025 13:52:06 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 8 Jan 2025 13:52:06 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 8 Jan 2025 13:52:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NPog+HGfPxdnMfyBfrV79wW2y8v8glEEM+dx9/IhHRCmy5+gjoGBm9PUDCihxi9b9fZUQAFo+1BXoSG4oRGiQC6xq+e23np2t5GOuML54n6tIWCJE3yuPybEE9YMQANGRwHo1fzIpA9QMQHY23NEaqKcglt5YthCtBiqvBoqmsS3eGmYriiz/t2DceyGZKf9i5qCkV8e3Spnod/+08HYkQFnKaxtG7EvfJkOoro14+eZV0jEvLLjHBU0HRm/NPOqSOjW+m+AONWFWnKuc7JhkcapFxHxwKozTTMgmbdxkJxfgUO4H453yYqOTFqXpiQBdRGTc4x/V7wz7jcKrgUxBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4FMvKpwn06CwLDJ3y2HvrddZiSBH1RttXUEp8yc3GW0=;
 b=W3LVpjglL8h7wv1V2ZQl45ZnoTLCTKkohKbh+sezNvGzUHLvBC3axLhFSqpAPVHE0ac0rPB10ZxLw010kc3oI8sv3mbdy9xmDJIgiJq3USnzKN/zzNvufRGYoov74nybTeF+O/AH0LinaeDJud1P+h10QFFCbWVhkPeJAys8S1mznwfz1Pdl2NkWcmcAsyiFc0QSBRisJOQYn17i6W6RtArh6OpVTTD6yfsMQysQ9/NAabL5sClnJWN5LBRXAjdT2bTK6jktNgOjbRofCQKz7Fp/OzP4QXHnngoNPV3d47r7w5UeBG/RR/AnU7sIcSN4irKHHzZjsvPoS/WWcAsjAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by MN2PR11MB4661.namprd11.prod.outlook.com (2603:10b6:208:26b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Wed, 8 Jan
 2025 21:52:03 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%4]) with mapi id 15.20.8314.015; Wed, 8 Jan 2025
 21:52:03 +0000
Date: Wed, 8 Jan 2025 13:51:58 -0800
From: Dan Williams <dan.j.williams@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>, Alistair Popple
	<apopple@nvidia.com>
CC: <dan.j.williams@intel.com>, <linux-mm@kvack.org>, <lina@asahilina.net>,
	<zhang.lyra@gmail.com>, <gerald.schaefer@linux.ibm.com>,
	<vishal.l.verma@intel.com>, <dave.jiang@intel.com>, <logang@deltatee.com>,
	<bhelgaas@google.com>, <jack@suse.cz>, <jgg@ziepe.ca>,
	<catalin.marinas@arm.com>, <will@kernel.org>, <mpe@ellerman.id.au>,
	<npiggin@gmail.com>, <dave.hansen@linux.intel.com>, <ira.weiny@intel.com>,
	<willy@infradead.org>, <djwong@kernel.org>, <tytso@mit.edu>,
	<linmiaohe@huawei.com>, <david@redhat.com>, <peterx@redhat.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linuxppc-dev@lists.ozlabs.org>,
	<nvdimm@lists.linux.dev>, <linux-cxl@vger.kernel.org>,
	<linux-fsdevel@vger.kernel.org>, <linux-ext4@vger.kernel.org>,
	<linux-xfs@vger.kernel.org>, <jhubbard@nvidia.com>, <hch@lst.de>,
	<david@fromorbit.com>
Subject: Re: [PATCH v5 00/25] fs/dax: Fix ZONE_DEVICE page reference counts
Message-ID: <677ef37ec8d26_2aff429467@dwillia2-xfh.jf.intel.com.notmuch>
References: <cover.425da7c4e76c2749d0ad1734f972b06114e02d52.1736221254.git-series.apopple@nvidia.com>
 <20250107222643.80d5509219d6b66c15b1b8af@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250107222643.80d5509219d6b66c15b1b8af@linux-foundation.org>
X-ClientProxiedBy: MW4PR03CA0176.namprd03.prod.outlook.com
 (2603:10b6:303:8d::31) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|MN2PR11MB4661:EE_
X-MS-Office365-Filtering-Correlation-Id: cddb1d73-2dbe-4588-a87e-08dd302eaf9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vd7RAj9aI7bUStBnKdTOY45MMAfSi7m8zchWPxWX+MsseXbWTi+HR8KOpfJD?=
 =?us-ascii?Q?LF0mEMKn3Gj0s03TibXYasjHAa9kd2hgcR7A4TgRANKwwas54HA2UseFKfx5?=
 =?us-ascii?Q?TkPYwMgL7QUCH9Zy9mwPDZWYApx3S3V3SfknpNLZDn1CZYDuOo2FYs4SdXzn?=
 =?us-ascii?Q?Lc+NL4eiMRNO7XmJfHMxoZVhU1zOUICKwyaPZq7DJdj/4uwrI7mnXz8f3fnn?=
 =?us-ascii?Q?g2clrKxMnXnmMLU+y/aI0SL/Rf7F13I1Bem9nPsvslqsqyz00XqktUddSITr?=
 =?us-ascii?Q?lUl8jEeqPE6mQ1u3S/d6yWbn+PYAEzcNBJQ3YTdTfWrYekdJdJ4uoKpoVreH?=
 =?us-ascii?Q?ZcEnCJBXuvWDH0WAVZUHn4gEFy6WM8VV/QyrMfby8eH36WRrg18KEG3u4WHc?=
 =?us-ascii?Q?cJioMxrKdwjdVhPemLccIl2DeiXtqXeoAn55bQMzcil56qOOqknHQEsLQVDI?=
 =?us-ascii?Q?Du75/VmTe7OygFwU3uzKlrrIiuHL5X5IjiuOqSlfYPHKz9kBcZJmK9MkedBt?=
 =?us-ascii?Q?Mv/zWuuD/MP14AbVsDA4El6usu6Krv0ZoQ2u6j/2H5if+Lt2latG2tj7lH2/?=
 =?us-ascii?Q?Si+cc7A29YbAMs/LPzTbDnii/+gYp/2aEa1fNneV78wn1V5T+F6DbD0szC9k?=
 =?us-ascii?Q?D+8K0NYn9itShHzKKcBAYRf0E22OPBL1Wa1QBoz6ujrWGwgwip3vNaNVbNkn?=
 =?us-ascii?Q?DGLT2poK5MGcaXG3y3ltmJdYtNgpSZhNJpLWgLCHg9Bw0T8sxJqRYUrcsJqz?=
 =?us-ascii?Q?HjtvyZ7tIOUKbYwRRBgC7pVdTok+DByAdqiHoaoxoVY8FfaOyc50Ws1YNfJ9?=
 =?us-ascii?Q?RliZLVoSvA1+l+JaC11lxHWC6ZG3JW+IzphRgdnY2Q1lzitnE72V0KIctBvH?=
 =?us-ascii?Q?zRhHEDJvyHgStH2maBUo+mCA0mUUXM4K5oSLvwc3zaQxy/gd0QpbkYo1LBSD?=
 =?us-ascii?Q?0GDVbKWWC22irjxLXTLOfKO1EhFYFlPGlrXdpj45jOSy5cg/36lGSzTSA9X7?=
 =?us-ascii?Q?i6DWH/bnX/kiHjcj9qqwxGwenaT5Aukd15ykJBqA5FJ3HbsZD4LYbl8j/x6p?=
 =?us-ascii?Q?6ptWw/Wyjq/99b6zhH+5FpxpvJeY9lqU6vl/diGG4EwaMF9PEnVL2a0MPS8a?=
 =?us-ascii?Q?U4NqrnCJRXK/hGLlArEm55fOJaPqs6W5gIK10sTjU0pznowuWqwhHnOKtdyU?=
 =?us-ascii?Q?FHlGqrQXXg888S9EoZ976wag2hnn1Op8juAb8gkZce3jQciBb/G7bPolLIiU?=
 =?us-ascii?Q?W7lzsNeFFzjqi4SG6/bD9VG4kn4QJqZQfPwCIO2iZfc99uhWHJ4TYAxIoyH6?=
 =?us-ascii?Q?1uYtbxNflOyj4N5/RtMXuz4U32jTWg0Ue8YyFlIM17n0qg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PEGM1CDchaVi3bAjBL1qzjKYARNCpEwTiubzmjfIBClDz1Qh49sdnm7kSfvx?=
 =?us-ascii?Q?J7Y9gH8E2QlaTBRrR078LcRXAZVdDki0Qwtrb6BC9gqeZ2sRddFM++XH8H/D?=
 =?us-ascii?Q?fFrvW/HlIjum5if9uNLURSKBEWsCU7yEMusb3HJx/gwYiPrXzRIYDxiwQmZY?=
 =?us-ascii?Q?5vVawqhL0ljFqOTkTroy0fkbxiWyIHKG1aGehQe8k9RAUmlYPh6nrJgXs6mV?=
 =?us-ascii?Q?5S2F4stO5hHhvg1eOKiledstnzJLjoSesgvcxe+jyu73D4UHLPUl1AthgC/C?=
 =?us-ascii?Q?/obF0goXfM9PRTnD1op6byTxvVZveBsJ+NF18wf8CPdCHFVry4L90XOnWPC3?=
 =?us-ascii?Q?OAhMHZeLceI7nOgHNBM8s0ovV0avL4Tf8kRP56S7osqytVrVyh0u4QBgQ+29?=
 =?us-ascii?Q?Ee9xTFSQFYu4edzGzzo8T9NK3VpCzal9Y6BJmjtCKnnW7uY5sWTwNuUZ1RrG?=
 =?us-ascii?Q?ifWm7wjM2Spl53lwdztxcwKFYcPztCagwEwbfmKmh8BKKftr5uA6BYj3bxuA?=
 =?us-ascii?Q?7jdopOMhIDSE3Qol7O1Fcu4km1Zg/O4+qTYl4KJKwAkj13WSEMLSLDxeBNlD?=
 =?us-ascii?Q?w2WCbLGVfL7IIhxaQB91zPv0aS7gm/1/nruB4Z/Pmdl8hDRuJyliS7zNX73g?=
 =?us-ascii?Q?NYMc0HgVbTLtRl83TaBfvxD+0kyqzZckcuT9DXDp0Tm0yxePL105v+bA9htn?=
 =?us-ascii?Q?z2fIEiF6fJzL1FuPEu7ST3q3Cwh1v1LM6ySkPFHI+7gJuUovzqbyWDsXr2wz?=
 =?us-ascii?Q?jpKKAWQWUpt8Wh5L5arl3EX00CrF6ClIzCf63N1aIIpTuEgeEufdmpfOvCKk?=
 =?us-ascii?Q?29G4ZIxbfJNcFrq7sZgbgYXfYfMDs8swlL8vpPMCZesgCRdDerQKyWnRVW1R?=
 =?us-ascii?Q?9fsvlrI2/2ps7z5NPWN5BIl3G7B5WgO4475ggETWzH+NIZbh7zCy+dByCkUe?=
 =?us-ascii?Q?/mASKehpjBVfi9nZc1eer1zblAfq9YA7S/l5oc12R05ruS5gs/DMnQQOXwYN?=
 =?us-ascii?Q?iygXMcvZOAHvO95FH9m3kai0w6fw9kcl05ZSgIfVVk1RrqpxHTM87mVhCuRq?=
 =?us-ascii?Q?6QruB+yTAzw8ZA44U9wY2cN/x0VPQnqN1n4NUPXJdArPdtxKagZQYAg5nygf?=
 =?us-ascii?Q?nnPB6QhIb+Np8A1UOctatcUfqQWfyRYIbMCClXKtz5q6+PvF+woMT56lvSjR?=
 =?us-ascii?Q?DgkyaMS6JKGVO8BtwtEboCeLBst/JUNqYZjNhXUNJxbtmSNOjhJca4RmQhBP?=
 =?us-ascii?Q?xAAxM0qMC7GDFGSjrEtcl4uovWNFlT8MhDsKnlAnafHashYqaU9nFvb9y2Ok?=
 =?us-ascii?Q?xgmf375hdoAxqQ1T5iySgtguAl9xWlEVVaLym2faNAiUwramtn0gk1uvVB35?=
 =?us-ascii?Q?S5RhhDFRLqNq3J9RoxsqUVPFqNVoK/qLjFaf18uQc5Lq4e+3NcWt5gZeNNNI?=
 =?us-ascii?Q?hxVhrf4eyNx82AxWjUlxHZMv6KwMXsyqqnADq5QXHocXTlDOttLydNf51dz/?=
 =?us-ascii?Q?fsREaiOUtNbRGFB8/8ej+fO9eI+VZtAlDaOWcE203aKMMNUks+KWz5xI5oSc?=
 =?us-ascii?Q?VJWp21rLudNPUhlqMWnFvAVKoshuY1KDy4xAa1y100OW6KffuuH1N05ZXz1D?=
 =?us-ascii?Q?Tg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cddb1d73-2dbe-4588-a87e-08dd302eaf9e
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 21:52:03.1084
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O+DmFBUQ3ByAU2CLU7SdMwXBjRKzTI5QFcDSRbLfXEJ6L4UswmwD0bQ+VZI0p4x6wSO4ph6Rt1Sg15kdHtMd7H7YXDcvBl3P+xuqqVwflTM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4661
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_135212_357460_0F3E16BE 
X-CRM114-Status: GOOD (  22.86  )
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

Andrew Morton wrote:
> On Tue,  7 Jan 2025 14:42:16 +1100 Alistair Popple <apopple@nvidia.com> wrote:
> 
> > Device and FS DAX pages have always maintained their own page
> > reference counts without following the normal rules for page reference
> > counting. In particular pages are considered free when the refcount
> > hits one rather than zero and refcounts are not added when mapping the
> > page.
> > 
> > Tracking this requires special PTE bits (PTE_DEVMAP) and a secondary
> > mechanism for allowing GUP to hold references on the page (see
> > get_dev_pagemap). However there doesn't seem to be any reason why FS
> > DAX pages need their own reference counting scheme.
> > 
> > By treating the refcounts on these pages the same way as normal pages
> > we can remove a lot of special checks. In particular pXd_trans_huge()
> > becomes the same as pXd_leaf(), although I haven't made that change
> > here. It also frees up a valuable SW define PTE bit on architectures
> > that have devmap PTE bits defined.
> > 
> > It also almost certainly allows further clean-up of the devmap managed
> > functions, but I have left that as a future improvment. It also
> > enables support for compound ZONE_DEVICE pages which is one of my
> > primary motivators for doing this work.
> > 
> 
> https://lkml.kernel.org/r/wysuus23bqmjtwkfu3zutqtmkse3ki3erf45x32yezlrl24qto@xlqt7qducyld
> made me expect merge/build/runtime issues, however this series merges
> and builds OK on mm-unstable.  Did something change?  What's the story
> here?
> 
> Oh well, it built so I'll ship it!

So my plan is to review this latest set on top of -next as is and then
rebase (or ask Alistair to rebase) on a mainline tag so I can identify
the merge conflicts with -mm and communicate those to Linus.

I will double check that you have pulled these back out of mm-unstable
before doing that to avoid a double-commit conflicts in -next, but for
now exposure in mm-unstable is good to flush out issues.

