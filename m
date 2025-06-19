Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A591DC71159
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 05:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BHlr7LRRN9DYrjyDb3TU6J/seWACblsMO/aGao9db3E=; b=jzRHADKSLiyScJrQ93sZApaP+c
	5WIZC2pkTRKHJwAGYkvesnpX0G8FAm4Eh5vfnDloiKF8QwNmS8rbL+Q+rZBmMwoxk3IHKCgQg6JmQ
	z8W2wn04ksLObIzhPWPT2Xnsho+KlauMJjLvf+gYdRFYXrSg3EQglG3zJ6FdG/CXtJVE+ZQ8YzhBi
	oifPnzlhE3M2k1FQQssQyDwxZqmYHzJjAhM36AH4tJd7fDYdRNmk2hJk/TlrvMmbGDC4xvbmpGw4I
	ALwQ/NnWqro2qwyyTAoHnQ9S40MGUrJd/ZSlxodKHV01kYsuA6Ob54wyJ+IS36s59yhzpTuLIXrFo
	Vmm+trGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS8Dw-0000000C6UA-0GUt;
	Thu, 19 Jun 2025 05:54:08 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS81x-0000000C4dK-1hQm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 05:41:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750311705; x=1781847705;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=BHlr7LRRN9DYrjyDb3TU6J/seWACblsMO/aGao9db3E=;
  b=CiFeymlqh1EE/bJRkx0g7I3aXokxH2JJs3hFI161iOMV7xqATG89/5md
   wtU7vKHv3ZZpwy76f6mmJrcOiCa4NpYUNo8tbhkw3eLWVUEEwgXBpfjZS
   MzvefdXPXsnJmbIvxy4d6FCi27OLnVxYBPxSUmYc8nnJ/X+x6di0k2Ezz
   kBflJwuZccozMHxCW8S32buf2w7rnCw9aptGUvDjUXq3cl5vh59HyiCKc
   I33Qhy3K5UvKtTjMKFE29PAZIuSrk0XtDplFwtDxPX2B86egOXCtc6QNA
   JrGrjFcskW70CwuRw2ceFCOG9jaewHyxtvpIng4c2wGEAZ5vRfanBowXJ
   g==;
X-CSE-ConnectionGUID: 5xKPdmtzRfC69txyd0IsWw==
X-CSE-MsgGUID: wGg/TYbdQMuvwh5eOetAIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="63983436"
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; 
   d="scan'208";a="63983436"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 22:41:31 -0700
X-CSE-ConnectionGUID: evHKHUSTSQuqUX6M62h1UQ==
X-CSE-MsgGUID: bssRBDvhRdirWUbkfLKn0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; 
   d="scan'208";a="149991641"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 22:41:29 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 18 Jun 2025 22:41:22 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 18 Jun 2025 22:41:22 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.75) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 18 Jun 2025 22:41:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VdUy0+gL5F+SRDGq57zjkfI89sxyKKkLBg9aL/GH0BQVnnwrzGSnY26yLIOUGVH2MI2hBUAavaoM98kVX/AtCMO7Ut6TWOxW13ZZZhL1SuxY+8ezyX35cafjCidz9QDkS3VhZIunBO42c6cbDdcYGh/brY//vrJFztwgQs64xogUAkI3yPywXx2DI1TlqBpXmq/dax9D4rXPI+cm96WkaF6o7VgQ0g4zBHOyu5QkpAZAiJPhtGD8AafoEG6JSaW7JqnJsXCykYEf8q9ZGkYI4v4rlNBktxEzgy4aSm0oY4y5dmniN5ZKZ1abUH0IwqXzqkCfpXDT/6ijsTM2DAewLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BHlr7LRRN9DYrjyDb3TU6J/seWACblsMO/aGao9db3E=;
 b=mssTaKjsGJqM7XBZ4C1IyvM0pCwmDJzMxFqyz3ofmI28+LVUcg855lp+7hETnk0F+6dnnQgnyhdVnoDJqIqSxy9D1XygoVUMCcOg2MwTB9T6R6v0HyvjXuyBXiig0ZMRcAXZfKkZAoqTL/xh+I5hIwlP44MeR/MHTgsZZ2Kjm6Kh8cuzHIBLBG0I+tEJGs75ptUECC7msNU82ND6nqYTvxRtCgTIioTDtTmy+qFpaJNfF00+1QQhyCslk++ixgQwuXjrOuuewT5kApGpDOJqEBFEjiH7LqSHHJE4YMuTz7wl3yLcUmqb6mhKHJDBTJJ+FZETMipubirVwoCASUu/oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by SA1PR11MB5777.namprd11.prod.outlook.com (2603:10b6:806:23d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.21; Thu, 19 Jun
 2025 05:40:46 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1%4]) with mapi id 15.20.8857.016; Thu, 19 Jun 2025
 05:40:46 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Nicolin Chen <nicolinc@nvidia.com>, "jgg@nvidia.com" <jgg@nvidia.com>
CC: "will@kernel.org" <will@kernel.org>, "robin.murphy@arm.com"
	<robin.murphy@arm.com>, "joro@8bytes.org" <joro@8bytes.org>,
	"praan@google.com" <praan@google.com>, "Liu, Yi L" <yi.l.liu@intel.com>,
	"peterz@infradead.org" <peterz@infradead.org>, "jsnitsel@redhat.com"
	<jsnitsel@redhat.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "iommu@lists.linux.dev"
	<iommu@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "patches@lists.linux.dev"
	<patches@lists.linux.dev>, "baolu.lu@linux.intel.com"
	<baolu.lu@linux.intel.com>
Subject: RE: [PATCH v2 05/14] iommufd: Return EOPNOTSUPP for failures due to
 driver bugs
Thread-Topic: [PATCH v2 05/14] iommufd: Return EOPNOTSUPP for failures due to
 driver bugs
Thread-Index: AQHb3ParbwFhi/sThE2rdztwlzynaLQJ/2jg
Date: Thu, 19 Jun 2025 05:40:46 +0000
Message-ID: <BN9PR11MB52760A799339ED74D09DD54D8C7DA@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <cover.1749882255.git.nicolinc@nvidia.com>
 <623bb6f0e8fdd7b9c5745a2f99f280163f9f1f5a.1749882255.git.nicolinc@nvidia.com>
In-Reply-To: <623bb6f0e8fdd7b9c5745a2f99f280163f9f1f5a.1749882255.git.nicolinc@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|SA1PR11MB5777:EE_
x-ms-office365-filtering-correlation-id: 70b17aab-12cc-438b-1c83-08ddaef3d6d9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?WiLf67U/2d6+fkm8V8LlITkohiE20JPN2jyI5zCZWXyFYhyueBvcIS/Bivsz?=
 =?us-ascii?Q?pMrIKNs9SoknFhku4Oz2jseTNCVCfILvieqVNikAQFPNIAhHaFNIR0asJC7k?=
 =?us-ascii?Q?419AiX5cxmEIkQFZ93eDmVEM2Bt4x5pUYM9q588YRsqYZYYpocaaxKS2B3T+?=
 =?us-ascii?Q?SOSqT9ja8hXGHL/bT8XF4Xpi8QcEJvALdv6LwjjLgxjs44C2VA58/WlRDoc1?=
 =?us-ascii?Q?+iC7NV5mQFpDjs9E0D1Z3nFweVXRyHllU0ZdlEMoKBNQqeEbvU6gDY7QnILj?=
 =?us-ascii?Q?+ee7wIZiwMkWtyAkzrWZDiP9gYRftK+ZBhEgqPhRX5T+oM67QTqa1i7sjq63?=
 =?us-ascii?Q?8PfVcDOggbk60diLRd/SYNB3grpNzeuy3IZatF3CeMg1/PiVHLJy68lXdQ2N?=
 =?us-ascii?Q?6ipijlsZ/f4E9pw/R1JhJhlZhVVf9ZKo5sNs5rfxu0/n0zYVyo+YdjW8Q9Id?=
 =?us-ascii?Q?CSr7mI/8CNdYBzzF4ULQXOB3UYvLWYR3A0htJMn7sqIMcQWTreYZNQEfOEi+?=
 =?us-ascii?Q?C1ZhZX1K0Xlpd73D0zgKC5CJpeZNq1B9LpOg70pW+TFYzie0Z/3pJ7kjjCx1?=
 =?us-ascii?Q?kSCc36SWlXo7URJ8NRmfSeXg3ZnfrgSSfMMh0u5MyjhZ1/1RoCIcv4+zUBHv?=
 =?us-ascii?Q?04PrWACRi2Yb1xwqy28GKopTvjP/XYTKsT1GaMpz1hJaI4wUmpn4J3K5Lrcz?=
 =?us-ascii?Q?1x2u1r8xIuzfJAKWh7d6BFf8BQuQQ22CyT3C+igFMpVs6U7RwDzkvoNNCDOl?=
 =?us-ascii?Q?+6hDVoLFboNNkaGn+xKf10zsMOJHDr0F0NCe0xj1sKMIWoVsqDakT8Tsj0/P?=
 =?us-ascii?Q?XuwhUB3LorNVAWXxAnQHqoOL2/tel0qi68u/lLLeXDUEkQMWIhkdHrqVfY9W?=
 =?us-ascii?Q?4qGwEkgKJGn+j6rrHUrmmEn4IiKfsv0b+IFhI1Pl1Isu4u58hlbkq7VRTiz8?=
 =?us-ascii?Q?tSxG7sRgJCUvK1cb+z48NiIEUpvJ9ljtOdqhIButEZyIcRcFR0GjCI8FZA5u?=
 =?us-ascii?Q?dy866W3DkIbDJoyMFX1MuKbBSmaH7DYqhEwOTadndKHWrLU6Ow9KbG1lMC7Z?=
 =?us-ascii?Q?cfey4qWEaTUIoXfHyOL/fPjuSHkCsVodrQCludK9Trs8mrN+G9NDliI6oycI?=
 =?us-ascii?Q?efdky2UWA9a2BuOGFhfHcCtUNbavTPRbXcqnrpj0D4M5mxB6dZoCSzZjzYgS?=
 =?us-ascii?Q?ZFxtz7K2YQT+/Hwcq8FwuS+OOuV8caEi7k2G2zLHoJuJSjFtrVGKbo2yrsCu?=
 =?us-ascii?Q?vcI398O992+401PwfL3xNMN6GcH4ur9Sz4Mwe7jtKH8OXWpYBCbLIUatHVVU?=
 =?us-ascii?Q?lalaMOYsSvFzf+HLNmFmHFw84cLRa3UH3ShDbKT1aNrbVzpK76zno/6B/8ok?=
 =?us-ascii?Q?b3H+4kkZxr9zPOjSbMDOVVQ+GsJI7VVqemQOT8D+FjXoYtclpGkYoewHWaMa?=
 =?us-ascii?Q?VuQOrAlfaPFKpd3FV9DZmgIcfdwoMNqnjVYwyzZIr7saXWeLHL0hfzhErjxH?=
 =?us-ascii?Q?WLxG77TBF7DcnxY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YX3BnGas/TZSJs6CLOj9KRA1rO0+pGeimAbwaSFIxwrDgP0+gCsjZ5az7TTi?=
 =?us-ascii?Q?p50wxcXyGZ/S18sZ/SDvNcHX9eKTcqV8MvLc16rwVe3TLXwNyiMzt19+DaQu?=
 =?us-ascii?Q?Yxs7oyLeHhrjWisZFyFxYyDOWPF4LtJMzUggIf18C1otcKGuUscFiMJyKFZL?=
 =?us-ascii?Q?L6D9Gp147fN1EKni3bw6IxU5B+4EMdn3gaGzqdzrLhcntnyAVe0TMAbgr65H?=
 =?us-ascii?Q?UYoPwHzOcaboNM7PdKK+zbF4tBaIElNIub8TZuvQcEklvuQaH8i5BIlUBG5P?=
 =?us-ascii?Q?ZMnvMu7Wa5DbXRKd4QPigdnbhhrh2TAD8dECUifOcH3x6pqP8/GgTHIOnbTa?=
 =?us-ascii?Q?u/DvwEfWc+lb3Ef7cWT9ml9umpjS1iMZcCT3RBvPISjOnl0Qe2Cb6HyPA37R?=
 =?us-ascii?Q?hmZNyG5d5UZ2r7f1FFZ/crpgpgoySqMDYsC15YcMy0PfbN0FeOJAMhxz4ePC?=
 =?us-ascii?Q?wvsLikZNAJlTC9Ew7NwFdKlbueFA3W1QkyIiYQXFyEYIi//i1UCnrtY+AcUH?=
 =?us-ascii?Q?DAkuZOfgRL5ZyyePetj1sCAxA4fNiTEeCuO3DW0zNAJVid23gQaSlU8Z0Vcj?=
 =?us-ascii?Q?7QC/O8+YJ2QNUTCtu0gF5pcvign8+bSjyfVQTDOl4GLRrsX3QiP69kAs+5pf?=
 =?us-ascii?Q?FKwbYXQgm7aYbMkHM1Xk4yFo1iqs9yHnVm4DeX7GzQMz6C4QL/6K3DILfGY7?=
 =?us-ascii?Q?F+dyT/G4YTjAYbPWIPj/o2hWlCdzrlImVD2oQRKJ7tTT42IfLYJKTCimcj24?=
 =?us-ascii?Q?mWryyY++/EgBqS1pAcCUE4/hE9UM5ZGsnIYD+2KeiV8HOEerd2ieqxZGyOSc?=
 =?us-ascii?Q?+mtZbOoyw6PCaDdfL9lJE/8ksacD88uE1Y+dzAFsIcHOGC3bN/b5ebz+Sjh8?=
 =?us-ascii?Q?tg5nR0hx1oDx4AOC8Fs4IAuobvS3MKNoiquNtLcc3Y5VQFOrN3m8XcHyO25u?=
 =?us-ascii?Q?0CZ1jgWEHOOMw5SsoSPJYjsfW5FtiOPjxWZPERsp2+hzZtK4wUZRyRbV5LVe?=
 =?us-ascii?Q?s6tZQnw1NmBUFg3g6vwNeFJA9DFhMSLbfaaYsynKW2Ji+9nYbQNXHha4aXYF?=
 =?us-ascii?Q?xZyCUQBuY8rqGc1XR/Y1vt2fsCTiWLjImG1slQv6Wua8O0q3HRsr4pLR149N?=
 =?us-ascii?Q?G5bykI51+x/CjJVZ+d7thHI1ACc/qpTWAYSYOwaAfbN7JE1bnG13U8mfDsdo?=
 =?us-ascii?Q?yTu2i9QPmAHZqiM/PrYqsWj2JyqjmO3E5HIfWmz/F1ywltbN4u5/ocY7SH5k?=
 =?us-ascii?Q?3NXuHDlfCfjK/Mq96qzLDy2xyzBBzfy8B0ZqloWMfTibowaurR2pvFldM5xz?=
 =?us-ascii?Q?cucU9/jXMF3cuHQG/svzV9g4QNZrL3ft5t85si1ifd9jpakepfZ3FrvQX0FP?=
 =?us-ascii?Q?udqt2pbeDmLUcE8j+LA4K8v7e5txhs6Ag6KdJYrEU8pHbxNlyZYpXhykc4Yw?=
 =?us-ascii?Q?qjoEt+G6MnShK6s8ouJq6MHbFtSShiiaHX5xk1F9rP5zBASt2QUduAiWk4cI?=
 =?us-ascii?Q?YXh+Yd6B5JO/OWCP8XeXE6T73SmfWk/rAcY/j37Eyb9oTH+I+g3ju8L3CFoN?=
 =?us-ascii?Q?GVscGd9WMb0EWZa4URF4dEbFCK29K+2j/mDO9vGy?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70b17aab-12cc-438b-1c83-08ddaef3d6d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2025 05:40:46.1197
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XYZFEWTDLIaNgKSrZtMSED+Nv3unUol9ASLHUTW/S9lPZ+8KqpSMAsmweOaNHZdtbP8/dN0eqnmVWil9IpCyaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5777
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_224145_482222_C6679CE0 
X-CRM114-Status: UNSURE (   8.37  )
X-CRM114-Notice: Please train this message.
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

> From: Nicolin Chen <nicolinc@nvidia.com>
> Sent: Saturday, June 14, 2025 2:35 PM
>=20
> It's more accurate to report EOPNOTSUPP when an ioctl failed due to drive=
r
> bug, since there is nothing wrong with the user space side.
>=20
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>

Reviewed-by: Kevin Tian <kevin.tian@intel.com>

