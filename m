Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E52BC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 18:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WjCKIASb7gRLsYU2ESqpn5toaxdQc+M7255Lwd6ymbA=; b=TU3Fa7INCPKEUxhQtJEk/WWpeX
	Lan/kgGNG13gZCWAu0IfCSU0P6j0ZkV6Qhj1XoRKNHCyQxHhpM9izwETiziFy/AS7JA+LwNqcbTRq
	5VTtZF0ShaJT+dkOIym8SzI67U135A44v23whpNMmkJ1EwFOAXsKZrTcXKlqruFPhOt9PEm35Gz1e
	+zhOzrPwyEPsulwKO43QESyB//lRE2QGIXs69DuIXKs+Tm5oBkv2YdSrsxX2biFxs3oBbnrEdpAI4
	y+XKNNGH5gAAIIn4bgS0oKpO2HMmvzKaeJzVX1s2kGo/f9SeCR2xnaxBeEWd4Zzdk2KdMUmjRMH0u
	ilOW+MsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4lCe-00000006kGk-1ueQ;
	Tue, 15 Apr 2025 18:40:12 +0000
Received: from mail-vi1eur03on20612.outbound.protection.outlook.com ([2a01:111:f403:260c::612] helo=EUR03-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4lAo-00000006jyV-2mLm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 18:38:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ry8m3nfcdBkVctjS9zCq+RNwYE/IM3iVFsPu03V/ic7K4R0nskE0cHMRB0AzakJdEtur2p+5TRKTv0L0h361fDvcRjWDGWg1Ub1pIdGMIh3Tp0g1UfWYL7FaqGHy5N71DTckCRuUpljcKTnPhVDd48TCbL6IGYO22Z5j5+QkSy+7w7konqt1uaxzDI9Z8RQkWralLy2nrOfHZ7M6lvxL4paK+myLjOUOEo+gqAs8TvReIxF5PKpFLP9IliWJfeYokDpCkvnO89QS7FLmof8e9NEXawSD6BRy6k2dbYnwfZH28AsUKeAvPfo1iZ7KTUBeHj+IkGSMO9QGDh7dJY55yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WjCKIASb7gRLsYU2ESqpn5toaxdQc+M7255Lwd6ymbA=;
 b=MgwAO2qX3ayvUgNTA3EDw5bYbPSXAa/eXwHirstOs2GPDzHLWTh+2gj1fFxV8CT2kYyf5AIKyA6fNuZ51GO/TcWxoP4fZ9+S4nwqCG8owVZyf8XyIWjMcx6V3dyfgogoD5R5233Bg1A9MltczGVij76hvTzmVicoAA0q0dvEQmU12QDA1PEtYWbdIStB8U2MSDV3HHyM4kIvofySccsQ9wVrKwAXPm+PZJMtnnarDr8PqfivqkqkpNMnN4EJOXdRpsyJluTr06QuZejGDBjj5sJ/9qlGJS9F+P4mzIlyW+7LmR2VUfMwzy4GcPch0BK7k7kjFp2PLXgs9QkcIvGx5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WjCKIASb7gRLsYU2ESqpn5toaxdQc+M7255Lwd6ymbA=;
 b=ggglsEAM+4ImUME1xiIT2RNrwA+S5QEcSSFS8hfBiGbdospFlW35pA0pOu7MmQYNf6tw17ZYb2hy8Th+hB9DW4Ea+cXG6J+44p8jTexfE1VOoUNoKV35h+NhCr9N6Eg19xf3r1HS1SRLNnczGV7Y0GbnODNwfwDrjjPQbaBLz2nheBIMs+d2ipxlRIuDcY42UYlfnnHQGDr5Z3KpVk5A0rYppon8KSWW4S+eMZrpb/oeCJT+2EVi7jb/1i+m89XlJt51HPnHTfT2Dre/SfZd1DYv36cEq6P00ymYd6BZs2kh3CUdQ9mBq9FytgMrFZizK2pRkgsM5s8JZjOHKnu1Aw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB7957.eurprd04.prod.outlook.com (2603:10a6:20b:2a2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Tue, 15 Apr
 2025 18:38:14 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8632.035; Tue, 15 Apr 2025
 18:38:14 +0000
Date: Tue, 15 Apr 2025 14:38:06 -0400
From: Frank Li <Frank.li@nxp.com>
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, upstream@lists.phytec.de
Subject: Re: [PATCH v2 08/15] arm64: dts: freescale: imx93-phyboard-segin:
 Fix SD-card pinctrl
Message-ID: <Z/6njgua1PB+uKEX@lizhi-Precision-Tower-5810>
References: <20250415043311.3385835-1-primoz.fiser@norik.com>
 <20250415043311.3385835-9-primoz.fiser@norik.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415043311.3385835-9-primoz.fiser@norik.com>
X-ClientProxiedBy: PH8PR07CA0022.namprd07.prod.outlook.com
 (2603:10b6:510:2cd::21) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB7957:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d66c909-8b53-4bf1-2ee3-08dd7c4cae67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Td9B2cptyUMuysr01gViKGaP6DVpYY2wHmLrT1ZkEstnnY35wbwQd34NSmGd?=
 =?us-ascii?Q?bJ+TPrOMgVk8CRghgIJJQcfSC+bM7YA1RYYV3DwuAujDKAf092mflwdlHjnt?=
 =?us-ascii?Q?9xsD9Ns3ZQbTz8v5Q62n9PmiH9Xi7IqkdzDCYI2QpDCAlnZ1bO8eJxlGIfuV?=
 =?us-ascii?Q?9AMalyuV8ZVkOM8kIOuS3H9TuMyw7hjXewueZklbd7LpOjwdRCfiXm0ns0QQ?=
 =?us-ascii?Q?DcHYS1vl4T6keJzjUY/vk0ABFHu79ASHOJukKwDkDutkYdd7yoiBYfUFO2XI?=
 =?us-ascii?Q?MbP/IgLyT6aDQ6+MWoWYf970YdCWzOYm+cMiRV1r8avWxBD/tfAVJgesRGNT?=
 =?us-ascii?Q?4rvc7TOwXuH7WVuxxtrdhGmPnz3c3LOQYEfR1kUhe/tsiC0FN7WRt4cJ/MWI?=
 =?us-ascii?Q?oFwX5wMBg0T0vehhrX5cyMq7lIe1IYSQneXbIlwXzrtVnx3n/duQ84fXDrKD?=
 =?us-ascii?Q?bp4sjYRhgnzoCQnfr0fQdKjFffzj9vAGHbJbOrE/UFeZBdNW4J86uwMRCI0h?=
 =?us-ascii?Q?Oeiga2pq095/LoP1LIA0TpxZw0jOnfE6rsYNPbfR0vXoVNkfJ+y9HpxWt2vi?=
 =?us-ascii?Q?IVCwyO/dPbCWCe2FlGyV3kn1UllQg0BWo1+J6vo9XRR/Lmvn/jkkxLTt/UWf?=
 =?us-ascii?Q?6HshBjotX4pC/Ekm1tg+4sSGGTFgpSy68Yz5B7qb3c5fB23DoTzeBtg+C0G2?=
 =?us-ascii?Q?Fh5N+CMH64FyJUE2dnbn9c6cuYARQt6ufQ5Ua0gm0+iyB2gwntpwyHrkzYai?=
 =?us-ascii?Q?hXBmaifpQGXeDWg2Wp+mxy9KgnWrVsuX4o9N3r24w7jHsr0sjO4j1G0x52w9?=
 =?us-ascii?Q?6lyDrdE6bhgREli7d34o3XKM1r/+Ws9AqLeD75OCtflPvoEqvoqWNUZa2adD?=
 =?us-ascii?Q?e3RK8+TX4UpaZrzGmCoOH9GkO7ZEZYGPf2wmdFGoB3YK5zABl9xi0aLek+Rm?=
 =?us-ascii?Q?M5T3QXM70POUVf5zqVglMlfceBVx78k+2VLF8aUsk8+MsmYqO28B99C9Z1OT?=
 =?us-ascii?Q?5DBIjK7/Ltr9kKfCtzrhWa8BjPE3wFY6y00prx4eVVnyLfpdBb3TInxqGTUP?=
 =?us-ascii?Q?oA8Uv4W8qyE4ieeov1wp/mxUz7LPbEXFG69beIMSUd5iydH0Qqdgi3lncC8Z?=
 =?us-ascii?Q?NmGn4aJK+FAwPEAgcEA/J/7XEZjnb6iIfudFw2vQXE0RwEKLilJZYr3G9U88?=
 =?us-ascii?Q?AYWxAHKbWpjYEawqotDQjxsr1z2JSlRRH1DGyLFO/eKMAwpGG1sz/rWp/2OO?=
 =?us-ascii?Q?BFfRXMOeKlPUwz7/CoeTX04dV9KFg9GP7PtRGhGEm84yTAtnFwP/fqLFv/Rf?=
 =?us-ascii?Q?MAQKQ3y1mqRDj8x6+k1L1v0NGmPL7c1ld07cp+P1nIsAIxcC47P8dHhIvkKA?=
 =?us-ascii?Q?Ef/0dOIRAbo/p1x9dIVwstfDguUgA54WBHHekpqjOJoTv6g1h+2Ttpl90Mkp?=
 =?us-ascii?Q?OCp5g9cz0LDkPzDqCY1Pg/JeOAgwh/XWQcC5Fz7f5+BeAOlHhUrPSg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RpW6cU6ZZx1cGzbwMcEbm4ZTgNuRcA8WyEeMU/Ec7fhsi8tcM9fq3fEkWWaU?=
 =?us-ascii?Q?5tG1cR7T/+Y4wOnBY5dwhdBrgEZZ/583DplEZVdTtA1cRtQrRjjZZn50dQA/?=
 =?us-ascii?Q?/RQLzTjiCHUBQAcR7Gz6pY7ifYzCLPCF8kc2poiM7+Wzicg+u5szQ6WFhQgT?=
 =?us-ascii?Q?YbrxhfhkKKXjCl8t1jjMifWt8JKhEm15wU5Ea4Hm/oaOMssZ0QHLD8dxOVUH?=
 =?us-ascii?Q?TwMJ99QR/LXYBkCibJ7F2MeeAaPDaKkNQP46PUgaKCY1UEN8b+Ep/SWFbQuQ?=
 =?us-ascii?Q?PY+NgCpdV+Q7FXRjhfhqcF0IJaowFZWELkK+rogWmmQ4m7GNGT3ltOfiuU2q?=
 =?us-ascii?Q?UIF0h5deJq1nLA6fOkNYW22n74hQb1gtBdNYZqGET1RCjPAhTL35BTyO/P5b?=
 =?us-ascii?Q?jSVxbRJIikr0pO+eiFEqqndTywJL5zd181+TMeAoPHJlPo0cR6GdsDCIPzwz?=
 =?us-ascii?Q?p2G/+4DV/yq1roefgPovvL3xdItINElmZ5REcQHHS62GtjVaKiO+T7RGlJGA?=
 =?us-ascii?Q?wBUXrUNUwGQYR/kRkcwDc9GZT3Yxf3rhFrc7ax+aDOZKjg7+++0AxwE8EaLw?=
 =?us-ascii?Q?ui8zTQQiom4nz1v6HquUnsXRuoZr20+O/UvUMXHlQ6BoFMc+/rcO9EvceZ44?=
 =?us-ascii?Q?SmIt4n++/AMbBm7KJu0782/SYpV8FRkgI6tI3KDgVshL5F+IeYSLFGZINwzx?=
 =?us-ascii?Q?yBTc+H9KFgGXvzDb+ARPu7qGJJIswrwNfcABcTsqiH9KAkK9VPYZSdjok0AY?=
 =?us-ascii?Q?ZJX2WSs8gfQF1Rbesa9N4POHgz72RJ868Hnq85GNKRLIzAKaLeU5V+sr9qmQ?=
 =?us-ascii?Q?jV2UrXAjStRlGTaY8Jb0WfGEEsZX6eZIoWDz5J/qjE07tqmoRF8BRSivJ5HS?=
 =?us-ascii?Q?lJ1qnEoJAX5iZ0Gj94lLq21pHnEGacZBeJCVyomIHbCSz+t+oVw0yWy3Qq3k?=
 =?us-ascii?Q?TCrrmw1zXQvjO9uBcOJrIp9dpVnMGnOoPz90juplcuwv+5MMNVdNS93Ce0zK?=
 =?us-ascii?Q?tLq3Lo+s+dsc0jzbhszaBbrfHIueQLL0YSEhB5jou0dESkG494v2Fqm7ib3M?=
 =?us-ascii?Q?i/yT9vNh6KSVMXl/DWxRpHXaQ5V+yq3FbBBl6YclHZOXV0PsyjIzeEc0BXXd?=
 =?us-ascii?Q?THjUxvWpDOzTG8v4d5wfVitSYWVT/330CC9vtaNeOFjRikaB7akludLFkYTm?=
 =?us-ascii?Q?M2euvS4Qlq1yuYaHCJoBKrPqcqZe0Fp4xZM3W74mxl6EoNHvIHPCgZHZaP3U?=
 =?us-ascii?Q?Hy5Z9o+jlpUdUcpKuMQh18tZES7aTQj7WSdGG5KxCMNGXSwfPUtpDMI9KMRb?=
 =?us-ascii?Q?GTknIe8LrvoIFaE5IIWzxT9mcDBsr5bZY51iPq/rkdeXZ+Set2JGeajEvsSy?=
 =?us-ascii?Q?WSB2YxD2pb+3ZSbU4mmmJux4Pc9y0XZ4PEaPlfnjrwQhISi1KTowNYOB2Ixh?=
 =?us-ascii?Q?QQl29P8ytzeQulf+vTR6BQluxJAlmaHQNumAgeoqBSQ4DVS09wGYPx3eCQPe?=
 =?us-ascii?Q?zkPZSv61je1kYwIyeiQTIT7jEv+bb1vWP1o33HsSfeFKUT9Dcg2ayf1llvKT?=
 =?us-ascii?Q?VEhgLOuVV725CW8y3zLHuL9hxDc4L5KsV51FalbT?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d66c909-8b53-4bf1-2ee3-08dd7c4cae67
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 18:38:14.4071
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ngjfOkzdHDjgDposp0br7j6zTrhoBhFMqiG5Ine6mKfih9vyesLGFa1UsCYGwtRcgr6TAkmkb3+4rpERWWxAlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7957
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_113818_702926_1E152067 
X-CRM114-Status: GOOD (  17.52  )
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

On Tue, Apr 15, 2025 at 06:33:04AM +0200, Primoz Fiser wrote:
> Until now, all usdhc2 (SD-card) pinctrl labels pointed to one pinctrl
> group "usdhc2grp" which was overwritten twice by the 100 and 200 MHz
> modes. Fix this by using unique pinctrl names.
>
> Additionally, adjust MX93_PAD_SD2_CLK__USDHC2_CLK pad drive-strength
> according to values obtained by measurements from the PHYTEC hardware
> department to improve signal integrity.
>
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

Strange, DTC should report error if meet the same node name.

> ---
> Changes in v2:
> - reword commit msg
> - split errata changes into separate patch
>
>  arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
> index 3d5cd0561362..541297052b62 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
> +++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
> @@ -77,7 +77,7 @@ MX93_PAD_SD2_CD_B__GPIO3_IO00		0x31e
>
>  	pinctrl_usdhc2_default: usdhc2grp {
>  		fsl,pins = <
> -			MX93_PAD_SD2_CLK__USDHC2_CLK		0x179e
> +			MX93_PAD_SD2_CLK__USDHC2_CLK		0x159e
>  			MX93_PAD_SD2_CMD__USDHC2_CMD		0x139e
>  			MX93_PAD_SD2_DATA0__USDHC2_DATA0	0x138e
>  			MX93_PAD_SD2_DATA1__USDHC2_DATA1	0x138e
> @@ -87,9 +87,9 @@ MX93_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
>  		>;
>  	};
>
> -	pinctrl_usdhc2_100mhz: usdhc2grp {
> +	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
>  		fsl,pins = <
> -			MX93_PAD_SD2_CLK__USDHC2_CLK            0x179e
> +			MX93_PAD_SD2_CLK__USDHC2_CLK		0x159e
>  			MX93_PAD_SD2_CMD__USDHC2_CMD            0x139e
>  			MX93_PAD_SD2_DATA0__USDHC2_DATA0        0x138e
>  			MX93_PAD_SD2_DATA1__USDHC2_DATA1        0x138e
> @@ -99,9 +99,9 @@ MX93_PAD_SD2_VSELECT__USDHC2_VSELECT    0x51e
>  		>;
>  	};
>
> -	pinctrl_usdhc2_200mhz: usdhc2grp {
> +	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
>  		fsl,pins = <
> -			MX93_PAD_SD2_CLK__USDHC2_CLK            0x178e
> +			MX93_PAD_SD2_CLK__USDHC2_CLK		0x158e
>  			MX93_PAD_SD2_CMD__USDHC2_CMD            0x139e
>  			MX93_PAD_SD2_DATA0__USDHC2_DATA0        0x139e
>  			MX93_PAD_SD2_DATA1__USDHC2_DATA1        0x139e
> --
> 2.34.1
>

