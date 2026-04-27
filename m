Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA0ACFF885E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 11:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b6ZRNZ1uyc40eGTynrpn2LbGVE4wJKZzCH33Oh8n5Xw=; b=4PddHyNQl+F1LeHf550pCh7kCG
	LvriqwhJVflQPRdq2En4W9LxoheeBqRPBjzoO08DJQPEMvbyzb68E8a2ZlXsBYYKrgX1ZL+rhSPG1
	3BSOZAwWritlJMy4ei2Sgz3FYrM3gdtI7pnGEzwI4KKrVrGVZDYoYf06+JmoRCTG6xqn6nc1zOwUJ
	C/rnQCl4MYRAhXQnZxL1BTgvo8NM9GQb9c2nsAoduqeoR9Fs00sb/PiyKofXI8tlN1UjNfmHnL5IU
	ohMkiIkwNIYRffeyaF0W1yFKjOeY3U1//Km0Iym8n8wgto3cAopL321Lmq7aDQKu6DGNV2bkQVovh
	7ROiXLiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHK2J-0000000GmYc-1Z8I;
	Mon, 27 Apr 2026 11:21:59 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHK2F-0000000GmXU-470G;
	Mon, 27 Apr 2026 11:21:57 +0000
X-UUID: 4a453684422b11f19e7563141e833ce8-20260427
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=b6ZRNZ1uyc40eGTynrpn2LbGVE4wJKZzCH33Oh8n5Xw=;
	b=eFmFt/BCJ5wKr81FID3SP4OCCi4KZuPzrBza1oseDZBgvFUo765KzbE5cPzRSpCKplko8WKLT1eOeIQY08dd6VMbkS+q9wCCSVZylTD/7BZkUtVozk0YKSYZPQpB4Fp5sgZz+Ehr9shtSSpaqfD0toEyBPYkPvd6DX9DQSMx4tY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:24636aca-146f-43b9-91cd-e2481d869c4c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:3b2cab64-469e-4eb6-aeb8-4b21454b0f32,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|865|888|898,TC:-5,Cont
	ent:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 4a453684422b11f19e7563141e833ce8-20260427
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <jay.liu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1572493446; Mon, 27 Apr 2026 04:21:52 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 27 Apr 2026 19:21:49 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 27 Apr 2026 19:21:48 +0800
From: Jay Liu <jay.liu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Jay Liu <jay.liu@mediatek.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 2/6] dt-bindings: display: mediatek: dither: Add support for MT8196
Date: Mon, 27 Apr 2026 19:20:16 +0800
Message-ID: <20260427112131.23423-3-jay.liu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260427112131.23423-1-jay.liu@mediatek.com>
References: <20260427112131.23423-1-jay.liu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_042156_029041_0641DA1D 
X-CRM114-Status: UNSURE (   9.00  )
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

Add a compatible string for the DITHER IP found in the MT8196 SoC.
Each DITHER IP of this SoC is fully compatible with the ones found
in MT8183.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Jay Liu <jay.liu@mediatek.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,dither.yaml    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
index 891c95be15b9..d2e45223693d 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
@@ -31,6 +31,7 @@ properties:
               - mediatek,mt8188-disp-dither
               - mediatek,mt8192-disp-dither
               - mediatek,mt8195-disp-dither
+              - mediatek,mt8196-disp-dither
               - mediatek,mt8365-disp-dither
           - const: mediatek,mt8183-disp-dither
 
-- 
2.46.0


