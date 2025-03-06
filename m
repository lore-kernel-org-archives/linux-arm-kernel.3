Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FE87C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 05:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rpm3XEaNYNc0ZRfUdrAHpYfszDGjUwJNbYrQYSvQWz0=; b=ymUfBxomlwfFMfQigokpSr0pUU
	XCaCouAjTteRf8zpHUcbRzAEn28JEWaxkZEvzEMW4+0xfECiO3wrssy/Z2Adwe9YYCB4MbqZruzoo
	3tkLFTWLSsdy2YQeqA1uXdnG8MFyrV9MuMREohluH2mVI2Ynr7bP18hcE1SfM0uZEQG16+iYmuSU6
	u65zzjkjxNXrs5o/WxOJyupDh+HFnQ7xItboAQXlIS7BjL7qrKBkeUYGZ4oOmSDJzWPiqeiRpnDZf
	1L3Y3C2tokXv5HVsBGGs2nnwO9h1CZGxoiCbAyf2yERx2zi4VqKf5iDZo2bwMY6BNeiN5BI5nHhiv
	JCcLASnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq3qn-0000000A3A4-0iLa;
	Thu, 06 Mar 2025 05:32:53 +0000
Received: from mail-am6eur05on20618.outbound.protection.outlook.com ([2a01:111:f403:2612::618] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq3pC-0000000A2yY-0Mng
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 05:31:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OBw0oZfBd95/VjJRBBQudT4CVIYMTSY3qYpZbuhwFw02/y4Jao7x6Jbhjl9gaOf8KBFZNj62d+72h+gv/jaf0lFHutGcXIDICYXCnOo8ippdWA9/BCCG3SbuOjs/bhe1w2Jq8oT6G9lC4A2CrYGo5GoEEG1sthaTBCCNlnhk/buGEMCDfaQsUQlnZ2L0F739uytFJVfrkifj2IsOn3L7X8LGRdGJJWx9sLLRX1uqBvTaoUuEy6mmUOW6buoA5+lbvBUTBpACGNssM3EAnilzzDb3JJxeOixH676sTeUFJ1KLwUfrM6fxGpTm2W5ysVIF9SKSIHh4CcrQnX4oapnGng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rpm3XEaNYNc0ZRfUdrAHpYfszDGjUwJNbYrQYSvQWz0=;
 b=SG/7iFETuf78Recv8ceaHGpUdAa6x9aLsGyTTnUaspeH2HvMwpMlx7UQiVr6iBL0D0dMJOo4DzVs/gWN4mZflFXXHoE43Zhv8a+Z86l5gJ5UxnWx4ZTcL+yggX9EiXn3bgvn6NrKadv/qlRIYHfCakLR2RcGyjICi24XE22mZZY82BmXOiHkHohTIbZE3PgmNgTHloh6k0XU2EUBgUYIxj2i7f2cqkaAhnX26+BWii1PJxw2kVL2fEK6U5nLEQIkjRbh3qUIKl1WjqHNNfw+bbXBg8I5WhG+dlxZyJJJpJyqcAGC1GovFdywKTYUkTs3u900Mpp+QO+J+OTc74PIUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rpm3XEaNYNc0ZRfUdrAHpYfszDGjUwJNbYrQYSvQWz0=;
 b=VkVFoykKH5F+f2TF//bXd8QwPkXlD+Zdy0Cy6foqSF5/j+a1xgq+/HP+3nbZSP03ds7HUt+rAAFeEY/3SAUFW3qOIyYrpEPhb9rtM8EZLOi1Dxzg7FD7BcLduH44fciI71TtkQ73Sndz38cd9CJSkP1iCteCkhDZJGyRhUzvEyzOxyqYhzTp4rZU6LLZRf4YDe+agWHQoGGP/8us0cXv4Xk71E06JhH+RBNZ51zfUjJa3XqNQ6s0PEdKAfCvLQdsha5eRmJ4qY22MG8ToESn4+Xq+X759jfDoqFYoyZxRJFls5LTwCavloknGD5bHOSuMtWWXqEeZivMEfMIgFSZMw==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM8PR04MB7987.eurprd04.prod.outlook.com (2603:10a6:20b:24d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.18; Thu, 6 Mar
 2025 05:31:05 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 05:31:05 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Daniel Baluta <daniel.baluta@nxp.com>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "shawnguo@kernel.org"
	<shawnguo@kernel.org>, "mathieu.poirier@linaro.org"
	<mathieu.poirier@linaro.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>
CC: "conor+dt@kernel.org" <conor+dt@kernel.org>, "s.hauer@pengutronix.de"
	<s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "andersson@kernel.org"
	<andersson@kernel.org>, Frank Li <frank.li@nxp.com>, Laurentiu Mihalcea
	<laurentiu.mihalcea@nxp.com>, Iuliana Prodan <iuliana.prodan@nxp.com>, "S.J.
 Wang" <shengjiu.wang@nxp.com>
Subject: RE: [PATCH v4 3/8] arm64: dts: imx8mp: Use resets property
Thread-Topic: [PATCH v4 3/8] arm64: dts: imx8mp: Use resets property
Thread-Index: AQHbjbWD9mrulr1ca02wLLmnQLzqEbNllmPg
Date: Thu, 6 Mar 2025 05:31:04 +0000
Message-ID: <PAXPR04MB845952FE7669DE5B363C906E88CA2@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20250305100037.373782-1-daniel.baluta@nxp.com>
 <20250305100037.373782-4-daniel.baluta@nxp.com>
In-Reply-To: <20250305100037.373782-4-daniel.baluta@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|AM8PR04MB7987:EE_
x-ms-office365-filtering-correlation-id: 282f4d36-bea3-4d4c-fc84-08dd5c701717
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?y0O8YgDzPZozELh24AL7wox2V3acmxWH+U5LH4MAUaySI9M8JiQEmyY6Zab7?=
 =?us-ascii?Q?NpRBt/RZvf5lZNtGQDNFJPeIbg8KjyQxamdE50dL2vFilGtFCcGhHe3q6/x6?=
 =?us-ascii?Q?X5e2xc9PJ2EanTI9bvdnTSAVFCDMyN6gBNCPXodx61OLV8F9ENXLnvlu7vTk?=
 =?us-ascii?Q?abnynFTY1d9pGoRT14RR+79RmWUbrOHIBhsPkjpI9lg6P+WiFwsQtclFtoVC?=
 =?us-ascii?Q?maansZ/v25DFDIBgjvu2IGWhU92Zxhfh4WKKCQ7GVyd3DbYSYXGFrcYa/96j?=
 =?us-ascii?Q?A2tRHv7ZpcNeoXlGoxj1sEUjl2wk+D0cAlC44JnQ199lTLM0yOLTPcT1EZnw?=
 =?us-ascii?Q?HxaKH9y/fGe7i+YYLceipUqHZ3PdEgVG12UBM8VRmSVb/bcTBMfrKZ2rALZ2?=
 =?us-ascii?Q?6gYZcoSr5YmgUEGL7JXFkqaZXK1vJH816hC0/RzgTKVB5LTJycu1qnTBHGaC?=
 =?us-ascii?Q?De0py+9Zs7vQTvxoW+AdW1m25a+bbvfRmpDEubbFkW1XfYY36J/k6X8Qxp/I?=
 =?us-ascii?Q?AmvA0En5sgsOkWQtdENSq7CrUq2Qnc4mskC8r0r9fiudO9hM+BOn67dJ/0MJ?=
 =?us-ascii?Q?zHOAtCaQ+4pxCNZvMkx2YezSnv1qCFOYk8+izMVD85KV1ai2vMAcJHOFjvwB?=
 =?us-ascii?Q?bTMfckrypSx6qav0wW8LHLKLeJ063czCg0gHbvCXvSN2S9+uXUrNBLTJL8cn?=
 =?us-ascii?Q?219eDYe//NqJtwK9W8CqVco9cyF5uYFwjCkOkTIP5aasPqgwwfJ+bB5QfYLE?=
 =?us-ascii?Q?DdGVAf6MNqKEkybCCj9RI7s22XBRi3hs0WJHfvU1rmCOjGlLGltlgjEXue5V?=
 =?us-ascii?Q?OOYqH1A+/8eggfci3wT1v32HGixApi9VgsrHAuM8khMRMZ8ra/ZEJLrb1X/H?=
 =?us-ascii?Q?Pc0phR508Q0IUZ+8RFMCTpGcAh+WgLybD1MdycZ0wWExk+T3nm4U7KD4OM/a?=
 =?us-ascii?Q?WAf1CsQkZFXw/cZE4pOrTjFsj8434wmIvZyQeN4snVM18188k/ZmZsK5RkTm?=
 =?us-ascii?Q?Lj6nwfxm2trCnzQGYRV6ukxOI4u/HGLMJ0QRMiZd0kCQ9RCYcHJrxwtc+Yay?=
 =?us-ascii?Q?jmA82DAJbBxrtPvl2FX1ITZFOl/OlQsHmJYYhdnamhJlFs1bL5GEFlm8zGtx?=
 =?us-ascii?Q?Mf3hqEgXvzeUkojUnUFDmU+xDDyY0HQM01cjgHEZsHvI/l4T/O57ugOo01Nk?=
 =?us-ascii?Q?Z9bUUPOXJVrP3dQv0idoWr34xF3l+pGBD1xwCygcpmiXGAGdS6FQ+Sfvglr4?=
 =?us-ascii?Q?4IoAPBInUVuGGNqpbaCROY7WNJoRL/BTNfyVNuEhCA5G+TIU9ElyVmdAFdwk?=
 =?us-ascii?Q?vWXX+L3SrjnqfmjcDqZH5Hut+43jFjsDN00Umd9UB88h8ss++HK2b+RoEtOU?=
 =?us-ascii?Q?2pibOGebzwHZChGf5jG/isxWxu0Lm02RFvd5ONOvR2Ay8lqUPO5E3XzduW4K?=
 =?us-ascii?Q?YdQb/XwtI87RzCAtIBqSw7fumErdF8Sf?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?oU/HFJakF4DOnwt2B7m8AQQM676lNZo1EGjpA1wBXcoZgLHkZwShIvAoW88H?=
 =?us-ascii?Q?eyHW4WLLJS/t7fQq/2V1gEk0SoYC9zwLby+TKvapFPvwztZuBBuprug1eO+C?=
 =?us-ascii?Q?k04U8DcHTKEeBjhwsUGPrkJI9sPy+iYgKVmkABBDjCx6kdnp8l4D9W6fsqAl?=
 =?us-ascii?Q?0hj9DWzKHWayWcVBbaSwmd/XFa3GOg0WeMnV0/dIZDbtSsGfl83bFZt3atNU?=
 =?us-ascii?Q?CZD4mWYTYljdSbemzqyRtrObLZ5vsp1XxOdhDIRlXmPwa0VNJzwXqpDjJabV?=
 =?us-ascii?Q?QtqTuGHOJVQxQKcPGI8jtZM7MPbK3w/hrlbes0cLBFDhnf0U9gwtTh7o+97u?=
 =?us-ascii?Q?+jd6WmCeozWRKRCjuIN9DdgYnnBRIFqp1xHpds7hlqLTeOyUqTCquviMpBLA?=
 =?us-ascii?Q?xqyxT3PumDJYbZbkNq8kTuvKFrA+c3voy4X8cLHuL5SAZfWh7cLxHSqNEi/D?=
 =?us-ascii?Q?ALI46Gdu6r9tJ4XfThMGyckoVQ5Vy2vCCMMUU/88JRJto9lWGHpS8B1WQx24?=
 =?us-ascii?Q?/eS008uCQNebs+DshcWXF2LDKT/1Reta6tZ4ZKvN0bHcDYMkWWhcIm52vOG7?=
 =?us-ascii?Q?mD0zYGigd37UTBq9ogY+jPNpp6WvOPpzHA21lt5uql1zMCAPKhvYQUBH2/ja?=
 =?us-ascii?Q?g8zEv8cg7v3Bnsvdxg7QTWJMGjFV01j2foWsHpjI258mSdQh5ZzqaulS3M18?=
 =?us-ascii?Q?du/S5ueek/hdkyiX9uRgyc/XjtOJrXHU5ZgII4+aLvKZ7vrl8UT/fiCUh1wI?=
 =?us-ascii?Q?PoeCK1v1+GoNFl+lVwjOKqR/Orsp1uzxJfUJ1fsd16JgYT5yTqUnlnndoGEF?=
 =?us-ascii?Q?8H4dsaweUk+Evv79Nl9ZlhUgdlIMHlsA5/VdzIQ8rLn104swNpkFdLmVd2U7?=
 =?us-ascii?Q?dGeEjbGcuCbDMHknMA48+xtKrp03+Oj4XbjZ1Ht0pZLffl2M61YpdXAReFwh?=
 =?us-ascii?Q?z9xtF6WVAHP69tkuEELiafPv4t7RshEE9/wfiZFG5xqPSM8sBHz65POahxhM?=
 =?us-ascii?Q?rzSyTt5qbrxmWt/awOMNI+4sbFguuaGYmoOYZUlno06C/1duI34uZ8PkhXGT?=
 =?us-ascii?Q?o42KvTU2lxrHbFVAoP5XaYhVqK68cdcic8qiCw/s7hmUhZ6yITpC89bL3FnT?=
 =?us-ascii?Q?S2ednkCR74jMm35zgKjMPvIbAkZAo40k4s9YI1NmiXURh8I7gNHWSzf7Jd+Y?=
 =?us-ascii?Q?UihLT+Y6nBIwOOPWSEEWKbjU1YCml9bjOFP8tXv+c4gouiR8S58Dtc4+4VuP?=
 =?us-ascii?Q?kX9TN6EzSgzyHyVrwBA1R19xG1KVSIUJ3MfR6ZEkH8vgTzGKBnYg/qSv4Sjj?=
 =?us-ascii?Q?KudAqOEwA9RKzpe1lcgp+6klTOncUVEc35dmArU6ObokGCnaf6NpoidmpTHt?=
 =?us-ascii?Q?ofs215WDY88ybFIzPMmRqJYfHJ8Fm86YDs9bygU4pmDFY31k9LWXOLjYv4aN?=
 =?us-ascii?Q?XpX1UgG9VdXEptc9D7ScTHnVm+yivQtVb5Ph2bwHLYNkVwozYj4PpsOc7Uk4?=
 =?us-ascii?Q?22rh2mq08pcZjs0HIJpmD8Ai67EIlDddCccNZ5UmGcgrBtnguwQ5Mg8Dgo87?=
 =?us-ascii?Q?OQ2CPeYAhOw6xVlMi3c=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 282f4d36-bea3-4d4c-fc84-08dd5c701717
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2025 05:31:04.9526
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JFseEsGuaJp2iGYIJaFO56gI4Vtesc7TdSlld3x6b8UYQy3UqmeSYjA856rWzq8FiOum96yE5sFHk38twTWidQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7987
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_213114_211885_8359AA97 
X-CRM114-Status: UNSURE (   8.06  )
X-CRM114-Notice: Please train this message.
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

> Subject: [PATCH v4 3/8] arm64: dts: imx8mp: Use resets property
>=20
> Add resets property to dsp node in order to be able to control the dsp
> run/stall bit from audio block control.
>=20
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
Reviewed-by: Peng Fan <peng.fan@nxp.com>

