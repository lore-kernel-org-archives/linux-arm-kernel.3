Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA0A5E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 07:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z7hFxYw5ndYIUfz2qDFSQjPvRb72H0KRtbtH9YqAVBQ=; b=NMiWCPpwKFPlfTo/hfGYxDTNJ5
	ngXcYalIMMlHUL1097PUQUoNKRHamA/z/KY1lhLaLlbUTyMbNT/PiSKyoyfiukanOgp3v7rj2iZpS
	klMdPaKGiT7AZ5ZwyFxc2qi3mf2tp0j9Y0d242z6vk3Nsnf97Xa0eX6FQfT6qf5wocgDgvnIBAbz9
	zBGd43RfA7BxLxIzVp9z3lG7+V6IJ95eHpGJ6i5S2FcDlhS24yjvUXMQlwIIgiqbD+0OZtNPbBVMM
	jBYgexdaqAoLA7zm6Lz8BgMKqY51vudaTt6P6F/fVb63YSzBYCM/6oIs2ZU+c57XWSunSgu7aEgsW
	0lLLHZAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLHPB-0000000E5r8-0mbh;
	Wed, 11 Dec 2024 07:45:09 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLHO3-0000000E5eu-38SO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 07:44:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733903040; x=1765439040;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Z7hFxYw5ndYIUfz2qDFSQjPvRb72H0KRtbtH9YqAVBQ=;
  b=Z+T7vBTBwDxj3OeNgG6jKFD7slRqfce2uWyH6UzFbK5Bu1jhpJPVnGXZ
   c7TY9WOA6OIFwyUyP8t0f9SNsh0A58nIt0Wcubfg79uH8QpYZrEzmgX1i
   Zv1hsDUdc1uK0Ig3+c12JaV5OsqymzP1ppsCOKEALM9gHLPIJl65Mvz9D
   tGk5br87vBaZJczanpy7AczQi7BsTEGT790a4SMREgEUzIFuvKovPuZ6/
   N+OBzWtg9EZItnJSFnG2iSPLreWrNrjvqtmP85KBzaHPSTpDwnBuIk4he
   PDK807DgImMfn81AtkSbIIol3F9bduxlzlTYEmTE6WiQSCxrmYFlsphgg
   Q==;
X-CSE-ConnectionGUID: N2C8Rl/qTsSP2tcLataYzQ==
X-CSE-MsgGUID: cBVJHrEnT0OB/A04XCv8FA==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="38201229"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="38201229"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 23:43:58 -0800
X-CSE-ConnectionGUID: PC66XUY1TmuelXyfZlxHCg==
X-CSE-MsgGUID: KLNJkdUnTmO02QrMqv8jAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="95405173"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 10 Dec 2024 23:43:57 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Dec 2024 23:43:55 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Dec 2024 23:43:55 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Dec 2024 23:43:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X6p4T9cQr2DNgHxjzEKUsGM8WjIPfm3jHEKPHMh09XFMJYg4cWJQUqJOlDa0enZ6mqIsLkNI8cfbiSsYPlsitaAdDAaHYEnOgfCG6y+KNmRZ+b4Xf6v0uRm/m78dl9qxgQhHlEARJ9LGP3/kYpIefGq2H7sSluolmCJpXKFC2aBIdqvSiC+aP4x7G82pgDOGwK0tTVk8fuycGiFm/0B/Gt+50fzKtx/uPq6yj26eaK9lyWZ9hku4ByVimIXVpHgLHONXw3gX3HLMlK6wWLRxkK0lxgOf7j0h3bKsLd5nsnPaMq97w9mWnrdxSoyaBJXOmA487KtH9W3Y+T8gf6dbUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z7hFxYw5ndYIUfz2qDFSQjPvRb72H0KRtbtH9YqAVBQ=;
 b=AkBlsoSGGMyLm4CPO5fadb8sXWOzoHxLAhJWN0zav0nEs/YA7FB5pRMmQx4V3kXKzWN/m966HoA4soA/jwn1omZByQ1G2Yr9Tyx0iFJYxJia2jgaqFHL4aniXc1h1okx2nVGZOG0XRw9lr1S1FBF/8C1iICUXkyh9/4fs7+VS1iMsJ8L05hUjh1MWh9mmGOStFSqxI8z4lMeokRqEPv/1EpzJU4JFh2RJrPRLpj59DtAH4+WODnyLc1itEuK70FHAhIywSTUTTe9NqY/XMwtNt4wYLB0zDNzdTQH+Ds8G97UVdUwLtqDwBUJPMbyyOsmJHm3lLaKY3TaHw+Ww9G/0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by DS0PR11MB7925.namprd11.prod.outlook.com (2603:10b6:8:f8::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.22; Wed, 11 Dec
 2024 07:43:11 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1%5]) with mapi id 15.20.8251.008; Wed, 11 Dec 2024
 07:43:11 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Nicolin Chen <nicolinc@nvidia.com>, "jgg@nvidia.com" <jgg@nvidia.com>,
	"will@kernel.org" <will@kernel.org>
CC: "corbet@lwn.net" <corbet@lwn.net>, "joro@8bytes.org" <joro@8bytes.org>,
	"suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>, "dwmw2@infradead.org"
	<dwmw2@infradead.org>, "baolu.lu@linux.intel.com" <baolu.lu@linux.intel.com>,
	"shuah@kernel.org" <shuah@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "iommu@lists.linux.dev"
	<iommu@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kselftest@vger.kernel.org"
	<linux-kselftest@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "eric.auger@redhat.com" <eric.auger@redhat.com>,
	"jean-philippe@linaro.org" <jean-philippe@linaro.org>, "mdf@kernel.org"
	<mdf@kernel.org>, "mshavit@google.com" <mshavit@google.com>,
	"shameerali.kolothum.thodi@huawei.com"
	<shameerali.kolothum.thodi@huawei.com>, "smostafa@google.com"
	<smostafa@google.com>, "ddutile@redhat.com" <ddutile@redhat.com>, "Liu, Yi L"
	<yi.l.liu@intel.com>
Subject: RE: [PATCH v2 04/13] iommufd: Rename fault.c to eventq.c
Thread-Topic: [PATCH v2 04/13] iommufd: Rename fault.c to eventq.c
Thread-Index: AQHbRdBPsGbVnL3oKU2VD7gMzLSYS7LgtO1A
Date: Wed, 11 Dec 2024 07:43:11 +0000
Message-ID: <BN9PR11MB52760723207F5DEB1D81E4B18C3E2@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <cover.1733263737.git.nicolinc@nvidia.com>
 <9e37e420e46844d5a10b055e512e7d94f1446a0b.1733263737.git.nicolinc@nvidia.com>
In-Reply-To: <9e37e420e46844d5a10b055e512e7d94f1446a0b.1733263737.git.nicolinc@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|DS0PR11MB7925:EE_
x-ms-office365-filtering-correlation-id: 220d5b5c-566b-4613-e5ef-08dd19b776ca
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?7/hncFJfdICJrPs580gu5llSzsSrXsmtm8qqtw1pU95dP4KNNCyPkm6BisRF?=
 =?us-ascii?Q?mMqXk5qJh0XMyFieAAvyZJcy0OAKcRAAV8T6qiqiaJqWgDtoIeNtkaY1MbtU?=
 =?us-ascii?Q?Jqn3KKHixuzLvW3BelyT6m+U5T8/9kGkXfn48gdT5W35GTMoBnj4Pqyb49fe?=
 =?us-ascii?Q?Bce85zxJrg25rw7PIMMkrDDMjhqdJp56SZnH7Qn5jtdH0Q8giedo0ZA7N00N?=
 =?us-ascii?Q?iYGMQH+2QeHEiD2iVEhOmg9nO+5f2D4+mpsn5BUW4wyQVicAGNczY+X6MwKG?=
 =?us-ascii?Q?MzUv2zPM3e1qka/bOqVxQTRbGksW4tN7OhtKMCa6hDOp/iCKmoWFJwI+ylgl?=
 =?us-ascii?Q?rtwgpX033LfUef/oSw0FrJCpjDKno197jaFGRtINbtAVQGSSOVZRwdfpd4Zt?=
 =?us-ascii?Q?+ii32CQIVGeV8yGuNJTqLZtdJBtsJ/Byq8E1Xh7BJocJdK8z78FZuBGC+CUy?=
 =?us-ascii?Q?9mzFXTshvqp1Xz6iJQFLD0B1awqY9+Bp8fKbkhEChwB7cma1j31P8pOv/DgB?=
 =?us-ascii?Q?zv4MSw0S+u9Gp4lKkOa504hNVF/tZp36WnG3OgjDdgOTgQHc2Kkh44da1kLR?=
 =?us-ascii?Q?GM8Hj0kQRYPQQa1fmE7fPPc59YdindZd0SHmwjxOwvnBCgtWJLLkqEkY3MhK?=
 =?us-ascii?Q?Mi2FVJBklIspApP/g21ryMCpxZrFjQy8KEFTgdJqU65NT1rb39Ka+xu0DOAk?=
 =?us-ascii?Q?8RmVC5aZ2CTqvhxSp/LqM6c8cMyn62wUfZkMpqa9eoebWlJ6AFyE6cbXYs44?=
 =?us-ascii?Q?VDihag49gSLxaavCNr7zPxQ9yHATXbmVcLD68ubNiZpU877r0Rez4bQkinP5?=
 =?us-ascii?Q?9CXFCMFXjLU0VYrlojNCK0/kfxV1NpQur/vjEypsXL3rhG2Ks9wO4IOXGe9Z?=
 =?us-ascii?Q?VE+eDY96t0pKRuy8hg1qKftTil4b0fgqHwrZTc4Iy00xyqoR8ARuniRSstgB?=
 =?us-ascii?Q?Tu8TDj92hULka4NqmLRAMG4PfOY49NTRc3srNW/e71yqr08qziTknpDYeNrC?=
 =?us-ascii?Q?Z7hcoelL51gOi1Eda5efV4HGhQraQHznmOzKH2urVKSXqqmXvo8KipQQR7lj?=
 =?us-ascii?Q?jhC3lWtF/XUANo/fscXDyYrtr7BGJqXIdM89u87gA3zlnG+afKAekOingeav?=
 =?us-ascii?Q?LSMCQugYVAuBFM7iD4W9Fc7AnKeLz2YnbbHCBvzArboMsHf04iORPwYF+4ZS?=
 =?us-ascii?Q?P3i9pXN0bwmbLhfUEyMP2QJgd8uvI1Cg/fWdN16kFU5/YzeGF8dVVq2Qd8QH?=
 =?us-ascii?Q?Gatui9/rk35fkd6M0lA1s0tTi8f+O5l8bP9rtBSBrANXm0bjvbepZEZaG5Hb?=
 =?us-ascii?Q?qjdP0wEpJ3nxHu9hsmPb+oa1jqu4Mk0K7hNU/iv+3ikLN4tK3EuIMRnKYQqK?=
 =?us-ascii?Q?j23VKk7fHpTKOhA/38qXMtlA95tcR6cKSee44zfxuAIWRhWjKw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?9trF9o1msHRNSYQnox9g/jY4KHbcHJsEYjvfBmBUDHkOn1QLF7brQ5BI/teh?=
 =?us-ascii?Q?2DtigfotueTk6iVsRVQn8Jg6VYBeAy4DZoRK4RjKspO77qyPxFfRIJ0bVb1r?=
 =?us-ascii?Q?kKb8Yrmm4C8m2GnWxKNwwoC2uZjuVPzKOaGoq/DXZwTPfaLMJYf7PDibFZdM?=
 =?us-ascii?Q?29WkDUkA7W6/KiPTv5j65VBnFaeprGHIvf9UGlb2op8MvpVtupbR5qAy5r/7?=
 =?us-ascii?Q?KivDC9+BIwHyfd4gM+lIT3IVmSdj2eIQHkIkxGCqmXwxDkntRr+7G/CCr3Bc?=
 =?us-ascii?Q?kFD2ArcJ1ETUIFGkmahxT1TKCRlFsi5/8SVqdMKG136DUe4Az22khFnP/wYl?=
 =?us-ascii?Q?Tv2M0C7W3enHP1we62FnYRWP3xloqOfA22yhcmYYLx38qthrGbBoHU9pW3AD?=
 =?us-ascii?Q?vJYvZBh7NGyNJbFECkoAddEFhKjY+6O2bZOeJInzdpl2iTZKFrarHeS1jT0d?=
 =?us-ascii?Q?aTgZD3KIihshkjQRyMUVNK6/OvvhKO+vfr/2+FYrH0FQ7iKh49BBM5RZOik4?=
 =?us-ascii?Q?Zt1012tLom9ZaJTwxRic0UQHhiKWN6Xrezt/28haHmNGwPrTWDyzlxVTrB8q?=
 =?us-ascii?Q?AS/4VoziPDFmQonhcNF1g//7SJd/GtiL5FGm4RW+p2zRtVmC6s0cpylSKLIF?=
 =?us-ascii?Q?vqmiwpa3ZO4ed390xVROFYsMT6qDB0AEtEX064Mm7KtSbeoD9VZOA+lyf3g4?=
 =?us-ascii?Q?yiEwlNzUO6SrHvcMoEi9o5iuph0TLXYzbJRXXJ3Bdj6rGvKP+FRolinUA6KM?=
 =?us-ascii?Q?8LVs2k7z7bE8uXmliC6kLuCV6jVhTzN9eRW2s4oghKbPWTF5wRJzc+aq/eHT?=
 =?us-ascii?Q?/FwjYzteFdP61yXJo14wm+NNMI26ii83TrxG20OYCgWEC3HDkw2DqAl7hLuq?=
 =?us-ascii?Q?zIhMhWw/zkxeKfh+uhjtRa/aYEnRYTp7ZaarkLez7Tv8+ubCpxEez8UCOftO?=
 =?us-ascii?Q?H9ZVxiNeFndEl2Mrg51Wz/usKbCXrPQjTtvfxYxQI6K/dskWsLJ2+k+cUXEH?=
 =?us-ascii?Q?UvkDwtzgJXxWNVF4x4Grl1dKpOQhfJyzIups+YdroKicXshYxqG/kfqSpnDI?=
 =?us-ascii?Q?91I1puCfDtwp2dZP4FfWgEqLTPt7AwtwxRD1Bk0EaFVbaAW0h56pCQvmxvpK?=
 =?us-ascii?Q?McQuc4gphWnSz718BZXx6tP6mESaElYdtqdOHzrnfk/IMudQneiV54jSzzcZ?=
 =?us-ascii?Q?bUgmCzstStHxjB5Vo4xQl7TSiE44d4mSGYAb6sXDgERzNKrIxLmmW0pThwXW?=
 =?us-ascii?Q?yyyq6j/BTqSNnQX9PHKkV+lkU0opDPEXT7F3uSIOL7OU3QuLTu1iPq5H/SQV?=
 =?us-ascii?Q?YbREoEp/WdvAYyd/1eftvIMKvBgh6cGyX9k2lblq3TTy9Uug7cm5yWcn7aQl?=
 =?us-ascii?Q?iXJiJZTtw2X4vkUM+Wn8xOmsLoCKCGFiDNDxuABcmch3adzH/WktlHGBaHqx?=
 =?us-ascii?Q?cOOTijRz8OF2gWNgoWUNV+LSPlT0DOMRVOB93aijD7s9bC9Y2FTZmkf9FPgF?=
 =?us-ascii?Q?hxSZu9cVn3puVWuCG8yRB2akPcU9VrzaPOv+lxRS72zrZDC8zJtbch2rivF1?=
 =?us-ascii?Q?KvOSKyMB4HiFXHDP+ZcumYtldHeFYxWBGedu5h1h?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 220d5b5c-566b-4613-e5ef-08dd19b776ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2024 07:43:11.8932
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x0/fkkLXLS7IAZoR0rjI4wVkGmBQMS5KRqJsSGxyM45UlmpzxkI8xuLZToN2E11V0RjtlzGRTR6QgUizrpl52Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7925
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_234359_795078_3C1A4F11 
X-CRM114-Status: UNSURE (   7.04  )
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
> Sent: Wednesday, December 4, 2024 6:10 AM
>=20
> Rename the file, aligning with the new eventq object.
>=20
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>

Reviewed-by: Kevin Tian <kevin.tian@intel.com>

