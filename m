Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01F0BC44524
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 06:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vhhrx3XAin13rBinyDL72GY/9zQ/T+0nCt/5TRK8MN8=; b=HmiX3pQb/T62ew6eCZUCgmLxx3
	+IdG/NJa/Izy7XGzRXyhxGNudnzzClDeOB4yDrhLbaqS7mPQtyHKYif/xAFJNoG7DJffgFetiI4JY
	H/2uoUuRY/MAHgTglY2w+CsSG6l3M/TxVXd2NxLhu93V4viahgEap0cPswWUjQ34/8b2n5NXqLJIo
	gko6adnUyssWcFnAahX/7/6l+mLhbDmNX5rzXE+drhBl9eUIRR9g1meYlQFLPW+w6FZRiKOCBZhpR
	qzmCbXHJALwehIs6Bu5HCsecLd9sVul0acPXSbcMbUYtswiAwS70onfvSGrib00Igi3xwkqUn9XG7
	XGeglECg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlhV8-00000005xbJ-2Myc;
	Mon, 20 Jul 2026 06:29:18 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlhUp-00000005xNf-3H2b;
	Mon, 20 Jul 2026 06:29:02 +0000
X-UUID: 48707a74840411f1acbe4559397dec65-20260719
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Vhhrx3XAin13rBinyDL72GY/9zQ/T+0nCt/5TRK8MN8=;
	b=aIb6NVqHJhQuTNhDsUSyXNmTJ9L0vJ88MwDxEHtjdI8GO2/3weE0roUhhlUIIdbIB5ZQ6+h+XOMeT3djfgzoN8lSoy8u0zxSS9QFPIU/FevN1wKynfxmPyo8ZPR+yuitkMBH4n67EjUuHPoSEM0z0gVAeCKzWtDZ5qOI8I/rt0Q=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.18,REQID:7e70c1a2-5d1b-4aa6-a7b3-04db7a906088,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:8a735a6,CLOUDID:232bebf9-0305-4d99-a86d-542a7a8d2aef,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99|100|102|156,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,
	COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 48707a74840411f1acbe4559397dec65-20260719
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <jianhua.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1711063116; Sun, 19 Jul 2026 23:28:55 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 20 Jul 2026 14:28:52 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 20 Jul 2026 14:28:52 +0800
From: Jianhua Lin <jianhua.lin@mediatek.com>
To: <nicolas@ndufresne.ca>, <mchehab@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<sirius.wang@mediatek.com>, <vince-wl.liu@mediatek.com>,
	<jh.hsu@mediatek.com>, Jianhua Lin <jianhua.lin@mediatek.com>
Subject: [PATCH v10 2/3] dt-bindings: media: mediatek-jpeg-encoder: add MT8189 compatible string
Date: Mon, 20 Jul 2026 14:28:28 +0800
Message-ID: <20260720062829.7343-3-jianhua.lin@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260720062829.7343-1-jianhua.lin@mediatek.com>
References: <20260720062829.7343-1-jianhua.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_232859_824533_8F438CB5 
X-CRM114-Status: GOOD (  11.40  )
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

Add the compatible string for the JPEG encoder block found in the
MediaTek MT8189 SoC.

Unlike some previous SoCs, the MT8189 JPEG encoder requires 34-bit IOVA
address space support. Therefore, it is added as a standalone compatible
string without falling back to the generic "mediatek,mtk-jpgenc" to
ensure the driver applies the correct hardware-specific configurations.

Signed-off-by: Jianhua Lin <jianhua.lin@mediatek.com>
---
 .../bindings/media/mediatek-jpeg-encoder.yaml | 38 ++++++++++++++++---
 1 file changed, 32 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
index 5b15f8977f67..d2f035715a2e 100644
--- a/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
@@ -14,13 +14,17 @@ description: |-
 
 properties:
   compatible:
-    items:
+    oneOf:
       - enum:
-          - mediatek,mt2701-jpgenc
-          - mediatek,mt8183-jpgenc
-          - mediatek,mt8186-jpgenc
-          - mediatek,mt8188-jpgenc
-      - const: mediatek,mtk-jpgenc
+          - mediatek,mt8189-jpgenc
+      - items:
+          - enum:
+              - mediatek,mt2701-jpgenc
+              - mediatek,mt8183-jpgenc
+              - mediatek,mt8186-jpgenc
+              - mediatek,mt8188-jpgenc
+          - const: mediatek,mtk-jpgenc
+
   reg:
     maxItems: 1
 
@@ -45,6 +49,15 @@ properties:
       Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
       Ports are according to the HW.
 
+  mediatek,larb:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: |
+      A phandle to the local arbiter (SMI LARB) node. This explicitly
+      describes the hardware topology where the JPEG block is connected
+      to a dedicated SMI LARB for memory bandwidth arbitration. It is
+      required to accurately represent the hardware connection independently
+      of the IOMMU.
+
 required:
   - compatible
   - reg
@@ -54,6 +67,19 @@ required:
   - power-domains
   - iommus
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt8189-jpgenc
+    then:
+      required:
+        - mediatek,larb
+    else:
+      properties:
+        mediatek,larb: false
+
 additionalProperties: false
 
 examples:
-- 
2.45.2


