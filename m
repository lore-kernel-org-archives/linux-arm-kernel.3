Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30ACBC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 11:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QEN3b/3xO0zc8pWAdhRzuWthyL61+YW1nx6H+BGG55A=; b=I3JVMVWds2MMJeNwEGAhW33aK1
	WBmgS8wOLsHWTxdeSTTEICqpq6L9By3Tt50dMDwn9HfsnNgfymQ//UHFuoFsB9zGp1FjoFu7/JpD5
	5l/pXezG5vJvZtZ8wSkdUdw1Zu/TmYINTYvd6Zjrvg1qaFsNlCIVIvHbskej4o+P3ZfyZMEoUiuGN
	kTRBs5EbtA0J0Q36wK+4brHgOCgH5eQyXRqZyoQFC83r210Mc1rjcD5Jka0qg/Jk1f3hrQweEhDLc
	8bwMpLDN0DULnKSDtHazJQiFOt4LWcML2w1tCistiue8sAyla+ffyyE88tBtwZkko4auFwl41BW3A
	WWjRRhwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjba8-0000000Bk9o-23wv;
	Tue, 14 Jul 2026 11:45:48 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjbZO-0000000BiuQ-2hT8;
	Tue, 14 Jul 2026 11:45:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784029500;
	bh=kkJm2vWuJij9lPLR5yyr1VRhzQ5/yqw8PVt1viShFSw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KwyUoLlW5tZC81XA5uZLX/XwG0HojQj14Ve/LvgtDSiMMtSl+U8bLMYMdS77NCX5k
	 +t4SW2X1Uz+XvccQjGUx4IDfSf0f97K7Y28+CvCSKwgbXX6rTj3vOAxKQEgXUa65sK
	 HryRAqyXFVfpZS//X1xK1+xT+Mda9hm5mq75smwS7VeGu2V8GAXPqlhfmAE6jfWkrm
	 veYKQJ1wEkXqiLKOtvFZdPmjaCJBaRJQ9ZYXs47TDf5Jxv5J8J+/JIFUtUIZf08yc1
	 H8O9ak6zsKAbc6zdlnHL4lbnZBjRuMmF8GAa6HXB++wBiiKHrOGTVKRLihGUuI3TGy
	 Wf7mXNrp1BWNw==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E583C17E010F;
	Tue, 14 Jul 2026 13:44:59 +0200 (CEST)
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
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	justin.yeh@mediatek.com,
	jason-jh.lin@mediatek.com,
	kernel@collabora.com
Subject: [PATCH v2 24/46] drm/mediatek: mtk_dpi: Pass parameters with new mtk_dpi_sync structure
Date: Tue, 14 Jul 2026 13:43:52 +0200
Message-ID: <20260714114414.184512-25-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com>
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_044502_922432_6898DC91 
X-CRM114-Status: GOOD (  16.16  )
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

In preparation for moving common code between DPI and DVO into a
new mtk_dpi_common library, add a new mtk_dpi_sync structure which
contains all of the sync parameters, such as HSYNC and Left/Right
Odd and Even VSYNC.

This is now passed as parameter of mtk_dpi_set_display_mode() and
stack initialized in mtk_dpi_bridge_enable(): future preparation
changes will add abstraction for hardware specific configuration
which purpose will be to interpret the generic parameters to write
those to the hardware specific registers.

This brings no functional change.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 76 +++++++++++++++---------------
 1 file changed, 39 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 959c994eef24..f1200d5f926a 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -112,6 +112,14 @@ struct mtk_dpi_sync_param {
 	bool shift_half_line;
 };
 
+struct mtk_dpi_sync {
+	struct mtk_dpi_sync_param hsync;
+	struct mtk_dpi_sync_param vsync_l_odd;
+	struct mtk_dpi_sync_param vsync_l_even;
+	struct mtk_dpi_sync_param vsync_r_odd;
+	struct mtk_dpi_sync_param vsync_r_even;
+};
+
 struct mtk_dpi_yc_limit {
 	u16 y_top;
 	u16 y_bottom;
@@ -600,14 +608,10 @@ static void mtk_dpi_set_pixel_clk(struct mtk_dpi *dpi, struct videomode *vm, int
 }
 
 static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
+				    struct mtk_dpi_sync *sync,
 				    struct drm_display_mode *mode)
 {
 	struct mtk_dpi_polarities dpi_pol;
-	struct mtk_dpi_sync_param hsync;
-	struct mtk_dpi_sync_param vsync_lodd = { 0 };
-	struct mtk_dpi_sync_param vsync_leven = { 0 };
-	struct mtk_dpi_sync_param vsync_rodd = { 0 };
-	struct mtk_dpi_sync_param vsync_reven = { 0 };
 	struct videomode vm = { 0 };
 
 	drm_display_mode_to_videomode(mode, &vm);
@@ -624,42 +628,39 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
 
 	/*
 	 * Depending on the IP version, we may output a different amount of
-	 * pixels for each iteration: divide the clock by this number and
-	 * adjust the display porches accordingly.
+	 * pixels for each iteration: adjust the display porches accordingly.
 	 */
-	hsync.sync_width = vm.hsync_len / dpi->conf->pixels_per_iter;
-	hsync.back_porch = vm.hback_porch / dpi->conf->pixels_per_iter;
-	hsync.front_porch = vm.hfront_porch / dpi->conf->pixels_per_iter;
-
-	hsync.shift_half_line = false;
-	vsync_lodd.sync_width = vm.vsync_len;
-	vsync_lodd.back_porch = vm.vback_porch;
-	vsync_lodd.front_porch = vm.vfront_porch;
-	vsync_lodd.shift_half_line = false;
-
-	if (vm.flags & DISPLAY_FLAGS_INTERLACED &&
-	    mode->flags & DRM_MODE_FLAG_3D_MASK) {
-		vsync_leven = vsync_lodd;
-		vsync_rodd = vsync_lodd;
-		vsync_reven = vsync_lodd;
-		vsync_leven.shift_half_line = true;
-		vsync_reven.shift_half_line = true;
-	} else if (vm.flags & DISPLAY_FLAGS_INTERLACED &&
-		   !(mode->flags & DRM_MODE_FLAG_3D_MASK)) {
-		vsync_leven = vsync_lodd;
-		vsync_leven.shift_half_line = true;
-	} else if (!(vm.flags & DISPLAY_FLAGS_INTERLACED) &&
-		   mode->flags & DRM_MODE_FLAG_3D_MASK) {
-		vsync_rodd = vsync_lodd;
+	sync->hsync.sync_width = vm.hsync_len / dpi->conf->pixels_per_iter;
+	sync->hsync.back_porch = vm.hback_porch / dpi->conf->pixels_per_iter;
+	sync->hsync.front_porch = vm.hfront_porch / dpi->conf->pixels_per_iter;
+	sync->hsync.shift_half_line = false;
+
+	sync->vsync_l_odd.sync_width = vm.vsync_len;
+	sync->vsync_l_odd.back_porch = vm.vback_porch;
+	sync->vsync_l_odd.front_porch = vm.vfront_porch;
+	sync->vsync_l_odd.shift_half_line = false;
+
+	if (vm.flags & DISPLAY_FLAGS_INTERLACED) {
+		sync->vsync_l_even = sync->vsync_l_odd;
+		sync->vsync_l_even.shift_half_line = true;
+
+		if (mode->flags & DRM_MODE_FLAG_3D_MASK) {
+			sync->vsync_r_odd = sync->vsync_l_odd;
+			sync->vsync_r_even = sync->vsync_l_odd;
+			sync->vsync_r_even.shift_half_line = true;
+		}
+	} else if (mode->flags & DRM_MODE_FLAG_3D_MASK) {
+		sync->vsync_r_odd = sync->vsync_l_odd;
 	}
+
 	mtk_dpi_sw_reset(dpi, true);
 	mtk_dpi_config_pol(dpi, &dpi_pol);
 
-	mtk_dpi_config_hsync(dpi, &hsync);
-	mtk_dpi_config_vsync_lodd(dpi, &vsync_lodd);
-	mtk_dpi_config_vsync_rodd(dpi, &vsync_rodd);
-	mtk_dpi_config_vsync_leven(dpi, &vsync_leven);
-	mtk_dpi_config_vsync_reven(dpi, &vsync_reven);
+	mtk_dpi_config_hsync(dpi, &sync->hsync);
+	mtk_dpi_config_vsync_lodd(dpi, &sync->vsync_l_odd);
+	mtk_dpi_config_vsync_rodd(dpi, &sync->vsync_r_odd);
+	mtk_dpi_config_vsync_leven(dpi, &sync->vsync_l_even);
+	mtk_dpi_config_vsync_reven(dpi, &sync->vsync_r_even);
 
 	mtk_dpi_config_3d(dpi, !!(mode->flags & DRM_MODE_FLAG_3D_MASK));
 	mtk_dpi_config_interface(dpi, !!(vm.flags &
@@ -863,12 +864,13 @@ static void mtk_dpi_bridge_disable(struct drm_bridge *bridge)
 static void mtk_dpi_bridge_enable(struct drm_bridge *bridge)
 {
 	struct mtk_dpi *dpi = bridge_to_dpi(bridge);
+	struct mtk_dpi_sync sync = { 0 };
 
 	if (dpi->pinctrl && dpi->pins_dpi)
 		pinctrl_select_state(dpi->pinctrl, dpi->pins_dpi);
 
 	mtk_dpi_power_on(dpi);
-	mtk_dpi_set_display_mode(dpi, &dpi->mode);
+	mtk_dpi_set_display_mode(dpi, &sync, &dpi->mode);
 	mtk_dpi_enable(dpi);
 }
 
-- 
2.54.0


