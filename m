Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7960C021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 16:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/TOAjVhpFs4aWTrrMIUNB/jiUYntfzbMN3yMZxdLm7k=; b=3IdscW1DomIl9HIlRUD0jl3VZO
	dz0KxQqQP9BtxzpNEdYRy1gVZBlcyTGwHj+nUWHuHb/LpMAwkwqBSskxrUmdM8mTL2+s2LL9Umf8D
	0eEQECmLDZ/SOyXDGqiJfjXU7xZ/ljPwtcdpyCNO7En0JrcwYrdQjqsDJu5lgbHDGBCt5iNyh4uGy
	VdtLOYDJVzKrwmqT+BXlG0j9hQzdYcp6hwomD0lW+KzLSXCyPeZNB+S2EIoBS9yZI2pcADVj0YNtT
	oEmIjQDbalvS/tH+qprORFsyA3stFmgZTH8LKKHbYHwkWIUgUHJDxjdnUcZvcw98jUJ0Qgz1iosoC
	G41e0hLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk3wp-00000005Fn2-10u1;
	Mon, 17 Feb 2025 16:26:19 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk3N5-000000057zF-49Zt;
	Mon, 17 Feb 2025 15:49:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739807362;
	bh=I77jDF1ziftcZjTwI5+7zt4jFbJECEtb5AHTmKIo4OM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UcXQ+uPnyz3eAORUhEshbrer6uDfF/1bXH6ybczx4K+lG5kANhJqt3idZkrHLKszL
	 yrANT5ejOBtF/LhV9l2MRvqpI+KP2bUyxzTOHBbNa81wCiEi+vKz5ZXeSGycm/Cf8D
	 bSHss8WGIsCPwAs47VFKxbVTd1cOcXesus0hJ2J2m0aNwHtvr/9VEQK9hrSIXUcrf9
	 G65QaukbfjqMXkbBj3SVdNTtI0s5paaJI5OlFr6LBj2wz92vUQ8/0Yo/wNssTO9uEM
	 OHnhp3mSPYiQu+07GoPDALR2Y5MvNdG/0GSTA66RMz73LfqIPGPNJEgVocBm9PJNir
	 BTNmoXrTciwWw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4BE7C17E154C;
	Mon, 17 Feb 2025 16:49:21 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	ck.hu@mediatek.com,
	jitao.shi@mediatek.com,
	jie.qiu@mediatek.com,
	junzhi.zhao@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	dmitry.baryshkov@linaro.org,
	lewis.liao@mediatek.com,
	ives.chenjh@mediatek.com,
	tommyyl.chen@mediatek.com,
	jason-jh.lin@mediatek.com
Subject: [PATCH v7 04/43] drm/mediatek: mtk_dpi: Move pixel clock setting flow to function
Date: Mon, 17 Feb 2025 16:47:57 +0100
Message-ID: <20250217154836.108895-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250217154836.108895-1-angelogioacchino.delregno@collabora.com>
References: <20250217154836.108895-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_074924_178974_97992762 
X-CRM114-Status: GOOD (  12.77  )
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

In preparation for adding support for the DPI IP found in MT8195
and in MT8188 used for HDMI, move the code flow for calculation
and setting of the DPI pixel clock to a separate function called
mtk_dpi_set_pixel_clk().

This was done because, on those platforms, the DPI instance that
is used for HDMI will get its pixel clock from the HDMI clock,
hence it is not necessary, nor desirable, to calculate or set
the pixel clock in DPI.

Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 43 +++++++++++++++++-------------
 1 file changed, 24 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 41fdc193891a..59c2e4f32a61 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -537,26 +537,17 @@ static unsigned int mtk_dpi_calculate_factor(struct mtk_dpi *dpi, int mode_clk)
 	return dpi_factor[dpi->conf->num_dpi_factor - 1].factor;
 }
 
-static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
-				    struct drm_display_mode *mode)
+static void mtk_dpi_set_pixel_clk(struct mtk_dpi *dpi, struct videomode *vm, int mode_clk)
 {
-	struct mtk_dpi_polarities dpi_pol;
-	struct mtk_dpi_sync_param hsync;
-	struct mtk_dpi_sync_param vsync_lodd = { 0 };
-	struct mtk_dpi_sync_param vsync_leven = { 0 };
-	struct mtk_dpi_sync_param vsync_rodd = { 0 };
-	struct mtk_dpi_sync_param vsync_reven = { 0 };
-	struct videomode vm = { 0 };
 	unsigned long pll_rate;
 	unsigned int factor;
 
 	/* let pll_rate can fix the valid range of tvdpll (1G~2GHz) */
 	factor = mtk_dpi_calculate_factor(dpi, mode_clk);
-	drm_display_mode_to_videomode(mode, &vm);
-	pll_rate = vm.pixelclock * factor;
+	pll_rate = vm->pixelclock * factor;
 
 	dev_dbg(dpi->dev, "Want PLL %lu Hz, pixel clock %lu Hz\n",
-		pll_rate, vm.pixelclock);
+		pll_rate, vm->pixelclock);
 
 	clk_set_rate(dpi->tvd_clk, pll_rate);
 	pll_rate = clk_get_rate(dpi->tvd_clk);
@@ -566,20 +557,34 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
 	 * pixels for each iteration: divide the clock by this number and
 	 * adjust the display porches accordingly.
 	 */
-	vm.pixelclock = pll_rate / factor;
-	vm.pixelclock /= dpi->conf->pixels_per_iter;
+	vm->pixelclock = pll_rate / factor;
+	vm->pixelclock /= dpi->conf->pixels_per_iter;
 
 	if ((dpi->output_fmt == MEDIA_BUS_FMT_RGB888_2X12_LE) ||
 	    (dpi->output_fmt == MEDIA_BUS_FMT_RGB888_2X12_BE))
-		clk_set_rate(dpi->pixel_clk, vm.pixelclock * 2);
+		clk_set_rate(dpi->pixel_clk, vm->pixelclock * 2);
 	else
-		clk_set_rate(dpi->pixel_clk, vm.pixelclock);
+		clk_set_rate(dpi->pixel_clk, vm->pixelclock);
 
-
-	vm.pixelclock = clk_get_rate(dpi->pixel_clk);
+	vm->pixelclock = clk_get_rate(dpi->pixel_clk);
 
 	dev_dbg(dpi->dev, "Got  PLL %lu Hz, pixel clock %lu Hz\n",
-		pll_rate, vm.pixelclock);
+		pll_rate, vm->pixelclock);
+}
+
+static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
+				    struct drm_display_mode *mode)
+{
+	struct mtk_dpi_polarities dpi_pol;
+	struct mtk_dpi_sync_param hsync;
+	struct mtk_dpi_sync_param vsync_lodd = { 0 };
+	struct mtk_dpi_sync_param vsync_leven = { 0 };
+	struct mtk_dpi_sync_param vsync_rodd = { 0 };
+	struct mtk_dpi_sync_param vsync_reven = { 0 };
+	struct videomode vm = { 0 };
+
+	drm_display_mode_to_videomode(mode, &vm);
+	mtk_dpi_set_pixel_clk(dpi, &vm, mode->clock);
 
 	dpi_pol.ck_pol = MTK_DPI_POLARITY_FALLING;
 	dpi_pol.de_pol = MTK_DPI_POLARITY_RISING;
-- 
2.48.1


