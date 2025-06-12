Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 851DEC71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 09:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zlEgwXyxoygtUCwfQ0hFhOoGMi1D7ELYGqRckIFNfTc=; b=IB3y6dvJol1lGr2c8Eknj93eCd
	kkpk5ic9qIM/+4r4FqqZ20G9+Kn0LBmi+xVzqgz04cqtA+y9jk+dS6YP3a+tvJfer0T6K4TnbnxI3
	7956Up0pc+PJ/GlCt68w8mLdqjLCA2dKeiFNesK3eG4RKTOJDwVNz9xt1io5hT8j9iK8lOxL5up2M
	MRY93DCJbbJr4tjRNo+eaPCxn/UMe6ymvQ1KkG+tE0NkMo2BI+8EaQTFy9OaYhql8/Yi4fhAx09Cu
	RZ8F2+9lUKvW78VEt58HYCIVJD8U6YbdfuSUgAZJsMFR4peY/MVk28Jwf7UnNkko+jS233dzMIspE
	e5znC9KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPeQZ-0000000Cq2O-4828;
	Thu, 12 Jun 2025 09:40:55 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPdDJ-0000000CboN-3JYL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 08:23:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749716590; x=1781252590;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=zlEgwXyxoygtUCwfQ0hFhOoGMi1D7ELYGqRckIFNfTc=;
  b=ORSscUJGUx9/iocFYL1vUpZ59u/q5j7+5HxMSIqLxzQD2Rw0IIi0FpIT
   7hNnDPJ+FQTL9r9qiFGdb1rUYW5LS2g64TaCgvoo1pdJrgET0/bnU79/o
   t0Lpc98KhS4CP7SGf7ofLhMrIgNC5Lie6/1YeufUDGw5e+krHm4HPQMP4
   OdMgZUDTU9ACkcrnY9lOmDUGGHr8UPQOkDJRrwfRgVypxAAvXyxttPlDM
   9VOfjWjlY4hZO1kRiTBtaMDE977Tsi154oZ8JjSzbFMXucrnTljkGq+2e
   DeBJi0chJGeZofZJHK8TIhqzLUUUMxWWQrNTUzSjYpGnpNoS8LerwNJTx
   w==;
X-CSE-ConnectionGUID: kvgS+sNBScOVpcrHHKqffA==
X-CSE-MsgGUID: zx/VgSfbT+6RDgFiWqGMBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="51754630"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; 
   d="scan'208";a="51754630"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 01:23:09 -0700
X-CSE-ConnectionGUID: piRmxoebQz24WauOP5I8vQ==
X-CSE-MsgGUID: T9xrOcxbRgOCLh9PpL5YJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; 
   d="scan'208";a="147337313"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 01:23:08 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 01:23:07 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 12 Jun 2025 01:23:07 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.59) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 01:23:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hHMd2tj/ajB+0eKgz6y+F9rfFFn0XbF3EKxGA4hNxC9RdrnKj+6s6WjcAtPuybHcs0ZOsSXcDdlClOsNyK/Xji5GoFPEhcIG3qf3P4aSAoezPZ1LNC3+qxPFzV/T6zB+tjoUdnKQNsqyXC4ANI+fk0+iQ92ZcvCTMLoqfeC9Yf6xEjNvUVMGzcx1TtFvLryNbVk/xmhhzLyU4Vyo3T9FP8R+7BH772Uq0RvCV4SlAQdLzIplW25m0w0Bujdu7FuAcuoO2Vda8u39GFSMe9OWtFbF7BLhTbfirZ4jC7FEWtizs5JFMPw3NbJwvZAHu97SJGy7OADpE28NvaNKdLmO6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zlEgwXyxoygtUCwfQ0hFhOoGMi1D7ELYGqRckIFNfTc=;
 b=bxp4UanJziheyYg9PaSzS0No23AtQwQLywJXWDfjnJ3dYh1TTG7iVNTYA10fV5bpHjtL9Wu73gPuLtSL1KnPLcRE6HhJcxGzu96Z5ktxZj8ddcLgd8PG4bDgmQ2BWtaVDJqRAvv2KBFvOceTMSEeWAhLAp0KKq3FJR5yn5eHaD6opaJl5HVZDoG5EQsomEeligZX/MZcrQ/cXN5ePCvgj1dG0Zb/Ao0pKGBy7Q1yhh2AX55ol3ibbXfi18/O/Ft3DaMy3K65p4lMT03Z3yPX4f3mku5G8gRbaw48w72W6yEa20sPFQlRNJ0WBtaqpG6Vyr+drUCw06Nba59Q+pzr3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by MW3PR11MB4572.namprd11.prod.outlook.com (2603:10b6:303:5e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Thu, 12 Jun
 2025 08:22:50 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1%4]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 08:22:50 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Nicolin Chen <nicolinc@nvidia.com>, Baolu Lu <baolu.lu@linux.intel.com>
CC: "jgg@nvidia.com" <jgg@nvidia.com>, "will@kernel.org" <will@kernel.org>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>, "joro@8bytes.org"
	<joro@8bytes.org>, "ddutile@redhat.com" <ddutile@redhat.com>, "Liu, Yi L"
	<yi.l.liu@intel.com>, "peterz@infradead.org" <peterz@infradead.org>,
	"jsnitsel@redhat.com" <jsnitsel@redhat.com>, "praan@google.com"
	<praan@google.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "iommu@lists.linux.dev"
	<iommu@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "patches@lists.linux.dev"
	<patches@lists.linux.dev>
Subject: RE: [PATCH v1 08/12] iommufd/viommu: Replace ops->viommu_alloc with
 ops->viommu_init
Thread-Topic: [PATCH v1 08/12] iommufd/viommu: Replace ops->viommu_alloc with
 ops->viommu_init
Thread-Index: AQHb2WH2lkB5oIzfD0a5Kyd07u2lG7P75amAgAAG9ACAA0ZacA==
Date: Thu, 12 Jun 2025 08:22:49 +0000
Message-ID: <BN9PR11MB5276CC4AFEA8DFE315BD51C08C74A@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <cover.1749488870.git.nicolinc@nvidia.com>
 <5586990446e4c97827b5a195622ec0f8cf9d2d67.1749488870.git.nicolinc@nvidia.com>
 <663c7eee-5a3a-48e5-8bed-8abad62f3484@linux.intel.com>
 <aEfOjnj7xGPbfYD4@nvidia.com>
In-Reply-To: <aEfOjnj7xGPbfYD4@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|MW3PR11MB4572:EE_
x-ms-office365-filtering-correlation-id: 42274400-4c58-44bc-02b8-08dda98a51e1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?Bchn8DfbZ/jq5tdGpbfhLCYBO8EUORmdVZ2KlmpNrnKKM5vCpS9kIiYQd8xx?=
 =?us-ascii?Q?qPUIFpPIlUOVzjBfhJYOId3NjJJT5ln6T3xJWcsMwJcjTUwNlXMy+kjFAfvq?=
 =?us-ascii?Q?WZkitR3QexzochmLBmm/mWoSXp74sTKlZQVc8G9qr2SO5HkQUkbCJtWLzM6e?=
 =?us-ascii?Q?WkxAaIvm7NosrwdcaNRGIvNL10vbfW5BaCPNT7FWmqnPNyHtHTTnHus8dM0K?=
 =?us-ascii?Q?kqXmcZ9zQ2HQZmhUQLkPX4Sy8Gfp3FasylwfgNZqfnPmnlTQM2icWS9cda7G?=
 =?us-ascii?Q?dn2goR+epf0BhHAG42X17ZlW+K7TbujH2y5CqzamWgXQ0JRKfEp6RzyBn5i+?=
 =?us-ascii?Q?Ygrx2oTCCZo5JgNmRnS2HS7r8YPr6eUO6QcUfAGqdilQTPSRx/HNkMy35TpY?=
 =?us-ascii?Q?XCeWDnKt1BlVE49HQSE9wg3wFy9d7rtYcGYfVhsIXOERT4pnIRkO5G1Nh1WH?=
 =?us-ascii?Q?NFuAw3U/Eom+jS7VdZbGMuenFA3HyxuM4ikEKK18Fe54PCwk54XGG8xP4Dax?=
 =?us-ascii?Q?nP6+XGgN8+Z1m6ONHmoB3DNgWIbEOCWeU0OlFnkMinloqTuzUExHCTmBLjOT?=
 =?us-ascii?Q?7R663uuB1dlLhj9M0lXQknf0atjovCVl+xWu4CJ25QrCS5mXVJeJgICNSO9f?=
 =?us-ascii?Q?femaNeB2cRgb+nPBaJBBUuAKN7TD9+qns1DOe2esyMzRi9Wf9w5hiw0UDEId?=
 =?us-ascii?Q?sAVmtlyYvMsuzRCIGCb5RJ+uO/xfAAIWtuyxJH8fvbDQ49hlB3ewXzWe70yG?=
 =?us-ascii?Q?RBn+dBPYgxWeyU4QW1AZxL+Cf2VvWhU9xiX5+FXXjT788mXZxWZh27bTvwou?=
 =?us-ascii?Q?iOic51KgwQwY7es8xs8QdbSKgCO87WVzNOII8WH0rU3EsMN/H6aA02rxJ7Hc?=
 =?us-ascii?Q?QKEPzBcy3cP8Mx49OdZv5ZVr3Qjz4rVPFqu4u5hbOH1g2Km7h6S6+E6EZbPU?=
 =?us-ascii?Q?MGLggkJ/asy32qnZtKfkJ+oMc19tm8J1RmbOtZw0vPgJpeGwIQypnMQod9mt?=
 =?us-ascii?Q?9ufWKB9cUXc7wB2xdqJgtwrUaI0AO4UlzcBpil1JHG0JK6pnGJ9u/t8gS+3r?=
 =?us-ascii?Q?0As/an1qL7E0CvlQQQDCcMBIOS9FYxhxySr2AAARQkGbVMnWgCiqiZY/brBS?=
 =?us-ascii?Q?53Gdd4rgKJmcEOnIOosQ+R/j7aL0Pgn8DTs7WXobjnFmiMdJj/Em1IHmVx4x?=
 =?us-ascii?Q?21Yzt76K/i3XvpaRolbxms1Ue35mMPzPc+MOE7YbGpEODkS0zFkEeLkPbvoH?=
 =?us-ascii?Q?3S0y4mhEaZJfuIIkqc4PskV7+10AnVW4k3tJdVZ/LGdc4Om6X385ddDenNL1?=
 =?us-ascii?Q?UfG8vM2NAXxrhtlAK2L1mEaSyB2b/kNI6rtHLdpCpvzAaI68UKC8h5+TKfsG?=
 =?us-ascii?Q?IVRJS1VFbicim/pQ/hqD0PKhH0P/nrNNLtMairpP/oh99M+i+0GrVjKC6S2O?=
 =?us-ascii?Q?nxMB3A2msoPZWeUs5J1SbL/LJ+GiQJKGfqdsukZvPQkyWxHo1hTfWg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ho8fbzhMMHQ4gdPHyNTRC0B8VKE1fBMs8z5tH9yTF44rpcsminAF0+Ujgy6O?=
 =?us-ascii?Q?05aXtMbWKDdI+kibWqj8cyIPxZlGRA7/H0qrCSUjQ3YJTdQjCDS8TALbLIG0?=
 =?us-ascii?Q?CintjhVDtBaWonT2wOBCSMAf3HAIhba/2//HhlHhEuoBmU4I1dHeYg+57+bO?=
 =?us-ascii?Q?3qm85otcKt3hCP1dP71UIJQFdzBnPDZKxdZlX5KQIsMk9Y9IvTk6/qalU07+?=
 =?us-ascii?Q?kwjAay23Wl1/ypJ3cUulvdcKqg5LJl5TvI0U8BJvp8l33f9FiFKqO/FVYxVA?=
 =?us-ascii?Q?cZJZxQtXhUdat5x8GkLExzYBCvNEc03YSnlMTQkcdaIu8GGFsdsvufBcyfFC?=
 =?us-ascii?Q?wgtdwQlpHp0ftf+5JoSxarfBUpXPftkjWnsJTpcsxR8Q0ysD0iGGnFr7D8jW?=
 =?us-ascii?Q?H0WJO0j9NkloMzhwA4mLy1IgyGr+UvnrfgiYhlP0Z2us+LrYtWUxZk0M6N0V?=
 =?us-ascii?Q?VMNsehSUL5wpkzZ8cL7deIV9dw8uoiO6ciG79faSLpx4TdpvP3NP3BhGXk4c?=
 =?us-ascii?Q?f9Se290R9pUIP+km9leg0elWL5xn8LdUzy3lFSoY1YvzUtVUfavjqGR1xCmS?=
 =?us-ascii?Q?4Bub1YrS21BwYEAMfdvJLwBxazo6FnLf4JKOUQj0bZdBy6PYep+GonsBpurY?=
 =?us-ascii?Q?uu4Or3sAtyRp37abONlY5FV3dpUJMzCrnjprpUNNJeFf9yemzaZHIfkKCnAB?=
 =?us-ascii?Q?sOjm6EyDeCJHJJoQl2ZZ5uAdFNJ0j3fXGTYBHMAtJPzpJrSGSIHUrd60ErpQ?=
 =?us-ascii?Q?5kb/z6pAlRfjnJwj0FhRM7BeqSNpNxClzSOjcFhX2nq/CvVLYaKREiVKfH4j?=
 =?us-ascii?Q?J9EYHxt//dP0+RuEoZxewpljFD33uSjgElk/qnOnVu2Xddh5nQnvEJHDhLBN?=
 =?us-ascii?Q?csG44Aw9d53ZesR2ir6cO4s28Bs6gsJ3fbOtBXBlspD2kTprAdkiYBy3c7Pl?=
 =?us-ascii?Q?Cr///624Lxpqtvdr9DMJ+ZkTvksGiM0GSUElAWxzWZszBLJ840CeMYwOM04P?=
 =?us-ascii?Q?hoAyZbLQqdRz0wu0EbeVvIgQ+omVbOZo56UxPZZbMy6PckL9C8l3FYGuIVgW?=
 =?us-ascii?Q?+aFMDTFGWRagq8111QP3AGOUOZR5YTbGARcMy6Ruwb+MgBQ6LkGOXHv9qrag?=
 =?us-ascii?Q?R2AHV9oM6Bj+6Ndp0ikvk+rvLpmdDaRc91WPpbsR8i5Xun3u2DpWl4lyGQnl?=
 =?us-ascii?Q?EUw0FKa0hePyunF/2Nk6pw+YohzEKKtjJJ+UWJ+ZC7ySnsEvStD1lyyLNQJ/?=
 =?us-ascii?Q?GyTetqg/awxGMyFwRyx3qiI2R3dnTKcCvx31Xzfo4ZoZ/5xv2fgwWmZKt1Nm?=
 =?us-ascii?Q?3CabN3gKui2GPgCzbNQDfA8jTFLMGpMXe8U10t9sZqP0gPCLCoVpMvBdfNrq?=
 =?us-ascii?Q?lNpguR1t0eHZUXxsijzH4n1LFXR5cGiDxuxajPwrHEmHyOqLXVi+MiLppXap?=
 =?us-ascii?Q?WX7GtvZnRZ5B4Trt77MtYwULIYnAokBCBxvOsnGDsur0uk1dpy0kba5XS1Yu?=
 =?us-ascii?Q?pSl1Mz6H4vdWyfBpZN9KzN+fLslSIHl5ZE9Z0ICbBJrf1HesIFfK6od/QUH9?=
 =?us-ascii?Q?ZvzEZvcdKUBUoB+Bsq15EcdoT/qtoanmnf1lQGj9?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42274400-4c58-44bc-02b8-08dda98a51e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2025 08:22:50.0193
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LyTQHScfkDh++EqVWOKrExBhK94C90Uo6XAjGLQsX/yupFmRgbXCjuckqBclh7Qe8ygv8Sshg8AY57zHm9X3OQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4572
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_012309_872674_6785330F 
X-CRM114-Status: GOOD (  19.01  )
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
> Sent: Tuesday, June 10, 2025 2:20 PM
>=20
> On Tue, Jun 10, 2025 at 01:55:05PM +0800, Baolu Lu wrote:
> > On 6/10/25 01:13, Nicolin Chen wrote:
> > > To ease the for-driver iommufd APIs, get_viommu_size and viommu_init
> ops
> > > are introduced. Now, those existing vIOMMU supported drivers
> implemented
> > > these two ops too.
> > >
> > > Relace the ops->viommu_alloc call with the two new ones.
> > >
> > > Note that this will fail a !viommu->ops case from now on, since a
> vIOMMU
> > > is expected to support alloc_domain_nested at least.
> >
> > Does this mean that the viommu implementation in the iommu driver is
> > required to implement alloc_domain_nested? I suppose viommu should
> soon
> > be extended to support TEE/IO.
>=20
> It's a good point that CCA might not need a nested domain. So,
> it's inaccurate to say that, although I suspect that CCA would
> need some other viommu op then the check here would be sane.
>=20
> With that being said, it's probably not worth adding that until
> we are 100% sure that no case will work with a !viommu->ops, so
> let's drop this new rejection, since we haven't had it so far.
>=20

WARN_ON_ONCE() is built on the current context, not the future
usage. So I'd prefer to keeping it until there is a real need to revert.

Reviewed-by: Kevin Tian <kevin.tian@intel.com>

