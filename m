Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D105CD98CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 11:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P6h2sLh08lZK3qa4pqTgD4XQ63Fkd1Y8A/812uxmia0=; b=eZrv6sL7eC5D1JrqCXwl7Q0rZJ
	DYJkQUUwi+RsqDp/gGpVilUa+UQT5eFYVcE9lEW94iqpAlSc2VbRUt96PMMj03/H0MIFOzgCYhbU2
	NqcDvkUGPrQWvFWu0yTztqN0lI5vgfb+KQZ4oS/MhNmkCH1h5nCk4ZJ1/BLt6NeR+5QNKf9ISHq1n
	nYpFkuRkFHghuai7G1Kg6M++IkbbQD5fe1IVnePdl7w9ebQYFPFTEtNjW3WzLP08WqlthojPFY4LA
	/3+rv9na8ZwEahW5nWbhh8JypVEGZVA0B+IFAjuvAbAMBCzORQUR8csl32wjBfXUxvGhrpZ9jU5ey
	E2W90t3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXe2c-00000009Lnt-3aA9;
	Thu, 11 Jun 2026 11:57:46 +0000
Received: from mail-japanwestazon11022098.outbound.protection.outlook.com ([40.107.75.98] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXe2X-00000009Lkj-32YU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 11:57:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SDEvdUSh1vaD/wD3BX5Ohs4ovrHAUduyuILUeoJWPBEdOigqn2j9cNJYOpUmg6NkXCv4KsAsr7/gxAMVs/Djh1bW3jVEttg+g4QtHh9QNKF0nC2v8VMr3cICL06bKjRR8T676KI31FqIBYbhKKzMEoaLVUGM3eDXgfc2lFrVN8HBa0dF6+4kCFcDogmav4APBnrVpRwy0xoH9Ouzir9RAVOgF6tT8RulCc2v0q5dSWrzjIT+wyUQSs0JMOXEf/ABcfLz69Tvmkrq+K9lYwY9/Qe/ebNnHhdmXOp1iP701y3a4aNxUKc6zEBstU5uLIDam7Vt/p/5v0JspJlJKPNJDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P6h2sLh08lZK3qa4pqTgD4XQ63Fkd1Y8A/812uxmia0=;
 b=gjTFkEdAlPi01YdwCy2upD2s4WZySrZ11+09uTSQrUoxYStxz6bIeyvvVQBc0cpkgso7Nfgw/glJCGUn1u3bva/4DmJ/rUgG56lwTwpn/Y/VXcYDn1Tp7wO8PURnbD7F91I2TbIqEWaNO3E8rFi9HscuFG9aMfeg5M/T7fS47v7j2kIncSuQpiQ4X+vaEYKHxEJV6IJn6YAWuzlLT7kf1ciVqygny2DRd98NxsbUJCTNjzYlb2zPbikMm6EBZDncM3gCMdTSa3XK92NTgtdT7v4APx/LsW1SndGm5kyzaA64wKnWJJn3t3CEEkKN7Inn3hbCfTXj9/fcR0s+d+DNTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from SEYPR06MB6226.apcprd06.prod.outlook.com (2603:1096:101:df::13)
 by TY0PR06MB5846.apcprd06.prod.outlook.com (2603:1096:400:277::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 11:57:20 +0000
Received: from SEYPR06MB6226.apcprd06.prod.outlook.com
 ([fe80::56e8:777c:d80e:d364]) by SEYPR06MB6226.apcprd06.prod.outlook.com
 ([fe80::56e8:777c:d80e:d364%5]) with mapi id 15.21.0113.013; Thu, 11 Jun 2026
 11:57:20 +0000
From: "Joakim  Zhang" <joakim.zhang@cixtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org"
	<sboyd@kernel.org>, "bmasney@redhat.com" <bmasney@redhat.com>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, Gary Yang
	<Gary.Yang@cixtech.com>, cix-kernel-upstream
	<cix-kernel-upstream@cixtech.com>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v3 3/5] dt-bindings: clock: cix,sky1-audss-clock: add
 audss clock controller
Thread-Topic: [PATCH v3 3/5] dt-bindings: clock: cix,sky1-audss-clock: add
 audss clock controller
Thread-Index: AQHc+K60udpj3xarVkqOle4McmLLzbY4+k0AgABCq6A=
Date: Thu, 11 Jun 2026 11:57:20 +0000
Message-ID: <SEYPR06MB62266E4A693A099B9A49C0E6821B2@SEYPR06MB6226.apcprd06.prod.outlook.com>
References: <20260610075645.3581145-1-joakim.zhang@cixtech.com>
 <20260610075645.3581145-4-joakim.zhang@cixtech.com>
 <20260611-numbat-of-unmistakable-excitement-f6cfed@quoll>
In-Reply-To: <20260611-numbat-of-unmistakable-excitement-f6cfed@quoll>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB6226:EE_|TY0PR06MB5846:EE_
x-ms-office365-filtering-correlation-id: 9d75962e-a966-4525-9efe-08dec7b09790
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|56012099006|4143699003|38070700021|18002099003|22082099003;
x-microsoft-antispam-message-info: Grc6G4QA7DAOkrsPMSBJkJRScuHtigSUD7FchZdYxyqRLktFdeI1wpWuxeB1N331DEhPVLMZBuxrosOxMKUfRgDriFZUU9qrlnvoGlJvbga+vpFg/xfn2sVkM4phOLbphQKl08qVbSht82mksf+aLRsBNvcYRKChcNBfqoGUZnuf6c41ZrLVq5ysvcWEHq8c8WpK21SxYJcxyhPL0DzxlaKiOOz8EfttjdsVZzCQ6TedY1HYInOFI999BoxSyXDkr0X7R7+UgMRRUl/rhtTkqFCLW90BZ2/PfuTggBZuSACPV6B3qUR2hpBlgdVbs9Np+ml91Hs8FafAJPrsBw0+G1i7hXB1kdOX109MIuApoSW8lNBU1mI3jxVRYoHMeqEIi3qKik06PNfG9mAZJKJs949rXS79s8M5wgHxZcm6hJc5UQPc11wHxTsy9E2XkHyqlK+gElXbg9DCmkCkAbmoPCaZBz0Ce33zAgq/LrnzhUc5TW0DKp7JLkpUvgT10OV3qz8BTAoaHGHaKJ2wSa1xa3MLa37AE0rMYyHe6N6O6wo9tm/qHMXC2qCtHzCHKB/TQgz/H4X2i13NBWDOGN3nEty09QVFTwz78/NLvEoUBdvq7nk5FTlpuRFxouw/dSamz3vsKFSRooP8mqV1v39Y9PoJHwQMDD3bIMtIIYDK59FCD8Kz73+pCSJTZL8rEHGjRR5FMgrRw4GsQWZ8gtz0md4Fm0zuHxs0oFHteWAOXLFY//LWo/NJk7Ldcwx7kKNm
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB6226.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(56012099006)(4143699003)(38070700021)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?irlcKqG+YyrSzami2Q6WpWN0DYSKPCylLlJEE4qYLIUwMXaL/pv65LheBiHn?=
 =?us-ascii?Q?MVVw7D5Pw8PsVDb51zY5tDZMi6u65kRluDSJn8NN7Z9fKF2Z/Ly2Lgy0YrK9?=
 =?us-ascii?Q?hrEklOCJsGYURSXOi/CH3AGzN1j6o+xhkf8HHKSV7MmjWCNiefORuTUX6hfN?=
 =?us-ascii?Q?A2IM4POenqiAYIChCcz+fgCy7mPgyM0reehRGaVqSbpETdGhV+FT5UtNUjjo?=
 =?us-ascii?Q?eur2Zf369EFEGHkbyOzL+44+NrGF5r90BvpbvUI3BCnmnab3GHRqKYyhcEnV?=
 =?us-ascii?Q?EteVGkEepGQDIMeSHKRGEb/qB6MS+e1pcmqtY56vWKJeFMMc3kn8u9X7qXra?=
 =?us-ascii?Q?qd1n/0JG3XiX2W9IcRJ1nl31L55WctovrvKeWLv7Qf0RGt3vtVZMZ4AejFrN?=
 =?us-ascii?Q?pGYJU4AQA2EzOyDbK8MaOlPUFepXcPpVzV0cvbzrWz3kyvdgqp8uUF4GDbc8?=
 =?us-ascii?Q?CC4b5lJq/irUT9jCi0u6eqhkWU6f9Tb0R1/Hs/fxT+pRIOvm6/dgQ/dF/cIA?=
 =?us-ascii?Q?iYQ6Bke/POUQt5aRe4OAzJDD68nH2Vvm4bCIdU9A8koHmHksNXMZPLhDZNUR?=
 =?us-ascii?Q?cFs8QDaNQ1mzIDt+xWtiWgHOZ6mnf70TeXYolEaq4XDWb3763qY+8JZz0+qq?=
 =?us-ascii?Q?2rh/m+bOMASHR33AHaTGSchM8OgIfrOtl+3PcXbhnvor/Vltz2fDgt+OFSYo?=
 =?us-ascii?Q?+1qpwP0++3iNSji1mKUhbPNY+NOE+fA1keFZ0F3VF5B6FEhjzYkLuDgowzMO?=
 =?us-ascii?Q?gHEVH3gMFG8/XZQOeuAX1gO9/G7SVVkUkqAFMrQlABiLBmiFLPjHRORy0xls?=
 =?us-ascii?Q?YT7Ny9QlJXQmJay0u0p6WRk+1L08TzjFvp9AE0SX7+T9ZMyj+E0I3Jo2F4sD?=
 =?us-ascii?Q?Q/4ZO+dhAvCmz7UrxoyHHd3ptOpHTL1dEEN36EpEq49G2kXUftq6kISSnv5n?=
 =?us-ascii?Q?bOcQTeeJZyceqeXr7oyIh+oL48Nb9DZmq9/XCMMmGdYUVfxLt8fMREp4JMYb?=
 =?us-ascii?Q?mpHGGS7BUgHeJKzSbprB7MjTwYyISnO7UydEIqGY+DygbLE+SKIJQOvK/PtF?=
 =?us-ascii?Q?WrPzhZ+ww6F843O91p0yvN9agE1TuwuiJgQYh3/pf/elUhRl+3YHVkUl6Sn3?=
 =?us-ascii?Q?/CwNxDL8Rad51rC4gqZKTS8DjZrbL25qWbhTThASZ1GaW+utl4HizP5hafEd?=
 =?us-ascii?Q?VdMy/hYcLOcUJ5EpW4fQR+xeQyTE4IfhmtUZ5zqWVVxGyIVndiATQ5q16KFh?=
 =?us-ascii?Q?LoJzbYZhSjWck3Ikz3UAsX9n/8JFyO8uLpf65p4GKqk+EljTpKf8elmmA77C?=
 =?us-ascii?Q?72/eKtswwMRkOcQeLCdYIG1NLQeHkAhHhmuNY6kmGxQ0blFrGYmYvIJ/BVM7?=
 =?us-ascii?Q?71tyvpB4ddl5TUZjqJ8+2MyMzxj2JQeOSTBNh5dUvg5jnyt/EyJaXV4binMN?=
 =?us-ascii?Q?eMpYIzH4U/ql8UbKs+OpFXKFB1A7pURMl/p4PNQkH2W7dyQycblpLIOaBqzW?=
 =?us-ascii?Q?tAA2oehLqo5SvxXaaOYVXjhGBMCMZlj/7NRj/9FLW47bnTMszCLoW5tX9EuW?=
 =?us-ascii?Q?t3uy6LJxZ2JTGIhFQsRV3RvrzwOT/EvElWMA30a/tkV7QMfdOEO97cRkREEx?=
 =?us-ascii?Q?OqNLcOCy2x36FLhloX0Uy+B/MNIquYexrYmgaxq19/ad8zgvWYfPDLpXea6r?=
 =?us-ascii?Q?mwiY8+xREi5Duno22VmZLn7iPDj5VMOOVDCB3MRPQMRcL9gkJ5E0rsQaZzIN?=
 =?us-ascii?Q?JvQOOOKA3A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR06MB6226.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d75962e-a966-4525-9efe-08dec7b09790
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2026 11:57:20.4112
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k5TvYiJNvjqg2dugIU3GlQC4bdA49zhO7R3ilp4CQ9LHwW1vX7bgUS2y0AMVcTQvkCuUH1b0Nmj5YyYViIShb1CilYy2Jv/H2hMCO0U+ZR8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5846
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_045741_768427_D63B2A0A 
X-CRM114-Status: GOOD (  11.16  )
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


Hi,

[...]

> -----Original Message-----
> From: Krzysztof Kozlowski <krzk@kernel.org>
> Sent: Thursday, June 11, 2026 3:42 PM
> To: Joakim Zhang <joakim.zhang@cixtech.com>
> Cc: mturquette@baylibre.com; sboyd@kernel.org; bmasney@redhat.com;
> robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org;
> p.zabel@pengutronix.de; Gary Yang <gary.yang@cixtech.com>; cix-kernel-
> upstream <cix-kernel-upstream@cixtech.com>; linux-clk@vger.kernel.org;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org
> Subject: Re: [PATCH v3 3/5] dt-bindings: clock: cix,sky1-audss-clock: add=
 audss
> clock controller
>=20
> EXTERNAL EMAIL
>=20
> > diff --git a/include/dt-bindings/clock/cix,sky1-audss.h b/include/dt-
> bindings/clock/cix,sky1-audss.h
> > new file mode 100644
> > index 000000000000..033046407dee
> > --- /dev/null
> > +++ b/include/dt-bindings/clock/cix,sky1-audss.h
>=20
> Filename must match the compatible.
Will rename to include/dt-bindings/clock/cix,sky1-audss-clock.h to match th=
e compatible.

Thanks,
Joakim



