Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76135C02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 14:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y2z2bj43jcDXnZEuGy40fENAq3lm4+rnyqgg+AVG6h0=; b=sMysgMSX2F028WQTqu6g/Zk6ev
	IjvW5O71f/bdxNwdEZZaOxrFv6A7bGXyuqgEuYa5OGeOigVWcvXr0Ua99LnY85Oq9km+56/WXj8zU
	h8OJiXXOdsAvhqpPv40As2pPgBhqq9Ad3Vf45G64q+itl29qahNJG/+MdKL64fk259IraRa2WIM1B
	2ohirtEesImNBoyZGamZmu68LayqEsnseZn3ZvgRQ8mwnHNhUrlXWg8qTvvJeVG80+os7Cmc6rHWs
	QroVw2jmRYBBvh1E/58o8JXKMtaSWazcSxp0ZRQb1qS/xisxrvlGDew9L+vVdSEMYi9hZ5GrJ2EJr
	3dM/jYQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tabK4-0000000AMfQ-0Yg5;
	Wed, 22 Jan 2025 14:03:12 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tabGF-0000000ALtA-0xtY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 13:59:19 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-38632b8ae71so5609127f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jan 2025 05:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1737554353; x=1738159153; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y2z2bj43jcDXnZEuGy40fENAq3lm4+rnyqgg+AVG6h0=;
        b=PtzFjoT2ouQwcDsu1Ab/dCGD6zMbGZa83A26fR8OTmLWdSfOZRcGoMwOQtIqqKi1/o
         6TLiPLheijz8HXc3HWGPljIWQUKReXYjEt0+0RhhPG3zQC9OV585lVMPA8NSyjmZsS7V
         4uMXfnkAn6o6ZKW7emGE9nZjyse/yuyQBdwA+IEP6PU9ZxlgMFpJ+3ssw5U22FN5Ufra
         jmMXHmVln62nimQOthNkfdq8Nfd1YHPkP7br6dIm1GVZg5OaAZCkuaAIo6HQDNeBb490
         G3SksCnb31zod9TJh5TOPorY0hH03CZYbcvxHK++zbFvFVqncI1zonKvdUeQVHfO5EGT
         TkPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737554353; x=1738159153;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y2z2bj43jcDXnZEuGy40fENAq3lm4+rnyqgg+AVG6h0=;
        b=Xg1pz6j4DDSpAXQEW5/psK4SQ+KsYI+dKkCpxHjQ1DPd/LWc9KNdIfcMMSMMo0UbaJ
         58j8dnsuAKGbM1XN7Kv5TzrUavXPjMpXfBvWvy6prFJ+URwY8kG/wslulLnUlzIOtp9k
         s27dvVMd4pAiMEbZl38U3WDe1IiLJfEgLsV/979ZexlxvilsZsiAJ9hA5lJ7YMIV+jq9
         RzniTzffjeVLhUdGSEN+5QwwTfxDVnJA7aaHic4sjZNC2jDBOLXq8GFH0es2ZPq0947y
         rngzdtU245DtAid0bLDql5R7mWcvaNfN/CzX4xPu98Kfw7hAizwTINvhpfNFe80w5oWt
         MgRg==
X-Forwarded-Encrypted: i=1; AJvYcCU5hOoCM88t8ERPBgoksX8munqY1lpPfQTUhvx0CFQJrp1eIkPSyNubXrlGBPf6Ap+fTiTQ63iqr23JMve6vWJa@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1Nkv/RU0OkbMQTI8vk7bgxESEnEmJJR1biOXW5dIcdok186L+
	lFk2jaPdpgtzkW0WRK60o3K1xFdMWxlqRDC0GsSdlcd/UAQxkflizTc+/j74CME=
X-Gm-Gg: ASbGnctNwOm4u83+3ybXdl6sHBaejzdNbNoQ1A7tmjm/hmdX+Uu57HQcaKMDipSStjr
	Gf6cVkLBMrKlu68mKdETH6jD0C8iPaf054H7XHb+Q34zkyw4AGFTLYi2Y3olGXOC73C7kRP8v/F
	4rX2nKHlqEosMEgEQDUxfS1hPagUh3DqaJnXSDBrViIVikPgI9WRnROP/3jTv22EBGn1bxqqja5
	zGM4Y6YKa79HNCWCkxutchg5CWzJDzeIlmMP9GbGZn4GvmGdovPcsoUeUH/w1u+raCgP64xAUmv
	5+QdGbYPYzWh8pHixkw0RG16FYQuT1ExL57ns/NocZQP3GRQXDXHpvWvmvQDQkCv
X-Google-Smtp-Source: AGHT+IGuyyYJX12iIGQa9Lk74DW0MGukboqie0XjRPjch+W8uUJE/NWYPrn1rrf+lS4ZTG8+mBnlxQ==
X-Received: by 2002:a5d:588b:0:b0:385:f1d9:4b90 with SMTP id ffacd0b85a97d-38bf577f826mr20927156f8f.13.1737554353477;
        Wed, 22 Jan 2025 05:59:13 -0800 (PST)
Received: from [192.168.42.0] (2a02-8428-e55b-1101-1e41-304e-170b-482f.rev.sfr.net. [2a02:8428:e55b:1101:1e41:304e:170b:482f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf3278f06sm16418985f8f.70.2025.01.22.05.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 05:59:13 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
Date: Wed, 22 Jan 2025 14:59:10 +0100
Subject: [PATCH v8 1/5] dt-bindings: media: add mediatek ISP3.0 sensor
 interface
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250122-add-mtk-isp-3-0-support-v8-1-a3d3731eef45@baylibre.com>
References: <20250122-add-mtk-isp-3-0-support-v8-0-a3d3731eef45@baylibre.com>
In-Reply-To: <20250122-add-mtk-isp-3-0-support-v8-0-a3d3731eef45@baylibre.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Andy Hsieh <andy.hsieh@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Julien Stephan <jstephan@baylibre.com>, 
 Louis Kuo <louis.kuo@mediatek.com>, Phi-Bang Nguyen <pnguyen@baylibre.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_055915_278723_86094F81 
X-CRM114-Status: GOOD (  17.97  )
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

From: Louis Kuo <louis.kuo@mediatek.com>

This adds the bindings, for the mediatek ISP3.0 SENINF module embedded in
some Mediatek SoC, such as the mt8365

Signed-off-by: Louis Kuo <louis.kuo@mediatek.com>
Signed-off-by: Phi-Bang Nguyen <pnguyen@baylibre.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 .../bindings/media/mediatek,mt8365-seninf.yaml     | 259 +++++++++++++++++++++
 MAINTAINERS                                        |   7 +
 2 files changed, 266 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8365-seninf.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8365-seninf.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..0f118af05cd0b241a99fac9c469f027cba2f6a1b
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek,mt8365-seninf.yaml
@@ -0,0 +1,259 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) 2023 MediaTek, BayLibre
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/mediatek,mt8365-seninf.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek Sensor Interface 3.0
+
+maintainers:
+  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+  - Julien Stephan <jstephan@baylibre.com>
+  - Andy Hsieh <andy.hsieh@mediatek.com>
+
+description:
+  The ISP3.0 SENINF is the CSI-2 and parallel camera sensor interface found in
+  multiple MediaTek SoCs. It can support up to three physical CSI-2 input ports,
+  configured in DPHY (2 or 4 data lanes) or CPHY depending on the SoC.
+  On the output side, SENINF can be connected either to CAMSV instance or
+  to the internal ISP. CAMSV is used to bypass the internal ISP processing
+  in order to connect either an external ISP, or a sensor (RAW, YUV).
+
+properties:
+  compatible:
+    const: mediatek,mt8365-seninf
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Seninf camsys clock
+      - description: Seninf top mux clock
+
+  clock-names:
+    items:
+      - const: camsys
+      - const: top_mux
+
+  phys:
+    minItems: 2
+    maxItems: 2
+    description:
+      phandle to the PHYs connected to CSI0/A, CSI1, CSI0B
+
+  phy-names:
+    description:
+      list of PHYs names
+    minItems: 2
+    maxItems: 2
+    items:
+      enum: [ csi0, csi1, csi0b]
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: CSI0 or CSI0A port
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              clock-lanes:
+                maxItems: 1
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+      port@1:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: CSI1 port
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              clock-lanes:
+                maxItems: 1
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+      port@2:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: CSI2 port
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              clock-lanes:
+                maxItems: 1
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+      port@3:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: CSI0B port
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              clock-lanes:
+                maxItems: 1
+              data-lanes:
+                minItems: 1
+                maxItems: 2
+
+      port@4:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: connection point for cam0
+
+      port@5:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: connection point for cam1
+
+      port@6:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: connection point for camsv0
+
+      port@7:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: connection point for camsv1
+
+      port@8:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: connection point for camsv2
+
+      port@9:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: connection point for camsv3
+
+    required:
+      - port@0
+      - port@1
+      - port@2
+      - port@3
+      - port@4
+      - port@5
+      - port@6
+      - port@7
+      - port@8
+      - port@9
+
+required:
+  - compatible
+  - interrupts
+  - clocks
+  - clock-names
+  - power-domains
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mediatek,mt8365-clk.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/phy/phy.h>
+    #include <dt-bindings/power/mediatek,mt8365-power.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        csi@15040000 {
+            compatible = "mediatek,mt8365-seninf";
+            reg = <0 0x15040000 0 0x6000>;
+            interrupts = <GIC_SPI 210 IRQ_TYPE_LEVEL_LOW>;
+            clocks = <&camsys CLK_CAM_SENIF>,
+                     <&topckgen CLK_TOP_SENIF_SEL>;
+            clock-names = "camsys", "top_mux";
+
+            power-domains = <&spm MT8365_POWER_DOMAIN_CAM>;
+
+            phys = <&mipi_csi0 PHY_TYPE_DPHY>, <&mipi_csi1>;
+            phy-names = "csi0", "csi1";
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    seninf_in1: endpoint {
+                        clock-lanes = <2>;
+                        data-lanes = <1 3 0 4>;
+                        remote-endpoint = <&isp1_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                };
+
+                port@2 {
+                    reg = <2>;
+                };
+
+                port@3 {
+                    reg = <3>;
+                };
+
+                port@4 {
+                    reg = <4>;
+                    seninf_camsv1_endpoint: endpoint {
+                        remote-endpoint = <&camsv1_endpoint>;
+                    };
+                };
+
+                port@5 {
+                    reg = <5>;
+                    seninf_camsv2_endpoint: endpoint {
+                        remote-endpoint = <&camsv2_endpoint>;
+                    };
+                };
+
+                port@6 {
+                    reg = <6>;
+                };
+
+                port@7 {
+                    reg = <7>;
+                };
+
+                port@8 {
+                    reg = <8>;
+                };
+
+                port@9 {
+                    reg = <9>;
+                };
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index ce3f2904819f9dabd1859d102762c8d8f57496c1..a83db41ae0e9427e983e02f01aecb08193da3cd2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14754,6 +14754,13 @@ M:	Sean Wang <sean.wang@mediatek.com>
 S:	Maintained
 F:	drivers/char/hw_random/mtk-rng.c
 
+MEDIATEK ISP3.0 DRIVER
+M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+M:	Julien Stephan <jstephan@baylibre.com>
+M:	Andy Hsieh <andy.hsieh@mediatek.com>
+S:	Supported
+F:	Documentation/devicetree/bindings/media/mediatek,mt8365-seninf.yaml
+
 MEDIATEK SMI DRIVER
 M:	Yong Wu <yong.wu@mediatek.com>
 L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)

-- 
2.47.1


