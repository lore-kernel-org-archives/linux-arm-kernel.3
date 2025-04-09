Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4FCBC36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 13:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FBE1uKvXUxG86cyTUP/gEfeTKKh8Eaeg95O/L1hscJE=; b=A/+YGOXybaTTo3ihNt5pk/Zoke
	BCIPQtXH9dOLULeZgRjydDEA+sL6WgkySXo/6B87Zm442ON31r4H5srHzLqZixS9YhisRVPxLiRM9
	UTs/5/p7GSOJHl5VGGq+zCiigizMJ6tNenLvdZiq2UBfQpYlB3Hy8CX4gdq5sywZdbWaHMIx98uZW
	VjqFPS+mrMiAttz+FHJdW4SKp0CZhMJA4X+n73Bt5HMgnD+TbgWtF764r3COXWXnrr1x93oXsfOcy
	3yWiwEpD7Z4IIPLUINnLD/qJmffysKfHiQjrayvFKEGQH1aOdHlLh+3fPp8z08rCokLmiZZem3xyq
	k7xvn5Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2VM1-00000007HBP-0OcB;
	Wed, 09 Apr 2025 13:20:33 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2VEy-00000007F2Q-43v1;
	Wed, 09 Apr 2025 13:13:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744204395;
	bh=pjKrGK2aEr7zkX+T3vxIp/LJ9TSuRWsNbfcccXAMTV4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gXCy5yl59A3Qjsx8C3KBLyS5J9WGi57d1p8L7g0tOwq4WkuzlHv2toE6mle+T1q6m
	 f0Aw+ld54eC/U6vu7uIn0+b7P0707dbphVRUp/L2QyfhkGYymBht4UhAq9/SChDim8
	 samN665teK77+WtZksjGaqlyBkPn1STL2I5BspOzP+eQE7EqVPxlieF+27lQCQYxWK
	 LtdUw65fFG0Gb1QaycdnZJrsMYnkP2b6qAzGSlOdXdB3ORq2J5ZFVyYPYvwIRQwN0N
	 Y69I7KO96BO+lK2S2b/sWmeDZc+HAoi8kJjx7cPvw+t7YnTLdVvAtiDPQAvkeF2/qT
	 W9o4JXiMVapyQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CC40917E0EB8;
	Wed,  9 Apr 2025 15:13:14 +0200 (CEST)
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
Subject: [PATCH v1 3/5] drm/mediatek: mtk_dpi: Add support for additional output formats
Date: Wed,  9 Apr 2025 15:13:04 +0200
Message-ID: <20250409131306.108635-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250409131306.108635-1-angelogioacchino.delregno@collabora.com>
References: <20250409131306.108635-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_061317_153589_BA2A3718 
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

Add support for configuring the Display Parallel Interface block
to output YUV444 8/10 bits, YUV422 10/12 bits (8 bits support is
already present), BGR 8-bits, and RGB 10-bits.

The enablement of the various additional output formats in SoCs
platform data will be done in a different change.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 33 ++++++++++++++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 5a66dfe3ad40..a9e8113a1618 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -59,7 +59,8 @@ enum mtk_dpi_out_channel_swap {
 
 enum mtk_dpi_out_color_format {
 	MTK_DPI_COLOR_FORMAT_RGB,
-	MTK_DPI_COLOR_FORMAT_YCBCR_422
+	MTK_DPI_COLOR_FORMAT_YCBCR_422,
+	MTK_DPI_COLOR_FORMAT_YCBCR_444
 };
 
 struct mtk_dpi {
@@ -450,9 +451,15 @@ static void mtk_dpi_config_disable_edge(struct mtk_dpi *dpi)
 static void mtk_dpi_config_color_format(struct mtk_dpi *dpi,
 					enum mtk_dpi_out_color_format format)
 {
-	mtk_dpi_config_channel_swap(dpi, MTK_DPI_OUT_CHANNEL_SWAP_RGB);
+	mtk_dpi_config_channel_swap(dpi, dpi->channel_swap);
 
 	switch (format) {
+	case MTK_DPI_COLOR_FORMAT_YCBCR_444:
+		mtk_dpi_config_yuv422_enable(dpi, false);
+		mtk_dpi_config_csc_enable(dpi, true);
+		if (dpi->conf->swap_input_support)
+			mtk_dpi_config_swap_input(dpi, false);
+		break;
 	case MTK_DPI_COLOR_FORMAT_YCBCR_422:
 		mtk_dpi_config_yuv422_enable(dpi, true);
 		mtk_dpi_config_csc_enable(dpi, true);
@@ -743,10 +750,18 @@ static unsigned int mtk_dpi_bus_fmt_bit_num(unsigned int out_bus_format)
 	switch (out_bus_format) {
 	default:
 	case MEDIA_BUS_FMT_RGB888_1X24:
+	case MEDIA_BUS_FMT_BGR888_1X24:
 	case MEDIA_BUS_FMT_RGB888_2X12_LE:
 	case MEDIA_BUS_FMT_RGB888_2X12_BE:
 	case MEDIA_BUS_FMT_YUYV8_1X16:
+	case MEDIA_BUS_FMT_YUV8_1X24:
 		return MTK_DPI_OUT_BIT_NUM_8BITS;
+	case MEDIA_BUS_FMT_RGB101010_1X30:
+	case MEDIA_BUS_FMT_YUYV10_1X20:
+	case MEDIA_BUS_FMT_YUV10_1X30:
+		return MTK_DPI_OUT_BIT_NUM_10BITS;
+	case MEDIA_BUS_FMT_YUYV12_1X24:
+		return MTK_DPI_OUT_BIT_NUM_12BITS;
 	}
 }
 
@@ -757,8 +772,15 @@ static unsigned int mtk_dpi_bus_fmt_channel_swap(unsigned int out_bus_format)
 	case MEDIA_BUS_FMT_RGB888_1X24:
 	case MEDIA_BUS_FMT_RGB888_2X12_LE:
 	case MEDIA_BUS_FMT_RGB888_2X12_BE:
+	case MEDIA_BUS_FMT_RGB101010_1X30:
 	case MEDIA_BUS_FMT_YUYV8_1X16:
+	case MEDIA_BUS_FMT_YUYV10_1X20:
+	case MEDIA_BUS_FMT_YUYV12_1X24:
 		return MTK_DPI_OUT_CHANNEL_SWAP_RGB;
+	case MEDIA_BUS_FMT_BGR888_1X24:
+	case MEDIA_BUS_FMT_YUV8_1X24:
+	case MEDIA_BUS_FMT_YUV10_1X30:
+		return MTK_DPI_OUT_CHANNEL_SWAP_BGR;
 	}
 }
 
@@ -767,11 +789,18 @@ static unsigned int mtk_dpi_bus_fmt_color_format(unsigned int out_bus_format)
 	switch (out_bus_format) {
 	default:
 	case MEDIA_BUS_FMT_RGB888_1X24:
+	case MEDIA_BUS_FMT_BGR888_1X24:
 	case MEDIA_BUS_FMT_RGB888_2X12_LE:
 	case MEDIA_BUS_FMT_RGB888_2X12_BE:
+	case MEDIA_BUS_FMT_RGB101010_1X30:
 		return MTK_DPI_COLOR_FORMAT_RGB;
 	case MEDIA_BUS_FMT_YUYV8_1X16:
+	case MEDIA_BUS_FMT_YUYV10_1X20:
+	case MEDIA_BUS_FMT_YUYV12_1X24:
 		return MTK_DPI_COLOR_FORMAT_YCBCR_422;
+	case MEDIA_BUS_FMT_YUV8_1X24:
+	case MEDIA_BUS_FMT_YUV10_1X30:
+		return MTK_DPI_COLOR_FORMAT_YCBCR_444;
 	}
 }
 
-- 
2.49.0


