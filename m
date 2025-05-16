Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DACC4C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 03:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y/Vi78PDhWtdtqGrvGg4zJj19VXc7LEh6bOXoEzzwHg=; b=NtwKGDiGPs3nyYqOTBMjqlc8x8
	gp3BwqIa6ojmGnsP3vqSESatRzjUchv//gm8JKaMrMASr/4+KtJB2ksT9znpoKGwY9neRn9sYxv68
	rOisYRtLIqeKrsB0jOzKx9dcf4zj4L7tE5CjMg9xRvTDZe595WviNq4tR21GTS0/NI0ruiHGhyTCs
	gDSZRkjlVd40vZFtA1tIpPwY3qbbzA6K0H4eD7K/+7OLt7Vs/7Ez1/D+bXhl/cjmaAI0IJSB7cX6m
	ltMeamLRhWYwEWFUCtqhw2Y0gLH+FhTi+lzaib0FK79nhgMfAmhZ7Ed7UvH77+sUlgyv10JlXmAif
	DgWM6AMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFlNa-00000002JgK-2C2G;
	Fri, 16 May 2025 03:04:58 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFlJ4-00000002JB8-1NT4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 03:00:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747364418; x=1778900418;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=FMCzxKl7g5A2q0w8OmrPg7LVZeEs+oYHxNvAR9m7bJg=;
  b=WnMkxLLXaTkD8pXTcL5AC4E8BMozXXMg26isQranwjLSLe7OiXLITeth
   ZxFQuVfBjPRpM1/mgKUOtkj1SpDIf4KeE35brHD2iSisjzXpmkOYsjQM/
   GKogmrHf1SXYp1+7HkjpuBvDNRzFIEBxpQW/AGlXWFhK5Jz3mgf881uv1
   rZS5F7zTY+1PqcbS33PKhY894l6GqguuU4sriNd5vAZ2QFZ8+F8vuLeli
   soQ9CKpOsdiFu41NLWVCBZcu3T+NPXqOW6EvRQwQ3jvQAPVjHxKEZ9Hnl
   oLbTCe8MGZP2AD+mEJ0/lTcVIBI1PLohHTZ6k0F412HqFUz+B/UyIJAp9
   A==;
X-CSE-ConnectionGUID: fvOVh75QQKaSAn50GnB0EA==
X-CSE-MsgGUID: pSyL81jpRa+0qgWiuWIUhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="49310496"
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="49310496"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 20:00:13 -0700
X-CSE-ConnectionGUID: b/FvPOsZSCi4sSsLj0NtxA==
X-CSE-MsgGUID: DtGJaxTPTBOjwkvrrhe1fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="143681608"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 20:00:14 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 15 May 2025 20:00:12 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 15 May 2025 20:00:12 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 15 May 2025 20:00:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TAT8dmVWEGGaKy/OBN6fUkPqEC/keexrNQXyc8bX9HKtD6PgA0rcJ9ZcnsUhrcZePfq+aClL1946x+ZSO8Ldv3NB9d+fT0U+hvgd8pXyNAxD5J1HH4pnmfq8te6KK6dj/25bsKgw8kvk/CxGsXjhDJSiJv+nxNBEZNexjvImCaMDfMbQ51/rNNR0KyghB/IX1jb//Z3AJ1UKtONudXUUBr8cMFaMcL9GM2sCdCSx7ohWGTvPb3BUF2Z45QCEfvsI6yCsuhqG0BYD5xhiLFgXtaOsmoga+zhJFfKxBJocJTLThogGX2mgxBhGdw8xNzFNnwDldfSXoyjIufFlW3FSxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y/Vi78PDhWtdtqGrvGg4zJj19VXc7LEh6bOXoEzzwHg=;
 b=U/3VOVM1HD0vBHi25PHHJxUA8VduH+SCqjV+yEEPoEH26iJiBxmsOU4bOSQ7XT6ws93sfLkBOyrM+XY6wnHDTXXMrIbVHjzzuuQC1LSaOGqXumZkFZXndgXi3Y0lesZP5CW9RMPk4aEHQaxVjD4DKdCCJzP0DEvUlAj1QVkpjIEVvLn1IX7/NnXl1X8OVL76s6Mp11JQc8izvttpT+LjIzhnC20Wn6zCfagFB23lHuA0QZCJoGrGzI2jwhscQxnEFEN2L8QDFEEAJmrvSD9mcLkUUA8Q48ts79/aMSN0z9gaELvjrld1r9fI9k+pJy9IjMYzNvsUEkbJS1WaJrLPJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by IA4PR11MB9011.namprd11.prod.outlook.com (2603:10b6:208:56b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Fri, 16 May
 2025 02:59:42 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1%4]) with mapi id 15.20.8722.031; Fri, 16 May 2025
 02:59:42 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Nicolin Chen <nicolinc@nvidia.com>
CC: "jgg@nvidia.com" <jgg@nvidia.com>, "corbet@lwn.net" <corbet@lwn.net>,
	"will@kernel.org" <will@kernel.org>, "bagasdotme@gmail.com"
	<bagasdotme@gmail.com>, "robin.murphy@arm.com" <robin.murphy@arm.com>,
	"joro@8bytes.org" <joro@8bytes.org>, "thierry.reding@gmail.com"
	<thierry.reding@gmail.com>, "vdumpa@nvidia.com" <vdumpa@nvidia.com>,
	"jonathanh@nvidia.com" <jonathanh@nvidia.com>, "shuah@kernel.org"
	<shuah@kernel.org>, "jsnitsel@redhat.com" <jsnitsel@redhat.com>,
	"nathan@kernel.org" <nathan@kernel.org>, "peterz@infradead.org"
	<peterz@infradead.org>, "Liu, Yi L" <yi.l.liu@intel.com>,
	"mshavit@google.com" <mshavit@google.com>, "praan@google.com"
	<praan@google.com>, "zhangzekun11@huawei.com" <zhangzekun11@huawei.com>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-tegra@vger.kernel.org"
	<linux-tegra@vger.kernel.org>, "linux-kselftest@vger.kernel.org"
	<linux-kselftest@vger.kernel.org>, "patches@lists.linux.dev"
	<patches@lists.linux.dev>, "mochs@nvidia.com" <mochs@nvidia.com>,
	"alok.a.tiwari@oracle.com" <alok.a.tiwari@oracle.com>, "vasant.hegde@amd.com"
	<vasant.hegde@amd.com>
Subject: RE: [PATCH v4 10/23] iommufd/viommu: Introduce IOMMUFD_OBJ_HW_QUEUE
 and its related struct
Thread-Topic: [PATCH v4 10/23] iommufd/viommu: Introduce IOMMUFD_OBJ_HW_QUEUE
 and its related struct
Thread-Index: AQHbwI7/mLHDYSSXzEqugYzPZImI3bPTOyUwgAFYt4CAAAe0QA==
Date: Fri, 16 May 2025 02:59:42 +0000
Message-ID: <BN9PR11MB527678D4598D453EE1EBF4588C93A@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <cover.1746757630.git.nicolinc@nvidia.com>
 <bedd9de4e24bb89f18f4b13b52c5fdb6db6bd889.1746757630.git.nicolinc@nvidia.com>
 <BN9PR11MB52765915FACBF590E09EC46E8C90A@BN9PR11MB5276.namprd11.prod.outlook.com>
 <aCajRTEU3vPQAzpD@Asurada-Nvidia>
In-Reply-To: <aCajRTEU3vPQAzpD@Asurada-Nvidia>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|IA4PR11MB9011:EE_
x-ms-office365-filtering-correlation-id: 513828df-6483-46b9-553a-08dd9425b497
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?tzwM5dElkoW+ZqA2efrYX1asiv/37oqU1d3VSbNzpNeWgOMp2d35tqYVWk8+?=
 =?us-ascii?Q?7e6hAm/BsblGjTUw0EuSGmzKJBJxbT7FJKVNxenhx/IEId7WLeDcBS0NMo1W?=
 =?us-ascii?Q?S3uhqe5XXDNsBG5mbFA0npDcEr9QEff7QpzPQpzqNwt9JiLxZCA9b00M0cac?=
 =?us-ascii?Q?P/vzhBRHuQhz+TvUITwrD0/aJ5BNeHc4PwTXaiqzt/yStIkurtAowaMbP0+1?=
 =?us-ascii?Q?uxBxX/Tf2CioLzT8iPHfJB7U1p4WfvZPMngp7t3jaoYz5oV8pNuixjqBbr5w?=
 =?us-ascii?Q?MHjVpCUIumAnzVTLE5AULHSYd4QJXAFr9Qev7wT+0ZDUNBpQ+hVzCERUrgoU?=
 =?us-ascii?Q?zyIhClV7Emu/Nfi3pBfii0AKuKexY3Q+qlUl7z61ns5Cb9YxbK5s0UUHKGz5?=
 =?us-ascii?Q?hgBnt63lcmp58PVccidfkeXqzwB8LlmJG/ffepFvq3LxT3uWzrYx9tucb5MI?=
 =?us-ascii?Q?GhsJDlUZsz1GbXjsE2FGb1+wZOXJYg0fTtjxkT1PD0HEwy8xSn4aW3khzSFn?=
 =?us-ascii?Q?V81oCxkVBWxEA3YULOkQPB5Usjvgj4O6mmTzkiB4t7wBl6Di46rrW32b+PWE?=
 =?us-ascii?Q?2IZBMoLtAsAZ+hZkThOWQPeHdiCo9ISELivBHDxruWA1fYTptZH2MB+nMJjt?=
 =?us-ascii?Q?NSa4UAf9RNyZYtKnibdrv9rysys5Ho951g+VQ8Q1ssyTSYQSVxnWpAL6aM3C?=
 =?us-ascii?Q?nVPSf9YO4shuICPcl4W3WnmhCtXzjhZ6okv1dnI0w95rrAptFxkP5QmgEQt4?=
 =?us-ascii?Q?tvvMcHjqbmE465GjSoLc5sozPAiEoyO5DXfCa3FfuLHrgX6f9nKVC/eRewLD?=
 =?us-ascii?Q?k5tM0vjh0kdZmRMVGI4neapPV9fayKdgaqqSiZ7lZdUHml19uFItiAntVa3S?=
 =?us-ascii?Q?GLJ/RPkiJ0Ry+sTUXleIv+O5i5T3wsyek+C6gQ2SBu93zCVii0GIVq0epwVb?=
 =?us-ascii?Q?FvMBLNGmg4q7vUt41SQNcntUrkxmn5c1Ir86/DSAG3yNjENwXnbdsoIzKcX3?=
 =?us-ascii?Q?0TuXHotAez+Iooxv6uwWehNv2aDkBivAXxjiXGmpqCkwCe5i7I8If4P0rx+V?=
 =?us-ascii?Q?DIerC3eBe8QL27Cj8/krUIX1a0JMDmHbgyBgmEc5u4okRlOnmX+MYxA0eN22?=
 =?us-ascii?Q?ub8K1xvAjr63QS90dAlbJaU1CXxVRDfrMehgB6UhCwmQ2XMWqZ22f4gcErXN?=
 =?us-ascii?Q?f8k4J6aco/zUjJMAYdk8+3b72qoau4dJK3FWmr88RpJF6gsUsZdWQEoV1vHI?=
 =?us-ascii?Q?SzqyRCRb87OofRGhR7SGGmzlF02I83PNyslWHkr3GdpMpbtyurl7ZFluIrei?=
 =?us-ascii?Q?l10WL7qUbUjxsZ781P5ypH+JzW5VOb1es9h/UVeRP3AqAmvrNIkhlqKDW8ed?=
 =?us-ascii?Q?sKYh/WwtROj8RB19GBAwSgwv3129n4HbHeh/MPbZ8MHamOfhRT9hTFeMeIus?=
 =?us-ascii?Q?aPEJXaw1NffDStMDAmjFyL7g0HDSGJAjAWXe7pPnSHNnXK8eSJ0J1PnkfwA1?=
 =?us-ascii?Q?PA5NFrU6+GRg5r8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?RvXp01haiKloTxOAcuypWUK4lYLohmlBDZMDfjV6PYy4Rzf2ZZchPx362p6s?=
 =?us-ascii?Q?ed1VuJ9vjsqhrEWIbzdvc44P5BI3/aMczEsHCe9YslAVGvO32OSn0dT1WYxN?=
 =?us-ascii?Q?hhpVn2DRYzAVC8oIv3gjMVBthd+Y62mWM/xBjBUMDoiLXhh9n76VXK0b5qeB?=
 =?us-ascii?Q?Yf4dOBLZ8vFvVnB8nObAJQiC9uW65vEGJG7TtfdiLoq5ghkVe+VN5LQm/Wvi?=
 =?us-ascii?Q?Eg2Y1/V9olz8awbH0N1LN3w/q93DXDxQ7x1enOXTrrYTm6wJSyd1cdEc/z3j?=
 =?us-ascii?Q?k320fz4enzUReOr13wz1p5Hxizx+UmWoS0KpRVqmw60btkyNLWad6/MYUWdX?=
 =?us-ascii?Q?rdMVz0gVW13TmH8Uv5Qmo6d1d6uEa0N2U8e9NmFIO4qKZJWo2fZiI4po1Ft8?=
 =?us-ascii?Q?fp2uMDL0MoCLrOarEl8cRZMpcOrPBjA+AkxLDJ7FHV2+OYbIgpD5nID9tWv7?=
 =?us-ascii?Q?ZVHpiX0yjYAEUTTLQf2t+ouTCB85JK0e033W/3/C9fiBYnAsOi4nHDcvofJm?=
 =?us-ascii?Q?HRZTyhXu97vxMCYBXDxB7TrZ0QgKXOsuDal2baQEaV0kAWcAo0q7FkErl6tJ?=
 =?us-ascii?Q?yIKdfezAuPK6NvjiQAnfLKw5iF4ZLwkGmCHTSpf+GFdL4Edt7Ce/NrBaDJNm?=
 =?us-ascii?Q?SNYoYAUQEepKE+4Whnw4bjv/Q0g575IGeFfWblneCyL2byESVeFd9S+DNAJO?=
 =?us-ascii?Q?y5csrOtw6/m5yWXHTSZTLKpnuWk99yLYZixEk6mmSs7swfJFXU0hHY/UAH4l?=
 =?us-ascii?Q?xzPzZAjdT4UiihK7BVEtYjhjmiiEDW7L/nVDKSGF4smbSl4Xh45XABekMvb8?=
 =?us-ascii?Q?YBBfMziTNfuymv6lPOr3vAJhGrko10E8wAF/D2WRQddG/ql2GI3xeGnn7MU5?=
 =?us-ascii?Q?K+enmJ+yvj5dIoM0UHEH1p4gSnw0DZVL6yvqSHCJJXcow8DrZEgBG3KEe/13?=
 =?us-ascii?Q?QMn84DbmJvleaQ88/kZdVv04BjY9GsowBcaLFsujeTELeV3UYHz/rfA/JWFY?=
 =?us-ascii?Q?V0T0FPEyv+calk67iKaB2en480E2YMgvC7UMfrfmEkl/PwAoOiZS/+2AkJ61?=
 =?us-ascii?Q?VOfFPE5/QRVhCCeodgbrL8BjBwLZC3DKvx3FLVDOSWHbY/nbiBjgrgSPrzYG?=
 =?us-ascii?Q?NDhme2JmLIawgUqplJqsq+zcah4ztpwH0ZhWHzy9cm6KiMqSd2+hXOriZddB?=
 =?us-ascii?Q?B9M4j2An4ImH8EhjLpGn8d0ELdGphQooA4gzIut+f37cY9ebbHZuHEgoDoWq?=
 =?us-ascii?Q?Jdo4rf0k6rxRvaOe7uMnwBgd9XTX4S6VNzuAoSau/az4hoHo7uiunZDPxOSq?=
 =?us-ascii?Q?R3WFPBaQqrWsGmz6S7/WS0p7TU4t9s9lSg9fSeR/bQ9Hyub+nozos2hdL4Z6?=
 =?us-ascii?Q?r4kSOZH0tgM/1aVYfRtees7fYDut+3nwoLVwBspXFCu27+c0Vs3/Fpb2cHeq?=
 =?us-ascii?Q?XQW2rp3z5kZaYEqcSlH+luR3qyUNjlPzi62Ja9Cj5t/CjaGOyvHqw1vg9kyZ?=
 =?us-ascii?Q?BNsI3lGnsVYb9kGyywpYBRlVkOeADGuhx+0ouR7Aa7GwNQvvdcNfm2US744y?=
 =?us-ascii?Q?bRJer6Pyt11HbP+vuwIBp8CCCVUXDIjVz8VQBc6v?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 513828df-6483-46b9-553a-08dd9425b497
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2025 02:59:42.0976
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LmhK9V+niYinjqQcUUEFOml3l7ArUBKXEt3/KMOSVyyqOZ55+mfdT96/WjFav+CjDbCFYNmCGzPsN+zeIgb9bQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9011
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_200018_435351_9726EC26 
X-CRM114-Status: GOOD (  23.25  )
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
> Sent: Friday, May 16, 2025 10:30 AM
>=20
> On Thu, May 15, 2025 at 05:58:41AM +0000, Tian, Kevin wrote:
> > > From: Nicolin Chen <nicolinc@nvidia.com>
> > > Sent: Friday, May 9, 2025 11:03 AM
> > >
> > > Add IOMMUFD_OBJ_HW_QUEUE with an iommufd_hw_queue structure,
> > > representing
> > > a HW-accelerated queue type of IOMMU's physical queue that can be
> passed
> > > through to a user space VM for direct hardware control, such as:
> > >  - NVIDIA's Virtual Command Queue
> > >  - AMD vIOMMU's Command Buffer, Event Log Buffer, and PPR Log Buffer
> > >
> > > Introduce an allocator iommufd_hw_queue_alloc(). And add a pair of
> > > viommu
> > > ops for iommufd to forward user space ioctls to IOMMU drivers.
> > >
> > > Given that the first user of this HW QUEUE (tegra241-cmdqv) will need=
 to
> > > ensure the queue memory to be physically contiguous, add a flag
> property
> > > in iommufd_viommu_ops and
> > > IOMMUFD_VIOMMU_FLAG_HW_QUEUE_READS_PA to allow
> > > driver to flag it so that the core will validate the physical pages o=
f a
> > > given guest queue.
> >
> > 'READS' is confusing here. What about xxx_CONTIG_PAS?
>=20
> Combining Jason's first comments here:
> https://lore.kernel.org/linux-
> iommu/20250515160620.GJ382960@nvidia.com/
>=20
> So, pinning should be optional too. And I think there would be
> unlikely a case where HW needs contiguous physical pages while
> not requiring to pin the pages, right?
>=20
> So, we need an flag that could indicate to do both tests. Yet,
> "xxx_CONTIG_PAS" doesn't sound very fitting, compared to this
> "IOMMUFD_VIOMMU_FLAG_HW_QUEUE_READS_PA".
>=20
> Perhaps, we should just add some comments to clarify a bit. Or
> do you have some better naming?
>=20

let's wait until that open is closed, i.e. whether we still let the core
manage it and whether AMD requires pinning even when IOVA
is used.

