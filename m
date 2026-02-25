Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C482EFD237
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 09:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZTzGWHccByJBdaZUZxrkE2sNIhOCCTQKy9wwE5UBFMs=; b=Lb8QDIO4m5PC1TFijXld+vYYo+
	9+LVrpqZ1G1LezhAFekBXTGD21TvcKZS4ZUOe349Ns0LZM7rQTgXY8fxuPCaEdJ8COnRSv7c3GaJ4
	NvXmy8u2W6o8ShnhIkriYyW0Op8AWpyCC+td6t9F2YJygiZaaKi4lfPny65NfNtin7qmWm2gHFGWV
	F8HO8Ej61o/RA50wsWSNp/Hf1QOc7nzVhZMwA5twsJKYENqQAg5tkURUa28h66jRxai4KDAlMf2FO
	+Z+aEHbz2NBpt9HGNKM/eNEIhMKpwpQkhFWtDXqmCBr7innibhND8IRKK0ABu9VwgIicnFeCDfMJ3
	OKFK9H+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvBOI-00000003iGH-2zjR;
	Wed, 25 Feb 2026 09:41:10 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvBOF-00000003iEm-3JV0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 09:41:09 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4836f4cbe0bso49802325e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 01:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772012466; x=1772617266; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZTzGWHccByJBdaZUZxrkE2sNIhOCCTQKy9wwE5UBFMs=;
        b=iZckZT/S2FIEHHwIMCr/7ctzXOywBTJSf5rsExzZLUT9W9dVKOKW45DLlccuBV/XBE
         e8K+CFxKTacEU0oIwMPBtBm8ATxWQSg7EvcRpLbincw7L8hMmJwcRtj8PDMBV3pbXr+x
         bX/kgMbt6xpXeAQvMb3MPua+5WUAuETTIaGlBV3ZR7DDqiw4bZhUx44IFkUwxFmEeJzx
         5qMX1LxvrtfFw5wEdlF+Xjzw+sdcUBUOSNPiYBLIvn86LIfbG5RriD4b6I9qXbGEPqIh
         1nPB0n4VnrZpmPNBIbqZYIjafB/r9o1stH7L9P6Jx0QBxriBPW40x7spENu5fcmdu7Q6
         WbPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772012466; x=1772617266;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZTzGWHccByJBdaZUZxrkE2sNIhOCCTQKy9wwE5UBFMs=;
        b=c06BHlJDDFKWvBsASv3vgSnkJ9yh6hCnfERpfdIOqyQKgBJHKXRBU+1fwOu6Gsn9Yr
         7Zh+jKk4L6mhU4p5weOEla1Bm9ZAh3OkwzAmBBuyn3CO/6f3Y843NTS9B3x4gUbCB1Aj
         rU5U2GKIM7/I8cxfALVqsb9bSDOpBT7mEs+4czUYqESPLwjiMZUBktpSs6P6sfWsg3JH
         /kHCT5tiWRn0vXET9/G+fBClcKz1KKP0yZb05lzRGjn6HYNeYv15KSju+SrwcH7JmwNA
         H50gqXHGNtQucsnHFEroSoaM+Uxsh0dr9XdUMgxNdFS8OmBJ7IbDCdSQH2f1FrMNZPqR
         ApTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHvwezGBWevDoAHcHgxwq/GCHwrO0swfoReisAgOwSAx2rj8rlm5Xk2mbCjX2KPPn+M7Fzt3jGSwPItuMFP+Fg@lists.infradead.org
X-Gm-Message-State: AOJu0YzY+RSabgaPN4FNJ9kbsPT2286J6m9LJQPIR4A9asxCPzhrQuVe
	/NebvCK5ETi8iBep1/YgNVpy7mV8Y98d3FmkiCfsh3TRAeQgzpAt2PnN
X-Gm-Gg: ATEYQzwwXGQ766IcbogEbLinsJUJ9rTxA0uL+pbJHOCioeOt7gavgLepYvd3MuK+6yr
	dOLrSoKPXYBWN+Rp+BxqcgxjW1fzLGLu6S7RRy1yaJEmOxm6mh+ajV6iYSd+RRKunwoSjcsnHze
	SENhBi1DD3Jv7lQD5zexebJdoBCZfIcjUP2mvbq2w+GnjGPXq44d2tR+/zN/oBMEqgRMXdDCvBT
	FDZqsunUkyW+G8lqoupn3jNCB0fSKA6/dIbLNQEp3F5D9Hxm+JxKuMDp3U5kSe2ouK/EaoE3XmZ
	Jt6I3riCZiLLAV/4L/5R9lPHT597Y+OO+CHiPXt/1KINeDaHShTN8umfsG+J/hJvH33gmQC6h+a
	6Ua6G+5aYq28+vJ6XwcANGocnBwPnfZAXXGcuRr2f73fAFwn9UoJX9cwdJWnw1WT9ShSmt5t0IL
	oXme9upz/fX0FDC6UHqME=
X-Received: by 2002:a05:600c:8b31:b0:483:2c98:435e with SMTP id 5b1f17b1804b1-483a95ee684mr256150945e9.34.1772012465553;
        Wed, 25 Feb 2026 01:41:05 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd6f2f88sm59282785e9.2.2026.02.25.01.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 01:41:05 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	CK Hu <ck.hu@mediatek.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3] drm/mediatek: dsi: Store driver data before invoking mipi_dsi_host_register
Date: Wed, 25 Feb 2026 09:38:41 +0000
Message-ID: <20260225094047.76780-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_014107_948046_E1F50280 
X-CRM114-Status: GOOD (  13.05  )
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

The call to mipi_dsi_host_register triggers a callback to mtk_dsi_bind,
which uses dev_get_drvdata to retrieve the mtk_dsi struct, so this
structure needs to be stored inside the driver data before invoking it.

As drvdata is currently uninitialized it leads to a crash when
registering the DSI DRM encoder right after acquiring
the mode_config.idr_mutex, blocking all subsequent DRM operations.

Fixes the following crash during mediatek-drm probe (tested on Xiaomi
Smart Clock x04g):

Unable to handle kernel NULL pointer dereference at virtual address
 0000000000000040
[...]
Modules linked in: mediatek_drm(+) drm_display_helper cec drm_client_lib
 drm_dma_helper drm_kms_helper panel_simple
[...]
Call trace:
 drm_mode_object_add+0x58/0x98 (P)
 __drm_encoder_init+0x48/0x140
 drm_encoder_init+0x6c/0xa0
 drm_simple_encoder_init+0x20/0x34 [drm_kms_helper]
 mtk_dsi_bind+0x34/0x13c [mediatek_drm]
 component_bind_all+0x120/0x280
 mtk_drm_bind+0x284/0x67c [mediatek_drm]
 try_to_bring_up_aggregate_device+0x23c/0x320
 __component_add+0xa4/0x198
 component_add+0x14/0x20
 mtk_dsi_host_attach+0x78/0x100 [mediatek_drm]
 mipi_dsi_attach+0x2c/0x50
 panel_simple_dsi_probe+0x4c/0x9c [panel_simple]
 mipi_dsi_drv_probe+0x1c/0x28
 really_probe+0xc0/0x3dc
 __driver_probe_device+0x80/0x160
 driver_probe_device+0x40/0x120
 __device_attach_driver+0xbc/0x17c
 bus_for_each_drv+0x88/0xf0
 __device_attach+0x9c/0x1cc
 device_initial_probe+0x54/0x60
 bus_probe_device+0x34/0xa0
 device_add+0x5b0/0x800
 mipi_dsi_device_register_full+0xdc/0x16c
 mipi_dsi_host_register+0xc4/0x17c
 mtk_dsi_probe+0x10c/0x260 [mediatek_drm]
 platform_probe+0x5c/0xa4
 really_probe+0xc0/0x3dc
 __driver_probe_device+0x80/0x160
 driver_probe_device+0x40/0x120
 __driver_attach+0xc8/0x1f8
 bus_for_each_dev+0x7c/0xe0
 driver_attach+0x24/0x30
 bus_add_driver+0x11c/0x240
 driver_register+0x68/0x130
 __platform_register_drivers+0x64/0x160
 mtk_drm_init+0x24/0x1000 [mediatek_drm]
 do_one_initcall+0x60/0x1d0
 do_init_module+0x54/0x240
 load_module+0x1838/0x1dc0
 init_module_from_file+0xd8/0xf0
 __arm64_sys_finit_module+0x1b4/0x428
 invoke_syscall.constprop.0+0x48/0xc8
 do_el0_svc+0x3c/0xb8
 el0_svc+0x34/0xe8
 el0t_64_sync_handler+0xa0/0xe4
 el0t_64_sync+0x198/0x19c
Code: 52800022 941004ab 2a0003f3 37f80040 (29005a80)
---[ end trace 0000000000000000 ]---

Fixes: e4732b590a77 ("drm/mediatek: dsi: Register DSI host after acquiring clocks and PHY")
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
v3: Also initialize irq_wait_queue before calling platform_set_drvdata
v2: Added Fixes tag

 drivers/gpu/drm/mediatek/mtk_dsi.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index d7726091819c..acee2227275b 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -1232,6 +1232,11 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 
 	dsi->host.ops = &mtk_dsi_ops;
 	dsi->host.dev = dev;
+
+	init_waitqueue_head(&dsi->irq_wait_queue);
+
+	platform_set_drvdata(pdev, dsi);
+
 	ret = mipi_dsi_host_register(&dsi->host);
 	if (ret < 0)
 		return dev_err_probe(dev, ret, "Failed to register DSI host\n");
@@ -1243,10 +1248,6 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, ret, "Failed to request DSI irq\n");
 	}
 
-	init_waitqueue_head(&dsi->irq_wait_queue);
-
-	platform_set_drvdata(pdev, dsi);
-
 	dsi->bridge.of_node = dev->of_node;
 	dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
 
-- 
2.43.0


