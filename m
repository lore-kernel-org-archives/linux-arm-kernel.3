Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BE78C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 19:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=g45HxYT9zBnvjsNtcvhDhW+w7if+fXdh8cchCdpgOBs=; b=KQxQsxDqOUjiiAuxtmmXPGj7IO
	vDYr/nUcrloSWqx40OkkK2TQA/9hP/p++ZPc8xwpIUPGOr210W/bG4GxWTK0Ja21dpUDecV5PDn9a
	9k8d16HuLe/eRuBmx1vAWYNXiUizIcr2q8SVSKHGWzjDX+VSB0TU7R68E/P8DvivusfLLJH8S+ES5
	Iw3JBnX5Q2UOUTlSXunXcufzJlF5NgZDpi2w5AsON9q52ItprmJA07ZOQMvNg6pVRfCzEgER5peaP
	yiLOo0SARnuenZKlAf3hMJ+KJaji3pJWd51Da/Jf2a4vGYcUdXjdHgFBCj2+xOt84q5/lpcYmJjaC
	ddMeVxKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk61h-00000001O0o-2AcD;
	Thu, 07 Aug 2025 19:11:45 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk5z9-00000001Njr-2X9S
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 19:09:08 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-45994a72356so11092685e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Aug 2025 12:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754593746; x=1755198546; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g45HxYT9zBnvjsNtcvhDhW+w7if+fXdh8cchCdpgOBs=;
        b=ExL2oSJheMlE/+akck18frBE4aU6511omurDOKoHH7YFAb5M84tVuq/Bwt0VTJewr+
         xh42kw7GhktbNgG6XhOUuRNWa8KnUTrxxhygib++AuvbofHVlFxiGxwvY/6QD9G8liLI
         4kFpmbt8jSxdJGEKkgzrolugUF9VkDcI+LTajfnpNtmI2j7hVrghALvu39y6EDGhVwcL
         Z5mlqF3t9cRS9KIbdnuJzy8h4zbj97q7sG2YlKtHqXnukNYaUpUrdMMgEb/gh24qvGAr
         mVe9t4s01QyF6Yf2cI2s4xXW0VEwv823qs0CKnB0yPmun6T5NsE4Dv3lv05WtfMVx/Vj
         ORTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754593746; x=1755198546;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g45HxYT9zBnvjsNtcvhDhW+w7if+fXdh8cchCdpgOBs=;
        b=ps52iuJi6RSHJDt5urJ3jpQ1GXI3F0jdbyXhd6c3tDd0GL3vCVD20kNPx47DXpfmc8
         XSNyzya4il1/nLdlemlxIFQG5u+JABbzLdf2OW/aAZG+UY2nOrQsZZqlkSsqcnbQa0a9
         oVSIltrBiGbGd6FjX5eo92s1HB14qLMyaVzfiA2ATrrXbDAl9qijesp1R+3sOSnd4sWA
         MAylR8P595T8JXSr/UjJ/d3H5b4sUCi7+9bfWsUNzWCCPqUUhn7vzSsaXsNNUt4EU/LH
         7w2ino8or/PlIAI7Ku6MxsYMiHNHDJ1cozJRGKZmyiDGIQmUlZ+++Ac0O1Ax5/0/xaZI
         OkWw==
X-Forwarded-Encrypted: i=1; AJvYcCXPWvy6rV0MXwlnT+aMqVMwyskUXnb1O8eAlDAqBJ1xqJVWju7c4p9yPOWANvgMTDzYC8x6xR5b+ySI+NzphoO2@lists.infradead.org
X-Gm-Message-State: AOJu0YxOnO2fRpIK2XG7zI10swLw+3r0unUTeHz12qkW3fCLqvAaM0I1
	bBO9celSHyNRzp70bIW7SVTvYYHEKpEqGvqurSWULZ+G6MtzorvaXx4V
X-Gm-Gg: ASbGncve6OX75snaMq32jsFonFGzm+eVpcZb3OFZpf9INeOXQ7bu3rfsr8SjsyfIDqH
	qM6yxtenFwpgEsmIprKTF1oNAPosjQr0clJpmINBRIQ1xek6RAcqa5h5jk3iRML++irNvAvb4xZ
	50smPYn5cGU0xeqsENmXTcoowjaHGBQPb8Ce9TqNsGQBb6RamA7XCWsPMy4jurruhNh9CgREjsk
	IQMsFOTqQaB2OQaJ+yFHN/ZjwCoz0CLGLyNyaPnLeG3LMqyD1h6sQj/SE0CtK0s6VYv3iiKrjjn
	rM9ShW8FGQdwvDpcCDBCEdbJnJcFoizPgy7zsaKYEJYg3rF2m7aGulfoCmJ2BgeInN35W1majei
	QCxVkOIPG1OmwD+VJvlgLxvdjyuBBqUW9VFrtAEjOMVfRdmRB4pUdxhG2oAERe9OGOZg5uYgCFW
	s=
X-Google-Smtp-Source: AGHT+IFobf4kIojYuJxP0fDlodEmVFPL4ql9FtQA1VuvrVstvddIqRAyKDvTstbs/lgtnuFoO8r1Zg==
X-Received: by 2002:a05:600c:4c84:b0:459:dd4e:4435 with SMTP id 5b1f17b1804b1-459ede7d688mr31015785e9.5.1754593745799;
        Thu, 07 Aug 2025 12:09:05 -0700 (PDT)
Received: from ekhafagy-ROG-Zephyrus-M16-GU603HR-GU603HR.. ([156.204.172.189])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3b9074sm27131957f8f.17.2025.08.07.12.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 12:09:05 -0700 (PDT)
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
Subject: [PATCH v3] drm: atmel-hlcdc: replace dev_* print funtions with drm_* variants
Date: Thu,  7 Aug 2025 22:03:12 +0300
Message-ID: <20250807190857.92431-1-eslam.medhat1993@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_120907_650065_0AE65074 
X-CRM114-Status: GOOD (  13.24  )
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

Update the Atmel HLCDC code to use DRM print macros drm_*() instead of
dev_warn() and dev_err(). This change ensures consistency with DRM
subsystem logging conventions [1].

[1]
https://docs.kernel.org/gpu/todo.html#convert-logging-to-drm-functions-with-drm-device-parameter

Signed-off-by: Eslam Khafagy <eslam.medhat1993@gmail.com>
---
v3:
* include header file to fix compilation. Thanks Manikandan.

v2:
* replace dev_dbg with drm_dbg  in atmel_hlcdc_plane.c
* https://lore.kernel.org/all/20250806183049.52112-2-eslam.medhat1993@gmail.com/

v1:
* replace dev_* print funtions with drm_* variants
*https://lore.kernel.org/all/20250806000141.239753-2-eslam.medhat1993@gmail.com/

 .../gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c    | 21 ++++++++++---------
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c  | 14 ++++++-------
 .../gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c  |  3 ++-
 .../gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c   |  6 +++---
 4 files changed, 23 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
index 0f7ffb3ced20..e0efc7309b1b 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
@@ -20,6 +20,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 
@@ -215,32 +216,32 @@ static void atmel_hlcdc_crtc_atomic_disable(struct drm_crtc *c,
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
@@ -269,32 +270,32 @@ static void atmel_hlcdc_crtc_atomic_enable(struct drm_crtc *c,
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
index 50fee6a93964..0b8a86afb096 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c
@@ -15,6 +15,7 @@
 #include <drm/drm_bridge.h>
 #include <drm/drm_encoder.h>
 #include <drm/drm_of.h>
+#include <drm/drm_print.h>
 #include <drm/drm_simple_kms_helper.h>
 
 #include "atmel_hlcdc_dc.h"
@@ -92,7 +93,7 @@ static int atmel_hlcdc_attach_endpoint(struct drm_device *dev, int endpoint)
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


