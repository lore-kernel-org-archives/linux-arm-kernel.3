Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80BE8C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 11:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fYDYZd9aoQSzJ2NKMFUAH1k/YBMS0OHFTLitaVrnTjQ=; b=PEMmwDV/8YErsT2yZ+jZVARQEx
	a9mEGzgzLe5HVhZRXzAw4a/OVLRE1HhI3ECc2d2MXBaI0I0juQ97TDnTfQ4zMvMwTq6Ro2pSDAS9t
	i/d2Rt3Gi/nv3aXS3ssyjZkVNTaVcq8wL+ydq6e221k40zxvGdjaMuRqm4B+djPygjw3CccackKyI
	lmF1dRBhlJBK8fvkq4U9nWKjrIF37iGv+a+DCo1eS4clj3v1nhSI9Hj2w2t9KYc6fnhRLtFMDVmHT
	IZScIK1wUfW/eKSIedUVLFwmgPcN0zK4F3YARbKkmTUQ7qb+yA/uuj4IsK5sfjBmmpS2ZkIubdslR
	5WhadVCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Ya8-0000000AOBb-3iUJ;
	Wed, 23 Apr 2025 11:48:00 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7WnY-0000000A4jO-3ORE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 09:53:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cHt6klSTxHUFK9bLBbZ5w5klLBvg/DiDrqDkiIKLkKtGh2xFBamCH2LTYF/tORrDNmeLRKTUdZ05XSS896NjlyzTnW4Gb3T9tQbhdj70gfIrC1UQMiedd3XesBOZvVIxW+M1232KbJ14/+j35XYo/cY2cpJavp8VIS+d9um/JQ0vlnanQazbE+dOo07WvybhZ/zDr8O5d3d+wxAwl8diTde8YqUYQVIqt2+BaJXydgULaXLh0glN2wfWTLCs/TXsLfnm9inmDeqwvD+30249b0p29da9ZJFQd9d9kxs39Dq2fBwIn6p2O5+GtmScSdk1QtroTfr4QqkN/cHUm5oybw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fYDYZd9aoQSzJ2NKMFUAH1k/YBMS0OHFTLitaVrnTjQ=;
 b=NO0GqldTohxPF01wp/GQiuQZ7MQg3Fbap+x3PKDvKh0P9ze28q73gqEsDsCYkjYi+yK0iXcINiy19fAIccx723BOmwe9LZuLu1pT4SLd01eX15M3N8YwFGFJBh+jDm5Bny82zHE0vx0YUrwlyFwEGhsSnhuLEiJMKnRMyvhxT4qlxPAUkzYIHBr2KVIKNJxHfdduSAxkFlB7eWaRqdrsxP8W3h9WPw3XuvY8QTfnSTKuM3J5SKWYXqvhnW9uZtzVG0Y+rFPFbgxO9gWUeVFkiDKA8pZLVTBDXdLF153Tkbh1eLVrjT8G/AcWSdNQeW0Adi7L1xbN7vIFGQqRNdAvQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fYDYZd9aoQSzJ2NKMFUAH1k/YBMS0OHFTLitaVrnTjQ=;
 b=Zd/aw56EoXR7j2tzILVHrdL86MtSc7Bn1qHFcoitV6n9fXv38lKs8gFInFqPXRLqVgHFVcXciYDvsukhDKr8hN9FfDXa8OTU4Iu+6XlYvR6XMtllmJGhu2E6iaiWQY6Zh3h0n7IJcHRLavI8HSf409Nvql96V3jwNmNQ4wq1Dijlmv+n9yMhKKnkXvJngYfNDNFBKEylvgBbfYHsvTJbggG1bnxyix9RwQexAqi6alIUCqtBrDcXMKyvBBH0ee+eFvCJ15oWX5V0f/Jm39O4XMp5fblEUBnCYUfK9NQ11JCl02Zivh2Me5AWZyzHsPrFkDTDanwRD1fi/pfRr/XMEQ==
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
 by DU2PR04MB8968.eurprd04.prod.outlook.com (2603:10a6:10:2e3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Wed, 23 Apr
 2025 09:53:38 +0000
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb]) by AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb%4]) with mapi id 15.20.8655.033; Wed, 23 Apr 2025
 09:53:38 +0000
From: Jacky Bai <ping.bai@nxp.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
CC: "sudeep.holla@arm.com" <sudeep.holla@arm.com>, "linus.walleij@linaro.org"
	<linus.walleij@linaro.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "cristian.marussi@arm.com"
	<cristian.marussi@arm.com>, Aisheng Dong <aisheng.dong@nxp.com>,
	"festevam@gmail.com" <festevam@gmail.com>, "kernel@pengutronix.de"
	<kernel@pengutronix.de>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "arm-scmi@vger.kernel.org"
	<arm-scmi@vger.kernel.org>
Subject: RE: [PATCH RFC] pinctrl: freescale: Add support for imx943 pinctrl
Thread-Topic: [PATCH RFC] pinctrl: freescale: Add support for imx943 pinctrl
Thread-Index: AQHbotdOAVMZdfAD0kCJ1YWhT8J4qLOvhK8AgAGglFA=
Date: Wed, 23 Apr 2025 09:53:38 +0000
Message-ID: <AS8PR04MB864297B5D46E944D7CD3BB5D87BA2@AS8PR04MB8642.eurprd04.prod.outlook.com>
References: <20250401072725.1141083-1-ping.bai@nxp.com>
 <20250422090150.GB10830@nxa18884-linux>
In-Reply-To: <20250422090150.GB10830@nxa18884-linux>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB8642:EE_|DU2PR04MB8968:EE_
x-ms-office365-filtering-correlation-id: e9604c19-c325-422c-dfff-08dd824cb8a2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?xRQO/tuiIA8dUCQaE2t7sQM9ssK8iVr2fT6+KCNZojlLVzr74XDSUT58BJRy?=
 =?us-ascii?Q?Ymr8iQivfohHPghY8bJ6UrYXD8VqcVIdw1jOsrTNnco7a2mjl59wDJpY1KPl?=
 =?us-ascii?Q?VIvq8WCPcrF8bR53zGSLbdvXdWMC8nRIimZhkOzeBRWhx5E8nu4eG61XU+CJ?=
 =?us-ascii?Q?LwflhCMEOyaIjkNaT/wsw/sInarSosgSNgTzfOaMfNg8Ycejvw/GrDx+m41z?=
 =?us-ascii?Q?OudrlwblQ73RU4h66VAs+NJ9xyThwEo/sH7okydetDmRir0lb1Al8sGjeunL?=
 =?us-ascii?Q?7HFvDBKOWIuRqUXbNai+/vdOFPs/ZALSjT9VL4HW2YQwhsd8frIIdQDG0Dh9?=
 =?us-ascii?Q?avcRvwiN8+YyA9xFGD71/TOhKha0lGx+FhY2Ix8q7+mrYAsioZq0Y8rh28z7?=
 =?us-ascii?Q?zgj59XdRd5bmCeyfNU3GKQUi8SzQDMf4uoFiWDDcSqW1MjBpNZUpG49gEssx?=
 =?us-ascii?Q?OH5twIqfOKrGpxAsMll3VGpHqTfuHgGrPSL/S6PybPni1gmvzXP+B7UQv48I?=
 =?us-ascii?Q?xTPZYaTISiHVw/W6kVIPjSLeZSsa9RQpLiZTasq09umtgKY8W4ctoUe96CBE?=
 =?us-ascii?Q?E6bvpzSExq5VDq704m8RUkjpT62HQbCXlrRvlBGVyvV3PFC3OlUdUuDrN4r5?=
 =?us-ascii?Q?sCOsqNRNjGt1eTkHWNOROcuRdA/I23sgsYv6uuWLC6dRx3RjRTVNZ+M8I428?=
 =?us-ascii?Q?JsoVoOnJ6j1i6W5sT5HAHo5hM/SgVv4IjNYcvNe+pAZ0mJWfg1b+ESJVasZP?=
 =?us-ascii?Q?d/E50mIIZ9oE7v2WLxa2xaz/GAq0+XZ0BaOLgcuZSJejthhMgPGObso8uxlR?=
 =?us-ascii?Q?hCflzmWWZ6xUYJxIadAZIyvV2mnfOaway5zv49fVkNhsEQ9zBtUw+RQaEjsk?=
 =?us-ascii?Q?n119VVKc3PhSNsXtZFYhoMd7VIyIthRR1bXhc0CqEfA/ipWi+5lWlvJl44rL?=
 =?us-ascii?Q?x2RkN5vUV0vvP2drFSq3qjqFvuHfdnP94bNa1Dne0koEWUZLX4Ne0rVdK+S7?=
 =?us-ascii?Q?/3TcMo/uYcmKDtp1jz6449xPU/F2h5sVxGCDqo/XPo5K6kXF1F/WdVLNYqXP?=
 =?us-ascii?Q?euaUJ7Lgk5vS+ut8Ao3Qj/URtMg92qgY5GD0rw8L+olfeAyLhJKKP3l+Z0Xn?=
 =?us-ascii?Q?68wvQtrgXR1SdrtCFSB4ldeA8+rDozHJ/rBTGwlnQTmE9axEFxZBivUP1ixZ?=
 =?us-ascii?Q?Zi/yGyh0EniTSG+m5ZXJirJKTncbUfg/3aDVoWCdLSr6g+srpzRjQxXC26YM?=
 =?us-ascii?Q?NEM4xPEl6ss7YE4J1qpuIeJWGCQhQvV8cWpIDj85A7rUfEto+h1/URZ4Ss81?=
 =?us-ascii?Q?qlxaIYhCUSOnj7JU5Z4t9MR9T6pMgAshRIyv3aebN35DQuNtlu2W5Yiryjiq?=
 =?us-ascii?Q?Xjv78reW/t7Hwr+JxGqhyHAt6Kd9VooE/Zy39mOX7JrGzaInCdJ51B9hEyep?=
 =?us-ascii?Q?EZZMXFhENiSG7wQRxcNY14o+nFK1B8Mnd0x6+V/WF+c0xPoW0L3HKg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?WqHgWmUn0ssxFHc+B6h/FShU1r2eBSzmyVrKqfJCdsz6a/DfitrCCJ00cdb5?=
 =?us-ascii?Q?pnBbIjufBZi/zeGUXVy2cBoVasPzqEu7UJIupZOaeb1NDcFNcjDmX8JeM/oS?=
 =?us-ascii?Q?fpRZ/jFqLzHBQ8Pp7zmiY5eKwlcMdMYaWDwh+J9wXr3kCkseZG5iXOvmqYrN?=
 =?us-ascii?Q?bebBkGT+Uqn7+jo0nldordnkgyhTpQsnieYDL86f90YkVt/Q+9M3ygKxoHrT?=
 =?us-ascii?Q?8UurRy5vUeFeFpaXDH/4NtqSvNNmC1e4Ul4Kc1+zYyM2t550iQdpfmY4+1wT?=
 =?us-ascii?Q?Ab59ktPcphORrL8vfON+6IzdDnd4eHLv+Agi5w00vLY5xJ93GUkzYFgrZ7MH?=
 =?us-ascii?Q?iOXArYiBaBMfg+M8HS5Lgba1Gv5EVpuuaJPS/4kU03CN6Ucjv6Nc3aa8QZ5+?=
 =?us-ascii?Q?OeBwh8eJ2FTOnRNR+z34lwxkX34dmqx4M1ahud2Dcs9XrhlzQVCOyFZRs4xl?=
 =?us-ascii?Q?7N5nXxtybUbAA+TlpB0YMeosyTRLrompNSSX0uZW0kObfsq+3H46cZ5mh3Kw?=
 =?us-ascii?Q?bYDPWLQlZq/OmZyn1QYEJ7EOfZZRJjJQlq3+zl2m9wWWIxHQxLAB29DsynYD?=
 =?us-ascii?Q?yrB2ysD18c9vThavCTpLZ6S38r2J6ZAC56XAbFVEv0MoUHyAu9HQDOhfP696?=
 =?us-ascii?Q?bDKdXAHHfd094ihF78Tz6zgXkhz0+VKN9pnVUv/cqRmaDh2IZWSH6WXpZdGb?=
 =?us-ascii?Q?E61FqfgF1HIaRXlXREw8x2wqFv9ZZ4wzRupRAPnKrwWbIGhes9l65ulpJDge?=
 =?us-ascii?Q?R02rH0+R4IKqWrT2WX2UYOdI4d5sY7KUnQ1Y0VJJfn1KE6oLa6+mzjJu/HAB?=
 =?us-ascii?Q?JWc0piN/APr3/ib3TG5QzMWVxQGd/8OloDjqe5JJmPzEJMY15PHk6NREMA4X?=
 =?us-ascii?Q?j//fW5tW93y8YcEtc0IroiXwD50soCUYsGzVzTz0PXDzwxZQfVLd3kFodnXp?=
 =?us-ascii?Q?Ghd2oc1ucrbstyuDrnvXjXoqOI+FvuUwQcpu9fj8F7sNr5UBV/03tPkVRaW+?=
 =?us-ascii?Q?vs7tbo1JZ3GmSXZ1P3iouyqHlj6edLmzLGVOp28WOIEMVlLygzRQXuPf92cC?=
 =?us-ascii?Q?sho9/Af8Sk58VaaUI6E32b7UqerwW2kVzWACpZyc2gcF1z+3XN8TjpAAc/J0?=
 =?us-ascii?Q?S1ESbyvss+LyDX+qwRKpsOAC+jZDWeFvYtWvqEAA9sa6iiBXPXhOmMugfX/L?=
 =?us-ascii?Q?0T0L6QHfPYnPzYHwagwBiXDwWqFhQn+ZGFYuEh/4rGwfFt65lt4XMQ3+BbOF?=
 =?us-ascii?Q?fNVJjBhEG3Yx8RCXo2CKQR0ANR7sN8Eg8v9eVbWhFloWNcgnWpDJYMMtb/mV?=
 =?us-ascii?Q?b51ITykpu9zZy5jnV6L6MweXfUryVk8FtpJKuHuazZgq+QbiQV3tEzZOr3HA?=
 =?us-ascii?Q?wzg8QQm1j1Jqt9LN82NNDP+5h8WQosjOBfpOQxdeYua5vDAW08L6RsrpWWzc?=
 =?us-ascii?Q?pFZ/Xi2lg+/L31g/VmfcNnWHoGviLzWgDsNcp4Y2MLlGQm6MwIfZQUNGnakn?=
 =?us-ascii?Q?z4HelQzBYgbICCLfcCo6KPDPuuGvzQqXPJA0IgtoYzP+36YBmhHPrbIEs2xE?=
 =?us-ascii?Q?q67yb480ZccIAvwDmbY=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9604c19-c325-422c-dfff-08dd824cb8a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2025 09:53:38.2850
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6pybMGJRgM87JVkjJPathPS4lNflfLISL0MKsk0UXNyTn/O0ayYNwSBZwtcyx/NLS807PHEQ3QK7B5+MINNOag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8968
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_025344_852624_9E5BF3B8 
X-CRM114-Status: GOOD (  11.92  )
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

> Subject: Re: [PATCH RFC] pinctrl: freescale: Add support for imx943 pinct=
rl
>=20
> On Tue, Apr 01, 2025 at 03:27:25PM +0800, Jacky Bai wrote:
> >Add support for i.MX943 pinctrl.
>=20
> Let's expand the commit log a bit:
>=20
> "
> i.MX943 System Manager(SM) firmware supports System Control
> Management
> Interface(SCMI) pinctrl protocol as i.MX95 SM. But i.MX943 IOMUXC Daisy
> input register base is at a different address compared with i.MX95. So, u=
pdate
> pinctrl-imx-scmi to allow i.MX943 and add daisy off register, and update
> pinctrl-scmi to block i.MX943 "
>=20

Sure, will refine the commit log in next version.

BR

> Then, Reviewed-by: Peng Fan <peng.fan@nxp.com>
>=20
> In future, we may no need to expand the array list in both drivers, as of=
 now,
> we are still exploring how. So the patch is ok for now.
>=20
> Thanks,
> Peng.

