Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47793C5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 06:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PPgLQxbZMPX+YEJqn6qREiV9HQdeWS+Rmggk937j+b8=; b=VO0oB5L3Q6/3Tawj1QK82XFJfd
	y24CYWB2A6pxXTOtNLe9c6/DjEigQfO085BxE3XA24fRmW7n2LeIQBipBa66v5+tTQ4d4fadYUGwn
	r6joXxnqaWpjs6JCKhI2+WPCmGmg6hNYCa1qzp8Wr5MuIcbwrozMsPiENSsm3WUCOnSCiaafTNTrZ
	0Zp7nUr8u444xCQUNdNr8Bgj+Fur1ZwYwnZbmMlO4ZpcG+f0TVY/aoem02nm4KXGjsBJzrsjIrMet
	j+kIDxU3mPtjse1y45HuWlfnHGdWdHr06spY+5olfnKDwan8wEvaTXHy0o7iskz680lu0FP2TGvq0
	d3MUEXeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKAbt-0000000CLex-48GK;
	Wed, 28 May 2025 06:49:57 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKAPF-0000000CJB4-1pUi;
	Wed, 28 May 2025 06:36:54 +0000
X-UUID: 21aadafc3b8e11f08d385d50fb11b32d-20250527
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=PPgLQxbZMPX+YEJqn6qREiV9HQdeWS+Rmggk937j+b8=;
	b=cxiNx2TTv0ehx26NZzPhEdwzA3RFMkcQqtj8YVtdK/kIdkPRsLvyswt+eAWxoViyTAr2QiqnFzSaRTVjNUSQpqp5HAszeWuV9O7NeWbwtKszqo7tn9Wss+XqswjkbnFywwc7rZATZcocJJEbFKos9oyJDs07mHXKwOpVc/zj6W4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:5a806041-940a-4451-801f-df51f95dbbab,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:8a3e0f58-abad-4ac2-9923-3af0a8a9a079,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 21aadafc3b8e11f08d385d50fb11b32d-20250527
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1648285991; Tue, 27 May 2025 23:36:48 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 28 May 2025 14:36:44 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 28 May 2025 14:36:44 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	<angelogioacchino.delregno@collabora.com>, <nicolas.dufresne@collabora.com>,
	<wenst@chromium.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Yunfei Dong <yunfei.dong@mediatek.com>,
	Longfei Wang <longfei.wang@mediatek.com>, Irui Wang <irui.wang@mediatek.com>
Subject: [PATCH v2 5/6] dt-bindings: media: mediatek: encoder: Add encoder dt-bindings for MT8196
Date: Wed, 28 May 2025 14:36:31 +0800
Message-ID: <20250528063633.14054-6-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250528063633.14054-1-irui.wang@mediatek.com>
References: <20250528063633.14054-1-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_233653_478513_6E9E1018 
X-CRM114-Status: GOOD (  10.23  )
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

Add MT8196 encoder compatible string, which will reference VCP device.

Signed-off-by: Irui Wang <irui.wang@mediatek.com>
---
 .../bindings/media/mediatek,vcodec-encoder.yaml      | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
index ebc615584f92..7675391d7eb0 100644
--- a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
@@ -24,6 +24,7 @@ properties:
               - mediatek,mt8188-vcodec-enc
               - mediatek,mt8192-vcodec-enc
               - mediatek,mt8195-vcodec-enc
+              - mediatek,mt8196-vcodec-enc
       - items:
           - const: mediatek,mt8186-vcodec-enc
           - const: mediatek,mt8183-vcodec-enc
@@ -76,6 +77,17 @@ required:
   - iommus
 
 allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mt8196-vcodec-enc
+
+    then:
+      required:
+        - mediatek,vcp
+
   - if:
       properties:
         compatible:
-- 
2.45.2


