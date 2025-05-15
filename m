Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 485AFC2D0CB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 05:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gNgRVrbL74ug5N+aA5uW6U4Ar1G2uClkUlFI4yHhs+Q=; b=yccSvrWAzZvBlVdSxbjCzKPQ3F
	3R86zCX/hr2V3m5eyncoDbIJbnd58ijMUCftn657owJGztnoGoFAo86MaKTKQ9Kf5RXT9QwxPDjP1
	gSWEsc504/e+vTvdL0/DZaTiRALmlrwb5PUJsadKr5EJZdJR0ECp/JHOPUpVa6J/USp2jd6hgEukh
	P8fRc1+mb97+FEU3bB+bywyk1p3C1NRuy1noD//YzjgndiQ2Sb8/xL182lIqQNulEFfTBd0CEDzwN
	ZRV1CTO1Q8vLP+9x6edd7zXKADWW88Ua/9XAp2/mOL2Rnvlp2qMJ7csrKD43MFvtmrmihmYgo4G7u
	+LZJe7xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFRTR-0000000H5jF-3u1z;
	Thu, 15 May 2025 05:49:41 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFRPs-0000000H553-1HvS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 05:46:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747287960; x=1778823960;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=gNgRVrbL74ug5N+aA5uW6U4Ar1G2uClkUlFI4yHhs+Q=;
  b=VsvKsg8qqzh9Hz/z+CfCocTkXgDjFqPRUtKnMPC9fH+RzgpHZZg1E6Mw
   9vlAiB9aL04+tWftAoBQ8Q4SiOnucHOtPV57fU2f21RCMdxXe7JHx1s8x
   ZcaiZt3AbaonYAF3Vg2rSNca/GQpKzRWg30NgxIfztPjFuAG9yonkj0OE
   /ARWhhyN6jRbbCcitLS0GlubYqmBNuiSahy9neyWN3zvjJo3PMMKl72qK
   PZ1DVELKMHNhlJr6QR3nES1x9EjMd/5HW6WtLs3ZaU3cIpLL7wus++uCV
   tR2kvnyOEXoR5zF8PcFD9Ycs2Rwxvo63m2kUmTjPYdGt5dxJLUzqhKQ0B
   Q==;
X-CSE-ConnectionGUID: pQzvtSRqQZOV3QNn+xigwQ==
X-CSE-MsgGUID: SfgkGXXuS56tsYBV43caiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="59438086"
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; 
   d="scan'208";a="59438086"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 22:45:59 -0700
X-CSE-ConnectionGUID: wLi5BO1IQeG8lzdttTtrXg==
X-CSE-MsgGUID: pXgMJDOWRY+4azXNVjTo9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; 
   d="scan'208";a="139255663"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 22:45:58 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 14 May 2025 22:45:58 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 14 May 2025 22:45:58 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 14 May 2025 22:45:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T1mnwq8aSgqqD2n0v6Z4SuTBmBRfg6P7XmxMjRDyS/gxlzW9d5VoKRDiIoDrv3FN1pzA5S/86oQ6qm60CmCam1HfXOoE9bEydQOop658aBzs6JNz4qERGt5xmKCc4Xxx2qjH1escvJxt3aTfQDJOAnug0LtMdLWQycFAdOoljl1Ffx0K99LrT2cc9PSeW+963a4GjA4haoFzAwEzsyLADX79V8mj8Ni2qx+GWVOr4bE6qntvsIU5asGJ75nW9K72z5iTKBr15yd/Cvmb8OHUgsEpTZCIpa5SfLAQ0pxx49bZxd9B3sEvxmE6+ftKZlqTDVyxXLKIxjNQXYEgLCMJrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gNgRVrbL74ug5N+aA5uW6U4Ar1G2uClkUlFI4yHhs+Q=;
 b=KTAt3Lfl8Wr/AxeDrFt1y3izRzvPnQBl1u+c/Nx+VvA1pUFO+6wIQXlWGYGk2anczovA1x0UNMJHJZ5xRJ9zLq7thRq4WPvD0edERl3ZXS2WqEQH9RXgqC1qEZ+03Lda/VWIpLWLcNiQ72Y73eZKLOP9cM5q5l2hFH4zSW3vNiZ9pgeCao2vapcbfmfEIVmds6U8+fSvlLwfplcpCs/6ObHViKblR+Sm6EPCmyI6VoJpShjkcrOMb3R4Ie/MiW2upNe1mYaSo2wQwYidJJjVRfQjiVXQmcYgOWkBb/6PRvtGtFzKhQyZ3UXjXzeYxef8MlpnHfoe9apPbxVQowQz4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by MW4PR11MB5872.namprd11.prod.outlook.com (2603:10b6:303:169::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.34; Thu, 15 May
 2025 05:45:41 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1%4]) with mapi id 15.20.8722.031; Thu, 15 May 2025
 05:45:40 +0000
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
Subject: RE: [PATCH v4 03/23] iommufd/viommu: Allow driver-specific user data
 for a vIOMMU object
Thread-Topic: [PATCH v4 03/23] iommufd/viommu: Allow driver-specific user data
 for a vIOMMU object
Thread-Index: AQHbwI78/Y4dOWUyyUm/uGM13vUQJ7PTN9zA
Date: Thu, 15 May 2025 05:45:40 +0000
Message-ID: <BN9PR11MB527638DE22441D662B6C81EF8C90A@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <cover.1746757630.git.nicolinc@nvidia.com>
 <86b279e902a3fe624ca9261b84f378d62c5049e8.1746757630.git.nicolinc@nvidia.com>
In-Reply-To: <86b279e902a3fe624ca9261b84f378d62c5049e8.1746757630.git.nicolinc@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|MW4PR11MB5872:EE_
x-ms-office365-filtering-correlation-id: c8c8120f-62b9-4d86-6369-08dd9373ba1a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?UG0LI4dgAzekHjY+hvnWlIS3IXmpkXBlMoZD9zQceho2CJASw+iniBXfKLW9?=
 =?us-ascii?Q?/p1YpSYUMB8eXm5UHspuKtJAl59ClZxccd4z1t5yzpknHbkVna0AnvEzKAbD?=
 =?us-ascii?Q?jjERf/q2mRKfKGh2E+3Rtl7F1mbKYYGQD7yZKiK31+MqMaH3hF5gbYhFTjSz?=
 =?us-ascii?Q?au1sw5fVTdlV+FriWzcW0rOsR9FjtjwhJJhTBK/CTMhQAoS/60cgFsf+yWT8?=
 =?us-ascii?Q?qdsw5e2MxQm9HbKyeBmleF+ttvLptLPRaZw+s4VtfUkIeYAA/gl8Ld5Z2GEX?=
 =?us-ascii?Q?g/5uQ7h9Lwe+NkbcwyKMbhrMxKUPN7ezmXk7AXlLZ0kjJOeBxrmI9MumVHNh?=
 =?us-ascii?Q?3aYBwBbxtktXmnkPBVpDZRVn48lKW8vAuKG3T/yoL/ZZ7LKkke1jDbDrVvpD?=
 =?us-ascii?Q?N/8MiQeLe9njfTLdLHYbByUNXlENzPimiRrdHAT7YdaxR3U+pprOSa/c5DW1?=
 =?us-ascii?Q?0Kp51YXLtlxrgzxxA2GtvxVZHYoaGvM72Dd4pF4IduZRU+hp7vnxXMWttEgu?=
 =?us-ascii?Q?Fpp5H6FBl2xhCVpryWF7CEZmhJJzl2OofRkJv4zwrgvhEJhrUdJ2txCg2SA8?=
 =?us-ascii?Q?Wo5BhKiu7GG8ECdYpTinNXjGvtQ+0eGHrc5iZlXQU0ktVoGSF59ANC+Lw5CR?=
 =?us-ascii?Q?LnW4x9VRdIYQybV2u5WwCNQ03bjFk1kD7GJYnDTYsL/Qlw8eNE7h0IY+Qo2q?=
 =?us-ascii?Q?MliuISeKoU+X+9lnkDbVOlRKK/+fq2UglpZ/sJJtIyvf2t493W7is+pWGCAX?=
 =?us-ascii?Q?yDEchrEDR0cpueKQHhwVTgCG14VCRfpMUk/p6P1RzNyGxmY8ezgN2WSi0I3+?=
 =?us-ascii?Q?paNsa0V3oYuEbP0WGSygirSM0SZj4epAlHdgxTkqWsP9iOMwC5YD4UtCenyb?=
 =?us-ascii?Q?uvswTIfJU9NIwpFn3hN4XTcUh/eaxKbK/nKIve8+KWzKxMmFRAfWkqPzAGSQ?=
 =?us-ascii?Q?iJY7kIE609N0Ikd52qWr0PXRzp16NxlJZCKZtu+DxG0aCL0WgJ+N27iagpKS?=
 =?us-ascii?Q?KGMNynlxD1kwqLQdF6zKskhJ6wU1fz6S4Vsvg5prINc/7uAIPwfvFAZ1bLiZ?=
 =?us-ascii?Q?W54C9iwEybXbb3kFHpAS33pakxVmNouASn6w91+pGO3dezCI0gG1HDGP+m4D?=
 =?us-ascii?Q?DGRjoBUfouKwRqCYeIfy8Mwau+3gNQyoF5P8DkBfCdz6X/Svk1NTDa4g7tLP?=
 =?us-ascii?Q?HNXJU/KUpK7z/13vLo03wtrY+fIoDLHvPPQH+/7ASNdot0Zz+SK6xBkfx83e?=
 =?us-ascii?Q?F80trKuW3PJflHPw99UVbZSJPWlZsx4U90EzpkcDxs4eU6hPZQvop1qEk+RG?=
 =?us-ascii?Q?9GHhu0wpJ9fPNEgGLxwbwSMZfRpgJFrda3miHJhCHZhpatq3CxzrxJC5EDjR?=
 =?us-ascii?Q?kkocJKh2xTgZGLm5E5gcm41PvshheZbGLqXC3OSlGVj5M3do3pzwvSFOGVLU?=
 =?us-ascii?Q?4hoftb2HOuC0Eq4JnGqM2jnR/+4zZ3b9CmHhQ5iervnomZgjWaOJeMYQsidR?=
 =?us-ascii?Q?nUvSJ3mqW3bzQuI=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?pm7ADWmsaeFC8+fuThOeCqLoa3Kb93Z8kImxUZMNCHaBSZn62VASn18FGpss?=
 =?us-ascii?Q?1Xm4e5GwOUbCZCA91cZTQD5TXRkU7vY4765ZJk/irPWs7kjRqeQDnta+TP5+?=
 =?us-ascii?Q?Tydlf0Nl68yQ6CyMKQG5DLfBtUMDDzRakw1WUA1unlzKEQoC7W/uj5VVxtPz?=
 =?us-ascii?Q?mo85M3DuOoRPqihkHeMxbq/3SdwlZmaVlycxnCy96YAQgvranmg9y8OkE4uh?=
 =?us-ascii?Q?al6QJ3p3M+MFnHJPTlGYg/9llIodwX/f3LxKgTXxDipXiMyxxYC7mKLr5zrb?=
 =?us-ascii?Q?qeo8QIpfJMF6zzF8uMyMrcX0vHBMwhI1MXQAWpvi4oC981Ea21FX3h32CF3K?=
 =?us-ascii?Q?DZNARpHuncpdS09DWP8QInUM2zZ2S3T0KzEvOkFSPhNWD+sqs0ClQZz1CCSc?=
 =?us-ascii?Q?xdmKG7Shh/MoK+AxqPMaHqTPa2g9EiCidH68I7PXZ5UzOtZPXP3dQAVSbbg9?=
 =?us-ascii?Q?LU+jXd6hRJSuPZaj+TOzP7fEWeWFz7qDdemRWjK4zlk8qg/w4ZYdtAwGhcCs?=
 =?us-ascii?Q?4gY07WaDvJAZpVBQjJlZMmShClU1t+3RNpsopyaOM6qF1h9jRNWbq5rmdLx2?=
 =?us-ascii?Q?8feTjMhN1tov0yFw5NlmzkrytR6HrZUCoOX22ayBYOXXIwDxCNxen9OFjgj2?=
 =?us-ascii?Q?Sajf554Z+fSZJl2Z5YVoZ2TzcAvBqc6sIe8VfpOJa+QJ63cljrAHpHSy0nbb?=
 =?us-ascii?Q?zD/izcwdBrpSusNXy5VZ9cxbxikgDG7rTHf2rI0yRSs/Fl9uwLoenaqj/Ix7?=
 =?us-ascii?Q?3sG2eHFcGa16hlARPITPAQm7jjr7dgh6xtGpPJV3AasGq01ZOOZX0WxPcA9e?=
 =?us-ascii?Q?hKgl7jX8LP1VbGPkZYzwWYH+BLfJ2fbdwVgT4CyHGtjmCcs7Mz0slY7M4q8E?=
 =?us-ascii?Q?8aKf876SbrJqtyjAsBgAgFKHj0ICUp7LDDU31jo0zmFbsLMa8iLDlJnkOtXV?=
 =?us-ascii?Q?eLiPlly16x7aHdt1XDaaiQMHSqhqzz6kx1kShEXtpgNr/A3MA/6fOxkiBf6H?=
 =?us-ascii?Q?Y+7mb6lMrf6RxJBuQBqfVnN/C4RP/jHw4gMy9Qp3uhIulH3iMy603m1Xa9Of?=
 =?us-ascii?Q?S1x6rjYXL31lUh0/H2BRFj2T3qdDzBTkcdM5Dz6oD6GQsdxy0/LERH4Qluww?=
 =?us-ascii?Q?WMhogdHR0D5PHboxO9t6LIOq3yVI2B8LNl/NoIZw/Dkn9eshrjv85eDoNj9B?=
 =?us-ascii?Q?qHLQEYWe5zBW2cm0eII1LdYIgHoGyu0HH7igv1bbWLrpglCpK2J+BIi8/5rM?=
 =?us-ascii?Q?gYIzLUzwanU7u2KyoaMx/ouUHvAeKNAeWurdt8I0REmnm+14QCeL0wahCP1C?=
 =?us-ascii?Q?jO0hbHZiq/JEljTfVmaPUz12DeMqvKphsXiJrlhwy6y2CbMO+d2xP0yepC8B?=
 =?us-ascii?Q?7TAynQBChtDOTOKs0KkLzTFMflLDZR3SGFs0hMHqZtHynG1HWZC5p2IvABnp?=
 =?us-ascii?Q?Yhe0cMCAQLkkVjyGi83r5fTBBbFX/HooB/WfCZ9OexZPFOsI09iYbiaYF5Bq?=
 =?us-ascii?Q?Q0IL5E5rqT5mi00aJIxtS0j28Xe5MD+9+MfCnmzz9qYPG9G0USXVeGNA6HFf?=
 =?us-ascii?Q?bRHDaWoYEeib0IgRW3sOFn07DFougDsQiZyHdFLd?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8c8120f-62b9-4d86-6369-08dd9373ba1a
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2025 05:45:40.9233
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: frIG6AA9o1OGfgZiUUhktIxSR2CoCVrfbVYvocaCCAa2nXTr2e7PFtrKqz0wgtvz3ll/jeV8AHFhrfoJq0Zcew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5872
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_224600_394487_557366A9 
X-CRM114-Status: UNSURE (   9.35  )
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
> + * @data_len: Length of the type specific data
> + * @__reserved: Must be 0
> + * @data_uptr: User pointer to an array of driver-specific virtual IOMMU
> data

I don't think there is 'an array'.

Reviewed-by: Kevin Tian <kevin.tian@intel.com>

