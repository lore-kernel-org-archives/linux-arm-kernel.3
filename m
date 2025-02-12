Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BD84C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 10:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wgqE8tqqssID5etbJof/r187XpyMQy1HzfXM10qmhmE=; b=VryXDRFSRbcYh+oNqGGX6NJmW3
	9KweeHjWtY0mwTXJZEKLg61THdaR6lUjDwHTNQ6J8BCZxoCxyyxicwhaiE4/2EqoIOCUz6kfZMAmq
	6a4P5gOWd8EfV/zXLdHBbpuznIVv+faWX1dFQxOd+6Dtug8V3YwhSwvBoGy6XTND8uAZH0AlbkSyN
	WtivvIMwzBkCixlF2nUTkjdgGodH4dYLy+lbpeqMShkTwKaEqSZIOgMVp0UKhdGPawr9abfCy3Jc5
	FqCb7Oeso81nVcn7DTOg+DQ/cr8slTjnumsf2MlvRO5LbMHPBRgow/1/s93woQn+Yt+KrX601Tieu
	D66tcyOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiA9g-000000070uG-2jNa;
	Wed, 12 Feb 2025 10:39:44 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti9Xc-00000006thf-48gl;
	Wed, 12 Feb 2025 10:00:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739354423;
	bh=qIB7ibz7WHqpA4xUJoQy83qbNuSr/lbngQhBP3iOYO0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=o7dmrnKZfTma6lXtDwkyHbSduLPhytlXF4ztc3SeDcVAKLm5ASzfW5VU5NpReto0f
	 WrYd0lJqTEHkI4uA/Lzhu0NoDz5h2ycSIUSHCxvwJaE7nY/Dj5MIxPS20X/tOgiXnT
	 h3RDheIdIf7z/97NNHxBG9p76tHiRXwpLXTaZDWL8mHEq8qFPiMHzO9N1iPaYYF9Gz
	 q0y8oXeDZHytiVCuxZs7z5FTd8gNxBZWFXdxZDXE7x1GpvKeiJg1m4n5SHnFT5QQQB
	 3I1fZxu7MKIRbRPU6qB2KYVw4LO6cSuOp5c/4OjMSl0tP1IbIPHnlmnWbq1nsM36vY
	 IVGdEwvLJvyfw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2E30617E0F68;
	Wed, 12 Feb 2025 11:00:23 +0100 (CET)
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
Subject: [PATCH v1 8/8] soc: mediatek: mt8188-mmsys: Add support for DSC on VDO0
Date: Wed, 12 Feb 2025 11:00:12 +0100
Message-ID: <20250212100012.33001-9-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250212100012.33001-1-angelogioacchino.delregno@collabora.com>
References: <20250212100012.33001-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_020025_171103_C499D151 
X-CRM114-Status: UNSURE (   8.01  )
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

Add routing paths to support Display Stream Compression on the
VDOSYS0 pipelines ending with DSI or DisplayPort (DP_INTF).

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mt8188-mmsys.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/soc/mediatek/mt8188-mmsys.h b/drivers/soc/mediatek/mt8188-mmsys.h
index befd293e86c3..99080afead7e 100644
--- a/drivers/soc/mediatek/mt8188-mmsys.h
+++ b/drivers/soc/mediatek/mt8188-mmsys.h
@@ -226,15 +226,24 @@ static const struct mtk_mmsys_routes mmsys_mt8188_routing_table[] = {
 	MMSYS_ROUTE(DSC0, MERGE0,
 		    MT8188_VDO0_VPP_MERGE_SEL, MT8188_SEL_IN_VPP_MERGE_FROM_MASK,
 		    MT8188_SEL_IN_VPP_MERGE_FROM_DSC_WRAP0_OUT),
+	MMSYS_ROUTE(MERGE0, DP_INTF0,
+		    MT8188_VDO0_DP_INTF0_SEL_IN, MT8188_SEL_IN_DP_INTF0_FROM_MASK,
+		    MT8188_SEL_IN_DP_INTF0_FROM_VPP_MERGE),
 	MMSYS_ROUTE(DSC0, DSI0,
 		    MT8188_VDO0_DSI0_SEL_IN, MT8188_SEL_IN_DSI0_FROM_MASK,
 		    MT8188_SEL_IN_DSI0_FROM_DSC_WRAP0_OUT),
 	MMSYS_ROUTE(RDMA0, COLOR0,
 		    MT8188_VDO0_DISP_RDMA_SEL, GENMASK(1, 0),
 		    MT8188_SOUT_DISP_RDMA0_TO_DISP_COLOR0),
+	MMSYS_ROUTE(DITHER0, DSC0,
+		    MT8188_VDO0_DISP_DITHER0_SEL_OUT, MT8188_SOUT_DISP_DITHER0_TO_MASK,
+		    MT8188_SOUT_DISP_DITHER0_TO_DSC_WRAP0_IN),
 	MMSYS_ROUTE(DITHER0, DSI0,
 		    MT8188_VDO0_DISP_DITHER0_SEL_OUT, MT8188_SOUT_DISP_DITHER0_TO_MASK,
 		    MT8188_SOUT_DISP_DITHER0_TO_DSI0),
+	MMSYS_ROUTE(DITHER0, MERGE0,
+		    MT8188_VDO0_DISP_DITHER0_SEL_OUT, MT8188_SOUT_DISP_DITHER0_TO_MASK,
+		    MT8188_SOUT_DISP_DITHER0_TO_VPP_MERGE0),
 	MMSYS_ROUTE(DITHER0, DP_INTF0,
 		    MT8188_VDO0_DISP_DITHER0_SEL_OUT, MT8188_SOUT_DISP_DITHER0_TO_MASK,
 		    MT8188_SOUT_DISP_DITHER0_TO_DP_INTF0),
-- 
2.48.1


