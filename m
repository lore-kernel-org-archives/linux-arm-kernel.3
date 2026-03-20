Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BA461098797
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 15:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LC8/Krjsz/8eMfvmK5q2jyfb9Doz50BbBIjca4omGxs=; b=3eYSU7f4ow2I76c4LuN7pDfhVb
	mgxQOZgcWctFgq34MAbUdaFsEHeZwf5nApX4QRv8TNh4E+LvGUh27ftj6Mrcxg+J0xwNmmYfLMqvm
	euBRVAW1sqfSteG6trrJX6TuiSHV/1k7YJfl+4XpoX4qdkvxbaE+1ckSKLAFvrhO2/SFCtV8lu1m7
	rdWtEjXcxRpj+RwS9KtJ+MkglgWwtbIgL6jg/bElxclL1WBfbiFXl2Wopb6vk/pLTc8Vs0ks8uiRL
	MqwEqtWP0q9A9WNyJWdJVFSw/GMZojUfUlEh6lJdbF56CZ2WNxzsmBBkQcGXAEER9UtKfl/3pkv9S
	7GSVLcRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3bvL-0000000D2vP-1tw6;
	Fri, 20 Mar 2026 15:38:07 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3bvJ-0000000D2ue-028V
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 15:38:06 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-486507134e4so25747655e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 08:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774021083; x=1774625883; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LC8/Krjsz/8eMfvmK5q2jyfb9Doz50BbBIjca4omGxs=;
        b=TMdsGmpufOfQL3uYzsf12khsKZeFXDYmkGnKgApwOpsborEaF1+UO9GnLVQ81Tyv80
         ktLrCHJBga7fHAjmDkU55fzOXlERg+1MKv4SJRsKQTP3IcTSR5KS6Om9rzfMk+af4xee
         ITt1YilyqbeN0tAddQaUkoZi5Qp2LfYCAHLI+fZnRL8iVjMHq3hL6zmgmnTgxJrZKe95
         29W3lC5OA0/nrmdgpAeVgOkZKxaInVAS9+ZlnLc3lnyiLTcZFCuHPC6+pArh/aXVybyU
         p4vRpN8q+wZPVhgb74pVrLuThsWwMEzfxTosh68uqH/J+6ReMhzpkGcTDhTmUqKVSjgf
         sj/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774021083; x=1774625883;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LC8/Krjsz/8eMfvmK5q2jyfb9Doz50BbBIjca4omGxs=;
        b=DHqkJMnz6aHerD53P5cu2sure999nsSGFuaZyqB1IBm9aGLUYKDrXg1QvJaLDwqjcr
         VNodKgL+7nV5tIgte9XCAjNHK+wc2JdVBAk6rs5IUxchLi852bmZoTHNBa9/mr/XjGk0
         97w9aahKXx2yFNDmVT3P12p8WYCqD/bxP93AjlHS9bp/Iq006l5LDDhPlm6E46+SUjpb
         jWEthZXrPd4GZcB+IxfHzxef/t5+ZDPk60LI4M5cgYZhQjmb8jdSx/Nod1TG50J5qPWD
         ASxjQ5uqCdug6mDCIeGtQ5eYNHnGvWWEdIl4GflLe/fGFOv/Xnmm4pAMI7H2TsbNG5e4
         4VCA==
X-Forwarded-Encrypted: i=1; AJvYcCXPuOOIqPLZxjdTvwsyCRFAyOFAzkP7syElpf5QvMN6NQioZMGZr8LLRlUlYlME5/MarEIJVhgGXxAql6VN+/1w@lists.infradead.org
X-Gm-Message-State: AOJu0YzOVXyyxYiL4RYLlH3uWK0rp5ZnxsiXnK8uFbeiGCM6LBAVXlX0
	UiGomXkeMzZ/TsN6/4/FjoEpUBGv27AMdz2BrbBZfKvhAvcG2KmGVLrM
X-Gm-Gg: ATEYQzzLaP1lXdeAmvJfbI3zyflg3cEQHD7F4IQwjgp6CeBD1+H0lXkIQqmz/bp/W/p
	cv23CK8y61HaQ67lDkgWwZuc/++GbeIihwXLlP3uAto9tvZ66iA28e+rQyAfsFHH9g6hddGZVFr
	h0FEnNhq6x/iq6isWu8w8MlUO44JYG05jDLPsIPhRUHyCBbbZwTaVmwHxz36thUzaMhXA2v/XSF
	+6mnSO3D3mMmLa75sBilq8E20EwoFij/VXeWa+aLHTe9W0d1Ls/H6BKFeu8IolEokyOBoM8GwUB
	ExwFCmptR8DSQC4h3mfZ9yzqHNs8DMZQhWbgePyZWpNgdRtRuOU7dgT9/Ki/IvSQF1e1vQIl7qD
	OZzzr6SMjLpJlAtJt5zHB6ftCKzGEXTempurdzI5S9wH9cIZ8v47Ie0HssU9AAIGx6Vx2DR4p9H
	1h8oU13yGVV6S0DLFGFwY=
X-Received: by 2002:a05:600c:8508:b0:485:3b00:f92e with SMTP id 5b1f17b1804b1-486fedab7dbmr51111835e9.2.1774021082580;
        Fri, 20 Mar 2026 08:38:02 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486ff19d387sm18532675e9.17.2026.03.20.08.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 08:38:01 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	CK Hu <ck.hu@mediatek.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 RESEND] drm/mediatek: dsi: Store driver data before invoking mipi_dsi_host_register
Date: Fri, 20 Mar 2026 15:37:37 +0000
Message-ID: <20260320153753.25450-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_083805_072350_C9D75B27 
X-CRM114-Status: GOOD (  12.77  )
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
Reviewed-by: CK Hu <ck.hu@mediatek.com>
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


