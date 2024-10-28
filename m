Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64E62D1356B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 03:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ys5/TLswavGyu+Y+geYhl+9mmzwniTEXjVLUYEhTGS4=; b=ilID+iS/0cqH0UHF76NA1GLIbj
	Aacus/GqEGkHcIYt9EDqegSb9STdax5zUtKpQpZBipW3mKZnMuLIm8DjlWFTQMpx4tlfwLLyIRl0E
	oIVpzDqq5KZLojXpSOHONKhTl/6KFMDnt77P8oknoxQc3pALDH58G4g1IaXU4+h8DdvT2SAIKQijp
	UHz3UabPX0p2triohZO7zm4LK2WAMC3pt3tbqVYIRkHIv0ampZA+y587YleCUtzNjx4OgCVlp/bd+
	Ld81x0RtE8aorZT66MzfkWJpAlestmWtDMp17FZgzbhZCOIVRwX3JWRvF6vZCgxhCy/RBqXl+VNJC
	ah83GhNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5G7Q-00000009PNq-0XkW;
	Mon, 28 Oct 2024 03:08:36 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5FoK-00000009Mmf-00e2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 02:48:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730083732; x=1761619732;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ys5/TLswavGyu+Y+geYhl+9mmzwniTEXjVLUYEhTGS4=;
  b=kUYvH5WPB4hoWAqB7qowms7JhRfvvZpddFlbqIUj/UfNIApt9IQdq2Iq
   e3EgukcRvaeg9rqzkpMmZPat1BUqtxMGeFTOLRZPtOdQXqgAzWUpGXfXd
   s08iHZV/u30MNIMX7kV2U4g2VSP3Dl/Li+v8wIr/WZVMKlN4S7v3LAott
   l8lbHZ/w6ugpM7VuVLNxLmvPJyXJBJU5C2nGM6+Yr3rdtVFUsaWxozAGJ
   Qu/QJRufdyRZ5loUG6w/FkAy5t1hh6tpyS9JY+LNTDD9g8YMHWOJ9plNs
   PhhYLu0wX/inCu2LSDbVOfcV3Bp4CHZj+x6oOh1lF2Z+1tm6DhR7lB1wI
   A==;
X-CSE-ConnectionGUID: mtSJpUoBRDamYKURIsyerg==
X-CSE-MsgGUID: lBQYdti8TRigyBaGkp0Qng==
X-IronPort-AV: E=McAfee;i="6700,10204,11238"; a="41066746"
X-IronPort-AV: E=Sophos;i="6.11,238,1725346800"; 
   d="scan'208";a="41066746"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2024 19:48:49 -0700
X-CSE-ConnectionGUID: x6nWGz+OTGmb9N4hXPtCdg==
X-CSE-MsgGUID: gvMP+alDQz2FqRdGPBlmxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,238,1725346800"; 
   d="scan'208";a="85417924"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 27 Oct 2024 19:48:49 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 27 Oct 2024 19:48:48 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 27 Oct 2024 19:48:48 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 27 Oct 2024 19:48:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dp/o5mT26l3zqMxFrYjlnB91UBQ1+tI+HYoW2ZPI/LRPMgllRMPxESyVkPOYLUYiALM7AId7zqk1ae4XlYft1eaM0EuKWQMz5vw8cCNoRo0gaqLpseeD6tLqE6ikqgdx9j5Y6QjOCovyF4fLNti4gJ79d+E5/pjPYoJdAusdYvFA10wsuaHNxSAJphEaB/ozLymtPY9HPBZrDdltZz2bF+vmIRWthAfyloj4uUGVSjMl07NMLLwKJ1QbOSaCBXsGCxlC3PhKKHZbJFIr9aRsKIdSOKTqa4J+5aX0nQysSMveqIOVc+arY52JgYKY6Ow4cHIYDh8Fva6GIF/4D7b6Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ys5/TLswavGyu+Y+geYhl+9mmzwniTEXjVLUYEhTGS4=;
 b=gnjuSRxEPccQcKBPxxwxmqgtdfd1iJQRFM8M7aPzsaT1ykj91yPLmF6JRkQJYBnABqu3KdGc+1/0c0NmbaXHK5tukpSVHU5HlNgQDrwClLMk+F6/n99THHN4SMulN3iDC7SA3BvVkkPaK1rm1KbA2LiQvvkCo7MilReFuiAhwfp9GMyil7v3Tz7XyYjMOTJew2vaWskUEeMdt4LgxrRkXGtdZDWVMxiP2KgiqLLRS8gz12alqJ7dbENpXeZivu/Zzde2HXozTURBX75vPgeYFATg5I0ZKCgJ6uAyZyFU+odJXnI9yENh1Nj8lMfB6Xg6pCFJPzQnru0W4gr/nLgHCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by SN7PR11MB7567.namprd11.prod.outlook.com (2603:10b6:806:328::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.23; Mon, 28 Oct
 2024 02:48:41 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1%6]) with mapi id 15.20.8093.024; Mon, 28 Oct 2024
 02:48:41 +0000
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
Subject: RE: [PATCH v5 08/13] iommufd/selftest: Prepare for
 mock_viommu_alloc_domain_nested()
Thread-Topic: [PATCH v5 08/13] iommufd/selftest: Prepare for
 mock_viommu_alloc_domain_nested()
Thread-Index: AQHbJziyu7ovWSRFQ062mImzd+5hUrKbeUOA
Date: Mon, 28 Oct 2024 02:48:41 +0000
Message-ID: <BN9PR11MB52762CC1E19941B3F85A7A968C4A2@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <cover.1729897352.git.nicolinc@nvidia.com>
 <f080c65265372b56942e6d1008ee114654a23f91.1729897352.git.nicolinc@nvidia.com>
In-Reply-To: <f080c65265372b56942e6d1008ee114654a23f91.1729897352.git.nicolinc@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|SN7PR11MB7567:EE_
x-ms-office365-filtering-correlation-id: da7d0375-c68b-48c2-3622-08dcf6fb081e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?VvXRmCtuv1YB/SbzIbWAE7klAruicqyX9zw6C2SDeqWoHkU+dudQ+7kGB9JG?=
 =?us-ascii?Q?a/ScLxUhY330XkGHqtu3tpUQHf78zZ6zdnwTwAajp0FZZ3hbRPLXpKZ83dd5?=
 =?us-ascii?Q?U1tTS8YuZJI9icSIqyb9cKB1zeocpRKUJsvztJDdBm0hGztNaF0CBsR3MUF0?=
 =?us-ascii?Q?UcpYXN6OZef5zmXvQOdZJjsKxUwpQoVjRSxOWVEGg0dUdQHcVWUg6DhBD3lK?=
 =?us-ascii?Q?lfvN2KvqaqFW1xVOO1XpuB4v5TuV3Sb44pcFEmgekrnZoLjs55xgJ8WCMiwf?=
 =?us-ascii?Q?ZKVyWp+kx7un870KeGg6W650OYYxjgXVYlrx8NMXfVztMQFJI/jebRobZKOq?=
 =?us-ascii?Q?dTgQ5oAlS8PMHwFz3m1i1BAv+xS/3kaWI8ML75dikOuJBS5eySRROWQdT/6T?=
 =?us-ascii?Q?XDjSNQSqGWDbHrba5FQwaEuviT7Uz+HVGBcw+ViehffUK0gwaFJ1TfrtdySu?=
 =?us-ascii?Q?Uc40g4UDY+0dR1FBCv8rMr5MVaG+Yw+1PSKeFvdrpUNV48vUbxbYUn3A6Lau?=
 =?us-ascii?Q?lYNyFq/ALWGBFTy8Erlx+qAoHLFQ/BSEUTA6xV2zX0PE84sWM8Q9OYPjUBPh?=
 =?us-ascii?Q?Sc5itjNqJj2iVe/x/B1+rn68X0G8E3OAkIvrSR5C/Xy8qg3NZiLOHKI473pL?=
 =?us-ascii?Q?OEKnxmsO4IcIfqCkpjfbusqF6M12TK87z+hMuGMzTY2Z7EAZPEyGwBGNukc7?=
 =?us-ascii?Q?6upts9oELBfnIAp8XSYMkBAcHnY7ImOOzkd9/dJuKnmisHFPsvB3XDnV37Ba?=
 =?us-ascii?Q?vNC8jKLQGxE4vxSbvos0lyRhgndumF5bTrDdjt7+UfE1abGU7w3wuik13peT?=
 =?us-ascii?Q?DXRvdSQ7Ylcxywvo7+BnRmC3yrERT61dyVRVGnBX3lh5PBL1vjj8NKMzBHtQ?=
 =?us-ascii?Q?bBpRlISvpwdJm1v/WnBeww+BOTRlgv4bKtGGlVD79yKk+vAE71eDHBXiioS+?=
 =?us-ascii?Q?x+hfN3yU5Cojy12M8NqpbKmH4EcNd1lW/BLsHDOp7bO7tyWD5yqxqmCi7eXH?=
 =?us-ascii?Q?yY0jFwwgkbC4ZNPWYYZkJKxUESVdRaR6asp2dLh1Kb78fae6hDsgyA8Cxm0W?=
 =?us-ascii?Q?3Ow+gvsYwM4JeeUFKeKOduoXHPmwjP2dcz7zhy+0OQ31S13ywK/YNm9NAf7I?=
 =?us-ascii?Q?ikkpzDaXayCBz0Hg/HUReqh3/qmhAcshgM6MOeo2w3OH/FP2lHLizDvlndjH?=
 =?us-ascii?Q?Kw6rSM9KVoH4qLLK9ldNTTSyhnnVmaEeN+kPJUTZDSEalL2Rk6EChYP1ZrHP?=
 =?us-ascii?Q?8NoTz6xhfl0mbK0VGJ14+anrD5ARh+ZE8JtacBcQfAgCnkIjks3v7N3z6K6h?=
 =?us-ascii?Q?a/D6A/v5Mp2gJTYvybced9Ok/jrbn0zoBOOEbCXelQFm51mG0cNjcEx6UClg?=
 =?us-ascii?Q?4uvR2FM=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?PIfEHtALkoArLSJzgGtyUl5cKlp8bruKn0Wn5x7oLCXCpp0Y4XV0aapPqrLu?=
 =?us-ascii?Q?N/3IGjbVJIjphp5pQPXkouyoQExCXS1PJ90IUL7ZsZ5aZ/wWDtNXKLMSdNhD?=
 =?us-ascii?Q?3KULEHKABlcMMzp2NyjCUy+CC7uNG8yDJtezG5xc9KTIxeiq+q1NyA4qY0uy?=
 =?us-ascii?Q?4GIK1/dZl3S7gt5Pdt4nuEefKr9W62Qz3zALzx2QAyGdL7PJi2UNvlFRXLy7?=
 =?us-ascii?Q?CulUrG+Xbf2X+RrF/P/MgtZoG8TPQENw0iy0jwVPAKJ186sZlI1UvY6cshC/?=
 =?us-ascii?Q?/q0NdtU6cc0u0j2uX4oVOWNYSjeDjnfDU2yGbY0Q4Cyqyudiufv2jngs7IMq?=
 =?us-ascii?Q?zFvM6nn2IRV0m+d9KbltoFk4fTrf5h+NM4AxONGM2BrYlbLQPTur88QHoiHJ?=
 =?us-ascii?Q?xDfo3uSB9Qzguxa8rozWsJqUtsvuNIP9gfrQWJPl6kgRMcdNyDnbCaDqpWbG?=
 =?us-ascii?Q?Fuh5od4AZ0HtSma+EWaKqxinwaH7JghjETIBJ69cnbBYqlsxhIz093qkalMF?=
 =?us-ascii?Q?d2MOskFzDmdRo4NA75qU6Rr0sYhriCfVpSB57fneX0vVNTUJPFhR+lXweYXo?=
 =?us-ascii?Q?DgNuKvD+g/d4z9ftIXO6yAh2h8W5ajgsfvEdNTVKqllofCFodXL5hcIzmtUw?=
 =?us-ascii?Q?L46BdBquTMarIyjeJFNY5lwpS+4BXLWpL47srkM5zxv5MJNuImrmLKwQWFQL?=
 =?us-ascii?Q?3LVSw702ONy/7XB465qcaTAStdsuKPegYZHxhBZuyxk7jsYH/YyvNYFWli2e?=
 =?us-ascii?Q?V5Sc8oaiN/gQpzqu9ntLTsyH5lO1FMJyGpKcMJwGyf/CVfPfSymr1UzCdvsM?=
 =?us-ascii?Q?Vd0i5ncSSHAOBGKtAD6LYOWuGKYh49YRXfCaFKmAy6a84xfbRe+AtlSOZjpG?=
 =?us-ascii?Q?xXJJargSZ3KztfrlibLWoFs8CS/XPsNurGLP4fU/g882clTO0yQiugkZv/J/?=
 =?us-ascii?Q?kEMwy1PWl3FgXCWdgISqZlzGt3HR9+DtKQa+s1fIUnMCd1qaQFb8coME2td0?=
 =?us-ascii?Q?rcryWw3rgRgKmjm3yfa2neuludD0Wwjkmtm+YgioHW/q4XOxYWail9Gu4fwd?=
 =?us-ascii?Q?nHHdpwQmp3F1IAGrkJKy6OI0i4nBmlRr9gHRDs7QCnTHV1H/Gd6wJN0G/35Q?=
 =?us-ascii?Q?7ypMT5NMENrAJ16kgMd+O2IXIzf+AmiLLVq/yoYxS1mxafKxJjhnzBLETJfu?=
 =?us-ascii?Q?D0soqawwY1iH0kpvhuasA5LmVNQ3yY/ldOaVcF8Hk06rzdwkYwpVlOlp1aYn?=
 =?us-ascii?Q?br2MTsXqIfn2llijGhk1Q0WTc3KZg0kMWtGvN8WKv70YzefGKFzu202uSHXO?=
 =?us-ascii?Q?F9CzORWftWxhXf89sB5pJ1Zce6JU+o+bbGwYXBsRURzlCjNr6SkraWXDJhV9?=
 =?us-ascii?Q?pjWDKmYUWw0IqHbeYdcImi23sL7p37Ggn1Ot0Idpc8LdtOAVvlV19tmZfA0o?=
 =?us-ascii?Q?P5ZMHXYLs/6DilDSnkCt+8jyW3DldAHtog/NsDMq7MpHVljcu8ugDA6HXBLf?=
 =?us-ascii?Q?EgWacfsoRHXFt4HavVW4mJYH/Y3lQdwreiMPS1bMXIHdjE12FSEzSMQJvJWS?=
 =?us-ascii?Q?0HHpxVILGpna84sf77oBxPpgoitHCOc/Nd4uQ/SP?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da7d0375-c68b-48c2-3622-08dcf6fb081e
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2024 02:48:41.2974
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7IYMNlACrV5mTm/yzL0oSGdoIvgVFBS3TlELIea1J830NbiFGaEj1/dHXZ2lJYXDnIKOdUQLKiqln7viFcOJAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7567
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_194852_115260_C1978504 
X-CRM114-Status: UNSURE (   6.64  )
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
> Sent: Saturday, October 26, 2024 7:50 AM
>=20
> A nested domain now can be allocated for a parent domain for a vIOMMU
> object. Rework the existing allocators to prepare for the latter case.
>=20
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>

Reviewed-by: Kevin Tian <kevin.tian@intel.com>

