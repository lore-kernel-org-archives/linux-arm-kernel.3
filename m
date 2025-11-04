Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40A8ECCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 18:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S/mUaml8jAYrXfg/EZn9k2T0kOPXbCuOkx1KYxiElS0=; b=u1yI21TX5jGvQ/+B2aTAtdNfnl
	+o5xk2KcAEXD8FwFtun+5UNVov2vLR4wSzJaIS2Lqgk/f49Hj8Lr5n0ac3x6oDOxLchyR0Hp+yABA
	OY3R5A9etM38c1676u61bMij0e5OGL6uz+26r3QTrJciZShwZfc2GC4EDOoBjPknVfFhq/LWm0Xw6
	wiHOqEdsC7eykxfcQHIVenOurclaLqDhtmsEki7Kgr4xfiOi8cyvQiyW/0WjzmyBOnuHUU7fII23A
	VDVyZ2UUMAMyiZD3/UadruIhSzoFYdMWoWyRzeWkstnml8kuIxsm5RXinbrPE/azxMtSpH/ph3GtO
	IgMq7J4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGLTv-0000000CLEs-30Zd;
	Tue, 04 Nov 2025 18:10:11 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGLTs-0000000CLB9-3VlS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 18:10:09 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-471b80b994bso75232935e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 10:10:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762279807; x=1762884607; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S/mUaml8jAYrXfg/EZn9k2T0kOPXbCuOkx1KYxiElS0=;
        b=TLiKkvwafLRQcn22dXgsbDHuaBUdhhH8plLcgG7Bo1xEJIMFsOY/ta2Yg2V5QxOv8H
         LwshvxQ8K4UxW6/AmDSBoR3yTFZ2PzvNPAjQsdhkOiEB0j95k4uMiHdAQC+rgb/Sl+C5
         GT8AbDE0U2dAAFidKLdrnDATc/3Tu7dTd9TAdjyWsandGtGJhCbsGsqpPVaJH7msLOPq
         OcCaA8RXFvZAIO+Q+NvEZJx5yNQjAnQ582oIuoP6EHN14agPTU+rgOuEdYggUFswC+Be
         7QuyrATEdqKBm6W6Hry8u+AIIyIUVlN2R+YKtb6hs1ywb0PiQx9o2eegD01SAB0V7Zq9
         qk6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762279807; x=1762884607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S/mUaml8jAYrXfg/EZn9k2T0kOPXbCuOkx1KYxiElS0=;
        b=JyVxIe4aKDpXTVNN9657bj5uTGByb63WS43nS04p+zXMqt0udAR6q02JO3k2g+BDQI
         1Jf2kfbykQJxAaMGd0TLnl/s3EULwkJcQPB/XO+P+7yyV9tMy7zHRA1aFzCfh1U5wI6N
         x/o4A81QpR1zPE3vNQk8pAgqWuAzKdDL34CmUDyvVWMDhQacP8YIF8VOTdt66bS46Khb
         +Btjqe94XhfFzTXpAGKVIgHgP1Et1VEp6ubeurSbJE7tE15uY3ETupeX/0w0HFA60s0A
         wEuhT8TUjlylllwLiXOW+jOhdnF1OnRx8k4x3ojTFfvy3wkIX0Uo0aYReMt5XBKuOjaE
         hZ7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVm39P9cH20sK4pJO4zMLnKI6t2q/nnuzQb12kzW8vSLfK4FCUiT+fU9ggr3AZ37I+zdZVV/K4Z5Z7JM4yxEexG@lists.infradead.org
X-Gm-Message-State: AOJu0YxjTtpueY132/la7pg1xFAcdLjARPJ+/TWCXrkjwh5OX3DxWJ9R
	HPi0OvLafnfyhIee5SKzDMwrf7Zs1SsjQdD4D9l6TS+t4EJSLRt43bWz
X-Gm-Gg: ASbGncsOHDtrVVJdX+REkCXUswyVVWABtp/yVLTNahiIbTZAc2LJ0h5IWo2ZsOgI/KH
	fZy45F/NXzEFyGcww3s9tzvRX2xfvZcEsasuCf+rvZ2QH2WxW83DxCTP9eP8YZLk7PR0CgRVj8+
	m6OM2vTxjqGtpmH8FCcAYtumtKIvc0PoWWDjA73lYcLfAo8KN21hA6jyIMkOL3MrRgeglblPe6K
	90YRPcx89B0y/Glvs4FYIsFKY4jkwvXwRhAWo7gUKgxeU1e3AS2zLpSYP6o7UYXcOHOukt03aAQ
	GNbyG1JLl2DJ6+nLHhJYmzjPGyYRnUxu9E7nRZbVOA58Yo/1o4dtYzDUyTnKbB8p9N90jj8kajd
	9BNkbWHkC6fVLFqWdeT++f+0mCx/bQuxK8QHPtV9+PDdaQ3uiXGR2rrNQbw+5JnfLeGwN1di/II
	vFVCoodAl9FMw8UQgIBStCkYX6DrMf
X-Google-Smtp-Source: AGHT+IFmRzImpuQKxnU59wlPaEzVIfge0eS811Rho4boK9lxVttq6F0W8N4VKTddLMFMzKY8tP/Egw==
X-Received: by 2002:a05:600c:608a:b0:475:de68:3c2e with SMTP id 5b1f17b1804b1-4775ce3ebedmr2220945e9.40.1762279806649;
        Tue, 04 Nov 2025 10:10:06 -0800 (PST)
Received: from jernej-laptop ([178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477558c1a03sm24688685e9.2.2025.11.04.10.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 10:10:06 -0800 (PST)
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
Subject: [PATCH v2 04/30] drm/sun4i: ui_layer: Move check from update to check callback
Date: Tue,  4 Nov 2025 19:09:16 +0100
Message-ID: <20251104180942.61538-5-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251104180942.61538-1-jernej.skrabec@gmail.com>
References: <20251104180942.61538-1-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_101008_893257_6FD33C08 
X-CRM114-Status: GOOD (  12.98  )
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

DRM requires that all checks are done in atomic_check callback. Move
one check from atomic_commit to atomic_check callback.

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Tested-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
Changes in v2:
- fixed commit message

 drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index 9b786e5c7f3c..fce7b265c5d8 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -134,16 +134,11 @@ static int sun8i_ui_layer_update_formats(struct sun8i_mixer *mixer, int channel,
 	struct drm_plane_state *state = plane->state;
 	const struct drm_format_info *fmt;
 	u32 val, ch_base, hw_fmt;
-	int ret;
 
 	ch_base = sun8i_channel_base(mixer, channel);
 
 	fmt = state->fb->format;
-	ret = sun8i_mixer_drm_format_to_hw(fmt->format, &hw_fmt);
-	if (ret || fmt->is_yuv) {
-		DRM_DEBUG_DRIVER("Invalid format\n");
-		return -EINVAL;
-	}
+	sun8i_mixer_drm_format_to_hw(fmt->format, &hw_fmt);
 
 	val = hw_fmt << SUN8I_MIXER_CHAN_UI_LAYER_ATTR_FBFMT_OFFSET;
 	regmap_update_bits(mixer->engine.regs,
@@ -201,7 +196,9 @@ static int sun8i_ui_layer_atomic_check(struct drm_plane *plane,
 	struct sun8i_layer *layer = plane_to_sun8i_layer(plane);
 	struct drm_crtc *crtc = new_plane_state->crtc;
 	struct drm_crtc_state *crtc_state;
-	int min_scale, max_scale;
+	const struct drm_format_info *fmt;
+	int min_scale, max_scale, ret;
+	u32 hw_fmt;
 
 	if (!crtc)
 		return 0;
@@ -211,6 +208,13 @@ static int sun8i_ui_layer_atomic_check(struct drm_plane *plane,
 	if (WARN_ON(!crtc_state))
 		return -EINVAL;
 
+	fmt = new_plane_state->fb->format;
+	ret = sun8i_mixer_drm_format_to_hw(fmt->format, &hw_fmt);
+	if (ret || fmt->is_yuv) {
+		DRM_DEBUG_DRIVER("Invalid plane format\n");
+		return -EINVAL;
+	}
+
 	min_scale = DRM_PLANE_NO_SCALING;
 	max_scale = DRM_PLANE_NO_SCALING;
 
-- 
2.51.2


