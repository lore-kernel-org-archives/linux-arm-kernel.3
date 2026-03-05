Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BCDDF33A91
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 15:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uHDnVELYHuz5xjlvnFFmxRPUBF/zcgiHc0GtbhK2DWE=; b=Hn7VG91Ac8zxWCyig+7uOk0phw
	U/7XEVbU8LnGqg0qDA57p4hcym1bX0K/xSYAUkzPXBQj2Z1q4lsgN6UlMJiPzb23WsNyADg19qR2G
	qMPMCncwLScf1sNmpG/+SbsATOh0Z9O4zYeIFmlEEb+oVoE7g+ayyVvgcsaTcoR6XjgWpndFl9zma
	XQUTcAnTNfMT0jHLcZT49yxyo3tF+CiSOxJCBX5SgiUFESXEtLsVr/5+1bGjxctEKDxl9VPNHpQrm
	l7SuxdE8iDHyTj96ic5jPuO2dZrpPdt5Dvjm8QaQ5BZylrmHJ4phZyqAM8UfXgOvwYmRxggRtEutT
	9/9Qo18Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyAdE-000000027Mw-0vm0;
	Thu, 05 Mar 2026 15:28:56 +0000
Received: from mail-norwayeastazon11013018.outbound.protection.outlook.com ([40.107.159.18] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyAdB-000000027MR-3JP7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 15:28:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ss47UKi3P1Rqc891fokACqs5FMPaNexrhMt2qqybbCM0pz1YEqJQvoiisRbvPCJmpEM5diG0BSSGYg6PpzrN58042FSasRVja/M/I7BZ/rutPqbxtd62g78zLZWikWHDEED28cpxgIytkknEcy+uoNcCG5O4bxTuopiYekh4kztkLF7YlcDzc9FfxGFsTNpzhKcr7HRsQ6/638t+S7Bhl15YMFpE1w2Dox6fd1AhcQ3QYIutkimYcCbkcZlGLwVmpVmTB5A/HZ7FFVjH558HQ0ZIhmM2M6wVtd7ZXAcuDrGSXmqX5loqqcOkiNKv3NDwP54mZAqMRrnhvz2Dp4HfjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uHDnVELYHuz5xjlvnFFmxRPUBF/zcgiHc0GtbhK2DWE=;
 b=xa1N8NpEE2/fL6YI1+dzuwyRvEVI3GuSFkNBA9OIQcjF8OyZrWcfDeWy0nkGbWWyJ6cYUhjZB7/dsGmarNok4qmNMQIohThdsvMXIag+sQjQ5j8fuWnqo2Zj+sONX9wwmgkeWG/8az/DyA2m0riCjGmX1rTwu/175UL92fq33NWVaE/6Li8qWtttaFmp84n/spzd/u5HBdMgSoWBHJ4MCj8UWbF5c82J/WOybDfKCZK//9x/6pty3PtflNzO29jaMcopv6UpgsbF4eIZdrM4nKNRV/430dK2Dxi8qvB4FEq7hXiVzZ704Pxq9nnZDl4cUgcSjLxZI2LmzY0IvXaLGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uHDnVELYHuz5xjlvnFFmxRPUBF/zcgiHc0GtbhK2DWE=;
 b=M1excZqS3neZiVeqnYxcU/NuhcAw/Js9G4So5cSbftSVeHV3By1iczkqhmsp5MP5oy/aCZuy5ne7MF90PUi2pO+lpXKaA31gbynakNUvZdNELJNcmIg5uu74RS66cEZzGMsEvGvI3/RjTdiocm8SQgBp3lQbxtQni5ewv99Qud7y4ztjEKhxxqAY4MYzXgHoXLjovZ63w6IBjLQWz+TYErCWR/3ImYB4Y3X15n847HbnB0JMvru6T7Wnk7iGHZQ38qFkGTo08jTMCtDf6hRxfqi5TNkFj1gR/+OI+86bbP3PhEo08lZvhZ31uWN0dbHRlol2HQQIBPcC6IojUOcR3A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DBBPR04MB7916.eurprd04.prod.outlook.com (2603:10a6:10:1ec::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Thu, 5 Mar
 2026 15:28:49 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Thu, 5 Mar 2026
 15:28:43 +0000
Date: Thu, 5 Mar 2026 10:28:35 -0500
From: Frank Li <Frank.li@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux@ew.tq-group.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: tqma9352-mba93xx*: Fix Ethernet PHY IRQ
 support
Message-ID: <aamhI1lX-LJlG31b@lizhi-Precision-Tower-5810>
References: <20260305111040.1899965-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305111040.1899965-1-alexander.stein@ew.tq-group.com>
X-ClientProxiedBy: BYAPR02CA0010.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::23) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DBBPR04MB7916:EE_
X-MS-Office365-Filtering-Correlation-Id: f1d655d2-3102-4482-bd97-08de7acbe2b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|52116014|19092799006|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: 2bVbcVzxuRb4eg+SOxuErbgjTKD0jhuIGhOWjSIuAE5x5DkZxm2bqwpA83F5f/exUFviGqxhG6nRNXMzLm2InpRNVuP+8270b07XZTs0fxITyywOfAMbXRn0fEckoiqsRTKbTswCKfZd/Ci6il5Sh4kZ5E6kiui5heuPfKGrMu0iPs7RVu+A7XiIP3FdEk+SsVkm+VrWWuS76BSCK3J3GuhCm/NvJaZN4XczyDwjWCgVx8D/TwV9GyFLYwiybGnbua8SwNoDEAhpQULDKhAu12JlpNodMF0hps/3bp9gLWjhIRfV3/OP+DrBGNaXw4B+KhF3FX/rpP9p48+O8P8hBNadYeDwN8PwiqTX/jT0EA1LvKWDa4yBQOLkJqr/eBWWcLwZcbSwbi1l2FGDRw8fu4SCMAjqin3w/q4nun70b0JPw1V9icFdIqVYPp6u3wm648jO6P+NXk5P4e785rdScaSeLdlW/nJrRIflPYtwzL9sbqbq/z8SIalwknNwX+dZ5wCfySu4OkZ6eUGHcpPVE1HvgUoPXRmBALO70KOIhZoplFu4DR9Rz9YDqXF/d9okSgHdBemdXrbrSDk3yzZHZCg8FeHaXdbh8FBLmH4BjASWZFL/NEEkXlUx6pmSNDvDg5yNc/Cv+2wOqwrzDQ82mVtqRy91Oz/m3/AjINdVGxaZMMu9QIs/4cgh+UrmG9ABfdjDIdsyTn2b0sHv6f65DJzwYXydYWp9dldJUAj/U0DV4ZCGZNBjul29bs/0yV9REHtGdYU/Tdvrc6DrDowfTHE7wPO10dGy/WaEu19p1oM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(19092799006)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IDdZEQsbUW0fuDuj+1HOFu+7OWwSTk0dt0Wl1A/76ejLCo6G3FsIztOKijzj?=
 =?us-ascii?Q?CCSbV94TXEKInYcorlzskw6lZTfgZwlwPR5L6Y3/WeTIKPNScE4aarZ/ikAc?=
 =?us-ascii?Q?dPDpfgF8nqwUv0cdP3Mam8x4gA04o0b4b1byRR5Kp55PE49JoJWZSNy4ZubZ?=
 =?us-ascii?Q?zAytZtX9gMjxlSSu7HLPt2C2VT3vXGI1voiSW19G8H+YBJLZpdKfXVHwH5Ao?=
 =?us-ascii?Q?CdfiJsBiGzeRKevRKn6puWxRMKnIwAnpkvsWiKlpFRmtflhsczMtdqXWFj7+?=
 =?us-ascii?Q?zzItdt5tZCaaML3JxGU95H1L4ZujSQ93M5G4eNEE5OpRVDEi7HBHm/7C8aDH?=
 =?us-ascii?Q?wbX5FFRgbt0dj6O1cNn4V9pmZQF2jpFFnP9lVHrHc81Cagqf2FO5jSPYeu7+?=
 =?us-ascii?Q?1eSRYh4TCStQ1RCQ6WyzYOLdRYKxk+eVaCKZCn7hwfula8SetjFrOHbKL4+7?=
 =?us-ascii?Q?4kyNy6lUg6IQtA4Q+VJ8/zOGyqkmMPR9OF07M2zHlFjQSTd8Gix1tRCFHjvs?=
 =?us-ascii?Q?j+IG9yw7KgHzckiH0VnCRu1A7qLheVRlYbZ1Pb/zbRwqoTSKOy/8cV8fjefj?=
 =?us-ascii?Q?dW3ciwmlWdG3Qw+I2GFVZo3CXvw4Act4LP/rRcmwzkAy79tA+WK7XUrTIcLU?=
 =?us-ascii?Q?an8k/AKOrYcVSS5AAgPA+ZtOloJJWbAvORIc/cnrLX/P1E3jQ+F0qtNKVSzJ?=
 =?us-ascii?Q?+e+AEo8GCW21MkMjYKJxB4KXmHE3z3ifewUaA2uj46NnpxiWX3GnVyA9kiTp?=
 =?us-ascii?Q?yhUg9EdDDSe2wj+dVc6ML1yBlD31BEuijzgqUDN4CkEbkr9yrdtocHqWL7tQ?=
 =?us-ascii?Q?+Lz88MJfqAH0ibsk9ZlgW2iMFgTfaupNMm9oCk3nCJX7iashqYTvR2WvjF56?=
 =?us-ascii?Q?rk1Dg2M8fNoOEkAzo4QvvHRAW5trwY9GiX6PPVkFIxviIFZyVfIO/J5P3dul?=
 =?us-ascii?Q?Vkp9WWnYgt9kgh4mjSKhCYjBfqT3PyXi+BSMFaJFPc1Q9mMqoS8Uue0IKwA1?=
 =?us-ascii?Q?2EiU2dwGLvt4Ls9cEFaz4l+Ijm6e5HcEOFziTFONcbQB1D0jzCGqs43stukS?=
 =?us-ascii?Q?QedW+SIsZbXjFfMD6lXQ9M8Inr0STeDIe8DDLcYfyZva8QVv3OoRuQTW/5hb?=
 =?us-ascii?Q?OgrR6IR8iVoQj1J3GWuoX42cKhcuElIqr2et7mJ9G47BwId5jMW3R429y0gA?=
 =?us-ascii?Q?B2/MNlrjMy3VPbEGyuBPSN7hVKP9qW0I4mjP7/ofL71cebDpVSUX3xTX2ZBy?=
 =?us-ascii?Q?Ysh0xmv2Q8BgrS15/x+7YaseqyCghZZj8UH4mzFQXeBLebiQ8vivH286eFF2?=
 =?us-ascii?Q?pF9I2mMAUkkyfjy+Kc0zSKEyroQGvUoA+KgGcJQQDHMtsg/+ZNDTKXPFuRnJ?=
 =?us-ascii?Q?1N+22mopPXwbhN8R4MynhLflpxbSjmNu8X3tf3UmnH7DM0/rsUcM6B6Kcw1L?=
 =?us-ascii?Q?aCKGYQaKXufto9ZF1zLo/lMl3FgBCUiDC2HxW4E4wPMXurblgTbsN3Bz4/vi?=
 =?us-ascii?Q?fXZDXkm+qKGNijnLVrHSU0OM6GMPUUn+/c/QxKXk3HKOE6cWzpLRkkLzwupE?=
 =?us-ascii?Q?K95f8hDzQ9VMLqjQcxuV5DyA2k7CBYO3yKm/aCFj0SQNPzn2g6EC/xC2+vT2?=
 =?us-ascii?Q?7szf7I3KyIUhBW5GmdM/8T8tdGR7T1oQYKjtOxNv1V3f14gvjDTxXC0FKioy?=
 =?us-ascii?Q?akkLo0CtCSJ2JDeQWneGXtRg0lT+fVQ7dETwfHyzrOpL7FyX?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1d655d2-3102-4482-bd97-08de7acbe2b6
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 15:28:43.5802
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lA3eKm08zyEW3zEVg1BcfMS0yuLQY1tHTcLPuqGXFVtnZ7zRIlOpEswD0UlbZlPF0/qJH0GpHeLPK+C7SZYYHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7916
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_072853_830109_D3C1AC17 
X-CRM114-Status: GOOD (  15.01  )
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

On Thu, Mar 05, 2026 at 12:10:36PM +0100, Alexander Stein wrote:
> Ethernet PHY interrupt mode is level triggered. Adjust the mode
> accordingly.

subject: Change Ethernet PHY IRQ to IRQ_TYPE_LEVEL_LOW

Frank

>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dts | 4 ++--
>  arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dts | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dts b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dts
> index 4760d07ea24b5..9108181e6592b 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dts
> +++ b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dts
> @@ -242,7 +242,7 @@ ethphy_eqos: ethernet-phy@0 {
>  			reset-assert-us = <500000>;
>  			reset-deassert-us = <50000>;
>  			interrupt-parent = <&gpio3>;
> -			interrupts = <26 IRQ_TYPE_EDGE_FALLING>;
> +			interrupts = <26 IRQ_TYPE_LEVEL_LOW>;
>  			enet-phy-lane-no-swap;
>  			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
>  			ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
> @@ -275,7 +275,7 @@ ethphy_fec: ethernet-phy@0 {
>  			reset-assert-us = <500000>;
>  			reset-deassert-us = <50000>;
>  			interrupt-parent = <&gpio3>;
> -			interrupts = <27 IRQ_TYPE_EDGE_FALLING>;
> +			interrupts = <27 IRQ_TYPE_LEVEL_LOW>;
>  			enet-phy-lane-no-swap;
>  			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
>  			ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
> diff --git a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dts b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dts
> index 8a88c98ac05a7..a78bbc46c59b2 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dts
> +++ b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dts
> @@ -172,7 +172,7 @@ ethphy_eqos: ethernet-phy@0 {
>  			pinctrl-names = "default";
>  			pinctrl-0 = <&pinctrl_eqos_phy>;
>  			interrupt-parent = <&gpio3>;
> -			interrupts = <26 IRQ_TYPE_EDGE_FALLING>;
> +			interrupts = <26 IRQ_TYPE_LEVEL_LOW>;
>  			reset-gpios = <&expander1 0 GPIO_ACTIVE_LOW>;
>  			reset-assert-us = <500000>;
>  			reset-deassert-us = <50000>;
> @@ -205,7 +205,7 @@ ethphy_fec: ethernet-phy@0 {
>  			pinctrl-names = "default";
>  			pinctrl-0 = <&pinctrl_fec_phy>;
>  			interrupt-parent = <&gpio3>;
> -			interrupts = <27 IRQ_TYPE_EDGE_FALLING>;
> +			interrupts = <27 IRQ_TYPE_LEVEL_LOW>;
>  			reset-gpios = <&expander1 1 GPIO_ACTIVE_LOW>;
>  			reset-assert-us = <500000>;
>  			reset-deassert-us = <50000>;
> --
> 2.43.0
>

