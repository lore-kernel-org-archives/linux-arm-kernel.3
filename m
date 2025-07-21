Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64777C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 11:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ttOa5yHeILRLQq/pmNyyateoUiHafKjamecRb5Isp2c=; b=CZ+4GXe0fWxS55lYA4XeeyX1fn
	NNjFHSSSphIqd59wOZhPsDsLZ4C1VJcsSaKALeO8moTeli4TE3APtSbtCidbQx0rfwgc8gGtvvhKJ
	1jgxtsRIYQ4PvV+/vWWt+G1IJ6TSTIhaHFMAF0S86Gs1XsynY8K1w6c/kUKLPh2/3Zm/zKGQ45W1h
	jdg1qiyf9y6MRwH64ogW44rLrWxLaT4luZDlvzXE22+acnpGYgiCWsJOomZe5Ab5+ydpj79I8gQZp
	OBlnOry14QyXwXeG1o65IU16oHc1m91C5C0KT0z834o0++MAZj57W5bNWPJk+byQLiBXkMzXR5e0f
	uHxBFYhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udos5-0000000H8AG-0ygG;
	Mon, 21 Jul 2025 11:39:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udnvY-0000000GyIk-0oVe;
	Mon, 21 Jul 2025 10:39:25 +0000
X-UUID: f411e552661e11f09f706fa2197c6ceb-20250721
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From; bh=ttOa5yHeILRLQq/pmNyyateoUiHafKjamecRb5Isp2c=;
	b=QtQQ4TAAnIXnyrSoUhJ+P/8GjIOetGznjZRKbAvdiLNQrqI5NgYQdvpTHMZXgSd9OWP2yniF9R8+ALEXOtrV+I/aIhqjYCI6KL1Rbhh4dFdojN3dXginiJzoz/uAsswcEJW7DyFbcfcT+Y/bq8plJc14yrGVXsltwhG+FQGvWG0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:444b8957-f57a-4233-9527-56c1405c09ef,IP:0,UR
	L:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:9eb4ff7,CLOUDID:5f86ab84-a7ec-4748-8ac1-dca5703e241f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:1,
	IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:
	0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f411e552661e11f09f706fa2197c6ceb-20250721
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 867086435; Mon, 21 Jul 2025 03:39:17 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 21 Jul 2025 18:39:14 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 21 Jul 2025 18:39:14 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Kyrie Wu <kyrie.wu@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH v1 1/8] dt-bindings: media: mediatek: decoder: Add MT8189 mediatek,vcodec-decoder
Date: Mon, 21 Jul 2025 18:38:57 +0800
Message-ID: <20250721103905.5393-2-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250721103905.5393-1-kyrie.wu@mediatek.com>
References: <20250721103905.5393-1-kyrie.wu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_033924_247235_7E8ECEC6 
X-CRM114-Status: UNSURE (   9.65  )
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

Add compatible for video decoder on MT8189 platform, which is a
pure single core architecture.

Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
---
 .../bindings/media/mediatek,vcodec-subdev-decoder.yaml           | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
index 74e1d88d3056..1bb5a2485e4c 100644
--- a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
@@ -77,6 +77,7 @@ properties:
       - mediatek,mt8188-vcodec-dec
       - mediatek,mt8195-vcodec-dec
       - mediatek,mt8196-vcodec-dec
+      - mediatek,mt8189-vcodec-dec
 
   reg:
     minItems: 1
-- 
2.46.0


