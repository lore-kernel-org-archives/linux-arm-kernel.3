Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0AE6E77198
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 19:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uaj0EGjRmdhgaEUeMcWy4M2jJlBET2Z9pjQGcsiElfQ=; b=YZsegkyyhLif8beoWpWjV+qREA
	8EcWHJ2vO/SduUxz3XpwY1xR8JXO0CLNx26TxPvjJMAbG4ssgV9X3XS2+zwxz5PDDVVDFbl+DQuLS
	CksBxdM6bMFrAKu2MHjmfQx37b9u9MK3Fkei2LiQQTB3GXYz4KTRsPNUGj6vMaPdRsRipAArms/0k
	8lZmchqNiH7T29lxILii0aRorbXcstWwmZIM6b7yFN22Lw2AxdfesSAwTZ8dwQc1hvwTzRBDe07my
	HaIXlBa4WLLdU9nEOS+TvTysbnlHjJVREh7R4B+BwsNMaG0lU+bU+QyKBKE0Pro+XtDu8nXfsihuJ
	qx+7GebQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUsqj-00000002SYD-082R;
	Mon, 06 Jan 2025 19:33:17 +0000
Received: from mail-am6eur05on20604.outbound.protection.outlook.com ([2a01:111:f403:2612::604] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUspX-00000002SGP-093f
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 19:32:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bfchm4ZbAAUWTg9mWb0KWMEQ7JiZj3XpA8jQetk40qE9ovXe66yFD+92pXm3bs5VGWaKjidj4b8g8IycO0wvnw2nuVwr3HifKJZZguJuek3UJNgTxAp/S8mIy/gb4Xm8kEaVEuP3e7eTP5HlNA/7GW8OS2pGGvWNEMUpPFgoOejUSLTt4IIGXftBTJYQiWoJKQ7VHi504hSjOsBdoaBW7A7pCOhGbkZ3CmcET8kyZOYXjoiCKtMCjJ8CL58z1VKdz+hFVwsmIZjjaOJnd+eZ1ibKmeRvV33KzoXRFa+wedGMXZ21+XOW4z6Ym5TY0xfLG7OTgZtr7/yrKWkDkjLTpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uaj0EGjRmdhgaEUeMcWy4M2jJlBET2Z9pjQGcsiElfQ=;
 b=JTDNa4bxvaDXHLbrlrVGmZ8t0VwjBw5lCJFW9diYWEHraw37W4IyJygeCFUYDvfujKb3dVA7I8dFOAzm1XjyDiwLGCaZ2rbTzpR6tuaqsgOU8/FZrKgoo7iy8XfVtJ1vDpjkivkM8QIRkP9EtkmLzGoAHz1HQFjgKQgJmZeM201C0WhHBVcKtGs3RlADtzIKMi2deXiadcJVWL/3kHx8UVuVybZaNk8MI9in4Dv0of/uJRVhNiW28gZ/q2fl6rArqcnSDLhks6hGsOGphYPZEoLE0KtuXjfqHvyZePpcNZpLMVEW1xzvgrUGVZtPauwpZGphzSOF//DCl0E2D1wwmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uaj0EGjRmdhgaEUeMcWy4M2jJlBET2Z9pjQGcsiElfQ=;
 b=MlgBtYBCUec2M7ORB/KUW2G9jX3drKeBkcySqMC8hqO9UmdWPT8zkfyRfrTGipXShc1X7x1JBABBcaJl9Sh8+0/ueRn2U9j9zstaPaBzUp9xC47XD5joYId0mAw0N0/2Od6KJHaLu/CubVVqWUQtODghA+yfToM9pUl9j0sSpEl5luxsIpXV8j+jXmLKR2Ae1pk6nvStXd7TK0HtO1k2GdVbLaJsW91oIhmOg77ZSUhxdDPn86vXRa8Bq33E/fPf+0DjdB1PVFk8WM63z1T0ynVbEZnI7rQnZUOKyQoaJ+C3AYEESpIjRmWuYPPQHVFMq7J4OTm+tWt1Hdo1tuos/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM9PR04MB7651.eurprd04.prod.outlook.com (2603:10a6:20b:280::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.18; Mon, 6 Jan
 2025 19:31:59 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8314.015; Mon, 6 Jan 2025
 19:31:59 +0000
Date: Mon, 6 Jan 2025 14:31:52 -0500
From: Frank Li <Frank.li@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/1] arm64: dts: imx8qm-mek: add audio-codec cs42888
 and related nodes
Message-ID: <Z3wvqEupL6TxCqct@lizhi-Precision-Tower-5810>
References: <20241029152614.2065950-1-Frank.Li@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241029152614.2065950-1-Frank.Li@nxp.com>
X-ClientProxiedBy: SJ0PR13CA0230.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::25) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM9PR04MB7651:EE_
X-MS-Office365-Filtering-Correlation-Id: 3212d27a-e9a8-400d-24ac-08dd2e88c9df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vgquahXBbt/auJmlgmDJTPJWXzwLx11ywC4JrQw/kAx5c3tR5iDGCzQtdUDV?=
 =?us-ascii?Q?mlYMNYsl8hUpMjQhEL3aSh/NmPDeko6RelnR9yw5/qqOtUgKFwfRgSOoeIxq?=
 =?us-ascii?Q?WApv7AQxeEN7tlbBuZqSoZohQBelww6FE45u8s4QLE0f+Mon2FKAe/oGWdL9?=
 =?us-ascii?Q?UjrIVG/TkbJYoakUUC8de0amArW16T8lq/bhrT5Fd940UM5Qbu+kK+Drypoj?=
 =?us-ascii?Q?BcNn3fzcAaZ5/fVfvJ/XN2dHZmeR3ZoWtoJroCjrfmSo58Y5CUiVGPYBlIYN?=
 =?us-ascii?Q?HPRLcxfh22i2XwyUOijH3xXJHFrcd1DS6OQwGRzi/OUmRvGDQfNF9rQpc/k/?=
 =?us-ascii?Q?dQpV7xTMuBH6fxiK2fvjaPNWuwLTvIvEZndQJ2aMNTBjWpZRi5onHZ0/VaTL?=
 =?us-ascii?Q?z6+PXbyH2HrW5wJtg/czsVIyQmDhZ9Me9avOjHsHFEtLfIWBtnUU1zuGgd16?=
 =?us-ascii?Q?lzr5Z/SZPe9Qwpy3SM9E2WV1TPD2isUYrcrS2vp7kLKH3W4o1m2NuXohGmkj?=
 =?us-ascii?Q?EOXsshbYhOoKmEa5J8OW5AgBlkcjjzcSnlNYw44Xgp6v7g+ovu9RXDZmK/zl?=
 =?us-ascii?Q?YM4CqdRwXMXyH6wZANhg2V4S8r1jiQWAjjgpUIHVWxf2j89NofZdrJpV4fQl?=
 =?us-ascii?Q?VGoaO1TMqSKUFuQ82MDpst2kkgJ0mo8nzxNmt74Kp4yvUMGeFYuHCIY3yCNV?=
 =?us-ascii?Q?GP9IvE7SDAfgizWp21GcQJMgBu6gKiRT1tKl8FQsrHtcEpVV4d7St94ximy1?=
 =?us-ascii?Q?I43zIP9jgg6MwJUif89C5S4fpfgZIqhfDQjSuJDQV8SHGGi6d9cQ/P68GE4C?=
 =?us-ascii?Q?XFnnd2cEZ2InzW79CuqIkjQAPr7cckpborIRG83KwLpGN4T4Ac7p2dgzJV7q?=
 =?us-ascii?Q?BWjcEimbKLBPbnh+odBkNaEacSQj1CDNI9lMmO4IGB/SqCEI8kDY3su0sk3o?=
 =?us-ascii?Q?V6e0WCqtzdknKq01MViTcnc3ukRV7M9pvxIwECVk2n1wja61mZIXTbLMRG+H?=
 =?us-ascii?Q?Tm333UPxcYrleuBOg/8U0UD/ZiJfO/LHUfGPe43VZC7JVqhXvkf8/jR5vKSN?=
 =?us-ascii?Q?q2rpa+fiSZTCTjBqcswQbnL0gUj5aZiHFXbyCxWJIHTwbIQYMt+thcNOoRRC?=
 =?us-ascii?Q?cUyHn28pcAetdnemimglT4ElMQqMQzDLuEbglicN3e2aEo5F9ujF8yYvP0MK?=
 =?us-ascii?Q?Ijc2ZfNj3T8ej2h9HaZBay4vyNKEB/40kVhtth9CuTcD5kKwO319rKvazbD9?=
 =?us-ascii?Q?PKsHk+59oUSl75m/zKIfie/FDuZgom2iHsLVK2gCd+2HRloVI3enTd7ypQ04?=
 =?us-ascii?Q?V2A+seG8xUW+6bhpvrSpIf/xX13XpjdThfXXmzrV4tCB3E6xWv/xUGZ97sfc?=
 =?us-ascii?Q?yr4uHIxPDpZonvzrV85Z/DHN+huGySgwIj1XOfiL19Q//9GWmSFKp/eM7m6n?=
 =?us-ascii?Q?lpdgpfnDwVtlESBP9TIo/d0rwjW36qLuav5POwoQYeXqdjf5jMaw0w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KtYYvmS4OyBzNCvauDhWsOQ3SLflQ7P2vp7pj030FwCYLL7SsTBw2k1gsDGH?=
 =?us-ascii?Q?19ubAcHIyBhvEZ9F1Oh5rA6VKuuULxAvgxuq3fYi8fiFD01kjH1fixML5nsc?=
 =?us-ascii?Q?v7RuP0zYh/P4mF8N+P5npgo9ebkMp1qPAyq/QhYuM7rHa79IhVD4395zjXSj?=
 =?us-ascii?Q?cYiAqxf4icsrr4dqn3DB0uAHOCw+GjwYt9ki05rVQx/sHz8S3RoXTJqJzKKs?=
 =?us-ascii?Q?5eG9WmQRZ6PCTJgYWLMB09ge8wOYXs5iF0u0+9m5yWOehD4I7byWbn4BUW4a?=
 =?us-ascii?Q?Ni1qie0pkwK3G9jndmuQieen/mLidB/vK1bJgYqIuHrgKA1uVYn0/lJkrtuC?=
 =?us-ascii?Q?AphGZbyHgmzCD9KCMi/5bJJxbmIsibuv/o8OpInphz3m47WgjTV0qgPoSGwN?=
 =?us-ascii?Q?jfp7e8nwKrgB6WwPEd9Wx9xAuq4eWrn8iId6+fCWVC8CKujlKIajqE8HAWny?=
 =?us-ascii?Q?yfOVHzK1O167RrS52udQ8+NpbONdlgHOscfC/qw1aZpYV4WM6mnBYjkHrw1x?=
 =?us-ascii?Q?90DEe86ALMnLAuWEygSOnSown8NCGA3tvccXtRyFi0SXMmod+9DxGEBqqEcq?=
 =?us-ascii?Q?Ul6Y80aP323I9fy3vkPjAnLt+BNuhg+aDuC25qPUxMyrcFM4clHvdKgy08Ym?=
 =?us-ascii?Q?AH1h0S0+Swf5CLLJnNsX0yGLWknQWqYl/OtQPuosTUKJ+9Neqez4vwtDh9XV?=
 =?us-ascii?Q?WW10LU3GDjT4TGx5r3Mq7y9wBnfIikC9ilrIGodKm2l40h371cokufGfDEoi?=
 =?us-ascii?Q?AKtReVeimCUwt/2j0HWj4BBb3w9OGk9nYMBb/OGqFGso5XRRn0E1iQBYMDYS?=
 =?us-ascii?Q?4bSwfB7MS7/zIQ3qqFn2a92H9yqkzQKoaAvPQFVu8jEwgliBTyYR3FlZB5n2?=
 =?us-ascii?Q?KYfkD+HMr/YEJN0mhO47Mt+bySzrymsPvLO+QZG8cAjVd5iyGh3qDTlE2IhK?=
 =?us-ascii?Q?GxybN5lPmNgOZ9xR2V3Hl9TZ4XPvrsig9WUFPLN+kFUfBeNeMXw8xw/i3MzQ?=
 =?us-ascii?Q?pJFsToelViRM+nAzWrZAJ9A/h/3zNlLQ7yIs5u9FvoTvWDwRhzUuDNFfQv1b?=
 =?us-ascii?Q?CmXu06ztZZeFRcm81qEmNDv2/Xq0+CS8nrWKLARhg8yVfxAMCqC2zqht+xYD?=
 =?us-ascii?Q?3JoJ8HUqvMvddxiVjVOmLy1i8Ets9sNpTN3D0IUr5Od11R1BazGAyDtAjC4T?=
 =?us-ascii?Q?HO83nKJNRSAr7BIwro1hAUsbpgZ1VZfQuLDviEW6tMziK9lOO4utQHThFLzK?=
 =?us-ascii?Q?UTMWJ4xEFFKFtRSj2WA6s1E2jxzMsZd4h7Mqh2oZWwIhuBTCep8H4qFkXXqR?=
 =?us-ascii?Q?QwH2aHjIcwhEToeJr8wriD3wgJ5gJbo2+3aTg5pD8q/6EHWbXxxeTGUq3z3D?=
 =?us-ascii?Q?9Y9qrYs5NH2W8XWxBqekAgPaLm/2kk1pX+w6i7ovOq4Wrd/CRAyRKUk2Gq6d?=
 =?us-ascii?Q?PqBP2rdtvP/HMtIh6K0mhZoXDzm14A5gw9D5/cD/4F2kcyb51YifFuayuKZb?=
 =?us-ascii?Q?EiefzShCQNv4eXNLqgp4A+wJneSeDDwI0uJRGUaxo71Wa/IqOcChD4KR2lGr?=
 =?us-ascii?Q?B8AM70S1oNWjtqsyn2/mNhXUtMqaTvuIE0chAirq?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3212d27a-e9a8-400d-24ac-08dd2e88c9df
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2025 19:31:59.4940
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aND43P0LCujBeF3/dpTiNzqYcd6L9j+aNRj8/bpEQC3Cs39Z+nS9noMRBzr1aV0MUzl6C57LbiBRCGMyFaVpsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7651
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_113203_079542_57380DDB 
X-CRM114-Status: GOOD (  15.99  )
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

On Tue, Oct 29, 2024 at 11:26:13AM -0400, Frank Li wrote:
> Add audio-codec cs42888, enable esai0 and asrc0.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Shawn:
	Any comments for this patch?

Frank Li

> ---
> Change from v1 to v2
> - remove unnecessary status=okay
> ---
>  arch/arm64/boot/dts/freescale/imx8qm-mek.dts | 80 ++++++++++++++++++++
>  1 file changed, 80 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
> index e983633a4bb31..e3275b276a7cc 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
> @@ -134,6 +134,13 @@ reg_usdhc2_vmmc: usdhc2-vmmc {
>  		enable-active-high;
>  	};
>
> +	reg_audio: regulator-audio {
> +		compatible = "regulator-fixed";
> +		regulator-name = "cs42888_supply";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +	};
> +
>  	reg_fec2_supply: regulator-fec2-nvcc {
>  		compatible = "regulator-fixed";
>  		regulator-name = "fec2_nvcc";
> @@ -223,6 +230,26 @@ simple-audio-card,codec {
>  		};
>  	};
>
> +	sound-cs42888 {
> +		compatible = "fsl,imx-audio-cs42888";
> +		model = "imx-cs42888";
> +		audio-cpu = <&esai0>;
> +		audio-codec = <&cs42888>;
> +		audio-asrc = <&asrc0>;
> +		audio-routing = "Line Out Jack", "AOUT1L",
> +				"Line Out Jack", "AOUT1R",
> +				"Line Out Jack", "AOUT2L",
> +				"Line Out Jack", "AOUT2R",
> +				"Line Out Jack", "AOUT3L",
> +				"Line Out Jack", "AOUT3R",
> +				"Line Out Jack", "AOUT4L",
> +				"Line Out Jack", "AOUT4R",
> +				"AIN1L", "Line In Jack",
> +				"AIN1R", "Line In Jack",
> +				"AIN2L", "Line In Jack",
> +				"AIN2R", "Line In Jack";
> +	};
> +
>  	sound-wm8960 {
>  		compatible = "fsl,imx-audio-wm8960";
>  		model = "wm8960-audio";
> @@ -301,12 +328,44 @@ pca6416: gpio@20 {
>  		gpio-controller;
>  		#gpio-cells = <2>;
>  	};
> +
> +	cs42888: audio-codec@48 {
> +		compatible = "cirrus,cs42888";
> +		reg = <0x48>;
> +		clocks = <&mclkout0_lpcg IMX_LPCG_CLK_0>;
> +		clock-names = "mclk";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_cs42888_reset>;
> +		VA-supply = <&reg_audio>;
> +		VD-supply = <&reg_audio>;
> +		VLS-supply = <&reg_audio>;
> +		VLC-supply = <&reg_audio>;
> +		reset-gpios = <&lsio_gpio4 25 GPIO_ACTIVE_LOW>;
> +		assigned-clocks = <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_PLL>,
> +				  <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_SLV_BUS>,
> +				  <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_MST_BUS>,
> +				  <&mclkout0_lpcg IMX_LPCG_CLK_0>;
> +		assigned-clock-rates = <786432000>, <49152000>, <12288000>, <12288000>;
> +	};
>  };
>
>  &cm41_intmux {
>  	status = "okay";
>  };
>
> +&esai0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_esai0>;
> +	assigned-clocks = <&acm IMX_ADMA_ACM_ESAI0_MCLK_SEL>,
> +			  <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_PLL>,
> +			  <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_SLV_BUS>,
> +			  <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_MST_BUS>,
> +			  <&esai0_lpcg IMX_LPCG_CLK_4>;
> +	assigned-clock-parents = <&aud_pll_div0_lpcg IMX_LPCG_CLK_0>;
> +	assigned-clock-rates = <0>, <786432000>, <49152000>, <12288000>, <49152000>;
> +	status = "okay";
> +};
> +
>  &hsio_phy {
>  	fsl,hsio-cfg = "pciea-pcieb-sata";
>  	fsl,refclk-pad-mode = "input";
> @@ -691,6 +750,12 @@ IMX8QM_SCU_GPIO0_03_LSIO_GPIO0_IO31			0x0600004c
>  		>;
>  	};
>
> +	pinctrl_cs42888_reset: cs42888_resetgrp {
> +		fsl,pins = <
> +			IMX8QM_QSPI1A_DATA1_LSIO_GPIO4_IO25			0x0600004c
> +		>;
> +	};
> +
>  	pinctrl_i2c0: i2c0grp {
>  		fsl,pins = <
>  			IMX8QM_HDMI_TX0_TS_SCL_DMA_I2C0_SCL			0x06000021
> @@ -725,6 +790,21 @@ IMX8QM_M41_I2C0_SCL_M41_I2C0_SCL			0x0600004c
>  		>;
>  	};
>
> +	pinctrl_esai0: esai0grp {
> +		fsl,pins = <
> +			IMX8QM_ESAI0_FSR_AUD_ESAI0_FSR				0xc6000040
> +			IMX8QM_ESAI0_FST_AUD_ESAI0_FST				0xc6000040
> +			IMX8QM_ESAI0_SCKR_AUD_ESAI0_SCKR			0xc6000040
> +			IMX8QM_ESAI0_SCKT_AUD_ESAI0_SCKT			0xc6000040
> +			IMX8QM_ESAI0_TX0_AUD_ESAI0_TX0				0xc6000040
> +			IMX8QM_ESAI0_TX1_AUD_ESAI0_TX1				0xc6000040
> +			IMX8QM_ESAI0_TX2_RX3_AUD_ESAI0_TX2_RX3			0xc6000040
> +			IMX8QM_ESAI0_TX3_RX2_AUD_ESAI0_TX3_RX2			0xc6000040
> +			IMX8QM_ESAI0_TX4_RX1_AUD_ESAI0_TX4_RX1			0xc6000040
> +			IMX8QM_ESAI0_TX5_RX0_AUD_ESAI0_TX5_RX0			0xc6000040
> +		>;
> +	};
> +
>  	pinctrl_fec1: fec1grp {
>  		fsl,pins = <
>  			IMX8QM_ENET0_MDC_CONN_ENET0_MDC				0x06000020
> --
> 2.34.1
>

