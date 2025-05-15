Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69F19C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 05:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hW4+QmB/FdzE51EtiGIGMJEx8/iRPymJsEtJ3s5FCIA=; b=PcWPeeBjjf8huyJaOELldfxkza
	dlCEbD6LTIf6e0o/DQIIEsr4rxKlBfHWDbOfaMgil1x7RUvGXwSdzfsbHPdHFbrY7LzQMLmHl8PIQ
	Bs7nDDp23k8j1SSZBAKwS9gCOgTjTs5d+0irPG6EcEQmG+SED99EZtcHRe1MoiUX9JhstpoNONbSz
	jxEc5I+NLDINOQUDIsUi2FcOuE6oistfbR+wIBCczW5ioxjbEktVj/cIqC05U4rMEVbkRwVLoBWnn
	wMMqP6dpAGvoLpSQtiJZfTpQzVNaU9pJJzay8wqxTvRqRb9pLZycP5PSJhC3A6Ju2OHss0PDC46UC
	IKG2/R/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFRRU-0000000H5Sq-0vqw;
	Thu, 15 May 2025 05:47:40 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFROi-0000000H4hD-3gRg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 05:44:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747287889; x=1778823889;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=hW4+QmB/FdzE51EtiGIGMJEx8/iRPymJsEtJ3s5FCIA=;
  b=QnktsN0BoskGNbyhpOi6Zl0jLlfsz+g5YrSqFJfR3aCasQ2GmVFJyPP9
   Gv1rqZI8IdpwtfgxKIH3OQGsTIq+ah0ltpOrpjjJr7F5pWiyBfNOhkf/i
   limL4P/xRnYWRHmmF8D78DrwdQA7kdV0sYzCpJCMnQIz1xAysGZx5xhTv
   Ifi5BEWADGwqDewYsOwlvWxOLhOUroDatwY0iT5mlG2IG2Mi4DYVnimOO
   SjXQ6FUE7dIZnaZgfNSEVmcXLdafjeQEdaFca9ircB7jRUBSozAl+W4Og
   ACnZK09aRYr2YyJBkq6v+l4s0ofZyhveT4HOKiYrjTballm2xxetdP2J7
   w==;
X-CSE-ConnectionGUID: tKJTLA4ITbmWC2tVBC2c2w==
X-CSE-MsgGUID: 54LsXYghSGi6gOFCPEoBSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="71718747"
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; 
   d="scan'208";a="71718747"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 22:44:49 -0700
X-CSE-ConnectionGUID: rd6p6ASfS0WIbySy66bcxw==
X-CSE-MsgGUID: ITPx35oFSDGp8w8gnBORdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; 
   d="scan'208";a="138313630"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 22:44:47 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 14 May 2025 22:44:47 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 14 May 2025 22:44:47 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 14 May 2025 22:44:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BF6MektvW9IZRQ7xT85dNNtV6pzqIZx2memFQHi1GLbV6m+OXxbMYFqm1VOpfoNhIypKw9euHWehTdDsriBjCOW1idhMzQfH2bSnwe9+7MMTTOCUcPaxXRTGgKnXAmohmGmxhkAZU+ZdeeGvqb57+QKWAAm2kM5/JhpahtYhuFTsLpCK/pQSOk0y0gvDNxwfI8wZREM8f3GPWmeVRSEPpI8fRdOIP4b6EyPxiRLVrn83o9A6VukFYfX84NZ/Q7x2bEbE/7cnI0V7XTLLgA/Ftvc4gDFP5nfJbP2mNVz0kcbL6K2yh/J/qcgt7ENoUCMyGR2x9XavJAjFBQY1cRAmfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hW4+QmB/FdzE51EtiGIGMJEx8/iRPymJsEtJ3s5FCIA=;
 b=jutAPdBm07Rfr2LffMjxwniLqc+q10d4OMuUHP/lLfMukVF3AY5xmUD2cn6KcrFMl24uzREm7DawGa6EoYZ2CqikeGXmtxZZTL98yI07RlSk4PN0X0A97oNv3rxytt7gt2B/dkUMstxmXJ2xaD/FCw9jgrvx/DkCPhayMi2CrwAT+bPtyWO+rd+zt8U4EH0ihNPjpYO5BfeaqY4KEd9DYhIf89lIEDRtZaQzFISHrVv7ziQFUKm88ivWM1VHu/bjVs06eoR0lOjeyZfCGxkW8Oecu3l85VqVQXfT5nPdFUVeFMSFhlYgCqVjFClUqF6KhgWjTeTKiNAfdNZVabxYzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by MW4PR11MB5872.namprd11.prod.outlook.com (2603:10b6:303:169::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.34; Thu, 15 May
 2025 05:44:16 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1%4]) with mapi id 15.20.8722.031; Thu, 15 May 2025
 05:44:16 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Nicolin Chen <nicolinc@nvidia.com>, "jgg@nvidia.com" <jgg@nvidia.com>,
	"corbet@lwn.net" <corbet@lwn.net>, "will@kernel.org" <will@kernel.org>
CC: "bagasdotme@gmail.com" <bagasdotme@gmail.com>, "robin.murphy@arm.com"
	<robin.murphy@arm.com>, "joro@8bytes.org" <joro@8bytes.org>,
	"thierry.reding@gmail.com" <thierry.reding@gmail.com>, "vdumpa@nvidia.com"
	<vdumpa@nvidia.com>, "jonathanh@nvidia.com" <jonathanh@nvidia.com>,
	"shuah@kernel.org" <shuah@kernel.org>, "jsnitsel@redhat.com"
	<jsnitsel@redhat.com>, "nathan@kernel.org" <nathan@kernel.org>,
	"peterz@infradead.org" <peterz@infradead.org>, "Liu, Yi L"
	<yi.l.liu@intel.com>, "mshavit@google.com" <mshavit@google.com>,
	"praan@google.com" <praan@google.com>, "zhangzekun11@huawei.com"
	<zhangzekun11@huawei.com>, "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-tegra@vger.kernel.org"
	<linux-tegra@vger.kernel.org>, "linux-kselftest@vger.kernel.org"
	<linux-kselftest@vger.kernel.org>, "patches@lists.linux.dev"
	<patches@lists.linux.dev>, "mochs@nvidia.com" <mochs@nvidia.com>,
	"alok.a.tiwari@oracle.com" <alok.a.tiwari@oracle.com>, "vasant.hegde@amd.com"
	<vasant.hegde@amd.com>
Subject: RE: [PATCH v4 02/23] iommu: Pass in a driver-level user data
 structure to viommu_alloc op
Thread-Topic: [PATCH v4 02/23] iommu: Pass in a driver-level user data
 structure to viommu_alloc op
Thread-Index: AQHbwI710TteQ0ueEUinJnTs4ZjMPbPTN5Sw
Date: Thu, 15 May 2025 05:44:16 +0000
Message-ID: <BN9PR11MB5276148353B2DF10A3ECFF668C90A@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <cover.1746757630.git.nicolinc@nvidia.com>
 <488ee62b522dbb0eef8f02aa67386dd50ea2dc37.1746757630.git.nicolinc@nvidia.com>
In-Reply-To: <488ee62b522dbb0eef8f02aa67386dd50ea2dc37.1746757630.git.nicolinc@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|MW4PR11MB5872:EE_
x-ms-office365-filtering-correlation-id: eb760333-7f51-4be1-b6b7-08dd937387b4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?JOzOax3kJxErhmgCUw8g4+/knkL1IeCpj5rUgSOryCvhy7AWA/DQ2NNv115s?=
 =?us-ascii?Q?0Nt0mNHz3IrwyPjQH8yZYrzmt8sovjjgoiVUpHCNI+TF+1oZ+RJnOhYqmmMM?=
 =?us-ascii?Q?RGa7bj6aTorlaMZs7SwqrogKFtIJ5ZrvWuAWRaMwq3qqAjP8VAcOsb85xVhX?=
 =?us-ascii?Q?ebj6HLT2zS78vKbH/TbAxkSi/r0xRAXh/S9JsZD6gpX9N499yQXGiO+dGDg4?=
 =?us-ascii?Q?9SaMKok2J3D+8j41cAkb86T2jpuzRRxIxJD4a7LB/Yq6TjK7JBpA9wkGbsMH?=
 =?us-ascii?Q?rIYb9N5BkLgWmUSkHiHshihSafnz6CAavV3MFSC9Y5HVdu5FDhBWiV+7rYts?=
 =?us-ascii?Q?W7meh64xDZd1Gt0Iffv8gU3g2qRgubplMJQdgNIWgtp2onkIwlUYxS7ripUw?=
 =?us-ascii?Q?8nCMMNmjnlttpZlGpqNuWxM/Dmv5ttnv3RJsOTYZcwpk+7GYNDJqazpriyyZ?=
 =?us-ascii?Q?qHKFpeDCeSXl18W+qp+CoREvZmnRkIRHSOq2sz06XqfeD57dDmhaQawobIWr?=
 =?us-ascii?Q?19CPogEpBuXa6crbbE+Kk63kmvgtFGCbjoLAoWGuMYkx0wsoeAFXFisubdGb?=
 =?us-ascii?Q?I84zqgexoKvd8J+k3KaxmYIihrsjw8JjEgexFV43BMfR6q32WpIA8d8GGeCa?=
 =?us-ascii?Q?6wWIEfgbgKlayAunxg5e3aJ08RG0tkpJbp8Wn8egtLLXnWC6E0YOONJNxS9C?=
 =?us-ascii?Q?Mftw3cax8vXmpl8cduX0jKcoueSuXdAreBboAtJKSXyRik806fEoUDWmr2AK?=
 =?us-ascii?Q?vf6q0sVsbTlMi/IdvRwztM0tGpb9FuZC+NpregHUv0L1K16En09JqqORSdnC?=
 =?us-ascii?Q?eP44JCkJXHHMX9+jEi7VdtGacWTMSqEZB3+Y/dnHWFs3+cGo0IQzn+wnx6TU?=
 =?us-ascii?Q?AbYdQqFApSr4bU+o829c+Cwhf4cKFMJ+XgHQbcGEqmCHHAIxH9aWr6QCje/k?=
 =?us-ascii?Q?bU2gK0E+A9Zoc1nS7v9+Oyz2p3qcvM79lVypteAKfaMGx33ULaPKqvusAuyP?=
 =?us-ascii?Q?WPgNlMKZ1lDyBwO8QrcAdsiNrLGho3tleiVtT3LqwC8ic0cwh1Ewa8NMVF8S?=
 =?us-ascii?Q?gq3bCv8BbetE/3BhvVigbUO+J5FvF/kpK+R+C0BiUjHVjAlRdMhSPkW1Kxin?=
 =?us-ascii?Q?0BJtgWjgb5CDPBlEOF2xfu6MHdqAPu5TEcdNv+g7dGjf7EGgs4y+E9ioCwET?=
 =?us-ascii?Q?/u+LmvDuCr50GRSjG5ECsjOci1/57V/nsIPOgo+UO+K3jPdrPKcRncLmIglj?=
 =?us-ascii?Q?r+001z0VfhtgSXuw2pHcEzUkGNdokyfl1ucvz+7twCuENjKZRGR/F33jgwf5?=
 =?us-ascii?Q?CzpJFsK88fKEKoMMFCz+5yXSG0rUM6e18P9ue4ddiCbdHu1xlYG8s8TLuBEo?=
 =?us-ascii?Q?EUIvro57US/0L1QYsgH6DRA5PIIDmD1c1vqNLY7IcD0K5O+uLqGf5GJHdDdH?=
 =?us-ascii?Q?7+32kL8LMNzD+snkVat76sIczX/TFLAtl0gVwjhWGdiFfpcDFnOOCYQugKil?=
 =?us-ascii?Q?KJCSNh1BwRk8YYI=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?vsIObtq36vaRDpwRYIb8a4qHqEbmDFcAB8JF8+Rs1C34DYGtry7wYMGSlOmi?=
 =?us-ascii?Q?g+5+o9CXzrDaH5QQn/pRv1HYTAN9xPE+SQj8W3fc1Ks5uO9x7oKq2kk0Jlp3?=
 =?us-ascii?Q?F8j2YqNZzT4DYSO1qTY73CeVf5n1JBEVgmaCPEAh9Ji3nZt36qFLf7y7Frpn?=
 =?us-ascii?Q?t7E+VArP4GyTr5gJ3l5fBlNYpKv9Jy15HSKjl6FwQldO4IEKqTjz2JapbPDo?=
 =?us-ascii?Q?S9Gdo5o8kwSGj1O9fOxbSRFC8FZzE5w6lmBIkue6hV76SjH1/ZJWHEI+YrE4?=
 =?us-ascii?Q?bF2zZzc3tp8cgn0z0WRVhG9Dfp1tQestsITsoIZBRbXsSP92QGYjJM6m25cu?=
 =?us-ascii?Q?4tZOldTumv6dlZDA5InT5nt3irR50XP8l1bkiOFXYxNj8/hUjPPpr8g+FuLN?=
 =?us-ascii?Q?XVnnZNnlRUQWnHXDXgDS/0nLn48nkNBEOc/GRSS7rSKg31Aj1ypFFtL/KYHp?=
 =?us-ascii?Q?8Qt1cV0Y8EfmxLc9xCWm9M99Xzg/g3HPpr+yw616q59q5JkW7V2zRKvRdB/R?=
 =?us-ascii?Q?BFzo4BvdYp7Ve01w8V32by6STdJDq++s11pfLq97eGZTxEdrUu/GrmUINDA0?=
 =?us-ascii?Q?ljcPnoPTEOnKUJ20ky6sQ+iK9AT8Df363geGIeWlTT/Bf/ExJQIILKSzhEbR?=
 =?us-ascii?Q?eu1bzjiRsTY7Tt91fwDC9stXAU2bg5EkXRZXa9CMq5aquAjkOurv+1RZwKJu?=
 =?us-ascii?Q?wo14bFMAjWY5B7+AD7HD92LV3+jg5GR5ElqVkOsBr5fWYJaru4tii0EKA0Dy?=
 =?us-ascii?Q?OeBIw3bFPMynq6QSqcOLppocnOiseCWKKbX3P52s5ID2AcAeCd7WhGR5Kc2V?=
 =?us-ascii?Q?pC4CHgtcfE/6Zr6cyYT9Gerpry6gzRcQ8Qe4PIVeQ4ta0ohznUp92xjCGeXY?=
 =?us-ascii?Q?8kY37wkmXEasMkoUKrEWvMeemgVU88B5t3csROjIKDs86qAgSAw7z9g5Um1k?=
 =?us-ascii?Q?NtFtuYFPxq/xFe8NZU9QmdxBcdx8kIYvOeN6tA6ivyGlzTNtJuch1+5Dxcdp?=
 =?us-ascii?Q?W7F6zjg8qCE58WHbDCdeJ2s89zB9gPRYeontjXvSt9br7vayIOwQqt3S+ofa?=
 =?us-ascii?Q?0k84FvBgRbpzknO8dMM0mNIGrIXZKwu53QX4ZUdM2gvwg1jSAUZMCHMtvKgQ?=
 =?us-ascii?Q?tr8vmtzNaUtcUGyExSYXBNlNbE2QQQoG+GuRq2wbo52H9Ix7HzO4VdjMTQ3G?=
 =?us-ascii?Q?RCNQixFviTcrBhL86cE03RCuRg+9DUYxXsCgCblQvy47VLD0e5W4T46a3Bjt?=
 =?us-ascii?Q?+YyfgrZAZJaHBnjcAmeUd6C4v0EXr+b0KlldmsDrmgO7LPT81jm2HNj7Ugmq?=
 =?us-ascii?Q?QYpZ3CPqeUyPVPJ6LgEHYn611r1r2en5G03qML739XgTjQIGKVLHKmzV3T+j?=
 =?us-ascii?Q?bGJQ1uvBVeRRz6kJdf38wdoJmLiPEaUiZRBgtaBcTsSal3weQee/KCokp8r2?=
 =?us-ascii?Q?U6VJBVdtzyDzx2lx1dlhmEKo7bYn2SqM4ozpBRdbyBAdON1vmjyyQJXyJ0jn?=
 =?us-ascii?Q?rvo+WrFF8e5OkGyX1hi3X/4YMu4OrucrQjDIfxspEpH/0XCFfwjZLjOQUkkz?=
 =?us-ascii?Q?/Hyx/oakVS0M3D+M4//qYbTuLMi9u5QO8q5lVaZh?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb760333-7f51-4be1-b6b7-08dd937387b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2025 05:44:16.3133
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hcLAlSJHFMc0d1lt2rvKV5iCtPQ2GSPDjpxZ8PHXeQUzmJoxlfU+lEfLcufIy07FYdDt/pZ0DDeDK9vrS+1atw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5872
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_224448_962606_8187F589 
X-CRM114-Status: GOOD (  11.42  )
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
> Sent: Friday, May 9, 2025 11:02 AM
>=20
> The new type of vIOMMU for tegra241-cmdqv allows user space VM to use
> one
> of its virtual command queue HW resources exclusively. This requires user
> space to mmap the corresponding MMIO page from kernel space for direct
> HW
> control.
>=20
> To forward the mmap info (offset and length), iommufd should add a driver
> specific data structure to the IOMMUFD_CMD_VIOMMU_ALLOC ioctl, for
> driver
> to output the info during the allocation back to user space.
>=20
> Similar to the existing ioctls and their IOMMU handlers, add a user_data
> to viommu_alloc op to bridge between iommufd and drivers.
>=20
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
> Reviewed-by: Pranjal Shrivastava <praan@google.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>

Reviewed-by: Kevin Tian <kevin.tian@intel.com>

