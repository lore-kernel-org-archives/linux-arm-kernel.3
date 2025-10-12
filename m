Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5A17CCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Oct 2025 19:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S9SmCp0RhICJrtT3B0EVlMoJ5KkuRntCLc/b84MPeMA=; b=U8vvkWE3vlvmB/DreeuFXNQiYi
	1aLjY6VaScgsmtvXTSx7ppnwPMoLUSaD0eNxYKWPlw9abIvxlEJggZKDeWBcEm5NxdkoB36f4xiTI
	tLssss5yWZrAtp51U7vmflSgE89rd4iiGwZi6+5J9xqaFE/P/eVnPB9RjeNXL6IeKFK1Eh/ZhF239
	7QYEvfnPB8GIShtemUGGBQKL+ule9cGsCW5iNQqh/10W/SxggSVxWXSHUfj7JRpNEwP8j+5YUTilV
	4R1u9+J8Epks2lOqrhIoV07K4WnoKT9dtzKhNTeesoybjtsFO6MeDvSh3PBcEPv2gCE8W7I7o/S46
	MtX5RHbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v81fe-0000000BffK-0d3x;
	Sun, 12 Oct 2025 19:23:54 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v81fa-0000000BfaY-3qVr
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Oct 2025 19:23:52 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-b3e7cc84b82so668385066b.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Oct 2025 12:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760297029; x=1760901829; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S9SmCp0RhICJrtT3B0EVlMoJ5KkuRntCLc/b84MPeMA=;
        b=GHCRjm2jJ3O2DiIhhJGMngARmxYLOHxg/p4R0oH1pj716Dx9tmFedyiKwTun3iqRtH
         Wkh0cXm68vpekzrFRfry7aNJu0Lb6TB1wBlZHslvAc/aaHBSymjmeSJCrgD3diMguH3I
         LDV7taMKmt0cEFnsDyKzKsffNI4rcDVOnLyyqzq34e/HMMaSq4CmhpOtuwt3y+ezYwOD
         N/r3LyKRyMpCLczY5YyAN+AyJLMIscyDffKB1lJ/ADV11YlpDsEtm5GJ9vlFhcqSvBuT
         VRV+LKVYLDWs52BSRYKcFvlylA9diWPQ8tUHsTsB7URDJpdaNQu7QuRFvDkqv5ZBeLR5
         rReA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760297029; x=1760901829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S9SmCp0RhICJrtT3B0EVlMoJ5KkuRntCLc/b84MPeMA=;
        b=dxd98tzzjvZune3JaIWnEAiPtuhxk9w9jpl5PfXNGqeCdKhBemcpwxcvpXIEat7C6s
         zAgzanr4zK0v7mz+Xicvs0x2FrYADVilNRLqe5EwdlrvnWti+NmXQJYnk6Jtkg5BSmIC
         JjAPDFIN/RekPaU00exUC5sBwDO15FzcYmbHpqv8jxd9XDEg8tAU6hcekvh8Mh8KkO4n
         Yks3X9Dj5Yq29p2cKD7kj+yaDrbNUtXZfaDHAIt4IF1Xm5EEFvw5JOYm65YL7f9pmUs7
         owRclDmlpyAJs3PHvP3D4DMIXN995+lqDMd95LxTcXArO+6cauwgH87rDHS+9rRAchG5
         ftuw==
X-Forwarded-Encrypted: i=1; AJvYcCVaj+e+Uof8h8shUDtjdCewcEy7GndRKW5qBhySV1mOjYdjbWVe3PE8rIK0F7OCDmKWgNZQkGBAA9Ymw1tdBLqK@lists.infradead.org
X-Gm-Message-State: AOJu0YwWj3/PvrZji8mDkKdxTigtQCIVPT552fU7af/CzJC6mvLk1Z4l
	2WtzaKEjcQBzNzIFMETcFJi19SicTsIkFp/are6+0CkY0yMUgWgcc81n
X-Gm-Gg: ASbGnctW0uO/NYqGQcYqa9cmgx+n5XKTF4mdy25YqEsJi9tOeXISV7ww4ER/Do/oUGM
	9n0fLUKGSti8iZK07s8/KMUcx2todubVJf+o7jxpLzUUkPbrqeYwX6yVliG5R5fhaG9rnQaunEN
	GzTIWCVtxmlcPpbU196osvt7bMFj1QJ5OJ7ahXurn0EMw6Jo5oUFx6d+ueAK882A1Zdw0slGMe4
	ozyGQdbzLEv8v8VyOBcY/m11J4yKbbcpX6wQOH+sPdwMhbCh5nIa7TXfXr4qw8o+9XGkJV6VnVw
	XLxsX3rCP2fUUzUCHhNLSevgojlVQnJlEkMeVCUJGDdXef25drNEiNI1dqa89m/7yZ5tOXJoYJS
	4g+6kDMJqCl8ZVsocZgHakLIWTGRkGNTzxYVd2kAiJvuY3Pww1znVVia6vrOjFw8OFo7RPCMczD
	HQK7Y81YQDN98d2Z747nEwv6w6/q2bCc1Wbw7I+MGLGA==
X-Google-Smtp-Source: AGHT+IF7Qq6jQqzYZdDrJkaw6UlpFKkxTue0qnLTmhRFyadA1ihDqW2+FAH2PNlrJyvCEAGwchJGLg==
X-Received: by 2002:a17:907:980f:b0:b3e:c99b:c78a with SMTP id a640c23a62f3a-b50ac5d07e0mr2126585466b.54.1760297029128;
        Sun, 12 Oct 2025 12:23:49 -0700 (PDT)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d67d8283sm760176466b.38.2025.10.12.12.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 12:23:48 -0700 (PDT)
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
Subject: [PATCH 08/30] drm/sun4i: ui layer: Write attributes in one go
Date: Sun, 12 Oct 2025 21:23:08 +0200
Message-ID: <20251012192330.6903-9-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251012192330.6903-1-jernej.skrabec@gmail.com>
References: <20251012192330.6903-1-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_122351_000716_1AB77D4E 
X-CRM114-Status: GOOD (  11.69  )
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

It turns out that none of the UI channel registers were meant to be
read. Mostly it works fine but sometimes it returns incorrect values.

Rework UI layer code to write all registers in one go to avoid reads.

This rework will also allow proper code separation.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 50 +++++++++-----------------
 1 file changed, 16 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index 12c83c54f9bc..8634d2ee613a 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -25,25 +25,27 @@
 #include "sun8i_ui_scaler.h"
 #include "sun8i_vi_scaler.h"
 
-static void sun8i_ui_layer_update_alpha(struct sun8i_mixer *mixer, int channel,
-					int overlay, struct drm_plane *plane)
+static void sun8i_ui_layer_update_attributes(struct sun8i_mixer *mixer,
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
 
-	mask = SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_MASK |
-		SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MASK;
-
-	val = SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA(plane->state->alpha >> 8);
-
-	val |= (plane->state->alpha == DRM_BLEND_ALPHA_OPAQUE) ?
+	val = SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA(state->alpha >> 8);
+	val |= (state->alpha == DRM_BLEND_ALPHA_OPAQUE) ?
 		SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_PIXEL :
 		SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_COMBINED;
+	val |= hw_fmt << SUN8I_MIXER_CHAN_UI_LAYER_ATTR_FBFMT_OFFSET;
+	val |= SUN8I_MIXER_CHAN_UI_LAYER_ATTR_EN;
 
-	regmap_update_bits(mixer->engine.regs,
-			   SUN8I_MIXER_CHAN_UI_LAYER_ATTR(ch_base, overlay),
-			   mask, val);
+	regmap_write(mixer->engine.regs,
+		     SUN8I_MIXER_CHAN_UI_LAYER_ATTR(ch_base, overlay), val);
 }
 
 static void sun8i_ui_layer_update_coord(struct sun8i_mixer *mixer, int channel,
@@ -111,24 +113,6 @@ static void sun8i_ui_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 	}
 }
 
-static void sun8i_ui_layer_update_formats(struct sun8i_mixer *mixer, int channel,
-					  int overlay, struct drm_plane *plane)
-{
-	struct drm_plane_state *state = plane->state;
-	const struct drm_format_info *fmt;
-	u32 val, ch_base, hw_fmt;
-
-	ch_base = sun8i_channel_base(mixer, channel);
-
-	fmt = state->fb->format;
-	sun8i_mixer_drm_format_to_hw(fmt->format, &hw_fmt);
-
-	val = hw_fmt << SUN8I_MIXER_CHAN_UI_LAYER_ATTR_FBFMT_OFFSET;
-	regmap_update_bits(mixer->engine.regs,
-			   SUN8I_MIXER_CHAN_UI_LAYER_ATTR(ch_base, overlay),
-			   SUN8I_MIXER_CHAN_UI_LAYER_ATTR_FBFMT_MASK, val);
-}
-
 static void sun8i_ui_layer_update_buffer(struct sun8i_mixer *mixer, int channel,
 					 int overlay, struct drm_plane *plane)
 {
@@ -220,12 +204,10 @@ static void sun8i_ui_layer_atomic_update(struct drm_plane *plane,
 	if (!new_state->crtc || !new_state->visible)
 		return;
 
+	sun8i_ui_layer_update_attributes(mixer, layer->channel,
+					 layer->overlay, plane);
 	sun8i_ui_layer_update_coord(mixer, layer->channel,
 				    layer->overlay, plane);
-	sun8i_ui_layer_update_alpha(mixer, layer->channel,
-				    layer->overlay, plane);
-	sun8i_ui_layer_update_formats(mixer, layer->channel,
-				      layer->overlay, plane);
 	sun8i_ui_layer_update_buffer(mixer, layer->channel,
 				     layer->overlay, plane);
 }
-- 
2.51.0


