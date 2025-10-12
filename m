Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A0ACCCD18F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Oct 2025 19:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fXCSCCah2zJTGYn4GhhYKHAkgqZ3YCUPfwGM8ymVWuc=; b=gkvi6TxL3TCB9AYx63jm/lpVDL
	6Y9QuDzu2j+jHn9gWq4w7nu4yGKpyGmOWnGr5RDu9su74rVqh7RkQENab8l92r9RH3ZQB5oG1I6qm
	D7VFjE5UZFcEoyk38Z2ZH9BR1qVrV5HgK9EpDbVURLaHbXFGp97KulELHXeKHcdX9Y7wP/A8n1aRz
	yYQrHKTdNkO8Jwst3+KTE6+MDpDQCGnwuBdQ5cWEwwKArcozV//SkhxaALSjDcbTD5aeHcgcPiYgF
	V2LO9mmD15wMc4KOQ0KqcJAawbtAdcYMGwlu9DMqOY3cZJ905qCYnwszBuWv1ygJzRlABhpOKbydM
	XmkmxhJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v81fY-0000000BfZf-31xv;
	Sun, 12 Oct 2025 19:23:48 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v81fW-0000000BfWL-0P7C
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Oct 2025 19:23:47 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-b463f986f80so805945366b.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Oct 2025 12:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760297024; x=1760901824; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fXCSCCah2zJTGYn4GhhYKHAkgqZ3YCUPfwGM8ymVWuc=;
        b=Xp6HVyEHmFCaNnjd98oB5F4QrdkZT5ovkwCbKbb0qaLj7zrOHL0Z+BOZ5Delu4eRb4
         pKrfPDVYz37fR56w90O56LVWRqVDawoGeEiDicv2H+WanmkplowWXor+NqT2iFI3TvR2
         L+Z+/C374SKHvOU0idSkiBjxxDVKbscjx6FM/xn96DguJqJr1kUKJIPI8K2XmWjKEDJY
         S8FLTqM+MyxIUze9Aos7YwTyMcBYzCLbZu+eMesjZTvCqUN38XrQm2YSGuJkGjkHa1J9
         M7u1NDQiTlHNGOPjrJXFKTrsZPpuI094l1+FIMAvhcuzoXQ8bxg3jFjIHeWdMdUKB6v3
         GPMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760297024; x=1760901824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fXCSCCah2zJTGYn4GhhYKHAkgqZ3YCUPfwGM8ymVWuc=;
        b=Mqepav1dzNM+IQEI+s7DxKoycYhGSjUzxv9sqAdCO6PsI7fPcV+LFEKhMsf/VnYYEk
         8bMaqiJZj7Etd/Rhf1l6jcos9rhrIu5P3WR0IXzd0499o3jQjYD7Qxzq8MgEPurVuZ3U
         lvL4LSPdtR3HKnNF7v9+kVqs8mXhr0HMGPRC9gj+gL0nrspsQ513Sc9/FfNm2cQWLpt/
         Q9HHuUg+/Z65bdypxnJz1S/JCFr6IGPcjDT5/w0ZkrXxgYU5qQj5i0bYopu2RvmHkgd5
         e60f6ZqnuQ7AMhMGiyzOn3sRmGeM6ustXuvwIFt42F35BKscXzstFLKm6aRMy3YcouIF
         wYmA==
X-Forwarded-Encrypted: i=1; AJvYcCUvDlE++1G0I9iRdECQo691fUL6csXyKfa1mqsFx3WLDFcKjR/PZMQt+IStev4jwEwpJUO/r/K6Gje032Njf0pC@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7kIbRjfPIDAI9QyO12EBnvOqTn1I26Fc+GeId2v9Ig9gJnSdR
	ATUK11q8+M3BDE/o7eZqRFXf/HOfEO/XPPmmXVn+I33AfhV5TSCt9EYg
X-Gm-Gg: ASbGncv0gelR1Qo2CcTodWWKgQIGAtsh5IteRP6llUb2TFN2VzBV4WrKg3/aZItL/Gp
	/iJ6UyfLieNDpd2vqUmtcWHLOYznuAN6eMsgoCAaZIRmB/0t6L/dDtOhgD9u8y3ZnC/gw/ZJCM0
	H5DEcvxcXwPFvmc35trtr24JZttF5S+Tv3FWDnKd7wwppzGhuoTPET3AHT1kl+H0KbM3ysm2IZG
	E5hxwSuw8oYn+7UsNsP2h3SrG8NMyq6WhCRvU08bNbgThdUts3u5ln2NNUVnBRjs1PrMhFEMcfi
	VbZ/eoaoUc4ARQWBf704b2inl21qOgpW+T1DcnZ1Qoz4jWf22AbyplXgCztwwyBipnuQPrTFECx
	WXKkMomV2rRoqe8mHnw6E3RbT2P4TH3BzGEjWgdwHSgcn+tqc+CWg1IXqU3tP+NbWOANi0GTLH9
	FC3uZSrIsBMUIpghG2NebZhDUyN32McoOKj2d8EfLGBw==
X-Google-Smtp-Source: AGHT+IEiNoS/+6UzRTSzo2B8Y29/AU5s+BLBdQ9yTmKb3fJBI9Fgd7dqesLSL2/Rv8CrMfvApRR4kg==
X-Received: by 2002:a17:906:f584:b0:b43:b7ec:b8a1 with SMTP id a640c23a62f3a-b50aa38724bmr1988751866b.24.1760297024252;
        Sun, 12 Oct 2025 12:23:44 -0700 (PDT)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d67d8283sm760176466b.38.2025.10.12.12.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 12:23:43 -0700 (PDT)
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
Subject: [PATCH 04/30] drm/sun4i: ui_layer: Move check from update to check callback
Date: Sun, 12 Oct 2025 21:23:04 +0200
Message-ID: <20251012192330.6903-5-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251012192330.6903-1-jernej.skrabec@gmail.com>
References: <20251012192330.6903-1-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_122346_283849_5483CD20 
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

DRM requires that all checks are done in atomic_check callback. Move
one check from atomic_commit to atomic_update callback.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
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
2.51.0


