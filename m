Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B156AC531D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 18:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lNzFXtDRL36sjfeetYaoRGkJ3BZXJkrvXWbUMZXEOzM=; b=o/i7zxs8V28wL1jXDFXGw4EdhD
	K8Tu1rRiBFh5wu3SesF1bs7bohfALTPNUQ0pulCRpYeItuFnH+k+9hQhMfZmUv3XzZNBaKJhP/pqC
	IT06x9QLYBZhOaLGTGzM2f/Kc3IRq2RIY0nXY4wy+6aeb1ZOeGNqou41VPDzp67WTfDVO/UCvPLoC
	vulLKxaDEMENv3k5M1o/I4EPfKWzJOK0e2XqS8wVazuY/8vz8nLz23J6QenAH4GFr9xz2OuQsZCvW
	LleviH5tiUFgXJLYIeFJQw5uytG1wY1QSTchTEUMu7wtsi2hxiYqlQ8qC+WiuykhszHWrqxrY3vH+
	0jobU2ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmyQx-0000000EuXs-1nfN;
	Thu, 23 Jul 2026 18:46:15 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmyQv-0000000EuXV-02Xm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 18:46:14 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-385ea3ce80dso961350a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 11:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784832372; x=1785437172; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lNzFXtDRL36sjfeetYaoRGkJ3BZXJkrvXWbUMZXEOzM=;
        b=JgOIWa53NN4hH1qJIZaVOQ3UGGdytJoK99WTu9LpmlMGgWQDKTq8aWC2UTo4peS/fQ
         aHKH7m7/IZLsLBchQKb7tjyqYxC8jfzTrbpex32DBftXPgw17J2Fu22DeghjxigQ7wWi
         xem/9oXMexwBQ308zNbhWmMqPAEMKHmj4RrER3UtVXccdAGY08QMkYHuTECQ+OYvhd8J
         hawAJ0ZKZb95vfH5zd6LmZckPaEbG6po1lq4VDseqV2ZS5Zt97UTiyI6UjDm7yQ39p1h
         SKjIt+ZkrFd07E0+v1LbQYaLopyrgTuFYXguXUFErUn2YBWQBxscydg0QPZy0tnrrgsk
         FbYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784832372; x=1785437172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lNzFXtDRL36sjfeetYaoRGkJ3BZXJkrvXWbUMZXEOzM=;
        b=fm2vzTLKgtTPYsn+fZKhDCOQrsGBbzeXdmDZX/xqmlno8zK60bl4pYW6A0+jaB1aAM
         Oyyoo3BjxhLbfBYNsK23CMdh6KrH3Wx8E/VRPWViFmt5J20cnEafvqbN5QvAwYCw7Ji0
         wBInpR5b4LUnUbtmIglt9JVREPeMQDqVxTkZc9BEPUBH6gWu7Xrbzbf21jUPDnCF3rJh
         JzRDb4Cx7JyDqTl0nDFno/PErO8EnbNOejLUQjL5Lue6gYY9ivbCQHJnoThZ2TzSzTbW
         ZVvCrSqFm7TKSoPoVJ1sIhiQPSXRmBpfM9IT8/16JXmfOGULmjPyNvI69jwYjaZwWQBI
         r4Nw==
X-Forwarded-Encrypted: i=1; AHgh+RoUNrMXDma+vIbqqumBf0EZZAdqEI3UEoa1yy+7a7L5pYWm+GI93K86X8/lugLeiokpzd7BXXP71NSIdOpZ02//@lists.infradead.org
X-Gm-Message-State: AOJu0YyMF8NVmRKrX0iK5XtKBcGa58W7hAZiTrnftH2MHby0jnfrzHxg
	zLrXFMjdlFChUPTpxI3gkW8oX2rqX3Pdy77YqDlltgX2BXD4kN+sAuIp
X-Gm-Gg: AR+sD12H4cYjiZCTvFK4OG91H7SEkXQbkskFieC43Jwa+2ipMKAhAsqlPWInWiMis/G
	BVqiQJ2ZQNJsp5uzDh/vTrgKGuyAX/Rt9K2mxCgS3DJe78owG9YZE98oznBsL/8HdRLlCJIjH+m
	dGPVr5iK+gw7AlUFWLbzR2Zu5LdDrhCD0zAkl20ZAjXjnAQClOX1dYrPEToBWO1A1NELEArObmd
	L/z3+REZAxtFRrz95qMyYWoj++e8ApCcpayRpYsfyqU3bAQ9aqFZuZQZfFK371FcAtY2v/ARspK
	21/nMs73jbeI6CVCGnJQPocyj3Ia+XFmeCo3SH1etZD7F0VQCdFzOAOfzRuzz/WoSwHbbgFB8bU
	cMpEid8FmDnJ/4GQgX+bMIo9MjeUg0FIlo8EplAFlM66foDY+gtiFZR5VNwAHKgwAytktzwNc
X-Received: by 2002:a17:90b:1d02:b0:38d:dfd1:7c1 with SMTP id 98e67ed59e1d1-38ec6499300mr4568453a91.2.1784832371666;
        Thu, 23 Jul 2026 11:46:11 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f03af8a45sm308155a91.10.2026.07.23.11.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 11:46:11 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Julia.Lawall@inria.fr,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jyri Sarha <jyri.sarha@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: cocci@inria.fr,
	dri-devel@lists.freedesktop.org,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	Jessica Zhang <jesszhan0024@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	nouveau@lists.freedesktop.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH 06/36] drm: remove conditional return with no effect
Date: Fri, 24 Jul 2026 03:45:08 +0900
Message-ID: <20260723184538.3888637-7-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723184538.3888637-1-ekffu200098@gmail.com>
References: <20260723184538.3888637-1-ekffu200098@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_114613_057265_0B9EE34F 
X-CRM114-Status: GOOD (  14.04  )
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

Both branches of the check return the same value, so the check has
no effect. Remove it and return the value directly.

This is the result of running the Coccinelle script from
scripts/coccinelle/misc/cond_return_no_effect.cocci.

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
 drivers/gpu/drm/imx/ipuv3/imx-drm-core.c           |  6 +-----
 drivers/gpu/drm/nouveau/dispnv50/disp.c            | 14 +++++---------
 drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c |  7 +------
 drivers/gpu/drm/tilcdc/tilcdc_drv.c                |  6 +-----
 4 files changed, 8 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c b/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
index 51a0ec043248..52a2334be799 100644
--- a/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
+++ b/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
@@ -55,11 +55,7 @@ static int imx_drm_atomic_check(struct drm_device *dev,
 		return ret;
 
 	/* Assign PRG/PRE channels and check if all constrains are satisfied. */
-	ret = ipu_planes_assign_pre(dev, state);
-	if (ret)
-		return ret;
-
-	return ret;
+	return ipu_planes_assign_pre(dev, state);
 }
 
 static const struct drm_mode_config_funcs imx_drm_mode_config_funcs = {
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 364227f5456f..e8fde399acae 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -301,19 +301,15 @@ nv50_dmac_create(struct nouveau_drm *drm,
 	if (ret)
 		return ret;
 
-	ret = nvif_object_ctor(&dmac->base.user, "kmsVramCtxDma", NV50_DISP_HANDLE_VRAM,
-			       NV_DMA_IN_MEMORY,
-			       &(struct nv_dma_v0) {
+	return nvif_object_ctor(&dmac->base.user, "kmsVramCtxDma", NV50_DISP_HANDLE_VRAM,
+				NV_DMA_IN_MEMORY,
+				&(struct nv_dma_v0) {
 					.target = NV_DMA_V0_TARGET_VRAM,
 					.access = NV_DMA_V0_ACCESS_RDWR,
 					.start = 0,
 					.limit = device->info.ram_user - 1,
-			       }, sizeof(struct nv_dma_v0),
-			       &dmac->vram);
-	if (ret)
-		return ret;
-
-	return ret;
+				}, sizeof(struct nv_dma_v0),
+				&dmac->vram);
 }
 
 /******************************************************************************
diff --git a/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c b/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c
index 2334b77f348c..16a02527285e 100644
--- a/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c
+++ b/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c
@@ -58,13 +58,8 @@ static int osd101t2587_panel_prepare(struct drm_panel *panel)
 static int osd101t2587_panel_enable(struct drm_panel *panel)
 {
 	struct osd101t2587_panel *osd101t2587 = ti_osd_panel(panel);
-	int ret;
 
-	ret = mipi_dsi_turn_on_peripheral(osd101t2587->dsi);
-	if (ret)
-		return ret;
-
-	return ret;
+	return mipi_dsi_turn_on_peripheral(osd101t2587->dsi);
 }
 
 static const struct drm_display_mode default_mode_osd101t2587 = {
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
index 1d6c9a423a41..990805f1fea6 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
@@ -64,11 +64,7 @@ static int tilcdc_atomic_check(struct drm_device *dev,
 	 * tilcdc ->atomic_check can update ->mode_changed if pixel format
 	 * changes, hence will we check modeset changes again.
 	 */
-	ret = drm_atomic_helper_check_modeset(dev, state);
-	if (ret)
-		return ret;
-
-	return ret;
+	return drm_atomic_helper_check_modeset(dev, state);
 }
 
 static const struct drm_mode_config_funcs mode_config_funcs = {
-- 
2.43.0


