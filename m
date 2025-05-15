Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47EEAC2D0CB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 05:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U+P0xXhsNzFGRKCTXipDkKUYqcaUw8uEr3Icwwh/fPs=; b=UJa/u7hQvSZJiINVrpOj5sr/gO
	Vkt3+ljX85yDqKVSUALeL8NAJ5EnzzHlyyw4VHR4KZ0LYZjDNp6ElInJTRjGx/LMQw/7jbsreg6cV
	2woVNtLIcPKxsQVTDNXpuOCcSuyUsmZDr+hN35F1QiNeSbHva8izZ6axQRBK2yMxN7nh9xcCKI8DX
	uvKXlyjGneSh0YTmpyC7PkU6bYJY3WQ06GwokHlbKDU83YR1hNKOpvS/JYuwHuBCiUtfUnoKFrn78
	RSURSt7c8IAGJK/NHruUoPvkMOLnYzX7pyZ5nPJVozh8qaiSARFlqKjfl5kpveO2vuiPdiGAzrgD8
	bovMkJXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFRZP-0000000H6RU-0KEG;
	Thu, 15 May 2025 05:55:51 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFRTf-0000000H5li-2Khy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 05:49:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747288195; x=1778824195;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=U+P0xXhsNzFGRKCTXipDkKUYqcaUw8uEr3Icwwh/fPs=;
  b=KaZbHHnGiihbOoJaoE2B6ESNkoD8ihN6xWXm/spqlkCaq6z2rCsLcKy1
   EZ5tPibTf1ofz7cH6CV0QrGRKcAR4rM5w0SbddCPjAHnbxJzzVe8bI5tK
   6SxTrWEx1W0MGAcrDYXbfEMS9Dmx8WoowvabhMQe/bWI0Xtt/YHkfK7KB
   /lauvpZTdnwXnopI6btoaEzaOdcTMTPSpoCCRDccFTk/4KdN2iWQJcz06
   wSDXXr40u6xHG6C8AMXIhfgUJCgcHHYYo9hYUiK/oBWUtLWPIMjsamKyl
   spumm466DQBhKHmqDTWNPggNRAbCb1L4kKZrblss5i6BU+cHEjt4jUMyq
   w==;
X-CSE-ConnectionGUID: 8RAfa5DOT1GsLTJ3oE1YTw==
X-CSE-MsgGUID: z/PfG0vBRn+A3ItiSplwuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="59438725"
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; 
   d="scan'208";a="59438725"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 22:49:55 -0700
X-CSE-ConnectionGUID: MtvOKRbRQ8GUuNpqEavyvA==
X-CSE-MsgGUID: +w2oDhrSRfOEsQgvvAIk2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; 
   d="scan'208";a="139257028"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 22:49:54 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 14 May 2025 22:49:53 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 14 May 2025 22:49:53 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 14 May 2025 22:49:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BEPf05NW0qJX/e60/AWXq1zdgxp/XQyZyHkjvwPDNlCTp2v2HE4UyhrrygQG7Z7j+OBsNQXeK8x8dZILQSgZA6P7Ts9bNosyxqExNKBKIadt/QCqF1datCZOepxUjlEZe/mJA9A8VCt86Dx4wiKR1tDJKZonk1p1MtjigU8KJ2j9HbTb/XgYinNmdlK+05fs//9jsytqPe4n1cf+zNNBjTh4yH1+EYWGrHh3hMsZi54ETz3BIbJMvboaPU8cqeBHsHTdT9RIdjivY0+9wkJ+iUg//32mFNDyoRbx/o2DPnWcDY6cR5T4L76YxxTNJc128YAdF04mIb8S09qcrKq/uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U+P0xXhsNzFGRKCTXipDkKUYqcaUw8uEr3Icwwh/fPs=;
 b=T954CEUyLy3D7plJ1k3dNsfZV8srG6Xg5njkuQ7H/BG67LxbctmPfsuXPu7+XhEIB6QkaedTeE9w3y5vab2BTDQTdQTKL5n+DReccSexApGvwMT9oMoKjt8Zx+ZHzc8WiA7UKD/vdDXiZMa3NDTXIKJcibZ41buL4sZc0ycFOz2K2vDZEutiKZuvilC3kiEC54jXKdmBsa3btdMDdbgKnMCeXBOmOnArwUBLtfZpWVUeZH3DmlYZ49PSywAnobgmCWsh72/pRrIVaAYVu26Op8vO/Ro/67XfdVeuBT01mwSJqhfURDduwNWYex89kJgxvHUZ496cI8dorMQGM/aQyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by MW4PR11MB5872.namprd11.prod.outlook.com (2603:10b6:303:169::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.34; Thu, 15 May
 2025 05:49:46 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1%4]) with mapi id 15.20.8722.031; Thu, 15 May 2025
 05:49:46 +0000
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
Subject: RE: [PATCH v4 07/23] iommufd/selftest: Support user_data in
 mock_viommu_alloc
Thread-Topic: [PATCH v4 07/23] iommufd/selftest: Support user_data in
 mock_viommu_alloc
Thread-Index: AQHbwI76/SA/GLQpNk6wlBFDajF7vbPTOP4Q
Date: Thu, 15 May 2025 05:49:46 +0000
Message-ID: <BN9PR11MB527687726B07997D4CFA34B78C90A@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <cover.1746757630.git.nicolinc@nvidia.com>
 <7cc29f0d3617f464c108f730a3f611d1154e8cbf.1746757630.git.nicolinc@nvidia.com>
In-Reply-To: <7cc29f0d3617f464c108f730a3f611d1154e8cbf.1746757630.git.nicolinc@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|MW4PR11MB5872:EE_
x-ms-office365-filtering-correlation-id: 577c5bf1-7f33-45b2-d11f-08dd93744c4c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?YWHUcjkudH/70RYjiCnS/NDCGmR6iBlxQ/w/cXV8VJdqhBiG/xyiZMK6lBxB?=
 =?us-ascii?Q?Wjly2HeSp31WAXRTO7DKcNJepFNfxtJTX00QcJUbhyp+2vZ1fzyGCKWR6I7O?=
 =?us-ascii?Q?4gD/qtoaNs1n2mOSoKxfp8+WneHlUwgs+UvNT4tQ2wqH8HLx7qgBHyQYBcZ6?=
 =?us-ascii?Q?9HWNGeSAgzFE2yYSNaD+2CSJFvQRWzFfMTH+45SV7AJzTPyJpB5hV7FMpKcr?=
 =?us-ascii?Q?5X+zOB+fq4YZwjkxcc0ImE/JC0rywRULY+oB/fd+d1HY2U+tbPqulUH5aBAM?=
 =?us-ascii?Q?b3Y4Ag5EdFypak+dwfPMcN9cKuqgDV2ByT4y+qMcAKgqJt0euPlka4BdzlB5?=
 =?us-ascii?Q?yuOLyBjyvGwbsjXBTZ1c32DXLc3xSRmqus9V2oB0OdJ5SWYkMZX/uoBCGhMP?=
 =?us-ascii?Q?vjiRb2RI/Spx3udGPpxJcQJDUTTgK+MPmYycl0SyRrKS9fmEAWKNuhSah1ac?=
 =?us-ascii?Q?Nbdq3m/cOCmJpFrxfpxZIclY2hv72MURF9a7S0BkvWQHayE+kmphYUjzKvHm?=
 =?us-ascii?Q?dzncpLMI7jtBa+geoUMC4/7oAfeeL9luh9lAdKsfiP1s6gNiO72ZAGoOF6cz?=
 =?us-ascii?Q?vSIrgCydIxi6ovpNqTwMA9dEQl0AS3+/lQE5Nw4wA2UjgE2/EVYXrcW2rmij?=
 =?us-ascii?Q?DxurPxsFT0g1XR9QqDzP0zC1Bb7gfcxNszByBb23+X+Xba1VJtBCuByty8eZ?=
 =?us-ascii?Q?R939/BpTMpijXmX4HhvI22XHJvABGSJX4+++PRK6Qp2HN/hjoOBSBUzGR4Zx?=
 =?us-ascii?Q?SQpHRf6ySG5v2b/1Szm38diDe9kNTsjfw6/hpn6W1Zw9M0AF3wGbgUsOPti2?=
 =?us-ascii?Q?9Z6MSLkiW9Rm7TZNAROqy0zfa1sxDS8fOhDSdAkNmwSLO+dUA6BMeaHXEKAh?=
 =?us-ascii?Q?QwllHpdGIKKplGzFuwDg/Kr2TkZhVCesOE5dO1hiFGygxWQjve6vsnLBQf+h?=
 =?us-ascii?Q?8iebz9GAILWfKKeEhku3m6VTSCut/L5NDMufiq0iFtW+WErvN+9JeX8cDUa4?=
 =?us-ascii?Q?8K8dgMXZZc7pjAVvw3mBWuctC7pjITcrRAg4RvMXuX7hkEVgHXxjGQIqYJYc?=
 =?us-ascii?Q?mXoKyoqVJDkvdXOnrPXhBdoSRvcd1jvUb0YlDFVirIEOe4aqMb2RiBSlo0IP?=
 =?us-ascii?Q?jtFecJqaRZStMr7/Or6bizeDtbxufEjze1ihRV/CxvoszCovxcC6MNOur1Zj?=
 =?us-ascii?Q?takBZ88HsfWyugHeoXL4VssKyMrNFPpbNjubfnZSBdQtgHlB1PE5Q6eHwNFA?=
 =?us-ascii?Q?84KFLY/5V1J2kUC3+vJSaUth8ne8duW0WEokK1WqnWsHhBPKvHvZPMn0vkmX?=
 =?us-ascii?Q?H54k7bIjNFN+ZLVpwKAX930G/haid3N6/A+KBNN/JXkX44UGsmztkli7iQXQ?=
 =?us-ascii?Q?Xt0Dn23BRFdGh47CG/uDxOOMy8tTv5fl+h9Ll56bqUJ1DYxbHfbnk3qx/28y?=
 =?us-ascii?Q?KzkuKxTm1wbdBbI+wtsAOyAGpC0rmJ9cXw+u2J8QpVXb/D+aJs/EVjw8yPxk?=
 =?us-ascii?Q?aqcZZxE5Lvy3Vyg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8CXoT7b1fV2BmHxFQpG8EfhfLDtxFGoSZUroFht/HKB4OZYqnYRaZlTBg9Np?=
 =?us-ascii?Q?VtLK6STARPo0GXlzKo7DpglXtGlVli2kigZTzVh/r0PlsokPHjQWlHyxmF+t?=
 =?us-ascii?Q?xqzGcoqADsLFFqnxI/ksCDLfiDVI4gKB0ekmTES46AQexa89jK3TCj0yw9fk?=
 =?us-ascii?Q?RrijJsRveC8l9zrfpDMTvdNERvjmRF277GMknXqQrsqGpyKWkQc6gCvdalXM?=
 =?us-ascii?Q?7BL3WSEE+i2M2fBssKJuBWoCY4RH2BgGDWgk1wR46Yt2QZuvjqQIohWO6X2C?=
 =?us-ascii?Q?W/00jtLJ3XryQVnorQ4KZdXyH3faiqXQ4mbVLbk9v/u2YkWPpoaBsFUGqXEU?=
 =?us-ascii?Q?NREjKe/GOfUBTc9SPE94oyAVIpBCPojU/m9BMpggcXxlh8N7CMqDQVqqbKQ5?=
 =?us-ascii?Q?hN3ZnDCO15OGD6xMAzxwrbs83lV4/ps8WEy8dg5ElVFvSH6ZDM2bMGAI/y5e?=
 =?us-ascii?Q?3nAkHD0KI59UN355QADVVZwwYZ9NVf7p8XtRobT4XcbCzMjvepCPHpAUZqLV?=
 =?us-ascii?Q?UGkCZez+jqdHvebsyVAE12ae8eMFYOYaS+8jV/2Ow9Ptk0cO+LjI/n9xkjn/?=
 =?us-ascii?Q?mz2rPiuWOAIQYfCydnvf705vN/TUnBP3t7pVpxA5XxqRY5EjprCT0aAGxWDr?=
 =?us-ascii?Q?4nDsCjTaRVojyCa/u8lLbRswukk3afDwbBj92s6joqUZOWkze7DsIXo8YVvU?=
 =?us-ascii?Q?0g7LhCZPWjX/rWjXyOYeMBOpp8rZWwFwQYTr7jHiQb7vK9KvzYk/KBBXwIXo?=
 =?us-ascii?Q?M4ZIueTkm8PTiSRJ3KEhHnSYlqCU2QVT8Y9azgO5wuiXURUTyyF/bsH5cLnR?=
 =?us-ascii?Q?oTDLEVOmsuZvUIadXYqofEu1W302OLlXtjdwcn0wBf7qssrSCHcG3yLETOY5?=
 =?us-ascii?Q?u/MVLKocwixT04gg2oKyqVbDbrEqjqRGYWIGu9gS+omn+PRkII8fkuVCUL1i?=
 =?us-ascii?Q?AFP7BT4P9LgEsE+kM5o8WxgIOXMq5CdDWFLsq1V+rJaqnlQd63D7Jkh4iEXG?=
 =?us-ascii?Q?57giCKpL2gryFcfUZM/5M8qYeyzyfkGVavEpL5ThCtPkM3KW5R0ykJ3UA/sT?=
 =?us-ascii?Q?t7z58wwdG5slUJmHECQATyUQeKEiq9IqcJ0ycHm85rWH4biPnW9YTxGNnWIg?=
 =?us-ascii?Q?6nY0KeCa6XsjF8n6DzaYpMj00F+0O/+yTvizaZuyEKI4wmZxlm9+8Dvi7V8n?=
 =?us-ascii?Q?0vyImB3VYN/svK8SpJemCI+3W89NUF/kG55UgM5TvXxEb4WewfOzBUxv6bdP?=
 =?us-ascii?Q?f2B1J/SUPkf5zjSZIbXrrybiuQGfRdpYGYO9uZmF2+L7pPJCkKDukJ3bay/q?=
 =?us-ascii?Q?/vxNqIB5jey+KbQc4TtwhEpPsqXZGZdODOSW0Ptl6l1E9SDklt7vuyn5mhbt?=
 =?us-ascii?Q?l0WvoKlauoNiR5247qiyEw0rG3uuywijxiAPQqMkF6cp9Fg60HsKFrOaI6u2?=
 =?us-ascii?Q?1TBgl+jVZPgtPGqU9mAdTuDlQlSrm1loIe/5HTxts7UFgSGBkn0CJ2sKqkgt?=
 =?us-ascii?Q?vLnZmmG4N9gMp5zm4/JPaKk0plstCg8pmmoUkkDYkFM0SHT0s9LyjwHGYzNN?=
 =?us-ascii?Q?1iydCil6iI6IRaYLdQAOwxDSU+YfnSAH4nPmY2mC?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 577c5bf1-7f33-45b2-d11f-08dd93744c4c
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2025 05:49:46.1595
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o/qRnig9Pg1SgXMD5lLUJ2+5XrAePv7z9GKcjYR1rsl9pjPgcyi2q5iLmXjZkQBUeBbMLkHgKP1VillRXTc8Zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5872
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_224955_632402_27893FD2 
X-CRM114-Status: UNSURE (   7.59  )
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
> Sent: Friday, May 9, 2025 11:02 AM
>=20
> Add a simple user_data for an input-to-output loopback test.
>=20
> Reviewed-by: Pranjal Shrivastava <praan@google.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>

Reviewed-by: Kevin Tian <kevin.tian@intel.com>

