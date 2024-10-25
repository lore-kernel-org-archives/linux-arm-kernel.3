Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C477FD0C5F0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 09:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wYv+JsO307gPBD0DOrXZ6jEUKJE/EFuluSIGDxFdCu8=; b=wuuQVvqlkvHQfLCtDYJMtU28YX
	aTG7cfkdORXv+55SW0p6s3LKsMqpjAeIQ2k+s6CexJwqS9+JE4UAhlaHX2kbQnC4O/9PlCtMluiPX
	WKwiyoJAxracxZuk4P/hNXlqMFEvudYI7B4ZZ/QPzEwwKtJU0HB09/JkwEnWwMFV5NWxR2uXaAOA1
	fc9pdfarhkjNXMVnUWp5Y32R+z0Rg85krrhzkw5HdAKIMbGwJ36veUVWDlGEEN093sHKiQ8Jw6Xmh
	KjazFT3DgFwJTEs0K6pKB9CaxM2WAQZb7HCG9I6D26e2F1/OsjOcdD1z1m2U4n5ojdTwVL+YL6vCr
	VwxonaKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4GOR-000000037sX-3JAB;
	Fri, 25 Oct 2024 09:14:03 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4GMS-000000037Wf-1Pt8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 09:12:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729847521; x=1761383521;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=wYv+JsO307gPBD0DOrXZ6jEUKJE/EFuluSIGDxFdCu8=;
  b=jw6zKDEfhWID7hr+qfdJum+4cBPA6j1Fp5U8EmvebA0Hq6H1O6iVcmR2
   A/+AY2XfLAuymiD2JvXx/n6jVpS9c9lhW5HBzqO7egnl/tgf7wh3RSpR9
   wNAqL5SuF4WCgdZN6S7Sbe0HRk1wqZqO5uS2zn4bwYPEghvCl77Tx7pmn
   ZA4kFivppy1Rt2LfWiDFNjq62/1ty5m1FNN+gx3OtcN6PaGF07azlnzYt
   WMMpRofjSJOb1IoBn/7Ek3OGZTX0UwyZaI3DVvERH+GE0Mdj2+XcVbkqV
   +9ajaopy2NOT+kF0FeCvL+7lQuu2fySxjK5sJMmA/Jq4D3D2clK6PMrnq
   g==;
X-CSE-ConnectionGUID: lCj2mjaHSi2o6weNdXSG7w==
X-CSE-MsgGUID: dEu2p6LnSd2c7A1kfBcHmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="46974890"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="46974890"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 02:11:58 -0700
X-CSE-ConnectionGUID: 83741bgvRM2zovbywagZ7g==
X-CSE-MsgGUID: qlyauoWwRoSZzYdFOUYkzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="81285303"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 25 Oct 2024 02:11:57 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 25 Oct 2024 02:11:57 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 25 Oct 2024 02:11:57 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 25 Oct 2024 02:11:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ketPk+xpwzS+6eIHO33VvDXF6lhMF2R25/RhLzeftd7aYi6lBIzY9qFcChWrL/cy9hsGjbsKDQiVUOk7vtdEmXuN9kkr9a5tGXsqqwD6Gx4TVbFPs7LbBzwmneLQgX73g0XVChW0MtNqqTc7l8Yqsl3QfZ/pPi/FCam61J7ycWKOAf6dUHhJXftl+LDwk8fKXyDd76gnYbWKNHlS29upMrKiBy3F4yrccdwXq35vNrUeBRlZcr+heJsEtfHLJg5CCdjZi/AaFeu35RNgEy0lDsKrncftuC3zCsGvAnAJzL/EcLJLcYN3DtLh8dVBkvPg05u3pp0dDiaBsdPy9blHdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wYv+JsO307gPBD0DOrXZ6jEUKJE/EFuluSIGDxFdCu8=;
 b=oyrR1FutSFxF8Sw7duX6g67UcRuiqKmtyBa2rXXvy1k0xafLhRxaGpf+QIXxLWkd5XVs1L6t2nqdJjswuGZAPQjhld5pc/hwReeFnj9+72M9SQQl5faGl+++Bt5S/QXrJTmSjxKEOTVqHETYckJ4pa9gsLVT/uBX8n+FJc3jfR435yG+QicHaV+CGLtnQ5wlw+eul1mxGscwkapcIbTw8r3dTaz95hDnlbbrWtYj8d6rTW/nkxzJetYYbC5XCmR4vQArPVCyx5lAEPqP1Sz8EBqchHlAJjpxqhpR22ZM9Oz3Qp7nb5ywM+ZE+f221NOdJNlnvVCFplH1q2kEFYSOww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by SA1PR11MB8473.namprd11.prod.outlook.com (2603:10b6:806:3a7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Fri, 25 Oct
 2024 09:11:49 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1%6]) with mapi id 15.20.8093.018; Fri, 25 Oct 2024
 09:11:49 +0000
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
Subject: RE: [PATCH v4 10/11] Documentation: userspace-api: iommufd: Update
 vIOMMU
Thread-Topic: [PATCH v4 10/11] Documentation: userspace-api: iommufd: Update
 vIOMMU
Thread-Index: AQHbJBhHdnRm9sUHlE2SnMJmPU06SrKXM5Fw
Date: Fri, 25 Oct 2024 09:11:49 +0000
Message-ID: <BN9PR11MB5276ACAE39D9601A4CF4724D8C4F2@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <cover.1729553811.git.nicolinc@nvidia.com>
 <97fa87a511f0132ee0e233cadf09af075e4404c5.1729553811.git.nicolinc@nvidia.com>
In-Reply-To: <97fa87a511f0132ee0e233cadf09af075e4404c5.1729553811.git.nicolinc@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|SA1PR11MB8473:EE_
x-ms-office365-filtering-correlation-id: 40cea096-007f-41e4-0927-08dcf4d50ec4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7416014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?HDw41e8mfgzSeFFVqiWI/1dveTk78Qct/D5DJRqHX07od4WgKQ1Vr9sU+USe?=
 =?us-ascii?Q?JUILqAeqnE2uK5Tu4kj6OUTLimyViojRBzDMCUvn/URiOqYmNMCh0Wx43ZI6?=
 =?us-ascii?Q?km00IObC8RsPCFutg6jThq5kgVrq92VCUmotkAP74AY76MTrAdjaT9Q1MXog?=
 =?us-ascii?Q?Vj1RbHuHxSmhUJBFbjgXWgdImoO5dmATzpL8ejvNdJ5jWEWOFkvIG2Uuoxj+?=
 =?us-ascii?Q?rYrlNYIY7coeKjJuWioeedpYitXSXn9j5T/uRvHBlKuFSiaAU1WYv6pOuu/Z?=
 =?us-ascii?Q?FcjIGp9jcTvoMtvsJ4yc+MsZTIBbUK7A9QGXuowdW2bVzhbKwwj0jbCYku3S?=
 =?us-ascii?Q?QY9dcoK33J5+r0X85ov1wrba6eOGcgzYKjoD31L4I6LOyrOhF65qI2XA+KQL?=
 =?us-ascii?Q?E0hTs1k/hhEsSu2pOVqi35j+4puQNIx9yFx+xO2iDbdIMTKW4GhOs5fmzJid?=
 =?us-ascii?Q?ftixcjV8/eWBYlAj4SCVi/Ku8qbTD3q+XIjUvWpm6Gvku2B5VRO4JD/+k51O?=
 =?us-ascii?Q?kqEBnvUVxeEM5CcjrRt7U/Sg9cndlgX4NDz8dMMVeqdDu1O0NecLgPpqOWeP?=
 =?us-ascii?Q?3vZnjcBWEyQDFng87sWauyuHELRIjVrPzgiJTHmfZmqC+O5Dc/tlU1ygUgv8?=
 =?us-ascii?Q?CifpTbucLkjaZOgBqeh5HKdsPtWJWxtN78QpzB7NwjXkrNbePCD9IEdYxeVi?=
 =?us-ascii?Q?0/yOx2c9OvkTwqOaRqHyTnMb7LfTjIL3ebCHYRMLlEtvsX7VSMSq67JDeJqq?=
 =?us-ascii?Q?Y24Os3y81gz1i/JZbXyOb22nU46iR8rNKGxG5JkYf5Bl78dTKKaFgEYc7d/6?=
 =?us-ascii?Q?COBB6zCGnQveKaveVtpQ9HuoQD0iNqn9PSb/qKwrX34gVMlRQrL6l8s8YU/o?=
 =?us-ascii?Q?wKXZp2YptQhVxWtAGj8/sZMB6jNUPWSXZkhQikU/8sWaX2+KuIdGzmjztGOJ?=
 =?us-ascii?Q?WpA+LoeOJmw/O5IsfdkCias9xAD5lhD4yNBk/FruSgWxH3AFdhx43AbGAm7r?=
 =?us-ascii?Q?y1M5pFUKiV0fPlYqu912aKLTmx4pLptpuJzddbewzIB5QlixzqGjHkfek5D2?=
 =?us-ascii?Q?8PKX8+bc7y2nQEbBoaopmIqvBLmExsmTTHheykfxRbbuAM6vlIkllA6x2dgx?=
 =?us-ascii?Q?Yuvfx/g31dK1zbYlU9IygvPmpBFoCwv1Lp9+ZD28ZiYb4XlxmkkqrwtzRxuk?=
 =?us-ascii?Q?nHnTC6KXQ2CAjOlqT/z87CIknEHcg3gJEGEBcI7H8nzJnptxvyb4/18DjDq6?=
 =?us-ascii?Q?J9OYAv1E8XYgLndlGkKKUz6Q6ReG0XEWLZAD3+GTAwbsd80jmRM39yKGIGl5?=
 =?us-ascii?Q?1oLgIpRSEkk02NRea57v9NXT+MXOVVcHb7M6GAvJBI//v7vzccFqLxhav0vx?=
 =?us-ascii?Q?s4PUaIw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?bUWTtWCPy2XIisLUVgipVmZpch17qTWEKnilsvPfKhqBWy8Uig/+TzZOPTQ5?=
 =?us-ascii?Q?OIYE/Td6aRZOYaEdK7a7TdzQHFeFORLJbe6D35kS25EJCZKmn/m8lsCAraLB?=
 =?us-ascii?Q?R234vsPl2o1ggfJx3WVPEjURw4Ww7hTKbpKWJ7ffOjUlKS+VtSZgUO/7Z6dU?=
 =?us-ascii?Q?X1SyppxW9ztMoK4QKm7JxYxramPoMOAZoCpBNQk0DU57+WEpZr/AM3lqOZBA?=
 =?us-ascii?Q?oY+eT2SMEgKZrMlInWVH8H1f2SEBoCYAEed0FMR/hbP3QAYR/WrGYda/HNnN?=
 =?us-ascii?Q?VrsSAPzdb7NWRDdYsUaIG6/d7b2fXY3MrEMZ94RUwszi3ttWgcGscwV9SNI8?=
 =?us-ascii?Q?N6YMnF0iC6n5nyi0qDFfwHeTSD5KuURjc//jDK/KnMEJLC26ZnFnq8K44GLk?=
 =?us-ascii?Q?LXZ10p2bK0rgbPek2jNnz4nxlX30TRHq5kPByaYPrrfdtjFAMMlsC+yzmZ57?=
 =?us-ascii?Q?xJxfU7YZxk8FxilGnc52/LW9z24II/b3q4qkea6U7p3jviFmOTnVpuX6cnmy?=
 =?us-ascii?Q?K2umLuQ55c41sINJ3fMbpmgwW6KSIu1B65FxLPplRu31QYTT3oUH4iRjmDSE?=
 =?us-ascii?Q?1mTUNRqrmH3RaaEO44TAywI5uUzYl/9jr/dlO20jYO65G2U4Uv/5ppV/lPgS?=
 =?us-ascii?Q?9n94NMuuojZgmRFzrxOeSRZhakDMh3kcZr2vBYvU6qstzwy2TVp1wzOQsLc3?=
 =?us-ascii?Q?oqCV6A2Ij6H3O5poSPaC8Cg4iYeyFpDOVu5rsMGiohWpXJNVq7DiqOq6Glj5?=
 =?us-ascii?Q?nGR0g+D5SM0TIZeu2TH7sg/Dj/3CXPnzslGLIs8+FUzSvKuGk65G5rx7rzbR?=
 =?us-ascii?Q?6mKSSMjNpe1YEOCVFEW8eGbcUODO7vBn7U1kYnItrMTqYhRRhiD+WX47mkHL?=
 =?us-ascii?Q?LSXk/tTQiPgGA6+BPFy6jpiQmKJXrP5bb3Vun1jtDQY8If6nc6kbTUGzKGTp?=
 =?us-ascii?Q?Xi8Kb/k26eAZuhAE3hiZReQLZQt4/mtduSmiZVbEYFGqd+91gGLjLVRf00A6?=
 =?us-ascii?Q?B7yYCJ8wmZMCR/WmOp0zODkp0KI388GF1c844euJlR0AO4ZvBAg9MV2mMIwH?=
 =?us-ascii?Q?rKq4+vE8BLKodtZG4djxzAwzvx7NnuyVxzXGcOTh6fzwQWbwGD3gsTtoUWug?=
 =?us-ascii?Q?kVH67CKwmBBGY+gZ+96WMctvp2eUo6hCcWj2fyYenWWPzazkJAQx0rhoQ7V9?=
 =?us-ascii?Q?7Meh/i4DKxGjoEdPQT36jj4yoJ+vFmtZawfPAIbMQZ0ozBwBgrlYo/JuDpTx?=
 =?us-ascii?Q?ESxCCnw/dLe5oFTiws2ZnhgLygSs5QYgFKrSwCIpCa8PeXtX9CF60UzWow/0?=
 =?us-ascii?Q?uP2QUTKkOkPYTkDTQ6hE+uBG+o9UUGdGqps2P4pGYZ9shaZOdXMHSHtJYfLN?=
 =?us-ascii?Q?dxqJO1+hN2NyzbbdBNK0+pFj4zID+J33EeBZtvaKj0weCfCrhZnm9nMqzq3k?=
 =?us-ascii?Q?Wu++Bm5YQPwnV33vbZJE1+umgxkLyAgkg2Y8jYPki1KCJe8duT5SEqJsiI8z?=
 =?us-ascii?Q?IL9sOR/l7Gz2vyuIm7FcGtd6naNm9zML8Jnkx3FQNdasIhGFfnuuyoI1tOoR?=
 =?us-ascii?Q?3zvOTRzjdWRJReDsj95yBwyhIULNpj2EYX9Hbhg8?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40cea096-007f-41e4-0927-08dcf4d50ec4
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2024 09:11:49.2631
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hUnlCD1QFIIKxeGD7Xla3T5s316yPI78I5EuA8Hesk5Ss3sV/m9fD2D6EpMJM8rVDVORwyo2TGA2WeCmsQnKbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8473
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_021200_456050_4DBAD430 
X-CRM114-Status: UNSURE (   8.48  )
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
> Sent: Tuesday, October 22, 2024 8:20 AM
>=20
> With the introduction of the new object and its infrastructure, update th=
e
> doc to reflect that and add a new graph.
>=20
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>

Reviewed-by: Kevin Tian <kevin.tian@intel.com>

