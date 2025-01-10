Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AF71E7719C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 07:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2jNHP4kZ+vx7B4mNnjwcHbIWUQy7cq2XYj5Zl2+8UJQ=; b=DKluBeXwj3nNv1SPwc/kLIfMFX
	d4kqPGGVAkK2WP38u9tN/7G59Df8+wbvhSD4UvddbC/sopZ8Bh9E5dVyYJuLuDCUbdM0vu7Tf7fQ6
	lPFSiMs+1nmcgalUiRZs7hJdrbvJa5nZdcWYw3+U9t0h6rJBvhCOe1/Jkhjx6nxkd4eQH6sK0ndNs
	/znpi+/xq+WSapFsTKICh6W9FRPQfa1WDMGn6+lpFZDfJYlqyAjxbYEoaxm+OTyNKKgu6XkCWs+Ko
	NYezQT0/TiQL4Uucq3/Q0ppPeyraagvmlN1itVL3YFpTui2+oQsgD4Ak/vtliv5oojtGfiCkUYGDb
	GnqV0hPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tW9lC-0000000EREU-16Hi;
	Fri, 10 Jan 2025 07:48:50 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tW9hf-0000000EQAz-3VZN;
	Fri, 10 Jan 2025 07:45:13 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-38632b8ae71so1195789f8f.0;
        Thu, 09 Jan 2025 23:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736495110; x=1737099910; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2jNHP4kZ+vx7B4mNnjwcHbIWUQy7cq2XYj5Zl2+8UJQ=;
        b=ONmp9EEv4k5oMc5SFU0NKRSA0Ju/P2gqQkpLoJXUd4RMkmhCmkjXvTsvovoH2v5dBk
         cLnRVxhZsLiGVhqXuMpfrsvUYYpc5MFiAcnGbE+jw6q9pMfhI/A9ItdokWVEv5HSIX+2
         ufh+YU99hO5q7+0Fm7RsExzm481zXOEZaEDEpPXG+g97ptgr2DJIy6GiKdUonz62Z5QM
         qIX4mEWXjt+tijy1/mixHah7+P46YmSgey/uQkc/vhG08+JYBiDXxsqvIwFG7lgrAHAq
         4D9CTkiXi9cRKF/Q5SQXedRC/VZ9hf3mvZl+GqJu9tUE+ktAR+AC/HC/p/jfm4BWqQpS
         vTkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736495110; x=1737099910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2jNHP4kZ+vx7B4mNnjwcHbIWUQy7cq2XYj5Zl2+8UJQ=;
        b=MogUocLyRkkHPzeAvU6ocMTcuHJ8+QeBmN1PyYYY5PenSRIP7GGOoxMXw4gZUSjc9/
         8OW2j3mnbYdTnhRC/6YAASJbTNUgl6hp4gQoTTzCLSOZ0ijk8e9Zh0q7clSBFflcDYsF
         QTEPBsQid7FIEikjvyjEfsnz2d2z4btIw6WM6cxQeI3yEVtzTXJhTRSqEeQ7bA/ViZdl
         ItjWgKoQ/tDkX8nCAw2C3qDfw+c64ejn5i6kF/JoFDI8TtjPDe6s+UIubTFaRJzTV/2T
         WY+WyBeUZstzV+yDF+jG9JpFMbgEpYdr7l7hdMI/1V8iWNygMBQhIs3+p5ZgOXaQflDV
         k39g==
X-Forwarded-Encrypted: i=1; AJvYcCWR/9FvEFyvUjAlRxd6SV/IvBjT6rE37lxGasUVKYMrhwj2Xr4/gQ0Wk4SUQ0ELF49NrOHfNqmS6zsBNYGG@lists.infradead.org, AJvYcCX9q2PELiFoywtDM3MpjlgaqywZIyihoDDzggokyr93nTRhCCaQ0Mo8Cb6o10fFF5xT80t0d5uVgyilkPh1MRtVLQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3TLr3S1VXv2iUGoMjNbso6LV7tlsgL5C6ajxHelPOY16+8NS2
	UqPILOUXThExhU+CJ6sPi70sXgm2zFWzMwx5uOUp5cW8Iw05gOMaZhCnBqhd
X-Gm-Gg: ASbGncs+gLuGxr1btrYPzv41XCJ4TvHWlEAnOM3f/Cp5o2Yxu0fqpGYmLkhzqldbQao
	JbU11MXybIH7L7rmHhwS1q87SPTx0+7ck+KHfnBVgn3TQB/LbQ7mNrA4vkmYrBuzvGcirQBSZFR
	KcIKIVnONmXwsAGMy01DSL1p321iaeQWGpK/7RoTCNd+bAE2a8rL23zEFZwtscoNwgzW7M3JfWh
	Pot/GyKze4tn9ysNxLCnoOSowvb0HG7kNBidx5Ek80NnJRAmdXTQmjbgFldcg==
X-Google-Smtp-Source: AGHT+IEWgMeyWDOA+o/1zzBIG4lq5Hb3irgWYUor5mMfHYLLxUho1JaxY7qlzPernGP85Damom0BMw==
X-Received: by 2002:a5d:5f8f:0:b0:38a:2b39:679d with SMTP id ffacd0b85a97d-38a87313e2cmr8298382f8f.32.1736495109806;
        Thu, 09 Jan 2025 23:45:09 -0800 (PST)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2e8a326sm78547995e9.35.2025.01.09.23.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 23:45:09 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] drm/meson: vclk: fix precision in vclk calculations
Date: Fri, 10 Jan 2025 07:44:58 +0000
Message-Id: <20250110074458.3624094-3-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250110074458.3624094-1-christianshewitt@gmail.com>
References: <20250110074458.3624094-1-christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_234511_911638_B471EFBC 
X-CRM114-Status: GOOD (  15.93  )
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

Playing YUV420 @ 59.94 media causes HDMI output to lose sync
with a fatal error reported:

[   89.610280] Fatal Error, invalid HDMI vclk freq 593406

In meson_encoder_hdmi_set_vclk the initial vclk_freq value is
593407 but YUV420 modes halve the value to 296703.5 and this
is stored as int which loses precision by rounding down to
296703. The rounded value is later doubled to 593406 and then
meson_encoder_hdmi_set_vclk sets an invalid vclk_freq value
and the error triggers during meson_vlkc_setup validation.

Fix precision in meson_encoder_hdmi_set_vclk by switching to
unsigned long long KHz values instead of int MHz. As values
for phy_freq are now more accurate we also need to handle an
additional match scenario in meson_vclk_setup.

Fixes: e5fab2ec9ca4 ("drm/meson: vclk: add support for YUV420 setup")
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 drivers/gpu/drm/meson/meson_encoder_hdmi.c | 42 +++++++++++-----------
 drivers/gpu/drm/meson/meson_vclk.c         |  3 +-
 2 files changed, 23 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
index 0593a1cde906..fa37cf975992 100644
--- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
@@ -70,12 +70,12 @@ static void meson_encoder_hdmi_set_vclk(struct meson_encoder_hdmi *encoder_hdmi,
 {
 	struct meson_drm *priv = encoder_hdmi->priv;
 	int vic = drm_match_cea_mode(mode);
-	unsigned int phy_freq;
-	unsigned int vclk_freq;
-	unsigned int venc_freq;
-	unsigned int hdmi_freq;
+	unsigned long long vclk_freq;
+	unsigned long long phy_freq;
+	unsigned long long venc_freq;
+	unsigned long long hdmi_freq;
 
-	vclk_freq = mode->clock;
+	vclk_freq = mode->clock * 1000ULL;
 
 	/* For 420, pixel clock is half unlike venc clock */
 	if (encoder_hdmi->output_bus_fmt == MEDIA_BUS_FMT_UYYVYY8_0_5X24)
@@ -85,8 +85,9 @@ static void meson_encoder_hdmi_set_vclk(struct meson_encoder_hdmi *encoder_hdmi,
 	phy_freq = vclk_freq * 10;
 
 	if (!vic) {
-		meson_vclk_setup(priv, MESON_VCLK_TARGET_DMT, phy_freq,
-				 vclk_freq, vclk_freq, vclk_freq, false);
+		meson_vclk_setup(priv, MESON_VCLK_TARGET_DMT, phy_freq / 1000ULL,
+				 vclk_freq / 1000ULL, vclk_freq / 1000ULL,
+				 vclk_freq / 1000ULL, false);
 		return;
 	}
 
@@ -107,12 +108,9 @@ static void meson_encoder_hdmi_set_vclk(struct meson_encoder_hdmi *encoder_hdmi,
 	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
 		venc_freq /= 2;
 
-	dev_dbg(priv->dev, "vclk:%d phy=%d venc=%d hdmi=%d enci=%d\n",
-		phy_freq, vclk_freq, venc_freq, hdmi_freq,
-		priv->venc.hdmi_use_enci);
-
-	meson_vclk_setup(priv, MESON_VCLK_TARGET_HDMI, phy_freq, vclk_freq,
-			 venc_freq, hdmi_freq, priv->venc.hdmi_use_enci);
+	meson_vclk_setup(priv, MESON_VCLK_TARGET_HDMI, phy_freq / 1000ULL,
+			 vclk_freq / 1000ULL, venc_freq / 1000ULL, hdmi_freq / 1000ULL,
+			 priv->venc.hdmi_use_enci);
 }
 
 static enum drm_mode_status meson_encoder_hdmi_mode_valid(struct drm_bridge *bridge,
@@ -122,10 +120,10 @@ static enum drm_mode_status meson_encoder_hdmi_mode_valid(struct drm_bridge *bri
 	struct meson_encoder_hdmi *encoder_hdmi = bridge_to_meson_encoder_hdmi(bridge);
 	struct meson_drm *priv = encoder_hdmi->priv;
 	bool is_hdmi2_sink = display_info->hdmi.scdc.supported;
-	unsigned int phy_freq;
-	unsigned int vclk_freq;
-	unsigned int venc_freq;
-	unsigned int hdmi_freq;
+	unsigned long long vclk_freq;
+	unsigned long long phy_freq;
+	unsigned long long venc_freq;
+	unsigned long long hdmi_freq;
 	int vic = drm_match_cea_mode(mode);
 	enum drm_mode_status status;
 
@@ -149,7 +147,7 @@ static enum drm_mode_status meson_encoder_hdmi_mode_valid(struct drm_bridge *bri
 	} else if (!meson_venc_hdmi_supported_vic(vic))
 		return MODE_BAD;
 
-	vclk_freq = mode->clock;
+	vclk_freq = mode->clock * 1000ULL;
 
 	/* For 420, pixel clock is half unlike venc clock */
 	if (drm_mode_is_420_only(display_info, mode) ||
@@ -179,10 +177,12 @@ static enum drm_mode_status meson_encoder_hdmi_mode_valid(struct drm_bridge *bri
 	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
 		venc_freq /= 2;
 
-	dev_dbg(priv->dev, "%s: vclk:%d phy=%d venc=%d hdmi=%d\n",
-		__func__, phy_freq, vclk_freq, venc_freq, hdmi_freq);
+	dev_dbg(priv->dev, "%s: phy=%lld vclk=%lld venc=%lld hdmi=%lld\n",
+		__func__, phy_freq / 1000ULL, vclk_freq / 1000ULL,
+		venc_freq / 1000ULL, hdmi_freq / 1000ULL);
 
-	return meson_vclk_vic_supported_freq(priv, phy_freq, vclk_freq);
+	return meson_vclk_vic_supported_freq(priv, phy_freq / 1000ULL,
+					     vclk_freq / 1000ULL);
 }
 
 static void meson_encoder_hdmi_atomic_enable(struct drm_bridge *bridge,
diff --git a/drivers/gpu/drm/meson/meson_vclk.c b/drivers/gpu/drm/meson/meson_vclk.c
index 2a82119eb58e..a2e93b500ed6 100644
--- a/drivers/gpu/drm/meson/meson_vclk.c
+++ b/drivers/gpu/drm/meson/meson_vclk.c
@@ -1070,7 +1070,8 @@ void meson_vclk_setup(struct meson_drm *priv, unsigned int target,
 
 	for (freq = 0 ; params[freq].pixel_freq ; ++freq) {
 		if ((phy_freq == params[freq].phy_freq ||
-		     phy_freq == FREQ_1000_1001(params[freq].phy_freq/10)*10) &&
+		     phy_freq == FREQ_1000_1001(params[freq].phy_freq/10)*10 ||
+		   ((phy_freq/10)*10) == FREQ_1000_1001(params[freq].phy_freq/10)*10) &&
 		    (vclk_freq == params[freq].vclk_freq ||
 		     vclk_freq == FREQ_1000_1001(params[freq].vclk_freq))) {
 			if (vclk_freq != params[freq].vclk_freq)
-- 
2.34.1


