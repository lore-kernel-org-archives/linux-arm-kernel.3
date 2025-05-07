Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85F43C3ABC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 08:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TnUtGs6Kq4SIUxn8t7hp/7KrAf0j6LacT71uD6d0Xvs=; b=rOTPs+/XxBhp5dW69kD21qAtHt
	omQKFfDzy9/9peOJZJs3AiIwgjLQxc1Ub6UIzV6qDCwuXJ7ylqx5bjiQb3x5SZo9Bkvdn99xQ4irZ
	FsOZUAexi/rHBKTyrjc/FjmnYIpUELpsU1Ov3mf84kT4nL15sT19Tf1TBLa8zYBjW60lhFsDFLIZv
	5KOWryyb7F5IxQV+Hl4sGwHLwYFBFRV7gJfBLAHrYchgIP39kXsmq/9zTD9Tzy6A02Z6j9XLNpYCH
	7XXN5YLhtrXprJp0HMSsAZnJjTpQSlhVvoLiVi2nhClBR4rhm1njzzp4anNiffOwHRE6ViN/4wmVD
	GBYMQh5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCaOo-0000000Eo9u-2hso;
	Wed, 07 May 2025 08:45:06 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCZYs-0000000EbgQ-2EAJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 07:51:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746604287; x=1778140287;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=TnUtGs6Kq4SIUxn8t7hp/7KrAf0j6LacT71uD6d0Xvs=;
  b=QN6SY69UQv9+67OC0yey4Egwp/6ndArvyfIPiuPbIPmAYaNlM+BJbZjR
   c5XS8g48ocSxVoI3j94VOCVH0QGfTVscfJMLZnkIfmGiEB3poo4jjXWZI
   hEle8bde52cZu+KpBYQLTeIsK8WOZuIf0JlsVOm2T4ap2LyI7Yl07hLRy
   n7Jh79jTKXeufSyPsutJb7185c3NroUjp5Jtf9/Ea7fJaIKO3kHQ864HU
   /mRtvwWT7OD4L0S6nyzLGbAvIs33m3ui4TbOBGFHYkwJFB6ginnLbyfqh
   tU6z57ycqzhOBhMWpSeUE2jU5PJ/pvBq3hSS6lU4uFSXh84k9jdcKXkIO
   A==;
X-CSE-ConnectionGUID: ltgDAy/qTqWgMtL1s4WLHQ==
X-CSE-MsgGUID: +0rUxMriS56yLpQPI5LYiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="59306784"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="59306784"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 00:51:26 -0700
X-CSE-ConnectionGUID: mECZwim5T+WDt+meLJ7DQQ==
X-CSE-MsgGUID: 76KUHadeTOyw2FIV5BA8WQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="166917362"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 00:51:24 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 7 May 2025 00:51:24 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 7 May 2025 00:51:24 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 7 May 2025 00:51:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AGMu3pdPt2QPKQyrtk5kWh72dzgcdpT7HJGqrga5l5f1yoy1ePqD1GjXm3onYPy+jKyO3c6YtuhSxgi1gBR4HPKKw3/ftdFeK68o5FndPb7MjeokWbUtxhjAZVRQuOCP6a1LgjWPyPZijaBCU/uhAeyvqsV56A67Qf5J4dYbgwNKg3KVBR/fZ4LAc3+Dwaph52n1GZhtQLXkyaqNCiuqUZCrN1S0qL0e0YVEODUqptAF11HdN++PB8ACYSM3ApILk3TmNYfg13urdIabo8w58nJ+f3fag0V+DOjSzAnR0rZFpEfXmpI+dd7kTuCHtoG3S852wePmoKmO1T8XpYK4NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TnUtGs6Kq4SIUxn8t7hp/7KrAf0j6LacT71uD6d0Xvs=;
 b=b/nBZNqxCkfgii/uzjLRo/ACCAR/vOy/udQ/el+3DHReAjuh/V3W5db0gxL+zFZ0flDYKwXYsjFgXFLoEEb+cPFXGMr0WjMVzM30S5n3uuAN0LeRLCUPOLKXdXoJSlgEnI4+zQTb6lVzcpxkH+qTnqkL8rEEnyW/5QUjetdr8d7qd+agra3Q9zhmb7vXZT0o6YSILj3hmw1UvXaapUMriIUCexiFQQVwwJU1uyj4w5H2H82aT1QbwLCQypttNg4HdbbvnuAynE2vfb8WVWwrHsJd9svaA6TQvHyVagdqemJ4xBgnICbT+PYeMQHeE+Y8eEzQxltNlinwqVYwRNrXSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by SA1PR11MB8320.namprd11.prod.outlook.com (2603:10b6:806:37c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Wed, 7 May
 2025 07:51:11 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1%5]) with mapi id 15.20.8699.026; Wed, 7 May 2025
 07:51:11 +0000
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
Thread-Index: AQHbtnBgpkGgdbEd20qNTy9huUtOtLPFZrYQgACjfwCAAMZl4IAACA0AgAAD46A=
Date: Wed, 7 May 2025 07:51:11 +0000
Message-ID: <BN9PR11MB52767C9253073156A63C27B98C88A@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <cover.1745646960.git.nicolinc@nvidia.com>
 <d44272c153e7596c3cef716044de3dc6c2a8254a.1745646960.git.nicolinc@nvidia.com>
 <BN9PR11MB52762F5A464ACC68D78465578C892@BN9PR11MB5276.namprd11.prod.outlook.com>
 <aBpgWNitAgNenOPY@nvidia.com>
 <BN9PR11MB5276090879BB4C76CB27909E8C88A@BN9PR11MB5276.namprd11.prod.outlook.com>
 <aBsNhsVryZs2c+AT@nvidia.com>
In-Reply-To: <aBsNhsVryZs2c+AT@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|SA1PR11MB8320:EE_
x-ms-office365-filtering-correlation-id: dd4ff61a-57da-474c-b070-08dd8d3bef5c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?WCIIB4bCt8F3pyE2pXMJss2m+Gznw8Q7rpP/sRJedvA1Ltx38H1sQmrMau6q?=
 =?us-ascii?Q?LXPQ4dwcTbGMBcFQjL3PtP79L19i2Jjwa258yrlVotp5Nc2pB4Z59IKEqcmn?=
 =?us-ascii?Q?fNb7nl1OZkMuOBKzCtUqmEDoIci7rbz/UE5SNnrOAaucG7g67i/UCfORoTYV?=
 =?us-ascii?Q?3xHxyd3HnBDcpJZSrMO2prtoW1lbhRtduEXnRZYmGQxl+TvGjar8s9mmVaXh?=
 =?us-ascii?Q?iBiaxtJe/D6cIv4MgWfk8uUkGq/06GAQuRbz81g1h/rdAYo7E6GkEH8Asuv1?=
 =?us-ascii?Q?vBBZ6036HAw/32npCp/n/qQ6Dw+/BQgt6DRGyRGFkce1EvbeyKjX9XFwPLVg?=
 =?us-ascii?Q?nEwrYKCRq4IufTsOYMyrddAs4cfo63x92v0GtpY8e1LZhDHMwv2gTMgMPPTL?=
 =?us-ascii?Q?0Cnw6Co/+lZxed+XULjuIIshgcXUWfH0WtfTyVRRwdCPcbjW8MOboT+GXEJY?=
 =?us-ascii?Q?lGwmJ9YnO+RGMffhw2vVSCELkgbhfawe1y5kwuVLWK9FdLuB/qKgWsWAX/qf?=
 =?us-ascii?Q?JArdB1AEbtUJlyA8BFaW4lYnGHOGcW2qk4sycViGMmkKX6j70u+4ZyNqCxCq?=
 =?us-ascii?Q?KbYD4J6oKlsgh91yGCLPqNgcTHiO1W6hctGHcdjX6stSjx4oh+f2a6FCqBlM?=
 =?us-ascii?Q?FrIfXF+hUriWbhWl57fkTJ+rg7S/FOCiioPmymiyyrO2KGVTz9VxS7n86vWT?=
 =?us-ascii?Q?yGcgQQpwbwpwSfH36ZS1rj5CIsQKUTG96O+rNmxukJGXfUd2Q4lT3EXjep6V?=
 =?us-ascii?Q?i/roNCXyLv66HbU26R6owmDq+s41aAeYo8Q4gXk6mJU2obinKfxTOTv+0RFM?=
 =?us-ascii?Q?eh0+Y3xon0edA4Vbqp78mJ4JiejoHi1svFY6PExaB6roGz7jeU6KgszdRKQt?=
 =?us-ascii?Q?smmuitFcQx14DtRR1ya5+rKtg1M/DjfjbjRfqBOKGM8Q3kgSTGmTJrXOGZza?=
 =?us-ascii?Q?ImCuHpnqtYCCO9qVn+qdc1NTu/kQrdunoZRzWc3AboaID0mpUNHIeg6AAWHJ?=
 =?us-ascii?Q?A2tIEUlMqAFoAykbJxj9DynELPvhBLxlkC1SELY0DPMHpD6MflYolSK5HVOg?=
 =?us-ascii?Q?ReQGqc6PpV7urjFYnjAYEKGwzSrmR0eSMW3kXuLL0Yapdmf8mGWmkxwgL5ys?=
 =?us-ascii?Q?KWMbo8fsZTkXTYqY+3AhDc4juWJrxMeElIsy+9mf2YYtBVaFAomHODhgl3eb?=
 =?us-ascii?Q?6H4fSrJxfEW/0FJcT5XeQKLDwOq0n/6zw7UNt1l7DrY+ejeal/801tzKt8G5?=
 =?us-ascii?Q?XkQC9uyQSAzwQdTTSmOA64+GROsuu95scBE8O799o1nxcLfrc0e8M2cMCukr?=
 =?us-ascii?Q?TBsEH2sUErwXIWqSeedi9BwPwIc0uiAAWDIkGYdT25wXJb2A1HJTR32/EWAD?=
 =?us-ascii?Q?FUA3bOpZW/1qqc1SGK1sK+pL8nlBkT6ddprRsX1SiqvoiEMtEB+yXOLBcwGX?=
 =?us-ascii?Q?mpYMxMwUKyERPK6KC02VexNn8OZ6NZw6PGWavaml1xWje4z9n/vp3u8HpFUp?=
 =?us-ascii?Q?leSYakRwqpkwnU4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?I1QiknSMw0iTNbUWRQ78ylKbAJ+pkco9afWDtEQ52JnxN2fIj6eaZ5V2e7fS?=
 =?us-ascii?Q?RU9hheaHJAv2iThAUJXYshpo6f2Ips76rmbXbGDwiemNE9Oof3h1wZLiSGjG?=
 =?us-ascii?Q?DVCNYs5Du2Xvb86klGHBK3hlnifmuNedQ5CXFGErDRNgOeXiN+fiS2sB/uJB?=
 =?us-ascii?Q?96wOCQGvnKgPy7EXkirKhENz7Mr0c4qYWTrlY2QJCbtzV6O6LiiSwnc7/+Ug?=
 =?us-ascii?Q?dQbrkuRtVKWQM/jTciFARZEgC7X6VsT7LSoH2CY1nrdEQYaeGdYXPzsDnBOW?=
 =?us-ascii?Q?UzA+wpgt/L4C2t5WTKSJIDYUtWEQFd8MGrfzZxOEKZC5/1jvT099Q2EuvLMm?=
 =?us-ascii?Q?1ixhS9LPz3LCxc48wAN/qDUsiWcl3z2EFfazl5RbZHrlWji8HPu0t5aDv0Tl?=
 =?us-ascii?Q?9dHpciMXmBREDGZ5f74AHb4MuwJoX4xMm3w9i041oEc4yR1wmFjjkt1flnFV?=
 =?us-ascii?Q?nXbmgtl0G5i0rVWAy2FgUZDBsnS9wEGeB+u5Q6GoNheFDLsCGB4UvSvQ63Dp?=
 =?us-ascii?Q?TJylP7v955tjcz6x5zfQDrjSPewrCrnAmfsBVgn3rzmU+w5ELWr/jvEC31G3?=
 =?us-ascii?Q?5cbaFApBSK4zpDToc5CQv2RIzKSxJU6PgnUps/RjBUmYzVUFx1BVinMlHhP8?=
 =?us-ascii?Q?aAVd99B0yBjcVn0t19nOS40fSvMfMB6KnSsJ0L+cvaCephWr1R8fdN+o8WYR?=
 =?us-ascii?Q?JvzyDBr7sdA6GtyFNppSCa94aF28cZapbD94uqqBFxVkE1WlEJ3DlVHZ9Nvd?=
 =?us-ascii?Q?Pe7wJiJJecKor3do3tcTVrabfY58AAnXxw36+zYcffvrLQ1H80nJ+A7OBZ5L?=
 =?us-ascii?Q?B4Oe8eBnT+u7iaRUiWmzaIQGY2y/rqqRd598YpHXlhobV5DOSgVszkvre7yf?=
 =?us-ascii?Q?Biad1Vn7tM69w3TDLkDzpYqK8brTJfquXS07BB6J+hQULe92OF5yZQzx4L4+?=
 =?us-ascii?Q?gX1MyjmggJ4/XOsu4eAMWZ/IbViblJGfeZT4/8Gg/vJwAl6mqVREaGey3H1U?=
 =?us-ascii?Q?As1h7KbeRksZ5O2Jpd4kUN1IAPwSPd+ftceA5n+ru8gOK8PIiu7OOBeXr7jN?=
 =?us-ascii?Q?/5/v9eaLZ8QjpXzoN1wACJ6oDqOcCmEpXBmTy0soQbitOc4Inp/ZP9daRoyU?=
 =?us-ascii?Q?EK7NMUbgKI6M7hs0W7YRanYSV8+GFS6dQtf6Kg7hUh+PVHuQLjA1Lamm/vcQ?=
 =?us-ascii?Q?0m/Yze+J7aUFD1YMnJqaElaMm3z5LWFyixYABXgyBi2JDPh6nFUTQDI9zaJN?=
 =?us-ascii?Q?KLIdgD4GKj750Tw+FY0tpVCzvqQCaWLpdIeyIhJEUbkIkYRHgJW44DIvi00k?=
 =?us-ascii?Q?TzVXOyO8yMQsB+LNm4t4EFHRJe1tbMRFY5K9LI5AVpvo+OGkT4/9uVOIn30h?=
 =?us-ascii?Q?GKcj0SwAF76ewIJj+Dr/193aD7eS64tcTJR3mUHaeKKat/XLZtdadKgl99ch?=
 =?us-ascii?Q?K7eXFkg1pwpWTDtCoNDQhD0MnyLJzx19fI4G6zJhraw1iTA23qEzhaW0dneg?=
 =?us-ascii?Q?rqbjBlHhqs+NyUU8fV3XMZBqb3n5KFKDOgc1U8LwEFtuTs+p0SmzBjmc5kRU?=
 =?us-ascii?Q?cO/AoUE2YGdPlaL+zgGFczuMLIzcMdawTZHoecje?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd4ff61a-57da-474c-b070-08dd8d3bef5c
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2025 07:51:11.4476
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: smCkY3Eb09FPcEgYjYwieTjFQ0Fzr0jOO65ZbWOWes2D/G/q8AJErFYrB+ZwljvDBLtGRZnpPx6PSy5RYlfT1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8320
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_005126_623777_A2A18DC1 
X-CRM114-Status: GOOD (  18.61  )
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
> Sent: Wednesday, May 7, 2025 3:37 PM
>=20
> On Wed, May 07, 2025 at 07:22:24AM +0000, Tian, Kevin wrote:
> > > > any reason why this cannot be done by the core? all types of vcmd
> > > > queues need to pin the guest buffer pages, no matter the IOMMU
> > > > accesses GPA or HPA.
>=20
> > > But I am doing in the core. I have iopt_pin_pages() called in the
> > > core ioctl handler iommufd_vqueue_alloc_ioctl():
>=20
> > IMHO we just want to keep the pin logic in the core while leaving
> > the check of PFN continuity to the driver (or have a way for the
> > driver to communicate such need to the core).
> >
> > It's possible for have an implementation with IOMMU accessing
> > GPA of the queue which further goes through the stage-2
> > translation. In such case it's fine to have disjointed PFNs.
>=20
> That makes sense. In the iommufd_viommu_ops structure, we can add
> "u32 flag" where driver can define IOMMUFD_VQUEUE_CONTIGUOUS_PFNS?
>=20

that works.

