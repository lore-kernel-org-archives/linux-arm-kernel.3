Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B630BC02192
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 08:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t+/k+qJKT8Tun/0VQisjpzHTf5jDj05SlOoD6w7l060=; b=0/xFkwAG060XCucGDwyvs+c/HX
	w6xm/4lfKht4qRrHa/wy7f3XYeQ/M+75XjpZZ6/3nlZPG0KgBa77CKZRt0YLzfbNuFrwSc3SYVr4Q
	7vTb8Q/S0yHWbnACEa8G/PyEAyJg4oGzRAir0dPpz0J0GN5MwEA0PrV8d0Xcdan6YwhU0RJkmp+JM
	GaH0fkFTtupJWh9PliDt/dfoZimU9sjqOR7NgejFKw5k21cWOJhAUs1qszBP00b7M4R7iI8STyB9b
	t0xvRIg2jIhJ2u/lKVKp92LlADIIudXc//MvQFU5+HrIdm2D1clrLDnCm0aQc7v/yYjwHxqUrQ/Of
	dA+SJE4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgK3E-00000008saK-3W28;
	Fri, 07 Feb 2025 08:49:28 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgJrj-00000008qHX-20zd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 08:37:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1738917456; x=1770453456;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=t+/k+qJKT8Tun/0VQisjpzHTf5jDj05SlOoD6w7l060=;
  b=iIWcbI3ncN2b35+SA74HhsCjt+HTX2fvc+MPfv6tTIiZyLWE2PkS0oVq
   fJbc4yGd5sLJM1E1K93qy0i0gmid9EEEq0nUX1lvg9ECR9TlqkOsmJzbT
   TYYh/kRtna34IJeLRxkR69RcxrP0MCrVzVjSPQdQ3DqYUJ8af3eP4S+DK
   j12WAUIJUoF8nEcBgyc9uE6orEE9QqeCY/wO1dom8XVVArdcYKGtxEYDZ
   9/TNc86QeSp2iEfdYwxq8C1y1swG7bn9lXSVkztHofbJCe9IX86e/N9f8
   bVZA1fxUaNTaBxSRgRxAilrp3dkEOzt4wgr0bp9eshzPerfT8Fw8sQamQ
   A==;
X-CSE-ConnectionGUID: iqiMZF4gQCCDS611uhH//Q==
X-CSE-MsgGUID: oNkf5ptPSuOAMRgq+i9RWg==
X-IronPort-AV: E=Sophos;i="6.13,266,1732575600"; 
   d="scan'208";a="41636116"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 07 Feb 2025 09:37:13 +0100
X-CheckPoint: {67A5C620-11-8F72533B-EF5B5974}
X-MAIL-CPID: 6C932CBD313A6B9B526F29620C8032C8_1
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 36E9A168342;
	Fri,  7 Feb 2025 09:37:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1738917427;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t+/k+qJKT8Tun/0VQisjpzHTf5jDj05SlOoD6w7l060=;
	b=Ev4KZjp9LOWOFeR5iPYKl3FERBXXi6yz9tdjO+eWcIihPF/FyDt8jZE47kecaQXpFvjgNC
	AiA7RnaJ+9sUA7p49qY71d2zTlywA8K1CXqS8H3jt3hvFT3u8O4g+89xmJCJ3e9voH6VAW
	cGgc3YHrBoc+1ltjUHbHzy6TBfVA2nobdDU5rnL0PgnmpcNoAYKewXRFSd5NoYx6JLbLpa
	LWr0md1QFzcUZIM10tzKMFw/Lf1XGME71Xy2kAmpmSCC95uL13zZjAeLfN2hpeF1XiJ+Ie
	rsixR54nSKApHbQQ4XgUUQraQbHOEmdTrmKL5av/hf+oWB39n6xeuktDJLvcXA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 08/10] arm64: dts: imx8mm: Add access-controller references
Date: Fri,  7 Feb 2025 09:36:13 +0100
Message-Id: <20250207083616.1442887-9-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250207083616.1442887-1-alexander.stein@ew.tq-group.com>
References: <20250207083616.1442887-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_003735_827283_3103821F 
X-CRM114-Status: GOOD (  11.70  )
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

Mark ocotp as a access-controller and add references on peripherals
which can be disabled (fused).

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx8mm.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index 1b147a09f6fe8..51472313b8294 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -11,6 +11,7 @@
 #include <dt-bindings/reset/imx8mq-reset.h>
 #include <dt-bindings/thermal/thermal.h>
 
+#include "imx8mm-ocotp.h"
 #include "imx8mm-pinfunc.h"
 
 / {
@@ -565,6 +566,7 @@ ocotp: efuse@30350000 {
 				/* For nvmem subnodes */
 				#address-cells = <1>;
 				#size-cells = <1>;
+				#access-controller-cells = <2>;
 
 				/*
 				 * The register address below maps to the MX8M
@@ -1108,6 +1110,7 @@ fec1: ethernet@30be0000 {
 				nvmem-cells = <&fec_mac_address>;
 				nvmem-cell-names = "mac-address";
 				fsl,stop-mode = <&gpr 0x10 3>;
+				access-controllers = <&ocotp IMX8MM_OCOTP_ENET_DISABLE>;
 				status = "disabled";
 			};
 
@@ -1157,6 +1160,7 @@ mipi_dsi: dsi@32e10000 {
 							 <&clk IMX8MM_CLK_24M>;
 				interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
 				power-domains = <&disp_blk_ctrl IMX8MM_DISPBLK_PD_MIPI_DSI>;
+				access-controllers = <&ocotp IMX8MM_OCOTP_MIPI_DSI_DISABLE>;
 				status = "disabled";
 
 				ports {
@@ -1187,6 +1191,7 @@ csi: csi@32e20000 {
 				clocks = <&clk IMX8MM_CLK_CSI1_ROOT>;
 				clock-names = "mclk";
 				power-domains = <&disp_blk_ctrl IMX8MM_DISPBLK_PD_CSI_BRIDGE>;
+				access-controllers = <&ocotp IMX8MM_OCOTP_MIPI_CSI_DISABLE>;
 				status = "disabled";
 
 				port {
@@ -1270,6 +1275,7 @@ usbotg1: usb@32e40000 {
 				phys = <&usbphynop1>;
 				fsl,usbmisc = <&usbmisc1 0>;
 				power-domains = <&pgc_hsiomix>;
+				access-controllers = <&ocotp IMX8MM_OCOTP_USB_OTG1_DISABLE>;
 				status = "disabled";
 			};
 
@@ -1290,6 +1296,7 @@ usbotg2: usb@32e50000 {
 				phys = <&usbphynop2>;
 				fsl,usbmisc = <&usbmisc2 0>;
 				power-domains = <&pgc_hsiomix>;
+				access-controllers = <&ocotp IMX8MM_OCOTP_USB_OTG2_DISABLE>;
 				status = "disabled";
 			};
 
@@ -1375,6 +1382,7 @@ pcie0: pcie@33800000 {
 			reset-names = "apps", "turnoff";
 			phys = <&pcie_phy>;
 			phy-names = "pcie-phy";
+			access-controllers = <&ocotp IMX8MM_OCOTP_PCIE1_DISABLE>;
 			status = "disabled";
 		};
 
@@ -1401,6 +1409,7 @@ pcie0_ep: pcie-ep@33800000 {
 			phy-names = "pcie-phy";
 			num-ib-windows = <4>;
 			num-ob-windows = <4>;
+			access-controllers = <&ocotp IMX8MM_OCOTP_PCIE1_DISABLE>;
 			status = "disabled";
 		};
 
@@ -1418,6 +1427,7 @@ gpu_3d: gpu@38000000 {
 			assigned-clock-parents = <&clk IMX8MM_GPU_PLL_OUT>;
 			assigned-clock-rates = <0>, <800000000>;
 			power-domains = <&pgc_gpu>;
+			access-controllers = <&ocotp IMX8MM_OCOTP_GPU3D_DISABLE>;
 		};
 
 		gpu_2d: gpu@38008000 {
@@ -1433,6 +1443,7 @@ gpu_2d: gpu@38008000 {
 			assigned-clock-parents = <&clk IMX8MM_GPU_PLL_OUT>;
 			assigned-clock-rates = <0>, <800000000>;
 			power-domains = <&pgc_gpu>;
+			access-controllers = <&ocotp IMX8MM_OCOTP_GPU2D_DISABLE>;
 		};
 
 		vpu_g1: video-codec@38300000 {
@@ -1441,6 +1452,7 @@ vpu_g1: video-codec@38300000 {
 			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk IMX8MM_CLK_VPU_G1_ROOT>;
 			power-domains = <&vpu_blk_ctrl IMX8MM_VPUBLK_PD_G1>;
+			access-controllers = <&ocotp IMX8MM_OCOTP_G1_DISABLE>;
 		};
 
 		vpu_g2: video-codec@38310000 {
@@ -1449,6 +1461,7 @@ vpu_g2: video-codec@38310000 {
 			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk IMX8MM_CLK_VPU_G2_ROOT>;
 			power-domains = <&vpu_blk_ctrl IMX8MM_VPUBLK_PD_G2>;
+			access-controllers = <&ocotp IMX8MM_OCOTP_G2_DISABLE>;
 		};
 
 		vpu_blk_ctrl: blk-ctrl@38330000 {
-- 
2.34.1


