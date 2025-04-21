Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99FA0C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 08:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eYSSAPxrS0IdplOkK/c2+FX2wz6CzvJkaMUT7qHYCbk=; b=digO+Q1ifqkRTtStqVvRfZKnod
	cHaiI0fmM9CJzxOjQ9HV/1aihzepBxYSsMes8hDaiS6r1itJLpLFMSSUimTjNlJ7xRpNOkKg4dZzt
	NgeigfMWpObsVH4zm4SwIDwKRJBcKjclqZ1ljyMiBlKDOiazWmSDB24EGW7y3HJyQKAe2oydTbK1A
	h1rSuaZJVlDkhIKV+JziaZbtko99DFjV3TqSy2hJpXOco7DYUebIrAnQ8VKCo6dF1WED9Fol1LgPF
	n6Am14fZH9kbg/lyLMASVkrn+/8V4FjUBZDjy9jwPd5awFRG9ug0htqDZ9xSA5I23M6KWPY35S1Nq
	LXL3sPRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6m84-00000003qkk-1CGI;
	Mon, 21 Apr 2025 08:03:48 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6m5T-00000003qRN-0K2A
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 08:01:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745222467; x=1776758467;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=nbuwpFHm9j4tblZNlz8AlqVhvLhgzrqbu+s2MZKHhjs=;
  b=iF7mX+eu3huHpC7mnvesRNICOGHR5I1SzmPiVaUmjtSAyNASbGZdDHOt
   i6yx1z+NGX0StpJT/zPfMu0aYNb+TEh71cJ/anjeM7d59d1GI1hdVBOht
   xzG4Ot9tWRfkYw2qeOqpx0svI/S/GbyUebZE01X6xX1mtVOZM1w+3U2bc
   xVlceSDoacyprVcayEIQCK7lGdCL0727NjnUVgR1o1if/AtaclwsCrcbk
   bhDmmWh93yKohQRTwa7wfST+59FQijEVQlDEpN92gqH7zJ7BNWZkA80XJ
   75nF2ZroGG9BTF2db/hiB6KakBGetHyvtSFacCTwNm0Gj5+15KKKeP11D
   w==;
X-CSE-ConnectionGUID: 5a900ToAT3mE3EZ+HSIt2w==
X-CSE-MsgGUID: S0AP7GX0QJ27MYO6EZXS5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11409"; a="64161791"
X-IronPort-AV: E=Sophos;i="6.15,227,1739865600"; 
   d="scan'208";a="64161791"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2025 01:01:04 -0700
X-CSE-ConnectionGUID: Udh/7U7URo+jCw5acA8rxQ==
X-CSE-MsgGUID: tN5KU/fLQjaFcbDjpQiitA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,227,1739865600"; 
   d="scan'208";a="131569485"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2025 01:00:41 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 21 Apr 2025 01:00:40 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 21 Apr 2025 01:00:40 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 21 Apr 2025 01:00:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JZ4nM7PXHhNWbNVamYrIaMrktWAqVUPygjibwzPHZhqwOicHT3B6wXVT0y2k150GWOZV+OWVmEGTh2KxNrB5CQl8w7Ulo2tL+VbYa/LL8y41F1o9FLYx8MS84qvG0VZx1fMvHOl4OiPIornRvp0fKrNcuU0yNBQgcDBwjJFncUWUg1HPGL3TnF5rn3h/id1ChkqNUcf2K1Xbzhy5tJDCz12KsDm1V2pflrypRX0W6nzQ4orS39YdgOkYTMWhaDg1W3nsX1G/NBukNM75vbdoEBE1pVTJCCijmpHQguXa3deuW0++m18CawePZFJXhM+di9xJ58XDL6hqrSgxNixwBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eYSSAPxrS0IdplOkK/c2+FX2wz6CzvJkaMUT7qHYCbk=;
 b=GRtvozE7OYjvGw2q4wky+VLpjZHCZGQumyzz5CnFR9znb+aEXFBXW8X2OFy/Lzvxfx/0VFluaHUnpnCkOjxa7/mjfzIryazgne35Yhzkw5ZVK1RIXiEkKZDCkmEBgVaBllyGU283y/37QybqY5wT5a2G6hAEOzntboW5riIBXo/3NNInUolssc3gDiPmB1X5ghCxrWJuJDVR3GOZtSSYXPBCyLdSLcnyfuWc8+xSDPg4RGTQ0ThvGQk2Ba+DpQmzJ0fxLtat1WgFVVhxpOqD+xfPzy9cY/NEv8QWHTD4WVEM/xC8tZA0eIc2UP3OCjKP8faFWCFoiWmwp0FKyb1F3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by SJ5PPF5DFCDEDFC.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::82e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Mon, 21 Apr
 2025 08:00:37 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1%6]) with mapi id 15.20.8655.033; Mon, 21 Apr 2025
 08:00:37 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Nicolin Chen <nicolinc@nvidia.com>, "jgg@nvidia.com" <jgg@nvidia.com>,
	"corbet@lwn.net" <corbet@lwn.net>, "will@kernel.org" <will@kernel.org>
CC: "robin.murphy@arm.com" <robin.murphy@arm.com>, "joro@8bytes.org"
	<joro@8bytes.org>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
	"vdumpa@nvidia.com" <vdumpa@nvidia.com>, "jonathanh@nvidia.com"
	<jonathanh@nvidia.com>, "shuah@kernel.org" <shuah@kernel.org>,
	"praan@google.com" <praan@google.com>, "nathan@kernel.org"
	<nathan@kernel.org>, "peterz@infradead.org" <peterz@infradead.org>, "Liu, Yi
 L" <yi.l.liu@intel.com>, "jsnitsel@redhat.com" <jsnitsel@redhat.com>,
	"mshavit@google.com" <mshavit@google.com>, "zhangzekun11@huawei.com"
	<zhangzekun11@huawei.com>, "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-tegra@vger.kernel.org"
	<linux-tegra@vger.kernel.org>, "linux-kselftest@vger.kernel.org"
	<linux-kselftest@vger.kernel.org>, "patches@lists.linux.dev"
	<patches@lists.linux.dev>
Subject: RE: [PATCH v1 07/16] iommufd/viommu: Add driver-allocated vDEVICE
 support
Thread-Topic: [PATCH v1 07/16] iommufd/viommu: Add driver-allocated vDEVICE
 support
Thread-Index: AQHbqqxj+R/ibWUos0Gs+XtXZ1ED0bOt0Tfg
Date: Mon, 21 Apr 2025 08:00:37 +0000
Message-ID: <BN9PR11MB527601845E1E55D02F57F04E8CB82@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <cover.1744353300.git.nicolinc@nvidia.com>
 <349fa2c4c291488bb5bae6e4a8bc0dcbd0c51fd4.1744353300.git.nicolinc@nvidia.com>
In-Reply-To: <349fa2c4c291488bb5bae6e4a8bc0dcbd0c51fd4.1744353300.git.nicolinc@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|SJ5PPF5DFCDEDFC:EE_
x-ms-office365-filtering-correlation-id: b82f3b01-0aec-439b-2323-08dd80aa9a0c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?90kJ2o4zjCiI8TzeZHN1GQx9SLoSAKFlWe+ZxdkBGDddWShJ/kPZ6MrkV7i9?=
 =?us-ascii?Q?JYBCs4xFsKB7kTu2lDQ/puWgvvg/l82+STKQZIvXD+yF1dOfxHrpr3LQhn5I?=
 =?us-ascii?Q?qCwEYQi7ydjV2Ivmxanwi3pcbkXRHAZLIf9ab6klpPkRBAQOTRfXAOgKcAOs?=
 =?us-ascii?Q?jjuMbuTan6AVezYBbSDriAhQL6tAHEhGA+zy/VW3vMFO8DjfuEsmygBqzMlZ?=
 =?us-ascii?Q?nr5beCH1uXK+hiZpclajPKAZpDKBifyolsLLbhk9rhp7PNtJvLghQbOF6PEJ?=
 =?us-ascii?Q?YLEjeLHM1Kx/9+oyeOM3YYxn/W1GR7aqtf4DIAEooosuFKsJNcsYiEKZF3xC?=
 =?us-ascii?Q?bDR/VRphyPQz9t1cUXr3uxMneiGjqFdC5h0fMKmuwa5xJ/jhN4fg1Bo8cA1P?=
 =?us-ascii?Q?/OJgcpJSGSW7hZIk3QBg2x2+ldEzHn+7yKSh5Ta/Qvj55rfKKNTFHI35H2dB?=
 =?us-ascii?Q?j6h6c7AQg3wTofM7+5OPfKEpaewXPTvoLl6AIyg1+b9c6fpquuRelHPIISQQ?=
 =?us-ascii?Q?ncOcb9iZUu0PAGuc5bgdM6jbCIbiRQssnXqzEJXGvhJ21MK34T7wlU03LTTC?=
 =?us-ascii?Q?AeU7o4kOiXmqsRERNoFzNcFs5SFvhX72GlHa09f52BHM0aeD5N9Pdeng/dFX?=
 =?us-ascii?Q?ud7vO1PaAdRWe3i3m1xKWyMNk83W8hLlIIhh9j+RHMq0m9hNSyZOfKdNDfbx?=
 =?us-ascii?Q?JplQwqbpiUm0Jlnpd+CU0AbNs3gG4hMIgCpiAflJ8ROw/WsqLqXsV+Gv+u6y?=
 =?us-ascii?Q?RKXrGvbwGqGFD96zvHBxtqj0/uu9S0GHxiyPcl5VMqHbDVg9tczLnQvrGAnJ?=
 =?us-ascii?Q?lUGVtMaD2c6RpkhwYXv+yqxzDyrQte3z05t+9AWWCcEhtDVnsPLyFFexjYZG?=
 =?us-ascii?Q?0odaupKSefRyhPKUw/sOwOSCxHD2Qd5ttNdePmBG1uPzC1v+/N1HgbxGr8L8?=
 =?us-ascii?Q?+I2R6BMcjkZdP+COsEm20lPoOoXw+25M0fmb+hae2oiuKUaJiYX5dWB2Fbkk?=
 =?us-ascii?Q?IkM858oVdFvoN+dXBeMpEa4X1zCGhPiUYylHgCkxmGq07E5FrLO+6HJx4gMi?=
 =?us-ascii?Q?rceTAUN5Oyfxtkp734Eo4djnd38HWEp6LdWlh5p5y71CB7OH1EyU1sAIiken?=
 =?us-ascii?Q?xiSgJMMpoI/HaWU4i8tWIZtIGgA9PBVDStqBiAqwua/I0Q/E4oCVBqFLYRT2?=
 =?us-ascii?Q?uWyrDr5UNjoxjIRf5c59z7XmMGM5glC1HZL4DaCGenXtOXWNu0wQEOobHvB1?=
 =?us-ascii?Q?Fe/lvOOX1z4CnHWFvudSoZpEXQW/RA0uGuOENxJmcf4wdUQwGWegnHjZJxmc?=
 =?us-ascii?Q?qzUwQfMn/x5dXR6SOJSswcrG+O7GpWb+jfotl9OXDDKHB92/XIJYlvO4YESc?=
 =?us-ascii?Q?XLqP+C4QPX+oTnbrJdEcfo04+Gwq6XJmeaRl2O26tNS6va2U/3/FH1NGesQq?=
 =?us-ascii?Q?9Il6fs0C+xfzfGMrDjszDLwiAO5u7JAeFP7TKkqY3ZbmMAH/+3rrcd+DK6tI?=
 =?us-ascii?Q?4MRlU6ILFqZ69yg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?idYlSNq1vB8HkDCcu4vcUwd3VY+P5BQY3mpjGRzUVawcwAEjFx4TrX3/uz5Q?=
 =?us-ascii?Q?k9IuOcJPkus1Ubt1E3KppKxxaIiz6Us1jjoP/4QKJOhzl7UpZ9Ve9/Pbe/39?=
 =?us-ascii?Q?sPUxJwHVOvo8wm6ATNXqy/LbCr+gzH/zFIlJorDk7SMiH5Jnh7F5kg4EMJM7?=
 =?us-ascii?Q?A2mzPCxzT85rKmDWeFdjJzQq87FWjU0N+F2Dt1/RcMoHUWLhT0RLK9XmQkZW?=
 =?us-ascii?Q?/RkwKqpiP8IZTo4fzTh3Il/e8j80yX2qDgCddvdiXDwTLg8Qfs7ll4rcm4Zq?=
 =?us-ascii?Q?RKJhMvOLgr+0qwFsUXEYoGpLvgWcU9ZwdqJBh2BfWQhpXeTGfvbOyn8kcHuu?=
 =?us-ascii?Q?covIseNkgolXuFx+DXSAXTUlo9H4H8OwrIk+tZGwKLlA6sQpKOXdCXIq7NMh?=
 =?us-ascii?Q?0pNUKKbLmERNBL/OsM5yNQNoIEz6Q8UXUSzjus1sNEZV7xtS14PTtXxDzsVe?=
 =?us-ascii?Q?qudf83vE9mfMwW79iZMw8c82xqKh6Mik7SMzO63uAVf2xW/R6JAfqtcmG1GT?=
 =?us-ascii?Q?oVYZE3XmxL1bcK5eEGW2yUgLjlk/NTYHb3TJxEYEWScspcdC5EDcvOOapswe?=
 =?us-ascii?Q?BZ/iEJZBi/2Qd7H9L99+EUW82qoOWGxOaJ+8TTe52pTTLjmRl3cZePifX+n+?=
 =?us-ascii?Q?WoiZv9OS8Y4c6HLqMepsohaTGKvwIlxgZ8sQibpKJ518uV1gKY4WOsJ1UfRw?=
 =?us-ascii?Q?pc5VUE3sZVItBbQx4gA4jDSi/6RtexxhbNJ8hhRb3yFGGGsWJmdQcF2SE870?=
 =?us-ascii?Q?O0eDFiagMbfrkak4HUOyHW7JbohQ6Q6lkAQUXOlMYUze5QiXhrMpmF2ufzo9?=
 =?us-ascii?Q?tbPdmq3FF3gcRZp9uT1AxIaaHL2gIi9KWeEyDYFVC8ZBT6YDGT9zP0Dqnm+G?=
 =?us-ascii?Q?F9ldTBkeQhfS22nMd4LY5kxBv5Aox2bR8Rypg4NQ8R9dtwTqsRR9W49U/yQ+?=
 =?us-ascii?Q?pdLZatFjhyYVkQdovWvyppgJFRJrdyDcqXTQDsucPHaFLX4CJbtzpQwSc1zr?=
 =?us-ascii?Q?w6ltzcknhOKL1RfxZUQ1ITOzHnq+ivKK89rwDKFeR2zyf9TOIY2CGIH3zQWE?=
 =?us-ascii?Q?rrnOdx7ULLyGf8uAc5EO1OveK+M8ZWIqWbHcMMPDngE+QOsK6ACUKThKOLep?=
 =?us-ascii?Q?WTIArC2hP2LX6ebsVTUNe445rz6uTL6EfYi2TQgfvkm9uoU3Gr1N6GDkqjN7?=
 =?us-ascii?Q?SA4eAw5CL4MX7cT8KG4S3xfCeOxIC6mqO6jngBX+v/64c92etM1s6pYEGwYD?=
 =?us-ascii?Q?ohQB5bO5Ga5PYcyIckREr0YENuYOp1U8iCgBNvFoKDtdl4AZcIlBJa53tfg5?=
 =?us-ascii?Q?5pUL4vsFqOSjbOVKzTyVRJu2ZVli1hxN1C/9x5s7ulbNB0SN9F7eF4QrbHYU?=
 =?us-ascii?Q?ViVf8XW3iIyMexsJdlQnHP8MQjinSbJ6fCUsirgE729ye8WvM6AKUyDazUVe?=
 =?us-ascii?Q?Cxlt40kC2GQLPf/QafsP6tN7EMDAVD3m5HhSuJgdFMhY7WnSPlod9sSOQ/dP?=
 =?us-ascii?Q?y3wh90eExDSrgtKFjbDM2ATEZVhoPf0SSAfP5knxt6QirCFqUKujaDLulGWn?=
 =?us-ascii?Q?gGPqSt4FbeFZ0m6WA39dxKi78YzYkpcDCXfL5REi?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b82f3b01-0aec-439b-2323-08dd80aa9a0c
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2025 08:00:37.3471
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DuSbmMUaVwf8kzKBcZsb17ZHCteBRbIcmFQIpBUXzhFtrEMhYKkjV9RilDAEIuJVzDIR9IfyT9augxm8haSZ/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF5DFCDEDFC
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_010107_156741_C171B9C4 
X-CRM114-Status: UNSURE (   9.01  )
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
> Sent: Friday, April 11, 2025 2:38 PM
>=20
> @@ -128,6 +142,9 @@ struct iommufd_viommu_ops {
>  		const struct iommu_user_data *user_data);
>  	int (*cache_invalidate)(struct iommufd_viommu *viommu,
>  				struct iommu_user_data_array *array);
> +	struct iommufd_vdevice *(*vdevice_alloc)(struct iommufd_viommu
> *viommu,
> +						 struct device *dev, u64 id);

s/id/virt_id/ would be clearer.

