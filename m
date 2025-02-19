Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC615C021B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 09:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QR9jU3sMl1GsR4VRW4gk3j4bKASW14wQJjbf/vk+BGc=; b=zA4BeY71ZEzEbAVBExpFIDBDlq
	thGyJ6I43hsXjVnCFokiPlHMQwzwtVZ9kqQnI4zQENbD6pi+3IVuyUuBlW/lFW/c1O0PtTpRqNPWO
	xCo89kLf0qx0V5kN505ezj5Jtgw8WWaHGcQljWKcVVqgF80VWqCq3bT3BM3XhJb8jwExJ50cvy7HT
	sumIaBghboULi2OwnIBPx5WAbLbWf+s0nSfhA9nElfIveaO1FubcRU5Q9FCGk/WaC5PnNYXfK4Z7E
	lW4tMIPRH8gY21KB1AoIFUhNmE5LCFUUg7PdzCp/08eAcup51pSUSpTc/Hjy1r6qqL6P305bDVn5i
	lFdERb/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkggJ-0000000By74-0huS;
	Wed, 19 Feb 2025 09:47:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkgGa-0000000Bog7-17KR;
	Wed, 19 Feb 2025 09:21:17 +0000
X-UUID: dc5b8650eea211ef83f2a1c9db70dae0-20250219
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=QR9jU3sMl1GsR4VRW4gk3j4bKASW14wQJjbf/vk+BGc=;
	b=gBxBdwhTOZUE9wHfVx12r93MaQV0EDNDgDWS2je2OOkyPwSaO836tLevUAaVALJcnDE3Rd8JjNE63s+4REaTzKsTdtldr7ijnfHLT2LQNn43t9E7oAcn37E5NCCSJtubS6Bwmmxd8o21JZgqisu5GFmFC8pstYb7VcB7Yx+0qjw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:dc43a707-70d1-42b4-b96a-98cea8939439,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:1b2f13dc-d480-4873-806f-0f365159227b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: dc5b8650eea211ef83f2a1c9db70dae0-20250219
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <jay.liu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1649399467; Wed, 19 Feb 2025 02:21:12 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Wed, 19 Feb 2025 17:21:10 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Wed, 19 Feb 2025 17:21:09 +0800
From: Jay Liu <jay.liu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Yongqiang Niu
	<yongqiang.niu@mediatek.com>, CK Hu <ck.hu@mediatek.com>, Hsin-Yi Wang
	<hsinyi@chromium.org>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Jay Liu
	<jay.liu@mediatek.com>
Subject: [PATCH 6/7] dt-bindings: display: mediatek: gamma: Add support for MT8196
Date: Wed, 19 Feb 2025 17:20:39 +0800
Message-ID: <20250219092040.11227-7-jay.liu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20250219092040.11227-1-jay.liu@mediatek.com>
References: <20250219092040.11227-1-jay.liu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_012116_310418_3757E82C 
X-CRM114-Status: UNSURE (   9.37  )
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

Add a compatible string for MediaTek MT8196 SoC

Signed-off-by: Jay Liu <jay.liu@mediatek.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,gamma.yaml     | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
index 48542dc7e784..513e51c6d2b9 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
@@ -40,6 +40,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt8188-disp-gamma
+              - mediatek,mt8196-disp-gamma
           - const: mediatek,mt8195-disp-gamma
 
   reg:
-- 
2.18.0


