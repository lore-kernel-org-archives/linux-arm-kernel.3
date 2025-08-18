Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BABA1CA0EF2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 13:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lyPRgtJIrl+DCxGXCftDbyg/RUx12+pyN49Ht/Rz3Ao=; b=i3i7wQnQSLVeEJnrNa2LxHpLUd
	XxC5FAVzBH06oU9yqMRzGqqKjGdNcXuDbJWbMyKwXOIe2XAGPu5T/54uA/A11BmR6BpiE5AkubqQ2
	yP3xcUCwqf4dJR1GBKxFKsUB4KQp+P1vtV/fvjoYggyf+rZz3U1CuhhLBPY8II3ylEVsEzNfNzrtb
	FrkPSj53j3Z8DI0Vx6KIkoyM5OOKxvatxG3Kpmo7xhIObTzXYWlRAZSfJOYbDsGKfFgx9xogeuRNj
	GuCQjt7Ab4V5LpFVCpZO1puYxPt0AcA94OdZbSqPU26OQ/oyhsIOllcpYiMv8neb9OR/7SIoqpVK0
	bV5H6w2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo07g-00000007bRZ-2pZb;
	Mon, 18 Aug 2025 13:42:04 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unyMO-00000007GVh-04Rg;
	Mon, 18 Aug 2025 11:49:09 +0000
X-UUID: 552d5b6c7c2911f09f706fa2197c6ceb-20250818
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=lyPRgtJIrl+DCxGXCftDbyg/RUx12+pyN49Ht/Rz3Ao=;
	b=Ts5uEDShSHdxHPRZ2FhRS2c1TFPtaL1BpYBKo8Wrn4bpNQ+ZhzSC+t+sApbc+VkFz2j6co1AHYNqgHhx6Eziz6KSrfGC5YZ+0gpL6mAs/9jpDACIzXhqBSorRLQelj0j3sKB+bPshGr+Zqnkhf5SORTqJA0kwtobjubl24JOy3Y=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:5c957ed9-5b4e-471f-83d8-2e068aa5832a,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:f1326cf,CLOUDID:a400417a-966c-41bd-96b5-7d0b3c22e782,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:-5,Content:0|15|50,EDM:-3,IP:
	nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,L
	ES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 552d5b6c7c2911f09f706fa2197c6ceb-20250818
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <mengqi.zhang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 9539747; Mon, 18 Aug 2025 04:49:01 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 18 Aug 2025 19:48:58 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 18 Aug 2025 19:48:57 +0800
From: Mengqi Zhang <mengqi.zhang@mediatek.com>
To: Chaotian Jing <chaotian.jing@mediatek.com>, Ulf Hansson
	<ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Wenbin Mei
	<wenbin.mei@mediatek.com>
CC: <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Mengqi Zhang
	<mengqi.zhang@mediatek.com>
Subject: [PATCH] dt-bindings: mmc: Add compatible for MT8189 SoC
Date: Mon, 18 Aug 2025 19:47:27 +0800
Message-ID: <20250818114855.8637-1-mengqi.zhang@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_044908_059456_063211DA 
X-CRM114-Status: UNSURE (   8.46  )
X-CRM114-Notice: Please train this message.
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

Add a compatible string for the MT8189 SoC's mtk-sd mmc controllers.

Signed-off-by: Mengqi Zhang <mengqi.zhang@mediatek.com>
---
 .../devicetree/bindings/mmc/mtk-sd.yaml       | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
index 6dd26ad31491..1285dddeaec9 100644
--- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
+++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
@@ -25,6 +25,7 @@ properties:
           - mediatek,mt8135-mmc
           - mediatek,mt8173-mmc
           - mediatek,mt8183-mmc
+          - mediatek,mt8189-mmc
           - mediatek,mt8196-mmc
           - mediatek,mt8516-mmc
       - items:
@@ -192,6 +193,7 @@ allOf:
             - mediatek,mt8183-mmc
             - mediatek,mt8186-mmc
             - mediatek,mt8188-mmc
+            - mediatek,mt8189-mmc
             - mediatek,mt8195-mmc
             - mediatek,mt8196-mmc
             - mediatek,mt8516-mmc
@@ -240,6 +242,7 @@ allOf:
               - mediatek,mt7986-mmc
               - mediatek,mt7988-mmc
               - mediatek,mt8183-mmc
+              - mediatek,mt8189-mmc
               - mediatek,mt8196-mmc
     then:
       properties:
@@ -319,6 +322,32 @@ allOf:
             - const: source_cg
             - const: crypto
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt8189-mmc
+    then:
+      properties:
+        clocks:
+         items:
+            - description: source clock
+            - description: HCLK which used for host
+            - description: independent source clock gate
+            - description: bus clock used for internal register access
+            - description: peripheral bus clock gate
+            - description: AXI bus clock gate
+            - description: crypto clock used for data encrypt/decrypt (optional)
+        clock-names:
+          items:
+            - const: source
+            - const: hclk
+            - const: source_cg
+            - const: bus_clk
+            - const: pclk_cg
+            - const: axi_cg
+            - const: crypto
+
   - if:
       properties:
         compatible:
-- 
2.46.0


