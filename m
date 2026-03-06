Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4486F51416
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 22:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U9ul6jW/9rLESY+gJQnO8m7yD7U7ZuDMSPQt8Bpxof0=; b=vUq8MS6urt3UFUAxOOovLpY7tL
	t1yFRfunmechyWR+Ysb3jyunNGVH0SklvOSJc0WjYXOwZXHPIEQtEkV6GGY3BtiBTyR+GqHQQnDOe
	g2OHYrPi4Tppws6XNh60h1AKiozvGELbyDcnOi1QZ15YfvTSdfrBj1CsuDsIGbGyJD/3vGiuy0XGz
	Nnxe0CrYiiJrNEdG52eBqpX27oJ/FPd9IHmxV4YlAmgjIcOX6q1FfbuG+3T5pTGaeDsT8UmH5imOH
	yakW1lEr6c19U3+60JLcqCBx9fJdmcUyxOTJHxhbfOyHBOtdsaGEYH6I5E9IJp9zGudSMCkD5Vgzv
	6hO0+4eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vydHg-00000004Z37-28HH;
	Fri, 06 Mar 2026 22:04:36 +0000
Received: from mail-swedencentralazon11013001.outbound.protection.outlook.com ([52.101.83.1] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vydHe-00000004Z2N-0JPd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 22:04:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GYoblNTFT3FSt0ptQUMWE+zI/Zj+o8T+boq4sYd8DVtEqNKElS7jRN9M3rRavITsHXvDmQSxlM7qVxCQhUKT7xzPem6tzapMeaSWZpnL/gmeUMCk0yKdKRIN/AFip3zFF1jUw2NetEepp6TD0rWsgPBtbk2W4MRD1Yc4LAWyKAGjDiEaVLWu7o1Y1Y/mBRu2K+yP0xLWGgoUaiXkFLkF4brGNRgmbkPdM+oE+WU0M4zBAcaWNc8OTttwaj11DALga7t0274W1d3tamZW+xGq+AAZv1s9orxay1YRkX5gmRLATSm/pB70mlb3Y65CWJjLaau3fHAe+xCtsL/VvzyZoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U9ul6jW/9rLESY+gJQnO8m7yD7U7ZuDMSPQt8Bpxof0=;
 b=ah9Ob7SF2lj21xAKOSXL2/athffvu7JA90+i08YdpMZxWhtw0suSA78YOtmRP4zgRWWXV5vc9vrx76NvDXtzu0wXwLDdv4fIK9phvw2TRX+axGQDDh3wcO/cL8/1E90x0mcwxYTuj2VZpy1FTp8aF68tP+M/TX7qn/mEeTtkmVB4NyiSo5t6dayQBhqqRtG5rnLGgyV9vwVVmVn/Qc0SnYVDVGKhSuLdHrsD87gdFq6MDYwwElTAw4NG48eeeoDcxMNV9K7iuC1ABVksRHsGAvxwjqoJKS4SrjJSCqlgPKD9SDj/TLj5s3J2jihR4XZ37iFHi68wZtE2Jpkeq9BCig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U9ul6jW/9rLESY+gJQnO8m7yD7U7ZuDMSPQt8Bpxof0=;
 b=BmJNr7Kiv2qaPH+I5Wg1GeqGTgDKxhP47+Gk0+fTXqTUJJg/iauoGSIz5eCMwB0R4c1fp36vSm8pyeE4jVL6wqVyyc463wLDcFDzCqszJnmR0gyb2UMXarKz+y2MjJ7tlMDYFWS/FNRO2EXsO7DkWxdHiiTtGk3kgHBSEPJu2l4G6ZuTMSmcUrfvsg2DEr6e/B2T8qts+LC9O0HjNJC92WlA15qi9SwhsgkF8A6t7fTM+OPxVfkjgwBxHfl+9zBRXxDR6VqbUwHuxN8mtKdoSDdMaPEFf5R2QJNG/4vHqdKEBI5uqIM7dnnCt1rMpiunZI22vX3NKhR0HARYT3VSkg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AS8PR04MB7559.eurprd04.prod.outlook.com (2603:10a6:20b:295::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Fri, 6 Mar
 2026 22:04:28 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 22:04:27 +0000
Date: Fri, 6 Mar 2026 17:04:18 -0500
From: Frank Li <Frank.li@nxp.com>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v2 11/11] arm64: dts: imx8mm-var-som-symphony: Enable PCIe
Message-ID: <aatPYopLuQ4K_K7I@lizhi-Precision-Tower-5810>
References: <cover.1772826534.git.stefano.r@variscite.com>
 <a029d4f029274a368af0e9c58e9b41106857e436.1772826534.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a029d4f029274a368af0e9c58e9b41106857e436.1772826534.git.stefano.r@variscite.com>
X-ClientProxiedBy: SJ0PR03CA0186.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::11) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AS8PR04MB7559:EE_
X-MS-Office365-Filtering-Correlation-Id: 53e7ce5b-47c5-43db-ecfd-08de7bcc55e7
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|7416014|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: mGYd7imJgUfgUwx2/FrOORDde2oQG2D02W7V7wsanbkvXhOzBOOQprF/wdwml1x4/rZYVf7WpJ8jLodI9aFfnEcjL7lkL0Wy3+1HR7dSvoLGNHl9lBEFhvzpSeRZNOVmDDwueM7EzMHTbuy91TaSxQgRla5FpglZgIRhAZApiWjkv1K9fOYEgkvS28PRTulCP/62ks+/y2pFvvkyB/SStU98hAtqHmUQJE/O6woIvoA8RIBpvgy5truBBMftxTpclVknGzsRSeUK/KHYToUv/YzVdgWULIpO23+Dqy3rw9laSmFU9ZglRTMy8fqrsD4oSgIJOVYVWKvwZ9wGWyohsDd2BvjSdo4LLe/DYqvi674zpz6HM7fODw9+qceBGyM7fouIOwhDbLpaZ7VFWzsYT5JZU0Iq51hwC78OM2yuB1rpgPiIl/YVrAQHeIbEi8rtnCqtFIZIyher0uL4ziYm0it3RXm/VHYvSEUK8FFmvRirm5iysTNHdilx6quk74I0KcArCBDdyZX1y9DVY4ekwKa2fk/l+fJCRF2PbZSZ57VXo0kyq4Sg8K1xPHZNBdJDnWvPu0ClPuhHiuCA3IscEKzdfxrry1RkzvV8K+hM1h+ahX0MoV2fAu1SLT0RTsZc6iKpCfpc6Q8oL0PVQDYtSUvyMesHBdESwnvtOKWLUsLovNq1+PhHr32Dm0E9zRfJBV7l6glZWCYcR/XQ72gkJn7vsw15PJLW1ZAdHGUqNn41tVz+UY/lY3cbl1LRC2wepqzYGS0KobEjOjJl5M4UWUH2tTAzd+8dTRqMCvs3HiE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mh5fUQRbbDAnugOFWeBk/c7dYD2B0KVOvxRjiOqesqy8Lk130YtzjTS3FiRT?=
 =?us-ascii?Q?17WgXCfK53Xa0iu5SgDHSNIgsL1R86nNk46Af0ANpJ53y/VmyS8Y6i4aNJhG?=
 =?us-ascii?Q?wpS8lliIt/kGacstTfme/2BMJQiG2ZcPGq5Xt20TY6LBpZcqJQm5nUkdDlEc?=
 =?us-ascii?Q?CDQrdmLxo259Zq0Y91BLAq9tG6bufSPujS5C8E3ke/TT+hbzj6D9OehtmS7H?=
 =?us-ascii?Q?JDVfI/sFcRqJmhLOlh+6Sq64qhGpw7vLxcCpyTG1LAsBvksm25wbGZMHJUuQ?=
 =?us-ascii?Q?V7Vyeul1DyYwKE6MZ4TLZ+2k7Wbcvp+vR+rHwsfOGd7e3FUrNfeUgZmAlJdg?=
 =?us-ascii?Q?mb/6kJpcXZUQ32u0kbSodhK5C0J29Y77Z4PZnuNndXLMm8WPPpAxzVW+YRDW?=
 =?us-ascii?Q?ssVXBb9A3WTR4McgHkqQUZBDf6cwTi8Ui6P+owMxC3UyiC1mb8/sy2nw0L66?=
 =?us-ascii?Q?lbD7cJK5/Ly4jlSgzj6SPyVR42z7/mmCffJCKrSW4ein1D9tUs9FyzAEX8Ll?=
 =?us-ascii?Q?dgdnvRsJ45QePXyJ9ZRolHPZ3mxT9Ls646KuB30gcXQ9F1cJHZghHzM4ZAt+?=
 =?us-ascii?Q?mlSofnEsT4OMwJ32XTYZTDhECgTcI0gO1kHUsZ4ToVcJfWGPlz8/Z1s/gAU8?=
 =?us-ascii?Q?lGPqN2KAtBzpvOWlFnU8PJhS/VgDy3SkPwzslgKYPLbxCphHFaBMz4/cSUWZ?=
 =?us-ascii?Q?aWURUNhGXDmt8FnnTbzgyfWyAP5oeZ1anHhlcpE7cT5veXPQBelDcOVJS2dB?=
 =?us-ascii?Q?aMnssErRO8+msfq8AjZhAxcOMVCo4W0LO7Q3QWCx23Rbdw4ql592uJrk2s3e?=
 =?us-ascii?Q?kkDqhDMftSzKpQuhYK2Hh8O3VGXFMkNRPJ/Lh+Kd/YCSDXW5dllF/clAHOL5?=
 =?us-ascii?Q?SzINoAl4zNVqP7N5Hd290fiJVzVptXqBxj9Gjt4fxeAnSm7HDPQ6NC0B2kK6?=
 =?us-ascii?Q?d9kQ5D9Ewx6tV1n7/Sxm3lriFZIStSr1ej9d3ENwZvN/aRynp/T/5btNUlqv?=
 =?us-ascii?Q?3bceyZ5Dn8pt8E4rlXxdS+RbGqOsoA9lRyAWYkIFDpecEtJCagz6NmBgCOV2?=
 =?us-ascii?Q?kNEUFvtO8oJK8vzDl7ArZ4uaaoJwzz5tMYloqy/QCGtTRVeY5rkmDirm2uI/?=
 =?us-ascii?Q?yatrO1pZL8oJ5Q/ajSwVP+rGO9lJxiqOWTqLfC4QcsLGfj3iT2QWrLnifoEm?=
 =?us-ascii?Q?sPH+GtlhxfpwsivxLwBUzJ/SRsd97RnQs858C56OIJk9/WUMtlhSFCMK5/MO?=
 =?us-ascii?Q?vn7IuLEw60tiYJ6kVRTLsYOKfKIz7V79BafP3dCmqPDVYQTmGwgSCyLCPRdl?=
 =?us-ascii?Q?DNyXz2pKvuI8i6A/WVdpjltB+ReRTcrJZnmiB5k9ycSH+V1fqUUXWWlBJobx?=
 =?us-ascii?Q?VKxdC1ywkv+5ZyBmoFYi785hS0CeoSksD/W82LmfxulD1LY85GAIrZ3sdlRP?=
 =?us-ascii?Q?SykVN2gfv7/iUwSEbxE+qM5Z6Gt7SwaV5UO/R7p7Tk2dBCTtNlVO8Ao0DYQP?=
 =?us-ascii?Q?OLG7YLKyphDrPylGIbc+a7WGSTlnz7fqceSemMY8MLg+KuI9FRAR3R3b33Rx?=
 =?us-ascii?Q?R4NRxvrCX4zjiMz9IRaiODXOMPQ4UnGsw0WCfc2/mMhCaQGA56pix//GGQ47?=
 =?us-ascii?Q?aA3pfjJQVxjasUcVc91zoPRFGA1kgSvDtFuHdpRbgJJag3KeLimmvUZhxKkM?=
 =?us-ascii?Q?Z9TSkQfMuWkUrMHfPorg446JwT39XyG2pkynPFFewHUaLNX+?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53e7ce5b-47c5-43db-ecfd-08de7bcc55e7
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 22:04:27.9046
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aL+WMqfTmiz4NGHMrzvU9QIFGcEVgMgzjgjWV1TkgUaePxTDyEDXIECPp1mcoCTktxvGz5PwwhQi/pbGSBOy5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7559
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_140434_146334_4856A8F0 
X-CRM114-Status: GOOD (  16.90  )
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

On Fri, Mar 06, 2026 at 08:58:30PM +0100, Stefano Radaelli wrote:
> From: Stefano Radaelli <stefano.r@variscite.com>
>
> Enable PCIe support on the VAR-SOM Symphony carrier board by adding the
> external reference clock, configuring the PHY and providing the required
> clock and reset properties.
>
> Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
> ---
> v1->v2:
>  -
>
>  .../dts/freescale/imx8mm-var-som-symphony.dts | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
> index 9a29c81b06eb..0aa288af6c5e 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
> @@ -6,6 +6,7 @@
>  /dts-v1/;
>
>  #include <dt-bindings/leds/common.h>
> +#include <dt-bindings/phy/phy-imx8-pcie.h>
>  #include "imx8mm-var-som.dtsi"
>  #include "imx8mm-var-som-wifi-bt-iw61x.dtsi"
>
> @@ -17,6 +18,12 @@ chosen {
>  		stdout-path = &uart4;
>  	};
>
> +	pcie0_refclk: pcie0-refclk {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <100000000>;
> +	};
> +
>  	reg_usdhc2_vmmc: regulator-usdhc2-vmmc {
>  		compatible = "regulator-fixed";
>  		pinctrl-names = "default";
> @@ -205,6 +212,27 @@ &i2c4 {
>  	status = "okay";
>  };
>
> +&pcie_phy {
> +	fsl,refclk-pad-mode = <IMX8_PCIE_REFCLK_PAD_INPUT>;
> +	fsl,tx-deemph-gen1 = <0x2d>;
> +	fsl,tx-deemph-gen2 = <0xf>;
> +	fsl,clkreq-unsupported;
> +	clocks = <&pcie0_refclk>;
> +	status = "okay";
> +};
> +
> +&pcie0 {
> +	reset-gpio = <&pca6408 1 GPIO_ACTIVE_LOW>;
> +	clocks = <&clk IMX8MM_CLK_PCIE1_ROOT>, <&pcie0_refclk>,
> +		 <&clk IMX8MM_CLK_PCIE1_AUX>;

put clocks-names here also. Although it duplicate dts part, it may cause
miss match between clocks and clock-names.

This type pair property should put together every where.

Frank

> +	assigned-clocks = <&clk IMX8MM_CLK_PCIE1_AUX>,
> +			  <&clk IMX8MM_CLK_PCIE1_CTRL>;
> +	assigned-clock-rates = <10000000>, <250000000>;
> +	assigned-clock-parents = <&clk IMX8MM_SYS_PLL2_50M>,
> +				 <&clk IMX8MM_SYS_PLL2_250M>;
> +	status = "okay";
> +};
> +
>  /* Header */
>  &uart1 {
>  	pinctrl-names = "default";
> --
> 2.47.3
>

