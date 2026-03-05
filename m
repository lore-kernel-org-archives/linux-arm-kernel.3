Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D714FEFCE43
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 02:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TYFn8NiRwsMtMSIwOF/N14WcpCF3yUYWccA9YEno2Pk=; b=0rcRlIATERzXwVjCtr4JLqzTlD
	Ib+u3hBw++fyWlMyzd9Mqicjupmh4CPIk2+2E1sdLVfDcBNwgJM74JmQsj/Y76J/x4tkPYqm2MOJc
	oj2aejnTrWd5HU7tMyYmxal8P3jgEr+YRZ/ZfNHtpm1jLIyZz2jmZc4xzEjIyAb2kZwAUX/bdF6x+
	ziyBxbskAtZKW7MPF8Zh/8wc1qNLnW8tU40Q41hUkilrKnw8jujpXcgjyT+Fhajrt7lP7Y5Xzrjc9
	qe1wieZ01hPWUn0GbxxFu0vX616SBFVUxGGLChs+8dbyZJ2zzreeK4Cc2WPAX4Ssx0u7S3GNBcJB/
	qdM4Ul/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxyRR-00000000moz-0l98;
	Thu, 05 Mar 2026 02:27:57 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxyRO-00000000moP-03q2;
	Thu, 05 Mar 2026 02:27:55 +0000
X-UUID: e6a8c236183a11f1ad39f32c34db0b1c-20260304
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=TYFn8NiRwsMtMSIwOF/N14WcpCF3yUYWccA9YEno2Pk=;
	b=lldnF3/KIoQOBO+6kPgS8BxLDeZN7ltmcLO1RF2EhNUz4yxkbClvWQcg4BDESAgWXH8kYu8atmfK+KtbSitIcfmZp/VrBAbEpSzM7WJ3L0a+XIvJKVc0wYhX+46pGILprly17EyfxVyrr98r8lmQ+Ny2pIHjO4H/J7C+pUJ3tUw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:ac1cae30-a241-4a6d-a480-2430ec790472,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:89c9d04,CLOUDID:e1d941ea-ef90-4382-9c6f-55f2a0689a6b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA
	:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: e6a8c236183a11f1ad39f32c34db0b1c-20260304
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <ot_meiker.gao@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1006744562; Wed, 04 Mar 2026 19:27:48 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 5 Mar 2026 10:27:45 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 5 Mar 2026 10:27:45 +0800
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
Date: Thu, 5 Mar 2026 10:27:36 +0800
Message-ID: <20260305022740.2334033-1-ot_meiker.gao@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_182754_075654_12A17DED 
X-CRM114-Status: GOOD (  12.46  )
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

Update mediatek,spi-mtk-nor.yaml to add conditional clock and
clock-names bindings for the mt8189-nor platform. The mt8189-nor
controller requires five specific clocks and corresponding clock-names
("spi", "sf", "axi_f", "axi_h", "axi_p"). This change enforces these
requirements in the device tree binding schema.

For other platforms, the minimum number of clocks and clock-names
remains unchanged. The patch also adds an example for mt8189-nor,
illustrating the new clock configuration.

This update ensures correct hardware description and validation for
mt8189-nor, improving compatibility and reducing configuration errors.

Signed-off-by: Meiker Gao <ot_meiker.gao@mediatek.com>

---
 .../bindings/spi/mediatek,spi-mtk-nor.yaml    | 78 ++++++++++++++++---
 1 file changed, 68 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml b/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml
index a453996c13f2..7e551f2cb52c 100644
--- a/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml
+++ b/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml
@@ -17,8 +17,6 @@ description: |
   for devices other than SPI NOR flash due to limited transfer
   capability of this controller.
 
-allOf:
-  - $ref: /schemas/spi/spi-controller.yaml#
 
 properties:
   compatible:
@@ -39,6 +37,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt8188-nor
+              - mediatek,mt8189-nor
           - const: mediatek,mt8186-nor
 
   reg:
@@ -56,14 +55,12 @@ properties:
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
+      - description: clock used for controller axi fast bus (axi_f).
+                     Required for new platforms, such as mt8189.
+      - description: clock used for controller axi high-speed bus (axi_h).
+                     Required for new platforms, such as mt8189.
+      - description: clock used for controller axi peripheral bus (axi_p).
+                     Required for new platforms, such as mt8189.
 
 required:
   - compatible
@@ -71,6 +68,42 @@ required:
   - clocks
   - clock-names
 
+allOf:
+  - $ref: /schemas/spi/spi-controller.yaml#
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt8189-nor
+    then:
+      properties:
+        clocks:
+          minItems: 5
+          maxItems: 5
+        clock-names:
+          minItems: 5
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
+          minItems: 2
+          maxItems: 2
+        clock-names:
+          minItems: 2
+          maxItems: 2
+          items:
+            - const: spi
+            - const: sf
+            - const: axi
+            - const: axi_s
+
 unevaluatedProperties: false
 
 examples:
@@ -97,3 +130,28 @@ examples:
         };
       };
     };
+
+  - |
+    #include <dt-bindings/clock/mt8189-clk.h>
+
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      nor_flash: spi@1100d000 {
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


