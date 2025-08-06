Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E694AC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 00:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kWxTVsldVxx1WswkyHYD0GCVmGgL66ul9t+8EJPnmh8=; b=wGEUGpiMYmbddnrSGheJVdZPDc
	oJt2MpdnMoYIEkM/yySPOdlnbzI/OVesalSU4VHDWQo23852trFopAt7Ub49/JXSPi1QmUm0Gidlw
	w/+4HW6u/eMJakjGkPqGfAeJQqRySz+jFwFrrbtLlsE6hu5q4ML9K1HfYZErzK1bwY79wYfWX6ePe
	1CFB008OLtWJwVVy9ZOUIWkseL6+/g9nCDi+Iy8sBMxZm6MtmRa3/yxSuJlag1HKxleuRl3LoX50N
	3LIjacAUec/7MBxxyAsfxo/dsAu56A5+A0yF/mbl52GUyaOII0AZPJPUwg15xowL0V+i7OCt+zl1d
	1SZOnbWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujRho-0000000E2a0-0XwJ;
	Wed, 06 Aug 2025 00:08:32 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujRbN-0000000E29W-3Hbk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 00:01:55 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-458ba079338so2678315e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Aug 2025 17:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754438512; x=1755043312; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kWxTVsldVxx1WswkyHYD0GCVmGgL66ul9t+8EJPnmh8=;
        b=VZuMmLujvlHSUccBgCMIwfkl2COqvIKeU/h6kHkjPRV9BxFy+VpYYbGg5146a3BNSG
         ryKvpL9Ym1Ue39TvxInxiXYhf15UChjtEc77477Ac8dQ70gZ/hW9L5v3KmidTPNL4d69
         ch4TI7OZdt+Q+lqiVoMU4k2SciV+2WFinzt9MNTbfYVgZksPZnnyd/X2feOdjPUZdFkk
         59U6lwoaB9EaH81KzAsVcq5613C1YDesmSBD5w7XYlQBbRKonyDEHSszdJpbJTozthIr
         IWJphSkZdvf1TRHv8F+VbXQLJrsTE8EAFp5TW4oVmf6LdcRwy+jlPtpqgtj8IyeanXqG
         0iiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754438512; x=1755043312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kWxTVsldVxx1WswkyHYD0GCVmGgL66ul9t+8EJPnmh8=;
        b=Nczr5JgzWol0K7ekYobfjFJAniVOW+/vtmyt9h2giIk9+4cnMtKJyUe0BAUVFC+xgH
         y9pMhVa7zceGdxRrZV9bXu/Hq1d+xthH+0schBTHRPubMjXquaDdqoP9lwkYCc8LC1JW
         hN1IQrti7pchJduxuD1k3dS3TXzcNUxNkJNRWa1wE6dQM/Fip/KGcLdMRbB6uG6IQ2uH
         WLNDSQPukZVLrwpg9L678rJVpQPsrvskzJ7SuZmCeJ5EpHMNuEHiBgO2mfQbr15HR+a6
         icMd2R9wSRI/5OboNwWmovGsFUOXapEH1jswY57yOzJ3P9Zozm8z/U1wInnxLsxqqvCq
         YJIA==
X-Forwarded-Encrypted: i=1; AJvYcCXqhgan/QGRyXtql3zG3T/XqtkYwi/XQQ/2v1H9GEB28Qc6f7HVlSOMrRA0ZUJY3pMH8BDKTOIHhd6FZwim0OOW@lists.infradead.org
X-Gm-Message-State: AOJu0YyMW+qkuQ2ur+ew38RFy/YfQjPob57Xd2xfI6kqLlIirVRmL5Im
	myVM+EJviuPpaf5oPANay6wFppbRY+VC/KOcboBwl/ScaWHoLuyU4ger
X-Gm-Gg: ASbGncuGAINxjsLl8RaMB9symvu0IBjbVwQTqXE9JJzCOi/P8jcc4Ke7xkBfWrkzu91
	xluuXnigPn3XDoDFCbBPRLHI5ONq7j2kmCuHqumYlj1ScTWaRF4jhZzAK7CsE+11c+wz3q9JTpp
	rOEaqhbHujqr1D08CRUSi+gf1qjd8jsI0agJWZ0kg6hjYxOJEB66nrW3gbDIqnNRR5Bs1FTmoyy
	YGSrbF/WSdMgkH8iQzcJdsnOPAdzC+Taos+k7YWOjQHHTuerxwI1nnM8HhlGK67aR69ZDH+RHIe
	c1Z8ACE5JENAFy+MHmkblnqi1OHT7Yc8JNVx+whwRO+QS/ar2UZxO7K6qq+6FX9RyDl/HrhYpY6
	i/G3oZ4UvHX9EZY358IRC1Fjgbq3HZQtK6lKKrXmixMG26hWMA6HMhYJkslRG5MKeC6hCnWlfiu
	A=
X-Google-Smtp-Source: AGHT+IEDdNkX149qz3TCB/Qgkq29opwy3tW2MdUYG2GFjtBGUVl+T+HdF5Y7cY/QC3lCsm9WXVX1Sg==
X-Received: by 2002:a05:600c:354c:b0:456:1157:59ac with SMTP id 5b1f17b1804b1-459e70898e6mr5767675e9.7.1754438512144;
        Tue, 05 Aug 2025 17:01:52 -0700 (PDT)
Received: from ekhafagy-ROG-Zephyrus-M16-GU603HR-GU603HR.. ([156.204.172.189])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458b55b4b4bsm89085205e9.1.2025.08.05.17.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 17:01:51 -0700 (PDT)
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
Subject: [PATCH 1/1] drm: atmel-hlcdc: replace dev_* print funtions with drm_* variants
Date: Wed,  6 Aug 2025 03:01:25 +0300
Message-ID: <20250806000141.239753-2-eslam.medhat1993@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250805235928.236248-1-eslam.medhat1993@gmail.com>
References: <20250805235928.236248-1-eslam.medhat1993@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_170153_830940_E97D2612 
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

According to documentation[1] drm_* variants are preferred over dev_*
print functions.

[1] https://docs.kernel.org/gpu/todo.html#convert-logging-to-drm-functions-with-drm-device-parameter

Signed-off-by: Eslam Khafagy <eslam.medhat1993@gmail.com>
---
 .../gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c    | 20 +++++++++----------
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c  | 14 ++++++-------
 .../gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c  |  2 +-
 .../gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c   |  2 +-
 4 files changed, 19 insertions(+), 19 deletions(-)

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
index 4a7ba0918eca..e55e54d52219 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
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


