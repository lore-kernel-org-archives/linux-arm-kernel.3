Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 532ACE7490A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 03:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rM+YHKGVmwJ/Pk2fHwI/gsJzacwSeKmWBO+yWoQfwt0=; b=u0o8CFEM2uPizo/Dnq2lWNg8Bm
	jTjyrog/v1PwonrdJKKLKhDvbmM1VYi8fq+KHxHfpbOQXiI0zcB+T4Js7UaamaP9QTq+LPsy0+G67
	c+sKuov5kMRP+Qg8naPoWgIoWsTp5G/+bsSH2BJbMvpLIwvhASPc0fh5Bzf4ApI6HQT0C7aJPZuNs
	yf3Cg62sfJRDc/UgqJCI7WyTMoFaiqyQ8RhENywjfwVIdvsJeXPY1meL4SRz+CdCXSYxKJT6Dj5k5
	3VQ4GFl3I1Zw66GEPrfIx/uRl0HdoLigdlOspfgNCAjwhczj+AGZPfuncIWYeXtStRe1ayZQNwRgq
	SSir27UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYFNv-0000000GLwh-3jFH;
	Wed, 24 Dec 2025 03:17:59 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYFNq-0000000GLrZ-0Zrc;
	Wed, 24 Dec 2025 03:17:55 +0000
X-UUID: 1f77e91ce07711f09f706fa2197c6ceb-20251223
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=rM+YHKGVmwJ/Pk2fHwI/gsJzacwSeKmWBO+yWoQfwt0=;
	b=TTTMzjesyBvW7MrwJgss81m43HKcrP5+bg3iQ+li8v32vojoQ8dTWmg4ASlyljRRtcrfNMjwT/MI055IB+qUuwL0bgeoSMJHGYSYbjwqDdqYjI4gQ1uKRPa8JEMupeyTAYMtE2Kgaybwb41C3dVXLGWOXXSBwF3LAoLYc49UEoI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.9,REQID:e79f7a91-a1c5-4b32-9c17-c3185090502f,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:5047765,CLOUDID:ac6dc7c6-8a73-4871-aac2-7b886d064f36,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 1f77e91ce07711f09f706fa2197c6ceb-20251223
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <jianhua.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1905409086; Tue, 23 Dec 2025 20:17:48 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 24 Dec 2025 11:17:45 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 24 Dec 2025 11:17:44 +0800
From: Jianhua Lin <jianhua.lin@mediatek.com>
To: <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<sirius.wang@mediatek.com>, <vince-wl.liu@mediatek.com>,
	<jh.hsu@mediatek.com>, Jianhua Lin <jianhua.lin@mediatek.com>
Subject: [PATCH v2 2/4] dt-bindings: media: mediatek-jpeg-decoder: add MT8189 compatible string
Date: Wed, 24 Dec 2025 11:17:19 +0800
Message-ID: <20251224031721.9942-3-jianhua.lin@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20251224031721.9942-1-jianhua.lin@mediatek.com>
References: <20251224031721.9942-1-jianhua.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_191754_180344_D38A058E 
X-CRM114-Status: GOOD (  10.92  )
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

Compared to the previous generation IC, the MT8189 uses 34-bit iova
address-space (16GB) and requires a single clock configuration.
Therefore, add "mediatek,mt8189-jpgdec" compatible to the binding document.
Additionally, it corrects the inheritance for MT8188, aligning it
with MT8189 due to their shared architecture and 34-bit iova address
space (16GB) and singlesingle clock requirement.
Previously, MT8188 was incorrectly defined alongside SoCs with 32-bit
iova address-space (4GB), such as "mediatek,mt2701-jpgdec". This mismatch
results in an ABI break, as MT8188 cannot function correctly under
the 32-bit iova address-space (4GB) configuration.

Key changes include:
- Introducing "mediatek,mt8189-jpgdec" as a new compatible string to
  represent the correct architecture.
- Updating MT8188 to inherit from MT8189, ensuring proper support for
  34-bit iova address-space (16GB) and simplifying clock configuration.
- Add property "mediatek,larb" for MT8189 requirements.
- Improved formatting for better readability and consistency.

These changes ensure that both MT8188 and MT8189 are correctly supported
with the necessary 34-bit iova address-space (16GB), while maintaining
compatibility with their shared architecture.

Extensive internal review and testing have been conducted to validate
these changes and ensure compliance with DT binding standards.

Signed-off-by: Jianhua Lin <jianhua.lin@mediatek.com>
---
 .../bindings/media/mediatek-jpeg-decoder.yaml | 50 ++++++++++++++++---
 1 file changed, 44 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
index a4aacd3eb189..814b53ef46e7 100644
--- a/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
@@ -17,13 +17,19 @@ properties:
     oneOf:
       - items:
           - enum:
-              - mediatek,mt8173-jpgdec
               - mediatek,mt2701-jpgdec
+              - mediatek,mt8173-jpgdec
+      - items:
+          - enum:
+              - mediatek,mt8189-jpgdec
       - items:
           - enum:
               - mediatek,mt7623-jpgdec
-              - mediatek,mt8188-jpgdec
           - const: mediatek,mt2701-jpgdec
+      - items:
+          - enum:
+              - mediatek,mt8188-jpgdec
+          - const: mediatek,mt8189-jpgdec
 
   reg:
     maxItems: 1
@@ -32,13 +38,16 @@ properties:
     maxItems: 1
 
   clocks:
+    minItems: 1
     maxItems: 2
-    minItems: 2
 
   clock-names:
-    items:
-      - const: jpgdec-smi
-      - const: jpgdec
+    minItems: 1
+    maxItems: 2
+
+  mediatek,larb:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: a phandle to the smi_larb node.
 
   power-domains:
     maxItems: 1
@@ -51,6 +60,35 @@ properties:
       Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
       Ports are according to the HW.
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mt2701-jpgdec
+              - mediatek,mt8173-jpgdec
+
+    then:
+      properties:
+        clock-names:
+          items:
+            - const: jpgdec-smi
+            - const: jpgdec
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mt8189-jpgdec
+
+    then:
+      properties:
+        clock-names:
+          items:
+            - const: jpgdec
+
 required:
   - compatible
   - reg
-- 
2.45.2


