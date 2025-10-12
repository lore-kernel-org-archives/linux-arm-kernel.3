Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26C84CCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Oct 2025 19:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9r6Ut7kV6R9HZszR3tkt2ETSQ6gt6SVQ7s+jJ4oPNx0=; b=Ya9hrlxv5yeNWQQ+YQ8P+LiXNO
	xpg8XJmUbx0FI5VGkJQvkPTzFitWq6Z07C+8qQZEowKYK3GnJt6GRiV2p+HZRLkztdaieWiE5P2qu
	FqboajGF+BReklfdq8uvzzVHMC2ZDr7YNRvf5pw3G9m6Pa8u8Dlam4EKA1sRklzUjMcJs7HdnSfjP
	ihe5DXN8WQ9OWe3BISz+97hnzpdaTGXQq2MHAfrv1/S2CZJqBxB6jAbj5Bidmh/PWpWmL6AQCrYEi
	HhG/XflEtpErXwAIoKaSjXhKbE51iFaqC4KwGU8422pwjOQJdMo4DsjkNhxcSbLC5fcsrcTskozpN
	cnmsZa8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v81fm-0000000BfrD-0dHp;
	Sun, 12 Oct 2025 19:24:02 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v81fe-0000000BfeG-1pHq
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Oct 2025 19:23:55 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-b4736e043f9so565232766b.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Oct 2025 12:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760297032; x=1760901832; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9r6Ut7kV6R9HZszR3tkt2ETSQ6gt6SVQ7s+jJ4oPNx0=;
        b=AuPZLO9kOPqBBZe3nJXKwoZuHfvdBi9MU//KD5UJfF29rmSoRFTgWmUOg+LfJuxvsF
         nDJRqmQjCZvMt5hMzYpTpNS9nzv+9K0kwYDisNffE0RPsiA9/ExLqxR99aekyP6jnk+y
         brzggwhWUkjNFR2IXWh8pPa6vIME1nbtG38jA4YNYVHE+R+BELJeEn35G6PgS7BacdWG
         bChlRu1GxACSep8UZzPSflvK1MzBn2nx5W2hC9x8K+LPmT9qOolf5dyjqr2KNfztRWg2
         viBx/mGHWxyYb3kYD1vB1Zbo15AZ1dcidWzblhmApkRU7K8wXwXJl3j+ntTJORd97Ptg
         8Tug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760297032; x=1760901832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9r6Ut7kV6R9HZszR3tkt2ETSQ6gt6SVQ7s+jJ4oPNx0=;
        b=ByzDUknOqwppb38wLjQXTuD7lTbo5Phg19ncCc4UvUamkI7fnF7HJc3Y6peE6EhoGY
         mdRYhLFiOL/69XATNlmVoWh4VPGSGzodv9VzD4O4/jw89MJdYQIJPpAEYFjrJnb1qsz+
         OYSIm3wwkSscLeazidlH8kCtUhIK1whmwmIvYxgRjjaB1C51c1Ct9jYwC8cxw3wTTrYK
         WhoHeAJyUS/3QFi+KNegt6kGvVlYy1qKzwL/K1b/nZgnaEl/J+ixGJ8JYxw3v4/MmfIf
         SsEeT1HdvGUtM37+fVG3KARQfuKyx/EJvv6y/Gqr/cEcDKftljxaFrNg1bIZLBdPJAHX
         LQnw==
X-Forwarded-Encrypted: i=1; AJvYcCWT+cdYT0mgt3BGZUsYK9WsLqihbtRx9s2CVo4mp+8B1iFo4ywo4snYK+vk05h+b80cJpn576T4LtDiUg9dnok5@lists.infradead.org
X-Gm-Message-State: AOJu0YyEP8FeCyufWwd2I8acSvK0u4hIF94MnFsONUlFk+WMXJ3F2dH+
	N+ds+Pa6zzlrk9dRxxkEwkfZfgl98o68VKRR9MbgMtghIK4n4EdvAYFP
X-Gm-Gg: ASbGnctrmiTM41g0EK+nz5Kzvk3EehJ77bJuHRNr41akPJEFp+qNg72J2NUln/4tRsT
	arvLN+z8TXcWRTRIixF+8KL/pheWbMNpPfTUdyNyJ79V4Mbu67Qe2rRRP32684zyXjqY/SwloWT
	4VAQlFln0PsPXr91cp7KaTipf6cGWKZfXF0jfF005ur9c9C86LbYUp/kVaRmhUWGyaxVUpk6eH+
	luN9dpSd7q+A6+xgvohOCYeMZYkD8bpJ7oh7O46SuvcBzupZyjmYRiBHa+h5JmAHz+GPBJuQuUr
	lUajEABVJbEuG2BsFV6DXMmAiaU7iWUCykvuU6ZoP0dCWQV94r1N2BPrvHcYqV66Enu13U3AOSi
	sgJb4NrIzm5A/nv6pJNj7orux+3jPELklUz1tOPsrtOu43YzhGTAdiWbvN2fonkpVVl2IH3DP4/
	ATMutMSJF0PJDGl5ujM9wI
X-Google-Smtp-Source: AGHT+IGoU1lxXeWRIACneUv9HL1g56vOt419IJ1ZpZA1Fk2BOr5WzpZW402UoRq7f5Pp8L61Pkb+Rg==
X-Received: by 2002:a17:906:ef05:b0:b50:a389:7ab0 with SMTP id a640c23a62f3a-b50aa48d2d7mr2059077466b.4.1760297032494;
        Sun, 12 Oct 2025 12:23:52 -0700 (PDT)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d67d8283sm760176466b.38.2025.10.12.12.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 12:23:52 -0700 (PDT)
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
Subject: [PATCH 10/30] drm/sun4i: mixer: Remove setting layer enable bit
Date: Sun, 12 Oct 2025 21:23:10 +0200
Message-ID: <20251012192330.6903-11-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251012192330.6903-1-jernej.skrabec@gmail.com>
References: <20251012192330.6903-1-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_122354_521503_7F0AD760 
X-CRM114-Status: GOOD (  12.48  )
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

This task is now done by plane atomic update callback. There is no fear
that bit would be set incorrectly, as all register reads are eliminated.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c    | 24 ------------------------
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 13 ++++++++++++-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 13 ++++++++++++-
 3 files changed, 24 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index a3194b71dc6d..1fca05a760b8 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -250,24 +250,6 @@ int sun8i_mixer_drm_format_to_hw(u32 format, u32 *hw_format)
 	return -EINVAL;
 }
 
-static void sun8i_layer_enable(struct sun8i_layer *layer, bool enable)
-{
-	u32 ch_base = sun8i_channel_base(layer->mixer, layer->channel);
-	u32 val, reg, mask;
-
-	if (layer->type == SUN8I_LAYER_TYPE_UI) {
-		val = enable ? SUN8I_MIXER_CHAN_UI_LAYER_ATTR_EN : 0;
-		mask = SUN8I_MIXER_CHAN_UI_LAYER_ATTR_EN;
-		reg = SUN8I_MIXER_CHAN_UI_LAYER_ATTR(ch_base, layer->overlay);
-	} else {
-		val = enable ? SUN8I_MIXER_CHAN_VI_LAYER_ATTR_EN : 0;
-		mask = SUN8I_MIXER_CHAN_VI_LAYER_ATTR_EN;
-		reg = SUN8I_MIXER_CHAN_VI_LAYER_ATTR(ch_base, layer->overlay);
-	}
-
-	regmap_update_bits(layer->mixer->engine.regs, reg, mask, val);
-}
-
 static void sun8i_mixer_commit(struct sunxi_engine *engine,
 			       struct drm_crtc *crtc,
 			       struct drm_atomic_state *state)
@@ -304,12 +286,6 @@ static void sun8i_mixer_commit(struct sunxi_engine *engine,
 				 plane->base.id, layer->channel, layer->overlay,
 				 enable, zpos, x, y, w, h);
 
-		/*
-		 * We always update the layer enable bit, because it can clear
-		 * spontaneously for unknown reasons.
-		 */
-		sun8i_layer_enable(layer, enable);
-
 		if (!enable)
 			continue;
 
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index 8634d2ee613a..9d5d5e0b7e63 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -25,6 +25,15 @@
 #include "sun8i_ui_scaler.h"
 #include "sun8i_vi_scaler.h"
 
+static void sun8i_ui_layer_disable(struct sun8i_mixer *mixer,
+				   int channel, int overlay)
+{
+	u32 ch_base = sun8i_channel_base(mixer, channel);
+
+	regmap_write(mixer->engine.regs,
+		     SUN8I_MIXER_CHAN_UI_LAYER_ATTR(ch_base, overlay), 0);
+}
+
 static void sun8i_ui_layer_update_attributes(struct sun8i_mixer *mixer,
 					     int channel, int overlay,
 					     struct drm_plane *plane)
@@ -201,8 +210,10 @@ static void sun8i_ui_layer_atomic_update(struct drm_plane *plane,
 	struct sun8i_layer *layer = plane_to_sun8i_layer(plane);
 	struct sun8i_mixer *mixer = layer->mixer;
 
-	if (!new_state->crtc || !new_state->visible)
+	if (!new_state->crtc || !new_state->visible) {
+		sun8i_ui_layer_disable(mixer, layer->channel, layer->overlay);
 		return;
+	}
 
 	sun8i_ui_layer_update_attributes(mixer, layer->channel,
 					 layer->overlay, plane);
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index dcc4429368d6..727117658c6c 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -18,6 +18,15 @@
 #include "sun8i_vi_layer.h"
 #include "sun8i_vi_scaler.h"
 
+static void sun8i_vi_layer_disable(struct sun8i_mixer *mixer,
+				   int channel, int overlay)
+{
+	u32 ch_base = sun8i_channel_base(mixer, channel);
+
+	regmap_write(mixer->engine.regs,
+		     SUN8I_MIXER_CHAN_VI_LAYER_ATTR(ch_base, overlay), 0);
+}
+
 static void sun8i_vi_layer_update_attributes(struct sun8i_mixer *mixer,
 					     int channel, int overlay,
 					     struct drm_plane *plane)
@@ -320,8 +329,10 @@ static void sun8i_vi_layer_atomic_update(struct drm_plane *plane,
 	struct sun8i_layer *layer = plane_to_sun8i_layer(plane);
 	struct sun8i_mixer *mixer = layer->mixer;
 
-	if (!new_state->crtc || !new_state->visible)
+	if (!new_state->crtc || !new_state->visible) {
+		sun8i_vi_layer_disable(mixer, layer->channel, layer->overlay);
 		return;
+	}
 
 	sun8i_vi_layer_update_attributes(mixer, layer->channel,
 					 layer->overlay, plane);
-- 
2.51.0


