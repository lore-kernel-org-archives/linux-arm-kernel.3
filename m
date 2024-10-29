Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71E2AD5B16B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 08:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4flJoIx9eDm/QDRqPpkqGN+aUcCrq+wR/vZceqhSUZ0=; b=2AmyJN4f/ezQDuRkjwN7/pu5tA
	6ZnAtjlq/V36gBcVqI485YUBJMZFBw9DxmKaMcRS+uWRheXdu4RUfKc6LTOjqvGdc3Z5JDyxAGpxX
	DgExyiEPRFMqgs5wIknymE58vdSehaY2GfP2qk53k+JmdfB7xzUn5DFHKF+CJ3nY3ac0tN9aitHj/
	Uaznk/5BkN6+fP3NeHzThcXUq4ISkA72bUivD39ID6B7dG0Xxqg9FYwL5pkDNkJrMGrP8eBnk4eKZ
	tHDgWpW/OSD4Q15kmD9mdekg540ehLluJUVrItPei4nWBv4VbVL4QXWJu53G949w8OAwDxLZEPXPC
	1HmmmCyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5hcm-0000000Dgzf-3DE9;
	Tue, 29 Oct 2024 08:30:48 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5hX6-0000000DfiI-2N2o
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 08:24:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730190297; x=1761726297;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=4flJoIx9eDm/QDRqPpkqGN+aUcCrq+wR/vZceqhSUZ0=;
  b=IVwMAcVmcmADNkcnbKOALCxN+6qQv+bkC1+z6xuMXD+NwclOgmkiryru
   FyHy9zKC/+DWylDz9llLaEmqo7TeoCMR/5T19L5j+xV5mIuQ8qBoXxKcO
   /ATBLvcPjrm/AWhVzzop3Rdh0ynNbvCkgvo/KT5gdM3bg/XmaYud4tv3F
   av0YHR7g4Kcg8hC3sqmk4yU4V80hpdOTHF9yWwtz6MyJVy51ZJW+k6KM8
   VmAU/7ZGYrik3u6m6NmJZizTmEXDxiScrzkgq35kD2PMvJxpNLKHsP0GP
   LMYNHB3Jzgg2x+gEKS0xI3nhf1OOjFn+dfRQ36CxR5EwOwMtrRt75g5nY
   g==;
X-CSE-ConnectionGUID: iSBfyBb2SP6Nl1Wq288sLw==
X-CSE-MsgGUID: 1EQ09hjtQf2xbbv01xBHnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40914485"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="40914485"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 01:24:56 -0700
X-CSE-ConnectionGUID: WUBR+rVfRwixjfOG3qz8OQ==
X-CSE-MsgGUID: aQNMmH/TRvG9FKmcTj7UNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="82308413"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 29 Oct 2024 01:24:56 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 29 Oct 2024 01:24:55 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 29 Oct 2024 01:24:55 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 29 Oct 2024 01:24:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HJbinWpnEiwRO2r9poPwS9Mk0EDT11y1WDkQGFPLLuJyr6l8pglgTWvG1Icy27rWZIKWMTU24mBlK2w0srVtlplPJxiIHL06DszNkGUrSJ9uREZnk9Wkzx7kfzGcYQNUcWrPOUH8mHC1qr+c4/qD1eJf7CnShizTGPmWiDiPSBRCfZElr3vd4aNFSz2U6AuoO+nGXP+Dwjmj6ZsX8vgRQ+7XAAoRCYnFtZu3Vwkua8vAfIvbI4XkSQ500xVtaMteF5nSbsOgEr9AjVm/8t02DwCRVVFyMq6hvmmUfiiTaGRNm9QymauP/w2b8haiZeRldwnUK615hLcxxMUIAfFxqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4flJoIx9eDm/QDRqPpkqGN+aUcCrq+wR/vZceqhSUZ0=;
 b=x9i7K/1CBT/ZDsnQpNdu9jjWc9OjHLOjJtvxYMwDq+cBJvj4IF2mrJ+i9PU9dV9w+EoMII2sDCLmt8IdPsqQsUnQNJnEEKGZ5vD3clKf6kDwc2nLeN8swdvHlGbbvh3xp5loTwllHbVQZrr180Z5/f1GGt0hIaKxINsGmNNoCMoqrzXXuzAd+tQPhy+L9UwTAC3iZyBgj6YhCrRKmq9h7MivMrgG9sVdaY7lRwLtZkA9EhP0cLEX87EfSfqGKOQZOPz+zXfAI8LVT/5aPnBRZZo0JRguonr1BcDqmTyJ97Keuyf1Nj9eZkrzLaCVrj13WntYqAZ6ZRAwM8GlA/pkYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by SJ0PR11MB5133.namprd11.prod.outlook.com (2603:10b6:a03:2ac::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Tue, 29 Oct
 2024 08:24:52 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1%6]) with mapi id 15.20.8093.025; Tue, 29 Oct 2024
 08:24:52 +0000
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
Subject: RE: [PATCH v5 06/13] iommu: Add
 iommu_copy_struct_from_full_user_array helper
Thread-Topic: [PATCH v5 06/13] iommu: Add
 iommu_copy_struct_from_full_user_array helper
Thread-Index: AQHbJzjKLV3ZLBzI4ketBw7Z/r4/orKdaT5A
Date: Tue, 29 Oct 2024 08:24:52 +0000
Message-ID: <BN9PR11MB5276B02140C9F5021622CB388C4B2@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <cover.1729897278.git.nicolinc@nvidia.com>
 <d22517338a5c2bbd4c1bd5569f4409412206e100.1729897278.git.nicolinc@nvidia.com>
In-Reply-To: <d22517338a5c2bbd4c1bd5569f4409412206e100.1729897278.git.nicolinc@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|SJ0PR11MB5133:EE_
x-ms-office365-filtering-correlation-id: adb6c4ab-4761-4866-3225-08dcf7f329bb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?F24Y9zicQJh0aZYWpKLJvTXT1lya+OhF8d0W20TPfDHB59dXUgne5UeCObcn?=
 =?us-ascii?Q?39RXMgyIB+Q4Bz+X7cf7/l0Q9HXJkr3kSNVqMF/iwlCOjZ5b7gQe7rRBTS2t?=
 =?us-ascii?Q?PxmAp272JABDYJ3VDFz7likJw+AzAFFq88wdOU7ZhYAAMdSQgBBu0dlzEk5v?=
 =?us-ascii?Q?MYTX1+NoJibD57WJ3ATakdOLE/mvlnqNcV8fc6dRTGlpUq6mKqYEaVGVwhN0?=
 =?us-ascii?Q?Hh8j3yZxvE5YKMHJ1sZ4a1iA+KTajnYw9118IPduCagjpCF5d86uwpwlHUyy?=
 =?us-ascii?Q?wZygLw4A2mNRsOrWm89r18jxMVBPBAZqInplvD6S8D+sGyca+bNvgnFe4PrS?=
 =?us-ascii?Q?e9DEdwmnFNMdSxD9gjDxh0ALKhwT333s5Q5aJgeVwz5qLIkJIQwrBxCPGCB4?=
 =?us-ascii?Q?GeP3RaUibYNlGYByssPdTSreHin5aF3070h9L2LmbEK7OVCGm8KE+Pjn1xth?=
 =?us-ascii?Q?IFlj9z1RLQlaNGGUwLC6N+KX1owB8kOo93xhKNY0E+voMULCINLlb/B9skJP?=
 =?us-ascii?Q?9Umc3RpSPsbxN8Upn9wo3cXU5rZJTNpL56ha67DcsDbwcZt575or3p5CGcDa?=
 =?us-ascii?Q?KJNWPeL9H+7ilCo+5OTNqnci57mrSr76c+6sOdkDz6fHrdKrOJCPnN2oFtZi?=
 =?us-ascii?Q?fAMP7HGy45+if9bLozg8aGWLdwacHdKR5cjTr5Tf58MpRP60UPncUglONH1l?=
 =?us-ascii?Q?l5JKglNG2QF3Wn+TzzCm7UWkq5h76zOgUcVJfdp/IYlugvBuvQWDIaetkhhm?=
 =?us-ascii?Q?11pQicz1MDlDjwlvx99+LRF3L8EGNCbFe9Q5ObTgulH91f0BWSYrM/6tM+p0?=
 =?us-ascii?Q?84zs9XkqGI+RpQc1KxL4+p0LdwCgRNfrGx0Z7VQkeICKdbgvJN5/KJ7CM8oy?=
 =?us-ascii?Q?pWfeq8ephMiffjhAm8igmNEmAWOG+P3ibjdLnKkKnsfiB8p2nQY0srujwHAG?=
 =?us-ascii?Q?lM00soHVZVEh8yU4I0nfE7Q+kWcVgGa7V/9BIaqkRfPDVFvpFnnsQQD1tNrB?=
 =?us-ascii?Q?/0iVmYexavR8C6csXSYRXlWkrbqkfha4e/UX2eDUacoB+rpt2CRfKI88N5Bo?=
 =?us-ascii?Q?jgBJzFLsUR5TSc1R6J0wmU2mTm+yUGMt1yQpNcSQeqf0s+OQWrGNTxvq6jPP?=
 =?us-ascii?Q?6UTU0c1xCHIUdB/3Pact9Kk4rC5FqkLDlFYPYPvlQlUpKBohDwhAMh+hklrJ?=
 =?us-ascii?Q?LjFy7+jtuBfSBGJ/DWzBE9QJSkvGxSCQjmZPeex1DdOWCdJR6GOEA3ZFnLTJ?=
 =?us-ascii?Q?Q9tLsr2vvLc6DBFj2OCED5IDOV3/MsrbmWOYOLbdNXo2/8veplJQGnOeM2WM?=
 =?us-ascii?Q?/mJOYHpZCIMuWCPdeaXzvtANQ5i4V3Hcr6UwAxFRyQYpwERLQHGiAjbZaFx6?=
 =?us-ascii?Q?7VNzlDo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?X2tUp4ITFlJERKvMbC/Zrlm4sqTzoHys1/eNV90VIizQfRH0+In+M1xArZa1?=
 =?us-ascii?Q?ar19/1VvYYrWyGJp6qKdPtQVsd1XTvxTdBh6lwVmaVvKgpRUWwCXwB9SLYMK?=
 =?us-ascii?Q?VOxX9L+h7lKkuGclrvgSjyzVAwckXJh8J7iBK244x5hCHh6wWQ3uvppwLObk?=
 =?us-ascii?Q?MiZvcUIcISQqJBsK8bcufiRz7K7WWoKUI7SPR/2M/zIxsh//L8qo/ObeGlcS?=
 =?us-ascii?Q?5K8skYAk4JkrILvlOwCKdLuaRm09KpmUJb8HmWp6XBzpRYnYTJfZBS9Go7w1?=
 =?us-ascii?Q?knSBeJum9imu7sT3nEzj41C5ggE9Osh7dg7EAdOwyaJ6F3nhzUtFHtHqjAnO?=
 =?us-ascii?Q?Pjp1TFPx9TXz8xFCOU9djcxwtaAulcKLxfbha9G1g6EQD2K8PgVMxWKcnRWD?=
 =?us-ascii?Q?/a43HuYe4PAC22dXUEjkFAJlvLwIiZzZ1YqvBsXJkCW48Y9r7ufsbONMBske?=
 =?us-ascii?Q?vCGWeNB9oolsI0MMSuMWjqmJP66T705I8aeEGf5FFeJh4+9X8AWtEeHog6kG?=
 =?us-ascii?Q?sfuiNqrb4dGmoJYYxwybVVbm61RjUizZiyAwiDow3riktIX2K80A70rgpQTz?=
 =?us-ascii?Q?XIGb8HjPhtQzCL8J5NkWyw4hl9C0hZ8pUIOcCwsUeGEdL6lYI2ToHkxGgfDI?=
 =?us-ascii?Q?b0pA6fW40quoXVZiKiyj917vNKGv668aqzVfuMfPN5wUTK0vGRwKEUWEm9SD?=
 =?us-ascii?Q?Xysaq3GQOCz1E0YNElAuTkRdo+gHCfgiretlKcBAcbFcGIMmqZq9d+OksGcp?=
 =?us-ascii?Q?X+DOPeLLvl+FneNoBRNQAl9dIKO5cnc7XSf/voU6RhvDUzOp64QpxOKSJWQT?=
 =?us-ascii?Q?Y79sYFqd6LxWLg0OZrSsc4ubjcjL7J9yuixETZnAV7niw8abZiLHXCVp0x1w?=
 =?us-ascii?Q?jH/RXeNASOw678f3uAJNBxbjq3pX4OdDQ2XwtG/XQ6x0hqZElAgPQ2jPEeyb?=
 =?us-ascii?Q?N1JOi9O9lVrcVjUG1+xBR6goeX5Opfl/h4jqFKX1WT3o5VdmubW1YllfemvF?=
 =?us-ascii?Q?p1EZCcDkpAZd+BoV7vNOCCF3HLXYVCsVBhe8B5A4ProEipCDpHw8V49noEiS?=
 =?us-ascii?Q?2srFNtkK5zeRHyA9uqI3fYlQtyICADEJJZBAKkAJ8eQf6IDOAoNu33VWxszu?=
 =?us-ascii?Q?UzhiRu980nxnjY8PBQVoYS6eV0tlY4S8wSYGlPITTUSL07R5fnDsJ42sBrrP?=
 =?us-ascii?Q?P4bBVETB2GsYHHOCeb7GNKIfhNhiTAKm3BOl9lSv+PvZNR7yndjmzWcaNTog?=
 =?us-ascii?Q?+UwJ+rIksGbKWlu7fn4Szwt878DIH8zQAQlyiHTygQG/3CTD6Txb4fvjmMLH?=
 =?us-ascii?Q?LHd0vGZIEH3+KBVScZ7NoEl9SAaIco5vXmxstJdRybQ/Xvvha1QOUCywvztE?=
 =?us-ascii?Q?WQyTlx9WVE3Ertnc3lJoEVY5LLnunzTqcYxPsXZeX2STnXBlPrZ9VFIiam5C?=
 =?us-ascii?Q?pQdPGS+UNFDiXgDluhTCLtUSFaXnvn26cVGq6kCXPKAIWMtZfEzuDeouLRzS?=
 =?us-ascii?Q?A/JGHXrVdgWr8fw1uGrpazR/UndVrHBacdCAH4aTlI4lMq73dt0wpYlwtYgP?=
 =?us-ascii?Q?9oqutVqIMr/pwR3qWGcsOg41ANoiXutMM6lEH4Xr?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adb6c4ab-4761-4866-3225-08dcf7f329bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2024 08:24:52.8636
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +HYN/AV5cnl6nU5Mu/zV7cs4sv5kJQB1lYZgGH1dSsPkLUz8yB/pUoka9hJ5FFqionk0jRcURhLjzUhO9hP1hQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5133
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_012456_752765_2F159D3F 
X-CRM114-Status: UNSURE (   9.84  )
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
> From: Jason Gunthorpe <jgg@nvidia.com>
>=20
> The iommu_copy_struct_from_user_array helper can be used to copy a
> single
> entry from a user array which might not be efficient if the array is big.
>=20
> Add a new iommu_copy_struct_from_full_user_array to copy the entire user
> array at once. Update the existing iommu_copy_struct_from_user_array
> kdoc
> accordingly.

what about:

iommu_copy_struct_from_user_array_single()
iommu_copy_struct_from_user_array_full()

?

>=20
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>

Reviewed-by: Kevin Tian <kevin.tian@intel.com>

