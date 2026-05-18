Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9B64CD4F4A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 14:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qxHm4meEDR/VqQA5H0e8VZkmUep5xrh1RAghaDopVXc=; b=n09dxkQ+iGBriWyiLuAa46b1Y9
	9pclcU8BhfoUk7gCFE0naRREPbj/kfBjs/v/0Z8TM8ImV23SzGW7kr1b5wR0MdsUrYhdUOIOY4Kfk
	ks5HD2GwtMaT/jlnjKYEDEpHc2D9DXztI+y/KTFtGM3YZ04Ow9XD/nBjYCRQj85RZabE5YEkAe9QF
	PmdXC6eQ/qyNpnZ4b7eM1btDXflCDyVW4Ee2xDMB64CFjDhgXNHZRCxerrQlGe72w37RV+/fY5Vm7
	9wSV6XCcHsMX9269ggD6Ksp8DSmw7oUpkDYuaBXtHEqJtcgEA6RR+bWON5Q42hMASF0BJ4sfM5rhg
	lO66TPcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOytz-0000000Fy6s-1tDj;
	Mon, 18 May 2026 14:25:03 +0000
Received: from mail-northeuropeazon11012002.outbound.protection.outlook.com ([52.101.66.2] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOytx-0000000Fy5S-1yhu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 14:25:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sn/DUjonm5cW2K+AKb2AXlddk0+XiQtev8CX02potS5OaH5+57nQhTDoZtC+g/SQ+UIppWgDxxgX1sYWEMtiSHhk48/4l/m4jZqfBZDbgDSoShh9e31rAhvTR6eI+2is3oVEA0OnyDzdFLo/edgmy1G2uK6q8J1bK1TDIyWS2tedSwk17uesTlnppEfwtX7H4w+5n1ozuunrb26PlJGq7CF+plrm1zqQL2euFQz9ZhOFAVlxEbr3Ycc679Gfj0cEhEJEVAOzs5v7+kM2NI0Vk3J8sZzPrSepiuN7QKgenjgm8XTbUJclDTJcTdAQR56keLwzVUQOj6mNso0LB1BjMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qxHm4meEDR/VqQA5H0e8VZkmUep5xrh1RAghaDopVXc=;
 b=B0mAkfcleZxB0YxJHriGOI9CPF0sLWyaulU9dH818YVMYCHQDixObeeEzhbKP4XVTjiQTE1pXR38t8W2eSsr5/KEDvKDQIucbSCdsxXu//Ko/CUhbQH2vdCtqB45LtlylN2yPTfm9Mo0EykLXAJEF5rYGeZo3Z91v5+nZIeterByLyfCsLpiEKIIkD94TnEI0WijpzB7jzKP7uGAjtigdiorIz0d2PSToQSgO1Ylm9mw9bgkaWuk9cJzkw3auuWaWY8VJChjIxGqBIyM65t38vxU7geuWtUhLwyRfS57mQQ3eXVcfGUWIEHsUElR5tXaWnRd5IL8e9DgrmMKvLlmYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qxHm4meEDR/VqQA5H0e8VZkmUep5xrh1RAghaDopVXc=;
 b=JD649LyFqZURxDpCB7eWadVS//daWutY8YoloIfOECbQKpcOQAAy++SbZdwMrVfdEnEYXFExn4KB8EWGmouKLDghkrN8l9hXdQeg0zRrzwXMB5/2H9Ot4na7DA2SgB9jfGWTuNE4HvWCXN+G/DAXtwVe3Q+P7wzAu8d1a3R0+lfeTXOuLxHQVYuzUQFsERFzX3biw+UXj3ZUgekjOsmCrBHXXfSfcNw29elctgg++ApItV3QrC53ejgN3Oz0qBPzb0meav0Wij2vxs4qIwqkFqDRBpJX2PWlzz+KN199uSgI2UtOLHmxFO//XwYKGvT9UJOoUK5z+WIpT1Q1q6efsQ==
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by DU2PR04MB8566.eurprd04.prod.outlook.com (2603:10a6:10:2d5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Mon, 18 May
 2026 14:24:52 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%4]) with mapi id 15.21.0025.022; Mon, 18 May 2026
 14:24:52 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
CC: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, Beleswar Prasad Padhi
	<b-padhi@ti.com>, Andrew Lunn <andrew@lunn.ch>, Linus Walleij
	<linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet
	<corbet@lwn.net>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson
	<andersson@kernel.org>, Frank Li <frank.li@nxp.com>, Sascha Hauer
	<s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng
 Fan <peng.fan@nxp.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
Thread-Topic: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
Thread-Index: AQHc5tIXt84GDNmf8UW04dpFalLnKg==
Date: Mon, 18 May 2026 14:24:52 +0000
Message-ID: <PAXPR04MB918587A8812B51BBB2A46A2C89032@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <CANLsYkzt9xUczxSU28u-TfZAAjr0ufZKXAj8Eqfq=45gufXW3w@mail.gmail.com>
 <f7ef3417-eb84-4467-ac72-a9bc8b0c81e8@foss.st.com>
 <21de8440-adf7-454b-acfc-06e50882e075@ti.com>
 <4c526816-b127-43e7-86e9-eee4dc1152bc@foss.st.com>
 <268f8e00-91bc-43ea-ba95-077cf859e7f3@ti.com>
 <9e2492d3-8753-46c7-8db6-5f1a80b4f2e9@foss.st.com>
 <db4c18be-1c8d-4227-9fcc-1d25cec50e37@ti.com>
 <6917e3d7-8c6c-4e63-8eca-5308621ec3e8@foss.st.com> <afzIABSh1xtMEGbf@p14s>
 <PAXPR04MB9185BFA6E7375FAD0B15B021893C2@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <agYHzH-nJLl1HFIn@p14s>
In-Reply-To: <agYHzH-nJLl1HFIn@p14s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|DU2PR04MB8566:EE_
x-ms-office365-filtering-correlation-id: d0ac6241-20cc-47c8-52ae-08deb4e93a04
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|19092799006|18002099003|56012099003|22082099003|11063799003|4143699003|38070700021;
x-microsoft-antispam-message-info: U1ZutsWIEoHWD0nClukdc+2LWVu6209SN6YbjCDw/tPNDf5o8sN578GO0482igKzgnPkGtW2NqOb0hR77ls5G9hL87QmYB4YOgukCbmwb1uAqUObQmS6dsANeec1ludvxwbTzwFcBeeqs4ArUJ69mhoceCCFonTvV+oWX5++IfbLQ+PSbqT5DRzzSSmCdAGUXOvz5O+HlI+dankOg5upYu5NcxAAKxqvEMgTyGF3Ow3HJFOhPTt8SXXVUPGLjtk+HZGKryU/gfv/5dh5nMQCtXDCG5z1E5Le97k60JQEaQEWkUJK1nvMRiKlusbIIuU8AhqEDU+XsaWivE9qHtaoEvwvfXMhHdLIeot5apDXpx6VkRqUB9fQO1nZbHxqeMPlmNqdeSqjFXC5tPJRwT9+L/h3jBeFWcIMMrfiWCU/qO/7TxMxtTUCadp38iiI4MxF5Uc3sl+YlnfWG/ocZpIoAxqhi6GdT3sI3OP4YxToZzTbHrZ3C6Iehf/S3I1IOwv9k7l7dDb5DBauW7ekAa3jjDxIqoeIATq9JRgNDn0F6hMBhGAuiGrUp5QLsY60QPCk+OakHb93zTZwVZjYsc6SoismQ9o9Y3XxWJ1iacBjq4u+q/cVbBgHFOHKgyh85ROgaCLooFnyLEFqpIzEt1b+oB+ZBpU61HcEVvymfo4fUw5f5knCZSgjaNcYTNS0t8sfPhYinua8DXZrSZ0XF1N8lmDUMxFJ8QHMSm4uK5B/TmPgUFZGgHAqBji2ze3/0bQz
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(19092799006)(18002099003)(56012099003)(22082099003)(11063799003)(4143699003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?kvJ1K/0MTw5f+vLk69iqVnMvUwPq7F485yLiwpVsefAPxpLogCaHppRD9fih?=
 =?us-ascii?Q?3/DV6j1DuiekbHrTJB0KngRzuD2Cf/acHnROlG0YL8okrt5iivPumOL4BMhc?=
 =?us-ascii?Q?L3jKgARg5BkMbYDGC3CSEi4bXHmETSm02jkFouOmUuz4kGbgVLAA2qmI0Ae0?=
 =?us-ascii?Q?rE4/wvjkQ+V6VunjqR8mXkhMHRU2Mh+BjKlcWYtvmil9IC4IAE7vcZNvaWF7?=
 =?us-ascii?Q?G+wFphozNKkI7y4HRBFcpCSWyzhJVJDIytoX25zAYzB6WN7jkNG2gS+Ld0UG?=
 =?us-ascii?Q?EY5F2k8PFUrIkRuuhkVRYyASX7WeqbGL6S5BvH26Sh5AubUj6dwVdsZWsM3b?=
 =?us-ascii?Q?YU8rC+oEWC0L3/JaYT7r+TRO9KSHYCI8o/VDjTzzJw7mEJoRdgnwVfqExert?=
 =?us-ascii?Q?TAttnPvzPp+EsJx2VNG4hz7RNDy2KFUQFfMP6626CXBCcbZwaEPEvrHKhr+e?=
 =?us-ascii?Q?8Rt8ZdlxTvVcCC+KD+80nbOH/SktmeAD8OrbzC3WcwMHBUn3hviVAiNeyJwS?=
 =?us-ascii?Q?fva6Rjp+G7Ar6H60cnczBiRTtwLsuDdiG23z6dtnXS30qS4NnQXUfrWcdFVI?=
 =?us-ascii?Q?P8dgcXFFNnCrOhN4dVAbF4usru3KebaXBJMJb5zFw+oiQCTSmHHAkuI7O/7A?=
 =?us-ascii?Q?ip3fbWqvy0KwQjL1CpjohupT0ncWMpODqe98mk075QzoAi/xoY/BIx55uEHY?=
 =?us-ascii?Q?rI6mYYljwmxbIyHXwHfNT4bP/1JsD/9LwdLdJP8BzD9u+0PxoGiQ9+oOTpob?=
 =?us-ascii?Q?XsY5M1DcGv1/IEnfUu8wXcVwr2jMOMQmVrjdLD8hNHgEhnGSo3YzdnouCK8w?=
 =?us-ascii?Q?vFzN7/L2VI/aqdQmKB9Bzi5kBxjPdKV/zx1Gs1C6hkkNkUt4cvNDjZXSETZA?=
 =?us-ascii?Q?ttzyteYWBF0dM9gMG619caB61Syialsf+9DPNjAUjjXutS52FKuUiAMFLam/?=
 =?us-ascii?Q?GJjKVGoByC5/ZSDJrkF9TC3BSUyXRkAS1DL4IDFiaEtvyTnMQxELzUQmyoy6?=
 =?us-ascii?Q?OZBztcCEg4Jijjy5YZ1vKvFzWBBYo7Pc8TqVQF3MBSjUY5HnUzfSsxNS43E2?=
 =?us-ascii?Q?kV3TgjCD8w3P5eQ9mEAjOSfoyj49HRWPKxU0Ij0a8Je9FeIQ9Vsxpjs1shfB?=
 =?us-ascii?Q?UE73or8pBrF7+XwhGUqUNswMqXDhdT0NV1be1hpGVYE6+I4SXHlH8HFpD9KU?=
 =?us-ascii?Q?Fo/AIf+XpwoSNiZw9eXTrNFSgiUVuLAfhxbvkDNLVM4TaP3QhrG9DYPjQ22x?=
 =?us-ascii?Q?tKN3q5uMpv0FcSuqHD5NlqR655lNX/RCYtkV+5ubfejCMwtrKCLWeJxkDERB?=
 =?us-ascii?Q?F5P1yHoPb6/8DhtgqRekzxAWV+fTvlHynqwfEyzSRaMR+fgNMyibjE0Px1y0?=
 =?us-ascii?Q?olRsh33I+skRWliDQPwyVPGmmLF5pEw9O4kRiq66+uIlbtJq+NLmd+x/D16q?=
 =?us-ascii?Q?xWZkL/AXsXvEanJU6u7UqFGW7cwad4EFkHu42K4ZcLO13r2SCXFUZRsKnVhh?=
 =?us-ascii?Q?oMRHkEG8rKD/pK2B2+6XuOvkYnQlxd5ZhqYN6pWAnQNce7llJJDYER5uPRfm?=
 =?us-ascii?Q?s9IxL3c3PqIyMkcWIxyfYGVLRxccJxAU2lX/5NpBBV179Ihv1y6+1iQf55ec?=
 =?us-ascii?Q?4c2d5kdWShOidkhOlz5QnweTR0LCllpjVi10O2WzuKh5HYk1k+FteVvzphJI?=
 =?us-ascii?Q?u2OKsFi4eA4HHsq0rTYj9MRnka2Vw2sf+RurH3QI6QBRcb9H?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0ac6241-20cc-47c8-52ae-08deb4e93a04
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2026 14:24:52.6773
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X090dRCRvWPZqulirG8/212UIsZc0XOKVIgOP9CfAZhqqcXed1BHrM7xMqBpCaqxAi5GqsORtyYK27nmAAHCKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8566
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_072501_563273_9FE30B73 
X-CRM114-Status: GOOD (  23.07  )
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



=20
>=20
> On Thu, May 07, 2026 at 07:43:33PM +0000, Shenwei Wang wrote:
> >
> >
> > > That was my initial approach.  We don't even need an additional
> > > "rpmsg-io-*" in rpmsg_gpio_channel_id_table[].  All we need is:
> > >
> > > /* rpmsg devices and drivers are matched using the service name */
> > > static inline int rpmsg_id_match(const struct rpmsg_device *rpdev,
> > >                                  const struct rpmsg_device_id *id) {
> > >  +     size_t len =3D strnlen(id->name, RPMSG_NAME_SIZE);
> > >
> > >  -     return strncmp(id->name, rpdev->id.name, RPMSG_NAME_SIZE) =3D=
=3D 0;
> > >  +     return strncmp(id->name, rpdev->id.name, len) =3D=3D 0;
> > > }
> > >
> >
> > If we encode the port index directly into ept->src, for example:
> >
> >     ept->src =3D (baseaddr << 8) | port_index;
> >
>=20
> There is no rpmsg_endpoint::src.  You likely meant ept->addr.  This would=
 work
> but not optimal on two front:
>=20
> (1) rpms_endpoint::addr is a u32 and idr_alloc() returns an 'int'.  As su=
ch there is a
> possibility of conflict.  I concede the possibility is marginal, but it s=
till exists.
>=20

I think there may be a misunderstanding in the implementation. In this case=
, we do not=20
need the return value from idr_alloc.

When the driver calls rpmsg_create_ept, it can pass an rpmsg_channel_info s=
tructure as an
 input parameter. This allows you to specify the source address you want to=
 bind.
Please refer to the definitions below:

struct rpmsg_endpoint *rpmsg_create_ept(struct rpmsg_device *rpdev,
					rpmsg_rx_cb_t cb, void *priv,
					struct rpmsg_channel_info chinfo)

struct rpmsg_channel_info {
	char name[RPMSG_NAME_SIZE];
	u32 src;
	u32 dst;
};

> (2) By proceeding this way, the kernel exposes the GPIO controller it kno=
ws
> about.  It is preferrable to have the remote processor tell the kernel ab=
out the
> GPIO controller it wants.
>=20

If everyone agrees with this namespace announcement approach, I will prepar=
e the=20
next revision based on it, even though it is not as clean as the source add=
ress encoding solution.

Shenwei

> I am done reviewing this revision.  Given the amount of refactoring neede=
d, I will
> not look at the code.  Please refer to this reply [1] for what I am expec=
ting in the
> next revision.
>=20

