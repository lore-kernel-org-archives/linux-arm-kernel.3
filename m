Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88130FF8868
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 20:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8cg0aOu2xAH/6AkiAdYAtg5h4/ZkSIFXHAVMBZZMG3A=; b=LMa1YQjlO2C9uCK8yCzQT3bfD+
	6mOSPnKQFfRCulrKJw7MP76H83e6VzRcbdOtAkGqa7v/kzfcmhoefIJmZhxFKtd1+/9euNbL2iHUk
	ueHABYMexL755YCJKAgv24ocF1SokuGC4j5XUIIA3rjRDOrKA8E0VWNjB/KK0FKOvIw6nU4NUeplA
	6AZSMCE8W42e8sBE0MhJe94t/2tdwCaWyKA+YhBWNHiDdka6fo77++m1A6YALyxRZdFCGFTTsTBjb
	G2I115NAv/P8VrlJbeay/4kwLixo7SyLl+xvLIPHLYthQaq5iykd10mSWvq75Qq6rOEz6o9xkyT7Q
	fgCbY3YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHSoB-000000008hD-3Ow1;
	Mon, 27 Apr 2026 20:43:59 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHSo9-000000008gm-1Hg7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 20:43:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ruNNbiSbhTzyUnrHE/VL0a2eZe/LXqMTnEYeAqTiTJnJJeaR2S5y92dIp1h/bF6M8gkp+UoA4Almbup1sOPaPIWY3N9YkIF7P8NmWvryZz6QcWJhHkbaXOwUDeU5lHiwL9Iuhdkdyla+rKKGGS7yK9laWyF74JnpH8Puv+zIvW8xymJUcBD0dZfVVj6jR76WaATuDIt7bxYP8yLOijam15W884ffs97y5jomDQVqLSFSfg6WWLWpbW7b1SOugupH09IxEVD+jEsELMHYJojzZZ4EHpZV5n9OWQtiNN+jL6Lo51YWZ+0ABFqciYnjkQj3eZZXc6Szo1RdkZ8EMkf/VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8cg0aOu2xAH/6AkiAdYAtg5h4/ZkSIFXHAVMBZZMG3A=;
 b=EKe/BTGqlxaxTNUO6Yq6CftSFvhrSkSgMolWhTYHFolp96hRZTnIz8r3Hs2u8g+bnkB/AwdtkqHVpmvtVM/J0vPzcjNPb/vbXczbHBklLB5kKUvv7MNMuT8t11WZ4/OnMye8jYIbgs91X1wIIS+KQMbBt6QoWGN/WOzDb49XeDVca64yrKDJOZ8E65jTVqzIBjrsli9imgvTJBSKbayiZdBI6Vdl5H29HbN08PUEOP6EQUpn6EUg1rPbYIHNDh8N4ZLZ8nlz9I8V3mjUpDaVkjwCr6d7kM4RFfUngeo8xnnopYjgPbc9bxdsn8ViIJkYla66SPUrW5rckfxiog5Zzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8cg0aOu2xAH/6AkiAdYAtg5h4/ZkSIFXHAVMBZZMG3A=;
 b=nSyD1faGZEOZaY/pvka+DnCfxAMvw5+OkWqQUGI7bJVWgUKl8ZUoXF5rN28XJZMAKVfqC7VC9GPhM/2A2KBT14CeX/dMKFsPVb0VhdoVRhVayAdbDKYZ8KBDHbR/COK0/U9Jf2erxkcMGi9icbGu2FdVSt1eETxtu9+ixGqszA7M4KLT/KfL+HmoQ8ml4lplW9arY0bvzyWGtg56i77Z/Tqv/JODvwfpXegsGHh/VaG9ko8ylV5AZ191OqCVae7ccWyGbvzhNxSsPjtx8Jlws5yBzBMsrvjfqmn1cXg2SPmf5yJAmCmv34vaDx3S9otntPgARSm8hIK5+cz/pkP75Q==
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by VE1PR04MB7359.eurprd04.prod.outlook.com (2603:10a6:800:1a0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Mon, 27 Apr
 2026 20:43:50 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%4]) with mapi id 15.20.9846.025; Mon, 27 Apr 2026
 20:43:50 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Andrew Lunn <andrew@lunn.ch>
CC: "Padhi, Beleswar" <b-padhi@ti.com>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Mathieu
 Poirier <mathieu.poirier@linaro.org>, Frank Li <frank.li@nxp.com>, Sascha
 Hauer <s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>,
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
Thread-Index: AQHc1oaNaZJa14hBPEmAWUxc8fCMGQ==
Date: Mon, 27 Apr 2026 20:43:50 +0000
Message-ID: <PAXPR04MB9185009A17DFDF3D6C8B44E789362@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20260422212849.1240591-1-shenwei.wang@nxp.com>
 <20260422212849.1240591-4-shenwei.wang@nxp.com>
 <22fb5fac-2568-42be-a7e3-7e89d0017eb3@ti.com>
 <PAXPR04MB91850A11C58419C03909145F89362@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <6412a758-4560-4cf1-a0d0-5b24d1a715f1@lunn.ch>
In-Reply-To: <6412a758-4560-4cf1-a0d0-5b24d1a715f1@lunn.ch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|VE1PR04MB7359:EE_
x-ms-office365-filtering-correlation-id: a2408992-98e6-49d4-2182-08dea49db052
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|19092799006|7416014|1800799024|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info: Rb6ywbYng2ut3bNrcRv7PdUopBzBDWrn1oSlyUT7mBX/OjwJzGCfA45JMbS1IJoZGFp/yBsLNOOMXcErEczKVv3dgjxWHZ1yQE7sZRMwoUWMqMs26Ba9/PVJ6wwuBfVKD2eRU2Hice6pz8FGQfZL6FwwClPI+vpxw4qrzAV/tjtxcAtXfdjXvoT0R12u8wUi8hHzBnS779/UJEgFHx7gDRjTis2Ugc8bmG/HPSPrrvkglGH+v8JEar/mS5gbDJZgjPqxPimsKC7pNds8Hspc7XX2daXlsJsQwuy3RkCed9ZFqGz0p+BGJd0kFf4JX9v0Xq8+udSMEOCUEDXEvwxTLMsHworZ2OvELE1darIcNARho7iKKFF1cNG2TO3nWbDArHEGGHOSaStZoXssLx3NTst2+qjgLjAX5FzCs2oa/3sjeb4mBGqU7XpjRMJXZYKqeOWFp6BmQbwjwWCfTgOVc7HrH+KTZGwtyqGLgWAWLNEoVT419UIkxj1olMOPKVnAaNBpoYC5F23cxUoB7Hbao5FMjihfH483R7GAjAyVjQP/rzMp3iOMsMDAKUmUDXuJAfEvPpdGL6pgDRY1jhk1LzeoNPptNiG2ETmV4Gg+1ddRAWXbU23e1i9/i8W8+4gTFHRk0IZax7WYoYMzozr0jl/gVOvwrNlP187ue2OsvyPYj/T3d25kxd+IoGLcNFjfo1mWxJuBUEUsgD5E8KgPOkI03nTB2OYsgbOB+kdFG8N5fp6tzMHfOWNuWfusc+dSIV6VbacB6sAn2/fKYf+MHXojh7PoYhe9+8yUxGSQQjk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(19092799006)(7416014)(1800799024)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?MgQMzgHYUQk55wjKR6aLlzV23isVEpPRbtJohLCajjrfwXj/nwEhcV/Dh7ox?=
 =?us-ascii?Q?Klt2XRvbZZJVDobExcVGQtewZwz+U/2s0x2x4I+V9OpBIeB7M48g2nfGo2QL?=
 =?us-ascii?Q?ju1t6PGIh2dBYg0L2KkQEGWda/3wN9O7jBu2pKGGdwSuXFjcbwZ2EodO6J3T?=
 =?us-ascii?Q?qFR5pR543ieNrv1RRmNfNjkvi1bWD3xbrrMrsgBae5NTdjF4azEoRh3rsJ3g?=
 =?us-ascii?Q?EcS2lj8DDTP+hZijTMyo7+BEb8wIZ3lJLYI1GgYKg7XWQuo/Imx6Zs/4amGa?=
 =?us-ascii?Q?4HM9LX1XLwmZTXxg7HF26M7KMBEBQBp6Ou+RmoW7v+uqMxFXpZP5+aH0X79T?=
 =?us-ascii?Q?aEY1W6f31yj1kwsUsHNpasl4e1dLa+M6+3dxWVfdAFXqq+8Oh8SPLnBS7mUA?=
 =?us-ascii?Q?NIUlgkXmZ3hu6rjgbYg7Ek322FqKaGdW67SHXl413oCFhcNQHWHTYl+d7qVj?=
 =?us-ascii?Q?P0+Onls8PZ7OZlgUdAwXzVbtBNWRyiHW9L6ez16vtcu1muhHOHBA+tnk/8Z9?=
 =?us-ascii?Q?C7kK+tot2w7YEE6tN4Ow9XnGy09iT2EMw6TZaFTLdGDtF1K/VPKJGdnFwHRi?=
 =?us-ascii?Q?uCFRlE08aI0KVvKFUEydk+2oJmRkqwcRl4w6cF9u+SYKEnGHDFhTB5377yoL?=
 =?us-ascii?Q?4s2C24wbsjqUxeejSyjuM5ohbHiuchRo7wzQkw3uZI5y2KzLmeNGiIrDn41s?=
 =?us-ascii?Q?ne4SPb7+M2unxS4pGMWpVT3LyuGuq3mvTcShuQr0Nssl3trMoiSf/8ZtrkqW?=
 =?us-ascii?Q?lgq+5mX+3tKKa6M734p/ATKLe1bMpb78rquYYIYHsyqBfmM88QdZAjPt/LIK?=
 =?us-ascii?Q?jCAOpLjM6S+/mhDHgZZS2urXRymcxy1M61+fSHxPaP/Fj8fWOb0ngACz/AwI?=
 =?us-ascii?Q?vOY/1tapipzqRglTCRer4rfsPNVO+JoM/46HNUX9OW/0vxhu2yyWHYxvyvP4?=
 =?us-ascii?Q?XN1JB9sobii1ny2d4bn+qhzVMwsziP9qc2//61qGqFloNqoIKS6pIX6kmEfH?=
 =?us-ascii?Q?bXCcFdj0dvzGuJ8JErMUsE9F6WhEjDua91Q0cpF21WmLtlMvaXgOu9AFj+Uf?=
 =?us-ascii?Q?P8Op4k0f79IjOk3Hzx+Yze3L5E2aYbSe5iy8DvnyMvG6uUW9ueNs1ogeyXtV?=
 =?us-ascii?Q?1NnQ8JNAERCmGOGkGops2jmN6LMym5J2+WbHA2gYQbVO3ww1GoQ8nzBOMyZL?=
 =?us-ascii?Q?+HL8AMAh6JdN8+l0mk7+GSAdk3m9IFQrszaKWOOkJfOxllHG0rsrV+oA0AHI?=
 =?us-ascii?Q?affoMCO8JFvWmQSAf1j15pPF8bdOTqOtD0Nf08vSLx79s+0enhs/XLMEMtfB?=
 =?us-ascii?Q?Q/Un77bqtKxZKUAFjElapeoTRCKe4lfIAyrfDL1ffKJi6O1ZyGhGKCvCi9Yq?=
 =?us-ascii?Q?NcoDV2XrtvmIshmXvr+ATtQmDHYvRLGJzt3d5AhmkZnKvY7urz6zMJUK/y/W?=
 =?us-ascii?Q?6ghmp0ZV8WJn6B8bFZOAzpDXkjSS3Tx32A9VN5BXi2M9Rd0QiO9BodNA5bUl?=
 =?us-ascii?Q?9O1osLiePrRucfkYf5fADKU/34fozfOllixrDXz2aue7viaP90HvOqE29la/?=
 =?us-ascii?Q?CjiiuCW+o0Oa4IRvPMvKig9MbjCjXYKubUWopR9tCSso8MSA4aARRtkTlaJ7?=
 =?us-ascii?Q?hxG47+lm6t9jYRniODajwn25xTALoJ7guSsRI8AOL7B/3E2YNFZkJWkNeqMK?=
 =?us-ascii?Q?g/pWr1xwRpn3FbLkxLv6H7pzoDNt2AEqITdsUWNtRqRX4THF?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2408992-98e6-49d4-2182-08dea49db052
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2026 20:43:50.7563
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cG4FTrqJxwq52yiBy54MVCF7Yzmn+ElSlTgAr9miTv/GIzenDEstgPth7X/VMLGabplTyawFJE/cccZqGlVtXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7359
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_134357_371190_93E08D98 
X-CRM114-Status: GOOD (  29.62  )
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
> Sent: Monday, April 27, 2026 3:28 PM
> To: Shenwei Wang <shenwei.wang@nxp.com>
> Cc: Padhi, Beleswar <b-padhi@ti.com>; Linus Walleij <linusw@kernel.org>;
> Bartosz Golaszewski <brgl@kernel.org>; Jonathan Corbet <corbet@lwn.net>;
> Rob Herring <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>;
> Conor Dooley <conor+dt@kernel.org>; Bjorn Andersson
> <andersson@kernel.org>; Mathieu Poirier <mathieu.poirier@linaro.org>; Fra=
nk Li
> <frank.li@nxp.com>; Sascha Hauer <s.hauer@pengutronix.de>; Shuah Khan
> <skhan@linuxfoundation.org>; linux-gpio@vger.kernel.org; linux-
> doc@vger.kernel.org; linux-kernel@vger.kernel.org; Pengutronix Kernel Tea=
m
> <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; Peng Fan
> <peng.fan@nxp.com>; devicetree@vger.kernel.org; linux-
> remoteproc@vger.kernel.org; imx@lists.linux.dev; linux-arm-
> kernel@lists.infradead.org; dl-linux-imx <linux-imx@nxp.com>; Bartosz
> Golaszewski <brgl@bgdev.pl>
> Subject: [EXT] Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO dr=
iver
> > > > +struct rpmsg_gpio_packet {
> > > > +     u8 type;        /* Message type */
> > > > +     u8 cmd;         /* Command code */
> > > > +     u8 port_idx;
> > > > +     u8 line;
> > > > +     u8 val1;
> > > > +     u8 val2;
> > > > +};
> > >
> > >
> > > Could you please document the fields in these structs (and the below =
ones
> too)?
> > > From the code, it looks like while sending a message from Linux to
> > > Firmware; val1 and val2 are used to describe the values to set.
> > > Whereas while receiving a response, val1 represents a possible error
> > > code, and val2 represents the actual message of get type queries. If
> > > that is so, you might want to change the variable names to be more
> descriptive and also use a union.
> > >
> >
> > The fields in the two structs are fairly self-explanatory. Do we really=
 need the
> additional comments?
> > The previous version of the patch used a union, which was updated to su=
pport
> the fixed_up hooks.
> > Now that the fixed_up hooks have been removed, I can revert this back t=
o the
> union-based implementation.
>=20
> I thought you had already adopted the virtio message format?
>=20
>=20
> /* Possible values of the status field */
> #define VIRTIO_GPIO_STATUS_OK                   0x0
> #define VIRTIO_GPIO_STATUS_ERR                  0x1
>=20
> struct virtio_gpio_response {
>         __u8 status;
>         __u8 value;
> };
>=20
> Seems pretty obvious what status means. value depends on the request,
> get_direction actually uses it, and it can be one of
>=20
> #define VIRTIO_GPIO_DIRECTION_NONE              0x00
> #define VIRTIO_GPIO_DIRECTION_OUT               0x01
> #define VIRTIO_GPIO_DIRECTION_IN                0x02
>=20
> and gpio_get uses it as a bool for the state of the GPIO.
>=20
> Why do we need all the complexity for val1, val2, etc?
>=20

It is the same message format. Please see the message definition (GET_DIREC=
TION) below:

+GET_DIRECTION (Cmd=3D2)
+~~~~~~~~~~~~~~~~~~~~~
+
+**Request:**
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
+   | 0   | 2   |port |line | 0   | 0  |
+   +-----+-----+-----+-----+-----+----+
+
+**Reply:**
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
+   | 1   | 2   |port |line | err | dir|
+   +-----+-----+-----+-----+-----+----+
+
+- **err**: See above for definitions.
+
+- **dir**: Direction.
+
+  - 0: None
+  - 1: Output
+  - 2: Input
+

Shenwei

>   Andrew

