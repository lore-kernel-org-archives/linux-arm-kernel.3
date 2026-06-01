Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9966CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 19:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iEFe66ymmXtzozfcym/CosKjcarBjta4ZTQHTcS6bpM=; b=P+2k/bvDZS6379SGyiziO/oOVZ
	qKxZbyj/oKHOQOymVhWkOeLxwZBtlSVPu2iWNSGRHyF6oEA+eunm+6LZiONxVyPtJPDtPL43CJHEd
	UP4yfEiKADziY7C7mCUjMJ79bp1x5ZHhploJW/YWymW7VZ/1ntFcdWKzol4GszQ6xmHmnNY+c8Pgk
	icgEAAMHulhdhLHL3dX4Ab7d4D9fZM6zvRd7u6aSZg53ALWqzDU8rErBMMJ1xExPhbV4qOR75fxQj
	UOLqKKqQIBOqOJKc7Aha7+vLVBqUooDj3uHIEv1ZEYpMHdEstPh6xZqkigby/pESVlGZc+m9gI3Ga
	VlaWM3Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU8aM-0000000BjXD-071Y;
	Mon, 01 Jun 2026 19:46:06 +0000
Received: from mail-francesouthazon11011068.outbound.protection.outlook.com ([40.107.130.68] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU8aI-0000000BjWn-1aQa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 19:46:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=riqNzDUJX0FXRjo+gVz1zs+VsMJiAk4QgxUwkEgyuJ1CaH1kdIhIhBsfXJi2jh6ugGAflGfnnBfGG+o3U/BhzB7UsoBwJ7bRjAulUcq64htfqPmHqvtMtywMlig54lHwkAisQQzGxlQmUd7e/llb/H+A0AlOq7yjvtm6VF9bblV1KOhtiVLNNhCCbqB9B8OyBZC06lKL8wVcsYQ3zbQNGegf/okSrYdItLRxo7J8BEgI3hJ0ET86u9yVwpzPklRFpB4t89+LS0rRd0EEwlgvL6n0AJGvgVzSnjRrSa4ET5nNowgeM755Tzk0dilBhSqn9w7MsthZfXmL2CobB9iM4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pziB3S+jxlD6fgT4p6QvOy0HcwfoyRKEj/hRx9x/MFw=;
 b=hu6KZJNNYlqVR7vZxXB+oFWDKCv5wyhv/OpnQ5DTESLg7EX1vFyrzdyJ0DuPUcC+WUmed1PORgn1ITUB3vIzBUYbWksPVq789Z+302hEv8bIedofkTN5nHXyi4drfs+H7kov6ZSnEL6tmVZjEG69CKD23TkTng+8/htD4phxWzq1SyhihM9GftWpqHVJSgUHCoHTCKbIei4eo8GiM48S7vzqTUlBSFkUnoCDg1khZ0Ga2YnQRfQ/J0WcGwcQqI3dMwt8kopNo591yqDdtTUlyAnfC4IAI0rQUNMARoVlQDxG9sb+Dm7bn8Yc8DRrDt17hyHqfJnJcD6GAwHxW2clRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pziB3S+jxlD6fgT4p6QvOy0HcwfoyRKEj/hRx9x/MFw=;
 b=LIGvjE0G6k2UqAIeUYnUPlXcRwGiEmLqsE7AYvcc3I4G+ry9lpHCfvxAiVl54wUntm0J/PBytcfYb0b7y5J5kjTuLRTvIri9OUtOeLBSurxWa0CLEJ0hkj0MLA0jh/K1xMKJkEw/pfzSM44kVWI0aXuAf8knatRMbeLtnQLGOW7vEWEBj9ZmYvmIV55qNk5TUMLTnn7nGEl6EGNAD0woPiNzLrLJjKXj3PeXwMaSvwwsA0KGk0InPwPQ7Msd1vcdEZv8l4tlJg8QkO+Db7DwHleyMpjHV6qdI3qcuoi/p7hdFgh+ZmYRGmU7EFXGYAIcuJKkpSbZgk2wUCPArgNj6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PR3PR04MB7241.eurprd04.prod.outlook.com (2603:10a6:102:92::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Mon, 1 Jun 2026
 19:45:58 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0071.015; Mon, 1 Jun 2026
 19:45:57 +0000
Date: Mon, 1 Jun 2026 15:45:50 -0400
From: Frank Li <Frank.li@nxp.com>
To: Franz Schnyder <fra.schnyder@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Francesco Dolcini <francesco@dolcini.it>,
	Franz Schnyder <franz.schnyder@toradex.com>,
	=?iso-8859-1?Q?Jo=E3o_Paulo_Gon=E7alves?= <joao.goncalves@toradex.com>,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Antoine Gouby <antoine.gouby@toradex.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH v4 2/3] arm64: dts: freescale: add Aquila iMX95 support
Message-ID: <ah3hbkIEXaJnAtk2@lizhi-Precision-Tower-5810>
References: <20260521-add-aquila-imx95-v4-0-5a7f86c824f5@toradex.com>
 <20260521-add-aquila-imx95-v4-2-5a7f86c824f5@toradex.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260521-add-aquila-imx95-v4-2-5a7f86c824f5@toradex.com>
X-ClientProxiedBy: SA1P222CA0113.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c5::27) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PR3PR04MB7241:EE_
X-MS-Office365-Filtering-Correlation-Id: 3807f2c7-e506-44b2-f39b-08dec016669f
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|19092799006|366016|38350700014|18002099003|22082099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: kgSTK8bqoZ7fQfYzbqn8nLvMjkYwKWpjXbVF7sn9ah2alYvFr573Pbw2EJNOqRIPbBTe2FdDQ3hO4q8FWVH/JGJDN5+v9tYMTQMZuBKyoJcKFMHJqcQ3tGGK/l8fkYgysUcylHVrz18KRtmJKrdMXmaVAyb24A2zUAYpzv31Og5eYJLBoT6Ncj6c0PTHdvGFksxg0NOJsAmDACB0XSSPCuec/zat7g1vwVgvzXAeMET/68F2Q0erXbtiBp+/uLi53wYp0LaaU+kELQXBbmqC44ArtflOzNxZkPQnTjnofG+BcrVvN+oKo/BoiCzO34EfC5tjSEugmatpyQw0gdQeXRonyhd3SLB6HB0CncjKlnhUIhfOKIVSZGbUdmb23T09n5kLDwXP6VT2Dnzu0vZuZ70kkySr84qZ7w//flkRrM1oPtdALQE/ckQHc3z91AXs3QwH54mJmlHmbZ9n8HTvvjz/rqSQTOqw9Dw0Gf7Nnj0PHwFc332KBO887RkjVBv4p1+4TZtSI1s7e92uY9npxPSB+Q/iRGeVIVoJguJE19CHIYG48sdLBuTbfztfFnNAZDQJfa2aFBg23DkXznVlszhMmz8Nzddn9+/nRufoRWtt2bmT7p/bH7uOw/vnJl5yiwZ5EqkdMikJgWRhhTfe0tfPWwFuA/CrwqswhzFZ3CXtuxVZv2RBr1DJJNijXeLQ3oR+GodqgZxSxfy8d/Tdo3avH6mu8Q/R7wr65/7WqMnM5O+NnMnNyHtizLX6Kh1y
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(19092799006)(366016)(38350700014)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Tsrpt9yiVUkeaEVQvPqXCA7vIUGMRaQvRzlmY3NuX9SfKdXGJMOBBYZNiO?=
 =?iso-8859-1?Q?5wurn/MLPKAdXYzKWbAXbGpzWLAsq7ebf481ZdzgqPRrhIOsE+CbT9XSnb?=
 =?iso-8859-1?Q?WWGK4CkdM2zeLgVtlsl3tPqxp2yVq0fcSRgW77DJlEPVPviUhGvlvnOXz5?=
 =?iso-8859-1?Q?ZmMR/LAprhksqovnHo5roP6P1LTDgXyJ2HwkUEi5CvIT//p5PTy5gJJCel?=
 =?iso-8859-1?Q?445IThivieBcWyxTzmsUL0n5DicjAXfIY0UgE+rHsopxVfqkvVfFKnIyvf?=
 =?iso-8859-1?Q?VGq/RnGqYNbqxzsnurMEi0dxVxHn4HK26abS653CLnB3Td1Mxpo+Sj1z2D?=
 =?iso-8859-1?Q?7tTtRfRJ9afO2MJJwtxQYNZb4pu9BWmmgzi7C2VWxmT8YvotaOEjQ1T22Z?=
 =?iso-8859-1?Q?1VVRE55iCgzGucPRt2Ktm+ttYeWvY5eC75GenkWrL/J64DoY/Gx5BfcWp7?=
 =?iso-8859-1?Q?E4viuCcnHoVYfJVC+Z5UqV0Kj9CzzQG33j8UHzjnOI3oR1Byhhv5gH2v+6?=
 =?iso-8859-1?Q?xSmDsdtqwMskNNaHgoLvGl68RP4vs+efglMLqDcqFpS9HlCxZeFUzcpsA0?=
 =?iso-8859-1?Q?WABQU3Jq7xU9ubdG0Nnpm+qpQwLE4V2gV2cRS8Qt2mDj+1JC5N3lvTnJ0i?=
 =?iso-8859-1?Q?X4BN50b7U6jOdgySuCc/FkJnVqIt6/zaSnP2S8xejVfH327/27ccegoN37?=
 =?iso-8859-1?Q?H1Z/6UDCvSv4fJJSXl8gu4eIHogWujn/nXHCtxKDNYfM58sCPiTNH3eZ4T?=
 =?iso-8859-1?Q?A6b28E1aDZSnXdi3JtZIS1JM+t/VSV9JhU8PgmBOdI9QDMdPnKZ+dehb9m?=
 =?iso-8859-1?Q?kvlh82Tqnxp6pdVJk7tnFbvqUklbV/Wa7ZMp5OIZGBu5E7xWBLilbm7/PE?=
 =?iso-8859-1?Q?TgG6KgIq+C4LemObwfxJBg/5qjPzCtgFGdCFbjhRwG38KwVyTNY0kKgcmY?=
 =?iso-8859-1?Q?dNDN+3TqLeTst1HBHtZAxPOEwaNv1THUsFqPO/LbItHYjKX4NGiVghCFmp?=
 =?iso-8859-1?Q?5jiCqcXLrMrnBJvvQv6qqNkemj6/ZkINooDD/YJBLRn35JQ5VFPKIw3n6P?=
 =?iso-8859-1?Q?bS791pUhdIahz4XEystRRbYWfwGuIa5+M/j3CONHMRnSHUoO2qB/XZcCd3?=
 =?iso-8859-1?Q?8syV+KO2iSfFLfjSDHHtFiBZCgCCCDaVsdf6Fco5RgopfCVffxtTRJHpUR?=
 =?iso-8859-1?Q?x8xAnsByBhB0UJEDCI9UHKzOcAy0C6SYeePBIeFqQub4i0vNqv3hV+vM3o?=
 =?iso-8859-1?Q?zomEsenN5Wz74FvvB/uYNHUvaGx39qH1eVVJqkCXRAaEA6lBxbCGK0V7HN?=
 =?iso-8859-1?Q?980weym3Wkk8JuwWznvAc/9yo0N8JcwP/tU5dkO3zR/34KNDUXXnJScSEK?=
 =?iso-8859-1?Q?MNewFEUwucPMkHZ1ibNSPHlQ90G/7PXkRitor+wze8he6voyuVKy842XvF?=
 =?iso-8859-1?Q?8L/BXC8hDYFTkDcmtyRwoKIXw9T/grU2w1ER3gzyZ8j/bgchNyO/ILx3oq?=
 =?iso-8859-1?Q?ZpoiesPKq/oCpAFYiFiUCXIDwhipA9Kl5ZlVyDeJvWpNi14OYFIVAd1Obi?=
 =?iso-8859-1?Q?1DSLKaW7F9Os4aClcZomH1Phx9fQkHy4i56sU0Gh+CYMXqvIsujZoeJvVe?=
 =?iso-8859-1?Q?gID0u0+05KclEa9912IDDfqPFT2QGzYT9d/09X9FM4panrTN/qTch1AITp?=
 =?iso-8859-1?Q?rFvH0F4wvhAaHtnTD5wUKhculkOM4DbziSICSS7yliBWXfYXAESV3fKhVQ?=
 =?iso-8859-1?Q?WSWxagHogCv5owyTomyLlNsV0+r6efVeRBMd7qYOY5hkVEGtRr8VRCTv2Y?=
 =?iso-8859-1?Q?JpBZrNxAyg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3807f2c7-e506-44b2-f39b-08dec016669f
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 19:45:57.8390
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YC0d5mINFeoCuoVSzTs+yEq6ycRYXQIMZEqzn6JXFzI3Mw2al2Uiv/nCqOUTi8zw7Rxgt7eN3Ri8DnIeJCYeUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7241
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_124602_424860_05EC45BC 
X-CRM114-Status: GOOD (  13.98  )
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

On Thu, May 21, 2026 at 07:11:05PM +0200, Franz Schnyder wrote:
> From: João Paulo Gonçalves <joao.goncalves@toradex.com>
>
> Add support for the Toradex Aquila iMX95 and its development carrier
> board.
>
> The module consists of an NXP i.MX95 family SoC, up to 16GB LPDDR5 RAM,
> up to 128GB of storage, a USB 3.2 OTG and USB 2.0 Host, a Gigabit
> Ethernet PHY, a 10 Gigabit Ethernet interface, an I2C EEPROM and
> Temperature Sensor, an RX8130 RTC, one Quad lane CSI interface, one Quad
> lane DSI or CSI interface, one LVDS interface (one or two channels), and
> some optional addons: DisplayPort (through a DSI-DP bridge), TPM 2.0,
> and a WiFi/BT module.
>
> Link: https://www.toradex.com/computer-on-modules/aquila-arm-family/nxp-imx95
> Link: https://www.toradex.com/products/carrier-board/aquila-development-board-kit
> Signed-off-by: João Paulo Gonçalves <joao.goncalves@toradex.com>
> Co-developed-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> Co-developed-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> Co-developed-by: Antoine Gouby <antoine.gouby@toradex.com>
> Signed-off-by: Antoine Gouby <antoine.gouby@toradex.com>
> Co-developed-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> Co-developed-by: Franz Schnyder <franz.schnyder@toradex.com>
> Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
> ---
...
> +
> +	carrier_eeprom: eeprom@57 {
> +		compatible = "st,24c02", "atmel,24c02";

st,24c02 is not documented.

> +		reg = <0x57>;
> +		pagesize = <16>;
> +	};
> +};
...
> +
> +	/* Aquila GPIO_05 */
> +	pinctrl_gpio_5: gpio5grp {
> +		fsl,pins = <IMX95_PAD_ENET2_TD1__GPIO4_IO_BIT18	0x31e>; /* Aquila C21 */
> +	};
> +
> +	/* Aquila GPIO_06 */
> +	pinctrl_gpio_6: gpio6grp {
> +		fsl,pins = <IMX95_PAD_ENET2_TD2__GPIO4_IO_BIT17	0x31e>; /* Aquila C22 */
> +	};
> +
> +	/* Aquila GPIO_07 */
> +	pinctrl_gpio_7: gpio7grp {
> +		fsl,pins = <IMX95_PAD_ENET2_RXC__GPIO4_IO_BIT23	0x31e>; /* Aquila C23 */
> +	};
> +
> +	/* Aquila GPIO_08 */
> +	pinctrl_gpio_8: gpio8grp {
> +		fsl,pins = <IMX95_PAD_PDM_BIT_STREAM1__AONMIX_TOP_GPIO1_IO_BIT10	0x31e>; /* Aquila C24 */
> +	};

Please fix checkpatch worning, it exceed 100 char.

Frank


