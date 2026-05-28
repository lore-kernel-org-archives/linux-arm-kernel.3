Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BC67CD6E44
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 13:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gP+9y4O2Lp7kB94SDvbkc0LR8U1mMdvxqlvOXr8TuNU=; b=txbqvKUXH+ZGiLeG5PdGM1PdQO
	qBRT61OUo/QTvJjipUdgd2jH1twIdKWKG8gFflpyXsEBSacp35wbed5cJ+mXPd/SeQ8XAAQeaRU6s
	yDMXUFCxaOoSqh86VJQi3BS8eC2VaTsaLKxG/2NAtbstChptKeyxyqXLtObsmKm6xx/ccmnSkLywb
	pBym2oi7WCx1J0OMkSC1SeEd5hKpKuGls6T3SKLur/NIGcSTh7PFffm1Mn9GJd/LEUcHt6ovXWqTP
	D8NuLFNYMGbyjN+4TODWKWkjG3TZ/EorpbjIXly5oJ9phgzUlFgXcoYPxHKDLoydVGvS2b3R0QA91
	M0d2GRIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSauW-00000005n5r-1MUC;
	Thu, 28 May 2026 13:36:32 +0000
Received: from mail-eastusazlp170120007.outbound.protection.outlook.com ([2a01:111:f403:c101::7] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSauR-00000005n5T-3SXe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 13:36:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MU2kRnoWQvB1cqiZ6GEphO512ENIhZpaBO6kZAOjFpiZWC4UvfQHrzbjepZDC7jQ1Cv8TodIk8ycko1+uIuzDoZp7OOo3OgyPAZ+kTMhInTfwQY6LdGfvEdNhStk7CuSHQfaokU9FCo5b70FREyrjYujs8pUGAIwlgJ2Lr9htxgeJ115G/dw06t/aWbodwALCc5SdZYt5u8bTzGOTMUTA0np17N6RXoU/Dn/HE0nwolizqytJjwE3rqBZHVj9YALuMqDiaUdM2KO1XTeutbFiiwyz4hdE3nWxIoc8waLSzSUHNlipIJ9DN7ZhRFPKpFZgvksNJJdqVCpzT9v0xxGrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gP+9y4O2Lp7kB94SDvbkc0LR8U1mMdvxqlvOXr8TuNU=;
 b=CqQOXuihTCVZb7XLsFLPlbiLuDTp/O++tEuG4q+yif9isdd3pGMHugEfiPs9SXYQa4/nHgn1DXvb7PlK0jK6tOazhNLYIawGp69VV0FDc3FfbMZy2iFxvE3HyDcX3g/9coEFvIDW9N3Sd32GE+Aed1fntKhRvXxCR6b2WUqN5/WHmsYGunhXqu1qoP1tu5F2yDq96NcUnZQAORQuKZQHUTBp457wv3jOGORraXQtqEqzvyS9GCLTW+Gaq1pnmrVLNjIhqDCM9nEawbL3N4Bh38Fu0Ioy4dZMuIEFri2WOJxxPZ+sE4Uhlsen31E3+Pl7KUmR9OfevT0TQA/umAXj6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gP+9y4O2Lp7kB94SDvbkc0LR8U1mMdvxqlvOXr8TuNU=;
 b=And2Y2AHVoIu1iEJ04MANW6HAsxxWOTw/ssLEIhA46bOlcVJkEBK0YUIJVeUZuHbICPacQc8SFkzKdCBk+dwfH7OYMlo99P6oU1kBufXIw4oi7G85xkAU7wUo+8pMuHLbxaGHeQ8ukLXq7U3MqQNWbuIyOux0Soa6RlHkSRqXHw=
Received: from DS7P221CA0003.NAMP221.PROD.OUTLOOK.COM (2603:10b6:8:25b::10) by
 MW5PR10MB5875.namprd10.prod.outlook.com (2603:10b6:303:191::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.13; Thu, 28 May
 2026 13:36:16 +0000
Received: from DS2PEPF000061C3.namprd02.prod.outlook.com
 (2603:10b6:8:25b:cafe::4b) by DS7P221CA0003.outlook.office365.com
 (2603:10b6:8:25b::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.13 via Frontend Transport; Thu, 28
 May 2026 13:36:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS2PEPF000061C3.mail.protection.outlook.com (10.167.23.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Thu, 28 May 2026 13:36:15 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 28 May
 2026 08:35:35 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 28 May
 2026 08:35:34 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 28 May 2026 08:35:34 -0500
Received: from a0512632.dhcp.ti.com (a0512632.dhcp.ti.com [172.24.233.20])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64SDZUbt1602642;
	Thu, 28 May 2026 08:35:31 -0500
From: Swamil Jain <s-jain1@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<tomi.valkeinen@ideasonboard.com>
CC: <r-sharma3@ti.com>, <devarsht@ti.com>, <praneeth@ti.com>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <s-jain1@ti.com>
Subject: [PATCH v2] arm64: dts: ti: k3-am62l: Add HDMI & DSI support
Date: Thu, 28 May 2026 19:05:29 +0530
Message-ID: <20260528133529.3476499-1-s-jain1@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C3:EE_|MW5PR10MB5875:EE_
X-MS-Office365-Filtering-Correlation-Id: a67da298-d654-446a-05e9-08debcbe1721
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|3023799007|56012099006|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info: m4UNdNDdEzWllYMlgcFUiuhME06Ji8bgp3Ol5zghyxZmOff7VTE/YsbmZk42dDMuKKCvGfOeYp7NnSkDT4LNEUfpm2kUavcWghOfY3yV9fe7hYduW4KjpR+qEsM1xhNo7PCFrWYWB7npuBptcbuNkMMDDfoQDCVDYu/xkH7LzqXyuY4wK3CIDG63iwzhSAtHLUJNIRuEGhZ2bUnf5unKZ71h/JHkZcPBCCta/j5LjjiB1QIdUxN2Ky0b/0TXVDwCFuUKoWB7BBaUBoAGVxQC+TuYYnjZM1PNe6sGbL1GswOg4HdfDXjXuAsiZpRbkh0zjiCxTppuKrPA2SRPjU30VkclwUvHQuPM7jU1z///Jetdo82kCbTsm4tmcBgaNOQEMguHFE5jggWTKlbGBSY0umpkS4F7JcZNzLBX8ERH4BgZrC9ysjWLSLUpuC+yV9fvgOu+NE45kOtZQEFvwQXSF7p7bxRoV2iHmI9xG7zgMB2hmxDotPyTs6OOIs4OymBe5sLB4pr29H5Ch1iKdS/Wkf7swyJVAyrO8BDE9I6ekLh7e2gF0qjmYfQIdesBRD9274aB1/Fh05au+wwf1OD4LQ2TYmz6Bkl6iDOiOfpDJaYrP+4NDirle72aGWMGjip761o7uzCPrlLhzz2vHBGKJSe6tC1yAIvDIJgwKbCqo24P83Cr3k/2ycqMh7ZtE2SiGzV660/bfUnD7aYv3DJksMZsFOI7Xk3U6ff6i/Xrbpg=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(3023799007)(56012099006)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 0UrHemd3J8KttwqUQPxNaSvJWgG7TLv9MVt5sQoLfhMw4NvsuenWSG6dE6JrbfL9DgZLIoqOdQvaVsMclbVWDvgSgJXOwjlyp5W3lUAVCJcX+y+03dQov17a1nmZeiSx7jRIguWL2yx7KoceWn2wLFflWcQlbo+Y7VP2TtGHn9ZlurnqgNmAHsIlgaWcEQIGyB6P8kYKngKieDbilc17MKMSclnfMv/rLI35d87zKmYZYRFUXGFe48TZaHaIte1EDz306N1LBAHJeJyoH7UBe0dvI9gcHHjfOBURJBuCr3KKLh2164UaWDvrHv+Me6MriClJ07fF74P/s4kBhXd8+vM6uqtc8kyo++BevyX4QKzmJZJa6Qvz7EFrX5tgk6FCThOQ3HppqC7gBnRU9Lap9TKtN3WXdFjO3ktcLXTayU8SKjsbvEdEzgi9M0WgkxXP
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 13:36:15.0105
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a67da298-d654-446a-05e9-08debcbe1721
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF000061C3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5875
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_063627_870026_1FD765F2 
X-CRM114-Status: GOOD (  12.30  )
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

From: Devarsh Thakkar <devarsht@ti.com>

Add DSS, DSI, DPHY, and HDMI bridge nodes to enable DPI-to-HDMI output
on AM62L[1]. The DSS uses parallel DPI interface with pinctrl
configuration to drive an external SiI9022 HDMI bridge.

DSI and DPHY nodes are added but remain disabled, as the AM62L shares a
single video port for DPI and DSI output.

DSI functionality can be enabled via overlays when required.

[1]: https://www.ti.com/product/AM62L

Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
Signed-off-by: Swamil Jain <s-jain1@ti.com>
---
Changelog:
v1->v2:
- Update the commit message to elaborate more about the patch.
- Add dpi-pinctrl configuration.
- Update the interrupt routing index for HDMI interrupt line

Link to v1: https://lore.kernel.org/all/20260513210942.692269-1-s-jain1@ti.com/
---
 arch/arm64/boot/dts/ti/k3-am62l-main.dtsi | 47 +++++++++++
 arch/arm64/boot/dts/ti/k3-am62l3-evm.dts  | 95 +++++++++++++++++++++++
 2 files changed, 142 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi
index 80615ca1e01a..1d255c9138db 100644
--- a/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi
@@ -584,4 +584,51 @@ scmi_shmem: sram@0 {
 			bootph-all;
 		};
 	};
+
+	dss: dss@30200000 {
+		compatible = "ti,am62l-dss";
+		reg = <0x00 0x30200000 0x00 0x1000>, /* common */
+		      <0x00 0x30202000 0x00 0x1000>, /* vidl1 */
+		      <0x00 0x30207000 0x00 0x1000>, /* ovr1 */
+		      <0x00 0x3020a000 0x00 0x1000>, /* vp1 */
+		      <0x00 0x30201000 0x00 0x1000>; /* common1 */
+		reg-names = "common", "vidl1", "ovr1", "vp1", "common1";
+		power-domains = <&scmi_pds 39>;
+		clocks = <&scmi_clk 162>,
+			 <&scmi_clk 161>;
+		clock-names = "fck", "vp1";
+		interrupts = <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>;
+		status = "disabled";
+
+		dss_ports: ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+
+	dphy_tx0: phy@301c0000 {
+		compatible = "ti,j721e-dphy";
+		reg = <0x0 0x301c0000 0x0 0x1000>;
+		clocks = <&scmi_clk 348>, <&scmi_clk 343>;
+		clock-names = "psm", "pll_ref";
+		#phy-cells = <0>;
+		power-domains = <&scmi_pds 86>;
+		assigned-clocks = <&scmi_clk 343>;
+		assigned-clock-parents = <&scmi_clk 341>;
+		assigned-clock-rates = <25000000>;
+		status = "disabled";
+	};
+
+	dsi0: dsi@30500000 {
+		compatible = "ti,j721e-dsi";
+		reg = <0x0 0x30500000 0x0 0x100000>, <0x0 0x30270000 0x0 0x100>;
+		clocks = <&scmi_clk 155>, <&scmi_clk 158>;
+		clock-names = "dsi_p_clk", "dsi_sys_clk";
+		power-domains = <&scmi_pds 38>;
+		interrupt-parent = <&gic500>;
+		interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
+		phys = <&dphy_tx0>;
+		phy-names = "dphy";
+		status = "disabled";
+	};
 };
diff --git a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
index a1af4571a815..9b04fa6d2cba 100644
--- a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
@@ -119,6 +119,18 @@ vcc_1v8: regulator-3 {
 		regulator-always-on;
 		regulator-boot-on;
 	};
+
+	hdmi0: connector-hdmi {
+		compatible = "hdmi-connector";
+		label = "hdmi";
+		type = "a";
+
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&sii9022_out>;
+			};
+		};
+	};
 };
 
 &gpio0 {
@@ -192,6 +204,38 @@ exp2: gpio@23 {
 		bootph-all;
 	};
 
+	sii9022: bridge-hdmi@3b {
+		compatible = "sil,sii9022";
+		reg = <0x3b>;
+		interrupt-parent = <&exp1>;
+		interrupts = <20 IRQ_TYPE_EDGE_FALLING>;
+		#sound-dai-cells = <0>;
+		sil,i2s-data-lanes = < 0 >;
+		pinctrl-names = "default";
+		pinctrl-0 = <&dpi_pins_default>;
+		bootph-all;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				sii9022_in: endpoint {
+					remote-endpoint = <&dpi_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				sii9022_out: endpoint {
+					remote-endpoint = <&hdmi_connector_in>;
+				};
+			};
+		};
+	};
 };
 
 &i2c2 {
@@ -221,6 +265,41 @@ usb_con_hs: endpoint {
 };
 
 &pmx0 {
+	dpi_pins_default: dpi-default-pins {
+		pinctrl-single,pins = <
+			AM62LX_IOPAD(0x00e4, PIN_OUTPUT, 1) /* (L20) GPMC0_CSn0.VOUT0_VSYNC */
+			AM62LX_IOPAD(0x00dc, PIN_OUTPUT, 1) /* (N21) GPMC0_WPn.VOUT0_HSYNC */
+			AM62LX_IOPAD(0x00e8, PIN_OUTPUT, 1) /* (L19) GPMC0_CSn1.VOUT0_PCLK */
+			AM62LX_IOPAD(0x00e0, PIN_OUTPUT, 1) /* (M21) GPMC0_DIR.VOUT0_DE */
+			AM62LX_IOPAD(0x0078, PIN_OUTPUT, 1) /* (L22) GPMC0_AD0.VOUT0_DATA0 */
+			AM62LX_IOPAD(0x007c, PIN_OUTPUT, 1) /* (L23) GPMC0_AD1.VOUT0_DATA1 */
+			AM62LX_IOPAD(0x0080, PIN_OUTPUT, 1) /* (K22) GPMC0_AD2.VOUT0_DATA2 */
+			AM62LX_IOPAD(0x0084, PIN_OUTPUT, 1) /* (J23) GPMC0_AD3.VOUT0_DATA3 */
+			AM62LX_IOPAD(0x0088, PIN_OUTPUT, 1) /* (K23) GPMC0_AD4.VOUT0_DATA4 */
+			AM62LX_IOPAD(0x008c, PIN_OUTPUT, 1) /* (H22) GPMC0_AD5.VOUT0_DATA5 */
+			AM62LX_IOPAD(0x0090, PIN_OUTPUT, 1) /* (H23) GPMC0_AD6.VOUT0_DATA6 */
+			AM62LX_IOPAD(0x0094, PIN_OUTPUT, 1) /* (J22) GPMC0_AD7.VOUT0_DATA7 */
+			AM62LX_IOPAD(0x0098, PIN_OUTPUT, 1) /* (H19) GPMC0_AD8.VOUT0_DATA8 */
+			AM62LX_IOPAD(0x009c, PIN_OUTPUT, 1) /* (H20) GPMC0_AD9.VOUT0_DATA9 */
+			AM62LX_IOPAD(0x00a0, PIN_OUTPUT, 1) /* (H21) GPMC0_AD10.VOUT0_DATA10 */
+			AM62LX_IOPAD(0x00a4, PIN_OUTPUT, 1) /* (H18) GPMC0_AD11.VOUT0_DATA11 */
+			AM62LX_IOPAD(0x00a8, PIN_OUTPUT, 1) /* (G23) GPMC0_AD12.VOUT0_DATA12 */
+			AM62LX_IOPAD(0x00ac, PIN_OUTPUT, 1) /* (G22) GPMC0_AD13.VOUT0_DATA13 */
+			AM62LX_IOPAD(0x00b0, PIN_OUTPUT, 1) /* (F22) GPMC0_AD14.VOUT0_DATA14 */
+			AM62LX_IOPAD(0x00b4, PIN_OUTPUT, 1) /* (F23) GPMC0_AD15.VOUT0_DATA15 */
+			AM62LX_IOPAD(0x00b8, PIN_OUTPUT, 1) /* (L21) GPMC0_CLK.VOUT0_DATA16 */
+			AM62LX_IOPAD(0x00c0, PIN_OUTPUT, 1) /* (N19) GPMC0_ADVn_ALE.VOUT0_DATA17 */
+			AM62LX_IOPAD(0x00c4, PIN_OUTPUT, 1) /* (N20) GPMC0_OEn_REn.VOUT0_DATA18 */
+			AM62LX_IOPAD(0x00c8, PIN_OUTPUT, 1) /* (M19) GPMC0_WEn.VOUT0_DATA19 */
+			AM62LX_IOPAD(0x00cc, PIN_OUTPUT, 1) /* (P23) GPMC0_BE0n_CLE.VOUT0_DATA20 */
+			AM62LX_IOPAD(0x00d0, PIN_OUTPUT, 1) /* (P22) GPMC0_BE1n.VOUT0_DATA21 */
+			AM62LX_IOPAD(0x00d4, PIN_OUTPUT, 1) /* (N23) GPMC0_WAIT0.VOUT0_DATA22 */
+			AM62LX_IOPAD(0x00d8, PIN_OUTPUT, 1) /* (N22) GPMC0_WAIT1.VOUT0_DATA23 */
+			AM62LX_IOPAD(0x00ec, PIN_OUTPUT, 5) /* (M23) GPMC0_CSn2.VOUT0_EXTPCLKIN */
+		>;
+		bootph-all;
+	};
+
 	gpio0_ioexp_intr_pins_default: gpio0-ioexp-intr-default-pins {
 		pinctrl-single,pins = <
 			AM62LX_IOPAD(0x01b0, PIN_INPUT, 7) /* (B12) SPI0_D1.GPIO0_91 */
@@ -375,6 +454,22 @@ &usb1 {
 	pinctrl-0 = <&usb1_default_pins>;
 };
 
+&dss {
+	status = "okay";
+	bootph-all;
+};
+
+&dss_ports {
+	/* VP1: DPI Output */
+	port@0 {
+		reg = <0>;
+
+		dpi_out: endpoint {
+			remote-endpoint = <&sii9022_in>;
+		};
+	};
+};
+
 &wkup_uart0 {
 	pinctrl-0 = <&wkup_uart0_pins_default>;
 	pinctrl-names = "default";

