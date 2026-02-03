Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5169E87842
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 16:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FjDBV+vpb8yt/dEHhvmFIC+FrUeEn9ZhYOE/mET00fM=; b=yXSD6LArvAY/7gBi2DxVlEscH2
	xP0kewBlYe5JtFiNNzW/Uk2JhTOzXF3tt2KXmX/8j6qEzhh6Lc3uyZ6Sxrd2DCEYyCylXH+8A9TGf
	O62r1gYA7Uh4vgQvoZY7YQjFXLakBZu3Ob6Y9p+fU1J/lfRK7b8cnEhpMmuDIqN5kfKkS/DLVrAud
	PkFVS5annV2USp0KSY23Rzeh/sxkmz/9ph0qm+hzYMaGFriYeJoNRXeEKtfEHLmY+mEyx98KoWBqg
	MDkCggta2G7i6VcC+fKfzABAA6EtuTtgBeVE20JeYk+efmKXR/lSGsWAwoDSksyJwp5fhIbbXLiWZ
	uOKA2gqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnJY5-00000006xzJ-1H06;
	Tue, 03 Feb 2026 16:46:45 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnJY1-00000006xtW-0XBU;
	Tue, 03 Feb 2026 16:46:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770137195;
	bh=Y5VfZahgsvoFHQVzJNoJGCb4Sg/wGxHpJ/c9bYoeFoA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=m+HcVhMnbsusZgebDwe50T8wcOXcWtl+K9KHUUhdoAtvYUIHmpQtQboyw0RzvTvcH
	 /Lf68MyMjJ9LcZOV/caoucgBh6qrALMskdyZFGXus2Gf/YdQxk4MBbO8G/VAuRHb2l
	 J24v7a8Xb+kuzfRyA1wPDKGynRwrtkhCFLEyZ/drGZ1Gj1PmJVtAHQkJZOtR2UKdHK
	 NvpNrA8yLgvjxqTCP8Q5fm84BXmYnp8QQEDinI708h6eRg2Jw2P1wuTv8cYCUgwmD9
	 wuySJ/PTF4EzvMkHMRg7N+mlpMQz1wemdqk5akh9EYhxvbmyInczC/12vJ/u4jYOOB
	 3w7atFl/75yQQ==
Received: from jupiter.universe (dyndsl-091-248-189-143.ewe-ip-backbone.de [91.248.189.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DDA0117E35D2;
	Tue,  3 Feb 2026 17:46:34 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 1D9C148002F; Tue, 03 Feb 2026 17:46:34 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 03 Feb 2026 17:46:32 +0100
Subject: [PATCH v2 10/10] ASoC: rockchip: spdif: Convert to FIELD_PREP
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260203-rockchip-spdif-cleanup-and-bsp-sync-v2-10-4412016cf577@collabora.com>
References: <20260203-rockchip-spdif-cleanup-and-bsp-sync-v2-0-4412016cf577@collabora.com>
In-Reply-To: <20260203-rockchip-spdif-cleanup-and-bsp-sync-v2-0-4412016cf577@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: Alexey Charkov <alchark@gmail.com>, 
 Sjoerd Simons <sjoerd.simons@collabora.com>, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6129;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=Y5VfZahgsvoFHQVzJNoJGCb4Sg/wGxHpJ/c9bYoeFoA=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGmCJmqCjbMF4Eyd9bLV5lvYDHaiLZ3+rrj1g
 dJ9A897hHZ/pIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJpgiZqAAoJENju1/PI
 O/qa0kkP/iyDzUnWRcjZzKSXDTESg5OQ6ADt3rTdLtmCe6yrBNiUAyA2P8GIKNV8jpo/UmnzxxH
 2HSXr4SH4kInH+0IMJfhjTn/4AkUU5hABJ+F5I9uI0o4IQkm4FaDNvh7uapvfQoketbacdqbsaA
 OCLrO8/PE3iRNmrY1m0VVVLt3JLd1uDxPgr/r2WEeIJgKVZwK4bxoAR+fyk+Ts5xSyN0joI4w55
 w0Tj3fRE8BKKh1EVrrPzMYqeVvP35J/pYhQUn/R/KVJYwWZRf6C4DSQcHjFvuGWfKimX1Z+CLdu
 V3JlOMrJfTkgZlVNOJRUWOUdETjU1/DqoaXMmPkyNSvvrCKDTt9NXh3vFEoEKocvTRqtkh6cZuP
 TbW8wY0p5i5xKUPRqRm4cNYBexK4vKnkRAu1MVoiuS2PPYypZCVYALS5fKo4r4lUw63VkWt/qP/
 m+oGvv7NqSKFjZeRVJwjvWaTANTtDnT/GT+bnvr7AM/yOzhlLVH1Gh18qfExY1blJjghbvHsoal
 MCSAA5ihCMr02TSPsgAU1CsWmD078A1H26HkrFBlb4uBfvHSrhLr+OXHiz4oeTQt8Ivd+fq9fyp
 ycfVeeUHg5oSTvGPDqEHnvSLQt6d+I7TkzOJb+HzV1QZLH4hqTVHYtCnXmSpRK0ML90/zkUV7JY
 EXXTOfnJanxdMrJvuW4MuEw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_084641_326521_551AFC3A 
X-CRM114-Status: GOOD (  14.80  )
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

Convert the driver to use FIELD_PREP to increase readability.
This also fixes an issue that the SDPIF_CFGR_VDW_MASK was wrong,
which didn't have any effects as the only user in the driver
updates the other bits at the same time.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 sound/soc/rockchip/rockchip_spdif.c | 13 ++++-----
 sound/soc/rockchip/rockchip_spdif.h | 53 +++++++++++++++++--------------------
 2 files changed, 32 insertions(+), 34 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_spdif.c b/sound/soc/rockchip/rockchip_spdif.c
index e64c24897f29..581624f2682e 100644
--- a/sound/soc/rockchip/rockchip_spdif.c
+++ b/sound/soc/rockchip/rockchip_spdif.c
@@ -5,10 +5,11 @@
  *
  * Copyright (c) 2014 Rockchip Electronics Co. Ltd.
  * Author: Jianqun <jay.xu@rock-chips.com>
- * Copyright (c) 2015 Collabora Ltd.
+ * Copyright (c) 2015-2026 Collabora Ltd.
  * Author: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
  */
 
+#include <linux/bitfield.h>
 #include <linux/module.h>
 #include <linux/delay.h>
 #include <linux/clk.h>
@@ -159,7 +160,7 @@ static int rk_spdif_hw_params(struct snd_pcm_substream *substream,
 
 	ret = regmap_update_bits(spdif->regmap, SPDIF_CFGR,
 				 SPDIF_CFGR_CLK_DIV_MASK |
-				 SPDIF_CFGR_HALFWORD_ENABLE |
+				 SPDIF_CFGR_HALFWORD_MASK |
 				 SDPIF_CFGR_VDW_MASK |
 				 SPDIF_CFGR_ADJ_MASK, val);
 
@@ -177,7 +178,7 @@ static int rk_spdif_trigger(struct snd_pcm_substream *substream,
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 		ret = regmap_update_bits(spdif->regmap, SPDIF_DMACR,
-					 SPDIF_DMACR_TDE_ENABLE |
+					 SPDIF_DMACR_TDE_MASK |
 					 SPDIF_DMACR_TDL_MASK,
 					 SPDIF_DMACR_TDE_ENABLE |
 					 SPDIF_DMACR_TDL(16));
@@ -186,21 +187,21 @@ static int rk_spdif_trigger(struct snd_pcm_substream *substream,
 			return ret;
 
 		ret = regmap_update_bits(spdif->regmap, SPDIF_XFER,
-					 SPDIF_XFER_TXS_START,
+					 SPDIF_XFER_TXS_MASK,
 					 SPDIF_XFER_TXS_START);
 		break;
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 		ret = regmap_update_bits(spdif->regmap, SPDIF_DMACR,
-					 SPDIF_DMACR_TDE_ENABLE,
+					 SPDIF_DMACR_TDE_MASK,
 					 SPDIF_DMACR_TDE_DISABLE);
 
 		if (ret != 0)
 			return ret;
 
 		ret = regmap_update_bits(spdif->regmap, SPDIF_XFER,
-					 SPDIF_XFER_TXS_START,
+					 SPDIF_XFER_TXS_MASK,
 					 SPDIF_XFER_TXS_STOP);
 		break;
 	default:
diff --git a/sound/soc/rockchip/rockchip_spdif.h b/sound/soc/rockchip/rockchip_spdif.h
index b837b1f8d57f..ec33295e2512 100644
--- a/sound/soc/rockchip/rockchip_spdif.h
+++ b/sound/soc/rockchip/rockchip_spdif.h
@@ -2,7 +2,7 @@
 /*
  * ALSA SoC Audio Layer - Rockchip SPDIF transceiver driver
  *
- * Copyright (c) 2015 Collabora Ltd.
+ * Copyright (c) 2015-2026 Collabora Ltd.
  * Author: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
  */
 
@@ -13,53 +13,50 @@
  * CFGR
  * transfer configuration register
 */
-#define SPDIF_CFGR_CLK_DIV_SHIFT	(16)
-#define SPDIF_CFGR_CLK_DIV_MASK		(0xff << SPDIF_CFGR_CLK_DIV_SHIFT)
-#define SPDIF_CFGR_CLK_DIV(x)		((x-1) << SPDIF_CFGR_CLK_DIV_SHIFT)
+#define SPDIF_CFGR_CLK_DIV_MASK		GENMASK(23, 16)
+#define SPDIF_CFGR_CLK_DIV(x)		FIELD_PREP(SPDIF_CFGR_CLK_DIV_MASK, x-1)
 
 #define SPDIF_CFGR_CLR_MASK		BIT(7)
-#define SPDIF_CFGR_CLR_EN		BIT(7)
-#define SPDIF_CFGR_CLR_DIS		0
+#define SPDIF_CFGR_CLR_EN		FIELD_PREP(SPDIF_CFGR_CLR_MASK, 1)
+#define SPDIF_CFGR_CLR_DIS		FIELD_PREP(SPDIF_CFGR_CLR_MASK, 0)
 
 #define SPDIF_CFGR_CSE_MASK		BIT(6)
-#define SPDIF_CFGR_CSE_EN		BIT(6)
-#define SPDIF_CFGR_CSE_DIS		0
+#define SPDIF_CFGR_CSE_EN		FIELD_PREP(SPDIF_CFGR_CSE_MASK, 1)
+#define SPDIF_CFGR_CSE_DIS		FIELD_PREP(SPDIF_CFGR_CSE_MASK, 0)
 
 #define SPDIF_CFGR_ADJ_MASK		BIT(3)
-#define SPDIF_CFGR_ADJ_LEFT_J		BIT(3)
-#define SPDIF_CFGR_ADJ_RIGHT_J		0
+#define SPDIF_CFGR_ADJ_LEFT_J		FIELD_PREP(SPDIF_CFGR_ADJ_MASK, 1)
+#define SPDIF_CFGR_ADJ_RIGHT_J		FIELD_PREP(SPDIF_CFGR_ADJ_MASK, 0)
 
-#define SPDIF_CFGR_HALFWORD_SHIFT	2
-#define SPDIF_CFGR_HALFWORD_DISABLE	(0 << SPDIF_CFGR_HALFWORD_SHIFT)
-#define SPDIF_CFGR_HALFWORD_ENABLE	(1 << SPDIF_CFGR_HALFWORD_SHIFT)
+#define SPDIF_CFGR_HALFWORD_MASK	BIT(2)
+#define SPDIF_CFGR_HALFWORD_DISABLE	FIELD_PREP(SPDIF_CFGR_HALFWORD_MASK, 0)
+#define SPDIF_CFGR_HALFWORD_ENABLE	FIELD_PREP(SPDIF_CFGR_HALFWORD_MASK, 1)
 
-#define SPDIF_CFGR_VDW_SHIFT	0
-#define SPDIF_CFGR_VDW(x)	(x << SPDIF_CFGR_VDW_SHIFT)
-#define SDPIF_CFGR_VDW_MASK	(0xf << SPDIF_CFGR_VDW_SHIFT)
+#define SDPIF_CFGR_VDW_MASK		GENMASK(1, 0)
+#define SPDIF_CFGR_VDW(x)		FIELD_PREP(SDPIF_CFGR_VDW_MASK, x)
 
-#define SPDIF_CFGR_VDW_16	SPDIF_CFGR_VDW(0x0)
-#define SPDIF_CFGR_VDW_20	SPDIF_CFGR_VDW(0x1)
-#define SPDIF_CFGR_VDW_24	SPDIF_CFGR_VDW(0x2)
+#define SPDIF_CFGR_VDW_16		SPDIF_CFGR_VDW(0x0)
+#define SPDIF_CFGR_VDW_20		SPDIF_CFGR_VDW(0x1)
+#define SPDIF_CFGR_VDW_24		SPDIF_CFGR_VDW(0x2)
 
 /*
  * DMACR
  * DMA control register
 */
-#define SPDIF_DMACR_TDE_SHIFT	5
-#define SPDIF_DMACR_TDE_DISABLE	(0 << SPDIF_DMACR_TDE_SHIFT)
-#define SPDIF_DMACR_TDE_ENABLE	(1 << SPDIF_DMACR_TDE_SHIFT)
+#define SPDIF_DMACR_TDE_MASK		BIT(5)
+#define SPDIF_DMACR_TDE_DISABLE		FIELD_PREP(SPDIF_DMACR_TDE_MASK, 0)
+#define SPDIF_DMACR_TDE_ENABLE		FIELD_PREP(SPDIF_DMACR_TDE_MASK, 1)
 
-#define SPDIF_DMACR_TDL_SHIFT	0
-#define SPDIF_DMACR_TDL(x)	((x) << SPDIF_DMACR_TDL_SHIFT)
-#define SPDIF_DMACR_TDL_MASK	(0x1f << SPDIF_DMACR_TDL_SHIFT)
+#define SPDIF_DMACR_TDL_MASK		GENMASK(4, 0)
+#define SPDIF_DMACR_TDL(x)		FIELD_PREP(SPDIF_DMACR_TDL_MASK, x)
 
 /*
  * XFER
  * Transfer control register
 */
-#define SPDIF_XFER_TXS_SHIFT	0
-#define SPDIF_XFER_TXS_STOP	(0 << SPDIF_XFER_TXS_SHIFT)
-#define SPDIF_XFER_TXS_START	(1 << SPDIF_XFER_TXS_SHIFT)
+#define SPDIF_XFER_TXS_MASK		BIT(0)
+#define SPDIF_XFER_TXS_STOP		FIELD_PREP(SPDIF_XFER_TXS_MASK, 0)
+#define SPDIF_XFER_TXS_START		FIELD_PREP(SPDIF_XFER_TXS_MASK, 1)
 
 #define SPDIF_CFGR	(0x0000)
 #define SPDIF_SDBLR	(0x0004)

-- 
2.51.0


