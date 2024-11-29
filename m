Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0745D70E02
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Nov 2024 02:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9QtQ7EL71KCn/mIPOn+Lj/SXkYM0COhfS/x8v5MWGUs=; b=4sTKax3ZcWU/0+R/NhCywGIMK2
	oXCEGyVfjE7fe/tlxytHr/BgiIXBBZUJK3lpJiWi8teRfvlgq/7YTwuUwzkaOVesAn7VO21V7mapi
	IPpaJtyisSMfJsVumxbzUqxSoGwWSKofod8mxUPb+TU9t45IP/M1EHT5hfQzQTUHaq7Z+Am1tJSHm
	SYb5LR7jlBxU7jU+d+R9OU7ukgR/PBhkgM3xn9Fhs2b+1neg5tg+BAGi7ycSot+udNmL6FIeUDrJD
	OHk1PbhzIRJ1OP2PIQ5pQi6ukiTkfVFLC5k45JSSjku99aXlBhTNVqEDlZekiubH2oEuzkXkU0el7
	xVFvpTmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGqg3-0000000Gk24-1sGN;
	Fri, 29 Nov 2024 02:24:15 +0000
Received: from mail-am7eur03on20601.outbound.protection.outlook.com ([2a01:111:f403:260e::601] helo=EUR03-AM7-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGqf4-0000000Gjxp-2onT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Nov 2024 02:23:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bxOdSpQpFqrLotACoKzoHuEpGVmho4OPazpjYhUvLZLYLvNw4jJvQFG1d3b0j7DFXbk4nGkAT0XUli8ZvP5oo61QEm2KloAZTs4rgglqZj+q+14W67A860SqzMTW4vaOScnb4c2BNXWo35GafXq47XOkucZ3wuoHI++Iqd7s1VuZioU+zkp9StOAgzt5VDQWXsXVhZNnMWvo+OUI437wZWjgzKePRgui8k4XLxCnZqZqe/KMyezF8XCSSYAy3f5lzmF6IGUfibKlIWXkb/T2WO3LnI0Gbmr0GNt/0vH2i8aPUN1TX36QROB0q8QRgqq3iszocbPh86gqHCSiQI98zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9QtQ7EL71KCn/mIPOn+Lj/SXkYM0COhfS/x8v5MWGUs=;
 b=tcJHmvNDkcCg9Xb5ZMIc+d9cQ3y3K6j9Xl3keK13Gfsw5VhOIZjw4jybnfp/7KMjMYJVf+i8YvIpbuHgsG55LoANRdBv6v+nvkK6c0zd1ZaAoypQyv5J2/WMYscJPxZVL34SHI0oTl2MnvJrCEJ1uokl2daY5E7DeYlbA0d2hYgZiCG1Dk4dB8uDNPLkiWVIKspIXmz0OIwnhbS6573bYcWsUx5D39IpPlsvikDyWCBIHjm+UtdYV7PwhOmD9sE3RsRuDeP1qFxLVmnM2ylDMiMkqUSPO1zzeITxXXK4fR2ZC2sdFv5LsYex011S11Bm5XNzjjmGfG5NIJe4YPiu5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9QtQ7EL71KCn/mIPOn+Lj/SXkYM0COhfS/x8v5MWGUs=;
 b=RrL6hXFV0yJskAVuo6XMMpwg2kYT2XNlA7pLsuxYyTFecpED1Ha7LdC4cYGOGxLdRrvVctvFuoEZTtQPO5gt6XFeb5OzUQSsU+QapacI2pkudQjCLATUuS86vwUx+BHI33DuKEMh+1i3KsLGsGTbJ/gStNRO/uenKgr4f93oFX2luRs/Wbhd7H5Ioc+nw2fVxPR8RAtA3BORzjT3BqPeQY36HwLUOepjtGfaIQiCl0ZLXmZwe+UxGpcGF3DVL8D6bKIWuyNYwf/cC5Kb6w1//DR3h1AEvY46ndduBJ+cl3ym+eged+f0jzgbPvjlg3IlD9QkQ4t2U4VMxHv89gh4QQ==
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com (2603:10a6:208:5::22)
 by DU2PR04MB8646.eurprd04.prod.outlook.com (2603:10a6:10:2dd::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.15; Fri, 29 Nov
 2024 02:23:06 +0000
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0]) by AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0%4]) with mapi id 15.20.8048.020; Fri, 29 Nov 2024
 02:23:06 +0000
From: Carlos Song <carlos.song@nxp.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
CC: Frank Li <frank.li@nxp.com>, "o.rempel@pengutronix.de"
	<o.rempel@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>,
	"andi.shyti@kernel.org" <andi.shyti@kernel.org>, "shawnguo@kernel.org"
	<shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] i2c: imx: fix divide by zero warning
Thread-Topic: [PATCH] i2c: imx: fix divide by zero warning
Thread-Index: AQHbQgWgNLJr5F/JR0akoYNTCng+0A==
Date: Fri, 29 Nov 2024 02:23:06 +0000
Message-ID: <AM0PR0402MB39375742611CFC0FD24BB682E82A2@AM0PR0402MB3937.eurprd04.prod.outlook.com>
References: <20241125141521.1612947-1-carlos.song@nxp.com>
 <Z0SxUhBmp06ScnfP@lizhi-Precision-Tower-5810>
 <AM0PR0402MB39372A814D43DBCD5AAD1595E82F2@AM0PR0402MB3937.eurprd04.prod.outlook.com>
 <Z0ke6xBY_xnnh4Vc@shikoro>
In-Reply-To: <Z0ke6xBY_xnnh4Vc@shikoro>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR0402MB3937:EE_|DU2PR04MB8646:EE_
x-ms-office365-filtering-correlation-id: be43b660-b882-4a20-bb9e-08dd101cc29c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?0G4oIYkxzkZV6/+IScjyFdwphq1Nmy1sjf/9LJhW7dK6cTXDC8h+aPxPOgfR?=
 =?us-ascii?Q?l4MT63KtcDLz/QDuIa7DTKhe16vGZgtG3fKF1DlSCJyIlSxlGqaHLICheZl0?=
 =?us-ascii?Q?qgd3HJKaOcnGyhk4YjxOrdqHRRW0M3D9mVqvLyC0x+xiYDckHdW1FAKZB7Ng?=
 =?us-ascii?Q?2Mo7jv2yHPSV1WbikUQqmlp2Pku37uCG71LtmpumKcE5dT3Aj1I+33aXHofV?=
 =?us-ascii?Q?G7rXgMaoRsKlU2vKOLiCRU5IbWsM2GYIWQVNAKVmu5MfpE6CKOMjgkIOJwVb?=
 =?us-ascii?Q?60gqTYNbcFV+GbIh9uRWohqtySUsSFLu5qWIBCWc5yc2aP1ErXXTkCyZP6bO?=
 =?us-ascii?Q?JN8NoVHeI1j30E5YCpDhWFIYzPCOOAt4NBLOmAFOXnWPMu+zYIlVFwvA+7bZ?=
 =?us-ascii?Q?lCstbXdB3u05YMCC+K/XB6MKgaZaVwECVcbuICS1UG9IJ2y44OBgrbG10Frs?=
 =?us-ascii?Q?3E1rmK8Hga+vPpVQqqkAdUcHwBK7ZuwXAbh29AfqRvU4A6Kd8wbxtySvDE+F?=
 =?us-ascii?Q?QhqwKsrllz62MgTewJv3ZOnlSkovK2Sk1ZmX0iCo/dIT8LoVGA9Vbu1wx2jF?=
 =?us-ascii?Q?pL8GU5QTAZIOSZbUJK0+D7S/Lq/5O3ZYWeX78t7kdcUyZ3yHoT9NU9lqYtvG?=
 =?us-ascii?Q?Jv9Hg3xWgGBEOCg13mE0QNSIfVmxaD9qp6DDa8uP2We/1302uX7XN5X551VT?=
 =?us-ascii?Q?ouO93zkABT8st4F63OYZDwIz4uhOOXblRUCgJx0MRtYRk79juSZVVP/zlmrX?=
 =?us-ascii?Q?uoiAy2iSnCjqxk8yptP/gmPpAGzrafQioT8DwgL6cc2A0Ie2dsX8jTeIpyOJ?=
 =?us-ascii?Q?6d3A3I54AjXvjCIRZBlh8Bv4bTUV9gbB6xNDXwNBkOZQbfumqNQe4FTtbeAo?=
 =?us-ascii?Q?MNErImu6D0nI3a7YFapXxoXmKQdBcFgZj745l/px60WYQRuUGGXoU92gVO3B?=
 =?us-ascii?Q?0KZU/IYb7vee7KbKvHAbbZBKCPw/cR48bwfCEwotBW/e2vkDD50jHKZ5Vlx+?=
 =?us-ascii?Q?hjSsscJMEXoW1xelfyqFSnorcv6kQGKWJm67pI8VNtr74meSVKqULn2pnRtx?=
 =?us-ascii?Q?5uOl5cS+E85Kk4hCW+NjRbDS/n9nk6HtOfNFV6KXtjl3MtaaWtJO+7HuwFK3?=
 =?us-ascii?Q?DHsdrl8YZL2V1SlbeWd6Lx53vwU8pplVpfA5RNPWzHxN0bEhGcbvJ6036lU2?=
 =?us-ascii?Q?dtL1v0gbGeNWeu+MiTeIegSY/v39cPLEopvbEGuRLpHJ4j0+ijeXEpuzlYn8?=
 =?us-ascii?Q?zKw8bzowXRsG46+CvHEJNCwlVNdllagNB6uwdXjQfBq7xIlK/ZW3OEHjaerC?=
 =?us-ascii?Q?E/EBRGtMkJmPFQks/UfE/8NHVlTyNKFmQKO2ABxGyu+tKEWcDmuvIwn0+0w3?=
 =?us-ascii?Q?cbSLHMc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3937.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?kgOty5U7wG9OA13LBaXgmTOyvblDO837wv0vf5ePEsz8pexOhRi1eRWS+KNt?=
 =?us-ascii?Q?GDk8L/EJP+8bLnWLekxnVPq4M0LEl25iVVeVEDKE+Edwk7h/jP3YigYcVBF3?=
 =?us-ascii?Q?YtO1aGtDo0h1CDDftJxxu3GdjXMrX6kcM2sM2WpcrEe2ua7AMI05nMOqiZvq?=
 =?us-ascii?Q?KVGwS2zd77wLKRSb2/B1BnLUiW012Ci/S8Ai2zI542tKYojbLkmjcv3t64Uk?=
 =?us-ascii?Q?YoQIrqNHF/cVxV1sgZqRR1LmQXFAvGgEWj5J6QqrK9T1U/amAUqAHqrdudW8?=
 =?us-ascii?Q?8x3Bhx3tPUPLyna8yax0Cli+rA2MggiyCws/msXbTeDEbct79tYSB+vD40Mx?=
 =?us-ascii?Q?kX2mD2LzYg8DF1Y1oCP59D1ECbNV+oL/P9ZK0UVqJse2qYfrPDOijvyrenib?=
 =?us-ascii?Q?C7iEocBTlWZYLns5MafrzbAR3yCuOdZ1T7B3riUkLguCxmsd/MuOvjamVgXk?=
 =?us-ascii?Q?r46t5wyQvTXGIH9ypBpFj948TAhouSKN6etyY+4ZfFXnsjXzB25DY2ifZ6qh?=
 =?us-ascii?Q?F6bLXkz2eWH+EjDZog1jQ7Z+Phx1ND6nKVUkGPAnW8nvyEDz9Z49XsyV0fRF?=
 =?us-ascii?Q?dJPbfIlE/qImkHTIcbP4DhHTVNGyizZRmUqCnRnfBRDKljLlyYFqJhCjkXgY?=
 =?us-ascii?Q?VbWSoou81z0lXMwX+hT7jbyb4xfRLQQtuF/3SOU+m5Hw2BdZHU8vZDwc2A8p?=
 =?us-ascii?Q?718+OQNTA4fJzIC7MOOd6a4V+f3Fy7XOhLO1LTda91FKvcQ3/ayyxg0ll3jy?=
 =?us-ascii?Q?E0/qxL+Zh0K2E2rJSU1Sp+Y84MYaXV3SdvgKMDJWtf9xkBZiMBKl2rRsejyD?=
 =?us-ascii?Q?RzNxhGvh66BGEXPirfqNo6qIvbAyqubk4XGmyB9t6QvE65uhBS0i1s0sN9NV?=
 =?us-ascii?Q?PbFRICSLaK41QvfD6p1EO58W2KRaitpEPjRUD/6bvMaeFNt000yHeE99SLbJ?=
 =?us-ascii?Q?CDHlp8JhKOkTAvPid1/u5LhOr0aBI2eKSBiAY14jYNXMdo53wo4pbjIuW8Wr?=
 =?us-ascii?Q?jcdixQTrqcbLK7YhivrOu5+P3tWHhdo2rkwwbhxnnG0lCXk6s700vkuDLIrG?=
 =?us-ascii?Q?Y0c41FDXkh1lnVBCy8Q669tLA+tgEFbgU4jez9A1aWnPo5Siqs0yQG06/Ac9?=
 =?us-ascii?Q?A2MAQBuGK1p0dpIh5/OevHC0QNaPSKIMsGhY8m2UlZpoEppmnkjdrAakrn9B?=
 =?us-ascii?Q?fFDJY5BCWxMHl+n1Y4Sfx+xRq/0igdNnwvYdKl4MVv6CzuWtbgVYssgpQVpY?=
 =?us-ascii?Q?GmAcOw0toQ98Tk6l1sabHcFoyXI/NgPe6+CMyCcsQVXI2p/F4c56YNQVQqQ+?=
 =?us-ascii?Q?/Y7/k2lgrcyuc+8cpLCTxcTJFJY37q14sWiluWxWH0jkDDNANoznsHEmGa+i?=
 =?us-ascii?Q?Xme008jCJUz+E/MX0D78SBRSOrH7pR1Xh7rS3SEu66xMVqWPsdI065WYzuQ1?=
 =?us-ascii?Q?M1nj5KfS0q7mESYIZH+eiJTKMUn/+GZ5RsYrGrpTijdvSu3YdfPm1VJOcBcW?=
 =?us-ascii?Q?G/wj19l5pABOjUUniip3DPGmilloxHL51MYQx1cOV3aT+cZK1rWImuy//zll?=
 =?us-ascii?Q?1cTMYo4BOQuwnspY8+o=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3937.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be43b660-b882-4a20-bb9e-08dd101cc29c
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2024 02:23:06.6380
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7x7nnfRutZByngja5i+ebwB+zGm6FPkujTFP4+I6dcZUgFQWp6D/1XZAOhbpZoHeJ5I1dEHOWkcUtipGu73Spg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8646
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_182314_814850_2F125FDC 
X-CRM114-Status: GOOD (  16.97  )
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
> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Sent: Friday, November 29, 2024 9:55 AM
> To: Carlos Song <carlos.song@nxp.com>
> Cc: Frank Li <frank.li@nxp.com>; o.rempel@pengutronix.de;
> kernel@pengutronix.de; andi.shyti@kernel.org; shawnguo@kernel.org;
> s.hauer@pengutronix.de; festevam@gmail.com; linux-i2c@vger.kernel.org;
> imx@lists.linux.dev; linux-arm-kernel@lists.infradead.org;
> linux-kernel@vger.kernel.org
> Subject: [EXT] Re: [PATCH] i2c: imx: fix divide by zero warning
>=20
>=20
> > > You sent this patch twice?
> > >
> > Yes, because I meet a net error, I send the patch out and wait for a
> > half of hour, but I don't see the mail in the mail list, so I send it
> > again, but another one come in after 1 hour.. You can dismiss the same
> > one.
>=20
> You can also check 'http://patchwork.ozlabs.org/project/linux-i2c/list/'
> to see if it made it to the list.

Thank you! I will check it when I meet issue next time:).

