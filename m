Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F886C53209
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 16:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RR9F1TAPKFaf1c/yX4H1NoO2J2l11s0M7QJ3OgaDWIY=; b=lDXAnZ463HeqG4KzFduAVJ6N9I
	FiZyC+vQNAz2t55/f9s0aboe/L9abxBrqsBcfQe+YAIdHbFxNN+kJigum1+XWBM8+y0CA1QJhtZtf
	kkKnWDtX3/+yRsQ91rtyxqV3YagPyJkbrA7j/hvsg76htQXfUbkZfST4e1V3XEbsXpXSitfD6Kiam
	H6rY72prBM8d6bqf//0CsF12W4/ZceavK7fdkir8woUGmMsDxA5TKxr5jmMNPvAu+yjeKkyO54Ulk
	BgjDTskAYlQQF+4Mb2UfCsRjI5Tz7vgIFTfffvjFzBjRRGDlQsir7sp8fRjcUJ58WlAh5hpdxCnpq
	QP9gOcsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOXn-00000003Rws-0UqK;
	Mon, 27 Jul 2026 16:51:11 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOXk-00000003Rsw-0VJd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 16:51:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vw3yk/cDtAuB+XGx4//QITKY/+97tzPI4llF0gloyMYG5JHaH0F3iXDzzYZZVHgLytfh3ZiT6kBdGlNVmySphmNwErVy3ehYMB0jqGvatIudyeRz6aGFnk/FnWgNt3EhB608t+3omr0v8fd44onvh66PeZzvNYP3yJRSchNSNJQnDGXbVpZtgCQNHmUYILx/iEFsrbEF2/8UbrbPnOMCe+p0Pi+JaCcuKtefj80PX7ccE+FdzJ5D1Xw2hEf4IJnD5MwachjoV0c0VoZgnlqmHDSXmF5LblRFL1H+hakRzad+StLK/xT6gCA9RN8Np2I5Dt3vB9vNLH4G+dKW0PzFRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RR9F1TAPKFaf1c/yX4H1NoO2J2l11s0M7QJ3OgaDWIY=;
 b=GaZeFa8QWX16w4VJFtH4HRTW4qvAVEYdE3Lnj4OuZUU92gdPnkpGKrRz1WcgyIiKkefCpiYpxQU9C3psxwJEx1/G2zuYnt/ZO9utyVFsKLLtKTL0b1qPWA1AwW8j9Oe+BKj5l+PFb9D+FilbrEh01hnV79uTwlM0CaJBbz7VRfSQEyLpw3PLPImvTmejjiqBtoE9xqG+cSLnRpArJCSdmwJola8X357hko4KuR+svYAwpfaYLOnk0/eH2WS3laVW49mrP2ifzDFj1RHv9I/4MHP2UP5Oe5tcr+LTyf656PZS/cTBzbgj0iBoJn8QKJXa/nkgq0hidsgtmI04I0g7dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RR9F1TAPKFaf1c/yX4H1NoO2J2l11s0M7QJ3OgaDWIY=;
 b=o0kmfUH6VGmja4+4NE+se09mUNy4iFq4TE8FqFb34rXGJhUcC9PGAvs5a8iObs0BaHQuWU2RaPxUBvXuGBP3He0YJzT7MrfJUKPt11BSGH9ft9YLYazNm9JZPoPIpTf8wBuVsupBqEiFYjBFoLPRNHhu4csbvdcgyASxt840YfryRkIchEGucOx382Pf6G/nVhTQcrxwTqFo+o36SO6/U1638P04YZr0qovfxMfdgdqZ4ENK/9GRS83MEiNx4bEnAb41+5rfXWbd/xVngtV71XoGQj7zpa0uiURxZY6l2tl3ONZ66Srye7K6NC6DAVGcDcAKLqTa38Jhj3OTsatbRA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM9PR04MB8874.eurprd04.prod.outlook.com (2603:10a6:20b:409::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 16:51:02 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 16:51:02 +0000
Date: Mon, 27 Jul 2026 12:50:55 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/6] arm64: dts: imx8mm: imx8mp: Add LVDS DTOs for
 Data Modul i.MX8M Mini and Plus eDM SBC
Message-ID: <ameMb7evuJfmpWH6@lizhi-Precision-Tower-5810>
References: <20260716055751.279033-1-marex@nabladev.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260716055751.279033-1-marex@nabladev.com>
X-ClientProxiedBy: SA9PR13CA0071.namprd13.prod.outlook.com
 (2603:10b6:806:23::16) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM9PR04MB8874:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a49ef29-1e1d-4ea3-e8e5-08deebff3e1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|23010399003|19092799006|1800799024|366016|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: kcqiAqFWYbBerDApm1GY7ymS4JlM/p1FnHuMEwmqOsiyQEINWHiASBp0xFMrkuiywhqYCXUCQhz+FvIs2L9nwkW/9B7mvcYs+cVa0mX3s/dj/HD6HLbGFscZYTFVOUDhLu5FqRSBKwD+1ZOSv21qQuZI0oU/yekEKlzVVDTeBC1YkBTVs2kTBPFiDdtC9iNKK62wL8lI992X2x9CUGYzF9pgf6Qam8a8bSQczAXAfncpzpmjJP6h/khshdJ+YL9p/6oEtARjGuTie/ytLwhaKnWloN3x8Js0flXqqgNQc0r4+d2fsGK1R+WgSPlA4sBxOJ/Bon3Xlae9JELYKIZFgc0mHTgzyp1MEkr5o4JROZNLVFBfH/Cavc0H3smm/eaqS6PgktLVD+PBcMAZn3x/TJvBjEh17Q1eGrbtmF9rm3x7SwoW1V+3FRPfxs3+KhKPL0WFI+jKT8f9mYT58HL1vWij0OH0i7o/lsseVAaZveJ24bYAULY2qzwZzCuNi363Yx/D21yhNX2oQEwy6cCuBaaPf0LwFrTunmaaC+ceKufCl7G3e5UqhlKd1ayxtJQKDYRZq7VkHe/NKS6wIZ512BeBeR2wsuI5I86Rl2l3vFKGRijmHY8UtPg8yA4bHwPUt5Haor9csRkLZas5+GqHhkOFydo1cKytK6SPR8Ej8dY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(19092799006)(1800799024)(366016)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JwmlXxAs/r6JWGih+xy9AHyHM2hqzQkIvXqFwulYqiK8ec8WL+kOnxQSaX/c?=
 =?us-ascii?Q?F5ceSb39psRPZP83y1xIqAF+3o5QUQTagXDOnUztzZqauXz8R7P1xGooJDuK?=
 =?us-ascii?Q?WcJU8jgi7yQZRbZITk9FxLsYxJZnfPmUSg8cFMQGKwgpe4fQawl2bktycVHS?=
 =?us-ascii?Q?9vZ78NHHcbeUTWL54arARDE66OW7ExdIJt9L9fgcF2jBIlDGPGxtTzmx1k42?=
 =?us-ascii?Q?f8WynhL6vcqcukvYYAfEcSNmoPw40W2cLrKe9cg55g+R1qc9THgiCqTWAwgu?=
 =?us-ascii?Q?fvfK5pViep00Xjo6AH5rC1tSPCw0r9qI7Ac+vqw9Ca5Qk7iP2w6iYlM2g0Kl?=
 =?us-ascii?Q?TlOR/DQHUsUpigf/GUKPhLi36oFEge+Wan2JCy28wdxZXODPxJOjYZDdfb0n?=
 =?us-ascii?Q?2ziEM/cdxba9BHiyAJMu+cTiKcZ4i/+J88RBm8QTjXdrodS0bikDPmBuAXZk?=
 =?us-ascii?Q?E6rvukKzZdeCaxFRsJZm6cyBQdYbaPyTcr/gIKs7YPHW95bi+ZtDSLsnn+pA?=
 =?us-ascii?Q?CruYX1O/0jYqkJ67wIXmDPKxVkKjOBdDIr5CAROpGWjb2+iTLosJUXAwgI0L?=
 =?us-ascii?Q?DQ6aK4YRIGvMQ7hAlwOPtxswPfWEbpofaZ8aYI+bpBaZGQOTTaxGxNMONSBE?=
 =?us-ascii?Q?pHLABqvFMCIMRToe6p1DAlCrbDWAWkx3SbS0tCYgkqtVxh3vUNH8qpz2Kb39?=
 =?us-ascii?Q?T7S3NHd7mDKz3jR4JC2sJLgjq0XWc885KEbl89B/G3wpXPE0lR0eGKP86a0t?=
 =?us-ascii?Q?l6udZm4W5bEPYLqR5p9eiKg7zyFxOXl3zszlbcAUfGRJG1HpuAOcZOfWBcJa?=
 =?us-ascii?Q?ip98C+WEIMo/TZhVOthQb8fEP3pIMypYX+R/DbxvWar6br4Q6VkFh5ouu5HF?=
 =?us-ascii?Q?0VPkUkNtyRpEOYqTipsJPmV6TYBRhnoWzoQ2juiB3/7+OHMgC7e/Iz+XVx85?=
 =?us-ascii?Q?hZDPgHKZyOpdAykIuTkaiQBFLz/SqdRERfAxPPhF4fHNqZ1GgsLLhDQVrvyq?=
 =?us-ascii?Q?/UgtKBUt+h76GBeX4cH3KGKx8JfYElmwjfMDSZhW4Ipm+i0EBJd60HXNlT3t?=
 =?us-ascii?Q?7f99Q4hBm6aMUrmkVoxxNFq2Cnubskl20qZJZaUabLz/FntVo2u6Yj9+C0XD?=
 =?us-ascii?Q?VK0FtoGhAMHvY8tzrT+ZH5jlX/BYxSgbj0D73vGeLy+oqHlhxRR1q+Eb3v9R?=
 =?us-ascii?Q?xR/zAlHEh4UJmi1TlN5+GW0VR5DUagQlxg0VOO2+ezGpXCIQkwhJCMCaxHLC?=
 =?us-ascii?Q?kEoPErsCEyJwJAfrMjpv09hVjjZzOt+WDYJJhxpgRf1tq+XKYDHvcsWdJhLU?=
 =?us-ascii?Q?EjUAILE7sRaQEtWjdKQU4tR3tFzwy6NXmzURbf7019bpIcDJe5CjtQ/zUq+S?=
 =?us-ascii?Q?W7gVgwyhKLmCYmMe5wAxguGAyiDu1C85E2n1kRcDfPMMmCV7m4uTcoj3yBmM?=
 =?us-ascii?Q?zAS+dN3C0Gt+VjCIYU7A7Inc01LKDrVPrljxRoOSb75A4o7ABP0VKgOB55Yu?=
 =?us-ascii?Q?TPl/LnRb3gdcVCvfZJXkuZG+VpoXdZZSd8UroE4w+xIhPSgWEld1wwYk1pz9?=
 =?us-ascii?Q?xlWeQwhxe1xqOgNR8VkAcQIXCo40YfwRRzDoP68oe1+qGB8CyFIfkivy9KhK?=
 =?us-ascii?Q?awfgTQhSllSUlffolZflGGCjNbYUl2Lxz4UKf3YQn15xaUitON35R0U562A/?=
 =?us-ascii?Q?vniSGZwfjEiO6FKZkN4/UWn+GVLKAH0YX5IEMMZ6wa3tzTN4fP+/xakuSVj+?=
 =?us-ascii?Q?ND9b9p9nxzi0Zllyc34EE6NHslktSJEES27qKblwBmk3gbvlZFkk?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a49ef29-1e1d-4ea3-e8e5-08deebff3e1c
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 16:51:02.6299
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fURRno4FBYhNDysDNiyhV8rmwv72EkFzcBU3Z92/bgpQktlhTqY8HmYqe/6jEjr8VpekR5zQOdyAWowNQbe0NLnTBuiZKUh0ViTNf7xYggKSW//fucqEOo6KbeSPslId
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8874
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_095108_163507_2B94444F 
X-CRM114-Status: GOOD (  17.17  )
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

On Thu, Jul 16, 2026 at 07:56:53AM +0200, Marek Vasut wrote:
> Add DT overlay for the DSI-to-LVDS adapter eDM-MOD-iMX8Mm-LVDS populated
> with Lontium LT9211 bridge. This adapter can be optionally populated onto
> the eDM SBC. This adapter can be extended with multiple panels, currently
> supported are the following:
>
> - AUO G215HVN011
> - Innolux G070Y2-L01
> - Innolux G101ICE-L01
> - Innolux G121XCE-L01
> - Innolux G156HCE-L01
> - Multi-Inno Technology MI0700A2T-30
> - Multi-Inno Technology MI1010Z1T-1CP11
>
> Note that in case of the i.MX8M Plus eDM SBC, the adapter name containing
> iMX8Mm is not a typo, this is the adapter model string. The adapter was
> originally developed for the iMX8Mm eDM SBC.
>
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Frank Li <Frank.Li@nxp.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: devicetree@vger.kernel.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> ---
...
> +
> +&i2c_display {	/* Display connector I2C */
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	clock-frequency = <100000>;
> +
> +	lt9211_codec: bridge@2d {
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_panel_expansion>;
> +		compatible = "lontium,lt9211";
> +		reg = <0x2d>;

compatible should be first property.
reg is second.

there are other places also similar problem. Please double check it.

suggest run https://github.com/lznuaa/dt-format for new dts to avoid this
order problem.

> +		interrupts-extended = <&gpio2 3 IRQ_TYPE_EDGE_FALLING>;
> +		reset-gpios = <&gpio2 2 GPIO_ACTIVE_HIGH>;
> +		vccio-supply = <&reg_lt9211_vcc18>;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				lt9211_a: endpoint {
> +					data-lanes = <1 2 3 4>;
> +					remote-endpoint = <&mipi_dsi_bridge1_out>;
> +				};
> +			};
> +		};
> +	};
> +
...
> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> @@ -1437,7 +1437,7 @@ aips5: bus@30df0000 {
>  			#access-controller-cells = <3>;
>  			ranges = <0x30c00000 0x30c00000 0x400000>;
>
> -			spba-bus@30c00000 {
> +			spba5: spba-bus@30c00000 {

create new patch for soc dtsi

Frank
>  				compatible = "fsl,spba-bus", "simple-bus";
>  				reg = <0x30c00000 0x100000>;
>  				#address-cells = <1>;
> --
> 2.53.0
>

