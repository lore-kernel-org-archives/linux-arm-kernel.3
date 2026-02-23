Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EF60EA4FBA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 14:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HJysTvCTqmpRUuXQbPd6ZdWuCMMviCnnW2mHB9RPSLQ=; b=uveoWxDDa8AphikmA9HIfuaqqz
	fjz1pc51sRD2gUd5TL8caFVkXoLFAEyDxRPcucwl9hdZJkilOlYXWS5cyYZSoexwoFInSrJsM97y1
	NtEbjQaWO7+g9vZE2cusbL9NeHtx3jICPIgxBkgJMFfGlAQs3RHC8jWhP2vC88hvjVqHHqnS0gLE1
	UUHwbO/l6N59il2C7+w5+tfh136YGl+ITK+UA3YB5vUWYdD/JHwWxg8T+QeOfH3lGpVOXtNM/B0nG
	gs/4U6EjocjfG1NPJ/yF1CMtE2jviUD6+q+z1s1V6pwOiz5XJW6jb6U5U1pUMoQqtnyJan5vbO7fj
	WkvDRmyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuWjz-00000000SCY-2JWF;
	Mon, 23 Feb 2026 14:16:51 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuWjy-00000000SBV-0rhf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 14:16:51 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4836f4cbe0bso33066715e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 06:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771856208; x=1772461008; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HJysTvCTqmpRUuXQbPd6ZdWuCMMviCnnW2mHB9RPSLQ=;
        b=S9zOnnHZnbx+cMDOX0g7p4zN2zE+sDFzxpeERtiokkOXw3tSzd72ojP0HOjZnSBSIt
         XTYMari/o2XnIHFePOiBLqxR3bWib/1J4080Z0bLwZBoR6kz0tOwPunb7DIz0chylF8N
         ZuHmq9IDBeqc8ueJ0qxgdlK96QELg9v9yEqzRYTuvR/9eCxJNMm3tjpAHT412oL3Xk/D
         w3XPurYzNheLK0xYSjb/daaMMKKN7n+zWWzKMhGENo/lqovw0J/RhQuckFyX+AMpKa2W
         CUEgObEkvhXVdYgAaNVPw2lAtDOPYnQ44iRE+nA0ofoobZt9d5/JZh80B3Uu0jKyjeYW
         t0vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771856208; x=1772461008;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HJysTvCTqmpRUuXQbPd6ZdWuCMMviCnnW2mHB9RPSLQ=;
        b=bZ5FFm/oI/yPTUbRq8KpN2jlHSdt6PyxcfePfMrUYn1On2e2f/8wi0VH+TSkV6px6s
         hnOVM260PkB4EYIkibc/6bc+/tNJC7TY+BZ5Dgcerrg0l09OK7reFnNEufnU7NHe+JuY
         7Y48JJQRMl0yHHol4q88XScN2xaiwz+RkPbBnEIzYurN2Hjzya5SrrKE3mDfzc9/bh3E
         6cSkLul/+ZPMnldbJQE1EnuSlvm+KQtufJHrlHMnzyalCUq2BnuGH0tvnrjndfUZnS9x
         R0+OUoDEt18JjaVXqGDstmXeq19fIGpCkb2NhMnOGb5bboSC7MMcJ8TaxuT4e1mkdA+e
         /qmg==
X-Forwarded-Encrypted: i=1; AJvYcCUu+KdPBjjD4wsaNWd93vyXb2p/IBXdAjsKosQSRmyy6TyPv3IlPJ2kqcoxilQBt2sSoX4sAPcHXpQu9FxZJhAQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yzj0htUl1WrtTmduN+/Opd6SkTXw94cCvLnKsrNScdLWKPfzYJS
	mspSSv0SuGWRKhfdJ2fo1KLBAdkUumDI85qm2lLrpchKwRl7FYKWNXWakQlNxA==
X-Gm-Gg: AZuq6aLZ9OzZ8Tz8/5TOkhfY7w0L2sFbQqrHczkHm/UL6/reHoxpn5PDqZ5dUb6GY+D
	I3U1OeJo7dv/eaiopNm/VZEikIDY9g6wjmdJ4QozLsxMCFinqQCiX0maUcE042rb7NwRhjQlPwA
	F7k9AzRqng4QHNfelIeE8wbxDn5RK/XWqQhBxO6pAPldRCsVjN7kCU7BCdVtYcrqn/rIkwZsFI6
	v42g2aJaL1NNF/zcBdHlsRXb3LbNItF4V/+p0fonlq+me9q6OMFRGjOfX3ZBFvNWw2AoA62TwrJ
	Ly5R/r5hineMcjDNwZ+bVooKBT7Hh12useHkAsaE5SgkuHLj2M0HCnZSkZgybZOE0hNJIvHphSo
	ZnK5F5zuPRDNRnggI8PQmdW+RWJbZJGpVmubNzi/PMGrdOoVkzrwMXKZcf5mAl9OgST66+6gcYY
	8OD/n6vhfpg8CUt/jwICA=
X-Received: by 2002:a05:600c:6206:b0:46f:d682:3c3d with SMTP id 5b1f17b1804b1-483a95b71b5mr161419085e9.13.1771856207390;
        Mon, 23 Feb 2026 06:16:47 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a43088fdsm86531165e9.30.2026.02.23.06.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 06:16:46 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	CK Hu <ck.hu@mediatek.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2] drm/mediatek: dsi: Store driver data before invoking mipi_dsi_host_register
Date: Mon, 23 Feb 2026 14:16:34 +0000
Message-ID: <20260223141638.2022490-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_061650_263835_2B0772FE 
X-CRM114-Status: GOOD (  13.83  )
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
v2: Added Fixes tag

 drivers/gpu/drm/mediatek/mtk_dsi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index d7726091819c..af4871de9e4c 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -1232,6 +1232,8 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 
 	dsi->host.ops = &mtk_dsi_ops;
 	dsi->host.dev = dev;
+	platform_set_drvdata(pdev, dsi);
+
 	ret = mipi_dsi_host_register(&dsi->host);
 	if (ret < 0)
 		return dev_err_probe(dev, ret, "Failed to register DSI host\n");
@@ -1245,8 +1247,6 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 
 	init_waitqueue_head(&dsi->irq_wait_queue);
 
-	platform_set_drvdata(pdev, dsi);
-
 	dsi->bridge.of_node = dev->of_node;
 	dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
 
-- 
2.43.0


