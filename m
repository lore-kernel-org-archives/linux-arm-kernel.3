Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3D3BC83F15
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 19:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lK0XYQ6jvZ0z1I7LMCEQqUJd8PSf3fvdJRjw210vfuo=; b=mZwGsFiaPrtBLwrL8I5tgDi/d8
	HAuc5b7gIIQeGhOEebDc56iXMuwtn9Mpl7ReuC37a9BPEPwj7bLRtLghCmzIkUVgIef/XIPZ6i27A
	t0UM2BJl2vTV515gx3vRuhBDYHNU7WExQw+Lm7HNnm8s74FRJyqan5AY1TS873L8tLsT3lqplp/V0
	0reMOtZssVNrSW+DyRj/9TjaaGuzGBoSkPmGcn+dODrN7fwM78mpdTEJzLF9U+i9uYja3kdWIL8Kz
	CuPXvd2bDJbgy1HH8UtAmeK72CvLe6tNu6/Wo+lC8cAYyTZU0gIEINebUzpwry5ErgmpPWRXLDE6u
	nsblAHRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZa4w-00000009bqS-2j9s;
	Wed, 09 Jul 2025 19:03:38 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZWIY-000000095HN-3NfO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 15:01:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oxAaQhXxDDbgbo8Qldxv7uyHxRbxm0HAcyaqNr7ajSeXiOEwn9Qy23Ec6jI4A9JoO8Lpz0Tmy7MaqvxtQ4TrIX14VaA5M8oQVu+iUbOTpeRROv6X10mSZOD9jxxBhrO5HEtV9JuouelOiaFkvdjSlJuPWz8xhXNdyJQUjq8TiJVUPJAzXGF28Bhsa0kjio7/TmyoZJiN3kxcqe2mL7/AcrnbS09g/tF2gZncLIVVbURlS4OHjLrG3vQueZ36KBf4V7UbmIKhJ1EZMPku63ONi+VL6xjekV48uyi/sftaPYhyumQY4CmmvBLsYeSfG7pGGBkFBnIKcUSsj8+kVFthQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lK0XYQ6jvZ0z1I7LMCEQqUJd8PSf3fvdJRjw210vfuo=;
 b=YARnqA4KwbFPSqOZOh9CLGmEcZ/pRYeBhTCszOdSIE+FzXsnrOULtBVaJhTTDqHIg3oj5K8WegFnS4qeg9yLHLXa+6+2z1TKgiWkRm6Sx3hbHkRUiyEqTh83DEyhKOJ8JMy+Zls/OBF5JqwrRGZKJUWQGYAH3SUXFTSO8UxQbmW11GgETR3FumRcoubr7tAONquDIDud9oLMR4IqbekxMmRhj2yQ3DDmu5fd6XVn+Ck+UbDm60cbqmiYC8AvxihZZ9S1ESOJ1sQegpZQrljBWl5mleLZ4sRGGXfN8XtaDqCammREAIQbaoqdeFv65PI7p99eFk+w3AY7guT3+4SXmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lK0XYQ6jvZ0z1I7LMCEQqUJd8PSf3fvdJRjw210vfuo=;
 b=X9dPx7k6ZYk9QswgtFBhKXLgZ70rjwvNPttTtRK02UEE2ftDl21W6CzXgEcAasYIOBCG3Kbk0EooEmp0ZEikjorDq+So4W4V1b5UCqPR7sLMZJctKHZnp5y+ZKLxTEyXeTuEKA8TfSitMAOjcq5L/L7L4KVs2a2oD74ZhwWIsaLOICfBJDAf5x9XemBS+RzjHick93AETf5hCWbZ7xO3Lc8zCVlPLCvRnCaVYM4B2hAr39xP53BLuAXsFuo2IICTg0CjVSH9OwTXMNs0IX++j+SVX/pGBzm6rsgoVaR7OWmqQa/XOR3Z3s/ftreWe4gFKDaKo3hjWbe5PW80By2C/w==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB8577.eurprd04.prod.outlook.com (2603:10a6:20b:424::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.28; Wed, 9 Jul
 2025 15:01:18 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%7]) with mapi id 15.20.8901.024; Wed, 9 Jul 2025
 15:01:18 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>, "Peng Fan (OSS)"
	<peng.fan@oss.nxp.com>
CC: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>, Frank Li <frank.li@nxp.com>, Daniel Baluta
	<daniel.baluta@nxp.com>, Iuliana Prodan <iuliana.prodan@nxp.com>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v3 2/5] remoteproc: imx_rproc: Add support for System
 Manager API
Thread-Topic: [PATCH v3 2/5] remoteproc: imx_rproc: Add support for System
 Manager API
Thread-Index: AQHb5XhqrU2uErlDjUCS0UsOxf6UCbQogN8AgAEUl4CAAFxWAIAABj0g
Date: Wed, 9 Jul 2025 15:01:18 +0000
Message-ID: <PAXPR04MB8459C04A38CAB6A50C11CB198849A@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20250625-imx95-rproc-1-v3-0-699031f5926d@nxp.com>
 <20250625-imx95-rproc-1-v3-2-699031f5926d@nxp.com> <aG1IIk42q8OmGsQH@p14s>
 <20250709090231.GB14535@nxa18884-linux> <aG59nOSfMuFbJvoK@p14s>
In-Reply-To: <aG59nOSfMuFbJvoK@p14s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|AS8PR04MB8577:EE_
x-ms-office365-filtering-correlation-id: 2585af7b-6c46-4d12-37ab-08ddbef9759d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|19092799006|7416014|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?nt118zwGfWfXRICs1z7vlstQi8zZcXQWqBYPXKF+OzIYeEOrAm+EnYG4ELfG?=
 =?us-ascii?Q?m3kZfuFWw6Ppp+J2AbcXcCs7UCvNWUOZ8dq/VniF8H03VT8WVS90kHeBfbhY?=
 =?us-ascii?Q?5op5HHLaLaPlrHZ1+I6oOMw+Dc7ccWMVIL5/ot/Vr+qZ8s/H9zi1azE/7NlJ?=
 =?us-ascii?Q?aqp4+IVXngnj/a+z3jyjfKt/gEiIdfCQlkDWib8L+/EytmX5BTkWRTaA5ifO?=
 =?us-ascii?Q?xTnJyBE52ZbYGyay2xhWUhbGESL9UnH4+Y4ksRRjl5mOZ7iVT60YVAJBR3rL?=
 =?us-ascii?Q?xg4SRLwgfKrr6+/mYg7vC9MTxNdEVmCoPgdtW7B968KLYgc8FSZqYPsUMCa1?=
 =?us-ascii?Q?AT1ISZBOq0hlZwwU3qagyy4MlJJtBe4Dak9YpOZKBOtf/ioUl1emTr/fCrVM?=
 =?us-ascii?Q?y3F29iLd0pcc8JO8+Qjne1C0IIw5MCOZwKMXpFnr0JHh119KB9BV2IahKHBb?=
 =?us-ascii?Q?Sfxw8ijldXcI+763PfbGMG+FSGzG110L0PTM0kBimBIDn2Me5h8395tI4mUq?=
 =?us-ascii?Q?H9LXD4G9NyvqBShYGU0mcglJtvGhKxT5idBKzuFwnKAxvcdO0gsO9EUyCd5F?=
 =?us-ascii?Q?h9k89Z35emzltygFRB0K+CVAj+LEuItfNu1gdc5Ml2oJ3Zu8WWJasxDGqLcN?=
 =?us-ascii?Q?H062symvvrUhdH+/9FUG3HtP6nRZBks2pCdEBDNIFsrK6ZB8dfyx2+pr4dXU?=
 =?us-ascii?Q?924VfXmZsn2QJCBtFgoZ1Vu3Jk3OEAq9CSN9ayg8WqiZkFInUTNhD42vah1u?=
 =?us-ascii?Q?YwfpRddv/npUU5VHTV5gSG6jXtlB++dR0iviQZnE+0y/B97fsaqey36D4/uH?=
 =?us-ascii?Q?KCS7LZbBf+a7nX5an5uqICA0nDOkYFPwCSn4OcQEvYKpspjxOmlVoZ8shls8?=
 =?us-ascii?Q?7H79UEnecZUbAbiR7j8gfXjgmT9cBe3szH6bjLnJjIK95pwKG5PWXOO8yXVU?=
 =?us-ascii?Q?jT6ZB/LwH60ApqYVrtye8RxSOHUhUwFs2gmFhdXLVvySf/uRMut76PIjlA0j?=
 =?us-ascii?Q?/hJqZeeP+WdyQuJXCk8R9OUZYz/Pfea2E3yPxrg4Eg64dlVVL3DCBPpXp7Z+?=
 =?us-ascii?Q?3PmW/R/M3/hLn+A1QtLIpm0H1SZTSI4dj3qKT+BcBbRkKvyBhn4kwBjotCd6?=
 =?us-ascii?Q?Xx3wikt8wKprdH79Lm3+zOTgbIe4A5aaSr7r22K4IglYkRxgTegNhNj52VIk?=
 =?us-ascii?Q?5lvvg86hMQv3TUlSxuza7h0D/P1m8CsBNLANbhb7Om1KB+WDmVMA218+bi0D?=
 =?us-ascii?Q?n1Z/7rwQUYAEo3wOkR2UgjSV0pYUNP+S4/a0XzcYO9+iLt1sfJJz6vGcUOQm?=
 =?us-ascii?Q?CKgiwCRs80cLYoMVJGzx1gINQ3FFVDjWh/Sg8rph04+PZPWcS74reAXJMW8g?=
 =?us-ascii?Q?p2NzZO5gvEgTywejSlHhXuAezqB1VJm2aq2G5AV6l6ZgyP/7Mg10s0uzruzM?=
 =?us-ascii?Q?vmUTBiP0bKLLt7nKrU+RHJn8npOGXjnLctRaCIACwmu/mXnsjMvyjw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?zFfL9kOTVAfxChYH8snHn6qU+qMFpkF+lKqbISTzH2iDnSYOfH2vC4PuShIg?=
 =?us-ascii?Q?1gDcuJdUIt9I0cuBmYHIf+ukrSmCdv8Xj1aQbzUoNcBISQW4JTXtp5xtRNcF?=
 =?us-ascii?Q?ml+04ARlKmpYnSgj6l/LizqbOYknVE6qZ62sVNksrYHPszaDgpL6ZtAstcpW?=
 =?us-ascii?Q?0/8E1xaP7ePeltdVchksMnUWTEt+aC8l6OzppQ72uW0DburgXdJVIKh+uhGA?=
 =?us-ascii?Q?1uBer/MiGmRcEF+dCaVV5MyNSOJ0XOlX/g3yCczWL0zi19IXQ3cjXDSyrK3O?=
 =?us-ascii?Q?LJ8p4r+xqRKtn9e8iJFAUUYFd82TMgbhbDSePiRxg9ldmb3wHUQw/zkzjhPv?=
 =?us-ascii?Q?o3jypim/Utf5DhODMG/z+BtPrHGPRQymJP4f5X0C33TgnKqgbAHrphhp5XgQ?=
 =?us-ascii?Q?gV8+XOIRYzDVfUyfVcZ2Avmtn36btJXN0O9sIjfvUK2+Vb9Ld2QNu19r+QJJ?=
 =?us-ascii?Q?C+mIDHwdsm9G1mX48QetEUFT+KFfY+g1OA8K0+YiOqR4KBHn1qMR6wZgLyHi?=
 =?us-ascii?Q?UoYpC2teYGYFunYB/rfHgEy9tlBbaMPSSHUkBHHqJ2YBNzmIIQQVl8iKlnF3?=
 =?us-ascii?Q?YNJuxdMOJ8Jpx3cp+gVo6Umk8m0lTs0ntnZVySSN1q5MNtzH0UFAh7V+dNBb?=
 =?us-ascii?Q?Zf5z67f/jw5SSU6ogYPzrsyrzTuRaqn0Ri1j0VBmS0M+rHFoUsXEXOthtU+W?=
 =?us-ascii?Q?HGAhGTBOUJ+5l2iZZznxFJ13xtxerVVmcfj+6wjO/zcxsLiIW6lrPrsHA5hq?=
 =?us-ascii?Q?Z1m2c+H2lpREIflLVQiYQaSwY2CYeURtMoX4K+Xm/2RKl8/GIfTzs8lUMcdV?=
 =?us-ascii?Q?wosD6bxI2sCiqGyBioELU4Kvx177BZdUid1LD8dLtl4J/tgBJkVPKBC0hpx0?=
 =?us-ascii?Q?LH1eIXsy/Kzu69OBylqsk8i2/v0KJofXNt4IDlPwfip5Wd7OQZPAGO3muoXT?=
 =?us-ascii?Q?U+ZC+UAE8gAzRbzingnF/BMFklo/xcIcvvjWYTLoYSn4uYntpGQnRrrdMcA4?=
 =?us-ascii?Q?q3ofvftDoNii+hof0xTH1rMWxbFTJlpJc5wuvc8ShL2F9NfNB0GkzWqZaspa?=
 =?us-ascii?Q?/adCAKjIbek9Y1U4Y3VzEy9QBzkrorRaNzRwbhU2C875kkbdNAAAktr3UWQN?=
 =?us-ascii?Q?QDz8nztfDLu+ctEFxM/YkjuBYa+4FD0CtRhLd1fe2mnh8G9KXBbz1SR8MoS0?=
 =?us-ascii?Q?kp2CoVEZCQA/V+mr7jRdP3EGPr2H4PRhvU9jSbbG5hi6uDgAYw/VQuPwmdBy?=
 =?us-ascii?Q?f7IdeMYtG5f0bg7a828DObsGpAiMfYD3ilqpkNG7qHG7Cdjp9vAtWAGG6oGR?=
 =?us-ascii?Q?p+Q9P2VsvTD/9Ut7xLxesNyAPC7yjku11bos0MR6GsO4lpsJWg04IFnqDo+X?=
 =?us-ascii?Q?a/d5U9RBlSPZkCvjNTc0XPSFkInHJdxXabZTAypdwWTCsEAJVhgJLraaBt9B?=
 =?us-ascii?Q?iWLeAhM/YfG7ThM4L+LBnRzmn+a1KmrTcUxSHr7b5Eex1YAkBahq4l9Ix1Ra?=
 =?us-ascii?Q?EMZyeTpJABlitYGq+e6XFOyZ2S96xBuFAz3QAZYiuFJ1Ce3q/6AHdKEUCy8F?=
 =?us-ascii?Q?RnMw5Phcb7OF6gQCGLA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2585af7b-6c46-4d12-37ab-08ddbef9759d
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2025 15:01:18.5558
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /i7BYbfgvgh/1tS0+NLAvio+FPRNCKPT81KgUqLvroDVvFEnE/yE6O2vusIh/kR4cXwwSetp3rtLrT53Y3eiVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8577
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_080126_853463_79AD3D1F 
X-CRM114-Status: GOOD (  19.75  )
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

> Subject: Re: [PATCH v3 2/5] remoteproc: imx_rproc: Add support for
> System Manager API
>=20
...
> > >
> > >This is set all the time imx_rproc_prepare() is called - isn't there
> > >a way to set it once at initialisation time?
> >
> > Yeah. Moving this to probe path should be ok, such as in
> imx_rproc_detect_mode.
> > The drawback is M7 logical machine will be left in powered up state if
> > moving to probe path before user starts M7 LM. Leaving in here
> means
> > M7 logcal machine will be only powered up when user does "echo
> start >
> > /xx/remoteproc-y/state", but needs to set
> IMX_RPROC_FLAGS_SM_LMM_AVAIL
> > flags each time do preparing.
> >
> > If you prefer moving this logic to probe, I could give a try to move
> > to imx_rproc_detect_mode which is probe path.
> >
> > How do you think?
>=20
> Just leave it where it is.

ok. I will just put this piece code in a separate function as you
commented in last reply and leave the function being invoked
in imx_rproc_prepare.

I will send out v4 with above change after test. It should
tomorrow.

Thanks,
Peng.

