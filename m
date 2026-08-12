Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CEF6C5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 01:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IbAA6pvCgsmhB06HsWXQ/egn4NMOuHY9bVEh1SlCYDo=; b=d6/fTFuRVveP4b9G2ANYC/M2Jd
	p40jRQuaAgCxZTSQbNFY//EQ037eW6zQh5HcJNXlSFpSumPN4xN0hqZ11g7gUAnWzM5qPD/GABWGh
	f5iDeHdQQc4U0gSWlO5qFGRj6T2+6L+pviVxCdt0MH0ncnO2ZKPDzZoyn90sAMbKg6MkXyWc7Lti+
	ehCc4wMdDsU3/yGC+P25XXSduI/JS5JSvWTk7JneGMorJtALJ5oRJqRzbldsRjjAvYXGeqONHe9V3
	Z/9d1kaM3EFq8it6Yet1mFhsADviDnbtRe7PDQSBL0COQNEocF0goBso4tslCbNt/U8bECoT2f4KB
	pfrH8bVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtxNF-0000000FAyH-4801;
	Wed, 12 Aug 2026 01:03:18 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtxNB-0000000FAtZ-2NHG;
	Wed, 12 Aug 2026 01:03:15 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7D85D11A16E;
	Wed, 12 Aug 2026 03:03:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1786496587; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=IbAA6pvCgsmhB06HsWXQ/egn4NMOuHY9bVEh1SlCYDo=;
	b=MpknEq/LD8wmGY05KGZMorJ6MJ11A4gGCvWiGrDnT8x5kgR/ApDQoG4EaRAJg80Oz/e15z
	nYRiNrQRFmvtTnwWNb6ghLz4Wbe5z3W/Txy6UeINDTIRAOAZUoI0QkIotK4EZvA7QszI82
	0uV4iEsg3MtSns5/x6PIUsimc3IAoB4MtPYw0rKEDH5lGinh5J6AjyPwxI78Exrk+sZQF6
	CH9JVvYhDqmL7z47mdnD+99AlHB7m1fllQwr+8r/Ch86YDW7mgkj/atmsttKbt95udoa17
	ZevcKDgvipv0QhvuBZEOH2AscYWEQ5K8aAGHXLz3okFXKflG7ho7A/dxXLZ1jg==
From: Marek Vasut <marex@nabladev.com>
To: linux-usb@vger.kernel.org
Cc: Marek Vasut <marex@nabladev.com>,
	Pankaj Dev <pankaj.dev@st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christian Bruel <christian.bruel@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rahul Kumar <rahul.kumar05@st.com>,
	Rob Herring <robh@kernel.org>,
	Rosen Penev <rosenp@gmail.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>,
	devicetree@vger.kernel.org,
	kernel@dh-electronics.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 7/8] arm64: dts: st: Add USB nodes on stm32mp231
Date: Wed, 12 Aug 2026 02:55:47 +0200
Message-ID: <20260812010157.1772849-8-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260812010157.1772849-1-marex@nabladev.com>
References: <20260812010157.1772849-1-marex@nabladev.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_180314_272484_336B8BF2 
X-CRM114-Status: GOOD (  11.15  )
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

Add USB controller and PHY nodes to stm32mp231 DT.
This includes two USB 2.0 FEMTO PHYs, USB 2.0 host
controller and DWC3 DRD controller nodes. Include
missing COMBOPHY for the USB 3.0 controller.

Signed-off-by: Marek Vasut <marex@nabladev.com>
Signed-off-by: Pankaj Dev <pankaj.dev@st.com>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Christian Bruel <christian.bruel@foss.st.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Pankaj Dev <pankaj.dev@st.com>
Cc: Rahul Kumar <rahul.kumar05@st.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Rosen Penev <rosenp@gmail.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-phy@lists.infradead.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-usb@vger.kernel.org
---
 arch/arm64/boot/dts/st/stm32mp231.dtsi | 77 ++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/dts/st/stm32mp231.dtsi
index 4505fc0e3b537..b8cef81eceeb1 100644
--- a/arch/arm64/boot/dts/st/stm32mp231.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp231.dtsi
@@ -7,6 +7,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/regulator/st,stm32mp25-regulator.h>
 #include <dt-bindings/reset/st,stm32mp25-rcc.h>
+#include <dt-bindings/phy/phy.h>
 
 / {
 	#address-cells = <2>;
@@ -146,6 +147,26 @@ timer {
 		always-on;
 	};
 
+	usb2_phy1: usb2-phy1 {
+		compatible = "st,stm32mp25-usb2phy1";
+		#phy-cells = <0>;
+		#clock-cells = <0>;
+		st,syscfg = <&syscfg 0x2400>;
+		clocks = <&rcc CK_KER_USB2PHY1>;
+		resets = <&rcc USB2PHY1_R>;
+		status = "disabled";
+	};
+
+	usb2_phy2: usb2-phy2 {
+		compatible = "st,stm32mp25-usb2phy2";
+		#phy-cells = <0>;
+		#clock-cells = <0>;
+		st,syscfg = <&syscfg 0x2800>;
+		clocks = <&rcc CK_KER_USB2PHY2EN>;
+		resets = <&rcc USB2PHY2_R>;
+		status = "disabled";
+	};
+
 	soc@0 {
 		compatible = "simple-bus";
 		ranges = <0x0 0x0 0x0 0x80000000>;
@@ -769,6 +790,21 @@ dcmipp: dcmipp@48030000 {
 				status = "disabled";
 			};
 
+			combophy: phy@480c0000 {
+				compatible = "st,stm32mp25-combophy";
+				reg = <0x480c0000 0x1000>;
+				#phy-cells = <1>;
+				clocks = <&rcc CK_BUS_USB3PCIEPHY>, <&rcc CK_KER_USB3PCIEPHY>;
+				clock-names = "apb", "ker";
+				resets = <&rcc USB3PCIEPHY_R>;
+				reset-names = "phy";
+				access-controllers = <&rifsc 67>;
+				power-domains = <&cluster_pd>;
+				wakeup-source;
+				interrupts-extended = <&exti1 45 IRQ_TYPE_EDGE_FALLING>;
+				status = "disabled";
+			};
+
 			sdmmc1: mmc@48220000 {
 				compatible = "st,stm32mp25-sdmmc2", "arm,pl18x", "arm,primecell";
 				reg = <0x48220000 0x400>, <0x44230400 0x8>;
@@ -862,6 +898,47 @@ stmmac_axi_config_1: stmmac-axi-config {
 					snps,wr_osr_lmt = <0x7>;
 				};
 			};
+
+			usbh_ohci: usb@482e0000 {
+				compatible = "generic-ohci";
+				reg = <0x482e0000 0x1000>;
+				access-controllers = <&rifsc 63>;
+				clocks = <&usb2_phy1>, <&rcc CK_BUS_USB2OHCI>;
+				interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
+				phys = <&usb2_phy1>;
+				phy-names = "usb";
+				resets = <&rcc USBH_R>;
+				status = "disabled";
+			};
+
+			usbh_ehci: usb@482f0000 {
+				compatible = "generic-ehci";
+				reg = <0x482f0000 0x1000>;
+				access-controllers = <&rifsc 63>;
+				clocks = <&usb2_phy1>, <&rcc CK_BUS_USB2EHCI>;
+				companion = <&usbh_ohci>;
+				interrupts = <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>;
+				phys = <&usb2_phy1>;
+				phy-names = "usb";
+				resets = <&rcc USBH_R>;
+				status = "disabled";
+			};
+
+			usb3dr: usb@48300000 {
+				compatible = "st,stm32mp25-dwc3";
+				reg = <0x48300000 0x100000>;
+				access-controllers = <&rifsc 66>;
+				clocks = <&rcc CK_KER_USB2PHY2>,
+					 <&rcc CK_BUS_USB3DR>,
+					 <&rcc CK_KER_USB2PHY2>;
+				clock-names = "ref", "bus_early", "suspend";
+				interrupts = <GIC_SPI 228 IRQ_TYPE_LEVEL_HIGH>;
+				phys = <&usb2_phy2>, <&combophy PHY_TYPE_USB3>;
+				phy-names = "usb2-phy", "usb3-phy";
+				resets = <&rcc USB3DR_R>;
+				st,syscfg = <&syscfg 0x4800>;
+				status = "disabled";
+			};
 		};
 
 		bsec: efuse@44000000 {
-- 
2.53.0


