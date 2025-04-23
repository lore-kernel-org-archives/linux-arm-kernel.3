Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1F32C369D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 09:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YV6zcNbEec8zRnQPlmsSdtm1CKDG++I9I8+5oNSc/9U=; b=wHpiy0h/k+dMA+X/Dbr6ncOiV0
	8bBg3FSb/xEPk5xq468Y2XVHSurcKoDLCkx+hQ+Zn192ilaZp2zXUzkT2XPsFR8/FpLTzD/9TTONx
	2zCaHSyIDK98qfwL9Wkq++8sAbnb3rjPptjMKkPaB4Cipie1Hrb0qC0dghMHKwooT1N8L01ZLQUxf
	p6UAp1FXz17ocoy4iVozYsFQv6INKX7SgYWqMNm1DDVU5SLyBZN+eDvhUQc44f7cNVELklsJXGouW
	qt2X2ErqOr4TXHUuOxelNjvxJ3fU+/a4lGA+BePIsYOyHfstC0vFjf1zfWPMNpH+Q4hEsWbQgxeRs
	rPqjeHUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7W2S-00000009rrE-052R;
	Wed, 23 Apr 2025 09:05:04 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7V7t-00000009dLg-21xP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 08:06:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745395598; x=1776931598;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=z3aSMcKKqAJl7szWVPGA1g1XhvmsBOmbfrwpORh206I=;
  b=Wg754P04spDHbCpRJaCEKOdGeD/fndyB1BkMUZxOAhnpyKiQBsc/6vqJ
   prZ8jZXYTVsUCd1S9Cc+l6QQpYJeJQ2wkS4BsT+8AQUSI3VZxrbJx5iqc
   Wf0RC1ejQRjmlEp9jA88kLt2R0hnrwrFgfQ2v549RRbOhCHN1yCnBIXTI
   Cj7dg2MS2xHNH9mA2CEr8uY7cif4KrEjX3EEAzQOaJtsBSL+uoEE0tG0P
   PO1gAppCLnmIMA7aNddpEsl9rvvMaZK+XswaZ1Jr40h/FvlkAA3XBxk/n
   mPjB3zH6nJkjxRtPfBcwaaIuvT27JeogjUIoxy0eVv3T3dYF3d9zmnx9B
   g==;
X-CSE-ConnectionGUID: GvzhsKAzQkuGYmas48oCDA==
X-CSE-MsgGUID: OW60aSASQ/iWksDNniVumw==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="46679653"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="46679653"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 01:06:33 -0700
X-CSE-ConnectionGUID: aQrOiBF7SOarvKtYktMByw==
X-CSE-MsgGUID: qrGm4I9pSZyLujriMfUhKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="163210182"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 01:06:34 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 23 Apr 2025 01:06:32 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 23 Apr 2025 01:06:32 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 23 Apr 2025 01:06:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fzQLOcIXQ9QVw9oGakUMG3/jlT2oEdf4Sv5qqb70OOCZz7iymLcQZgeRnRKmqH5In2hzWUCMI2qoFQynekMhuukn//5lzi+IyDPbAZ2UwRnudYCKvfJOIzY/eZOTqpCKaArYHewOPF1Rz9yY6Nv5Q/qYIaQ909ynk7Sq7MfcsnR00u1koYXl1ORBPXDiop5B08Zg2nYUPVXRkhMCniHpW6sWzdtCb9obotv/BVw8Yqv/cm2zhzoHxbxBXOF8ad17nEzIc2FqViCMY4fMxqj56agLFDT763hHV0VbcnboACu4OXTJHLMlOU2Tr9+2D3sg8Jt9yYmjJTGRUBfhbNJKNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YV6zcNbEec8zRnQPlmsSdtm1CKDG++I9I8+5oNSc/9U=;
 b=Gx7B+j9bisMDGkgje0dMSXqYItddv6O0QpQGBm3qQpKfjRWjvw60H8xwN9wLARQPRsGqte4+RIgVZmk+GxzK3dCKxknQE2q82WXEpgFC/K2cZK375fRznNt7dJeehx0jvqfAKnrKy+zDW5gM/0roAm8XEw/Z85CEoTO20NTmn9R+HFasRCJm3dRi+kTUxT+jbRlEhKJih35kKe13yi7OGN/4w3edWMmChSxfLoRxNpXQZPc+jSeo0lsMgLPQZ7VC9eETk1EoQdIpr1S6iQttf0A0AheyUqxGNHu9VXw/zpT8yd2zMSmwsJSpwhEW4+nZmdmLNg+w5fB8+H1fvM366A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by PH0PR11MB5128.namprd11.prod.outlook.com (2603:10b6:510:39::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.22; Wed, 23 Apr
 2025 08:05:49 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1%6]) with mapi id 15.20.8678.021; Wed, 23 Apr 2025
 08:05:49 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Nicolin Chen <nicolinc@nvidia.com>
CC: "jgg@nvidia.com" <jgg@nvidia.com>, "corbet@lwn.net" <corbet@lwn.net>,
	"will@kernel.org" <will@kernel.org>, "robin.murphy@arm.com"
	<robin.murphy@arm.com>, "joro@8bytes.org" <joro@8bytes.org>,
	"thierry.reding@gmail.com" <thierry.reding@gmail.com>, "vdumpa@nvidia.com"
	<vdumpa@nvidia.com>, "jonathanh@nvidia.com" <jonathanh@nvidia.com>,
	"shuah@kernel.org" <shuah@kernel.org>, "praan@google.com" <praan@google.com>,
	"nathan@kernel.org" <nathan@kernel.org>, "peterz@infradead.org"
	<peterz@infradead.org>, "Liu, Yi L" <yi.l.liu@intel.com>,
	"jsnitsel@redhat.com" <jsnitsel@redhat.com>, "mshavit@google.com"
	<mshavit@google.com>, "zhangzekun11@huawei.com" <zhangzekun11@huawei.com>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-tegra@vger.kernel.org"
	<linux-tegra@vger.kernel.org>, "linux-kselftest@vger.kernel.org"
	<linux-kselftest@vger.kernel.org>, "patches@lists.linux.dev"
	<patches@lists.linux.dev>
Subject: RE: [PATCH v1 15/16] iommu/tegra241-cmdqv: Add user-space use support
Thread-Topic: [PATCH v1 15/16] iommu/tegra241-cmdqv: Add user-space use
 support
Thread-Index: AQHbqqxzvBTEpSMJPEeJw9EUJl83NLOt2BuwgAC1oICAAlwGwA==
Date: Wed, 23 Apr 2025 08:05:49 +0000
Message-ID: <BN9PR11MB5276220C7B2C5743DC8364CB8CBA2@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <cover.1744353300.git.nicolinc@nvidia.com>
 <30c7aff68c35040ee637629cb9fc2b6e7f83f76c.1744353300.git.nicolinc@nvidia.com>
 <BN9PR11MB52768197516FB895146A12078CB82@BN9PR11MB5276.namprd11.prod.outlook.com>
 <aAaY+f2/jw9NaIWF@Asurada-Nvidia>
In-Reply-To: <aAaY+f2/jw9NaIWF@Asurada-Nvidia>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|PH0PR11MB5128:EE_
x-ms-office365-filtering-correlation-id: d26817ca-6232-4134-610c-08dd823da8ee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?/rjP9rAa5Dv6KLBWTlXCSeRawA3YTbYByRXaA65HehA0hAsQOoG5WPk8kWcC?=
 =?us-ascii?Q?NFRZvV+O28fntg+BntBEk1s17qnVCx/jSVWdjwUO8QO9V3Ah37Li27quQlC8?=
 =?us-ascii?Q?KBfsUf1f5E2fsawCmED/1GELM8OESWEgk9bpkK2kTyCS3u6wyUwdbTb1vHyo?=
 =?us-ascii?Q?bM+sQR1agz009ADHnNJIlp+S/D6nWLlFxmldkCx1GrwCgnlXDa+CTfB/VS2l?=
 =?us-ascii?Q?WhYCmhAD7BKTtN/NYion0nWzKNeQkwETJe+jqxha93/c7GSX6VYuAizLmMFB?=
 =?us-ascii?Q?YCpeOr9w0G6whziriN2wRJzqEGTBmTmGvU6NLc7lsAGGyH9B2r6uNFsi74dl?=
 =?us-ascii?Q?ljH7e02PqDZPqXvUryj4QrgxnrppuRmCaqUw0DHAI1Pz7UGiLFVyJcv5/VeH?=
 =?us-ascii?Q?iLqZcZbtacLB9IOiLxUVzu7RwTgKlfcSyyeim5NCwNydyFZlxAtOPeOoAFSK?=
 =?us-ascii?Q?HxlO2ZvCpm/KfmTwcNf+dlajUQf9MXv0BNy3W3zciG1bQQrjAEf/SrWfQPXX?=
 =?us-ascii?Q?KhkdRmtyf/n7CZXkmN42hbIcLBs6Jl1dH/thBCxmsd60aFvGvu+MsWQLgoRf?=
 =?us-ascii?Q?dr553/OyE7dZnuBI508W1hbHDWoZ7Ff0IUibY/qqTrqqQr6Bk2CmzOrZ0V/9?=
 =?us-ascii?Q?3gI3TkD2dNydMHIas5udzIHICIwCWCjoRhxyMD2KmWKkef8xw2JdsHaGwLuD?=
 =?us-ascii?Q?uL+8X3puWt2KH9+6pS/j6aOK/hdX3MTvn29jGtZH+/yQSXRKlqLyUsT4GekM?=
 =?us-ascii?Q?D9qrB/xlosPNJXChl+aH95zDMLS2AN1WAShKtwRq11JkpMy6zBM9tbdMJQ5o?=
 =?us-ascii?Q?jZeTHeccs6ZaD3cCF2l8AiBwic4XwEDLKrGWkJnDKfybNtZRf6X+h2dfGBrI?=
 =?us-ascii?Q?6l8m4tYjI5FGP/wzqF9UtKcouomCAbNfn5+rJIfzNas0/XWybOi4i2wU1nzD?=
 =?us-ascii?Q?uhneqwGWwbRW+jcip3hjRL8l2aP/aPeb9ZIpuXyZ4fpWRA77rQ0g6CJR04WN?=
 =?us-ascii?Q?vdrUb6lGFiZwvS0vLF2hPjsQ2EXQsdwMmI65TWTGV9SkBqkN518Hp4iICpI4?=
 =?us-ascii?Q?aPE4vzta81defun4ZprXXNDbJ9Q1RXgCpZyJAbx2KAONKK1tcj+MSMZU4gDI?=
 =?us-ascii?Q?3J3k4JX12idMkW/jhWYnztK5CYEqpnBSoPsPGPa8xAkZ7QR797Ke0IXMwHhX?=
 =?us-ascii?Q?oK4oy5SfkLxyW5wMbc4hARCgNYdb1+tEJJvC2Om/s+B37O7TTzPrh+9PKSkQ?=
 =?us-ascii?Q?/3T1pyQBbMTh6lVFeLXFdDiEn5vAM6etFmGI7lb1diBEzXjizUeKJj9K3JBT?=
 =?us-ascii?Q?MjmJXIKjPu5TXJTXu1CSKav/dll3+xmVayY/w35zd9shYWcHiCnEIwMpx3Wg?=
 =?us-ascii?Q?iKrskLydatuRsOiMFBYulSUDVpXWmeqqheWokmIEF/kT0kABR9kS0/s3Q7Db?=
 =?us-ascii?Q?wFyomMpvI/hHlCpzasFnr4+xxvuRYJzN7Dxf5Hn8V4jyyU3ASkUvMw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?uZcTVY+D2YwG2YD0YSsxmK0r3SMVJxIUTxYU43kDtSqFgsBYWBu60axvfh1o?=
 =?us-ascii?Q?RqGE3aj9KbM0n8PpeHVq38OZG3WuuPG7zbTsvbKILeg9pcAQFfLliU0wMtZ8?=
 =?us-ascii?Q?XsBGEBcTZnAdNtA19PrxgEjCFx8sxKdeqXkglKdjMMafNLFy3gNWRXEZpH8m?=
 =?us-ascii?Q?1G2aMswQJ86XowAneduYu8c7pgrFOlCsBCRi/crsBKSi/uMPkyEtP3pl3bJD?=
 =?us-ascii?Q?kCTdVRbNvs1+jrx+VhLyur7b/Vt9m4mGhU/C6uwcrSDLulMGTYqOqZFID72D?=
 =?us-ascii?Q?hS0z7/hHfrRDeuJ0Y45QvSqEQfAdFWRN4jSd7uUljahw5mL08IjeZJ+6inl9?=
 =?us-ascii?Q?R5keWBx11yQhrkUpmAIZ5cMlEwVop5DkjiryW2SH3fUNmyzkdS38/3FdD/wZ?=
 =?us-ascii?Q?vOj83Dubq8JfkUXPm0R6TApWiugRqV0ZE1eehbfbf950DhHeXdG4UNZTUfqR?=
 =?us-ascii?Q?V8/ffI5T/APb4EemXX4cLWsxIWdfYC+9AjVfvprSOUfNXeRHtN/K/c6q0lk3?=
 =?us-ascii?Q?XK2QwcGj/wYMFyIr+3m8Ms3Y3gKRLsc5a6UVY/iGevFNGT+p8VdV3JV2cBtY?=
 =?us-ascii?Q?zMykwwnOQ8v1wH3aV5Dh7lXRYkv/vkjD0SLI3KI/DcL6abqV2lgmeymraQBd?=
 =?us-ascii?Q?nwcE8Sz5hKc5/5a89H56dbNiPkZjyYsDA1TO/kg+fRt3vR+GPiHEtilTH5CQ?=
 =?us-ascii?Q?H+id/nPQIHG4+LvF23rBJsLTJc0w2CdvsxeVuhh8j1WZs9IBqR5Zy9ZzduL8?=
 =?us-ascii?Q?doGLqY/PtdqvL0MK9oyDoup0bF1h4HuFQGJBMdlX0I2UHHxT3Xjrazhob9Km?=
 =?us-ascii?Q?zEDtNzOuEv5sNh674CTnT2Xus6QqGYz8BWh+4YYLvPTb09spQGveY7WROFZ5?=
 =?us-ascii?Q?8MpUc6EBngdzdof+OBxk7dDdL/VLrigWyZVsLRvnUA3pQl96brvIkoSYXOwb?=
 =?us-ascii?Q?DHOLV+97dtNOTwztNfEr7LEoGb8PtM6nAQlzMTFnbtOUGnUlf77L8BexrEOQ?=
 =?us-ascii?Q?mDIxgGPbLyPgpZ4I4RaLxDK6+lJdfj0HrsqrS/EPQTsKGIzRz5p2spBTaFYF?=
 =?us-ascii?Q?bzq8ywYwrbLYfCOzmPxqh5zI2jUpsvGVq/NHf+rEFpqHoncXhFSovu2P7nly?=
 =?us-ascii?Q?ecG/1aC345IvP6gXcdTUZKRg8faMuUJ9S7cPn1vLOorkEDhuNnO9cH2DegDu?=
 =?us-ascii?Q?tuDNQ/M6ABMnj1IgcmiVX88iK35ISo/Myh4h0ZtAvQAPcxWZlB/+pe3R3MTM?=
 =?us-ascii?Q?OAZC+HQPnjQmbPw5yNR4rP7GV6nafkcX2QYuCL11gkXByu1Kjf9GflHi9UdG?=
 =?us-ascii?Q?mTLgEJ/WXBwjoXY8jR3tKTOvQSSvGBgJ8x8mXCa2TLHx0bfg0ZdQS6wFK/n+?=
 =?us-ascii?Q?xArnAeb7Cr6KNYumBZSX1QOMpVRe47ykCE691jWPJ7SoEKg/gLuWBU8Trydd?=
 =?us-ascii?Q?GJxolR5ob5ap1hxTV+/CHEJqzHMULm2xJMmihLvXVm2OwXgfZ+y9pjSGINTs?=
 =?us-ascii?Q?nBiBBRZTJqgiuHz+DaBmOA/k9fXuJ4XRuRwlZM71V1CbsOYPhigWEwrcNegt?=
 =?us-ascii?Q?8HOYsQbuyvUTwUzAR9+oYi5wsLMPgXFBiMGN6itU?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d26817ca-6232-4134-610c-08dd823da8ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2025 08:05:49.4907
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AKU78WyiN7q0p6XN4lartFPtX41TJQ2jAgdeq6I3zhZosiLsvZfNpqcwFgREP9qVQtqh+a+XjqVwbsiP6/P6Gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5128
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_010637_569087_A617E423 
X-CRM114-Status: GOOD (  19.24  )
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
> Sent: Tuesday, April 22, 2025 3:14 AM
> On Mon, Apr 21, 2025 at 08:37:40AM +0000, Tian, Kevin wrote:
> > > From: Nicolin Chen <nicolinc@nvidia.com>
> > > Sent: Friday, April 11, 2025 2:38 PM
> > >
> > > +
> > > +	vcmdq =3D iommufd_vcmdq_alloc(viommu, struct tegra241_vcmdq,
> > > core);
> > > +	if (!vcmdq)
> > > +		return ERR_PTR(-ENOMEM);
> > > +
> > > +	ret =3D tegra241_vintf_init_lvcmdq(vintf, arg.vcmdq_id, vcmdq);
> > > +	if (ret)
> > > +		goto free_vcmdq;
> > > +	dev_dbg(cmdqv->dev, "%sallocated\n",
> > > +		lvcmdq_error_header(vcmdq, header, 64));
> > > +
> > > +	vcmdq->cmdq.q.q_base =3D q_base & VCMDQ_ADDR;
> > > +	vcmdq->cmdq.q.q_base |=3D arg.vcmdq_log2size;
> >
> > could the queue size be multiple pages? there is no guarantee
> > that the HPA of guest queue would be contiguous :/
>=20
> It certainly can. VMM must make sure the guest PA are contiguous
> by using huge pages to back the guest RAM space. Kernel has no
> control of this but only has to trust the VMM.
>=20
> I'm adding a note here:
> 	/* User space ensures that the queue memory is physically
> contiguous */
>=20
> And likely something similar in the uAPI header too.
>=20

It's not a good idea having the kernel trust the VMM. Also I'm not
sure the contiguity is guaranteed all the time with huge page
(e.g. if just using THP).

@Jason?

btw does smmu only read the cmdq or also update some fields
in the queue? If the latter, then it also brings a security hole=20
as a malicious  VMM could violate the contiguity requirement
to instruct the smmu to touch pages which don't belong to=20
it...

