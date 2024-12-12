Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02C1EE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 15:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lbb+BF8rXOcsled1oWe4stPtecQkoM6M2iGQzUBZ20E=; b=rEtiG+kViWhYOOBTpb3puA8QOS
	QmvCh02papBZYDS2PdhJqFX+GMmvQduLZMnzuLKmIXYrjoELnEVhTNP8eqN73IDBYpLwWbjHhdH68
	v5SpVeU3tOgG6bu0HuIHzFRo5QOQeDC7vzDZm9KQPJMRSiuRD4zmyzTTCBnONGNGKDVSBCL9ny7OA
	b1/7/irEzKUQsCkGN4Dc99GBCG34UlxVyY6oS/RWA4mGiaBREu4CZl5uXg1p44xhdfO2AsnMzm3Jy
	0hmBlxPJvicCOOPb1tz2gRV8qXIYdIFrOdLwUSgtb8Lq4hBMego3qYYuy0htNKH3RWbEN9g6uW1OE
	1TZVus+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLlFg-00000000mJL-203k;
	Thu, 12 Dec 2024 15:37:20 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLlCN-00000000lcS-3qpW;
	Thu, 12 Dec 2024 15:33:58 +0000
X-UUID: 7cdb1536b89e11ef9048ed6ed365623b-20241212
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=lbb+BF8rXOcsled1oWe4stPtecQkoM6M2iGQzUBZ20E=;
	b=XpWhxW54klnIXCjAyLGAe5Ui/9zTDPHR3/MkyDq7+owMNhZ8PCDnDvaeZhWNYU9ksJw5UOEW51Ep7E10AZk821wffgNVhFlvXTcUaWPnz42AerdV1l95w8T24gpxCDbc6d64xsUAjDKnG8k0grbo1kUQ9iMe9dj9f8o0rGO8zac=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:190cea4a-eb9f-48d1-9214-0c2efcb94c21,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:8101df3b-e809-4df3-83cd-88f012b9e9ba,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0,EDM:-3,IP
	:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
	LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 7cdb1536b89e11ef9048ed6ed365623b-20241212
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1967592384; Thu, 12 Dec 2024 08:33:51 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 12 Dec 2024 23:33:46 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 12 Dec 2024 23:33:46 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "Jason-JH . Lin"
	<jason-jh.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, "Nancy
 Lin" <nancy.lin@mediatek.com>, Shawn Sung <shawn.sung@mediatek.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Fei Shao
	<fshao@chromium.org>
Subject: [PATCH 1/2] dt-bindings: display: mediatek: ovl: Modify rules for MT8195/MT8188
Date: Thu, 12 Dec 2024 23:33:43 +0800
Message-ID: <20241212153344.27408-2-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20241212153344.27408-1-jason-jh.lin@mediatek.com>
References: <20241212153344.27408-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--0.136400-8.000000
X-TMASE-MatchedRID: zCCEK6DgsdBTeZCGZ2HhGPSZ/2axrnPBkos2tunL8DRh2fnHe1cil0fp
	kQx2u0Ks+sZ43y9or/yQgj4GwqRgEJH0YXYnbGozFEUknJ/kEl7dB/CxWTRRu+rAZ8KTspSzhP2
	jHO9YjNgLjliWD7ttutbT5Scckb0uakZ7kncXBFBwiBREWkL9ZuSf0rVZxcGVbekdSZ/VG9prda
	hWPN1vM5s/h019t4TeF0aD5ljt43pMcHZD6gqu7wxMjfifIXfowkvVoA11Twp+3BndfXUhXQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--0.136400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: FFC1D25952B8A49252E5022CAE31CDDED0172731751D266829B17250F15102BC2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_073355_967691_23A148CA 
X-CRM114-Status: UNSURE (   8.33  )
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

From: Hsiao Chien Sung <shawn.sung@mediatek.com>

Modify rules for both MT8195 and MT8188.
Hardware capabilities include color formats and AFBC are
changed since MT8195, stop using the settings of MT8183.

Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 .../bindings/display/mediatek/mediatek,ovl.yaml           | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
index 9ea796a033b2..0ace12bbb623 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
@@ -36,16 +36,14 @@ properties:
           - enum:
               - mediatek,mt6795-disp-ovl
           - const: mediatek,mt8173-disp-ovl
-      - items:
-          - enum:
-              - mediatek,mt8188-disp-ovl
-              - mediatek,mt8195-disp-ovl
-          - const: mediatek,mt8183-disp-ovl
       - items:
           - enum:
               - mediatek,mt8186-disp-ovl
               - mediatek,mt8365-disp-ovl
           - const: mediatek,mt8192-disp-ovl
+      - items:
+          - const: mediatek,mt8188-disp-ovl
+          - const: mediatek,mt8195-disp-ovl
 
   reg:
     maxItems: 1
-- 
2.43.0


