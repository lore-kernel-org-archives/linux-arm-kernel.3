Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B536D5B164
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 08:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9/VwlOMYuvcGenn0SErPtm2B0A9SeQWWlrSsIFJtyWI=; b=dd1ylbtjAnqeqPFFS95CDhC8s4
	shl9IjEOSb4RIs8TbezM+XX+5N1nF96mNwAt0ceW2gkxkNbYtfRMlP5wFySmI2Ymg4QmRt8oszhYK
	yb7OHTx21r0vsW5pu2pEKh7prgsnc9auj7etl087K44vyzwAqLoShsNQjKLf8H1F3ZnVfys6S4hXe
	giPxpUrRueue9SlO3wUtkqa01y2Pu7ejuKW2vGUHnvvoI//fdW2aixVncyfB8Z50tn8iVhegK3eyw
	KBwiQdfdBjkbRgJRhjfKYnfPcibyRTIyrtQ4YIbt0WxRPXD/zkT7UMTpoY6Za0FSk7OfstnOEC6ps
	6UqaDcpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5hj6-0000000Dhr2-1tqq;
	Tue, 29 Oct 2024 08:37:20 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5hYB-0000000Dg3r-0VJE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 08:26:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730190363; x=1761726363;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=9/VwlOMYuvcGenn0SErPtm2B0A9SeQWWlrSsIFJtyWI=;
  b=gNj1qe0OZqykKrTWI5EYNlm/Xjv6/+RhrGNUAtwWynLff+c48SHzIHxh
   wKpJIF9n7bUKQI1bFb72OvzulC0jGBDU49XC/s0eRA8QL/MH4GwCbavLE
   y+okP1V+iJLqrjjGCAuA7iw0zWXHbLvnB/cjbjjekbH81umf+MmtB1XRe
   9dN2dRvu6Ps8MzLgRM1REdUmYtZXJAQwaWQrgYvEaGIPSmAhtb/dPCX4I
   9HgMm8IKpvZxyXshC/J0h5XEPzSOnVoNMJfXh6HapIPOk7x3qisbbGYlx
   zTwhqw6DY//dMxMpzUcTY6wwidBSnyu7KDPBwD8Im4WEpGutIxGxjb8dg
   A==;
X-CSE-ConnectionGUID: F7JXmn03TpWaRdlgVvRN8w==
X-CSE-MsgGUID: Vh+caLe/S864/G2vR4E0dw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="33515203"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="33515203"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 01:26:03 -0700
X-CSE-ConnectionGUID: kYn18rtqRm6dMFPHUenxiA==
X-CSE-MsgGUID: RikNHaJuRA2HPqQaLSZ3+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="81956376"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 29 Oct 2024 01:26:02 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 29 Oct 2024 01:26:01 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 29 Oct 2024 01:26:01 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.45) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 29 Oct 2024 01:26:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Auq99r2IwuGRiu4/LQpattWQL3Ug33KNCVt6Ez1VEjUUYAQC9+YopkI6p8Zi+V5Vu9rXRp7anTr7qI31kvQ/15H+EhYT7QQcYaGoZHwfn8PIEbXRtjNJBAfX8aWGXsVdetirzwKsz/EWJHP8URt67gtQx6JF3o9uoKGpoCyQTWaDb+CTm3z+5Zk5AUDIPp4n1a2viM5SQSwKdaRItHKXSoAZsYGLRziSwRT0VIrPTt9a4aFLIq1PjjbRXCqhp8j7fFAnntxLy46F2PhgKhz8KXbZCisV3bpPdtWedAIgFnoY/0Rj0sH+uo04f5HKaSk6eFex0GBWetdUL0GmXllEKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9/VwlOMYuvcGenn0SErPtm2B0A9SeQWWlrSsIFJtyWI=;
 b=HXM4hsG5h3xlLccKwoWhKAa9Buy1GRmZ3Kd1UbtrU1lJdbkkPs9xz6EGghq/5MX+RzcUAw5QUNbzl5OExw4hat+cqr/DkmYqxD/8VDfv8T1Nsu02TGPX9IOY0Z1Zy9rVQPItxDNKTmvbN3mXTJFsgPVTCBwqTCxO0+1c1hNmnVgstThJkfm+akjxlHJGPFWAcx1nWYo2CUbgIKdfuJajGHIh9x4U5tl3JN2q6tmB1wzN6FRu/EZltZ0hCLo46fufQdN3g9SXMlSHx03m8h/n1xW/v1/QbE3bxsIW8+6fE5xwH6Ys2ikumm0GK2BDpsuUwbHmOC+fRm8XhGINbmeDFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by SJ0PR11MB5133.namprd11.prod.outlook.com (2603:10b6:a03:2ac::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Tue, 29 Oct
 2024 08:25:59 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1%6]) with mapi id 15.20.8093.025; Tue, 29 Oct 2024
 08:25:59 +0000
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
Subject: RE: [PATCH v5 09/13] iommufd/selftest: Add
 IOMMU_TEST_OP_DEV_CHECK_CACHE test command
Thread-Topic: [PATCH v5 09/13] iommufd/selftest: Add
 IOMMU_TEST_OP_DEV_CHECK_CACHE test command
Thread-Index: AQHbJzjOx4W+1ACWQ02LXOc1LQC447KdadWw
Date: Tue, 29 Oct 2024 08:25:58 +0000
Message-ID: <BN9PR11MB5276E96EE96B01D43E2BA3248C4B2@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <cover.1729897278.git.nicolinc@nvidia.com>
 <6e578f2cb32141a676a6cb82c04506662d1a1254.1729897278.git.nicolinc@nvidia.com>
In-Reply-To: <6e578f2cb32141a676a6cb82c04506662d1a1254.1729897278.git.nicolinc@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|SJ0PR11MB5133:EE_
x-ms-office365-filtering-correlation-id: 5a3d787c-a74b-4166-09a9-08dcf7f3511e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?qogfRfv+IEv6NoU83MNH6/cLI2Cp5wWg1GBQl+c5zEnrJn+k/jBHYPJ0tdxA?=
 =?us-ascii?Q?wO6AC2vmIhFA5bvRjxpAnhQSy3IhU3BlJOFn5o2CC4E1Cc8/UnBajitk1sGY?=
 =?us-ascii?Q?UpSRs3Qo3UQyecw/rBuPDffkcsUqyD1zL9CGBm2sMpNmLvtynHuLa4Z9lkj/?=
 =?us-ascii?Q?8K8Ffg6uK3WCVS2pVCPpdz6bYzpTxx9u3Mk8x2ybMdSSb1yV9u/UEz9maPJL?=
 =?us-ascii?Q?dulf0fa1CwM0u8uAYy/PwoUYSo0nfUa1RgdG07sRvkeaMEANxB1m41/15U31?=
 =?us-ascii?Q?KKAtNnHqYXxG+6jBe1XWQQw4Zu+uYzHpa/kHGKTbGl5+1nvAmEZu/Mto7y/5?=
 =?us-ascii?Q?1KnQb+eV0J4Nk7cqexurj6DygzVkyPVOKwYg3fLyxZUp2UQ2n2/JS6Q9xwGV?=
 =?us-ascii?Q?hxtWpTZPdG/pAZEjlTxwEe5U9NBLL13L/uLLceMp8WtnqGOla7zD739gvdTy?=
 =?us-ascii?Q?R7DVE3gxBABlZ2MBUaduznuXKo9W0JUfZSxmcdt1Y0ZhUsNIIP49MaOfcDjx?=
 =?us-ascii?Q?8VD44pJ8bisLiflpXVSEVrZFwg9BRfYJGivDpSCCfBeBTwD3tmVCir4SyWUR?=
 =?us-ascii?Q?GlBG2RthhS7zAN/k3lqUN9U1yULB3kGxKkYGMBT+5QY20uASeU5mfURulWxo?=
 =?us-ascii?Q?4tgQ6vpgOrywCs4Z7UN4VfjIKxX0141BcKS80m6tb4zBlmflhE7QX7wJwPnN?=
 =?us-ascii?Q?gkpGG8d4Wzup5I2T/asSn4WTWUlUfzBMQN4MSFTEUfFfDdxfO1hW50yHlNgf?=
 =?us-ascii?Q?4tn8jVos2XLgU5zDCnsmjpYmFwHeMZPgBYhUldQ5UmbFWnRnyXQUJPg6ZXV0?=
 =?us-ascii?Q?jm9xQuVQdP9N4AhJkQtB10qhVt0rPQXNPgyJUVJuzq/Zl9+Nhzkwy8dpuXSA?=
 =?us-ascii?Q?ZZTkepY0WcF1Xz4QoFYpx8sBxqdpYFkSAvxyiEotRe0B4A+jY3c16DKY9KOK?=
 =?us-ascii?Q?yRCVVgJZXO2Dqko4wj5qkvSOQW0AB6CtJeQsyY5aN5nW6jOUlFKiQjizJimu?=
 =?us-ascii?Q?ym4kDYjFR54QJs/ytFPhMvEaMAj6//QSEUqJ6O/hPF0ojnXAyQGdCft2N1O2?=
 =?us-ascii?Q?j48GEv0GPNZwC5fuwqmPXjpTeaOVkdiw0Ty8hIWGuXvVpYRJsrRiZMfDNdZc?=
 =?us-ascii?Q?LRGvCqfS4srxJ8zbMbaoGorKfhs0WqF/FHftnuLF2WPt1gmvUdkdcM3w/N0X?=
 =?us-ascii?Q?qsYgubRAfuLS0k/hFZvf1cJLzNUsLTyrHEGIQcST0gELVP1ayj06y2Tsnsxn?=
 =?us-ascii?Q?9A7gH+pBMAFNEdSCTK+b7+xKMHFHeHLRE7tQPRBb+dXwd82ZnrArPisOZs1o?=
 =?us-ascii?Q?jqsJTwDJSkeyJNgKGlguil2Lgk5QTVRqLzX7lKyo5/wXddF92fRL43VxnIVo?=
 =?us-ascii?Q?Frh9hnc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?1amgrhpQl2U6dbj46OG8j1KKcp6FxaNqs43lXSZXzAmwwPluitkJNr3zDUge?=
 =?us-ascii?Q?ib9Q7HpLEoSv9Bz1otHnyWcTaG5gvz7fAhYdigoGGjOrwc1tJSprd2bnUc8J?=
 =?us-ascii?Q?lgz1TZMbGRPk6llMfCSQwXDpvaSvzGi3i5rW6z/AmCf31kxFVeS8vEUZJ6rx?=
 =?us-ascii?Q?Q8vlIv9wgGHNJwILDkqiMX3j1IsBiHg3PJkwpUbgtJ//Kn8LxWOfW/yZDN9d?=
 =?us-ascii?Q?r9nXffWgEOGZ5Y6vgA8OPunzI4MgVb0zmOEANcHhpqgXBfgIpUq60kRv3xhi?=
 =?us-ascii?Q?edolEOqM46grla/MyZ2gFHaEPKJcp0Ubr54bhu3TY/FUdcON8M66+sdG7Xfo?=
 =?us-ascii?Q?JSVi3gP7RyzuBO8P0t/FIm/P91IRSmd5RiFwAypgAGOe0T3wjau/QmX9yv2k?=
 =?us-ascii?Q?2mBxuVUZghTjh+JAlLnj/AWDT8Ob8YYRoa70laxjczn4HThUbPGmWpJC7zGl?=
 =?us-ascii?Q?UO53joxmk8vAHkOs+YgVuR1yqd4Rd7sD4ey2zDCvCFvxvhb1xqMf0M1yOjpp?=
 =?us-ascii?Q?QHQAeP5NIpsvhfuAQ2eIpo+qM2rLaf1VpfEr8xuE1KJJULhT1zvM59OQ6wrW?=
 =?us-ascii?Q?q313DCvbHNaT07Yj5BoJQ/1EUG9p25hhgxJysBqEFp2Lh4Sy81wyu6sJrJ6c?=
 =?us-ascii?Q?JHYBpapeKwRsJuCzgHhQ84VsGBmsGMM0VBaugLFYEFiHaDjMYSPnOSntVXlJ?=
 =?us-ascii?Q?6P2lUS75S9O7SXnn8b8QvB29ohcVvxJDel7adY4O+byGzokCJTzkkvgv4WxK?=
 =?us-ascii?Q?pPUbzpG2ghl0S1VaA04CeO4Q9EpRDrM33F29b8MLS1FgZ7V6u0Ey4+KxcNbR?=
 =?us-ascii?Q?96HTy20q3y1+gcAz8y74CLYZ8sjwf+3OfnXm6rTi6xkhcCKQwMz94CssUoUP?=
 =?us-ascii?Q?6gGRdftNMbFLgJkdoBU0gbThAFi8aUmDfpd4P67NuwvLeADZkup6RvZClEzu?=
 =?us-ascii?Q?lm1NFxntG0d2gyUr/bguB7meqDxCfrCO4MdcwgN38jFxSJxTwEmjkUx4qAon?=
 =?us-ascii?Q?WhWRo3wG5VZ0aTf1V2jrFlq2g6GaFDm1W1J0KcPmb3JjmbJ+dkIbcHOhq8Y1?=
 =?us-ascii?Q?YgyehkqWhjyrRDaH6lmW9DlaSpFfw4ZAygminbjQxB1byadwEBg8MMLc9MLZ?=
 =?us-ascii?Q?y8BgR1Z2mloh3ncgxub/KHZwgKVDcepMRLaeyQM5Oth9RDy0Q0ihRnylLIBJ?=
 =?us-ascii?Q?/wwgqmj/pHhi9UpoMtnXLE89SG2k7Iak+LL5rhSaiy054UpH5v1hC423GVtC?=
 =?us-ascii?Q?X1IzyZch7vI9WmaylZRvdBVbCyoXjTmQqEdD4zsbZDQ9WKl1BmRIXNUfQYfD?=
 =?us-ascii?Q?0YXL3lJxm9zN4q/o5nrUIBvwpCp+9775/lvOgOCScstvF9WYz0eMTeGM7jkf?=
 =?us-ascii?Q?7JAHUdk1PRY9q7qIWzDUn4qizWjBnY9CPSnan+YwBy57/yu2nDI8/opuiejy?=
 =?us-ascii?Q?EmumI5bgQWThVHyxTm3tEHif5AXOqbjgNw69T/MiVFsRzNc2BHoHnyRej56s?=
 =?us-ascii?Q?LvCWVaDKXd5coPY4wSvxgYurMKxTD/0im7+JsYqTNgPrtunfLdaGrSWh8i6A?=
 =?us-ascii?Q?96SuQ/XkpK1B4IQMiYyOE2i1TdaUkohrBWPiYP58?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a3d787c-a74b-4166-09a9-08dcf7f3511e
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2024 08:25:58.9396
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kgaOdTco2fqQhjld+kPv9ahQoZDmDPjXtfWnNZIHmRulJ/1ZxEyBkW7HUsi+oFLtWHcmLsVifVr3CZpyEHLSYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5133
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_012603_302556_2F33C2B6 
X-CRM114-Status: UNSURE (   7.86  )
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
> Similar to IOMMU_TEST_OP_MD_CHECK_IOTLB verifying a mock_domain's
> iotlb,
> IOMMU_TEST_OP_DEV_CHECK_CACHE will be used to verify a mock_dev's
> cache.
>=20
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>

Reviewed-by: Kevin Tian <kevin.tian@intel.com>

