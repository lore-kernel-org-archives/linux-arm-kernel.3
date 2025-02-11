Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69927C021A1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 11:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+VSx9LHuuAaQ3dUW93WWkwf4rvoMWSkIxDHFXY87vOY=; b=FqudCKfzcxjmM1NtFeBUH3G90w
	1ugiOeS7O0URzJ2TqugaoD3dgHGf5kwwwE3PJLUjN62ngIg4fCdhTTu06AFc4HAaR9M7G5gHBYlnW
	uW4Epd9o2tXeDPDO/hFIInCNkkNnXX6y6Rz1vPmgAUg7Ox4YRQcu8F4YGSroITtyAHrjaV9ctMxTx
	2gV+WwU23yjwG9c6dL3jot3Pt1pF3SGbvCgP62qS59DH2ns3XcQ+rqliu66YBdzMltvYSyeQrnY/4
	a2YyDzKVFwoqgkNw4VMRBwxoFP3paoQhndWK9umByjT7VgH4F3Bq8RB4ihSDaPl0X6Yt1qVPm8aHU
	vo+oOKpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thous-00000003fap-3KlB;
	Tue, 11 Feb 2025 11:59:02 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thoXK-00000003Yfi-3dso;
	Tue, 11 Feb 2025 11:34:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739273681;
	bh=8FwDjsL0FO1e0PngY9VFxLpqfmD+/geWr8ohK4DVt1Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KJ243CBuCzKN4YqoPKiq0rjmk1u9yTBZTzmhKEv4RlhW9AB9GKt/dDxuMuiBzm1YA
	 /yQlQMsQ0HvuiYh5LAmZ8imXQcmakiinlezS9QJ2A/GskdIotqmQrYQvofg9mLt6gt
	 7PgXWzPGz9UvSltFNM31iXQMsBuyk/2EW4CYFDoZQFq0oblbaRwLrLSzpbGN1lIBWM
	 smz0UWYpAcnkWDHKlsQfj4yrgrC/WXmUqjtEcBPUB2VJSgK/Gykcg1sGBIS+za+sVb
	 uR9sgdBimb4kEIt53llTfotKCGc45EU0jTbzVVCordvZ+uLl5Vfwa5RcqIB+R5z75k
	 46pAxg9w3kB+w==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F415C17E1542;
	Tue, 11 Feb 2025 12:34:39 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	ck.hu@mediatek.com,
	jitao.shi@mediatek.com,
	jie.qiu@mediatek.com,
	junzhi.zhao@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	dmitry.baryshkov@linaro.org,
	lewis.liao@mediatek.com,
	ives.chenjh@mediatek.com,
	tommyyl.chen@mediatek.com,
	jason-jh.lin@mediatek.com,
	Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH v6 14/42] drm/mediatek: mtk_hdmi_ddc: Switch to register as module_platform_driver
Date: Tue, 11 Feb 2025 12:33:41 +0100
Message-ID: <20250211113409.1517534-15-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250211113409.1517534-1-angelogioacchino.delregno@collabora.com>
References: <20250211113409.1517534-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_033443_077501_88B8B05F 
X-CRM114-Status: GOOD (  16.19  )
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

In preparation for adding a driver for the new HDMIv2 IP, and
before splitting out the common bits from the HDMI driver,
change the mtk_hdmi_ddc driver from being registered from the
HDMI driver itself to be a module_platform_driver of its own.

With this change, there are no more users of the mtk_hdmi.h header
so, while at it, also remove it.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/Makefile       |  6 ++----
 drivers/gpu/drm/mediatek/mtk_hdmi.c     |  2 --
 drivers/gpu/drm/mediatek/mtk_hdmi.h     | 13 -------------
 drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c |  2 +-
 4 files changed, 3 insertions(+), 20 deletions(-)
 delete mode 100644 drivers/gpu/drm/mediatek/mtk_hdmi.h

diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
index bdd3a062f797..43afd0a26d14 100644
--- a/drivers/gpu/drm/mediatek/Makefile
+++ b/drivers/gpu/drm/mediatek/Makefile
@@ -21,10 +21,8 @@ mediatek-drm-y := mtk_crtc.o \
 
 obj-$(CONFIG_DRM_MEDIATEK) += mediatek-drm.o
 
-mediatek-drm-hdmi-objs := mtk_hdmi.o \
-			  mtk_hdmi_ddc.o
-
 obj-$(CONFIG_DRM_MEDIATEK_HDMI) += mtk_cec.o
-obj-$(CONFIG_DRM_MEDIATEK_HDMI) += mediatek-drm-hdmi.o
+obj-$(CONFIG_DRM_MEDIATEK_HDMI) += mtk_hdmi.o
+obj-$(CONFIG_DRM_MEDIATEK_HDMI) += mtk_hdmi_ddc.o
 
 obj-$(CONFIG_DRM_MEDIATEK_DP) += mtk_dp.o
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index da725182f0db..e648fb5714e7 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -31,7 +31,6 @@
 #include <drm/drm_probe_helper.h>
 
 #include "mtk_cec.h"
-#include "mtk_hdmi.h"
 #include "mtk_hdmi_regs.h"
 
 #define NCTS_BYTES	7
@@ -1804,7 +1803,6 @@ static struct platform_driver mtk_hdmi_driver = {
 };
 
 static struct platform_driver * const mtk_hdmi_drivers[] = {
-	&mtk_hdmi_ddc_driver,
 	&mtk_hdmi_driver,
 };
 
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.h b/drivers/gpu/drm/mediatek/mtk_hdmi.h
deleted file mode 100644
index e40bc4651995..000000000000
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.h
+++ /dev/null
@@ -1,13 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright (c) 2014 MediaTek Inc.
- * Author: Jie Qiu <jie.qiu@mediatek.com>
- */
-#ifndef _MTK_HDMI_CTRL_H
-#define _MTK_HDMI_CTRL_H
-
-struct platform_driver;
-
-extern struct platform_driver mtk_hdmi_ddc_driver;
-
-#endif /* _MTK_HDMI_CTRL_H */
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c b/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c
index 07db68067844..6358e1af69b4 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c
@@ -20,7 +20,6 @@
 #include <linux/of_platform.h>
 
 #include "mtk_drm_drv.h"
-#include "mtk_hdmi.h"
 
 #define SIF1_CLOK		(288)
 #define DDC_DDCMCTL0		(0x0)
@@ -337,6 +336,7 @@ struct platform_driver mtk_hdmi_ddc_driver = {
 		.of_match_table = mtk_hdmi_ddc_match,
 	},
 };
+module_platform_driver(mtk_hdmi_ddc_driver);
 
 MODULE_AUTHOR("Jie Qiu <jie.qiu@mediatek.com>");
 MODULE_DESCRIPTION("MediaTek HDMI DDC Driver");
-- 
2.48.1


