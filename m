Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D136C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 02:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8A83o+hjRDfICM/B80DEN37S/XtCRxLvMaJLIuN5/oY=; b=r0vy4phUjCbwXKGX2dSqGMuN5m
	l7Zjl1h2WyJ/bL2iStHNh9VhpWI715ut7xHmh5E0/iocdYTNnhAgYe6iQKxcu0Wmd0YQBUyOeINAW
	LLupNF9lS51zgJjnKHantqtOdaRv3AyrcdEDbSj0OiYXqP6WLm4TnRJtHXB9RYTOzSVsNjjtPN4Qn
	9F/2tLeOz1CN7EU+TpeHeuu5JCUZSMm0pXeKhHGdIZ1CQcBrKZgSTPxswo7idOLcitTK0pn0QFf+z
	YhCOoBmmbQzJkznkP/tF549mk9qhCv2qNsCQGAS3YUYKuIv7uzvP5owudxo+FGR+S4ZmqVxpdA1ET
	rHCE/YCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFl4I-00000002IDF-07YR;
	Fri, 16 May 2025 02:45:02 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFl2A-00000002HxR-3ZhX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 02:42:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747363371; x=1778899371;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=8A83o+hjRDfICM/B80DEN37S/XtCRxLvMaJLIuN5/oY=;
  b=P+jx5DyuD3uXxLaHsSATboXHKz49sVhyXwMV7+WvsMDaYR0WxIai0Nir
   Sf0WziF2SILaRVyntk3+nHiYy7m6zfQ+PRWdtSmXrh1zlJrh/VfQR6kV8
   jias+5/TDuCe6hbiY7Lrv1pSzv8+g0oGchLcM60MwkLlUeb52/mDvVHQb
   pc0eFq5aqteo3vW33+pW7q8hEoAbCXWM0HOEOglS4Ll0eRZh/JJDrwYi2
   GRk4C/cTtYYOiCm6Kki2oBMXP07D5tRLspuPI3N6uBdsaG7iemE+Z1Itm
   cU2bE2XvUeMqaUleqfp5jjFHAsOrLC1scdRqV/eeUGJBPKoJ+R7Dp+YMF
   A==;
X-CSE-ConnectionGUID: O12PuSgpQ3e3m0gtqsxVww==
X-CSE-MsgGUID: daorRz69Qs6HSXqccF2www==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="36943228"
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="36943228"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 19:42:49 -0700
X-CSE-ConnectionGUID: JD/T4cG+QVCvE/Rfc0ehoA==
X-CSE-MsgGUID: 722wnKmJQhCmOM5Z6Gqf4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="138601213"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 19:42:49 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 15 May 2025 19:42:47 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 15 May 2025 19:42:47 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 15 May 2025 19:42:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fVKfID2o9HxGDTFejsFbohzAo9ux5IyJzsw21lwQccS/OsiwJx+PR/s2uigzE9GiH83JKUURN9QrTjHfqikBlJ3o9px05ZCq4yyT6G2QibuLm4FFzvUOJdGOK+AelceIn/uh+qxoopoLgWpYQJTkWjwstp5MhjovDxdvsedIz4ORceFtI4WiMZ/7KNP/c2W2//hx+HvAwcmVy4jDOSiEJMLDwIgHuhaR81oqXbAPEsjA4Ks40RL4o81EtrJRTZhHWyT+VokqUiwfxr8Oq/0WQYwXoPHmNKPxuiWx5N9ZPZq2z6FwdMoHBVNQr8MTrBe8OPP4eovyzW/kLhhboGl7GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8A83o+hjRDfICM/B80DEN37S/XtCRxLvMaJLIuN5/oY=;
 b=eNnH2UicN4UIgGNPYsGd9IRexPiFshflpqbKzD0VjalFss1E2u1Qz88Wgw+7FOUVCOrj515YaiWxGHFvlrNx0c3McjOa1SzMZ/JFCo2UX79n6XKYSczmOOSIqgcOZrxasSP0kI6tiCswU8qokNqUMhAyaw4nqGOSSb9r8US5/xZ9GVgMOEEnAjbJts1C6BIebmwme1uM88NJkP0hzXdgidxHdiy9kiUeSWTVrmdM1c8lzZg3Xo80w/p9C4ydTaMvVG2wwKVmY4pYb2z9NlavAhIaZ6yFDF4zGkHMbROb1ga0eclsnYf+rlR+b0MPb3hfAOVk7nHYwhhAzog9uK2zhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by IA4PR11MB9011.namprd11.prod.outlook.com (2603:10b6:208:56b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Fri, 16 May
 2025 02:42:32 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1%4]) with mapi id 15.20.8722.031; Fri, 16 May 2025
 02:42:32 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>, Nicolin Chen <nicolinc@nvidia.com>
CC: "corbet@lwn.net" <corbet@lwn.net>, "will@kernel.org" <will@kernel.org>,
	"bagasdotme@gmail.com" <bagasdotme@gmail.com>, "robin.murphy@arm.com"
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
Subject: RE: [PATCH v4 11/23] iommufd/viommu: Add IOMMUFD_CMD_HW_QUEUE_ALLOC
 ioctl
Thread-Topic: [PATCH v4 11/23] iommufd/viommu: Add IOMMUFD_CMD_HW_QUEUE_ALLOC
 ioctl
Thread-Index: AQHbwI8AVK9WzAglbEaPfz4i9w6907PT5XkAgACwUgA=
Date: Fri, 16 May 2025 02:42:32 +0000
Message-ID: <BN9PR11MB52761C3553652A790934129B8C93A@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <cover.1746757630.git.nicolinc@nvidia.com>
 <f52937c027e2fd25d76bc47f4965ba46f82c77c0.1746757630.git.nicolinc@nvidia.com>
 <20250515160620.GJ382960@nvidia.com>
In-Reply-To: <20250515160620.GJ382960@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|IA4PR11MB9011:EE_
x-ms-office365-filtering-correlation-id: 8bdc98ee-df78-41ac-08fa-08dd94234eee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?EciEGSkIvsadC1Xn7Ev3vWNZVaTcCAYl438kJITP6XFqzTNCbfyQEcfsHNfF?=
 =?us-ascii?Q?8zsd3kzPlHPYRh0IW23jLCX/gKsntajb2cNddVQpFDI4lbj5bq/TfQRFnK7c?=
 =?us-ascii?Q?xvQIOVpy8gmkaPRvCGSz+99iea/WeAtMmqDVwvT6vIBil/DJanyJiwlWW3Rp?=
 =?us-ascii?Q?dE/vrYdRfz8QEMpZgCcFlYfSd+j5xWabsM8DWopwakLamFfqCGi0E1OoBkKa?=
 =?us-ascii?Q?4wwy7FLiq9tvjeD/JeOqksPosx2mcm+HoqMO+uoHZ4xIg6mkMHHaGwqFDGEe?=
 =?us-ascii?Q?ueJqk8JYXlwJkvizsDFK5u6hWI4OBPjCp3o9glMwXwpgrEUAv5VWRSfgrdsv?=
 =?us-ascii?Q?Nf4l2Wl8pYsHTFXtK3kQDOUXOzsJ07N3dqrJpS4VwOPN3/zozhc1sCghsarh?=
 =?us-ascii?Q?51eQuVfxzlPD+JcsvvUjrhgN/uvivRf2eOynjSV8kPtOdQ924SVBE6b7a6cj?=
 =?us-ascii?Q?omrpLcRfENOwvDOoATu9AUiodr2er+nPNdTgLEO92SkLcAroSvfUGVc4jSBS?=
 =?us-ascii?Q?iqEgFrgnEavydUAukFz8ZO4Obpz9Kft4KUJYAmPIJDQeqkusRKwGK+hgVo8U?=
 =?us-ascii?Q?0DIKaEcSkzze1hzVcEDyPt+tck7n4ZSgYLNtrm0agPWK18ro9YgdHJbrRObs?=
 =?us-ascii?Q?V34px9+o58GWf02iiunWcOiX9QCtjqaLXdcjO32THseSRWiXShGOJ0eDBC3q?=
 =?us-ascii?Q?070SpqxrKBuZPle95u+jJXtM5OdYsO9duxMcQ7pqOrR8NeDv2iarPVpiaufT?=
 =?us-ascii?Q?z6MDw6yxghiRfmV7n9anX4BLA4EUWVzWNVdLTdGXCuvreIdxe49GJ0Y61hN2?=
 =?us-ascii?Q?wJGIql+VRgglQH5+z485Pv5U4YZ6JUe1zUcBWSVPfbSg+GnvVi+RSVEFZUqU?=
 =?us-ascii?Q?TGvCJWuTGMYBpkhep1Li1CltxpCjhNsYv69Ms5MizvCa4Omydo3MyQrI2T+i?=
 =?us-ascii?Q?wI5lJ3uof9QexYdzR0vhpB8ucClZYDHpQ3fAWBxvRZ0huJm/pgq+AisG9h+D?=
 =?us-ascii?Q?nFP70jgBb+mNVps+RtYUBypI7oL57c8fxVgB9ZmekwfyrCyT+aT+sFZRYzu7?=
 =?us-ascii?Q?PVJ6XMSKVz60qVWNgmCbs+kDf22u6Ib6J2MVaZxd7oep+DDGazlBKt1PwZ1u?=
 =?us-ascii?Q?Sf97GgsTEbr4TXmk+H+44RDGeCH317VsP/7ze0zMBjLhdzS5wJcF/mZ2KW+C?=
 =?us-ascii?Q?QLm48Pz/rMN9BfnG4Cw7y64OfaF7RyICzFrInZU5FjN+bzwl83Iy9jUpBy3S?=
 =?us-ascii?Q?F5Uu1QxmTOkdsMGtMqgEHKhhu31/o+l2Ib+yME5vX04g2Do3L3qT8QsO2NfK?=
 =?us-ascii?Q?+1HUvQaWMbtcLLgdbsbMvxx9czRDxR8a4AYEmTE1alNYgvSGbN6MovfuWY0G?=
 =?us-ascii?Q?A68KYjO980+MeyLF9etFLCjeP6jyAkOU0T/wlLg/EElbtMUM53oEdakJsuA8?=
 =?us-ascii?Q?BZWIx1X5TvwaQHk3KJkcmvcw5+Yu+XXur3fhIU5QhqTSSCk+GXIKeA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?29OypDyqBCaLu52nO+qkof74sA3j43VcCWawCBco1VcKK+ipL541FjQu2iQw?=
 =?us-ascii?Q?bM33CtvjwxR3Btys7dR10LMrFCpfuRDZ46JrX+h1Kf43ARwEHNQtnCCv8Ucr?=
 =?us-ascii?Q?5lJzuPUFFVzob51rkEN5k3HQQqKaYrHEk2w1UvQLeqzmfcVNLK9KFL8bI3jB?=
 =?us-ascii?Q?xzkW/4twiaVVpllSihhS6zwAUITfmefey0804CgiUjerf8SKQNS2XVFgi9eh?=
 =?us-ascii?Q?A9A5GEYeQV+QF/9xO3ZB/RdN6Vh9EKYpyYZG/43HN1yQguusmgTcroAm4oN9?=
 =?us-ascii?Q?E7ycuaslQCvHzJaLJbeNrsflq/LyaTTl2PQlZLDHz11vUpJuF2DYnSJd7YxD?=
 =?us-ascii?Q?DTpbBzr1H8Ab//YkFNTtATPV9XdHZRVlzWO4Iv864YbaUIFdexoe6+K1wQjd?=
 =?us-ascii?Q?98J+sQKLPxVNhhdRcziDEFa7+OD2VtCL2W+hOctOnl8MugZgyj8Lt4S1YsjG?=
 =?us-ascii?Q?PjxL5mLRG57+9wPUKMRTsY3kTo4gsp0WfREdt+rfWToORm99NHt7iwxxmvVO?=
 =?us-ascii?Q?Skq15WHeIjUT4JHQaa4TEE90ovo/LNntdwXMiXiBaktD5pWicEk6idpxAUCr?=
 =?us-ascii?Q?y8JpnhBNxXTYh+aQwstvhDO98nPA1y50GD5xs5hDZxleQnePOeqDltBR8Clj?=
 =?us-ascii?Q?ZPKdY3WclhqlE9mEV1KOrAIN3Xc9Pk/9LZMpjfCOGy+W3zZ66xzC5VMcXO+9?=
 =?us-ascii?Q?bhiA4ns1xL7wHLJ5wMIHA6F65kk7Aqk5qViN6FgE0Ulvj2/g22Th3w30xixg?=
 =?us-ascii?Q?PDbqOnl1/MXm+IKAcixc9fpCI3TR87W1hMOLNqIif1pLnWFDeQQ+i1xJcLHe?=
 =?us-ascii?Q?ieTgQh9V9+12huDR09CrKhQiBS4183HCLUGlk3c3B6IBwuaxmoj0Sy8UJlge?=
 =?us-ascii?Q?X1hpAzf3mbVVUL7n08t/H5O4/uyvooMw2x7FqHHMJQPLdkIFIyLBOrm369RM?=
 =?us-ascii?Q?r47mUa78uCarFuocY0/DU+5lWHOjHLFC6fnflQSWAvzay5pYbEpUYpxLv/D7?=
 =?us-ascii?Q?e9tbMSDNeetsfyonjrjODLA+RzDJUUBWPsmURpQ4eLsCQueJN0lrGMI8tCbc?=
 =?us-ascii?Q?vQ/eNuosbhUXujbexI8w/PB2yiDyd51XP/RDKpBgD3bmnSM2SvzMkuS3zpxl?=
 =?us-ascii?Q?pFIWH4rK0Rb4597JoQgi2nU1adPd7GNeodkUc/5QwqYo8frwmCKlT6gNYsWq?=
 =?us-ascii?Q?t3aXgY2cuosIcHXVf2LL85SBdvY3Ml95AuGXlWEXxsQcVgZyuEE9F3ENDBtF?=
 =?us-ascii?Q?QfJpTnxdAUHH9buG5uKpup0ymJledXoeUBLZd8IaHsMATNn92YWKwY6AY/p/?=
 =?us-ascii?Q?sV9PTCmfNf7jJ0MG8Wck881TfBnsyhBwsoFPZ/E/C8QMtunt0mapaISUiM7X?=
 =?us-ascii?Q?7rT+xPltyoPCCx1HwFXOM+DUj1mPYYuPOgvJvHHp6OnHUx5DSXinijVv7nSR?=
 =?us-ascii?Q?o0YN5XB1J1BwEBooivcWlcXxgqUCLj00XyPkvYbs1NCqZF26XpYiScyN45rT?=
 =?us-ascii?Q?ir7xKtiFr5NLb1cN/+pFD+rkusY/gbrr5t33+DkKJDdS7yxwqYlOuNWx2y4A?=
 =?us-ascii?Q?R1FNY43STS8H1+HU33H1rKlPep0NIifZOfvTYsY9?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bdc98ee-df78-41ac-08fa-08dd94234eee
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2025 02:42:32.4992
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PWfAtciJEAn2pNHj97wgJUnc4PN4AdfkmtzyrkIqNGJ8bjITjo+AwN5BgWt+6UU92j5JDhgj6M3OsE8iyhYuIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9011
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_194250_929528_84CFBCCF 
X-CRM114-Status: UNSURE (   8.66  )
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

> From: Jason Gunthorpe <jgg@nvidia.com>
> Sent: Friday, May 16, 2025 12:06 AM
>=20
> Do we have way to make the pinning optional?
>=20
> As I understand AMD's system the iommu HW itself translates the
> base_addr through the S2 page table automatically, so it doesn't need
> pinned memory and physical addresses but just the IOVA.
>=20

Though using IOVA could eliminate pinning conceptually, implementation
wise an IOMMU may not tolerate translation errors in its access to guest
queues with assumption that S2 is pinned.

@Vasant, can you help confirm?

