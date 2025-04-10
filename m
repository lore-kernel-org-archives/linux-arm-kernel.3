Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C23FC369A9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 19:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U1u4zTe2vGBhpFEm2Hrof0M+T3ZkWuuLGGTGSoUl7+Y=; b=YdWj6T30Z9LDxgRkLaB79Q4USc
	6TQ1KkMHMm614/YF27Fy/bwxRk/wPHn+sUoKme6F7XxaTtJN/9oJFrCTlpfg3sfUdbsgKVXh/w6z1
	f2AH3Iqj/1AVehKTVAEk15hJ23giMLTOEkOVwc1sGZpi8iJqQTbfu4YpAVAQN67dMgxDRnnUyKbeR
	3AG27ZOATEBwsAmebKlmMbpTRu2sc/myqZj4/WFLmOxQJU6jLO6jH4INRHzhq4Vm9+BBw7CiofCql
	ALvqPHIdnnAj06HuTz1evr2DI7ldeeYETX7/iz713sQjH448QrusSADjWjs8jfC91L8lBjC5yJG4H
	KgkASO+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2xw1-0000000Bhim-0Puz;
	Thu, 10 Apr 2025 19:51:37 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2xle-0000000BfvS-10X5;
	Thu, 10 Apr 2025 19:40:55 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1744314043; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=fBJ6R9yCr0/Ln8eBmb6Kl1hQt6Sqos2Z3bpRrWX6vPsGGj/VLVd+gqMqrVXLqC9uvfBCQwENfRztNDeHul3/dFM96c2lqaD/M0KhgJCNBFzsLnojfjaPECwzcYfBQay6x0RjeSy5nfakHzZJcWpSWMipBpOjDXdXdN8fr17TzxA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1744314043; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=U1u4zTe2vGBhpFEm2Hrof0M+T3ZkWuuLGGTGSoUl7+Y=; 
	b=b48p/Jk247HX5ZxJtnUhrSIjkGl5j3esqQD5pL9IGL8jc9MIfAFhfS7rzgjwfai82Mb7W9xploAot7dvQTDAXCz2zpkMWuonBr6Zia776E0AIG/0drAK2a9WkX0/7bntW2wxpxJYYEnRBb3d8BDGRGHbOBUmUJP2j1QJ702nC5k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744314043;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=U1u4zTe2vGBhpFEm2Hrof0M+T3ZkWuuLGGTGSoUl7+Y=;
	b=Jk0yeFYYhgRjozwb0ko7Eg9mypMX9L+T4cBDyl0bfe3NWSY8XM9++5EfIjHo0F65
	A3rG/7E66E9GUDIVTV625cK7y2BLS4+I9B9p3F1Mg4iR8b5ixxO7mX1dAZjD2UdHPOG
	K+3AQoG8LeJAqHgJd/k2LTiWAFng0D+FMMOyLKnE=
Received: by mx.zohomail.com with SMTPS id 1744314041130428.8987154701755;
	Thu, 10 Apr 2025 12:40:41 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 10 Apr 2025 21:39:57 +0200
Subject: [PATCH v2 05/11] ASoC: dt-bindings: add schema for rockchip SAI
 controllers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-rk3576-sai-v2-5-c64608346be3@collabora.com>
References: <20250410-rk3576-sai-v2-0-c64608346be3@collabora.com>
In-Reply-To: <20250410-rk3576-sai-v2-0-c64608346be3@collabora.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Sugar Zhang <sugar.zhang@rock-chips.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, kernel@collabora.com, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_124054_321739_771C906E 
X-CRM114-Status: GOOD (  17.44  )
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

Rockchip introduced a new audio controller called the "Serial Audio
Interface", or "SAI" for short, on some of their newer SoCs. In
particular, this controller is used several times on the RK3576 SoC.

Add a schema for it, with only an RK3576 compatible for now. Other SoCs
may follow as mainline support for them lands.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 .../bindings/sound/rockchip,rk3576-sai.yaml        | 144 +++++++++++++++++++++
 MAINTAINERS                                        |   6 +
 2 files changed, 150 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/rockchip,rk3576-sai.yaml b/Documentation/devicetree/bindings/sound/rockchip,rk3576-sai.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..149da9a91451f202aa241f0854d9f54514cae8a3
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/rockchip,rk3576-sai.yaml
@@ -0,0 +1,144 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/rockchip,rk3576-sai.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip Serial Audio Interface Controller
+
+description:
+  The Rockchip Serial Audio Interface (SAI) controller is a flexible audio
+  controller that implements the I2S, I2S/TDM and the PDM standards.
+
+maintainers:
+  - Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: rockchip,rk3576-sai
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  dmas:
+    minItems: 1
+    maxItems: 2
+
+  dma-names:
+    minItems: 1
+    items:
+      - enum: [tx, rx]
+      - const: rx
+
+  clocks:
+    items:
+      - description: master audio clock
+      - description: AHB clock driving the interface
+
+  clock-names:
+    items:
+      - const: mclk
+      - const: hclk
+
+  resets:
+    minItems: 1
+    items:
+      - description: reset for the mclk domain
+      - description: reset for the hclk domain
+
+  reset-names:
+    minItems: 1
+    items:
+      - const: m
+      - const: h
+
+  port:
+    $ref: audio-graph-port.yaml#
+    unevaluatedProperties: false
+
+  power-domains:
+    maxItems: 1
+
+  "#sound-dai-cells":
+    const: 0
+
+  rockchip,sai-rx-route:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description:
+      Defines the mapping of the controller's SDI ports to actual input lanes,
+      as well as the number of input lanes.
+      rockchip,sai-rx-route = <3> would mean sdi3 is receiving from data0, and
+      that there is only one receiving lane.
+      This property's absence is to be understood as only one receiving lane
+      being used if the controller has capture capabilities.
+    maxItems: 4
+    items:
+      minimum: 0
+      maximum: 3
+
+  rockchip,sai-tx-route:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description:
+      Defines the mapping of the controller's SDO ports to actual output lanes,
+      as well as the number of output lanes.
+      rockchip,sai-tx-route = <3> would mean sdo3 is sending to data0, and
+      that there is only one transmitting lane.
+      This property's absence is to be understood as only one transmitting lane
+      being used if the controller has playback capabilities.
+    maxItems: 4
+    items:
+      minimum: 0
+      maximum: 3
+
+required:
+  - compatible
+  - reg
+  - dmas
+  - dma-names
+  - clocks
+  - clock-names
+  - "#sound-dai-cells"
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/rockchip,rk3576-cru.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/pinctrl/rockchip.h>
+    #include <dt-bindings/power/rockchip,rk3576-power.h>
+    #include <dt-bindings/reset/rockchip,rk3576-cru.h>
+
+    bus {
+        #address-cells = <2>;
+        #size-cells = <2>;
+        sai1: sai@2a610000 {
+            compatible = "rockchip,rk3576-sai";
+            reg = <0x0 0x2a610000 0x0 0x1000>;
+            interrupts = <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&cru MCLK_SAI1_8CH>, <&cru HCLK_SAI1_8CH>;
+            clock-names = "mclk", "hclk";
+            dmas = <&dmac0 2>, <&dmac0 3>;
+            dma-names = "tx", "rx";
+            power-domains = <&power RK3576_PD_AUDIO>;
+            resets = <&cru SRST_M_SAI1_8CH>, <&cru SRST_H_SAI1_8CH>;
+            reset-names = "m", "h";
+            pinctrl-names = "default";
+            pinctrl-0 = <&sai1m0_lrck
+                         &sai1m0_sclk
+                         &sai1m0_sdi0
+                         &sai1m0_sdo0
+                         &sai1m0_sdo1
+                         &sai1m0_sdo2
+                         &sai1m0_sdo3>;
+            rockchip,sai-tx-route = <3 1 2 0>;
+            #sound-dai-cells = <0>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 96b82704950184bd71623ff41fc4df31e4c7fe87..fef80aecabab25b2855311174607d05b3cffed45 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20910,6 +20910,12 @@ F:	Documentation/devicetree/bindings/sound/rockchip,rk3308-codec.yaml
 F:	sound/soc/codecs/rk3308_codec.c
 F:	sound/soc/codecs/rk3308_codec.h
 
+ROCKCHIP SAI DRIVER
+M:	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
+L:	linux-rockchip@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/sound/rockchip,rk3576-sai.yaml
+
 ROCKCHIP VIDEO DECODER DRIVER
 M:	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
 L:	linux-media@vger.kernel.org

-- 
2.49.0


