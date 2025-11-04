Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5092CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 18:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9UxxEnvD5E7Y1WhJtD+AnEMx6VMSP1mmylf6BBTY00A=; b=kYaER24k2auOwjEJnHFpULFwJ3
	BUGDP26dYjkA6Hn1S426ed/cjeefWOIFP44y9s8jQVHOCJDt5VJklEwZDn8T05WRFU9e3anZ77RNS
	zLhxkEUDRnkkB/y3ZArWazdK877i0z62ONukK4qb0hnQP8ETTdil/S99QGtm0AZuE9o5wW5PNVI8e
	wKQLvnbkADLrSAyp57Z4jOEzN6bOWfIov+PPtdh2bAfZP863IQz+i+0Lln9sGiK5MxEDfACtYVLeg
	Yt+ZaCFZe3x7OuLNpn0uby46zncDJm8TggBOrk8lvLza7ev1tNzVXb8cYtMAoFK+jASBtJuhu8W8j
	QLJvMEVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGLTy-0000000CLHf-2g5o;
	Tue, 04 Nov 2025 18:10:14 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGLTv-0000000CLCz-1KJi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 18:10:12 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4711b95226dso75722615e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 10:10:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762279809; x=1762884609; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9UxxEnvD5E7Y1WhJtD+AnEMx6VMSP1mmylf6BBTY00A=;
        b=PP2DcVmEEtZAE+umqNHZzDZ/TrCBBX5jHan96h2aw1DD2XrDdQxwlhEBEWlsuNcq+7
         b2rgsq+Eqj5PNQb2dOIjMQ2SHN73IALwrU0fiojFqeK9bpxu5kFyniW56xG/Gy/F58FS
         6EJoWFkd/Cs1AOAdB0wOqxJjuS5lmBtlArxVBCyB0+hIZiEES3buSzCQso85lEgpgrCf
         OiRXYs6OeMCWb8Rcnw7fO6idJ6vCuD1oR+X71/85HdoF8GCxN9vbhh+fErGMvTl/NRpY
         0YnKBsTIGJwIUIwJIP3LitiL9ccoEYPM38pg3SDvz48AWmR5HXdy40H/War6qfsZFzUp
         niPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762279809; x=1762884609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9UxxEnvD5E7Y1WhJtD+AnEMx6VMSP1mmylf6BBTY00A=;
        b=teM0RGdpVjj8mszonaRpiSQczEaB4B65Tngo8q8sX7c3FnB8yg2gVpI6nZUIWXnWUq
         jxvF/ZzXUge33xeltd/Z79ZYuUIdnafPmFX2B8ec0VmptwqOP9uf+sueV2ZqxzRRD8Rx
         4tdV9DgbXft86dRfip/pLSxn4+A2mwenUSOI02J0z2UQMSN+Dj0hnBVeYPtVjoQ69RLa
         v9EM8ZY5z5KlLYbv59q6tT3593x5ywJKD7EZFyhf216uK8gjtwZ0RsUVVrr8C7TjcX+V
         VwtVrDl1uzhWRapfS4DsBcBRQXePZVHJqgzRgkR8DyGEEDZnf5gpg5KcjQyTkhJ2UV1M
         bffQ==
X-Forwarded-Encrypted: i=1; AJvYcCWp3Lmfh+rmK+E3q20fax1y0284DKFm2B55lrrQj+j3ck3Kh6Xh4Of3xY6uG1LvFJoxtQOZjR/SmdZLw2WOeyCa@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+ZLJIax1qbVNywUaKs4j/UowYrMcymG0gjw1gOdKeYDg98K+p
	AfugenCr3RqUvPJ9gLvehtZO048J0yu5EHEfXcZoTaSwTAbm6Li7frhL
X-Gm-Gg: ASbGncutk3/4cHX2WrI2F6JbfIGD/95kd9/N3s7ewJPozOMLo4q4CwDPOgufQ3R6tqz
	cFB216hM5Kn2xw8VlAcRo7sy+Azp2B1bRoc/5KGvz3EEIZ7ynJOWPWfNbJ6VvhhnjAxd2Nw0HBS
	3dHcSU1jFrP1bUrM4t2KdC/UxM5/OmM3knnopPgn8qrP1QD+B5vD2EvXSNNCHPDrVTTwqlp70xA
	ZgqSZt4sfrTyo4S2yWRlYUIpn7kM58Fo9yMeS5g3+s5/GNPa8vClb2Wxk6UEiWdSABLqOzvRZK0
	hlyUKLeFiznC35OpYWZIZ/qrFEB8z06bZYAHyrOmyX3MUJqUXvu/pXWIabLs4a/Smx727qyupKV
	gKblphpYGysXl/ZnY/X07GcvoUkqGx2FliXYPKfsKCHyooZZo1jvABVbdUPDjWRHeOqVLjVotbX
	QvvZ706CgkMKfu3Jtqgw==
X-Google-Smtp-Source: AGHT+IEJHAiuBYWEtNzJWv6C7uhRnDsBy6FovSk1I1qNjU8+nmp3MeD3eeYgDnF9LcKCHm1OTcNSBg==
X-Received: by 2002:a05:600c:530d:b0:477:55ce:f3c2 with SMTP id 5b1f17b1804b1-4775cdc5874mr2504965e9.14.1762279809223;
        Tue, 04 Nov 2025 10:10:09 -0800 (PST)
Received: from jernej-laptop ([178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477558c1a03sm24688685e9.2.2025.11.04.10.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 10:10:08 -0800 (PST)
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
Subject: [PATCH v2 06/30] drm/sun4i: layers: Make atomic commit functions void
Date: Tue,  4 Nov 2025 19:09:18 +0100
Message-ID: <20251104180942.61538-7-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251104180942.61538-1-jernej.skrabec@gmail.com>
References: <20251104180942.61538-1-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_101011_386292_87C8D98F 
X-CRM114-Status: GOOD (  12.23  )
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

Functions called by atomic_commit callback should not fail. None of them
actually returns error, so make them void.

No functional change.

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Tested-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 20 +++++++-------------
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 20 +++++++-------------
 2 files changed, 14 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index fce7b265c5d8..8baa1d0b53bd 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -46,9 +46,9 @@ static void sun8i_ui_layer_update_alpha(struct sun8i_mixer *mixer, int channel,
 			   mask, val);
 }
 
-static int sun8i_ui_layer_update_coord(struct sun8i_mixer *mixer, int channel,
-				       int overlay, struct drm_plane *plane,
-				       unsigned int zpos)
+static void sun8i_ui_layer_update_coord(struct sun8i_mixer *mixer, int channel,
+					int overlay, struct drm_plane *plane,
+					unsigned int zpos)
 {
 	struct drm_plane_state *state = plane->state;
 	u32 src_w, src_h, dst_w, dst_h;
@@ -124,12 +124,10 @@ static int sun8i_ui_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 	regmap_write(bld_regs,
 		     SUN8I_MIXER_BLEND_ATTR_INSIZE(bld_base, zpos),
 		     outsize);
-
-	return 0;
 }
 
-static int sun8i_ui_layer_update_formats(struct sun8i_mixer *mixer, int channel,
-					 int overlay, struct drm_plane *plane)
+static void sun8i_ui_layer_update_formats(struct sun8i_mixer *mixer, int channel,
+					  int overlay, struct drm_plane *plane)
 {
 	struct drm_plane_state *state = plane->state;
 	const struct drm_format_info *fmt;
@@ -144,12 +142,10 @@ static int sun8i_ui_layer_update_formats(struct sun8i_mixer *mixer, int channel,
 	regmap_update_bits(mixer->engine.regs,
 			   SUN8I_MIXER_CHAN_UI_LAYER_ATTR(ch_base, overlay),
 			   SUN8I_MIXER_CHAN_UI_LAYER_ATTR_FBFMT_MASK, val);
-
-	return 0;
 }
 
-static int sun8i_ui_layer_update_buffer(struct sun8i_mixer *mixer, int channel,
-					int overlay, struct drm_plane *plane)
+static void sun8i_ui_layer_update_buffer(struct sun8i_mixer *mixer, int channel,
+					 int overlay, struct drm_plane *plane)
 {
 	struct drm_plane_state *state = plane->state;
 	struct drm_framebuffer *fb = state->fb;
@@ -184,8 +180,6 @@ static int sun8i_ui_layer_update_buffer(struct sun8i_mixer *mixer, int channel,
 	regmap_write(mixer->engine.regs,
 		     SUN8I_MIXER_CHAN_UI_LAYER_TOP_LADDR(ch_base, overlay),
 		     lower_32_bits(dma_addr));
-
-	return 0;
 }
 
 static int sun8i_ui_layer_atomic_check(struct drm_plane *plane,
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index c80bdece5ffc..dae6f83cea6e 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -48,9 +48,9 @@ static void sun8i_vi_layer_update_alpha(struct sun8i_mixer *mixer, int channel,
 	}
 }
 
-static int sun8i_vi_layer_update_coord(struct sun8i_mixer *mixer, int channel,
-				       int overlay, struct drm_plane *plane,
-				       unsigned int zpos)
+static void sun8i_vi_layer_update_coord(struct sun8i_mixer *mixer, int channel,
+					int overlay, struct drm_plane *plane,
+					unsigned int zpos)
 {
 	struct drm_plane_state *state = plane->state;
 	const struct drm_format_info *format = state->fb->format;
@@ -191,8 +191,6 @@ static int sun8i_vi_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 	regmap_write(bld_regs,
 		     SUN8I_MIXER_BLEND_ATTR_INSIZE(bld_base, zpos),
 		     outsize);
-
-	return 0;
 }
 
 static u32 sun8i_vi_layer_get_csc_mode(const struct drm_format_info *format)
@@ -211,8 +209,8 @@ static u32 sun8i_vi_layer_get_csc_mode(const struct drm_format_info *format)
 	}
 }
 
-static int sun8i_vi_layer_update_formats(struct sun8i_mixer *mixer, int channel,
-					 int overlay, struct drm_plane *plane)
+static void sun8i_vi_layer_update_formats(struct sun8i_mixer *mixer, int channel,
+					  int overlay, struct drm_plane *plane)
 {
 	struct drm_plane_state *state = plane->state;
 	u32 val, ch_base, csc_mode, hw_fmt;
@@ -246,12 +244,10 @@ static int sun8i_vi_layer_update_formats(struct sun8i_mixer *mixer, int channel,
 	regmap_update_bits(mixer->engine.regs,
 			   SUN8I_MIXER_CHAN_VI_LAYER_ATTR(ch_base, overlay),
 			   SUN8I_MIXER_CHAN_VI_LAYER_ATTR_RGB_MODE, val);
-
-	return 0;
 }
 
-static int sun8i_vi_layer_update_buffer(struct sun8i_mixer *mixer, int channel,
-					int overlay, struct drm_plane *plane)
+static void sun8i_vi_layer_update_buffer(struct sun8i_mixer *mixer, int channel,
+					 int overlay, struct drm_plane *plane)
 {
 	struct drm_plane_state *state = plane->state;
 	struct drm_framebuffer *fb = state->fb;
@@ -305,8 +301,6 @@ static int sun8i_vi_layer_update_buffer(struct sun8i_mixer *mixer, int channel,
 								 overlay, i),
 			     lower_32_bits(dma_addr));
 	}
-
-	return 0;
 }
 
 static int sun8i_vi_layer_atomic_check(struct drm_plane *plane,
-- 
2.51.2


