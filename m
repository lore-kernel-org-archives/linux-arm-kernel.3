Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E0DEC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 08:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bDBMHG87SNgbeNS+75u7Bw2JttxQJBHzmDml3SjG0Go=; b=G0Csp5Zt3MauDv9ShQRUN/x5AF
	dseVJn6p4kz+KqiWh93Qgaj48FgjlTSfc7KUXzye6UeU/OnlHX4KNfLIOhKsovXlsgPlUJxL1UOK2
	T5TLb/12nmZ2TBcnuAKNaIY0nusg+DVg3ONLx2Br60VyCqewkODikVL+R+CLMNb6tTHB0nWR1ErzF
	+/NHtqxLESedoq/Ox77nsEkUaJcCSDewfstSFEL93eRqMazP13xsvfkR4tgK40aSlE5I+t4QLq9bz
	b/H1BNTm6hPdLcbbFrWa81FSmHr0ClOObR1q0xop31SuRMP+U5uRd1TrABaFd1efTeW9pxs4+vStF
	fDwdlc9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6mhP-00000003vXL-4AbE;
	Mon, 21 Apr 2025 08:40:19 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6mKu-00000003scb-3Ad0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 08:17:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745223424; x=1776759424;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=xt2O6HcYK7PZCT3vB1hbbFAs9H9W7avbSFy4HatpZWE=;
  b=Lmno5zVq04ot9Caumpnymd59WYO0ekN0JAt5ucWYsFYkImHsmznOPikm
   c5fY0vGUVITM/73aq56T65LXkkxgymuQx18wq2eRyVvu+/5k0jy6m8LBe
   F1Pbfx0N05pMnhNG/2e1WM91jIJeyPrYkbS5NELqBfQo2BZKmH0UodR3+
   9oY/SO6AX9d5m+X0xHgoALZJn2aocd3fUSj5e4btk7g96AaL/Rgef0DKq
   rBZvKAsFQLqyb9jYuaFO09fn0fla48PwEtt3r6RbW4gDn5LN3GJiHbtVx
   Aj51v8ow2MyS17H6KWYely9TCCtbM/yBEm+cruLI1Dkv67hArQJdHv3Zf
   A==;
X-CSE-ConnectionGUID: YceTgND2SGiQHI4GwHc+zQ==
X-CSE-MsgGUID: 5LIN8nqGQKKLitdOqCByug==
X-IronPort-AV: E=McAfee;i="6700,10204,11409"; a="46924510"
X-IronPort-AV: E=Sophos;i="6.15,227,1739865600"; 
   d="scan'208";a="46924510"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2025 01:17:04 -0700
X-CSE-ConnectionGUID: U3+S+r7PQdKNq3/N+j7lZw==
X-CSE-MsgGUID: BX0xEz10Qtyk1scxe4u9Qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,227,1739865600"; 
   d="scan'208";a="135745233"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2025 01:17:03 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 21 Apr 2025 01:17:03 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 21 Apr 2025 01:17:03 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 21 Apr 2025 01:17:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ndpt+5NCMzEIA9i6v3f3MykUgJbWoWorNtpxC/GGoRRDxBVVZzFnE84Ck6wCD47ifxv0O4hRxYNtxac+vlCLYA88Hv0vJQTAZ4pDlysEUsiA1LT61BxsxEPBTP/vAv9eawrxBxnxnwVcH1PfRN8NX1v4o+tqWUS5Eag/Knd47E55glc9l8kLGrfySR42g0LFbB7mksXHWtxKgqjHk3pWPjqnQo4LGFMgno+eWPGRLhrgszpm7ZPyrADv1o59/Z11ImVt+fBe2mMHoZIC7QwNZhwUXyfx5jL5S4t/0rh5EnLPVZfmdAO83AsIoQ9S1UaXvZCZl0N5u6dfUi3ZfLL0iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bDBMHG87SNgbeNS+75u7Bw2JttxQJBHzmDml3SjG0Go=;
 b=ZGGD4ZkEOvXUS09ie4Bv8MUpSehDizzNVzFpJqL89h3KAQAXOzs3k3W41T5t5YChuAWlnmtPakbFiwgDMMqphDXbkqQM3chpf3zknlTDksVFO3/JoFGdgdmN3CNp3gHqQ8MHxB9rOROtc4LYQNpdM1gFE4QJrx4YzThNblbftCV2KLKoQ6ieYSuZMTrK6ZDAmSwPiVkgeyFsxoetvkZg6dnNjFXjFh0wuQmyFRhrntVcUBFQraGCtWWimUVtGgkNfzEW4OhUU+fWePGvbmOm8R5yoVFqciAnC/e5EwagBgS5FhJpjyGmOgLq3P1K5et+69SVhsZuxDEQh2JTvG45bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by CH3PR11MB8704.namprd11.prod.outlook.com (2603:10b6:610:1c7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.36; Mon, 21 Apr
 2025 08:16:54 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1%6]) with mapi id 15.20.8655.033; Mon, 21 Apr 2025
 08:16:54 +0000
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
Subject: RE: [PATCH v1 10/16] iommufd: Add mmap interface
Thread-Topic: [PATCH v1 10/16] iommufd: Add mmap interface
Thread-Index: AQHbqqxlzY98j96PHky6lQu+3U84hbOt0zIQ
Date: Mon, 21 Apr 2025 08:16:54 +0000
Message-ID: <BN9PR11MB527664BDB7933FA0B7981EE68CB82@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <cover.1744353300.git.nicolinc@nvidia.com>
 <c332a8701959c098f747dd8e8fa083ceda2bf2c3.1744353300.git.nicolinc@nvidia.com>
In-Reply-To: <c332a8701959c098f747dd8e8fa083ceda2bf2c3.1744353300.git.nicolinc@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|CH3PR11MB8704:EE_
x-ms-office365-filtering-correlation-id: 729fe7bb-369d-4baa-301e-08dd80ace099
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?7cGfDptY0CKbJL0dA6JixtOGZhGJ++dgDMlx53PTuLMWxcB6CMqiAwrAH6c6?=
 =?us-ascii?Q?DJUNX6tZNHy4pFDIgnZa+RAX2obGnLFkiG1rlcz1K+x4/PmHX7KVXo2itqvZ?=
 =?us-ascii?Q?oOGKrDx/+f/nvqt16rVvB7+E3mN0RW6D/Rv8Xxo6IAE3utxrv+IFpLSo9/Md?=
 =?us-ascii?Q?orIGebiqfPNo6Q95sPO9aQhVee0BIUrm5vMM/RbD54sTVfhPBx6/psfJb06o?=
 =?us-ascii?Q?RV/vKyJe9qN4AkyDuNmyl3VP+0qXLMu3pinYdvivCv23KZkz3fwwD9MRLX+v?=
 =?us-ascii?Q?r63htFBB6gsM97zSNybCwfh5YzzTMaKWCAKIbykJi7WqscCuqos+JUmRAISP?=
 =?us-ascii?Q?/ufFm5vhWC30Dz8IiL1ZVXkoVtat8sj+fucPDysN27V0xJJ73SpxIuj7Lq6J?=
 =?us-ascii?Q?EwJ9hUa6ZTGSr/8f5HFSWp69WxxrPo93MgHEyyGEzs9KTxQLJZstuvTBLJYM?=
 =?us-ascii?Q?c5OBRKgmHRi0qt05t3KpsmShPm48KEXzBgS7pW6cAW9MIknuEPgxPKk21erI?=
 =?us-ascii?Q?CEpVGSRYCsiXg6HIgAoMUZaSgg7HU9/933GnkxRsSpvfjqPVGuG+WMi0OcZo?=
 =?us-ascii?Q?AU0AYbFtlHGlSCkzbOp1fFXs9olpDdac3V5NlJFFbxoBSIS+BOsZi8KNtgoP?=
 =?us-ascii?Q?GqCl3ZidTTt13GGi7fVG/LAHjwJKvynADgZyYZWm51mPNpGLEVt5gKlWTOXj?=
 =?us-ascii?Q?wiBk+JrTqy672vhT/SYl2wglLJiTXP3cmBloRaJxfLPWUCAM9trDLXhJazha?=
 =?us-ascii?Q?fnt167pITLzJPtD/KI5C6fQ4ezpd5B2+8jS4RHmw2R86mvkdgQi8XBVBpwc3?=
 =?us-ascii?Q?Sq6axrOY5FxeIoJhBzPNn1MYNgmr5nUF4oF+OXTsnp87fA3AUjL3Tg2kco3k?=
 =?us-ascii?Q?0EMjPVBMUMp3bQwVVd//hYvIHqXvDWverDTHE8gPeoY+p7NmbSMPELVnyubl?=
 =?us-ascii?Q?T3RRVFVgRlMTlnn84Fb+Bh5znml0bnVgz1weIVHNXKGQKnQTmE1eEAx8uBOo?=
 =?us-ascii?Q?rdReRzOEzcworHZ2LzhY4ryoamDGRWfyU7aZ9W8Tu4BUAyH6wV+xrPbm8W6R?=
 =?us-ascii?Q?pXX8Ki5Q/J9HR9hZhfxzwawVKeHHiiu/xU8eU+s5WxfBM4p3BjUAJVfofBGO?=
 =?us-ascii?Q?+5QlZgVDZ9Y91XD6WB2Ba1PlD6TxFentsW2jw3rGBS2TdvhXcuzDsn9hfeOS?=
 =?us-ascii?Q?3433MPC7HGxBBoF8A0P10VdajtA1q7iYeZQWZIS4i0DmF4lMmMAiiAOY00bm?=
 =?us-ascii?Q?KdzclMroQb5ghCxMlHnQp26e7NqQ4XU8s89R/5ULXpcARGtxUNa2J8dkXa4Z?=
 =?us-ascii?Q?bMFoNlRKpLIrRuTgQVlwu0+tF+7RfuRxuUDCM0dmZPwMgXRWhzoq8ONqY29G?=
 =?us-ascii?Q?ijWoFQ8O1Yrntqc3lejSnW7yDYBdBshCQ3Xlsr0oHcl4kPu5Om/L7XavgPgV?=
 =?us-ascii?Q?+5pKySV8hPBI97aXKVkxm7r1cy6ySM5C5o/Y5YkLAliHDU+6sCfRSA4xSW2i?=
 =?us-ascii?Q?RaTbJjzODUlxxGg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?hQZiLeAks98PmLVBNR1iYv/JhynY/am5efZPp1KRfl63d0JEJ2IPbHRQQHgq?=
 =?us-ascii?Q?l4N3CbiBaT/7jV0Bg01sw1Bhbm5Lx9Q9XzSlN/exHbSQWib1++cf1p3UYJFD?=
 =?us-ascii?Q?0nE3dWiOqRvj4ctQSfu0F7NJTNoVPb8pQHUGSakcbr5X7qpYRcTcPrzvFpdd?=
 =?us-ascii?Q?9JYCRkS+pWPWJ5UieoAMmuRA8cGTvlAi44HhjAWV0/NFbpnZgmHUh3+mWreg?=
 =?us-ascii?Q?ypUpTnXIydwLFYgJKH+aMmI3F81HlhJnxaRqO7MQA2nQ+9MhtJAglkBm577Z?=
 =?us-ascii?Q?r5Oyk/+4OlgLGDdc7aW657+Y4gGVvIO+1d9BZQzps6/0Z8KoiyK4o/umjawT?=
 =?us-ascii?Q?kJArZUGKE473Yv9mCw1L0aBD6fmH+NtCO3kZ9lSJ5z2le1ol8dNU+5+aFBTF?=
 =?us-ascii?Q?1tYEjnajaIBRzs7OQmS62da1wUNhIsKRDwilA3HB2ne/yBmefzwyETLatn4t?=
 =?us-ascii?Q?XdYzzQY0GJxwLUyQpKJ39FgbpwnkVoMJmZCHI81buijVNHm7ZauiAieKeNDB?=
 =?us-ascii?Q?V8X6yyLvSBdcbbeyjnOc9HYRZVpHoXz64f8B5cLvChP7nXXe3Cy5KWD+8KsN?=
 =?us-ascii?Q?unxiyCKdCWgAMVKmj2/tLxWrt0bqxyr4Uw7HugG6PtCAX6crU6tN0/vjwI7M?=
 =?us-ascii?Q?L/OaI9/L7EZLcoGJq7eP5DXatRn3A00Mgrtrp5cwX0uycD4nn4qiKirp9v9U?=
 =?us-ascii?Q?IiCrcHNUPUQsBjeumQy3c0MCYFsGJ1CLFyYiy+9H4ZZHXMaBT2HKNrxs2aA2?=
 =?us-ascii?Q?Stu1fIovmgflOT8zjKtNeXcyVFUsYyaygQLFzkBU9gIQIzWawgG4pkN5g1W0?=
 =?us-ascii?Q?bTJ4zI0sPthSsbb71Itr61TnDxCYzcGHJAVqdYMQk48IRqwg/A66ikyKYAdy?=
 =?us-ascii?Q?oxGy2qCTPI2988IJJKXYc3jnwHqj3eZzAIE2K61wV+LL79ZlJzc6aoq0oNzb?=
 =?us-ascii?Q?NzTw1OTTbGE+FBa/cCRBw8d5xACVWR2Vi5WSwfL3IJHZicuU0x2xhDonVWLk?=
 =?us-ascii?Q?00VZwbYN2xHPZwidFqINJNFGiS2eJngIoU+Kum29gnvws0Gu05ZYggmrHjzS?=
 =?us-ascii?Q?Jl7Spai3qU8z2Ps+kMtD+rkgElEVhLMJwaxnF/7juk0xzhURNqOyaEu+VSHq?=
 =?us-ascii?Q?4PPwp77xkLR+8a4Py3B5NAvXQLUfV6eV6D/UKItD9d1yXf0tTPOdZgRwW0r+?=
 =?us-ascii?Q?UV/65kcEEy4NgMEOltau1p2I9uQcDIbqkoDMQAeNTmJMZQmif+dnf/LhWZ4M?=
 =?us-ascii?Q?KhmHtMZb8aN+9hOQcCyNRjFUobH49lEXieEVRp6H9Bw6tF4+0AB6IlvGCKVe?=
 =?us-ascii?Q?d4EJj4bTyKAfq/k+8/iI3gD9oFOZXYR+Hnhfz2wT2dwbXIVh2143af2DDjgc?=
 =?us-ascii?Q?27JKTzcZaKwYlvsth/UoZ3buaCXUkQj+pbh0XBt/20IB22jkFYNBW83m2Zyr?=
 =?us-ascii?Q?5zYNKF8rF9Kad1bYg1og3ozEOjV8/THTZ4ElcqUB/RarkZyQC04jQYR4gS12?=
 =?us-ascii?Q?EwWGFt+df8oms/szD4/SpmlAxjpwRQBoSBjynKrINrOTaiMh+d8KGte+Az2/?=
 =?us-ascii?Q?wJQY/S1vBxoCa/FIIpKWrU4sTH/pjL02UvS64SED?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 729fe7bb-369d-4baa-301e-08dd80ace099
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2025 08:16:54.6894
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Sgosn73dU3WG9JaID9NqC0yt5akyK1fVPNJFL9YAWFWLg/yriIhoJWELRjA1O9kz/yRoYcSqOalBxFZuI2OQTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8704
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_011704_810093_C81AB35A 
X-CRM114-Status: GOOD (  20.06  )
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
> For vIOMMU passing through HW resources to user space (VMs), add an
> mmap
> infrastructure to map a region of hardware MMIO pages. The addr and size
> should be given previously via a prior IOMMU_VIOMMU_ALLOC ioctl in some
> output fields of the structure.

According to the code the addr must be the immap_id given by previous
alloc but size can be any as long as it doesn't exceed the physical length.

>=20
> +/* Entry for iommufd_ctx::mt_mmap */
> +struct iommufd_mmap {
> +	unsigned long pfn_start;
> +	unsigned long pfn_end;
> +	bool is_io;
> +};

what is the point of 'is_io' here? Do you intend to allow userspace to
mmap anonymous memory via iommufd?

anyway for now the only user in this series always sets it to true.

I'd suggest to remove it until there is a real need.

>=20
> +/*
> + * The pfn and size carried in @vma from the user space mmap call should
> be

there is no 'pfn' carried in the mmap call. It's vm_pgoff.

> + * previously given to user space via a prior ioctl output.
> + */
> +static int iommufd_fops_mmap(struct file *filp, struct vm_area_struct *v=
ma)
> +{
> +	struct iommufd_ctx *ictx =3D filp->private_data;
> +	size_t size =3D vma->vm_end - vma->vm_start;
> +	struct iommufd_mmap *immap;
> +
> +	if (size & ~PAGE_MASK)
> +		return -EINVAL;
> +	if (!(vma->vm_flags & VM_SHARED))
> +		return -EINVAL;
> +	if (vma->vm_flags & VM_EXEC)
> +		return -EPERM;
> +
> +	/* vm_pgoff carries an index of an mtree entry/immap */
> +	immap =3D mtree_load(&ictx->mt_mmap, vma->vm_pgoff);
> +	if (!immap)
> +		return -EINVAL;
> +	if (size >> PAGE_SHIFT > immap->pfn_end - immap->pfn_start + 1)
> +		return -EINVAL;

Do we want to document in uAPI that iommufd mmap allows to map
a sub-region (starting from offset zero) of the reported size from earlier
alloc ioctl, but not from random offset (of course impossible by forcing
vm_pgoff to be a mtree index)?


