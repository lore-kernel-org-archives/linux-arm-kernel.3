Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DE26CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 18:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nl1ilT/sObHTqPC76FAptDP4x6azYGMRqYkHZHMZay0=; b=gOyUzp/uQFPWYXLUF1jcIegd4F
	MHt62Ozh+aThFuv+5gKvyl240QeNC2cgBcr35Qk033oE94x6eolXDMNVmPkCqqQdeI9uOPx6ZWga9
	tONNoaMGLRCcWkjuyt1+D90lEaT3izrpbD9PqYTeb5FJ+JerNv3HmuW1xA4BSVUVg78h6QQhLQzbB
	qqUnjwBo8dMccOqtnt439RDb41Jl4zMiIiIgQwwg570csTV6ebYCchxG17m/OAuycuFXd9cyyZSbh
	kEZc8HSRcM8OVeLwddlrcEcSjq23zxf58lffhvATyySJE/ueuCIbIaNejTLkDHMLjElccL0tJxlrh
	S1VUNnyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGLTy-0000000CLGj-0NPw;
	Tue, 04 Nov 2025 18:10:14 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGLTt-0000000CLBi-3dyO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 18:10:10 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4775638d819so5230785e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 10:10:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762279808; x=1762884608; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nl1ilT/sObHTqPC76FAptDP4x6azYGMRqYkHZHMZay0=;
        b=OyGa6yajWe60QxIfwWkjiKUzGPxDOVuIeaczqD1jiG2iK30O3GVJlTpWRm7UcxAGBd
         FVYL5YAf2i4xDiaZKvd57S5JhOUCiW/NlorrnAFNbt8cfw6ipmHG6DQclJXo1siV0da+
         xb45p0Kww6JMqPwT8rD+XEsw/82EsHwkiGwPMlsOG1KWrzitBvyFp56a9+eKUP9zeSJV
         SlVigHmYZJpefO26vORZCzoZUNypLEMUFt9O2jATAfVSbqK8PWqOVMg/0B3ndFMbH5tq
         3Lpf+wtvduR81hOZl1lSKKVrL+tkxA+10bxO8I6fuia+RbHmJ459qJp83gHJxRONCYfK
         ZaLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762279808; x=1762884608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nl1ilT/sObHTqPC76FAptDP4x6azYGMRqYkHZHMZay0=;
        b=BcAiz6KSsnMEriWxMkMRGZykL+4NYx3Egl53VdFYgRd5B3mYaK7DSbrNH0F4tFW4hK
         Pa2GV5qUDhWe2gkpmlxIvqNJdLQLYkrhfSyqYxaPkmOSNEWnEpSn7AdMrSJJqEPYcBBQ
         JFoifp31LCdCoGM0Xrfe02A8P6gHoIFOnkqtR1PtjKTGMpvo2BSyELEI0ZdJdk8N0stw
         1Vlo2aklww2/dx6pdgHryYb6/HQpdgNCKt2IsJIDnQBz0NBKbZv3ig8gYmFPII6vMtaR
         NTT0kFo6Y6bVt/3Ij/qqyglSLCKAUsosCzpFLdtjCvFPG72fvH3DfbqhCPQaOOuZGIKf
         nWWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYupgQDX8fhw/OgXPuLZSCwlhok957oAlXOCdL3/SsIYygSdL0hjNNGVyxSj7o5RGRRAZ1LSEgpLKf3HBlI+oi@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3Xz5VYHmV+s4h5L91AAO3gx04o3VZpWqwwI3gVlZLSqG87eI1
	BmZP9za3F0iE/oS/dO8PfX3J+LAP+TCDRiRwmv+Wb/xQdGUMzwmdeR22
X-Gm-Gg: ASbGnctGAU2cTKiNj8MTXQ4QonEG5vNaSON2ogTuADc7wCAFAc+FfohPudGO5HwcuPR
	w0Cxn0BDxY8qzIha26t15ZZj12nBIAUjAQvqcaBRtqgeZgL+FsIOpMXU7W4BmovtlESAJHjSQ61
	NpSW6xnSxya07pS/ZhZkSnnWIvdsDJfNMSWQ/fbHWA5tzCBsGIJDJAyLKzPDd/bNyMO8RIw2MUq
	XOicqNizdujO1lFMn27GzjQVlVprDOrzuhDKvsl2GztcmI3Uhc9kPC68iD1Bzc40uJEutVZIeEk
	LoP6hnrBdYsKVEFBrZH5HAML8ptV0jX/i4QHMS79Ky523xnE//z7FyihgePBg13r7p3wsORD5Gl
	NlONl/d7RSiOCdm8WvNJ8oO7wJABFadkNf+7sbJuQqPb4gD0CB1v5BdSH5zSIXXGn6ht/7f9U69
	M8S/dJIg9n4LK2ynqRXw==
X-Google-Smtp-Source: AGHT+IEaQ0kJCmYAyDupR48ISzZYJfw4Ug61ieLu3o3gUFaY4n5a/nzq0x9jBMUVbLw7oK4nsgRXfg==
X-Received: by 2002:a05:600c:34d0:b0:471:6f4:601f with SMTP id 5b1f17b1804b1-4775cdf54aemr2431095e9.19.1762279807980;
        Tue, 04 Nov 2025 10:10:07 -0800 (PST)
Received: from jernej-laptop ([178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477558c1a03sm24688685e9.2.2025.11.04.10.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 10:10:07 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: wens@csie.org
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	samuel@sholland.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v2 05/30] drm/sun4i: vi_layer: Move check from update to check callback
Date: Tue,  4 Nov 2025 19:09:17 +0100
Message-ID: <20251104180942.61538-6-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251104180942.61538-1-jernej.skrabec@gmail.com>
References: <20251104180942.61538-1-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_101009_928777_19BDC9C8 
X-CRM114-Status: GOOD (  13.07  )
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

DRM requires that all check are done in atomic_check callback. Move
one check from atomic_commit to atomic_check callback.

Tested-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
Changes in v2:
- fixed commit message

 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index bd6c7915bbc4..c80bdece5ffc 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -217,16 +217,11 @@ static int sun8i_vi_layer_update_formats(struct sun8i_mixer *mixer, int channel,
 	struct drm_plane_state *state = plane->state;
 	u32 val, ch_base, csc_mode, hw_fmt;
 	const struct drm_format_info *fmt;
-	int ret;
 
 	ch_base = sun8i_channel_base(mixer, channel);
 
 	fmt = state->fb->format;
-	ret = sun8i_mixer_drm_format_to_hw(fmt->format, &hw_fmt);
-	if (ret) {
-		DRM_DEBUG_DRIVER("Invalid format\n");
-		return ret;
-	}
+	sun8i_mixer_drm_format_to_hw(fmt->format, &hw_fmt);
 
 	val = hw_fmt << SUN8I_MIXER_CHAN_VI_LAYER_ATTR_FBFMT_OFFSET;
 	regmap_update_bits(mixer->engine.regs,
@@ -322,7 +317,9 @@ static int sun8i_vi_layer_atomic_check(struct drm_plane *plane,
 	struct sun8i_layer *layer = plane_to_sun8i_layer(plane);
 	struct drm_crtc *crtc = new_plane_state->crtc;
 	struct drm_crtc_state *crtc_state;
-	int min_scale, max_scale;
+	const struct drm_format_info *fmt;
+	int min_scale, max_scale, ret;
+	u32 hw_fmt;
 
 	if (!crtc)
 		return 0;
@@ -332,6 +329,13 @@ static int sun8i_vi_layer_atomic_check(struct drm_plane *plane,
 	if (WARN_ON(!crtc_state))
 		return -EINVAL;
 
+	fmt = new_plane_state->fb->format;
+	ret = sun8i_mixer_drm_format_to_hw(fmt->format, &hw_fmt);
+	if (ret) {
+		DRM_DEBUG_DRIVER("Invalid plane format\n");
+		return ret;
+	}
+
 	min_scale = DRM_PLANE_NO_SCALING;
 	max_scale = DRM_PLANE_NO_SCALING;
 
-- 
2.51.2


