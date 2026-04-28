Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DF84FF8868
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 16:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YBFZDcmrnhT3Om894Po0V720gXBPGinpgGBmDQ0WZ9k=; b=pybUf6kRpeVDDQn/eQZsgEbp0b
	YuchNQ8UiDZNtFqly/Qj01riz6GCUsdAU0IGDFMu5T7YdDzZ5nTesc2Nk5uk4sWcEKz3h/Qx7RCWz
	kT821a2FKGYKY8DKAFpZeEb1Rbbjbo+9rJH9Jn9l7pTc9euzcqOthVDCTu9UVY2oo6mj+u3WHTkYO
	anCSMM72z0xKi6FSSlFCr4w9QnB+cE7YrNpDJDTzKkwuMkeEG4MHAc9wukST2QtKCCjcLYNUVMA4Q
	nfvCdL8omXHjjc/XuMY8pjggZD4jP/HusER2yG7Gl5GR0Ei9v8CF35s+sOHM8iyWjy697++cauEVy
	81tLWi9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHlQA-00000001xHX-1hHW;
	Tue, 28 Apr 2026 16:36:26 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHlQ8-00000001xGV-13Xn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 16:36:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KeVDKhojuZ5FihL2Gh1Dzej6TRwSa10U+ql3pBQQJmtlUH4TklWfMa7LU5mm+PJ4IYAHp1GxK9f7Eo+iVs30TgTQ4xtE7vXlQtRexiraveD8afGdJmzWi5FjbH02nTUkZ3XM17pL7oNIO47ASw0C4DOb5ddWwuU4fvbdnxZBWzcMKom4b9IYn3Nfxmncp7hnSZ82smA9hRVi3uh9hsDwt3K8xhFOg4SVEyuvpBP0gvnlmrHAJR0X8MdBrZ0zf4ECIwHJ1/U8CBnZKNLZa0tg30mqwvQ3ZPj6juhiKyWFeVH3uKKLxhMzP9S4M/gUjDZEEEqRmOfkE3pK3LeuBBtn9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YBFZDcmrnhT3Om894Po0V720gXBPGinpgGBmDQ0WZ9k=;
 b=FjLvNGRYA6PjHhv8zl0Uz8q13hCc0W52fCBAM9Km2CtWc84jqLXgrMigrMGfuX0AjrcjhhF+US2dQuImQ5KL0eUTDUjFpJRSVR1tM0nlA4rg+KToeljODhxNBibHx0hqaFTX1uBsfyV8efx5hZTOybhYmd2vJOiu8k8xUwQ1lQ8MPdxoOzZYUZLR8UTz4f47SE5uoMZD/lJ3tStvX4F05TuT+UVtzqty5y1PGW2MypEmjaTEitovVBKJGJ4nI2yJrrZXcMlcU/3YoMBP0FwKQVxdhWeyRsdRqaGklUfm9CWIijNqxg/o/lnbVNnc7rcFBV4uw+49qeYgTrvFb1K8Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YBFZDcmrnhT3Om894Po0V720gXBPGinpgGBmDQ0WZ9k=;
 b=D7yT/Thhr4t/lto8cgsZV0Bgj6+C3CRKYvM+TgsU+fsu50sBTNiviO6USMh2oZFhGGwOOdG5NrVVBR46ZL1txr+9NE4zohj2/HtAPa+G6ON9tp1wb8uz+RqNbwc36m8DAumwIBPEzkd6AdK7gnlqljm1KbSl167PuQpTFYdnANa7pYjtiQZEEAcr6lfup8jcMsoOKak7sXe5rmN/rgRVUlHoZVVY291rn9hxPoJwAEQC6zHWkKYuLqkucUCHkVVLZBNomFsOKN+rDLzzLFvWEkqe6EjLSH9sCrYDG+apQlRp53ynROPD5DnmUMiJDjjy5pSBp6snJXKYooEjoXMORA==
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by VI1PR04MB6942.eurprd04.prod.outlook.com (2603:10a6:803:136::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 28 Apr
 2026 16:36:18 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%4]) with mapi id 15.20.9846.025; Tue, 28 Apr 2026
 16:36:18 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: "Padhi, Beleswar" <b-padhi@ti.com>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Mathieu
 Poirier <mathieu.poirier@linaro.org>, Frank Li <frank.li@nxp.com>, Sascha
 Hauer <s.hauer@pengutronix.de>
CC: Shuah Khan <skhan@linuxfoundation.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan
	<peng.fan@nxp.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
Thread-Topic: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
Thread-Index: AQHc1y0jvFA11n28QUCTjU6fNbLbbw==
Date: Tue, 28 Apr 2026 16:36:18 +0000
Message-ID: <PAXPR04MB91858D4F2549FA068D7ECCC289372@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20260422212849.1240591-1-shenwei.wang@nxp.com>
 <20260422212849.1240591-4-shenwei.wang@nxp.com>
 <22fb5fac-2568-42be-a7e3-7e89d0017eb3@ti.com>
 <PAXPR04MB91850A11C58419C03909145F89362@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <29485742-6e49-482e-b73d-228295daaeec@ti.com>
 <PAXPR04MB918568939EC7DAEB4BB6C8F989372@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <32c119af-96ad-4da0-86f2-cdc4ba57ef0b@ti.com>
 <PAXPR04MB9185C7741DCC422212F952CD89372@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <8c8cefaa-7d9e-4b73-b92f-40cb52b37f2e@ti.com>
In-Reply-To: <8c8cefaa-7d9e-4b73-b92f-40cb52b37f2e@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|VI1PR04MB6942:EE_
x-ms-office365-filtering-correlation-id: 4c42d29c-5e46-4bb8-97a6-08dea544460f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|19092799006|1800799024|366016|376014|7416014|921020|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info: vojYnOucAqgrlHBm4cpCOF73ysaq+F7MJtpQBpEqgs9ISGdH1V+7RvVW0ijX9ock+TRjeZ5zQ41M+0yq+RiKUtPwqFC7saKIyikteHaTbdAqMLXO/rTWnbqZDn4+t+fube1jFmTANnWvze61C5Bnhgkor2ihHDsAWkMq1zKZblYpIuXMIOVisAYP9V6AYfb87d6DL7wY9QfB2z8rXKSzRQtQHFC0U4tYFuWYwMNJXmOpNA3PPOKr4gzrSiIc7tXoaEoNQT2W1J+Eelog80Bp+qU6mi5geQ65+68rzaUib8CiDO60TbQBI27ZgWBhcR4mvmTAehNh9TC0nx7ehoA5122EVAZxRzNiDzc4nP0zqzU7SPmYm+elUtdiKJJdSBKjyIifnm95dBZXxSKAFMWR8xWbplLLvgOAMLdStRB+rxn8lSamt+A9V8KkWSTXit4m2eS9xJGZipY9qcTQTpQ5aNL8AjFs3rb6kec+K7FCWfgpTOa7nYpj/LoiBghKu0AQLqVBzLk7avh5dxUz/6RdYYxMJ12UytPYjsumBOCWUsJrX6QI6mrsiSksoq1KqCokl5dgfNDtflUvJm1+Quo9OutyQDJ4FDg03wPOrtRF/Gd5y73znXCPZdOa/SwnjJf3bfCobvvZQ8V/pjbCGfU65HBuhVmsL1hDsdlFA3WxwzyEszfsayyBZyXUiktT5KFwfbulAeTgcOLeYQnAgs0U8kFI1TXr12XT3defpMBXyUNKIlODjwfS05ZHWSW2OCeWXvRc9meEeRRMAZ6IjjqOJqCCZanYnVO0MmmUHKONIJ9jLRnSi0m3bOhmP+Sfkqsx
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(376014)(7416014)(921020)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3TA+I6sRj4brZwx/UNCtVNCAKDuWkY26iNUKMqsfqoXZ0i/4SV80ishX2FNh?=
 =?us-ascii?Q?CbvlTMtnRosxxFJbW2cGvGundsCMhXOkb74C4ifxau13/5nQ7W4zcThIte3r?=
 =?us-ascii?Q?F94S6Wq1tc67eJsViWCrLll0ndWIXmzI2fCbbrsd8XRj9HxcqTiH1V/6ElVu?=
 =?us-ascii?Q?c2SYsgBFYj0AOr7kEq+RGKU6yMOFY6o3OU7adbbPJNfIobEtf2opf9il7quD?=
 =?us-ascii?Q?R/Gxijq2TnCiVta/woekpLDv0Vnx4i7C+QEWzzLepCOFDKqKn/svj9YSbKVC?=
 =?us-ascii?Q?xqoBRSFqDnJK/PY1a1o1FKMmfxIDibDwQC8+nYyxRR9NGQhpMXo6knRSP6ey?=
 =?us-ascii?Q?3WrFwuTRQsUa1eLLP/JyAczWPkaw4GpAP/L94UUezRAP6Ggb5NYkp83Ec9xv?=
 =?us-ascii?Q?gqBIscJ4BylcvrLwXOUTKyHbscHBXet3CXwZRRtenrCNWSCGswnmjKVKF7hN?=
 =?us-ascii?Q?36KOkpLEtLphDuRESGfDYraFJJW3jLLNUfPiyl541hdi1+L4N1Ya2V5ftZbC?=
 =?us-ascii?Q?UHg+sYGIPzYN1MALvKl//kzxXLN+QXIB2D6l4SHjumlh/QrJftC2r0ImPv5k?=
 =?us-ascii?Q?e8dZXD7Sx1Fpo98sdrUL1aNSPCrfneLXlewOcrg4Bo0hoeD4bB7q0tL0RQFS?=
 =?us-ascii?Q?zzdqHmgIOHJg/PBUV1PeRMZLf397C7HvOL5AxjCLe4tg7CqGCaHeOzitOPOO?=
 =?us-ascii?Q?585bPmN3/79Gd7s9EmiAfWbfKk/wTPE5W2IdYu0w74USz76gMkwVYbMjD0ch?=
 =?us-ascii?Q?GVmNTEvMSXdyFqpMDDDvLC2eBGvcT1391yn39fMVsFIQm+rpIuFPmWvi4+wW?=
 =?us-ascii?Q?aiEI64b8J4Qy4dF+j6p3iKrt54mnaJwWRM60BpnmhYwGZ8ewGaH6lEAW7wQc?=
 =?us-ascii?Q?/vPhy/SgMtuPYFFc5D644B1AHJRP7Brt8RWf2M1SG4DwRu6uLvhOudsGIcuc?=
 =?us-ascii?Q?9sx3jJjrlVh7iOzG5jZg3eeO1IhxlMSlv7Nq7Xtm60Xcaa4xWbRXuDYL5v57?=
 =?us-ascii?Q?40Qdwr1QVxf2DD8dW6646ou9vT371RmVAT/GhflkYVPsuxfs8y6Scb49p4c6?=
 =?us-ascii?Q?bKl6mJ2xD4i3ytULrcP5ir8PYZLOt1ElW9EM9Q/L5PWJ0r4oUBOwu8rkom8s?=
 =?us-ascii?Q?vE5/B2vKxeI4Namx9c/6ud/VnzPAuit4oFL4N2d0cPK8iPExmGAc18zohk0p?=
 =?us-ascii?Q?Ogb3KUh+VPC+fXWWv28cWQIQQ9JDP0q79oFk2cwZJ73Y5KEFsLHUCf0IWnuX?=
 =?us-ascii?Q?IM2j+U7grWeFxqgtccwI0VYleldm4PKSdW1cCeYDRtV7s3F01/y9MfbMZmlb?=
 =?us-ascii?Q?OKk9GjmbfFd56B/4hpwRCaI7/YzOAcbzQhqbpo7UYFuzIOzlgL1FqwZfBaMd?=
 =?us-ascii?Q?jfuM2yw1tYpo7gN/+g+h8VtuHmraR9+ZOANkKFNYgTmGs9F22KEJoKzskzfw?=
 =?us-ascii?Q?I+wPGp34SU+QEbQF980Qcy458QfAyRGUs1nxgOhteCqj4PbhCEc4ILOzMXY4?=
 =?us-ascii?Q?xk1Ozis28aSh9S+sqPI4bKr22qnp+uzB7GXmf2BwwH4RnHiG1gwQcQS+HlYE?=
 =?us-ascii?Q?k4/PZkPbLWx4s6Mf0ecPyB7ckkkX2r4pHFUCsprftOxf59NkdBrqEPgfD9Kg?=
 =?us-ascii?Q?4cdB5LtfE4UFhuhEWWqCLPC+RooU0g7EImpY1uJYTv0E6DP81aWWCiEc69kG?=
 =?us-ascii?Q?M9LKH7kj2ME7K7hToKTFWtbnTOw5YsfkqCcOHPSwgGiktqFn?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c42d29c-5e46-4bb8-97a6-08dea544460f
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2026 16:36:18.4243
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ByrfzpsIPzfy2rWi0afGiugB80C7qYXHa04sM2gbkVkOnRlAgcfSApCtmxCitYm/7AHvo+2dcHpWaAtxg6kdBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6942
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_093624_466291_0E813E56 
X-CRM114-Status: GOOD (  29.04  )
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
> From: Padhi, Beleswar <b-padhi@ti.com>
> Sent: Tuesday, April 28, 2026 10:53 AM
> To: Shenwei Wang <shenwei.wang@nxp.com>; Linus Walleij
> <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>; Jonathan Corb=
et
> <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof Kozlowski
> <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Bjorn Andersson
> <andersson@kernel.org>; Mathieu Poirier <mathieu.poirier@linaro.org>; Fra=
nk Li
> <frank.li@nxp.com>; Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Shuah Khan <skhan@linuxfoundation.org>; linux-gpio@vger.kernel.org; l=
inux-
> doc@vger.kernel.org; linux-kernel@vger.kernel.org; Pengutronix Kernel Tea=
m
> <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; Peng Fan
> <peng.fan@nxp.com>; devicetree@vger.kernel.org; linux-
> remoteproc@vger.kernel.org; imx@lists.linux.dev; linux-arm-
> kernel@lists.infradead.org; dl-linux-imx <linux-imx@nxp.com>; Bartosz
> Golaszewski <brgl@bgdev.pl>; Andrew Lunn <andrew@lunn.ch>
> Subject: [EXT] Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO dr=
iver
> >>
> >> Nothing extra in my opinion. rpmsg_create_ept() just creates a
> >> dynamic local endpoint address for Linux's usage. The firmware just
> >> has to make sure to reply to the same endpoint address where it
> >> received the message. This should already be in place IMO, because
> >> currently you are sending all messages in the default
> > Since rpmsg_create_ept creates a new local endpoint address on the
> > Linux side, how is the remote system expected to learn and use this
> > new address for communication if no additional logic is added on the re=
mote
> side?
>=20
>=20
> Remote side learns the endpoint when it receives any message from Linux f=
rom
> the dynamic endpoint.
>=20
> Lets say rpmsg_create_ept() allocates a dynamic local ept of 1026. When y=
ou
> send the message from this endpoint, the standard rpmsg header would have=
:
>=20
>      85 struct rpmsg_hdr {
>      86         __rpmsg32 src; // 1026
>      87         __rpmsg32 dst; // rpdev->dst (e.g. 400)
>      88         __rpmsg32 reserved;
>      89         __rpmsg16 len;
>      90         __rpmsg16 flags;
>      91         u8 data[];
>      92 } __packed;
>=20
> Remote side tracks the dynamic endpoint by reading src =3D 1026. And whil=
e
> sending the response it fills the header as:
>=20
>      85 struct rpmsg_hdr {
>      86         __rpmsg32 src; // 400
>      87         __rpmsg32 dst; // 1026
>      88         __rpmsg32 reserved;
>      89         __rpmsg16 len;
>      90         __rpmsg16 flags;
>      91         u8 data[];
>      92 } __packed;
>=20

This explains how reply messages work in this scenario: the remote side can=
 simply send=20
the response back to the source address of the incoming message.

How does this work for notification messages initiated by the remote side? =
Should the remote=20
system need to add additional logic to track the source address based on th=
e GPIO instance?

Thanks,
Shenwei

> Note: Remote firmware can also send messages from dynamically created
> endpoints on its side, and Linux can learn those in the same manner. The =
dynamic
> endpoint address is passed to the callback as 'u32 src'. So you could pas=
s on the
> 'src' from rpmsg_gpio_channel_callback() to
> rpmsg_gpio_send_message() as 'dst' and call rpmsg_sendto(port->ept, msg,
> sizeof(*msg), dst) to reply to the dynamic endpoint on firmware's side.
>=20
> Thanks,
> Beleswar
>=20
> >
> > Is this handled automatically by the rpmsg stack software, or does it
> > require explicit support on the remote system to exchange and track end=
point
> addresses?
> >
> > Thanks,
> > Shenwei
> >
> >> endpoint (rpdev->ept) which is also dynamic[1] and is created when
> >> the channel is created. And you receive the responses correctly.
> >> (Unless you have hard-coded the default ept address in the firmware)
> >>
> >> [1]:
> >> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgi=
t
> >>
> hub.co%2F&data=3D05%7C02%7Cshenwei.wang%40nxp.com%7C057bf7f0976749
> 5bcc3
> >>
> 108dea53e43f7%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C63912
> 98840
> >>
> 26686251%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiI
> wLjAu
> >>
> MDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C
> %7C
> >>
> &sdata=3DiSxGWEvYSyu29loP9b1R2bw8bvwR7pbzQ7D%2FGeB%2BUYE%3D&reser
> ved=3D0
> >>
> m%2Ftorvalds%2Flinux%2Fblob%2Fmaster%2Fdrivers%2Frpmsg%2Frpmsg_core.
> >>
> c%23L480&data=3D05%7C02%7Cshenwei.wang%40nxp.com%7C4ec06bf01bb14dd
> >>
> 2625708dea5387471%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C6
> >>
> 39129859078622527%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRyd
> >>
> WUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%
> >>
> 3D%7C0%7C%7C%7C&sdata=3DOUmjqOdWqiXSTjPDv1TUvrjKP1YTx9ji44SdGlIR2n
> >> Q%3D&reserved=3D0
> >> (chinfo.src is RPMSG_ADDR_ANY)
> >>
> >> Thanks,
> >> Beleswar
> >>
> >>> If the remote side does not need any extra support, this would be an
> >>> excellent
> >> solution.
> >>> Thanks,
> >>> Shenwei
> >>>
> >>>> 3. Send msgs from local ept in rpmsg_gpio_send_message() by:
> >>>>       rpmsg_send(port->ept, msg, sizeof(*msg));
> >>>>
> >>>> 4. Get the port info in rpmsg_gpio_channel_callback() by:
> >>>>       struct rpmsg_gpio_port *port =3D priv;
> >>>>
> >>>> Which also eliminates the need for struct rpdev_drvdata as you can
> >>>> just do
> >>>> rpmsg_get_rproc_node_name(rpdev) from rpmsg_gpiochip_register().
> >>>>

