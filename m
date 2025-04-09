Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62E3DC369A1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 13:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5XzR95nX80To15KfQKolebpaAlDV9SKntQH/jQWMtRI=; b=ClEyOl5OaNw3T7Q5h/MpOj8kMy
	HZqG4z1duaKIo7sH0SnPKP90Z4oVxSUOQ7QGFCRfGjTWQCVhfbUbaK6s7qaMC6VDIMe5xX7hjzaXO
	kAM3ItnaWHdkflyM+k54Krt65mjqrfq6M4nXkyqXHwAveNDvGC6RDZkwfo7P2fZsICN//QdnKq/vs
	fvnULlFkUPOVm/F3MOAhx+W2Lm2sNh36scokncpIh56i4x2T6M0c6KmfvX46y18aX1FSIm2qVC0+9
	GjYS8mrvxNFPupCtkyYkFp9hKlyj0OXAsWeilSQfK3GtUvMUM5Sp7oZCeHy3DgNn7TNZbdqN1897U
	a0pr23qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2VKG-00000007GiI-2Aid;
	Wed, 09 Apr 2025 13:18:44 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2VEy-00000007F1u-1xEE;
	Wed, 09 Apr 2025 13:13:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744204394;
	bh=pQbgxTHUSndGNceRAo7lyCtBFDwzO+1qKqjpMO19XNA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oFDUDqXQGhUNRTx4Ub8V+URTI2v16LvKKB0f0CoaRT6KxgIucCSSzcoShvKWiOQSJ
	 1WAbypQYkPBjcvXpcuMt7x4wlh8IVNTqG6zDsVkzXy6nzOH6+KBbmJr3amNgX4Bksq
	 Ab/PEnipUeyPLPFI62WHk0uTC4fp74REV7W2t5IeZgsSrijZLus3UQo8VfmUlK2SXG
	 wI+zM57t7CFi09YcbVzgINGWFrswop7vssaqfi+9F1D5S/EZzFv75C6FAAI63kDrBi
	 5hpM42crND+tIiBG11xZO07azJjJ5RlIqW5typCSRLYbSUBhh05sOZnoVSKXfsMWhW
	 hwQ22xxlGfY4A==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CE23417E09BF;
	Wed,  9 Apr 2025 15:13:13 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	lewis.liao@mediatek.com,
	ives.chenjh@mediatek.com,
	tommyyl.chen@mediatek.com,
	jason-jh.lin@mediatek.com
Subject: [PATCH v1 2/5] drm/mediatek: mtk_dpi: Add local helpers for bus format parameters
Date: Wed,  9 Apr 2025 15:13:03 +0200
Message-ID: <20250409131306.108635-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250409131306.108635-1-angelogioacchino.delregno@collabora.com>
References: <20250409131306.108635-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_061316_645286_6DD0F952 
X-CRM114-Status: GOOD (  10.90  )
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

In preparation for adding support for additional color formats,
add local helpers to map media bus format parameters to this
driver's bit_num, channel_swap and color_format.

This commit brings no functional changes.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 46 ++++++++++++++++++++++++++----
 1 file changed, 40 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index d735398e97f8..5a66dfe3ad40 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -738,6 +738,43 @@ static u32 *mtk_dpi_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
 	return input_fmts;
 }
 
+static unsigned int mtk_dpi_bus_fmt_bit_num(unsigned int out_bus_format)
+{
+	switch (out_bus_format) {
+	default:
+	case MEDIA_BUS_FMT_RGB888_1X24:
+	case MEDIA_BUS_FMT_RGB888_2X12_LE:
+	case MEDIA_BUS_FMT_RGB888_2X12_BE:
+	case MEDIA_BUS_FMT_YUYV8_1X16:
+		return MTK_DPI_OUT_BIT_NUM_8BITS;
+	}
+}
+
+static unsigned int mtk_dpi_bus_fmt_channel_swap(unsigned int out_bus_format)
+{
+	switch (out_bus_format) {
+	default:
+	case MEDIA_BUS_FMT_RGB888_1X24:
+	case MEDIA_BUS_FMT_RGB888_2X12_LE:
+	case MEDIA_BUS_FMT_RGB888_2X12_BE:
+	case MEDIA_BUS_FMT_YUYV8_1X16:
+		return MTK_DPI_OUT_CHANNEL_SWAP_RGB;
+	}
+}
+
+static unsigned int mtk_dpi_bus_fmt_color_format(unsigned int out_bus_format)
+{
+	switch (out_bus_format) {
+	default:
+	case MEDIA_BUS_FMT_RGB888_1X24:
+	case MEDIA_BUS_FMT_RGB888_2X12_LE:
+	case MEDIA_BUS_FMT_RGB888_2X12_BE:
+		return MTK_DPI_COLOR_FORMAT_RGB;
+	case MEDIA_BUS_FMT_YUYV8_1X16:
+		return MTK_DPI_COLOR_FORMAT_YCBCR_422;
+	}
+}
+
 static int mtk_dpi_bridge_atomic_check(struct drm_bridge *bridge,
 				       struct drm_bridge_state *bridge_state,
 				       struct drm_crtc_state *crtc_state,
@@ -757,13 +794,10 @@ static int mtk_dpi_bridge_atomic_check(struct drm_bridge *bridge,
 		bridge_state->output_bus_cfg.format);
 
 	dpi->output_fmt = out_bus_format;
-	dpi->bit_num = MTK_DPI_OUT_BIT_NUM_8BITS;
-	dpi->channel_swap = MTK_DPI_OUT_CHANNEL_SWAP_RGB;
+	dpi->bit_num = mtk_dpi_bus_fmt_bit_num(out_bus_format);
+	dpi->channel_swap = mtk_dpi_bus_fmt_channel_swap(out_bus_format);
 	dpi->yc_map = MTK_DPI_OUT_YC_MAP_RGB;
-	if (out_bus_format == MEDIA_BUS_FMT_YUYV8_1X16)
-		dpi->color_format = MTK_DPI_COLOR_FORMAT_YCBCR_422;
-	else
-		dpi->color_format = MTK_DPI_COLOR_FORMAT_RGB;
+	dpi->color_format = mtk_dpi_bus_fmt_color_format(out_bus_format);
 
 	return 0;
 }
-- 
2.49.0


