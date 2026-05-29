Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA483CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 14:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZuGbVl/XJ9X4bqHr8AjXoP2jTOIwEDcWnRsf9eWbmv8=; b=CwCq0QZkXFrH8+0WxUKQQDZ5u1
	Dy0gva/OJwFnjmqyzDQNDGBUhtJg6Q8s2h2vqsHDORJF4Uc+iA58o0fr1a2pJ/rJ3txImZJm7Vs93
	p1TLTrE6avE9318Xa7+qt7H9dZ763l8GgiDLPSHtA/Hd6AhdnHbJGzSVTxY8zASTmfcZ3qO/1dSVB
	zfojrnKwcew8ftHLVwJW8jtuMi2bVamr3BbZVmTPe1C2obd4qpLwrln6JXgks40Oe8jQ907GCAXUZ
	F4xK+bvN8HoI8kOinbyEea6Lnn68kKtolZELF79GNDCWaXyxibPLTPrhUAqxdKTAYg4gCQ0GBN2iQ
	v94M+n8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSxxY-00000007VGg-3P6e;
	Fri, 29 May 2026 14:13:12 +0000
Received: from mail-westus2azlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c007::2] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSxxU-00000007VEi-35B8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 14:13:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QpeQ7sU2rpmIZlRpb0xMzqrwcF/R3VpNMf5e6B4cynbrDnJYw/5JLhbUpwnI89jhWyN/rjSbTvarkSK8xSeQDFj4UiL5hsAHRStMLMvRZxhQF2BH8vy7b5QcsHJ+F1AB9rOgIsnqeaqnCXe9GRxw8eN2aCM4unPejJl/joDRYhFyQq3xGQYFqgSWVz3EdVyVZoiugNSOewuzHQF5cGsqFY8twIvqi89UC9Ea2fgLn+nfLsBBgOM3UmnN6CuwkZmI1jBOpfutcbYScXbSHnKlw60UZlOJWwhQeHw2bR4u+J25qZwt8ybFZWLVMlUiXahtBH9XH+tQmLSsdc9gp/B0Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZuGbVl/XJ9X4bqHr8AjXoP2jTOIwEDcWnRsf9eWbmv8=;
 b=R7AUuHCiXyv83M0d44vlvNTqRK55TqRguzMqc5xQ67vb7HVMn96+lT2fkCLgYgFGcHP2GCOxMpAOX6nUHDzrhYVMMZDjUL0qky5D07r/KBLFDaJH3/2a4BmX8J/aDkmZOlBObfZ6pFtxFvT57XsHnJwVKkNZ8rROa0noCxrrhjNG5QKR8nMV0u5y9PUKkpZ8WhUiz7lBmxV6agg784Qoec6ktA6Utu5mkt/uI9aBrPG2FZzUpX1+T64murugtpgf4Us3VU3RjJV++fi1S96zEBskLoSzbMGEzVeHuUMy/OH02E4gLXt1ank5Ixw4zprDBSTydsJZRNy5S/aiY0nPUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZuGbVl/XJ9X4bqHr8AjXoP2jTOIwEDcWnRsf9eWbmv8=;
 b=jb1QBQuNyENeXAEoj9fA/zBiL3mf4TZxQgbHKqhQ+tMaxg0SXkgutF1IlYWceAaH3AE4Mynd13LPbepuYx7SkRTn3dWe/dn632TLxO4nJG1TczQkPDhXP0809zB5Xc7sEOUWXkgrEzIrt17NtFaV0i4Efipmy0Y58kBHIMHJ+ic=
Received: from BN9P222CA0028.NAMP222.PROD.OUTLOOK.COM (2603:10b6:408:10c::33)
 by DS3PR10MB997750.namprd10.prod.outlook.com (2603:10b6:8:347::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Fri, 29 May
 2026 14:13:03 +0000
Received: from BL6PEPF00020E65.namprd04.prod.outlook.com
 (2603:10b6:408:10c:cafe::6a) by BN9P222CA0028.outlook.office365.com
 (2603:10b6:408:10c::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.13 via Frontend Transport; Fri, 29
 May 2026 14:13:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL6PEPF00020E65.mail.protection.outlook.com (10.167.249.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Fri, 29 May 2026 14:13:01 +0000
Received: from DFLE200.ent.ti.com (10.64.6.58) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 29 May
 2026 09:12:33 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 29 May
 2026 09:12:32 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 29 May 2026 09:12:32 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64TECWPq3771677;
	Fri, 29 May 2026 09:12:32 -0500
Date: Fri, 29 May 2026 09:12:32 -0500
From: Nishanth Menon <nm@ti.com>
To: Swamil Jain <s-jain1@ti.com>
CC: <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<tomi.valkeinen@ideasonboard.com>, <r-sharma3@ti.com>, <devarsht@ti.com>,
	<praneeth@ti.com>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] arm64: dts: ti: k3-am62l: Add HDMI & DSI support
Message-ID: <20260529141232.dbtqg6mudjy3dlwh@grandkid>
References: <20260528133529.3476499-1-s-jain1@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260528133529.3476499-1-s-jain1@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E65:EE_|DS3PR10MB997750:EE_
X-MS-Office365-Filtering-Correlation-Id: aaa7c389-eb2e-4806-3d4c-08debd8c64c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|56012099006|18002099003|6133799003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: UUIGFMmlhDe249O0G+yICmhhH1bOgJngqtXu9KVwwwpnWnhLq7xluEpd4L6xIVTMg8B6RZN6DXLKYcpIDz7SnnMu9zti8jY5rc/ZvsdoNkLznOnCJOjJI98zoz1e/N6YaAjh6bhp4m22oHFGzFQ0ziWC883DS182oyy5I5kAHDUj6QQjqSiFsMxDKR64KIF//B6Wy90qRQsg/rrH8+Nu/gzCIvDSSVX3pkmZJRi1GpNnKq61tbHP3SQFn0dMqikb4WPceEIfq6KLHDJC9pHMe96+VUsquu/DUPzKUDap6zgPjHoKySgYWtpuhXKN4UTHEYABfIVkxrFxe+U8ci8JpG+XzHu59A1yOR2Eei6RLcO0xYZ+EkKpdtwT13JuHPkPriv0g+sBFOMeWyGQZcVXSLNUx9m+zSGz4vbA4Io9bx/yEdvCAK88ejJpfBSA4aS/RHJB4AWP2B2nsv290Qsq/GjDIsehqaMzkP4DKzGO/zIFlZ6KLqhUN/2DiNRcYjBAGiwXRATNrUJyBqaLuHajymvWnA7MOtykVtP0PToSmlbdkYXEJn88dAkksuvilRBJ8KI651Rr7n4JOQZUL2fije9LPunfTGP5zKVl3dHfpgL/Op7mYwic8zVd9k5iYSYTaYtdIUeSdxGkMK3r4U0eUZh2r4WfmeT5AtxElMBpBHo8xrVSxnkE/IQPkAubhnsH
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(56012099006)(18002099003)(6133799003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: CFu5On7xgEsdDxt7kZihCge158Dsce2qoVuKENz+BSQJwzVBDxFhMokCWTleTMg3zutyEPzXCSTaRwXyjNGHbBivn9pD1WgJeC4k5BPa9+0RUfGfUEDvCxJ/81sMzNtRtpVYnHZTlhlSMmQVQdFX+0oZHBxTV8cIcpimyOQ75cxpHEeYsudkXwtisyxok+VjDGX0+RA3JdukZjqB+LQ0rhlha8wgUsgCekMQzEOecHkra5l5po1OjUnyV9VWGcvnNSF23B9hUzO6XOx8te/kPeeK8CvBYqsurm5qIBD2IimccLlRyusLtSKgFzseMrp3RsTAURcMslMdurppc6wg7IVN1qmFfnIa2fuCwk/47S/b/UFTKsv+cphiJfAFpbOFMvjLCu2gXuIgYUEiG1UXcUU3XGm3HMQIWh3oezRpEviffKJagZWP2lsqr2fw2FD2
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 14:13:01.5797
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aaa7c389-eb2e-4806-3d4c-08debd8c64c6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00020E65.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR10MB997750
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_071309_007730_90748B63 
X-CRM114-Status: GOOD (  20.21  )
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

On 19:05-20260528, Swamil Jain wrote:
> From: Devarsh Thakkar <devarsht@ti.com>
> 
> Add DSS, DSI, DPHY, and HDMI bridge nodes to enable DPI-to-HDMI output
> on AM62L[1]. The DSS uses parallel DPI interface with pinctrl
> configuration to drive an external SiI9022 HDMI bridge.
> 
> DSI and DPHY nodes are added but remain disabled, as the AM62L shares a
> single video port for DPI and DSI output.
> 
> DSI functionality can be enabled via overlays when required.
> 
> [1]: https://www.ti.com/product/AM62L

1. please split this up. please dont mix the SoC with evm stuff.
2. I suggest DPI output be a overlay as well

> 
> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> Signed-off-by: Swamil Jain <s-jain1@ti.com>
> ---
> Changelog:
> v1->v2:
> - Update the commit message to elaborate more about the patch.
> - Add dpi-pinctrl configuration.
> - Update the interrupt routing index for HDMI interrupt line
> 
> Link to v1: https://lore.kernel.org/all/20260513210942.692269-1-s-jain1@ti.com/
> ---
>  arch/arm64/boot/dts/ti/k3-am62l-main.dtsi | 47 +++++++++++
>  arch/arm64/boot/dts/ti/k3-am62l3-evm.dts  | 95 +++++++++++++++++++++++
>  2 files changed, 142 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi
> index 80615ca1e01a..1d255c9138db 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi
> @@ -584,4 +584,51 @@ scmi_shmem: sram@0 {
>  			bootph-all;
>  		};
>  	};
> +
> +	dss: dss@30200000 {
> +		compatible = "ti,am62l-dss";
> +		reg = <0x00 0x30200000 0x00 0x1000>, /* common */
> +		      <0x00 0x30202000 0x00 0x1000>, /* vidl1 */
> +		      <0x00 0x30207000 0x00 0x1000>, /* ovr1 */
> +		      <0x00 0x3020a000 0x00 0x1000>, /* vp1 */
> +		      <0x00 0x30201000 0x00 0x1000>; /* common1 */
> +		reg-names = "common", "vidl1", "ovr1", "vp1", "common1";
> +		power-domains = <&scmi_pds 39>;
> +		clocks = <&scmi_clk 162>,
> +			 <&scmi_clk 161>;
> +		clock-names = "fck", "vp1";
> +		interrupts = <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>;
> +		status = "disabled";
> +
> +		dss_ports: ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +	};
> +
> +	dphy_tx0: phy@301c0000 {
> +		compatible = "ti,j721e-dphy";
> +		reg = <0x0 0x301c0000 0x0 0x1000>;
> +		clocks = <&scmi_clk 348>, <&scmi_clk 343>;
> +		clock-names = "psm", "pll_ref";
> +		#phy-cells = <0>;
> +		power-domains = <&scmi_pds 86>;
> +		assigned-clocks = <&scmi_clk 343>;
> +		assigned-clock-parents = <&scmi_clk 341>;
> +		assigned-clock-rates = <25000000>;
> +		status = "disabled";
> +	};
> +
> +	dsi0: dsi@30500000 {
> +		compatible = "ti,j721e-dsi";
> +		reg = <0x0 0x30500000 0x0 0x100000>, <0x0 0x30270000 0x0 0x100>;
> +		clocks = <&scmi_clk 155>, <&scmi_clk 158>;
> +		clock-names = "dsi_p_clk", "dsi_sys_clk";
> +		power-domains = <&scmi_pds 38>;
> +		interrupt-parent = <&gic500>;
> +		interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
> +		phys = <&dphy_tx0>;
> +		phy-names = "dphy";
> +		status = "disabled";
> +	};
>  };
> diff --git a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
> index a1af4571a815..9b04fa6d2cba 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
> @@ -119,6 +119,18 @@ vcc_1v8: regulator-3 {
>  		regulator-always-on;
>  		regulator-boot-on;
>  	};
> +
> +	hdmi0: connector-hdmi {
> +		compatible = "hdmi-connector";
> +		label = "hdmi";
> +		type = "a";
> +
> +		port {
> +			hdmi_connector_in: endpoint {
> +				remote-endpoint = <&sii9022_out>;
> +			};
> +		};
> +	};
>  };
>  
>  &gpio0 {
> @@ -192,6 +204,38 @@ exp2: gpio@23 {
>  		bootph-all;
>  	};
>  
> +	sii9022: bridge-hdmi@3b {
> +		compatible = "sil,sii9022";
> +		reg = <0x3b>;
> +		interrupt-parent = <&exp1>;
> +		interrupts = <20 IRQ_TYPE_EDGE_FALLING>;

I see you addressed sashiko comments
https://lore.kernel.org/all/20260514112012.0B0D0C2BCB3@smtp.kernel.org/

but i dont see evidence of HPD working. logs please for the next rev.

> +		#sound-dai-cells = <0>;
> +		sil,i2s-data-lanes = < 0 >;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&dpi_pins_default>;
> +		bootph-all;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				sii9022_in: endpoint {
> +					remote-endpoint = <&dpi_out>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +
> +				sii9022_out: endpoint {
> +					remote-endpoint = <&hdmi_connector_in>;
> +				};
> +			};
> +		};
> +	};
>  };
>  
>  &i2c2 {
> @@ -221,6 +265,41 @@ usb_con_hs: endpoint {
>  };
>  
>  &pmx0 {
> +	dpi_pins_default: dpi-default-pins {
> +		pinctrl-single,pins = <
> +			AM62LX_IOPAD(0x00e4, PIN_OUTPUT, 1) /* (L20) GPMC0_CSn0.VOUT0_VSYNC */
> +			AM62LX_IOPAD(0x00dc, PIN_OUTPUT, 1) /* (N21) GPMC0_WPn.VOUT0_HSYNC */
> +			AM62LX_IOPAD(0x00e8, PIN_OUTPUT, 1) /* (L19) GPMC0_CSn1.VOUT0_PCLK */
> +			AM62LX_IOPAD(0x00e0, PIN_OUTPUT, 1) /* (M21) GPMC0_DIR.VOUT0_DE */
> +			AM62LX_IOPAD(0x0078, PIN_OUTPUT, 1) /* (L22) GPMC0_AD0.VOUT0_DATA0 */
> +			AM62LX_IOPAD(0x007c, PIN_OUTPUT, 1) /* (L23) GPMC0_AD1.VOUT0_DATA1 */
> +			AM62LX_IOPAD(0x0080, PIN_OUTPUT, 1) /* (K22) GPMC0_AD2.VOUT0_DATA2 */
> +			AM62LX_IOPAD(0x0084, PIN_OUTPUT, 1) /* (J23) GPMC0_AD3.VOUT0_DATA3 */
> +			AM62LX_IOPAD(0x0088, PIN_OUTPUT, 1) /* (K23) GPMC0_AD4.VOUT0_DATA4 */
> +			AM62LX_IOPAD(0x008c, PIN_OUTPUT, 1) /* (H22) GPMC0_AD5.VOUT0_DATA5 */
> +			AM62LX_IOPAD(0x0090, PIN_OUTPUT, 1) /* (H23) GPMC0_AD6.VOUT0_DATA6 */
> +			AM62LX_IOPAD(0x0094, PIN_OUTPUT, 1) /* (J22) GPMC0_AD7.VOUT0_DATA7 */
> +			AM62LX_IOPAD(0x0098, PIN_OUTPUT, 1) /* (H19) GPMC0_AD8.VOUT0_DATA8 */
> +			AM62LX_IOPAD(0x009c, PIN_OUTPUT, 1) /* (H20) GPMC0_AD9.VOUT0_DATA9 */
> +			AM62LX_IOPAD(0x00a0, PIN_OUTPUT, 1) /* (H21) GPMC0_AD10.VOUT0_DATA10 */
> +			AM62LX_IOPAD(0x00a4, PIN_OUTPUT, 1) /* (H18) GPMC0_AD11.VOUT0_DATA11 */
> +			AM62LX_IOPAD(0x00a8, PIN_OUTPUT, 1) /* (G23) GPMC0_AD12.VOUT0_DATA12 */
> +			AM62LX_IOPAD(0x00ac, PIN_OUTPUT, 1) /* (G22) GPMC0_AD13.VOUT0_DATA13 */
> +			AM62LX_IOPAD(0x00b0, PIN_OUTPUT, 1) /* (F22) GPMC0_AD14.VOUT0_DATA14 */
> +			AM62LX_IOPAD(0x00b4, PIN_OUTPUT, 1) /* (F23) GPMC0_AD15.VOUT0_DATA15 */
> +			AM62LX_IOPAD(0x00b8, PIN_OUTPUT, 1) /* (L21) GPMC0_CLK.VOUT0_DATA16 */
> +			AM62LX_IOPAD(0x00c0, PIN_OUTPUT, 1) /* (N19) GPMC0_ADVn_ALE.VOUT0_DATA17 */
> +			AM62LX_IOPAD(0x00c4, PIN_OUTPUT, 1) /* (N20) GPMC0_OEn_REn.VOUT0_DATA18 */
> +			AM62LX_IOPAD(0x00c8, PIN_OUTPUT, 1) /* (M19) GPMC0_WEn.VOUT0_DATA19 */
> +			AM62LX_IOPAD(0x00cc, PIN_OUTPUT, 1) /* (P23) GPMC0_BE0n_CLE.VOUT0_DATA20 */
> +			AM62LX_IOPAD(0x00d0, PIN_OUTPUT, 1) /* (P22) GPMC0_BE1n.VOUT0_DATA21 */
> +			AM62LX_IOPAD(0x00d4, PIN_OUTPUT, 1) /* (N23) GPMC0_WAIT0.VOUT0_DATA22 */
> +			AM62LX_IOPAD(0x00d8, PIN_OUTPUT, 1) /* (N22) GPMC0_WAIT1.VOUT0_DATA23 */
> +			AM62LX_IOPAD(0x00ec, PIN_OUTPUT, 5) /* (M23) GPMC0_CSn2.VOUT0_EXTPCLKIN */
> +		>;
> +		bootph-all;
> +	};
> +
>  	gpio0_ioexp_intr_pins_default: gpio0-ioexp-intr-default-pins {
>  		pinctrl-single,pins = <
>  			AM62LX_IOPAD(0x01b0, PIN_INPUT, 7) /* (B12) SPI0_D1.GPIO0_91 */
> @@ -375,6 +454,22 @@ &usb1 {
>  	pinctrl-0 = <&usb1_default_pins>;
>  };
>  
> +&dss {
> +	status = "okay";
> +	bootph-all;
> +};
> +
> +&dss_ports {
> +	/* VP1: DPI Output */
> +	port@0 {
> +		reg = <0>;
> +
> +		dpi_out: endpoint {
> +			remote-endpoint = <&sii9022_in>;
> +		};
> +	};
> +};
> +

Did we miss routing audio? I think it has an option of going to M2.key

>  &wkup_uart0 {
>  	pinctrl-0 = <&wkup_uart0_pins_default>;
>  	pinctrl-names = "default";
> 

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource

