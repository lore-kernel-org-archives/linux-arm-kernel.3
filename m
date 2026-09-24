Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE268C9830D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 03:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WdlxKuZ1eRGNTq9IjWkXwugc0cdMzr3fNzL2g2N6O5c=; b=x16DsRBxOBBVwgF9GIzHefKdXU
	eK+oqmxGdx7ez3Vt7JpY/icied6vuxT6TE64+oCG1sljnI8AevgvjqMej8NThVEb9Iy2PYHnyAno5
	rUSFVZNCKuHXqSKadR0bmi7aW3YllJR9BGPSO8fNjMVj4u+dQX5zC6TAM1kYftjVx0O/Sveko9c0A
	BVBzajz3GQBPpd8rpEeA/KAApj2gs21HsNwuBiiWQCaLsMJzrE2la6K9M6Qh/HEQXIUH/YsCq4BUZ
	9EwM9q+lsicxhETVrsEMdSbL+pQ4rF0pYpUWMd0xWY5EUmEJndeDZxnlKX+IFLBxxdJAKY+uClLxp
	PSJL5sTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Zsn-00000009v7V-3aNZ;
	Thu, 24 Sep 2026 03:12:25 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Zsk-00000009v5z-2dMJ;
	Thu, 24 Sep 2026 03:12:23 +0000
X-UUID: be74994ab7c511f1afed4741b24580c9-20260923
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=WdlxKuZ1eRGNTq9IjWkXwugc0cdMzr3fNzL2g2N6O5c=;
	b=m8HipW0v8aCf9OcDHnF3lOTas7ITq1fvIRFN1w5sLtbyLlFut09hHz/nJJF3+U9b2NmOqvQFO6io8OdKCi3SQ5FgrxOfdAVjccCE4UYVDBavwONYNO8c1huRMCUX0q6IJN3TDabQ8uJzaGhB4uqZY4KJi+DCj3sOzadvFcf53OA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:4d1143fb-dc3a-4c4c-8a3c-e657d78fea2b,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:7db8b62,CLOUDID:f48a819f-fd57-478a-a1a5-98cdf3772511,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99,E
	DM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: be74994ab7c511f1afed4741b24580c9-20260923
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <tim.kuo@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 808650630; Wed, 23 Sep 2026 20:12:15 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 24 Sep 2026 11:12:13 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 24 Sep 2026 11:12:13 +0800
From: Tim Kuo <Tim.Kuo@mediatek.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Steven Liu <Steven.Liu@mediatek.com>,
	Sky Huang <Skylake.Huang@mediatek.com>, Tim Kuo <Tim.Kuo@mediatek.com>
Subject: [PATCH 1/2] dt-bindings: spi: mediatek: add mediatek,spi-ipm-v59 compatible
Date: Thu, 24 Sep 2026 11:12:10 +0800
Message-ID: <20260924031211.2199921-1-Tim.Kuo@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_201222_683917_C60FF27E 
X-CRM114-Status: GOOD (  10.79  )
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

The IPM v59 SPI IP differs from earlier IPM designs, most visibly in the
tick delay field of SPI_CMD_REG, so it needs its own fallback compatible
rather than reusing "mediatek,spi-ipm".

Signed-off-by: Tim Kuo <Tim.Kuo@mediatek.com>
---
 .../devicetree/bindings/spi/mediatek,spi-mt65xx.yaml         | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml b/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
index 3bf3eb1f8728..08a3497b03dc 100644
--- a/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
+++ b/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
@@ -39,6 +39,10 @@ properties:
               - mediatek,mt7988-spi-single
               - mediatek,mt8188-spi-ipm
           - const: mediatek,spi-ipm
+      - items:
+          - enum:
+              - mediatek,mtxxxx-spi
+          - const: mediatek,spi-ipm-v59
       - items:
           - enum:
               - mediatek,mt8196-spi
@@ -55,7 +59,6 @@ properties:
               - mediatek,mt8135-spi
               - mediatek,mt8173-spi
               - mediatek,mt8183-spi
-
   reg:
     maxItems: 1
 
-- 
2.45.2


