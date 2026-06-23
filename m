Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8346CCDB479
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 13:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Y6PphOb9ZABROa1QGn6/qy2YxlaF9xxkPzHynumORE=; b=h3RU0dQGf88JB6TpYWVEigLYS/
	rc80e69KdiRyr1xVBzNowy/IKu/5lxmIRtdoP4ySSLiVd4GGYiQA7rc48m3FUOZpSLu+dO1aDklMp
	LUAlV1Kqbm6re4jL7f0TdqjA9GzEco5NRQg9NDFX3Pxjb5wlytSPDiNV7ZpE0e5yJn6qE5HH5wVIB
	bNMSgb/H2n3kmPoRxNlgqNAFafEOB9lrT6PJ3divdW/vmF5xp3+XVVSH+e/ROLto5dGyqV/etLiLE
	sLDCslw5N4FDj9L69gYJM1JOOinDb4N4xAHqqLAXAt/VhbYPRX9FngEh4odHRq8u2ExVzufJIfZ+U
	VjzEXYeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc12r-00000006Kcw-10Nf;
	Tue, 23 Jun 2026 13:20:05 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc12k-00000006Kab-0A6N
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 13:20:02 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-697cd68d7adso2756976a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 06:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782220796; x=1782825596; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Y6PphOb9ZABROa1QGn6/qy2YxlaF9xxkPzHynumORE=;
        b=fZ7VQnENiY+MUp/cj2Wk1mvUTlaWzvCxGEgs1bhmzwSe/MBZTSlm8pASY+iPs0XnmY
         GB4LmhmINNMop16CuD931Y07m4DhFcy1Bbgd09AYVBDqrzntqbxJIVTHQ7wBKuopFca8
         y3DW4CsGpr28dmOXB2mcZC33kvUu41w3uKCntjDrdVFvBkKQ8btbyUAnLrRbvB9uqx8X
         WJ0yR2gMQqOBlTA5nuetL4KIEzjyA9ejnpwIXUrhlEIrK8ZccCH1AKkDGEo+Fe6G6zKI
         dr07wYqadfLxrAWjSDVlPMYwNWmpMuJuEBaBoGLaG8q2EBGsjAqFMmiIkL2Ro17Bevc6
         ZK8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782220796; x=1782825596;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/Y6PphOb9ZABROa1QGn6/qy2YxlaF9xxkPzHynumORE=;
        b=YsKKlhhI3WHnKWdDFVbXOzgIJ3LVNgT8usfNAQXkcl5adquGDEZpPXvElTC0EfZQ+o
         X3hoD1z08sPvtJ/Z4ZcC0yrZ5OQbVKtji5tGByLOUSBR1Ut0+2mt7yuaiceNIvUScBNM
         6/uD4vk3NsA4zdazDxg3ub1HP5mJtoNFCt2K/aGXf8Dus0Wygp9GowhjoBjJ5Oi1oEFG
         QjHE/DVuMG4ReBCfhQjV+uBms/v6epgwIDNlo+24sFIFuvVBJSLOrNIriW0Uzkoi810b
         u4HqfxqRLfCJeV9SF7TQbYa3eJh9rfbvvz+23XhzdV4wq+2AtAwx/XOJIM2g2sHAiX3j
         4CRg==
X-Forwarded-Encrypted: i=1; AFNElJ8ZQ9zbg9TTsCcNcWPOji50oxiu4wNv3QBH6ZArcoNrXX321Av9Egb99kLjS6cXm9G7r3+VpWY4z9ytdw2LXK7V@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+jGfYwjswiCmCfA0ZnEotXuYFiRMUoy2y/o/xLR1m97zMw4x2
	4JJu0oPcpmO0h3Y8ZpT9rhBkJeEtiAkfW0frTJmtipbwk7BX5QF0OrHX
X-Gm-Gg: AfdE7clOYCg28UYQO2XNehncLuoxkml/MF6+Cttf10mIMTjgSTdQA0d3Ybn/XoGO1M0
	cRu/FrCuDszhWx6SWc8nekn3bpE1PJ8Le+yHf0NT8NjgptcyoaGDiQVs4Pkg11GKQpuokAun7gb
	cv9IFr1tsFSIUm4NVKbEAv7Ey+PDq0fp9i163S1EX0NPD/nLBpVLIHtHF/Dv70eyl5zCDXPJ5LL
	+F4pbTD+oS+pgfKSfDMN8u11VMtwyeGCeqv936clUbllNgRbOCgND4i5rT8Wcgi5ot5g9yOAPGe
	1I7twKriGpvQxBYOMR89EqEmg0XWAHTIC07gWeazmV7JivCLUraotjUi0WTJeVTy88sGAFji+I1
	d9jAx20Tckn6o4L+fz2lkRE1An2RhVIhFdY/SuN6ihMmf4FD22GNrWczBSu+QWDYlChrIjTDPmG
	r23bmVkJZ7+yc0GTuA55Yp
X-Received: by 2002:a05:6402:2345:b0:697:d4ec:15ed with SMTP id 4fb4d7f45d1cf-697dbad10c0mr1435510a12.14.1782220796124;
        Tue, 23 Jun 2026 06:19:56 -0700 (PDT)
Received: from [127.0.0.2] ([194.35.121.133])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6977b82f95dsm5060107a12.3.2026.06.23.06.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 06:19:55 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Tue, 23 Jun 2026 15:19:31 +0200
Subject: [PATCH v2 2/2] drm/exynos: Add error handling to
 drm_encoder_init()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260623-exynos-drm-simple-v2-2-a8d59678b7d2@gmail.com>
References: <20260623-exynos-drm-simple-v2-0-a8d59678b7d2@gmail.com>
In-Reply-To: <20260623-exynos-drm-simple-v2-0-a8d59678b7d2@gmail.com>
To: Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Diogo Silva <diogompaissilva@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_062000_857851_B9A97574 
X-CRM114-Status: GOOD (  13.93  )
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

Not handling the return code on drm_encoder_init can lead to silent
failure and/or a drm_encoder_cleanup on a non-initialized encoder.
This patch adds error handling to the drm_encoder_init calls to prevent
that from happening.

Signed-off-by: Diogo Silva <diogompaissilva@gmail.com>
---
 drivers/gpu/drm/exynos/exynos_dp.c       | 8 ++++++--
 drivers/gpu/drm/exynos/exynos_drm_dpi.c  | 9 +++++++--
 drivers/gpu/drm/exynos/exynos_drm_dsi.c  | 6 ++++--
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 9 +++++++--
 drivers/gpu/drm/exynos/exynos_hdmi.c     | 9 +++++++--
 5 files changed, 31 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_dp.c b/drivers/gpu/drm/exynos/exynos_dp.c
index a2095fb43483..1598892c602b 100644
--- a/drivers/gpu/drm/exynos/exynos_dp.c
+++ b/drivers/gpu/drm/exynos/exynos_dp.c
@@ -99,8 +99,12 @@ static int exynos_dp_bind(struct device *dev, struct device *master, void *data)
 
 	dp->drm_dev = drm_dev;
 
-	drm_encoder_init(drm_dev, encoder, &exynos_dp_encoder_funcs,
-			 DRM_MODE_ENCODER_TMDS, NULL);
+	ret = drm_encoder_init(drm_dev, encoder, &exynos_dp_encoder_funcs,
+			       DRM_MODE_ENCODER_TMDS, NULL);
+	if (ret) {
+		dev_err(dp->dev, "Failed to initialize encoder\n");
+		return ret;
+	}
 
 	drm_encoder_helper_add(encoder, &exynos_dp_encoder_helper_funcs);
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_dpi.c b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
index 4a3d443a15e6..4e42a1da81d1 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dpi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
@@ -198,8 +198,13 @@ int exynos_dpi_bind(struct drm_device *dev, struct drm_encoder *encoder)
 {
 	int ret;
 
-	drm_encoder_init(dev, encoder, &exynos_dpi_encoder_funcs,
-			 DRM_MODE_ENCODER_TMDS, NULL);
+	ret = drm_encoder_init(dev, encoder, &exynos_dpi_encoder_funcs,
+			       DRM_MODE_ENCODER_TMDS, NULL);
+	if (ret) {
+		DRM_DEV_ERROR(encoder_to_dpi(encoder)->dev,
+			      "failed to create encoder ret = %d\n", ret);
+		return ret;
+	}
 
 	drm_encoder_helper_add(encoder, &exynos_dpi_encoder_helper_funcs);
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 25c438cdc744..6b7561ac9bb0 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -83,8 +83,10 @@ static int exynos_dsi_bind(struct device *dev, struct device *master, void *data
 	struct drm_device *drm_dev = data;
 	int ret;
 
-	drm_encoder_init(drm_dev, encoder, &exynos_drm_dsi_encoder_funcs,
-			 DRM_MODE_ENCODER_TMDS, NULL);
+	ret = drm_encoder_init(drm_dev, encoder, &exynos_drm_dsi_encoder_funcs,
+			       DRM_MODE_ENCODER_TMDS, NULL);
+	if (ret)
+		return ret;
 
 	ret = exynos_drm_set_possible_crtcs(encoder, EXYNOS_DISPLAY_TYPE_LCD);
 	if (ret < 0)
diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index d905dc703c06..59dea853d364 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -449,8 +449,13 @@ static int vidi_bind(struct device *dev, struct device *master, void *data)
 		return PTR_ERR(ctx->crtc);
 	}
 
-	drm_encoder_init(drm_dev, encoder, &exynos_vidi_encoder_funcs,
-			 DRM_MODE_ENCODER_TMDS, NULL);
+	ret = drm_encoder_init(drm_dev, encoder, &exynos_vidi_encoder_funcs,
+			       DRM_MODE_ENCODER_TMDS, NULL);
+	if (ret) {
+		DRM_DEV_ERROR(dev, "failed to initialize encoder ret = %d\n",
+			      ret);
+		return ret;
+	}
 
 	drm_encoder_helper_add(encoder, &exynos_vidi_encoder_helper_funcs);
 
diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 26baf5357997..f44586ce0fdf 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -1867,8 +1867,13 @@ static int hdmi_bind(struct device *dev, struct device *master, void *data)
 
 	hdata->phy_clk.enable = hdmiphy_clk_enable;
 
-	drm_encoder_init(drm_dev, encoder, &exynos_hdmi_encoder_funcs,
-			 DRM_MODE_ENCODER_TMDS, NULL);
+	ret = drm_encoder_init(drm_dev, encoder, &exynos_hdmi_encoder_funcs,
+			       DRM_MODE_ENCODER_TMDS, NULL);
+	if (ret) {
+		DRM_DEV_ERROR(dev, "failed to initialize encoder ret = %d\n",
+			      ret);
+		return ret;
+	}
 
 	drm_encoder_helper_add(encoder, &exynos_hdmi_encoder_helper_funcs);
 

-- 
2.51.2


