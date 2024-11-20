Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50982D63935
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 12:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6aI7zdEAJ60peh0ersl41/BjwcRuwCO1GRLPPgMOYUI=; b=ML8w5wx7G3ujs87S/ye2tz3L5l
	iy5k9QDwJudnnOfKC16GM39AB0u2vrfxx0u1h4gJ36GlffMkUiZvJexpTT/yDtGiYHz3E5zb3U+hD
	bH/oiMKcMTz9kqQkgXh7ekU6OIGJ7f1acENi2epF88hGK/pgr9IVgkeOLm/z28sN0C3VcewLoRAoy
	IjDecxHJtl0p7NoArIqSworoOzAhBYebPQ2MN9VH+8Dkwd6ECT50Mw3DBT6wa988+bon6RGW5l2iQ
	5i4y+oCPx7tXS9H9lsLGaPJZ8UhF6qMSq6LLiZXjZDWmxMT8vc/PjzNnkdluWeyfSAN5S94v3Pq+r
	TGOBVlEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDk9A-0000000FL9g-1gVV;
	Wed, 20 Nov 2024 12:49:28 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDk4b-0000000FJrM-2zft;
	Wed, 20 Nov 2024 12:44:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1732106684;
	bh=RJe8c7MYfmPTa2lD+j4Ucz0NI9LMpabKY+Q8Fh/gjSE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YHPFF9q/C0Pc365bsElM59wmOSMOCI+u6rrS2CvrPnJqTwMcE/IsOJTajV/J2NEtk
	 X3TZcZAw+y4WjzpppU1QdkTPGiE3wjElSwMpZLB5tgOHpzbqegVPiSm3jkPhtG0dk0
	 p3pLOppRKtrLkoMJ3doa4VjNsUokbbKRyhlJtetWQ7F0aGNGlqx8Gx7wBwFBp/7lTQ
	 A8QfXBnDrIYUE9Ytjv3cElwVmkO0O+nTovjn7qYBHCL3O1L496pcBamzStmjdhmQSx
	 l8L/TM59cvBY9UOW5ewYgxZ/oBSNPuCperPOZCv80zbhLSyUEl8laDCc5VWQ4obNz+
	 qKWfKZlpGWoJA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 453A317E3684;
	Wed, 20 Nov 2024 13:44:43 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	ck.hu@mediatek.com,
	jitao.shi@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v1 4/6] drm/mediatek: mtk_dpi: Move pixel clock setting flow to function
Date: Wed, 20 Nov 2024 13:44:18 +0100
Message-ID: <20241120124420.133914-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241120124420.133914-1-angelogioacchino.delregno@collabora.com>
References: <20241120124420.133914-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_044445_913968_109EA653 
X-CRM114-Status: GOOD (  13.33  )
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

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 43 +++++++++++++++++-------------
 1 file changed, 24 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 9f59ee679ce1..378b49b6bdfb 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -536,26 +536,17 @@ static unsigned int mtk_dpi_calculate_factor(struct mtk_dpi *dpi, int mode_clk)
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
@@ -565,20 +556,34 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
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
2.47.0


