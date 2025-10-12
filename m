Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B37C8CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Oct 2025 19:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QhSOMeyyVEb/JHhqKdNE9M8XBPkXN/GvjKAdeA1KvOU=; b=RLhsQ0EShNoxEVC3vVwN2z2KzL
	oiwlQFm5sURtoCp+GwX2ttPfgXGfL3n/d1h9rgY5Y3RFXw70oVRzQeKU4kMBTuYzMixmv6U1douGP
	VGyGowZM9JpcVQrWYoIqVyFG0mGkz2NBGOnbHBpeTAlsxO9pDvJE52IpNqjFDllyBinG/JTSljV+3
	7R8gxb7NKzSBl+zXyyQE4X2I2mjpLA2TLHBsCPCuN1HC9l6b0S2L1RrBDqaDv6X5pcEsTztmaGu0S
	8zYdTwHNumCeqUC9rFMDhFHFBwrbhmKfbs2vJTQLPkDC8xQKH8kZveNgTkSEB7sh/tTgbAIVT5AX4
	hivKSASA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v81fd-0000000BfeZ-27VH;
	Sun, 12 Oct 2025 19:23:53 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v81fY-0000000BfXX-2C4h
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Oct 2025 19:23:49 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-6394938e0ecso5716980a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Oct 2025 12:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760297027; x=1760901827; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QhSOMeyyVEb/JHhqKdNE9M8XBPkXN/GvjKAdeA1KvOU=;
        b=jreYULguxAq7dVMJiPkgExYk45AXEPHPYoZG01Z6Z4FeKJi4WsEYPQXla9m5LdKQy3
         HiSlwoqqnUndV49odxf575C41ojRsdhbf6QYtSUdaaZFq4ulTHVpdTQaLA6VyCCllN71
         4nCzKJ1hEhqamSH+x4N4fEgxQ4WVc+bC7GddQtJtSCyey6dznZYn2R4KvxsMGEhQgiUc
         ZMbXX5IznQeEbzDBwW0RodaCmusNqZ7JnE3NORdyUbQOKa/whJURR0cZLmgKIfxMM44S
         r/bXRGDoDpDKwbbn/fDH9dRY8G90/Ptq9JPuVGJzf+ZanN7S4kRElAT9YXXlXOTaH8oy
         3Q3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760297027; x=1760901827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QhSOMeyyVEb/JHhqKdNE9M8XBPkXN/GvjKAdeA1KvOU=;
        b=f3mCdU0mW4gom4ReJ8P8I3ObmBDhDEu9md57K9tH6uumnwivfGUIVuIRS/O9FGMLEw
         8UVaoDQZZcRtOr05sfCjegglaRohHHAVJ7/YIQeohtP1RTYAD4ErFzXKg90jFUo+5ncw
         pQv0cnjbF+zlwPTjQKQC0uNB0u16Y7ajBCnbmxaLDJcXoJIyH161hzH4tz0LYCEOENLG
         oPQtryyJra0JBdzTmekWeiddHxh3SIcQeT9PDL6fjQ1V78jHuFgfuqmOe/0xrJXyBtaE
         3/QElZoQswkQmL0hSWFGjt+po6H9JgsizGhoxR/gyoaFup7jgyxNUJyuU1TcCZuW/fvW
         +YSA==
X-Forwarded-Encrypted: i=1; AJvYcCV9iNevFsBuSfrbiAu+nCv6a7PX1+ZZ9HLKJMVSMswQZa5ni1wEviNI8E0YguRL0WKZ8fGpYfjsBL1QgrPRn8f9@lists.infradead.org
X-Gm-Message-State: AOJu0YzTSvlsKjcsNAdkyQqqYP4V+mtsBsM95/8u+S3BGsaJigdDTRkO
	GNXq/MuDsWbxO7pyBMKwE5PQXxWXybS5UbDMATWTKKIV/qKS2Kt92nmI
X-Gm-Gg: ASbGncuEvdQZXAORY3xl1xtIUaoZ9d81SJoUKREKD7FBrE+RvuhRlIK8a2Vq2gchdAz
	6QyQG40BHgj5dzhVp6A6wOYVXpieirsyFIZCNJo2myNWubJou5O8mOrS0P5exx0bNqVhfGoCNYY
	Rgn8QP0ZCUmTaEGqJvTbJ0gcnFxXfvjTbFN4vffKLhRrG5cL9gm8KVBHvni7sDysR8+PyA+nLyy
	0YMR/EDnjN4CMcHcCiW6IY4hkiiuuKfNlTjfZszmqSo40gv+a+QO9GcDIXdqJfZxfteuwzMiUWx
	AK0JHKwNoE9AiMTKfkiI5gGJlxTYxeV58NbZASiG/smKBCwkzSElsuf+E5EVzNfY2oSe+4cJlKX
	2fqb6kWmsCd30q8CWa9QjgC856FLDGrp5SRzKZrwsQKkNhbD4D5ao5mjRs5QpKtM5kf6qHliQ1p
	dvYepceNY82n1krtEoKNi8
X-Google-Smtp-Source: AGHT+IFUbJ+FjAjKKsg6YJWZVxyDF8HU9W9iTbhFx8UICuTNacj1eC7uib49tuv2zK9lGVgNU785TQ==
X-Received: by 2002:a17:907:72cf:b0:b04:61aa:6adc with SMTP id a640c23a62f3a-b50aa69e311mr1981823466b.7.1760297026601;
        Sun, 12 Oct 2025 12:23:46 -0700 (PDT)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d67d8283sm760176466b.38.2025.10.12.12.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 12:23:46 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	wens@csie.org
Cc: maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	samuel@sholland.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 06/30] drm/sun4i: layers: Make atomic commit functions void
Date: Sun, 12 Oct 2025 21:23:06 +0200
Message-ID: <20251012192330.6903-7-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251012192330.6903-1-jernej.skrabec@gmail.com>
References: <20251012192330.6903-1-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_122348_619821_44CB38D0 
X-CRM114-Status: GOOD (  11.44  )
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
2.51.0


