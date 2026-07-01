Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3C91C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 12:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4UxeCZhqd9ebKTj6CFbxss6SQTJjTbrSxwQlQOe8ByU=; b=sx8rdT/0y4PIKo3VnC+ucs06vN
	6K0+gimlV3ZB6ehlkkSxbm5mCR6YQwYQR+1px+UZzJg6dJ+f9mmWbZDxxvuyaSzo9dqmAPen3afih
	4mf16ikgwBfoovoAzmf5hSD1GIkp4OwoQTzXDjJX8uMXw/uvroeAvKDe89FINsmziHB2ViwTb5aH1
	2zr1u6aIlTWwW3W2Z6oIClGG+ya6v7/ezFcJ8B2eYQUAwJcFhi+98pbcVVGM55QXDgDGGNrVloR86
	/L3ReehwnTuCBfkpfbvbBHCxl0+NPP20Q0iqOUhjJall1P/xVfRc+LDOgrc0uQ2XVUhL93KP1menb
	ssjQxzaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetxI-00000001wcQ-0iZt;
	Wed, 01 Jul 2026 12:22:16 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetwk-00000001usa-11Zh;
	Wed, 01 Jul 2026 12:21:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782908500;
	bh=H3clBmnDsizAuTiR83U1RoMtEhzAcO6FscZjR4Byb+8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dO9Ok4ORkxb5r6ItAybjV5kMGboC3A58xTg1OzrnKGFZZsM+oAwriUqb+mrPToq5f
	 xW2xlJ0vXERP6rWqX336KNJeXodsKdV8DktTXgIR8KStUddxIFpw11qZLHWoPyv+Oq
	 lFDkLVG/2E9h+ypIii5UM8YZq2L9QZg9U7qkEzMbBQds17EvZtPXAL215+kmLjJSJS
	 7tKVkEzKWtcmwfdlR2BYrDFOJ+KNlPknsOJ1M1Kzmbk1B1mrHwq91VjbfEmmF7YVf4
	 LEAjeGPMMQR0OvW9wje6jZDTsLewjdYCndumr1tBFWmpeBi0pTLj7CuA+9RGBSYAVf
	 vWPLeK72Ro+QQ==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 76BC717E1553;
	Wed,  1 Jul 2026 14:21:39 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	justin.yeh@mediatek.com,
	jason-jh.lin@mediatek.com,
	kernel@collabora.com
Subject: [PATCH 28/42] dt-bindings: display: mediatek: Introduce MT8196 extended DMA Engine
Date: Wed,  1 Jul 2026 14:20:43 +0200
Message-ID: <20260701122057.19648-29-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701122057.19648-1-angelogioacchino.delregno@collabora.com>
References: <20260701122057.19648-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_052142_669548_DAE5CFDD 
X-CRM114-Status: GOOD (  13.11  )
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

Add documentation for the extended DMA Engine (exDMA) IP found in
the newer generation SoCs like MT8196, MT8894, MT6991, and their
variants.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../mediatek/mediatek,mt8196-exdma.yaml       | 104 ++++++++++++++++++
 1 file changed, 104 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-exdma.yaml

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-exdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-exdma.yaml
new file mode 100644
index 000000000000..ca08a74ef7ad
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-exdma.yaml
@@ -0,0 +1,104 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,mt8196-exdma.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek Display Overlay extended DMA (exDMA) Engine
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+
+description:
+  The MediaTek Display Overlay extended DMA (exDMA) Engine hardware is used
+  to configure the Display Controller to read the data from DRAM to perform
+  layer overlaying.
+  This hardware also includes color conversion functions to output pixels
+  processed into a consistent color domain.
+
+properties:
+  compatible:
+    - const: mediatek,mt8196-disp-exdma
+
+  reg:
+    maxItems: 1
+
+  "#dma-cells":
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+
+    required:
+      - port@0
+      - port@1
+
+  trigger-sources:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - "#dma-cells"
+  - clocks
+  - clock-names
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/mediatek,mt8196-clock.h>
+    #include <dt-bindings/power/mediatek,mt8196-power.h>
+
+    dma-controller@32850000 {
+        compatible = "mediatek,mt8196-disp-exdma";
+        reg = <0x32850000 0x1000>;
+        #dma-cells = <1>;
+        clocks = <&ovlsys0 CLK_OVL_EXDMA2>;
+        power-domains = <&hpm_hwv MT8196_POWER_DOMAIN_OVL0_DORMANT>;
+        trigger-sources = <&ovl0_mutex 2>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                reg = <0>;
+
+                endpoint@0 {
+                    reg = <0>;
+                    remote-endpoint = <&ovl0_resizer0_out>;
+                };
+            };
+
+            port@1 {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                reg = <1>;
+
+                endpoint@0 {
+                    reg = <0>;
+                    remote-endpoint = <&blender0_1_in>;
+                };
+            };
+        };
+    };
+
+...
-- 
2.54.0


