Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7453CD35661
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 00:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pg7Lk7VdkZVZTPZbtMPP4E906Eu7JMc0DPk2TIGrItU=; b=zmC5rLR1+LEhovS4fwNosuNJRk
	SPPASb9mVlAfPuvdJ76Ja7opENiX1OOvqVrkTi6wyo7vz4o6y8BafQirvcLorDH4ay2//6gmY6YMi
	ht8Sj7WzSPA+JLt7VxWQWdJwXEWeCGPAhZGCOUfO1x99UhGxgSJd5f4s+9zVudYZKUDDRUJCZFC0Y
	KfnZ5on/Z5Tbl7vkJ+n+25EOcDOZR0aJgRB5CVNPfFqosx/zM0mRDXrH6CiJug2C8RCy/r1lnVkHO
	LDK83EHqVF9FjWz8MgFSFeiZSwF+Sjo11uqrNLQlwKU/Py9T+YFohe8+Ma/3uL7adZ0xCZ9n2P2+u
	hQ/WY/PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vktss-0000000FEp2-3U0V;
	Wed, 28 Jan 2026 00:58:14 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vktso-0000000FEog-1bNA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 00:58:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769561890; x=1801097890;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=llw28GzpniFsb/gVxY0ahIvJjlHX954Z+ecHASF5zTY=;
  b=AZNV24VFudISn3NapLMUU3XfCrAp4ZcXosxki2jB3FFyk0DtJjysRIk1
   s70Lcw83ipSfJXjt2CgU5IgP0CL2sb8n8HV8wd12N43EPU8BReMsKg/ip
   tCyYx4fNRgfiFPR8bP8JgC0+cvbY5w/eKX6KYid9Q+toM77egl47nZ0+v
   YV31AIQXMiHJX6+BKiLobl4rfTubEyQzPdguoTmf4nMCn3wNoyrN0XAlD
   b9FF7Q2v1RaG8G/2//d6ACeiZ/VSs2FlwQUT/L6FmrvEkz0HUkJhE55nk
   Dasp074SdXJAS0A7kRiqnyPNhDwqkgSi8xJ0PoUY2NE8uQvbKVDWMLIAB
   Q==;
X-CSE-ConnectionGUID: 2iXmcWJ4RR2CPNf7XQJuhA==
X-CSE-MsgGUID: 8U+ZIKN+Rga4VNPx/o3nYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="81403248"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="81403248"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 16:58:08 -0800
X-CSE-ConnectionGUID: NqcZMtWXTfO3WnM5Sebk+w==
X-CSE-MsgGUID: 3QtS3JyVT+qaT3LIoQ2IwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="207261334"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 16:58:08 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 16:58:07 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 27 Jan 2026 16:58:07 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.20) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 16:58:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C8Yg/Go9aNsue0Ql5xVyDgFa5epWSTx23LC6ObOYeW7XhjXzzNJAuB0DRTiWQl5uovPh364I2BB2nsjymDY9sbBoWyvJbl4+fBTgp3MJIpd1pcle2ggQfZ1oYPYjwllokffHXpXV4B5xKN9PT65RhG4mcWLofI6uxtAIJiH6uhhXi6XyYX4YEfv2GJWpRXfYM97LZZ0rD3565TRb1vlFqHLWjIiPQz4S1OCrrNEE9vM8M7gtUVz2xxrKvlOipR3LgAPHWO7DqmZNMxqoIJRjyJhFzSuARiRmsL6sKJPVQt6LDitxjIgqhiG8BPmDZsUZ+ew6HwMVGmBkfVsK4wbpag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pg7Lk7VdkZVZTPZbtMPP4E906Eu7JMc0DPk2TIGrItU=;
 b=FnaQhohTvNEhcr57HEKAMYtVp165EJ3GfH18Av6c1W70jQzUkv2RuxPxQX5HV1Ov+OM4+Of2lNQSMRRfYD6v2T3Wy3qQjqHa4Gl2NF9Chh63KuxsdQm2zBRFKdJDBzpaFFGMUpvnoYcoUgn81QqjohyJ8p/0iM/X3qv9Er0h1450hnnAKF9EzhzHZcvpS0q/TU0AWXw+VQ0LBB3aJKFCbML49KIv07O0m54rS5vM+W/PkV8+Pl/EgzCArNOEEMBldw99hVwMiv4JO8NnTmiNBDtz1R2b7qZFUDWpyUd+kIyXwHZo8m6To40sOnZ9PpFtR8q78elNgoGVeuMa3ctsMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by CY8PR11MB6818.namprd11.prod.outlook.com (2603:10b6:930:62::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Wed, 28 Jan
 2026 00:58:00 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::f997:762f:f079:134f]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::f997:762f:f079:134f%5]) with mapi id 15.20.9542.010; Wed, 28 Jan 2026
 00:58:00 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: "Williams, Dan J" <dan.j.williams@intel.com>, Jonathan Cameron
	<jonathan.cameron@huawei.com>, Nicolin Chen <nicolinc@nvidia.com>,
	"will@kernel.org" <will@kernel.org>, "robin.murphy@arm.com"
	<robin.murphy@arm.com>, "bhelgaas@google.com" <bhelgaas@google.com>,
	"joro@8bytes.org" <joro@8bytes.org>, "praan@google.com" <praan@google.com>,
	"baolu.lu@linux.intel.com" <baolu.lu@linux.intel.com>,
	"miko.lenczewski@arm.com" <miko.lenczewski@arm.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "iommu@lists.linux.dev"
	<iommu@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, "linux-cxl@vger.kernel.org"
	<linux-cxl@vger.kernel.org>
Subject: RE: [PATCH RFCv1 1/3] PCI: Allow ATS to be always on for CXL.cache
 capable devices
Thread-Topic: [PATCH RFCv1 1/3] PCI: Allow ATS to be always on for CXL.cache
 capable devices
Thread-Index: AQHch228OMA01jUUyEiv70mzhaALBrVcR9QggAAjmICAADJUgIABF8EAgAB9uwCAAG1mgIAHDgXwgAB/AgCAAJ1EwA==
Date: Wed, 28 Jan 2026 00:57:59 +0000
Message-ID: <BN9PR11MB52760F8EE835B4D06BAF0C248C91A@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <cover.1768624180.git.nicolinc@nvidia.com>
 <d1768bb6384050a23769f20ca28216f520f77e26.1768624181.git.nicolinc@nvidia.com>
 <BL1PR11MB5271F0BDC68C2D7F172122E98C96A@BL1PR11MB5271.namprd11.prod.outlook.com>
 <20260121100307.00004e60@huawei.com> <20260121130315.GE1134360@nvidia.com>
 <6971b9406d069_1d33100df@dwillia2-mobl4.notmuch>
 <20260122131432.GJ1134360@nvidia.com>
 <69727e7ded712_3095100ab@dwillia2-mobl4.notmuch>
 <BN9PR11MB527649A0049CA195E7BCF9218C90A@BN9PR11MB5276.namprd11.prod.outlook.com>
 <20260127150440.GF1134360@nvidia.com>
In-Reply-To: <20260127150440.GF1134360@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|CY8PR11MB6818:EE_
x-ms-office365-filtering-correlation-id: eda2ebd0-449a-428a-1db3-08de5e084861
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|7416014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?+Rz22xK6EnYZJJLlqh1zDMWNsKAn/mS916WbzB0C2JvhQzUL2GmXT2PYNstQ?=
 =?us-ascii?Q?JehI01/j1xZltD/CX8Pml5Fsy1DdkfT+efTaGwrew/J3jT/KM7jQS5Rj+DrB?=
 =?us-ascii?Q?tQ2kQxSALi85RgttS0MnumxDlPeormW4MY1DA07Trr5GJyDHflB/myOcEIY+?=
 =?us-ascii?Q?/91oVqS+V8eQqV5xKQmue0awnNXTMolFLDUFrR/I2zk0rmWnpOTbrjhil0aL?=
 =?us-ascii?Q?fddfSM8a8cloUkx2LtCjgfaHuP3GAn15QIsUC3q4Y3WU8TexVTvO8y9d8W5o?=
 =?us-ascii?Q?YkFZebjwaUToqvuZdOqJ4NIx0Y7BJYLrpx2adh78ukCidRX9vAlrOZ6MAJiC?=
 =?us-ascii?Q?2FaU0kVa3A24a3YaDH88t7v0lvzZty+KMNsOCPiuOpPk0OEKwxV0kACI5SSm?=
 =?us-ascii?Q?i53uPHM7gPrzOZZloqN78iMORqi0k7sd6Z9ttQEIfBZ3mIrlZzUE0EchwxOo?=
 =?us-ascii?Q?CGN4MkgF4p+Ww4Lrhd9M1jM1ScWcRfH0nC8BfqIIPMya6sc/H/+jVqnxyOQA?=
 =?us-ascii?Q?Fqw3Bxp7Y6HFwSaJACCpHKmGkIRbhXtDPwoLrTaaKEctUY10t2+Zi1asamBP?=
 =?us-ascii?Q?vxPOIvF5iBbzqnZJfnHupjXWOulFHhuAk1uvS1MLQMBZ4qhLuXVvfyA889/D?=
 =?us-ascii?Q?jx7X2uf55+ThA4wCaCmm4L3SuKuWPBlhF92GTkaPi+L7Eu911jkwaJRZiYXA?=
 =?us-ascii?Q?0xnNg8oOmVYGClmZMfRCLOmF1vyX/iX0cfVDCnP0tsqtZBxBkkWk9ADKmmnk?=
 =?us-ascii?Q?F64LLJrJ9odR/NVOucaF1p3Srj57Km/0HNF+1wLJQPGXk50et0p1HPO6YN4D?=
 =?us-ascii?Q?uK5Rr4BelD1ECH8YQLbe5ybgj7hGzJDAWgudluw+xghhDTGrbvTzloWvMTPg?=
 =?us-ascii?Q?0C072QDQJJjUII4Ds1SIssk4xj4LjPUX5s6TvVfW5EzWJppu9dBRNm9NtYsC?=
 =?us-ascii?Q?Hq8+nPbrfiWDkA/7f6BoLuFxQfrXnkAdRZei9k4Rgzqs9S/ymlVcePsAFlKr?=
 =?us-ascii?Q?2ZzfSDFYOQNft0bFixtEP5JhBfpcKKMje7+NKWbOm4g1LaIxHz9bIzDrA+rA?=
 =?us-ascii?Q?mDZIkmTZcTnHTzoVOuETWuSi2NHfkOV8kS7rM/6z3GdjthcYWMIZ+Vm4HA2E?=
 =?us-ascii?Q?9Dx8Uh95pPFXHyb/9x3VEKu2axdH+6l/RsEkYPitS/80M9IWPWlHx2uTvPC7?=
 =?us-ascii?Q?kBNi4jkv9/i3cXv0rJMyU7duRauZXq4CZvrQW4M+BfgtQijB8R5axhLZ1TIa?=
 =?us-ascii?Q?QlVrgkfRI6Zg4u5IylCgt1r5rOqUnUJA6MqC7hVN77YCcOlCVfIKe63MD3Jl?=
 =?us-ascii?Q?TGieX5YApbQDPt9HM4JeoGF/HTF8sVtzzuO0jTcRC66OQ5L0EHsGwRQwje1/?=
 =?us-ascii?Q?Xsw5hQwpmXL/dj8fKIISdNQRfntjjbhMCAVoTy2xmegL8xCk6MjqyQpdgL7S?=
 =?us-ascii?Q?ap7RWMH/qoLaGhdlkBWxCrQINuXeg/lVotp7Q3PzXU044ntL0brsHu1KiIDv?=
 =?us-ascii?Q?+LvkR8vERKtku4YfnIl3pc+99vVT1W4E01sC31BEUUMEhNMcOxe/XgZbkc5p?=
 =?us-ascii?Q?kVVaBZhAkiShBVfW+1tEkgRT975lFbxzE25CU216C5sdHu0DjRQCCvI/k/5w?=
 =?us-ascii?Q?5UwHBAjXHCrgFb1t9X2C61Y=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?MILDdRK1UoKtPwR4Qt6xz152VlPVm4/BzlucnGGbZEy/WhQ2ZbvwuHpt/5oY?=
 =?us-ascii?Q?GM4/OqKkrsmcg21icUFbvX9RKqkptyU1KMKaAurdjwAtCPprtDKLzICl1Fj1?=
 =?us-ascii?Q?K1vG0Vi6vZijzuBByG8ndI4S61Hi1BUkxrSP27UQXwEeX3J3JVNuDVNXUeLY?=
 =?us-ascii?Q?uwgoCVAdlG5fPjqGDZt5QPT/A8j2MT/tU/23yDmSOzqHkBvcrTFJcSeX6I7O?=
 =?us-ascii?Q?iTQbno5xPzpLL7rAtmQgoewC1lC9hyIQUlRy5TdC+sVC1C/H9Urnrm2n5nRG?=
 =?us-ascii?Q?5zA1+l6/miaZIlCv/h+JJpfxRmnSFjqtmi9UXDZpLLIh37ugX2xdjVZdXPPO?=
 =?us-ascii?Q?QOSlKNvi2YzdwXk5l2SYSDiTB7mlbQ0RHuJOIeYFwzogmS8J8NVla4Kpi4qA?=
 =?us-ascii?Q?U56pR8xCTlyw0l+a+0XJerS9oRRyhWROY6BX3YFNqCN2gidO+MNRuiYwJi9Y?=
 =?us-ascii?Q?Wik5fV0BM7I6RcbFcA4DVxU/PxOo7lv2jkOiOij9woF5UktM8laCV1FmdDwT?=
 =?us-ascii?Q?PZmDqVtq0HWry6HFlC/TbrlBK85B/SZ3nQeks5jdK8IoKNb3+yMFxxy/Zq/N?=
 =?us-ascii?Q?279X1fTJyCIGLZxOSBbcxJA76u2v3lKPtt2vvXI1+jUpRB4wI7BswhNCCJM7?=
 =?us-ascii?Q?zboZTiE5XHfSBVWqo8fmZrw+mqoKqQCcpNig2PJhejPMcioTgjC9tGUL51KJ?=
 =?us-ascii?Q?YRtPtDrsuV6m2WckOnsRrBPPZ7/ByU6SVIA2gSOkZXHCRBHNJhKx/yBTM2oX?=
 =?us-ascii?Q?HJX55Rlf1yMLBA6+bKwBrsJ7IAevQdoeogiKT7aHqOi6vb4Rci916z1Tznn8?=
 =?us-ascii?Q?SyZpfDmR55ywapsIDQ/5GL6sRXPfPoZSVFvh5sP5C9fW08T0DOSk+h/xvMa5?=
 =?us-ascii?Q?qVjKP6iVN3NSsauHgFytRUN3KdMVT6MPo/0VJSZqEe2eqklS8r+GAdCkv86A?=
 =?us-ascii?Q?3tkLifo4sVUMSo6QDzDRuV9eQC/t5T5ryLrZ6DgYEPAj6PztfIFBhqAcoDmK?=
 =?us-ascii?Q?rY5qWJ58hcTvnQWbI/GM/4HrY73Pvc7W8E5x4Is8AcaqDp1q5ziKOzx+nIUa?=
 =?us-ascii?Q?4UFoMQdGwoff1VzZ4FYohUxfNXkcOHIxB/NvYn12xdTwCz7LxFdCKh9mEX+2?=
 =?us-ascii?Q?nrH91eieEUUaTZk6PEcuZzljB6InKaOGTCX47UU8G3QccRDERjp1DEbsD8LV?=
 =?us-ascii?Q?rehbdN12H/AYH63x7PbYPDOubjdeFjiXKsxN5dwwFealtofxAGEkXeYfjsip?=
 =?us-ascii?Q?NhdID9IHBV35ch3Uh6tD1nwaZgKfuOrSJLo6L4p2fVm852dxgZ9m+pZrQ3An?=
 =?us-ascii?Q?LWvoX0Z3LNdephR7GOiWD7NuWminDONAqXJ9jJJ+3E02vOrMJ3EThpt+8o4M?=
 =?us-ascii?Q?PMlxKVHCe+TH8layj/y1VRBTWIOwCJRSsqPbKXt9xw+nliKUJa6OR97ziF3c?=
 =?us-ascii?Q?BlJ21EITdtaJA2g1yCxGeVEaWS4qrYxGg6hWBZcWTh6GuynBNYuggBV6NFMV?=
 =?us-ascii?Q?6KWfvfhf72qwdWCWEysbojiKbBirw4DkZyYDA85exWQm/0/kZ0R/RuPDDPeg?=
 =?us-ascii?Q?1VtVa6/5sQCCiXbBk+oCicpB9rz+tRoN3hbg5nuwM0j/BSG385Vu48sQrwSD?=
 =?us-ascii?Q?dVZr+dbmQpRmWzVz9E0h4rVvHwuvO4w45LtcTbgm4Y6cKhAhi6UOh5IZAf8V?=
 =?us-ascii?Q?rylnnkOoiklxosyVCGc4KxHujcUR7yyRTFFjeELIRNMW1dSgEejgWD7b7Okg?=
 =?us-ascii?Q?DvuEOpD0xg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eda2ebd0-449a-428a-1db3-08de5e084861
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2026 00:57:59.9974
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nZIEJEq46VKHOeHGSHdXmkibjTUXJICUSMVVltsMRqFm/czslQ0wja4/jcjU5nY6KAm+qYuowpCjQz7nwvS4jQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6818
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_165810_491174_A41DACB1 
X-CRM114-Status: GOOD (  35.65  )
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
> Sent: Tuesday, January 27, 2026 11:05 PM
>=20
> On Tue, Jan 27, 2026 at 08:10:06AM +0000, Tian, Kevin wrote:
> > > From: Williams, Dan J <dan.j.williams@intel.com>
> > > Sent: Friday, January 23, 2026 3:46 AM
> > >
> > > Jason Gunthorpe wrote:
> > > > On Wed, Jan 21, 2026 at 09:44:32PM -0800, dan.j.williams@intel.com
> > > wrote:
> > > > > I do not immediately see what is wrong with requiring userspace
> policy
> > > > > opt-in. That naturally gets replaced by installing the device's
> > > > > certificate (for native PCI CMA), authenticating the device with =
the
> > > > > TSM (for PCI IDE), or obviated by secure-ATS if that arrives.
> > > >
> > > > I think that goes back to the discussion about not loading drivers
> > > > before validating the device.
> > > >
> > > > It would also make alot of sense to leave the IOMMU blocking until =
the
> > > > driver is loaded for these secure situations. The blocking translat=
ion
> > > > should block ATS too.
> > > >
> > > > Then the flow you are describing will work well:
> > > >
> > > > 1) At pre-boot the IOMMU will block all DMA including Translated.
> > > > 2) The OS activates the IOMMU driver and keeps blocking.
> > > > 3) Instead of immediately binding a default domain the IOMMU core
> > > >    leaves the translation blocking.
> > > > 4) The OS defers loading the driver to userspace.
> > > > 5) Userspace measures the device and "accepts" it by loading the
> > > >    driver
> > > > 6) IOMMU core attaches a non-blocking default domain and activates
> ATS
> > >
> > > That works for me. Give the paranoid the ability to have a point wher=
e
> they
> > > can
> > > be assured that the shields were not lowered prematurely.
> >
> > Jason described the flow as "for these secure situations", i.e. not a g=
eneral
> > requirement for cxl.cache, but iiuc Dan may instead want userspace poli=
cy
> > opt-in to be default (and with CMA/TSM etc. it gets easier)?
>=20
> I think the general strategy has been to push userspace to do security
> decisions before binding drivers. So we have a plan for confidential
> compute VMs, and if there is interest then we can probably re-use that
> plan in all other cases.

make sense

>=20
> > At a glance cxl.cache devices have gained ATS enabled automatically in
> > most cases (same as for all other ats-capable PCI devices):
>=20
> Yes.
>=20
> > - ARM: ATS is enabled automatically when attaching the default domain
> >   to the device in certain configurations, and this series tries to aut=
o
> >   enable it in a missing configuration
>=20
> Yes, ARM took the position that ATS should be left disabled for
> IDENTITY both because of SMMU constraints and also because it made
> some sense that you wouldn't want ATS overhead just to get a 1:1
> translation.
>=20
> > - AMD: ATS is enabled at domain attach time
>=20
> I'd argue this is an error and it should work like ARM
>=20
> > - Intel: ATS is enabled when a device is probed by intel-iommu driver
> >   (incompatible with the suggested flow)
>=20
> This is definately not a good choice :)
>=20
> IMHO it is security required that the IOMMU driver block Translated
> requests while a BLOCKED domain is attached, and while the IOMMU is
> refusing ATS then device's ATS enable should be disabled.

It was made that way by commit 5518f239aff1 ("iommu/vt-d: Move
scalable mode ATS enablement to probe path "). The old policy was
same as AMD side, and changed to current way so domain change=20
in RID won't affect the ATS requirement for PASIDs.

But I agree BLOCKED is special. Ideally there is no reason to have
RID attached to a BLOCKED domain while PASIDs are not
blocked... oh, wait

there is one scenario, e.g. VFIO allows domains attached to RID and
PASIDs being changed independently. It's a sane situation to have
userspace change RID domain via attach/detach/re-attach, while
PASID domains are still active. 'detach' will attach RID to a BLOCKED
domain, then disabling ATS in that window may break PASIDs.

How does ARM address this scenario? Is it more suitable to have
a new interface specific for driver bind/unbind to enable/disable
ATS instead of toggling it based on BLOCKED?

>=20
> > Given above already shipped in distributions, probably we have to keep
> > them for compatibility (implying this series makes sense to fix a gap
> > in existing policy), then treat the suggested flow as an enhancement
> > for future?
>=20
> I don't think we have a compatability issue here, just a security
> one.

'compatibility issue' if auto-enabling is completely removed with
userspace opt-in as the only way. But since it's not the case, then
yes it's more a security one.

>=20
> Drivers need to ensure that ATS is disabled at PCI and Translated
> requestes blocked in IOMMU HW while a BLOCKED domain is attached.
>=20
> Drivers can choose if they want to enable ATS for IDENTITY or not,
> (recommend not for performance and consistency).
>=20
> Jason

