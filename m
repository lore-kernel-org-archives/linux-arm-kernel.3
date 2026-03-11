Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9D34FD88D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 01:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CHIhPpxedpxUtfuf19NsO6sYd8OBMqAij6YecxTLJjI=; b=iknAQrJy5c7IsATizZceadlFgA
	mIej6eqr5/6SC8bIwVUOPAY050Ob7ODdE4nJ7brxZEFqCasbrbYMMFzLLxOvWDXjc8d2JRP5PnD9F
	1TBuVdjrOszIqp/+/MS4HxEK5PzfbSpt849Qs0LRPO0Aovrx8On8hpWvuJLXc2mGM9pfu/RAdx3yG
	0Buq13Xob8jodZR+k+xk0PIGtBGuoqngh3B2o3YMlXHLy7VH4srUg/RGl8KFQVcLN0E7md01+Mbjz
	yZdJApQyZb2kkIHkPOD8hJAN/b5UAxipi8XMRaGijm0f8k0ieQ6F6o6DDWZcgvIMXD+BSE+JlwpZh
	5DjEtx4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w08kP-0000000AWHi-11eH;
	Wed, 11 Mar 2026 01:52:29 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w08kM-0000000AWHG-3E5i;
	Wed, 11 Mar 2026 01:52:27 +0000
X-UUID: f22499801cec11f1a6de359d7043e138-20260310
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=CHIhPpxedpxUtfuf19NsO6sYd8OBMqAij6YecxTLJjI=;
	b=o07oAuXIdQ/RGN0jFX41RaSmqeXtcZcxwuBIFEtxmN2oySs8KxcvRtgwf8Cw+Xw/JRhUZryyZREVzqZdPVVdZQ+FDPVfGBpPpCjMmZev2ChGNYOzFzYzbSpMlrB2e93TVabGxWbZJqKUIj6X+fXkTYaQr+1+1yKYAG9BhoD6jQg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:c9a0754f-caa3-47eb-95b1-f2ab6f5ba15f,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:89c9d04,CLOUDID:8472195c-a957-4259-bcca-d3af718d7034,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA
	:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f22499801cec11f1a6de359d7043e138-20260310
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <ot_meiker.gao@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1506188717; Tue, 10 Mar 2026 18:52:22 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 11 Mar 2026 09:52:19 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 11 Mar 2026 09:52:19 +0800
From: Meiker Gao <ot_meiker.gao@mediatek.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Bayi Cheng
	<bayi.cheng@mediatek.com>, Chuanhong Guo <gch981213@gmail.com>
CC: <linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<sirius.wang@mediatek.com>, <vince-wl.liu@mediatek.com>,
	<jh.hsu@mediatek.com>, Meiker Gao <ot_meiker.gao@mediatek.com>
Subject: [PATCH] spi: dt-bindings: mediatek,spi-mtk-nor: Add clock bindings for mt8189
Date: Wed, 11 Mar 2026 09:51:27 +0800
Message-ID: <20260311015214.655555-1-ot_meiker.gao@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_185226_821566_29EE90A4 
X-CRM114-Status: GOOD (  13.74  )
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

Update mediatek,spi-mtk-nor.yaml to add conditional clock and clock-names
bindings for the mt8189-nor platform. The mt8189-nor controller requires
five specific clocks and corresponding clock-names ("spi", "sf", "axi_f",
"axi_h", "axi_p"). This change enforces these requirements in the device
tree binding schema.

For other platforms, the minimum number of clocks and clock-names remains
unchanged. The patch also adds an example for mt8189-nor, illustrating the
new clock configuration.

This update ensures correct hardware description and validation for
mt8189-nor, improving compatibility and reducing configuration errors.

Signed-off-by: Meiker Gao <ot_meiker.gao@mediatek.com>
(cherry picked from commit de637a2fea765a92d4b06efef34671c74f8bc109)
---
 .../bindings/spi/mediatek,spi-mtk-nor.yaml    | 71 +++++++++++++++----
 1 file changed, 59 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml b/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml
index a453996c13f2..904c25279e2d 100644
--- a/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml
+++ b/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml
@@ -17,9 +17,6 @@ description: |
   for devices other than SPI NOR flash due to limited transfer
   capability of this controller.
 
-allOf:
-  - $ref: /schemas/spi/spi-controller.yaml#
-
 properties:
   compatible:
     oneOf:
@@ -27,6 +24,7 @@ properties:
           - mediatek,mt8173-nor
           - mediatek,mt8186-nor
           - mediatek,mt8192-nor
+          - mediatek,mt8189-nor
       - items:
           - enum:
               - mediatek,mt2701-nor
@@ -39,6 +37,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt8188-nor
+              - mediatek,mt8189-nor
           - const: mediatek,mt8186-nor
 
   reg:
@@ -56,14 +55,8 @@ properties:
                      design, so this is optional.
       - description: clock used for controller axi slave bus.
                      this depends on hardware design, so it is optional.
-
-  clock-names:
-    minItems: 2
-    items:
-      - const: spi
-      - const: sf
-      - const: axi
-      - const: axi_s
+      - description: clock used for controller axi_f, axi_h, and
+                     axi_p to support the new platform.
 
 required:
   - compatible
@@ -71,6 +64,35 @@ required:
   - clocks
   - clock-names
 
+allOf:
+  - $ref: /schemas/spi/spi-controller.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt8189-nor
+    then:
+      properties:
+        clocks:
+          maxItems: 5
+        clock-names:
+          maxItems: 5
+          items:
+            - const: spi
+            - const: sf
+            - const: axi_f
+            - const: axi_h
+            - const: axi_p
+    else:
+      properties:
+        clocks:
+          maxItems: 4
+        clock-names:
+          items:
+            - const: spi
+            - const: sf
+            - const: axi
+
 unevaluatedProperties: false
 
 examples:
@@ -81,7 +103,7 @@ examples:
       #address-cells = <2>;
       #size-cells = <2>;
 
-      nor_flash: spi@1100d000 {
+      spi@1100d000 {
         compatible = "mediatek,mt8173-nor";
         reg = <0 0x1100d000 0 0xe0>;
         interrupts = <1>;
@@ -97,3 +119,28 @@ examples:
         };
       };
     };
+
+  - |
+    #include <dt-bindings/clock/mediatek,mt8189-clk.h>
+
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      spi@11018000 {
+        compatible = "mediatek,mt8189-nor";
+        reg = <0 0x1100d000 0 0xe0>;
+        interrupts = <1>;
+        clocks = <&pericfg CLK_PERI_SPI>, <&topckgen CLK_TOP_SPINFI_IFR_SEL>,
+                 <&pericfg CLK_PERAO_SFLASH_F>, <&topckgen CLK_PERAO_SFLASH_H>,
+                 <&pericfg CLK_PERAO_SFLASH_P>;
+        clock-names = "spi", "sf", "axi_f", "axi_h", "axi_p";
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        flash@0 {
+          compatible = "jedec,spi-nor";
+          reg = <0>;
+        };
+      };
+    };
-- 
2.45.2


