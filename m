Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84341C021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 11:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4f+U9qTsk58DWRyTw7yq4CUfhhc1GxUeYpyu1AojW7Q=; b=JuZMD2Zb43oGvipuVbOvZmGV4d
	RZlyJ8g3XJwvr4scuzqoI/KYjZfYJvJSAH2+J8HX9aOY0Z+jTw3K2yNs9sC9ohYLKFOljrMY2kTZj
	LuLWkGFkewnXFAhlteC0cZhTEFBZ2UMv0PSk/smWuEsFNgnKxxPU/75X6sMV7XMa3RqNfdZ2XojES
	Occf9JXNqs6cXniw38SIe1nt6WWDsW/SQ11TzJDYaTeq/NrAIgcXe9RH6JWqQm09mo9fwWUhfw9wc
	PStPzVKbSrPMq/F5H+Ib7GMhpbH1P4aC+xWcYAULjONB/bzQDvyS1bYlAfU2D0MpMTdIBd+P9UKWL
	2TYqokZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl4Hz-00000000QNf-26Ue;
	Thu, 20 Feb 2025 11:00:19 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl4Da-00000000P2Y-3pBL;
	Thu, 20 Feb 2025 10:55:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1740048945;
	bh=yfGwynM8RSTXwKBvPY6q4QAZb29IgFCx6MpLyWY3uKg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QGfNI4PEsp/P4oG0XslLQZWS5x6jCFUhblFrJdHayiAkQ/B/4fEHt4s6WT+b5S8eF
	 vgXxLCds55Kx1YG62P/ndjpM+qD/uKpwj5VZ2k22MSV+coIMOGcT0kK8MHcAzINkvh
	 IzIUhdCOG5xv5fjruwbdDIH5PSJIa3Eo+T2LNmKsL2JQ6BFy449IfvkEAypFFp0c/O
	 pg4LWaFrtqNSNXT7uqqgpGDVqEMZWSBiaUISKAhkL2eM2qNlfGJEQuadnhmpKNSfAm
	 jaUVd1LLC7CGY9Qv5ybtekz5+pjclnXzUgJAdDaxlW2XILLPlSGBfHJmVZzz0BUFGv
	 SRlcWRLgUNkyw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 89BDB17E156B;
	Thu, 20 Feb 2025 11:55:44 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunfeng.yun@mediatek.com
Cc: gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com,
	pablo.sun@mediatek.com
Subject: [PATCH v3 2/3] arm64: dts: mediatek: mt8188: Add MTU3 nodes and correctly describe USB
Date: Thu, 20 Feb 2025 11:55:13 +0100
Message-ID: <20250220105514.43107-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250220105514.43107-1-angelogioacchino.delregno@collabora.com>
References: <20250220105514.43107-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_025547_120659_25CF59BB 
X-CRM114-Status: GOOD (  10.63  )
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

The MT8188 SoC has three USB controllers, and all of them are behind
the MTU3 DRD controller.

Add the missing MTU3 nodes, default disabled, for all USB controllers
and move the related XHCI nodes to be children of their MTU3 DRD to
correctly describe the SoC.

In order to retain USB functionality on all of the MT8188 and MT8390
boards, also move the vusb33 supply and enable the relevant MTU3 nodes
with special attention to the MT8188 Geralt Chromebooks, where it was
necessary to set the dr_mode of all MTU3 controllers to host to avoid
interfering with the EC performing DRD on its own.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../boot/dts/mediatek/mt8188-geralt.dtsi      |  18 +++
 arch/arm64/boot/dts/mediatek/mt8188.dtsi      | 121 ++++++++++++------
 .../dts/mediatek/mt8390-genio-common.dtsi     |  28 ++++
 3 files changed, 125 insertions(+), 42 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
index b6abecbcfa81..faed5c8bc721 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
@@ -1103,6 +1103,12 @@ &u3phy2 {
 };
 
 /* USB detachable base */
+&ssusb0 {
+	dr_mode = "host";
+	vusb33-supply = <&pp3300_s3>;
+	status = "okay";
+};
+
 &xhci0 {
 	/* controlled by EC */
 	vbus-supply = <&pp3300_z1>;
@@ -1110,6 +1116,12 @@ &xhci0 {
 };
 
 /* USB3 hub */
+&ssusb1 {
+	dr_mode = "host";
+	vusb33-supply = <&pp3300_s3>;
+	status = "okay";
+};
+
 &xhci1 {
 	vusb33-supply = <&pp3300_s3>;
 	vbus-supply = <&pp5000_usb_vbus>;
@@ -1117,6 +1129,12 @@ &xhci1 {
 };
 
 /* USB BT */
+&ssusb2 {
+	dr_mode = "host";
+	vusb33-supply = <&pp3300_s3>;
+	status = "okay";
+};
+
 &xhci2 {
 	/* no power supply since MT7921's power is controlled by PCIe */
 	/* MT7921's USB BT has issues with USB2 LPM */
diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index d2e1ff7236b1..c226998b7e47 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -1649,6 +1649,38 @@ spi5: spi@11019000 {
 			status = "disabled";
 		};
 
+		ssusb1: usb@11201000 {
+			compatible = "mediatek,mt8188-mtu3", "mediatek,mtu3";
+			reg = <0 0x11201000 0 0x2dff>, <0 0x11203e00 0 0x0100>;
+			reg-names = "mac", "ippc";
+			ranges = <0 0 0 0x11200000 0 0x3f00>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH 0>;
+			assigned-clocks = <&topckgen CLK_TOP_USB_TOP>;
+			assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D5_D4>;
+			clocks = <&pericfg_ao CLK_PERI_AO_SSUSB_BUS>,
+				 <&topckgen CLK_TOP_SSUSB_TOP_REF>,
+				 <&pericfg_ao CLK_PERI_AO_SSUSB_XHCI>;
+			clock-names = "sys_ck", "ref_ck", "mcu_ck";
+			phys = <&u2port1 PHY_TYPE_USB2>, <&u3port1 PHY_TYPE_USB3>;
+			wakeup-source;
+			mediatek,syscon-wakeup = <&pericfg 0x468 2>;
+			status = "disabled";
+
+			xhci1: usb@0 {
+				compatible = "mediatek,mt8188-xhci", "mediatek,mtk-xhci";
+				reg = <0 0 0 0x1000>;
+				reg-names = "mac";
+				interrupts = <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH 0>;
+				assigned-clocks = <&topckgen CLK_TOP_SSUSB_XHCI>;
+				assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D5_D4>;
+				clocks = <&pericfg_ao CLK_PERI_AO_SSUSB_XHCI>;
+				clock-names = "sys_ck";
+				status = "disabled";
+			};
+		};
+
 		eth: ethernet@11021000 {
 			compatible = "mediatek,mt8188-gmac", "mediatek,mt8195-gmac",
 				     "snps,dwmac-5.10a";
@@ -1746,27 +1778,6 @@ queue3 {
 			};
 		};
 
-		xhci1: usb@11200000 {
-			compatible = "mediatek,mt8188-xhci", "mediatek,mtk-xhci";
-			reg = <0 0x11200000 0 0x1000>,
-			      <0 0x11203e00 0 0x0100>;
-			reg-names = "mac", "ippc";
-			interrupts = <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH 0>;
-			phys = <&u2port1 PHY_TYPE_USB2>,
-			       <&u3port1 PHY_TYPE_USB3>;
-			assigned-clocks = <&topckgen CLK_TOP_USB_TOP>,
-					  <&topckgen CLK_TOP_SSUSB_XHCI>;
-			assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D5_D4>,
-						 <&topckgen CLK_TOP_UNIVPLL_D5_D4>;
-			clocks = <&pericfg_ao CLK_PERI_AO_SSUSB_BUS>,
-				 <&topckgen CLK_TOP_SSUSB_TOP_REF>,
-				 <&pericfg_ao CLK_PERI_AO_SSUSB_XHCI>;
-			clock-names = "sys_ck", "ref_ck", "mcu_ck";
-			mediatek,syscon-wakeup = <&pericfg 0x468 2>;
-			wakeup-source;
-			status = "disabled";
-		};
-
 		mmc0: mmc@11230000 {
 			compatible = "mediatek,mt8188-mmc", "mediatek,mt8183-mmc";
 			reg = <0 0x11230000 0 0x10000>,
@@ -1867,42 +1878,68 @@ imp_iic_wrap_c: clock-controller@11283000 {
 			#clock-cells = <1>;
 		};
 
-		xhci2: usb@112a0000 {
-			compatible = "mediatek,mt8188-xhci", "mediatek,mtk-xhci";
-			reg = <0 0x112a0000 0 0x1000>,
-			      <0 0x112a3e00 0 0x0100>;
+		ssusb2: usb@112a1000 {
+			compatible = "mediatek,mt8188-mtu3", "mediatek,mtu3";
+			reg = <0 0x112a1000 0 0x2dff>, <0 0x112a3e00 0 0x0100>;
 			reg-names = "mac", "ippc";
-			interrupts = <GIC_SPI 536 IRQ_TYPE_LEVEL_HIGH 0>;
-			phys = <&u2port2 PHY_TYPE_USB2>;
-			assigned-clocks = <&topckgen CLK_TOP_SSUSB_XHCI_3P>,
-					  <&topckgen CLK_TOP_USB_TOP_3P>;
-			assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D5_D4>,
-						 <&topckgen CLK_TOP_UNIVPLL_D5_D4>;
+			ranges = <0 0 0 0x112a0000 0 0x3f00>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			interrupts = <GIC_SPI 535 IRQ_TYPE_LEVEL_HIGH 0>;
+			assigned-clocks = <&topckgen CLK_TOP_USB_TOP_3P>;
+			assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D5_D4>;
 			clocks = <&pericfg_ao CLK_PERI_AO_SSUSB_3P_BUS>,
 				 <&topckgen CLK_TOP_SSUSB_TOP_P3_REF>,
 				 <&pericfg_ao CLK_PERI_AO_SSUSB_3P_XHCI>;
 			clock-names = "sys_ck", "ref_ck", "mcu_ck";
+			phys = <&u2port2 PHY_TYPE_USB2>;
+			wakeup-source;
+			mediatek,syscon-wakeup = <&pericfg 0x470 2>;
 			status = "disabled";
+
+			xhci2: usb@0 {
+				compatible = "mediatek,mt8188-xhci", "mediatek,mtk-xhci";
+				reg = <0 0 0 0x1000>;
+				reg-names = "mac";
+				interrupts = <GIC_SPI 536 IRQ_TYPE_LEVEL_HIGH 0>;
+				assigned-clocks = <&topckgen CLK_TOP_SSUSB_XHCI_3P>;
+				assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D5_D4>;
+				clocks = <&pericfg_ao CLK_PERI_AO_SSUSB_3P_XHCI>;
+				clock-names = "sys_ck";
+				status = "disabled";
+			};
 		};
 
-		xhci0: usb@112b0000 {
-			compatible = "mediatek,mt8188-xhci", "mediatek,mtk-xhci";
-			reg = <0 0x112b0000 0 0x1000>,
-			      <0 0x112b3e00 0 0x0100>;
+		ssusb0: usb@112b1000 {
+			compatible = "mediatek,mt8188-mtu3", "mediatek,mtu3";
+			reg = <0 0x112b1000 0 0x2dff>, <0 0x112b3e00 0 0x0100>;
 			reg-names = "mac", "ippc";
-			interrupts = <GIC_SPI 533 IRQ_TYPE_LEVEL_HIGH 0>;
-			phys = <&u2port0 PHY_TYPE_USB2>;
-			assigned-clocks = <&topckgen CLK_TOP_SSUSB_XHCI_2P>,
-					  <&topckgen CLK_TOP_USB_TOP_2P>;
-			assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D5_D4>,
-						 <&topckgen CLK_TOP_UNIVPLL_D5_D4>;
+			ranges = <0 0 0 0x112b0000 0 0x3f00>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			interrupts = <GIC_SPI 532 IRQ_TYPE_LEVEL_HIGH 0>;
+			assigned-clocks = <&topckgen CLK_TOP_SSUSB_XHCI_2P>;
+			assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D5_D4>;
 			clocks = <&pericfg_ao CLK_PERI_AO_SSUSB_2P_BUS>,
 				 <&topckgen CLK_TOP_SSUSB_TOP_P2_REF>,
 				 <&pericfg_ao CLK_PERI_AO_SSUSB_2P_XHCI>;
 			clock-names = "sys_ck", "ref_ck", "mcu_ck";
-			mediatek,syscon-wakeup = <&pericfg 0x460 2>;
+			phys = <&u2port0 PHY_TYPE_USB2>;
 			wakeup-source;
+			mediatek,syscon-wakeup = <&pericfg 0x460 2>;
 			status = "disabled";
+
+			xhci0: usb@0 {
+				compatible = "mediatek,mt8188-xhci", "mediatek,mtk-xhci";
+				reg = <0 0 0 0x1000>;
+				reg-names = "mac";
+				interrupts = <GIC_SPI 533 IRQ_TYPE_LEVEL_HIGH 0>;
+				assigned-clocks = <&topckgen CLK_TOP_USB_TOP_2P>;
+				assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D5_D4>;
+				clocks = <&pericfg_ao CLK_PERI_AO_SSUSB_2P_XHCI>;
+				clock-names = "sys_ck";
+				status = "disabled";
+			};
 		};
 
 		pcie: pcie@112f0000 {
diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
index a37cf102a6e9..fd977daa4185 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
@@ -1011,13 +1011,25 @@ &u3phy2 {
 	status = "okay";
 };
 
+&ssusb0 {
+	dr_mode = "host";
+	vusb33-supply = <&mt6359_vusb_ldo_reg>;
+	status = "okay";
+};
+
 &xhci0 {
 	status = "okay";
+};
+
+&ssusb1 {
+	dr_mode = "host";
 	vusb33-supply = <&mt6359_vusb_ldo_reg>;
+	status = "okay";
 };
 
 &xhci1 {
 	status = "okay";
+	vdd-supply = <&usb_hub_fixed_3v3>;
 	vusb33-supply = <&mt6359_vusb_ldo_reg>;
 	#address-cells = <1>;
 	#size-cells = <0>;
@@ -1037,6 +1049,22 @@ hub_3_0: hub@2 {
 		reset-gpios = <&pio 7 GPIO_ACTIVE_HIGH>;
 		vdd-supply = <&usb_hub_fixed_3v3>;
 	};
+
+	port {
+		xhci_ss_ep: endpoint {
+			remote-endpoint = <&typec_con_ss>;
+		};
+	};
+};
+
+&ssusb2 {
+	interrupts-extended = <&gic GIC_SPI 536 IRQ_TYPE_LEVEL_HIGH 0>,
+			      <&pio 220 IRQ_TYPE_LEVEL_HIGH>;
+	interrupt-names = "host", "wakeup";
+
+	dr_mode = "host";
+	vusb33-supply = <&mt6359_vusb_ldo_reg>;
+	status = "okay";
 };
 
 &xhci2 {
-- 
2.48.1


