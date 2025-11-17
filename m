Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8B30CEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 06:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6L5CxhrCByBPF5SjKb/BO9Tww/1e/wnpYvKbQV8pAeA=; b=1iU7DtVQjrxZGYWrhnV4tJ+V9r
	3l959an3Plw9OBpXI/9qG8o/1y5NVjXPzcwh0G330lsn2RA0oMLyHiToObDf8sZcpe7+0lPaOFLu9
	pX4oNrRnZr+j9T+itJbhLMPl8M9RnAYktLsTj1Si191nt1EuNxT48cT4bbm2Z8hyNEcOcOuv+EeoF
	SrCAWRkoNzqoMrZanR8FWXBe/6xGtTLGpnh5rEp5kT5Fg2D/vtQP0uZiIcx93h0DIY8qOi/5KRz/N
	sGiL02xAQzfYu/hDJrHUSZv5jFmDuRduY+cr5NhL5/vwSEWV435XnI4hDwU65Kx3hZ3NzoZENGi8S
	RRy3HX7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKsrz-0000000FW28-3Gnt;
	Mon, 17 Nov 2025 06:37:47 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKsrw-0000000FW1i-2NLO;
	Mon, 17 Nov 2025 06:37:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763361464; x=1794897464;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=6L5CxhrCByBPF5SjKb/BO9Tww/1e/wnpYvKbQV8pAeA=;
  b=Jg7g3QydHa4V9HoAiOU80mpFrNqLy4iyT/73DdWSrG4mS+51BDP6gL90
   KcIMtuxL0N4eFWHHnRvNzMJ1A/q9rbSGFwuw4IA0L2i3PpL+A6Z/L7lpH
   YEadGQKGCGQVDJq2aJIRS8hD4DH7m+J7ENckqE3eTom7/f3jqgfPJmDLd
   IFqhPT+lIjx74Bth2CfpcpdngwdXYhre56IGVM/OUInAIc9TlDWuqyH6I
   11uGwPtQkszUehGv5lb7jZH356uFsy35LLKfr9TqyrLKvP9XUNhwBSrCZ
   1qwGCcXf8uInazio/3yzjfgz8p3GP9Q8bn0CzUkEaEqNUfoVG34n6XgAP
   A==;
X-CSE-ConnectionGUID: 3JXwmz7bS+qzlmsUtYE7/A==
X-CSE-MsgGUID: hERj657bR7GvmFOWhGLDrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="65254770"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="65254770"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2025 22:37:40 -0800
X-CSE-ConnectionGUID: vSOa/xKJQQWUnQoCoMb7mA==
X-CSE-MsgGUID: IROzV58LQJmWjkiNcaqZfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="195501634"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2025 22:37:40 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 16 Nov 2025 22:37:39 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sun, 16 Nov 2025 22:37:39 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.13) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 16 Nov 2025 22:37:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XnI3DK5Oac5Kzi9Tsh8iDIqUXXfdy0whXZo8Ga8dJtGXbCSpuxvudy+zSMymh1vof/NhIEIgTAJWfno+ceUeNT9Gd8xyGGKxP9RzB/5G2AsBY9x21Tpy1yEJDLfLNmxWT7EFPQPrGhPt4VnMBUP/wIA1+lQ+6PbCdTF0h7hTUd33+urHGpppaGVbD5YiahJO874iWLDV8joeZ/QKVJuA16B+yZyYYIi0tF0/VnqtVVXTcKDxOMR9yg6LSk5twLVi6wgii/l9pdl6Xnd/AvpN1hUDFuJd8Blek8iuZX9CeiuaJYskHPUM+hFquU+8u8XKbPOteegu3Lr5hp/LV+pSWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6L5CxhrCByBPF5SjKb/BO9Tww/1e/wnpYvKbQV8pAeA=;
 b=JkAqlaRUyiayDbJrujo5gClz1I158uW7taa2U2Z18B5KfvRJN9hI4fZk79fndReCLqwlzxm8z/e4e+WXXQmIAOI0w2loygU2ssskjYX6Z5daKq9LsSiuclSyCOESPRQ6vpazwnQclkHg1rKBHAL59qVNLGOxvzWP+b293j4fgd0QHjtOBEEiGMf6guahjSV3cpV4B47qYuai6jPWCqrjyxRLTaRiLPZApB1axDvXW3Juov0cxF8GKk07XMpw6knOpFjZcyPnNnTB5Frs0R3v97dA87S6FiMHVWObDmNilJGn44yXVgFvQzUExj4pqcHDr3XwFL3i1Dk0co9fZplgXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by DS0PR11MB6518.namprd11.prod.outlook.com (2603:10b6:8:d2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Mon, 17 Nov
 2025 06:37:37 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1%5]) with mapi id 15.20.9320.013; Mon, 17 Nov 2025
 06:37:37 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Christian Benvenuti
	<benve@cisco.com>, Heiko Stuebner <heiko@sntech.de>, "iommu@lists.linux.dev"
	<iommu@lists.linux.dev>, Jernej Skrabec <jernej.skrabec@gmail.com>, "Joerg
 Roedel" <joro@8bytes.org>, Leon Romanovsky <leon@kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "linux-rdma@vger.kernel.org"
	<linux-rdma@vger.kernel.org>, "linux-rockchip@lists.infradead.org"
	<linux-rockchip@lists.infradead.org>, "linux-sunxi@lists.linux.dev"
	<linux-sunxi@lists.linux.dev>, Matthias Brugger <matthias.bgg@gmail.com>,
	Nelson Escobar <neescoba@cisco.com>, Rob Clark
	<robin.clark@oss.qualcomm.com>, Robin Murphy <robin.murphy@arm.com>, "Samuel
 Holland" <samuel@sholland.org>, Suravee Suthikulpanit
	<suravee.suthikulpanit@amd.com>, Chen-Yu Tsai <wens@csie.org>, Will Deacon
	<will@kernel.org>, Yong Wu <yong.wu@mediatek.com>
CC: Lu Baolu <baolu.lu@linux.intel.com>, "patches@lists.linux.dev"
	<patches@lists.linux.dev>
Subject: RE: [PATCH v2 1/3] RDMA/usnic: Remove iommu_set_fault_handler()
Thread-Topic: [PATCH v2 1/3] RDMA/usnic: Remove iommu_set_fault_handler()
Thread-Index: AQHcT1zozTOGJgI4KEq8LgrX6rnJ97T2egOA
Date: Mon, 17 Nov 2025 06:37:37 +0000
Message-ID: <BN9PR11MB52768F201F306F13023AFE718CC9A@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <0-v2-25fc75484cab+ab-iommu_set_fault_jgg@nvidia.com>
 <1-v2-25fc75484cab+ab-iommu_set_fault_jgg@nvidia.com>
In-Reply-To: <1-v2-25fc75484cab+ab-iommu_set_fault_jgg@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|DS0PR11MB6518:EE_
x-ms-office365-filtering-correlation-id: 35381628-fd43-4b02-2c91-08de25a3cc64
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|921020|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?Mj3i0eIAnDMN8pXFURfY0VXOsrRkC0dvPPlOFRaemxbFDoLrf+Oe9dPGSmSc?=
 =?us-ascii?Q?90KL1vR/4daiMXouMbwx1IW8ZUNdvlqA6xibJP/QJupsK5J7iAP1hbPv6lNr?=
 =?us-ascii?Q?Avj8HFMf7AHj6900RQb8NQURVyPKhes7GVj3mWZvLclRw1L2sf9y/X9V1miG?=
 =?us-ascii?Q?E1+VE56xUI4aglHQxccR/hhySC+NJgbFaQIcL7V6cLMatQKZPFjDJLJaavUm?=
 =?us-ascii?Q?w2IxfQIvQAnEFtiB/hs+CKXA/SN6hH74J+M/l5g4ap/7TkD+EycZ/UmXxnfN?=
 =?us-ascii?Q?AGy1oEglYMC2SNA00jnITb33q/NR64L4uQMKVqT3gRHSsKbMu/siFKOQG3lJ?=
 =?us-ascii?Q?O/ysl0pZGVC15odHBiTndevJoUY0sFwgCnepg04fbMWfIg+wUAFgdlTHlQ/J?=
 =?us-ascii?Q?cJfyE4IntlXNHuy6VX17F+vsjT0JknzdLy2RUyO06NJIsS93EQcCA8lVytp3?=
 =?us-ascii?Q?aeIzxA/FQ10JyWVYUnYzhyWYS0aBjVEy9yPRPkDLug/PRWOXQYHdWqKdWSz7?=
 =?us-ascii?Q?y0J16IitQpezLZ9YmMfSSj3yeoi3owYQWjeqyX2j6dYSbJJwgbXaGw5WIGku?=
 =?us-ascii?Q?YxP5Lqg+Bvp0xCZVVsEVjAIQQLW8jL1htUVc4WDG43M3Vuz8/YDDnss6+g/f?=
 =?us-ascii?Q?FlhZMB5IlUOKd61Z6zW5i0JpdtYd9hDPrl/q1uhUwpKxvx0TACKgHYrlSZG9?=
 =?us-ascii?Q?PTrr5cL5HCdglSAnOlNL1TBX3tz8d3cqhCD8TH7voPJDp47C9K6EE+vKA6Yc?=
 =?us-ascii?Q?AejOnt8YBUx6qKXTE85Vm7qE2OZ3zjm6lIZTmK6tF86XKEMkmpJ+1ZKIwfhS?=
 =?us-ascii?Q?LJQB0NccFrfISWseF+O9O8foLI4sdjsyaBUHBr3xV/ZbV2DYGhQ+XLM/EZKF?=
 =?us-ascii?Q?LQwp5rkAg6w5IyaO8TA8vRQHl+O19e1rSABgLicgXdyd7O/pGnzESwYQX2Ev?=
 =?us-ascii?Q?uIUFQD2fh5yJAqiLqPEpdQu06k3s2VSInz676mGU6/+eAc5tPyEov+Sim257?=
 =?us-ascii?Q?pDOME3WVPRPS5qm3loW7krUFn+/EYQidoV62qhSKPQPUNHpWtlXrt155H9Ih?=
 =?us-ascii?Q?PNeORuXSXMUjfdcbkkKVd7dmFcaNSwsL57sZ7alTg0g0UYpz9pIg3PevdRxd?=
 =?us-ascii?Q?EJmIbpHPC9crleYz+WWDygu5l3BDUUvEGAWmkHLzrpJJpt8E+OchsFbVW22b?=
 =?us-ascii?Q?oKjiSkIc3RefN8pUSaLcLwfbnwGQUggLFsT6cJiStTNKhGLhko7ro2dmArin?=
 =?us-ascii?Q?jeqydvNzfEtRy/QB7cgN0nOdtoyfviUexB/N6balq8rRZLPw5l4J5Nk4Zxgx?=
 =?us-ascii?Q?Az9qIabcjmgoSC02tVAhCJMJ0RaYg5dovTiVPKmhUX2VAQweLy5UH9WlHyYL?=
 =?us-ascii?Q?KHQaiK01pcf6iTgalQWoHUgYBJ3ftQPj9k4YZUjkLWa6wdKg1fWHSIJyvYnx?=
 =?us-ascii?Q?FjpsXCzwwloES8L4RguoXY+Qq6Sjzk2MvWRYMoqryKCUGLup3m51Bvah3L7p?=
 =?us-ascii?Q?xlFuSSnEDGDCXtyyuqgIAjGMsYCzkXn7pRK6nO9s7lgzPoWxY/Wpb/HfOw?=
 =?us-ascii?Q?=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(921020)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?PXIq2v60uHPlml9iqL0MsgTzEMlbr1aAxsORmbl6fJztIQvY2llo5mq5ERAy?=
 =?us-ascii?Q?iTA45AEauFTXGYWA4e0mqClARfyXs8KaRTiJflmxqScxC4xaUcB3gZWYcNs9?=
 =?us-ascii?Q?9t9khr2d59OtH4li/6HEU6ayJAnsakfloBui4C3yhsgJoMhi5k50AwC0hRy+?=
 =?us-ascii?Q?Qp8ze5C/u/VaWtVfZr7JBvXtkGSZn+1bBwhDO2HSLq+zBKYsybNyk+ZUwAr/?=
 =?us-ascii?Q?8OTOrDq2nOHWjeOA2fHVrr6Hx0BmRUzJikMgU0O2EweNEhE1O/6JqHP1rKmh?=
 =?us-ascii?Q?LWjbtGOP/7RHBwiYFDNEHJEkQE3jMEwPLlsh6lcpXMsdgOgB9c0rqcqIqlzb?=
 =?us-ascii?Q?OBpxxTF1kzrTWIF16YHbmTclp3bDzhR5v01Ss8C3p71EHd5m92m5jolyOOpE?=
 =?us-ascii?Q?jlmD6C/T1+IRWM6XJV4gi3mwv9gNVvN/9g5Q1h/UHFdvbPdpyXf6ytEFENuA?=
 =?us-ascii?Q?gBkvVmEoAAFUQklkSlmaXehDw7DBpKAzqMUNRuj3hwrbQyIhdt+QBe7/O7cK?=
 =?us-ascii?Q?eZBmaFLZjbgpUfxjIjimAI+4Rng1Ln7StUDhsTijOXaONwoLlDk5SrGPt3pw?=
 =?us-ascii?Q?NJT7ZBbobFAPX0Y1utwrOmCmnDhC2GpxUBghNsye4qcQUbquRtEOsHSdqoHf?=
 =?us-ascii?Q?FOwF1BbKTIQYRjFw9WUihq/BcLROvv8oGDPJ74z8GLp5h5g0VEUGFdLOtiL0?=
 =?us-ascii?Q?LDett3YRkAD21hyKg4vNkfKQPSglyjrRhsDnGB6BHOxEAmsxszfpIBInYcoY?=
 =?us-ascii?Q?7JZE5k4O0ESFj8ikhvsF6XBNDrpJy8H9dgyAd6ksFgiSeD3FlqoGzcTaee3W?=
 =?us-ascii?Q?/r02Yo08XLcGVXyGs28uX2fus94W2wGRWrwSneTRWdRLkNUfXzmttJ5ur/af?=
 =?us-ascii?Q?5PgZJQrwVeGwPcuw+qLbMWJcz/bE4uOnU7OdiXjivS4MBU4JLYr+C67kQ7pY?=
 =?us-ascii?Q?DSb/fPtgDxdl13W3Y6XmBcFSzlZwFbJxZVYbT+e7W5pqSR8r6G8ABG6+my1F?=
 =?us-ascii?Q?UtJuVnE/kMLFt4e/sbplKSrrEaGw2lkFy/0kuUGaAvKM7zhk9hZDg87XwSKJ?=
 =?us-ascii?Q?wmxh0gJXmVdsqwa2woOs6eNW2oTWrxy/w9+km2G+zEXLHYYedSSrB3Sa2NZv?=
 =?us-ascii?Q?AisxlfTTp0RDcjXcR9IbPE+QOWk1x0mKWgCxnibpw1vSQxSYbjqGDsM4Faqv?=
 =?us-ascii?Q?p+fmxbN9WYHcZFdJgoUCrGbEj+b11i4hIAMXqHI6RMdSfhl6nnMA56bSHQze?=
 =?us-ascii?Q?7cXzsyy4EnNuf4OwN3FOz7usT0tc3+1NbtgE/dUX3VrkLcxXf0900jhocJmg?=
 =?us-ascii?Q?OPk+5vDSNgQVxxtSiA7skSmGT/ePm93R0JbcWHqxbr2q63+Y15RJoq39YR1d?=
 =?us-ascii?Q?9cFyYp59dXUe4bu49lZYscyxT3RfzznlE2pny61NExMLgy0ylIdwQfSxxNBW?=
 =?us-ascii?Q?PqYQpFNhK2thsijpkRs6tu5Y3OMlLijE4LpgkF5NX0wtbGP5X59G0QtcGirr?=
 =?us-ascii?Q?Xk05z1t3vWYHyvMOyZ+HVBbH+ocUcLyGNoVFENyn/vj4a+OSptfZbCw2O9M4?=
 =?us-ascii?Q?guFqiQURsycottcGF2e7LncqpMMsydL8fgVA/bP6?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35381628-fd43-4b02-2c91-08de25a3cc64
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2025 06:37:37.2097
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P65BT/qHD+eM2O09yrV9TJvibmRfGjp+FNRUKRyd2xXD7IdqmXTwUyyHp3t+BH1/uABRmGrqWW3Mi1HxglMs0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6518
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_223744_652324_26D0B0B6 
X-CRM114-Status: UNSURE (   7.94  )
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

> From: Jason Gunthorpe <jgg@nvidia.com>
> Sent: Friday, November 7, 2025 4:35 AM
>=20
> The handler in usnic just prints a fault report message, the iommu driver=
s
> all do a better job of that these days. Just remove the use of this old
> API.
>=20
> Acked-by: Jason Gunthorpe <jgg@nvidia.com>
> Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Kevin Tian <kevin.tian@intel.com>

