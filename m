Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0905CCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 18:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vqox3UkaoHNgrz/QIvGOJuxPYXtBZjdwtd1IyKwMyfs=; b=jVUKNlLK6SpDOTYQiaUIxjSuk3
	yZPvRdbvrcAzGNbAB0zXYwWmtPQTf/dDZjST6E565qHI+crtylbIzT36bJ+BZhMEOzAQ3kqZYFlIj
	DPWSTzegGwGOJNZfIS5/2Ua2iEN41E15CD5i1OVq/53bCa35JQ/DlqVXA8ImnA9ojG3NoHXnQ5L6m
	Lb6yzRNdO/nDHWMTnFE+J/GI5/u9wSURoIr0SUwuYoLa5cjlXzrUyUS1YCKCFY7oAYr27NMqgeJNy
	Um5DAEyn1fXqnfNFaqTquilW18qUlLAgUpndJ73gGG3lmo2fXaARalfdaLHA+LvuWTzcVii2/eKpw
	45XRckfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGLU4-0000000CLPs-1Esq;
	Tue, 04 Nov 2025 18:10:20 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGLU0-0000000CLIE-14Lz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 18:10:17 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-47755a7652eso8491225e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 10:10:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762279814; x=1762884614; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vqox3UkaoHNgrz/QIvGOJuxPYXtBZjdwtd1IyKwMyfs=;
        b=Hs97PrN5STDM/goS+QybbGNRi1snXog6ZphkrjyWdAZmkipf+l6NwpRXb5+po7VOia
         oO9gir6GXAdwtG1rYm5+VBNQc+ShNd4o2xZP0z+XNrLr3/k2McHs+VTqm4ulF7nshOJ9
         RXpMwJDczN/RGfovZ9XEDyQALBNQy8PKbZbPqQV7vXb31tYhok97ex8qF57ChFdjzthw
         1YbN6S/jnMFs4ypGb08HnpxUuboBuoNzQ3ZrItnIH8Zp5bdCown5kgyT0k2CgXzShEyx
         gJZlkBglGt3G4XFiFJo5mT666rJetncJDrnbIhBvOHOctmQFqkefpH9MZHNP4/NmvE6s
         sGfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762279814; x=1762884614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vqox3UkaoHNgrz/QIvGOJuxPYXtBZjdwtd1IyKwMyfs=;
        b=ah8LGxpfV1ETubMjb0+Ho7ELi6+oEBUp5uESD2nDi48eIbb1eJZzqgwsXUmGK/telj
         RZuEZuRnRPolIr1CE8tBGrk3jqow2pwTbtYwnBjpdsAS1bSCLyaSZoCQTZ3zFe/heObR
         RAdUTgy7U9AqDnH/v5halaMpWsnIT8TLaUYPkEsAudf2eXumhpI4z2sxSYm270B402m1
         5YuQNxfEsM0LrPLb5EnOgpWuqFHo8SvJ8jvSl1EzJakIKrroKGhnj6Vht5L/soNz6q15
         vQNKMhuahZK0FMIhhmSiAzEC/t4AvR7qNLJZOB95Ql2irsE67eYN5o/7U0L7CYZ09fKn
         GGJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVU05n/wKn2Q100u/4udW8+20Kdoza/P9Pb1BUa0O27iwrxfB67AHU52NFOswcb8hb3Ky22QA1/KRsMmqjWVgAn@lists.infradead.org
X-Gm-Message-State: AOJu0YxWaRcgOG21xiY50Qh8Af475c/dgzOlzn2zomn4iluD1WgdvSpC
	2ZgWXmRC3ddXncZW8yN2CfZIQw1TQnoEcAWqkrGLBkrndNPsxwnYlQue
X-Gm-Gg: ASbGncs/+XderQEyL4T0rTD9CD+oWxFeAMzfD6xy4j+DPMYzdSmgkDeJhmLRZXYIPag
	Va6YiqO/je0a2FPfXxVrwvtAvvzUzSV9/o0FgX8zAovr+L1xazBsmmkSVJHy2/SSwY7HMRQ1g5E
	XfIxQV8cusehWvG/rakVYBIfvUw2EkFPYXhItjZDHOhy467q0qJudKD4nO/9FUgpK6fgXaCEPf8
	KXgccW9kDMv5F3EJwSLgO5oco9wgyr3ZAdxf9DHGMkepu+i9sy5RZYhX2UotciOdJHLdTALMZ6J
	P31nmcchYndoS5Lb0P4lY90ypDlhaSOctSr/bnIzVGTn91jOrseCl0qCUXQqMPbpIe1+uE0YoT1
	77lqp4LAlr0cLptD38sybXGx587s4Qlu81LaLmDar76J2wZj+tJhSmIRrR2lzcQ1FnS3qvuHhED
	kzTGUFSGDQky/8v9MyxA==
X-Google-Smtp-Source: AGHT+IGHcjr5LVZvJCkn6ps5FsbaEzRecmaWoSpniwlTk12WxNdiygIkQQYkFJg+89wFF5L7fhoGZA==
X-Received: by 2002:a05:600c:821b:b0:477:54cd:2029 with SMTP id 5b1f17b1804b1-4775cdf4f48mr2528695e9.4.1762279814190;
        Tue, 04 Nov 2025 10:10:14 -0800 (PST)
Received: from jernej-laptop ([178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477558c1a03sm24688685e9.2.2025.11.04.10.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 10:10:13 -0800 (PST)
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
Subject: [PATCH v2 10/30] drm/sun4i: mixer: Move layer enabling to atomic_update
Date: Tue,  4 Nov 2025 19:09:22 +0100
Message-ID: <20251104180942.61538-11-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251104180942.61538-1-jernej.skrabec@gmail.com>
References: <20251104180942.61538-1-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_101016_342836_A37F397B 
X-CRM114-Status: GOOD (  13.37  )
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

Enable or disable layer only in layer atomic update callback. Doing so
will enable having separate layer driver later for DE33.

There is no fear that enable bit would be set incorrectly, as all
read-modify-write sequences for that register are now eliminated.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Tested-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
Changes in v2:
- rewrited commit message

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
2.51.2


