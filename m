Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D31BC369A1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 13:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5zZHcgrxblYBO1LZIVR1v1lilwDhlEpuQm9A9UNmlEQ=; b=c0+saipMcr8A/2pLRmNKi3Dnwz
	VmXBDu7xj54G48O+f7/utPRp1UWJYxeFTh1kdpvWM6Be/CPx9kMpS9OO4ARx2WGEs6cjVaakRNdqk
	AChhmqAB9T2gzFSNN66rerSZhx0Tu1m6n5xlzav+n+O9R+JKw6w9H6gsRhPJHXd7y1UzS5TED7TR7
	m1gKZFPjUlPVFm6gHMlFZXl6tQy6eRU3PrHuIRkwTV+1yX2GYq404+CBcXzWyrG8lArF73BpDTBVt
	hIWdtaHttjv+0138ba2xeeiotLHaNTUEcK38VYkJK0rPjf8QcJoa6EgQekrI/gJBvmbWo8rmJY0UW
	DKUrPlAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2VGl-00000007FuI-2oNA;
	Wed, 09 Apr 2025 13:15:07 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2VEx-00000007F1S-3dOO;
	Wed, 09 Apr 2025 13:13:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744204393;
	bh=gv/6AiDijBd6gkSOSp+4FGoCW0Yre06suda1+c6HY/0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e50j5eX2hKm9wWpetsGKUlhD+hBnvlEGRbi63E9U+64jKCA68ogjnsPuyo0TWIzpC
	 5B7+EcQi83k5bVSP0I0M771pFyTcNjIyz9Qw6KrH4/NbCjdonXTiZ1eVJzsnfjllL1
	 byG4nUrVhnVhy5ynpOnGiBoIx830ruuaZzUJw4F0GVFhGSngnkFBCIcrDP4+fxyDK5
	 EufFyCXF06BIazjixQjj/W/xhNV52XlNb+y7pmqceWm400qiAPbFqKKZ1EAMPXEgmk
	 LAY0kef2QNNWRJIMpMTIzy093FYTpXgNOPE5w2xqr3bsz9ZakQM9nDsun7xjqIowp9
	 3PC+oOCANwfgw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D132E17E0809;
	Wed,  9 Apr 2025 15:13:12 +0200 (CEST)
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
Subject: [PATCH v1 1/5] drm/mediatek: mtk_dpi: Use switch in mtk_dpi_config_color_format()
Date: Wed,  9 Apr 2025 15:13:02 +0200
Message-ID: <20250409131306.108635-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250409131306.108635-1-angelogioacchino.delregno@collabora.com>
References: <20250409131306.108635-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_061316_056705_4372DBF3 
X-CRM114-Status: GOOD (  11.41  )
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

In preparation for adding support for an additional color format,
convert the format conditional in mtk_dpi_config_color_format()
to a switch.
This also makes the concept of RGB being the default color format
a little more human readable.

This commit brings no functional differences.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 0fd13e6dd3f1..d735398e97f8 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -452,7 +452,8 @@ static void mtk_dpi_config_color_format(struct mtk_dpi *dpi,
 {
 	mtk_dpi_config_channel_swap(dpi, MTK_DPI_OUT_CHANNEL_SWAP_RGB);
 
-	if (format == MTK_DPI_COLOR_FORMAT_YCBCR_422) {
+	switch (format) {
+	case MTK_DPI_COLOR_FORMAT_YCBCR_422:
 		mtk_dpi_config_yuv422_enable(dpi, true);
 		mtk_dpi_config_csc_enable(dpi, true);
 
@@ -463,11 +464,14 @@ static void mtk_dpi_config_color_format(struct mtk_dpi *dpi,
 		mtk_dpi_mask(dpi, DPI_MATRIX_SET, dpi->mode.hdisplay <= 720 ?
 			     MATRIX_SEL_RGB_TO_BT601 : MATRIX_SEL_RGB_TO_JPEG,
 			     INT_MATRIX_SEL_MASK);
-	} else {
+		break;
+	default:
+	case MTK_DPI_COLOR_FORMAT_RGB:
 		mtk_dpi_config_yuv422_enable(dpi, false);
 		mtk_dpi_config_csc_enable(dpi, false);
 		if (dpi->conf->swap_input_support)
 			mtk_dpi_config_swap_input(dpi, false);
+		break;
 	}
 }
 
-- 
2.49.0


