Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A29FCE7A9A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 09:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O85PgefVpYqQFI5phBz+aj2tQ9ZmNwXQIPktpqdv6k0=; b=p8NJhCXGWGbLJTIG6N1mlpixmT
	XVjRZDrJsxG+sWlxeq4oZMRmdYhGNzYf6QrcGIcYj5JTiqsolGCTr1EPtyTpCHKLLKopJyFHzvZjb
	0C0qpFsUP0/rP6DK1xK9PcqJUeTdsq70TA6A88qUaOQ+NQ5WdtlFOpm9nv0GJmXDY1MdsXsMSzj/8
	0RMCfGqDUVjNBpKAbE3QL+t/k1dEKTaJtXMelBUy7VLwlvZd94vtQbgfqw4uY3e0GPNh544F6q8+V
	DZ1nelW1lLb1stAG3FWFYGPEDRMnwXtcNrHC7kAwSzhD3KFrNoENPcmviJsA7FVWNKKn/9R+0jyz7
	2i4JpcAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJpw0-0000000BtCZ-0Wi2;
	Fri, 14 Nov 2025 09:17:36 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJpvv-0000000BtAi-1Sw2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 09:17:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763111852; x=1794647852;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=O85PgefVpYqQFI5phBz+aj2tQ9ZmNwXQIPktpqdv6k0=;
  b=K+x9jQJ6Ds/LT5mZCaL1v+93o4rVgmiIFhAPoGszvDaG4tYGdPYjxL2T
   rep0/pXUqgmClq+UTRXIE0/hZgdbizK0cAmzund35qS9hYccRao8ABu+M
   8PfiEhLMm4iGo10cUE4XCIUosrfASXZvCDCyjYe22OLoDK0ULWpJm2dxu
   o0TKA5sC4zqu0ek/J64XGppx73LMy0q2w2izGhZcST5K++NFpfsYsTf5v
   X9O7dNonjzQJq6VfZLLyWSVLJKJ60mXdTCydUy/01zhevC8q1nOiBuVG6
   MdrI4aoEGP4vx50bqjHSvjzHyMkmfB+QQneMmPfkHxFJEuSiV++eF/Y9o
   Q==;
X-CSE-ConnectionGUID: uz0bJ2P9RKm71BaUITLXsA==
X-CSE-MsgGUID: a8EBreoKTTO5GRR3nYfxyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="65238955"
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; 
   d="scan'208";a="65238955"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 01:17:29 -0800
X-CSE-ConnectionGUID: +XHbhN9dQuiVA0k/AwqoQQ==
X-CSE-MsgGUID: GWYpm4fvTSSVT7HyXxiynA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; 
   d="scan'208";a="189751051"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 01:17:28 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 14 Nov 2025 01:17:27 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 14 Nov 2025 01:17:27 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.33) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 14 Nov 2025 01:17:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YPlykca+a1Ut8XdKDPPl1mietcDUw5cSwRG4FGLEh5oqNCii8cjX9AHd0Uv5rVqRmJf4V1kfxIxqBMyGUdy2TYLltisYQgGV8sUHdLB554FP9n/n/hEM0/TPQHAjVozWU3JRzc0xurqHe6Zuax/hk476318AYVX+Q+t/fbYQAhz68rswqDiatc/Y9/TL8Fbtae9HeTNdHrEZU43X7S6scQRGiENtMVgqBmSgvLcYQIbrROH09PmOYEL079mmT0hwp+LUBGIPc2lFP57dzR6kMqD1216LNBperd21r/dYCmQ02HMW97op5cHeV4ZPeevGWtJwVIZDAqmPLJTkooRH6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O85PgefVpYqQFI5phBz+aj2tQ9ZmNwXQIPktpqdv6k0=;
 b=WvTPwJPvb4W7v0fLDyuF5AWRdS4kdsrcjYJoAP29xdhWXnbwpmG8MhkYZFV/L1yB3976fYPvsjhx1aGCyMY6/KXTu9XUmw41dq0d+LH4uT3q9IcUNv48HdR+ToSdmdvKGjWG1E/rXUnBkMKi05MOuhqAoA+UjW+ZIEsscVYeqc8jF++W5NW7pxr2H/oWCyleRiQiFTBNSBQ1x1zdoV4ferSWZnyuzNlX1tUBNSqbFHryeyv6vCWuiN17Y7Uc6yChoHvC2f+RFknS8yfEb2uX4iFaD7P80xKNU9E9SjtqaSXROOY7tl+a7TeKsaYgz0UKODlyxwFLcv+qnfXb62ZWxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by IA1PR11MB6514.namprd11.prod.outlook.com (2603:10b6:208:3a2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 09:17:18 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1%5]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 09:17:18 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Nicolin Chen <nicolinc@nvidia.com>, "joro@8bytes.org" <joro@8bytes.org>,
	"afael@kernel.org" <afael@kernel.org>, "bhelgaas@google.com"
	<bhelgaas@google.com>, "alex@shazbot.org" <alex@shazbot.org>,
	"jgg@nvidia.com" <jgg@nvidia.com>
CC: "will@kernel.org" <will@kernel.org>, "robin.murphy@arm.com"
	<robin.murphy@arm.com>, "lenb@kernel.org" <lenb@kernel.org>,
	"baolu.lu@linux.intel.com" <baolu.lu@linux.intel.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "iommu@lists.linux.dev"
	<iommu@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-acpi@vger.kernel.org"
	<linux-acpi@vger.kernel.org>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"patches@lists.linux.dev" <patches@lists.linux.dev>, "Jaroszynski, Piotr"
	<pjaroszynski@nvidia.com>, "Sethi, Vikram" <vsethi@nvidia.com>,
	"helgaas@kernel.org" <helgaas@kernel.org>, "etzhao1900@gmail.com"
	<etzhao1900@gmail.com>
Subject: RE: [PATCH v5 2/5] iommu: Tiny domain for iommu_setup_dma_ops()
Thread-Topic: [PATCH v5 2/5] iommu: Tiny domain for iommu_setup_dma_ops()
Thread-Index: AQHcUsn/bIFO4rV/yEaS6G9uu/urhLTx6Pcg
Date: Fri, 14 Nov 2025 09:17:18 +0000
Message-ID: <BN9PR11MB527641B9EE927A2434D53D3C8CCAA@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <cover.1762835355.git.nicolinc@nvidia.com>
 <431cccb8279eb84376c641981f57e9ceece8febf.1762835355.git.nicolinc@nvidia.com>
In-Reply-To: <431cccb8279eb84376c641981f57e9ceece8febf.1762835355.git.nicolinc@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|IA1PR11MB6514:EE_
x-ms-office365-filtering-correlation-id: 370c4c04-d408-4284-4bd8-08de235e9bf8
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?c7qkrdCc3kkWKwWS4vGmWSr4MA+OOGF/rtBCvI80yq71gDpF5e4RlRpvaIrS?=
 =?us-ascii?Q?laTi4KVBK9mAaD9dKI+A+3ntY18p4y5qvXRdaShFDAhAjMYWwiL57k4xZdG9?=
 =?us-ascii?Q?LcQOLje0SnhDesSD9FbaJlJQSDxO5RZ/XcLEffxsHYUzon46PW3EY8Z/k3/n?=
 =?us-ascii?Q?+3c1YX+/yeLgpHOZvT97UhiEDtjEbn7hwvV20bZXywwr/zs1knw54aeEe4R3?=
 =?us-ascii?Q?dOcLMWn7oSVibqjFeDmE29SA7K2EEr9fE0cgRJMbBLUtz1vNUVdWmkH3Mude?=
 =?us-ascii?Q?tn6PrFcUShCV9bMN2XVodXP+iqw1Fky1D3l8Waw3grzjrGmdPo2fSi3GQKDQ?=
 =?us-ascii?Q?nSluFpe8fIZWPBAwA1C2qLu1XS+txSquDQQywyd3yCcB/s3V1iCUsvuk/VD2?=
 =?us-ascii?Q?H2SSrPqS5qKBkkw3Vk+VoKRu+nd8W7ZVBu4gR7Cg2fQX6auwUewpi262mrgC?=
 =?us-ascii?Q?BacHtEeG4h6tZu6TIfra71+zGp5H/Ol1vtGKYJYNQf1bM/Y6RzkRgXRN4+dX?=
 =?us-ascii?Q?fL63sby7S4jH01tPE4BPqYmfTaiut1Rvh1UlHudxa7fdqiYnWnSW3Y3aeir6?=
 =?us-ascii?Q?bwsntS1uoAV4sPVyDkyBpavCUaKggcMTtT/FOlonIjN+DzucEeXlBio8rl5/?=
 =?us-ascii?Q?5VByXpF64MdLYK24Y/E/NyYgTTtgh9DyfeBx3IZhN10X4ZPFPf5zaE8DvF5+?=
 =?us-ascii?Q?kVSIi6Oe197qf5QroHLJiyJzv2DhBbrEcyGBtWPM0A/8r4WWxaKSMQzk/Ere?=
 =?us-ascii?Q?Abeu0EKXVHbli12aAs/Z7YtV8JNy7MbfDx0/WtB+DSzDbXvQykXQHdkCvLQx?=
 =?us-ascii?Q?/fCfXGfCfYeQgdnCkGYucEEuacJcPCsBfXDi/I/hCP0VKnYbRX6HP26JVQsc?=
 =?us-ascii?Q?OUQELhZeT9Qp1l4uE18zb0XR4qm+JYIeyU4vjoaeCyAgHg4LVby31NxJTQgs?=
 =?us-ascii?Q?s8cRZ0BC9l4HH0nQgpxyTrPnqneLioFECH8cSarvkogP6Ltha1D53vmnDeMz?=
 =?us-ascii?Q?yhCPKWQHm7ECPGAdHbPZMHt6r5HqkI5yhrmeRuM+IcvfoaIdupOoQgopDxp8?=
 =?us-ascii?Q?LSJOlxR3GASJlZZ536CxyLDV/Yb9qr9NsTa6hhJxADAm1P1z2ifafQj1pzlD?=
 =?us-ascii?Q?gaVoGElU/IdQtoPxLxofNMF0umRLO6ihLS1j2PhGhn6a1ptGVw1RkAolPReY?=
 =?us-ascii?Q?rMsOGHsnsRZOHgQSt2M9Dlk4A3kauiZAV2MWr6raJvOoQXQcTas7BosnWDKh?=
 =?us-ascii?Q?f6c9C+WXo5R3zWhBBY1LBZ1hz6Dwm9ckET6wrVk3Y2Se3FoDvWBVe8k0ZF2H?=
 =?us-ascii?Q?QZPEssM9/fyth0XyG/bD/N+OvjRpEYn66u6d/Q16jQ7AaJuImThkiCRxeza0?=
 =?us-ascii?Q?3YGgMC8OERI+V9inEfnxLrydgoNZkx5gnYXIZPa5n70muBOe1Da61GKCC0eh?=
 =?us-ascii?Q?UsinoueCgqL6foxCAJ2S9EvfayFjXvl/niHeW++17vCeGR2mTPuc+94Niijj?=
 =?us-ascii?Q?N97CuMCBevPsDWxB4AcHeWOBQhE3Qt6JPqWO?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?wRG2JLERaALzft/m/1EmUGLcIBEZNZfLSNjYcpH+a4l7CiNSPI74hlJ2vwS1?=
 =?us-ascii?Q?/7BAuc8y20skABnlnkWw4YE6rVTmWbql9UiMRniJQcXGrb5nJAfb5OKoVbjU?=
 =?us-ascii?Q?gOjuLW05StwmkHvyxUGOvLK/6oSXZiFUUfw/yIMdDuVPlzuWQsBP2Fz4MFFG?=
 =?us-ascii?Q?R8F3RMHSUe/HKgAYXLro2hreTq2gL4bTz1d0yJ2N6hIG1kyfCGINETEnYTQE?=
 =?us-ascii?Q?P7nh6ihWltpEl+sKV7SJ8XOeMFOYkYSWcMdvZXyRTNzTSyomNHTN84W+Y7Ln?=
 =?us-ascii?Q?NYTfu68n2GwJTVTwl8NYHS6Dbz3xRmzICvKm+8GGcyhdbbAdYJ8yxMPTX3J1?=
 =?us-ascii?Q?N8x46HM+eTXsFSOj9QVNkJpZhhPZ3wqxt+FjI1U1Hre02zMZXL6+0HwzyTUe?=
 =?us-ascii?Q?MEwyyJue75reiXoNs3uq3ByAxpKCP5D00++zaIZXAeM91n+Ebgxfad6LKZKG?=
 =?us-ascii?Q?ai7BOnFu8eJTs3/o+X9Qdb7TSxR4wYditD1Jm3uQA/DzuoTyLLzy6CAsjQgC?=
 =?us-ascii?Q?f27hvaKUD4Nxfo/7LSCS6Zb3fuXowNnx4cAHwDc5BOoVTRuGqdOa0CLkuGt+?=
 =?us-ascii?Q?A8bNQWRb7QVSLwOAA31I1iA4xjE4bQR8q9glRYD7rAkTjkDQUVb3HwZNTPKj?=
 =?us-ascii?Q?ecny+0OEOtAMYeiSGedGN8wpOV+EHSZKSoiXyaOwFiVlyvcpLET2B0jVFoew?=
 =?us-ascii?Q?F2o2/JfEqrvTdxkMFaMVV8zk57Qh4j7lzDZCd6CaKurSWOoAri1cnFIMXqT9?=
 =?us-ascii?Q?8PSo53bInFSliw4FjC5yqAeeTcPjKqAUMFsmDWnNbEFyTLVfcO0t0ZMvEXKT?=
 =?us-ascii?Q?EUHWTS3e/UlELWiom7UE9jmAMtNHfEiADxU5C5V2ABySclBz9RrwRxHx+VHc?=
 =?us-ascii?Q?xMeabNqZCDNy+1yogwXeyfksV77FpQ3YYk8P/HY9ON3ar/gmx4chag4+mNwK?=
 =?us-ascii?Q?wamxyQtInwUHhoh8IeI+Gp1My0Tb7ou91+9/UoASYAAvhTliJom3NcT/nb5s?=
 =?us-ascii?Q?twJOykbzSL1H4sfivx8wvzhk/volhvfwQvr7pOCJykKgL0KgVQKOVgknMyeH?=
 =?us-ascii?Q?Ta17xjs2HCNE1zaW/a+m5I+tP1wrOZo+ARJGcoOO6drI4X5swHZ4AgPguS3s?=
 =?us-ascii?Q?S5HmDIe3cPEN390FUtLhSvGPA/GOvBYVz0UwDTCJsROa/HsJZWuV5yjiHW/l?=
 =?us-ascii?Q?SCexLGDRhKF9+/pAaUA9bwXcCNlYlfJBku6DylwhPp1rbg7okE/iNgX0x2Jc?=
 =?us-ascii?Q?lSKxHC7Q2koyK8umsPcGCK0YHfk4uhDQtcM9XnA2PCyUHBWkysrdmGabMFSv?=
 =?us-ascii?Q?35XtwCZZxeend8hn/pZmX1uTpbX0aUeYnv5qY1Y7Y7rmygkh45vJqMKdbfJK?=
 =?us-ascii?Q?Wyu3bX5skft17McwKnpFuhwdMa4VoeOnKpGkUjvK/fUZRLG+LhhqFoO60QFS?=
 =?us-ascii?Q?oi5RP65q+42wyzH6eOcSAlAbvDyHpq59rRRBpE6B9aFoRBEWIxpHTHoM77GQ?=
 =?us-ascii?Q?1xkCp408RQZG2GVozs3zjmqaxdprmsrcXWF47gX1J2Z6TfLK7b2+7dxO52Pf?=
 =?us-ascii?Q?XtJxc3dbwfhLrYM1gwEnkE6XQ6JvsFFlfQgpQLUN?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 370c4c04-d408-4284-4bd8-08de235e9bf8
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2025 09:17:18.3746
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nPZPqFs6hy6GxfkCZhUlHKWvLDna9LOW0GY+aOUqgu2ZWVWff+JVv7Tuihkgkxuf1O/WtAo/IT4gPp1eXJ8VBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6514
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_011731_453004_FF7405D0 
X-CRM114-Status: UNSURE (   8.36  )
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
> Sent: Tuesday, November 11, 2025 1:13 PM
>=20
> This function can only be called on the default_domain. Trivally pass it
> in. In all three existing cases, the default domain was just attached to
> the device.
>=20
> This avoids iommu_setup_dma_ops() calling iommu_get_domain_for_dev()
> the that will be used by external callers.

remove 'the' before 'that'

