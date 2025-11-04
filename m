Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45F9FCCFA0C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 18:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jjm6bAyoMllMD1Q/IvNTNZhpUzj787YRLXUAz9HfQNA=; b=HG53AZHPbRXApC4QipPdlcbhRd
	3NFdXEKlg0gx8clA268I+XXX/RK1RB3phbb9LWdDbrxnubOxeWD6bYhj7SnrlYn8s7VYMSjxLHqtI
	c0mQLryMPO/y8QNnkq6E4M38DSQxiAloM9hTy86+XXhgqiuAH2HbniJY4ej/5WQYXugbX3p4CrcX0
	eigStXCow/IqaJpM3gM+sd9PFog9kxzYGoH8PQCOZBHcoFogJQ69CM3xW2WkAFYK/9b8sAPLDk+pC
	RiEadIEk3lKUx1AjIlPZ2ZfSw2IathJUTKwWpdYy3kb9iRQuJTZfp12cwYJDomBdi6/y1vMeP8xK1
	hBYyal+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGLU3-0000000CLOy-40La;
	Tue, 04 Nov 2025 18:10:19 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGLTz-0000000CLGX-0OSX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 18:10:16 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-471191ac79dso64631015e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 10:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762279813; x=1762884613; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jjm6bAyoMllMD1Q/IvNTNZhpUzj787YRLXUAz9HfQNA=;
        b=FDLpozFRGk6kM5ZK+jW+pAfvbe4MvkPa1+WBm0f0kT8Lx17igRyKRtfGNo8XjoIfsu
         YWI/0++0gwBg77U2DWijPgPjB+Oep49AnovLoYEko/AkVDyraw47f/T8o6bvrJdL4Ij0
         WD8eYOrdYgW9w73FNhV9pkiXEA2PNkYjOIpy0jb3AXsEqmZ5YblpLy5tUhxjBA53EvzA
         plmks410hHMpaCl/7Cart4audQCUK8O4/tH7uBGRZ4uvpswOHzHcR9fztxHFgE6+pXOK
         VUC4BSohqy0Dpkid1KuPGhW/N34WmUfwQgie96Wm/xYnIpQuJN34lAXT5+30dYe+NnI+
         WSYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762279813; x=1762884613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jjm6bAyoMllMD1Q/IvNTNZhpUzj787YRLXUAz9HfQNA=;
        b=kTYRzmdYI1B+ujGvCcCvZNbvlfoYEcDRTZLSxPPcyjn27CtVJDtsdHukT+J0Vh2mpQ
         fzJvd5HTTgRmDP1AnDzPg0xhkwJ77B3sag+q774cJtyUGMCib8t2WJXrPQXYvRJ6JqOS
         cB8MpHeBMBflcloCns4Et4pPEKx8VFxGZsnMnnLaesfrzsZFbu7JV1HSxJ5SsdibcFOB
         F+xm1GOOLtYllmTm++5tr0REQ2pqj9ZLqbYyT0YLbQBMslwHS8WOnblRi2NVQ3rU1emQ
         Sq5XKZn/IwztZOHjQn82MmErV5VG7qotiKoY9De+IeTYq73NHETsmHyBpRz/nx67GHqH
         FsiA==
X-Forwarded-Encrypted: i=1; AJvYcCUVEKAB+JwRPnFlfO0x0KmNVjj90K66mDsCSk/+AGVAcLBj9W8UUJ6kgKnzYUIrlIPAVL5TraRsdPLNNgmI1Nvd@lists.infradead.org
X-Gm-Message-State: AOJu0YzmbRE5+FReOidLiMIc+ET7/0vLwmW00pFYizeZYgNF8yGr0gHa
	5lf0OPvqCVBoxR6D16wtf1unH1KLTo4NdEsaCAELYfjKa8epT1kbrwth
X-Gm-Gg: ASbGncsVSNKcpd9xqvKoOMZ3Re+T/LVmSrZKDikjQMkZHTbWZ/4Po7lJZKYl0NBdrXR
	aFZsov/zq9tt+1YPqk3kYYs8p+HPZzzw9XDh3FxEQxW0gK9M2AfDgG2AQPeA+uoyR5FbfDSEz5E
	kifF3Y2NqM5cmbAb3cNKSrU9CV/PbBoTEY7w2Ap45sLoyx0LWGXt7DWlzspUvoFrsjnfGtX+dUK
	b86jXwtRaLyyxOac5qrJMedC67GBbbcTleKYwCHm2H2MUsdhK/fH9LS5VMJNNQomKxzZisV0yrE
	+A8OAdImWttqDNRNYT27dQXCK55LWApnX3rRHRYuZ2MNBgNam4ZyXsKKiYBqVwUjg1q3lpAi29/
	1OQ5KtM5lKxfQmETDtsFxc88g7BiQtOm18JH4N3iG37tvxZzvIsfcqQm6boktSV5WHh0yXjhHX/
	LyJgw5ca+P9pDZjTdeuWhO2IQOiViW
X-Google-Smtp-Source: AGHT+IHUjkvK3LuEYexNwytgkWNuB+3vDFUmi2M1K/MsCvY3IVkIm6wl0qrMfqC1Lyu5Q0aWPSh04g==
X-Received: by 2002:a05:600c:a05:b0:475:da1a:5418 with SMTP id 5b1f17b1804b1-4775cdbd551mr2245645e9.1.1762279812965;
        Tue, 04 Nov 2025 10:10:12 -0800 (PST)
Received: from jernej-laptop ([178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477558c1a03sm24688685e9.2.2025.11.04.10.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 10:10:12 -0800 (PST)
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
	Chen-Yu Tsai <wens@kernel.org>,
	Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v2 09/30] drm/sun4i: vi layer: Write attributes in one go
Date: Tue,  4 Nov 2025 19:09:21 +0100
Message-ID: <20251104180942.61538-10-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251104180942.61538-1-jernej.skrabec@gmail.com>
References: <20251104180942.61538-1-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_101015_160519_747858EF 
X-CRM114-Status: GOOD (  14.91  )
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

It turns out that none of the VI channel registers were meant to be
read. Mostly it works fine but sometimes it returns incorrect values.

Rework VI layer code to write all registers in one go to avoid reads.

This rework will also allow proper code separation.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Tested-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 71 ++++++++++----------------
 1 file changed, 27 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 1f4fa63ef153..dcc4429368d6 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -18,34 +18,35 @@
 #include "sun8i_vi_layer.h"
 #include "sun8i_vi_scaler.h"
 
-static void sun8i_vi_layer_update_alpha(struct sun8i_mixer *mixer, int channel,
-					int overlay, struct drm_plane *plane)
+static void sun8i_vi_layer_update_attributes(struct sun8i_mixer *mixer,
+					     int channel, int overlay,
+					     struct drm_plane *plane)
 {
-	u32 mask, val, ch_base;
+	struct drm_plane_state *state = plane->state;
+	const struct drm_format_info *fmt;
+	u32 val, ch_base, hw_fmt;
 
 	ch_base = sun8i_channel_base(mixer, channel);
+	fmt = state->fb->format;
+	sun8i_mixer_drm_format_to_hw(fmt->format, &hw_fmt);
 
+	val = hw_fmt << SUN8I_MIXER_CHAN_VI_LAYER_ATTR_FBFMT_OFFSET;
+	if (!fmt->is_yuv)
+		val |= SUN8I_MIXER_CHAN_VI_LAYER_ATTR_RGB_MODE;
+	val |= SUN8I_MIXER_CHAN_VI_LAYER_ATTR_EN;
 	if (mixer->cfg->de_type >= SUN8I_MIXER_DE3) {
-		mask = SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MASK |
-		       SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MODE_MASK;
-		val = SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA
-			(plane->state->alpha >> 8);
-
-		val |= (plane->state->alpha == DRM_BLEND_ALPHA_OPAQUE) ?
+		val |= SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA(state->alpha >> 8);
+		val |= (state->alpha == DRM_BLEND_ALPHA_OPAQUE) ?
 			SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MODE_PIXEL :
 			SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MODE_COMBINED;
-
-		regmap_update_bits(mixer->engine.regs,
-				   SUN8I_MIXER_CHAN_VI_LAYER_ATTR(ch_base,
-								  overlay),
-				   mask, val);
 	} else if (mixer->cfg->vi_num == 1) {
-		regmap_update_bits(mixer->engine.regs,
-				   SUN8I_MIXER_FCC_GLOBAL_ALPHA_REG,
-				   SUN8I_MIXER_FCC_GLOBAL_ALPHA_MASK,
-				   SUN8I_MIXER_FCC_GLOBAL_ALPHA
-					(plane->state->alpha >> 8));
+		regmap_write(mixer->engine.regs,
+			     SUN8I_MIXER_FCC_GLOBAL_ALPHA_REG,
+			     SUN8I_MIXER_FCC_GLOBAL_ALPHA(state->alpha >> 8));
 	}
+
+	regmap_write(mixer->engine.regs,
+		     SUN8I_MIXER_CHAN_VI_LAYER_ATTR(ch_base, overlay), val);
 }
 
 static void sun8i_vi_layer_update_coord(struct sun8i_mixer *mixer, int channel,
@@ -194,23 +195,14 @@ static u32 sun8i_vi_layer_get_csc_mode(const struct drm_format_info *format)
 	}
 }
 
-static void sun8i_vi_layer_update_formats(struct sun8i_mixer *mixer, int channel,
-					  int overlay, struct drm_plane *plane)
+static void sun8i_vi_layer_update_colors(struct sun8i_mixer *mixer, int channel,
+					 int overlay, struct drm_plane *plane)
 {
 	struct drm_plane_state *state = plane->state;
-	u32 val, ch_base, csc_mode, hw_fmt;
 	const struct drm_format_info *fmt;
-
-	ch_base = sun8i_channel_base(mixer, channel);
+	u32 csc_mode;
 
 	fmt = state->fb->format;
-	sun8i_mixer_drm_format_to_hw(fmt->format, &hw_fmt);
-
-	val = hw_fmt << SUN8I_MIXER_CHAN_VI_LAYER_ATTR_FBFMT_OFFSET;
-	regmap_update_bits(mixer->engine.regs,
-			   SUN8I_MIXER_CHAN_VI_LAYER_ATTR(ch_base, overlay),
-			   SUN8I_MIXER_CHAN_VI_LAYER_ATTR_FBFMT_MASK, val);
-
 	csc_mode = sun8i_vi_layer_get_csc_mode(fmt);
 	if (csc_mode != SUN8I_CSC_MODE_OFF) {
 		sun8i_csc_set_ccsc_coefficients(mixer, channel, csc_mode,
@@ -220,15 +212,6 @@ static void sun8i_vi_layer_update_formats(struct sun8i_mixer *mixer, int channel
 	} else {
 		sun8i_csc_enable_ccsc(mixer, channel, false);
 	}
-
-	if (!fmt->is_yuv)
-		val = SUN8I_MIXER_CHAN_VI_LAYER_ATTR_RGB_MODE;
-	else
-		val = 0;
-
-	regmap_update_bits(mixer->engine.regs,
-			   SUN8I_MIXER_CHAN_VI_LAYER_ATTR(ch_base, overlay),
-			   SUN8I_MIXER_CHAN_VI_LAYER_ATTR_RGB_MODE, val);
 }
 
 static void sun8i_vi_layer_update_buffer(struct sun8i_mixer *mixer, int channel,
@@ -340,12 +323,12 @@ static void sun8i_vi_layer_atomic_update(struct drm_plane *plane,
 	if (!new_state->crtc || !new_state->visible)
 		return;
 
+	sun8i_vi_layer_update_attributes(mixer, layer->channel,
+					 layer->overlay, plane);
 	sun8i_vi_layer_update_coord(mixer, layer->channel,
 				    layer->overlay, plane);
-	sun8i_vi_layer_update_alpha(mixer, layer->channel,
-				    layer->overlay, plane);
-	sun8i_vi_layer_update_formats(mixer, layer->channel,
-				      layer->overlay, plane);
+	sun8i_vi_layer_update_colors(mixer, layer->channel,
+				     layer->overlay, plane);
 	sun8i_vi_layer_update_buffer(mixer, layer->channel,
 				     layer->overlay, plane);
 }
-- 
2.51.2


