Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4626C88E7F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 03:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tuWaqYdx3lVj9cpjPj9FHjq5qpjsbWLYsj0P75i5UJE=; b=A2Acd89b0GHrNc8cnA/y39KfVa
	PQQRQICuJg5htbls9SkNj8jvDSpyss1c717EwGBC/7vIbIbTtnFcP6rtrfLvOkI9HsOx53XtlJ8NG
	YMlriCSCk8aqWlyxHOA051DjUaQBUowiC4zhCJbaEawuXsIDeHRvy2FlOpyukH/WnFir+poKtdXPN
	GYngyRV0gdPGklTXCKtbz3cySuhS9Y3wf9cAK37k5kH8sAhqXoaBqXeGPtVVMWf+oMNffi7XmQSyC
	WZZyQIZJUPMTLKHgxI6ayaTl4DFDMhvJxehFzt4DJH1Ggsy8EF/KQxgbpnY+7mHfqZLIh8KjgtEV+
	vgM302ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6gPE-00000008FOK-0cWh;
	Wed, 16 Sep 2026 03:33:56 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6gP4-00000008FKe-01YH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 03:33:47 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-396ccd4f99cso460301a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 20:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789529625; x=1790134425; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tuWaqYdx3lVj9cpjPj9FHjq5qpjsbWLYsj0P75i5UJE=;
        b=TpJy7F6JBqSi4GplAfImrq97meZF4cJfoQwmf9TYO2HzVgt6T+ICsLeiDMWZsh6Wzc
         vPsXkE2P5tREu4ton9VTi5uuEdkFJf5l7M7G0+u1Q1l/z5eLyHZG4VB02dr9GyzKjyXs
         nnFzaOrv4U0UZNJTgmTDh8aJf9LnhFf5gLmyQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789529625; x=1790134425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tuWaqYdx3lVj9cpjPj9FHjq5qpjsbWLYsj0P75i5UJE=;
        b=wv6ay89aoabGOfjEycQBOzGg/4BpbD9R6cxygP4a9FeqluaW1W2BC0kYhR/vfXu88e
         cXodb610Jl4arVJGV5tihZxsIl2cB6L7e+V35ScBdF8h5xYFnag2qD+tSXaCVw9Zu2TO
         +VEbKSyM0/Ki0qAQtT1AfETU2q/IJ2l38HT14BDSBmMZs7ZluWzzwuJ5PCnHBTMx9s7+
         2bZCEAf7YeuvSac/lILN6u59mJzjTo0LyqUhcrGm/xB5xE6klU3tWIgi2LlXxhs85t+J
         dXPUmBnU1hFdh9HhUTN1KgISiLdm3LtbFDXLLGZH0YwMWwF6mdU//7tRA/If3pb2VJFo
         KZFw==
X-Forwarded-Encrypted: i=1; AKwUvBwM2XqZDQSHTzMaVjCGC/+r+41KH2QcGg0od72IEWa/nMuZ6B0JR+Xb/LaCZ/pxR1m4jB13TXKbcw2DuVGXUY01@lists.infradead.org
X-Gm-Message-State: AFuF++kM7kalVBwZ1o4aq6lCDyb6LLNhl8NaDsoy9Vb9dnmUoIfBo54f
	wJSsenPSu18UYrNbwo50tjsIS9t/9wmy3H7PEDYyNSPXxig54YkGiCvg0Nrc4PXsKQ==
X-Gm-Gg: AYBFou2SBhFC8RZnT+Pie+MhrRBFW0myPL5oOBdrWcUpFfvgmC3fwDge9RYXWU50lKV
	E2l4dayhDv/Qbg21ueHkTfb+6nuUqInJ40INMvsUjf6+PNyzYBqKISOxl33prjFV60SV5PY1wTe
	wRs9B98GsqAxtqd0bX+exaKVwv/sUZyweOMkfoiz53xACdEcd4b7kUlDB0ZbgM8oPS5mASJ5hQN
	auSrhiXdeoJ5y06yZ5jh6Hz8rzBv2zWgIr+z2vJOZCSNIFVY3iXDRonCsudAXGILQh3bFOX85g3
	xuHgDFx39NEwXfNW4BX/+3Z+ifSN+zxAj+2V4ypE7+uu/iyVWC8LqbvTafYgWwUzseQTe1sIXhh
	8CvLemNwx0CCy9b4pTrl+FMI4P5R1/UmznUy1yvxh341z26JnpUYh+QaWANkZgjmsi5lAFGcddY
	+ftgzjWD8EPXM0WbCylBCgVIZmXDx0xbnucynqYor4ZJfZpY9axDH3IodcaHy0e3TLqLSnzB2NI
	Q3zmEvVT6uYfMqwvhseA8pvQJjjTG3TQ7hwy4GdCBcObcttMuH82iqZIQ==
X-Received: by 2002:a17:90b:2604:b0:39d:f114:8f7d with SMTP id 98e67ed59e1d1-39e1e27ad34mr2355684a91.3.1789529625104;
        Tue, 15 Sep 2026 20:33:45 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:1f62:7622:5d61:2578])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1bbe3e62sm1833477a91.10.2026.09.15.20.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 20:33:44 -0700 (PDT)
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
Subject: [PATCH RFT v2 2/5] drm/fb-dma-helper: Add drm_fb_dma_get_gem_clipped_addr()
Date: Wed, 16 Sep 2026 11:33:23 +0800
Message-ID: <20260916033327.3054126-3-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
In-Reply-To: <20260916033327.3054126-1-wenst@chromium.org>
References: <20260916033327.3054126-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_203346_061031_11D006AA 
X-CRM114-Status: GOOD (  17.96  )
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

drm_fb_dma_get_gem_addr() returns the DMA address to the "unclipped"
framebuffer. However some display drivers want the "clipped" framebuffer
instead, as they are also using the clipped coordinates to program the
hardware.

Some of these drivers are open-coding drm_fb_dma_get_gem_addr() with
the source coordinates replaced, while others have been incorrectly
converted to using drm_fb_dma_get_gem_addr(), which would end up
causing incorrect parts of the framebuffer to be displayed if it were
somehow clipped.

Add drm_fb_dma_get_gem_clipped_addr(), a "clipped" version of
drm_fb_dma_get_gem_addr() for these drivers to use.

Cc: <stable@vger.kernel.org> # dependency for next patch
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Use new drm_framebuffer_get_block_offset() helper
---
 drivers/gpu/drm/drm_fb_dma_helper.c | 37 +++++++++++++++++++++++++----
 include/drm/drm_fb_dma_helper.h     |  4 ++++
 2 files changed, 37 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_dma_helper.c b/drivers/gpu/drm/drm_fb_dma_helper.c
index ab0f37d8a5ff..0aaf4926db4e 100644
--- a/drivers/gpu/drm/drm_fb_dma_helper.c
+++ b/drivers/gpu/drm/drm_fb_dma_helper.c
@@ -60,15 +60,16 @@ struct drm_gem_dma_object *drm_fb_dma_get_gem_obj(struct drm_framebuffer *fb,
 EXPORT_SYMBOL_GPL(drm_fb_dma_get_gem_obj);
 
 /**
- * drm_fb_dma_get_gem_addr() - Get DMA (bus) address for framebuffer, for pixel
- * formats where values are grouped in blocks this will get you the beginning of
- * the block
+ * drm_fb_dma_get_gem_addr() - Get DMA (bus) address for unclipped framebuffer,
+ * for pixel formats where values are grouped in blocks this will get you the
+ * beginning of the block
  * @fb: The framebuffer
  * @state: Which state of drm plane
  * @plane: Which plane
- * Return the DMA GEM address for given framebuffer.
  *
  * This function will usually be called from the PLANE callback functions.
+ *
+ * Return: GEM DMA address for given framebuffer, unclipped.
  */
 dma_addr_t drm_fb_dma_get_gem_addr(struct drm_framebuffer *fb,
 				   struct drm_plane_state *state,
@@ -86,6 +87,34 @@ dma_addr_t drm_fb_dma_get_gem_addr(struct drm_framebuffer *fb,
 }
 EXPORT_SYMBOL_GPL(drm_fb_dma_get_gem_addr);
 
+/**
+ * drm_fb_dma_get_gem_clipped_addr() - Get DMA (bus) address for clipped
+ * framebuffer, for pixel formats where values are grouped in blocks this
+ * will get you the beginning of the block
+ * @fb: The framebuffer
+ * @state: Which state of drm plane
+ * @plane: Which plane
+ *
+ * This function will usually be called from the PLANE callback functions.
+ *
+ * Return: GEM DMA address for given framebuffer, clipped.
+ */
+dma_addr_t drm_fb_dma_get_gem_clipped_addr(struct drm_framebuffer *fb,
+					   struct drm_plane_state *state,
+					   unsigned int plane)
+{
+	struct drm_gem_dma_object *obj;
+
+	obj = drm_fb_dma_get_gem_obj(fb, plane);
+	if (!obj)
+		return 0;
+
+	return obj->dma_addr + drm_framebuffer_get_block_offset(fb, plane,
+								state->src.x1 >> 16,
+								state->src.y1 >> 16);
+}
+EXPORT_SYMBOL_GPL(drm_fb_dma_get_gem_clipped_addr);
+
 /**
  * drm_fb_dma_sync_non_coherent - Sync GEM object to non-coherent backing
  *	memory
diff --git a/include/drm/drm_fb_dma_helper.h b/include/drm/drm_fb_dma_helper.h
index c950732c6d36..b2a0bd7ef9d0 100644
--- a/include/drm/drm_fb_dma_helper.h
+++ b/include/drm/drm_fb_dma_helper.h
@@ -17,6 +17,10 @@ dma_addr_t drm_fb_dma_get_gem_addr(struct drm_framebuffer *fb,
 				   struct drm_plane_state *state,
 				   unsigned int plane);
 
+dma_addr_t drm_fb_dma_get_gem_clipped_addr(struct drm_framebuffer *fb,
+					   struct drm_plane_state *state,
+					   unsigned int plane);
+
 void drm_fb_dma_sync_non_coherent(struct drm_device *drm,
 				  struct drm_plane_state *old_state,
 				  struct drm_plane_state *state);
-- 
2.55.0.1032.g73a4cd73de-goog


