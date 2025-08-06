Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93C5FC87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 18:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KMoxd/Dtadzsy2TCiR8kFe7kGYsf87uO6nSdEOT8I+M=; b=2RPcfgiZs/HpnR37k0tEXu37CU
	Lqw1kit8tUbNrTGLFpKlYGCGDn66loRIQ6fCz4oVQnp6iK+AYgK4eMIuw9RP1hzLhBOSnCBP/jIUu
	dvr7ux48Q+FM8FIYjA+2LYn86YgYulT+t/PDDlhAeb+F/xhE6viYFopderAam5XERu6tuTncJJWj8
	Txr51y9Gk5AsoLFxNIQt04tGUw2JVBOvHaSS/UyrGGDv49v6CkN5gKyHUSTPdMf8phMbxiYkozuPl
	MHAdfp4f114KhaxYnm6Vc27Fjx8lU4dN+DLFCmJdtuwIx0RZHnGFRP7okD9SuOUVjqW6IscnBaGep
	xkz7QxWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujj8K-0000000G6uN-1eAJ;
	Wed, 06 Aug 2025 18:45:04 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujiuh-0000000G4nH-2Vc5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 18:31:00 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3b78b2c6ecfso64527f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Aug 2025 11:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754505058; x=1755109858; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KMoxd/Dtadzsy2TCiR8kFe7kGYsf87uO6nSdEOT8I+M=;
        b=WXq0m4BcmHC8lgH6ZWphkkC+LCLNzpWe+1scaTZtXe09jVqZoOZLR9PkxwwmdAVB2L
         FoT/WvA6KfTykrEUZNvx/apV1bdjkwysVReGeBhlIe+QGt8LQh4Gql9+ozkaXSf2b6t5
         yqpa3tRUhAgMswcutD7juaWr2Jxj/a3WHbEHaVS/9pvJrUqvBa1SyOjYv/h7viQpZjK/
         +UzCgWSy5Xzu/zRUPUvKH14XZxSEFYMLVi8tIldrGsivPjFL+ovxaO8gQMq3Ah029Kjg
         exrVKuQvfHR7HYVo1JX16mUZDrtbFUpEgEo2CwHc9LLQM/uXzq91uz4zdbVYS1/WcDoS
         tTbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754505058; x=1755109858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KMoxd/Dtadzsy2TCiR8kFe7kGYsf87uO6nSdEOT8I+M=;
        b=rCHK7na2qGDClHArQvgVgGDdy0a/mLj8gU/4uzwdWKQuva+rS9I5/abDdzfdSa2b9+
         PmcLZOmURf0MB6Cmz+Zm6pZ1cpSt0/1UJmEKmiHjIrE4SpXkLWQfx6Gs2n+/VpGs1DpC
         /lz1TdPwCIj6nhmUZMshRz/r9OhZxn/p2NOIW/2LfrNxhzrX1DwEjcZw/1w3YjHUNVub
         ghpa75PqCbdO5+EcrTYsRp6mDNn0C1U3XoUdVYJKxVmWJfsNLsu+kaKM5PRnHOjlVo5M
         pB1E3FyE1rNHIDGBRqfRq5vE15b8zefrw/HPJkhrvKNrWe0E4UIVAwo2qKqwiMtspNZ/
         VF5g==
X-Forwarded-Encrypted: i=1; AJvYcCVcegpHrWAZEo1bBVGHVnSB5HjK/bsb8PoU8SDzAWXMsIiL2HwOYQcbrqzsLLItmLmjY/nT03z6COJExzqyxVDm@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3ULZ3oqsXTJR3FqO+Tz2k8r/KLiP2x4g7hQQwH0k2L10uDJ0t
	oMEucX0W9nWbA35cuXugMopEI8kRU5G5wDJyM85qCtcBa93pItmUaJZK
X-Gm-Gg: ASbGncvNjCMFbJg9s5v2pxf+Tb8P+XujygodOkH3acpPBKFEyeqbhJZzoMn0zIaDdsz
	39GUdVnZY5nzb/GG6CKkBFBYxXHQeDlUFPLK1ldQ1FrIDL5lDuWNfgnfkUSx0+BWPM+N+9IImD4
	PmxAk4O9fTCTdL6Wwlyy3Fu2qRrVazi+lYIhebTz+JPPH02gcj0QSMhlBVND85C07L6FJuuJ2St
	RLW+51dUbrzdZyhvUM9GLR1ODrwK0/2ZcDACtHF0emQ6JTRNdNiUoYrpSCtiwAgiyYZLbaYw7jv
	rUU0nGzIt2zjNKfAaFxfs3XxYiphhI03YIx0XO9KLXZl4P+rrXThE1fmDy0kVjk3uNQ4bIKZWsT
	zxdonuYnFYWBi4gC5Y9T2vurjbwdoDvt6tfk3MAx29wWuVTzur5ii5MCUVI25GsCwv/PS39vIHp
	o=
X-Google-Smtp-Source: AGHT+IFV6VxxjKWucmbCsDSr/60Mju0iKC0OAZ6zMp3uTJRxh8IJaaXS1z0E5eQ2EA47SgnGxXvy9w==
X-Received: by 2002:a05:6000:2312:b0:3a6:c923:bc5f with SMTP id ffacd0b85a97d-3b8f4165fb2mr3101027f8f.17.1754505057803;
        Wed, 06 Aug 2025 11:30:57 -0700 (PDT)
Received: from ekhafagy-ROG-Zephyrus-M16-GU603HR-GU603HR.. ([156.204.172.189])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459c58ed07fsm156104065e9.22.2025.08.06.11.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 11:30:57 -0700 (PDT)
From: Eslam Khafagy <eslam.medhat1993@gmail.com>
To: 
Cc: skhan@linuxfoundation.com,
	Eslam Khafagy <eslam.medhat1993@gmail.com>,
	Manikandan Muralidharan <manikandan.m@microchip.com>,
	Dharma Balasubiramani <dharma.b@microchip.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/1] drm: atmel-hlcdc: replace dev_* print funtions with drm_* variants
Date: Wed,  6 Aug 2025 21:30:41 +0300
Message-ID: <20250806183049.52112-2-eslam.medhat1993@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250806183049.52112-1-eslam.medhat1993@gmail.com>
References: <20250806183049.52112-1-eslam.medhat1993@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_113059_638518_1BB4F339 
X-CRM114-Status: GOOD (  12.82  )
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

According to documentation[1] drm_* variants are preferred over dev_*
print functions.

[1] https://docs.kernel.org/gpu/todo.html#convert-logging-to-drm-functions-with-drm-device-parameter

v1->v2
replace dev_dbg with drm_dbg  in atmel_hlcdc_plane.c

Signed-off-by: Eslam Khafagy <eslam.medhat1993@gmail.com>
---
 .../gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c    | 20 +++++++++----------
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c  | 14 ++++++-------
 .../gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c  |  2 +-
 .../gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c   |  6 +++---
 4 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
index 0f7ffb3ced20..da94ab0540bb 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
@@ -215,32 +215,32 @@ static void atmel_hlcdc_crtc_atomic_disable(struct drm_crtc *c,
 		if (regmap_read_poll_timeout(regmap, ATMEL_HLCDC_SR, status,
 					     !(status & ATMEL_XLCDC_CM),
 					     10, 1000))
-			dev_warn(dev->dev, "Atmel LCDC status register CMSTS timeout\n");
+			drm_warn(dev, "Atmel LCDC status register CMSTS timeout\n");
 
 		regmap_write(regmap, ATMEL_HLCDC_DIS, ATMEL_XLCDC_SD);
 		if (regmap_read_poll_timeout(regmap, ATMEL_HLCDC_SR, status,
 					     status & ATMEL_XLCDC_SD,
 					     10, 1000))
-			dev_warn(dev->dev, "Atmel LCDC status register SDSTS timeout\n");
+			drm_warn(dev, "Atmel LCDC status register SDSTS timeout\n");
 	}
 
 	regmap_write(regmap, ATMEL_HLCDC_DIS, ATMEL_HLCDC_DISP);
 	if (regmap_read_poll_timeout(regmap, ATMEL_HLCDC_SR, status,
 				     !(status & ATMEL_HLCDC_DISP),
 				    10, 1000))
-		dev_warn(dev->dev, "Atmel LCDC status register DISPSTS timeout\n");
+		drm_warn(dev, "Atmel LCDC status register DISPSTS timeout\n");
 
 	regmap_write(regmap, ATMEL_HLCDC_DIS, ATMEL_HLCDC_SYNC);
 	if (regmap_read_poll_timeout(regmap, ATMEL_HLCDC_SR, status,
 				     !(status & ATMEL_HLCDC_SYNC),
 				    10, 1000))
-		dev_warn(dev->dev, "Atmel LCDC status register LCDSTS timeout\n");
+		drm_warn(dev, "Atmel LCDC status register LCDSTS timeout\n");
 
 	regmap_write(regmap, ATMEL_HLCDC_DIS, ATMEL_HLCDC_PIXEL_CLK);
 	if (regmap_read_poll_timeout(regmap, ATMEL_HLCDC_SR, status,
 				     !(status & ATMEL_HLCDC_PIXEL_CLK),
 				    10, 1000))
-		dev_warn(dev->dev, "Atmel LCDC status register CLKSTS timeout\n");
+		drm_warn(dev, "Atmel LCDC status register CLKSTS timeout\n");
 
 	clk_disable_unprepare(crtc->dc->hlcdc->sys_clk);
 	pinctrl_pm_select_sleep_state(dev->dev);
@@ -269,32 +269,32 @@ static void atmel_hlcdc_crtc_atomic_enable(struct drm_crtc *c,
 	if (regmap_read_poll_timeout(regmap, ATMEL_HLCDC_SR, status,
 				     status & ATMEL_HLCDC_PIXEL_CLK,
 				     10, 1000))
-		dev_warn(dev->dev, "Atmel LCDC status register CLKSTS timeout\n");
+		drm_warn(dev, "Atmel LCDC status register CLKSTS timeout\n");
 
 	regmap_write(regmap, ATMEL_HLCDC_EN, ATMEL_HLCDC_SYNC);
 	if (regmap_read_poll_timeout(regmap, ATMEL_HLCDC_SR, status,
 				     status & ATMEL_HLCDC_SYNC,
 				     10, 1000))
-		dev_warn(dev->dev, "Atmel LCDC status register LCDSTS timeout\n");
+		drm_warn(dev, "Atmel LCDC status register LCDSTS timeout\n");
 
 	regmap_write(regmap, ATMEL_HLCDC_EN, ATMEL_HLCDC_DISP);
 	if (regmap_read_poll_timeout(regmap, ATMEL_HLCDC_SR, status,
 				     status & ATMEL_HLCDC_DISP,
 				     10, 1000))
-		dev_warn(dev->dev, "Atmel LCDC status register DISPSTS timeout\n");
+		drm_warn(dev, "Atmel LCDC status register DISPSTS timeout\n");
 
 	if (crtc->dc->desc->is_xlcdc) {
 		regmap_write(regmap, ATMEL_HLCDC_EN, ATMEL_XLCDC_CM);
 		if (regmap_read_poll_timeout(regmap, ATMEL_HLCDC_SR, status,
 					     status & ATMEL_XLCDC_CM,
 					     10, 1000))
-			dev_warn(dev->dev, "Atmel LCDC status register CMSTS timeout\n");
+			drm_warn(dev, "Atmel LCDC status register CMSTS timeout\n");
 
 		regmap_write(regmap, ATMEL_HLCDC_EN, ATMEL_XLCDC_SD);
 		if (regmap_read_poll_timeout(regmap, ATMEL_HLCDC_SR, status,
 					     !(status & ATMEL_XLCDC_SD),
 					     10, 1000))
-			dev_warn(dev->dev, "Atmel LCDC status register SDSTS timeout\n");
+			drm_warn(dev, "Atmel LCDC status register SDSTS timeout\n");
 	}
 
 	pm_runtime_put_sync(dev->dev);
diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
index fa8ad94e431a..acb017a2486b 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
@@ -724,19 +724,19 @@ static int atmel_hlcdc_dc_modeset_init(struct drm_device *dev)
 
 	ret = atmel_hlcdc_create_outputs(dev);
 	if (ret) {
-		dev_err(dev->dev, "failed to create HLCDC outputs: %d\n", ret);
+		drm_err(dev, "failed to create HLCDC outputs: %d\n", ret);
 		return ret;
 	}
 
 	ret = atmel_hlcdc_create_planes(dev);
 	if (ret) {
-		dev_err(dev->dev, "failed to create planes: %d\n", ret);
+		drm_err(dev, "failed to create planes: %d\n", ret);
 		return ret;
 	}
 
 	ret = atmel_hlcdc_crtc_create(dev);
 	if (ret) {
-		dev_err(dev->dev, "failed to create crtc\n");
+		drm_err(dev, "failed to create crtc\n");
 		return ret;
 	}
 
@@ -778,7 +778,7 @@ static int atmel_hlcdc_dc_load(struct drm_device *dev)
 
 	ret = clk_prepare_enable(dc->hlcdc->periph_clk);
 	if (ret) {
-		dev_err(dev->dev, "failed to enable periph_clk\n");
+		drm_err(dev, "failed to enable periph_clk\n");
 		return ret;
 	}
 
@@ -786,13 +786,13 @@ static int atmel_hlcdc_dc_load(struct drm_device *dev)
 
 	ret = drm_vblank_init(dev, 1);
 	if (ret < 0) {
-		dev_err(dev->dev, "failed to initialize vblank\n");
+		drm_err(dev, "failed to initialize vblank\n");
 		goto err_periph_clk_disable;
 	}
 
 	ret = atmel_hlcdc_dc_modeset_init(dev);
 	if (ret < 0) {
-		dev_err(dev->dev, "failed to initialize mode setting\n");
+		drm_err(dev, "failed to initialize mode setting\n");
 		goto err_periph_clk_disable;
 	}
 
@@ -802,7 +802,7 @@ static int atmel_hlcdc_dc_load(struct drm_device *dev)
 	ret = atmel_hlcdc_dc_irq_install(dev, dc->hlcdc->irq);
 	pm_runtime_put_sync(dev->dev);
 	if (ret < 0) {
-		dev_err(dev->dev, "failed to install IRQ handler\n");
+		drm_err(dev, "failed to install IRQ handler\n");
 		goto err_periph_clk_disable;
 	}
 
diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c
index 50fee6a93964..945a475c33ac 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c
@@ -92,7 +92,7 @@ static int atmel_hlcdc_attach_endpoint(struct drm_device *dev, int endpoint)
 	output->bus_fmt = atmel_hlcdc_of_bus_fmt(ep);
 	of_node_put(ep);
 	if (output->bus_fmt < 0) {
-		dev_err(dev->dev, "endpoint %d: invalid bus width\n", endpoint);
+		drm_err(dev, "endpoint %d: invalid bus width\n", endpoint);
 		return -EINVAL;
 	}
 
diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
index 4a7ba0918eca..817284509b57 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
@@ -1034,7 +1034,7 @@ static void atmel_hlcdc_irq_dbg(struct atmel_hlcdc_plane *plane,
 	if (isr &
 	    (ATMEL_HLCDC_LAYER_OVR_IRQ(0) | ATMEL_HLCDC_LAYER_OVR_IRQ(1) |
 	     ATMEL_HLCDC_LAYER_OVR_IRQ(2)))
-		dev_dbg(plane->base.dev->dev, "overrun on plane %s\n",
+		drm_dbg(plane->base.dev, "overrun on plane %s\n",
 			desc->name);
 }
 
@@ -1051,7 +1051,7 @@ static void atmel_xlcdc_irq_dbg(struct atmel_hlcdc_plane *plane,
 	if (isr &
 	    (ATMEL_XLCDC_LAYER_OVR_IRQ(0) | ATMEL_XLCDC_LAYER_OVR_IRQ(1) |
 	     ATMEL_XLCDC_LAYER_OVR_IRQ(2)))
-		dev_dbg(plane->base.dev->dev, "overrun on plane %s\n",
+		drm_dbg(plane->base.dev, "overrun on plane %s\n",
 			desc->name);
 }
 
@@ -1140,7 +1140,7 @@ static void atmel_hlcdc_plane_reset(struct drm_plane *p)
 	if (state) {
 		if (atmel_hlcdc_plane_alloc_dscrs(p, state)) {
 			kfree(state);
-			dev_err(p->dev->dev,
+			drm_err(p->dev,
 				"Failed to allocate initial plane state\n");
 			return;
 		}
-- 
2.43.0


