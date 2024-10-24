Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 209DBCE8E97
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 17:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IkgEN5o9iNWZTc8HMANVY70uJr1bqxkbHfKoBM1wwcE=; b=eTJ0c9dUPUHtMUwmtYqBkjrTmB
	MWLq4VGdLQXkCvFxWBxHXOxT+6SGZtKM4KkDFR3zALN5VDtdQGIx4s9I8YaXi5waSaBGLe3cJjcaf
	alHHqW6XWbgZ6B5RPWDgV/7awkGK+wHoq81wHML0oQUeLftYBMw/4idcaMetE5/5knTQIHdlVKne4
	fYsQprbSiYGp30H4mkFwTRQyu0L7J3dqryxs3LhL9lBuG2gboI5LskENcJpA/dCbYdLlgfoRegkHk
	wBAB6Qn4HrKG3O9EmBQJPxWEqMvITzW1UuBWOAc2cUuXn5yX4Vhts5B7VwaUsyLbEfmBrNBoZQI4h
	rv1zT9WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t41WE-00000001FzF-2dET;
	Thu, 24 Oct 2024 17:21:06 +0000
Received: from thales.epochal.quest ([2607:5300:205:200::3a30])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t41LI-00000001DnM-0Rc7;
	Thu, 24 Oct 2024 17:09:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=epochal.quest;
	s=default; t=1729789786;
	bh=SXlv9B8AoJX1K/LjIPZJ5S+TFLEbtezksBkekZtH358=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SA0QNzYQV4gTjTYnKFIEcdb3jDoLhhKKll25bO7rw3IkEcEfI+DB+wxCqvdgtSNOY
	 GW/fOm7PZ8gaLs5uJIYAlXz+efQuBajSudGYQ/xI6ga6lnjRA2sAllK1wVLpuUE80g
	 I3QwHnZhd+PzrNXdDzxQ7dzwF6aWFsfsfUsxQA4Yk/PTFKBaCXsdM8AAw7cNdnbw9J
	 xPmhAGUB5wjMxtwNnhi82GjOKdjs+/cP1q09n1ZlCpvyKTIngTA5JfHr/4V+wrt7d6
	 QClQQ1sYyz9l0rNrw8YuirKraWliqG7YWtWiSzqKP9rUnUUiaKExexvIJHOdn/t43q
	 rlSeOKqnCX4cA==
X-Virus-Scanned: by epochal.quest
From: Cody Eksal <masterr3c0rd@epochal.quest>
To: linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-usb@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Cody Eksal <masterr3c0rd@epochal.quest>,
	Andre Przywara <andre.przywara@arm.com>,
	Parthiban <parthiban@linumiz.com>,
	Yangtao Li <frank@allwinnertech.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Vinod Koul <vkoul@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Thierry Reding <treding@nvidia.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Maxime Ripard <mripard@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Yangtao Li <tiny.windzz@gmail.com>,
	Viresh Kumar <vireshk@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Subject: [PATCH 07/13] arm64: dts: allwinner: a100: add usb related nodes
Date: Thu, 24 Oct 2024 14:05:25 -0300
Message-ID: <20241024170540.2721307-8-masterr3c0rd@epochal.quest>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241024170540.2721307-1-masterr3c0rd@epochal.quest>
References: <20241024170540.2721307-1-masterr3c0rd@epochal.quest>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_100948_289775_92D1CEEE 
X-CRM114-Status: UNSURE (   8.67  )
X-CRM114-Notice: Please train this message.
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

From: Yangtao Li <frank@allwinnertech.com>

Allwinner A64 have two HCI USB controllers, a OTG controller and a USB
PHY device, let's add nodes on dts.

Signed-off-by: Yangtao Li <frank@allwinnertech.com>
[masterr3c0rd@epochal.quest: fallback to a33-musb instead of h3-musb]
Signed-off-by: Cody Eksal <masterr3c0rd@epochal.quest>
---
 .../arm64/boot/dts/allwinner/sun50i-a100.dtsi | 91 +++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
index adb11b26045f..0aee1b578661 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
@@ -302,6 +302,97 @@ ths: thermal-sensor@5070400 {
 			#thermal-sensor-cells = <1>;
 		};
 
+		usbphy: phy@5100400 {
+			#phy-cells = <1>;
+			compatible = "allwinner,sun50i-a100-usb-phy";
+			reg = <0x05100400 0x14>,
+			      <0x05101800 0x4>,
+			      <0x05200800 0x4>;
+			reg-names = "phy_ctrl",
+				    "pmu0",
+				    "pmu1";
+			clocks = <&ccu CLK_USB_PHY0>,
+				 <&ccu CLK_USB_PHY1>;
+			clock-names = "usb0_phy",
+				      "usb1_phy";
+			resets = <&ccu RST_USB_PHY0>,
+				 <&ccu RST_USB_PHY1>;
+			reset-names = "usb0_reset",
+				      "usb1_reset";
+			status = "disabled";
+		};
+
+		ehci0: usb@5101000 {
+			compatible = "allwinner,sun50i-a100-ehci",
+				     "generic-ehci";
+			reg = <0x05101000 0x100>;
+			interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_OHCI0>,
+				 <&ccu CLK_BUS_EHCI0>,
+				 <&ccu CLK_USB_OHCI0>;
+			resets = <&ccu RST_BUS_OHCI0>,
+				 <&ccu RST_BUS_EHCI0>;
+			phys = <&usbphy 0>;
+			phy-names = "usb";
+			status = "disabled";
+		};
+
+		ohci0: usb@5101400 {
+			compatible = "allwinner,sun50i-a100-ohci",
+				     "generic-ohci";
+			reg = <0x05101400 0x100>;
+			interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_OHCI0>,
+				 <&ccu CLK_USB_OHCI0>;
+			resets = <&ccu RST_BUS_OHCI0>;
+			phys = <&usbphy 0>;
+			phy-names = "usb";
+			status = "disabled";
+		};
+
+		usb_otg: usb@5100000 {
+			compatible = "allwinner,sun50i-a100-musb",
+				     "allwinner,sun8i-a33-musb";
+			reg = <0x05100000 0x0400>;
+			clocks = <&ccu CLK_BUS_OTG>;
+			resets = <&ccu RST_BUS_OTG>;
+			interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "mc";
+			phys = <&usbphy 0>;
+			phy-names = "usb";
+			extcon = <&usbphy 0>;
+			dr_mode = "otg";
+			status = "disabled";
+		};
+
+		ehci1: usb@5200000 {
+			compatible = "allwinner,sun50i-a100-ehci",
+				     "generic-ehci";
+			reg = <0x05200000 0x100>;
+			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_OHCI1>,
+				 <&ccu CLK_BUS_EHCI1>,
+				 <&ccu CLK_USB_OHCI1>;
+			resets = <&ccu RST_BUS_OHCI1>,
+				 <&ccu RST_BUS_EHCI1>;
+			phys = <&usbphy 1>;
+			phy-names = "usb";
+			status = "disabled";
+		};
+
+		ohci1: usb@5200400 {
+			compatible = "allwinner,sun50i-a100-ohci",
+				     "generic-ohci";
+			reg = <0x05200400 0x100>;
+			interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_OHCI1>,
+				 <&ccu CLK_USB_OHCI1>;
+			resets = <&ccu RST_BUS_OHCI1>;
+			phys = <&usbphy 1>;
+			phy-names = "usb";
+			status = "disabled";
+		};
+
 		r_ccu: clock@7010000 {
 			compatible = "allwinner,sun50i-a100-r-ccu";
 			reg = <0x07010000 0x300>;
-- 
2.47.0


