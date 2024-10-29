Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D67ED5B166
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 08:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ELoQ5y4zSAyA6qHpg7Zmc39dkMS/Bde1hDvCJIWYP3I=; b=LAV0EqoWDKpZtOTMCyAsInUOi1
	kwwDFwRbhUk7Z2zYpVgEPvgfrRHwXKffyQ6DWSIQk48o18SjQatWeHaan9pw4zOcVswC2DY7XZ1hj
	2k5+X9Gh76OobRjo49GAhOGQSnQliRtips5wCy1lCZvvCr55CqHaInmVjNwTZOG1FrS7iiTpUr9xQ
	Y9OzigM+eMWfP7OX0G57A1lboWdt9fy6UnjxBkIdDshFEXE0oa9kDqQ7BmbKOCQO2xuq/qvHBU+gK
	db1zVL6jVyKX3KQZr8lygLdJNGcRi8iTGCxCqeQ+5MhZrvBpErNXKexZP7Ow1wa6wES3oqliWUkBE
	RGibtWFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5hUz-0000000Df4M-40Es;
	Tue, 29 Oct 2024 08:22:45 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5hS8-0000000DeZ7-2gzZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 08:19:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730189989; x=1761725989;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ELoQ5y4zSAyA6qHpg7Zmc39dkMS/Bde1hDvCJIWYP3I=;
  b=Bbp6LdlYHSWTXEw+NICFajOFgI9bNUUy0FdzY2Df9Coz5wMG5h5BFIwf
   TKbbqYHZ2J/wkT5vvJnXyPMWiJtNKufzuGeAgsbxkCzLwarB1BWxP/mIP
   M6Ei20lSm+1nX3PBSae8/rLJRWM+1jni/ZcsyHO5ZWiphLJ/29kzCaQ1o
   KS10WJltIObJYapE7C/PrcWJ5UzbFVbfFghJDWiTRa1KEvXzk7gMbyAJQ
   G5YN1VE6rcmV+E98nY6jp5czGUmKE658/uNkhQVHL0ZDPFwnvi8nvCcSk
   Pce//wur72kYjK8jp42ntUPUs1H7vPkculIkMdPcjb3MckKujjqIbGWL+
   g==;
X-CSE-ConnectionGUID: bW+iyd4tQS6luFZ9rfCEFA==
X-CSE-MsgGUID: lQ5iKnFHTgW4dMU8oCAfSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11239"; a="29244910"
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="29244910"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 01:19:47 -0700
X-CSE-ConnectionGUID: DbcTJLMyT5igZHdi5r+2Uw==
X-CSE-MsgGUID: UbgvhlBAT5anFQzi1UlZ2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="81813710"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 29 Oct 2024 01:19:46 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 29 Oct 2024 01:19:45 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 29 Oct 2024 01:19:45 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 29 Oct 2024 01:19:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gBzFIWti2dVNWwiItJ8dg7wTVRz0z+KK17VuSR+gMI+PW5WEi3GkNH3j6E5MRJ3A4p9atqF4uOanfR5qw6qKUiPAn2b/knJPffLSxVqiV5Eqj/bSZEiKarVsUcnblVHGFQt4jLzcNiZHIeBv0Lg/569PxlqTmvHT+4GVviqHPodPZFCwaSbzody2Sl17P491X6UgLVLFHKgPadce4BD5KktX/vRc1dpQZm/fcnER5WAk0Bys4PGFOiAv+mV0zHGabqI1CkRr5Unw59KlXmxEGrnc+2olbWFmW9KV+lBIjArKCZjDKBPRjMa1x3RiAOkPWctX7TK7a1DUGujU/dfAoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ELoQ5y4zSAyA6qHpg7Zmc39dkMS/Bde1hDvCJIWYP3I=;
 b=MIb9r7Mf+bk0TXHv9GuifKQwW1NqWjO8h5SC8PCs7zpW9+V1Soa7Q2w5AXlYa1jDcBy+aPXhEqlu8anssqyiji1dJs1ZqIQrxWL76AxoJeV76basYYjzjGrEVzejBGpUak9mMOmW3RkmHGMBw5yzpyvApkxKLE0Fepfo6C6gAnzswL9kDW9yRLUV0+jD3kLXOQq5OrpLuJ+wrvM+And/3IHLRv2cwGIKmu57cZw7mUHJx9yTpx35YSFalM/EIfgOpvCnrWNpsxacRxnixamZFagOHJTgeYdlNkxGXB8z2RPL4XFhx+VmcnD7frmiyxcqWfm21ehHypRQINlHNIM29A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by MW5PR11MB5785.namprd11.prod.outlook.com (2603:10b6:303:197::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.27; Tue, 29 Oct
 2024 08:19:43 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1%6]) with mapi id 15.20.8093.025; Tue, 29 Oct 2024
 08:19:43 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Nicolin Chen <nicolinc@nvidia.com>, "jgg@nvidia.com" <jgg@nvidia.com>,
	"will@kernel.org" <will@kernel.org>
CC: "joro@8bytes.org" <joro@8bytes.org>, "suravee.suthikulpanit@amd.com"
	<suravee.suthikulpanit@amd.com>, "robin.murphy@arm.com"
	<robin.murphy@arm.com>, "dwmw2@infradead.org" <dwmw2@infradead.org>,
	"baolu.lu@linux.intel.com" <baolu.lu@linux.intel.com>, "shuah@kernel.org"
	<shuah@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "iommu@lists.linux.dev"
	<iommu@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kselftest@vger.kernel.org"
	<linux-kselftest@vger.kernel.org>, "eric.auger@redhat.com"
	<eric.auger@redhat.com>, "jean-philippe@linaro.org"
	<jean-philippe@linaro.org>, "mdf@kernel.org" <mdf@kernel.org>,
	"mshavit@google.com" <mshavit@google.com>,
	"shameerali.kolothum.thodi@huawei.com"
	<shameerali.kolothum.thodi@huawei.com>, "smostafa@google.com"
	<smostafa@google.com>, "Liu, Yi L" <yi.l.liu@intel.com>, "aik@amd.com"
	<aik@amd.com>, "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>,
	"patches@lists.linux.dev" <patches@lists.linux.dev>
Subject: RE: [PATCH v5 03/13] iommu/viommu: Add cache_invalidate to
 iommufd_viommu_ops
Thread-Topic: [PATCH v5 03/13] iommu/viommu: Add cache_invalidate to
 iommufd_viommu_ops
Thread-Index: AQHbJzjNsYUVPikDxkCKKz8wZdt0lbKdaBMA
Date: Tue, 29 Oct 2024 08:19:43 +0000
Message-ID: <BN9PR11MB527636EB86B125CDFAD11AF88C4B2@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <cover.1729897278.git.nicolinc@nvidia.com>
 <e4817b7c2aa58b010a1453a3db9e9804b3acf5dc.1729897278.git.nicolinc@nvidia.com>
In-Reply-To: <e4817b7c2aa58b010a1453a3db9e9804b3acf5dc.1729897278.git.nicolinc@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|MW5PR11MB5785:EE_
x-ms-office365-filtering-correlation-id: 042e1beb-aa6c-404c-35f0-08dcf7f27111
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?0PXTA7zFtBG1J3SmZ9fWyyYvCA8oP/YDf2hM6Fa1y3tADcZasak8ZLZk4vIJ?=
 =?us-ascii?Q?uyKf76YzCUiQw3o4Vt/bM2PcFaZ7fiFvL6YH6IRim6XefFt/D+uzZNS9WYo4?=
 =?us-ascii?Q?x0VNzWs/XgSjtqSBOVaBgp142fMQxOLkDDBtwZE934l6RC27LvUDZ6UTHrUR?=
 =?us-ascii?Q?0bb3S+vJ3LsIwgZWrc3JSmBp3tuewjcn3u1bJBfCPBjSP+KYxl2wIIACLdud?=
 =?us-ascii?Q?YwGL/AU0BF8XRnPf9T9wtKSO/yL+lmecTNFb2Y9n2APXgH9n+bpGXVgHHwGd?=
 =?us-ascii?Q?n9ONWl74Y0JrSTeH/nwK1V621KyphqpxdEJngGvQNB7OdrP+scAypVmBwdBo?=
 =?us-ascii?Q?a9TSqdm7xDnoNkuRKltIjCSaa7UW/Yr9mCfsraEA1hZ/5vQzDtAidf/f0ZOD?=
 =?us-ascii?Q?MZhqZMS19guzQU9beQbQ9K31fzu5pvLgJ/qB4mJg70HGSoVimyGrSSo5Lx3G?=
 =?us-ascii?Q?spXT1yxIGMQfII0RxMRf1QlGN15vuoNAJwnILlOK75o11cOMKHPG3kPCGwUR?=
 =?us-ascii?Q?7JOdi2In+zvhlNLs9JKGai7jg1bSKXpxxZucl0QwPvsIpl6YFwu/tkyeVIxF?=
 =?us-ascii?Q?m/4d6A4Kh5ELVwLQfIwjUjGXTptv9kltskaQ1434vycdamRZTBRvTSSXgnp8?=
 =?us-ascii?Q?P74YcvJaw/aPS4AZlFQ4TJCrbh1uyBa0OeLrjoYLy4pNO2L3ea/crLJQB46P?=
 =?us-ascii?Q?I3YrU1xMg8z82MLUHmjZCRgFrKSKgPxNuGSsar1/y95HNgwiHxwFNZ91jxIs?=
 =?us-ascii?Q?IVssoDhOsioFvSzisd1RlEGUCg9v/DDU4+qmiCS8tl1RFN+4dsT1Qb9pCG11?=
 =?us-ascii?Q?GXs0Sv+S52LzxXZaywXC642fQyNLFASL7TjruRS9FlVWRJncrA/+7jXKYA6h?=
 =?us-ascii?Q?3r88rLsqcmmJCoC51/iXDB5T4lPWu1kAHgoBbHjj2ELfTGvuk428jQUM0hDp?=
 =?us-ascii?Q?CFGuYy//fcXrJhbJXR9ZNXGlqbMjD0fGSBzjrY875/xPxGrd129QGVqyjTNf?=
 =?us-ascii?Q?vo4f1X6YdHAWZr7+CqJufmGZRN5t4Hw7ZN1tgm9qqmyxauwTZGKDuq2qw+XD?=
 =?us-ascii?Q?F47EBuhALyubiGmhDEXTE0afubap++AE+9RYJjopUov0b7Yy4iYG0fb3iB0k?=
 =?us-ascii?Q?C9VYOQ6A79PBUwuCRz/ojQJhJDef3hk16jF0uWNeO9jFwFuMlnmkFq6FyEnG?=
 =?us-ascii?Q?TPao7oorovHodxF4p6+V1NQjXHY4Td/4ZGkczQkpSU9OrssHt3Rd66RxK4TV?=
 =?us-ascii?Q?r9liHYqp5+YM2iHqfWcPuQm9vH6v3kg4WywOMbc9LBWqs02GJyRh74aeTnDy?=
 =?us-ascii?Q?C8X8y/Ymc0gzeQzvbHEQdkS6mORZZFON1dmUNFx1E4zZKyg/fBfXlZCx3pT5?=
 =?us-ascii?Q?/n7U4eQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?nExIxtx78luvOYP+I88IWBx7nO2t7AUG/uCp7QU9c7J3oRlgRtsv+HKtW9xY?=
 =?us-ascii?Q?/AJczlr56sEloJrWzgDerLQLG43hs7bW8XAhF2Bb/0AjfGGl1TkICSYytgj5?=
 =?us-ascii?Q?kMZncZTJ31ib6MRnu4NHanFSMkJeSrk4We41MG4IWQg3BCoPX/T3OnLevsy0?=
 =?us-ascii?Q?wb1Q+5I9I3DvSem+K3zFDA1JeDQcnZREl9GqED03kDwXcw8eoEvb6FXVK98d?=
 =?us-ascii?Q?yg71uPdmlf16pHszaW7gdZML/A4jlmBNR5htNOEQ8k5UxSrba5/jgffN62+t?=
 =?us-ascii?Q?MJFKEGlgiPjQ4tb8ljjeXjPySk3cSfU9DegXPnghvqihkz+DfPoU1ouaUk20?=
 =?us-ascii?Q?jbF8HNrlhCINWeuAyOypgsZdfPz9a/YOEJdbWOaMp/rhYPVzZRUs7Wjcz6UO?=
 =?us-ascii?Q?hVCqdc/yd8Hu3VU747o03HbvB/Gm6eIu+YEpDY9sPAe880WQj+Y+IDJBzXY5?=
 =?us-ascii?Q?oRKfqLqObFhCQlxJ2vm6KCFPHX/O+g7Noe/3HXMLXZ4mxNLiHxzMcdqYXbAz?=
 =?us-ascii?Q?+sDSM1986VcIiPgoj3GbuPOPce/Xbnayy5hEbRrPdXJVXVYTzFnDpk9idxEo?=
 =?us-ascii?Q?Myj0YQtSBOrLz+UrJJv5jf8inlgp72CC6mRcDBRNljlrB7QzzM6K/QR1dUM5?=
 =?us-ascii?Q?UB+CQFlzYI8aeGR+3F94R6vHgoOJtPThp501ezttLh8FZ7e+IY6vD0FAW4AY?=
 =?us-ascii?Q?tsUvtgepKXmFfsIYIH44C/YRbopOW5yOGxD7bywDcaRnTALY67YIb2mV4L/h?=
 =?us-ascii?Q?MrKW/e0caqP3JS+mqRIWxYzQ4PibzXNKvBazWKUY0PwA84qjt/JWLooxyM73?=
 =?us-ascii?Q?p1Poxv1EPZis4TaQTBU6yc8/EoDUHDnQf5l6icavtRXApF0TnHSSAzxJZ9wa?=
 =?us-ascii?Q?LUiTMATzZ05LHWtvfXnRjiXbl6WEMEbGYOOCxjnzFR2MhSHfRL+xJps1t9WV?=
 =?us-ascii?Q?CDtKSU9R49/MOjuP1fUnT5sgMcv+N3OPEE8oV7f2RUZO+C0wnOX3ON7bWYR0?=
 =?us-ascii?Q?p3harnjTN/ZJwP0R3GuC5WvLnFuWUX7huvHhBWRlhh6B1gUMaMvgHggbJDt3?=
 =?us-ascii?Q?XGt31IqXKd2ZZFVqwyAy7DNjqtI3XN4Hm8eYiKVC726YCltnQZi+o/6eB2Jt?=
 =?us-ascii?Q?MXjvoU/T6OPEirkUa72NMOQY9s2O5su/h6PgpWM0jFCkqMQjJZ+wmG8RBYjj?=
 =?us-ascii?Q?DvklwhbAGOuYrGEvm6ZeorhPa/vsqOLUFelUXha5HRK2gFi4tkNmCSs0mnMX?=
 =?us-ascii?Q?TrkqwuqCF3OMvqubpyhm7xHI3mdNNzQO4Vh5etAQzq7EgKCfsaRBbAkCv03F?=
 =?us-ascii?Q?9oMY46rowLJh90jLPU26kOyKOXVJzeXrA1wRmwY7LbLdsAiEAMoTvXy/3ulA?=
 =?us-ascii?Q?bKEaSS0s1iFQPjbRgJLMX23uLYXKL36WUI3Xkec3Jggvg8tZYrWL37adXALs?=
 =?us-ascii?Q?7sVmYfuLqL4nXMJFw+bhdO4eviNqYOuRURPpW0YhIo1qiyub2I+ILlaKpbQ0?=
 =?us-ascii?Q?ncvSdwIGF8v0jE4rzBx7kH5qnZoDfEnEtGdfgxniKPXtHYSas4Ywh4tYf6aV?=
 =?us-ascii?Q?NbCtiGePc1R9iqrMwgXdLOphpl3reJ0dzYFV5olf?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 042e1beb-aa6c-404c-35f0-08dcf7f27111
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2024 08:19:43.0312
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z5+ykaFf+hXbhYfBt+m36kx2PcMXYj1mvfNKspW9rVG1gY6t61JZ5nQHlHhCdPcjSix67MhryaNlqU4N19+v9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5785
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_011948_733079_81C4D172 
X-CRM114-Status: UNSURE (   7.88  )
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
> Sent: Saturday, October 26, 2024 7:51 AM
>=20
> This per-vIOMMU cache_invalidate op is like the cache_invalidate_user op
> in struct iommu_domain_ops, but wider, supporting device cache (e.g. PCI
> ATC invaldiations).
>=20
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>

Reviewed-by: Kevin Tian <kevin.tian@intel.com>

