Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E938E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 08:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HWwA/w9PIayprDHAy2eIq8RVDwDsLbSdduEoVHA0KFw=; b=2cej8Yz4vjj25Vl/pNDjZgNy5U
	fq4FsQTMDuVmVlOyIMxM9hjh42tNw4NZrydKkSsgXXRjNp5MY+Y9XNWuQlzxQr+HN5I4QCwVy7rLe
	fBRTQqr8Vy2hHFcC/FBaZkUCGLzFmO/F129xhyMF3JbyH6/41yLztcE85Wfk8HP9YyQlsf/6Js3UN
	+Ai3x2rMUNbqodNHh7lzuiFN0CCDthglKxorrfA27b/g32QcQy69TZUSjRpfekG9ECyBGyse55Nir
	AulqYzYfe2Umv7u6dzXZxLuEsS1ghFkg1wr2FiBvWSVQXIQCci4e3H+767I737tN8T4tnN+OVLQ6J
	fXdUqThg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLHpW-0000000EBLw-3oU4;
	Wed, 11 Dec 2024 08:12:22 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLHoR-0000000EB34-3SRP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 08:11:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733904676; x=1765440676;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=yhGa/TG5Bq0lCz1K+9Swk7WdiEQgPoRLSmBLs0/2yNU=;
  b=dQnYw+FoZyARp5zlCbv7+G89WpPWz61cC2wtg7umbVhxTNGyjJvhv0wO
   TQJWIMwj27NzPwgHLY6AVotzA7covINU3TVaqczDa/NuOjhUWsha8m7h0
   3a30N3VDbi+eHbH61Gjo+xNB05vrU3VoPo+A9sz9flTE9BaqYLz2ur9Df
   eLvGrruPYN4musIe61sGptZTdOmWEr0qosSvQ6FSjqCl6Df1X/viHtfpZ
   tq4e4Ac2CjMABNiBdGjM/3hgYbeylHxZdpFUbh2BfdIihZGmpUZuDBW8G
   pVoJqtAZcjguDivqkRVwWkQHohe4rKtGVjTH/V3a7/EZLe/TftTWCc3A7
   A==;
X-CSE-ConnectionGUID: rfR/WfwnR4eUZQeLg7WhyA==
X-CSE-MsgGUID: EQxR5ogqQCuloMeFiG15RQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="38057135"
X-IronPort-AV: E=Sophos;i="6.12,225,1728975600"; 
   d="scan'208";a="38057135"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 00:11:14 -0800
X-CSE-ConnectionGUID: 1tXmivoBR92kpnQ6p+CsaA==
X-CSE-MsgGUID: i2s/6tQhROWDAXkUqKIG1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,225,1728975600"; 
   d="scan'208";a="95902844"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 11 Dec 2024 00:11:14 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Dec 2024 00:11:13 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Dec 2024 00:11:13 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Dec 2024 00:11:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qeOIt2bub9ZoRTD4IX/joncZVQoqjTx9pVIf/xOitqBxzDdsQtP/VpOqaQvGX271sRV2nBHd8hPO2o65Sl31UJm9O2fifAXjsuBDx02D7jI/Ji/vTvID8ssl1VXvd4ZIPxDA6ukGXlVfPKu4c9dNo5KzGXiF79UEJCcRtUL+f2rD4k4PWgzmEss7F+Z9ly+ItdOXax0103FIfYTeldImQbEBv8zyWZgk8WILvjAjcOCenzQD3c7hqiukz4EY27OsbUN6hkr0b2KiJT+49RycrV1+fbrIwnKetvwQthjgb/urwjR9vdPi0khlcYtzJafWUGVDZAtfq0/IukFAmfcDGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HWwA/w9PIayprDHAy2eIq8RVDwDsLbSdduEoVHA0KFw=;
 b=F3JMyS+m5jhdZPudANEy9qD3kwqISLCQM5lyphlxExywY+AqeyyZQNqgdqN/CveyFfFBkAvhwScZnW7shjKu03w1zK6EeCNwnpx9B+a3i9mNhaKgs3AUsgYjbUsHBpHpFX1of05vkdh8+wZX+X6EVYcptw8xtwjBbXbTKWWDcWQq7RXkZV/rFARvQCZPp8cNp7LW/eDUt95f/UxXN37Fgay1xiU+K64QndAsWWLIdUX3yT+dP5nz5Q8H+ALAOrOPUekBJSQZyIGvtV+fgbBp+mMpb2jUuPBEqasetFrVQFLzSfhd9UVDcqVxroKjU502Sp5BsRqK1RTxVfJGM9uMpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by PH0PR11MB7634.namprd11.prod.outlook.com (2603:10b6:510:28d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Wed, 11 Dec
 2024 08:11:03 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1%5]) with mapi id 15.20.8251.008; Wed, 11 Dec 2024
 08:11:03 +0000
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
Subject: RE: [PATCH v2 11/13] Documentation: userspace-api: iommufd: Update
 EVENTQ_IOPF and EVENTQ_VIRQ
Thread-Topic: [PATCH v2 11/13] Documentation: userspace-api: iommufd: Update
 EVENTQ_IOPF and EVENTQ_VIRQ
Thread-Index: AQHbRdBGsjaRYZxdHUeCg8S/9OS/H7Lgu12A
Date: Wed, 11 Dec 2024 08:11:03 +0000
Message-ID: <BN9PR11MB5276E09D5F2206804A7C15968C3E2@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <cover.1733263737.git.nicolinc@nvidia.com>
 <a5025cbbd16f9c12dcaae7a14868419f17ce1d16.1733263737.git.nicolinc@nvidia.com>
In-Reply-To: <a5025cbbd16f9c12dcaae7a14868419f17ce1d16.1733263737.git.nicolinc@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|PH0PR11MB7634:EE_
x-ms-office365-filtering-correlation-id: cbceda59-358d-4ceb-3e49-08dd19bb5b34
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?T8VmGMb65PgbugUziznPkVAToK13i9KpmhUVGbgm1eC51O6LGDzjJbFfauwh?=
 =?us-ascii?Q?TXajHqr/5/UTT8jJEhm1qkM/s8PK4DE0nemhsh+4q86XDkEProMnQrs5AyA9?=
 =?us-ascii?Q?8nBPDIBrbWTvcfZnjo7HW0iWkOJh0yWVgnW6TuCgu2AS5MTWD20rhermyqbt?=
 =?us-ascii?Q?8hyVAJhrtWGvc1Y/u9+woq/tw9Hs41deezXbjb+wlrBC9vqDSFn5AmLI8hwx?=
 =?us-ascii?Q?2TQLTrHnL6ZbPEoMneVq7aRMM8BPW1ZsS2G8jJfLy53FKsiPI50nMeLFUBEt?=
 =?us-ascii?Q?nD45AwuoFYGYOpHBaGFxSmtARAQYc1Sb23WOK4c2li3+UzufvHVdmb1JM50N?=
 =?us-ascii?Q?ip9NdkjKIBVen3krM/ey78T1RQIyJFxNJz1hOGqxdl7kjFQXfSZoXl9Uc2vz?=
 =?us-ascii?Q?gMgmwW3Drlai/PJ0RR1ZJFqz1uczeCHVjU1FuY0YPsfgWSwXT4dLFg7GXig0?=
 =?us-ascii?Q?7V922lXHgl/qfrSF2zsKtNZgI25sLEpv9cfdjgW0dDCZ+0jmBJm3skLmBZ2K?=
 =?us-ascii?Q?gH4iYhhDUUKl/aMTDo45NfYFGA+nn0Bt5vNqAeW8IY2gNQnuEokkhd5KBncx?=
 =?us-ascii?Q?2y1gRsE0RA6TBvQZoRNKUcntpMTDfQJN42cd6uS49sRGWaj5WtyZyDIe1y2o?=
 =?us-ascii?Q?tjI2T1+7kOaKPp/q2waEA1Z2cKEjlnVRnRyf+hrcs3M4SM1b7+PgrW30S0ii?=
 =?us-ascii?Q?IAth39zvwf+UXMUdtlLKmm47hCNVeN9bjaTVofWs/RfiwxUJxs8eOVTCe6V/?=
 =?us-ascii?Q?pASO4P7XaJiEb8/Grwlr2+wEDhCLTJo6Qaye+rc/B5tgDTZlH1sb+HSSrT+d?=
 =?us-ascii?Q?JHkOn4BAQs4eM0M2FmvB9ltOOO1gVkXVLzISKsAMvS41wT8u2BJd1DVM0/p1?=
 =?us-ascii?Q?B29kqODGJDoGzi6HRnj8mpk7JCend/xqZyYcv3t0BEcsem8KwwHyjAXpjpCn?=
 =?us-ascii?Q?JkXdbySzHpe4MUjKAmHaTRWm9rMjGivUrkEAAnHlJ4Bx6S6pUcLGkKFdzo7p?=
 =?us-ascii?Q?H48PkRQVP940ph7AwpU+CwMw88Db5l9iV5sjqc5XcydkiAj6ijNcjxU63C2Q?=
 =?us-ascii?Q?cI9se5mQ+tixypu6pGzPu0My6GFwUMy+MhsRQMlbybQ7gPsw2KOEWQt8OX0H?=
 =?us-ascii?Q?LHOQYJ9G7tgTtV/IfZG78/I5FJbtya8Ty/OlFnYsY0Jh5zMEZnyQ++Zq0U6N?=
 =?us-ascii?Q?tH2u4u42RyFuXP0oMJl0GY9sg0bx9hihl1uEiW+OjRmsG2Hha9quuY4xAl7t?=
 =?us-ascii?Q?tbbbgmJwbg5s5MJgsfKHCM0LADfQFJijMt78CKoY4aWQ6nRN0kwxyL5sY5hn?=
 =?us-ascii?Q?FggOdEa8f2ZbTRNr+Ea5YkpfbRHihNT/4bZEAC+TWGP45MJeVS8y8tltxcj5?=
 =?us-ascii?Q?jPI9R8VvLYbJD5UEiZaOZFu3mosMf725TSeElngXxn9GD7WeVQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?9uBthPsDlJCa9MeTuduWSNUjemrzUBXkLNUX4AlbjDmBhX4CzD0VijcyEJ9B?=
 =?us-ascii?Q?5tpJRRu2EXQTq+fc7h8WYe+HGEwzVmVIOZ38FwOS7j4c0DYaqvxNPUWOtAzI?=
 =?us-ascii?Q?UXjGPZGoxFPXsKHu+JwC8bIw5lzQk0aL/+HXnvIF322PcWgIjE818Rod5Qgf?=
 =?us-ascii?Q?Xo4NZzuiE8/qnonB8BtjQPHOnnxz5glo0uWDR1MxrkVSDLEogaemR1y3hGHS?=
 =?us-ascii?Q?DgWqxxG72Vf7dBrM9YuJK5HVt0pZzkhckLpJqlwBgZGrqYvFrJOhW2WVn+K0?=
 =?us-ascii?Q?EInzaVxMWdaf97spPGfYd+V0w2eqrrAvj2JfsXVJnlgkusWNq1L4DcWtor6G?=
 =?us-ascii?Q?x3db3wZ8W1HC22MUcKeX+/8jh0V90phf1HgM4TR0Z/UNvxbiGFKHKulZzgQz?=
 =?us-ascii?Q?k0VYSg04tIxrm5B8dqZPRxC82KNeUwJ3RHRIJmsytt9hEIybK9SbsOpqQ2Kt?=
 =?us-ascii?Q?qvULwymA/zquwilvRFPvnkGzel7EOanKGCRn3/Kolf0Utu7HOgrN0Eu1IKqU?=
 =?us-ascii?Q?o5KEvHJLhjKumqkixj/TkswtGrAV8vlMjnh7DKJccWjE4vJO82c7blAoMJ7f?=
 =?us-ascii?Q?sEX5aKgGu9fpVFh4pKhKG9Pv6KK3dqPBxQ1S5awYYQ70GV5nI9prvVyILsCV?=
 =?us-ascii?Q?FmqeXes8YRoNmVaPQnU3ul2VXvWza1R/cLcOAPuEa++1gj+YZENQeMLsV5cj?=
 =?us-ascii?Q?+I1QB2Vf+bsgtqVHcVJZKurwzBqNk7yadzO8Li0fREMCFeLiK2rTF49GzpnX?=
 =?us-ascii?Q?duMUt1imtXxpQy4ZqFUBoW0qCykXj0AmMriaSQKWUmeEg/MYAVkj+5BF2rBc?=
 =?us-ascii?Q?6Cj1VuU/gP8ImVOO3jHWIN8eCYgqQN5HJAIjuYPJSEI5FUUmXad2m5Koeyqw?=
 =?us-ascii?Q?f3ZpdTHXpBnZahX4sgrSVsB2/s2fFoVN0J3vR75PAGoKEnE7l47h9SbUAbXl?=
 =?us-ascii?Q?CrDGAzPVVe+aHqMcE/msowm7drf493u3NJ6oG2CjdNTGzj4wt+epVec/3kIQ?=
 =?us-ascii?Q?6bibb2Ui4xuJP5qhNth5hQh9hXAcESnID5jsxKe41C105vTdExzoK1AfK0hz?=
 =?us-ascii?Q?3Lmc/StA1y3O2YUW9j6GZ/puddWURKoBnPwAG5e4C0gO8ngeejHZzuGhTDNV?=
 =?us-ascii?Q?df6JmuW2JJy3FTp2EIUUIDmo3MWB/t2KnP8DdIMBYdEKqvumXjZPEFqioNp2?=
 =?us-ascii?Q?nF+G+q4Ntpu5XOhbsATUXj79R7fmjGn902elkz3MuKqnOmrqAhlPik6KJtOz?=
 =?us-ascii?Q?Yd32rlo81BM2Os4rtthHnoBa9szkxOuRXzX0yOif+hA6YoYJi7c827n8H/Vj?=
 =?us-ascii?Q?k/nQunh9XT4HtkrUdiXLrKQUGoEORIYpkOxQfJa3O+n0cEfQSSIuxoeN/vP2?=
 =?us-ascii?Q?SKO6kEeD8McPHooG9xz+5BHhG8Np38X0hJWfOgPIivYtBbuMUf43Eg9WiQkn?=
 =?us-ascii?Q?LgQ8EaEttEHVj+HPCDoauMa6XdOrjSrgqcKBcAV4A2o3FYFoypKdkzvxn1Dl?=
 =?us-ascii?Q?/2NMJib1lqpPk/7w19QbrA0DxZ+M8WKLpADF8wyMZycoJrvh2eem1WlfVQJU?=
 =?us-ascii?Q?VCO2nJ2NKL1pzPxB0KwQHdPCmI404Xo8uFTVAyE4?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbceda59-358d-4ceb-3e49-08dd19bb5b34
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2024 08:11:03.6006
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KQXsLDOk6DqthjYWLml1ErXJ7dvB5InIyG/sWtb+bFaCIsDtjL29wXgRLp2JI574AyHhRENxWL8aBYrNKUGDxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7634
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_001115_925746_8A6B3266 
X-CRM114-Status: GOOD (  27.92  )
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
> With the introduction of the new objects, update the doc to reflect that.
>=20
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  Documentation/userspace-api/iommufd.rst | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>=20
> diff --git a/Documentation/userspace-api/iommufd.rst
> b/Documentation/userspace-api/iommufd.rst
> index 70289d6815d2..798520d9344d 100644
> --- a/Documentation/userspace-api/iommufd.rst
> +++ b/Documentation/userspace-api/iommufd.rst
> @@ -63,6 +63,14 @@ Following IOMMUFD objects are exposed to userspace:
>    space usually has mappings from guest-level I/O virtual addresses to g=
uest-
>    level physical addresses.
>=20
> +- IOMMUFD_OBJ_EVENTQ_IOPF, representing a software queue for an
> HWPT_NESTED

now it can be used on paging hwpt too

> +  reporting IO Page Fault using the IOMMU HW's PRI (Page Request
> Interface).
> +  This queue object provides user space an FD to poll the page fault eve=
nts
> +  and also to respond to those events. An EVENTQ_IOPF object must be
> created
> +  first to get a fault_id that could be then used to allocate an HWPT_NE=
STED
> +  via the IOMMU_HWPT_ALLOC command setting
> IOMMU_HWPT_FAULT_ID_VALID set in
> +  its flags field.
> +
>  - IOMMUFD_OBJ_VIOMMU, representing a slice of the physical IOMMU
> instance,
>    passed to or shared with a VM. It may be some HW-accelerated
> virtualization
>    features and some SW resources used by the VM. For examples:
> @@ -109,6 +117,15 @@ Following IOMMUFD objects are exposed to
> userspace:
>    vIOMMU, which is a separate ioctl call from attaching the same device =
to an
>    HWPT_PAGING that the vIOMMU holds.
>=20
> +- IOMMUFD_OBJ_EVENTQ_VIRQ, representing a software queue for
> IOMMUFD_OBJ_VIOMMU
> +  reporting its non-affiliated events, such as translation faults occurr=
ed to a

non-affiliated is only mentioned here. It's not a standard term in this
area. Sticking to the later examples in 'such as' is straightforward.

> +  nested stage-1 and HW-specific events/irqs e.g. events to invalidation
> queues
> +  that are assigned to VMs via vIOMMUs. This queue object provides user

vcmdq is not supported yet. add it later.

> space an
> +  FD to poll the vIOMMU events. A vIOMMU object must be created first to
> get its
> +  viommu_id that could be then used to allocate an EVENTQ_VIRQ. Each
> vIOMMU can
> +  support multiple types of EVENTQ_VIRQs, but is confined to one
> EVENTQ_VIRQ per
> +  vIRQ type.
> +
>  All user-visible objects are destroyed via the IOMMU_DESTROY uAPI.
>=20
>  The diagrams below show relationships between user-visible objects and
> kernel
> @@ -251,8 +268,10 @@ User visible objects are backed by following
> datastructures:
>  - iommufd_device for IOMMUFD_OBJ_DEVICE.
>  - iommufd_hwpt_paging for IOMMUFD_OBJ_HWPT_PAGING.
>  - iommufd_hwpt_nested for IOMMUFD_OBJ_HWPT_NESTED.
> +- iommufd_eventq_iopf for IOMMUFD_OBJ_EVENTQ_IOPF.
>  - iommufd_viommu for IOMMUFD_OBJ_VIOMMU.
>  - iommufd_vdevice for IOMMUFD_OBJ_VDEVICE.
> +- iommufd_eventq_virq for IOMMUFD_OBJ_EVENTQ_VIRQ.
>=20
>  Several terminologies when looking at these datastructures:
>=20
> --
> 2.43.0


