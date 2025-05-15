Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 956DAC2D0CB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 05:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pdblWF43CHrhngoTmPTcuxlnjtEnDA3P3ugt2AVUwyA=; b=emHCfOGjXqssjlrfS5xe8hbklh
	g2zX+3E+RQkvDUA1ZYoobdcJevB97aRQKb19D5lbWLdh7ROHtFpoiZMKJixc0N6h9cQqs5OXuaqva
	ruA2s9VKc8qenKrkxtyfJGgyPhF2nNw4UbMB/l2caT1d5qGtAZ18YCs70YywTu5OCZfrpZ4q5rW4K
	iL1/HVMUFSp7qAe3It7JJ0rszkmHSf7Xb4GVc2de+bTkEiGLcDIpUG2itUn0L+okn0Fbin59p3oUI
	2CZEcecxScZT2orDztc27yFQ6OwYDo2Yq9m+ukE0vxyVIM4vsQ3jWJ03SQVQ59HOCqLhHlV+Jceh1
	vaEoVBGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFRPU-0000000H50w-1mz2;
	Thu, 15 May 2025 05:45:36 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFRN9-0000000H4U3-30wi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 05:43:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747287792; x=1778823792;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=zHHsbzf7Gfd7o5FgzuTM1iz43QfAlIqINLFc7H5z6hs=;
  b=Zp0izvI3uqac229AynytVV/CccNAZuWWrfXicK//mO5Ryy8jSmUbEzRH
   KJe4WWn2YjigRGGxiDLdg1Uv4rAwbsxGT43WDp4/2KCd7UZJFFmt76+oH
   lrukyWanX8I9yMThYFJQTHShlU1s57rMDUCs/KJo8PSjQ4/UVHN01j9Fq
   gJHeUPi2xWtJ/rF42PjGQ90Q/bMFAsN9262fWPCWsm2MImB10/Prz28E7
   9q84JjLpYdUKK1FSscIhu0bY2H9hoM5BVhvjA8OOKzWe49MywbBUyWdJT
   2km+yzs19Fr9bsb/ztg2lMqtSLB4/TYGo0z47mmE/kEvfUko+csCRoXcY
   g==;
X-CSE-ConnectionGUID: cBJh3r1hRByWLRmxhO36nQ==
X-CSE-MsgGUID: Q1r/1d7iS7u4HJfw9c119w==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="71718508"
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; 
   d="scan'208";a="71718508"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 22:43:09 -0700
X-CSE-ConnectionGUID: 1rpLBn/UTZOpaFEgcSkH0w==
X-CSE-MsgGUID: 3jgNlhOoSpenPv7A+RJ/ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; 
   d="scan'208";a="138313415"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 22:43:08 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 14 May 2025 22:43:07 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 14 May 2025 22:43:07 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 14 May 2025 22:43:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rrESy+FZv/qYiDuUqOj8diNkLgzelWOiFKY2+TGZmmY7bR08cpsxZ1BVa1gXJUt5iOHHIjHbyntnvVoM2/rdZEYa+OkxvI7onY3QCDqEj88GcTnCUoZQ76Ed0Jf0R8SGyAAU8lqsPO1Du1zkPTGRbXQQEjtl1bATNPn4C+hxpPLZj7IrDpXj7vYY9j5W+sW4qnoBcAEBV06J/b9/pQhGOpYQd46SgcJBOzCYTWBHW9zdvlKZEI5LlJPrhphmKKZ1E6swIsB8h01F213KCxmxODYgnPEa51+viLsZTLfejbUl4LdsvPBY1/8P1thayohC+qqXu/4GMGiW03WX2FHH4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pdblWF43CHrhngoTmPTcuxlnjtEnDA3P3ugt2AVUwyA=;
 b=HkVFdjqq+tOOjt2VhzB0jNJo7nzJ1ImDPcxzaOvlrDm6RN4UnhoO8QqSoA0l7t/DTSvfwweOIXXliohXQBoCw8Rm34Bv0o9Aw/6qSBc2RyXHs+kOmesn+MFlLtSAlTCFoqGXjdIUf/q2bFkFs5VYvYrZrJy2wljklDd+K4CPzWQEMyvYYBlcWrKlbnmMJO2Zot97V1OdH9dq69TqQGYvUEr6r5AseX2VX/oy7M1fsxCclYdWbedrRoVC5WOkf8MMtzOoVlW6vG1MYHwLIy9iZ2zCDLOM68F+x8yzLfJvl5xpSmqoFr5BiOfcx0NM5veBGx5LKQLDCBqU4EdCvkLA5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by MW4PR11MB5872.namprd11.prod.outlook.com (2603:10b6:303:169::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.34; Thu, 15 May
 2025 05:42:47 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1%4]) with mapi id 15.20.8722.031; Thu, 15 May 2025
 05:42:46 +0000
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
Subject: RE: [PATCH v4 01/23] iommufd/viommu: Add driver-allocated vDEVICE
 support
Thread-Topic: [PATCH v4 01/23] iommufd/viommu: Add driver-allocated vDEVICE
 support
Thread-Index: AQHbwI7zW8egeSiSOE63GohcDKrLQrPTNsiQ
Date: Thu, 15 May 2025 05:42:46 +0000
Message-ID: <BN9PR11MB527677AF23F5CF1605666B388C90A@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <cover.1746757630.git.nicolinc@nvidia.com>
 <cceddd59f04599e120e4620ed001f5d16fb66ce1.1746757630.git.nicolinc@nvidia.com>
In-Reply-To: <cceddd59f04599e120e4620ed001f5d16fb66ce1.1746757630.git.nicolinc@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|MW4PR11MB5872:EE_
x-ms-office365-filtering-correlation-id: b1a18a90-8108-4286-b032-08dd9373522b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?nHiBRg6i08yP7/zaWXZ3zsNxMSYFyLP1JwswH6QVnA9MOyQmAz+ndCR7Wjt1?=
 =?us-ascii?Q?jyKPZtAqiiWK32aoNEUbWVQ1rBMapKe1lX6VA1mzIQq0SdCwuscdcuX397UC?=
 =?us-ascii?Q?+LSil1r7p08Sw2z9tvt/eio8LWxki7LnroYYcfkh1utMPduKhYGq//Loj+6t?=
 =?us-ascii?Q?cvC0IRkdTw2GX0RqpWxOi56MWTF5equE0Gi+uvVjCueTKPmx9wWqsnb3T05O?=
 =?us-ascii?Q?LApSNmOtkdQpB+GUYTMp5AlWS0aA6mrqH5Uc7NJbvXSF2SgfUA7XzujXr2Z5?=
 =?us-ascii?Q?Ht0RT//uaMSKsWc9wJAQNkW08EDNAZUvso5eIDhdvqBbbqwwC+3QbQ9OTf16?=
 =?us-ascii?Q?KE/cTtYHZ0spjpVW3FCeow1irwPkoh1yJyEwVFwTbRsJh3t6y5vNYFa4F7HN?=
 =?us-ascii?Q?ye1VhVUqvCYVE26hCVLy2uP6rR/WLEX4DzFIdZsd9/jgokidsY2QkfbDmEPS?=
 =?us-ascii?Q?IE3IOlPVgWdXev/zSsaqr9Ms5LTy4LxGiFX7QmoHZnNwMcVpBe5oBCRYr07U?=
 =?us-ascii?Q?A6q+MxFs/mB5j29xoh92kl3T5+LPcPkV1xmBqPCGWHAVjmYZNa4jYwLGSYL/?=
 =?us-ascii?Q?VW23OLRX47lUpAQRUOE7f+ocwOseZ+gEm3i1TaV4iAXqchvuYhYATdJCPRuh?=
 =?us-ascii?Q?W5CJURZDBRhLtD5HoGUC31AdX8+r9lw8IZJAT5yBL0zb3j0ILs3zz5lixA0x?=
 =?us-ascii?Q?ERhYzneD6w/xA5gB+58Y6uTakX5usWXfmWFsrHHQ/t9QC7E29iUzLRSNKCO1?=
 =?us-ascii?Q?vQTNNparuPsnmKJnpn3OqYgKgHJIKf90N+lHaWw2dm9f8PC3Avgo1wxwlvQM?=
 =?us-ascii?Q?DkG19oDQVfCAx+Du6nm4nceEkD76Tw1prqeLvnUwnFGDK69wXYMBzSnHnvk6?=
 =?us-ascii?Q?X03Kr99/gL8M+5a4nBf5xM1L0FuECJCfVWR+jRHVRkM4Bd17g+8KT5PSVzLI?=
 =?us-ascii?Q?VRdm5V5+3XDgZ2z5ecQJPS3Pbg7V7fNzjgaUbt0we/EfU4Rtd9M89KlHr3LQ?=
 =?us-ascii?Q?5c5nLb6RxAEiB7APd78V1lDFPcsdDrOBNzOrhP5HdLngU2eb/Pjt8woXpFqK?=
 =?us-ascii?Q?w0mGYMmrveD6QEIokjF45bbfhcLN1YuBQdUWBMsVMQfSJS4ITxpfvd/sYO8O?=
 =?us-ascii?Q?dH61omY4nQqNviJvlouygjOXmNa/5W+ClA+CtpcwhUaxtTIxl+IcocCTA7NE?=
 =?us-ascii?Q?MFzTpo51mVJkLtUu+9UAZokir7YV1R+ugrto30vEsfwm4/zv2OCQZCb+YsUH?=
 =?us-ascii?Q?3GWBJod+e3TxUZ8xEACRNzE4PICCv/xYkXE7ZTzDopUNwY5abzw12cLS2cKR?=
 =?us-ascii?Q?l+0UzEhInvS3ZimwEu0ASgCqP/Mwp9bNs84FEB4CMev5ABvoloCTSJvBSkhJ?=
 =?us-ascii?Q?xEvYnabFCyr6MwxaWqVUdEFMRin1MJjv74S7PKndSo9vgOitkFiPTCEM3w35?=
 =?us-ascii?Q?RZTgkdoTRAbAwyPwFugOIjZXxYp8Ek+HTvJ6RDrKqbHr1pBeYp3pWY70dOPj?=
 =?us-ascii?Q?I/koyg1Yx7e4rFk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ckDRNnYMN0Gqh2qQNhkvnlYT0vIrj1KovIeYUFylcBzUz3eYWhatIP+b0cta?=
 =?us-ascii?Q?a+4W1vNEHB+NOxC9lpKDilxqkHq/5jfBrQQRsLV1P5Mmw8/Cs6zWOEd5fLQE?=
 =?us-ascii?Q?JajhFSLjleZT6mYs4ZNimXtMfTvfMVDetK+V6FXEPbp02BJig6oHY78tIdvh?=
 =?us-ascii?Q?i1hX5wYsmhKDj+tdtvllpLNaBom9KT6bhogIWXx4bkpQBWEuGKkVcbB6aIH8?=
 =?us-ascii?Q?KWROpVHRSDzw0A/+q1mCjuYjRywM+8EtFeeElHTkFcbbOG3U3jgFYx75mX21?=
 =?us-ascii?Q?4JsfnpbyPLEIzYP0Mk0VGL68xdpzQQe/oFBx0hJkjKkka6nfIJnpPWZ2CKgg?=
 =?us-ascii?Q?ZPmwLLmYzCgwST/UZDi5qr5yJChiPnugx/uT0qrAAgHZcm3Cqz+XHspivB0F?=
 =?us-ascii?Q?I+FJ6nElT71mcXrxaFPnCs1H/x92hCSJZpY+IT4UUThg0ROC8/ViJuFnPnfF?=
 =?us-ascii?Q?3J6DSjW9T7loiIkpBn6SMqlKji3LzdfbwsWngmCdNEVN1HnRNFnIRSpF4rwb?=
 =?us-ascii?Q?5ITuDD4drSmbpOSYNPWbb6DxGOk82p+rR27xxcekwZu8qvXqiGOHrgr41GR1?=
 =?us-ascii?Q?mYaaNgPpSZpUelissfajELT4XeGMU8IDpLDkNkaRK6euFYDD1xAIexHSrPSL?=
 =?us-ascii?Q?h1y1/xWLX5QmxCyCLB10tDfx1MRRgebQbLA7AXN3jpTCDruqCYdLKwcomW10?=
 =?us-ascii?Q?nch17ORa4AmmwAxsQ03ePB77kzjvRX4QsORRRNglOixUkWT4FsRpRX7dpwAo?=
 =?us-ascii?Q?f3LvVDx5XZiiBzIZNrDJvUtCjlLHciKA+mzw+O4xT5G4HHBsunwvhhbP5TMo?=
 =?us-ascii?Q?EWQ/xkcOaP4lquM5BpSoz645cyRN9/sTmnJ9a/9CjN7mtkzL62mFtDtPWEcW?=
 =?us-ascii?Q?CdKzMeR7K53jfQLY788u907sQGzyf0ZwTbNspOidj0OQfOnsEO0vh9hXH9H+?=
 =?us-ascii?Q?moj0JT6d8RC0OWRkolmV2gPl85O9iIsVSsK5kj3LYbOKcQyoQFEFYFDIS6H5?=
 =?us-ascii?Q?nHuUs0D7Poo5ri4vBRbucJS0cFTO3FdKSIr1+TBVUTIcrjyWqimvuvAQY6Mf?=
 =?us-ascii?Q?QJ40ngAoMPy5WnNJctDJ06vEsZdLDqGciv/D8YormGiCPi76UhkYpZ8NzXqz?=
 =?us-ascii?Q?rRZG+JfEra56EIUJ+OxxlWZazUJMvZ3LCH72wAkcodnnDZCFFAZJxH2yB/If?=
 =?us-ascii?Q?n+eAmM9PdGKA/Mb9kw13Zi3ahL9abutZKKU3H8dKdqTG7/JuRuUvN9/NCStP?=
 =?us-ascii?Q?tUuvXBM2O3iD6smxW+UCGU1WRyMERT3G3kgLVcOOMykltVQ7JJPDkPNUkfWx?=
 =?us-ascii?Q?6wASXHVzbXqzN5+0rxNiG4aAjOF1PlijA4yhyiGwSgmeDCpIph8C5oIZXbm2?=
 =?us-ascii?Q?QMzkBuILFNGONIzuXr+pCpGFAECTR91WYb2uy9T6d1NHn0hVbIa5cpJaiP29?=
 =?us-ascii?Q?spo34cUr+KzhX8M3JTFvNPo1zQ1kXcvMcrRTF/IKl783SG9U8UJRGlu3TUii?=
 =?us-ascii?Q?1U9F8okVZ4w/56cdoiWabQ3vIIAE6R0Xbmt8uNkNzsWM9C1ZznEFsfL5iRrh?=
 =?us-ascii?Q?kpNELww5FkGUASoGq0zEYjRmj7cONPxZ0fE+xz62?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1a18a90-8108-4286-b032-08dd9373522b
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2025 05:42:46.5257
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 81uLxFUcPtBOcJaaJDnl5BWUWyzd/yi40ipXllrNY7h2zSU2inqXTKgniE5IfFog4JTD/9TZrDIhfVVRaqzC4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5872
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_224311_793834_61C4827E 
X-CRM114-Status: UNSURE (   9.58  )
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
> +
> +#define iommufd_vdevice_alloc(viommu, drv_struct, member)               =
       \
> +	({                                                                     =
\
> +		drv_struct *ret;                                               \
> +									       \
> +		static_assert(__same_type(struct iommufd_viommu,
> *viommu));    \
> +		static_assert(__same_type(struct iommufd_vdevice,              \
> +					  ((drv_struct *)NULL)->member));
> \
> +		static_assert(offsetof(drv_struct, member.obj) =3D=3D 0);          \
> +		ret =3D (drv_struct *)_iommufd_object_alloc(                     \
> +			viommu->ictx, sizeof(drv_struct),
> IOMMUFD_OBJ_VDEVICE);\
> +		if (!IS_ERR(ret)) {                                            \
> +			ret->member.viommu =3D viommu;                           \
> +			ret->member.ictx =3D viommu->ictx;                       \
> +		}                                                              \
> +		ret;                                                           \
> +	})

viommu->ictx is set in patch5, so logically this is better put
after that.

Reviewed-by: Kevin Tian <kevin.tian@intel.com>

