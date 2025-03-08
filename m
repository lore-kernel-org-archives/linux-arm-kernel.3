Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31003C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 19:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cL+kwswwn5jzxwsJW9pLiPtPk53udtuocP3ZVoOJwGI=; b=YUAbAJC/HkHCdBtZX+efdUac3A
	6COABpAstzqBbyX3LFRX5F5Yv0ieh55CZnvVwRd1wGp63jDfhcwPNgFm1ot8R2vCfJz3ad67CovQD
	Qnou3fx7L8hM+Oe/kocuAPgvGgusIEIBg6RpUJqoHcpGkTgHc9AxDpERId6cJ8Vl6I5aprXiEvD8E
	X/rq70sn2FfKQsIzT4QxeITwWd7i9w8//cV1bSD8qC1w0Db+mIXdPv2b0h+78AsPjwGySXEl6EMSf
	xTU0dRFW3+nhjXa1rlim02RFvvcHIZyzhivkaymI4qwkmJphTu3Nu1aChEnLPtFfx8H+/Ld04Vchx
	WtXIq5bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqzZU-0000000H5Eh-2gZV;
	Sat, 08 Mar 2025 19:10:52 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqz1n-0000000H0Yj-2qnA
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Mar 2025 18:36:05 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-abf6f3b836aso455589666b.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Mar 2025 10:36:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741458962; x=1742063762; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cL+kwswwn5jzxwsJW9pLiPtPk53udtuocP3ZVoOJwGI=;
        b=eNCdi5U6AitYnqZ7eIwG8mLSFU63XLzxhekbNj5gCDjQC+vqHfp5T/IheQxvfSO6nt
         2tRyuEUcmOCj/RcnaFdJCcFvL1CM/5LB5zw+aBi/2JgG8K0VsEQeL8IKh3EkatvVtdRA
         TAm+uQP5G7A3RqF5181+107WvkdQBU0jn4jKN4DfppWplINsCDsTeNr1x2cUmf+IzV/h
         gLWUELr8yGHjs44m4ACXwZwYMKcAv7yIhk6YthA8nMmuE1MRWkKaGMAqr0xy4VbvK4Di
         qEEb2TZ7fOWi0LQ56LMe4cx/f/P1XHMG4CzZ+hA5eckoy8rkinb3YCa/gWH25VV1sNrr
         DCCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741458962; x=1742063762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cL+kwswwn5jzxwsJW9pLiPtPk53udtuocP3ZVoOJwGI=;
        b=IHFMJAiwYBJ77u1y3o/12Weuc/IOqnCyZRTpOYNwHkH6XZcWWIcCChFxao4Yo9ytxq
         /HJRnFm8Vq9IcWPEx8Faik1Q3+7kFmKnZU1T3zpg9mCsbXm//8SOQBs4FDq2JC2oJMef
         8AVUAeMSgjElGt8YXcGd7NDHE6c7VBrxP/ukXefqx/k/YTicBC5KVLyJdmbnsXU2tm37
         tsTccnG+iWSVNX/MLOPHEff93ve5pLbtXF+7EhnSqRMHg/RE9RRN8cQemuk6+KMgw4Gq
         Q8EKs4zYGTlpJ9MR3eVGyjFBnvMnH1aqO/NXMPszHCDsVDYMG6l4LRZtLKHChSkehOIs
         x/vA==
X-Forwarded-Encrypted: i=1; AJvYcCXlFf/kO19iyvdkwiyoR5TsOYe08m83L0y/d1FeJo+GGACFJoZzTD1yDXRq5nifWaQspgSV1vpGBQih0D1GiFVQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwCJKVdQUPve16V0xbTaN62etMFNaE2TyCt5zdj8IvGXuiW0faj
	H+yWHVZaG+qBOghmmDt66hGIBnxvQKQq8Uhi5sj1cL5mBTxPH0Wi
X-Gm-Gg: ASbGncuPgYI1HDH6FJu/wPcpe2geYWIxs1Xv19pt3NXhWPlzN5/1NK/Zi1SxxWhTRy7
	X4vwiAOK2aUasg5tdK/18+UkgLXWDO2KglkHfjcnFAxP/r2UmT2fmmjC2N8waGsxxTdjWBtqg1U
	zDLltnrAjWU5EV4aOOQ8yGa3UZHIxy7aDYfbTkinsU1giSphQN/oLaDT2fB9f94j7q6nwNycIl8
	y6XIHN0w9LYfK4UV/pT8FYSuKUvKxeNVJO7doQUPbEM6MlfT+jSZr+0MVucT/gBRomwM9jJwtUt
	UuViiibr5IjSpBzYr9g5jYlaIfv6SGxNFdUYB2cCXrdauVzezuhyrQhqHQ==
X-Google-Smtp-Source: AGHT+IF9zZA/uP78oxQN04qBg6JKFTvZVJk9xONUOw7SHitJgE7xQATAtSbohXVnkE66255V4sOErQ==
X-Received: by 2002:a17:906:dac2:b0:ac2:c26:5608 with SMTP id a640c23a62f3a-ac252747d18mr773184766b.8.1741458962015;
        Sat, 08 Mar 2025 10:36:02 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac24a84397fsm379693666b.96.2025.03.08.10.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 10:36:01 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Eric Biggers <ebiggers@google.com>,
	Javier Carrasco <javier.carrasco@wolfvision.net>,
	Ross Burton <ross.burton@arm.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Ihor Matushchak <ihor.matushchak@foobox.net>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [RFC PATCH 22/24] staging: media: remove MAX96712 driver
Date: Sat,  8 Mar 2025 20:33:51 +0200
Message-ID: <20250308183410.3013996-23-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250308183410.3013996-1-demonsingur@gmail.com>
References: <20250308183410.3013996-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_103603_855500_61F19CFB 
X-CRM114-Status: GOOD (  22.31  )
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

Remove the staging MAX96712 driver.
Its functionality has been moved to the MAX96724 driver which makes use
of the Maxim GMSL2/3 deserializer framework.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 MAINTAINERS                               |   1 -
 drivers/staging/media/Kconfig             |   2 -
 drivers/staging/media/Makefile            |   1 -
 drivers/staging/media/max96712/Kconfig    |  14 -
 drivers/staging/media/max96712/Makefile   |   2 -
 drivers/staging/media/max96712/max96712.c | 487 ----------------------
 6 files changed, 507 deletions(-)
 delete mode 100644 drivers/staging/media/max96712/Kconfig
 delete mode 100644 drivers/staging/media/max96712/Makefile
 delete mode 100644 drivers/staging/media/max96712/max96712.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 1bc0ef81a1f0..7bc80ed9ba00 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14188,7 +14188,6 @@ M:	Cosmin Tanislav <cosmin.tanislav@analog.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
-F:	drivers/staging/media/max96712/max96712.c
 
 MAX96714 GMSL2 DESERIALIZER DRIVER
 M:	Julien Massot <julien.massot@collabora.com>
diff --git a/drivers/staging/media/Kconfig b/drivers/staging/media/Kconfig
index b44214854399..fe29821f64a3 100644
--- a/drivers/staging/media/Kconfig
+++ b/drivers/staging/media/Kconfig
@@ -28,8 +28,6 @@ source "drivers/staging/media/imx/Kconfig"
 
 source "drivers/staging/media/ipu3/Kconfig"
 
-source "drivers/staging/media/max96712/Kconfig"
-
 source "drivers/staging/media/meson/vdec/Kconfig"
 
 source "drivers/staging/media/rkvdec/Kconfig"
diff --git a/drivers/staging/media/Makefile b/drivers/staging/media/Makefile
index ad4e9619a9e0..1a562b3b6881 100644
--- a/drivers/staging/media/Makefile
+++ b/drivers/staging/media/Makefile
@@ -2,7 +2,6 @@
 obj-$(CONFIG_VIDEO_ATMEL_ISC_BASE)	+= deprecated/atmel/
 obj-$(CONFIG_INTEL_ATOMISP)     += atomisp/
 obj-$(CONFIG_VIDEO_IMX_MEDIA)	+= imx/
-obj-$(CONFIG_VIDEO_MAX96712)	+= max96712/
 obj-$(CONFIG_VIDEO_MESON_VDEC)	+= meson/vdec/
 obj-$(CONFIG_VIDEO_ROCKCHIP_VDEC)	+= rkvdec/
 obj-$(CONFIG_VIDEO_STARFIVE_CAMSS)	+= starfive/
diff --git a/drivers/staging/media/max96712/Kconfig b/drivers/staging/media/max96712/Kconfig
deleted file mode 100644
index 117fadf81bd0..000000000000
--- a/drivers/staging/media/max96712/Kconfig
+++ /dev/null
@@ -1,14 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-config VIDEO_MAX96712
-	tristate "Maxim MAX96712 Quad GMSL2 Deserializer support"
-	depends on I2C
-	depends on OF_GPIO
-	depends on VIDEO_DEV
-	select V4L2_FWNODE
-	select VIDEO_V4L2_SUBDEV_API
-	select MEDIA_CONTROLLER
-	help
-	  This driver supports the Maxim MAX96712 Quad GMSL2 Deserializer.
-
-	  To compile this driver as a module, choose M here: the
-	  module will be called max96712.
diff --git a/drivers/staging/media/max96712/Makefile b/drivers/staging/media/max96712/Makefile
deleted file mode 100644
index 70c1974ce3f0..000000000000
--- a/drivers/staging/media/max96712/Makefile
+++ /dev/null
@@ -1,2 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-obj-$(CONFIG_VIDEO_MAX96712) += max96712.o
diff --git a/drivers/staging/media/max96712/max96712.c b/drivers/staging/media/max96712/max96712.c
deleted file mode 100644
index 0751b2e04895..000000000000
--- a/drivers/staging/media/max96712/max96712.c
+++ /dev/null
@@ -1,487 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Maxim MAX96712 Quad GMSL2 Deserializer Driver
- *
- * Copyright (C) 2021 Renesas Electronics Corporation
- * Copyright (C) 2021 Niklas Söderlund
- */
-
-#include <linux/delay.h>
-#include <linux/i2c.h>
-#include <linux/module.h>
-#include <linux/of_graph.h>
-#include <linux/regmap.h>
-
-#include <media/v4l2-ctrls.h>
-#include <media/v4l2-fwnode.h>
-#include <media/v4l2-subdev.h>
-
-#define DEBUG_EXTRA_REG			0x09
-#define DEBUG_EXTRA_PCLK_25MHZ		0x00
-#define DEBUG_EXTRA_PCLK_75MHZ		0x01
-
-enum max96712_pattern {
-	MAX96712_PATTERN_CHECKERBOARD = 0,
-	MAX96712_PATTERN_GRADIENT,
-};
-
-struct max96712_info {
-	unsigned int dpllfreq;
-	bool have_debug_extra;
-};
-
-struct max96712_priv {
-	struct i2c_client *client;
-	struct regmap *regmap;
-	struct gpio_desc *gpiod_pwdn;
-
-	const struct max96712_info *info;
-
-	bool cphy;
-	struct v4l2_mbus_config_mipi_csi2 mipi;
-
-	struct v4l2_subdev sd;
-	struct v4l2_ctrl_handler ctrl_handler;
-	struct media_pad pads[1];
-
-	enum max96712_pattern pattern;
-};
-
-static int max96712_write(struct max96712_priv *priv, unsigned int reg, u8 val)
-{
-	int ret;
-
-	ret = regmap_write(priv->regmap, reg, val);
-	if (ret)
-		dev_err(&priv->client->dev, "write 0x%04x failed\n", reg);
-
-	return ret;
-}
-
-static int max96712_update_bits(struct max96712_priv *priv, unsigned int reg,
-				u8 mask, u8 val)
-{
-	int ret;
-
-	ret = regmap_update_bits(priv->regmap, reg, mask, val);
-	if (ret)
-		dev_err(&priv->client->dev, "update 0x%04x failed\n", reg);
-
-	return ret;
-}
-
-static int max96712_write_bulk(struct max96712_priv *priv, unsigned int reg,
-			       const void *val, size_t val_count)
-{
-	int ret;
-
-	ret = regmap_bulk_write(priv->regmap, reg, val, val_count);
-	if (ret)
-		dev_err(&priv->client->dev, "bulk write 0x%04x failed\n", reg);
-
-	return ret;
-}
-
-static int max96712_write_bulk_value(struct max96712_priv *priv,
-				     unsigned int reg, unsigned int val,
-				     size_t val_count)
-{
-	unsigned int i;
-	u8 values[4];
-
-	for (i = 1; i <= val_count; i++)
-		values[i - 1] = (val >> ((val_count - i) * 8)) & 0xff;
-
-	return max96712_write_bulk(priv, reg, &values, val_count);
-}
-
-static void max96712_reset(struct max96712_priv *priv)
-{
-	max96712_update_bits(priv, 0x13, 0x40, 0x40);
-	msleep(20);
-}
-
-static void max96712_mipi_enable(struct max96712_priv *priv, bool enable)
-{
-	if (enable) {
-		max96712_update_bits(priv, 0x40b, 0x02, 0x02);
-		max96712_update_bits(priv, 0x8a0, 0x80, 0x80);
-	} else {
-		max96712_update_bits(priv, 0x8a0, 0x80, 0x00);
-		max96712_update_bits(priv, 0x40b, 0x02, 0x00);
-	}
-}
-
-static void max96712_mipi_configure(struct max96712_priv *priv)
-{
-	unsigned int i;
-	u8 phy5 = 0;
-
-	max96712_mipi_enable(priv, false);
-
-	/* Select 2x4 mode. */
-	max96712_write(priv, 0x8a0, 0x04);
-
-	/* TODO: Add support for 2-lane and 1-lane configurations. */
-	if (priv->cphy) {
-		/* Configure a 3-lane C-PHY using PHY0 and PHY1. */
-		max96712_write(priv, 0x94a, 0xa0);
-
-		/* Configure C-PHY timings. */
-		max96712_write(priv, 0x8ad, 0x3f);
-		max96712_write(priv, 0x8ae, 0x7d);
-	} else {
-		/* Configure a 4-lane D-PHY using PHY0 and PHY1. */
-		max96712_write(priv, 0x94a, 0xc0);
-	}
-
-	/* Configure lane mapping for PHY0 and PHY1. */
-	/* TODO: Add support for lane swapping. */
-	max96712_write(priv, 0x8a3, 0xe4);
-
-	/* Configure lane polarity for PHY0 and PHY1. */
-	for (i = 0; i < priv->mipi.num_data_lanes + 1; i++)
-		if (priv->mipi.lane_polarities[i])
-			phy5 |= BIT(i == 0 ? 5 : i < 3 ? i - 1 : i);
-	max96712_write(priv, 0x8a5, phy5);
-
-	/* Set link frequency for PHY0 and PHY1. */
-	max96712_update_bits(priv, 0x415, 0x3f,
-			     ((priv->info->dpllfreq / 100) & 0x1f) | BIT(5));
-	max96712_update_bits(priv, 0x418, 0x3f,
-			     ((priv->info->dpllfreq / 100) & 0x1f) | BIT(5));
-
-	/* Enable PHY0 and PHY1 */
-	max96712_update_bits(priv, 0x8a2, 0xf0, 0x30);
-}
-
-static void max96712_pattern_enable(struct max96712_priv *priv, bool enable)
-{
-	const u32 h_active = 1920;
-	const u32 h_fp = 88;
-	const u32 h_sw = 44;
-	const u32 h_bp = 148;
-	const u32 h_tot = h_active + h_fp + h_sw + h_bp;
-
-	const u32 v_active = 1080;
-	const u32 v_fp = 4;
-	const u32 v_sw = 5;
-	const u32 v_bp = 36;
-	const u32 v_tot = v_active + v_fp + v_sw + v_bp;
-
-	if (!enable) {
-		max96712_write(priv, 0x1051, 0x00);
-		return;
-	}
-
-	/* Set PCLK to 75MHz if device have DEBUG_EXTRA register. */
-	if (priv->info->have_debug_extra)
-		max96712_write(priv, DEBUG_EXTRA_REG, DEBUG_EXTRA_PCLK_75MHZ);
-
-	/* Configure Video Timing Generator for 1920x1080 @ 30 fps. */
-	max96712_write_bulk_value(priv, 0x1052, 0, 3);
-	max96712_write_bulk_value(priv, 0x1055, v_sw * h_tot, 3);
-	max96712_write_bulk_value(priv, 0x1058,
-				  (v_active + v_fp + + v_bp) * h_tot, 3);
-	max96712_write_bulk_value(priv, 0x105b, 0, 3);
-	max96712_write_bulk_value(priv, 0x105e, h_sw, 2);
-	max96712_write_bulk_value(priv, 0x1060, h_active + h_fp + h_bp, 2);
-	max96712_write_bulk_value(priv, 0x1062, v_tot, 2);
-	max96712_write_bulk_value(priv, 0x1064,
-				  h_tot * (v_sw + v_bp) + (h_sw + h_bp), 3);
-	max96712_write_bulk_value(priv, 0x1067, h_active, 2);
-	max96712_write_bulk_value(priv, 0x1069, h_fp + h_sw + h_bp, 2);
-	max96712_write_bulk_value(priv, 0x106b, v_active, 2);
-
-	/* Generate VS, HS and DE in free-running mode. */
-	max96712_write(priv, 0x1050, 0xfb);
-
-	/* Configure Video Pattern Generator. */
-	if (priv->pattern == MAX96712_PATTERN_CHECKERBOARD) {
-		/* Set checkerboard pattern size. */
-		max96712_write(priv, 0x1074, 0x3c);
-		max96712_write(priv, 0x1075, 0x3c);
-		max96712_write(priv, 0x1076, 0x3c);
-
-		/* Set checkerboard pattern colors. */
-		max96712_write_bulk_value(priv, 0x106e, 0xfecc00, 3);
-		max96712_write_bulk_value(priv, 0x1071, 0x006aa7, 3);
-
-		/* Generate checkerboard pattern. */
-		max96712_write(priv, 0x1051, 0x10);
-	} else {
-		/* Set gradient increment. */
-		max96712_write(priv, 0x106d, 0x10);
-
-		/* Generate gradient pattern. */
-		max96712_write(priv, 0x1051, 0x20);
-	}
-}
-
-static int max96712_s_stream(struct v4l2_subdev *sd, int enable)
-{
-	struct max96712_priv *priv = v4l2_get_subdevdata(sd);
-
-	if (enable) {
-		max96712_pattern_enable(priv, true);
-		max96712_mipi_enable(priv, true);
-	} else {
-		max96712_mipi_enable(priv, false);
-		max96712_pattern_enable(priv, false);
-	}
-
-	return 0;
-}
-
-static const struct v4l2_subdev_video_ops max96712_video_ops = {
-	.s_stream = max96712_s_stream,
-};
-
-static int max96712_init_state(struct v4l2_subdev *sd,
-			       struct v4l2_subdev_state *state)
-{
-	static const struct v4l2_mbus_framefmt default_fmt = {
-		.width          = 1920,
-		.height         = 1080,
-		.code           = MEDIA_BUS_FMT_RGB888_1X24,
-		.colorspace     = V4L2_COLORSPACE_SRGB,
-		.field          = V4L2_FIELD_NONE,
-		.ycbcr_enc      = V4L2_YCBCR_ENC_DEFAULT,
-		.quantization   = V4L2_QUANTIZATION_DEFAULT,
-		.xfer_func      = V4L2_XFER_FUNC_DEFAULT,
-	};
-	struct v4l2_mbus_framefmt *fmt;
-
-	fmt = v4l2_subdev_state_get_format(state, 0);
-	*fmt = default_fmt;
-
-	return 0;
-}
-
-static const struct v4l2_subdev_internal_ops max96712_internal_ops = {
-	.init_state = max96712_init_state,
-};
-
-static const struct v4l2_subdev_pad_ops max96712_pad_ops = {
-	.get_fmt = v4l2_subdev_get_fmt,
-	.set_fmt = v4l2_subdev_get_fmt,
-};
-
-static const struct v4l2_subdev_ops max96712_subdev_ops = {
-	.video = &max96712_video_ops,
-	.pad = &max96712_pad_ops,
-};
-
-static const char * const max96712_test_pattern[] = {
-	"Checkerboard",
-	"Gradient",
-};
-
-static int max96712_s_ctrl(struct v4l2_ctrl *ctrl)
-{
-	struct max96712_priv *priv =
-		container_of(ctrl->handler, struct max96712_priv, ctrl_handler);
-
-	switch (ctrl->id) {
-	case V4L2_CID_TEST_PATTERN:
-		priv->pattern = ctrl->val ?
-			MAX96712_PATTERN_GRADIENT :
-			MAX96712_PATTERN_CHECKERBOARD;
-		break;
-	}
-	return 0;
-}
-
-static const struct v4l2_ctrl_ops max96712_ctrl_ops = {
-	.s_ctrl = max96712_s_ctrl,
-};
-
-static int max96712_v4l2_register(struct max96712_priv *priv)
-{
-	long pixel_rate;
-	int ret;
-
-	priv->sd.internal_ops = &max96712_internal_ops;
-	v4l2_i2c_subdev_init(&priv->sd, priv->client, &max96712_subdev_ops);
-	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
-	priv->sd.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
-
-	v4l2_ctrl_handler_init(&priv->ctrl_handler, 2);
-
-	/*
-	 * TODO: Once V4L2_CID_LINK_FREQ is changed from a menu control to an
-	 * INT64 control it should be used here instead of V4L2_CID_PIXEL_RATE.
-	 */
-	pixel_rate = priv->info->dpllfreq / priv->mipi.num_data_lanes * 1000000;
-	v4l2_ctrl_new_std(&priv->ctrl_handler, NULL, V4L2_CID_PIXEL_RATE,
-			  pixel_rate, pixel_rate, 1, pixel_rate);
-
-	v4l2_ctrl_new_std_menu_items(&priv->ctrl_handler, &max96712_ctrl_ops,
-				     V4L2_CID_TEST_PATTERN,
-				     ARRAY_SIZE(max96712_test_pattern) - 1,
-				     0, 0, max96712_test_pattern);
-
-	priv->sd.ctrl_handler = &priv->ctrl_handler;
-	ret = priv->ctrl_handler.error;
-	if (ret)
-		goto error;
-
-	priv->pads[0].flags = MEDIA_PAD_FL_SOURCE;
-	ret = media_entity_pads_init(&priv->sd.entity, 1, priv->pads);
-	if (ret)
-		goto error;
-
-	v4l2_set_subdevdata(&priv->sd, priv);
-
-	priv->sd.state_lock = priv->ctrl_handler.lock;
-	ret = v4l2_subdev_init_finalize(&priv->sd);
-	if (ret)
-		goto error;
-
-	ret = v4l2_async_register_subdev(&priv->sd);
-	if (ret < 0) {
-		dev_err(&priv->client->dev, "Unable to register subdevice\n");
-		goto error;
-	}
-
-	return 0;
-error:
-	v4l2_ctrl_handler_free(&priv->ctrl_handler);
-
-	return ret;
-}
-
-static int max96712_parse_dt(struct max96712_priv *priv)
-{
-	struct fwnode_handle *ep;
-	struct v4l2_fwnode_endpoint v4l2_ep = {
-		.bus_type = V4L2_MBUS_UNKNOWN,
-	};
-	unsigned int supported_lanes;
-	int ret;
-
-	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(&priv->client->dev), 4,
-					     0, 0);
-	if (!ep) {
-		dev_err(&priv->client->dev, "Not connected to subdevice\n");
-		return -EINVAL;
-	}
-
-	ret = v4l2_fwnode_endpoint_parse(ep, &v4l2_ep);
-	fwnode_handle_put(ep);
-	if (ret) {
-		dev_err(&priv->client->dev, "Could not parse v4l2 endpoint\n");
-		return -EINVAL;
-	}
-
-	switch (v4l2_ep.bus_type) {
-	case V4L2_MBUS_CSI2_DPHY:
-		supported_lanes = 4;
-		priv->cphy = false;
-		break;
-	case V4L2_MBUS_CSI2_CPHY:
-		supported_lanes = 3;
-		priv->cphy = true;
-		break;
-	default:
-		dev_err(&priv->client->dev, "Unsupported bus-type %u\n",
-			v4l2_ep.bus_type);
-		return -EINVAL;
-	}
-
-	if (v4l2_ep.bus.mipi_csi2.num_data_lanes != supported_lanes) {
-		dev_err(&priv->client->dev, "Only %u data lanes supported\n",
-			supported_lanes);
-		return -EINVAL;
-	}
-
-	priv->mipi = v4l2_ep.bus.mipi_csi2;
-
-	return 0;
-}
-
-static const struct regmap_config max96712_i2c_regmap = {
-	.reg_bits = 16,
-	.val_bits = 8,
-	.max_register = 0x1f00,
-};
-
-static int max96712_probe(struct i2c_client *client)
-{
-	struct max96712_priv *priv;
-	int ret;
-
-	priv = devm_kzalloc(&client->dev, sizeof(*priv), GFP_KERNEL);
-	if (!priv)
-		return -ENOMEM;
-
-	priv->info = of_device_get_match_data(&client->dev);
-
-	priv->client = client;
-
-	priv->regmap = devm_regmap_init_i2c(client, &max96712_i2c_regmap);
-	if (IS_ERR(priv->regmap))
-		return PTR_ERR(priv->regmap);
-
-	priv->gpiod_pwdn = devm_gpiod_get_optional(&client->dev, "enable",
-						   GPIOD_OUT_HIGH);
-	if (IS_ERR(priv->gpiod_pwdn))
-		return PTR_ERR(priv->gpiod_pwdn);
-
-	gpiod_set_consumer_name(priv->gpiod_pwdn, "max96712-pwdn");
-	gpiod_set_value_cansleep(priv->gpiod_pwdn, 1);
-
-	if (priv->gpiod_pwdn)
-		usleep_range(4000, 5000);
-
-	max96712_reset(priv);
-
-	ret = max96712_parse_dt(priv);
-	if (ret)
-		return ret;
-
-	max96712_mipi_configure(priv);
-
-	return max96712_v4l2_register(priv);
-}
-
-static void max96712_remove(struct i2c_client *client)
-{
-	struct v4l2_subdev *sd = i2c_get_clientdata(client);
-	struct max96712_priv *priv = container_of(sd, struct max96712_priv, sd);
-
-	v4l2_async_unregister_subdev(&priv->sd);
-
-	gpiod_set_value_cansleep(priv->gpiod_pwdn, 0);
-}
-
-static const struct max96712_info max96712_info_max96712 = {
-	.dpllfreq = 1000,
-	.have_debug_extra = true,
-};
-
-static const struct max96712_info max96712_info_max96724 = {
-	.dpllfreq = 1200,
-};
-
-static const struct of_device_id max96712_of_table[] = {
-	{ .compatible = "maxim,max96712", .data = &max96712_info_max96712 },
-	{ .compatible = "maxim,max96724", .data = &max96712_info_max96724 },
-	{ /* sentinel */ }
-};
-MODULE_DEVICE_TABLE(of, max96712_of_table);
-
-static struct i2c_driver max96712_i2c_driver = {
-	.driver	= {
-		.name = "max96712",
-		.of_match_table	= of_match_ptr(max96712_of_table),
-	},
-	.probe = max96712_probe,
-	.remove = max96712_remove,
-};
-
-module_i2c_driver(max96712_i2c_driver);
-
-MODULE_DESCRIPTION("Maxim MAX96712 Quad GMSL2 Deserializer Driver");
-MODULE_AUTHOR("Niklas Söderlund <niklas.soderlund@ragnatech.se>");
-MODULE_LICENSE("GPL");
-- 
2.48.1


