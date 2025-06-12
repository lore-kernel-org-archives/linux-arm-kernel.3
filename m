Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8F68C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 08:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q8YMBw9veEhAvYTEG86qiA/ephOVbib5oMK3NiO4XYk=; b=uzd1w/YLfp9h3cfbDueuceYp0T
	zClMdAoDYFSSezzjIHbon+3Ck17oyDifaaVKcd656zT8FJquBXfGJZM0c46EpUR61MQ/cT23lrdaV
	a8sSS0XuJplb9HzLsabdCN8hVaXe8XgN5O+eaZ6vyg+2CtySWuD6fwnHGf68od/hcHi5WNZb4P71Y
	NwjfKSowbYLF1cjYTpu32IFjjoCRy3vVzh1eG9gZzfK4j/l9AnDn/IPdoJehc3WxM3PKWEmxu4VmZ
	6EdXJYzKZVTPJ+VGhCzzCLGMbjO8zmAvwTsRkhJEjfFAqAlJyexJOKma2e9FCjJtZXHxxDjorefy3
	1l3XqOQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPdeC-0000000CiQy-0Vtb;
	Thu, 12 Jun 2025 08:50:56 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPcxn-0000000CYRk-2w6o
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 08:07:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749715628; x=1781251628;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Q8YMBw9veEhAvYTEG86qiA/ephOVbib5oMK3NiO4XYk=;
  b=BgDLLWSqoOVUm1Wujaw77gk9Ur3tUa9CAyGnt+EptqJE+ptUdJuCGVYR
   f7/ElOyIBTgEEguVFl9fhA+/6EOUY2IVjABqCnBGnZMo6lea6N2MVxsTN
   ljAsJ4rUHeElFgxY+vRpRnRTaz2Hk4ojO0RFeofkydkhJGOZYGvJNFwUD
   qQylRCdKrAk/LeGCuw6hHnC98jjp1d11IOorjL20qNZRhj+X1GRJCCQT6
   q7C0Wq0x3wkC1uCxqludqhxtYoCAp8+w4hXRvhNvODefK2wzwTC7KvPih
   L/aZRU+gWk2vo44Fdwr1KDucbmTVgOLyp8XvcbkOAfoasd73Jf87cQ97C
   g==;
X-CSE-ConnectionGUID: X02eCPmWTqqfFhkZYGbMTA==
X-CSE-MsgGUID: tX4GbwzFTRKCJzZv9GMGVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="51872503"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; 
   d="scan'208";a="51872503"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 01:07:07 -0700
X-CSE-ConnectionGUID: vPbapYsrRja2o+Z6NYW7Yg==
X-CSE-MsgGUID: m6vr8d80Tjmq43eyd11aFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; 
   d="scan'208";a="152596043"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 01:07:06 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 01:07:04 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 12 Jun 2025 01:07:04 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.81) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 01:07:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qGpxvhHVAQTgVd7YT0sxEtB/+F+ntr2agk/rOdWkNochL6cPkkUPAKNevj0G4FT3qU8B3zes5/WnfDiDb+wRdSZbNicDxE+qeCgZbnzcNXWQdaoum9ZqCuIYWDfx0KwSJRPqEN8FN7VONJ7LPFIKFqba1D+brKwIcmzcPAkpBh1F4A+0PzVG7fOFcA1b7lVpNa6jEdckzQPlg7H2DAlRqCPEYPSHrlO7CL8jlWVRb+uYTBxfgXsEBiYLLWafdOxmUKsjtNAtv72caF+TgN/w23aDyzx89pB6kkoP97n5B0Eyq1zvl7xGpkIqMtfNl52sAMfJysAJhbJi1GuO9xIfmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q8YMBw9veEhAvYTEG86qiA/ephOVbib5oMK3NiO4XYk=;
 b=G0Nc8Lpz32dM1rWgxbLghMkfBF4er06wo1DebHd/OGuTQyBa041B0gVPsTBJUf0sC78dMa1Oe/SFqtz6HNsaNcl+rdSlGmQ+SzWvJUvwdALKyAAxAkhJc9yOlzXNLpB2UIYoHRLoWlE8YybMh5fPX+mhXUFuBmZz9rbmrPr8vHV4/rlAYB0V1mxfZXrDyRgWS3LwoKHFpPaUrGCTxJQcO2QL+ffKtCN/7U9p1FgY3wkcgTMFX10QwKdp5wbAXTsPOe3G+AMPE3p4Czx5i7mjqsBOqNfLYrL4Xv3knEBSzqbwc2YH4XBHGVdW59DQki9zTLeuCeAG6LG2QJKBr7lMSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by DM3PPF17031675B.namprd11.prod.outlook.com (2603:10b6:f:fc00::f09) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.32; Thu, 12 Jun
 2025 08:06:49 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1%4]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 08:06:48 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Nicolin Chen <nicolinc@nvidia.com>, "jgg@nvidia.com" <jgg@nvidia.com>
CC: "will@kernel.org" <will@kernel.org>, "robin.murphy@arm.com"
	<robin.murphy@arm.com>, "joro@8bytes.org" <joro@8bytes.org>,
	"ddutile@redhat.com" <ddutile@redhat.com>, "Liu, Yi L" <yi.l.liu@intel.com>,
	"peterz@infradead.org" <peterz@infradead.org>, "jsnitsel@redhat.com"
	<jsnitsel@redhat.com>, "praan@google.com" <praan@google.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "iommu@lists.linux.dev"
	<iommu@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "patches@lists.linux.dev"
	<patches@lists.linux.dev>, "baolu.lu@linux.intel.com"
	<baolu.lu@linux.intel.com>
Subject: RE: [PATCH v1 03/12] iommufd: Use enum iommu_viommu_type for type in
 struct iommufd_viommu
Thread-Topic: [PATCH v1 03/12] iommufd: Use enum iommu_viommu_type for type in
 struct iommufd_viommu
Thread-Index: AQHb2WH4ZcTzvTZrdUO/lT/O4x3nFbP/Lvqg
Date: Thu, 12 Jun 2025 08:06:48 +0000
Message-ID: <BN9PR11MB527655A3C0C5CE65B8F39B598C74A@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <cover.1749488870.git.nicolinc@nvidia.com>
 <6172ca53f6acfbbdefc2cc14b436d484ef62c250.1749488870.git.nicolinc@nvidia.com>
In-Reply-To: <6172ca53f6acfbbdefc2cc14b436d484ef62c250.1749488870.git.nicolinc@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|DM3PPF17031675B:EE_
x-ms-office365-filtering-correlation-id: b2014b09-ab3b-4398-589e-08dda98814d8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?DqexTi52vwaS9/tE2LOtPk2Zwm2z09Ihm+q7GspXAfFLFGRB8HfuiREulghU?=
 =?us-ascii?Q?KPmxQnpl5L4q5tJyejqRZho/qZ9NUsNcgf9PPlUjUn3d0dRaKvXIviDmBwJf?=
 =?us-ascii?Q?BuG//mx9K4GZ4shAIQ/CwIrg+vBmLAMtdP2SUlMxof41XC5zVSJheKyIlh6S?=
 =?us-ascii?Q?uBq0ydwQsYdyZegFeP+cX3Px07rdu2IdH2C2J6L5q2uhQumCCv7dH47bstd3?=
 =?us-ascii?Q?BEtbw9xCO3v+uSeONk/g4GkyRjM30QPkq4yQxp+yYAJY3Y4kYE5L39+QBxQN?=
 =?us-ascii?Q?m5MmckuXV3D5epjFSdfcpBNTEQqWw/yatlyH4lYmA9TGx5ziV1QoqPqpR5wa?=
 =?us-ascii?Q?i5PvvV4F8+Aif8Qqy7q0vcoeE03steOFJ79WocESctsBjxn92D5WvGGtc0UQ?=
 =?us-ascii?Q?yJIjmhNS2Cg5WOrUs6033pmY5eBQZTK1nVnO19n7asRP8Z1WvyzbUYSLreVA?=
 =?us-ascii?Q?+o89EZ5lAZHcVNYVWTiM63i86L3kOfKbWUWPCjyYsjO652WMs1eutUAQI9++?=
 =?us-ascii?Q?FMv+nfgAtso5ATv4tpXRImZe4EabVpZM4nZVxFJym21ZSLv9uop6BEIZTKhf?=
 =?us-ascii?Q?ASoIDaonyn4kbQRYJHz3bA3LjHruNZoOivkLeigcnrD8+qdwn4cYPdquFGO3?=
 =?us-ascii?Q?gHhDrZHN7KvjqnRYpouDSfQDCJWU6Os6ryxO2o6DA56o3Cdxh0GLtBfX4bg4?=
 =?us-ascii?Q?uSIA29Tts31CvOczC0GFoVkluy9tBUEHCDPGmo/yBOPQwka2J6PoRIxc8ikJ?=
 =?us-ascii?Q?QlCX1Ol4jQIIQpCjvwykUqiZzLC6Mu/sV+JP1TvY46mdlQA2xl264jXqipRH?=
 =?us-ascii?Q?34k9Yechgm/fv6xQHmoL+B+3etz2M9sOY0SZjczx+Bu3MA7RLD6SyDgP2IqZ?=
 =?us-ascii?Q?zy8MZKFMTH/aa/4jtNQLyi+jw9aQwyC+ZdIGel7Rg0s8zWprpl9IPM79ApuL?=
 =?us-ascii?Q?RU7WnozjZx5Bv46px5xP79AxF/HnZE2a9qrsuEUY2qM5OjXD3Mk8MmO3OrKc?=
 =?us-ascii?Q?HEdYgNuaS+LRyjjohar9zkCOuQzCozS0bM1VCrY5B5Dw74I+kqSPAxG1ni2F?=
 =?us-ascii?Q?79iPfNeVkFR7XiUozpJIa+UY3W27eVTBfLeicHdkH0esHXWgnfRAhGa/MLbj?=
 =?us-ascii?Q?UlJ9vvXxe78T/M1UixJoBuNCESN9YLZ/ROzuetpoiHohI+1h87mD9doYniiF?=
 =?us-ascii?Q?TYxsBkwEchHD9ADLUpumo1t5jwmxPiznl78uPZvbfhh6mBb2RQL5SiRh0/9X?=
 =?us-ascii?Q?+wOe4vQTbxPzzH1Gb4N1tscO+tQEHX7TSpIbZN0I/q+6gr/Pa3dzxDxRW/sd?=
 =?us-ascii?Q?X9jiTz4QWtQgS46KzTbHqk5hVE/BdVTG/nUKy1muDgCabCaMBh2gW3IMUV+e?=
 =?us-ascii?Q?GAeR3lGsJnSUanqxDyaRCz0hOvetHhZhsEjWE+pqzlIS7t3Aq7IwvZ+KAXjk?=
 =?us-ascii?Q?j6FE5/Im3B+y0SDzUKBHD96AEoyBf2SohDu6X6fnetvBk5u1ZCVxdw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?oE7RJrSLUgr1Pq9nyWezrFs538NJKa8uTyfV1OvMmugbl0rcQ6WD2Pp1gdPn?=
 =?us-ascii?Q?9S/xncELJj9UktPJXXSIPL8r6NRPYMtKcYVPCenz/bCiq7r6/UUI0DYjnx/Q?=
 =?us-ascii?Q?6xSBgPk88MAHmjRw2ruBpFtxPrfbBaWWs+7cFbbLPoZt6eGjp6dmsftuFAoF?=
 =?us-ascii?Q?iEDpZKoKrlDA9x2Cljl3w3DvcEOV1pU64PqMsl/nx29/U3Qt97ZXbdXNlD2K?=
 =?us-ascii?Q?n0eaW0TnsKYQb3IM6gVWq+r/h/7k5H3XpNsW6xzUpkylqM1tK/dCH2ZOErnw?=
 =?us-ascii?Q?t0vYlNkW0rlz66T7gW80GdBcSVPDbwYwQqymLOWa9aDYfPz3hLGtvnknS61X?=
 =?us-ascii?Q?zQIgWSXj087cUTUZCuAbo3kOTeBqcBMO/RQPKwie8I9+QM4EAfTHdiJc45Qj?=
 =?us-ascii?Q?lWeBk/L8RVa/EX6RyLvrybapfYTvcuqQO8AU2iAoBOfv8ykgvJ88fEUc3j4u?=
 =?us-ascii?Q?XpYDKyTx9C/KOV3FNVSmVTeBVWYTHfgeqVvAeAYLKEnwdkJ576SH5blyYABI?=
 =?us-ascii?Q?zCtVeUkkPXs/G6pQq0ICCMrRS9zTqjddYxiOGcPcXa0rxCCv0IZU41pCyqr2?=
 =?us-ascii?Q?ac9y1ip/AEQDkellucKOLnUzY9YtGEUv3K4eT0zmj6LojUFEmnxZ44U126je?=
 =?us-ascii?Q?556icXEM6DuLYvLUSrf0oStmui5GIe4wPQdzAHad6mLNCIlFm7kROYfVs3hq?=
 =?us-ascii?Q?qv9DmCXMOQphqt75ga69cjMvNtutvJ+Ku9sGxeXkXnrhZy0fmhDjwCleJQ1o?=
 =?us-ascii?Q?TBS0oy4tWi5kIEFC/oar4dAjrF9+bzn+wkDFayLCz80dDow5PstXlkqUUQLX?=
 =?us-ascii?Q?ItgbS7bSJdOXCYm75qSGTuO0E6r25M73F9FsJUo2AKBbQ+YjOiU/PJ8pbJB/?=
 =?us-ascii?Q?9jSty2Yor9ArVivo9sxqWftVi8KIV7iXMs7LHRIWHyRwaA/YZBxk3KhdhqPI?=
 =?us-ascii?Q?THT3jvMP7C6dSLFfMww33gCf2NBpIuma5hhEmokrc8hEx/3tuR1toh5hIAJL?=
 =?us-ascii?Q?cKMQtiP7XdQkkH4euffI+BOrdnNvP5MZx3cJ0b80LMhdEYboYQDTZxJuvFrs?=
 =?us-ascii?Q?vcfPjPGykshBEoTTM+p2bpOFRQ1P28Vo7qci2ooKH2N95CkFTVcvBz3Z/bzt?=
 =?us-ascii?Q?9AnPehgGECR6X39QyDv4e7+k8uruHWIsPGtFOQ5p54vsvwCMBWslRzv0qDJg?=
 =?us-ascii?Q?ZqEv5f4OLhSY7CKbQXNsCe9gOzshm9dbBmC08I+EnTwBlCatoLvcB/zzcbas?=
 =?us-ascii?Q?+aNjzMfwM1ya9kLjnYbqNkwN8oZwtb7Hf/VRJwFiUE+RDT1VCTFRpNc4oIic?=
 =?us-ascii?Q?0o5CpAaaJzCeR455m9rbWcFPS1e3FRZXYi8+vXWZF59J2UHLnNZ2/R9hT2uB?=
 =?us-ascii?Q?OdU+FKtnaI8O4vqU91TxsThYhOmbX3EZ67wPu7vkzEZ7Ig12dL//5Ujm4jOM?=
 =?us-ascii?Q?giGMc8YLAO+M5FPhACTsfHl/4UaZ2MkAOW6HJ1c/y7iKZj2T8IbatWlHYbaU?=
 =?us-ascii?Q?BTVcRKqs5cHloXzQlPbn62m5gE/5ixDbA6mHp4GcKvZCf+s8L89kZ/3CE8LN?=
 =?us-ascii?Q?VpVkJpWOX78fKVvzsunyka8J/puIilBGHo/nENAI?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2014b09-ab3b-4398-589e-08dda98814d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2025 08:06:48.6238
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Sbg/52jpIGxbAG+Sp1LTntsqxsByfSgPsQst1I2oruQiwRELwZ2eja/mWwc27bTumWrHRrLmu1MGtCPtHJyDYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF17031675B
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_010707_782858_FB101BC4 
X-CRM114-Status: UNSURE (   6.69  )
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
> Sent: Tuesday, June 10, 2025 1:13 AM
>=20
> Replace unsigned init, to make it clear. No functional changes.
>=20
> The viommu_alloc iommu op will be deprecated, so don't change that.
>=20
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>

Reviewed-by: Kevin Tian <kevin.tian@intel.com>

