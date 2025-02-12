Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52CDEC02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 10:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BMUWx50kpTrgGLiiJsGiGKpzbJ9p1c/efMM3/I4YH7M=; b=NpEU4XA5M4TG44111gDEp/JygO
	hDWtFRyuOnoAVLCEHK7bf+qP9efnjsGyR94a0K/m0g2/BpBUNmwTNzTougEVZ3HfCAZHBDb4aQ6ct
	g9LJF58RHzySifUTFL9vP2ZD1mpVFcRWBXx3DjMDoX32dDOdXVXOPxKSllIPLegWw60GEMqcCNI9M
	KtXM42MCYWN+Mz693zBIahzhSGlp+bF1DS3bZcte2Nw6hvgd6t4advvFT6McGf2NwX08qyNC45Yzv
	2edzN2ccTCybioGLVZjP+USP1XODax7Fb6tsycsEuDMaiNIvGuXXLlUnlu2ENe66nSr9F8xhSGl5p
	LYQJeGWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti9qB-00000006xc2-3g0k;
	Wed, 12 Feb 2025 10:19:35 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti9XY-00000006tfV-3kMM;
	Wed, 12 Feb 2025 10:00:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739354419;
	bh=0F/0qyTpLblJN9bn3oUmfcJlpoiaYpBNrYXmmjYDh2E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PN+zMyYhBYF0Rtv/CBkX7kCjGOZ4oMLI4PD5HbgrS+k4+5S/yI3yi3YeNL0omuQN0
	 0CNV7ABcioAGJrefwmykvcVFjSre/+0g7KCGzBIttiM2V5zJ7QY8FwGDRWq+B27bOE
	 q9jTGF07XG1eGO6Btn2+Qv9NNl8DDOwwUTAfPmyZk1gjzfpVfHlC+F2Bq30TIW0FPu
	 iB2sQpyu+tC66TqujIe6Hl759NkGTeWyQUrr7UkCVR7js9XtPDpNVnJEDkvve2NMbp
	 ijuDQQomBqv9hREVOaSu6GYWWIpWtPMrTajfaVTlYqWUvSx/5bCk9e94/e8ge110ls
	 hBLeAggH3LoMw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EF98117E154B;
	Wed, 12 Feb 2025 11:00:18 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: angelogioacchino.delregno@collabora.com,
	shawn.sung@mediatek.com,
	fparent@baylibre.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	pablo.sun@mediatek.com,
	kernel@collabora.com
Subject: [PATCH v1 2/8] soc: mediatek: mtk-mmsys: Fix MT8188 VDO1 DPI1 output selection
Date: Wed, 12 Feb 2025 11:00:06 +0100
Message-ID: <20250212100012.33001-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250212100012.33001-1-angelogioacchino.delregno@collabora.com>
References: <20250212100012.33001-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_020021_074826_5694E498 
X-CRM114-Status: GOOD (  11.40  )
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

The VDO1_MERGE4 hardware (merge5 software component) should be
set to enable output to DPI1_SEL by setting BIT(2) but, despite
the intention being exactly that, this won't work because the
declared register mask is wrong as it is set as GENMASK(1, 0).

Register MERGE4_MOUT_EN in VDO1 has four used bits [3, 0] so
fix the mask to reflect that.
That, in turn, allows the mmsys driver to actually set BIT(2)
in this register, fixing the MERGE4 output to DPI1 selection.

Fixes: c0349314d5a0 ("soc: mediatek: Support MT8188 VDOSYS1 in mtk-mmsys")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mt8188-mmsys.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/mediatek/mt8188-mmsys.h b/drivers/soc/mediatek/mt8188-mmsys.h
index 6bebf1a69fc0..a1d63be0a73d 100644
--- a/drivers/soc/mediatek/mt8188-mmsys.h
+++ b/drivers/soc/mediatek/mt8188-mmsys.h
@@ -343,7 +343,7 @@ static const struct mtk_mmsys_routes mmsys_mt8188_vdo1_routing_table[] = {
 		MT8188_DISP_DPI1_SEL_IN_FROM_VPP_MERGE4_MOUT
 	}, {
 		DDP_COMPONENT_MERGE5, DDP_COMPONENT_DPI1,
-		MT8188_VDO1_MERGE4_SOUT_SEL, GENMASK(1, 0),
+		MT8188_VDO1_MERGE4_SOUT_SEL, GENMASK(3, 0),
 		MT8188_MERGE4_SOUT_TO_DPI1_SEL
 	}, {
 		DDP_COMPONENT_MERGE5, DDP_COMPONENT_DP_INTF1,
-- 
2.48.1


