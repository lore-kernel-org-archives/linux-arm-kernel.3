Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67874C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 08:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RcBHEkJ6RwqIxkvsXcpx26XQYdY37hi8aDkRI+2Yloc=; b=LQfRP2OTiMkTvDg1V9No/d9RJ7
	cx2iigzRzeYHF8bXM65iu1vdot6wyskdl3w/KFi3f8d9RUkIOUcLBhs3/Jnd5/kvb+5XH5jrN3aeS
	/WD1Y4Nd0oz51Wdmtc90S+hhg/4D/F0rgSK+w3sqQ2LW4dGDtk9MgvGAdWsYSEIGMTsyIR9mx+Tuq
	i2Vb+GyjcOpVtr3tClxjwyY+tCFO/aaADx3MQtpX3BxTIBFOppu3bXPu3XyNk7bhJa5HZZixe7sw1
	uwJ3ISf3OwR+kWNy29wKMsNc0e/s1LvOq5vwOlEMi24IvM61gto3waG8jHLa9JWNwTJY4z+gr1O7C
	MA5G+nwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFTw8-0000000HWr5-162m;
	Thu, 15 May 2025 08:27:28 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFTq8-0000000HUtc-2qFk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 08:21:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747297277; x=1778833277;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=RcBHEkJ6RwqIxkvsXcpx26XQYdY37hi8aDkRI+2Yloc=;
  b=WztHFUA1KHeUJFd49VSLGkMGNkzFomAsL8cAPDVLBmYveu8F86qKAu1Z
   Vuk8/BNoXJfEF9TEWJXUx+OIbnZ1uwzG8BQzjHt4lg3YhkBFKW58Fdbeo
   ElxY4dAW2nInQL3tnA4ySlZe/wsw82DZrdYy/nX/j5IF4TAqciJwPO5/k
   HYF1SVB0iKZI5f5U01fJMEZV3PfceCn4XaRCHSWE3Jjp0962BVMDSzdBx
   5k0kcgQHX8bLb2BhrTnkeoU9aP1gNrD/BGEQ+t5dOyubAj5jnzkqZc1An
   iT+R5mTdk4xj5aIspQGDKFm0TDcd4cE/rOcjgWqPs+GDzVOw/DFjwAL9y
   A==;
X-CSE-ConnectionGUID: 7rxWLhVGQmWXA4eahWxTWw==
X-CSE-MsgGUID: /q06pksyRF28wm0GQPq2Mg==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="66626181"
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; 
   d="scan'208";a="66626181"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 01:21:15 -0700
X-CSE-ConnectionGUID: +dgdTsJYSxK6we44YABzww==
X-CSE-MsgGUID: 0HTt7quJTHGprLRPFh7lWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; 
   d="scan'208";a="138832476"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 01:21:15 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 15 May 2025 01:21:13 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 15 May 2025 01:21:13 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 15 May 2025 01:21:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t57WwcOComfPNQnEqLAGVw2gvJYDldsD6kmNahaPHg0AaXM09C7748aG/l0GEYrHGzh5Agpa5rD5ed4YGzxJrlvQ3o+lNFNUi4YL4Zlul7b3ZvxhF6Pqlc+VLH4lcx8FKvh5Fd7lKW0U2XV0tAW9sT8OQaoartkZhz6iK+o6gSdt0tDdKY/mfjYU59u0STv1lkDPHvNtoTiuBXv8SSgB9R6lVE7tKammbLdDUydIlLS0jO025XjBrdWr205+M4X8aAQJEFirmtXctWlF0jT/j+hfS92puK/gvDxRntS1cAbqD3dcjows/B9JvclhgfvsmMFKUWqiceSTYZa6YfB7FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RcBHEkJ6RwqIxkvsXcpx26XQYdY37hi8aDkRI+2Yloc=;
 b=hBGWR3I6T72lwW8q28GHQ08Jkbbr/LaglNoqHXtDUA09wLhXE3we42TM/qnycXwQl1+UpnI8JccRzp80IZGDFnhw4UtTsefcV9x94rVxdnfca+1pW0tuaPLVRbeSO1nKxLXGgRVug7yKtQy0Lj7i1kvE7TmJIYyCAJvcrW/kHFE9f0P8ym6lWd75Kt+rmZQ1WXciu8iQVte0bYJjJ5c2AnTINcdstwzRZzG//m0ALybyJcBk5Gb1TbAG28j3Kf8BlA9rfMIFvQVh/rAZTC1E0o6pY7RTpvJdQT5ABmj7S/GdS8RQ1CpxwFH+zCEHqnkJ1si4mhoI06SufEq4F1EzrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by SN7PR11MB7706.namprd11.prod.outlook.com (2603:10b6:806:32c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Thu, 15 May
 2025 08:20:45 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1%4]) with mapi id 15.20.8722.031; Thu, 15 May 2025
 08:20:44 +0000
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
Subject: RE: [PATCH v4 21/23] iommu/tegra241-cmdqv: Do not statically map
 LVCMDQs
Thread-Topic: [PATCH v4 21/23] iommu/tegra241-cmdqv: Do not statically map
 LVCMDQs
Thread-Index: AQHbwI8Y4VeinSgz4ESE5mK6ZV7qObPTX8GQ
Date: Thu, 15 May 2025 08:20:44 +0000
Message-ID: <BN9PR11MB5276FF1D733E5F086C6A26968C90A@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <cover.1746757630.git.nicolinc@nvidia.com>
 <80d41b740635b40dd0f9ed4279dc1cdeb3c8942c.1746757630.git.nicolinc@nvidia.com>
In-Reply-To: <80d41b740635b40dd0f9ed4279dc1cdeb3c8942c.1746757630.git.nicolinc@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|SN7PR11MB7706:EE_
x-ms-office365-filtering-correlation-id: fb4d382b-57e0-41b0-fba7-08dd938963ab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?Cx2p+2qzmrgdet7ifXsdJVdn4X4faeKPjXWLS6toS6gBqwqR5LT4ezqJ+YEX?=
 =?us-ascii?Q?dOoGxgIK2AGXUo+RmLY+XKvf0qDzqkaxLxP66fPPXo5BcUrZzGuutcmOE/sM?=
 =?us-ascii?Q?OhSgMbT2JSVUKdx2CQWfNYa3WqOVAZViyzTMl5TNk4Mr4sqVbKgsTep4Rnjr?=
 =?us-ascii?Q?aTJqwRXFcuLZllR/0xf/GmqL2s9EHTetm4fUvwkwcKCbNa2KQlsMSJUpw+16?=
 =?us-ascii?Q?GZi2NE3fdUSGItFesA+Oo8yfn2/8j32ZXGSTZPTK9BNPNFFeQgKxKRqXwnap?=
 =?us-ascii?Q?Q93dKP5B+MugGMHU3W2DfVxh7D0NhuQ1yykYcyNBCFM+NjCaUPe6VHjx0ryl?=
 =?us-ascii?Q?WaykaYwREavXyL011xLlqYQFBaHIS3Pe44z80vMdW4tyKBg3tqYaxYVx5WEM?=
 =?us-ascii?Q?gggByVKNYy+OdXi4Dn2+KcP1HREvYfjEjG3kfTQOAalCKHdR5aZr9+6oHZph?=
 =?us-ascii?Q?iA8413H0wev/J9xGtGngxXRD6fAneuC+GHuLnY7iar8Nf293rYZc6k5d6fDv?=
 =?us-ascii?Q?Nbj6aWahZZsH1mXxQDOh/A5r6PkfnyuYbbzH9s7+knqVHLwPRxTQoovUD3l/?=
 =?us-ascii?Q?IyAcvCxxsyxUiIbwBF0AY3XydLhlpxsrCp+i+MiYkTw8LZMkTj88S+HasEEN?=
 =?us-ascii?Q?tHSy7y4YlVHFA2mV3BwL+gq97cU86bcCi6okvBzjOvJ/JwHsXT8SwRCcKmAj?=
 =?us-ascii?Q?WO2AKX+0tapG7NLmG+QE06fWYVsyhJEDAg0t2IOLHYFuewKCmZCNc/Bwecif?=
 =?us-ascii?Q?tslLkeZWht/A5vK8IL2s/hv9YyK+65gyY/5DAWWa6AE6qyRhSS0cix5p+KPr?=
 =?us-ascii?Q?8pqfeB4LSRWl7g43m3nJx6bkGMCYEbmQotZ/NcyDP6dE5Ma7T9qG3b1yPZXl?=
 =?us-ascii?Q?nYohSguxLDfSfyI2edE2VvpaCHfrGhsOdC+oVUW+eCFCiOJiXPP22/20DYbM?=
 =?us-ascii?Q?fTZZW1wUhynceMEDSCeQINGjqJVhK8qbF/kMSjyNOraXAcBsFfMMGwil0rtW?=
 =?us-ascii?Q?ERD5wRtbkZKKvjnV9aMY0a8g0maqC6adDTNiSB8XIMIniRtHA5cdsVOlCL/A?=
 =?us-ascii?Q?wOBPVGzC5gpFq6TNCk5Kx2ZUCjLkQU01mrphNSAclCncKc+Rab0NlWKpa3uT?=
 =?us-ascii?Q?Eh7WH5PT20thPgkce1fUXKccv3BjSkHaJQFeD2KIgM59810zKMXLUFWER0wT?=
 =?us-ascii?Q?GD0UxKB+7EsibV8DQngSBxHFRKnssGcIFISdSp07INl8O1vnDT7/D8r0Qr5b?=
 =?us-ascii?Q?Pl+C/8/Jv7NJES4wGWI9el3wy9Gfx1AiQsoiBarznUHEAFfxSjWNa4RODZhI?=
 =?us-ascii?Q?MtaL7TBNtTf/jSKU5sEXMLUWDsmJDB5B3AIv9h42KcfqOy1pADuRD2gHBgcO?=
 =?us-ascii?Q?QKvnxYOiKSCWOeU4EKvpeEYgpYeGCoXzN70FKGBiRexvz6PV1+D1hwbv5hJe?=
 =?us-ascii?Q?wW204JVPzCwUR+glBwR001XKCAk5ih6H0AobV/g4oBpR+44UefL3GT47pxkb?=
 =?us-ascii?Q?COraZToLYz1d6Fg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0ZhQQWjB/eLvUz7eKEeHK66fdlFU1QMXpfaC9THpwV+qVRztwqgAv0YF4hMq?=
 =?us-ascii?Q?RHgjcmgqtbBbFBnPVJJKT5z0pgCFnjgQX97h9Ahji3SMvZ8CU6ejsr0nJSof?=
 =?us-ascii?Q?SkbqJzjHCDE7lqLqoIe6J5dL4VqXgp7WT/I4oM4W0lRiYz5VAZd7sCM0qhjO?=
 =?us-ascii?Q?6PIyT0gEji81FSQnkt4EKd4zXIFaBqgjZkzYcJ2TdTEM+PkNW/qL+RFMlcgL?=
 =?us-ascii?Q?17whrrg1S8buPReMVeLr5FjXMkbPPRqvITXk4V0P2lkhiKfQGU+0PBAYqCzZ?=
 =?us-ascii?Q?L+QzWA7nUZIAoOJLoqlSmYbYJ6eWPk6d/PjBbeZebBisFd3Be0HL4WVE9bgz?=
 =?us-ascii?Q?ebolUZhs1mXN91PYkUfmTsPkaGWOdFVS0HiKC1ScdrEF5tGSnFBP01EHba07?=
 =?us-ascii?Q?Abb8u9RuE/JORCC9h50G0lgl0aJ4F0wcRbmBGZs9ci4h8em1xEfT05aH1pwL?=
 =?us-ascii?Q?g5dXTtum4oN45dDphH0ay0w9W5KFi7w1b0CTEHeHL0jUMKIK3/HDFT7/FiJf?=
 =?us-ascii?Q?pYehCFT6szg2ROt/Tj16BfH/1ma7e5JClF12zATm7EhJNtofbdbu18kcgMl8?=
 =?us-ascii?Q?mN0lU/aOvar26hM/fZVxCMl0jATX7PC3KZBbJiTBUO+P+MYM/rEQZ0VKouB3?=
 =?us-ascii?Q?iCwgl4+zaeJrAQgpmXFwbAtqoCG/VYx74lzz35ukxSCbdU/XoVlUcMl2y9TT?=
 =?us-ascii?Q?8CoYCmwki2HtUynxhtsk/MJglQy7UqPxENHipb99FBFWhdBAJGT0YFGGXeqs?=
 =?us-ascii?Q?3NsZwOSmmBLGEbf16U9v6AAjQGIPDQNJK9JqktGIsUzrRB6t2H3jgFE8eC7s?=
 =?us-ascii?Q?TuAq89XmA1UGzxTH7tys+mSV53MhbtgisNOUGfIsG4PNR/f43Kq1lVLFGOEg?=
 =?us-ascii?Q?F+nJDt6piWeo7Ja6CwclvK5qIhWJWar1HpA7pIfSb4wxJeHXz214nqvThS6F?=
 =?us-ascii?Q?YbjrLe53HKCAZS05H++VgKz2i2NGO7LdlfxuFtK9ofE2LSgAABYUyVdXcGwp?=
 =?us-ascii?Q?svw3Mots8x4EYmd7nNQ0idz27HM3b08qW0mq15+9/ogy2KwyqrePXrxipRZB?=
 =?us-ascii?Q?tr2eeWqVmpZBsnQhLlV06/1JkaA0JIxqTae4elH93ZxLQqPWZ3JPnHGBupmg?=
 =?us-ascii?Q?M+Hf1uD7mmACICMSYqSq3uEgA/iSC15b9Iqr6FxgTWf3sS4Z9TsGyA8ArlW/?=
 =?us-ascii?Q?qgByTPdTymN86wIp0i6r1LRP1XxC83AbtPlslv2+jirv1jTx+nrsVWEHH8S1?=
 =?us-ascii?Q?qWdijfDuocKhEPDG9AkOmNeZMO8+A8U8SeqVV1Wz9SrG365jNFJ2SZa1hzpl?=
 =?us-ascii?Q?5ieetZvMZntWUkcVkfZiY1LCMn7kA7ooXag11W1/hshSkBMIRz32G4F3SGBf?=
 =?us-ascii?Q?iqSGSaug18J8/U1ilm2BAOidsN5EId5q0SYzebDLwbx8XfuwL+AW9/D1/9Lr?=
 =?us-ascii?Q?nklFQFVVmWBJypQp1h4trFXPril1EDn6bLsCakpey4lA5CiSPcDIyxYAK7zO?=
 =?us-ascii?Q?tdI/CJ+c58ucKct0y93c2J5orZSgog1rlCw+RYRZyvS7ZeiZMfnYKHXiuKc0?=
 =?us-ascii?Q?+vmKDbdSgzCCbxen2dIGebcCE1O+FnIhZ9SuV56g?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb4d382b-57e0-41b0-fba7-08dd938963ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2025 08:20:44.8197
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JbGLNZ9h8Wqm1xygcG6YolxgdJt+ZtRpSclhRPN9HORE2mgBbtd3yF7ua91Daoho2a9hyMhkWuha4N85Tj/ysg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7706
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_012116_750922_E85EC347 
X-CRM114-Status: GOOD (  13.62  )
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
> Sent: Friday, May 9, 2025 11:03 AM
>=20
> To simplify the mappings from global VCMDQs to VINTFs' LVCMDQs, the
> design
> chose to do static allocations and mappings in the global reset function.
>=20
> However, with the user-owned VINTF support, it exposes a security concern=
:
> if user space VM only wants one LVCMDQ for a VINTF, statically mapping tw=
o
> or more LVCMDQs creates a hidden VCMDQ that user space could DoS attack
> by
> writing random stuff to overwhelm the kernel with unhandleable IRQs.
>=20
> Thus, to support the user-owned VINTF feature, a LVCMDQ mapping has to
> be
> done dynamically.
>=20
> HW allows pre-assigning global VCMDQs in the CMDQ_ALLOC registers,
> without
> finalizing the mappings by keeping CMDQV_CMDQ_ALLOCATED=3D0. So, add a
> pair
> of map/unmap helper that simply sets/clears that bit.
>=20
> Delay the LVCMDQ mappings to tegra241_vintf_hw_init(), and the
> unmappings
> to tegra241_vintf_hw_deinit().

I don't know the specifics of tegra241-cmdqv. But the current description
is a bit misleading. for native tegra241_vintf_hw_init() is called from res=
et
so the mapping is still enabled in that path. for user-owned then=20
tegra241_vcmdq_map_lvcmdq() is called from tegra241_vintf_alloc_lvcmdq_user=
()
instead of tegra241_vintf_hw_init().

so nothing is actually delayed in this patch.

