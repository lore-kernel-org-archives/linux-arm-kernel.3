Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FFD2109E52B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 02:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AMlEhtWq3IBO8QmqXM9rszXXpQ+UcLWAO//mc0WOoEM=; b=2FdVjbcaECle6ZcEcNyOxYeWIv
	/0SePPS4pdfoK8P5nm4l85zcGfkh7vhsX4Fge1Zu749ZDZMNEguMY0yOFKZLkLjgCsVN1I0ce5nF1
	6MYRjrma0QNjJ1pXCjFzFWVqDshQtL2Gb5w4s4zltF4Dwigd7l3uXhtIVtfKkAf+fmSENVkIV55R9
	MPhq919x5yO764vzRu05IIMvmLch97YwQqE5Q9H0GFG/cuDcvFFv38xTUTEEpsiCKC/fvqUv6FedL
	yAHSd4gTuGsP/GXFZKoqwt2ziHOI46d4s7hQ1hVCSRSsucMySMNK9h60rQSw+5uizDtR/+2czoPjC
	y82oLc1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5arV-00000004bIZ-2op6;
	Thu, 26 Mar 2026 02:54:21 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5arT-00000004bIE-2Bt4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 02:54:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I3cBJ6zEEs4n9jyzTHVfHjFTPPnj0oE7TDfkh6h2iOMVFCcjwePFllZUZArPusN6qLpKIM9mVYe6ZSglUtZS+NeOKG9sTmRi7MrFPydCQh1+tQ0IKLI4YLYMwkoRcCYh0SW/5WijrCkueQbxCPl93THdWe0M+m++FWDsleCDPNmhfIiRGfXM5aKDz9eAvB7LrGsfJqjq7/E86KmmEG8pqen2JB5Iv5HC9frkV6Hp1UatkXh0qLkf81m4CbikKf//lQyxGkJRZ/WvDnsq01YNeIpECq7hyjaDiWc1P/gJxmHtXduoryOOddOpcha3ExQIyKBvfAaKElB2zXKR8R7n2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AMlEhtWq3IBO8QmqXM9rszXXpQ+UcLWAO//mc0WOoEM=;
 b=A+pZL28AXNV6hc/PZKrJoosrxKocpI2BpJtvbNrXkIWmBr6EgNOc8XxwKRrStBKqToTSJBR9ofcEUtJ7i3YLqx34MLeZrPPE2ncnen7lXrRAIsE6IKH6hsDbKku0fmp3Fmqhx8tH2JBYQoyNScjaOlPZxaIMa0RwLeq5yHkp3CAzLJzhaPY1WU9XikFcFF98vVPzkPxW47EaBFFuiPfjOPpXT2mzULr9orVOnQ0BA/rMStRtq63p0TLBrybOmoHaQocw2p7UXG6LlieZ7dZqcI2Uu/qQFL1QBz0HNl6UG8AEPJcHxCRkIGMyaAs/r6DUjxEMM68bPGiK1nGVKYeM7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AMlEhtWq3IBO8QmqXM9rszXXpQ+UcLWAO//mc0WOoEM=;
 b=M/rnnKbxFQOA9klGmI1wCOXAQaSamR0SBnnJtSPenyjh71Sp8p6WYq1NIJYGp6xv20sEKYkFjsFf+UkV5XV5V+8C++5M0HM58dGzR3tOSOAaHragJWWeMXn3sDysFl7wh0Vku95qiT5MSLn3L/M3aHGSMlVEDBBmLzeoeS/i2xvZdgcSK/n18bJwMYafPtd/JEJKYg3PmAK3zgCNIQZJf0C+buI+Xu7p9p8Hx8RaMXLsYx+EH89DXUyoOBQeTbcEPI/YLDRiWuppGHkeCnaWUepnXg60L70fq2Zh6vn+hMA/crsHVjJYf12vJzjSdnKVU5Q0g3Ip8qbM3MHgyBWE5Q==
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::22)
 by AMBPR04MB12614.eurprd04.prod.outlook.com (2603:10a6:20b:778::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 26 Mar
 2026 02:54:14 +0000
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc]) by AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc%5]) with mapi id 15.20.9723.030; Thu, 26 Mar 2026
 02:54:14 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "broonie@kernel.org"
	<broonie@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, Frank Li <frank.li@nxp.com>, "shengjiu.wang@gmail.com"
	<shengjiu.wang@gmail.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com"
	<festevam@gmail.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: Re: [PATCH v2] ASoC: dt-bindings: imx-card: Add dsp_a DAI format
Thread-Topic: Re: [PATCH v2] ASoC: dt-bindings: imx-card: Add dsp_a DAI format
Thread-Index: AQHcvMvU27HyemfnC0iHqCSNhDkt8g==
Date: Thu, 26 Mar 2026 02:54:14 +0000
Message-ID: <AM9PR04MB8353E922E93AFA9F513BEA6FE356A@AM9PR04MB8353.eurprd04.prod.outlook.com>
References: <20260310063522.362545-1-chancel.liu@nxp.com>
 <20260311-brave-acoustic-mongrel-b3978d@quoll>
 <AM9PR04MB83531E00C21A5A2314A38F9AE349A@AM9PR04MB8353.eurprd04.prod.outlook.com>
 <83024a54-74dd-43b0-8c8c-0c23820bb5e0@kernel.org>
In-Reply-To: <83024a54-74dd-43b0-8c8c-0c23820bb5e0@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR04MB8353:EE_|AMBPR04MB12614:EE_
x-ms-office365-filtering-correlation-id: 1d4482b3-9964-4a30-860b-08de8ae2f6d5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|19092799006|366016|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info: VHtbZ7KlYHvuAWAsvA4BmIqS9z5js+yk6GAwrGKwEauLAvN1tUMYnzTdMQ86I2Bj9Rda+mJjsnbpKwVnFkk6sJuuRxFxnCAI7DnLi+uRM2rafIrpnGuuh+QN5wwGiLiH6PEW1Pz3VP9SKkhM05Qx8vX31SXtvfuH2K0Dg9XKEwf4f1K68wzBXj7+Tj/atwjs7IHc5Kp5uKNfxn5MHgkqnpnjfE9VMP2nhX4Q9UdkVBPSg8naNzkiUj+2edPWue/SH+WXMJsQRCZ5uQ6lYALnK5HSd4ro8EceYqtuw1LpqPHcQMxySGXJUcRKTZ6+mdZjrUWDc16/CEGMkdDh8kP/guEEwooJwJeXemTXvdb/VjpCdWa+MjBkygXMnhNfapLLwWZEb1ZcR5ZkcWccwKIrAyPkrT4wqG4erBR8edo+tBArI9w3PFuCZGK2yCPWkd5tYlmwuC9+unofPGvKWIU8BgJQ0eFmHZoY7wxinbWpIFerC8ZwGV3PEPj0Ox5WClT2qcDHa5cQYOglro5OmqLRnilC5LT7chVEJP72Z2Fn4+9mmxEB/P+u/ycHPN9NrGgXx7OcdYMtAEwZdCG3cxKoX5dPvKVIYc2g7xi+09MfjLhgTTebaZQrYNIRRelZnI/bpwzodlUKf6BZ3UxpF7+X6H/Tb583bKMeBnlmsEO3dn1b7UzhnZ11GkSiss8NbxWvdNF4EcclH5ShMNjXSLrtAlDS4PgtB1NDZhXhCwTXKTHDE0kRyGAYraM15yI7V+WZURYOXkTuyw2qCcLTQEP2AIgXLzYSY8QNC161c1MPclM=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8353.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(19092799006)(366016)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?TBq2gVHSlL8pzMlvk5oPLMvrFZxCVQ87uPwLUJ6q043fw1/LHuzZymNNPWV3?=
 =?us-ascii?Q?i0u4i8Vp3VN2PPskRT1L1FW8hHQygjwimWcUzlkm+bLPGQvO3IePVxFuYQra?=
 =?us-ascii?Q?bBaIfqhZOJ+sorCG7Ba373bNWbifksTVu/EmndCW78L4vSy1/0sAFiL40FsM?=
 =?us-ascii?Q?ZHAdbS2MHCTGxQiGlX6WbqlgomOERTSDr25M1Zp2Ifs920lFnabfK4ifhWo6?=
 =?us-ascii?Q?u3qZTUq+dQKRhWQdVdILC+4FIkt8rwW5JaPGbYlblB7u/N7Nz9AsR+iOmMCn?=
 =?us-ascii?Q?R1TIMn6XsrrwKnBUbOU7RV6tf82Wba9Nd1N5TTt4EPaHH/LKIsMtJQRpASJw?=
 =?us-ascii?Q?UuvRQikqwn3jtvqNSuahd3Yq9HXjrBfSU/tNg4WsIVGARbDXsw51AYRqGmHO?=
 =?us-ascii?Q?IvsfJTwWcJWsmvjmBNDmKw+LXiz4gA0wKQX9RrrhXAJn4XYoM2eYGA8099YS?=
 =?us-ascii?Q?xsBpgF5YTfzcVleKTtZ1TNqch9bUAYAJ7+VnGnVWqgt+03FnerHU37+kS+oK?=
 =?us-ascii?Q?DDKlBUgbZR7NSNcZvgDS7/uBIeHopGgl2hK+G02P5bGbdKMHGBNFL86sEAbr?=
 =?us-ascii?Q?0pzK260b6/irB23yU65tbDikdMm7PwexHaLm/vLBuGVexYu4Qbqllc5czPCB?=
 =?us-ascii?Q?glNxaRWhRa+1YPZ5YHTB4s/kCDKhggzBuQMK7eNwxEWH8g3tnvUzskAarzt9?=
 =?us-ascii?Q?z44V8s953TONE9wZC8+mJRzYXxdIMBb03xpWYtWxOz6n6WYdhSyen2VYGGcj?=
 =?us-ascii?Q?rQuQDYa+9naK2Aj3EE2wCtb4cAOinHliGLtPKPnFStz7aderBt1AZyRToE9O?=
 =?us-ascii?Q?uPsbQJwnS9bKAYvRXDMLpE2hjKbJ/Pfj+hlKH+HbPLOPv8WkuqajwnAkoTz0?=
 =?us-ascii?Q?TadgbOFTcOyMGJ2HlFMTc/S5JCSuVNQ5um7OKKWH5JVE1YY2jT8jE6Uns3nK?=
 =?us-ascii?Q?BcOhTKQMfgOaFsYEcz8g+AzoDAYBH/mPzCqP6t4Tk9goN2EGxvgoP1tqXRcZ?=
 =?us-ascii?Q?E4SJ1wwBgAkLLqKCCIqpQtspZ4jMe/JslpSqwBoH1LflGxfQPxvTwI15f4g7?=
 =?us-ascii?Q?5fp80CYekhiIXsGoLV06lt6KeD5XLcpbKlpHs6jUV8tBCb2FaHDFBqvebs7z?=
 =?us-ascii?Q?Q7ZwchWHdRwzhDtKj1OTEYS/W1mLKZxjZ6bZpn+T7em82G/kjBWoKXbxfVnn?=
 =?us-ascii?Q?P61uWnBQKeiwMeSmlANcVy+xQo8qVoPcaCwReqjSlS9zcnuf5jKTwbIwcGVF?=
 =?us-ascii?Q?7rIE9wTKuwMIWSL4d8hrqXtIG9ZccSj8qIv98KaMtlzAMQgaOo+7HbxN3Gqd?=
 =?us-ascii?Q?9VeNIoiVdQv4i1LyQgiAdExosqxgG/ohIQLr4rObXCu9FG6y499eYUMD40iV?=
 =?us-ascii?Q?hymJGeY4H7KxfeJ14EBrS1HyT9HWMLxwdYoZFHzLOXwFAKgvx/iEz5q1bnY5?=
 =?us-ascii?Q?6BeZ/1qgkySVFjqEOtSXF/h8mTJEdHEuJVRAaSX2C0EzjokOjEcKAX5lWMhm?=
 =?us-ascii?Q?5/JyGJ4dCzFXriwvXPv4joy7y8dBsO6gwB8JeWU6G51z7qYBXlU9Eqq5GrJn?=
 =?us-ascii?Q?eHDa2df6eiX0CBLyL7VDOJzkHMVvqQVtKORPQmt/bQsDJlEqvrrlNLDFrucD?=
 =?us-ascii?Q?tv4mCq5dWMYi9LFZPtzLAODZnP4vecZ0K62c/pLFK1tQbRgXubrFbWPndZ5q?=
 =?us-ascii?Q?3rDYywAUFXN0/LYxBmPcr/hjmSiBrNaUspBsY6v5zy9yDK19?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8353.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d4482b3-9964-4a30-860b-08de8ae2f6d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2026 02:54:14.1355
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EZDlQEnEWc1R0GHDAH3Kaqs+x/5JgxLGIw70/OzFUmH/q7fqzcYYDppHxEssVx0MUbi0gG1x50XGDTq2uip/LA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB12614
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_195419_585551_96807EDD 
X-CRM114-Status: GOOD (  14.86  )
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

> >>> The imx-card machine driver originally supported only codecs
> >>> operating in i2s or dsp_b formats. This machine driver can support
> >>> CS42448 codec and this codec typically uses dsp_a for its TDM
> >>> interface. Therefore,
> >>
> >> And what about other formats, which was asked last time?
> >>
> >
> > The imx-card machine driver currently implements support only for
> > codecs with i2s and dsp_b format. The newly added CS42448 codec
> > requires dsp_a and that is why this patch adds dsp_a only. No other
> > formats are used or supported by the existing hardware covered by this
>=20
> First sentence says about driver, here you speak about hardware, so feels=
 like
> you are mixing these.
>=20
> Best regards,
> Krzysztof

You're right, I should not mention the driver. What I meant is that the
existing i.MX audio sound card described by this binding use codecs
that operate in i2s or dsp_b formats.

Regards,=20
Chancel Liu

