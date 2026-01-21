Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9A57D262B2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 08:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Akrig6cZ3aUpU+V+djTN6k0ue1VWCyTFtewMGHSKx+Q=; b=0ixul0MeXEx8yH2+SOCUrf5Dnt
	OF0PzK2yEKcmgC/iG8Fxb4ogX0tlmi1/hhV1273t2AWYRSyGREFyisF6qHTNTnWqsCS0LjQZx1D41
	i730yupJkS+HPh+niR7Jw4LjYX+k0WW42tvu6X+wBbjIlmrRlyigk9XinDbKldHZLXi0FSkVXMmf1
	2kfdVx5zuf3w+dGq3KUm6+FC5LvZD1oQix75SVTHejGTmFQL2dZckGNz8c6oONHt4a2GIcl3JdYeG
	+qLfzfqlhmMvkQcP8KJUSphF/k8OSLena0vfHW7yBNoYjtdNqQZAYw8Xnp730zCTPt9xfV8hyrd6M
	MkV9CSjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viTBJ-000000053Om-1MOO;
	Wed, 21 Jan 2026 08:03:13 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viTBF-000000053OR-3n8L
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 08:03:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768982590; x=1800518590;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=5Zkff52/GtpKhwQljL9mLyXaQRUrBdT5k6tvDE3e9bI=;
  b=RgYH1LBuBWZaKhJvdEWuCGZ0E9btSuVHkBsPP8p1TlgfkM/W1GE2EkvR
   kjciDoWQ8I89mkVV9JzOKJDd4ZHoV72OxrRP1QoPcEMenE3NuSwkwJIor
   LVKbGkgsSFUqabjwmukaBaZF+xsAavbjKeGnQ5fpMfZ/9QV0gvlbvNLCB
   vq0wuKY5RTOGKy2U8F3zntp3bAaNG+BUl1b7jQRJ6A1DUV/brAoc5nFLZ
   hOCGztZQGkcosXOFRLWX2l/R8Bb2bS6A/5cupCwSL15JOJ9HsqAaefTTk
   kkzHe5oSZLZZ2+T2H+NWfThC5UFQKYOqX0scZ47U5rccz5pc43uZ4RrBB
   Q==;
X-CSE-ConnectionGUID: kW/kKY6iR4eUOgFkMie7rA==
X-CSE-MsgGUID: HYwgHd7hROOOBL37UhLkQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="70176640"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="70176640"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 00:03:08 -0800
X-CSE-ConnectionGUID: c20GQlgjS8CEiLYAQJgErA==
X-CSE-MsgGUID: TROgJs3PRkS7DVKrVjknHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="211401246"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 00:03:08 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 21 Jan 2026 00:03:07 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 21 Jan 2026 00:03:07 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.69) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 21 Jan 2026 00:01:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=brMp/wBlFLyIifCGXUku8HBpZ9ylthxaMy2fiMmvrNABnJpkA1aqZ9XunwqeNdnNysdA7G6li+6Pc8obbNschgh2eXcBVc/THX1BVmvQtJVrAAbI97iSApQHuQrMBIHe7r9smgRi8PvOAN0ZrN41ZWiYJcWCxJjfIBbIJ5Bu9vkvZP/f1kUHGVmREZjE2EP3Y+ih9Q2yvzWTq/Pal+fnjuCUsa1s1aolQIDTktL3tOMw40DqLfg9uKf+004MhcZxa+LkA1xBbeUtEQvG4hpjklTO9a6RRIuGtrJI4MSkIUVRrxfJjlSci0u4QiYALEEIoOUS36iksfz+krM0bwBjXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Akrig6cZ3aUpU+V+djTN6k0ue1VWCyTFtewMGHSKx+Q=;
 b=rDWEdcCknl/eAB5D6A3qzbdYtmCKyQBLbXcO1e2XqyDbYl7uNWY1bcs1udUoUI/JXmDdF6o6nsrNyXm7yokl5OgSYBtf57KZHGUxOWmtUaPkelqGlI2HOh1isu3YGi1PP1Qf28yc5pAhDvIn2/ewRXHo+kJMJLE5yTxv5OkWifrNpHNX/KdUc0gkjiRoSAxITRu8spwLhU2EeCbS9Vk9WsPDnJ/ayiKA5VLmbzQ8K8YL846s9RrvkjWJmvzgorQn+qe3FMTQ1RTZBl3ppYLq38rD3/tUXheVMHZDMxTIT9KtdtGRvJjt4zjIwNEcxhnXtXh4TiBw/1crkx/plcDbag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5271.namprd11.prod.outlook.com (2603:10b6:208:31a::21)
 by CO1PR11MB4818.namprd11.prod.outlook.com (2603:10b6:303:93::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 08:01:36 +0000
Received: from BL1PR11MB5271.namprd11.prod.outlook.com
 ([fe80::780e:4379:6988:f48b]) by BL1PR11MB5271.namprd11.prod.outlook.com
 ([fe80::780e:4379:6988:f48b%6]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 08:01:36 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Nicolin Chen <nicolinc@nvidia.com>, "jgg@nvidia.com" <jgg@nvidia.com>,
	"will@kernel.org" <will@kernel.org>, "robin.murphy@arm.com"
	<robin.murphy@arm.com>, "bhelgaas@google.com" <bhelgaas@google.com>,
	"Williams, Dan J" <dan.j.williams@intel.com>
CC: "joro@8bytes.org" <joro@8bytes.org>, "praan@google.com"
	<praan@google.com>, "baolu.lu@linux.intel.com" <baolu.lu@linux.intel.com>,
	"miko.lenczewski@arm.com" <miko.lenczewski@arm.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "iommu@lists.linux.dev"
	<iommu@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>
Subject: RE: [PATCH RFCv1 1/3] PCI: Allow ATS to be always on for CXL.cache
 capable devices
Thread-Topic: [PATCH RFCv1 1/3] PCI: Allow ATS to be always on for CXL.cache
 capable devices
Thread-Index: AQHch228OMA01jUUyEiv70mzhaALBrVcR9Qg
Date: Wed, 21 Jan 2026 08:01:36 +0000
Message-ID: <BL1PR11MB5271F0BDC68C2D7F172122E98C96A@BL1PR11MB5271.namprd11.prod.outlook.com>
References: <cover.1768624180.git.nicolinc@nvidia.com>
 <d1768bb6384050a23769f20ca28216f520f77e26.1768624181.git.nicolinc@nvidia.com>
In-Reply-To: <d1768bb6384050a23769f20ca28216f520f77e26.1768624181.git.nicolinc@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5271:EE_|CO1PR11MB4818:EE_
x-ms-office365-filtering-correlation-id: c1465ba1-c29a-40e1-072f-08de58c34cbe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?LHoJrerSh56ASSohFuC5wcvEezsf2g0CK4tK1sMXbB7ut1ziLNypsbDeJtmc?=
 =?us-ascii?Q?9MIpkQZSiX5TNWV2ye0jOZjcsSbjHbyQ0RblXs18tGi0z8NgStZ4jGwzeQp7?=
 =?us-ascii?Q?rIKm7zr9pDth4buHHjfDD5Xnd0vUd5ERWfV92h/OlTG+xwnOG2VZKaxRSpD7?=
 =?us-ascii?Q?XaXME70bFF/CNRs/Qww5nTKj/T11R0M41T3IM852ynMwceUyIgxAXDb6jeqP?=
 =?us-ascii?Q?c5NYN3GbkWlchUiLLHRw88xuNJO40Y1KNDlI1q+NZJZ2RxIEYoUdBTHkZbz6?=
 =?us-ascii?Q?YJU1nqm65oBDqUNiTFizGc5lA8AYykMeNTCh/WCWcRDJxQQH0mCahG4yEtfB?=
 =?us-ascii?Q?IFi80aJI9EZ8frTxJEZ/FUbww4kk9onC8UEYHtuzHChlGpYhDZDbTwBm+MA7?=
 =?us-ascii?Q?4YRtzBPoNacLMFdpGayH+g42NBK3gYcWW6mgyk3WsjL3VT4vNwcef8u1S91q?=
 =?us-ascii?Q?9KnsoYEhVqGpfmqowh7BPmGsWL8jSCIL+Crx+PD1STIMo9Ca98pur/r32A7U?=
 =?us-ascii?Q?bt6ksjrsb4ho3+v21XvLhaHivbE3Cr3TEZB1GjfJMc0374zsSBkHLAfHhCMM?=
 =?us-ascii?Q?5uOqc7nlyyjdKPzqFrYqMSYMEPlC7crwb62nJrMqYwk84poSQOdsDS8Jz86+?=
 =?us-ascii?Q?MHMzNSwM7ja7TMgHwK6JBeHJ41FEznpQ8TriBq5juLhr7Qsjpd3tSxxIUU8g?=
 =?us-ascii?Q?BdWH2uEBwL8uSGCx34DVs2N+6Nrd8yRearp4BDgp6VC9dkA6p1aO4bFAQCKm?=
 =?us-ascii?Q?CEeoZ7czqprd5LD414nsOjeEc/zXJGge35jh85A44mi2WrbujDdpS9wrAOSn?=
 =?us-ascii?Q?3wzOX3m9m23COI09u5cTkFoOA3dlXYBGfCrREJD5UgD9HlbHsPR6w8FMnVgC?=
 =?us-ascii?Q?utJUW3NP4KgV4F3UKnTum+M3WVB8faqlYTSb6IjyrE4fQ3dMy4GE6lJogK1u?=
 =?us-ascii?Q?inv8/0eRXAVSPaPDc3ENba2qcpXdogx2sBPqpIRK77ypuVJ+AvoyfnRLhmKC?=
 =?us-ascii?Q?c1dRRoBqwz8nrZf4X8G7axnstm0sbIy5qckuZNnlQtH6Lm/kM71DM4Op5GLO?=
 =?us-ascii?Q?efx5Ku796VVRav6DvMnbpsDDLiynKqebWqQy+iN+xvW9a/yLqCLSOAveHHe5?=
 =?us-ascii?Q?viNBYgHfgv7Fbx5aXe7Kh5BOQn/3JZRltuuRyKDD9zzcvqBBtukCQ8t/r9nO?=
 =?us-ascii?Q?Gk7M+4RcbgVnvEu+mBGFuvsaLPfELIoQS2i7On3A6zi1OA3WuJozgb4vq5uH?=
 =?us-ascii?Q?qWCwDFMDriUpRRYpw2DjW9tUc4bnKcRGw3N1Z2lAnXNCpgK7wpNN4SpLndoV?=
 =?us-ascii?Q?LD7Y61WpvhpQscK1IiB1834XzDYyxck2FkAZb7vnkBZZTL5F9XknGsfu3oan?=
 =?us-ascii?Q?BYVEe/0tSnulTK9TvBDDWgLGdE1A3e4tWQo7+usFiOoGeHV9LCQTfBm5eY6P?=
 =?us-ascii?Q?HivyrJ+L2085NTiDar+uQkDfNQKm/giaqyO1sszCmRI8N3fSUbtla3zpzcAU?=
 =?us-ascii?Q?3uSB/3Pn+hwY0aVeoGPBTDlnik3sNAViuQES2eUGN+WSDb9g15Zz+nMEMosp?=
 =?us-ascii?Q?PTywBLHmMIMhB9bSPEvq5qLD/GVZKbwBmyzfnOApq3kK+gukXtn5wkbTMwtu?=
 =?us-ascii?Q?IL5OXVybE0Cgzt9tsDiDXt8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5271.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/0h40H4FPnlsejREnFsPcPB1rghQm6wkIvyUG9Tzqwr969YfhkXLRQ9kGyyG?=
 =?us-ascii?Q?utRPSsQYln+j9oGffoNOtkL+f848AdNw5L64Qh5TjNn/FICOdCayaHEOhSaF?=
 =?us-ascii?Q?um7gYovySnLANDhk0I3EOusdQ2zWamXDjXb+C5Od/nThxOgi86xms5dHR5+P?=
 =?us-ascii?Q?SGV0/E/sVk1Uj1zjxOcUr4Dagjc+h1+nQSmek9rD8cP1dQmGAyLVmo9yvWg2?=
 =?us-ascii?Q?QFMcp+OOBitnE19hz7PbhtYcwBYmIKRsDQrRnKWjk6SPm5xQiGPVJWLx5619?=
 =?us-ascii?Q?lANNfYeOSnme/lJUd1kYbSdpmbIo9qeAZnVCFzcUexsZYqvm8jpzNHVbN13M?=
 =?us-ascii?Q?pA5KJxE0bUi1g3KqF3qEnXMoySXHx0mIEp4sbpC1ZO1600GWCYsBmC/MkOht?=
 =?us-ascii?Q?HEO9oEgSBBEOdMjORO8O/PKXt6BdzHSUZRlAFEsJti/NJNbhJ/vNZes3Lz+2?=
 =?us-ascii?Q?fvZKBbHjfeG/Th+jUcmbVxk1GLW7IAQulN9MPMKcF8j52GOTSaeWE7hl5ncA?=
 =?us-ascii?Q?SnqMEh0Nmlhhvy387tPxKe0WSoIfLoFQetWm1fk7fPhgDpNZetXfnzT7/ax4?=
 =?us-ascii?Q?kpkXiCMQrnOqbYtkv1NA6lwvPB6YTjgpJtbZ57CFO8sAOTnvSvKm4I+88+6p?=
 =?us-ascii?Q?fl0UFGojImbr9xK2QzBL5FvK0QxZRsAkVH4mwvG/4EgE3Vg3Cgvn+AlMDYd/?=
 =?us-ascii?Q?a+ePyTfgfo5VOiPjaEaPo3QI1g4Bmp12pCr3nUcSuJK7rjbt2tDhdBjQnVak?=
 =?us-ascii?Q?8snoPEvji5M0eY5qpnPzXR57ATolh+bE0BrzozFDRBenXQb9fVoELV+9pbxh?=
 =?us-ascii?Q?I8HmglOStsG16GeerPM+ZOOVDyfN9coFuN56AnvzHwdenKoReBwJzDzP3q9e?=
 =?us-ascii?Q?1IkW+XXAE2QV/RtWx0Vs+etNAREJHyaHJQTNlmWASjb+qwYuMfDBBEaDynB5?=
 =?us-ascii?Q?/58FOzkHnlVKnsy8m7garAga6lAwKFGc1fiU1m490E/N5Fs+d1CVEzR//dbZ?=
 =?us-ascii?Q?pbSHzvmJpaGc+tHN2xshE8UDP4RtAOJnMR/HbxFnQFc3pnsy1Q+Hkui6Q1JP?=
 =?us-ascii?Q?9GzvzEJWk1WyI/oqbaFue/HGh4DKwfLCzasVFdY+St1jTGcN36lhYq6n27lU?=
 =?us-ascii?Q?lvulSqdf5aU0B/bA0pM9Pp6MECOXR704AYE0uo2XZoUwp7JaDsVoJ+SDQbP3?=
 =?us-ascii?Q?W8e83JvtLUOvOroeqFVCavxRT8F6YtnimlSJ9iT/45Nkw9u4lljLDIUCiM8h?=
 =?us-ascii?Q?xTonFkb8FQQbgY7Yq4DMcYcK+zRRsD8WmWlfYMrrmwOTGo6Ihp8yqVqtXUxu?=
 =?us-ascii?Q?vUEYa9XswzCcAGILrBuDAVf7DS6+vps0S7P20GgaLjT3Ck1cZ5caVrMIgtk7?=
 =?us-ascii?Q?5BQQjpiUAVQymDLZ6d6rgHLv5xALCEM85cBWBqrJOTyy/4ikR8LUGd9MtwZB?=
 =?us-ascii?Q?rijLS/xgu6uHUh3/0W8rqW/nIecrhuOt3xd/fNeRraFhfSTjO+5jKhOU93BV?=
 =?us-ascii?Q?ja+sjmw+0RloIVDaB69dbR3y/GOZGtRjFKnnP2GqAPdqius4xkqANE0ajzxF?=
 =?us-ascii?Q?utyXc8hDaEKTdQbPZp4jc6pA0DrSUCOrpm4QdU6eKJ1jO/zHRH+Ni/UyPMpl?=
 =?us-ascii?Q?3JI97POcqP2mxT98z3WZBCe55EgR3LftOLPK9DNbD57gt3ZU+gkGuh4ud5jF?=
 =?us-ascii?Q?RuHoKJmBZrraJMjtgCxjgUS07GFeP5Vc3FOmME3fpBXGu/wDhdecPFAMaGSR?=
 =?us-ascii?Q?TQTBweee8A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5271.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1465ba1-c29a-40e1-072f-08de58c34cbe
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2026 08:01:36.2015
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uyeRRT/dXKqqCOrz/015mYxGKlWvI3dNTdj92jyGQwA11T4aEffVVuWp3kndgoylSm6XJ028zsJXPPX7UV5XAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4818
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_000310_078469_7582E284 
X-CRM114-Status: GOOD (  26.61  )
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

+Dan. I recalled an offline discussion in which he raised concern on
having the kernel blindly enable ATS for cxl.cache device instead of
creating a knob for admin to configure from userspace (in case
security is viewed more important than functionality, upon allowing
DMA to read data out of CPU caches)...

> From: Nicolin Chen <nicolinc@nvidia.com>
> Sent: Saturday, January 17, 2026 12:57 PM
>=20
> Controlled by the IOMMU driver, ATS is usually enabled "on demand", when
> a
> device requests a translation service from its associated IOMMU HW runnin=
g
> on the channel of a given PASID. This is working even when a device has n=
o
> translation on its RID, i.e. RID is IOMMU bypassed.
>=20
> On the other hand, certain PCIe device requires non-PASID ATS, when its R=
ID
> stream is IOMMU bypassed. Call this "always on".
>=20
> For instance, the CXL spec notes in "3.2.5.13 Memory Type on CXL.cache":
> "To source requests on CXL.cache, devices need to get the Host Physical
>  Address (HPA) from the Host by means of an ATS request on CXL.io."
> In other word, the CXL.cache capability relies on ATS. Otherwise, it won'=
t
> have access to the host physical memory.
>=20
> Introduce a new pci_ats_always_on() for IOMMU driver to scan a PCI device=
,
> to shift ATS policies between "on demand" and "always on".
>=20
> Add the support for CXL.cache devices first. Non-CXL devices will be adde=
d
> in quirks.c file.
>=20
> Suggested-by: Vikram Sethi <vsethi@nvidia.com>
> Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  include/linux/pci-ats.h       |  3 +++
>  include/uapi/linux/pci_regs.h |  5 ++++
>  drivers/pci/ats.c             | 44 +++++++++++++++++++++++++++++++++++
>  3 files changed, 52 insertions(+)
>=20
> diff --git a/include/linux/pci-ats.h b/include/linux/pci-ats.h
> index 75c6c86cf09d..d14ba727d38b 100644
> --- a/include/linux/pci-ats.h
> +++ b/include/linux/pci-ats.h
> @@ -12,6 +12,7 @@ int pci_prepare_ats(struct pci_dev *dev, int ps);
>  void pci_disable_ats(struct pci_dev *dev);
>  int pci_ats_queue_depth(struct pci_dev *dev);
>  int pci_ats_page_aligned(struct pci_dev *dev);
> +bool pci_ats_always_on(struct pci_dev *dev);
>  #else /* CONFIG_PCI_ATS */
>  static inline bool pci_ats_supported(struct pci_dev *d)
>  { return false; }
> @@ -24,6 +25,8 @@ static inline int pci_ats_queue_depth(struct pci_dev *d=
)
>  { return -ENODEV; }
>  static inline int pci_ats_page_aligned(struct pci_dev *dev)
>  { return 0; }
> +static inline bool pci_ats_always_on(struct pci_dev *dev)
> +{ return false; }
>  #endif /* CONFIG_PCI_ATS */
>=20
>  #ifdef CONFIG_PCI_PRI
> diff --git a/include/uapi/linux/pci_regs.h b/include/uapi/linux/pci_regs.=
h
> index 3add74ae2594..84da6d7645a3 100644
> --- a/include/uapi/linux/pci_regs.h
> +++ b/include/uapi/linux/pci_regs.h
> @@ -1258,6 +1258,11 @@
>  #define PCI_DVSEC_CXL_PORT_CTL				0x0c
>  #define PCI_DVSEC_CXL_PORT_CTL_UNMASK_SBR		0x00000001
>=20
> +/* CXL 2.0 8.1.3: PCIe DVSEC for CXL Device */
> +#define CXL_DVSEC_PCIE_DEVICE				0
> +#define   CXL_DVSEC_CAP_OFFSET				0xA
> +#define     CXL_DVSEC_CACHE_CAPABLE			BIT(0)
> +
>  /* Integrity and Data Encryption Extended Capability */
>  #define PCI_IDE_CAP			0x04
>  #define  PCI_IDE_CAP_LINK		0x1  /* Link IDE Stream Supported */
> diff --git a/drivers/pci/ats.c b/drivers/pci/ats.c
> index ec6c8dbdc5e9..1795131f0697 100644
> --- a/drivers/pci/ats.c
> +++ b/drivers/pci/ats.c
> @@ -205,6 +205,50 @@ int pci_ats_page_aligned(struct pci_dev *pdev)
>  	return 0;
>  }
>=20
> +/*
> + * CXL r4.0, sec 3.2.5.13 Memory Type on CXL.cache notes: to source
> requests on
> + * CXL.cache, devices need to get the Host Physical Address (HPA) from t=
he
> Host
> + * by means of an ATS request on CXL.io.
> + *
> + * In other world, CXL.cache devices cannot access physical memory
> without ATS.
> + */
> +static bool pci_cxl_ats_always_on(struct pci_dev *pdev)
> +{
> +	int offset;
> +	u16 cap;
> +
> +	offset =3D pci_find_dvsec_capability(pdev, PCI_VENDOR_ID_CXL,
> +					   CXL_DVSEC_PCIE_DEVICE);
> +	if (!offset)
> +		return false;
> +
> +	pci_read_config_word(pdev, offset + CXL_DVSEC_CAP_OFFSET,
> &cap);
> +	if (cap & CXL_DVSEC_CACHE_CAPABLE)
> +		return true;
> +
> +	return false;
> +}
> +
> +/**
> + * pci_ats_always_on - Whether the PCI device requires ATS to be always
> enabled
> + * @pdev: the PCI device
> + *
> + * Returns true, if the PCI device requires non-PASID ATS function on an
> IOMMU
> + * bypassed configuration.
> + */
> +bool pci_ats_always_on(struct pci_dev *pdev)
> +{
> +	if (pci_ats_disabled() || !pci_ats_supported(pdev))
> +		return false;
> +
> +	/* A VF inherits its PF's requirement for ATS function */
> +	if (pdev->is_virtfn)
> +		pdev =3D pci_physfn(pdev);
> +
> +	return pci_cxl_ats_always_on(pdev);
> +}
> +EXPORT_SYMBOL_GPL(pci_ats_always_on);
> +
>  #ifdef CONFIG_PCI_PRI
>  void pci_pri_init(struct pci_dev *pdev)
>  {
> --
> 2.43.0


