Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50F6DC3ABC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 08:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sF1lJ1byN93tp3hKMFDHg21PGyiNC7+66fdOdqZWiNE=; b=Czqxxff/KWYokTqahCWFjdo5Rf
	I7qg1Tmt9awgAfxYAwDRsxrZ0Yn0zpdA3MpwC5fzL/HIcDKjm2dOfX2R9gLhAdBQ7XpLucMCyXb6I
	MTAMyHRJQxPHn1L6Fd+8hzMcYwKx9ZWWh/Lz6Nkc4Jgn7/vs+UKgArmmrZEj2qutvNoK+5OyQepTw
	DYOQ73mhSOlP5Ru6/Zc44Rx2to8t432QmDxrJWn69nz1csRXR/UnxMecSIfD6nDLXV04vZAEK2lLo
	79QGJjO0U0wXq43hTwH1e+/W8SNr7UoKdR7MxQcZ8rTxitea57KyHgAx5UPnFTYRcnPfbPlXp8gNi
	J69vgKNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCa0k-0000000Ei7c-3oQe;
	Wed, 07 May 2025 08:20:14 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCZ7p-0000000EVm7-3Xi6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 07:23:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746602610; x=1778138610;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=sF1lJ1byN93tp3hKMFDHg21PGyiNC7+66fdOdqZWiNE=;
  b=IfI/MJTHnqv0bHxW4d4lRMx2IHfFBspFK79UZ8qa+E8GRkD4IakOwbIq
   ZkLT96MMEk9SWTyYdCSk3pqE15rdTqAAps1nJ4RDW7efpbMD1lw1mIL3Q
   0VtMJk6F4LEgIJ48Uu4QC95zuqhlHdNL/FbxXqHr8+uQjYrRNMmMNXVFz
   FN60Qqr2iRpqoiBOzBupDhNNoLyLEhZTpkWHAt4AB4lO7aQ8xTYOOPrK2
   CmXT/1lwKT9PdnrVJjy3lsL3b8JuE+h1rEAtAAH7s+26L8H67sSMciWBC
   fHB+o4WbAloXOHS6UbTG2M6wNtmYWLlomW6WJQk8NI82EhOuCZtCrWvZG
   g==;
X-CSE-ConnectionGUID: QKRXxUyzRHSg9sa9hFnODg==
X-CSE-MsgGUID: FtTjXrzIR8eIKIVcK3dZCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="58510801"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="58510801"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 00:23:26 -0700
X-CSE-ConnectionGUID: DIdZOVCLRiq8+I9r7FbupA==
X-CSE-MsgGUID: 7d9GkLTvRwWge0ZmJPzvug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="140603510"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 00:23:25 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 7 May 2025 00:23:24 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 7 May 2025 00:23:24 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 7 May 2025 00:22:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dqiI+n4PD4/+8qrQ+rumQeLBk/Pbw1uTAAjji1Cykakqz2l7uTF5FDjfjDOVJ6AbGREzuPfOwajm41+tgqCC08kgh3CQ3dr6D3CKHEqJ1hkLazqR3oMqPZo2sp2x05XGz1turO8sXiiBgwZq8FSwGhpP0LmtjkanpXITjAa4W7NL3t8uwoqa1IWYVYuGAAzUEjA/hQE5v4gHNmZafu50M3bqDE3yevIHwpCa+5MG4eyPEukS8oVvHRa6oya3vistM4jC6zLe/e4KwnOFd/3p5oRydN2IRDR+7WvaMlW2BCDG3o81BDWJ8QYQeubMxjt/s6jgOh42zyfOkFn8x7eDxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sF1lJ1byN93tp3hKMFDHg21PGyiNC7+66fdOdqZWiNE=;
 b=w/wF5OU2BMQLxk8NsaAIDq+0kew/BisvgaU2T13jFsSqBpzrSBr2OAl9l4dSDkTnKgD1mW6qpZ+w7bPR08q1Iqj4cuGJt9hJBKvB5+GP3XlefHxuRbE1mOjLDmbSPAF6TF4BZKPAhs0TTJt775pKuuAH6dtJpGJDPHC531tjNo7oxnqCaDtKJ9tx+s4oqmaI7iXiEU0eGcyFoeSATzOx42c0YC64gN3KRv21qz+Th0NOHW+I7iIimcEGdsyHhWpRpN8I3YO+3RYZhW5fLCr/9MYyUSFISa24ydMhgINsZEkMBtX/n+AZarglvytwU/mKQm5ky7PZaR4VRDZlxeUH8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by CO1PR11MB5044.namprd11.prod.outlook.com (2603:10b6:303:92::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Wed, 7 May
 2025 07:22:24 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1%5]) with mapi id 15.20.8699.026; Wed, 7 May 2025
 07:22:24 +0000
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
Subject: RE: [PATCH v2 08/22] iommufd: Abstract iopt_pin_pages and
 iopt_unpin_pages helpers
Thread-Topic: [PATCH v2 08/22] iommufd: Abstract iopt_pin_pages and
 iopt_unpin_pages helpers
Thread-Index: AQHbtnBgpkGgdbEd20qNTy9huUtOtLPFZrYQgACjfwCAAMZl4A==
Date: Wed, 7 May 2025 07:22:24 +0000
Message-ID: <BN9PR11MB5276090879BB4C76CB27909E8C88A@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <cover.1745646960.git.nicolinc@nvidia.com>
 <d44272c153e7596c3cef716044de3dc6c2a8254a.1745646960.git.nicolinc@nvidia.com>
 <BN9PR11MB52762F5A464ACC68D78465578C892@BN9PR11MB5276.namprd11.prod.outlook.com>
 <aBpgWNitAgNenOPY@nvidia.com>
In-Reply-To: <aBpgWNitAgNenOPY@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|CO1PR11MB5044:EE_
x-ms-office365-filtering-correlation-id: 51e670c0-2bca-45bd-3bef-08dd8d37ea28
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?Sfty5B4pnazAGHx3kcIYY8PckPfe5rmWzoFctT/gen6/4wzOpH0R7lNoQk2o?=
 =?us-ascii?Q?uuw4VwsGwoX0SsnR90RYK3zm0+ndexC3GzYJAzddhpZ0R2trR8Lh8PVW5DM+?=
 =?us-ascii?Q?j9GgzOcOTqyBZa6e9LhIrb2QAQgtGLJzn1VTEILqOl7MyMQhOW8vglwkNvdE?=
 =?us-ascii?Q?OqX15acD/bOvpRauWJL7LHHpXudCPGACV8zUc6TJSGCn1qGvJNgDO1akBJMl?=
 =?us-ascii?Q?s115Gk7/QI8xkF0xgtS/OFrpL5al6QlpKzCXYTIRJp7fqaihavrI5VDZUIZU?=
 =?us-ascii?Q?OOKWN36KlS6bKnKTsip4ekWpAlGZq8NGWXFTJT6u2Do3Vgxme5u91f9mhqLj?=
 =?us-ascii?Q?Oc6Nl8WZSGqML6bdAxMpEu/28CSLWxuVaVkbn9JdlIIEmpMetbbusZay8F2m?=
 =?us-ascii?Q?2M0t/Jh58OOkVVFbQbu+0D8a5ROF7eZJ4JktdWDmr6XOe5zO73Jl9e/UE7LT?=
 =?us-ascii?Q?Got4LYmjq3HbY+i6/S8SqRG6LeEYVtU3+wkUmZr8HjMBwAOaJCIfJCK5uI68?=
 =?us-ascii?Q?J+yEvZ8p5/KgKV9+EFIlhUB6n+YGrhvrA/jNHODnYdpdHzW/v3QhLdZsJtS4?=
 =?us-ascii?Q?MvmHdsXGmRVDPUdHlkpRnO2oEqcTyPlksu19cNFwhcz+RCCxP1nSWVSh4/Or?=
 =?us-ascii?Q?BhM9r0N6v1Qr3mShx6VfTbI+3dzx2qFPe3J35PFk8Jo2ABJ9q4S1msLAP22a?=
 =?us-ascii?Q?SXk3iX0VwtcARbZs7AdnR/y8dX0BEjfdCgoCvD0nIPlF6F8p/O/RPGVNPPwY?=
 =?us-ascii?Q?KrWyaK6VNjQapTZd3PKDlpZY6tDGKwTcVD8/pnmdUSdZYKGh6442ZguFaMjm?=
 =?us-ascii?Q?XhZIKA/G1g9KgVn5CFa6kHzMJqapAA63wyVLLFERb0yXBKT2UhtRxrD9OLxl?=
 =?us-ascii?Q?+YOAJW/jFqDNSuVHDp9mqa4EOBqjaSF6MsH6p9ahmif1YqntSj/aDzKbpqk6?=
 =?us-ascii?Q?5FRYRAnedO2vPQZNYVEPGqP+sf77zy1hY8JZ+4d/Spi4ySuYfCllhiEDy1Rq?=
 =?us-ascii?Q?PNLKqF9W0vbs14HYNPqPiiNkOLYTL2Mf8eFynOS/FjJQdr8W3lZKnJfHzp74?=
 =?us-ascii?Q?M5Yltf8gy9u0at8PO9xMwOZWYyz+SCA3p/zxRrYP8yZKRL4krVwBUK3vFaeq?=
 =?us-ascii?Q?rTVxy74M+vKquXZHl53R0iMUtRFme2P52Dzug6i3yX7IBuri3P1IS8Dt+1A4?=
 =?us-ascii?Q?oP252waqi+aZz2RTaKDoONSPL2+MpY45IrUZz1IL83EaGRYcpUN33MKYlJd1?=
 =?us-ascii?Q?DzRmHwO++MG1dMseZwj513nZy0Bzj4PIAFWOE+ReDr/wFkCgTLuRBmNRnLYK?=
 =?us-ascii?Q?yEdc3jGzL7FXms2fHgspOYHLY7x2TVNSIQxkftOrY+p7a3R3w9pjW1dY+/pr?=
 =?us-ascii?Q?Tqkw2Kqc42CbJiT1/aEIpMH2JdpSFYTxZjjq+vL1IRm82953aVxxBVyk55yY?=
 =?us-ascii?Q?Ex6WpAggXCJUMTcxocEpxBd3mkyoah/KswvqdVXk+eusibDLSqoAo3I0eiLP?=
 =?us-ascii?Q?dJUFTygXRLCbLC0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Kx0+PG2guxajgqYsYynnXOZK6LdYH3FtRvuEKJSIwIR67QpjmwDs9ZK27KPZ?=
 =?us-ascii?Q?MEqrn6oYulcaHfpPEYKJbjz4/fmxFXd+MdEq7V7XdjzD+NO8hzU6AooJRvrk?=
 =?us-ascii?Q?9H4gHFQ+xPg7KNM2M+D3wU/IXtI1L3BNO6gMf1lTL7WQknx/+pmJ/8nEksI1?=
 =?us-ascii?Q?nvgI//1LhRZz0vfpr78LZXasVhkmkjvxhpQB1QsKlzpFmhklI4H6CIPVthxk?=
 =?us-ascii?Q?yCr1kdhRiwZSFCTYqFR2wJwq7ZpgjUnJ6EIxynUIkv37t4wh8Vj2iILOKNLm?=
 =?us-ascii?Q?GkdG4Gr1zBEzb/RbfwF+QTsoEZdvC89i0HYtAKQaRAsOYg+FNpBcdqNMnarG?=
 =?us-ascii?Q?j9ldUo5imn4/GcnQU4JYhPLK8o1wbMqoguv3X2ehl+I71M0TDirUIKtGdkZV?=
 =?us-ascii?Q?M39iW0OJPQzl4HyR0OE3a9bm2SqXK/7S20aUfZDo5lZm6qUHm4rk0JzSCiOx?=
 =?us-ascii?Q?Qvwyp47iWBs5Azmm2jP+XEEj3IsxQJ8ckaLIQ5XpKQcJNd8RCjgmJ3nWTxRr?=
 =?us-ascii?Q?mtvvVFk4UaqmfyspUKbt5PQImQVyfv0OzpPNEJljoDr3gvmzl/xTV1gmK1jO?=
 =?us-ascii?Q?uD9LMJd/Bz9MlAVd7aVTz0dEj6X3b0QO0thSwklZZJF8MVHeJ6zEket1UNvE?=
 =?us-ascii?Q?gX3Uj6+jYmVGdwH//kKk4KsF2qZIMAbd9rDcFnPrfjUsc2opE3gHcKxwVq5f?=
 =?us-ascii?Q?ScJbpwy0dJe3hv64Eq4uR5LIfUkVhlwkmdKrGcPf6FZ8bpVyPm0dlJB+Nq+3?=
 =?us-ascii?Q?e7Kc5b2/s9AbC538e/4urGtSmAPW8bLuwT9VkO84gSM/HLo36JMtLUodTYZ9?=
 =?us-ascii?Q?REwQd+LNtynVN7Bu/6vqazeE9wUj4YfcF9OaUUwyOrev8C2PYU43Dd64RYxV?=
 =?us-ascii?Q?Uqg2IvBk5kSRJdUI3GhtpMd32uUiNBgiBwBo1ZaRtXnaCojSIFcLX3onOyb4?=
 =?us-ascii?Q?XhaUuaRzJHUFW9Nw+aUttDPozwxuN7ykxHL6zQ3+OA0zbvV/4vGQpI+vIFv0?=
 =?us-ascii?Q?obZmcwkLQmBQcRq+W13VwhacSwmSNqe/vz2AOmumVTbmh7wy5Zb4mwxGecQV?=
 =?us-ascii?Q?45zy2QfLf1Aw1n2T/STmSwnkfhpz6y835IsWqhdP6KhHJxvA1okOcxrox7Z9?=
 =?us-ascii?Q?2CGfhRYY0iZ0nY6n71qVSgOn5oOjF39+8yet8/QDoQ/bHURMRlDs0xnmwVX+?=
 =?us-ascii?Q?Nllk9RaqCZXBvrCCYhvziqQkW6IHByT9Tlu+sKmfaCG/IF0MnWWhojzmE0rp?=
 =?us-ascii?Q?BOPrQzvRnh3xgUC7vYj6VWMtO4kf1Kc4Ov3J34Wutg8xPZe8igb2lQnFRAi9?=
 =?us-ascii?Q?BV0W/DX69Fs7aHq0844/gnGCP+loANrXhCP1283TjQhmvCC4vRIW+yneQ+hq?=
 =?us-ascii?Q?ECva5ILnVPWvikuy2/D18hBfV+As/Go3nUfDvzgBaOzVybpm/eBuiOmPsj8C?=
 =?us-ascii?Q?v5D1cgcO4D3jSaCNnMoOgNm5ANCz5Lv5W9XOx2mE7Of0QJ9+Aa2aTe9Zr2ii?=
 =?us-ascii?Q?NRwhcwJ4Jwv5VgqQsX/o+W03Ux0udLP/9iV1pHmmKuEg76XUaLWS9KvukAJS?=
 =?us-ascii?Q?9357374OoED63lbFlZ2+QZ+XpbL3GCY6cymKHLlI?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51e670c0-2bca-45bd-3bef-08dd8d37ea28
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2025 07:22:24.7362
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YBeUItMQpKhcMigN/gkOqLj5sei1jmY9Y1aoyMd0A0nR54s7pQ5cMYU3TKmU1U099bF1OEeea5OHcjo0rfUCJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5044
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_002330_148003_D058DB62 
X-CRM114-Status: GOOD (  29.61  )
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
> Sent: Wednesday, May 7, 2025 3:18 AM
>=20
> On Tue, May 06, 2025 at 09:36:38AM +0000, Tian, Kevin wrote:
> > > From: Nicolin Chen <nicolinc@nvidia.com>
> > > Sent: Saturday, April 26, 2025 1:58 PM
> > >
> > > The new vCMDQ object will be added for HW to access the guest memory
> for
> > > a
> > > HW-accelerated virtualization feature. It needs to ensure the guest
> memory
> > > pages are pinned when HW accesses them and they are contiguous in
> > > physical
> > > address space.
> > >
> > > This is very like the existing iommufd_access_pin_pages() that output=
s
> the
> > > pinned page list for the caller to test its contiguity.
> > >
> > > Move those code from iommufd_access_pin/unpin_pages() and related
> > > function
> > > for a pair of iopt helpers that can be shared with the vCMDQ allocato=
r. As
> > > the vCMDQ allocator will be a user-space triggered ioctl function,
> WARN_ON
> > > would not be a good fit in the new iopt_unpin_pages(), thus change th=
em
> to
> > > use WARN_ON_ONCE instead.
> > >
> > > Rename check_area_prot() to align with the existing iopt_area helpers=
,
> and
> > > inline it to the header since iommufd_access_rw() still uses it.
> > >
> > > Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> >
> > any reason why this cannot be done by the core? all types of vcmd
> > queues need to pin the guest buffer pages, no matter the IOMMU
> > accesses GPA or HPA.
> >
> > Jason made a similar comment earlier [1].
> >
> > check of continuity is still done by the driver, if HPA is being access=
ed.
> >
> > [1] https://lore.kernel.org/all/20250424134049.GP1648741@nvidia.com/
>=20
> But I am doing in the core. I have iopt_pin_pages() called in the
> core ioctl handler iommufd_vqueue_alloc_ioctl():
>=20
> https://lore.kernel.org/linux-
> iommu/1ef2e242ee1d844f823581a5365823d78c67ec6a.1746139811.git.nicoli
> nc@nvidia.com/
>=20

IMHO we just want to keep the pin logic in the core while leaving
the check of PFN continuity to the driver (or have a way for the=20
driver to communicate such need to the core).=20

It's possible for have an implementation with IOMMU accessing=20
GPA of the queue which further goes through the stage-2=20
translation. In such case it's fine to have disjointed PFNs.

