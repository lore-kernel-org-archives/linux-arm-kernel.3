Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84AA9C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 08:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d5qs9SKZLoEq1JZ57sAK811EuzRB6kSqNGo6QB64neI=; b=qSJ6vG5lW4Z9l1Q4MON24eM86M
	76Eu+AUUcX2GAky/nFnCyBa8j7o53P+uLKngPlXZMPCuy+FTRv+VObLgTl/wcEr6b3d2ZdFb0eRF/
	3Dxz2x06mjfOEzb7iLnqhbsAx9TY2CDv2JhuumlBH/UECklNv6upWIiG7Y/UL4yFCiO/C0W3eCvnX
	4jsGs9l5PhH4i+6HwV9mPxXvpFHPkhfkImXHpvxi+0cin0GElFTmokJWbJQg6OlZKf+vNrhs0Sr5/
	gLnJXoXqA94BPcJeAwdp3dKzV7uCVwYFaFrHrdeIDTsn5PfSTC0nVHBFDN9ITigC4Y5tdlpXKac+7
	ayc7Y0qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7rsu-0000000DJhG-25Dg;
	Thu, 24 Apr 2025 08:24:40 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7rqK-0000000DJQb-1uBz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 08:22:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745482920; x=1777018920;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=d5qs9SKZLoEq1JZ57sAK811EuzRB6kSqNGo6QB64neI=;
  b=SSHH1G+fnh4A/yjcl1ZOC87RjEFzpOCZT1JxoimeTl4o97SLwaDdpOf3
   LIs2qw3sQp1PeqJ+8uP765V/rBvl1iL5SjpY5XD+H2YeKHkNja+DyfL//
   om0Xpcj3kbmNVlAHhe10UbvIhWv9qMmNgYD7Qug0Z93Y0O8pYM9LvDVaG
   m/49c6Mhq+HxdcrdDvi2QBQTCB1tld8KMK+vq4jM8U8g6VQ7DCcIxQm+Z
   FGD5h8gZ2/7i6Lc6RWnKb/t+DsD/gyBAAJIIkFnDEsVky60YoWgUy+ZF8
   cJfVjlhzaU1zbRjnwVvkj4u6aBxyQ0rxS3iD8oLVnhJzHQjQVUZhLe6Wn
   g==;
X-CSE-ConnectionGUID: EgMlZcS2Tme7CV6OZfWxyw==
X-CSE-MsgGUID: hbypM/CLS5OZlhWTUis30Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="46334265"
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; 
   d="scan'208";a="46334265"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 01:21:59 -0700
X-CSE-ConnectionGUID: PwTLXDpDQTifkg6MSNLN+w==
X-CSE-MsgGUID: wcnsX9xhR8GbNnw1aCNSLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; 
   d="scan'208";a="132526945"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 01:21:58 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 24 Apr 2025 01:21:58 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 24 Apr 2025 01:21:58 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 24 Apr 2025 01:21:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R50/i8qsf/Sao8eQRfl3gEPhlZfWkT28hUnS2rXNYm3sPQfq/3huzyB35UmfAPzgiZqKy+qYlQ4xV1QvK66chdyVTi3LTjk+/jWarFb3pjRvm/0le6WHSTjInS6S0c0GAyq/dL74Z1uzfWmFZxWLeF/LFA4XyN7eMc3P+nZjabhhLObwmLmJNbWGDr9eJo3qXMzsK9f7uAscmQ34/HODUbeGvOQytL+nUowx/NjVG2bs2dr/wpK2nPy99w3I2SrKvUhRR8wQUHCiUXUwab0ENRP5tIJL18vzn2T4gQGBpMcEEGUhVJTiTtbT46a3AOucvIz8FXWv9+vOIXqXnzp1iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d5qs9SKZLoEq1JZ57sAK811EuzRB6kSqNGo6QB64neI=;
 b=E5mqL3KmX110OQi01NrQNxVzth4sFLQdzeDUpCsR7X7bF/5d4XZAqgzr4eMN9BOREv/E/XR27YWB10Adu2rzu9Y28AuaWIQd6WAMW4/TUyfHYwt8z5ORi1/cMaIYP7NO4XjaozCASRRqE2pR1i+5RFpyZFCiMCBK3qCzkk9dlhN6Z6BYr9M3i7lTSS9+H76lLg6oDcv+zcjBHMNE+1IFtM4FDSDI5ryhmctyAvs07Fa9GZMQamDfs4cYw9h2YXwsX1hyoDsv9nPHnetlPvWQOxcgr+nkXEI9i6SYaj/7HSB3TDz2vS18PvQf3WGplIksu5aVXDaevuwA8alk3uIW7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by MN0PR11MB6109.namprd11.prod.outlook.com (2603:10b6:208:3cf::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Thu, 24 Apr
 2025 08:21:08 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1%6]) with mapi id 15.20.8678.021; Thu, 24 Apr 2025
 08:21:08 +0000
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
Subject: RE: [PATCH v1 00/16] iommufd: Add vIOMMU infrastructure (Part-4
 vCMDQ)
Thread-Topic: [PATCH v1 00/16] iommufd: Add vIOMMU infrastructure (Part-4
 vCMDQ)
Thread-Index: AQHbqqxdsJmQH6O5h0yGESWTIdpR6LOyjaKw
Date: Thu, 24 Apr 2025 08:21:08 +0000
Message-ID: <BN9PR11MB52761DAB62D3A4D3F6B53F698C852@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <cover.1744353300.git.nicolinc@nvidia.com>
In-Reply-To: <cover.1744353300.git.nicolinc@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|MN0PR11MB6109:EE_
x-ms-office365-filtering-correlation-id: 46965d15-ec5b-4b93-db57-08dd8308f6e8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?Xzo0f6+yVEdOBfVkxZTtaadyMoml74/QimbuvZc/Pl7u7lMSTzY6gUsjEv32?=
 =?us-ascii?Q?xdjKPttKdJXiCLmp+zgAcH2EW5vWsgYep/j9WImB/L9GGYeS0mM/FhYGm4Mh?=
 =?us-ascii?Q?xZKyMM4NFk551oNbPQLDSgbIOsCrgOrX7w/4iWatZupwUq7djJsVkmRkFPwE?=
 =?us-ascii?Q?eVswKu2FTf5kzkbSyDaX0rpLsJlnS66/VOVGxaU4PBcjfaKZU0r68LkLP3gy?=
 =?us-ascii?Q?QmaiLqaMrFL0l5u4NPWX5J8B8OHLeaseQmjq4B0DW/ZwXTxFKITls2UNltcQ?=
 =?us-ascii?Q?KO0jAdeT9733BfNq50F7viy5YlrB1CdHblRGSahs7EdWz92t5hqOIqPYOQ5e?=
 =?us-ascii?Q?o3JanUPQMm2OMAT6gb6oRlskBdgnjiZ09NIU0PtOXYfIOYDC59stU/GnrPXT?=
 =?us-ascii?Q?xWsWPtWWogiUfjzuiGUeyyLYTxnUCTAXoxesSzvE4HQXPQejZb92UMVkqw9u?=
 =?us-ascii?Q?m3nZzmtsLRI90ouDCnHSCiRQnlPGx0hzPwB0BMo/yiQ3Cvz0rWJvJYd3XVGS?=
 =?us-ascii?Q?T3WW7QWlgmVM+chu7ZladC8CnxLm3RHqzcXz8IpdCIr87VoVuP5wuwzNP/xY?=
 =?us-ascii?Q?jwPmcOUqh+hAG/HtReJ7Nf5yvxM+9klpgSutYDT6TnRFlLYj0Ilb31WyddH+?=
 =?us-ascii?Q?vIrhQ8JUKSlA4hdLkg7u3K1u4pr3aHObs7LCAWaSIzIR8SwgYj4qnhkIa9UA?=
 =?us-ascii?Q?arXqLz3DfrWy7k2HDlhgx76in8giXYQRXRj0aKW/Ti52xpnTDsjg1YQONhql?=
 =?us-ascii?Q?i8WJP1pxk8U0zr9QehjGI12xHRV7BWM9P7GluyOBQ7wDoZbarAwjrKu9VKMn?=
 =?us-ascii?Q?gqD122C88ZextUV0u3ye8r18GhOCCpfU2o4EYszgccJItyTExyTRKCDQYZV/?=
 =?us-ascii?Q?EFAeSn44d4qKSxS84tiqDDMEmwPRkO9UvtWMxuth0CPoevSXc4pvCRP9TSX1?=
 =?us-ascii?Q?rnXDMwovafSf14dEa6jVxgsRqY/ojQAZvqhkfO/6qO6MKrsBY1P5L3YT1NUV?=
 =?us-ascii?Q?NfDcSvIczF6wR/Wssk9w9xGVvJxSD0pn7LMaBxPchPsnXwSfoti5NrGWp3uq?=
 =?us-ascii?Q?kDqcMAPGQmJad2epC8SWSx9VDWmvHOJHGrF/QlOAdo3ShZcwiuFHtWpE7JSL?=
 =?us-ascii?Q?7R2vpIFOjAclZFfQhh5c9mBGZBVedbt2k8hVj3dGIn4cXUxsIeFlGGQoeeRC?=
 =?us-ascii?Q?Wgk3CXszbqwYCYHn+KaFEe//BJjcv0HevFD+Wez+w5n9uGqiWCJRJoFYnNB2?=
 =?us-ascii?Q?txJiaCOlITSO1N/NQuZ1X5BgIfTgJgyDONDKHqwTYG4RKU6WPYdwbqnZpjlc?=
 =?us-ascii?Q?PZQAaF87sRMlMQVv4LLi3WWVHP/R22wvIR9X1AC+Osls8wQq/aJbLFflSW6W?=
 =?us-ascii?Q?i+By6HHHBLLwp+fgLZ2vLOYC0c3BaUVuePbXjpBs7T3qHWLylMneLkkJFIcU?=
 =?us-ascii?Q?xF2dT0HgSUf8HyQSg09hJQa8dPe5Q5RaFKgKO0XqBWKDClR/17rYIscu0vYe?=
 =?us-ascii?Q?33Ihpp/hiTad5pE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?kzmQmWBsEVliD3AuDe5WLX+raAJh28SYCysgW04w/3VXg206hfO6LEEb4bY+?=
 =?us-ascii?Q?K01of2svX005fmr5Kb8Our3G9QJLOo8pe8Rn1Lfxj11EuO0b3DsbIBL1e/mj?=
 =?us-ascii?Q?Zjaxna5BKr7XFgDKLOaYsy7lfTSff9qirNDDnSrUwLWiVtd70okTKXv4qT3f?=
 =?us-ascii?Q?pp2An1zJX1XblJLe3XWv49+AWSyOf8Q9q6lDKocl8s1lqCsAHrngSbZSWRRG?=
 =?us-ascii?Q?sGJ2XqIiOMTbkclPFsk5JChYRhmOYkih7BlZ9+sr7mV86McFqhvqyhh1Rsux?=
 =?us-ascii?Q?axwgH24Ckkq6dCB/hZRP56LVNVVe5oYXWhJgSNdo7918dMgMDovI/n8CzTvg?=
 =?us-ascii?Q?fvb6lLyf8l8NCtO438gixzq4+2jMQYGpOIAfaDAhTaHF1iZxBEu6hh8qF9H+?=
 =?us-ascii?Q?kvdRisuln7TB9ltTmgjQ+KmWWHGlV+TA6oPzg0+snRNu/27icORMtOIzP718?=
 =?us-ascii?Q?Dkj/sF2Vk24l+vM0IMcv2qULOJ6mmcROjohgOSjF+8zQd0ync1anfJPB2YJF?=
 =?us-ascii?Q?jQ+BFJW7wL007Yn8SUSkAdUYuV73XqBIyclEabCI6PmyFcCguodxkDqxUUKK?=
 =?us-ascii?Q?IS7z0PTJTsALM9GHaIWG2IYajb8XpFLWRxGURjt6EowQnAaQHRQd771Nozo7?=
 =?us-ascii?Q?hHZXWmTTa2g5/H3+CVWT0Zd7XpaGl4thKoxcBiQPPpiDuO3+Tt4c/9aF/d4U?=
 =?us-ascii?Q?vixbdIMc8hR74UfMLQXUHrhC9nG/Sb7ijBKMfyxmGQ89Li6sev+qih57+vRe?=
 =?us-ascii?Q?9IFxM1ferYsOIJhoYyvdEpmhQ+bvRGuoFwQ+ixZseVgXFxwt5S9jeZJNPQ/z?=
 =?us-ascii?Q?WQltcp1H8D4ey47sZHRbC9ERndQc9wmN3UGQW1xbTZsNTkRWvOImon+73ZJh?=
 =?us-ascii?Q?G2EZr68uMdlZUgUvpXiE3E8ArAf+0Vhgih0zm9DlQzc42kCOS4Q8wJp/HTc5?=
 =?us-ascii?Q?8kEWJCLBYaHmf6OUVYIucaP21Z+7mppTS5lquVi+vx9Mt7eRde0fQ9piKBJq?=
 =?us-ascii?Q?rZJiilGkIj9IBa+iJyrpigaRiWEiqPa3s6ZmlMyiHf0s4G3YNU00TZg3CZA5?=
 =?us-ascii?Q?CyH+EfZjflxTIfPDWKbpR/EDyYmyG4KDzc9sYj38FZ3GVkyt016cUSnjCBja?=
 =?us-ascii?Q?A/gjfsmpoqhd2cerdMnmLuYutZFmwwcr2ph0nTAnzkguJ5EwSvypYKU4sRSZ?=
 =?us-ascii?Q?WrhMef3LaUBBe/F+6YVvspDEksdYfKtEJwslrrN1wZ370feHVkGRucxw11mn?=
 =?us-ascii?Q?HEHhnwYBaz0i5CBv/yD+IaI0OEWlyCUkGRxn1tljARutJOE4xyGIaBaiM4a7?=
 =?us-ascii?Q?60zMRoxgKBt9dCe6Lr+nn5F+Nq7JNzn1C7L8VqWfvFJnV8O03Co94aE8xoda?=
 =?us-ascii?Q?6geE+Z72ZS2Ny9KNmMP+jzpH3hzs+6r/2YSrXryEe0ts/I6WNSBdCq+WMH1C?=
 =?us-ascii?Q?lLqZhEUgnYIVPtaPnJiICX2Qp5FtDgbtYjRMLXI9uU8PQ5iWdSOvxV5/2P3t?=
 =?us-ascii?Q?WyDtIb5R+FGDI6aXnATMnWLFCfymqe7Rmu2aZGQqB4LNu+QLxgz3eUEHUv9H?=
 =?us-ascii?Q?Mcs2qOVvq0mgLPHPbCR7a7qwwXYh1cmuWjBONxeX?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46965d15-ec5b-4b93-db57-08dd8308f6e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2025 08:21:08.1614
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vZshWecIdnDY7RTjXZZmZbuTtylAm3ENX3VJ8pULB9xFiYR52tApS0gytI7CVnleXlcqR2RC3T2UeTl9XDqJNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6109
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_012200_541671_B23097DF 
X-CRM114-Status: UNSURE (   9.61  )
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
[...]
> This is a big
> improvement since there is no VM Exit during an invalidation, compared to
> the traditional invalidation pathway by trapping a guest-own invalidation
> queue and forwarding those commands/requests to the host kernel that will
> eventually fill a HW-owned queue to execute those commands.
>=20

any data to show how big the improvements could be in major
IOMMU usages (kernel dma, user dma and sva)?

