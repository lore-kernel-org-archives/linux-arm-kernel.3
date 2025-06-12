Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF09CC61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 09:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g+ABG75e82+1TGricpLGf/OUkdGT0LlA1cWbz041+xU=; b=tynhtbKqKaCTK1wqNLSmIa4rkH
	wwzTrnmxqvOj9XRYS5DfJilq4f2MA3CwXyWzfRjLhnxyoYLxLgaj1v6Z+mUW9h9v2Xy698yz1zTQp
	oOgNrNDsYYP5Ts5Vo3X4AnvZwhlTqlDp5Eoh9WRIuOyGYIJnnAA5XE4Urr79DcPuJBMUGzqKyr+BA
	o/pDxKMNBxdT9FXrROyNp59Bgoea3UwjE4o5BaziqzfOFroy2kme8Tx8qXdK19Ri6jk6++Dh2Fe4t
	PjxHKsCOVMeE9XBpGNJtBXzJx6NHNA1GHIa8EO8Jevyx6to4XLR4WpPVyHCYAFSArZyiptM4yj9th
	sBmkH/gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPeYy-0000000Cs34-40bj;
	Thu, 12 Jun 2025 09:49:37 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPdHJ-0000000CcOu-3Dgp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 08:27:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749716838; x=1781252838;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=KhM1Znq9YUXuNXQiSw6SXoxRkyi2mrPibuqF/HDK+U0=;
  b=J3HR4cv5a9ZyhV5yr2ya9FXxu3KBsFeawQBjF6JnYCyLBoceiJK9kF1S
   HFbAcBdq/iJtaWDSDrT+QYgjU1+Difn8kYxb6RU64mJfeJ2UapzVRWUh4
   Vbj0JXJri740YH5kULlKA13v2A02s+1VlhxQiCU2Sqyfj36pk5FJvs6OM
   1+66tjKuPtgNeyXIvTfEtr+2wp6lWDtAZ+6xcKVwaf6inKKtrFZ51nGia
   +QvJFidluMCakpdtKhexApv9FHzgQDEkZA6Y2t47rczhzfoyXevH0XbzP
   mc/l0vy6OVi/6vdiPl6lQEueebg/GFNAitM8uXTLw4PlFWmLgAhQGqsYK
   Q==;
X-CSE-ConnectionGUID: a1ajuTSARr25AkNGuOjb8Q==
X-CSE-MsgGUID: Jmzz0i8LQnuZCJi2SvRxNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="51755820"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; 
   d="scan'208";a="51755820"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 01:27:17 -0700
X-CSE-ConnectionGUID: Y90QlPuTRxCHyQnddYM2dw==
X-CSE-MsgGUID: KuX3OEowS+6J6cBL0WKr/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; 
   d="scan'208";a="147338305"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 01:27:16 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 01:27:15 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 12 Jun 2025 01:27:15 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.45)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 01:27:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gDPrt8So2AEoD5+95SPHo1mIbULd3Ae+0Mryg+wnGkvIC9xBTUWCgCG8zY7paIAD7Ubxz2VsTAnbjj7M3bakIZkpEETB1rrHCJ7C8Wz5vzkPNEcdQoo+KrItK6FzHPgztKbMo8UL6K+5CP1xpAgYVHsAk8fPXKsbhFoRlWWT71uev3CYYqWGl7r7hzvPh59Zg2rqnUyxxlKZ3MXL13MZyn2E2hSc7Fv1TkXGMGYNU6Tko5MEzP5X41m7CL7sFPqzF9nZQp6xYoOfreliI+L7wqDFyMUin7S71STndmuhiYNvVcgt7BN2EchznhMQXT9pNbkeKBtcgwK7OO+5rRvxkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g+ABG75e82+1TGricpLGf/OUkdGT0LlA1cWbz041+xU=;
 b=WadCLFhjBBJyZ0IsMVPafWgGBOVwfoYveS/IhXV5m6NH3JwVGqDI9rp6IplRZF+xPfsFpMUpURhxR62aNtK3kD88sw2esAyc/Z/a4i6/Mrytx031M6UZUMuzPtjvvVNeJ2UM6fNkNNGCo3BkYrLFGhCfZwcrDvBMqPgPiydeJb9a/rfqo/QmsWOdl2/f9yWfl0UwzES/qV0BDtrcoZMSba2PGOIovxNc4xhsdmMBRVjR/37vb2zYfJoSEbkZR3oxCM6mTUEbWsi/waqfgGPcjjc1DjoPJW1dGYRnui2F4bnOzxZYPMuEWkHJjNvfkJVaXvzHuR9nqRgSL8RS2g1YnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by MW3PR11MB4572.namprd11.prod.outlook.com (2603:10b6:303:5e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Thu, 12 Jun
 2025 08:27:12 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1%4]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 08:27:12 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Nicolin Chen <nicolinc@nvidia.com>, "jgg@nvidia.com" <jgg@nvidia.com>
CC: "will@kernel.org" <will@kernel.org>, "robin.murphy@arm.com"
	<robin.murphy@arm.com>, "joro@8bytes.org" <joro@8bytes.org>,
	"ddutile@redhat.com" <ddutile@redhat.com>, "Liu, Yi L" <yi.l.liu@intel.com>,
	"peterz@infradead.org" <peterz@infradead.org>, "jsnitsel@redhat.com"
	<jsnitsel@redhat.com>, "praan@google.com" <praan@google.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "iommu@lists.linux.dev"
	<iommu@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "patches@lists.linux.dev"
	<patches@lists.linux.dev>, "baolu.lu@linux.intel.com"
	<baolu.lu@linux.intel.com>
Subject: RE: [PATCH v1 08/12] iommufd/viommu: Replace ops->viommu_alloc with
 ops->viommu_init
Thread-Topic: [PATCH v1 08/12] iommufd/viommu: Replace ops->viommu_alloc with
 ops->viommu_init
Thread-Index: AQHb2WH2lkB5oIzfD0a5Kyd07u2lG7P/NI8A
Date: Thu, 12 Jun 2025 08:27:12 +0000
Message-ID: <BN9PR11MB52762103614C7B8F1322F7CE8C74A@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <cover.1749488870.git.nicolinc@nvidia.com>
 <5586990446e4c97827b5a195622ec0f8cf9d2d67.1749488870.git.nicolinc@nvidia.com>
In-Reply-To: <5586990446e4c97827b5a195622ec0f8cf9d2d67.1749488870.git.nicolinc@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|MW3PR11MB4572:EE_
x-ms-office365-filtering-correlation-id: 4e5a5a5e-0fb0-42bf-0eac-08dda98aee7e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?86BjIq3ElLShwzNVwSGtQu9Uq4EdYHVBYTCZkj5EbsVYNd1hnrwcrmKKIKl8?=
 =?us-ascii?Q?BYxkYFj0CEFJy3LTuWc/ZaOEXgTX0ObMo4kZphLvBLC2ZT0TF9sz/hYURj+s?=
 =?us-ascii?Q?26Qzf9pv9a6yEzD/fvQC9x9BxoehLsjwAIc5FcXNbezrpgx66P5fZYhB6sXJ?=
 =?us-ascii?Q?62tZGfxeEkbQhlnPaM76ItG8b5R917kFpfHuP3kDf2Kzbh24yzoh6dz2Rae0?=
 =?us-ascii?Q?0AlvqtZP+RPHv1f9y4ScJ+RwRgCIoByX37u8nVqdet35XZCaeGSJGjjScfuV?=
 =?us-ascii?Q?VJRmyDq1N/xmne3W/RTJ/U45kW6lMuDJC0fHr8t4SEmrRrnQK9GXei2s3sqL?=
 =?us-ascii?Q?Zdv37hhJ9tJeHtmmbqyhJExR7zoCHyfLa+uce6LGl43YQ9b/tcrhfSWpLsFS?=
 =?us-ascii?Q?yruEJgXxrifXez+ttFC5oMTPBtbqv6p2H7JPjFQjRidsX2RgvtTPJ56tMQ1Z?=
 =?us-ascii?Q?rTzKB7yrUK1WpHd5wcHozSbmDhTqbL8k4BQKTrBYM4CIx7vTXBTtuFvptXuL?=
 =?us-ascii?Q?Tsy4EeB8JabULkvt3S+1CwALke2lR6Ixo+db4S4LvpKhMbuFf4CJxPu/M6cV?=
 =?us-ascii?Q?WkwuY8Z3W0F5TJGAQgqeQFXAzm++oEPleB3k835dkj4/fyUpRzWj1zc1Iah+?=
 =?us-ascii?Q?gn7XUydeHNxfB+uTzQ6grWCaxyuw8tAHH5qEBnhPBQ8tzpyiOcwvW9OvLcEg?=
 =?us-ascii?Q?yA/09E2xh7po1wF0zQy85syXqgKEys8mmva1PnuoZqXTDYyIzUfDaJ0yxa/y?=
 =?us-ascii?Q?nMhHOU7krBpfXy+CPiNVzdFpsaOD0hpGAxDfZ7e0vRgBxAnYmO9za6yGT10v?=
 =?us-ascii?Q?STqRhn9UBuREmMmrn/5s2Ecb8gMYL8Wi+TEe+9cqVLmjwLxzBp6GkyNpMh0F?=
 =?us-ascii?Q?a7SxpFU2xxfZpJi8Rl3gdYoPaKZgUZkYxMzIKY4r7Wi2/6hK6tG4jgGMP92u?=
 =?us-ascii?Q?Xw+JNscljnez1B3w6vjzY5aLIJGSi/LEWYVbiErhMSNFWa+BUv47qgOKRtuP?=
 =?us-ascii?Q?oOt1elkOSYTKpbWZ7yIC8YUMlvxsF+s2Nm18s5qRyg2b/cd0kynkxYGvuAOH?=
 =?us-ascii?Q?OJJ58Ygy6yTDELa5g4uBViDZhDHMdu11TfN8WK017oUeRXxIGEoHsgdBU2Ys?=
 =?us-ascii?Q?PhFgP6WEDHqZMvxBDIpIgE2hq1fPCPreCJyElWCFcWuE5NeHA4bWHfBupkqn?=
 =?us-ascii?Q?PPJjgRq6dvLDVBvMVLQhWMCmOfNK9c0ezQgIrfSWqlGHCX9suQp1xV+K+nq7?=
 =?us-ascii?Q?uLoS6Hc9lFq2LMbUO/IYGKsKFxDHQ+RpTRDJfVTeV+0uoJV0AF1sX1V1uG5K?=
 =?us-ascii?Q?FWm67APag22f+4G0Y4zs8TXC37JtijsALm3W8TUFKebuaEy1RRT8Fq0H103j?=
 =?us-ascii?Q?B/CrWBUtuV5nF5PTxwLZObd5TRMCwRkTxtnQdCN1KbmK1GjBIdIQrHcHxx95?=
 =?us-ascii?Q?hnVZYnFsD7qCVZ5IGrd3Sdip3wStzGEXHk6lundeMvLbmWOGZj9mig=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?g9vCSOqt+bceASPmYJOU/iSaGYIHuiqDuz6Jq4fM4LyBJuaOJDBYPWvJ6tMI?=
 =?us-ascii?Q?YvEgy8G1Q3i4S5vQvpDpcAMmyBOfQtzpzYwVFyd3V8cyOv0z1LFhIdRxhmaO?=
 =?us-ascii?Q?5kqhWUds+9enFOtNMrBazrwpQpo/+itLr3BdADuZxXo6MUu2J3RFEH/67TUU?=
 =?us-ascii?Q?qZIYQ//YzXPHP7qO5MXzAXi2jnKiNshr/kgTL7rcSsXp+Z28iOTRhYLVy5fd?=
 =?us-ascii?Q?YSDMtXGZCpClY33a8eIeBriA+LnmfdVwzH8dOiHKXTi8PYhho64KdxBuu6Xy?=
 =?us-ascii?Q?xPnOpn9PzFBFiXHyejU6fwZszyrW6TQkld/Fj2YV9nTjl/6X4iHTKOPyJ1zO?=
 =?us-ascii?Q?sQEJwD2LB5u5ZjoARPg14T2pEA93LL2xlshSvTput8g4VfFaycJSzv8FdHlP?=
 =?us-ascii?Q?76e/ojVIGSZT7Y1b3IO9dq84yTyQT7EIErDcNQdDmzhE4+QrZXZRezcY1VOq?=
 =?us-ascii?Q?QWoLbOV3Hllek6BbsB+53YKyql4soi3GOO5V38nELvmof7cPVMqeca8kh5RL?=
 =?us-ascii?Q?sfS1HtMsqzLO/asvzv4kherNZPLHHcnmeHerORA+uB2J7EwwC/mKVgrbWqtW?=
 =?us-ascii?Q?DirVyKyGInGb1LPEsImxLSQFjtCoQw6RtOjU8x7wdB00M74KicgEG9qsuxce?=
 =?us-ascii?Q?iD/jFLLKqOAgeCiFoWxJOr9eSXPj7hx/Q64muZMPWgzzBTdVAbvKpMQLNctK?=
 =?us-ascii?Q?l6yXnhmnQbdfAx4DwGYQ07eE0nlI0rwADUAOHZThxkaZOrdr9I3h+uaBfZ9C?=
 =?us-ascii?Q?b2/8lhUTJ0seDSvASVSNpb+lJDOMralrdIbnAA9YutNg0scIjtVwd8gO/Aa3?=
 =?us-ascii?Q?ErDpHrmK6Wyg707BVl/ZTwxqoNUkGbjtURDfswsSzdosCqjUbkA81wsjBLvP?=
 =?us-ascii?Q?yduWMOg3jCio6qhG/lDoeM0C8gli8zv5E61YtSYVbUpNaifmqxdTw50EQgcK?=
 =?us-ascii?Q?Cwba5rtXmfonAYKOUOltm6njbZ8Qk9Z+2327wje+LtymqpRN48RHZQNKAdrd?=
 =?us-ascii?Q?tV5l4cfDTjuWK80TZ/eI+QqxXpqulg1BZGLjZVoQaTbhw1TYo5lVvmfM6cGP?=
 =?us-ascii?Q?6opeYe48d7bAsAN2P+2GoCOl6DOP5l2ZgpMIVXlwExxCGA/LAc0ilxpW9bTb?=
 =?us-ascii?Q?oRKY5YJSi+upPlzQVDqhUlsUd0HoSnfdvVqvPX8YLMDw1nmeTO4wBNVSAVXA?=
 =?us-ascii?Q?CY44j+XmV9WZZjMPRsPq+WRdUGsu5MyCee76/COgj2+NpD22MTETkKm7JOIj?=
 =?us-ascii?Q?7psE3gZIHVeiKJzgd4hvxqHSU1XC18ANa3Nbey9GJ2gE6QgCMqcIPJsWwBZs?=
 =?us-ascii?Q?nkXi5tVlq6CR1hpLhjushlSxcZq5D1WrL9JlgJV3/kW7Sp9MqVQJEcSNT3MM?=
 =?us-ascii?Q?K3frScUprgyk1sLYGQ2rrUGYXR4zemINUZJbJ5sFFCnKdDIy2/+Cb5Yy/bLK?=
 =?us-ascii?Q?+EHUkbWBLMPXXYceXLU38QXOEE6dPL3Lt3uILnZou3eDK+fT5tahjzezGWuT?=
 =?us-ascii?Q?dJn8LaueGA13MJJNav2Jc+mAYfCsCOIXImN5UAyllzfM76aERlN8pBIWveHv?=
 =?us-ascii?Q?eX4NBt6ztUvGC7/LtZV51aS3FCTID5Ikd4aJLN4I?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e5a5a5e-0fb0-42bf-0eac-08dda98aee7e
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2025 08:27:12.8067
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Mb5fAmXHhKNuCpxLuCN9+fSIzmopOrr8mq7+8qaQQ5O5kieHBWSbR2bqSPgvkkuiLzZ2K60Px0gEFzAxIRCYkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4572
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_012717_845090_3C42EDBE 
X-CRM114-Status: GOOD (  10.23  )
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
> Sent: Tuesday, June 10, 2025 1:14 AM
>=20
> +	rc =3D ops->get_viommu_size(cmd->type, idev->dev, &viommu_size);
> +	if (rc)
> +		goto out_put_idev;
> +
> +	/*
> +	 * It is a driver bug for providing a viommu_size smaller than the core
> +	 * vIOMMU structure size
> +	 */
> +	if (WARN_ON_ONCE(viommu_size < sizeof(*viommu))) {
> +		rc =3D -EINVAL;
> +		goto out_put_idev;
> +	}
> +

It's not about user providing an invalid argument. Sounds cleaner
to return NOSUPPORT in such case.

