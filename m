Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F12F2CA600A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 08:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8NRFf+dUUvJa3wu2zpI7GqfOZRfD8a7WGeUeQy4/QVA=; b=iPeVRTBpPukB/va/bb1heUGwGG
	SPcrlvjrHVp/9MhayzkY3RjAxt2It7MoxsguMNmXUmLbPUE+pJ+vp3GXzEB4oQouA9dsSKGeXPM+O
	geOxvdctInNXedcv4svOcOM88qKh3xriTlhpiknqQB31ytRvh5URgfLCbC3FzYpynsAlSoQQBSGhO
	S0zBSKM1Lc/VYZmDnB1qUi9zOGtDZSsfKdMmTenLL+lAPkwcv4oyrgsOKX6shJ98dxTYck4ZBhSFr
	W2G+dLRbk86LLl2bQUoqnqOxDsIwG7BtH4j6qa8jCPQ7wFni5vmMfwWO3Ch+380VX9U6bGqFdjMBD
	S5krWUlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEjso-00000003vgn-0AhH;
	Thu, 08 Oct 2026 08:53:46 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEjsl-00000003vew-1lnO;
	Thu, 08 Oct 2026 08:53:44 +0000
X-UUID: bf972b36c2f511f1acbe4559397dec65-20261008
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=8NRFf+dUUvJa3wu2zpI7GqfOZRfD8a7WGeUeQy4/QVA=;
	b=NGljQqcPivh7a9HM3sveLUpa45f45rGLK8C2p8UJSMb2nrT52CUkllt/iGzD2o5CaCRrwFzFEJTcc0AduSDoB28qwwwCzIXjGGdi8qkTunHFIAzjKo4T1izLC5tvEfUxsIeWk5MA6AWDTs5q/LMfW2IRRCgqsT2rCfmjQEVriT8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.20,REQID:99671cab-ea3b-407b-9e4c-6e3814bb4b6e,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:291e20b,CLOUDID:4b7dd9ef-4143-42b5-8262-bfd9006a7069,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99,E
	DM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: bf972b36c2f511f1acbe4559397dec65-20261008
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <tim.kuo@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 966797367; Thu, 08 Oct 2026 01:53:36 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 8 Oct 2026 16:53:33 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 8 Oct 2026 16:53:33 +0800
From: Tim Kuo <Tim.Kuo@mediatek.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Steven Liu <Steven.Liu@mediatek.com>,
	Sky Huang <Skylake.Huang@mediatek.com>, Sam Shih <Sam.Shih@mediatek.com>, Tim
 Kuo <Tim.Kuo@mediatek.com>
Subject: [PATCH v3 1/2] spi: dt-bindings: mediatek,spi-mt65xx: add MT7987/MT7989 compatibles
Date: Thu, 8 Oct 2026 16:53:31 +0800
Message-ID: <20261008085332.802898-1-Tim.Kuo@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_015343_464556_14E207C9 
X-CRM114-Status: UNSURE (   9.36  )
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

The MT7987 and MT7989 SPI IPs are IPM designs, so they keep
"mediatek,spi-ipm" as their fallback compatible, but they widen the tick
delay field of SPI_CMD_REG and therefore need compatibles of their own.

Signed-off-by: Tim Kuo <Tim.Kuo@mediatek.com>
---
v2: Add mt7987 and mt7989 real device compatible
v3:
 - Drop "mediatek,spi-ipm-v59" 
 - Move compatible of mt7987 and mt7989 to group of spi-ipm fallback

 Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml b/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
index 3bf3eb1f8728..63b23928c734 100644
--- a/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
+++ b/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
@@ -35,8 +35,10 @@ properties:
           - enum:
               - mediatek,mt7981-spi-ipm
               - mediatek,mt7986-spi-ipm
+              - mediatek,mt7987-spi
               - mediatek,mt7988-spi-quad
               - mediatek,mt7988-spi-single
+              - mediatek,mt7989-spi
               - mediatek,mt8188-spi-ipm
           - const: mediatek,spi-ipm
       - items:

base-commit: 0d9d0dbf2fddcff5859d623e90ca73c4054276e1
-- 
2.45.2


