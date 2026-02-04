Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F1FCE8B389
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 02:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LAh+LrZEqUk9uPEy7BUYqchWISraCRJvEOPkWBbugWM=; b=DAGMQhAAZoJFIlGIySrwc3Ahki
	u/JDgNCOiOUob70/T/6BqWGnk2YDFIbbkYoP5Ijk4I2I6i/Wj8CniuTkkD1/SBQgAv5sRSHvYzArl
	gKAn+UXqnmz2bCGLl3/sTuVEw1mAy/qcjza9E/4SFr9Mjc7FsSFTdBuzQW4xioCiprJmC5k9Al+k9
	GkOLena7py5WsHINz0fI/kzqJ0nmOHgsVYd0WSfdJ4OZWeMDdlCbWATyHGa/RTP0Fp0MdDL9Hsnxq
	lwgzgdqGibGGx4ItVIHj68QZP6WnMzSyBSpwcnX/wcmBN7c0695ULWlLhTuHHSXAi/Efk2DxDO6kV
	kQX9BHYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnSC9-00000007jkw-11Yc;
	Wed, 04 Feb 2026 02:00:41 +0000
Received: from mail-northeuropeazon11012012.outbound.protection.outlook.com ([52.101.66.12] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnSC6-00000007jjy-3A5Q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 02:00:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=buE9JXdOl+ZK7xpU5vQN0ykmyV04M2D+V9liO6X41zRaOBlsxumR7zHn2Zb3t8hzPdMkeNAfTd0FqUchbz6sJ1+er03M5qW1opU2+x0myiRDryGkNEP8+YUsHSw0vDz9oA2ugel9j/5awSXOT2Tyq1SWG39Cn/SFrT2pbWL/Ai8dUMvUNn3AfOhJ8r/Xm6k1uLBe65g/ZtIS5Vo2kkwbcfbHV/iUIqki+3AT7yudN9JfHocsifapE0H/Wzr/Ux0ZXF4bAByGo8R4IrcmRHwSocYZ4+v09euI9AbOB9Cjdg0ZQWeXMzFVzYDAXNckprwHA1mM0gi5BVpSQrRHEaRJxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LAh+LrZEqUk9uPEy7BUYqchWISraCRJvEOPkWBbugWM=;
 b=AjAPsZFx3qaABxhsZrZbnYbFG7lCGjeUgBGDYJcrLJvYgIpqe3kTNBZjMRNRmtAwDaXuna3vzMPY8X3BKkV5ZCcjFrvVgGewHbOS4/A4RnTlj5FIeF/cTWhAp+j2Einy5/EM8hSTzMLh5vU+B+gIvPi7ojlPu/x+1cSt4YbZUNWjA3x1qswNCp6TQrdUiEk/2uVXjC89HiUtkmxUdpafHGMQAs6JhVOHzbk8iDMNzYQsBeGoY5j9d2h2nIFA2dV24qQg0T/4OogZvBg3GZSRRx16kQBqSnb5nRFih0UNeaonRcI1U8uJ5sbuxfGLQA+9TiXlZmNEtV4vsEpNi+7f6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LAh+LrZEqUk9uPEy7BUYqchWISraCRJvEOPkWBbugWM=;
 b=dIJrkLnHtcbTRyjPXfD7ALRjfmIDJVkFcGHye93f+0/tYZGIKRQ+AOcgLMLiF5q3yaDwt3pix9MXncVBz7Pwj8GOBqn3JdF1B6u60AEvZmBhgNuqQwABw2lsoAx8hBGI7dleLLF7vPyVtAkmvuJCv+8t2RWoVWQGOC1vW8+OcxeMFkNClZ7GqMBBWCQ6WmMLd/z9HP5Sv9AfrnunijwGwRFQVBoWiDed4Hc+y3wZfZ4x+witinKBYOgBgEqr+P/y4KTON1ZjwuHPLUPJryKzwGixHKhA2Jq91vsWNFXctppySAC+csL6MIObjJWoIGfooWUKhRrFd+bG6phvgvMxMA==
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by AS8PR04MB8101.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f6::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 02:00:34 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%5]) with mapi id 15.20.9587.010; Wed, 4 Feb 2026
 02:00:34 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: Frank Li <frank.li@nxp.com>
CC: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "festevam@gmail.com"
	<festevam@gmail.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, Daniel
 Baluta <daniel.baluta@nxp.com>, "dario.binacchi@amarulasolutions.com"
	<dario.binacchi@amarulasolutions.com>, "alexander.stein@ew.tq-group.com"
	<alexander.stein@ew.tq-group.com>, "Markus.Niebel@tq-group.com"
	<Markus.Niebel@tq-group.com>, "matthias.schiffer@tq-group.com"
	<matthias.schiffer@tq-group.com>, "y.moog@phytec.de" <y.moog@phytec.de>,
	"josua@solid-run.com" <josua@solid-run.com>, Francesco Dolcini
	<francesco.dolcini@toradex.com>, "primoz.fiser@norik.com"
	<primoz.fiser@norik.com>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH V5 3/5] arm64: dts: imx93: Move 11x11 EVK specific parts
 back to imx93-11x11-evk.dts
Thread-Topic: [PATCH V5 3/5] arm64: dts: imx93: Move 11x11 EVK specific parts
 back to imx93-11x11-evk.dts
Thread-Index: AQHclOM5AqtJOFz1NUqfAAC+UtoE/LVxNTwAgACU7zA=
Date: Wed, 4 Feb 2026 02:00:34 +0000
Message-ID: <VI0PR04MB12114075B2F1E223F2BD596139298A@VI0PR04MB12114.eurprd04.prod.outlook.com>
References: <20260203080137.1492376-1-sherry.sun@nxp.com>
 <20260203080137.1492376-4-sherry.sun@nxp.com>
 <aYIrMqZ5yBfmy2AZ@lizhi-Precision-Tower-5810>
In-Reply-To: <aYIrMqZ5yBfmy2AZ@lizhi-Precision-Tower-5810>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI0PR04MB12114:EE_|AS8PR04MB8101:EE_
x-ms-office365-filtering-correlation-id: 79271f46-769a-4c71-d3cb-08de63912f08
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|19092799006|366016|7416014|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?5U4xEcRVU/ktPSONMCumdieAOv4rDsh5z+VCMQn+0Z9Vg9JDlCpEOpfnL8EM?=
 =?us-ascii?Q?KIWh21yHbiwbMhU/ZlA5vxgstGW2qYHJTyhcenojfg0CgFmFxU94CRF/PRk5?=
 =?us-ascii?Q?foRGfPHpkfa9WX6NuKemsh+0RMyJUF4wyOtRB51Ezs9GGQaaIOjw5mVJNASP?=
 =?us-ascii?Q?NFiwfvTd1vslwOUs/7QNSq7C3xN3lQRT9Ce31g6IOtJyYSTasLgRDMpxj11o?=
 =?us-ascii?Q?k/fBHFE0GQgEEw110vUs++T+iCbxLK7eOEn2eLtAkp4tFdEnMnNtHheo07o7?=
 =?us-ascii?Q?GfZxBWAR1vDfzBXfNceLwGx23Y/82Ju+GvlJOhVGGvzDGuSRH4AYBzezGoO1?=
 =?us-ascii?Q?lD18nVCAVSyOoriyYexVjH8HMwYREVs0KQuniaN5S+7TmVDRnQNTV/ia4YxQ?=
 =?us-ascii?Q?P8h1dxZE6wvJiQ5klipDv8uVNdiU4eFzF1dJrCg48mUP/a3AV/BqdNV/vL5p?=
 =?us-ascii?Q?+D6IEJ96U1OswOQ3afJndV4WF37tPe+16LtZEsUDN1cDkKQA99lilXaH5k79?=
 =?us-ascii?Q?G7YZnu74W0THThxv6eIJS+zqRvGe5voMX5uyYiQghBc7JJl/gGQ+fSN+F6QK?=
 =?us-ascii?Q?vl0G6NEwhktNvL37A/zPwAAb9tVwcoxuxaGaH7djQMBn0VYz2WPaUdb0H6ie?=
 =?us-ascii?Q?iQwzobvdfJejiAef2x4I1sTNq5qkL2kMGAjSl79sgqAYTFW1HL6yK97DDvUy?=
 =?us-ascii?Q?evozVjk9EoijjNxSFIBYuo7j1M7E6rPyFMQDF6LegXklyuG5rdVgUPEGFQRl?=
 =?us-ascii?Q?MO5wWu3jvDqOUiQ6dzI61nRz9Axd20WeBDLucq2u1lo9CjDweeqj/0XgfEIA?=
 =?us-ascii?Q?+m8+6MgXEntCuD1Vy4eh37o6AM6gcMo/bWOHvsprjBmqnRPELP0TUVN0gg6f?=
 =?us-ascii?Q?0wu93BhbiYihkog4qI1xtIoMi7vWmvs5hmhAaq4zaxql77c5+NG26H0fluyl?=
 =?us-ascii?Q?PYOU+8O4vyK+DHBQC4NeWA5Qp/2Vj4Rv4z8pHwNXf3UELE71z1FYLC5MebhH?=
 =?us-ascii?Q?BNNRp5iXTiBDFNPOVVIvPrDBsnEd8kGrsjWkk9mTkM2stmcxIunLdGihghdS?=
 =?us-ascii?Q?2g/M/MzqsUfOUz+Qc4N6aQRhBemw7DwTrnYdp6mVy7f1KZhuwWwnqOKvMBgi?=
 =?us-ascii?Q?/i9/fv6yA5rNzbwt8EymSHvUchW7pjvFbZ4dXqveUGMEcoY6axFme1cjweh1?=
 =?us-ascii?Q?dZC05Vt9SUcB0o/R7NwJDKMP5F5Nv9Fq8RP1Fyt/S46HbXui4s0d+6cnGm6B?=
 =?us-ascii?Q?9Sqlq6DLy1pl/+iodCmdmTdRDxkB+JzQsHw1wv3MUl45lHi2B7jzDb77Cbpi?=
 =?us-ascii?Q?jp8nYZfQsjZ3V5tOVL095nNSltlm0qqoIZlVuleyf/vmfYiSIikLSkJhc3/y?=
 =?us-ascii?Q?42mO0WbWFcOftxIzyp82h4XQDsHoy2txKyzPcA5q9K9DL9gyESDoWbq6u8zF?=
 =?us-ascii?Q?PsTuLGl4hE3wrhSyF3hUHZLWAkIRKr86konMMbtmh2hbzTqhe1z+rWKXmvu4?=
 =?us-ascii?Q?xcAsamrqnLsdVI+C5NNFqO9dwO6Eml3r76z5sGPWbSRJI6ruXMLsNvnCO3Te?=
 =?us-ascii?Q?j8w5UWMwFww3Z/KWRsWRxzA3DHwg+voqwHZAXxA974/Yx3S2Ovn74o85o0w4?=
 =?us-ascii?Q?nDhPH6ranITQfSOUmVpOuSg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(7416014)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?SuKjKtFspczVm41M9IkWmzjYdGNSn2S9Tolrs7ycisCPtP7uzbOUz1yxSQwS?=
 =?us-ascii?Q?t3vHN7xeMmvgCVNl6VGw2sjLEHVSTi3mvjK/p+DHN+uGU6WYD1ViydJptCh+?=
 =?us-ascii?Q?jDxALxEIamLnm3gzLkxJILEVgTkV/PmaESLpgXFjsT2ZUuuGkpmehUo9Ku+h?=
 =?us-ascii?Q?2kZQ2cmX0eCqamKuoWh59IMVbEKrtb7CyKkUB5wCSkNEdJ2DUyIJ9DqCjZ9d?=
 =?us-ascii?Q?/+pC0xaqg+WnAU+y71b5r8PKkxnT826knk8mdY3qx2VWK6aFw+ODbbR7elP6?=
 =?us-ascii?Q?fZLso7yY0FensiQtK8b5Xu7R9skVX7MAQ3cQ4NWkImpeRxUzulmcp2fc2+pT?=
 =?us-ascii?Q?PHFEyoMnGjVg4R+QcMGFbr54gsF31swcMcvOcJpuAGHgcxFHjHQUgCi2DrW/?=
 =?us-ascii?Q?l4ppIk9sLuyzoOHuwKQIbXqm4IvFlJqFYB1FDBN28rqyV4CgNOyVw+Q5Reoz?=
 =?us-ascii?Q?8uHJLxCx1Incha1VMnnJ3uSRVkwQixVq8AM6r/8R0/vbC61WkUba/SCSQxYc?=
 =?us-ascii?Q?cErbAqVnq2d85ptT9IUEfIdWUOJ1hwpWafp/SSBGaavbKQA1IlDH1MGGgG82?=
 =?us-ascii?Q?tu5V4Q++y9E3u+IQCKXJw14D6v8A2tlnVNi74ofwIBA17A01bwS1XSZsB4UP?=
 =?us-ascii?Q?NRaOSXCuj4X+xsAwMnwVKOWdchHOYcXOQYswad8X38+g+c1VswRW/QC4d8Q+?=
 =?us-ascii?Q?G6XatJtUwHng2DAgXIU1EaGwr2cR/c/BKxP6PHzue+qBZ0IF7nTPd3VJ1qHV?=
 =?us-ascii?Q?4FxfbrZpXRiD7qNalTMvgcfDqMYVpoufFYD8TxZIZdvQaVxXaYGgB20Dh8jw?=
 =?us-ascii?Q?7MXMtjnsUYV/r0STopn0M/WfR/6+ZJPXyX0iD8B7BSHevHnfCaEy+TyB6XjU?=
 =?us-ascii?Q?HutksW+Zuav1+Epmrd+nAXgP9t/pOlZPzVVDRNynORsi7BZ1fBe4ySMW57uP?=
 =?us-ascii?Q?Wf05Uv97fjEZ0mAIVvajQMFRWuYhpXDpfNfaCrX+xDOdicPVYcrXKllEKZnm?=
 =?us-ascii?Q?svb9WmtpkC1OVObQyreEv2icxdwvD/DssNFJx7PwPP/eE3hyBxPiy54b8Uh/?=
 =?us-ascii?Q?xkA/25z8vxoyzspzkeqihumKdLOE96ZE+v/2FDKvJb65XczbrNitiJRLBxAk?=
 =?us-ascii?Q?6kWuva6azyoOV9rsZk2wL0LAgErfVzjZm0Pb8Vj7HwdlOjnunr9zP/exkazc?=
 =?us-ascii?Q?Q4MqQaNrDoF8xyEmir86BtAt9nkQeE5TQKiYsqlmEguI4VbyOs+cSQjERaeE?=
 =?us-ascii?Q?1/PATqzn/Df48RofTWQyLVdfMQ9Qgd8u8YM378vOfm7QR8p6nq7B+oEDK6lL?=
 =?us-ascii?Q?bPfJsRm9LoXhMr/7217j/mria0mX54V9DLdBUq15BnVuVT6PMKHypNy6AVEi?=
 =?us-ascii?Q?luRo2vy5Vr+dc6qeKksV5+oHFQ+jXW5Am1vxliJc6xdazIpV6yT4z6tXaskT?=
 =?us-ascii?Q?dKbvbPE7fnTY2LMz5gk27U9Mp3vfCLZxmiWDDIs+ogJpfeH0DhFwqbKccqVE?=
 =?us-ascii?Q?/Im1CLM81R0K3pHIAyRK77e5ZL6YYAT2Qc6/8B3tj/wLSF9TQjqIDhEAQhMi?=
 =?us-ascii?Q?/KUzKo8Xr+SSOiHDN6Upw6+R6rPIL7vKJvgra5bZkW6q8+Q+mPs0wLLVlRFj?=
 =?us-ascii?Q?sU4fIUaVg9McUOaU4pbkUVFQLsDp+ijYxYqS38FZt5cf92GvLDR4rcteBaa0?=
 =?us-ascii?Q?CpKyH9ZMUIAVXRsjOCUZrYVZcK/zqw4KtSOMWMC/MoPmYyd6?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79271f46-769a-4c71-d3cb-08de63912f08
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2026 02:00:34.3520
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ya6Qwrl6hGBcZXjhq1kPqjW0i5+DXWzbXXS+riAetexSfcp8QCzy3CpKJLBo1G0cQhM1/FwM11KmY1bYFsxIyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_180038_941665_64C4EAA7 
X-CRM114-Status: GOOD (  22.27  )
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

> Subject: Re: [PATCH V5 3/5] arm64: dts: imx93: Move 11x11 EVK specific pa=
rts
> back to imx93-11x11-evk.dts
>=20
> On Tue, Feb 03, 2026 at 04:01:35PM +0800, Sherry Sun wrote:
> > The previous patch renamed imx93-11x11-evk.dts to
> > imx93-evk-common.dtsi to prepare for adding the i.MX93 Wireless EVK,
> > which shares most of its design with the 11x11 EVK.
> >
> > This patch moves the board specific differences out of
>=20
> Move ....
>=20
Thanks, will fix it.

Best Regards
Sherry

> Frank
>=20
> > imx93-evk-common.dtsi and back into imx93-11x11-evk.dts, ensuring that
> > the common dtsi only contains the truly shared parts between the two
> > EVK boards.
> >
> > No functional changes intended.
> >
> > Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> > ---
> >  .../boot/dts/freescale/imx93-11x11-evk.dts    | 206 ++++++++++++++++++
> >  .../boot/dts/freescale/imx93-evk-common.dtsi  | 198 -----------------
> >  2 files changed, 206 insertions(+), 198 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
> > b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
> > index cca923f4ac7a..6b6d06c70af1 100644
> > --- a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
> > +++ b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
> > @@ -11,4 +11,210 @@
> >  / {
> >  	model =3D "NXP i.MX93 11X11 EVK board";
> >  	compatible =3D "fsl,imx93-11x11-evk", "fsl,imx93";
> > +
> > +	aliases {
> > +		mmc2 =3D &usdhc3;
> > +	};
> > +
> > +	reg_m2_pwr: regulator-m2-pwr {
> > +		compatible =3D "regulator-fixed";
> > +		regulator-name =3D "M.2-power";
> > +		regulator-min-microvolt =3D <3300000>;
> > +		regulator-max-microvolt =3D <3300000>;
> > +		gpio =3D <&pcal6524 13 GPIO_ACTIVE_HIGH>;
> > +		enable-active-high;
> > +	};
> > +
> > +	reg_usdhc3_vmmc: regulator-usdhc3 {
> > +		compatible =3D "regulator-fixed";
> > +		regulator-name =3D "WLAN_EN";
> > +		regulator-min-microvolt =3D <3300000>;
> > +		regulator-max-microvolt =3D <3300000>;
> > +		vin-supply =3D <&reg_m2_pwr>;
> > +		gpio =3D <&pcal6524 20 GPIO_ACTIVE_HIGH>;
> > +		/*
> > +		 * IW612 wifi chip needs more delay than other wifi chips to
> complete
> > +		 * the host interface initialization after power up, otherwise
> the
> > +		 * internal state of IW612 may be unstable, resulting in the
> failure of
> > +		 * the SDIO3.0 switch voltage.
> > +		 */
> > +		startup-delay-us =3D <20000>;
> > +		enable-active-high;
> > +	};
> > +
> > +	usdhc3_pwrseq: usdhc3_pwrseq {
> > +		compatible =3D "mmc-pwrseq-simple";
> > +		reset-gpios =3D <&pcal6524 12 GPIO_ACTIVE_LOW>;
> > +	};
> > +
> > +	bt_sco_codec: bt-sco-codec {
> > +		compatible =3D "linux,bt-sco";
> > +		#sound-dai-cells =3D <1>;
> > +	};
> > +
> > +	sound-bt-sco {
> > +		compatible =3D "simple-audio-card";
> > +		simple-audio-card,name =3D "bt-sco-audio";
> > +		simple-audio-card,format =3D "dsp_a";
> > +		simple-audio-card,bitclock-inversion;
> > +		simple-audio-card,frame-master =3D <&btcpu>;
> > +		simple-audio-card,bitclock-master =3D <&btcpu>;
> > +
> > +		btcpu: simple-audio-card,cpu {
> > +			sound-dai =3D <&sai1>;
> > +			dai-tdm-slot-num =3D <2>;
> > +			dai-tdm-slot-width =3D <16>;
> > +		};
> > +
> > +		simple-audio-card,codec {
> > +			sound-dai =3D <&bt_sco_codec 1>;
> > +		};
> > +	};
> > +
> > +	sound-micfil {
> > +		compatible =3D "fsl,imx-audio-card";
> > +		model =3D "micfil-audio";
> > +
> > +		pri-dai-link {
> > +			link-name =3D "micfil hifi";
> > +			format =3D "i2s";
> > +
> > +			cpu {
> > +				sound-dai =3D <&micfil>;
> > +			};
> > +		};
> > +	};
> > +};
> > +
> > +&micfil {
> > +	pinctrl-names =3D "default", "sleep";
> > +	pinctrl-0 =3D <&pinctrl_pdm>;
> > +	pinctrl-1 =3D <&pinctrl_pdm_sleep>;
> > +	assigned-clocks =3D <&clk IMX93_CLK_PDM>;
> > +	assigned-clock-parents =3D <&clk IMX93_CLK_AUDIO_PLL>;
> > +	assigned-clock-rates =3D <49152000>;
> > +	status =3D "okay";
> > +};
> > +
> > +&pcal6524 {
> > +	m2-pcm-level-shifter-hog {
> > +		gpio-hog;
> > +		gpios =3D <19 GPIO_ACTIVE_HIGH>;
> > +		output-high;
> > +	};
> > +};
> > +
> > +&sai1 {
> > +	pinctrl-names =3D "default", "sleep";
> > +	pinctrl-0 =3D <&pinctrl_sai1>;
> > +	pinctrl-1 =3D <&pinctrl_sai1_sleep>;
> > +	assigned-clocks =3D <&clk IMX93_CLK_SAI1>;
> > +	assigned-clock-parents =3D <&clk IMX93_CLK_AUDIO_PLL>;
> > +	assigned-clock-rates =3D <12288000>;
> > +	fsl,sai-mclk-direction-output;
> > +	status =3D "okay";
> > +};
> > +
> > +&usdhc3 {
> > +	pinctrl-names =3D "default", "state_100mhz", "state_200mhz", "sleep";
> > +	pinctrl-0 =3D <&pinctrl_usdhc3>, <&pinctrl_usdhc3_wlan>;
> > +	pinctrl-1 =3D <&pinctrl_usdhc3_100mhz>, <&pinctrl_usdhc3_wlan>;
> > +	pinctrl-2 =3D <&pinctrl_usdhc3_200mhz>, <&pinctrl_usdhc3_wlan>;
> > +	pinctrl-3 =3D <&pinctrl_usdhc3_sleep>, <&pinctrl_usdhc3_wlan>;
> > +	mmc-pwrseq =3D <&usdhc3_pwrseq>;
> > +	vmmc-supply =3D <&reg_usdhc3_vmmc>;
> > +	bus-width =3D <4>;
> > +	keep-power-in-suspend;
> > +	non-removable;
> > +	wakeup-source;
> > +	status =3D "okay";
> > +};
> > +
> > +&iomuxc {
> > +	pinctrl_pdm: pdmgrp {
> > +		fsl,pins =3D <
> > +			MX93_PAD_PDM_CLK__PDM_CLK
> 	0x31e
> > +
> 	MX93_PAD_PDM_BIT_STREAM0__PDM_BIT_STREAM00	0x31e
> > +
> 	MX93_PAD_PDM_BIT_STREAM1__PDM_BIT_STREAM01	0x31e
> > +		>;
> > +	};
> > +
> > +	pinctrl_pdm_sleep: pdmsleepgrp {
> > +		fsl,pins =3D <
> > +			MX93_PAD_PDM_CLK__GPIO1_IO08
> 	0x31e
> > +			MX93_PAD_PDM_BIT_STREAM0__GPIO1_IO09
> 	0x31e
> > +			MX93_PAD_PDM_BIT_STREAM1__GPIO1_IO10
> 	0x31e
> > +		>;
> > +	};
> > +
> > +	pinctrl_sai1: sai1grp {
> > +		fsl,pins =3D <
> > +			MX93_PAD_SAI1_TXC__SAI1_TX_BCLK
> 	0x31e
> > +			MX93_PAD_SAI1_TXFS__SAI1_TX_SYNC		0x31e
> > +			MX93_PAD_SAI1_TXD0__SAI1_TX_DATA00
> 	0x31e
> > +			MX93_PAD_SAI1_RXD0__SAI1_RX_DATA00
> 	0x31e
> > +		>;
> > +	};
> > +
> > +	pinctrl_sai1_sleep: sai1sleepgrp {
> > +		fsl,pins =3D <
> > +			MX93_PAD_SAI1_TXC__GPIO1_IO12                   0x51e
> > +			MX93_PAD_SAI1_TXFS__GPIO1_IO11
> 	0x51e
> > +			MX93_PAD_SAI1_TXD0__GPIO1_IO13
> 	0x51e
> > +			MX93_PAD_SAI1_RXD0__GPIO1_IO14
> 	0x51e
> > +		>;
> > +	};
> > +
> > +	/* need to config the SION for data and cmd pad, refer to ERR052021
> */
> > +	pinctrl_usdhc3: usdhc3grp {
> > +		fsl,pins =3D <
> > +			MX93_PAD_SD3_CLK__USDHC3_CLK
> 	0x1582
> > +			MX93_PAD_SD3_CMD__USDHC3_CMD
> 	0x40001382
> > +			MX93_PAD_SD3_DATA0__USDHC3_DATA0
> 	0x40001382
> > +			MX93_PAD_SD3_DATA1__USDHC3_DATA1
> 	0x40001382
> > +			MX93_PAD_SD3_DATA2__USDHC3_DATA2
> 	0x40001382
> > +			MX93_PAD_SD3_DATA3__USDHC3_DATA3
> 	0x40001382
> > +		>;
> > +	};
> > +
> > +	/* need to config the SION for data and cmd pad, refer to ERR052021
> */
> > +	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
> > +		fsl,pins =3D <
> > +			MX93_PAD_SD3_CLK__USDHC3_CLK
> 	0x158e
> > +			MX93_PAD_SD3_CMD__USDHC3_CMD
> 	0x4000138e
> > +			MX93_PAD_SD3_DATA0__USDHC3_DATA0
> 	0x4000138e
> > +			MX93_PAD_SD3_DATA1__USDHC3_DATA1
> 	0x4000138e
> > +			MX93_PAD_SD3_DATA2__USDHC3_DATA2
> 	0x4000138e
> > +			MX93_PAD_SD3_DATA3__USDHC3_DATA3
> 	0x4000138e
> > +		>;
> > +	};
> > +
> > +	/* need to config the SION for data and cmd pad, refer to ERR052021
> */
> > +	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
> > +		fsl,pins =3D <
> > +			MX93_PAD_SD3_CLK__USDHC3_CLK
> 	0x15fe
> > +			MX93_PAD_SD3_CMD__USDHC3_CMD
> 	0x400013fe
> > +			MX93_PAD_SD3_DATA0__USDHC3_DATA0
> 	0x400013fe
> > +			MX93_PAD_SD3_DATA1__USDHC3_DATA1
> 	0x400013fe
> > +			MX93_PAD_SD3_DATA2__USDHC3_DATA2
> 	0x400013fe
> > +			MX93_PAD_SD3_DATA3__USDHC3_DATA3
> 	0x400013fe
> > +		>;
> > +	};
> > +
> > +	pinctrl_usdhc3_sleep: usdhc3grpsleepgrp {
> > +		fsl,pins =3D <
> > +			MX93_PAD_SD3_CLK__GPIO3_IO20		0x31e
> > +			MX93_PAD_SD3_CMD__GPIO3_IO21		0x31e
> > +			MX93_PAD_SD3_DATA0__GPIO3_IO22		0x31e
> > +			MX93_PAD_SD3_DATA1__GPIO3_IO23		0x31e
> > +			MX93_PAD_SD3_DATA2__GPIO3_IO24		0x31e
> > +			MX93_PAD_SD3_DATA3__GPIO3_IO25		0x31e
> > +		>;
> > +	};
> > +
> > +	pinctrl_usdhc3_wlan: usdhc3wlangrp {
> > +		fsl,pins =3D <
> > +			MX93_PAD_CCM_CLKO1__GPIO3_IO26		0x31e
> > +		>;
> > +	};
> >  };
> > diff --git a/arch/arm64/boot/dts/freescale/imx93-evk-common.dtsi
> > b/arch/arm64/boot/dts/freescale/imx93-evk-common.dtsi
> > index 6279b8eb4ea7..301e9f05122e 100644
> > --- a/arch/arm64/boot/dts/freescale/imx93-evk-common.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx93-evk-common.dtsi
> > @@ -107,15 +107,6 @@ reg_audio_pwr: regulator-audio-pwr {
> >  		enable-active-high;
> >  	};
> >
> > -	reg_m2_pwr: regulator-m2-pwr {
> > -		compatible =3D "regulator-fixed";
> > -		regulator-name =3D "M.2-power";
> > -		regulator-min-microvolt =3D <3300000>;
> > -		regulator-max-microvolt =3D <3300000>;
> > -		gpio =3D <&pcal6524 13 GPIO_ACTIVE_HIGH>;
> > -		enable-active-high;
> > -	};
> > -
> >  	reg_usdhc2_vmmc: regulator-usdhc2 {
> >  		compatible =3D "regulator-fixed";
> >  		pinctrl-names =3D "default";
> > @@ -128,28 +119,6 @@ reg_usdhc2_vmmc: regulator-usdhc2 {
> >  		enable-active-high;
> >  	};
> >
> > -	reg_usdhc3_vmmc: regulator-usdhc3 {
> > -		compatible =3D "regulator-fixed";
> > -		regulator-name =3D "WLAN_EN";
> > -		regulator-min-microvolt =3D <3300000>;
> > -		regulator-max-microvolt =3D <3300000>;
> > -		vin-supply =3D <&reg_m2_pwr>;
> > -		gpio =3D <&pcal6524 20 GPIO_ACTIVE_HIGH>;
> > -		/*
> > -		 * IW612 wifi chip needs more delay than other wifi chips to
> complete
> > -		 * the host interface initialization after power up, otherwise
> the
> > -		 * internal state of IW612 may be unstable, resulting in the
> failure of
> > -		 * the SDIO3.0 switch voltage.
> > -		 */
> > -		startup-delay-us =3D <20000>;
> > -		enable-active-high;
> > -	};
> > -
> > -	usdhc3_pwrseq: usdhc3_pwrseq {
> > -		compatible =3D "mmc-pwrseq-simple";
> > -		reset-gpios =3D <&pcal6524 12 GPIO_ACTIVE_LOW>;
> > -	};
> > -
> >  	backlight_lvds: backlight-lvds {
> >  		compatible =3D "pwm-backlight";
> >  		pwms =3D <&adp5585 0 100000 0>;
> > @@ -161,44 +130,6 @@ backlight_lvds: backlight-lvds {
> >  		status =3D "disabled";
> >  	};
> >
> > -	bt_sco_codec: bt-sco-codec {
> > -		compatible =3D "linux,bt-sco";
> > -		#sound-dai-cells =3D <1>;
> > -	};
> > -
> > -	sound-bt-sco {
> > -		compatible =3D "simple-audio-card";
> > -		simple-audio-card,name =3D "bt-sco-audio";
> > -		simple-audio-card,format =3D "dsp_a";
> > -		simple-audio-card,bitclock-inversion;
> > -		simple-audio-card,frame-master =3D <&btcpu>;
> > -		simple-audio-card,bitclock-master =3D <&btcpu>;
> > -
> > -		btcpu: simple-audio-card,cpu {
> > -			sound-dai =3D <&sai1>;
> > -			dai-tdm-slot-num =3D <2>;
> > -			dai-tdm-slot-width =3D <16>;
> > -		};
> > -
> > -		simple-audio-card,codec {
> > -			sound-dai =3D <&bt_sco_codec 1>;
> > -		};
> > -	};
> > -
> > -	sound-micfil {
> > -		compatible =3D "fsl,imx-audio-card";
> > -		model =3D "micfil-audio";
> > -
> > -		pri-dai-link {
> > -			link-name =3D "micfil hifi";
> > -			format =3D "i2s";
> > -
> > -			cpu {
> > -				sound-dai =3D <&micfil>;
> > -			};
> > -		};
> > -	};
> > -
> >  	sound-wm8962 {
> >  		compatible =3D "fsl,imx-audio-wm8962";
> >  		model =3D "wm8962-audio";
> > @@ -350,12 +281,6 @@ pcal6524: gpio@22 {
> >  		#interrupt-cells =3D <2>;
> >  		interrupt-parent =3D <&gpio3>;
> >  		interrupts =3D <27 IRQ_TYPE_LEVEL_LOW>;
> > -
> > -		m2-pcm-level-shifter-hog {
> > -			gpio-hog;
> > -			gpios =3D <19 GPIO_ACTIVE_HIGH>;
> > -			output-high;
> > -		};
> >  	};
> >
> >  	pmic@25 {
> > @@ -548,16 +473,6 @@ bluetooth {
> >  	};
> >  };
> >
> > -&micfil {
> > -	pinctrl-names =3D "default", "sleep";
> > -	pinctrl-0 =3D <&pinctrl_pdm>;
> > -	pinctrl-1 =3D <&pinctrl_pdm_sleep>;
> > -	assigned-clocks =3D <&clk IMX93_CLK_PDM>;
> > -	assigned-clock-parents =3D <&clk IMX93_CLK_AUDIO_PLL>;
> > -	assigned-clock-rates =3D <49152000>;
> > -	status =3D "okay";
> > -};
> > -
> >  &mu1 {
> >  	status =3D "okay";
> >  };
> > @@ -566,17 +481,6 @@ &mu2 {
> >  	status =3D "okay";
> >  };
> >
> > -&sai1 {
> > -	pinctrl-names =3D "default", "sleep";
> > -	pinctrl-0 =3D <&pinctrl_sai1>;
> > -	pinctrl-1 =3D <&pinctrl_sai1_sleep>;
> > -	assigned-clocks =3D <&clk IMX93_CLK_SAI1>;
> > -	assigned-clock-parents =3D <&clk IMX93_CLK_AUDIO_PLL>;
> > -	assigned-clock-rates =3D <12288000>;
> > -	fsl,sai-mclk-direction-output;
> > -	status =3D "okay";
> > -};
> > -
> >  &sai3 {
> >  	pinctrl-names =3D "default", "sleep";
> >  	pinctrl-0 =3D <&pinctrl_sai3>;
> > @@ -647,21 +551,6 @@ &usdhc2 {
> >  	no-mmc;
> >  };
> >
> > -&usdhc3 {
> > -	pinctrl-names =3D "default", "state_100mhz", "state_200mhz", "sleep";
> > -	pinctrl-0 =3D <&pinctrl_usdhc3>, <&pinctrl_usdhc3_wlan>;
> > -	pinctrl-1 =3D <&pinctrl_usdhc3_100mhz>, <&pinctrl_usdhc3_wlan>;
> > -	pinctrl-2 =3D <&pinctrl_usdhc3_200mhz>, <&pinctrl_usdhc3_wlan>;
> > -	pinctrl-3 =3D <&pinctrl_usdhc3_sleep>, <&pinctrl_usdhc3_wlan>;
> > -	mmc-pwrseq =3D <&usdhc3_pwrseq>;
> > -	vmmc-supply =3D <&reg_usdhc3_vmmc>;
> > -	bus-width =3D <4>;
> > -	keep-power-in-suspend;
> > -	non-removable;
> > -	wakeup-source;
> > -	status =3D "okay";
> > -};
> > -
> >  &wdog3 {
> >  	pinctrl-names =3D "default";
> >  	pinctrl-0 =3D <&pinctrl_wdog>;
> > @@ -808,40 +697,6 @@ MX93_PAD_CCM_CLKO2__GPIO3_IO27
> 		0x31e
> >  		>;
> >  	};
> >
> > -	pinctrl_pdm: pdmgrp {
> > -		fsl,pins =3D <
> > -			MX93_PAD_PDM_CLK__PDM_CLK
> 	0x31e
> > -
> 	MX93_PAD_PDM_BIT_STREAM0__PDM_BIT_STREAM00	0x31e
> > -
> 	MX93_PAD_PDM_BIT_STREAM1__PDM_BIT_STREAM01	0x31e
> > -		>;
> > -	};
> > -
> > -	pinctrl_pdm_sleep: pdmsleepgrp {
> > -		fsl,pins =3D <
> > -			MX93_PAD_PDM_CLK__GPIO1_IO08
> 	0x31e
> > -			MX93_PAD_PDM_BIT_STREAM0__GPIO1_IO09
> 	0x31e
> > -			MX93_PAD_PDM_BIT_STREAM1__GPIO1_IO10
> 	0x31e
> > -		>;
> > -	};
> > -
> > -	pinctrl_sai1: sai1grp {
> > -		fsl,pins =3D <
> > -			MX93_PAD_SAI1_TXC__SAI1_TX_BCLK
> 	0x31e
> > -			MX93_PAD_SAI1_TXFS__SAI1_TX_SYNC		0x31e
> > -			MX93_PAD_SAI1_TXD0__SAI1_TX_DATA00
> 	0x31e
> > -			MX93_PAD_SAI1_RXD0__SAI1_RX_DATA00
> 	0x31e
> > -		>;
> > -	};
> > -
> > -	pinctrl_sai1_sleep: sai1sleepgrp {
> > -		fsl,pins =3D <
> > -			MX93_PAD_SAI1_TXC__GPIO1_IO12                   0x51e
> > -			MX93_PAD_SAI1_TXFS__GPIO1_IO11
> 	0x51e
> > -			MX93_PAD_SAI1_TXD0__GPIO1_IO13
> 	0x51e
> > -			MX93_PAD_SAI1_RXD0__GPIO1_IO14
> 	0x51e
> > -		>;
> > -	};
> > -
> >  	/* need to config the SION for data and cmd pad, refer to ERR052021
> */
> >  	pinctrl_usdhc1: usdhc1grp {
> >  		fsl,pins =3D <
> > @@ -996,59 +851,6 @@ MX93_PAD_SD2_VSELECT__GPIO3_IO19	0x51e
> >  		>;
> >  	};
> >
> > -	/* need to config the SION for data and cmd pad, refer to ERR052021
> */
> > -	pinctrl_usdhc3: usdhc3grp {
> > -		fsl,pins =3D <
> > -			MX93_PAD_SD3_CLK__USDHC3_CLK
> 	0x1582
> > -			MX93_PAD_SD3_CMD__USDHC3_CMD
> 	0x40001382
> > -			MX93_PAD_SD3_DATA0__USDHC3_DATA0
> 	0x40001382
> > -			MX93_PAD_SD3_DATA1__USDHC3_DATA1
> 	0x40001382
> > -			MX93_PAD_SD3_DATA2__USDHC3_DATA2
> 	0x40001382
> > -			MX93_PAD_SD3_DATA3__USDHC3_DATA3
> 	0x40001382
> > -		>;
> > -	};
> > -
> > -	/* need to config the SION for data and cmd pad, refer to ERR052021
> */
> > -	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
> > -		fsl,pins =3D <
> > -			MX93_PAD_SD3_CLK__USDHC3_CLK
> 	0x158e
> > -			MX93_PAD_SD3_CMD__USDHC3_CMD
> 	0x4000138e
> > -			MX93_PAD_SD3_DATA0__USDHC3_DATA0
> 	0x4000138e
> > -			MX93_PAD_SD3_DATA1__USDHC3_DATA1
> 	0x4000138e
> > -			MX93_PAD_SD3_DATA2__USDHC3_DATA2
> 	0x4000138e
> > -			MX93_PAD_SD3_DATA3__USDHC3_DATA3
> 	0x4000138e
> > -		>;
> > -	};
> > -
> > -	/* need to config the SION for data and cmd pad, refer to ERR052021
> */
> > -	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
> > -		fsl,pins =3D <
> > -			MX93_PAD_SD3_CLK__USDHC3_CLK
> 	0x15fe
> > -			MX93_PAD_SD3_CMD__USDHC3_CMD
> 	0x400013fe
> > -			MX93_PAD_SD3_DATA0__USDHC3_DATA0
> 	0x400013fe
> > -			MX93_PAD_SD3_DATA1__USDHC3_DATA1
> 	0x400013fe
> > -			MX93_PAD_SD3_DATA2__USDHC3_DATA2
> 	0x400013fe
> > -			MX93_PAD_SD3_DATA3__USDHC3_DATA3
> 	0x400013fe
> > -		>;
> > -	};
> > -
> > -	pinctrl_usdhc3_sleep: usdhc3grpsleepgrp {
> > -		fsl,pins =3D <
> > -			MX93_PAD_SD3_CLK__GPIO3_IO20		0x31e
> > -			MX93_PAD_SD3_CMD__GPIO3_IO21		0x31e
> > -			MX93_PAD_SD3_DATA0__GPIO3_IO22		0x31e
> > -			MX93_PAD_SD3_DATA1__GPIO3_IO23		0x31e
> > -			MX93_PAD_SD3_DATA2__GPIO3_IO24		0x31e
> > -			MX93_PAD_SD3_DATA3__GPIO3_IO25		0x31e
> > -		>;
> > -	};
> > -
> > -	pinctrl_usdhc3_wlan: usdhc3wlangrp {
> > -		fsl,pins =3D <
> > -			MX93_PAD_CCM_CLKO1__GPIO3_IO26		0x31e
> > -		>;
> > -	};
> > -
> >  	pinctrl_wdog: wdoggrp {
> >  		fsl,pins =3D <
> >  			MX93_PAD_WDOG_ANY__WDOG1_WDOG_ANY
> 	0x31e
> > --
> > 2.37.1
> >

