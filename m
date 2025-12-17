Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8009ED64081
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 07:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iADtR7py4dtGWy06rD42XqEtE43GI8bd+5EMoGfsWAc=; b=2j02z5XeGVQY2SO3MVSTCtf0+J
	s3jgnEPPAgtvriXpnCrrOWdQhpNuQbWNCk+tyniV2MJaf2n/4A2Xb+iPYZJ+SF/pQUoZ4BMwfOdA/
	vc9glXTO+sLDZLrEmGDo/T66Y+QwCSDaL3vuBZNpSS1lBQdg83ZX4BqBdFNW+o0QTpKcKEDVYomKn
	OWaiPi+3St/LiN4HE03Coa/liuPhgJBzJCOtHSs0pK8qq40pGF1cikyx3bZC+TqqvphWrdUFgjPcL
	ZEGjBCuEBNY5iCJuhPew0JDbZynEPDoCvHaHu/9LAkuK8KfUNdQenfouGMp6oTe3AA51D6YF4UgN4
	ILb1o2SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVlZI-00000006GfE-0UW4;
	Wed, 17 Dec 2025 07:03:28 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVlZG-00000006Gdw-10uI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 07:03:27 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2a09d981507so2383655ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Dec 2025 23:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765955003; x=1766559803; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iADtR7py4dtGWy06rD42XqEtE43GI8bd+5EMoGfsWAc=;
        b=XIThW0jbef81FuXjb1la0ACtEc9Hb6T1yHKIqWzfqs2+ku3EG8nvYtypxOpqLlXovb
         15ueMishBXyNIV5Ihca7nuECfJuB7arjQXIbZVpsojK4V0b2jGaEIFM1lUEjwRiunxSc
         yXRQ5I48CW2sWxbu8d/S0tw3zg1iMHHVI/Nh/8YOZLXt+mRfQzUNq0kdBobvSyhW1A+3
         U2meaP8ZParIrm6g5/bV9uVmm25uC7eiHfhx8oQOyDKnVnBimmzOjHukMJ4806nySh3p
         uVZToRWfiLoVXnbRjBlBVifT27sU0vttz0DmXDuQTGR4/lkHJf8WyNDlIKJj7j+QuanZ
         4wUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765955003; x=1766559803;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iADtR7py4dtGWy06rD42XqEtE43GI8bd+5EMoGfsWAc=;
        b=YSEBXRWsIaa1N1d9i0soEn2qGndcMicrTBMqdv6FaYqq4XBVGPsSyVGUlf1m0n9545
         Vyk/4DuELf5qZWi6CeUJQWfKSwBJ6anTLQ2+1AULjn1yCtne9CVofUQX7JQTxmhTXC5Q
         JuBhYf2Q1dYpH1/RalveHPdrrEeLc9hWIbZWnqQ0skGVEH8Mp+30J16mnr9yxhilPwJ6
         Nw3ejG/xx1+ph414P+JZsqDi3foObQpsCeB3vfdxPH/PAOpjBlsV2Ze9Q1kTCkTR25OM
         uYUgWyqG+X4KPACYh6VhJqjmNdjHjGlAG+9TNp++5U9QzmYvpY2G9v5Tc9ncOJ50JIHP
         hIfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpKwJgbcrK3sEZbNns1C/WmccBySJKwm5rplrZzSD3rO4FcknHEo0i9MIc5a3w3stU/odblKu7QwberBU0kWKG@lists.infradead.org
X-Gm-Message-State: AOJu0Yyc7jtNX105T3HOtnYIgPmx5e2Lr/cnLY9JmxNQOrMMV+nBAY+I
	a2jHafTL3PNnExm4CPvlODL5mAkzpTjvSFgibIDIU6JFDl9VZWbdeiW8
X-Gm-Gg: AY/fxX6PfkTQm0ec/W4b3xlR67IlCZg4Wdn3JIQUi+dJwYYQDRrtlOqQz3Tej9cWWp+
	q0EMxt69a7F79atg3IC6v3k3O6ReYRSvfgHGBc3eaE4LaxyF0QAYbIpULg8PLoCG/tn4nNnXF6l
	a+eZl0hU3n1hKxFhOkyc/wSrmd8qFDkXya5sZ6fObeVjWO6VIY9FbahLopAJ4bNoWKX4ABdtqyQ
	G20EeQYEQN9M0LRvGAQHkCxkmHmp32IJGkkNbTimEAdFQGRahnDx+kyC8+ti9Rfo3oTebCsCVzO
	cML+bOo7SRsAPXcR2v69uWFnoe84mciTH0Iisv3nJurya9frf/fuaCXc0fdQ0+af8gU8HCAFZQ/
	mOuzmKosQMwhKerzl6qSGcw97Zic+zpEG8BKDTCsAF5KcqtQk1xRxqrNLn0u7Rk7RdXOH0q20Ef
	bMBUIWtMprYBm0NyGaHd67eVWYXEIF
X-Google-Smtp-Source: AGHT+IGCYU18Ca2RWUMvCJ0sVnyeC8Bodbi6VqfzMnMmAkitSTRJ6ok0SBgg90i1lNAaAHGXG3JSBg==
X-Received: by 2002:a17:903:19ed:b0:2a0:b432:4a6 with SMTP id d9443c01a7336-2a0b43206d4mr128905375ad.15.1765955002656;
        Tue, 16 Dec 2025 23:03:22 -0800 (PST)
Received: from rahul-mintos.ban-spse ([165.204.156.251])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29f173823dbsm159876425ad.12.2025.12.16.23.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 23:03:22 -0800 (PST)
From: Abhishek Rajput <abhiraj21put@gmail.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	abhiraj21put@gmail.com
Subject: [PATCH] drm/mediatek: Convert legacy DRM logging to drm_* helpers in mtk_crtc.c
Date: Wed, 17 Dec 2025 12:33:03 +0530
Message-ID: <20251217070303.689913-1-abhiraj21put@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_230326_423422_655D3AB4 
X-CRM114-Status: GOOD (  14.17  )
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

Replace DRM_ERROR() and DRM_DEBUG_DRIVER() calls in
drivers/gpu/drm/mediatek/mtk_crtc.c with the corresponding drm__err()
and drm_dbg_driver() helpers.

The drm_*() logging helpers take a struct drm_device * argument,
allowing the DRM core to prefix log messages with the correct device
name and instance. This is required to correctly distinguish log
messages on systems with multiple GPUs.

This change aligns the Mediatek DRM driver with the DRM TODO item:
"Convert logging to drm_* functions with drm_device parameter".

Signed-off-by: Abhishek Rajput <abhiraj21put@gmail.com>

diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediatek/mtk_crtc.c
index 991cdb3d7d5f..9f7e2c7fee93 100644
--- a/drivers/gpu/drm/mediatek/mtk_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
@@ -227,11 +227,12 @@ static int mtk_crtc_ddp_clk_enable(struct mtk_crtc *mtk_crtc)
 {
 	int ret;
 	int i;
+	struct drm_device *dev = mtk_crtc->base.dev;
 
 	for (i = 0; i < mtk_crtc->ddp_comp_nr; i++) {
 		ret = mtk_ddp_comp_clk_enable(mtk_crtc->ddp_comp[i]);
 		if (ret) {
-			DRM_ERROR("Failed to enable clock %d: %d\n", i, ret);
+			drm_err(dev, "Failed to enable clock %d: %d\n", i, ret);
 			goto err;
 		}
 	}
@@ -343,6 +344,7 @@ static int mtk_crtc_ddp_hw_init(struct mtk_crtc *mtk_crtc)
 	struct drm_connector *connector;
 	struct drm_encoder *encoder;
 	struct drm_connector_list_iter conn_iter;
+	struct drm_device *dev = mtk_crtc->base.dev;
 	unsigned int width, height, vrefresh, bpc = MTK_MAX_BPC;
 	int ret;
 	int i;
@@ -371,19 +373,19 @@ static int mtk_crtc_ddp_hw_init(struct mtk_crtc *mtk_crtc)
 
 	ret = pm_runtime_resume_and_get(crtc->dev->dev);
 	if (ret < 0) {
-		DRM_ERROR("Failed to enable power domain: %d\n", ret);
+		drm_err(dev, "Failed to enable power domain: %d\n", ret);
 		return ret;
 	}
 
 	ret = mtk_mutex_prepare(mtk_crtc->mutex);
 	if (ret < 0) {
-		DRM_ERROR("Failed to enable mutex clock: %d\n", ret);
+		drm_err(dev, "Failed to enable mutex clock: %d\n", ret);
 		goto err_pm_runtime_put;
 	}
 
 	ret = mtk_crtc_ddp_clk_enable(mtk_crtc);
 	if (ret < 0) {
-		DRM_ERROR("Failed to enable component clocks: %d\n", ret);
+		drm_err(dev, "Failed to enable component clocks: %d\n", ret);
 		goto err_mutex_unprepare;
 	}
 
@@ -646,12 +648,13 @@ static void mtk_crtc_ddp_irq(void *data)
 	struct drm_crtc *crtc = data;
 	struct mtk_crtc *mtk_crtc = to_mtk_crtc(crtc);
 	struct mtk_drm_private *priv = crtc->dev->dev_private;
+	struct drm_device *dev = mtk_crtc->base.dev;
 
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	if (!priv->data->shadow_register && !mtk_crtc->cmdq_client.chan)
 		mtk_crtc_ddp_config(crtc, NULL);
 	else if (mtk_crtc->cmdq_vblank_cnt > 0 && --mtk_crtc->cmdq_vblank_cnt == 0)
-		DRM_ERROR("mtk_crtc %d CMDQ execute command timeout!\n",
+		drm_err(dev, "mtk_crtc %d CMDQ execute command timeout!\n",
 			  drm_crtc_index(&mtk_crtc->base));
 #else
 	if (!priv->data->shadow_register)
@@ -776,9 +779,10 @@ static void mtk_crtc_atomic_enable(struct drm_crtc *crtc,
 {
 	struct mtk_crtc *mtk_crtc = to_mtk_crtc(crtc);
 	struct mtk_ddp_comp *comp = mtk_crtc->ddp_comp[0];
+	struct drm_device *dev = mtk_crtc->base.dev;
 	int ret;
 
-	DRM_DEBUG_DRIVER("%s %d\n", __func__, crtc->base.id);
+	drm_dbg_driver(dev, "%s %d\n", __func__, crtc->base.id);
 
 	ret = mtk_ddp_comp_power_on(comp);
 	if (ret < 0) {
@@ -803,9 +807,10 @@ static void mtk_crtc_atomic_disable(struct drm_crtc *crtc,
 {
 	struct mtk_crtc *mtk_crtc = to_mtk_crtc(crtc);
 	struct mtk_ddp_comp *comp = mtk_crtc->ddp_comp[0];
+	struct drm_device *dev = mtk_crtc->base.dev;
 	int i;
 
-	DRM_DEBUG_DRIVER("%s %d\n", __func__, crtc->base.id);
+	drm_dbg_driver(dev, "%s %d\n", __func__, crtc->base.id);
 	if (!mtk_crtc->enabled)
 		return;
 
@@ -845,10 +850,11 @@ static void mtk_crtc_atomic_begin(struct drm_crtc *crtc,
 									  crtc);
 	struct mtk_crtc_state *mtk_crtc_state = to_mtk_crtc_state(crtc_state);
 	struct mtk_crtc *mtk_crtc = to_mtk_crtc(crtc);
+	struct drm_device *dev = mtk_crtc->base.dev;
 	unsigned long flags;
 
 	if (mtk_crtc->event && mtk_crtc_state->base.event)
-		DRM_ERROR("new event while there is still a pending event\n");
+		drm_err(dev, "new event while there is still a pending event\n");
 
 	if (mtk_crtc_state->base.event) {
 		mtk_crtc_state->base.event->pipe = drm_crtc_index(crtc);
-- 
2.43.0


