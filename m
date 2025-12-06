Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28C0DD3ABF9
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Dec 2025 05:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B8Pv8F+oXHHjCE0zxtFanqIKrinBiYf5cSRDVL4WFrI=; b=DXJ9qWPuvZyn0jTnk24KCAjWIv
	OxIKvJJX1lrRJi+yJ1AZuVJPBFpTvA9MxwR89SBkoEau0iC9C9k3IUVY8ivxmntcGdCfDVkYwYih7
	qnfSx4iazwuQsJaqKRQKX9dBVu/1HzfmtLdi9vUCz+BpJaGOXve8V5yeS8eEn4j/UuP0lO+Sfko8x
	Dtv5aoFMs9b7yIXxy34WCDMAsk0ura0qETCTLFSSibZSQsuBJJ9NHeg34H0/hMvN7Qu24VSKkHMPU
	zMWmQzuz8hJ3qQCyw5tdroCk3J3WA3Vnr3lBlvRohk8QnK7WoqBub0OcLYW/zt/ewNcN2Q0HqvM8O
	eFI+NvMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRkXa-0000000AdIY-03CT;
	Sat, 06 Dec 2025 05:09:06 +0000
Received: from mail-m3271.qiye.163.com ([220.197.32.71])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRkXU-0000000AdBg-1Hlj;
	Sat, 06 Dec 2025 05:09:01 +0000
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2c3493a70;
	Sat, 6 Dec 2025 13:08:55 +0800 (GMT+08:00)
From: Ye Zhang <ye.zhang@rock-chips.com>
To: Ye Zhang <ye.zhang@rock-chips.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tao.huang@rock-chips.com
Subject: [PATCH v2 7/8] dt-bindings: pinctrl: rockchip: Add RMIO controller binding
Date: Sat,  6 Dec 2025 13:08:43 +0800
Message-Id: <20251206050844.402958-8-ye.zhang@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251206050844.402958-1-ye.zhang@rock-chips.com>
References: <20251206050844.402958-1-ye.zhang@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9af210229409d8kunmae94618c4ed3f36
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGhkaS1ZIHUxPTBlKTBhITB1WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=Nahoi33a9W7LKo9zBZsKTBZmqp6NoX79vHrjDvTS7bhW0RXV/xE8MzpUWWK+x16thFH0Zj18qnxkaLMNOZfwhCz89tX4j4xtL4hcnuIidmUY9ytLTBlXBE81klggfepXLlIUgBmyWi9mQHQQSOPAByDC4et3+FZrW1EKeuJS0NU=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=B8Pv8F+oXHHjCE0zxtFanqIKrinBiYf5cSRDVL4WFrI=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_210900_546027_A8B15CEC 
X-CRM114-Status: GOOD (  13.77  )
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

Add device tree binding for the RMIO (Rockchip Matrix I/O) controller
which is a sub-device of the main pinctrl on some Rockchip SoCs.

Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>
---
 .../bindings/pinctrl/rockchip,pinctrl.yaml    |   9 ++
 .../bindings/pinctrl/rockchip,rmio.yaml       | 130 ++++++++++++++++++
 2 files changed, 139 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/rockchip,rmio.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
index 93bf8f352e48..01df0a51ff83 100644
--- a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
@@ -83,6 +83,15 @@ required:
   - rockchip,grf
 
 patternProperties:
+  "rmio[0-9]*$":
+    type: object
+
+    $ref: "/schemas/pinctrl/rockchip,rmio.yaml#"
+
+    description:
+      The RMIO (Rockchip Matrix I/O) controller node which functions as a
+      sub-device of the main pinctrl to handle flexible function routing.
+
   "gpio@[0-9a-f]+$":
     type: object
 
diff --git a/Documentation/devicetree/bindings/pinctrl/rockchip,rmio.yaml b/Documentation/devicetree/bindings/pinctrl/rockchip,rmio.yaml
new file mode 100644
index 000000000000..28ec5ad62061
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/rockchip,rmio.yaml
@@ -0,0 +1,130 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/rockchip,rmio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RMIO (Rockchip Matrix I/O) Controller
+
+maintainers:
+  - Heiko Stuebner <heiko@sntech.de>
+
+description: |
+  The RMIO controller provides a flexible routing matrix that allows mapping
+  various internal peripheral functions (UART, SPI, PWM, etc.) to specific
+  physical pins. This block is typically a sub-block of the GRF
+  (General Register Files).
+
+properties:
+  compatible:
+    enum:
+      - rockchip,rmio
+
+  rockchip,grf:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      The phandle of the syscon node for the GRF registers.
+
+  rockchip,offset:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      The offset of the RMIO configuration registers within the GRF.
+
+  rockchip,pins-num:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      The number of physical pins supported by this RMIO instance.
+      Used for boundary checking and driver initialization.
+
+additionalProperties:
+  type: object
+  additionalProperties:
+    type: object
+    properties:
+      rockchip,rmio:
+        $ref: "/schemas/types.yaml#/definitions/uint32-matrix"
+        description: |
+          A list of pin-function pairs. The format is <pin_id function_id>.
+          - pin_id: The index of the RMIO pin (0 to pins-num - 1).
+          - function_id: The mux value selecting the peripheral function.
+        minItems: 1
+        items:
+          items:
+            - minimum: 0
+              maximum: 31
+              description:
+                RMIO Pin ID.
+            - minimum: 0
+              maximum: 98
+              description:
+                Function ID.
+
+    required:
+      - rockchip,rmio
+
+    additionalProperties: false
+
+  additionalProperties: false
+
+required:
+  - compatible
+  - rockchip,grf
+  - rockchip,offset
+  - rockchip,pins-num
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/pinctrl/rockchip.h>
+    #include <dt-bindings/pinctrl/rockchip,rk3506-rmio.h>
+
+    pinctrl {
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+
+        rmio {
+            compatible = "rockchip,rmio";
+            rockchip,grf = <&grf_pmu>;
+            rockchip,offset = <0x80>;
+            rockchip,pins-num = <32>;
+
+            rmio-uart {
+                rmio_pin27_uart1_tx: rmio-pin27-uart1-tx {
+                    rockchip,rmio = <RMIO_PIN27 RMIO_UART1_TX>;
+                };
+
+                rmio_pin28_uart1_rx: rmio-pin28-uart1-rx {
+                    rockchip,rmio = <RMIO_PIN28 RMIO_UART1_RX>;
+                };
+            };
+        };
+
+        pcfg_pull_default: pcfg-pull-default {
+          bias-pull-pin-default;
+        };
+
+        rm {
+          rmio_pin27_pins: rmio-pin27-pins {
+            rockchip,pins = <1 RK_PC2 7 &pcfg-pull-default>;
+          };
+
+          rmio_pin28_pins: rmio-pin28-pins {
+            rockchip,pins = <1 RK_PC3 7 &pcfg-pull-default>;
+          };
+        };
+    };
+
+    uart1: serial@20064000 {
+      compatible = "snps,dw-apb-uart";
+      reg = <0x20064000 0x400>;
+      interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
+      clocks = <&mux_uart2>;
+      pinctrl-0 = <&rmio_pin27_pins &rmio_pin27_uart1_tx
+                   &rmio_pin28_pins &rmio_pin28_uart1_rx>;
+      pinctrl-names = "default";
+      reg-io-width = <1>;
+      reg-shift = <2>;
+    };
-- 
2.34.1


