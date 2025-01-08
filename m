Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A74CBE77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 22:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FaPgaroXNVyjkfxrwd7gipL9M4myHcHHPGbL8Zfm1Io=; b=yD6tm10TAB16ar1MSwKXNqOcsA
	cFuY1UHW552MDlb/K5/V50RAJ+i2CUk5qdf94szF2SbokIG0VE4SU/Nx7/l5W1U2FNvGZhEFDyPUG
	hUHiBnHNAaAVQHd8ZQ7rPxt0y7BudeK3fkY6o1UpbDnWzn0lc+mIWEkmer0iG7363CZAQQDSf5KCa
	jN9G62am+hX6KUo+jC2CAJixI4VuPKGY795IVyi5etd/uvOb3dmDXfF3RDo/qKpyPpGZWtWhH7Usg
	RMWp36vSngp0AMIM7LJv9z76gyCi+PZTANghkqejqaKnfwHlGEZZIJiSHKx8LI7pAxVOV8i1C8iTl
	k9vQRvaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVeup-0000000A5A9-1qxL;
	Wed, 08 Jan 2025 22:52:43 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVetb-0000000A4mm-3j7I
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 22:51:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736376688; x=1767912688;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=t9RKrurQXwl/XxLXZAMVq+LxyKtRGR0NfLRM1kf8siw=;
  b=FBcM1249+kbeWOTYaNo1yjl1SkAD2EAAJZxJkDhV1ezTALjYqOtsd7yH
   SmOt92vQBGQkf61q+P78n0/50blk7Mp/UDQVXyVXAcZoCVFca4crDfIFw
   YV0x9d3SoZLFCCKpWmgFSeEUZTdsB+EGX1x3plMpWI6HMLAiof1Yt4G1d
   8tbapylIZqbFdWZc7mD7X9hYWEC5viVDxSbETR8UHe7k7lX1ZXnQtNiKl
   3glueRlranYpcSRg7HOk77dZwXh5nOhH8r3F6cR28KtaXGn8AzqWkIBmW
   AZGhmqELNInay7Y56u5fBeLpO1GYrLzyyujTDNqRfhXhOy19ZELSTHV6F
   g==;
X-CSE-ConnectionGUID: fDjZMYRmRQS2K804KxUelQ==
X-CSE-MsgGUID: C5kWMNlMSxqxM7FlqGGLbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="36317087"
X-IronPort-AV: E=Sophos;i="6.12,299,1728975600"; 
   d="scan'208";a="36317087"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 14:50:45 -0800
X-CSE-ConnectionGUID: tz9ILdk8S3WzP0rCgnWQ2g==
X-CSE-MsgGUID: L7zYgIvsSZK6CrzU8CdT2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,299,1728975600"; 
   d="scan'208";a="103184184"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 08 Jan 2025 14:50:43 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 8 Jan 2025 14:50:42 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 8 Jan 2025 14:50:42 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 8 Jan 2025 14:50:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kTpOQzU5U6OSDG4j8slwCtPbPcnfcV6AFTjbJictrZJl3UtlDfoChIaffewecc3zzyrhlauJ7DBMiJGgkHl6BHPhR5UtKEDopGwetpENAstEzYdrVWU/LqOQmBira9Hx0klSdJuuZJvxNJddHqdZRrIZgqr4DEqX16V7C5L5MIUl52BeONSV3JE+2zyJA/zdaKhBLlXrqG1zTDIl1K/m/yIBduPe6MLylTMXInEU2e52Zgyni5Tid5BPM/NGI7BLAcw9S0Rk+bExhahknuzsL5YqOBJXldcUa5pmhamjqXx/qfIVoqmvTBHsQMMVL9vI0u2r8HRY2U023T8G0OZHqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FaPgaroXNVyjkfxrwd7gipL9M4myHcHHPGbL8Zfm1Io=;
 b=JEctVOaNt9Dj4nJJpxxySu0N7USzMDhZwGr8jTKA/pRaxAWKgIGwQREXv+h7FtTloNxguwjKgr4ZtlDelcyixViZWMNfowepM5+n8Pzcu25mEjxbTc9/PgYEVgNonWY4LkyPdzCGslDs3PaYIOUjkS2kF66RVfHdSfuLjwG/sHh7ZNrdrRh4qUCLISetVxrRbV6pQGC6XBtmLnA6O3I0IQKbuv9pQpU2v390Qp4+ZqqbzsEoso0InswSMgKAWv/Iy+sH6wLwtSknFmzch6ri/WqMV2Pd4B9IgRuFTDvNmXtePxyy15RNjYIJ7hj4U+s5utWXDpKAzvtyNyr/R6XKKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by SA3PR11MB8120.namprd11.prod.outlook.com (2603:10b6:806:2f3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Wed, 8 Jan
 2025 22:50:40 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%4]) with mapi id 15.20.8314.015; Wed, 8 Jan 2025
 22:50:40 +0000
Date: Wed, 8 Jan 2025 14:50:36 -0800
From: Dan Williams <dan.j.williams@intel.com>
To: Alistair Popple <apopple@nvidia.com>, <akpm@linux-foundation.org>,
	<dan.j.williams@intel.com>, <linux-mm@kvack.org>
CC: Alistair Popple <apopple@nvidia.com>, <lina@asahilina.net>,
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
Subject: Re: [PATCH v5 03/25] fs/dax: Don't skip locked entries when scanning
 entries
Message-ID: <677f013c1466_f58f29466@dwillia2-xfh.jf.intel.com.notmuch>
References: <cover.425da7c4e76c2749d0ad1734f972b06114e02d52.1736221254.git-series.apopple@nvidia.com>
 <6d25aaaadc853ffb759d538392ff48ed108e3d50.1736221254.git-series.apopple@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <6d25aaaadc853ffb759d538392ff48ed108e3d50.1736221254.git-series.apopple@nvidia.com>
X-ClientProxiedBy: MW4PR03CA0234.namprd03.prod.outlook.com
 (2603:10b6:303:b9::29) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|SA3PR11MB8120:EE_
X-MS-Office365-Filtering-Correlation-Id: 9db6147f-544e-4cbe-0894-08dd3036dff3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wx9cfNHeZN5E6Pw/hfZrR+EVZnA77iytn3Gdm2ikPyv4Yf70LzC9VYy95CwQ?=
 =?us-ascii?Q?m2ZepcEsbr6qRNKx+0q3o3Fnp76h+DrtAngD/4ntPkXPskqRi1PB4Ygo81K5?=
 =?us-ascii?Q?5Z74rpjnf8vK5M+S9rKPbw0TZee0FCvXmT9XAaWeVFNsjo13dInIJIc2L/Oz?=
 =?us-ascii?Q?G5sWqA9UDJX1MikEdtV/NyLwuu1A9CS2JqL5LD7fHu0h9p9ceW3AhrQCYI9e?=
 =?us-ascii?Q?BSx9oZ0uYRAxlyrjE6RmRdEC4qzrUpahDlT75Qog8KlRhcs1SR+ibdMwT0Cz?=
 =?us-ascii?Q?GWJu5pnt4rVr3qJ/1wT1oNCu7C/5ON6lz3zckKNj9NVjTCsV6x55Cez8rFRr?=
 =?us-ascii?Q?GTqW6fv6/nmFLOmQooxWVi1TIybp6W4YT/lvDgc1JUBBi5aAyEJLoFfEokGo?=
 =?us-ascii?Q?0qp1svvXCLF1thLq4Iw2PdGYmRTVUJPh0h6qBqIA0xB1QUattJ+QBDA9JK7x?=
 =?us-ascii?Q?pb9qBF0nHiHarfsb+HUSo0Fpa5/1g8z/3n7RCtRgNujdiG/BZukKaDpNc640?=
 =?us-ascii?Q?srNNIdDCC02FP+HHPgHAfOF1D3wFR6jLFmoABKXFD2ftSTGUTgvHxPorYMpO?=
 =?us-ascii?Q?g7tYHionJOJBxiQDygodQlrqly2Xgb2OHC6bbiwnZDbz1UcuQOlq2k91Svvr?=
 =?us-ascii?Q?aFzPxoj0R0AXN9rvwd9PSPjZLKN2LQSeaTQ1xldg6sJd2fUli+ReZItPitza?=
 =?us-ascii?Q?wFiKh20kDUUtCJdIUxO9uHXLwbXdfHcJHiWl3n52olNpyWhdBNiGOvpVgVnp?=
 =?us-ascii?Q?/xEKL4/65bpGxIV9Dl6WvZY9LdheOpS7HiNBRCuCaKsBCwgDnwbmtzv9t2Nh?=
 =?us-ascii?Q?VVRRsjrN2jxVvKI4sH8ueqLBGZXrlPwI8mDY/cIxTuP6XzDd8pO6AcnnrpCW?=
 =?us-ascii?Q?+BjWshZg7MZTJHDCizQm7YqIrSi+W+ToaDEtwmYpGrn/4Bpx5x2c3+FMmncG?=
 =?us-ascii?Q?MaM0lOJ3MYRe5LoZfJ4BV7vuiq/AfFXBoHJvW+u6VrSwutNtt73huxmXUIvl?=
 =?us-ascii?Q?kyz55ryNV0IHgSHoiNpGRq6ZzWuSollFczTKywBxB3/+GrL4MUbEqvBN1YPJ?=
 =?us-ascii?Q?3+miexQgak35oIJ+03euPlxJxJs6iM5W3AA4H5yIUW7BrTFpe1bY14UPpaf7?=
 =?us-ascii?Q?qpcGQxIil1wFSTPsrrPnCzHyLPa2GO5Z1srHCAMkKA0Km7Tmn98x/tD/6OnO?=
 =?us-ascii?Q?P3JuRhXLhwNaHPvmuExi1DlViL5wY86oVuRX1jBgXdoAfsGcCmfYIKhugGdF?=
 =?us-ascii?Q?alN0dGt6tPnnEHpkMnQfYLMdgbEWrT6pDyeWqvhzfPSaO5udpWdYKYrNImoA?=
 =?us-ascii?Q?jvFGX9oRZQOdgZG2oM69YOjC0Cx7iRtH6nYZ9q02dvkQY1fHwTyboaeggTM5?=
 =?us-ascii?Q?mHHDn4SXQ7aYcsF9WT2K9S7/RZPO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?n3WBxbNGwNyKlqzVynWwSG984+sH/99pIzDQTS/CwriYQ0v81qPZtQpM458w?=
 =?us-ascii?Q?5g/ohlGqsTWn7CTki+xPHNUExj5ytGjohV4VcfhP32jp/DBnDIhVZTnO3xqe?=
 =?us-ascii?Q?04l1ZfuTHwV/MFxGIIiDCaapjawwQsGjEX9C9SmaWTBWqw05qfILUPBEnpFV?=
 =?us-ascii?Q?O6AGcSLdKeEWH+fHmd24tG2FCfsg7aTocUXItuCW0WWXEHhKfKiAmM17r+x6?=
 =?us-ascii?Q?dj0MEBde3a5O80odU12I3MyeBSowxa5HFgEG+vLwp5jLo2J4m27w1KA/Um3a?=
 =?us-ascii?Q?u3QjvRY5CuLhtd4N2LRCke5Vla7w1VPZspPzjzDf8DvP87HB3xo3ZvRwfAb4?=
 =?us-ascii?Q?jOKaqSbIr9iuuonDbisSTyBhMcW6U75Ul3pkku+A1QK9oGRrh6eczpZDy5Sh?=
 =?us-ascii?Q?wAzdxPkguFD1C6SSakcmsaAJXWREsr/R9SWXVKmQ0cZ6il66Hgwv6T2P7ig8?=
 =?us-ascii?Q?E7ewJkdr4Hlj72cWDrD8PIep2oIffW/uK88u4n2K+6PxQLAPAzrJUCawMk/p?=
 =?us-ascii?Q?uehf+JQ39ASyNo6EhNPTAS4wfmZ6UMaE8EHxb4mb6hZSSEnVxqToRqcWJT1x?=
 =?us-ascii?Q?uhwYObckOSlW4FW5kt1RkZXIwVrv2HEMS8pQ3ycO5Z8n+JWc7Y2NMPA3lc0n?=
 =?us-ascii?Q?yE4eCNNke7OxRDKyr6df7enSMvzKglx/M3rhJtPugIdwWq9q0I6WW6LXsUmz?=
 =?us-ascii?Q?XEITH4NrjooBsddaE8L6ecRFpoGCbWvhAL0MbxGWBsK8N3PnETtT1f2GhxVV?=
 =?us-ascii?Q?pGg9oDE3COsR+qRZweTMMds9gEKKikn4QIdHdqxO9A8CP1UEKUvzY70gRy6W?=
 =?us-ascii?Q?P0u7VY/b2SqD/95XXi8WNX3l1U3EV8O3ULNrCXK9DNxgwQbDNwxYt19pGuSj?=
 =?us-ascii?Q?kXus/0TPaUIp2OejOUC1lVWjFhhHO74TWHiHFYotjGFsbBuAvwJrlaSR/8+u?=
 =?us-ascii?Q?pFs8muZkSCd6MInA4qY6TUkkNwaVgvBRR/dHmo7Xcg5jo1+LyJSegIJW02Yt?=
 =?us-ascii?Q?A1Nsqs1kMH9OdLn1HKlMbUlUy6HMa9w7z0lL9O4fcAql4iyz58dFuagw9EVd?=
 =?us-ascii?Q?eVK3lJLYvQ06PC4nxRlI/dZSGzyeIO0EBZ3Sf7EIMlduP9+av5++S07eHVif?=
 =?us-ascii?Q?J2XMnAK8v3JGR8RQncbB2ARop+3wc+CG5VpN2uQ1w0E9nqIS/EQdE19cyaG8?=
 =?us-ascii?Q?+lwOjzN1vsmxzqhKry16b98wsL8sXjYeojrFl2S6ymDdSEhX0PSBMq0hZ2ek?=
 =?us-ascii?Q?r+UZc2IXLDKk+tiTzHuicJRTvxhvaZqPjzllmXBr2DcP5fwpkzDD7brJkwRl?=
 =?us-ascii?Q?Zeew2YA0qzqxtbrB9N8g2v7el7COYjB9kZgEhzQnXU/uX+0ihXEjPHdvJ0+N?=
 =?us-ascii?Q?/0DlEwcDGxfQ4blLlRV5oqVCYgudbtgrKGP6a2a+rL7lsmEZ58lKxxC3DYLH?=
 =?us-ascii?Q?RviEd9TAXKm8vDQklNMmVkA7mSGwgRapWubKP5ctLtzx54fywlm8jU0VFTRx?=
 =?us-ascii?Q?tZ3FwV0wXEpF8dxKmCmFKe04qR0v5EtAV3haYfbLrp9BhO16fPjFAu5Tfd84?=
 =?us-ascii?Q?WOmPO1O1kFUGEa2Uc2S9tq1o3oBiUUvPstTicxhs0FMp262QzF1KpZLmmLnE?=
 =?us-ascii?Q?8Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9db6147f-544e-4cbe-0894-08dd3036dff3
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 22:50:40.1479
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qqlumFY77oyh/p2TBoAPWFKgBjmTE/ymuDMt/qA8d4tzz82CfgRNGQ1ER5+8qEqEmSVx3h6N9ZI/6uVtlxC2fEhrnvl/X3GUnweMJiCAvH0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8120
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_145127_974325_9A57766D 
X-CRM114-Status: GOOD (  15.49  )
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

Alistair Popple wrote:
> Several functions internal to FS DAX use the following pattern when
> trying to obtain an unlocked entry:
> 
>     xas_for_each(&xas, entry, end_idx) {
> 	if (dax_is_locked(entry))
> 	    entry = get_unlocked_entry(&xas, 0);
> 
> This is problematic because get_unlocked_entry() will get the next
> present entry in the range, and the next entry may not be
> locked. Therefore any processing of the original locked entry will be
> skipped. This can cause dax_layout_busy_page_range() to miss DMA-busy
> pages in the range, leading file systems to free blocks whilst DMA
> operations are ongoing which can lead to file system corruption.
> 
> Instead callers from within a xas_for_each() loop should be waiting
> for the current entry to be unlocked without advancing the XArray
> state so a new function is introduced to wait.

Oh wow, good eye!

Did this trip up an xfstest, or did you see this purely by inspection?

> Also while we are here rename get_unlocked_entry() to
> get_next_unlocked_entry() to make it clear that it may advance the
> iterator state.

Outside of the above clarification of how found / end user effect you
can add:

Reviewed-by: Dan Williams <dan.j.williams@intel.com>

