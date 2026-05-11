Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1933BCD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 12:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nXOcXWZt96hThPXB+sE3GMaB18OCUhMorcdX5oKA3A8=; b=sYS5LmW1t+S7nR162l431ggDlq
	01x/x1Lf62Gt9PY6gA6DLV5NOOB4qHKbLjmLnkSRw81WtbunVLs1zkhkTeXFQMnA+VJUPe/S5/jFW
	UmrZdB3UQabp3QrbnbgzEaL3TFI/fr+jOl6UOH1X6MvJP6NYNwpPF9YR49So8JpUPFBJdUacBQFB8
	YRE6ziblWdTGwS4FnDZeHdHUR1FZVFQy3aGCvHQRnYmIVx58PT9A/Q14QyZfaA8IOOUKPtfPCF49V
	zItnWZ2yeCjHbR3ZVUwgySeV3ImcD0wSiHn3ATqJYsPZAnLMs1MjgscJULXJQyHsPoGx3b63gfx6c
	oSDDs7jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMPT9-0000000DTpp-3G6Q;
	Mon, 11 May 2026 12:10:43 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMPT5-0000000DTmQ-0xML;
	Mon, 11 May 2026 12:10:40 +0000
X-UUID: 68b21c924d3211f19f231fa534c5cac8-20260511
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=nXOcXWZt96hThPXB+sE3GMaB18OCUhMorcdX5oKA3A8=;
	b=RzohBPWpUHOeEZBwNNiUpBmOjxeA8JUGqbliRuEpL31FiIUTBKTFuUEmMVWN+uYknKX0Qjm13RcvgkxLlISItJweC39/v7nbGf4UYUWOOsxmnu1BVwigqQkB6MSDjU+d2n8YOjw+QAkytaYWIKGkoO4qzrM3KqzwjoZyKBZ7dLM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:5f0f677f-90c0-41c6-9500-14f1913339b7,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:f4d331bf-65a8-4b41-ac18-3671578a914d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|865|888|898,TC:-5,Cont
	ent:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 68b21c924d3211f19f231fa534c5cac8-20260511
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <arnab.layek@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1997454439; Mon, 11 May 2026 05:10:32 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 11 May 2026 20:10:30 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 11 May 2026 20:10:30 +0800
From: Arnab Layek <arnab.layek@mediatek.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Arnab Layek
	<arnab.layek@mediatek.com>
Subject: [PATCH v2 1/1] dt-bindings: remoteproc: mtk,scp: Allow multiple memory regions for MT8188
Date: Mon, 11 May 2026 20:10:04 +0800
Message-ID: <20260511121004.2984149-2-arnab.layek@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260511121004.2984149-1-arnab.layek@mediatek.com>
References: <20260506133157.3283204-1-arnab.layek@mediatek.com>
 <20260511121004.2984149-1-arnab.layek@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_051039_413717_2E49338B 
X-CRM114-Status: GOOD (  10.06  )
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

The MT8188 SCP requires two reserved memory regions:
1. Main SCP SRAM memory region (required)
2. SCP L1TCM memory region (optional, for additional memory)

Some other MediaTek SoCs only use a single memory region. This patch adds
a conditional schema using if/then to allow 1-2 memory regions
specifically for mediatek,mt8188-scp and mediatek,mt8188-scp-dual
compatibles, while keeping the default maxItems: 1 for other
SoCs.

Each memory region is documented with descriptions to
clarify their purpose, following the pattern used in other bindings.

Signed-off-by: Arnab Layek <arnab.layek@mediatek.com>
---
 .../bindings/remoteproc/mtk,scp.yaml          | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
index bdbb12118da4..df13be2026a6 100644
--- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
@@ -205,6 +205,27 @@ allOf:
           items:
             - const: cfg
             - const: l1tcm
+  - if:
+      properties:
+        compatible:
+          enum:
+            - mediatek,mt8188-scp
+            - mediatek,mt8188-scp-dual
+    then:
+      properties:
+        memory-region:
+          minItems: 1
+          items:
+            - description: Main SCP SRAM memory region
+            - description: Optional SCP L1TCM memory region
+      patternProperties:
+        "^scp@[a-f0-9]+$":
+          properties:
+            memory-region:
+              minItems: 1
+              items:
+                - description: Main SCP SRAM memory region
+                - description: Optional SCP L1TCM memory region
 
 additionalProperties: false
 
-- 
2.45.2


