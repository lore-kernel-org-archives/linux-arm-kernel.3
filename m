Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8213BC83030
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 22:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wTT5B/xkvp1SW2xZRiZIiqcFcYhItnKtVlUHBwlFw7Q=; b=c3k9GvBPNDIkNKdvBOLcieKbSq
	IHtkY4OslwKdDcNNzE4iIEfhDdiU+PZb/GelwmZg/goK9w6iuDx7Lkrn7b2BxjAAsO5VrD5Bqb1vT
	NoZIu07DsB7xjuMS1RnI/Zp5RR5NlTYgaE31bxwWWcXEEI6O/+l1QMktz6fuRGK0FlrGO682ZaDCz
	klPfEc34QH2bY7TgdWwOgklSMO5JD+cpYh2qUkNYx9hFAdWEr5U1OVdVF6sup6nKiJVEuxZIQ5FgW
	pEUS1cydWJgudYF9VMdzYy88Qq0kLD4u5mGAHKzCWVzJGD7r9mhz97gTYcwGfao5b40kV9Al6AaA2
	jRZQ0z5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXSGr-0000000Ci3c-1ZUq;
	Thu, 03 Jul 2025 22:19:09 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXOmT-0000000CFZw-3pwH;
	Thu, 03 Jul 2025 18:35:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3439CA539DF;
	Thu,  3 Jul 2025 18:35:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85A71C4CEE3;
	Thu,  3 Jul 2025 18:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751567732;
	bh=MBHO2Lp90PjrfqVCqAlyfS1xa5ydxsxVFITQfZTnBrQ=;
	h=From:To:Cc:Subject:Date:From;
	b=LzzOVJm5R/ZxgePynHa0bVwans+jGaLjduqqB8omRZUFK/UsZxI7mB7YFt1OhLpIJ
	 2drrZ+QEKyTda8SfmOaBBZ4ME0du8/rXZeEXITq81ZtvtZYreW74elidIZU5+inc02
	 8HRqIu302nb+VKLdctcTyQ/rCQ76hsr5XDH1y1uGIMKk60wG6gDWu+WBvRFPFCoYZR
	 8u+waa0geqvAult9hoCG2FMohPB3dGBBmfzBW0uZgdBHKkPU92BSG2pnI8tDKIksNk
	 EM5NvJ4BXxvIG0Xz1JgzTxUqQggpY9kJlhZagkHheB9ybX8vUHGkP5d3ECW1+zroLO
	 MxZSC4nI5Qk6g==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Cheng-Yi Chiang <cychiang@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Benson Leung <bleung@chromium.org>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chrome-platform@lists.linux.dev,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sound-open-firmware@alsa-project.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] ASoC: Use of_reserved_mem_region_to_resource() for "memory-region"
Date: Thu,  3 Jul 2025 13:35:21 -0500
Message-ID: <20250703183523.2075276-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_113534_085008_E4342ADF 
X-CRM114-Status: GOOD (  14.69  )
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

Use the newly added of_reserved_mem_region_to_resource() function to
handle "memory-region" properties.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 sound/soc/codecs/cros_ec_codec.c       | 30 ++++++++++-----------
 sound/soc/sof/imx/imx-common.c         | 36 +++++---------------------
 sound/soc/sof/mediatek/mt8186/mt8186.c | 11 +-------
 sound/soc/sof/mediatek/mt8195/mt8195.c | 11 +-------
 4 files changed, 22 insertions(+), 66 deletions(-)

diff --git a/sound/soc/codecs/cros_ec_codec.c b/sound/soc/codecs/cros_ec_codec.c
index 571222ec520c..937c8cec682a 100644
--- a/sound/soc/codecs/cros_ec_codec.c
+++ b/sound/soc/codecs/cros_ec_codec.c
@@ -18,6 +18,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/platform_data/cros_ec_commands.h>
 #include <linux/platform_data/cros_ec_proto.h>
 #include <linux/platform_device.h>
@@ -961,7 +962,6 @@ static int cros_ec_codec_platform_probe(struct platform_device *pdev)
 	struct ec_response_ec_codec_get_capabilities r;
 	int ret;
 #ifdef CONFIG_OF
-	struct device_node *node;
 	struct resource res;
 	u64 ec_shm_size;
 	const __be32 *regaddr_p;
@@ -981,22 +981,18 @@ static int cros_ec_codec_platform_probe(struct platform_device *pdev)
 			priv->ec_shm_addr, priv->ec_shm_len);
 	}
 
-	node = of_parse_phandle(dev->of_node, "memory-region", 0);
-	if (node) {
-		ret = of_address_to_resource(node, 0, &res);
-		if (!ret) {
-			priv->ap_shm_phys_addr = res.start;
-			priv->ap_shm_len = resource_size(&res);
-			priv->ap_shm_addr =
-				(uint64_t)(uintptr_t)devm_ioremap_wc(
-					dev, priv->ap_shm_phys_addr,
-					priv->ap_shm_len);
-			priv->ap_shm_last_alloc = priv->ap_shm_phys_addr;
-
-			dev_dbg(dev, "ap_shm_phys_addr=%#llx len=%#x\n",
-				priv->ap_shm_phys_addr, priv->ap_shm_len);
-		}
-		of_node_put(node);
+	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
+	if (!ret) {
+		priv->ap_shm_phys_addr = res.start;
+		priv->ap_shm_len = resource_size(&res);
+		priv->ap_shm_addr =
+			(uint64_t)(uintptr_t)devm_ioremap_wc(
+				dev, priv->ap_shm_phys_addr,
+				priv->ap_shm_len);
+		priv->ap_shm_last_alloc = priv->ap_shm_phys_addr;
+
+		dev_dbg(dev, "ap_shm_phys_addr=%#llx len=%#x\n",
+			priv->ap_shm_phys_addr, priv->ap_shm_len);
 	}
 #endif
 
diff --git a/sound/soc/sof/imx/imx-common.c b/sound/soc/sof/imx/imx-common.c
index 62bf707aa909..f00b381cec3b 100644
--- a/sound/soc/sof/imx/imx-common.c
+++ b/sound/soc/sof/imx/imx-common.c
@@ -282,11 +282,8 @@ static int imx_region_name_to_blk_type(const char *region_name)
 static int imx_parse_ioremap_memory(struct snd_sof_dev *sdev)
 {
 	const struct imx_chip_info *chip_info;
-	struct reserved_mem *reserved;
 	struct platform_device *pdev;
-	struct device_node *res_np;
-	phys_addr_t base, size;
-	struct resource *res;
+	struct resource *res, _res;
 	int i, blk_type, ret;
 
 	pdev = to_platform_device(sdev->dev);
@@ -307,37 +304,18 @@ static int imx_parse_ioremap_memory(struct snd_sof_dev *sdev)
 						     "failed to fetch %s resource\n",
 						     chip_info->memory[i].name);
 
-			base = res->start;
-			size = resource_size(res);
 		} else {
-			ret = of_property_match_string(pdev->dev.of_node,
-						       "memory-region-names",
-						       chip_info->memory[i].name);
+			ret = of_reserved_mem_region_to_resource_byname(pdev->dev.of_node,
+									chip_info->memory[i].name,
+									&_res);
 			if (ret < 0)
 				return dev_err_probe(sdev->dev, ret,
-						     "no valid index for %s\n",
+						     "no valid entry for %s\n",
 						     chip_info->memory[i].name);
-
-			res_np = of_parse_phandle(pdev->dev.of_node,
-						  "memory-region",
-						  ret);
-			if (!res_np)
-				return dev_err_probe(sdev->dev, -ENODEV,
-						     "failed to parse phandle %s\n",
-						     chip_info->memory[i].name);
-
-			reserved = of_reserved_mem_lookup(res_np);
-			of_node_put(res_np);
-			if (!reserved)
-				return dev_err_probe(sdev->dev, -ENODEV,
-						     "failed to get %s reserved\n",
-						     chip_info->memory[i].name);
-
-			base = reserved->base;
-			size = reserved->size;
+			res = &_res;
 		}
 
-		sdev->bar[blk_type] = devm_ioremap(sdev->dev, base, size);
+		sdev->bar[blk_type] = devm_ioremap_resource(sdev->dev, res);
 		if (!sdev->bar[blk_type])
 			return dev_err_probe(sdev->dev,
 					     -ENOMEM,
diff --git a/sound/soc/sof/mediatek/mt8186/mt8186.c b/sound/soc/sof/mediatek/mt8186/mt8186.c
index 7ff080452cbe..c1bea967737d 100644
--- a/sound/soc/sof/mediatek/mt8186/mt8186.c
+++ b/sound/soc/sof/mediatek/mt8186/mt8186.c
@@ -12,7 +12,6 @@
 #include <linux/delay.h>
 #include <linux/firmware.h>
 #include <linux/io.h>
-#include <linux/of_address.h>
 #include <linux/of_irq.h>
 #include <linux/of_platform.h>
 #include <linux/of_reserved_mem.h>
@@ -46,7 +45,6 @@ static int platform_parse_resource(struct platform_device *pdev, void *data)
 {
 	struct resource *mmio;
 	struct resource res;
-	struct device_node *mem_region;
 	struct device *dev = &pdev->dev;
 	struct mtk_adsp_chip_info *adsp = data;
 	int ret;
@@ -57,14 +55,7 @@ static int platform_parse_resource(struct platform_device *pdev, void *data)
 		return ret;
 	}
 
-	mem_region = of_parse_phandle(dev->of_node, "memory-region", 1);
-	if (!mem_region) {
-		dev_err(dev, "no memory-region sysmem phandle\n");
-		return -ENODEV;
-	}
-
-	ret = of_address_to_resource(mem_region, 0, &res);
-	of_node_put(mem_region);
+	ret = of_reserved_mem_region_to_resource(dev->of_node, 1, &res);
 	if (ret) {
 		dev_err(dev, "of_address_to_resource sysmem failed\n");
 		return ret;
diff --git a/sound/soc/sof/mediatek/mt8195/mt8195.c b/sound/soc/sof/mediatek/mt8195/mt8195.c
index 3b3582d74510..4d6e9300a9c0 100644
--- a/sound/soc/sof/mediatek/mt8195/mt8195.c
+++ b/sound/soc/sof/mediatek/mt8195/mt8195.c
@@ -12,7 +12,6 @@
 #include <linux/delay.h>
 #include <linux/firmware.h>
 #include <linux/io.h>
-#include <linux/of_address.h>
 #include <linux/of_irq.h>
 #include <linux/of_platform.h>
 #include <linux/of_reserved_mem.h>
@@ -46,7 +45,6 @@ static int platform_parse_resource(struct platform_device *pdev, void *data)
 {
 	struct resource *mmio;
 	struct resource res;
-	struct device_node *mem_region;
 	struct device *dev = &pdev->dev;
 	struct mtk_adsp_chip_info *adsp = data;
 	int ret;
@@ -57,14 +55,7 @@ static int platform_parse_resource(struct platform_device *pdev, void *data)
 		return ret;
 	}
 
-	mem_region = of_parse_phandle(dev->of_node, "memory-region", 1);
-	if (!mem_region) {
-		dev_err(dev, "no memory-region sysmem phandle\n");
-		return -ENODEV;
-	}
-
-	ret = of_address_to_resource(mem_region, 0, &res);
-	of_node_put(mem_region);
+	ret = of_reserved_mem_region_to_resource(dev->of_node, 1, &res);
 	if (ret) {
 		dev_err(dev, "of_address_to_resource sysmem failed\n");
 		return ret;
-- 
2.47.2


