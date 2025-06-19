Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49F96C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 06:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oPHkrJkpuaxQzALAFC8+kljRLyy8XfIqxOoCaIqbq64=; b=OnjRqTx4xpc0zZtKyayFuXWDLI
	RnOz3CEbHz4GUQt0V5eExhobaYdRuZ2PG3V+Az3EepIUd4+/QSBMDqkyv9FsyZ5E0J0GCcLcd/RTz
	NSDpEsf+1GMSZghCGTRjqYAxhpRn7pgYNVNwefIbcLqfaMnPguQ+L9ZXPPZw0tWfGHaD1CKs69iWh
	szl61pDKzg2TuGy8dWvfnbFh+fQ2+QE+Ej8oHIZkkRMqK1NRB4PGDZT3K1/PVaLb078JmO0HwNvIi
	Y1CvlNcvVTHkzVjbSjmcM55sXe0yIyvCK7RDb71PsdQ7oZuUGQUAC3v79gAX694opeuX8DKEycQBK
	BlbPJqTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS8R4-0000000C7qy-35fY;
	Thu, 19 Jun 2025 06:07:42 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS86e-0000000C5Uc-2gvO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 05:46:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750311997; x=1781847997;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=oPHkrJkpuaxQzALAFC8+kljRLyy8XfIqxOoCaIqbq64=;
  b=hcD9tdhjAYGwvsCdMPxfZJZ5URGx1YJ2ZmuHIQ+QP9Xcvd3KilvcTv4U
   V1I4kVFcoUXw0Fi1xYOw6P1hVLgkYRuiCsNyuK75+jvT/oauvLOOzTYgV
   Sl/7qX8N1V7Er+o3uqziCOO6Khwaax0G2DfY6uMVK3UDHXCk35ghgTqAI
   GHt7+XuqoL8g0oCw5hp1IAsNnGGIn27dW2KjrQXKFNyOPZsnmP7a3tLJk
   VjCMmXpaHBdjxE2t3NnXIsIWQ4ONpo8IamImoNNireNkX6cZMKfttF4QP
   w3NwDPU3qbUeI0d/kQxqWJRV6B+jDVbWA03ar+4Om0NlhL2PQ3YA+Wn3M
   A==;
X-CSE-ConnectionGUID: l8SrSRYsTGCmbhgfWHD+PQ==
X-CSE-MsgGUID: nv4T2dyNQy6p/Hw6ukbekw==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="75084613"
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; 
   d="scan'208";a="75084613"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 22:46:37 -0700
X-CSE-ConnectionGUID: kLCcUxbpTdKEPRu5HzPxPw==
X-CSE-MsgGUID: 6cHauD36R5+HHFn0chrTqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; 
   d="scan'208";a="150813641"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 22:46:35 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 18 Jun 2025 22:46:34 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 18 Jun 2025 22:46:34 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.72) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 18 Jun 2025 22:46:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RGP7ABJoP7GqAaDQMqGVOLDbTfpUbFV4+hDna8n73omygDPJFSK/CV8bzEOAkH9Vqvbfoip2ZN2mwsALH7YHHslusDn9aQ0qZDDASe4hMWW9QL62j90Nt2AzWvA00wtXox5GD/LeH95AhzjVH9Yp3bxJkUYt3O25MpYX4zNtnccqxjdslU1MXxAn4w5QBpgxk6L2f8DyBRbJWWxF+3oiLSjTy979xsADKOGA/oS20OUK2zIRPGVta3nGhj3NWrUGFoiLQUKBlOfiIreZIXxZWXgo0bnV0CTv9z1iDnovqArcddVHOoUaUdQY5AlzUjwHiuERsY15xDPK8N87IeHvyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oPHkrJkpuaxQzALAFC8+kljRLyy8XfIqxOoCaIqbq64=;
 b=WmgO2MpWq8tRFbt5AyvTAv8rGb7JkWvA2G0np2Dvda0LVrSBE7Kr9eojzy/VtLpsbpulIjHpYRpdbj+46CZRaSsVtQixAlz1UQrrlaTdGaxwQ7wnNAOjgw/S59cSSfkXQk05V7JOAT1FY9FkhBFgsgXPTF5ThhTDM8KXpWYvn1GxS87sCDBnmpS99IYXnw/geSoe3mJIUeYqxqJ72sYAYssrhYU71KIYuUjngarooLpVacy+0Ewqbbk05ckfOqUK+rc1nyNe9im7WccPdwgz4fOJCv9q0b6t0xuOJZuA7oGldBRMfTBPBG1mWJ1sNAPq86TUku0qGsxxNZC0Xray5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by PH0PR11MB4854.namprd11.prod.outlook.com (2603:10b6:510:35::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Thu, 19 Jun
 2025 05:46:32 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1%4]) with mapi id 15.20.8857.016; Thu, 19 Jun 2025
 05:46:31 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Nicolin Chen <nicolinc@nvidia.com>, "jgg@nvidia.com" <jgg@nvidia.com>
CC: "will@kernel.org" <will@kernel.org>, "robin.murphy@arm.com"
	<robin.murphy@arm.com>, "joro@8bytes.org" <joro@8bytes.org>,
	"praan@google.com" <praan@google.com>, "Liu, Yi L" <yi.l.liu@intel.com>,
	"peterz@infradead.org" <peterz@infradead.org>, "jsnitsel@redhat.com"
	<jsnitsel@redhat.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "iommu@lists.linux.dev"
	<iommu@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "patches@lists.linux.dev"
	<patches@lists.linux.dev>, "baolu.lu@linux.intel.com"
	<baolu.lu@linux.intel.com>
Subject: RE: [PATCH v2 08/14] iommufd/selftest: Drop parent domain from
 mock_iommu_domain_nested
Thread-Topic: [PATCH v2 08/14] iommufd/selftest: Drop parent domain from
 mock_iommu_domain_nested
Thread-Index: AQHb3PahKbdirSUoY0CdSPWpD/gskLQKAQJg
Date: Thu, 19 Jun 2025 05:46:31 +0000
Message-ID: <BN9PR11MB52768B9E5C2F1FF97F63A2C68C7DA@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <cover.1749882255.git.nicolinc@nvidia.com>
 <0f155a7cd71034a498448fe4828fb4aaacdabf95.1749882255.git.nicolinc@nvidia.com>
In-Reply-To: <0f155a7cd71034a498448fe4828fb4aaacdabf95.1749882255.git.nicolinc@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|PH0PR11MB4854:EE_
x-ms-office365-filtering-correlation-id: 7df28631-cd78-4791-2d4c-08ddaef4a4c7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?3791SbX9v/gQ/jBpffylQXMwmfVITuV/hQWev7y1/nmkcaQ2ujIqEHNNRVDq?=
 =?us-ascii?Q?dWmjgZXEj4WZ3ksMaz3JNAyO/0QhvElIN9WxIDEPJ2TWWl3b0GtFu2oZdody?=
 =?us-ascii?Q?v56A+EihLNZMf2eHwlsRcjKseSyUTOhCaOGZSFUCwDJiXqbOYxiB+HD9WldV?=
 =?us-ascii?Q?vFrjpOgTZ5ahWjZamipvzA/HZqQyVeMqP2UJ9tGHHiN4pbJFjyANTavV64Oi?=
 =?us-ascii?Q?yCsn6XJcgGuU47YjIjnTpyPyGJm1uJ06CksvRnjJTWI2xoKWlH6trPW6iNyp?=
 =?us-ascii?Q?+e0GKYemOAKjLFHasm8fBu2AsZgwT3UBdB/Bx5XW6h9StILC2TI5/YuIY70U?=
 =?us-ascii?Q?av5sSEMQJRCOuQ9PwnDjBSbZ1STPhyAPkX3bQtp2Heris9hM0g82ZEiJJ53C?=
 =?us-ascii?Q?S/wM8DOoaSjyZl6bsrhOwE/yD476pip/zfj2IrrP84bkg06iws3qbBPpeVQQ?=
 =?us-ascii?Q?e/9tsX5GbB2v01Ckj3tNZGwEoxNUXWPOEvnuF3sl2ORRVu5tmS5W7r8iOe98?=
 =?us-ascii?Q?Zzx9sCTfiTTIEDGmcZc63Xr1MWv1kn0bT8xHmlAps2X0hZWcMNXZcQI+J67k?=
 =?us-ascii?Q?PTRhEXoCLaiFEHQX7yDWqHNe4WZ/20Rw8FZ7kWUycpn9SNjdYqFKhrG1DFzD?=
 =?us-ascii?Q?eLJ4IrqG8hMrQZL5uCuO1tijQpbvZXsGyV2ZE+m4heaWKJYUBYfhWN4QGbMb?=
 =?us-ascii?Q?uRcmRKshUhF8MBtA9DC/6uk9kRybHC4HSMs+KZGfc1BS1zGWjgUipuqJV+mz?=
 =?us-ascii?Q?iTlQ1Q9lXB4c2H/dEmPQOWUhkaCz2b0ckeSYHQfYFMZScVYaBTYExRUkfjYG?=
 =?us-ascii?Q?spK9i6+oRRpv/OAME4D8HKEwbT+nYXz5k39A6ROxSBVxlKKpcSoCT8/XoDX3?=
 =?us-ascii?Q?3dAchbQBnPAEaLTFZ8gXD6TJdSjBC57N3e6uM5F6YhMMlpekJCFNCLYALSbv?=
 =?us-ascii?Q?ClHA+gQvodnFpFXJq/CHHDaLQuhodLq0Rf5gGF1f0shcHO/TYJH7ZqA19ZgC?=
 =?us-ascii?Q?wR+yRIDthdHe0HjPNbeG7wF+200nzIk7Pxo9MxTjpxuDAuOvcusWT6mEWVQU?=
 =?us-ascii?Q?V0TP29vVdFAmAR8Ly2itMx/UaY8JtHNjJvmZAnrueQc4qHqpyn0jNyRdGG0m?=
 =?us-ascii?Q?J/vIcp0d2YflMrYo/NSntNpvyFVWu5eTmNQ51BKNOrZRQ1h9HADPDqCdvNfj?=
 =?us-ascii?Q?D2/TsGisYovIKvWKsn0fkdcbP41gZaAj6fDkc655nICQjD6bVHeDATh507ND?=
 =?us-ascii?Q?n2fUgD1wlwIwy/yGyV+vN4ljHYeG811j1rh0l88baDnmiPFmFKKQRNt0SlWm?=
 =?us-ascii?Q?exwlakJHAJbD6MhdL9W4j+ovW37mCrNdgeOY8h2tzUrp6SVG9tW/5zLGHeAs?=
 =?us-ascii?Q?euase5ffaHU8uhzhp05QB8cHs2cvmfQx+x9kadCpvaYzg2RhSpW6xYt/CrCJ?=
 =?us-ascii?Q?MIn2R9hw0s4fJPASVpcv15yQTCjGJrFD5wX4/QHHzuqIZZFSl6xazf7QaYeN?=
 =?us-ascii?Q?QOymzZ+mxkgRyfM=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?KHTg5SucCLiLRIbKTYsux19o5E1JuLVHyNeYywQ4mIAHOKT6krGIq9biTA28?=
 =?us-ascii?Q?Nd3nA3d6qbqjiQO1ZI95aznVXePN30uvoj98r4ajOLUn7Fvp4c5kR6rlyLO3?=
 =?us-ascii?Q?dNgTbF7mE1dWOKHnz4YmcR0oSdLC7NBccKoMlhA3iuPY9JjGRXPCf9SAHoUI?=
 =?us-ascii?Q?dnQm5WZ4CY48yq4nj2uoy66HNQFbY0sZreC+XbA2ogSB6bj+xQoPG8eA0wcN?=
 =?us-ascii?Q?z356GdPURs+yZ5filp1zOQGMFPrQetOAHI5Pv+uPmtLMSnhrbo9SrBapVh0B?=
 =?us-ascii?Q?a7TNF/9+e6legqZu8DSSkmBWUYNdHSnLNDdOX+0rdnSm1qBwM3QJjWBjKs7r?=
 =?us-ascii?Q?y4LWixZZanIF2qbSty4D8PQiJ8PFD8shtiE4kr4N2GV1VUel8Ri826zN+y1+?=
 =?us-ascii?Q?JIuAcY+QwPBEsnq1NTeyY1dGnfmz3XcO+3QqRUewljP6flmex9GBupVT+0FB?=
 =?us-ascii?Q?GqKtCnT46RrYTuAV6n1hBrwWJOf53An/88rXSBjM9N4xsJj2bLNV4QaZZ+Od?=
 =?us-ascii?Q?+sePxJGJ33riPkzU6P93t8/0o9kutPOPI+jTm2Py0bejbfXQXqTZP6mzT4bC?=
 =?us-ascii?Q?fkC/S4DpWJr63urDvpvCdMzNUSO7MMzEgoJkgo17KFbjWs2q3UL0+94R6Y7H?=
 =?us-ascii?Q?dyT98FsVZrkFmcvj7Sb/P54+/yosXMZOBKzSVKZgW1Emh90Tw/TdxKE7DKCx?=
 =?us-ascii?Q?dUXeqaVrijOzXUvINklgLi6E/iWZL0Wyibv3ndYrDMVoSas6t+8hIwiYtAm7?=
 =?us-ascii?Q?XDtPB2OjqX1bp+DjJEqef2nu86yzoJz1WRdvmK8EAc8LquBMlLZzOvMdOJcY?=
 =?us-ascii?Q?dAqitPzwPIcw6r0m3D02z+1Ebc+ZqAZMfFWFRqsan/wrjN6FgxBm+f1U6yjI?=
 =?us-ascii?Q?Ufq4oNVFaoNaO6pRRtU7sk5IDU2cIlcxWmEQRep9fI1qHLqBbHDVihNn3j0m?=
 =?us-ascii?Q?ModOuxAOLm+IFBe9v5x3XrfUzk10vqb9K2841f2RuWO8bT23IiJSHaXw8/Nf?=
 =?us-ascii?Q?cv5cGpJSSsPJQF9Gt2wfeyXvu8bPoLMTU2Ge/rzhtsXZVvB27gG5QBGsRURp?=
 =?us-ascii?Q?3IYrCakZ72HC0Pb0zAyUqmii/fYuHpiUthBbVGqLDa8gs9qMubx4kyeDCgB1?=
 =?us-ascii?Q?dktwupyLU6PHcEEZ/qqBYhJ/ds1V1AtCiCPk8REO5Ealjd0fphStq54gjSTh?=
 =?us-ascii?Q?NqDIDUUmJqOf0BJUQbuw7sIAzTz1ANx7djpz2Gur/xEPuFYt6fRBKEAghOaz?=
 =?us-ascii?Q?4l7VNq5nW/xyi67MIvp5S1A6qYncyJgCP3IrYQs1dY0wQwgyjuCggqI+5lBc?=
 =?us-ascii?Q?ynbvr6wmqEi1lzk/bqBT5XmVyB3PM6lua3J4mSAh7jkYBb9MDC0vE2lem/dr?=
 =?us-ascii?Q?WThjElDa/Rxq64AqdKtU/hO50TKUxLl8SjMFMjTEXzNprShVeYwod7dZNxGT?=
 =?us-ascii?Q?x7vWQLLgU7E2+z/FO4j/2ZqvkN8AF+q4g/V/tZVi3U3/DxJ1OSGjYAkqNcM1?=
 =?us-ascii?Q?sSCRZC2pyfi8mW3v6/Duzg/gZieq5Wjt9DwaQn2jqxe5Zvs5DDxGb703ys6Y?=
 =?us-ascii?Q?mRAoCm7pb+/06Inw1XSt1XCIJqKxOgNVv+gf0dfR?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7df28631-cd78-4791-2d4c-08ddaef4a4c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2025 05:46:31.6042
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UMRsN41CVhuCRu4+MEKy1Dp0TzR92sZCi6TbICFfBry972isRZz9Jo7Q4E+gwgr82CKCTPPPynSYZK62aC2j4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4854
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_224636_716038_60DD4BD0 
X-CRM114-Status: GOOD (  10.79  )
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
> Sent: Saturday, June 14, 2025 2:35 PM
>=20
> There is no use of this parent domain. Delete the dead code.
>=20
> Note that the s2_parent in struct mock_viommu will be a deadcode too. Yet=
,
> keep it because it will be soon used by HW queue objects, i.e. no point i=
n
> adding it back and forth in such a short window. Besides, keeping it coul=
d
> cover the majority of vIOMMU use cases where a driver-level structure wil=
l
> be larger in size than the core structure.
>=20
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>

Reviewed-by: Kevin Tian <kevin.tian@intel.com>

