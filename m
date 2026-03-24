Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B989CF54AD2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 16:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PH+QdQ5X/s1HvH64Wge9K0LYCBIGz2gLfp7KL/4tttQ=; b=sJrsOb4Xn/wdbmagRXOS9rDtQP
	c4OjOSTULV6h9Hv55FZGPQF7BguID/ONdQCYRvvtkcXFFZsOH+ZKf0Lmk7RlHfKwA3GfPMlT0WGCu
	HnoQwGEj1noOaLhyPEnJOKYURPk/ZYQPZ5gXGhSl7We9DcKs5ga3r1ngYiJ3WZqG0SrLDDvtVt7Yk
	98xe/hQd46l+yfdwCr3lZqSyRCekTJFGeTqd6Vfb0sd+5VvU1bTXWPsv5B1DlTQUmix03/sZ2Skxi
	bROBCJsIGwPpRgAn05wy/V4RC4XYDw3gDPnmpg71+WyJ3Ldde26NxGKbRFFntmGQJ9UnHftiNtcst
	JvoWAtBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w54CY-00000001nq7-2Dly;
	Tue, 24 Mar 2026 16:01:54 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w54CW-00000001npi-1mis
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 16:01:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gd9WYnkmRZ/N5AP4RGdd+8n9TB+1lHzNFwoKA6ecOqQoWotctuV29/tL6L73rEMyutKKlNVsxmpF8dNKzn2058va0xUvpEYR7YMO7xRLSMaJ9oWyWd/baEd/ajITII2z5PS1hdsdht/tvQAiExRdY3IzPs+z0JIcWR6bNW62Rawl+8syMEMUljKb8syCHDvrwxe4Qz4+VF/tAX8kvIeVDFmFZiGZreOELeQX0RDhatyEp4fp5PxkI2H2nqptPVgX+fi6NWyzO0rrzAM4iI/Ck6Quvzd+4iUKvN+C5rLDp/LdZsVFdvQ0iBktqD/WXPDoFnNUtaGCWSdsmfH9eHHQaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PH+QdQ5X/s1HvH64Wge9K0LYCBIGz2gLfp7KL/4tttQ=;
 b=AwNAitA/LrnqCn8nBN8CeSk3l7c+F1SyqG/DRh6nojnSqbX0AG96RFJPNMnN+3I4bTGw0bc0NBt5Y7T3mfX1Hha5xTEty78R91sI0K/Nrv11kKtO+iSB1jUcbqnCKYBhX02njnubk4fk67t30JJ5b6KM28G+/W13lr7E8AB4Kq+jkudI/n0NmeQEsY9uJ4pUdE1jLCJZiM3eF+rotDUMvSLmBna6wLTV9fbjKWSHbFPkX36DP8Iw8v+gm6UdZKzuve787oLMTRtyYu5N26PHhjRa0SWNeZLzgLhgQFngFGI7T8I8lhIuqh3qOWFW63DvrvQBPj87/5mnXO0U8a+nkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PH+QdQ5X/s1HvH64Wge9K0LYCBIGz2gLfp7KL/4tttQ=;
 b=DcL1U4lpRnYHZT3gSHCxNa2sM8BJnvGKVmPnhi14YmSiGEKnzUpvydEz73x5+mZZ9aPJ2qwE+9RLV/FwxPKzeDmnFWi+KFquQqhT6YnEeM4319LZxpWBSiFH+ZY3uEvMxcEWrkz3/Kjoy8fV60IUgX5LKV4foyZ/H0UMYz6xmJoCqusC+7l6jNt4prlcRAU4BCu6cUfZdsRP6RR+Ok/SbWImZnCtUoET9VuH0hXD/wDR0Pp/svdFtif5G/Xo2lsLhKr7EegeMf1S1fCuzKC0/1YyhzmUSuEJThixypoFUzAS+H6nF1sTnUtJ/L5Qk+4GI1ZangxIollXKpuXo8aM7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GV2PR04MB11561.eurprd04.prod.outlook.com (2603:10a6:150:2cb::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 16:01:16 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 16:01:37 +0000
Date: Tue, 24 Mar 2026 12:01:37 -0400
From: Frank Li <Frank.li@nxp.com>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Christoph Niedermaier <cniedermaier@dh-electronics.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, kernel@dh-electronics.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: imx8mp: Add DT overlays for DH i.MX8M Plus
 DHCOM SoM and boards
Message-ID: <acK1YU6M5FGK3qM2@lizhi-Precision-Tower-5810>
References: <20260312232500.197096-1-marex@nabladev.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312232500.197096-1-marex@nabladev.com>
X-ClientProxiedBy: SJ0PR03CA0077.namprd03.prod.outlook.com
 (2603:10b6:a03:331::22) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GV2PR04MB11561:EE_
X-MS-Office365-Filtering-Correlation-Id: b290f036-745f-4b4e-2482-08de89bea12b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|376014|52116014|7416014|366016|38350700014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: ITRS42qgbgw4/jSbqJDjjoocgMFbFKy2RgGVLwsCXNBHIBfTMnbQwRdmBQGKYPlsIXXyEALMysEehY/fG9pUBNmVCNoCU+I5u0WqGDmzWvsQr2yDKFS1QrvTmxGVWvHdJofXLk0IsgucwidI79nwk84sGVB/AlpBwh9+voTsdaqxOX7UCkCUout2AmcdgHlJwOWKLN/WCxCo6jdF6N+Mq2lM5J/WLw/Bl7YQjErMhpd+YbAkirj5tkhkdel8+SIrJqJYjVOyA7Z/1zs8VylcZNd+17jqABrpWmK5CTFpjanPSInw3Fccu4a0Cqya7n/c81esdSL000cvDwparycOxxsjm9Yyrf9B8UFqwtz5SUFR3loNpHKXfG0ZPYilWYOnp8s6NPrhN/dEbXKOiVyJq5sKpl+ooPOVMDU/MH2fk+3objL7VqdTOB5yeImkYewRRT2CpnELoT+V94AjXOAogvrnQ92C/kVfKJYNEBdhIul6lqI8hwSH5xWcr61fjHgzDhmuL+ZDsWkPmuiYL7EHRVDYtnBF0yM7Om1NUxzc29TuGabdLVlftZmKRQ729ku7hfhJ4cMXOAURSgBmm1b36vO8xzib5jS7bfz6l7Y/6Rtfc1UqSH2seufyBVXlMlCvK/GJHqiOFAsjvMM4wOsvJ6CUENZyG0l+bVVm+7FNr2Lngz+P2RN05HshfWBNkbJVBHnrNX1XRSYLYzqyYDuB+50XAnGqFdeeZOWRn5RNydxQgjglKP9a+JvwMaSatOFTJxW5OXk9d2/5Xc+1eLm7lsMDcLS/RuZ351iIPup0uq4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(52116014)(7416014)(366016)(38350700014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7Cp92PZa9rrE70/JUk8elyjtuM9V1ok3YOav9Y0jCmG1h5iiVKULl+iT8/53?=
 =?us-ascii?Q?snWDMh9n7YE5+Z9ad8LorjYRXGqiR19O5KZBXyEjTlnTgrTXHWV56ilAQuRu?=
 =?us-ascii?Q?jZy+0xh6ie28W1VTykyI3E1eVXYPRLCXZfmI43SQNITZfBUYjthzi4+X2CCq?=
 =?us-ascii?Q?QEskEUdcEH/bC9HLed4kkP3OT3/kmVvxYPFL+7z2HpMw+PXRE9taE4hHsq2v?=
 =?us-ascii?Q?a51goSBWpteYJIvUul4INpv3FyyoKJZvcGlrUEYJlEXDIWH/0kcKhDfwTPl9?=
 =?us-ascii?Q?QJIaCKmWsYr5NoIwDTsSuJFCkD4ZcM2yG2UPzYxEnXbdwCBpfB7QQf2G1wKu?=
 =?us-ascii?Q?08BHXhOVaOxt8cAUca+SCBAI0Rh6QYFv5+feWYLHxtD8Vna6EsoNVq+UuJmd?=
 =?us-ascii?Q?GYq3KdavShBsjpocg29UIRhvezDjFPFs7U/rTh9beZyd1F1IbzX/IaIriJjR?=
 =?us-ascii?Q?7slB9Wh9mLfQG8f5eUVVbUQONDubEJJDx5x5rS6zgjJTsAAUeIPhQM+46BHN?=
 =?us-ascii?Q?mE6d1UQdLH78UYQEhlBNsIjxxS2HYarepS8jQbEthPZXZMTm8bRPKTVjVHhF?=
 =?us-ascii?Q?CijpFVoYNX9VS2eZgfFhvnX5/E2Sv5+bean1SvRHdt8wJQNoq7GreApFkRdh?=
 =?us-ascii?Q?xE8Z1oB12JC1wrIyjFC/0vfUXe/ZZzIcnOeYHYS7XxpPm+tJnf40OZfMF0Q9?=
 =?us-ascii?Q?1uXt5qF4fpUzirsAYWK5hJ1XLQEXTxP+HMvdq1mqUy8ZZcN15185lyneOsHt?=
 =?us-ascii?Q?SOXrpPKMNPv7NI/tA02Z1uIdOZHTrfGpyXnKZTye3qWmg4V1Ih7NSIff7wt1?=
 =?us-ascii?Q?bDSXOaeLdt7TykEyZjTCy85Pp7JhsyQtvkNxi0TuIemPpMvPsAxphCHgKg/j?=
 =?us-ascii?Q?DT3eqcsVaixBx89D/wkqbRW6fuIyQu+8CC9afKm1DyPJz/TQlXjCpQ9OtwcN?=
 =?us-ascii?Q?5Srg9sStMO8/K2vuAMJM3SzxPP5eAROcxICCQDnY7Pth53/cR48LRUsaG+7P?=
 =?us-ascii?Q?x2kBY0O9HxpuRDGIa2E+zzOvZ1ZBN951Nf5MxQWmfI4wYw8XFXXSflOxt5Sn?=
 =?us-ascii?Q?WBfdSWR9e9mqfOjtf7eY9na4dvfv6kA9DoqJt0XeLcObI4nqAtb/12gU/CJ8?=
 =?us-ascii?Q?7ZDN8MYjpPuurJehidYrvp00H8L4c6ecKzas5W7saXelz2InU/ynX90MVarw?=
 =?us-ascii?Q?psS4KOvYNrb/Gx7KqTaxMlPknUlsarctvVhht/in40Kh0b7QPjubJtCsXax3?=
 =?us-ascii?Q?zuoxvn2qYhzRov57mNuyh0Dwuvgbz1AlKtzfceC4Z3qcwTkt2C6tjQE/dUkd?=
 =?us-ascii?Q?m7vQ4HOhqBCwv5zjXT70N9O+ZxhTK+LBnfCRnftcp2ldLnRyFdRluLOPpNRH?=
 =?us-ascii?Q?xMgapvlQV+sJNXbZEfPOSlQHdV01NiHnrWXCVBgUNtwsT37bI7YmVqrsYyLl?=
 =?us-ascii?Q?slTbYdaYos0STMeyKuVgLN61oXiPUxMroljSiLJdiY+ud5oSstenzrRrpzuc?=
 =?us-ascii?Q?p+8sdrYRsYNf+fE2Pp5C6RAazsoZ9HBZGjIy9LBVroGFKbXAMD0N4xxFUn22?=
 =?us-ascii?Q?XjcdJ63E08q1RPP/Nt6C0a7Wa0qyLx2ee/sflTMpeTvOhayI0SOb3G+zDnIO?=
 =?us-ascii?Q?Tdqnqbhqnl6hDNjn7iAwpTpQsHJvGghv11agvNdwYSpcOV1P/sX/cIpvGQkj?=
 =?us-ascii?Q?yueXFqEgJ+5gPTFhIsNT/ilCEBFL58JPkE42DzsdaXOJ1Ina?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b290f036-745f-4b4e-2482-08de89bea12b
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 16:01:37.7068
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T/a0MUmspiiQEkfXctctfDNhgQEt1J30WJ5hFjuPktsxW/CIA9Y4oiG97EPfk+V05HfxQrHjncLePCHVhJFWbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11561
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_090152_464474_46328E91 
X-CRM114-Status: GOOD (  15.10  )
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

On Fri, Mar 13, 2026 at 12:24:04AM +0100, Marek Vasut wrote:
...

> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-dhcom-overlay-panel-ch101olhlwh.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-overlay-panel-ch101olhlwh.dtsi
> new file mode 100644
> index 0000000000000..534737363c9f0
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-overlay-panel-ch101olhlwh.dtsi
> @@ -0,0 +1,42 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (C) 2022 Marek Vasut

2026?

> + */
> +
> +&display_bl {
> +	pwms = <&pwm1 0 5000000 0>;
> +};
> +
> +&DH_OVERLAY_PANEL_I2C_BUS {

why upcase for label, generally it should be lower case

> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	touchscreen@41 {
> +		compatible = "ilitek,ili251x";
> +		pinctrl-0 = <DH_OVERLAY_PANEL_I2C_TOUCHSCREEN_PINCTRL>;
> +		pinctrl-names = "default";
> +		reg = <0x41>;

reg should second property,  please dt-format for new dts files.
check others

> +		interrupt-parent = <&DH_OVERLAY_PANEL_I2C_TOUCHSCREEN_IRQ_PARENT>;
...
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		port@1 {
> +			reg = <1>;

need empty line between child node and property.

> +	#size-cells = <0>;
> +
> +	eeprom@56 {
> +		compatible = "atmel,24c04";
> +		reg = <0x56>;
> +		pagesize = <16>;
> +	};
> +};
> +
> +&ecspi2 {
> +	status = "okay";

status should be last property. I stop here because these
should be identify by tools/script

Frank


