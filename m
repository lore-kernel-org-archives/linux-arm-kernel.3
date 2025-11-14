Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D15CECE7A8E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 09:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=jQrMosR/B3pvDqik2qr/DMnHAL7XhRajz9rbTYQx8gA=; b=Ze94qWFuKIj4ZoAVaChJ8HsnjF
	nDTMK1x1g9l9WVUYeUjn/2xnJr1kMitB2MYvNnZjGRlXw7v5PQqCbjllHdHM3J7+i+MNvTPzHvr2g
	76wNVna7nnET1Eue6vL52a/DVl/PMSNQMHLFY+92Rx8UN+PwBNSJakUEO4G7ocfQAw3D0XNqEc99X
	pqHWc9FOUaHfA2Vf3wRfVAVXvGpCKP2g3Zz+rW/086rDfNJAgKPC6gw3z3OhJ9Exsqm6TRO1Wthxt
	eACQBPecR04KXSP4LwbQ59fOZGKC0uq60OjBFkLYNfnifCZDBeBYr6SaAOJj6p76FBDL6KVAKYELk
	rxf/pt7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJpwg-0000000BtPU-061z;
	Fri, 14 Nov 2025 09:18:18 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJpwd-0000000BtOI-2Dg7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 09:18:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763111895; x=1794647895;
  h=from:to:cc:subject:date:message-id:references:
   content-transfer-encoding:mime-version;
  bh=jQrMosR/B3pvDqik2qr/DMnHAL7XhRajz9rbTYQx8gA=;
  b=Su5D+VKEybSjoFARvgn7gHyA4XZZlqCyhKleDIfrP1gPsifvxMni0moe
   8WuiC6cHcEPeEaiMP4t0nDer+jM3put0N9LAXpiX26PiT3pcDGKKXPUuU
   IWQR22z4qDvI4SjGTti/TmIUJMFrGUj9j6ujbK2MTR4SiuAD324TPaUX5
   YPO1KgreJ13KMBwhbLfEpAwP+JdnLr2MpOJ4pjBi6ArMZ/K1SIs/Mn/Qy
   UhFtVoWpDJ0Ss6//2OEueplOCLzgClxwSqajR4Q75i8xB1BIKE5k4pNUb
   +/0xSw5lW4Z0qOqkNQ6n4sIcVe6S3/FkjBixrRD8lxhLPpcTIBqn4hXPc
   Q==;
X-CSE-ConnectionGUID: mWsqySNdTY+ey/6kO9x1Kw==
X-CSE-MsgGUID: YLRRqSL+SwO1WSq41g9GbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="90682336"
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; 
   d="scan'208";a="90682336"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 01:18:15 -0800
X-CSE-ConnectionGUID: ip0FdahMQNSPydyD4D4xjg==
X-CSE-MsgGUID: qMV2aZ8mRsSqTwC3TgDI4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; 
   d="scan'208";a="194720705"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 01:18:14 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 14 Nov 2025 01:18:14 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 14 Nov 2025 01:18:14 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.59)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 14 Nov 2025 01:18:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BM2VL43fqeFGfxqKVQi6YaOK/aRJb2PFyf2jUBKnUu2wKgqMpVHU/SfPjv947Jc7bjT8EJjHydrgxPV10jD2AT8K4GN6QeclFTHMJEuCwxq2uXTFl4M8CoyY5FDGA2qMQbUB4x3HZJUWCob+BLzMMmVF6UTpYSJS9g1LdB14hyZJPcdlcl9rvf3T4EMij0WycBUEHegNF0aQciRm5Xg/xVSDKJUIAodaVEXKijCfJYWndD+e1UULn1Xx90f/4a1HrhE+v021AXy3bMvHl2GE/2R/yDvMV780njIQvaFK7k3+fJuHuJRyQyf0sDelVHpPMysj1BnyOvGOLOWEbSJ+Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jQrMosR/B3pvDqik2qr/DMnHAL7XhRajz9rbTYQx8gA=;
 b=xtRvfJ5yMlOTJkNfZRUpAbIPOeJCjS3vesHYAphT0JOsM71/RJ3EuLaNCY23gpEOsaTaYVjm3gxErpKg8L8MEfbytQJlsBoOuyqvjyqC8NP1gReKEGtiOl5EdrtFw5lJAvtBTaVwJKKu5FqhXif52E/dOfEhl2N5AKGU6K4cB9G/c2e8yhXaNHO4QkzbQhGpZOpeswWIQxX6xg1D+Is2/cTzamZeuQhmXahDbg1/vBSZ34ek1Sehxp1AJTclKA/aWZlf7A5iPWZUgxYg7QZTBfjvic4RLoC+HB05e/F5FzIDeNJTvh6R+lYrTUkenpOCpZ+01pXV3tNi+TNwtC2aFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by PH0PR11MB5078.namprd11.prod.outlook.com (2603:10b6:510:3e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 09:18:06 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1%5]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 09:18:06 +0000
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
Thread-Index: AQHcUsn/bIFO4rV/yEaS6G9uu/urhLTx6PcggAAAcAA=
Date: Fri, 14 Nov 2025 09:18:06 +0000
Message-ID: <BN9PR11MB5276AC108F9EE33176488E3D8CCAA@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <cover.1762835355.git.nicolinc@nvidia.com>
 <431cccb8279eb84376c641981f57e9ceece8febf.1762835355.git.nicolinc@nvidia.com> 
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|PH0PR11MB5078:EE_
x-ms-office365-filtering-correlation-id: 9c18fda9-bab0-4322-32f0-08de235eb884
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?Bk8E3zwKAjjlA4/q7OiK6y0tXIOfyZffyTNIs6c7h8SwCHblX18yrxRRlZjC?=
 =?us-ascii?Q?v+Te3CLKo+lAFQaERNcPbP65gUg9ltmSerjQHzGbiuNkRe7/jn0Lep62EBOM?=
 =?us-ascii?Q?KY+ZIdTqpJdjkWBkYD0dV9SrAagdzIQjeQockYLQMclXJ05nSQPG81kdbFvz?=
 =?us-ascii?Q?1S1iRuxx0fm4OXJ4JrLNSyW8aXv+0CZe68lp7jRxU4w2Cc+rJ/aZYzQQKMq8?=
 =?us-ascii?Q?yGa3wzN/UK1Ni8bMHCRX66wkA0zPEmN6mPUHTsWzHVpbaj0KEUAC4O5gzG6W?=
 =?us-ascii?Q?Pxbn9Ny7ea6dRLuPJSDR89CsAkmI+jE+UIGANCLMXMT8y5yiZKB12bjP1dQA?=
 =?us-ascii?Q?kCzUmFjGqslUpDXn5dUqF1/SR3P1aURKZQryFDq4sB+igOGbH5c1pxEpbJRZ?=
 =?us-ascii?Q?y7UnO2AyAdHJMaZdSyuHkW3IDVlQaQtloYSNvuUSwRftTyznPk7z9tUxVfx+?=
 =?us-ascii?Q?gitNC5Q4JNE348vNp26i+gq+6Su2dl4Dk+ufHfe9bTiQosUEZLuJX8aKS/kT?=
 =?us-ascii?Q?OClXlFxwNL0SMelwsQMRnXrlHiIVKh9Pv32SVca2ShAR/qWjIzQS9607UnUO?=
 =?us-ascii?Q?Heu+fZFtmsJRSAWYvMIpfT2NN+O2IEx4aUDzA8r0JXZra7CIDbOpVQHgkMyW?=
 =?us-ascii?Q?05wuzxUAd5/77GLzU06fpbOjf80f6asuDA5+x32QTMrUKn5+TQoofhnpQOzC?=
 =?us-ascii?Q?97pyFqOhtCK+VOfpBvhx2ZX68bDqMyEWXybtz6AtG8OBoGwodVx/VVYc59YM?=
 =?us-ascii?Q?u1AEi/XnhZxL06cJ4xUMmr/D9Qwbw8GgqjFAocapD5aiMmXapu6HmKClZ1e8?=
 =?us-ascii?Q?0dHmv9D7FbYe4iefhR+71PSQFRzHC8vxW2W+xKt2T3gbgN84au4mmn1F0tvJ?=
 =?us-ascii?Q?sAX83eS4Bdh0tZz0fGX6D9iyMFfM/air32qC398OcF5Te+xtaArsps+S0fke?=
 =?us-ascii?Q?M+pcypZm4lnPkUjygLJtQ3vKrxhGjnAcCLQCtYJzoU7iE+oUYNC3kukuRkqH?=
 =?us-ascii?Q?bycxhxICjXt0GZlMUPeKYmr/+xSUCVYsIBiJ9ixe/ysyvnvaCU6Yk1Cip671?=
 =?us-ascii?Q?lL6CqHXfukg/xqpMZxGKC0s9VlW8WIrRLLNvO7shxX1Wk4rFm0vH3pvUMgq6?=
 =?us-ascii?Q?u8z/Hh5l2J7mwXD7x256YuRKTn2dxLEzrmvARANKB4ZlvV91SwaLs+7bmh3I?=
 =?us-ascii?Q?srTndrTGVPPf8goZ2HszjczJqTfdgn/f2hdF0gmlIHx2Qw1L+VmMdMGItijm?=
 =?us-ascii?Q?RmGKynqPOOwSlpUzsv+VJlIzKc2bD5K7jc0IZitKTYlG6lSaO5CwEiVIS9lw?=
 =?us-ascii?Q?1AQn9IqXGz3g97q2dmI9RYEwJ9cMh3P1romE8bqZfuBTguiNN+dcM2rXpExM?=
 =?us-ascii?Q?Vxmk5vgP5eJmJliGq1VsoE95DWQfOyqZcSsTVgNbf7lifnA+PM6WYD3k6IMG?=
 =?us-ascii?Q?ESLZsHolilMIkv7Ui/Wgx0Qv7yiimTV76AqZdFD2KosEDKNZqVQHgK6oy4lQ?=
 =?us-ascii?Q?SLU68vOgDYTZbEy28iDqrLnq3geaGHPhYcqL?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?pwG1nZ7pgpiI0CHGIp+7Yr8N1sQUFctzIVgkDcOzmXA/QZyot1J3XnGd52eu?=
 =?us-ascii?Q?Zl1vJBUJLHD4CQa42aCXOOWVsG/25cp0cZEP21b5G2GMCot30rqRHGxOREh8?=
 =?us-ascii?Q?2V7XQJiZMmxCaBTRyiCe/R6SF0emnbDDFI1+CVpwuqYt0GhZdkzXGmemka9m?=
 =?us-ascii?Q?92TxuGvNNuO1LCdZLfR3DykwHUeI6qQaBJNP5BKuROPzDaQCU8lyQm055T13?=
 =?us-ascii?Q?ixwFUtdbmxqx/Hwxs2niypa15aP9+5c/QkDYL427OyVoEzs4LZOFA9YzZiVW?=
 =?us-ascii?Q?rZqhTOyMl7RFRDtYo9PRdE59PtJwndgZR5PcouBW1udCY1RM5pkAiMv3ZSHZ?=
 =?us-ascii?Q?yVB9GhQnOGjDQf46n85ocAUOXxDgdxX2rkD9hPDcb4HEQMics0ifxRE0cf1k?=
 =?us-ascii?Q?+zP347KWRyhisJB/YxghoC2KLKKtWvLcZTD6q6pGrKQJ+AfQxX2IdFBTC0V8?=
 =?us-ascii?Q?bbm8yAYnKqyJJhPYC8OIAHJ50LaEFyhYNlBnkTV1gHjwaN4xlDE3KcEdjWMe?=
 =?us-ascii?Q?LKLupGCQsnhdOLwIea6uH/q96i2/bRtHtZMmLyZ7uU2l0/cu9VMQNUXlh8/S?=
 =?us-ascii?Q?vmTpC4KkZr59OfoNoea711e1TsHhpvYq0qF1UKonnUNVGQXluFJbHrxpv92v?=
 =?us-ascii?Q?js+l75ukbwar8RKkTRnlGovN7TOKbn8SdBfylKqfjNdkWEe9D+DIgOL5Q8YE?=
 =?us-ascii?Q?r5FzueyE2KsmXAqnhNao8gzs2BNKv76vsfOzJoAdjYCm0hzzTfaVL+MnxFmK?=
 =?us-ascii?Q?XYhKswKv4fR7wDvzuTvdWcREkzUCv0IFLTtwQCToDYAqWasW5E+oRh3yXowy?=
 =?us-ascii?Q?JAbQT4JjTsB08z8VbWHyE1GON3kbY33Q34I3GIMZC72z1B51ew7mjXsaxhCK?=
 =?us-ascii?Q?uthcghwKA+O2l8WLoXt4inSkE14+M/RrQgM4AXb2AiksRkIKQ8WYieOlEcp9?=
 =?us-ascii?Q?eFqs5RnQeHsaCCWVZ6Gaa9TpDi9CJrFrblTIC4jSaX5/Zlyv/BE9TMHOstjP?=
 =?us-ascii?Q?+NZgnZyjOgVi0k+TLF2ac7bkRItIkqhbJjrLR7sSI4egO6hv9XaqBsKo7gZf?=
 =?us-ascii?Q?C7lZeZQIQNNZka+cvmp09hB1JVB5kUQd4wurOdxmFoOyvVlh9BTW0iWB7ovj?=
 =?us-ascii?Q?353ulVrcKTEWIDQagONavrvbIBj4dmuJEdPBY+ybJtC0lHKDt7nfCOJ55rL7?=
 =?us-ascii?Q?RQJqMvsbYZtNGJwGiz08ker+ZpewQ8OmlKj3DivIztfNXHDOYrhAjRLM+6yS?=
 =?us-ascii?Q?HHqu2LC3VTD3ZzoBwNvGHE1Lpf49b+4VNDt8Tw7j5VuD7ZLnPxGImmaGpH/a?=
 =?us-ascii?Q?KMUcNs7QRsrSQ3nrCynLKVb0R2VBZkB2AhMnhkhxbZ5BhijLp1RSk+lOZTOy?=
 =?us-ascii?Q?hLU8M/LB4ZZldi7jJwzGbTEMp6/9vbas516aqlbgL0G10vRou+nx1Aw3kUBG?=
 =?us-ascii?Q?4UJgsNs4+mFo889+CBHmxw0B1Cxv21T7FpMJ95ROIzxqm/l7fXA5Raeahdv4?=
 =?us-ascii?Q?SwQ5OT7U1KXK+VIhmJBrI4GZ2SjJgwFNA4IjSSd+kj/JOf8Q6Xyreb6tSH90?=
 =?us-ascii?Q?VG7rG1q7aifT7r2sCKoQMwpZcTth86yvHF/KQ3lP?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c18fda9-bab0-4322-32f0-08de235eb884
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2025 09:18:06.2404
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zh3WXKm7EIQ7Yqa7QOTT8DDdDKC/ndpeQWhJ/HqCbkk9XxjKa67/ALFdU476Ot/sHZorrmPYwPq3oWklQOrnhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5078
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_011815_580596_98C0A8DF 
X-CRM114-Status: UNSURE (   9.74  )
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

> From: Tian, Kevin
> Sent: Friday, November 14, 2025 5:17 PM
>=20
> > From: Nicolin Chen <nicolinc@nvidia.com>
> > Sent: Tuesday, November 11, 2025 1:13 PM
> >
> > This function can only be called on the default_domain. Trivally pass i=
t
> > in. In all three existing cases, the default domain was just attached t=
o
> > the device.
> >
> > This avoids iommu_setup_dma_ops() calling iommu_get_domain_for_dev()
> > the that will be used by external callers.
>=20
> remove 'the' before 'that'

Reviewed-by: Kevin Tian<kevin.tian@intel.com>

