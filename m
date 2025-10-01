Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29F16CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 18:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ueXnuvF8NcC5dz827yR+2fQW9nE2zi6Yqc5bfd4+/B4=; b=BdnjZTBLKRuE1McApfgPLq8Ngw
	nf/pTfQjiGjF2Ro77aCdtAZzL42Wj+j4EDPPGwmFnGvqYZ0qevMVKj/LnpKUN3qLrNLZP4QkPOskw
	mv5f1aD1gP9OBsaFYRKEs31ToaRxlNbF+Ah0VxVKeIAxdFjQukv/g7QHMyQzCXMpuLW1r1QVL1f4q
	fQ7Q5yM9P/aZAJtp0lzSVgGAUh8bffcyfnqiaC49FcqfU8ybsJuBFNy+6gD/I05ORgXX6C8F0Jplp
	IEEwxg7at/R2If8gwGdrYD+pT0WmBSJKER1Gdex3bo9AMF7aUsEjdp6IfXtz/RVnFAWCvlDh97ALO
	n/9RmqPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v41cE-00000008kmq-1IqJ;
	Wed, 01 Oct 2025 18:31:50 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v41cB-00000008kl2-2mcr;
	Wed, 01 Oct 2025 18:31:48 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1759343499; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=MnfkV/QraCT2nEFHlMtP3veonzUh8G6xopxDwoU4jmysazq5A17wHCvGl4pL1u9jZ1fBG0gYQRaAFLOLL9HzRyt12vmZI9RRKu20X9etAaPm+iyTvat52EpJQ13myv2DkK6/S0u2NMZ8uUr1tfnyf8ggoNuf7ibQ6R9wAOzNrEk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1759343499; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ueXnuvF8NcC5dz827yR+2fQW9nE2zi6Yqc5bfd4+/B4=; 
	b=XqNdY3YvzBlyBZLBKfXCPZnI+l7YlhKjCYy4JUpHuBwJ4MQMgL/0E3E3A7CyjF1ZaaL5lwqiHS+mjdKWW7h3AIOnG2BrYWih6qDlsOKo1PiAvO/4IjyjEhzUVR/SLhiLur7bx9nwYFQL6fR7TahizggpqVIPVBh+1ZtXhmEQg44=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
	dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1759343499;
	s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=ueXnuvF8NcC5dz827yR+2fQW9nE2zi6Yqc5bfd4+/B4=;
	b=kwOHFWICLM0m6/DktWnmiDSleXnnrcTAt6vp+DqUX2hfIAd1bEaiUFTOWsseqhDH
	afAC6j7hogJyAiQNpyJYxcUa24upoOQjDGaaNybWu3vK4eDFJ6ZcgS5uOWHKdsDMejX
	vecqpuCTTYZQX+kBCoOM8637ysbgm1xFRO4PMwWk=
Received: by mx.zohomail.com with SMTPS id 1759343496555351.1782091237104;
	Wed, 1 Oct 2025 11:31:36 -0700 (PDT)
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
To: andrew-ct.chen@mediatek.com,
	angelogioacchino.delregno@collabora.com,
	ariel.dalessandro@collabora.com,
	conor+dt@kernel.org,
	houlong.wei@mediatek.com,
	krzk+dt@kernel.org,
	matthias.bgg@gmail.com,
	mchehab@kernel.org,
	minghsiu.tsai@mediatek.com,
	robh@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v3] dt-bindings: media: Convert MediaTek mt8173-mdp bindings to DT schema
Date: Wed,  1 Oct 2025 15:31:15 -0300
Message-ID: <20251001183115.83111-1-ariel.dalessandro@collabora.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_113147_744445_42AB22BB 
X-CRM114-Status: GOOD (  15.28  )
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

Convert the existing text-based DT bindings for MediaTek MT8173 Media Data
Path to a DT schema.

Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/media/mediatek,mt8173-mdp.yaml   | 169 ++++++++++++++++++
 .../bindings/media/mediatek-mdp.txt           |  96 ----------
 2 files changed, 169 insertions(+), 96 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8173-mdp.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/mediatek-mdp.txt

diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8173-mdp.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8173-mdp.yaml
new file mode 100644
index 0000000000000..8ca33a733c478
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek,mt8173-mdp.yaml
@@ -0,0 +1,169 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/mediatek,mt8173-mdp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT8173 Media Data Path
+
+maintainers:
+  - Ariel D'Alessandro <ariel.dalessandro@collabora.com>
+
+description:
+  Media Data Path is used for scaling and color space conversion.
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - mediatek,mt8173-mdp-rdma
+          - mediatek,mt8173-mdp-rsz
+          - mediatek,mt8173-mdp-wdma
+          - mediatek,mt8173-mdp-wrot
+      - items:
+          - const: mediatek,mt8173-mdp-rdma
+          - const: mediatek,mt8173-mdp
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+    maxItems: 2
+
+  power-domains:
+    maxItems: 1
+
+  iommus:
+    maxItems: 1
+
+  mediatek,vpu:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      phandle to Mediatek Video Processor Unit for HW Codec encode/decode and
+      image processing.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - power-domains
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt8173-mdp-rdma
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Main clock
+            - description: Mutex clock
+    else:
+      properties:
+        clocks:
+          items:
+            - description: Main clock
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mt8173-mdp-rdma
+              - mediatek,mt8173-mdp-wdma
+              - mediatek,mt8173-mdp-wrot
+    then:
+      required:
+        - iommus
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt8173-mdp
+    then:
+      required:
+        - mediatek,vpu
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/memory/mt8173-larb-port.h>
+    #include <dt-bindings/power/mt8173-power.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        mdp_rdma0: rdma@14001000 {
+            compatible = "mediatek,mt8173-mdp-rdma",
+                         "mediatek,mt8173-mdp";
+            reg = <0 0x14001000 0 0x1000>;
+            clocks = <&mmsys CLK_MM_MDP_RDMA0>,
+                     <&mmsys CLK_MM_MUTEX_32K>;
+            power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
+            iommus = <&iommu M4U_PORT_MDP_RDMA0>;
+            mediatek,vpu = <&vpu>;
+        };
+
+        mdp_rdma1: rdma@14002000 {
+            compatible = "mediatek,mt8173-mdp-rdma";
+            reg = <0 0x14002000 0 0x1000>;
+            clocks = <&mmsys CLK_MM_MDP_RDMA1>,
+                     <&mmsys CLK_MM_MUTEX_32K>;
+            power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
+            iommus = <&iommu M4U_PORT_MDP_RDMA1>;
+        };
+
+        mdp_rsz0: rsz@14003000 {
+            compatible = "mediatek,mt8173-mdp-rsz";
+            reg = <0 0x14003000 0 0x1000>;
+            clocks = <&mmsys CLK_MM_MDP_RSZ0>;
+            power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
+        };
+
+        mdp_rsz1: rsz@14004000 {
+            compatible = "mediatek,mt8173-mdp-rsz";
+            reg = <0 0x14004000 0 0x1000>;
+            clocks = <&mmsys CLK_MM_MDP_RSZ1>;
+            power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
+        };
+
+        mdp_rsz2: rsz@14005000 {
+            compatible = "mediatek,mt8173-mdp-rsz";
+            reg = <0 0x14005000 0 0x1000>;
+            clocks = <&mmsys CLK_MM_MDP_RSZ2>;
+            power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
+        };
+
+        mdp_wdma0: wdma@14006000 {
+            compatible = "mediatek,mt8173-mdp-wdma";
+            reg = <0 0x14006000 0 0x1000>;
+            clocks = <&mmsys CLK_MM_MDP_WDMA>;
+            power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
+            iommus = <&iommu M4U_PORT_MDP_WDMA>;
+        };
+
+        mdp_wrot0: wrot@14007000 {
+            compatible = "mediatek,mt8173-mdp-wrot";
+            reg = <0 0x14007000 0 0x1000>;
+            clocks = <&mmsys CLK_MM_MDP_WROT0>;
+            power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
+            iommus = <&iommu M4U_PORT_MDP_WROT0>;
+        };
+
+        mdp_wrot1: wrot@14008000 {
+            compatible = "mediatek,mt8173-mdp-wrot";
+            reg = <0 0x14008000 0 0x1000>;
+            clocks = <&mmsys CLK_MM_MDP_WROT1>;
+            power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
+            iommus = <&iommu M4U_PORT_MDP_WROT1>;
+        };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/media/mediatek-mdp.txt b/Documentation/devicetree/bindings/media/mediatek-mdp.txt
deleted file mode 100644
index 253a93eabb5e5..0000000000000
--- a/Documentation/devicetree/bindings/media/mediatek-mdp.txt
+++ /dev/null
@@ -1,96 +0,0 @@
-* Mediatek Media Data Path
-
-Media Data Path is used for scaling and color space conversion.
-
-Required properties (controller node):
-- compatible: "mediatek,mt8173-mdp"
-- mediatek,vpu: the node of video processor unit, see
-  Documentation/devicetree/bindings/media/mediatek,mt8173-vpu.yaml for 
-  details.
-
-Required properties (all function blocks, child node):
-- compatible: Should be one of
-        "mediatek,mt8173-mdp-rdma"  - read DMA
-        "mediatek,mt8173-mdp-rsz"   - resizer
-        "mediatek,mt8173-mdp-wdma"  - write DMA
-        "mediatek,mt8173-mdp-wrot"  - write DMA with rotation
-- reg: Physical base address and length of the function block register space
-- clocks: device clocks, see
-  Documentation/devicetree/bindings/clock/clock-bindings.txt for details.
-- power-domains: a phandle to the power domain, see
-  Documentation/devicetree/bindings/power/power_domain.txt for details.
-
-Required properties (DMA function blocks, child node):
-- compatible: Should be one of
-        "mediatek,mt8173-mdp-rdma"
-        "mediatek,mt8173-mdp-wdma"
-        "mediatek,mt8173-mdp-wrot"
-- iommus: should point to the respective IOMMU block with master port as
-  argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
-  for details.
-
-Example:
-	mdp_rdma0: rdma@14001000 {
-		compatible = "mediatek,mt8173-mdp-rdma";
-			     "mediatek,mt8173-mdp";
-		reg = <0 0x14001000 0 0x1000>;
-		clocks = <&mmsys CLK_MM_MDP_RDMA0>,
-			 <&mmsys CLK_MM_MUTEX_32K>;
-		power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
-		iommus = <&iommu M4U_PORT_MDP_RDMA0>;
-		mediatek,vpu = <&vpu>;
-	};
-
-	mdp_rdma1: rdma@14002000 {
-		compatible = "mediatek,mt8173-mdp-rdma";
-		reg = <0 0x14002000 0 0x1000>;
-		clocks = <&mmsys CLK_MM_MDP_RDMA1>,
-			 <&mmsys CLK_MM_MUTEX_32K>;
-		power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
-		iommus = <&iommu M4U_PORT_MDP_RDMA1>;
-	};
-
-	mdp_rsz0: rsz@14003000 {
-		compatible = "mediatek,mt8173-mdp-rsz";
-		reg = <0 0x14003000 0 0x1000>;
-		clocks = <&mmsys CLK_MM_MDP_RSZ0>;
-		power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
-	};
-
-	mdp_rsz1: rsz@14004000 {
-		compatible = "mediatek,mt8173-mdp-rsz";
-		reg = <0 0x14004000 0 0x1000>;
-		clocks = <&mmsys CLK_MM_MDP_RSZ1>;
-		power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
-	};
-
-	mdp_rsz2: rsz@14005000 {
-		compatible = "mediatek,mt8173-mdp-rsz";
-		reg = <0 0x14005000 0 0x1000>;
-		clocks = <&mmsys CLK_MM_MDP_RSZ2>;
-		power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
-	};
-
-	mdp_wdma0: wdma@14006000 {
-		compatible = "mediatek,mt8173-mdp-wdma";
-		reg = <0 0x14006000 0 0x1000>;
-		clocks = <&mmsys CLK_MM_MDP_WDMA>;
-		power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
-		iommus = <&iommu M4U_PORT_MDP_WDMA>;
-	};
-
-	mdp_wrot0: wrot@14007000 {
-		compatible = "mediatek,mt8173-mdp-wrot";
-		reg = <0 0x14007000 0 0x1000>;
-		clocks = <&mmsys CLK_MM_MDP_WROT0>;
-		power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
-		iommus = <&iommu M4U_PORT_MDP_WROT0>;
-	};
-
-	mdp_wrot1: wrot@14008000 {
-		compatible = "mediatek,mt8173-mdp-wrot";
-		reg = <0 0x14008000 0 0x1000>;
-		clocks = <&mmsys CLK_MM_MDP_WROT1>;
-		power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
-		iommus = <&iommu M4U_PORT_MDP_WROT1>;
-	};
-- 
2.51.0


