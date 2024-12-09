Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11D91E77180
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 13:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VIpsPcGOjRyl5qUhr+7znCLWNsK6P7pZhuPfToLGzCI=; b=GypFU0MadVmLLxrQs4eLJCn56F
	ssAJqhB0oOm/b9RtQZIbVAZ38+1xej/wkAu6I7vGPixG85xGKqqCKBygfpQU2yJQydvFys9wVbvG5
	F8bI8kKeKJSIoSrRm0gFgTQx6ZOnJX0FhkKkVcdutHPbarnXaMYQ0AftGvHNHAUwFAOmSxQ4oJXcP
	nPvjYiBtS8+1HTXSDpVImy9/DOyGay10Ogzp0LnD/5oj5zBB/SKlf8hx5KeBIQmorWtMHrA3I0Ovg
	T98fB2h/fGpxy5qs6uFQjK3XpT4sw1FZ8GOuoJY1Ohrkc763tvZ8XyqCiKQ9SkMLCcI3KLTQb4f6i
	bIRl362g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKddU-00000007vku-2QGT;
	Mon, 09 Dec 2024 13:17:16 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKdKq-00000007pMi-2VJH;
	Mon, 09 Dec 2024 12:58:01 +0000
Received: from mxbox4.masterlogin.de (unknown [192.168.10.79])
	by mxout1.routing.net (Postfix) with ESMTP id B0ABF40452;
	Mon,  9 Dec 2024 12:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1733749078;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VIpsPcGOjRyl5qUhr+7znCLWNsK6P7pZhuPfToLGzCI=;
	b=bxlWsBXZP8f/zUpFSWRBa3yFdPImbW3Huhv4a0u7byeYlMhpxpR2N2unKS8k4/oGr5Kj7i
	f4uW6Txj/ZeYY3N9Tcj7p1JVYISpZRXQAFNP71hvgl2iuGjjj/VAXDiNCp88eb82ZEJAAy
	y/WOH0i+7GPW/DDFPN4dZ/xfhfC+R7Y=
Received: from frank-u24.. (fttx-pool-80.245.75.28.bambit.de [80.245.75.28])
	by mxbox4.masterlogin.de (Postfix) with ESMTPSA id F125180483;
	Mon,  9 Dec 2024 12:57:57 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@kernel.org>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v6 4/5] arm64: dts: mediatek: mt7988: Add pinctrl support
Date: Mon,  9 Dec 2024 13:57:38 +0100
Message-ID: <20241209125742.9307-5-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241209125742.9307-1-linux@fw-web.de>
References: <20241209125742.9307-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 2a1d0a53-6c11-438e-951a-535d710498e4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_045800_781248_5CF7B4E4 
X-CRM114-Status: UNSURE (   9.87  )
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

From: Frank Wunderlich <frank-w@public-files.de>

Add mt7988a pinctrl node.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
v5:
- drop pins with second function

v2:
- fix wrong alignment of reg values
---
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi | 54 +++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
index c9649b815276..46969577c87a 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
@@ -3,6 +3,7 @@
 #include <dt-bindings/clock/mediatek,mt7988-clk.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/phy/phy.h>
+#include <dt-bindings/pinctrl/mt65xx.h>
 
 / {
 	compatible = "mediatek,mt7988a";
@@ -105,6 +106,59 @@ clock-controller@1001e000 {
 			#clock-cells = <1>;
 		};
 
+		pio: pinctrl@1001f000 {
+			compatible = "mediatek,mt7988-pinctrl";
+			reg = <0 0x1001f000 0 0x1000>,
+			      <0 0x11c10000 0 0x1000>,
+			      <0 0x11d00000 0 0x1000>,
+			      <0 0x11d20000 0 0x1000>,
+			      <0 0x11e00000 0 0x1000>,
+			      <0 0x11f00000 0 0x1000>,
+			      <0 0x1000b000 0 0x1000>;
+			reg-names = "gpio", "iocfg_tr",
+				    "iocfg_br", "iocfg_rb",
+				    "iocfg_lb", "iocfg_tl", "eint";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pio 0 0 84>;
+			interrupt-controller;
+			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-parent = <&gic>;
+			#interrupt-cells = <2>;
+
+			pcie0_pins: pcie0-pins {
+				mux {
+					function = "pcie";
+					groups = "pcie_2l_0_pereset", "pcie_clk_req_n0_0",
+						 "pcie_wake_n0_0";
+				};
+			};
+
+			pcie1_pins: pcie1-pins {
+				mux {
+					function = "pcie";
+					groups = "pcie_2l_1_pereset", "pcie_clk_req_n1",
+						 "pcie_wake_n1_0";
+				};
+			};
+
+			pcie2_pins: pcie2-pins {
+				mux {
+					function = "pcie";
+					groups = "pcie_1l_0_pereset", "pcie_clk_req_n2_0",
+						 "pcie_wake_n2_0";
+				};
+			};
+
+			pcie3_pins: pcie3-pins {
+				mux {
+					function = "pcie";
+					groups = "pcie_1l_1_pereset", "pcie_clk_req_n3",
+						 "pcie_wake_n3_0";
+				};
+			};
+		};
+
 		pwm@10048000 {
 			compatible = "mediatek,mt7988-pwm";
 			reg = <0 0x10048000 0 0x1000>;
-- 
2.43.0


