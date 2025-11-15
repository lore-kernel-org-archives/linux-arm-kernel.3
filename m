Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E6B6CEB2C6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Nov 2025 14:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pVbw8sqfmsGsfsXTGzKu/do/A1FF7lGaLVG/hAhMlcM=; b=rTnSEjkCuubXc5epE/1P5QtX9L
	aJCMGIrP9oFN2iH/4EiqyMPJmeqJHRvlTn/+zLhe5D50WhDNb4lSfDIevgEbtRHRNp4kUZ6AUmyNV
	h7PYshhe/WQzOUm2vUhRBJBc2dSrc/4EadIl387pGSR86cHstldlryKKSEyQ/S26T46gBgV5+q6gH
	8zMHjvFPBQ51zBJqjaI6Dk6bDh7t5PLEW73K8LwotKay/tkpzhq96GN5s4OTvhcqnz8ljmSaO0iB+
	GeiNynJbOPfxaWWtBaPf/uHz8uCAlsOkkZ8D/1zBzyhKGm20wvj0owZFZcTpZfoKxAS5LJzutJNk/
	vPlxGz/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKH2x-0000000Dpqg-2CSS;
	Sat, 15 Nov 2025 14:14:35 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKH2k-0000000Dpik-0Qc1
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Nov 2025 14:14:23 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-b73161849e1so500077266b.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Nov 2025 06:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763216060; x=1763820860; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pVbw8sqfmsGsfsXTGzKu/do/A1FF7lGaLVG/hAhMlcM=;
        b=Q+xMLH+K8wg5aTlS58ReJi2hDH8d6BnN0Blc9TTobXaEKg2ye6dilI6CwJO7hJVYux
         ThTKHDyhhhnCmp/suAeEXRmadj5eP+ulnXun6nOLvk9VMopQCs1s2MPyba95TmofsuB4
         zMlsv310t5oXB/BaJHljgz4U/Q3DvViGN6KlavTs9WdbUss3mgSVLt2L3iO9sJG2vTT7
         oLpZwy3plsZM5Gyv2TGPLw11aa5XQJOCGE1N+VPYd9Y7wmK1EXTibHrIwVIRmQH2cpTb
         YqL8MAeKRvt3Ih4RUqLkjDwDwasxtIl0rdwWhKwCH5gpF6of7D9UAfc6lQkrZTsZLOjQ
         koKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763216060; x=1763820860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pVbw8sqfmsGsfsXTGzKu/do/A1FF7lGaLVG/hAhMlcM=;
        b=rJeUOWZFMc+hhcaILWs/EKBgg1Nc4TM8ViItxBdP3qbKGu+n8jcsotex7dPUMo3Y4I
         +Y/WTs1quesu9gwXNW8bzKnSxF/ncfOczuw3djB+UI/N2R1B6kwEAem9g3SonUBiGH9T
         CYt2ZfuhiryOni+R9yDrcjld5YM8AzxmQ9mpw6go2oCDUROZFvYq60oYP/QtEOTCQVZo
         mzeWPdI12hj0nvE6t8t36xH7ENQ2B2fGI0jw36XonllbeejyHcOLdsra/PnMn47GuojE
         OxZs6iL4OSB6frW0GiOnNAQ7Nt8qZ9NxBX5GPC7BjuezgVn2tIChOGW23YyWdGmOp7hi
         7Wpg==
X-Forwarded-Encrypted: i=1; AJvYcCU4zTin1NTgO3FKaxHwMfu/UfEJ4ll03ogJF2WFiyplTHCrzMZebULLnOsOLnUpvPN2+Lo91Dh2X7Jp2YJEez6q@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/CvlB9ebemgZkPOqUdgByiNMdwBudpPZfFcq4GbE/z1ooynRm
	zRnE9yxwmVfmVprVbtzKx2w5xZEMeaHkL9N/uK+6JaiiMFoKz9sJ436P
X-Gm-Gg: ASbGnctfANkIJzWrSU0MsXAntoiFGSD4jLoUlEJ4AJLRp1RI/uBxzzTcYdjQ4K6qFIh
	AkMTPeYfpBcKiE5nU4/mloFSkBdQmf+nxH5J5VXdq1Jgv5+0BkFLk68IGaD31CXSMFQ1TZDpkB0
	BeRFuA9Uz6Xpbo3/jX83tRvcd1K1ROOdC0W+SVGpAt1Punt7kKwK2D13FHCod9a5UHdV0mYnCga
	eGMjwyWGN5ZGc0e2VELfAt/UVKjMbtUQF/2C4Bqyu7tQyRlPg1fGmKZrbiTt7pgOn8luANqDyXF
	7OxA3CwOVMJ+LoTkFICgIP3HCU0UCWONTn5QS16DTZpz0XC81npR9AcHb7JPAhFPgTiS4aBirLf
	N3cLtPnHyehVKdFwHnF1xrjMAi58aY3fs63sevAjFtgEHCGeGjFZebwVMQoOhd1AM8NDb1gcfni
	IB8m1owbkXCsRVfnKjs1f51dDgZHox1wiKPrfdVhKRdgDM1g==
X-Google-Smtp-Source: AGHT+IGbU8DEm/CCSleW/Yu4/6wA0uutVsxsCUAngp8FeQ9xWSzPAIlK7ahdDPBbaS4CEF2iCochtA==
X-Received: by 2002:a17:906:d9b:b0:b73:68b3:bd2f with SMTP id a640c23a62f3a-b7368b3c0fdmr502509366b.40.1763216060152;
        Sat, 15 Nov 2025 06:14:20 -0800 (PST)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fda933fsm606189866b.56.2025.11.15.06.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 06:14:19 -0800 (PST)
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
Subject: [PATCH 5/7] drm/sun4i: Add planes driver
Date: Sat, 15 Nov 2025 15:13:45 +0100
Message-ID: <20251115141347.13087-6-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251115141347.13087-1-jernej.skrabec@gmail.com>
References: <20251115141347.13087-1-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251115_061422_217696_D73D598B 
X-CRM114-Status: GOOD (  27.31  )
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

This driver serves just as planes sharing manager, needed for Display
Engine 3.3 and newer.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/Kconfig         |   8 +
 drivers/gpu/drm/sun4i/Makefile        |   1 +
 drivers/gpu/drm/sun4i/sun50i_planes.c | 205 ++++++++++++++++++++++++++
 drivers/gpu/drm/sun4i/sun50i_planes.h |  43 ++++++
 4 files changed, 257 insertions(+)
 create mode 100644 drivers/gpu/drm/sun4i/sun50i_planes.c
 create mode 100644 drivers/gpu/drm/sun4i/sun50i_planes.h

diff --git a/drivers/gpu/drm/sun4i/Kconfig b/drivers/gpu/drm/sun4i/Kconfig
index b56ba00aabca..946dd7606094 100644
--- a/drivers/gpu/drm/sun4i/Kconfig
+++ b/drivers/gpu/drm/sun4i/Kconfig
@@ -85,4 +85,12 @@ config DRM_SUN8I_TCON_TOP
 	  TCON TOP is responsible for configuring display pipeline for
 	  HDMI, TVE and LCD.
 
+config DRM_SUN50I_PLANES
+	tristate
+	default DRM_SUN4I if DRM_SUN8I_MIXER!=n
+	help
+	  Chose this option if you have an Allwinner Soc with the
+	  Display Engine 3.3 or newer. Planes are shared resource
+	  between multiple mixers.
+
 endif
diff --git a/drivers/gpu/drm/sun4i/Makefile b/drivers/gpu/drm/sun4i/Makefile
index bad7497a0d11..03f002abef15 100644
--- a/drivers/gpu/drm/sun4i/Makefile
+++ b/drivers/gpu/drm/sun4i/Makefile
@@ -38,3 +38,4 @@ obj-$(CONFIG_DRM_SUN6I_DSI)	+= sun6i_mipi_dsi.o
 obj-$(CONFIG_DRM_SUN8I_DW_HDMI)	+= sun8i-drm-hdmi.o
 obj-$(CONFIG_DRM_SUN8I_MIXER)	+= sun8i-mixer.o
 obj-$(CONFIG_DRM_SUN8I_TCON_TOP) += sun8i_tcon_top.o
+obj-$(CONFIG_DRM_SUN50I_PLANES)	+= sun50i_planes.o
diff --git a/drivers/gpu/drm/sun4i/sun50i_planes.c b/drivers/gpu/drm/sun4i/sun50i_planes.c
new file mode 100644
index 000000000000..a99c01122990
--- /dev/null
+++ b/drivers/gpu/drm/sun4i/sun50i_planes.c
@@ -0,0 +1,205 @@
+// SPDX-License-Identifier: GPL-2.0+
+/* Copyright (c) 2025 Jernej Skrabec <jernej.skrabec@gmail.com> */
+
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_graph.h>
+#include <linux/platform_device.h>
+
+#include "sun50i_planes.h"
+#include "sun8i_ui_layer.h"
+#include "sun8i_vi_layer.h"
+
+static bool sun50i_planes_node_is_planes(struct device_node *node)
+{
+	return !!of_match_node(sun50i_planes_of_table, node);
+}
+
+struct drm_plane **
+sun50i_planes_setup(struct device *dev, struct drm_device *drm,
+		    unsigned int mixer)
+{
+	struct sun50i_planes *planes = dev_get_drvdata(dev);
+	const struct sun50i_planes_quirks *quirks;
+	struct drm_plane **drm_planes;
+	const struct default_map *map;
+	unsigned int i;
+
+	if (!sun50i_planes_node_is_planes(dev->of_node)) {
+		dev_err(dev, "Device is not planes driver!\n");
+		return NULL;
+	}
+
+	if (!planes) {
+		dev_err(dev, "Planes driver is not loaded yet!\n");
+		return NULL;
+	}
+
+	if (mixer > 1) {
+		dev_err(dev, "Mixer index is too high!\n");
+		return NULL;
+	}
+
+	quirks = planes->quirks;
+	map = &quirks->def_map[mixer];
+
+	drm_planes = devm_kcalloc(drm->dev, map->num_ch + 1,
+				  sizeof(*drm_planes), GFP_KERNEL);
+	if (!drm_planes)
+		return ERR_PTR(-ENOMEM);
+
+	for (i = 0; i < map->num_ch; i++) {
+		unsigned int phy_ch = map->map[i];
+		struct sun8i_layer *layer;
+		enum drm_plane_type type;
+
+		if ((i == 0 && map->num_ch == 1) || i == 1)
+			type = DRM_PLANE_TYPE_PRIMARY;
+		else
+			type = DRM_PLANE_TYPE_OVERLAY;
+
+		if (phy_ch < UI_PLANE_OFFSET)
+			layer = sun8i_vi_layer_init_one(drm, type, planes->regs,
+							i, phy_ch, map->num_ch,
+							&quirks->cfg);
+		else
+			layer = sun8i_ui_layer_init_one(drm, type, planes->regs,
+							i, phy_ch, map->num_ch,
+							&quirks->cfg);
+
+		if (IS_ERR(layer)) {
+			dev_err(drm->dev,
+				"Couldn't initialize DRM plane\n");
+			return ERR_CAST(layer);
+		}
+
+		drm_planes[i] = &layer->plane;
+	}
+
+	return drm_planes;
+}
+EXPORT_SYMBOL(sun50i_planes_setup);
+
+static void sun50i_planes_init_mapping(struct sun50i_planes *planes)
+{
+	const struct sun50i_planes_quirks *quirks = planes->quirks;
+	unsigned int i, j;
+	u32 mapping;
+
+	mapping = 0;
+	for (j = 0; j < MAX_DISP; j++)
+		for (i = 0; i < quirks->def_map[j].num_ch; i++) {
+			unsigned int ch = quirks->def_map[j].map[i];
+
+			if (ch < UI_PLANE_OFFSET)
+				mapping |= j << (ch * 2);
+			else
+				mapping |= j << ((ch - UI_PLANE_OFFSET) * 2 + 16);
+		}
+	regmap_write(planes->mapping, SUNXI_DE33_DE_CHN2CORE_MUX_REG, mapping);
+
+	for (j = 0; j < MAX_DISP; j++) {
+		mapping = 0;
+		for (i = 0; i < quirks->def_map[j].num_ch; i++) {
+			unsigned int ch = quirks->def_map[j].map[i];
+
+			if (ch >= UI_PLANE_OFFSET)
+				ch += 2;
+
+			mapping |= ch << (i * 4);
+		}
+		regmap_write(planes->mapping, SUNXI_DE33_DE_PORT02CHN_MUX_REG + j * 4, mapping);
+	}
+}
+
+static const struct regmap_config sun50i_planes_regmap_config = {
+	.name		= "planes",
+	.reg_bits	= 32,
+	.val_bits	= 32,
+	.reg_stride	= 4,
+	.max_register	= 0x17fffc,
+};
+
+static int sun50i_planes_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct sun50i_planes *planes;
+	void __iomem *regs;
+
+	planes = devm_kzalloc(dev, sizeof(*planes), GFP_KERNEL);
+	if (!planes)
+		return -ENOMEM;
+
+	planes->quirks = of_device_get_match_data(&pdev->dev);
+	if (!planes->quirks)
+		return dev_err_probe(dev, -EINVAL, "Unable to get quirks\n");
+
+	planes->mapping = syscon_regmap_lookup_by_phandle(dev->of_node,
+							  "allwinner,plane-mapping");
+	if (IS_ERR(planes->mapping))
+		return dev_err_probe(dev, PTR_ERR(planes->mapping),
+				     "Unable to get mapping\n");
+
+	regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(regs))
+		return PTR_ERR(regs);
+
+	planes->regs = devm_regmap_init_mmio(dev, regs, &sun50i_planes_regmap_config);
+	if (IS_ERR(planes->regs))
+		return PTR_ERR(planes->regs);
+
+	dev_set_drvdata(dev, planes);
+
+	sun50i_planes_init_mapping(planes);
+
+	return 0;
+}
+
+static const struct sun50i_planes_quirks sun50i_h616_planes_quirks = {
+	.def_map = {
+		{
+			.map = {0, 6, 7},
+			.num_ch = 3,
+		},
+		{
+			.map = {1, 2, 8},
+			.num_ch = 3,
+		},
+	},
+	.cfg = {
+		.de_type	= SUN8I_MIXER_DE33,
+		/*
+		 * TODO: All planes support scaling, but driver needs
+		 * improvements to properly support it.
+		 */
+		.scaler_mask    = 0,
+		.scanline_yuv	= 4096,
+	},
+};
+
+/* sun4i_drv uses this list to check if a device node is a plane */
+const struct of_device_id sun50i_planes_of_table[] = {
+	{
+		.compatible = "allwinner,sun50i-h616-de33-planes",
+		.data = &sun50i_h616_planes_quirks
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, sun50i_planes_of_table);
+EXPORT_SYMBOL(sun50i_planes_of_table);
+
+static struct platform_driver sun50i_planes_platform_driver = {
+	.probe		= sun50i_planes_probe,
+	.driver		= {
+		.name		= "sun50i-planes",
+		.of_match_table	= sun50i_planes_of_table,
+	},
+};
+module_platform_driver(sun50i_planes_platform_driver);
+
+MODULE_AUTHOR("Jernej Skrabec <jernej.skrabec@gmail.com>");
+MODULE_DESCRIPTION("Allwinner DE33 planes driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/sun4i/sun50i_planes.h b/drivers/gpu/drm/sun4i/sun50i_planes.h
new file mode 100644
index 000000000000..446feaeb03fc
--- /dev/null
+++ b/drivers/gpu/drm/sun4i/sun50i_planes.h
@@ -0,0 +1,43 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/* Copyright (c) 2025 Jernej Skrabec <jernej.skrabec@gmail.com> */
+
+#ifndef _SUN50I_PLANES_H_
+#define _SUN50I_PLANES_H_
+
+#include <drm/drm_device.h>
+#include <linux/regmap.h>
+
+#include "sun8i_mixer.h"
+
+/* mapping registers, located in clock register space */
+#define SUNXI_DE33_DE_CHN2CORE_MUX_REG	0x24
+#define SUNXI_DE33_DE_PORT02CHN_MUX_REG	0x28
+#define SUNXI_DE33_DE_PORT12CHN_MUX_REG	0x2c
+
+#define MAX_DISP	2
+#define MAX_CHANNELS	8
+#define UI_PLANE_OFFSET	6
+
+struct default_map {
+	unsigned int map[MAX_CHANNELS];
+	unsigned int num_ch;
+};
+
+struct sun50i_planes_quirks {
+	struct default_map	def_map[MAX_DISP];
+	struct sun8i_layer_cfg	cfg;
+};
+
+struct sun50i_planes {
+	struct regmap				*regs;
+	struct regmap				*mapping;
+	const struct sun50i_planes_quirks	*quirks;
+};
+
+extern const struct of_device_id sun50i_planes_of_table[];
+
+struct drm_plane **
+sun50i_planes_setup(struct device *dev, struct drm_device *drm,
+		    unsigned int mixer);
+
+#endif /* _SUN50I_PLANES_H_ */
-- 
2.51.2


