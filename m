Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E593CEB2DA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Nov 2025 14:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TdxCYAFUxE8TEo/HdclUzBmM8/cH8lgIgGUaiseaWSY=; b=c2ps1Y+jtP3b13eRfcPQhR5EmG
	A4v2dqeCtXm26QDNwELcOh1CntcUa7r6XGVZZ3ICQdKoK+HEcavXu5VjPIC/AeOkJxPPiOG+FH7Y1
	8wk34hhVSCJL1YT+igjDy8RSr2WVi2307266kyA+Bfsa83U+9sD8VIzvmDU7fbeveqsMnvaJDJtnR
	EgWKJzXsTgH/Y03qe/7FrDkBDtxkD6nodYItdq9mji8ghjZHHw+Wjh2xfx0l7pZhQP0dM/fqbNIm6
	cjRFM9LGlDiyhOlG6epbgZbLNeet8Yk+dx5YauGUqcBdNk4DvAVdknc4vQvWKK4cmPlanSrpPCddT
	dNCADfxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKH2m-0000000DpkG-2VxV;
	Sat, 15 Nov 2025 14:14:24 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKH2f-0000000Dpgy-1qOS
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Nov 2025 14:14:18 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-64198771a9bso5467539a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Nov 2025 06:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763216056; x=1763820856; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TdxCYAFUxE8TEo/HdclUzBmM8/cH8lgIgGUaiseaWSY=;
        b=nnb56oPlKsg/txDnnbtlGKHpXWvT4fsQTVhrQvcXLfj38NvE0ptPEE/5NNdOlIV1kE
         eY5YoVdMTy1aHMyGrNe713Q1fxxZyxZb8ioTl1LFZ0aMyi549XDdbZCBcdljTuLtwVhp
         ZaORI5HxZx7Cj28Bb1cy2LF76dThcYxduMhqIRgPjHlPFM2BlV2mzTutx+5CfyUN+pi3
         vqL0PSup8m0fQiDO60tEV/fX9Xe3sp26zq/4LpRxx48IpsqID3JNT4IcvphDzNDrFd6d
         HxiAPaPOOohLh2jVuCn2PINNLEddjvEvzZ5hoNV7cDGDrbGRZ1niWMUb6AfHe2OZaSuk
         RROw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763216056; x=1763820856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TdxCYAFUxE8TEo/HdclUzBmM8/cH8lgIgGUaiseaWSY=;
        b=W5Q7iMRDdx6tFiQ50g4pj73pjpc8SdV+COPRLDhi7/yZe3u7NPp7446W5fiKZIoG4j
         NaJmIaLhIZgbI3S3ClhyFdGL/IWvzURFWGS2O4nCLOLQeY+kN8aL+R9+mM5yeMwYWhKz
         FHn1Pnugp/gDTqkmrSZGPk7WniCEPiM4qtPWQrvfcigpWossHyn8luilFHo70V4UncnD
         nnR8sP3YnaqWlfD361wAw7AYqKTSb498+jfYlohAPfmvKh/23VnAAkf4C8lgQEkUuj1i
         iTWUJYDuMTiBqb6IbD49n6N+8CC328JnYjRt8quoDOc3nYUusWNdVKycdI9l2/k+ry0R
         vNew==
X-Forwarded-Encrypted: i=1; AJvYcCUqEogJCWVVtigPB6QrGCgGlNAJzwKSI3QmiFLdp2NKSNygo4O2we/gQ5KqRXPddnsebvT5E6pAJ9W34Wb9nTtk@lists.infradead.org
X-Gm-Message-State: AOJu0YygmWGpANnPnt/Y9w14yzwiqLJUfJyNH7cSjXXowoWw/4/BCdHd
	Z3EN5X2GfEtNtWlNB2JtiISUxPIf92Ip2eLk/2m1H+DheY3f3Byre2nb
X-Gm-Gg: ASbGncuI2WQ837vsLnlvuhuYPYiiGA6vX0z01pcbgwZBWUeaotzrsqQACWdxAZJIZkd
	y+NpfjZqp9QgvdAAavxbrliBsFVK5FzLBcNR00ZQsUFLenPNxHbbWreUNfRu4U7H3Z2NjAON44k
	bnxWddyuAjuPRxwGUDkSlc1PiRf5jRHlD9hZ+qNcvDsNZOoVZo1hzcbCB6IH8mUWKR38u6WTkQw
	b8ma4AyMujWDc0s9B6Zw8cF+nz/TqMclyPGTscfpfwpQCITymeCWyOXk7le0QwfRecgR6z6DvBP
	q3OQ6zb0eiwlljwwHvDeU0FtWBwPyy4zOURHrhs3o6qx3Ob+uGO9JR4sEy6DoT2JEJhPhUFrFtk
	3IV/ZbjaxxdHAptzICqLHRW5zshPDTV/lQi16Opn6dhslvfT5GfaolSIwvN/3hywqiPBy3vusCW
	YG7nqSLkwucK+xnbuAyJ6g7gQxG7qbY6KKuSOKBMswBRX6og==
X-Google-Smtp-Source: AGHT+IFh8CjX1reglk+d9qFWiwVdzTnZZrgC6zCnkQGkRjSeca5TyFvpwvWCslriMZOQG7eYdwduUg==
X-Received: by 2002:a17:907:7f05:b0:b73:880a:fdb7 with SMTP id a640c23a62f3a-b73880b0177mr94905066b.35.1763216055478;
        Sat, 15 Nov 2025 06:14:15 -0800 (PST)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fda933fsm606189866b.56.2025.11.15.06.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 06:14:15 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
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
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 2/7] drm/sun4i: vi_layer: Limit formats for DE33
Date: Sat, 15 Nov 2025 15:13:42 +0100
Message-ID: <20251115141347.13087-3-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251115141347.13087-1-jernej.skrabec@gmail.com>
References: <20251115141347.13087-1-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251115_061417_511777_B9218D06 
X-CRM114-Status: GOOD (  13.39  )
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

YUV formats need scaler support due to chroma upscaling, but that's not
yet supported in the driver. Remove them from supported list until
DE33 scaler is properly supported.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 36 +++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 40008c38003d..baa240c4bb82 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -403,6 +403,37 @@ static const u32 sun8i_vi_layer_de3_formats[] = {
 	DRM_FORMAT_YVU422,
 };
 
+/*
+ * TODO: DE33 VI planes naturally support YUV formats but
+ * driver needs improvements in order to support them.
+ */
+static const u32 sun8i_vi_layer_de33_formats[] = {
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
@@ -432,7 +463,10 @@ struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 	layer->regs = regs;
 	layer->cfg = cfg;
 
-	if (layer->cfg->de_type >= SUN8I_MIXER_DE3) {
+	if (layer->cfg->de_type == SUN8I_MIXER_DE33) {
+		formats = sun8i_vi_layer_de33_formats;
+		format_count = ARRAY_SIZE(sun8i_vi_layer_de33_formats);
+	} else if (layer->cfg->de_type == SUN8I_MIXER_DE3) {
 		formats = sun8i_vi_layer_de3_formats;
 		format_count = ARRAY_SIZE(sun8i_vi_layer_de3_formats);
 	} else {
-- 
2.51.2


