Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0570FC02182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 09:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XZchnmybd503GLJj/xY2CL3dWGLxJtcsMpZrBTzBWLk=; b=muQtvAfDXitvCSzCb+vQgkDzN3
	PJL9Ky1Gnk0eTkwHIxLsN+NK0jWtdUAhVbr4AhYmaMBm2nsCc31iE7ZUyXdoi/IIrAiCQHp5y5rSv
	c1KPGps+At6pO4O8rrdvnXh0Nj1ElIaYesNSdiUSyBe782kPTK9Y7Ld20pjTB83NPoKM/fiZC8cLj
	YYHPAH8YRWG+jxkCJ50ngibsUKhUawTDTYnF4uBUD0dcbVExhhYFJ0GMyasgBT6E4du+1TrY/zIx4
	eopnnA4bAWpZk7aTjFnfQKJ7Fjm85BILFL7J8SOoascrBcU3OzNdW5I7uOdAsF0LIwhyy05RN6dkK
	JLgE15fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tatxD-0000000C8Zw-1YLN;
	Thu, 23 Jan 2025 09:56:51 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tatvv-0000000C8OU-09dq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 09:55:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737626131; x=1769162131;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=hw7/8InROQgTq+Lm7kM3LekZZmSSVxEnpJ4TL28jDK0=;
  b=CrTGkV8icvHVZmXsdI0XqklTGRcb2UV+8AEps6ZnoJ9NgJKWoXhD2Htl
   Ikspv77yY49ZqZ+gJTAlBbCTRV8v+1hMzEqdh/+8S7VxW0rcEm0h+r+yq
   ammu6cjFYIGpOFVShLbKG5iZ3hYrE3SvoTdAwFa6Qd6McWKkicz32InvL
   OaiAzjFLV/WnvMDpyNwFtKlxr7rhpJWEs12HLRgFPixQ3sIRppfKLLih8
   6W/y2tBk/xbbRhhxYRJ0E3/NppIrGUo/y53l9fipYydmkv4NC8fgc4+kw
   Ez7DlPVrD5PXXvRT6K6yfoQEx/XV3KNjuQ7khOsWdDrNajfr2hwssAnnQ
   w==;
X-CSE-ConnectionGUID: +OYVcFqZS4erK8e4LXN3jA==
X-CSE-MsgGUID: AYaLtzM4SwipPYHyarpyUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="49107606"
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; 
   d="scan'208";a="49107606"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 01:55:27 -0800
X-CSE-ConnectionGUID: VWkWw5l/TIi/cCLcc3PwmA==
X-CSE-MsgGUID: L7ouFwImSrO71KDDNIRm6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; 
   d="scan'208";a="138274479"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 23 Jan 2025 01:55:28 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 23 Jan 2025 01:55:26 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 23 Jan 2025 01:55:26 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 23 Jan 2025 01:55:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bAXdDFCTCCShmR3TLTzvmNEIAumJYTegB0XdwJzzDM9HhxPArraDrQdSVy66Ysn545YksEf5etfVe/6j47AArcMBM8hHdSfZF7W+067caNzUGNbj4YbPwRPqDUT0bVMUCE4n47MjCVb5cdyBJW+XbWAYdKWSyArjotYe8+5cz/WB0idX0zwU3HoKPwVeIsLLO6VVnfLAdv1ocd9w14aU+uhCWat3sY8xHxkKsYfjCJClf3rLjFKwRVSM3H2XmzXPURydsNAhkFQi4qhYujEKF8eY27rhk/c+0yRqobEZ0DFXlya/yfjDCsbGJZsh3RdQGYd7JdafyXVfaoX4c4kaQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XZchnmybd503GLJj/xY2CL3dWGLxJtcsMpZrBTzBWLk=;
 b=ZT9P+wOU45vjMFG7vWivbRs0uWhsTEjgTgx2rBcssSBQXQbj0GvCgd/j8Lenjsilfh6eIlxuEO3IqzHlZXbzj1kwkkAHDBzpi0WGQDBLLDZ4zzkNnQPpvLfbCwmn+Na6Hx3wer+BlX/nL/23t/MVCsYcyt7RhfNetinYd5JG6Ti8IbWMskGZGfIytv1QGsFs+8ipQt6wW636kGj+QZVgao1B9bCr/CcG7IMebpKvpXx3pt4Ri9W/aTcN6ckQSGczC5UQ42Sx/CyT1Mi38Y/jTCZWY+ZCSGhaAmghAWGEuF3HFdyEWWCLaDyNCxBLpcmpSnhfnJHUxRJRBtwB0Fbx8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by LV8PR11MB8722.namprd11.prod.outlook.com (2603:10b6:408:207::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Thu, 23 Jan
 2025 09:54:39 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1%7]) with mapi id 15.20.8356.020; Thu, 23 Jan 2025
 09:54:39 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Nicolin Chen <nicolinc@nvidia.com>, "will@kernel.org" <will@kernel.org>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>, "jgg@nvidia.com"
	<jgg@nvidia.com>, "tglx@linutronix.de" <tglx@linutronix.de>, "maz@kernel.org"
	<maz@kernel.org>, "alex.williamson@redhat.com" <alex.williamson@redhat.com>
CC: "joro@8bytes.org" <joro@8bytes.org>, "shuah@kernel.org"
	<shuah@kernel.org>, "Chatre, Reinette" <reinette.chatre@intel.com>,
	"eric.auger@redhat.com" <eric.auger@redhat.com>, "yebin10@huawei.com"
	<yebin10@huawei.com>, "apatel@ventanamicro.com" <apatel@ventanamicro.com>,
	"shivamurthy.shastri@linutronix.de" <shivamurthy.shastri@linutronix.de>,
	"bhelgaas@google.com" <bhelgaas@google.com>, "anna-maria@linutronix.de"
	<anna-maria@linutronix.de>, "yury.norov@gmail.com" <yury.norov@gmail.com>,
	"nipun.gupta@amd.com" <nipun.gupta@amd.com>, "iommu@lists.linux.dev"
	<iommu@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "kvm@vger.kernel.org"
	<kvm@vger.kernel.org>, "linux-kselftest@vger.kernel.org"
	<linux-kselftest@vger.kernel.org>, "patches@lists.linux.dev"
	<patches@lists.linux.dev>, "jean-philippe@linaro.org"
	<jean-philippe@linaro.org>, "mdf@kernel.org" <mdf@kernel.org>,
	"mshavit@google.com" <mshavit@google.com>,
	"shameerali.kolothum.thodi@huawei.com"
	<shameerali.kolothum.thodi@huawei.com>, "smostafa@google.com"
	<smostafa@google.com>, "ddutile@redhat.com" <ddutile@redhat.com>
Subject: RE: [PATCH RFCv2 05/13] iommu: Turn fault_data to iommufd private
 pointer
Thread-Topic: [PATCH RFCv2 05/13] iommu: Turn fault_data to iommufd private
 pointer
Thread-Index: AQHbY9mMQKJM3+xWnUiAmabYLU/PVbMkMaLQ
Date: Thu, 23 Jan 2025 09:54:38 +0000
Message-ID: <BN9PR11MB52760606D49DAF6ABD86835A8CE02@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <cover.1736550979.git.nicolinc@nvidia.com>
 <3b26ce04e8ecb5e47f028fe5cae48e5235e68420.1736550979.git.nicolinc@nvidia.com>
In-Reply-To: <3b26ce04e8ecb5e47f028fe5cae48e5235e68420.1736550979.git.nicolinc@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|LV8PR11MB8722:EE_
x-ms-office365-filtering-correlation-id: b5bbdd38-d8d9-4020-3bcc-08dd3b93f39e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?w3sq5/vtNEC85rqR8jNes17LlOQwfyxhBLsRHireuKl0oZiEZBByhHXQBgei?=
 =?us-ascii?Q?v55A433nBnoTz+DWTm+hh5BqO/reC2LYohkSsA4ZwY5YUl7LWcNqPtVPMGHm?=
 =?us-ascii?Q?fVtEyaspGvxbGeMmjN0nxx9YvxbjDiiVJtYfOtTby0I4su0R46BxzzTVoEA8?=
 =?us-ascii?Q?vh4Yi/qo2YWbNXk5krmSB5iEYzdj4pEmS4A4pxTATCBE4Tup4MXozDX57u8x?=
 =?us-ascii?Q?HxMLob8IxbF3RLP3wNgkO2+Vvlq5w7+hIBedmFIFz40uUha8vvFsdK75kcpH?=
 =?us-ascii?Q?MQJOOPyBOsZ0IrsCrmkwtytf61ghuwurNrW3+mGJdkUhuk63PRvWLXkWnL4D?=
 =?us-ascii?Q?Z4X9npyem2dN/NlSP3tdE6N0QBdH81mUyPAsghPjTjcC+wvexO2GU6R4G3U2?=
 =?us-ascii?Q?wmbBfs0oj3aYcN8KzYEi3U1NygVYU5fMgmjPcbxnuIWlTksGvpShJzL00/Di?=
 =?us-ascii?Q?WOUW9XE7x/5utbehUopT4mTJxxVqw1w3dY8PU/t1wwy/P15Ebr32jL+EoEdB?=
 =?us-ascii?Q?dCpe/tBLfYJKtCxNlJN3LuUSMvIsrvz22Hb8wE8oP/SFuHL9ABBhRuAp63mE?=
 =?us-ascii?Q?1py7lubr9u6C3+6pnKQjLarNsOWpCrEtBq1vty2CgH3CSkhUVbF/JBqnzNmM?=
 =?us-ascii?Q?/oAHuN9G/PB3A0cimw41SreZFf7cs5DHLTl3RVjenFN5qKGYpznU4t7Tj773?=
 =?us-ascii?Q?WSAsg9iCVEA+4vxgC3bHq5XviNwhkxEVOUmHLul32lguapcH4oWA/m3ktzmy?=
 =?us-ascii?Q?JaEWFLUTWvDKirQIs4wuQST1jdtY7d67w8wyBRdfy5Z80w6FZhuRS5Pl6S4J?=
 =?us-ascii?Q?B/QbHtgwaZYRjwLDB8QyI9zZDyQPDwfFrYDvBTm/pQypTtUVain+u4OxUJca?=
 =?us-ascii?Q?CT1cgKiP5f44O6GLl6e5nYX/tsEFPvw2AuZ+PHGa96Ee9jb/9zoGllE+wwR+?=
 =?us-ascii?Q?xd+tBJ0EXe3ud3sUVFvrVUAiJc3/82wUm3PsZv2anGpM8ajSewk5oUeov8zo?=
 =?us-ascii?Q?cU/Zn5+/sVrVg5RTB12Ae2ESVNd04FzAkuoQq96D7DkagHboWZzOn/i2vKbc?=
 =?us-ascii?Q?8+SHZ0O8XjDPcupRjlIBkUlzbdZfdngp8f/S3ClLRl4QA/LG24KayAswHw9V?=
 =?us-ascii?Q?Fik94bFltefh8DQoxQ6HaSh3wT+zJEPgeG/XxdMSBqknJ9BuHLlfIEqsCAGj?=
 =?us-ascii?Q?9XYYdBJPxBpk4AEmQ/SagoaNVuSx9N5HZ0D0AV/0mKWqLgXx7CNE+KgA7lKY?=
 =?us-ascii?Q?d0Hh466IB1ZZRus+HimlikZsZLROJh0yxrggdoXm+AkNHcp1xdHUER3/peCk?=
 =?us-ascii?Q?4LJM4NZD/iqYq44m8wGnRFgE/v/Gtr7j/3F5ffDcOerPomd8UX/OMmF42/Mt?=
 =?us-ascii?Q?mrrRte6S2DaABq1dWPLDBi+mVazNQ6RbIAYkoqTWML4l6e7jWbH/n/gscjl4?=
 =?us-ascii?Q?9iYaCZxFwOeKkA44bO6dwjJtnZSPbqRo?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ERJByL/QD/t/iPsDN6ttqaJzKfBdZm3T3oZM0W/Uv0XvALGsIjFW/TaKAL7/?=
 =?us-ascii?Q?A1XUWvv9QlpILoiUlC/FwYcHcH3zip8tmBFqnDtOw3KIztvzH4qmRthhRVAv?=
 =?us-ascii?Q?+H30k1Z4ab9GhoCbbsAnXAKpO0Iy9gV34F7bS176T+Zhm5ej8UPwWvwS2InX?=
 =?us-ascii?Q?mqFGR6UdIbb5l/3pEAfEC4qn0arFIU+uIyp2cojicsoHlwi0FNjzQ43sP4G0?=
 =?us-ascii?Q?MHOvb8/maVmxmGxKCZnH84d+YQcTjzpiqi/vo6geDVdhVTFXNYvmvq3MK2Z7?=
 =?us-ascii?Q?Pb2Ygzd8g9MRcnC/8n/EKW0dFqil5NBocbWwjRe2C6UEXUM5XVusw3HX522O?=
 =?us-ascii?Q?8B2aSPtWY0uUPl2nl8DXgvyiQyl1hXp7+6htL89iL6N44qhmsrHwzDiL9Oez?=
 =?us-ascii?Q?ILMTcY1pThoZztEKBvT8271fPSE/x3KilJ1HLS7elbnyf8Nq/d5zNRhkM4Yi?=
 =?us-ascii?Q?s+NQkl1jAW4rykdRIFLk9AhobOtCzLzYjJD+SpGiaRlCzIota3uINRkDLG8a?=
 =?us-ascii?Q?qY0DUCc2WBhGsZTLBOCbSvIA//7WArSmlEEeo8aCpCzo7gHnv0ef5kbw3GlD?=
 =?us-ascii?Q?Re3rGqCnFIcZuKIUqGq9WEClJKZio3x9li2+53uoZqI6oyJLexkZrxZ/7Zz/?=
 =?us-ascii?Q?gMYZmlIhpBczszvlkHR8z5odYcWkkL8JdOhCAP8q1QnBe8NEytWrZX854WBK?=
 =?us-ascii?Q?y9XU/UIMXv+rUn0ogD9iiLFDebJda3hA6w8a9o081OBkC87xKQH1Jje4BCel?=
 =?us-ascii?Q?UyaOc3ohnhBPDLjWW74WDxi7vdxDk9N74UshticTTKFlOjlYoGgJHRtE96Mz?=
 =?us-ascii?Q?AApdXsILWMDWDLwPWbGd0JiV1yN9N25nfTw0vZmiOoY7OZU5LZZWzPNia3Jb?=
 =?us-ascii?Q?6hzQIrEFreZeye+lbjfIB6PJmW04qmGsbR6xkQvv0ERVg4hAyCWSGgxQtceE?=
 =?us-ascii?Q?u/43TVTQ2uEY3dSBPYtdfs0NqaObgrqMkl7dviVCHgsDxVUK6NWz6WLrgAeR?=
 =?us-ascii?Q?3q56pHyqhx2rMtvkxhw9/s/piTGIrgYTXLOtp7Zt5RQj6UtgY3MnI+wlH3xO?=
 =?us-ascii?Q?df3CN2C7lQJj2vDZRhhKnvzuM2jxwr8r+u+or90VJtKZNnk+0u5YSgqx6X5B?=
 =?us-ascii?Q?zNhRmcMLRNVaNmTxalJDr8psnK1U/rBde6jx+V2DERuJESxt1Wn1HCEXO1qk?=
 =?us-ascii?Q?pKoShx9tlhdaz4dfE5lWN3Xbn3zzQjnV0eAFR86chshwaKETK8+76vHXMRSD?=
 =?us-ascii?Q?BkJvp5iU0Rl00t+dKh5Vxsg0R6j8p0k6bXVvocfH9aBdjn8U+f9SqGHmSu11?=
 =?us-ascii?Q?fQSIk+eAjks0i6KPq3bNvFfhqPHXUDMRxjyUTWdwvmq3SWZcx1BMUKVRNkzU?=
 =?us-ascii?Q?issCrsDTu5PKNpKSuYAhwXvIEL10PTWfk0vBFaC57c5s/7qNP5q2uPMrlUId?=
 =?us-ascii?Q?3rtuuJCvarC/zSRPyLDmz965XVr/8CR6YEamPj/QGvSvyJrgZxF8XeqP1eKK?=
 =?us-ascii?Q?FrbapLlYeX0CZWe0Id0wxPshO/DUVS/VsrUnaIHhbuquYtCYqJSvZh6abwMP?=
 =?us-ascii?Q?cXrmLq84scROu0tXa91mRNpl2k9cnWRUAAn44gwI?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5bbdd38-d8d9-4020-3bcc-08dd3b93f39e
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2025 09:54:38.9558
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HdyHQm6dYiehcLPSD4YJlnoS+zgvZJRnjccGm9kNg6TGmM6dGP7SlaRU5G9jQybHrbYOuu+RZ/njG0j3sXAZ7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8722
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_015531_120618_36FB3D00 
X-CRM114-Status: GOOD (  10.27  )
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
> Sent: Saturday, January 11, 2025 11:32 AM
>=20
> @@ -224,8 +224,10 @@ struct iommu_domain {
>  		      phys_addr_t msi_addr);
>  #endif
>=20
> -	void *fault_data;
> -	union {
> +	union { /* Pointer usable by owner of the domain */
> +		struct iommufd_hw_pagetable *iommufd_hwpt; /* iommufd
> */
> +	};
> +	union { /* Fault handler */

hmm is it better to rename it as "void *private;" and let the caller
do type conversion?

