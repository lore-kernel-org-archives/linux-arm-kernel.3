Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE3FDC79FAB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 09:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2nbiAaHsEOkyMIOSUPLzzSXJU25j/HCglaTjq/uSdS0=; b=LmyBExASV/cVMigeoarD6G3GZ+
	SGMSYOYCOLW6FLyZBnyHbUQb4ZP5YxcX1mLooPCw4twYFxixX+Xgf6gJy9sqtsB+OVQ1BySN/JeY1
	zSwBhukFzIwxUYzsCtJ/tMuxta8Wd/qfN4gchGk3cvTANxZRZg5PRKnZ0Vs9lEU/DvTXCfp8DEVsW
	qkCbb7ZJ87WJlpxPsjyKXGUwdSHPfXiE6GIEAiXp5wKSLhqSV8WAn1s5XIx5L5xksGdp+DeV6WbDa
	iqUl9ER9LUeMdkhTui0Mpkh1kR6Mr7tuy/CL6LWK44wVGXDO3gLjBfQ06jPffFipvVSGmeYfSLTPD
	shFCWyug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3roF-00000008W1I-0iGU;
	Tue, 08 Sep 2026 09:08:07 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3roC-00000008W08-21D2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 09:08:05 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-396ccdaea75so261178a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 02:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788858483; x=1789463283; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2nbiAaHsEOkyMIOSUPLzzSXJU25j/HCglaTjq/uSdS0=;
        b=V76Gc5SMjBEmPjL+lLg3FMW3+B8eHyunEokrbBYQaek07A/kAeC7bMgtcZPXw+137V
         +/Durjkx9MIg2dAUuOHO7qZerCtR5tZXHL4tfDxAhB+B/F93LTOKuM9BeptEvbrWtA8b
         ubskz5Z37QGycAdI3V4NamZw/SRP3jVuZ6/fo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788858483; x=1789463283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2nbiAaHsEOkyMIOSUPLzzSXJU25j/HCglaTjq/uSdS0=;
        b=saVIuQYYiChA90/mzQ1BSJSyuh9XTP7R3mm7mVv307/uu70zpqAuU5jr6GocFjJWZ/
         UbGVA0DhfsVDv093pIDPVssjTwChATgs7Qh7Tw3gJScx4b/FC5CPgR+EggFBuW8QJhOE
         pTqQxZirX4Ok4Fok1FrRJoQ9cbcIN5P5+Ng9VdHaRTK8BHnNKl9dZYnIrF1TRCCDptM2
         3B0LEypCD5jJeekaUX8vzhapkxD8dJ3neZwdAhBPoQkeB92c4Pm6miW5DfPg/270OmXS
         s1VDMcfltqsO+bTIw8bjnOCfxd4jh+rcA0PCY2dYk51O0v1P7kiyYgRjfSfiUzPYzAtq
         NevA==
X-Forwarded-Encrypted: i=1; AKwUvByNLrt4PLBkwqc4Q8RvpvNwdYf0KM7wI6PFe0nt0v2ZjjD1r4IcqKxhaNeOA7RgJxRRHnK7cfS4+SrbW6VUOrzS@lists.infradead.org
X-Gm-Message-State: AFuF++ljrRGiMsrlDNuM02kwEzcSc4tUwR9Nl0Z16MsT+UsBN8PTGxx7
	60t6+GbDt47t/fRtnEqMUNN1glSJPCs5+RtfqyxEQVCAdfcpF9TpgcHly5/J6Zu1UA==
X-Gm-Gg: AYBFou2HAINQrs3VWOvMgO4TUK0qBIzKgKcbaPJro9W0Pfag57ZNWuvMOmncmGntAkZ
	VatHBWk89OMdllXYLwyWML6PozjYNvehrML3//mn55vz1t6eT6akA/eFKa3V0v7UExKk5e9DDaX
	9AkNaMZtxLT8nPwXVfNGU89oURkwQPUaD2R5okxHDgSpSTA2oMQcSnGcw34Eof/AyW04b8DYN5T
	zBNUC1Hc6Lc1TKfrwV0uAzjIb/7jmlZFhgFqeB2kSx8SvhINzv1s7vjrPRcVxRry4ZRiZf0Qut8
	eyPWu4iaK9ZEyk3i2mCKhf9oA9D46/5Ycou2DboZdwXHw/dhRfzdSivC9zrgWPxzQGAiiclZHmn
	ZsWyX++XFtbH4+N6olGT5LQ9MPYFdiQeMnPOWQ7hDvr+TErl4NCl8L/KJ4LRXXiRbSjn+MwWGYi
	mtbYLtkrUd9oDG7J0rzZmInwHUsm3nruvN7BOzpVsymMiOsBGzFhyubU2KhtwutjtRgNlW0qSAq
	nOepZeWfc20D5PH3bRIA1oVLICVtoDKtEqho+s5lRFgq1U=
X-Received: by 2002:a17:90a:d010:b0:38f:de94:bf34 with SMTP id 98e67ed59e1d1-39b8be7a13dmr4691886a91.10.1788858483369;
        Tue, 08 Sep 2026 02:08:03 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:e541:8c2f:4ce9:823a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b4b72f62esm19718804a91.5.2026.09.08.02.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:08:02 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Liu Ying <victor.liu@nxp.com>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-sunxi@lists.linux.dev,
	imx@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 2/4] drm/sun4i: layers: Fix VI buffer address for clipped offsets
Date: Tue,  8 Sep 2026 17:07:41 +0800
Message-ID: <20260908090745.1089143-3-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
In-Reply-To: <20260908090745.1089143-1-wenst@chromium.org>
References: <20260908090745.1089143-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_020804_525267_D9E14512 
X-CRM114-Status: GOOD (  23.37  )
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

Commit 79ac1c945ab8 ("drm/sun4i: layers: Use drm_fb_dma_get_gem_addr() to
get display memory") dropped the code to calculate the framebuffer's DMA
address in favor of drm_fb_dma_get_gem_addr().

This turned out to be wrong in a couple ways. The hardware is programmed
with clipped dimensions, so it needs the buffer address to start at the
clipped boundary. Moving to the helper negated the clipping. Also, when
clipping on the left, the buffer address needs to start at the first
pixel in the sub-sampling group even for the luma plane. The hardware
handles the interpolation internally.

Switch to the new drm_fb_dma_get_gem_clipped_addr(), which provides the
buffer address starting at the clipped boundary. Calculate the intra-group
offset and adjust the luma plane buffer address so that it points to the
start of the sub-sampling group.

Fixes: 79ac1c945ab8 ("drm/sun4i: layers: Use drm_fb_dma_get_gem_addr() to get display memory")
Cc: <stable@vger.kernel.org> # v7.1+, needs drm_fb_dma_get_gem_clipped_addr()
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
This is an alternative to Jernej's original revert:
https://lore.kernel.org/all/3980ea1aeb3f7fe8b4700e36560deeba3d050664.1785772659.git.jernej.skrabec@gmail.com/
---
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c |  2 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 16 +++++++++++++++-
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index bad102134726..530efae7e13c 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -130,7 +130,7 @@ static void sun8i_ui_layer_update_buffer(struct sun8i_layer *layer,
 	ch_base = sun8i_channel_base(layer);
 
 	/* Get the start of the displayed memory */
-	dma_addr = drm_fb_dma_get_gem_addr(fb, state, 0);
+	dma_addr = drm_fb_dma_get_gem_clipped_addr(fb, state, 0);
 
 	/* Set the line width */
 	DRM_DEBUG_DRIVER("Layer line width: %d bytes\n", fb->pitches[0]);
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 2e9cda45c04e..7a1d5f1db037 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -205,7 +205,21 @@ static void sun8i_vi_layer_update_buffer(struct sun8i_layer *layer,
 
 	for (i = 0; i < format->num_planes; i++) {
 		/* Get the start of the displayed memory */
-		dma_addr = drm_fb_dma_get_gem_addr(fb, state, i);
+		dma_addr = drm_fb_dma_get_gem_clipped_addr(fb, state, i);
+
+		/*
+		 * The mixer can handle odd offsets into sub-sampled YUV
+		 * planes, but needs the address of the first pixel in each
+		 * sub-sampled block. Adjust the luma buffer address backwards.
+		 */
+		if (i == 0) {
+			u32 x_diff, y_diff;
+
+			x_diff = (state->src.x1 >> 16) & (format->hsub - 1);
+			y_diff = (state->src.y1 >> 16) & (format->vsub - 1);
+			dma_addr -= y_diff * fb->pitches[i];
+			dma_addr -= x_diff * format->cpp[i];
+		}
 
 		/* Set the line width */
 		DRM_DEBUG_DRIVER("Layer %d. line width: %d bytes\n",
-- 
2.55.0.979.g7e5102b832-goog


