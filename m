Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3D69E74907
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 03:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qSgk/ff5P9uae5l/SgNDf/rlxP+ki/jm4cke2+z9AIw=; b=MWjKGLum42LF3rprpCDEpZQLEr
	aEvbfniwc09/hlPS6lk34NkAZLczKfd2OQduYGxOFgbxXm1h2clHRmlxbs2JF0BGmDAmAMb9cNJ5X
	9EwE33TbvfrGKVPtOduTjZtHzb6evwUUNVAzVdYcSl9mqSCxk/xnW6xTdNWWG3R5RupIuQ9pZr5Jh
	fC/Q6pZi3mILKAu54S+acI9V3paRnTU68AJy5nzZX/4EcUhFUyBA2rWrfyt2lufqwGtQC2TlYz4tN
	3pmgLm8fVuGwBPPkuW+f0RPdQCjujcvJNKYUQMnMxhuWl7Osc9I/2PH41iHIOrx89IJbEDM3m8X91
	f3+mFv6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYFNu-0000000GLvN-3Fbj;
	Wed, 24 Dec 2025 03:17:58 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYFNo-0000000GLrZ-4BS1;
	Wed, 24 Dec 2025 03:17:54 +0000
X-UUID: 1f4d62c8e07711f09f706fa2197c6ceb-20251223
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=qSgk/ff5P9uae5l/SgNDf/rlxP+ki/jm4cke2+z9AIw=;
	b=NXBATxqPUeSg0DGuUehIpmVwWsl4yGuNpYaGj+bN8GiQIL+NuumywREhlxfBIxvJrR9XWPzveb8jg+jGgSiFEJ0h2MGf79O8uwmB41/uM7owShinw/430M2ohKmTB7w1ivBGHYaAd1o2/dOJdEPNO1YTlDtqmmgAoA83oa2mRns=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.9,REQID:3da9e5c0-58b2-48c5-a596-4e94f4a79fbb,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:5047765,CLOUDID:36fddb28-e3a2-4f78-a442-8c73c4eb9e9d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 1f4d62c8e07711f09f706fa2197c6ceb-20251223
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <jianhua.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 440189153; Tue, 23 Dec 2025 20:17:47 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 24 Dec 2025 11:17:46 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 24 Dec 2025 11:17:45 +0800
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
Subject: [PATCH v2 3/4] dt-bindings: media: mediatek-jpeg-encoder: add MT8189 compatible string
Date: Wed, 24 Dec 2025 11:17:20 +0800
Message-ID: <20251224031721.9942-4-jianhua.lin@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20251224031721.9942-1-jianhua.lin@mediatek.com>
References: <20251224031721.9942-1-jianhua.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_191753_039871_F7AE7369 
X-CRM114-Status: GOOD (  10.00  )
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
address-space (16GB)  and requires a single clock configuration.
Therefore, add "mediatek,mt8189-jpgenc" compatible to the binding document.
Additionally, it corrects the inheritance for MT8188, aligning it
with MT8189 due to their shared architecture and 34-bit iova address
space (16GB) requirements.
Previously, MT8188 was incorrectly defined alongside SoCs with 32-bit
iova address-space (4GB), such as "mediatek,mtk-jpgenc". This mismatch
results in an ABI break, as MT8188 cannot function correctly under
the 32-bit iova address-space (4GB) configuration.

Key changes include:
- Introducing "mediatek,mt8189-jpgenc" as a new compatible string to
  represent the correct architecture.
- Updating MT8188 to inherit from MT8189, ensuring proper support for
  34-bit iova address-space (16GB).
- Add property "mediatek,larb" for MT8189 requirements.
- Improved formatting for better readability and consistency.

These changes ensure that both MT8188 and MT8189 are correctly supported
with the necessary 34-bit iova address-space (16GB), while maintaining
compatibility with their shared architecture.

Extensive internal review and testing have been conducted to validate
these changes and ensure compliance with DT binding standards.

Signed-off-by: Jianhua Lin <jianhua.lin@mediatek.com>
---
 .../bindings/media/mediatek-jpeg-encoder.yaml | 29 ++++++++++++++-----
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
index 5b15f8977f67..3205ecbaa6c5 100644
--- a/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
@@ -14,13 +14,24 @@ description: |-
 
 properties:
   compatible:
-    items:
-      - enum:
-          - mediatek,mt2701-jpgenc
-          - mediatek,mt8183-jpgenc
-          - mediatek,mt8186-jpgenc
-          - mediatek,mt8188-jpgenc
-      - const: mediatek,mtk-jpgenc
+    oneOf:
+      - items:
+          - enum:
+              - mediatek,mtk-jpgenc
+      - items:
+          - enum:
+              - mediatek,mt8189-jpgenc
+      - items:
+          - enum:
+              - mediatek,mt2701-jpgenc
+              - mediatek,mt8183-jpgenc
+              - mediatek,mt8186-jpgenc
+          - const: mediatek,mtk-jpgenc
+      - items:
+          - enum:
+              - mediatek,mt8188-jpgenc
+          - const: mediatek,mt8189-jpgenc
+
   reg:
     maxItems: 1
 
@@ -34,6 +45,10 @@ properties:
     items:
       - const: jpgenc
 
+  mediatek,larb:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: a phandle to the smi_larb node.
+
   power-domains:
     maxItems: 1
 
-- 
2.45.2


