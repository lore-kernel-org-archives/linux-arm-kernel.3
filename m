Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 708CBCAC592
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 20:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WlrpMszuag375++3au3AQMumLE/Z1ZoZmJDjJqd8ieY=; b=DZFwRTvmzbQyUf+1jNPfsiGXqM
	s8kq+AXWhgAYPwQxgCi2Yd//NCe6g7vMNKmuYiXeu1zdvSgqx3dMsp71UhE2DAlvn1/kmes+1LhD+
	fvWr6dMHaqk46S/0ve9A70tXi70hEcVWiFXgnRAWuK5r6PYn4WYIYOj0XQctRxyEmMVvR8O/J1Zqe
	3jpxsXxHuMANSK0XlC2KFIY+XX3iTxWU9MVWli2P9t+C2YpssEhCkfSF42qWCYDS+9zOk9tdpeRGt
	8JWnUG1LwwliV204zhDLTjq6yob50rqkDlK37Zwc8IRV/iX9+/S2bQmw6KYnjgWpdty9kfL7yGtQX
	FNtCHXcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyc22-00000008ykP-3gen;
	Tue, 16 Sep 2025 20:12:06 +0000
Received: from mail.mainlining.org ([5.75.144.95])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyc20-00000008yjH-1prj;
	Tue, 16 Sep 2025 20:12:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1758053336; bh=WlrpMszuag375++3au3AQMu
	mLE/Z1ZoZmJDjJqd8ieY=; b=GAvx5qwGFbxhNRkxwhc5JSYB1VRIMjT5ITBEWXUjVNyQ0BNZ7n
	sPJRK49nsYSihF6htA0vNokgdRIR+nQd0zL96pFlmWIrCntfk8gd5ENYJKXzz0hxoB2VikAnAhM
	pZFG08Xt/Aw1XeI2Ygsr5tq4QthZmwtGBBU3En3e3ezDluZx5QW73yYfSUWU3hpBrQDL9fBKirG
	ReGGVxNrWIv22KM00QZaDIvPKsnL+PUP3+VPkjeLArQes/PIm5LGDaEN334/+3Q162yDD8Z9OVz
	Sv+iSk9BiyPut/O3rwwaTq54MfwPbnUKeTZ1bw0Vta8J/i5rFf6L154KEr+qR+hTahQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1758053336; bh=WlrpMszuag375++3au3AQMu
	mLE/Z1ZoZmJDjJqd8ieY=; b=UzO03XcRaN3wGrSqDtBkO/u7EMhC+mKUBkEupBvSBqMoLn/K9o
	n56YX+PHZY+jiYPCh5W/1ggBp9Tr5ku7pFAw==;
From: Dang Huynh <dang.huynh@mainlining.org>
Date: Wed, 17 Sep 2025 03:07:26 +0700
Subject: [PATCH 09/25] dt-bindings: clock: Add RDA Micro RDA8810PL
 clock/reset controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250917-rda8810pl-drivers-v1-9-74866def1fe3@mainlining.org>
References: <20250917-rda8810pl-drivers-v1-0-74866def1fe3@mainlining.org>
In-Reply-To: <20250917-rda8810pl-drivers-v1-0-74866def1fe3@mainlining.org>
To: Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Sebastian Reichel <sre@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-unisoc@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
 dmaengine@vger.kernel.org, linux-hardening@vger.kernel.org, 
 linux-mmc@vger.kernel.org, Dang Huynh <dang.huynh@mainlining.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_131204_619793_62678CDB 
X-CRM114-Status: GOOD (  10.25  )
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

Add documentation describing the RDA8810PL Clock and Reset
controller.

Signed-off-by: Dang Huynh <dang.huynh@mainlining.org>
---
 .../bindings/clock/rda,8810pl-apsyscon.yaml        | 44 ++++++++++++
 include/dt-bindings/clock/rda,8810pl-apclk.h       | 79 ++++++++++++++++++++++
 2 files changed, 123 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/rda,8810pl-apsyscon.yaml b/Documentation/devicetree/bindings/clock/rda,8810pl-apsyscon.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..988b609403a96abc4964ab366daa6fec0514595c
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/rda,8810pl-apsyscon.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/rda,8810pl-apsyscon.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RDA Micro RDA8810PL AP Clock Controller
+
+maintainers:
+  - Dang Huynh <dang.huynh@mainlining.org>
+
+properties:
+  compatible:
+    items:
+      - const: rda,8810pl-apsyscon
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+  '#reset-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - "#clock-cells"
+  - "#reset-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/rda,8810pl-apclk.h>
+
+    ap_syscon: syscon@0 {
+      compatible = "rda,8810pl-apsyscon", "syscon";
+      reg = <0x0 0x1000>;
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+    };
diff --git a/include/dt-bindings/clock/rda,8810pl-apclk.h b/include/dt-bindings/clock/rda,8810pl-apclk.h
new file mode 100644
index 0000000000000000000000000000000000000000..372358e72436a28c0775519f49626c9c5f4c6046
--- /dev/null
+++ b/include/dt-bindings/clock/rda,8810pl-apclk.h
@@ -0,0 +1,79 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
+
+#ifndef _DT_BINDINGS_CLK_RDA8810_H_
+#define _DT_BINDINGS_CLK_RDA8810_H_
+
+/* soc clocks */
+#define CLK_CPU 0
+#define CLK_BUS 1
+#define CLK_MEM 2
+
+#define CLK_USB 3
+#define CLK_AXI 4
+#define CLK_GCG 5
+#define CLK_AHB1 6
+#define CLK_APB1 7
+#define CLK_APB2 8
+
+#define CLK_GPU 9
+#define CLK_VPU 10
+#define CLK_VOC 11
+#define CLK_SFLSH 12
+
+#define CLK_UART1 13
+#define CLK_UART2 14
+#define CLK_UART3 15
+
+#define CLK_VOC2 16
+#define CLK_EMMC 17
+
+#define CLK_COUNT (CLK_EMMC + 1)
+
+/* resets */
+#define RST_CPU 0
+
+#define RST_AXI_VOC 1
+#define RST_AXI_DMA 2
+#define RST_AXI_CONNECT 3
+#define RST_AXI_VPU 4
+
+#define RST_GCG_GOUDA 5
+#define RST_GCG_CAMERA 6
+#define RST_GCG_LCDC 7
+
+#define RST_AHB1_USBC 8
+#define RST_AHB1_SPIFLASH 9
+
+#define RST_APB1_TIMER 10
+#define RST_APB1_KEYPAD 11
+#define RST_APB1_GPIO 12
+#define RST_APB1_PWM 13
+#define RST_APB1_AIF 14
+#define RST_APB1_AUIFC 15
+#define RST_APB1_I2C1 16
+#define RST_APB1_I2C2 17
+#define RST_APB1_I2C3 18
+#define RST_APB1_COMREGS 19
+#define RST_APB1_DMC 20
+#define RST_APB1_DDRPHY_P 21
+
+#define RST_APB2_IFC 22
+#define RST_APB2_UART1 23
+#define RST_APB2_UART2 24
+#define RST_APB2_UART3 25
+#define RST_APB2_SPI1 26
+#define RST_APB2_SPI2 27
+#define RST_APB2_SPI3 28
+#define RST_APB2_SDMMC1 29
+#define RST_APB2_SDMMC2 30
+#define RST_APB2_SDMMC3 31
+#define RST_APB2_NAND 32
+
+#define RST_MEM_GPU 33
+#define RST_MEM_VPU 34
+#define RST_MEM_DMC 35
+#define RST_MEM_DDRPHY_P 36
+
+#define RST_COUNT (RST_MEM_DDRPHY_P + 1)
+
+#endif /* _DT_BINDINGS_CLK_RDA8810_H_ */

-- 
2.51.0

