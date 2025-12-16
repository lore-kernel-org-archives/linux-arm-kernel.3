Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89E7CD5E136
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 11:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9YZsNhFzzR6dDdU0HTPthyvmRQ2DTHuowAWIUZgM/GY=; b=fKrwcSHq9qCaqu/ynyxV3Rd5eu
	thxlBmMY0Of2Ujtm1ui+UKiuqA4E0m7qFX26oVa8kyYNwxfD/iKpwSoVtco1HZJXntFVWde6oq7Wc
	zaHdjQnLvS8XQDv+1ZfOdf5QYZQhNE/RV0haJVbnlYahcws+m7kn8Zllg6M26cP9ubcxjmBK/U9GP
	Yziwo/aZHTiPk/K88/UyHUBvFpDRjjTYwcRlL3KAb8AcY0sWHfIw+PWdk2VqBQGAnXnw4vzWnU0lN
	bg+C1Yc9tyA01PUkLox19zhQA93t35z1tul+7/JLww2CvJ5IWlnh040CN0klrpcUzgpKCWwejknxH
	z477BZag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVT7O-000000056q3-3lCz;
	Tue, 16 Dec 2025 11:21:26 +0000
Received: from mail-m155105.qiye.163.com ([101.71.155.105])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVT7F-000000056gc-3qXC;
	Tue, 16 Dec 2025 11:21:19 +0000
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2d6ee1fa0;
	Tue, 16 Dec 2025 19:21:01 +0800 (GMT+08:00)
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
Subject: [PATCH v3 6/7] dt-bindings: pinctrl: rockchip: Add RMIO controller binding
Date: Tue, 16 Dec 2025 19:20:52 +0800
Message-Id: <20251216112053.1927852-7-ye.zhang@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251216112053.1927852-1-ye.zhang@rock-chips.com>
References: <20251216112053.1927852-1-ye.zhang@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9b26e4691409d8kunm7ab62e1d2a7b3bf
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQkpLTlZKSkgfQklNTh1MSx9WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=ULTOS+RsdtB/JaLyeX8BDv5ZWIBiA1Hp4yQl5a7ZSQaKB8imQVtmxx7Ry0jGp6rSXU8KOdBKCRGEXr5HOp2669uXa3czx0WTv1xiwls4l72xGef1mZBiY8QwKH+2X8o7E1gSba3dVWMjs26pWGI8yTQfDwcOJe6HtegA0IjIw78=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=9YZsNhFzzR6dDdU0HTPthyvmRQ2DTHuowAWIUZgM/GY=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_032118_196286_8151BB2B 
X-CRM114-Status: GOOD (  15.58  )
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

1. Add header file with constants for RMIO function IDs for the Rockchip
RK3506 SoC.
2. Add device tree binding for the RMIO (Rockchip Matrix I/O) controller
which is a sub-device of the main pinctrl on some Rockchip SoCs.

Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>
---
 .../bindings/pinctrl/rockchip,pinctrl.yaml    |   9 ++
 .../bindings/pinctrl/rockchip,rmio.yaml       | 106 +++++++++++++++++
 .../pinctrl/rockchip,rk3506-rmio.h            | 109 ++++++++++++++++++
 3 files changed, 224 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/rockchip,rmio.yaml
 create mode 100644 include/dt-bindings/pinctrl/rockchip,rk3506-rmio.h

diff --git a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
index 97960245676d..9a27eaf7942b 100644
--- a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
@@ -82,6 +82,15 @@ required:
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
index 000000000000..af0b34512fb9
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/rockchip,rmio.yaml
@@ -0,0 +1,106 @@
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
+  (General Register Files) or PMU (Power Management Unit).
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - rockchip,rk3506-rmio
+      - const: rockchip,rmio
+
+  rockchip,rmio-grf:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      The phandle of the syscon node (GRF or PMU) containing the RMIO registers.
+      This property is required if the RMIO registers are located in a different
+      syscon than the parent pinctrl node.
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
+patternProperties:
+  "^[a-z0-9-]+$":
+    type: object
+    description:
+      Function node grouping multiple groups.
+
+    patternProperties:
+      "^[a-z0-9-]+$":
+        type: object
+        description:
+          Group node containing the pinmux configuration.
+
+        properties:
+          rockchip,rmio:
+            $ref: /schemas/types.yaml#/definitions/uint32-matrix
+            description:
+              A list of pin-function pairs. The format is <pin_id function_id>.
+            minItems: 1
+            items:
+              items:
+                - description: RMIO Pin ID (0 to pins-num - 1)
+                  minimum: 0
+                  maximum: 31
+                - description: Function ID
+                  minimum: 0
+                  maximum: 98
+
+        required:
+          - rockchip,rmio
+
+        additionalProperties: false
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - rockchip,rmio-grf
+  - rockchip,offset
+  - rockchip,pins-num
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/pinctrl/rockchip,rk3506-rmio.h>
+
+    pinctrl: pinctrl {
+        rmio: rmio {
+            compatible = "rockchip,rk3506-rmio", "rockchip,rmio";
+            rockchip,rmio-grf = <&grf_pmu>;
+            rockchip,offset = <0x80>;
+            rockchip,pins-num = <32>;
+
+            rmio-uart {
+                rmio_pin27_uart1_tx: rmio-pin27-uart1-tx {
+                    rockchip,rmio = <27 RMIO_UART1_TX>;
+                };
+
+                rmio_pin28_uart1_rx: rmio-pin28-uart1-rx {
+                    rockchip,rmio = <28 RMIO_UART1_RX>;
+                };
+            };
+        };
+    };
diff --git a/include/dt-bindings/pinctrl/rockchip,rk3506-rmio.h b/include/dt-bindings/pinctrl/rockchip,rk3506-rmio.h
new file mode 100644
index 000000000000..b129e9a8c287
--- /dev/null
+++ b/include/dt-bindings/pinctrl/rockchip,rk3506-rmio.h
@@ -0,0 +1,109 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
+/*
+ * Copyright (c) 2025 Rockchip Electronics Co., Ltd.
+ */
+
+#ifndef __DT_BINDINGS_PINCTRL_ROCKCHIP_RK3506_RMIO_H
+#define __DT_BINDINGS_PINCTRL_ROCKCHIP_RK3506_RMIO_H
+
+/* RMIO function definition */
+#define RMIO_UART1_TX			1
+#define RMIO_UART1_RX			2
+#define RMIO_UART2_TX			3
+#define RMIO_UART2_RX			4
+#define RMIO_UART3_TX			5
+#define RMIO_UART3_RX			6
+#define RMIO_UART3_CTSN			7
+#define RMIO_UART3_RTSN			8
+#define RMIO_UART4_TX			9
+#define RMIO_UART4_RX			10
+#define RMIO_UART4_CTSN			11
+#define RMIO_UART4_RTSN			12
+#define RMIO_MIPITE			13
+#define RMIO_CLK_32K			14
+#define RMIO_I2C0_SCL			15
+#define RMIO_I2C0_SDA			16
+#define RMIO_I2C1_SCL			17
+#define RMIO_I2C1_SDA			18
+#define RMIO_I2C2_SCL			19
+#define RMIO_I2C2_SDA			20
+#define RMIO_PDM_CLK0			21
+#define RMIO_PDM_SDI0			22
+#define RMIO_PDM_SDI1			23
+#define RMIO_PDM_SDI2			24
+#define RMIO_PDM_SDI3			25
+#define RMIO_CAN1_TX			26
+#define RMIO_CAN1_RX			27
+#define RMIO_CAN0_TX			28
+#define RMIO_CAN0_RX			29
+#define RMIO_PWM0_CH0			30
+#define RMIO_PWM0_CH1			31
+#define RMIO_PWM0_CH2			32
+#define RMIO_PWM0_CH3			33
+#define RMIO_PWM1_CH0			34
+#define RMIO_PWM1_CH1			35
+#define RMIO_PWM1_CH2			36
+#define RMIO_PWM1_CH3			37
+#define RMIO_PWM1_CH4			38
+#define RMIO_PWM1_CH5			39
+#define RMIO_PWM1_CH6			40
+#define RMIO_PWM1_CH7			41
+#define RMIO_TOUCH_KEY_DRIVE		42
+#define RMIO_TOUCH_KEY_IN0		43
+#define RMIO_TOUCH_KEY_IN1		44
+#define RMIO_TOUCH_KEY_IN2		45
+#define RMIO_TOUCH_KEY_IN3		46
+#define RMIO_TOUCH_KEY_IN4		47
+#define RMIO_TOUCH_KEY_IN5		48
+#define RMIO_TOUCH_KEY_IN6		49
+#define RMIO_TOUCH_KEY_IN7		50
+#define RMIO_SAI0_MCLK			51
+#define RMIO_SAI0_SCLK			52
+#define RMIO_SAI0_LRCK			53
+#define RMIO_SAI0_SDI0			54
+#define RMIO_SAI0_SDI1			55
+#define RMIO_SAI0_SDI2			56
+#define RMIO_SAI0_SDI3			57
+#define RMIO_SAI0_SDO			58
+#define RMIO_SAI1_MCLK			59
+#define RMIO_SAI1_SCLK			60
+#define RMIO_SAI1_LRCK			61
+#define RMIO_SAI1_SDI			62
+#define RMIO_SAI1_SDO0			63
+#define RMIO_SAI1_SDO1			64
+#define RMIO_SAI1_SDO2			65
+#define RMIO_SAI1_SDO3			66
+#define RMIO_SPI0_CLK			67
+#define RMIO_SPI0_MOSI			68
+#define RMIO_SPI0_MISO			69
+#define RMIO_SPI0_CSN0			70
+#define RMIO_SPI0_CSN1			71
+#define RMIO_SPI1_CLK			72
+#define RMIO_SPI1_MOSI			73
+#define RMIO_SPI1_MISO			74
+#define RMIO_SPI1_CSN0			75
+#define RMIO_SPI1_CSN1			76
+#define RMIO_WDT_TSADC_SHUT		77
+#define RMIO_PMU_SLEEP			78
+#define RMIO_CORE_POWER_OFF		79
+#define RMIO_SPDIF_TX			80
+#define RMIO_SPDIF_RX			81
+#define RMIO_PWM1_BIP_CNTR_A0		82
+#define RMIO_PWM1_BIP_CNTR_A1		83
+#define RMIO_PWM1_BIP_CNTR_A2		84
+#define RMIO_PWM1_BIP_CNTR_A3		85
+#define RMIO_PWM1_BIP_CNTR_A4		86
+#define RMIO_PWM1_BIP_CNTR_A5		87
+#define RMIO_PWM1_BIP_CNTR_B0		88
+#define RMIO_PWM1_BIP_CNTR_B1		89
+#define RMIO_PWM1_BIP_CNTR_B2		90
+#define RMIO_PWM1_BIP_CNTR_B3		91
+#define RMIO_PWM1_BIP_CNTR_B4		92
+#define RMIO_PWM1_BIP_CNTR_B5		93
+#define RMIO_PDM_CLK1			94
+#define RMIO_ETH_RMII0_PPSCLK		95
+#define RMIO_ETH_RMII0_PPSTRIG		96
+#define RMIO_ETH_RMII1_PPSCLK		97
+#define RMIO_ETH_RMII1_PPSTRIG		98
+
+#endif /* __DT_BINDINGS_PINCTRL_ROCKCHIP_RK3506_RMIO_H */
-- 
2.34.1


