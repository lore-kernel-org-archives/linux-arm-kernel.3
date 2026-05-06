Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7758BCD3424
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 05:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RT5BlWnO9T4hQH9BBtXWy670sRUAWHqyNbyR6rdlbgA=; b=vhpCsiS6zGYBH0CFpqA9nwl84/
	2FsHQ4PZpYa2PtG6F+hFuOAGAoFbZ6Lvaw6mQgIjHHk6PFcRY5bADlxx9wgTrTGCILweinQg8hLq7
	Xi/Vb+V6KOn2FkRRcfZS8BKAG4QwOlAt0Y7RGRQMcX5HzLWMm1q6Rn+05vCGTuGt0Xe/1H6AIIdfX
	P8HDhjBrE/B0THmaOqVDpZLX4c4irHIJ1ZZu79a+BO8rcQAr6hZ752y1U2gTcabwcugdPz3GkeYtc
	bLi0Qabkz0GigMqdZhwg35CVzzY4c+bFe73vuCkmrEgqe+rG/UTIuYd9Z14HeFGkSD8QIq8619wLc
	t1l/zVWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKVAo-00000000pNX-0Wrq;
	Wed, 06 May 2026 05:51:54 +0000
Received: from mail-japanwestazlp170100003.outbound.protection.outlook.com ([2a01:111:f403:c407::3] helo=OS0P286CU011.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKVAl-00000000pL5-1pfI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 05:51:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o0PclYGdeIlNI2AP5GZnAckJwqicWhTzsS4DAcEaZEofQcjXEkKNEU5zLPBa3c1p67RP+mLcJAg7NlpIsTeSkAER/ZTaVWXEydYXe/PtfiBbVI6xBsm3RVhHwgxWmLKnv/8PQNtuHFEIcgeVEXiLlSus7sYyhpogkRqLxNvj+b8w5ScqxCqF0iKU1bHmLXmy4+WbUsASHPqiYBPU8l5h9XdKeKiyMreYB2+stFdc6TznKrxetZ9Qo76jldYyjE9lHZ+CO3eMdkfRenKxulB1z7ZMEg1ANSTeZwkLBys3LBMATq8oP3fZZJQFMH6YPfIlSrOZqCV1u5LOdOZFdao1Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RT5BlWnO9T4hQH9BBtXWy670sRUAWHqyNbyR6rdlbgA=;
 b=oSOH/nUHl7rbjebiwSQaKvKTJSUZ1oh2GAJm5Jq4RXYrkJaEP42J0JS3toF3DpItB+VIvIeJ6gnuKSAB7PwaNXW2UgrIxKRl7ueTw+uAuRAmWyqEzFU2BirLqfsF8HLrDF4e/t2sZJGpGKF9NIX/JVvgsk6mErdsNj+aGM1zgHqBUwF9EWkb8tIWPIInSGXm8lW6V4B651glGj0AhrJHjzlIeale+YgvEgVYDQUbdClOVVvLfNPgNNgpiiZCBLNMyJ4P6UsSyfbakCBfymG5F1PMe48DaavCiFn8ptVm+PtnY7fElk+Zq82kyWOO3gxKZ8cu1/Sgsjj44Q6YWiAsOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RT5BlWnO9T4hQH9BBtXWy670sRUAWHqyNbyR6rdlbgA=;
 b=mR2nrMyc6AD1+16iJ4pZRo5TwP5mORyOEdRShjJ9Z4lLSyM6udilVlwbBGwisFz7UaIYrKOVgYQxIpYdbQrzAJeXcFXa7oKGPlch70Oh6g7FFoR+CYL7rxga6wQu4KFZUQEuIn6xrxMZ40FTLDrLcJDMCLvvKL6W/9dExJB0BTw=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS9PR01MB17969.jpnprd01.prod.outlook.com (2603:1096:604:475::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Wed, 6 May
 2026 05:51:37 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 05:51:30 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Frank Li <Frank.li@nxp.com>, Francesco Dolcini <francesco@dolcini.it>
CC: Alexander Stein <alexander.stein@ew.tq-group.com>, Daniel Baluta
	<daniel.baluta@oss.nxp.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Geert
 Uytterhoeven <geert+renesas@glider.be>, magnus.damm <magnus.damm@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Markus Niebel
	<Markus.Niebel@ew.tq-group.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux@ew.tq-group.com" <linux@ew.tq-group.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 2/2] arm64: dts: add tqma9596la-mba95xxca
Thread-Topic: [PATCH v2 2/2] arm64: dts: add tqma9596la-mba95xxca
Thread-Index: AQHc0Z2Ooj6959kMaEejp/GLYFdXNbXqlsSAgBUmV/WAANggoA==
Date: Wed, 6 May 2026 05:51:29 +0000
Message-ID: <TY3PR01MB11346889F5882CF6B047FEFDC863F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260326111803.1248934-1-alexander.stein@ew.tq-group.com>
 <20260326111803.1248934-2-alexander.stein@ew.tq-group.com>
 <4f436a21-ecfa-44ef-9002-c64ebd5e30ee@oss.nxp.com>
 <5988897.DvuYhMxLoT@steina-w> <20260422114213.GA68897@francesco-nb>
 <afohObxES9nIQla2@lizhi-Precision-Tower-5810>
In-Reply-To: <afohObxES9nIQla2@lizhi-Precision-Tower-5810>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS9PR01MB17969:EE_
x-ms-office365-filtering-correlation-id: 31ad9f24-c029-470b-27e3-08deab33853c
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info: eQLvImLtbT6NHzp7JJbWGZTccF9WH158AbV+kn0jTO5KN1FipGuCiE/Ifsrkp0sW9Cr05sN87ZEP9dTXLlYl97lva6O+KzfNLqnhLnL4GVvLYh1Z56yRY5ZYGPGQVEvUL28UgRd2XW1PZoZPxkGxofw5Vp3T6KiXBuwr2J4hOas1zvZOIerYVVQmXIBDKIDhn0Q4scmLcMSWdGDTVIqVV5MND2Fxz7P3qg1HqP4jtAiR1bkvXX1HMXZQErAxRvT0I8e5uI/B2/DeoAaqQ9h50abPDXNJWGWxJeRq+dGRFqXOAJlOW71N9YcGUWrh1yawuD6XVASYNv3R61kWJa1EJt6dPjy0ATRAFLy5n6OdHZipQV5uymx3pGXDoWGqzAy1LxQLFKk93Guaia85qL38TeWSAV6uu4hgwXK4iOPYEltRcL3r4ElOYBZUqKMnDR+/msAtB5qqosYm6OciFeEcN2Fi4hHIt6/mMFVSRcWA96zlE2FHhatageXoSuK0RsrSgNdACLzyLQVvh+xB3NNVdF/B54Cj6MvNSpJZ+lz5uk5INv7yF5H/L4R3x7XZMs0ZNEmO2y+HbnPkHEGipHQHN9kdTSuPkon6JXN+32CYAYUTHK/c/Zw8KXpiVyOeEe90GObzC/V6DV/wzc0QaZXM/41SwAhcXro1gGkVElCldc8ix1P1au8v7aOYKrDD8OYz/6cGm23Sy6zrf/DIudhS/SeFAfu5isrO7CBRhZ3wM/qMTQFvsD7k/faTTQwNDSz9
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?UzI4Hey/oqPxq+UmcLdznnNQsE01aKtI0K7zyObr3iXX5TQ+L7khUSbZINQb?=
 =?us-ascii?Q?IuTgn6+niuls18D6APwJZi8X2j9iG1oLCxf5+DaoYa9zw4V1J+Y/tZeh4NNv?=
 =?us-ascii?Q?wyDvf64lqBTx+alxIKI6SlQ3GX9Ol/Bf1WPdsvJRyEGOMfUgGG/GLv4vHasf?=
 =?us-ascii?Q?HiZs55xL0lE0P/YowUvLxpfM0ABjtc5y/OvTam7N3Zj4A2y3lVzw3/kgcgwV?=
 =?us-ascii?Q?NMPz4Lm9Wsls1Al2OR/N2bePyWUuW6ZsCkKb7uqGxaBA765oZb3+m8Dd5t3g?=
 =?us-ascii?Q?0h3GRxbOtTD5mWOSJ6c+hPyaNJOYAowODyOscP7Q9f8Yrk31g/o5wgMSqvil?=
 =?us-ascii?Q?EfYNlwUJ4W1lzGjy0r1Xpit29rPSZG/Yw6XToiUhbrFI+SwrHs7SGKGrtO8Q?=
 =?us-ascii?Q?oMXB2gtMo2RoMSMqVS+8DBP5mi79lqDDcF5NAFvCCqmqyGNUe3dQz2ZwnHP+?=
 =?us-ascii?Q?7TPmFjdU3zJOerZ/Mm3hvGDeIPSxWv0PjM0+pMUOOjdHeruO7sxr2ptaP5CG?=
 =?us-ascii?Q?7xsPZGBh9fp0nCcvEWh1o4yDTyakJj8pV9ztPp5f57AesHN9HBxn8PhAIxni?=
 =?us-ascii?Q?VHvltJ4zJGWiYheD4kyXvlNJgsPXjxPkhpy2uGLUHAXsBTxQ3S9F0nvJDX8N?=
 =?us-ascii?Q?g66I+NSMdhy0ug8kYbTqAVP9OU5VDimIHN+CkCQi4CpPMojQsOuhgJ7Fqdvb?=
 =?us-ascii?Q?KkhSfYl0XJCeToIny9tImTftXshVVb9R6kSL1ZSqZPi0Gmx/cFjVzVMiT5q6?=
 =?us-ascii?Q?Bd49F5vozHqwT8v+nEdvhqgFmRC0MY0hmydGBvDR71RxBIz7QrCO8zEwaS7W?=
 =?us-ascii?Q?8t32PiKRyOlhqfq/bOnfXwEIB2VZ9CTEQjMyh/fZcnES66amCA4AjlBNAeQT?=
 =?us-ascii?Q?Ptv34aDOopE10pGOGitIxmD1+InYXUE2l2wFLBuZ/TUE0MgQr9zERV3yUm2W?=
 =?us-ascii?Q?DR3aPoinZO2yqay2w8AFaPesnWDPL2QT2xabTXLNMnZYwxeVA9+RAXv90NGd?=
 =?us-ascii?Q?kyvicJurIpHIpaTDQDmkqYE2UO7gWzfmvitQqxIDoD70L7cclCE3RrgaYM7q?=
 =?us-ascii?Q?82ncFGHJERj7ZY6JWF5DvhMgBdR/5jnyWIm2EAmIDIsTlA3fQukSCmHy4+tA?=
 =?us-ascii?Q?ECILbCyD6ridUo57MbLYxmcSH5Ys9PWnNMluYnNL85jjUVmvByEB7slI07Ib?=
 =?us-ascii?Q?v7ZWpSgf1mf/JZko8v1aCQpwgcBwTRnlcYmdWylyNlmiFVw69CNsTcBAK0i1?=
 =?us-ascii?Q?39azud29NpKrf4HjkVUzHtGz1jNF5J/B8s32L4ZnKODH1QeueooVn8IBZ9tc?=
 =?us-ascii?Q?qdl00AkFHoPN94iSoryEMplt4iB0bSPmfh+h6LtGJU8mZWcxaAvDsNNwdF0u?=
 =?us-ascii?Q?7LDQuP1/ay9OHb5WbNSP8Tud2Dr3Q8gv1iAv7odAwyOqh8ns/ptII4hUAYef?=
 =?us-ascii?Q?COCr/ojUwcxTjyd5G1xRcZpO8wM8hrx5sf+gYEN+SjV3XtKHYhHYMWyN6JLn?=
 =?us-ascii?Q?kvW3hBpznKWFg5E8UcPMngjOrs7ClKdZsl6tgPLDfHmYG/IJGYFkVlOugX29?=
 =?us-ascii?Q?ycCatZJ4LKON1cK0HccXecisutgywIA6Y3r2uIJMGL6Xzswvh2C8w3Do+u26?=
 =?us-ascii?Q?F0yqbWfo/dzLIt26xLk5iqAP5wDMZcAVn+MxmL6ydrWfvGITZwnzmcYs/5ek?=
 =?us-ascii?Q?REMmS7f3alJ5S+0vnROs8XGJfIKKPh/Z0qqOJbjpxrqrY1zp1wsU8fuloMqi?=
 =?us-ascii?Q?4fMQe0HYZw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31ad9f24-c029-470b-27e3-08deab33853c
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2026 05:51:30.0002
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QpD1aMjnqiruE2KNNTwUlqd7Awg2BIEiFGhgGzB1pbmQlTTy4tpTwGjfa4sljYBBRDqYn/4iCtYPu3nggKChp1GbvCer6iJiR+SgqbiliJI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB17969
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_225151_487295_3F9B8BCD 
X-CRM114-Status: GOOD (  11.42  )
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

Hi Francesco Dolcini,

> -----Original Message-----
> From: Frank Li <Frank.li@nxp.com>
> Sent: 05 May 2026 17:56
> To: Francesco Dolcini <francesco@dolcini.it>
> Subject: Re: [PATCH v2 2/2] arm64: dts: add tqma9596la-mba95xxca
>=20
> On Wed, Apr 22, 2026 at 01:42:13PM +0200, Francesco Dolcini wrote:
> > On Wed, Apr 22, 2026 at 07:58:11AM +0200, Alexander Stein wrote:
> > > Am Dienstag, 21. April 2026, 16:48:25 CEST schrieb Daniel Baluta:
> > > > [..]
> > > >
> > > > > +
> > > > > +	reserved-memory {
> > > > > +		#address-cells =3D <2>;
> > > > > +		#size-cells =3D <2>;
> > > > > +		ranges;
> > > > > +
> > > > > +		linux_cma: linux,cma {
> > > > > +			compatible =3D "shared-dma-pool";
> > > > > +			reusable;
> > > > > +			size =3D <0 0x28000000>;
> > > > > +			alloc-ranges =3D <0 0x80000000 0 0x80000000>;
> > > > > +			linux,cma-default;
> > > > > +		};
> > > > > +
> > > > > +		vpu_boot: vpu_boot@a0000000 {

No underscore please for node names?

Cheers,
Biju

