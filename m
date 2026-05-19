Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45DB6CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 02:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PjuVQPL/Tuk7JrtXMhTMmd2/S5707/mfUVadcNeMOy4=; b=kUSMLTgiVUimxfOWpBWhdAKhEb
	OXX3t3qVGHT+fdVKsam2E1iOQFq+h9vaeE9xxz1K3Di89Ee8WTFf3TrR8L7DDCP44ZfIKVrElYmNY
	ylW0GxmC4vCo21FbRTG6egWurU+60jOdNSJxysd2Thyw9CZTzRNqE9xkXvCSonl7CVdToQia8TiXM
	DVblELnynxp2tm1s65BNiaBf+LrKbQ/t4Oz9664D4FmXhfJe1Teyte6qyhfwjr5H6tLK9CkLy4A1Y
	RyF6hNsNzYPe2qA1K5lttf5zCskR60MYMJ/Mb9n8h+N/jtabPehEHAxfyWDUkGGEBiXvBJEqmhBto
	DpoQk25w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPA1t-0000000HRV8-12HG;
	Tue, 19 May 2026 02:17:57 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPA1l-0000000HROl-48gs;
	Tue, 19 May 2026 02:17:51 +0000
X-UUID: ebaeb23a532811f1acbe4559397dec65-20260518
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=PjuVQPL/Tuk7JrtXMhTMmd2/S5707/mfUVadcNeMOy4=;
	b=ttOS/KYa0a1TVk7d+Z9VOWqGW0a/7GVWx4L4pNCU7HWQ+fmqmRnki2kO6OsZcemInKuEtGj3t1Oq24LVomDSw6OT5eQkUrnxP/iFpswSoVpBtN9e3cNoNvEDHT9XHfhrnZhRxCFYseCMPSNlo2OGNHhKpGRjXFeAWRmqW4eNTLI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.14,REQID:8f44521d-ef50-42dc-b572-ba34917c526e,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:9091e75,CLOUDID:85da1346-e650-4d81-a877-d298d8f44b5d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|865|888|898,TC:-5,Cont
	ent:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ebaeb23a532811f1acbe4559397dec65-20260518
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <jianhua.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 776782460; Mon, 18 May 2026 19:17:44 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 19 May 2026 10:17:41 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 19 May 2026 10:17:40 +0800
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
Subject: [PATCH v8 2/3] dt-bindings: media: mediatek-jpeg-encoder: add MT8189 compatible string
Date: Tue, 19 May 2026 10:17:25 +0800
Message-ID: <20260519021726.19137-3-jianhua.lin@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260519021726.19137-1-jianhua.lin@mediatek.com>
References: <20260519021726.19137-1-jianhua.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_191750_027143_D0AF255A 
X-CRM114-Status: GOOD (  10.94  )
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
 .../bindings/media/mediatek-jpeg-encoder.yaml | 30 +++++++++++++++----
 1 file changed, 24 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
index 5b15f8977f67..f75871e72633 100644
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
 
@@ -45,6 +49,10 @@ properties:
       Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
       Ports are according to the HW.
 
+  mediatek,larb:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: A phandle to the smi_larb node.
+
 required:
   - compatible
   - reg
@@ -54,6 +62,16 @@ required:
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
+
 additionalProperties: false
 
 examples:
-- 
2.45.2


