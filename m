Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1738CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 13:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=78t7HETdib3ovZErKnjIa74ASTASKxbrfuHwhaUguRk=; b=gafRW9O802Ie+1f7ru2MQVPOgK
	rO7I/Ivi0nQJFLEqDuV7RKFDQHSQNLBnsACTtQVvZrzZVeoG8wN1G8Ric+M1sqhNwNZijAJwi46XY
	DEw3vZBJIdzTUSXXuvLPPETwISPpHyCNbajxWS367kQJyQTamVNWhT2yWltUBgJDiUsv6sghgHyz/
	QKNKTUu7AySiZGb+XIPOo+ztKZSscH/k/PJpYk/s3ZRGNVLml9wvGqOGpsTZJ8MsgZCWhVcdUUss9
	e8HPiJMoNb22sRKuxhvMuz55/fP63ZBhxErNRV+75DiySvL13CosKRfvoWJSf0ZIhaovolHt6E7WK
	sSkJCYng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjbbO-0000000BmIB-3Uy7;
	Tue, 14 Jul 2026 11:47:07 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjbZo-0000000BjTw-0xjZ;
	Tue, 14 Jul 2026 11:45:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784029526;
	bh=2oMEWGJqJw3ZhiHkQ1HtMTnhkMX9kCC2Sc5DJ6y/FJE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dwE6BOTClq0tJ4hDmXlIyjTU8iC8bcZx8V68gJDhkaeYgS4PruxOAZmFcHjh/ll/X
	 AVaQdCr9oGeXC5iOXnogr12pcFWcjEY59Pbe14yABVxxR8yChlbA3Pe29vwN3yZ9Dm
	 vhGeT1fOq4eEJkaF7zNJkEjtAVdZN6J4KivR9QQWEYgRJjNi2L4MQg+3bWxWelwsVw
	 2A0uQ1Bk9EhNZyZeBPO9jLftDK0tLnTdfIlZZ8lCHi1Byooojort+J9Uxg3+kjMAnM
	 mAfr9Bodby5kRnBOQw0zPWMcJfz+MfaeW1HLLnU4BM11wFn2W5ObBqETCXELmtoJVG
	 uZxusMTaMgPWQ==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AAED317E0E95;
	Tue, 14 Jul 2026 13:45:25 +0200 (CEST)
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
Subject: [PATCH v2 42/46] dt-bindings: display: mediatek: Introduce MT8196 2D Sharpness Processor
Date: Tue, 14 Jul 2026 13:44:10 +0200
Message-ID: <20260714114414.184512-43-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com>
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_044528_445992_A0FAC084 
X-CRM114-Status: GOOD (  10.81  )
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

Add documentation for the Two-Dimension Sharpness Processor, or
"TDSHP", found in many MediaTek SoCs including MT8196 and its
variants.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../mediatek/mediatek,mt8196-tdshp.yaml       | 98 +++++++++++++++++++
 1 file changed, 98 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-tdshp.yaml

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-tdshp.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-tdshp.yaml
new file mode 100644
index 000000000000..ccd6a8443443
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-tdshp.yaml
@@ -0,0 +1,98 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,mt8196-tdshp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek Display Two-Dimension Sharpness Processor (TDSHP)
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+
+description:
+  The MediaTek 2D Sharpness Processor (TDSHP) is responsible for performing
+  image sharpness adjustments/enhancements in a display pipeline.
+  This hardware block supports adjusting the luma and contour 2d histograms,
+  frequency weighting, luma-chroma gain and others, with adaptive weights.
+
+properties:
+  compatible:
+    const: mediatek,mt8196-disp-tdshp
+
+  reg:
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
+    tdshp@321e0000 {
+        compatible = "mediatek,mt8196-disp-tdshp";
+        reg = <0x321e0000 0x1000>;
+        clocks = <&dispsys0 CLK_MM_DISP_TDSHP0>;
+        power-domains = <&hpm_hwv MT8196_POWER_DOMAIN_DIS0_DORMANT>;
+        trigger-sources = <&disp0_mutex 53>;
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
+                    remote-endpoint = <&resizer0_out>;
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
+                    remote-endpoint = <&ccorr0_in>;
+                };
+            };
+        };
+    };
+
+...
-- 
2.54.0


