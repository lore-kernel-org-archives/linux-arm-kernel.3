Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7209CC44503
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 03:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YPIulzBzzSjRzeVrKrRnT1ZUkoYtICzdzWxddReKMC4=; b=LCnpObHevvk0/yZHlM30VQPUT5
	WkqiO02p7liB5Y/zfR6IoJ0sZPWptZM1rPvbSp2gObkWt7XfKRTVCLcGpEi8+3NQ6TqBtgWH9Yssp
	elISqohlN1f48Q4IjCmxBAMMFkLVfL7BeXIaHlKklTRbeZ0BcKyEOavnAmQ79FNhDoNqKOpHWaNCu
	Kvhy+phurLJx+edkWCkpxYV8H3bFyLxEcX4RuQB5zBmNhs/o4JJ+VIK6YWwx1G2fi5EESjreSfxm8
	FMDDZQTd8yuVOaTEeFz8ZGVMD2/+1nd4c99INQmXd6JzxtQH033DRORJ16DTzne6OhLoKsTcQdqq0
	kWhwUi1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whfQS-00000000ta4-2LVt;
	Thu, 09 Jul 2026 03:27:48 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whfQN-00000000tV4-0ykZ;
	Thu, 09 Jul 2026 03:27:45 +0000
X-UUID: 21791e4c7b4611f1acbe4559397dec65-20260708
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=YPIulzBzzSjRzeVrKrRnT1ZUkoYtICzdzWxddReKMC4=;
	b=FIAnpXREU9JXzaOPIQAEtgq9xM+4rCFiC5GrX3T1GDVi5gQcJJcw2a5xZD12golTMB5NEaCQSgtv0Me5okNWU+zRSSydVSQkmLP1b1fpMDJTCSgxD5iOK6ExhGyONLTHiwAu81r02yjyzgoMgWa+s2OduI4hS0B4jo4k2H5mAP8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17,REQID:1b09705c-7d15-4df5-832c-188b7c7606b6,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:d497b38,CLOUDID:3df1e618-ab14-4403-9336-76696324c5a8,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99|100|102|156,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,
	COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 21791e4c7b4611f1acbe4559397dec65-20260708
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <jianhua.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 70831178; Wed, 08 Jul 2026 20:27:36 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 9 Jul 2026 11:27:33 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 9 Jul 2026 11:27:33 +0800
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
Subject: [PATCH v9 1/3] dt-bindings: media: mediatek-jpeg-decoder: add MT8189 compatible string
Date: Thu, 9 Jul 2026 11:26:54 +0800
Message-ID: <20260709032657.25730-2-jianhua.lin@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260709032657.25730-1-jianhua.lin@mediatek.com>
References: <20260709032657.25730-1-jianhua.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_202743_276906_31A1F24B 
X-CRM114-Status: GOOD (  12.40  )
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

Add the compatible string for the JPEG decoder block found in the
MediaTek MT8189 SoC.

Compared to previous generation ICs, the MT8189 JPEG decoder requires
34-bit IOVA address space support and only needs a single clock
("jpgdec") instead of two. Therefore, it is added as a standalone
compatible string without falling back to older SoCs.

Update the binding schema to include the new compatible string and add
an `allOf` block with conditional checks. This enforces the single clock
requirement for MT8189 while preserving the two-clock requirement
("jpgdec-smi", "jpgdec") for older SoCs.

Signed-off-by: Jianhua Lin <jianhua.lin@mediatek.com>
---
 .../bindings/media/mediatek-jpeg-decoder.yaml | 49 ++++++++++++++++---
 1 file changed, 41 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
index a4aacd3eb189..13fb4fb61f2b 100644
--- a/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
@@ -15,10 +15,10 @@ description: |-
 properties:
   compatible:
     oneOf:
-      - items:
-          - enum:
-              - mediatek,mt8173-jpgdec
-              - mediatek,mt2701-jpgdec
+      - enum:
+          - mediatek,mt2701-jpgdec
+          - mediatek,mt8173-jpgdec
+          - mediatek,mt8189-jpgdec
       - items:
           - enum:
               - mediatek,mt7623-jpgdec
@@ -32,13 +32,16 @@ properties:
     maxItems: 1
 
   clocks:
+    minItems: 1
     maxItems: 2
-    minItems: 2
 
   clock-names:
-    items:
-      - const: jpgdec-smi
-      - const: jpgdec
+    oneOf:
+      - items:
+          - const: jpgdec
+      - items:
+          - const: jpgdec-smi
+          - const: jpgdec
 
   power-domains:
     maxItems: 1
@@ -51,6 +54,15 @@ properties:
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
@@ -60,6 +72,27 @@ required:
   - power-domains
   - iommus
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt8189-jpgdec
+    then:
+      properties:
+        clocks:
+          maxItems: 1
+        clock-names:
+          maxItems: 1
+      required:
+        - mediatek,larb
+    else:
+      properties:
+        clocks:
+          minItems: 2
+        clock-names:
+          minItems: 2
+
 additionalProperties: false
 
 examples:
-- 
2.45.2


