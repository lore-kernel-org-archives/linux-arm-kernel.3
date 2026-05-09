Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A930CD3447
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 May 2026 19:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OFHSVkKikAqL7V5/tk/bF1gVjwq2bK7i4HjBHfLDqaU=; b=AiSMlD6sBF9aGp7YkA+QWMHiwG
	exfSzurMWkrEKuwvPwWdpHGAXNFMIZ0Ob44KnR6wvssM3zLaT37Fn5Rxtl63/mtQznBR6brPmBK7D
	WV+7UaasD9HNK2o2i/aPfoVXKeD2eVbA68FScJRRVc2tFaQCIpHQ+MHTRs/Tya/9HJkmOT9Z8sGf5
	XJHXX+kPMugpxYBq6KUBYawzMqi85iYmA88UTu0+ZqthaRTtWKgqZDCM3PC0DdDC1NLOAnDMb6uvk
	mZ8huS6C3kNkHaf16OJVrhaQSHvgm28Ge+HwamxLpvI/GlBxVU32U/hhtA9E/0es5XgkSfUNTPLmc
	4ZmG2+3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLmuf-00000009THo-1Wki;
	Sat, 09 May 2026 19:00:33 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLmua-00000009TDe-0S8e
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 May 2026 19:00:29 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-44a044cb827so2348036f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 09 May 2026 12:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778353226; x=1778958026; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OFHSVkKikAqL7V5/tk/bF1gVjwq2bK7i4HjBHfLDqaU=;
        b=bg1Nidf4K80w68aOgPqQndlcN3qBKcSZFvghx1Tu/4JmqA5QKbuq7akkqn7Mlfnfbh
         EqFV/a21BWV47Rkpdj834MMAeS+cnXfTsE5t33EWvlCqxrODFxuvAgyA2wbSwHidBNvd
         /JhoYo/S2yo4vN1wwehJpbpsSZz+438ii6dJxMldBU0Q2lWP+Mh2ZpC5E4oLAfOu0jfI
         nGd82AXBdMidmNytYFDJ06srY3u+JP4aLv38WGOIjMwXCxJzbpqXxhFr+2JgFtCKSUJG
         u0j9q4olxkg2xQXtjQHmIoFYwwX4UbI2PiRYH9OHvT2FzVa413sd8CaMLc/dhSYgAMja
         Jfrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778353226; x=1778958026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OFHSVkKikAqL7V5/tk/bF1gVjwq2bK7i4HjBHfLDqaU=;
        b=skHr6qVm1B7NLy3uI37S00TnBa+Mq9js0g+blpI3dg538qNEJ/AMmxa0qtcdEwYae5
         IBdRvJnAfHJxp/PkZEK5zpvPECUFCEsqiqjhlbc/xOxP3TJDECBe0cf2Jm86IxnSwENe
         GIFmbKYPWqshmxmLOPl+w3gSi7ILChaE+dvkDtohYwQyWPI8labo5UCyC7YkGfBBje+2
         pj18rNfv9bA5pGcWcaVZmYsXYlTCuWgpvoDXlT7u2bNo3u/cm3FFrzBvY7BHDSiBURy/
         jGzGlGDjnuT6tcsXq64wPhfcD3hftBgLkkC+PxZmSDQenVUu94hm+ZbBIZQcjnmrXikW
         yyEg==
X-Forwarded-Encrypted: i=1; AFNElJ8pxpEMBmYF9ULxlzvaTrjiCp0Uw4HK5OgCx2GoD8pNWAskMK3fPF+7YbRqy7UtkCl6rS2asG7hEGGKL4GZB6I8@lists.infradead.org
X-Gm-Message-State: AOJu0YyteNeVAliVMLrM6uYfwBnD8NtPZlfJO20VY8istuw0ObqVx8Wv
	dARwtd7zBvJQTA4f1yg4VgH/D01dZai70ZM1v2NZt5sM/rv5xMPnNy23
X-Gm-Gg: Acq92OH/aZGqqb5dLx0EUwqWIe0Y272Thp9HmKEvd84ThbIfZT9CUBNTn1X6KS2+T3x
	GpTRaVW+IGTj4jaoOsseGcsitg0jMgKsPSMRlbJN82g8/DHBnW61aUheDEqY6MyIkKVc3N5/c19
	HMG20c/XxoFBNaVHPM2L8mo8qxCmCkKOc0nYaDnNm8JcSVd47F6ZGyNmg5HG49VbOnPJvFcwxnx
	sRGNvjr5jYjRZh+Me9q5jgQOlcEUFCc/w5/sF3b6xnDswhaLRuqG4F4+OZUU2B37Kxh96m65Y9Z
	NpXnMmt6d4FKsOelEmmfTBqt239xtORFrGYgnABcy6zk1RE5ONTUIrwG+KhhKKz2cu8ta7TuJIp
	n8IB3fuRkNrAg4OXoIpoorcIEr/LkuSDj32x/D3Gb53QlPwHiF55DdxJb/ttuVtk2Jr2S/vIN8s
	yRK824PWs4cfm0X0enl5BzuGYPT4+9CacX0BOYsryvzkZo/ispdw9QdYvxlYJeaXM7mIs=
X-Received: by 2002:a05:6000:40dc:b0:43d:309b:9c4f with SMTP id ffacd0b85a97d-4515b056c90mr27920879f8f.6.1778353225999;
        Sat, 09 May 2026 12:00:25 -0700 (PDT)
Received: from jernej-laptop (46-150-62-216.dynamic.telemach.net. [46.150.62.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-454913049ecsm13254407f8f.19.2026.05.09.12.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 12:00:25 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
X-Google-Original-From: Jernej Skrabec <jernej.skrabec@siol.net>
To: wens@csie.org,
	samuel@sholland.org
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	jernej.skrabec@gmail.com,
	Chen-Yu Tsai <wens@kernel.org>
Subject: [PATCH v2 4/8] drm/sun4i: vi_layer: Limit formats for DE33
Date: Sat,  9 May 2026 21:00:11 +0200
Message-ID: <20260509190015.79086-5-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260509190015.79086-1-jernej.skrabec@siol.net>
References: <20260509190015.79086-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260509_120028_175331_021702FD 
X-CRM114-Status: GOOD (  15.41  )
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

From: Jernej Skrabec <jernej.skrabec@gmail.com>

YUV formats need scaler support due to chroma upscaling, but that's not
yet supported in the driver. Remove them from supported list until
DE33 scaler is properly supported.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
Changes from v1:
- collected tag
- generalize check to be dependant on scaler feature

 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 40 ++++++++++++++++++++++++--
 1 file changed, 38 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index cd8d6c2da0c7..afbd41a18a0e 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -380,6 +380,33 @@ static const u32 sun8i_vi_layer_de3_formats[] = {
 	DRM_FORMAT_YVU422,
 };
 
+static const u32 sun8i_vi_layer_de3_no_yuv_formats[] = {
+	DRM_FORMAT_ABGR1555,
+	DRM_FORMAT_ABGR2101010,
+	DRM_FORMAT_ABGR4444,
+	DRM_FORMAT_ABGR8888,
+	DRM_FORMAT_ARGB1555,
+	DRM_FORMAT_ARGB2101010,
+	DRM_FORMAT_ARGB4444,
+	DRM_FORMAT_ARGB8888,
+	DRM_FORMAT_BGR565,
+	DRM_FORMAT_BGR888,
+	DRM_FORMAT_BGRA1010102,
+	DRM_FORMAT_BGRA5551,
+	DRM_FORMAT_BGRA4444,
+	DRM_FORMAT_BGRA8888,
+	DRM_FORMAT_BGRX8888,
+	DRM_FORMAT_RGB565,
+	DRM_FORMAT_RGB888,
+	DRM_FORMAT_RGBA1010102,
+	DRM_FORMAT_RGBA4444,
+	DRM_FORMAT_RGBA5551,
+	DRM_FORMAT_RGBA8888,
+	DRM_FORMAT_RGBX8888,
+	DRM_FORMAT_XBGR8888,
+	DRM_FORMAT_XRGB8888,
+};
+
 static const uint64_t sun8i_layer_modifiers[] = {
 	DRM_FORMAT_MOD_LINEAR,
 	DRM_FORMAT_MOD_INVALID
@@ -410,8 +437,17 @@ struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 	layer->cfg = cfg;
 
 	if (layer->cfg->de_type >= SUN8I_MIXER_DE3) {
-		formats = sun8i_vi_layer_de3_formats;
-		format_count = ARRAY_SIZE(sun8i_vi_layer_de3_formats);
+		/*
+		 * TODO: DE33 drivers doesn't support scaling yet, which is a
+		 * requirement for YUV support.
+		 */
+		if (layer->cfg->scaler_mask & BIT(phy_index)) {
+			formats = sun8i_vi_layer_de3_formats;
+			format_count = ARRAY_SIZE(sun8i_vi_layer_de3_formats);
+		} else {
+			formats = sun8i_vi_layer_de3_no_yuv_formats;
+			format_count = ARRAY_SIZE(sun8i_vi_layer_de3_no_yuv_formats);
+		}
 	} else {
 		formats = sun8i_vi_layer_formats;
 		format_count = ARRAY_SIZE(sun8i_vi_layer_formats);
-- 
2.54.0


