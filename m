Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62FFEC44501
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 11:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y+jQVxFrEevTGBEcqhqzgxRvMJkCuzZczX82aAoDYrw=; b=BQ8MqHM90NKeKUKxNqZquIL4cD
	mholE6t19GD0tmNZP/zEF7CRaFf91sLu7YyFKmGYd/V0Y20+H2x2PwQtkO5HmzqKzGFFAwm+pW25a
	/gWpmgiO1EILAluLuShuY5aHnsii9vwotbBs1Ihzt7d8nseL0sKW3sA6wNf6k0BxMizDVX4Djp/Vp
	T0Q6YDth+2LOCp5ExdbfibQvEcsFFtlmbgooZMQMm3lzp8o7j+UhhPCyNldpSttbmTF5R94H7g1Bq
	Ok0O9q36dgVp7X38bTdiDWGYj2U4jvecbeMeI9ZMdnXewF5xfUzcsG+7fmdZ3b2KHGb9TvjHROFKa
	TXg2fLtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjbb1-0000000Blh6-1ByS;
	Tue, 14 Jul 2026 11:46:43 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjbZd-0000000BjFE-106W;
	Tue, 14 Jul 2026 11:45:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784029515;
	bh=9AEe7KIhNArh4IJXv3RS8MnnsQ0VfTkFHvNzhtmL7qg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KwChjUU1fuXA5gwbbL5JSqUx0sF3R8L/ymOW5F0UoReJ10WoovFtLXEls+SePCER3
	 wpBIJPgU/BsbU16aqDj1p14f0x4DYbFa0J10j31ORVGoS0LCRWdLsfB64mpRB2X67V
	 fVf8OP7k6xFWLXTfzpZm/xNSe+/QPM1SfV8Rppskux4jYjceEF3Fno9ei2cGB+jDUq
	 8d2Ht+ZETwFwZTws5GR68iaiOVK5spPqKiAgFVrmaVleqCz+T6POye7JHA6QHjNeE2
	 Ci/ym2i/m4Sb8ilQhqOVuqA1PK8Gk4N0QC/OYNg4bSelasfzF4jGG1s2bWvkTUG2WC
	 ReWphDzWlrVVw==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9D5D817E0956;
	Tue, 14 Jul 2026 13:45:14 +0200 (CEST)
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
Subject: [PATCH v2 34/46] dt-bindings: display: mediatek: Introduce MT8196 Output Processor
Date: Tue, 14 Jul 2026 13:44:02 +0200
Message-ID: <20260714114414.184512-35-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com>
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_044517_465856_A9DB0DAF 
X-CRM114-Status: GOOD (  12.05  )
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

Add documentation for the Overlay Output Processor IP found in
the newer Generation SoCs like MT8196, MT8894, MT6991, and their
variants.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../mediatek/mediatek,mt8196-outproc.yaml     | 107 ++++++++++++++++++
 1 file changed, 107 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-outproc.yaml

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-outproc.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-outproc.yaml
new file mode 100644
index 000000000000..7deffba46404
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-outproc.yaml
@@ -0,0 +1,107 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,mt8196-outproc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek Display Overlay Output Processor
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+
+description:
+  The MediaTek Display Overlay Output Processor hardware handles the
+  post-stage of pixel processing in the layer overlaying process and
+  is also capable of performing gamma correction, ensuring that the
+  per-pixel values are within the expected luma range.
+  If an instance of this hardware is configured as last stage, it is
+  also capable of generating VBlank (Frame Done) events which can be
+  then dispatched either via an interrupt (to the CPU) or through a
+  Global Command Engine (GCE) Event, internally sent to programmable
+  Command Queue (CMDQ) Engine(s) for offloading purposes.
+
+properties:
+  compatible:
+    const: mediatek,mt8196-disp-outproc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    description: Optional VBlank event interrupt
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
+    outproc@32970000 {
+        compatible = "mediatek,mt8196-disp-outproc";
+        reg = <0x32970000 0x1000>;
+        clocks = <&ovlsys0 CLK_OVL_OUTPROC0>;
+        power-domains = <&hpm_hwv MT8196_POWER_DOMAIN_OVL0_DORMANT>;
+        trigger-sources = <&ovl0_mutex 20>;
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
+                    remote-endpoint = <&blender0_8_out>;
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
+                    remote-endpoint = <&ovl0_directlink_out_relay6>;
+                };
+            };
+        };
+    };
+
+...
-- 
2.54.0


