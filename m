Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97103D5B164
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 08:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=og2RnH7lYxQRT9BVKqvk0MayA/vTBbmmLfUi4Az9IS0=; b=kNphq+nkEKZm8i5sJpY5R4K3AP
	5GJwPHV5eOW5YUEtDWeOwjgel7tYrFFb39ENwliGVAPwQuh8AWI5yi2vAMLOSYG2V0qeSiU5/Ebm6
	XViM2GKEbLCDmoBrhObT1PaToBRnJuPLYL2CBtoKvesVa+ynzipwcbIvqng/+cX5QOODSZrjZmJlz
	xK1RNbaQ55Z/1qKLuEqx7S5FqmtsKTMwRVGrUeErom98OnW7ZD0V+tPbVardLEX33c0otxw57RXsk
	RG/vvNEzODIMbGBart5OVb/krbiRJGYeTlDX1nYJD1QqnaRjiu41OCPATas0oqbie95X4OUzHH6n1
	hLRWql3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5hkg-0000000Di2M-3MPQ;
	Tue, 29 Oct 2024 08:38:58 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5hYf-0000000DgB1-04f9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 08:26:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730190393; x=1761726393;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=og2RnH7lYxQRT9BVKqvk0MayA/vTBbmmLfUi4Az9IS0=;
  b=GL8obXpyHSHKpTQMm9US3dKKXHLQ4lf9cIIK4lP58/zfcFJcBLDE48Pc
   BuBMUj+rFOdYgjR58MZjfdUtlV+/KRY3/pukO/Mjtcso7xgfVjsDmMI58
   Usqiaeh4fNdGYeUIrpkOWCjWCWSl4wCFJAMqR3Y+HnGs6XZ8Jqr7svw07
   eP4LVepR4R/XduTo0Z0x+2OZgsDjSVEkXKAahAaP/qoH82i5zBF3a4u0X
   s6hQxVVQtxmpxKw+Bso3NRl8ky/GSMB9unArZHiTiEeMdMgdgyb0lz351
   OGGb0sIE055N3m0cpysvMFmH8SRR9epKfaC64wB5aIydKALIZDWo6RzdZ
   w==;
X-CSE-ConnectionGUID: KF7qxrycTduE1ePBSuxe2A==
X-CSE-MsgGUID: uz6Ptox2ReyHBV5HZRINzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30001967"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30001967"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 01:26:31 -0700
X-CSE-ConnectionGUID: 9j9JjtrBTgiJUmiVatlEXA==
X-CSE-MsgGUID: ecNFsswqSxC4n88xjQx8hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="82029803"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 29 Oct 2024 01:26:32 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 29 Oct 2024 01:26:31 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 29 Oct 2024 01:26:31 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 29 Oct 2024 01:26:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LE8FGoiFhZPrEcqkRLI5suS7/RfMkRNX4ElkyIVu066W/nJUsahqsQAxTT2ygJAsAG7SdVVOWGailPr3PQmUWXF2owyTnCxqi7v3qyo2Quu0HB74T4VGFq3DWiNljLoTMCxt8Guu+OnBtojabRDJ8VrAqUUMolH3+doEVUMJlBWbEDv5ZwZgYpyQ2b+JRR9Hfpa77pVlNnaknQtP1auCRSCeEfDnk1Pe5IzIZ9FBXirHHPyanRhIbvAOLSrie9zoHFqZoEmov8sBFJDplbkQcR2i8N8yedztgitv+IaYKKag+/gWnP9IaZRWSAfiIqe7hVisLhgfKjtjXpB3yTynNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=og2RnH7lYxQRT9BVKqvk0MayA/vTBbmmLfUi4Az9IS0=;
 b=Hg349+neLLKyRuVQcjUTnQAgYF6dXatr8HBUGvNap2twopBR34cHn+onPY0QNNdcXdfMsTsq3SV6AYgMv/k5FdwsTayzh81R/gJkrTZW8mANXMwHQ/H5MwLpbZzURnWxZBBtY7s7ccHrEdYMcjtbDt+klH9KRO3cVijIXG5vo/Qy+y+sjY3nzO4ob60Ts7nZ1D7nIEnbpcM7lgND5AKMADJZeLrDADGN+R2E7+dtASK7vtlz9MVa0yViCSXaCNtRLaB5K4BUAbLmKoEyFcw38Lw6YjZZkfXtaOnWL6fHi9WPPgzwtVIKMuSP08q0gNOlvhRRKDTrY1ro5PN/Zm0Rnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by SJ0PR11MB5133.namprd11.prod.outlook.com (2603:10b6:a03:2ac::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Tue, 29 Oct
 2024 08:26:23 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1%6]) with mapi id 15.20.8093.025; Tue, 29 Oct 2024
 08:26:23 +0000
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
Subject: RE: [PATCH v5 10/13] iommufd/selftest: Add vIOMMU coverage for
 IOMMU_HWPT_INVALIDATE ioctl
Thread-Topic: [PATCH v5 10/13] iommufd/selftest: Add vIOMMU coverage for
 IOMMU_HWPT_INVALIDATE ioctl
Thread-Index: AQHbJzjP6nU7RuNIk0W5YGdHeD6rULKdaexw
Date: Tue, 29 Oct 2024 08:26:23 +0000
Message-ID: <BN9PR11MB52762B28C14A652AD63F98488C4B2@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <cover.1729897278.git.nicolinc@nvidia.com>
 <35452ef0c1bcc9e0ed5217c89c9a72c1f7a17360.1729897278.git.nicolinc@nvidia.com>
In-Reply-To: <35452ef0c1bcc9e0ed5217c89c9a72c1f7a17360.1729897278.git.nicolinc@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|SJ0PR11MB5133:EE_
x-ms-office365-filtering-correlation-id: 489322ab-ed26-486f-d0f8-08dcf7f35fba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?fZ2H8yFtLz3Z8uDASMAd4dBZwiO6slMB1PQq/PTafqer+pky5dZ4R95qokfo?=
 =?us-ascii?Q?69A9rokR4Ph09WQpLbNP5CgWjirU3ecnsJC9oSAjGwgn199UERhCecnKKGoS?=
 =?us-ascii?Q?vn9QUr7jm4hqJ3KwIGKhQLHXgu0cbvXrXa1dwvaozTNI4XTDWHPOQOVF8eEp?=
 =?us-ascii?Q?LX2QSasOnetVLvMWSiBtppOf0NUTLLZhzW1aLtlFY7X4XS8xlDMPTMWaZ5Zr?=
 =?us-ascii?Q?Ton4kiFm7p81bgenSkCnWsdpZaA9zMQ7Zodldj83SBQVYPJEtAGZY1sW5MCZ?=
 =?us-ascii?Q?28u7xZmHsoBAPPMlFDv2AucxPF4PEGyDNqhd+qCvlvZ0HZrYPlUct34XdMQz?=
 =?us-ascii?Q?Uyi3zXDMI4O4u489ef0pv70pS6nfNFqUNRGI2pDL3VrwStr5TO6z6BP+EEI8?=
 =?us-ascii?Q?NPyxYC1L1eiroos3BT8ymKF6qK8Wq2pJfHEKCB3TxFCzRt5ys4UZsMdbD/ye?=
 =?us-ascii?Q?Gm2lVTLPUmctFuBQLHX93xuN6aIp48JzMGfPiXkjVJ7xxD4IyyBzdT0swB1g?=
 =?us-ascii?Q?pMb/nuIThFrXWNp7etTufTKKA1AgCfrpQxB+np2UJztTC25aWZgFRtIpT6UQ?=
 =?us-ascii?Q?x3l/6IPbrztVxCTTM30OvV8OTaE7EeKf4LVbkO1QqXni7J7dJSUjH4cf02bK?=
 =?us-ascii?Q?6AVNZQXJw5V/x1bC7psPmxVeEpUTcWB9JvDV44vOWuO26Aa3RVw6MNFAhGaF?=
 =?us-ascii?Q?Phfj5giR+0wVBJkI6e7KmXlPkV3Vd9rI8VRxt4D2vRKPbDESNVpSa5NQ09xg?=
 =?us-ascii?Q?E3AXbgJge0wwbKmmdzzjB2BOaxtAribHBik3cRVpvWO92Qwde50Jn10K9MAH?=
 =?us-ascii?Q?lLvxoq3y58IENukfq8nRMKZaX+wFWYVhOJCsxrd2CZppQJmodToAo40E34kB?=
 =?us-ascii?Q?OyFQm30jYluda1hvkbVXWRbbVsOAMK4fJv3V87/asR7UZkXjQ3ine9b6cBOt?=
 =?us-ascii?Q?t+Q+Dm9FevF9sUJwWIbUhGoYomgtOdEOBSHAj4Eo8NnIw36aaYzsDIxG4dJ/?=
 =?us-ascii?Q?czbn3Zi6poYE7Q9KkVDKcpm5yAXhUR3THsmV1maOys/NKKBgXmIL8CGY+ChB?=
 =?us-ascii?Q?lFDKI50XVKF/yaFAN6mjfYQJ+GDcV4YI5M3kqbfmLZRKIt2H5JS0QMW18SZ/?=
 =?us-ascii?Q?tRpdCPn7zsZNi6hy6+YpMVTeU0IIsIhe49ORG4tRw/F4WWPKp/+34e/LLZlD?=
 =?us-ascii?Q?czqOjf4W9AilST3w3ZTwsO/Wz5OdJEUe8YnGf8nPu0HhSu6x3Ois241EJ78B?=
 =?us-ascii?Q?ih2bylh6K9uJJMi1pxBSXfmS38o3hK40RGCUKBZ1Zaqni0DUVONUgCueGbWx?=
 =?us-ascii?Q?OVAI6A0IKcYRfFL+HIG1nVJJymqJxaNQFlbXoxGJ4xCCFfu3VZYaKuZXOjja?=
 =?us-ascii?Q?rrL3AZE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+Xp6DZqPa9tRX302A7H9Nmz3zrpKD/QISB9dpgC65Lq+kLkPqYMBZW7I9NMu?=
 =?us-ascii?Q?oy++SK2Ff9I2EpQhjA5/IOibOVo2WYt7wRmwPQqdaY5MO7j6OGFvcESpQlWr?=
 =?us-ascii?Q?hbyIgd1ur84qFTWp/tihe3cWhDjvgHC8rnIrOpnuM4qseH4fwHCxVM0rQ8YU?=
 =?us-ascii?Q?nqcsHxqaoSMvOzp38Atf51tpH2KHNVvqwVkkZSOlS6ovYibE6cA1NZChNR9N?=
 =?us-ascii?Q?UCAuNW53Lqe2c48snILnwHjgtbAlqYOr/lW99o3xDe8dhgToAHhI+l39nDp2?=
 =?us-ascii?Q?9Jw+xI6HR9OQBMbo+HZVQKlZOYF9xw0oM+iIX5tEhKVVjPNOghHXFMT9q7hs?=
 =?us-ascii?Q?/yBrjh9GdwD/cenTe+vViFN/niEWAjIgq5FE8Vr2x6H2hcNgB41jRwLLyc2x?=
 =?us-ascii?Q?rCMrMoY6XnsAqYLFK3qYLby7HAPRFqPnIyHc0FHXRYXNqn248LuMtUa9l1Qc?=
 =?us-ascii?Q?Fx49v3tqkWsHEDcgyMDwZkbF5rm35QGeR0nD265InsyWyxqjKbZKbMtosQgP?=
 =?us-ascii?Q?kqLSMhCT/iIjCVJCjhqVfJiFTfdWa5ZjTpQb6s5/xNpcQkh6Mg3QutPe0ONi?=
 =?us-ascii?Q?/wursuDRkw5wLBVZlrpfEumq+3DxWpRIAEYoHhvKn2yJXBPJhXe3l9OI25r6?=
 =?us-ascii?Q?wWxIDErWiBJcgD084Mjo0TdLGoavLSpwEf8VfnflVySubvc3lKWzYQtZRi8B?=
 =?us-ascii?Q?p7TGvE44GJiCRAlUnRrFWJU2rJTOmFaizYthjvdPOJ8C2X6LPvuxqVLOhmsS?=
 =?us-ascii?Q?uZYkJ9fpDyAipAGSLhB94gtT43nya9Z1c/illCQaNobdgVyZ2lP7l/vOO2PS?=
 =?us-ascii?Q?WFTbGNlAMne+nyOyqElBNQsFXyiZzWbhJHIzFUKnjuCUj7rQGTQMABZJrIvF?=
 =?us-ascii?Q?COW7EZBIowi5CWPHeLmAaaFo6oVEQ33+HZwjlHgA48i7xIda8fkSpMs2xGM9?=
 =?us-ascii?Q?bM9OuJsYuDqCzPuJL/YGHjeC+L4jnviyDXv80KlzS8OTjuQiTuyhvpN72nAn?=
 =?us-ascii?Q?V4MX8X1eKJxcbpHRKEkmJFRNInSlapr05swlI5UQd0Eqk6J8qePEMq0gXZHu?=
 =?us-ascii?Q?Z4+hA0lQOjysNNhP9gtDZ7fAhMkxqbSLHry4BSROu+6XiO2cO48RE6AeDhBl?=
 =?us-ascii?Q?2VRz2ACnWS9RhJ8r38lW4GyxtS1Dnc0EHK72JqrixBqh5hoE3QXJudDBdJA+?=
 =?us-ascii?Q?QCCcKwlAePHzTDwloVqXv3966aC0s2YRjeDUR2JUuNKqZ0iqbCI6tdI07DD0?=
 =?us-ascii?Q?DLBOU5TeW4hXD9LjDTo3ypVD/ifzo9ePctHbqIFJJeelSn2/i+h/faflJxqW?=
 =?us-ascii?Q?5FJAme9FW3Px6D3NJ7cm8juTBrkeE16pHQIupXhTYHBO9/EmGBorijkRMHZ6?=
 =?us-ascii?Q?gLr2fBPTyvK3iK92S+RXkT5YXkDQB+JurqHcC3kyDvjMLUKEkwlUl2je/F2h?=
 =?us-ascii?Q?pbiFa/B56ua3yphre3Ajzj66RcSMx3uSHgWmB+YkIj6PIYG1aRzowzwx8gcP?=
 =?us-ascii?Q?Ue7xR2ltGdNL7X1CDkDiJjG1Z4+uyBUwrufHgJ5oHXVEI9LW4w9ohHsxv9uq?=
 =?us-ascii?Q?OtuWKTVFBTzfF2DxNLuNXvxYaU+GrbdDom1JgSPi?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 489322ab-ed26-486f-d0f8-08dcf7f35fba
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2024 08:26:23.4576
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UybL3svHVX83GPFOqdlWX18F1GL/7L7EWQNSeeI7rMuVP7RR2PYzjqszmecMFXLborvTbZdY+AIpwAoqivaz2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5133
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_012633_138795_470A7AE7 
X-CRM114-Status: UNSURE (   8.81  )
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
> Add a viommu_cache test function to cover vIOMMU invalidations using the
> updated IOMMU_HWPT_INVALIDATE ioctl, which now allows passing in a
> vIOMMU
> via its hwpt_id field.
>=20
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>

Reviewed-by: Kevin Tian <kevin.tian@intel.com>

