Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CA80CCD18A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Oct 2025 19:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4j2gKZWvQ3G/p6x29ljxN7hGavAjse3Wea8WQURA1i4=; b=Ij4NFA8WI7+SGpi5Kq1tniOaIT
	obD3WPa//qkSPVgQR2OD3dnej9maDwgMPCqWZ2WNZPQzzL62VjZITxxdk9XF+7DN/0iot3Ny95zQK
	S8gLAESsMswzvV6ESXmblhyKAh+K7OBTMKLVKNDcLTxguzB2EJtoStrprpDUq8OvmuUIAi2Itwk14
	xzNUyMWeX3TUc9zgnaLuAdhCO+R6zREnbRW92FRSWii//Nyg1zkoo9xS5QgmVAk6KHXFFBi1aAobj
	Cz9SDkktZkxL010JMiJ1Ir40ofLJPtiYxRHd2r5TE6pu/1rsgdm9QZUD+YxJsMeb6edwsy3i+B6kR
	ULmxoBFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v81fl-0000000Bfol-0Bgz;
	Sun, 12 Oct 2025 19:24:01 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v81fc-0000000BfcJ-2znw
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Oct 2025 19:23:54 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-b4c89df6145so588338166b.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Oct 2025 12:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760297031; x=1760901831; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4j2gKZWvQ3G/p6x29ljxN7hGavAjse3Wea8WQURA1i4=;
        b=T4+bke4v5lsH2YwRkNaoTQqWdUdikjvms2p09t6ShRn9URKu1dTA5ngBIDNEqtiTeo
         lUN8/2Qa5scH26GfR3oQUhF0Tq/bpDg0+L+WIzBpqP9vyDos1yPJdK//87qE+H5eK0At
         4XGeftKmMYhhIPstPHKaoaXm/udRNB6qP2aNpnGeANeGcgaRoqLuLKvDf5wdtUrIIiPG
         6K9KihDavojktZqkSB2yW51dxfotZSceUPQhYkF3Y6Klt0M5HR3oV1jQjabLsZylw7Bn
         lOYyayTxtNq1ydvcf2m226+HT6DYcB5PF39TLGBg0fxWpiTEblsijbbAx8oIn5vZB/k3
         MPWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760297031; x=1760901831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4j2gKZWvQ3G/p6x29ljxN7hGavAjse3Wea8WQURA1i4=;
        b=TzbVs/6keahH0sewDaG/nwPryos72XHSY4WUiurmAMNeRvtn4CRJmVXyIg3JRmQtDm
         DuVHn68ij2fpSWoARRUpz8hCnmdf/wZXZCAnOUFB/ztZlGcHhXOVODeSubWW9g+vlehZ
         qm0nXvvbMWGjjZeJ+0kNyUsyf0lEH6G1tqa7DataVp3coEDO872SW3dAxrSCW9ZxW8hR
         ZwmLgfedvJK9ssK4UVInVpl8nCNfBwqOL5Ng3HQKIoVRT/Xr8XiNPJTaBEqU41nNqIws
         57x2H2RF5cA1eknekSR8mauSQVbVF/lwrmq4bDYYSVvpp44NBD0SRJkD3xRIdWGwD7oY
         1x2A==
X-Forwarded-Encrypted: i=1; AJvYcCUoqp7o2Qo5yZoDHtXy+JgyGNcJOS89FPt8nSTKZ7oCxJk2+rKY4NqzucqiMBqWMS3M49OLPp+T5KA7UZUxvgqU@lists.infradead.org
X-Gm-Message-State: AOJu0YwHEyMcChbyBoqhnhTQ4wyqqAVCYZIwMPkiLbWFIGyy0NnzWW+p
	ep0qTzFS7NkGVrcFIgc73RBNexWTGWG0H7MmYAO/jxy0ELOtvpL8QU5o
X-Gm-Gg: ASbGncsFp+7cYeverlLVYz6+XUm+lP2+O0+vNu/4wZh5GRZZiABwuvJYvZdcP1IOLN4
	PBv2ZwhKpL6m/Of4zvdPSeEVRohVBnVjzhCy/O9994RH9XfiShz7u9WbRXwhtMuhUqIqUwBf8Cn
	FYaqMLGDIosmRnKXhAvHiQ9e3pi1NjeMSLRf2ow+s4Del80qAWUmgA4+hKvcsAuhjZEREafNqqK
	4udF9/erbSFLkN81kJV+3CGNcv4VI91nU6R1l3LP0Zcex3S4SCziCSq5UFwmnf5Ipsl79ZMr7Iz
	BhLCcar0CRQauCjRyDxlGdRoy+1ayA7KkhylTkEghwJLlVkZpVC3otAa7fLctYP886fJOo0McnP
	XnCcQZJ2jhb542xDYygzkVggx0dEHKisZqXt1fuvQNfbgyD8aBR1xbpFujWHozQiZfSZDXPR/tA
	W7tMhzDXCQRSxQEwlgjedFic9wzQTwxE/ut0e5T9unZA==
X-Google-Smtp-Source: AGHT+IEs/WFctDa89+D/WqWhY5uZ3WvAavRVXRQFM/TxuoPg9kA4sKepU26nxFXJKsHh5KgVUQFpfg==
X-Received: by 2002:a17:907:724a:b0:b04:5b0a:5850 with SMTP id a640c23a62f3a-b50ac1c3f18mr2033310866b.40.1760297030814;
        Sun, 12 Oct 2025 12:23:50 -0700 (PDT)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d67d8283sm760176466b.38.2025.10.12.12.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 12:23:50 -0700 (PDT)
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
Subject: [PATCH 09/30] drm/sun4i: vi layer: Write attributes in one go
Date: Sun, 12 Oct 2025 21:23:09 +0200
Message-ID: <20251012192330.6903-10-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251012192330.6903-1-jernej.skrabec@gmail.com>
References: <20251012192330.6903-1-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_122352_785018_92AEB4FD 
X-CRM114-Status: GOOD (  13.94  )
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
2.51.0


