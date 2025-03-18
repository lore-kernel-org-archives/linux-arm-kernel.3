Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27B00C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 23:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jhIG6t8tYJgm/s2b/d74/QFB+vPlU6QYbeuLESpNgEE=; b=EMDaYNur2N8spBc1Mmjn3s8PcQ
	8x8V1mJFV8LV9EhJ02nXw7gtp2fAn2XPC/O6bLoak46yySTGR74rXByrxRc2EluytstS7LQbhofTS
	ziqJQjnWFuNmxH6BQl6sB6x4+oJDrxRjhJlBisVsn4fFiWWFc47M/kEjFlgCPtXSn47q2/z88TAQG
	1d4qOjwP32Fo1/hCZkBeO7MUBKPgXwg5leErlt3iximEggHWwNqWrk/36r8oiSBGsjd9c7SWJf0KA
	UlQkF/ktW45/6lq/ZlbhrhI1dS3H9neGcZViOeMgO6VpKsxeYtqjvcLF9261o07QbIsrOLlnZcMFm
	n6rIuN5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tug6x-00000007LrY-1ogr;
	Tue, 18 Mar 2025 23:12:39 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tug36-00000007KbY-25El
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 23:08:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742339320; x=1773875320;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=jhIG6t8tYJgm/s2b/d74/QFB+vPlU6QYbeuLESpNgEE=;
  b=TpyiYvVgk0TZ0F5iCJnEagbrV+eBBj4P7zXyUcwmaDG4VA0PlJyOrnFl
   hjEF6aCUGACs9dfTko43ep1A4zsTdmq7o6oeGDTdfUaoG6HJ0zEa9I5IK
   SOqiWCqWS4oZmlimHXib1GkUBxvxD0ZrOlDt7Q1BWSU06l/Ow2MvtIZDX
   NirUSAbijrYanGgnkfgIXZXU4qZifIRdU8VhsXoiJhhz5xpAPBgnv93X7
   78V+8WdmaFWC+yr7i/VJS6uQuo9oVcWmqh1LWZYP0LXOq50O+a+E/NkFx
   WNTm7EFTDwZm7OIWVd1rBRyDAk8FENHAYh070urtK6D0VOdnDSR2hGHK7
   w==;
X-CSE-ConnectionGUID: uteDqzIVS2aa7wwlLmNBgw==
X-CSE-MsgGUID: lQgKY5qNSXG+4/IGC0XWZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11377"; a="54889303"
X-IronPort-AV: E=Sophos;i="6.14,258,1736841600"; 
   d="scan'208";a="54889303"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 16:08:38 -0700
X-CSE-ConnectionGUID: P2bl57e8SWq1kF16PsiNYg==
X-CSE-MsgGUID: ZcYSSkrtR6OOD6jS3c6E7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,258,1736841600"; 
   d="scan'208";a="122875869"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 18 Mar 2025 16:08:39 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 18 Mar 2025 16:08:37 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 18 Mar 2025 16:08:37 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 18 Mar 2025 16:08:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l3XWTiQDkh8peNOYrwaPrcRmnsX+aoS3xnnb2L/MbINSfdij4DnQXlXG41QM+Cq386Ap4Dx+OAyEnJ104o+CbioJkS4JEZukGqEMLIxkgB6Es7iyWdSLoZ+yhsyctzoqhsJUMkx7ZtjuSJpWOwgBBpH0hBJWDtxejESbNaCLWyxVIwDDGkvxQTAy0aU6ZD6kB9TLuECXXw2py5IYEXOD8EWK9ETMZpE/2Hp46oskjhCeG9NewxBj3fhZt5dgWxKLxhXwU8RMJrYcE5zS1QrZSMlwphyAB4rQzAxIW71p+S0U20xMb+Di/smiK0ELVERtYVJH4Yv1t7W0SER/v4FOLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jhIG6t8tYJgm/s2b/d74/QFB+vPlU6QYbeuLESpNgEE=;
 b=Zdb0p4ceuPIgKrUNOJVWXByUyAoeIZTj9uJJpHmr2Z7kERTh2XGNfvDXlnnh9073wlkZWUHwAtVChzUSVOXz73ceAJiJAUyp8dRtVOmniSl28IrjozYH+ilve/UryM6zAs4PbGAM/TsX12VhmMWkrny26rMpH4Pv1P+0eiYCqgTvITjmC3UEZyJGbMU3bGFx+QNJ0Zm8tG5Bj3LLLjOVC8tBYE8yTknTnJhogWiDmoscPPg92qEe71F8bLkDkZyN/jcCskOmn3CX8/vjkjL5EreHrTXxIbZV2d74Vi6XEOr8/rK2teb9HaGg+ZvVZsqr8WIJVdTt/F23Tj2oC2+uUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CO1PR11MB5089.namprd11.prod.outlook.com (2603:10b6:303:9b::16)
 by DM4PR11MB6120.namprd11.prod.outlook.com (2603:10b6:8:af::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Tue, 18 Mar
 2025 23:08:06 +0000
Received: from CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::7de8:e1b1:a3b:b8a8]) by CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::7de8:e1b1:a3b:b8a8%4]) with mapi id 15.20.8534.034; Tue, 18 Mar 2025
 23:08:06 +0000
From: "Keller, Jacob E" <jacob.e.keller@intel.com>
To: Qingfang Deng <dqfext@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>, "Dumazet, Eric"
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, "Alexandre
 Torgue" <alexandre.torgue@foss.st.com>, "Ong, Boon Leong"
	<boon.leong.ong@intel.com>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "linux-stm32@st-md-mailman.stormreply.com"
	<linux-stm32@st-md-mailman.stormreply.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
CC: "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: RE: [PATCH net v2] net: stmmac: Fix accessing freed irq affinity_hint
Thread-Topic: [PATCH net v2] net: stmmac: Fix accessing freed irq
 affinity_hint
Thread-Index: AQHbl7VhABnakp124EeLJ87M+19parN5ha9w
Date: Tue, 18 Mar 2025 23:08:06 +0000
Message-ID: <CO1PR11MB50891366B8997C225707C519D6DE2@CO1PR11MB5089.namprd11.prod.outlook.com>
References: <20250318032424.112067-1-dqfext@gmail.com>
In-Reply-To: <20250318032424.112067-1-dqfext@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR11MB5089:EE_|DM4PR11MB6120:EE_
x-ms-office365-filtering-correlation-id: d9fdd461-1152-42cb-b602-08dd6671be02
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014|921020|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?tWqdwwMV1xrUueY2GOFPxibFOpcaqda8h3AZBf1RQw8uxjlPiwJyYhuXIgUo?=
 =?us-ascii?Q?jbmwfuaAAdnwUWNNtTGaPJTr179Geoy/IbwKUeR9dyShoDiXPFGN1Yith5oW?=
 =?us-ascii?Q?WepqH+JJRdsFBhUO8fYkTsRhxlnaJS4gz7V5ETEFWCj5Pah/gKuw9dXiHd2B?=
 =?us-ascii?Q?51km/S6Jf/s+ZHx7+jawrIfPbj6bvKIg9zWUOWkuHI+tFRE8GFFmIkkErbWZ?=
 =?us-ascii?Q?xf0Gg0oErdIKwL+IMxz25xKhC+4nKXG3KyEz+EB/j3TEqYN2z1jQD4TTXNzN?=
 =?us-ascii?Q?44Vvx4ywJ7exqtpKVujVPDAoIvJD3M/qq29kb0mbH0i2qpjzSpEbRgWgL188?=
 =?us-ascii?Q?4Ur6r7nOHwvZHfJnM4/nIgRsV1iCBfJ+bOQjlbnabevGBJRKJrrZYjjvOUbt?=
 =?us-ascii?Q?4VpZOWb8tGf/h1OOzNt+4fZm3MaBoy4f4hVHrTqPkbL27OErvvDRJ1hw6CIT?=
 =?us-ascii?Q?6JrFSHMsxoOVtYCVaniQ9MFa6u0ZVRL8DUFIn/JxndBQLk+bLM5C2t/t9xpF?=
 =?us-ascii?Q?wqYjLPdZrKkiKzsAHAAZxx1n1O9152ubrsWnYXfPstqppfwtG7fp6rBcscQ1?=
 =?us-ascii?Q?YqAAPEeJEdfQ41g8sq3VNRvxvKMxSWC9vq+WDx3zOtB7PSeKPj206dkzYmzE?=
 =?us-ascii?Q?8mq9+jvlbOXV3xRPJvAV1h4Rw4Ar9T0HvNoWCqBGwNGEyi8sVHOLG6d1J5TI?=
 =?us-ascii?Q?KMMSAlATUdFv04zHWkKeo2YfN7ytKs0QVLSbLAJc9o9+6DVe1hLdzDPta6Ns?=
 =?us-ascii?Q?sY0Uwc8wiDUmZJH/Ef2j2Im1WcAFXj9O0mxQTQikmDNV5MU52rgyYm6W2s0u?=
 =?us-ascii?Q?/5p6NXjf/Hwghxe9DWssz/GDfEP9pjkjLw/cbptrDrchwTXFb9rZwDSxIR6u?=
 =?us-ascii?Q?WBvwAqCPwEAPSxZikS7gx2zXc/6KbnLR7zfKS+BSsfLrt2xyp3u6m4hI+KP5?=
 =?us-ascii?Q?6+/tY9mVauS1uy17aAAr5e7wpyF1+8oY9dLCCY8ASAURI2ZNHK1F2o7JtXfJ?=
 =?us-ascii?Q?F1udAVw57dpoN9l0DI74djuLpqE/7Pk3RpkwYi7YLbpoo4c8sOXEaQGm7Wd/?=
 =?us-ascii?Q?j5W5gUa9OW43pZFP6U/rhubb23T5rqDtqi6XZCv6dKpgJ6kBzd4xroKkTOu+?=
 =?us-ascii?Q?M+nOvPvojGOe1ZXzVZOe/HBoaVn+eEs0NnyBv5j0MYDjcegXNbPJkVwwn4uD?=
 =?us-ascii?Q?0CpYtx8e3L98PVwdRlo2kSLQNB5ucvU0CAuLvmIy7d8aNGUOGcuKvQ3ITlYX?=
 =?us-ascii?Q?HM8yrhwmrlq/+3qmR5WJWtvyk8jPr7egltjTXbcUJu8EQyJxnn+Vv0lCoxVV?=
 =?us-ascii?Q?dWeLsB3Xu+0GgncF2tNomXfdmXeuKrR328XPAzT/RkKVo+Ux+sU8J4KyVOqi?=
 =?us-ascii?Q?s6aSzwEl8FYJWFxl3bu2MUeJj9kH/w9vXxETf9AvxSPqA1wlVXhGlVjBbZmo?=
 =?us-ascii?Q?BaggVQazGpzU29RAzEWRguHQaopDYY51XTWuKwtNvZ4R7wbXIPSVpQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5089.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?hiVW8vnC7Stxs41euoxozDxJAADtBKVvI7regCyiuxd/tXz98pruXSV/U0SZ?=
 =?us-ascii?Q?N8Ut9GQW/ysPJsLZ6zzVUGP8pRWuUltGpsLvFkQ3FwL2MgpyZSJ8jCS7vdcx?=
 =?us-ascii?Q?vMj+oTZaUiKgqES0MJcwCnlu2T/TczlAlBN4PDzn/GeZsCNW0msy3YQ7NOhV?=
 =?us-ascii?Q?PRV7guaUjlOeXMly35ZP3h9/0S26F7tFuQekQCi+ZRxnOHeK4msqR1I4zvwi?=
 =?us-ascii?Q?Ku2lG2Z2gtHVUEwJFn7mLbii8NyvPah51xFmuf0nr+xIIHFOxlbWkechFZxg?=
 =?us-ascii?Q?6iaMhrINhDegAo/YVy34T4lIKRtxeuO21U0Vc1lBhq3bhoNMhhhKaC3J+sHf?=
 =?us-ascii?Q?ClVWETRjpjfL9xFLK5t+2tXbnBKRQvnynH8oJI1bCIIdzeAv29+cmZM9Y+3c?=
 =?us-ascii?Q?tjiA6k1M2ztA0BAMFPOjE56tTQ3xQV2ybiS3VhWoAqdNm5J6glPNH1kBrsbE?=
 =?us-ascii?Q?zQotaTDhoB4hHylf2FJCIs4ia91/QTI3SX2VRg4HKU1CYS88VP+OePV9tCW0?=
 =?us-ascii?Q?XT+3gX6VJtTmi/OEoGJs2p+G+cDtnWi6wpyGN+Tsf+HTsasWde703h8cN8s5?=
 =?us-ascii?Q?OwR5u5hmNzMD3e6VMv56icSY5sd7J03sr5UwYyALyRwhylJq0bhsp61Zqt0d?=
 =?us-ascii?Q?DcjqZTJft4wDFV9a0ubP7S1sBhMWKKxg6u5+R0/qq1S4cLhazmYPFY1RKzuN?=
 =?us-ascii?Q?HfCCEm3NpXOvjCYDARwheKNNNwaItsqoueUbHUiad9GxKKMaIQE6xa7IlTu/?=
 =?us-ascii?Q?JjfE8ulGHOdii6V9pD4GPmD0PZ8r0lwcFFMQwfWSknhzAXsooiMVXuGw7Yf/?=
 =?us-ascii?Q?BaP+PPl5yN8iS2cAUVQxtpdexw5d2CD0EWa9hf69uBckGVASs8j3e3ErrdRT?=
 =?us-ascii?Q?Ojnk4fmO6wKnniM5ExU2cLq6ZjXEtK3c+pF55+l7Bymf7uNWsPvYK+wqELE+?=
 =?us-ascii?Q?UAZQkSA4txkvcvFylwcuGqQJETR+G2DmmBhg/gQ7KUQXQT1WinFMB5GjGnCE?=
 =?us-ascii?Q?LzSF0lydSNxQlVz4BQ4SS/Ufu3FOC9GjTOekLNLhQxHwjNLVykPNt8lx3ubV?=
 =?us-ascii?Q?noYUgmLzA/3fl73cf2q560bQ8tskcFN+HNF8kLFoWbt3JT9ZTPI0TO1yPINS?=
 =?us-ascii?Q?//cCeNKRsCfhWeW+0xB7JXYysk+hLSwLrZZ4O5rdna0D7r5ePPXx9lSje4Fa?=
 =?us-ascii?Q?llqLgacvuj+e+GEISVScrxKXzK0ovxQsjR3sumafY+1OQwnGFGZFopouWwXX?=
 =?us-ascii?Q?C6ushT06zJQXNzstQOzlSZis3OUthRMwl4U89128+eoA+kM0mGe8IlG68XKa?=
 =?us-ascii?Q?Aiv6MD2PnUqb++JdLiazzDjejxWepOqfFjBmZf2AJXVI+wnHCnBPQVtJW4Ce?=
 =?us-ascii?Q?vvjelV/gGkJBU+AXg2B7Is6SQh1nsA9HkuhbQfYMdHr6tRUN1TkV/DXZoGAR?=
 =?us-ascii?Q?qE8/FQHaMZPUO03MeSuW7rGKMSEVmgYL9I9EqViWCEgTdpXbyDxYz0Pht2kU?=
 =?us-ascii?Q?AfwbeIsge8BAFu5+1JBb6JBkaU+gfsDuZq/a4bUAwhqDzNtK4Metsdt15Npc?=
 =?us-ascii?Q?ya61SefEAjc3V1SdTiM7m5P5QaCaEf2cacii1ILq?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5089.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9fdd461-1152-42cb-b602-08dd6671be02
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2025 23:08:06.1490
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f22ozoGiD0ithUKYUkvmwGfqdxCOPIsYyfCPK/e9C8mu4AfaAbtuZm2q94sMPAmu7LHRztGes/qZPBC7Eta38tz4ERt0rDwnD/VC1kDR3Nc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6120
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_160840_582074_2DEC0DAB 
X-CRM114-Status: GOOD (  11.87  )
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



> -----Original Message-----
> From: Qingfang Deng <dqfext@gmail.com>
> Sent: Monday, March 17, 2025 8:24 PM
> To: Andrew Lunn <andrew+netdev@lunn.ch>; David S. Miller
> <davem@davemloft.net>; Dumazet, Eric <edumazet@google.com>; Jakub Kicinsk=
i
> <kuba@kernel.org>; Paolo Abeni <pabeni@redhat.com>; Maxime Coquelin
> <mcoquelin.stm32@gmail.com>; Alexandre Torgue
> <alexandre.torgue@foss.st.com>; Ong, Boon Leong
> <boon.leong.ong@intel.com>; netdev@vger.kernel.org; linux-stm32@st-md-
> mailman.stormreply.com; linux-arm-kernel@lists.infradead.org; linux-
> kernel@vger.kernel.org
> Cc: stable@vger.kernel.org
> Subject: [PATCH net v2] net: stmmac: Fix accessing freed irq affinity_hin=
t
>=20
> The cpumask should not be a local variable, since its pointer is saved
> to irq_desc and may be accessed from procfs.
> To fix it, use the persistent mask cpumask_of(cpu#).
>=20
> Cc: stable@vger.kernel.org
> Fixes: 8deec94c6040 ("net: stmmac: set IRQ affinity hint for multi MSI ve=
ctors")
> Signed-off-by: Qingfang Deng <dqfext@gmail.com>
> ---
> v2: use cpumask_of()
>=20

Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>

