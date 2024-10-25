Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 399D4D0C5E6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 09:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CUvjhaqWFz9546lafodPay89Na/B09CoftW5QVh6SwU=; b=wjmHNjdhZxWSDHa+RcV3fJiw4N
	JRyeCR5p7uoJG7pCa8h7QgtWQ/dBXzAr45quyj3QXGpYHuqAWnNoPOC33Y/SrO8stoBSvNPyj3Q2c
	wWxg9ZVRUkmI6fdkCTNwB47B49mV+FKY0zHXSh9zIyQD5dmcNK7QryNcb13EZ40yRWRgw4gufvwED
	+lRycTYhaNuVu1t6kFa6T1ODnX22cpZzBwZgb7h9lf8L1xfKlT9xHeNHWDseyjgg+X5KfCJIDwA/U
	gINYxLXL82a8t0vdh7rQDpOloxML4GNkuZL2bio1+q90cmhO1rDsGd3x06okAjWN1/7juZqKZdsJM
	HOucQaVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4GHv-000000036ne-1vOe;
	Fri, 25 Oct 2024 09:07:19 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4GF2-0000000365f-1fCD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 09:04:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729847061; x=1761383061;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=WtDtX0kVqR5w0Y2MQgA/YawFAUeTJbe/LTaPX19n5wM=;
  b=mnXZ/eMu/NAXX7AbzO0jx7EzDs+eheJhNESilK0E9KX8dMUwP0DEDnJa
   kTYvSfIvHHon0kF8KEcn9e3JHeCcX1nKIm2o3u2QpVHKSzsxCpMu+LkqD
   kKnUUxnGGIivBKrTDIXUgsePNb22eo64SSlRYT5/I+2OmOfpqbfK5RN0c
   Wxrj3YRusIbDatmcWkaHHpZvG5az3zZcDga3Bx6c/GP8n2yPJqjI6re8j
   7Fhx2xYwmXrnVwIiF/K7l4iQ8OB6fJaYQJ7zn+Zsj3gpNOEssb3qWy3D/
   UM1AdfNRu8cnzFg5jZHEVom7ovUpN7MdEjsqMmN6/1sY3knUVcfxzhxtW
   w==;
X-CSE-ConnectionGUID: zhaooUJLSo2SCC4NPBqw+g==
X-CSE-MsgGUID: aelj2ycNTciHgUDbrQ6UVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="52064962"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="52064962"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 02:04:19 -0700
X-CSE-ConnectionGUID: 3vNWbaXNRvuMrKyiG7zlHg==
X-CSE-MsgGUID: s6wGC++TTFm8mg+ynEVfeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="85651406"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 25 Oct 2024 02:04:19 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 25 Oct 2024 02:04:18 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 25 Oct 2024 02:04:18 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 25 Oct 2024 02:04:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MmRxP0P6TlGbJkmYYMgLD4mHP+DzVGhLvWwWc9og2wSRdJff79Nluh5/Iy0IwcvnvbEGE56iqmMWi6bvHnCUPgsuRyjblCVDEpbGzEwQ5J4wESCa9T4RV1T/OLkZaO/FR+g1L8I1CFrRFNtQCYRCuYutB4PvVKohrteOxf6nYHvFNc2WsO3UUuPLVgOx3wnu+wQPXrG8tdXS70VCEbUCg3SQlSyHJ9VJfwcbi7Fag9iWYkwS5XnG8zp2jVQAWscyr+N2zxNqPRp1TGWtE39T1okyz16EaycVaRr2zuISjoywqY8r2EUDwv4b/VocdPPUxrRvaIRsjQ0v1im6hs183Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CUvjhaqWFz9546lafodPay89Na/B09CoftW5QVh6SwU=;
 b=nFYNTFsXNNqyfHQS6pcxb9hZm+0x3z2T9FZ74KqNVx58Vt3wFUiRKsx1nj6NM9cd/68WYfnBEFfJIyIxo7V/wDCdl8rfWA3vK5sZgrXoakuAYZPBaGcoHW3OlAjpzCnjmDHj8CaMjKVbwV6pACK5vkt5nxIylNbo4Y0fNW7wxkQLHTVmyJEfdehIolHBr6lo08LQEaZgwFJqb8Vxu0lhy6iqxPb6M7/lOx6I2gyCg4Oqrges9RQnz2VhPbnJYeAg+eUdH6klppTK49EfIXavsLnkRd0NffAG3gk5ryFP3pbNPK7Un1fkJAqDZwPRx8wI10rQVa/oM/X0YuhflG6npA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by SA3PR11MB7433.namprd11.prod.outlook.com (2603:10b6:806:31e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.20; Fri, 25 Oct
 2024 09:04:15 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1%6]) with mapi id 15.20.8093.018; Fri, 25 Oct 2024
 09:04:15 +0000
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
Subject: RE: [PATCH v4 06/11] iommufd: Allow pt_id to carry viommu_id for
 IOMMU_HWPT_ALLOC
Thread-Topic: [PATCH v4 06/11] iommufd: Allow pt_id to carry viommu_id for
 IOMMU_HWPT_ALLOC
Thread-Index: AQHbJBg51PY4d7qMI0yrivAhGqcj1bKXMN/A
Date: Fri, 25 Oct 2024 09:04:15 +0000
Message-ID: <BN9PR11MB5276BEF20579F3CE7DBA15908C4F2@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <cover.1729553811.git.nicolinc@nvidia.com>
 <ba9ce9b3c8a93c9c790fee52961d075dfbb63ca7.1729553811.git.nicolinc@nvidia.com>
In-Reply-To: <ba9ce9b3c8a93c9c790fee52961d075dfbb63ca7.1729553811.git.nicolinc@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|SA3PR11MB7433:EE_
x-ms-office365-filtering-correlation-id: c01a45bd-9b6b-4618-4ae2-08dcf4d4001a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?JQxgBX21/3SVJl37Ye6PgnpfyjmGW9qj5pPlrtGh48RZ0HHO6dJRmm/5M1PG?=
 =?us-ascii?Q?GqfuybQ6sJyjCqWqMQouA3+4klP9z3WmNKWgyKo7gI9Zvzbr+gb8bHqfwLsx?=
 =?us-ascii?Q?foKpDcNlo7Y/zAc5uIYGyt1i2wZIeXBAmMA8V78d2D3rc41QrGvdJP0xZNxA?=
 =?us-ascii?Q?Xx7c6Kq9z54ZsfrKNq6sRSnrrZdMDfCpCqu35/SoWB8OrQAhFgMfIlQY3t3K?=
 =?us-ascii?Q?5bU8UMCtt2fwgxbKnbgeNRKtBe5d2qSiCtRvoxoUa1vsJkO0R4iVTuQicsqv?=
 =?us-ascii?Q?DyxouHizQT1vWK23d0WedQw2mNBmzte/w99p48C4qzoO+Q4qzuNGLYaxwc+8?=
 =?us-ascii?Q?UJlFp1zsLbGP8Ry2wR7jR/bUgM+CATQz5AeP9rsBPzzKRdIHM+MBU1Vp2cSi?=
 =?us-ascii?Q?JIccJVCgKcTKXgqmMBKO0EhxK7IajmDgtqrMiBuXbcVC7cCPXv2wlcLNRPLX?=
 =?us-ascii?Q?Aq7kowMz8dSvx6XCrHoSh3Vpxn6rKWVL3bFzq5puAgI9wF6ABUQ9Fj85nWg8?=
 =?us-ascii?Q?mwzVNdCnm3tVHZhpfKMSLa3Xs5CWcGZMjpYFIzB1MHD6d56TfT6JWLOyCIdF?=
 =?us-ascii?Q?xsYV73kpHOKJv/DhzBhDJvvVKV/LJQntDo2Pd68kcT6kUfnivNorCXPw4w8T?=
 =?us-ascii?Q?tYuMzbgQ4JQg5O+i7x+eur6biJGG17KiFyXDgOy0BnSKqcbr+WSoZdvCI6Zi?=
 =?us-ascii?Q?05/tN7qK4KOPwWFEA/AoM/+Xn7gBbu16eEpYgRfHiK5eo0adDm2US424uCSa?=
 =?us-ascii?Q?MyJ8blmFuUc8g4DHrG9Pvdd+ayJcMIw7UkWEsPdJXvs+QEdNGHRnlBCP4YGY?=
 =?us-ascii?Q?r4e04ikUX9qiq3EQTxiPbFJFtGxgPVtRlHKRRtzC8Jnra7LfbI0Rh9Dumbc2?=
 =?us-ascii?Q?rLKxs+AtARv5DkF8+Z71zZSg4rbVthQF11ipwNgFHx+Bi5gXDCoa3RbeYbPy?=
 =?us-ascii?Q?GPeQshhbsOGIWOQhOM2b/vT9by/nSfluWf6I/3YqoAQCKYUkiNB2cafZsA5q?=
 =?us-ascii?Q?tVj97zIQVLLw6jZoZXJhVjK+YNK5bC7EkgxjW2EoJ+kb7ZZ7XyBiYg+8hUw8?=
 =?us-ascii?Q?GJqSgB5iDNL3557TimkkjKmHliA5HU53zSM9oqIkj/LmLXIaMBMbwVMEAeKf?=
 =?us-ascii?Q?ESpb6aQ5fcAWT3XLQinyYvqG1Llixiri02GTEEvmjTXqFN22t/MSs7Kh4jUf?=
 =?us-ascii?Q?FpEhpvZHmgb4yx7SoTXpHbXOHyfybnJaPZxd+rOO524bmoJxj1jKqM3p6Jev?=
 =?us-ascii?Q?UqSw8xkHo2unRXy+Mj+ha9xZtB+L8AYsT1vKP72+f1XcKPp9zMSl7gCTjwa/?=
 =?us-ascii?Q?tyAYjgLRFORtD9V0iB0DO2Kp1ogWTUu/nLvu2+SEzAOPvkhTe0olV5TOM/6R?=
 =?us-ascii?Q?kWrFB5Q=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?gU+C4sxZUjBre8Oz0MYMDi4HeoQsH0MOXSMlVMmOUaJn+j3zXHqOvli7motU?=
 =?us-ascii?Q?hfHTKybVZGNCIKL8/Wmp3dvyCj4ob7zYJ1VjG5f3z5G0wwr9A23CkwNiaUGa?=
 =?us-ascii?Q?3PNur4ZWbEl3bNTWD4TmaYBI6rsIV8oZ73elQYjK5sgrLOd8H3EA72mdeYm3?=
 =?us-ascii?Q?AB9CIu5h3xIa7h9NJx7za5r00CzdU5OL3B/3L8RRJX37nHvDfpjn9BXGzot1?=
 =?us-ascii?Q?u2URhE6COZHCN2kX759DnFplcIJQ/ArMnb84yr4nRAYVVD2UH7MQGf2sTlxF?=
 =?us-ascii?Q?339dilr8wzOByyje2jHqUDf1XN+j0w10xPXYVdxVs6VJ+7GiT8kUmCNLdfNZ?=
 =?us-ascii?Q?t6o3h9BiNyZ9Laitow5oduWneQFeiVdB4y7H8vXF4DmYKu470CF6BH83oFIF?=
 =?us-ascii?Q?EssFnk5vTa062D8fntawGkUsPhXhKCTkZsfOOLePfdojDatdbiv/r5ayM6BK?=
 =?us-ascii?Q?2VKxOagHzeONb//gvw4soXUy/CSX2oulkri6M0T3DJRNiFQ7l6WccFeNdkLD?=
 =?us-ascii?Q?H0g8m7J4CnVqHf7UasjmQQSPg5wi3uJ+fduoEP2kNd0l4J06fuR5CPVFiBM6?=
 =?us-ascii?Q?JBvVIozdLjYSq70nTIKpjMxIL/W2gMXbdzy0v6Abru2iRQMgRbzqQ/I0Ilqb?=
 =?us-ascii?Q?iUaonG+Iv8pgZ6art+w3iQphX4fc8z5lLBgcpsX84/1iQ/KFsEg1chhGscR4?=
 =?us-ascii?Q?ILtvwSucoaohRBYSv8S8lhXc6KrEG0Rqcw1/Cis79xKfo5udQmhhO3c8j6QH?=
 =?us-ascii?Q?0VHEkrAI/3pBQiMH4hogXRYtmUnWsGL6CdkvWyKJH5LuGgfq+5/4/CGOutDM?=
 =?us-ascii?Q?+aaaWh/bML0T3XWLyymXNc5Xwia558wfg+W7Hx7Lx5xZz7RBVAOsUsR4oTgT?=
 =?us-ascii?Q?RQdC1hwaBsL3A+CykJapyt3BGEnZrrjR1F8k6JPXnMiz88ebYhyrZH9U5edO?=
 =?us-ascii?Q?VzybvmA3wCUGa1d+VgMkil87vg+TKqo9K4k2qhGXT9MZMimpNyNs6+4loEwV?=
 =?us-ascii?Q?Pbls3lJUkvGWPr27YRXDfk63bu0/k70WmbCMjElCM0m3/eU8lAHTMHJzdUui?=
 =?us-ascii?Q?RSoQeG3TLh6/8RLyGqfjtYag4qBhQo5+qNJXcBvd9IRy36/lQQIdR2ETvDpv?=
 =?us-ascii?Q?cvlfbwb9S5FdPrhYx4Lm0ca/e3qYidmfozSNlJckQnlv2ukKpnbWMHp7E+4l?=
 =?us-ascii?Q?9tctQeH0/9ZYJE+7yqRU6dEaaLfGHiAITA1RxU4/Mh0juy2JbFnCaQo19775?=
 =?us-ascii?Q?GQWZ5tlTTzjNnZVFV+MWI6hAt8ZuJ71AmMTwDP8PSELBVYrRKYfJQ8S0K+1z?=
 =?us-ascii?Q?iU+BES6zLN3OtRKF8NyFq4twClqxW2jyO4Pxq8AIMfiqynihHwGio3YAuGk0?=
 =?us-ascii?Q?vJQlHwVn9u2u762fReZ4Lo2zkrVtR4mNjK/kCMvHYIs4v09M3CDFr30q4joQ?=
 =?us-ascii?Q?I97OxjCKPizkn+olACgKcoeuG8aetIRrVn7SxGGk87hVguoO/97CHVzsPQvd?=
 =?us-ascii?Q?xdqMZG6na0wROWcxbwkOIZiVie+V5CCj8iPmQPgcOUUoIAZ21XW2usYMJK5U?=
 =?us-ascii?Q?GZ2Jh83DeRw7fn4mE4vtiTpC0Ce1SYc9Lha0QIfW?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c01a45bd-9b6b-4618-4ae2-08dcf4d4001a
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2024 09:04:15.1610
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Gg8D4xzCg/WuXE4XHV4ITPeegzrZfa60OkFcw59bQaJHanzqH2JdW2SL489fCB/NsjV8BEzgxcDOCapMkCGXvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7433
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_020420_516095_D15C37CC 
X-CRM114-Status: GOOD (  11.27  )
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
> Sent: Tuesday, October 22, 2024 8:19 AM
>
> +static struct iommufd_hwpt_nested *
> +iommufd_hwpt_nested_alloc_for_viommu(struct iommufd_viommu
> *viommu,
> +				     const struct iommu_user_data *user_data)

probably "_for" can be skipped to reduce the name length

> +{
> +	struct iommufd_hwpt_nested *hwpt_nested;
> +	struct iommufd_hw_pagetable *hwpt;
> +	int rc;
> +
> +	if (!viommu->ops || !viommu->ops->domain_alloc_nested)
> +		return ERR_PTR(-EOPNOTSUPP);
> +
> +	hwpt_nested =3D __iommufd_object_alloc(
> +		viommu->ictx, hwpt_nested, IOMMUFD_OBJ_HWPT_NESTED,
> common.obj);
> +	if (IS_ERR(hwpt_nested))
> +		return ERR_CAST(hwpt_nested);
> +	hwpt =3D &hwpt_nested->common;
> +
> +	hwpt_nested->viommu =3D viommu;
> +	hwpt_nested->parent =3D viommu->hwpt;
> +	refcount_inc(&viommu->obj.users);
> +
> +	hwpt->domain =3D viommu->ops->domain_alloc_nested(viommu,
> user_data);
> +	if (IS_ERR(hwpt->domain)) {
> +		rc =3D PTR_ERR(hwpt->domain);
> +		hwpt->domain =3D NULL;
> +		goto out_abort;
> +	}
> +	hwpt->domain->owner =3D viommu->iommu_dev->ops;
> +
> +	if (WARN_ON_ONCE(hwpt->domain->type !=3D
> IOMMU_DOMAIN_NESTED)) {
> +		rc =3D -EINVAL;
> +		goto out_abort;
> +	}
> +	return hwpt_nested;
> +
> +out_abort:
> +	iommufd_object_abort_and_destroy(viommu->ictx, &hwpt->obj);
> +	return ERR_PTR(rc);
> +}
> +

looks there missed a check on flags in this path.


