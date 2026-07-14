Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB1BEC44507
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 18:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hNHT9h0/5iedFNXxcjTF9aJKHUHMEWf6C50U7cP7IqQ=; b=ZcRxeBKXhdYbMq7P3OAxrvTNQp
	LoAZ1TnLSMxtMpTgI9Iz5g3oYH+ikS69Y1mOFvfFPDwqjOliTIR09GcEY1Jd1HEP8+9zi/8tSLfMh
	TJt3nSahqLjiWJeaQVWhSEtHhIfpLIvrD+sGUeNmkfJRi7jyUSOwbeyhpXwv4CAos1VBEaMxyT0Eo
	TcQB3A6+R/9hdTGwQClvA2tAQWDRKVHAJ+PBaMOBvz5orL8uy77MXBsWA80yMjSPKjIVklop4zZ47
	9PKc1ahdAd+fqhbAzaJclVJNqh/ZS9vbp8i7IYGZwWy08Nmi2DJfMwcsH3vWbg9uCMZLT7Wjzzr7t
	Dv5y+wig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wji6e-0000000CuDK-0h1R;
	Tue, 14 Jul 2026 18:43:48 +0000
Received: from mail-westeuropeazon11013057.outbound.protection.outlook.com ([52.101.72.57] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wji6b-0000000CuCt-1vnV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 18:43:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yDF5vBGnNhMoJEcZqYcWdebuKqX08Hk84O6YCPvxFvhcl/6C+TiN+0PuFuOxQU6Lfa3wD8bltp5jBX45cb1Xgi+TLHdbkoXjrrOAkjnABWq2DSPOo9SeJB5EvLB32Rvx5wD6ZRGlV/QJbM3D496r/QgUIKQXYW/4xhSBHtgx7GEQ3sJWe9CEeHJyevml0uO0a3SxpDOb65ixGxxBXlfK/uiZzp6Lv+cInWherY0xwkLJEZ4Ndz3tsNj5N4pBr6Bx4mvom/yYFH8N/87PuJzDzxSLvNY1XrcxFi1sig2lzXmLliPZNVxjg+d+1oTEeCvXuTZrfzQf6t7GtlN7pkVbDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hNHT9h0/5iedFNXxcjTF9aJKHUHMEWf6C50U7cP7IqQ=;
 b=aPZ3Btfl4RfUeoFMZpQyuB+qGA/m2ATv1zr8MUwgD4eWiL9cyKp2mzsM+bP7La29YGl4M7zamwzLom5ZAOD6eTN04nrEnJPhuNKJZUrcUahBJaHfwIv859nkqGprq5HhftS1rbBxKBL5jFtNtYg+TWos5gvbChg6SZKLLf01srUldwrpth0Up8+URrz7KcVpvusmuvySSM++QRgnvJ06z9yYfou0PRHF1sMwtNYJYUW1CXhg8GPwhgUip0cfUaDPxboKlFTnf9FYBUS0AFYfUlB6oFgzIQwImY/0GdzHpWHol7pU3IhAQEU+QEdKzaBl6k6tRLtgi+fPZ+oe32DJkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hNHT9h0/5iedFNXxcjTF9aJKHUHMEWf6C50U7cP7IqQ=;
 b=Bg8j405j3LKj4C95WAtaVPkBP9+oqXM5MrAUO3K1KABFOm6Hunstq1SSVJf8uHud9rwcWM/ENKVf7AecKwJpjQ/rGzxml5KMxoCox0sBcrBhw12vOyXl9maW1beVCY7WzeYNk8PWrp9xll59SrWT/sjk1Ra5dQ8VASnf4FqVnPof1km48A14QjIqAfYodDIU8c3ujJCB4fZz0SQPyONPk0eDjt9c5WYe8bi/k9q7mFA9SzaT0focs6DjDV8OQYT6Zgq5K9iAxu7pbuOEPEQpH+RUCTOX/ppxW24zl7V8aClj/CmJuT7YG1h1YcFsq7TL5mZxpl95Pp0zk8AQ6CkJ/A==
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by PAXPR04MB9397.eurprd04.prod.outlook.com (2603:10a6:102:2b5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Tue, 14 Jul
 2026 18:43:30 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%5]) with mapi id 15.21.0181.016; Tue, 14 Jul 2026
 18:43:30 +0000
From: "Shenwei Wang (OSS)" <shenwei.wang@oss.nxp.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>, "Shenwei Wang (OSS)"
	<shenwei.wang@oss.nxp.com>
CC: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn
 Andersson <andersson@kernel.org>, Frank Li <frank.li@nxp.com>, Sascha Hauer
	<s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>,
	Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, "b-padhi@ti.com"
	<b-padhi@ti.com>, Andrew Lunn <andrew@lunn.ch>
Subject: RE: [PATCH v14 1/5] docs: driver-api: gpio: rpmsg gpio driver over
 rpmsg bus
Thread-Topic: [PATCH v14 1/5] docs: driver-api: gpio: rpmsg gpio driver over
 rpmsg bus
Thread-Index: AQHdE8Cq27ppElL+eEigN5N73Xpyyw==
Date: Tue, 14 Jul 2026 18:43:30 +0000
Message-ID: <PAXPR04MB9185B1A3F16D82E8C0C76EE689F92@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20260625155432.815185-1-shenwei.wang@oss.nxp.com>
 <20260625155432.815185-2-shenwei.wang@oss.nxp.com> <alUdg9iTysXCFUa5@p14s>
 <PAXPR04MB91852808D2C7491AEF98CF1589F92@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <alZlZvQQwq-g6VL3@p14s>
In-Reply-To: <alZlZvQQwq-g6VL3@p14s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|PAXPR04MB9397:EE_
x-ms-office365-filtering-correlation-id: 790b92e8-166c-462c-f232-08dee1d7ccb6
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|376014|7416014|19092799006|366016|1800799024|38070700021|3023799007|6133799003|56012099006|18002099003|22082099003|4143699003|11063799006;
x-microsoft-antispam-message-info: gZ8JYN659EmXx3ztehAJjXPlY4hglNGc89YBePUsqJNPcK5D3bPnPibCbM/h3wQzOba2M7pZXSp+wEW9O3Xp/FgSLTJ/TvaGXkFpcgI9AB2xSfmyW98WftqzDP4Qfdh5GVtt3bGKLse46K51CTje00fN+X5wKDn22hO3pspzdWO8HUcEh6WiRJc0evkQG+sG4FOMAfbK/hE6btLGbxsLkezWE6dM3EuplvFPTM7k1lbNDjwNM/Nk0mYQ/nG/5XfX7hwy17etMyTv5M702yz9+rhFWZ5xgqMdFxT3jTqNjScngFCN5j6sr06nMj/JUuXHjWQA+7aysd/zXlEuPwY41Muf1+1nwP3wCl0aoTGzOMD4/kjtEgXkCLAaLi8cwgtDnhJ3uIi8MhITzgcnj/Iu2xprO0fc1vo084Q2Bj0BTKYtDcF3aUddw5sYP3G62uecCSRxzCeBneLjM0EAPhLthvol3KwXiT6JsFiOqF4M4x9Quxfo9APYP2jDGp2lHAaB8muu3DuPzFDslAjSmUgqJjS2qNLBXgMIOLvmUcBa2mmE9skXqVpBETqPjaMniAMDQCYOJo8hjWoM0RaroPtUzPUSPilSfUuGjeQztcCfcTtc0M3kgn8ZjQoETmFBsrSZPbkqbMwXz8vCcOW9/GbeiDJrWWlQnPehlpzYX3wSuG2ZtPghS+T2ZL+5ucuq8x0W+pMOpiUzdX3p6vrguJ0syzkNNDyN1IVLY9OEBiMH4O0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(19092799006)(366016)(1800799024)(38070700021)(3023799007)(6133799003)(56012099006)(18002099003)(22082099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?XYLNp7Qg6Su8GFT6VUe8U25vKsGr1WmcpYEHSUffTC1EbchcbZ7BWpBEAhaY?=
 =?us-ascii?Q?9cg+ZI7a+sxrpQ8MZ1JM6aVhY6mqRMJ9wQeVffD32lfb+ocHpvrQxf7w+YeQ?=
 =?us-ascii?Q?AFwMvLhZYA63OjN4MphrxD07cnl0xRFIV0vR9PHKH5/eV7pqpXinLiVq1/hV?=
 =?us-ascii?Q?nS1DwJEuA69YDZeN0wwb6LTwyNz7SDU8xkL5B/cCheFbUuYwzwrcz28liJiu?=
 =?us-ascii?Q?UWlXckIyjMtQKiED5VSZa72fU0RA6p5KaAxT0JTHWo5YRZDQLriNEnX2/IXn?=
 =?us-ascii?Q?cT6pqXjAK4NQ1IGe6SVfc4YbsyassWWY7hx7Bk5sacC+qKBkeoca2Mxa22OZ?=
 =?us-ascii?Q?YDo3yjqngEBaCvRgSo0BBxIUJlCg+byMAaHffvRyqQE5NGKTvMdtyIg696+3?=
 =?us-ascii?Q?hS2J285VM06ucEs49dROpCh5FVe6U8QKhV1SJXybZI7ThftL0HxJgk4pJueO?=
 =?us-ascii?Q?aAKP6KU8ciAkcYQ/I/UI+koPYNrjIDscUZWrXqDihvurC0Q8VNH3YHWO9fA4?=
 =?us-ascii?Q?mM1l4L6EJISNfYO+OXqKaCWwpr+7bvYLIHBJNMHHvcaC6cSYEiOMc1CJCdeJ?=
 =?us-ascii?Q?ODRsip69+NNP9XeZ27I4s+p7Yfsn5YvzjutE9KHeGf9eVlm28S7IniQcjblR?=
 =?us-ascii?Q?AiFlPhlIXaGBaiRH27SkNlOmrL4udIpUeV8MJl/Cgn3K7vFR5vtUWco9ZqEI?=
 =?us-ascii?Q?vqJR9yq3ucIzS6PQnhc8SDFPaTzPY+j1cqjo4NWxYK8Al/EWgcmSmUiquVty?=
 =?us-ascii?Q?XSi5o3n5lbGC89M0xy8d2agmNq4CmN6aWSpcmH1G0TG8HHsO3PSW/raJ6lJR?=
 =?us-ascii?Q?QFvGb0IVrJJJA3LS/uMdN6MDRIa7Sg7v72hCC+IImY0CW3qEHy6QK0uURMqm?=
 =?us-ascii?Q?ROCKx0aLin+1sCQILz2nrtmWiA2p284OBeIdezsfr+B+GnJ3ttigRH3q30Y1?=
 =?us-ascii?Q?JE20bnq7OF71cqcIpqcIPQ/8Jh4tPWJdY/Mt+f4ivM2q77g6VhD9TrRYNhk3?=
 =?us-ascii?Q?B5YxKLPszK9xDD9pZmwxMBNQ3vFlYzMBeSsr6gLfg5R7++wADHSvCIahZuAL?=
 =?us-ascii?Q?LnpFAZRhfwp+OTjMijScS04h7SRfPurr2cIC0duiZXsFZHUrRNLiGKTiEx46?=
 =?us-ascii?Q?X2v0T5i9hPFGHu73Rk9LYyRcfcW6XPh37uTqaEp/WAqq6w1PhClP1JxwSvXI?=
 =?us-ascii?Q?ZvN6XIiDvosqxQR6fEdmzwd8yI08DgrU0fyxJ/VyzoSxodb7OS+66CXmN7Uu?=
 =?us-ascii?Q?cSFbzOf+1u0LooXa4aLiun7gJWBDmwK+M6agXaCEklvUEMpFz/ZAvWm90iGX?=
 =?us-ascii?Q?2yO4qUON6V95CYCMgIiVnzLQ75d2fXFX4+Muc7ei2RoTBdlwjZlpAmr5Xewq?=
 =?us-ascii?Q?/FhKf+tGJk9XeS+KlkD4uc071RpCBThVjpFbMhJm+jDd0s/kiFuGSBegXPPK?=
 =?us-ascii?Q?A9HEb2N1CgNUyWULhROu0y4XGMWNopveP0uHH4FwdcYvT0DoQ0KCa9EIeaBq?=
 =?us-ascii?Q?+0hdP4lF0NTMNcj+oG020mhAqKcFf61jhodWAWiSOgIg6Wv8IxBVRPn4iy44?=
 =?us-ascii?Q?WKtyCDVgIvbgfFyJJQGsU28+oS+ym9Jr1lt7FPbD8xdZRvtnS0SUIjbDOSlw?=
 =?us-ascii?Q?w2yOgXcQS+MrJSYKKzo9qzoL9W7WPxSHcQhdps/tU18ySf2GNCR9RnosC3jj?=
 =?us-ascii?Q?3AvEGGIhpAX4+1XaOQNNu3TfJIJvHtW/DTl+lr02l8TWIug/wjexUdd2+9aW?=
 =?us-ascii?Q?umq0euY5fg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 790b92e8-166c-462c-f232-08dee1d7ccb6
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2026 18:43:30.1422
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KNGvivI3RFv4hpOh00nmb9fx9EPZTY/nKFVDNGTcofNRknEqf3RwoqN5Ch12CZsw7gBTkySsmnjXOmNhHmo72g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9397
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_114345_652542_FDAEA325 
X-CRM114-Status: GOOD (  37.33  )
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
> From: Mathieu Poirier <mathieu.poirier@linaro.org>
> Sent: Tuesday, July 14, 2026 11:36 AM
> To: Shenwei Wang (OSS) <shenwei.wang@oss.nxp.com>
> Cc: Linus Walleij <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.o=
rg>;
> Jonathan Corbet <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzyszto=
f
> Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Bjorn
> Andersson <andersson@kernel.org>; Frank Li <frank.li@nxp.com>; Sascha Hau=
er
> <s.hauer@pengutronix.de>; Shuah Khan <skhan@linuxfoundation.org>; linux-
> gpio@vger.kernel.org; linux-doc@vger.kernel.org; linux-kernel@vger.kernel=
.org;
> Pengutronix Kernel Team <kernel@pengutronix.de>; Fabio Estevam
> <festevam@gmail.com>; Shenwei Wang <shenwei.wang@nxp.com>; Peng Fan
> <peng.fan@nxp.com>; devicetree@vger.kernel.org; linux-
> remoteproc@vger.kernel.org; imx@lists.linux.dev; linux-arm-
> kernel@lists.infradead.org; dl-linux-imx <linux-imx@nxp.com>; Arnaud
> POULIQUEN <arnaud.pouliquen@foss.st.com>; b-padhi@ti.com; Andrew Lunn
> <andrew@lunn.ch>
> Subject: Re: [PATCH v14 1/5] docs: driver-api: gpio: rpmsg gpio driver ov=
er rpmsg
> bus
>=20
> On Tue, Jul 14, 2026 at 02:29:12PM +0000, Shenwei Wang (OSS) wrote:
d
> > > > +  - 3: Both edge trigger
> > > > +  - 4: High level trigger
> > > > +  - 8: Low level trigger
> > >
> > > I'm in agreement with cmd 3, 4, 5 and 6.
> > >
> >
> > How about cmd 2?
>=20
> Yes, I forgot cmd 2.
>=20
> >
> > > > +
> > > > +**Reply:**
> > > > +
> > > > +.. code-block:: none
> > > > +
> > > > +   +------+--------+--------+
> > > > +   | 0x00 |  0x01  |  0x02  |
> > > > +   |   1  | status |    0   |
> > > > +   +------+--------+--------+
> > > > +
> > > > +- **status**:
> > > > +
> > > > +  - 0: Ok
> > > > +  - 1: Error
> > > > +
> > > > +SET_WAKEUP (Cmd=3D16)
> > > > +~~~~~~~~~~~~~~~~~~~
> > >
> > > I already commented on messages that are not part of the virtio-gpio
> > > specification.
> > >
> >
> > I don't believe virtio-gpio needs a SET_WAKEUP command.
> >
> > In the RPMSG case, SET_WAKEUP is required because it performs an
> > operation on the remote processor, so the remote side must be explicitl=
y
> notified.
>=20
> What operations would that be?
>=20

The operation is enabling the line as a wakeup source. In practice, this in=
volves configuring=20
hardware-specific wakeup settings (e.g., register bits) on the remote proce=
ssor, so the remote=20
side must be explicitly notified through SET_WAKEUP.


> >
> > For virtio-gpio, however, everything is handled locally. The other
> > side does not need to perform any action, so sending a SET_WAKEUP comma=
nd
> appears unnecessary.
>=20
> What is "everything"?
>=20

I mean masking, unmasking, and marking the interrupt as a wakeup source. Al=
l of=20
these operations are handled on local processor.

Shenwei

> >
> >
> > > > +
> > > > +**Request:**
> > > > +
> > > > +.. code-block:: none
> > > > +
> > > > +   +------+------+------+------+------+------+------+------+
> > > > +   | 0x00 | 0x01 | 0x02 | 0x03 | 0x04 | 0x05 | 0x06 | 0x07 |
> > > > +   |      1      |    line     |           value           |
> > > > +   +------+------+------+------+------+------+------+------+
> > > > +
> > > > +- **value**: Wakeup enable.
> > > > +
> > > > +  The remote system should always aim to stay in a
> > > > + power-efficient state by  shutting down or clock-gating the GPIO
> > > > + blocks that aren't in use. Since  the remoteproc driver is
> > > > + responsible for managing the power states of the  remote
> > > > + firmware, the GPIO driver does not require to know the firmware's
> running states.
> > > > +
> > > > +  When the wakeup bit is set, the remote firmware should
> > > > + configure the line  as a wakeup source. The firmware should send
> > > > + the notification message to  Linux after it is woken from the GPI=
O line.
> > > > +
> > > > +  - 0: Disable wakeup from GPIO
> > > > +  - 1: Enable wakeup from GPIO
> > > > +
> > > > +**Reply:**
> > > > +
> > > > +.. code-block:: none
> > > > +
> > > > +   +------+--------+--------+
> > > > +   | 0x00 |  0x01  |  0x02  |
> > > > +   |   1  | status |    0   |
> > > > +   +------+--------+--------+
> > > > +
> > > > +- **status**:
> > > > +
> > > > +  - 0: Ok
> > > > +  - 1: Error
> > > > +
> > > > +Notification Message
> > > > +--------------------
> > >
> > > "Interrupt Messages"
> > >
> > > > +
> > > > +Notifications are sent by the remote core and they have
> > > > +**Type=3D2 (GPIO_RPMSG_NOTIFY)**:
> > > > +
> > > > +When a GPIO line asserts an interrupt on the remote processor,
> > > > +the firmware should immediately mask the corresponding interrupt
> > > > +source and send a notification message to the Linux. Upon
> > > > +completion of the interrupt handling on the Linux side, the
> > > > +driver should issue a command **SET_IRQ_TYPE** to the firmware to
> unmask the interrupt.
> > > > +
> > > > +A Notification message can arrive between a SEND and its REPLY
> > > > +message, and the driver is expected to handle this scenario.
> > > > +
> > > > +.. code-block:: none
> > > > +
> > > > +   +------+------+--------+
> > > > +   | 0x00 | 0x01 |  0x02  |
> > > > +   |   2  | line | trigger|
> > > > +   +------+------+--------+
> > >
> > > 2 things here:
> > >
> > > 1) You did not include messages that mask and unmask interrupts at
> > > the driver side.
> >
> > Interrupt masking and unmasking are handled entirely on the local proce=
ssor.
> >
> > When an interrupt occurs, the remote system masks the interrupt and
> > then sends a notification to Linux. After Linux processes the
> > notification, it sends a SET_IRQ_TYPE message back to the remote system=
,
> which then unmasks the interrupt.
>=20
> This is the kind of information that should be part of this documentation=
.
>=20
> >
> > Thanks,
> > Shenwei
> >
> > >
> > > 2) We are carrying virtio-gpio messages on top of RPMSG and as such,
> > > this whole protocol should be about thar:
> > >
> > > +------+------+--------+--------
> > > | 0x00 |       payload         |
> > > |  Q   |                       |
> > > +------+------+--------+--------
> > >
> > > Q =3D 0 requestq
> > > Q =3D 1 eventq
> > >
> > > The "payload" part is simply the format of the messages as found in
> > > the virtio- gpio specification.  From there, the only thing left to
> > > mention is which messages are not supported, i.e get line names.
> > >
> > > > +
> > > > +- **line**: The GPIO line (pin) index of the port.
> > > > +
> > > > +- **trigger**: Optional parameter to indicate the trigger event ty=
pe.
> > >
> > > Not part of the spec - remove.
> > >
> > > Given the refactoring work that is still needed, I will not look at
> > > the implementation.
> > >
> > > Thanks,
> > > Mathieu
> > >
> > > > +
> > > > diff --git a/Documentation/driver-api/gpio/index.rst
> > > > b/Documentation/driver-api/gpio/index.rst
> > > > index bee58f709b9a..e5eb1f82f01f 100644
> > > > --- a/Documentation/driver-api/gpio/index.rst
> > > > +++ b/Documentation/driver-api/gpio/index.rst
> > > > @@ -16,6 +16,7 @@ Contents:
> > > >     drivers-on-gpio
> > > >     bt8xxgpio
> > > >     pca953x
> > > > +   gpio-rpmsg
> > > >
> > > >  Core
> > > >  =3D=3D=3D=3D
> > > > --
> > > > 2.43.0
> > > >

