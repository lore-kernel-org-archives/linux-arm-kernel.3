Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1B9EF41811
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 16:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nlW4NRBWOZlJOHJnTE96CCTR1fMHrijQB2o4SgIHTFw=; b=tlPIZh1TqHldo2Wqy/Iw0o9u1s
	6FzW1wKeDixS4Or9ChmowhlACG9Ba6IGKirwR8Ber5evJjyI+imZLoBJ8tm9vBvQ6IZOYmoPBIfU7
	3zdwukRH4ZY3XRcWJnuWRuqbD+My+6dgllu3chsnikjs5uHieL0yM1UVpQJia5DxVAKFzuEiAQ6Tz
	tCEd2xz8aGcTVpReAbame2pTzCltn9B5CuluG4/BCJHxn0tPdo4n8Imj86+X571PFnMtYcyqxPhg0
	+BL1aKVSQPowCvhrOOpUeUBnngkTCWG8qSPgmph0w1NNO4ipVHKFnUIv083y6aujryvNvh5Qu3UyK
	i/YXTepg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzduT-00000007lzH-30op;
	Mon, 09 Mar 2026 16:56:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzduR-00000007lyv-1dFW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 16:56:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 77FE3434F6;
	Mon,  9 Mar 2026 16:56:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35EBCC4CEF7;
	Mon,  9 Mar 2026 16:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773075406;
	bh=sQcxHQ4I4ZLAaDXAbllvvwrUduN3PDwYexQoUDrYufU=;
	h=From:To:Cc:Subject:Date:From;
	b=WsuyxrF3fepv4Rxy+E8SdmdaopavU7qN0J28/P7/9PVrbcUGvBDaIfTvB+thcM01s
	 08wOb7tHBBfA2c9HYwtQujVv2nhn5es0MlcT8Gk4FeMfFFtGiERjVHI6LoKcvCxWkZ
	 fQqmD6xfLQmukweMO5s++aRWNXF7OzROlN+d7pQktBMhZaBh+hT0bhUy8ek0/jeq6+
	 XQ2eYjoa7ZzP7TBPMBMAaVhxHOJ9HTHSZTQkOX3z8+Z7B14GwunW4eofSMEp66lSRe
	 hC1jm8UrBVJVrtpwVdqXFiBiaN9o8MWemeUUTSwxnPQq4KjnHtajOmBEMl0fps/fyf
	 YSJrEQ9WRS+Cw==
Received: by wens.tw (Postfix, from userid 1000)
	id 04B8A5FD80; Tue, 10 Mar 2026 00:56:42 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	linux-sunxi@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/sun4i: layers: Use drm_fb_dma_get_gem_addr() to get display memory
Date: Tue, 10 Mar 2026 00:56:33 +0800
Message-ID: <20260309165635.1138413-1-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_095647_487300_FF05EBAD 
X-CRM114-Status: GOOD (  15.78  )
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

Commit 4636ce93d5b2 ("drm/fb-cma-helper: Add drm_fb_cma_get_gem_addr()")
adds a new helper, which covers fetching a drm_framebuffer's GEM object
and calculating the buffer address for a given plane.

This patch uses this helper to replace our own open coded version of the
same function.

Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 16 ++-------------
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 27 ++------------------------
 2 files changed, 4 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index f08f6da55dd0..72c92203ae63 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -124,25 +124,13 @@ static void sun8i_ui_layer_update_buffer(struct sun8i_layer *layer,
 {
 	struct drm_plane_state *state = plane->state;
 	struct drm_framebuffer *fb = state->fb;
-	struct drm_gem_dma_object *gem;
 	dma_addr_t dma_addr;
 	u32 ch_base;
-	int bpp;
 
 	ch_base = sun8i_channel_base(layer);
 
-	/* Get the physical address of the buffer in memory */
-	gem = drm_fb_dma_get_gem_obj(fb, 0);
-
-	DRM_DEBUG_DRIVER("Using GEM @ %pad\n", &gem->dma_addr);
-
-	/* Compute the start of the displayed memory */
-	bpp = fb->format->cpp[0];
-	dma_addr = gem->dma_addr + fb->offsets[0];
-
-	/* Fixup framebuffer address for src coordinates */
-	dma_addr += (state->src.x1 >> 16) * bpp;
-	dma_addr += (state->src.y1 >> 16) * fb->pitches[0];
+	/* Get the start of the displayed memory */
+	dma_addr = drm_fb_dma_get_gem_addr(fb, state, 0);
 
 	/* Set the line width */
 	DRM_DEBUG_DRIVER("Layer line width: %d bytes\n", fb->pitches[0]);
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index ca3ab59e108d..cd8d6c2da0c7 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -197,38 +197,15 @@ static void sun8i_vi_layer_update_buffer(struct sun8i_layer *layer,
 	struct drm_plane_state *state = plane->state;
 	struct drm_framebuffer *fb = state->fb;
 	const struct drm_format_info *format = fb->format;
-	struct drm_gem_dma_object *gem;
-	u32 dx, dy, src_x, src_y;
 	dma_addr_t dma_addr;
 	u32 ch_base;
 	int i;
 
 	ch_base = sun8i_channel_base(layer);
 
-	/* Adjust x and y to be dividable by subsampling factor */
-	src_x = (state->src.x1 >> 16) & ~(format->hsub - 1);
-	src_y = (state->src.y1 >> 16) & ~(format->vsub - 1);
-
 	for (i = 0; i < format->num_planes; i++) {
-		/* Get the physical address of the buffer in memory */
-		gem = drm_fb_dma_get_gem_obj(fb, i);
-
-		DRM_DEBUG_DRIVER("Using GEM @ %pad\n", &gem->dma_addr);
-
-		/* Compute the start of the displayed memory */
-		dma_addr = gem->dma_addr + fb->offsets[i];
-
-		dx = src_x;
-		dy = src_y;
-
-		if (i > 0) {
-			dx /= format->hsub;
-			dy /= format->vsub;
-		}
-
-		/* Fixup framebuffer address for src coordinates */
-		dma_addr += dx * format->cpp[i];
-		dma_addr += dy * fb->pitches[i];
+		/* Get the start of the displayed memory */
+		dma_addr = drm_fb_dma_get_gem_addr(fb, state, i);
 
 		/* Set the line width */
 		DRM_DEBUG_DRIVER("Layer %d. line width: %d bytes\n",
-- 
2.47.3


