Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8FF0C982C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 03:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B3+7MkmB6aG1HjinH/gRhRGDcVk6ogklV5sjoZ/OmL4=; b=fDWHOThR4xMi/SN/Un8fnyXPjZ
	B/qyKk5Ws40BAx9t3fNjlQ90B2d7RHVmoEYuM9kIBRRcvD9FIrkvEyA+sPYM1GJbv3ibbiF9RaUQ5
	8fMA76TtjY1ZaqGiq6Y6lnTjyHxtCLmyJAw/AHope0gQciRgbUx8IHdAiJHI7qw9Ew7L78JaFpBHC
	xQiH0qwDu86BnLVthcYlRCpgAdqWs0ZAMy9JrUclOyyJpgwQvWnF1+IZ35Hp2y9+LSxIDZQrYQ92G
	3XGY2Jl8V4meE88Bulk4nOdN/Oi/smb9+myhRQLC0KIM8LpUVTrenpzUZYWpg7wKlTo53owOL3xS5
	bbeqOy0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6gPE-00000008FOb-14nk;
	Wed, 16 Sep 2026 03:33:56 +0000
Received: from mail-pz2-x0e.google.com ([2607:f8b0:4864:3b::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6gP7-00000008FMA-384t
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 03:33:51 +0000
Received: by mail-pz2-x0e.google.com with SMTP id 41be03b00d2f7-cc1cea50db3so312668a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 20:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789529629; x=1790134429; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B3+7MkmB6aG1HjinH/gRhRGDcVk6ogklV5sjoZ/OmL4=;
        b=Z0X1BV8E3PbMXkLtO7hEcujdboTWoagEMb67ED3CHBXaEhAUVnm9UISahjmM1/WQeE
         fDNJoA+aB8lTneI4uVpf3CWGvjOqdINYIzGXimAkNOnwgHJ7Sq27sKyIDlVOQph0P7M1
         R92zX4cmB1GKn5erD8QKrYrKYsoBdTTN2RdR0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789529629; x=1790134429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=B3+7MkmB6aG1HjinH/gRhRGDcVk6ogklV5sjoZ/OmL4=;
        b=Xi7onpNdNyTIWT28X9IChguvHNQd/Z0K5WNknpYbkFJwScuwN2yL2mo7/CmHBtyCTC
         CZHiIUKCrCiIEnCD02XVnHFXf/8qBVj7PwwLrVtLh3p6DlejdbV5raCdusuLXvmGzKef
         tert24lygCUFBQyYO2OU3Nc18CnemmCw8tLCpmDPCARmHgNQBhBB3ShUx7ITE4KKyGPA
         swS03vPaObocQTEZutAQgDpNWo7mRvLvcyRh5vMbeifj2jgN1wpcM+llHOxZFJ7/g+dr
         TLFDsVt+lCODOTzMO0HEU90AC0cNoALw+WVYHaLKeG1dzKdBf/4Qodxtgp6gpHLAKtRw
         tvDg==
X-Forwarded-Encrypted: i=1; AKwUvBzmfVUtnKoE4te/lB2T6ZZ5MGWxxxU4mVRPWEVFvcdiWNRzAR8bpdtyoKb1Lhe3zwL+Kt9J9W0bwnHgNanKpvHe@lists.infradead.org
X-Gm-Message-State: AFuF++m9EJrkyKkqoTsplkJ7ZwM2hUtrIcjsI2wsWRSr4EudoS1evobt
	WPl06tIVkOPbpgxeIqNjujD87pw++/XZLWRxlut29VYRuHEAgAusXhkykLqk7XVAJg==
X-Gm-Gg: AYBFou1KOYdnRBgbW8cS9hbPw8Viy8ucPLtfN37j4vNXw5RGM4FyM3UpZTZnp8Owz4R
	PGDASdmBnUQgpFQPHgYZKe08bVICY0nhl78UKkR7ZMkJAIHqkoO+UL6K/NsE5ajjwbsWGf7QnSO
	i6csuTfBwATWnr9YrAmJPFLkPYvd7OoWjLMw1xNCeefD1cCIlwEEzplM3IpKOfsbBCrvxkTV7Sc
	lonMxOCHVTvdKQTWOeYwvdN1m7XLZDXeSWa1TTQsdCZ8wjintys3vEcQrm0p5saHqTrR9zFfwmb
	m2GqN57cVwiL/XoBtCcvPOiSzuZ3yM2n4vxgcgp4xwVVfyyJ7UMX43aqN4gqgiGlTmvL2OG5sxU
	L1aRPCCNJw52b5v4nNoE6tTKlROp7JrMowI/hFDZI2m4dlopQLjzPRQPATCdY8wLcV1LwTCrID9
	HtoTrOH2/PuCEJeLDT4QmIGED9E/7Au6ipgGlXEbzmOAftgyAzV+WfNrv0UZeUIoomt9+EmW2sb
	SmDVJlwnBWqAcFfvXsPiu5ryj5F6CATzwhuSuBgoq5I93o/vV1YzNKnhw==
X-Received: by 2002:a17:90b:3b41:b0:38c:a59b:5189 with SMTP id 98e67ed59e1d1-39e1e48a416mr2215669a91.15.1789529629173;
        Tue, 15 Sep 2026 20:33:49 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:1f62:7622:5d61:2578])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1bbe3e62sm1833477a91.10.2026.09.15.20.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 20:33:48 -0700 (PDT)
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
Subject: [PATCH RFT v2 3/5] drm/sun4i: layers: Fix VI buffer address for clipped offsets
Date: Wed, 16 Sep 2026 11:33:24 +0800
Message-ID: <20260916033327.3054126-4-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
In-Reply-To: <20260916033327.3054126-1-wenst@chromium.org>
References: <20260916033327.3054126-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_203349_814219_8216F234 
X-CRM114-Status: GOOD (  22.84  )
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
2.55.0.1032.g73a4cd73de-goog


