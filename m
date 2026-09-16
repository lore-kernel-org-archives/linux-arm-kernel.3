Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FA0BC88E7F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 03:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kBFRPVKNIBD0KQtZ9pcxiREtmRb8PGXwbQL+UCfrWrI=; b=meIhn7jx+jdO5hTiwbAMs0lHdP
	v3u4/d2n59+PtXdWaXDP3fHJWgvCfLpgTW3A/icgGvSANOAfL/dPEzuU9mBF62F05FAbgTgJQ/R/v
	ibqar+9Ed538AZD2PVwEdyRdRaQ35Vm8SUpxDyWC8FQ5G0S5rVj73hjtFX0thWCSSEtY1VJ6uFFm2
	qW29CH4RZUz4tigRWLBL0Eih/vwX14g1aDesZ9X6YBQTWhzLmeErIuIk6+j0bG2XnsDWEvzU3AaFy
	1TDsvVJ6JnX3eQuiGAXsOsDwMPxI/BSB45Fo8wPRXpvA4IIruijpIa90UOb6EeesbXRFdJnxRA/8Z
	snYw4S+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6gPS-00000008FWE-0He6;
	Wed, 16 Sep 2026 03:34:10 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6gPF-00000008FPg-3O70
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 03:33:59 +0000
Received: by mail-pj2-x11.google.com with SMTP id d9443c01a7336-2d747f0b25dso4477405ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 20:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789529637; x=1790134437; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kBFRPVKNIBD0KQtZ9pcxiREtmRb8PGXwbQL+UCfrWrI=;
        b=Dc9/l3EldwvSlMOLYdcb8Ds81Ha4fDRhheh43zxdLumo2+bDCvcW/vi/35qzDQlH8P
         dBAylBVSI/m5pNgW2xxfznABkdypfwBW55TyXc2W2SkE+OlPwOYS+/E1yGKYa/vqxQBE
         cWRR/2VunJBNP7/SNgxfoRzcBzwsupRx8nefU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789529637; x=1790134437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kBFRPVKNIBD0KQtZ9pcxiREtmRb8PGXwbQL+UCfrWrI=;
        b=NgCoX/tEzpGM45s1tyGEAgdTRMj5iOh8EHkygYyPUSHtW/MsPNiwoi7XPTWCS7qkWM
         5iZ121v2fQuX7+UzrWNL5Cl6HJk78Pf4NgWJFf0pi/eQ1BH3YoLm4or8u2CdG5N0XbDv
         m6voTbdliE4PdjN6c8y8rrZMRe2U0OACWrVBW6I294jBo1E4Y6q6uj1EslqHxbejWnsm
         TFpERTGJ7RZdeAxjh1hWld9bHwdOec/UOOkDKkK7iGAg2M9iRZ55SsnVskc2+1TJnN8b
         hCexi57TmTJO/unTjQ19F3iBw2ZDFHLzS5YwJ5z2ZPRUP5wmVdZ+2UTzEOuZUIW99BB+
         2c+g==
X-Forwarded-Encrypted: i=1; AKwUvBxwR1+lLSW5iuw2mmNn2Y9H9Fe2FY3NINfZsQPdC96mSFP2OvXzmHm71UgfXTvbBC1u3OZxXuoBQopRxnDidHj/@lists.infradead.org
X-Gm-Message-State: AFuF++kuwoZhF4fV1WO0Cnnex0ZlGLwbS6wS9s6YFQmVaEXRhlhfs6Zv
	XrcJ8HCZrxVskNppe1IX5msfCumTGIirKNPpIaQcSUcJ2Z6xDjW2//BQZaaG4ajyLQ==
X-Gm-Gg: AYBFou1P0b03KVy4VITk+v7HeJyvkNlboXocHc22bdo1Brl/lnXpeM0sAKH6RnhnEnp
	XgoFH1fwkTlEC6UnQCehERAkBG/o2uOlCIZEQITlyTz9ab8Ql25oQ40GggqvVj1U4a8zMi/9B9O
	UHvHfpR1FtUw0kKBAk5cEC/FKF5okEMlK9AZbDI0xYf0Mo/pcAo8xXyUeFhQ7MaU0qwJyoLYe/u
	ug4nBsudZ4cNumjnQq1wCRKKIqX2faw288JIu5Og59/krai/HyIxPT7QQ0fQPjWjkg4fJK+A8Db
	qOFRXd1Jht7U8O8mXFxmqjg/HnJlomlrCcchiYN38xqJEte/ZRr7ah79BG9OwjM9IR/zv6kFqIe
	5TjRG1WFbYTxAp8kWD+GZbN4XYPvaU+32MgGvzZ2nZ6aMCJzDfs9OHu6j8vsy69whJ3lZYrpec3
	bljSBQU+xXl/nLYliDR49Wq4zIvZFao8eP6PoorJP5/MX4YACELaCs1O3TiUHCzrauPiuTD1GcM
	H/b5SHJ5feuyhCPb413wmjcxqotMH5ZjpHo8E6IkMxJKpC7mp7HXH4fAA==
X-Received: by 2002:a17:90b:4c49:b0:39d:fd60:caba with SMTP id 98e67ed59e1d1-39e1e485dddmr2368694a91.14.1789529637188;
        Tue, 15 Sep 2026 20:33:57 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:1f62:7622:5d61:2578])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1bbe3e62sm1833477a91.10.2026.09.15.20.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 20:33:56 -0700 (PDT)
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
	linux-kernel@vger.kernel.org
Subject: [PATCH RFT v2 5/5] drm/imx/dcss: plane: Switch to drm_fb_dma_get_gem_clipped_addr()
Date: Wed, 16 Sep 2026 11:33:26 +0800
Message-ID: <20260916033327.3054126-6-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
In-Reply-To: <20260916033327.3054126-1-wenst@chromium.org>
References: <20260916033327.3054126-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_203357_853263_432790F1 
X-CRM114-Status: GOOD (  17.74  )
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

The i.MX DCSS driver is open coding drm_fb_dma_get_gem_clipped_addr(),
with only a slight difference of rounding down the X offset for the
first plane if the format is packed, sub-sampled YUV. This is likely
to correct the buffer address to the first pixel of the 2-pixel group.
Otherwise the hardware will start the scan-out from the second pixel,
which leads to the U/V components getting swapped around, and the
chroma component of the next pixel group being used.

Switch to drm_fb_dma_get_gem_clipped_addr(), and offset the address by
a pixel if the X offset is odd.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/gpu/drm/imx/dcss/dcss-plane.c | 34 +++++++++++----------------
 1 file changed, 14 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/imx/dcss/dcss-plane.c b/drivers/gpu/drm/imx/dcss/dcss-plane.c
index 303e93fd036c..580d9cfb4053 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-plane.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-plane.c
@@ -219,28 +219,22 @@ static void dcss_plane_atomic_set_base(struct dcss_plane *dcss_plane)
 	struct dcss_dev *dcss = plane->dev->dev_private;
 	struct drm_framebuffer *fb = state->fb;
 	const struct drm_format_info *format = fb->format;
-	struct drm_gem_dma_object *dma_obj = drm_fb_dma_get_gem_obj(fb, 0);
 	unsigned long p1_ba = 0, p2_ba = 0;
 
-	if (!format->is_yuv ||
-	    format->format == DRM_FORMAT_NV12 ||
-	    format->format == DRM_FORMAT_NV21)
-		p1_ba = dma_obj->dma_addr + fb->offsets[0] +
-			fb->pitches[0] * (state->src.y1 >> 16) +
-			format->char_per_block[0] * (state->src.x1 >> 16);
-	else if (format->format == DRM_FORMAT_UYVY ||
-		 format->format == DRM_FORMAT_VYUY ||
-		 format->format == DRM_FORMAT_YUYV ||
-		 format->format == DRM_FORMAT_YVYU)
-		p1_ba = dma_obj->dma_addr + fb->offsets[0] +
-			fb->pitches[0] * (state->src.y1 >> 16) +
-			2 * format->char_per_block[0] * (state->src.x1 >> 17);
-
-	if (format->format == DRM_FORMAT_NV12 ||
-	    format->format == DRM_FORMAT_NV21)
-		p2_ba = dma_obj->dma_addr + fb->offsets[1] +
-			(((fb->pitches[1] >> 1) * (state->src.y1 >> 17) +
-			(state->src.x1 >> 17)) << 1);
+	p1_ba = drm_fb_dma_get_gem_clipped_addr(fb, state, 0);
+
+	/*
+	 * TODO fix address until helpers know packed, sub-sampled YUV format block size
+	 *
+	 * The buffer address for packed, sub-sampled YUV formats such as DRM_FORMAT_UYVY
+	 * need to be on the first pixel of each pixel group or block. Otherwise the first
+	 * pixel of the next pixel group is read and the U/V values get swapped around.
+	 */
+	if (drm_format_info_is_yuv_packed(format))
+		p1_ba -= ((state->src.x1 >> 16) & 1) * format->cpp[0];
+
+	if (format->num_planes > 1)
+		p2_ba = drm_fb_dma_get_gem_clipped_addr(fb, state, 1);
 
 	dcss_dpr_addr_set(dcss->dpr, dcss_plane->ch_num, p1_ba, p2_ba,
 			  fb->pitches[0]);
-- 
2.55.0.1032.g73a4cd73de-goog


