Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEA23E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 09:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OrCo3RxQF9OBBEqFobGL9zlQ6sB8yrqw1oeCNHlYCjc=; b=gu+SfDzi6pxX72/FOhY3hZd36v
	paSMRZcOdTs8PhDYjbPS0Qtm7sUksy+5rzm8cHbGIgKJ66OJbthPC9jjaydIPQENi+UBBDoz5Z3bQ
	vYrkm385RkhUWNXB0YYh2qJv5E2p3lny0jChB069t0I4DhfLF5KotckVA8Id9SSEYVmRalN+NHzO0
	9HC4S6YmGDjStNLtFqiYOXJOiwh0jqlycfh/Zqw2YLqUMzdIx+4GFJlF8xZ20ssdcFRoaRtN7PQ9q
	Tz4Fg4dniGanK5bQQCcxuREe0HYJ22Zevw8Kf0O71p99Xb2/zAG7uMX7z7QA5Z8QXgGYE7VerhvaI
	/yqYEd2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNTVW-0000000CpZP-3gyE;
	Tue, 17 Dec 2024 09:04:46 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNTLv-0000000Cn2e-1Ggo;
	Tue, 17 Dec 2024 08:54:53 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout1.routing.net (Postfix) with ESMTP id CCBAB40179;
	Tue, 17 Dec 2024 08:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1734425687;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OrCo3RxQF9OBBEqFobGL9zlQ6sB8yrqw1oeCNHlYCjc=;
	b=xhl8rNDWtfCHOiOhj/88OiYCdg/BkYsCBtF87lGtjgxOX64cMDMnlmuaa4lGbggKkXKGFm
	Jx7n+YYLgHRmiT39vXu84ouQKTwKH147h6p4ScbpX4rypiFzHYNgQUE1Ek7T3aosMYr0oJ
	O0bqJs4Y1M024sHRbibnN1zvecw5HKU=
Received: from frank-u24.. (fttx-pool-217.61.150.187.bambit.de [217.61.150.187])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id EF51D1004DD;
	Tue, 17 Dec 2024 08:54:46 +0000 (UTC)
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
Subject: [PATCH v7 3/5] dt-bindings: pinctrl: add binding for MT7988 SoC
Date: Tue, 17 Dec 2024 09:54:28 +0100
Message-ID: <20241217085435.9586-4-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241217085435.9586-1-linux@fw-web.de>
References: <20241217085435.9586-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 30ef6670-8126-4e56-bd52-216d44a6c345
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_005451_638734_0EB1AD35 
X-CRM114-Status: GOOD (  15.17  )
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

This adds bindings for MT7988 pinctrl driver.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
changes in v6:
changes suggested by rob
- remove quotes around mux
- use const instead of enum if only one value is possible

changes in v5 (so not adding RB from Rob given in v4):
- do not use MTK_DRIVE_8mA in example
- add _0 functions for pwm

changes in v4:
- dt-binding: pinctrl: fix dt_binding_check fixed-string error

'^mux$' should not be valid under {'pattern': '^\\^[a-zA-Z0-9,\\-._#@]+\\$$'}
	hint: Fixed strings belong in 'properties', not 'patternProperties'

changes in v3:
- limit conf subnode name with optional suffix like mmc on mt7986
- match mux subnode without wildcards

changes in v2:
- drop gpio-cells description
- move ref in mux subnode up
- order uart-functions alphanumeric and fix typo
---
 .../pinctrl/mediatek,mt7988-pinctrl.yaml      | 575 ++++++++++++++++++
 1 file changed, 575 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt7988-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7988-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7988-pinctrl.yaml
new file mode 100644
index 000000000000..26dfe7e7735a
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7988-pinctrl.yaml
@@ -0,0 +1,575 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/mediatek,mt7988-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT7988 Pin Controller
+
+maintainers:
+  - Sean Wang <sean.wang@kernel.org>
+
+description:
+  The MediaTek's MT7988 Pin controller is used to control SoC pins.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt7988-pinctrl
+
+  reg:
+    minItems: 7
+    maxItems: 7
+
+  reg-names:
+    items:
+      - const: gpio
+      - const: iocfg_tr
+      - const: iocfg_br
+      - const: iocfg_rb
+      - const: iocfg_lb
+      - const: iocfg_tl
+      - const: eint
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 2
+
+  gpio-ranges:
+    minItems: 1
+    maxItems: 5
+    description:
+      GPIO valid number range.
+
+  interrupt-controller: true
+
+  interrupts:
+    maxItems: 1
+
+  "#interrupt-cells":
+    const: 2
+
+allOf:
+  - $ref: pinctrl.yaml#
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - gpio-controller
+  - "#gpio-cells"
+
+patternProperties:
+  '-pins$':
+    type: object
+    additionalProperties: false
+
+    properties:
+      mux:
+        type: object
+        additionalProperties: false
+        $ref: /schemas/pinctrl/pinmux-node.yaml
+        description: |
+          pinmux configuration nodes.
+
+          The following table shows the effective values of "group", "function"
+          properties and chip pinout pins
+
+          groups               function           pins (in pin#)
+          ---------------------------------------------------------------------
+          "tops_jtag0_0"       "jtag"             0, 1, 2, 3, 4
+          "wo0_jtag"           "jtag"             50, 51, 52, 53, 54
+          "wo1_jtag"           "jtag"             50, 51, 52, 53, 54
+          "wo2_jtag"           "jtag"             50, 51, 52, 53, 54
+          "jtag"               "jtag"             58, 59, 60, 61, 62
+          "tops_jtag0_1"       "jtag"             58, 59, 60, 61, 62
+          "int_usxgmii"        "int_usxgmii"      2, 3
+          "pwm0"               "pwm"              57
+          "pwm1"               "pwm"              21
+          "pwm2"               "pwm"              80
+          "pwm2_0"             "pwm"              58
+          "pwm3"               "pwm"              81
+          "pwm3_0"             "pwm"              59
+          "pwm4"               "pwm"              82
+          "pwm4_0"             "pwm"              60
+          "pwm5"               "pwm"              83
+          "pwm5_0"             "pwm"              61
+          "pwm6"               "pwm"              69
+          "pwm6_0"             "pwm"              62
+          "pwm7"               "pwm"              70
+          "pwm7_0"             "pwm"              4
+          "dfd"                "dfd"              0, 1, 2, 3, 4
+          "xfi_phy0_i2c0"      "i2c"              0, 1
+          "xfi_phy1_i2c0"      "i2c"              0, 1
+          "xfi_phy_pll_i2c0"   "i2c"              3, 4
+          "xfi_phy_pll_i2c1"   "i2c"              3, 4
+          "i2c0_0"             "i2c"              5, 6
+          "i2c1_sfp"           "i2c"              5, 6
+          "xfi_pextp_phy0_i2c" "i2c"              5, 6
+          "xfi_pextp_phy1_i2c" "i2c"              5, 6
+          "i2c0_1"             "i2c"              15, 16
+          "u30_phy_i2c0"       "i2c"              15, 16
+          "u32_phy_i2c0"       "i2c"              15, 16
+          "xfi_phy0_i2c1"      "i2c"              15, 16
+          "xfi_phy1_i2c1"      "i2c"              15, 16
+          "xfi_phy_pll_i2c2"   "i2c"              15, 16
+          "i2c1_0"             "i2c"              17, 18
+          "u30_phy_i2c1"       "i2c"              17, 18
+          "u32_phy_i2c1"       "i2c"              17, 18
+          "xfi_phy_pll_i2c3"   "i2c"              17, 18
+          "sgmii0_i2c"         "i2c"              17, 18
+          "sgmii1_i2c"         "i2c"              17, 18
+          "i2c1_2"             "i2c"              69, 70
+          "i2c2_0"             "i2c"              69, 70
+          "i2c2_1"             "i2c"              71, 72
+          "mdc_mdio0"          "eth"              5, 6
+          "2p5g_ext_mdio"      "eth"              28, 29
+          "gbe_ext_mdio"       "eth"              30, 31
+          "mdc_mdio1"          "eth"              69, 70
+          "pcie_wake_n0_0"     "pcie"             7
+          "pcie_clk_req_n0_0"  "pcie"             8
+          "pcie_wake_n3_0"     "pcie"             9
+          "pcie_clk_req_n3"    "pcie"             10
+          "pcie_clk_req_n0_1"  "pcie"             10
+          "pcie_p0_phy_i2c"    "pcie"             7, 8
+          "pcie_p1_phy_i2c"    "pcie"             7, 8
+          "pcie_p3_phy_i2c"    "pcie"             9, 10
+          "pcie_p2_phy_i2c"    "pcie"             7, 8
+          "ckm_phy_i2c"        "pcie"             9, 10
+          "pcie_wake_n0_1"     "pcie"             13
+          "pcie_wake_n3_1"     "pcie"             14
+          "pcie_2l_0_pereset"  "pcie"             19
+          "pcie_1l_1_pereset"  "pcie"             20
+          "pcie_clk_req_n2_1"  "pcie"             63
+          "pcie_2l_1_pereset"  "pcie"             73
+          "pcie_1l_0_pereset"  "pcie"             74
+          "pcie_wake_n1_0"     "pcie"             75
+          "pcie_clk_req_n1"    "pcie"             76
+          "pcie_wake_n2_0"     "pcie"             77
+          "pcie_clk_req_n2_0"  "pcie"             78
+          "pcie_wake_n2_1"     "pcie"             79
+          "pmic"               "pmic"             11
+          "watchdog"           "watchdog"         12
+          "spi0_wp_hold"       "spi"              22, 23
+          "spi0"               "spi"              24, 25, 26, 27
+          "spi1"               "spi"              28, 29, 30, 31
+          "spi2"               "spi"              32, 33, 34, 35
+          "spi2_wp_hold"       "spi"              36, 37
+          "snfi"               "flash"            22, 23, 24, 25, 26, 27
+          "emmc_45"            "flash"            21, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37
+          "sdcard"             "flash"            32, 33, 34, 35, 36, 37
+          "emmc_51"            "flash"            38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49
+          "uart2"              "uart"             0, 1, 2, 3
+          "tops_uart0_0"       "uart"             22, 23
+          "uart2_0"            "uart"             28, 29, 30, 31
+          "uart1_0"            "uart"             32, 33, 34, 35
+          "uart2_1"            "uart"             32, 33, 34, 35
+          "net_wo0_uart_txd_0" "uart"             28
+          "net_wo1_uart_txd_0" "uart"             29
+          "net_wo2_uart_txd_0" "uart"             30
+          "tops_uart1_0"       "uart"             28, 29
+          "tops_uart0_1"       "uart"             30, 31
+          "tops_uart1_1"       "uart"             36, 37
+          "uart0"              "uart"             55, 56
+          "tops_uart0_2"       "uart"             55, 56
+          "uart2_2"            "uart"             50, 51, 52, 53
+          "uart1_1"            "uart"             58, 59, 60, 61
+          "uart2_3"            "uart"             58, 59, 60, 61
+          "uart1_2"            "uart"             80, 81, 82, 83
+          "uart1_2_lite"       "uart"             80, 81
+          "tops_uart1_2"       "uart"             80, 81
+          "net_wo0_uart_txd_1" "uart"             80
+          "net_wo1_uart_txd_1" "uart"             81
+          "net_wo2_uart_txd_1" "uart"             82
+          "udi"                "udi"              32, 33, 34, 35, 36
+          "i2s"                "audio"            50, 51, 52, 53, 54
+          "pcm"                "audio"            50, 51, 52, 53
+          "gbe0_led1"          "led"              58
+          "gbe1_led1"          "led"              59
+          "gbe2_led1"          "led"              60
+          "gbe3_led1"          "led"              61
+          "2p5gbe_led1"        "led"              62
+          "gbe0_led0"          "led"              64
+          "gbe1_led0"          "led"              65
+          "gbe2_led0"          "led"              66
+          "gbe3_led0"          "led"              67
+          "2p5gbe_led0"        "led"              68
+          "drv_vbus_p1"        "usb"              63
+          "drv_vbus"           "usb"              79
+
+        properties:
+          function:
+            description:
+              A string containing the name of the function to mux to the group.
+            enum: [audio, dfd, eth, flash, i2c, int_usxgmii, jtag, led, pcie, pmic, pwm, spi,
+                   uart, udi, usb, watchdog]
+          groups:
+            description:
+              An array of strings. Each string contains the name of a group.
+
+        required:
+          - function
+          - groups
+
+        allOf:
+          - if:
+              properties:
+                function:
+                  const: audio
+            then:
+              properties:
+                groups:
+                  enum: [i2s, pcm]
+          - if:
+              properties:
+                function:
+                  const: jtag
+            then:
+              properties:
+                groups:
+                  enum: [jtag, tops_jtag0_0, tops_jtag0_1, wo0_jtag, wo1_jtag, wo2_jtag]
+          - if:
+              properties:
+                function:
+                  const: int_usxgmii
+            then:
+              properties:
+                groups:
+                  const: int_usxgmii
+          - if:
+              properties:
+                function:
+                  const: dfd
+            then:
+              properties:
+                groups:
+                  const: dfd
+          - if:
+              properties:
+                function:
+                  const: flash
+            then:
+              properties:
+                groups:
+                  enum: [emmc_45, emmc_51, sdcard, snfi]
+          - if:
+              properties:
+                function:
+                  const: eth
+            then:
+              properties:
+                groups:
+                  enum: [2p5g_ext_mdio, gbe_ext_mdio, mdc_mdio0, mdc_mdio1]
+          - if:
+              properties:
+                function:
+                  const: i2c
+            then:
+              properties:
+                groups:
+                  enum: [xfi_phy0_i2c0, xfi_phy1_i2c0, xfi_phy_pll_i2c0,
+                         xfi_phy_pll_i2c1, i2c0_0, i2c1_sfp, xfi_pextp_phy0_i2c,
+                         xfi_pextp_phy1_i2c, i2c0_1, u30_phy_i2c0, u32_phy_i2c0,
+                         xfi_phy0_i2c1, xfi_phy1_i2c1, xfi_phy_pll_i2c2, i2c1_0,
+                         u30_phy_i2c1, u32_phy_i2c1, xfi_phy_pll_i2c3, sgmii0_i2c,
+                         sgmii1_i2c, i2c1_2, i2c2_0, i2c2_1]
+          - if:
+              properties:
+                function:
+                  const: led
+            then:
+              properties:
+                groups:
+                  enum: [2p5gbe_led0, 2p5gbe_led1, gbe0_led0, gbe0_led1, gbe1_led0, gbe1_led1,
+                         gbe2_led0, gbe2_led1, gbe3_led0, gbe3_led1, wf5g_led0, wf5g_led1]
+          - if:
+              properties:
+                function:
+                  const: pcie
+            then:
+              properties:
+                groups:
+                  items:
+                    enum: [pcie_wake_n0_0, pcie_clk_req_n0_0, pcie_wake_n3_0,
+                           pcie_clk_req_n3, pcie_p0_phy_i2c, pcie_p1_phy_i2c,
+                           pcie_p3_phy_i2c, pcie_p2_phy_i2c, ckm_phy_i2c,
+                           pcie_wake_n0_1, pcie_wake_n3_1, pcie_2l_0_pereset,
+                           pcie_1l_1_pereset, pcie_clk_req_n2_1, pcie_2l_1_pereset,
+                           pcie_1l_0_pereset, pcie_wake_n1_0, pcie_clk_req_n1,
+                           pcie_wake_n2_0, pcie_clk_req_n2_0, pcie_wake_n2_1,
+                           pcie_clk_req_n0_1]
+                  maxItems: 3
+          - if:
+              properties:
+                function:
+                  const: pmic
+            then:
+              properties:
+                groups:
+                  const: pmic
+          - if:
+              properties:
+                function:
+                  const: pwm
+            then:
+              properties:
+                groups:
+                  items:
+                    enum: [pwm0, pwm1, pwm2, pwm2_0, pwm3, pwm3_0, pwm4, pwm4_0, pwm5, pwm5_0,
+                           pwm6, pwm6_0, pwm7, pwm7_0]
+                  maxItems: 2
+          - if:
+              properties:
+                function:
+                  const: spi
+            then:
+              properties:
+                groups:
+                  items:
+                    enum: [spi0, spi0_wp_hold, spi1, spi2, spi2_wp_hold]
+                  maxItems: 2
+          - if:
+              properties:
+                function:
+                  const: uart
+            then:
+              properties:
+                groups:
+                  items:
+                    enum: [net_wo0_uart_txd_0, net_wo0_uart_txd_1, net_wo1_uart_txd_0,
+                           net_wo1_uart_txd_1, net_wo2_uart_txd_0, net_wo2_uart_txd_1,
+                           tops_uart0_0, tops_uart0_1, tops_uart0_2, tops_uart1_0,
+                           tops_uart1_1, tops_uart1_2, uart0, uart1_0, uart1_1, uart1_2,
+                           uart1_2_lite, uart2, uart2_0, uart2_1, uart2_3]
+                  maxItems: 2
+          - if:
+              properties:
+                function:
+                  const: watchdog
+            then:
+              properties:
+                groups:
+                  const: watchdog
+          - if:
+              properties:
+                function:
+                  const: udi
+            then:
+              properties:
+                groups:
+                  const: udi
+          - if:
+              properties:
+                function:
+                  const: usb
+            then:
+              properties:
+                groups:
+                  items:
+                    enum: [drv_vbus, drv_vbus_p1]
+                  maxItems: 1
+
+    patternProperties:
+      '^conf(-[-a-z]*)?$':
+        type: object
+        additionalProperties: false
+        description:
+          pinconf configuration nodes.
+        $ref: /schemas/pinctrl/pincfg-node.yaml
+
+        properties:
+          pins:
+            description:
+              An array of strings. Each string contains the name of a pin.
+            items:
+              enum: [UART2_RXD, UART2_TXD, UART2_CTS, UART2_RTS, GPIO_A, SMI_0_MDC,
+                     SMI_0_MDIO, PCIE30_2L_0_WAKE_N, PCIE30_2L_0_CLKREQ_N,
+                     PCIE30_1L_1_WAKE_N, PCIE30_1L_1_CLKREQ_N, GPIO_P, WATCHDOG,
+                     GPIO_RESET, GPIO_WPS, PMIC_I2C_SCL, PMIC_I2C_SDA, I2C_1_SCL,
+                     I2C_1_SDA, PCIE30_2L_0_PRESET_N, PCIE30_1L_1_PRESET_N, PWMD1,
+                     SPI0_WP, SPI0_HOLD, SPI0_CSB, SPI0_MISO, SPI0_MOSI, SPI0_CLK,
+                     SPI1_CSB, SPI1_MISO, SPI1_MOSI, SPI1_CLK, SPI2_CLK, SPI2_MOSI,
+                     SPI2_MISO, SPI2_CSB, SPI2_HOLD, SPI2_WP, EMMC_RSTB, EMMC_DSL,
+                     EMMC_CK, EMMC_CMD, EMMC_DATA_7, EMMC_DATA_6, EMMC_DATA_5,
+                     EMMC_DATA_4, EMMC_DATA_3, EMMC_DATA_2, EMMC_DATA_1,
+                     EMMC_DATA_0, PCM_FS_I2S_LRCK, PCM_CLK_I2S_BCLK,
+                     PCM_DRX_I2S_DIN, PCM_DTX_I2S_DOUT, PCM_MCK_I2S_MCLK,
+                     UART0_RXD, UART0_TXD, PWMD0, JTAG_JTDI, JTAG_JTDO, JTAG_JTMS,
+                     JTAG_JTCLK, JTAG_JTRST_N, USB_DRV_VBUS_P1, LED_A, LED_B, LED_C,
+                     LED_D, LED_E, GPIO_B, GPIO_C, I2C_2_SCL, I2C_2_SDA,
+                     PCIE30_2L_1_PRESET_N, PCIE30_1L_0_PRESET_N,
+                     PCIE30_2L_1_WAKE_N, PCIE30_2L_1_CLKREQ_N,
+                     PCIE30_1L_0_WAKE_N, PCIE30_1L_0_CLKREQ_N, USB_DRV_VBUS_P0,
+                     UART1_RXD, UART1_TXD, UART1_CTS, UART1_RTS]
+            maxItems: 84
+
+          bias-disable: true
+
+          bias-pull-up:
+            oneOf:
+              - type: boolean
+                description: normal pull up.
+              - enum: [100, 101, 102, 103]
+                description:
+                  PUPD/R1/R0 pull down type. See MTK_PUPD_SET_R1R0 defines in
+                  dt-bindings/pinctrl/mt65xx.h.
+
+          bias-pull-down:
+            oneOf:
+              - type: boolean
+                description: normal pull down.
+              - enum: [100, 101, 102, 103]
+                description:
+                  PUPD/R1/R0 pull down type. See MTK_PUPD_SET_R1R0 defines in
+                  dt-bindings/pinctrl/mt65xx.h.
+
+          input-enable: true
+
+          input-disable: true
+
+          output-enable: true
+
+          output-low: true
+
+          output-high: true
+
+          input-schmitt-enable: true
+
+          input-schmitt-disable: true
+
+          drive-strength:
+            enum: [2, 4, 6, 8, 10, 12, 14, 16]
+
+          mediatek,pull-up-adv:
+            description: |
+              Valid arguments for 'mediatek,pull-up-adv' are '0', '1', '2', '3'
+              Pull up settings for 2 pull resistors, R0 and R1. Valid arguments
+              are described as below:
+              0: (R1, R0) = (0, 0) which means R1 disabled and R0 disabled.
+              1: (R1, R0) = (0, 1) which means R1 disabled and R0 enabled.
+              2: (R1, R0) = (1, 0) which means R1 enabled and R0 disabled.
+              3: (R1, R0) = (1, 1) which means R1 enabled and R0 enabled.
+            $ref: /schemas/types.yaml#/definitions/uint32
+            enum: [0, 1, 2, 3]
+
+          mediatek,pull-down-adv:
+            description: |
+              Valid arguments for 'mediatek,pull-up-adv' are '0', '1', '2', '3'
+              Pull down settings for 2 pull resistors, R0 and R1. Valid arguments
+              are described as below:
+              0: (R1, R0) = (0, 0) which means R1 disabled and R0 disabled.
+              1: (R1, R0) = (0, 1) which means R1 disabled and R0 enabled.
+              2: (R1, R0) = (1, 0) which means R1 enabled and R0 disabled.
+              3: (R1, R0) = (1, 1) which means R1 enabled and R0 enabled.
+            $ref: /schemas/types.yaml#/definitions/uint32
+            enum: [0, 1, 2, 3]
+
+        required:
+          - pins
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/pinctrl/mt65xx.h>
+
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      pio: pinctrl@1001f000 {
+        compatible = "mediatek,mt7988-pinctrl";
+        reg = <0 0x1001f000 0 0x1000>,
+        <0 0x11c10000 0 0x1000>,
+        <0 0x11d00000 0 0x1000>,
+        <0 0x11d20000 0 0x1000>,
+        <0 0x11e00000 0 0x1000>,
+        <0 0x11f00000 0 0x1000>,
+        <0 0x1000b000 0 0x1000>;
+        reg-names = "gpio", "iocfg_tr",
+          "iocfg_br", "iocfg_rb",
+          "iocfg_lb", "iocfg_tl", "eint";
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&pio 0 0 84>;
+        interrupt-controller;
+        interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-parent = <&gic>;
+        #interrupt-cells = <2>;
+
+        i2c0_pins: i2c0-g0-pins {
+          mux {
+            function = "i2c";
+            groups = "i2c0_1";
+          };
+        };
+
+        mdio0_pins: mdio0-pins {
+          mux {
+            function = "eth";
+            groups = "mdc_mdio0";
+          };
+
+          conf {
+            pins = "SMI_0_MDC", "SMI_0_MDIO";
+            drive-strength = <8>;
+          };
+        };
+
+        mmc0_pins_emmc_51: mmc0-emmc-51-pins {
+          mux {
+            function = "flash";
+            groups = "emmc_51";
+          };
+        };
+
+        mmc0_pins_sdcard: mmc0-sdcard-pins {
+          mux {
+            function = "flash";
+            groups = "sdcard";
+          };
+        };
+
+        pcie0_pins: pcie0-pins {
+          mux {
+            function = "pcie";
+            groups = "pcie_2l_0_pereset", "pcie_clk_req_n0_0",
+                     "pcie_wake_n0_0";
+          };
+        };
+
+        pcie1_pins: pcie1-pins {
+          mux {
+            function = "pcie";
+            groups = "pcie_2l_1_pereset", "pcie_clk_req_n1",
+                     "pcie_wake_n1_0";
+          };
+        };
+
+        pcie2_pins: pcie2-pins {
+          mux {
+            function = "pcie";
+            groups = "pcie_1l_0_pereset", "pcie_clk_req_n2_0",
+                     "pcie_wake_n2_0";
+          };
+        };
+
+        pcie3_pins: pcie3-pins {
+          mux {
+            function = "pcie";
+            groups = "pcie_1l_1_pereset", "pcie_clk_req_n3",
+                     "pcie_wake_n3_0";
+          };
+        };
+
+        uart0_pins: uart0-pins {
+          mux {
+            function = "uart";
+            groups =  "uart0";
+          };
+        };
+      };
+    };
-- 
2.43.0


