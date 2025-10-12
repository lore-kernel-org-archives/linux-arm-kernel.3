Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E846DCCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Oct 2025 19:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hnlOJ2n+kaG3xIG2KBBQJX6KsaJhFDRkiLuLt3jD0qw=; b=nBeQslwhlOXl04QVf4YSFiCVSi
	/I6C1ZPaqexdputH7KRpgqKKqGXpGBOtVEn7zYIj9oXk+bp8PR8wBJi5mOnPU5Xb/CUhuw2jKoYQy
	IKuWhg604gZOCY3ESTQ6BGsQcDUPmu7lcYYfbBbwUpmX1XIc6ZX2lPys7h+bJRo2uDfl2r5SNh97/
	5WpuV8TP6kABycMHcf5bRS6OqxHYpII2dxZhwQfQAszGyM//pOQKrVUfQewCvGRGOyJiZcZKAo0oN
	hb/Mx8oS5VvamoG6bsz6KTmS33/omF+aT7+sJf+PnIIPA3lqsBYlolJmYG7EyIa/VuekSz5Yop0bN
	P8zzXK1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v81fd-0000000BfeA-0Y4A;
	Sun, 12 Oct 2025 19:23:53 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v81fX-0000000BfWw-0XJF
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Oct 2025 19:23:48 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-afcb7ae31caso728476466b.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Oct 2025 12:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760297025; x=1760901825; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hnlOJ2n+kaG3xIG2KBBQJX6KsaJhFDRkiLuLt3jD0qw=;
        b=SEwMgf09PBaU4cfh8LfvEGglpQ4M5iyegGjHtvNBClPck311xwuEW4BM3p07ib4qsR
         OQrVwia/sEiMCDuC++OF5Pv67HN+Gdw7rSnhqsheCYEe0j9z17sF/wMU4OPzKtECpUNY
         q5LXAoX0W0SLTyz4zqcF/6Hksh1zhzJwMheucJahrD8wGbL2zIfj97ExnS2Dyp4P3iBr
         5WMl5d/kNdkqNbk76exwiiNWhkEBzLJkcHg8MrBTUU6df4m1vQ8hzM/or5pQHFyHiYVi
         olhNEU1EWfm9B8YWNLuMs7H0pAFrQ50++QTgyZsqtrqDQLOopc2C6u3A7I2mrMRJxlvj
         /D6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760297025; x=1760901825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hnlOJ2n+kaG3xIG2KBBQJX6KsaJhFDRkiLuLt3jD0qw=;
        b=tQNTMAS7rmOeBORTrAVWUDBge4kHXO8TKcJafozI/PtraVT3DbNrNqlwm35Pb0PmzB
         +t+PpQXwnmzO/KvK0ZeNW10ozBGckdDe5k+7v/+Wi4R+T1g59nCmPZnYF/poy0jcVAmj
         rATY0nHUHziDtU0opTyOwPzPll9fnekusfDqJht1GMbFsjvOnHORJJc16QdEp11k6KlM
         rPh082ajAHrf83EbRba6yWvI0EROjbgpGMrvQHojbboFtHXG5yL6uyqzzvbaF/I8k8w5
         8dJ18U3X+H4nqntN0Xbyy9V/b13SaaOuXqfol2KNxzCY1KfeFUWnw6nZz+6xekVBpKs3
         UXcA==
X-Forwarded-Encrypted: i=1; AJvYcCU+awcX89BXB01GdeER4cwmdKiicCq4CrJyismQXK2lFv/FKvL6vkD6zk860sgF56T38hc+RTPKpIwmsFbGBGaU@lists.infradead.org
X-Gm-Message-State: AOJu0YzQY1Jay4TUokA5yt0GtLEg632iZld6kT6yf4Qbbmt+zE6ATsft
	BvwgbKYc/9lTqU7lOVdhGwWRCZ3rjISrWaJG10X7omtfEXFV+sVs7Izh
X-Gm-Gg: ASbGncsmPGFI2IB3Ye0ZxpMI0RQ2k1gwK4B6dQi3Q/ht+plvLuqj1eQb+6iyc3G+Ya6
	Vrf8YyL8Njl7oK20QyUVAaoWSmB0SSLatBIWM3wh9NogG7l+O3KhKfwngu6XW90YV2JpNEcfAPx
	nRPFTPRxfdALa3U+trxAcxjDKrr+kOKyWBumdYIY+uX8h0umTDnq/vUbcCWB1TW5UY8/Y3LRJu3
	nRFDCSeKvZ+7hAdOjU/bXJFbr7DnabsqNMROrNrS+rp+mPclJq53SdZ57yI0ffA3E3qrQucdsqN
	GjejN3lunGwzFbZE4Nl1je0B0vwE3A8GTnxsUvOp2JTVW+Zawm0E96T5ElP5phcoO/li1VXqm31
	OkjW8oMFqkMjWpmFbDS9gHBTNzRHb3XdZyrDxhjF1b8JHUoZywU1cjgtOQrgCstcVps7e0F5n3J
	dIKrpUXNSpdLg+yuTebLYE
X-Google-Smtp-Source: AGHT+IFJXFSppj2HoIPfT0DNF82Abv4mtxDvrxkAHw6b76kGPg7cFa3ESgHvRApJqFhlZJceziWZkw==
X-Received: by 2002:a17:906:c149:b0:b45:60ad:daf1 with SMTP id a640c23a62f3a-b50aa8a92e3mr1797895266b.22.1760297025416;
        Sun, 12 Oct 2025 12:23:45 -0700 (PDT)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d67d8283sm760176466b.38.2025.10.12.12.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 12:23:45 -0700 (PDT)
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
Subject: [PATCH 05/30] drm/sun4i: vi_layer: Move check from update to check callback
Date: Sun, 12 Oct 2025 21:23:05 +0200
Message-ID: <20251012192330.6903-6-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251012192330.6903-1-jernej.skrabec@gmail.com>
References: <20251012192330.6903-1-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_122347_315953_E0F2988B 
X-CRM114-Status: GOOD (  12.42  )
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
one check from atomic_commit to atomic_update callback.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
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
2.51.0


