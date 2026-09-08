Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EA4EC79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 09:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=htcWMQzzIdN2OMq/lgGMWw6WmNo5HAqJQi0+KH0X9Sk=; b=o9heGJ1nMu9mVhjdUy9q8LiEug
	IuGTC8GeUubSp1h5K9ADIWZG6no8VS0BgkuGmHzfPIWoaLy5t08Qw9qWe7WXlOYZvh8M687zdN6p1
	BC252aabV8vN4fzNcM/eJ5f1xLrS6yKsvLZoi+IQeWXALl/FMRd7+jpV8p5YANHI9HgBoPcXfX/LF
	St6yFCJttyKadPeZLNRT+WE6jSXVq1gQ0s2Z2iUNvSQFC1e6I7NOp5L1QQ3FtyVXNZy3WcgeQmiI1
	0ZXumxm5sOzipGgeGitaaxs+royAaVDf8QmCzzPpetr/7MM6lESPUs74dpcPpbhdKaFrT/3ssUlMD
	+Dq/srTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3roF-00000008W10-0Fht;
	Tue, 08 Sep 2026 09:08:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3roD-00000008W0X-2L3Z
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Sep 2026 09:08:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=htcWMQzzIdN2OMq/lgGMWw6WmNo5HAqJQi0+KH0X9Sk=; b=FKQ5EFEuWH656duoqfYXsgAFqb
	ox0aguDLahdsCWkH6sOKtNuGWm1jfakRd4mLEdrtONsoIhtp1oSODwg4RoCrRoxG5KqXvjcpdJYQ/
	vlKy6uRbHO3S2A+2XZWTPsgETQSmw0I3vkEpnrdA0tWI2IGG5wUmg9ZKE7ySfh7LVkErEkF9OPcDF
	z5xftDdb+FFGkZNyBmavGOjWTyd603rpmCbBOX2WrjjdCJ61fUdSz/nSDgqgaY0Zp+k4FkmUKcunU
	dWqTw6dXPi09wjkrRwYWjeJHwKk5l/7leB31fUB5ztz4nGs+rTZtbYrcuy5IZ0DQxNd8uVJPUZZ7r
	pnSfwmcg==;
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3ro9-0000000HASH-48Mg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 09:08:04 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-cc1cc97b84bso3319495a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 02:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788858479; x=1789463279; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=htcWMQzzIdN2OMq/lgGMWw6WmNo5HAqJQi0+KH0X9Sk=;
        b=TusXn3vTXhtb7Orw7m1ih385ssZRh1/iFeeZBXspb6fjcLQL8/VNYKGspMjH/5y6MB
         W4/osUWNrRawmKH/+JYAecz2ejfhCwE+o6ECbA2YymcfaYGXVe5625FMjXpAtzxNzAxl
         0K6Hpn2ypjS0khGFuROy80sW2vQWeVcugsPJM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788858479; x=1789463279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=htcWMQzzIdN2OMq/lgGMWw6WmNo5HAqJQi0+KH0X9Sk=;
        b=XQh8jfOqVI3zU89f2POSgbfKOiNAmNiK1SKBuPtFPw1rZiCsy5QqE4CsruKgoRspGM
         /KWRbpdgQM+7k0D12NCKUGCtnUjGnxuxl82X9NK23Dy+QJ2r8AACsYjse2NnYeFQC7jQ
         6rH+NYWvk7Xlmt8XzXysGcBWjk5NAZKjKmxzwOhDNW80IkoAn45K6ubf56zPDzpsJujg
         Ukf1NzLvdOeOGaxehDzNLSDiVZFGb8zQoQYzXO+tlfmD1BgoVMMmjzPhdwfU3/RoL0dW
         c8DpCYKTFjI1FAZjZQ0/T5nxWvZXvBC5mz10iEi8X+nd++cb7vd9UJmEUwDOJXFa42HW
         Svyg==
X-Forwarded-Encrypted: i=1; AKwUvBzPoQGk9G3VmSXabfDmsC9Ot1omHWhCKEEwCiIuS0KD+G74/EqD8iNLm2LLH6Pi+OBnm0394aCZ1AcPhibxFk4s@lists.infradead.org
X-Gm-Message-State: AFuF++m8JBmZ47h3dlXR9PoJfyt8mD+QxjYTFV9XiI2p1poHZaWiwIpE
	qfhiucf0cTEoS+8Z2WqMLZuOE7ytSY7m/6mUF2Jz97EQcskuNY5ddwFKAy4vohueBA==
X-Gm-Gg: AYBFou2Ym5k9OsyQZp3qySyQSm05tqtnxdYOz/t41Y1boEKwWiy6P+D39ls4Kchzba4
	NXf9CYi03z6yB3bttxUa1/GSKY1zyz/Ct5Zg0RvhOu54Z9wKCGq7oPCG8+0FFz/vK/HY5uTyC7G
	aQ5o9E521tDwg+O0U81vIinz/1bd5+7oa+1rD2wbCsN032WHYDJsp2lEJNu3s/KotAx2OQnrBUE
	1OueBUvyq6Xi9q6+KLqQf70wpP6o2+h/ZGNYq7ffvOR8F0/qhzJjvcLzeb+RVM5nVQ5r/Ihb7eC
	tupmU79jabln56rH5K77Z9hzXLQZwtDaILp45IotDnOB/7nUaL0vFSSRBNkcLePaMPP03SojqBV
	ew+D6KoVuGugjFSi/Ymw1eCHQivTBoA0I4/DaGYzI7t/ObzKN9iLl+QnUa76lNa2RRTrAatRNyx
	1vtUoqE3dhUqcQH1K6oiuB7dJ81kq16bPV+3zSsDbX3/ewV8//JnNCur3ARNmL3tVY4fqv9zTNp
	K+VT4Yuu2IJN8qrXSGgkPmdzOVE5mwKVDgpWCXgVrXXbPk=
X-Received: by 2002:a17:90b:2784:b0:395:4de5:1054 with SMTP id 98e67ed59e1d1-39b26272bdcmr47233218a91.16.1788858479259;
        Tue, 08 Sep 2026 02:07:59 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:e541:8c2f:4ce9:823a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b4b72f62esm19718804a91.5.2026.09.08.02.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:07:58 -0700 (PDT)
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
Subject: [PATCH 1/4] drm/fb-dma-helper: Add drm_fb_dma_get_gem_clipped_addr()
Date: Tue,  8 Sep 2026 17:07:40 +0800
Message-ID: <20260908090745.1089143-2-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
In-Reply-To: <20260908090745.1089143-1-wenst@chromium.org>
References: <20260908090745.1089143-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_100802_329973_3468F47C 
X-CRM114-Status: GOOD (  18.13  )
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
 drivers/gpu/drm/drm_fb_dma_helper.c | 63 +++++++++++++++++++++--------
 include/drm/drm_fb_dma_helper.h     |  4 ++
 2 files changed, 51 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_dma_helper.c b/drivers/gpu/drm/drm_fb_dma_helper.c
index fd71969d2fb1..a260e7cd5667 100644
--- a/drivers/gpu/drm/drm_fb_dma_helper.c
+++ b/drivers/gpu/drm/drm_fb_dma_helper.c
@@ -59,20 +59,10 @@ struct drm_gem_dma_object *drm_fb_dma_get_gem_obj(struct drm_framebuffer *fb,
 }
 EXPORT_SYMBOL_GPL(drm_fb_dma_get_gem_obj);
 
-/**
- * drm_fb_dma_get_gem_addr() - Get DMA (bus) address for framebuffer, for pixel
- * formats where values are grouped in blocks this will get you the beginning of
- * the block
- * @fb: The framebuffer
- * @state: Which state of drm plane
- * @plane: Which plane
- * Return the DMA GEM address for given framebuffer.
- *
- * This function will usually be called from the PLANE callback functions.
- */
-dma_addr_t drm_fb_dma_get_gem_addr(struct drm_framebuffer *fb,
-				   struct drm_plane_state *state,
-				   unsigned int plane)
+static dma_addr_t _drm_fb_dma_get_gem_addr(struct drm_framebuffer *fb,
+					   unsigned int plane,
+					   unsigned int x,
+					   unsigned int y)
 {
 	struct drm_gem_dma_object *obj;
 	dma_addr_t dma_addr;
@@ -96,8 +86,8 @@ dma_addr_t drm_fb_dma_get_gem_addr(struct drm_framebuffer *fb,
 		v_div = fb->format->vsub;
 	}
 
-	sample_x = (state->src_x >> 16) / h_div;
-	sample_y = (state->src_y >> 16) / v_div;
+	sample_x = x / h_div;
+	sample_y = y / v_div;
 	block_start_y = (sample_y / block_h) * block_h;
 	num_hblocks = sample_x / block_w;
 
@@ -106,8 +96,49 @@ dma_addr_t drm_fb_dma_get_gem_addr(struct drm_framebuffer *fb,
 
 	return dma_addr;
 }
+
+/**
+ * drm_fb_dma_get_gem_addr() - Get DMA (bus) address for unclipped framebuffer,
+ * for pixel formats where values are grouped in blocks this will get you the
+ * beginning of the block
+ * @fb: The framebuffer
+ * @state: Which state of drm plane
+ * @plane: Which plane
+ *
+ * This function will usually be called from the PLANE callback functions.
+ *
+ * Return: GEM DMA address for given framebuffer, unclipped.
+ */
+dma_addr_t drm_fb_dma_get_gem_addr(struct drm_framebuffer *fb,
+				   struct drm_plane_state *state,
+				   unsigned int plane)
+{
+	return _drm_fb_dma_get_gem_addr(fb, plane, state->src_x >> 16,
+					state->src_y >> 16);
+}
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
+	return _drm_fb_dma_get_gem_addr(fb, plane, state->src.x1 >> 16,
+					state->src.y1 >> 16);
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
2.55.0.979.g7e5102b832-goog


