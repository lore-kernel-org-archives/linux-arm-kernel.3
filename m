Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41323FCB61E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 16:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ive13fU4bsh991OKdBdKDqis1gMSDNDM9HiX6C9CNdk=; b=n6hZBjPAy5wLoDewyCBb6vxG+R
	wMR4ZOVcons7gQKjHPPwtZh25nvUS/hyEATcFV2WNoy3re0qjaO0cs2wRDH8CS0KIVJOsbj7gRALf
	oXL9aiH4GlxoJHj50gPxPp2/ZlGlF36rIexve/P+UGa8BB6aY5M4wmhBELHcwvust8YXMlum1npp3
	Jo2LQabZR6v9WBIKgEhnPaeD4ijRActFfk7wkqi8P2zLYYEEunuqtyBAcRxJD5Rb4341AN3yimhzL
	SrzYx8/X8cRgayZkyLSvlvm/qVsqiBBbszJOTSu7LVaKuXe65aQ+UvbTXHy9GvS3FIq2G7Mfj8mbX
	6H/lL0hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyY8Y-00000004ArG-2nJ1;
	Fri, 06 Mar 2026 16:34:50 +0000
Received: from mail-swedencentralazon11013019.outbound.protection.outlook.com ([52.101.83.19] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyY8W-00000004Apv-1JLb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 16:34:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A3qeUZOhicAqzUvPsZmdPnnOItkCpVHpcui39ekjbFpl9LiUU9nLG8t83nBqZR+3Am1ynQvFGVnhEUo86YUdl+NxDpZqua9Uv5FyQeN7fFHqxnvFoVpUvkZW/4+8gP8URAd+kFb1DVqlH55WRKN31oYc9yPY/OliAte+X0YD9D+S89sgtiOLEH0EcjhxFbvE9Bw9TBhPscp8O28Ft8MSVUCwggmLNZVZ/Wy4P/75pfgQXrz4UeBgQ2VAbcbBqXK2I7188dKyGIsh4evZCW/u8wmf5PhJxBMOMUdMBXuc/V+myg8m9SiYr55YhdAVzv30fiJq+2taXiu2t4N8uBuVGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ive13fU4bsh991OKdBdKDqis1gMSDNDM9HiX6C9CNdk=;
 b=D4pYRfFpTJNXebrDg49I6NIl9A8VZDzhwZwbKm4UEK5ltor6l4ZIjo2/oOQk7HXGLKOhTA7F4AGY3IkxpbuFGcU38/G26LmiQ2aOiPtFc6l65DOiouEQjeXymXLnQJPgxLHCVNx7gGS5F/kIxBmGGW6YAvOsPs+W5roCoBzhpdoHAq+1wBTxMx8Bz7PzDAB6VMp3Ve3mQtQu/UR/FMoc/TqkePytdxL6/tp+06rlVHAxwOZWEGFavNYgTUaSeyoTAu24mIOscqTl3Yt9x7zDrBW0SDDo2eM8mAEORVcuwon810js4vsK/Jt2AsjN8lO57tbZMybI1trJgzRZtbHgHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ive13fU4bsh991OKdBdKDqis1gMSDNDM9HiX6C9CNdk=;
 b=oBW4/aAmFemRbkjQ9pIWdQTI2aGc5WcYfKnwb79xoe/Om9pWJWdaD4HFqVE4wtfEoRoJXbYPMVeM3otDeQkKrCp9OEJ/0i5ur1Gml+nF5Rs/L5lMC16J2p1CAb/XXXZOLXoSWskpuw0Q4oEokRpOnNJ41GcLFvkdagmw/YLMZnJt3jB9O02oBv/WTJFY77vkjfJSrck3bGV1xDckZwFWWtGvoxQ+fzTYWYYbjSLMzg+1/I183Sc0wTelFFDO630Z6/Y2225qT3wCl5cgx0ucVRz5H1OnoiWlqRu8AbINq6k3UIfhQ7gateo5DXwFxOK+EB/KSg+AK9k2kd3nEjUFoQ==
Received: from AS8PR04MB9176.eurprd04.prod.outlook.com (2603:10a6:20b:44b::7)
 by AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 16:34:40 +0000
Received: from AS8PR04MB9176.eurprd04.prod.outlook.com
 ([fe80::ba87:1cd1:53d9:fcd7]) by AS8PR04MB9176.eurprd04.prod.outlook.com
 ([fe80::ba87:1cd1:53d9:fcd7%6]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 16:34:40 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Andrew Lunn <andrew@lunn.ch>
CC: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn
 Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Frank Li <frank.li@nxp.com>, Sascha Hauer
	<s.hauer@pengutronix.de>, "arnaud.pouliquen@foss.st.com"
	<arnaud.pouliquen@foss.st.com>, Shuah Khan <skhan@linuxfoundation.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng
 Fan <peng.fan@nxp.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH v9 4/5] gpio: rpmsg: add support for NXP legacy firmware
 protocol
Thread-Topic: [PATCH v9 4/5] gpio: rpmsg: add support for NXP legacy firmware
 protocol
Thread-Index: AQHcrYch+02YpNJ5iUqOCF/Z++jYfQ==
Date: Fri, 6 Mar 2026 16:34:40 +0000
Message-ID: <AS8PR04MB91764DFDA8D3BEF64F583969897AA@AS8PR04MB9176.eurprd04.prod.outlook.com>
References: <20260304211808.1437846-1-shenwei.wang@nxp.com>
 <20260304211808.1437846-5-shenwei.wang@nxp.com>
 <676cee35-b5ba-4a3c-a6d4-b9e06e0886dc@lunn.ch>
In-Reply-To: <676cee35-b5ba-4a3c-a6d4-b9e06e0886dc@lunn.ch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB9176:EE_|AM7PR04MB7046:EE_
x-ms-office365-filtering-correlation-id: 6aeec7ba-facf-4584-cdd0-08de7b9e43cf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|19092799006|7416014|1800799024|38070700021;
x-microsoft-antispam-message-info: oi7Mp/fWHwK1EF1q1XAvlJSCP694FdJCoj8ARGWm8gjzIid78A9j2aZdryRR0G2pvJXnMOo9xh6eZocm+W4c7+C1H6n6iG6JB54px3wXE0p6Dj+t2SUex7WgSU2K7f9gV6FJbiVCEsILYgedgBeVNeAm3AJwZy1oNzILnWWok3PCUri9v2oMd6Q/0nHYqP7QQU1fp49GIm6AQQxiEHCUQ4yiuEX89vUfMs0KcN2b5Q7kAcibidz5TzRL3UafJy0I2/eBWYwcXpY/9qP4sRn58iyzSJLxZTYEnp1tyBwiJ1B7Rb6frk68e0pE/ORA4aOmFe9WX+ElJRaH3lKRYCMX5vX+NdmgMquT887wDD1S1n36EmGsjVHOwMjseiB7JlSSYtqHnNYicNRfuKqjLQK4w68ga2oXnTvSPbV86y5+OO9vcb/GKKsR+02igoDGZX0nxV4wAAQfvICuC8yXi9i+G1qLoaML8gqzLaBZxJfL4KzFwT6ToBNhl1U4dIhSXkyQFqNXwrDtCoODSIUm4yeGS0dXQ2K7GODCCQYV9J/eu8GnKBkQC/yFm35fbQkxqZyW398P4ixjTEzyn4db9WiBJaprWHx1Hjvo/XLmZyNOULKMxnBjNRHJmMZ9lnBhrlGtjC8HrMimvqNicf/4IKFmCj3kK0ZNJ5GDer6p1FkhTYposEH6HuvOxib2y3vg8LYgE8Ahi3h/JRgLwm/9K5x/wWc+v8jcx5w7hbVm+WqffHbl1l32oZq24eVR6evejVjWygpVPlrwWu3tP1yqZsldp4ZlMp/MQ5w/ef22xS+JP2s=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9176.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(19092799006)(7416014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xsGgMq3Bho6TzS0MXX51VLWL6qqWnOPfsqwu7pfznyYN31T3fMq7I86+Ug+H?=
 =?us-ascii?Q?dQrhDZ3vJnDQQnXV9HcBu2za6f8L3Z2DF1q3MxH+WI0I2hPZ4gNFnZnglI1j?=
 =?us-ascii?Q?y6Xyp744uxZBfQyZwBHNS+2TphKvdmJUXzHj8et0b5qwoanjvi36WUcuYzPc?=
 =?us-ascii?Q?8QVC6cpc6k/dDXyg5415QNhf9B1OdBoHYydKgCq00cKQjJ1AvpsE43JA1WZ/?=
 =?us-ascii?Q?o9Y2Ne2BWE6NVD3eZFpVBQKwOCc0HsmwmNZIS9EkqCPm8IuOX2vhmJEvI/KQ?=
 =?us-ascii?Q?S/9N/ELAPBHsmn92rvNJTKY+GsPE1fpYq2Dim9ent58vdFK9XLrwLemnsQZT?=
 =?us-ascii?Q?uHlUC1r4fB41QPo57EoZBcL0WI2Vtzozi1InhwACYNS4rnehrgn8UFcxWI2F?=
 =?us-ascii?Q?vu75zht2iTbwM+a7wGWDXs5MVVBCY5a7uSwlD1Av7ReicW9Ao4JgyRfX+bWU?=
 =?us-ascii?Q?2DDMDRyfaarVHTPd//WA45Az6lJciLu5Ryxw1sayInYhV9VN20GsTx6T6t0h?=
 =?us-ascii?Q?qF1cB+aC3+XyYjbdG6wCFEMdApuS24Asy0dz8sINVrq5Bnc7bpfWTmn8hnOd?=
 =?us-ascii?Q?1DYH31v1177yOSrhOCDqxyjihB9AThnInyCzl8SvHLimxbXl0DBCMyrksamZ?=
 =?us-ascii?Q?xUMJSP68SAX8aaT8s6mitembxcr8UAca7g7PkbI6BnvTDrZ263N3KLI9+JOF?=
 =?us-ascii?Q?YtSRokuIVbRWZxzfYW5tOh3gdN8nvCeZIKhYkCM6moTVR/yKoHjcEb4o4zI7?=
 =?us-ascii?Q?OeKPD7aFsRYSWiwYqKmAWA3E3wXvxTB2+U+htPoQQVbE8ljpbltDxvpabo/m?=
 =?us-ascii?Q?MXZCYgbQulbbtC3fAeUQMYDANqkiSRPZU/JKeHXGADsgJ46RjNdX3/2P6MF5?=
 =?us-ascii?Q?8vEMkqh8xkbndCVTLyYxH2hYLkRGoLguhTHstY9qPRrNxiSPTESRvYAwCelk?=
 =?us-ascii?Q?ckjEiCMuCOyNyEI82ACpGnZKtOyXTkBBoVsXFPqkzt4iy2dV/fngkt0mnUJb?=
 =?us-ascii?Q?2xWfh7WUikY2xTbOEVMUf9Jfh3Z4r05akWWmqYp+SIUlUSohjccmkFP2hIkH?=
 =?us-ascii?Q?YzFqUwEkB+UqMIy34eFFOsmHlL+9rGBVV3w1w8vfq1Dn6ghdMTlZGtKzXr2h?=
 =?us-ascii?Q?KEtWddFhviJ04ZZ5WoSGaB0l878FSajb9B4r4rEuNJpIs0sm0U3Cxk9/Qe69?=
 =?us-ascii?Q?NLhhz6bILkHFAD/hVM2YHJxs1SU4Uz4ENvBYdDCkZagcvTcG1+i2IBWDqHUn?=
 =?us-ascii?Q?uKvU5OpKTKD7cftPJ5jQzVxaC3P3YTXjcP26VK2QirQ2qvNTfwTP5o6BaSWM?=
 =?us-ascii?Q?tcuM3VOyzbsO1Ds3/hbDh9qlY2VATfjdckfJVN1bJov9n5EqtbCknDcTWQoV?=
 =?us-ascii?Q?kGf31CEM6aInvgZdChKdHJjhXNIJxRYPDIyFR3/Zy5fsoXkTybrfB3etaMHf?=
 =?us-ascii?Q?VS+IUb0/AdmnNQ/QbgYB3Vjz7SU3MU3dn+qPefweCFOoSzQUVv+VE6bHGHL1?=
 =?us-ascii?Q?JTJiwag5BpDKRJDUZ5W+lp19CC3fMYgWvRbC/PYXv87T4PBoIjJAeNOp8DUc?=
 =?us-ascii?Q?9mWABG3p3tanH2an1WpQoTducmwmxd7LhEU0SStwUQ6GUTRfaVjr60GADa2q?=
 =?us-ascii?Q?PAtqCg/lNodfP3dGmo7kpXE3MJyYI3oSKp0h4yUdsYpEnYqv3wc0vCYiqJut?=
 =?us-ascii?Q?A3gn7d/55e5LlHtc+K8K/y0AqVvnmueIJ8741JQXEi8rG+qB?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9176.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6aeec7ba-facf-4584-cdd0-08de7b9e43cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2026 16:34:40.5608
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GnPFxSXuTWA4/hIxBU853mrSHybyxcWQG8hDlFNcaCrX+Jn2OStamHqa9KY7aNBuQhuoWOM5wsW9sycfxMdMhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7046
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_083448_354137_9D9FDD81 
X-CRM114-Status: GOOD (  18.73  )
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
> From: Andrew Lunn <andrew@lunn.ch>
> Sent: Friday, March 6, 2026 8:24 AM
> To: Shenwei Wang <shenwei.wang@nxp.com>
> Cc: Linus Walleij <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.o=
rg>;
> Jonathan Corbet <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzyszto=
f
> Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Bjorn
> Andersson <andersson@kernel.org>; Mathieu Poirier
> <mathieu.poirier@linaro.org>; Frank Li <frank.li@nxp.com>; Sascha Hauer
> <s.hauer@pengutronix.de>; arnaud.pouliquen@foss.st.com; Shuah Khan
> <skhan@linuxfoundation.org>; linux-gpio@vger.kernel.org; linux-
> doc@vger.kernel.org; linux-kernel@vger.kernel.org; Pengutronix Kernel Tea=
m
> <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; Peng Fan
> <peng.fan@nxp.com>; devicetree@vger.kernel.org; linux-
> remoteproc@vger.kernel.org; imx@lists.linux.dev; linux-arm-
> kernel@lists.infradead.org; dl-linux-imx <linux-imx@nxp.com>
> Subject: [EXT] Re: [PATCH v9 4/5] gpio: rpmsg: add support for NXP legacy
> firmware protocol
> > +static struct rpmsg_gpio_fixed_up imx_fixed_up_data =3D {
> > +     .recv_fixed_up =3D rpmsg_gpio_imx_recv_fixed_up,
> > +     .send_fixed_up =3D rpmsg_gpio_imx_send_fixed_up, };
> > +
> >  static int rpmsg_gpio_send_message(struct rpmsg_gpio_port *port,
> >                                  struct rpmsg_gpio_packet *msg,
> >                                  bool sync) @@ -572,6 +711,10 @@
> > static const struct of_device_id rpmsg_gpio_dt_ids[] =3D {
> >
> >  static struct rpmsg_device_id rpmsg_gpio_channel_id_table[] =3D {
> >       { .name =3D "rpmsg-io" },
> > +     {
> > +             .name   =3D "rpmsg-io-channel",
> > +             .driver_data =3D (kernel_ulong_t)(uintptr_t)&imx_fixed_up=
_data
> > +     },
>=20
> Its not clear to me how this gets applied. Don't you need a different com=
patible?
> fsl,rpmsg-gpio-legacy or something?
>=20

This is not a compatible. It is the RPMSG channel name advertised by the re=
mote processor.=20
The generic implementation uses "rpmsg-io" as the channel name, and "rpmsg-=
io-channel" is=20
used by NXP's existing firmware.

> I would also put it behind a CONFIG_ option, and in a different module. N=
obody
> needs this code other than your legacy products. You don't need the bloat=
 for
> your new devices and other vendors don't need it.
>=20

Other vendors may add fixed up handlers in the same way to support their ex=
isting products.

Thanks,
Shenwei

>     Andrew

