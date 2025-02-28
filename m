Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3932CC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 01:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TqwDG9UH3rob70SESaiLXw5aIga92vca0kZfxMsPGkM=; b=gx99kuLxeFNv/zI9EIbgavgsM+
	sMDcP8CRtPFBiarUVgu8Y49wpuAzJ0l+734+udYqROXYIyhXMO2Zt90g1tSeG0+4BJ2KtadEGXQtT
	sXjJtY76L+AyEhyqMvEeTwPt9kYhijQB0Uepq0PZv8q6Gakf/XEi9vLuooIpivrU+kt2A5QpSYrvt
	xCJOHqFGO7h+S8IiKhe89V7mAKOmQk/DRJbjdkTQZNHXT4XQ79D4lv7yGxvdg+lnvV9QK4U/i7QC4
	S+JVRIefRcohHn0mv3r3wi/Elwl8Pu9U/X3xBXS6dHSnNtYTtwGAKLwaI8KDibPZHP3eUnd3SXpf2
	PjksT7LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnp3X-00000009NLd-3NO3;
	Fri, 28 Feb 2025 01:20:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnp1y-00000009Mv0-2imv;
	Fri, 28 Feb 2025 01:19:12 +0000
X-UUID: 02106408f57211efa1e849db4cc18d44-20250227
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=TqwDG9UH3rob70SESaiLXw5aIga92vca0kZfxMsPGkM=;
	b=jFf2Q3YvqIj/pdnKeV0jSihV0CyNb59QbfVYgoVglGMwVNvNTLXtpkLcF3K7ShxsSstMLqR+yr876kLf0H7gRjtkAQoWiU1e4LpqXoF3anJiWr8Myz3r+eu7Wz5iCMmxMC+row8ykH3P72Hr+t6zmcl0XI2ff9Z4z7A7F0SpwDE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:f2ca665e-ce75-4e23-8281-4b6095d02003,IP:0,U
	RL:25,TC:0,Content:-5,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:60aa074,CLOUDID:c58f5929-e0f8-414e-b8c3-b75c08217be8,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:1|
	19,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA
	:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 02106408f57211efa1e849db4cc18d44-20250227
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <ot_cathy.xu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1540082572; Thu, 27 Feb 2025 18:19:08 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 28 Feb 2025 09:19:05 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Fri, 28 Feb 2025 09:19:04 +0800
From: Cathy Xu <ot_cathy.xu@mediatek.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@kernel.org>
CC: <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Yong Mao <yong.mao@mediatek.com>, Axe
 Yang <axe.yang@mediatek.com>, Wenbin Mei <wenbin.mei@mediatek.com>, Lei Xue
	<lei.xue@mediatek.com>, Cathy Xu <ot_cathy.xu@mediatek.com>, Guodong Liu
	<guodong.liu@mediatek.com>
Subject: [PATCH v4 1/3] dt-bindings: pinctrl: mediatek: Add support for mt8196
Date: Fri, 28 Feb 2025 09:16:25 +0800
Message-ID: <20250228011702.16493-2-ot_cathy.xu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250228011702.16493-1-ot_cathy.xu@mediatek.com>
References: <20250228011702.16493-1-ot_cathy.xu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_171910_692587_8744F7DE 
X-CRM114-Status: GOOD (  16.94  )
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

Add the new binding document for pinctrl on MediaTek mt8196.

Signed-off-by: Guodong Liu <guodong.liu@mediatek.com>
Signed-off-by: Cathy Xu <ot_cathy.xu@mediatek.com>
---
 .../pinctrl/mediatek,mt8196-pinctrl.yaml      | 241 ++++++++++++++++++
 1 file changed, 241 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt8196-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8196-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8196-pinctrl.yaml
new file mode 100644
index 000000000000..3100455c3c9d
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8196-pinctrl.yaml
@@ -0,0 +1,241 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/mediatek,mt8196-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT8196 Pin Controller
+
+maintainers:
+  - Lei Xue <lei.xue@mediatek.com>
+  - Cathy Xu <ot_cathy.xu@mediatek.com>
+
+description:
+  The MediaTek's MT8196 Pin controller is used to control SoC pins.
+
+properties:
+  compatible:
+    const: mediatek,mt8196-pinctrl
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    description:
+      Number of cells in GPIO specifier, should be two. The first cell is the
+      pin number, the second cell is used to specify optional parameters which
+      are defined in <dt-bindings/gpio/gpio.h>.
+    const: 2
+
+  gpio-ranges:
+    maxItems: 1
+
+  gpio-line-names: true
+
+  reg:
+    items:
+      - description: gpio registers base address
+      - description: rt group io configuration registers base address
+      - description: rm1 group io configuration registers base address
+      - description: rm2 group io configuration registers base address
+      - description: rb group io configuration registers base address
+      - description: bm1 group io configuration registers base address
+      - description: bm2 group io configuration registers base address
+      - description: bm3 group io configuration registers base address
+      - description: lt group io configuration registers base address
+      - description: lm1 group io configuration registers base address
+      - description: lm2 group io configuration registers base address
+      - description: lb1 group io configuration registers base address
+      - description: lb2 group io configuration registers base address
+      - description: tm1 group io configuration registers base address
+      - description: tm2 group io configuration registers base address
+      - description: tm3 group io configuration registers base address
+
+  reg-names:
+    items:
+      - const: iocfg0
+      - const: iocfg_rt
+      - const: iocfg_rm1
+      - const: iocfg_rm2
+      - const: iocfg_rb
+      - const: iocfg_bm1
+      - const: iocfg_bm2
+      - const: iocfg_bm3
+      - const: iocfg_lt
+      - const: iocfg_lm1
+      - const: iocfg_lm2
+      - const: iocfg_lb1
+      - const: iocfg_lb2
+      - const: iocfg_tm1
+      - const: iocfg_tm2
+      - const: iocfg_tm3
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 2
+
+  interrupts:
+    description: The interrupt outputs to sysirq.
+    maxItems: 1
+
+# PIN CONFIGURATION NODES
+patternProperties:
+  '-pins$':
+    type: object
+    additionalProperties: false
+
+    patternProperties:
+      '^pins':
+        type: object
+        $ref: /schemas/pinctrl/pincfg-node.yaml
+        additionalProperties: false
+        description:
+          A pinctrl node should contain at least one subnode representing the
+          pinctrl groups available on the machine. Each subnode will list the
+          pins it needs, and how they should be configured, with regard to muxer
+          configuration, pullups, drive strength, input enable/disable and input
+          schmitt.
+
+        properties:
+          pinmux:
+            description:
+              Integer array, represents gpio pin number and mux setting.
+              Supported pin number and mux varies for different SoCs, and are
+              defined as macros in arch/arm64/boot/dts/mediatek/mt8196-pinfunc.h
+              directly, for this SoC.
+
+          drive-strength:
+            enum: [2, 4, 6, 8, 10, 12, 14, 16]
+
+          bias-pull-down:
+            oneOf:
+              - type: boolean
+              - enum: [100, 101, 102, 103]
+                description: mt8196 pull down PUPD/R0/R1 type define value.
+              - enum: [75000, 5000]
+                description: mt8196 pull down RSEL type si unit value(ohm).
+            description: |
+              For pull down type is normal, it doesn't need add R1R0 define
+              and resistance value.
+              For pull down type is PUPD/R0/R1 type, it can add R1R0 define to
+              set different resistance. It can support "MTK_PUPD_SET_R1R0_00" &
+              "MTK_PUPD_SET_R1R0_01" & "MTK_PUPD_SET_R1R0_10" &
+              "MTK_PUPD_SET_R1R0_11" define in mt8196.
+              For pull down type is PD/RSEL, it can add resistance value(ohm)
+              to set different resistance by identifying property
+              "mediatek,rsel-resistance-in-si-unit". It can support resistance
+              value(ohm) "75000" & "5000" in mt8196.
+
+          bias-pull-up:
+            oneOf:
+              - type: boolean
+              - enum: [100, 101, 102, 103]
+                description: mt8196 pull up PUPD/R0/R1 type define value.
+              - enum: [1000, 1500, 2000, 3000, 4000, 5000, 75000]
+                description: mt8196 pull up RSEL type si unit value(ohm).
+            description: |
+              For pull up type is normal, it don't need add R1R0 define
+              and resistance value.
+              For pull up type is PUPD/R0/R1 type, it can add R1R0 define to
+              set different resistance. It can support "MTK_PUPD_SET_R1R0_00" &
+              "MTK_PUPD_SET_R1R0_01" & "MTK_PUPD_SET_R1R0_10" &
+              "MTK_PUPD_SET_R1R0_11" define in mt8196.
+              For pull up type is PU/RSEL, it can add resistance value(ohm)
+              to set different resistance by identifying property
+              "mediatek,rsel-resistance-in-si-unit". It can support resistance
+              value(ohm) "1000" & "1500" & "2000" & "3000" & "4000" & "5000" &
+              "75000" in mt8196.
+
+          bias-disable: true
+
+          output-high: true
+
+          output-low: true
+
+          input-enable: true
+
+          input-disable: true
+
+          input-schmitt-enable: true
+
+          input-schmitt-disable: true
+
+        required:
+          - pinmux
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-controller
+  - '#interrupt-cells'
+  - gpio-controller
+  - '#gpio-cells'
+  - gpio-ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    #include "../../../../arch/arm64/boot/dts/mediatek/mt8196-pinfunc.h"
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    pio: pinctrl@10005000 {
+        compatible = "mediatek,mt8196-pinctrl";
+        reg = <0x1002d000 0x1000>,
+              <0x12000000 0x1000>,
+              <0x12020000 0x1000>,
+              <0x12040000 0x1000>,
+              <0x12060000 0x1000>,
+              <0x12820000 0x1000>,
+              <0x12840000 0x1000>,
+              <0x12860000 0x1000>,
+              <0x13000000 0x1000>,
+              <0x13020000 0x1000>,
+              <0x13040000 0x1000>,
+              <0x130f0000 0x1000>,
+              <0x13110000 0x1000>,
+              <0x13800000 0x1000>,
+              <0x13820000 0x1000>,
+              <0x13860000 0x1000>;
+        reg-names = "iocfg0", "iocfg_rt",
+                    "iocfg_rm1", "iocfg_rm2", "iocfg_rb",
+                    "iocfg_bm1", "iocfg_bm2", "iocfg_bm3",
+                    "iocfg_lt", "iocfg_lm1", "iocfg_lm2",
+                    "iocfg_lb1", "iocfg_lb2", "iocfg_tm1",
+                    "iocfg_tm2", "iocfg_tm3";
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&pio 0 0 271>;
+        interrupt-controller;
+        interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH 0>;
+        #interrupt-cells = <2>;
+
+        pio-pins {
+            pins {
+                pinmux = <PINMUX_GPIO0__FUNC_GPIO0>;
+                output-low;
+            };
+        };
+
+        spi0-pins {
+            pins-spi {
+                pinmux = <PINMUX_GPIO110__FUNC_SPI1_CLK>,
+                         <PINMUX_GPIO111__FUNC_SPI1_CSB>,
+                         <PINMUX_GPIO112__FUNC_SPI1_MO>;
+                drive-strength = <6>;
+            };
+            pins-spi-mi {
+                pinmux = <PINMUX_GPIO113__FUNC_SPI1_MI>;
+                bias-pull-down;
+            };
+        };
+
+        i2c0-pins {
+            pins {
+                pinmux = <PINMUX_GPIO99__FUNC_SCL0>,
+                         <PINMUX_GPIO100__FUNC_SDA0>;
+                bias-disable;
+            };
+        };
+    };
-- 
2.45.2


