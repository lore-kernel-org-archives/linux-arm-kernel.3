Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77797FCC9AD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 03:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y1z9EtizHwE3LeSySxAXfxT/FNlt1Ydhsh1vDf6WdY0=; b=wFCpHO4s5eqKkGNrKvzForCrBE
	g5grNy6tQhwc3bQe41eb/xAeuviRAaSgbnj+jhC5WBg8a5FzS68Cvun30liFCRuc6+/JRQ8QwQrJ/
	jFlJqKTb97wbisJX+epvxwAgd43THLSeBtTitYhEJIwVvS08atYCNTbjtgAgE30QX+aRbhql0VOfA
	CMRGsdNzL/80TetpB+tc3ZMAlur/4Fj6lcsbSqckFh532rMAwJzhSygXd0mheMHq5/vqdbm94YVtv
	lzHXJmsAVz9h1Aju64GB8IPL1oBjDuiqoV6E4c5HidwC4mFoYGfLCQBEO5k4MAEhnlXNPSlNuQ2jG
	Ekc6RtgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vznjL-00000008eLP-0KjR;
	Tue, 10 Mar 2026 03:25:59 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vznjI-00000008eHz-0AtG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 03:25:57 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2a8fba3f769so53812095ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 20:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773113155; x=1773717955; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y1z9EtizHwE3LeSySxAXfxT/FNlt1Ydhsh1vDf6WdY0=;
        b=Wt4ozJoTk0nqyprgwD/MrOQ7jvJo3fTrErgQwu9Hn/5xsfsNovfKX+B3FgSI5Y/d2C
         9OA7PKaKeGFH+SVS5yszn7zWJgYKzRkDW7uOBH6MVa5WM2DWwt+uSHJrb1w2yjvPDnc+
         /PJBwkcw5RpIS5qVdwsGRSW58RX1JYm9arfnw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773113155; x=1773717955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y1z9EtizHwE3LeSySxAXfxT/FNlt1Ydhsh1vDf6WdY0=;
        b=fKAocLIquQmI2qqEQQTaFrR6krgP8TBtAemvdB4PsiH64mpTlUjKR6+I5nrGnF+ZuH
         p5RikCpcK6gEM20WafaGHqt6HL3HGgHy6QCxyZsTpiVjAQywRFtEQRg5waVTAJA1l/um
         f78qQnK2qNQPg1weZvXl87G41U76sdVazbRklpCd/GmKKKV0zrltuhlinlxNfJ6VzO6M
         a/lru5O48yzo0XbMCE3au5W3M5pis1O4pIl0YEaF4wCbu171L7MSKVDa9wtnMgmdtIAh
         SzJzNZ1h/xyay5QKKWYUW/o7lZ4S49HUzETst89dStp1c9fCTg2ufWQlFhHSH0p3P4Td
         R7RA==
X-Forwarded-Encrypted: i=1; AJvYcCWAi82tOxQT79/fVkSPE1vmru2mHovJKaSZSodDz1URaiQ72Ox5evJsDXd33QUbmQ1tGgsXIoPGPGN9+MpRLPbm@lists.infradead.org
X-Gm-Message-State: AOJu0Yy05zk5OLNuHKlrj2Q9wTRZBedjyY/tJdT/JR/knPI89cgTXWTk
	zoAPVrN9bptgKaNys2psQnMR9uhfCUW337es9XElH0iXhZr86dCaizRlvIun1Ldodw==
X-Gm-Gg: ATEYQzzUqHC2lK1qAA3/797PQpwl/lonGY6iWaZvmixS0DOdVkzRcyzRtGoN2Mxktjk
	39y2l12TDki3cEjWe+SUglCNWI8c3LOFAMi49eBYMJNiye73z7NWhPUgNphS3zWeFr7D2QcUGTe
	TzJRYzh+Ft0T4Kw8zCR3AjALTPR3nxvnKKECAO/p7SKXeTO7L3f7eCp9IDLXbkQWU260W3VlD9d
	blUH8jak1P1XOk8hogwMY5h0MGTN+KvJa+jLxqF8tdJml0DDN5Pd+0D8BS2b3bF266Lcc2Gvl1U
	DM6yy3BP9Ex3+U+cNsMIN3js5uBNzf/IkKieCNYIR0LFdDShst1BEjGDyy3Tfk5Rj2WS3fZf5h+
	gm0s/CerGnHGugejqE47DyjmCIiVUd7K8WsUQczrdFE/KrkPhe655vcDhqvKi3h7WvshKKkOpv7
	p4utujjxZFxkogjzBgUepLxbzBQQY2Y9kcQ5YB1h5Rykp0J+ykqWAXlDCbEA6cFAedspDBA93ds
	hI4Zodp
X-Received: by 2002:a17:902:ec88:b0:2ae:54b2:27c7 with SMTP id d9443c01a7336-2ae82459ca5mr139254635ad.39.1773113155156;
        Mon, 09 Mar 2026 20:25:55 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:ee38:e01e:e888:6900])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e575e6sm126695095ad.5.2026.03.09.20.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 20:25:54 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-sunxi@lists.linux.dev,
	Paul Kocialkowski <paulk@sys-base.io>,
	linux-mediatek@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 4/4] drm/sun4i: Use backend/mixer as dedicated DMA device
Date: Tue, 10 Mar 2026 11:25:09 +0800
Message-ID: <20260310032511.2545500-5-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
In-Reply-To: <20260310032511.2545500-1-wenst@chromium.org>
References: <20260310032511.2545500-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_202556_094110_63759B46 
X-CRM114-Status: GOOD (  23.87  )
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

The sun4i DRM driver deals with DMA constraints in a peculiar way.
Instead of using the actual DMA device in various helpers, it justs
reconfigures the DMA constraints of the virtual display device using
the DMA device's device tree node by calling of_dma_configure().

Turns out of_dma_configure() should only be called from bus code.
Lately this also triggers a big warning through of_iommu_configure()
and ultimately __iommu_probe_device():

    late IOMMU probe at driver bind, something fishy here!

Now that the GEM DMA helpers have proper support for allocating
and mapping buffers with a dedicated DMA device, switch over to
it as the proper solution.

The mixer change was tested on a Pine H64 model B. The backend change
was only compile tested. Though I don't expect any issues, help testing
on an older device would be appreciated.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/gpu/drm/sun4i/sun4i_backend.c | 27 +++++++++++++++------------
 drivers/gpu/drm/sun4i/sun8i_mixer.c   | 27 +++++++++++++++------------
 2 files changed, 30 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_backend.c b/drivers/gpu/drm/sun4i/sun4i_backend.c
index 6391bdc94a5c..a57fb5151def 100644
--- a/drivers/gpu/drm/sun4i/sun4i_backend.c
+++ b/drivers/gpu/drm/sun4i/sun4i_backend.c
@@ -798,18 +798,21 @@ static int sun4i_backend_bind(struct device *dev, struct device *master,
 	dev_set_drvdata(dev, backend);
 	spin_lock_init(&backend->frontend_lock);
 
-	if (of_property_present(dev->of_node, "interconnects")) {
-		/*
-		 * This assume we have the same DMA constraints for all our the
-		 * devices in our pipeline (all the backends, but also the
-		 * frontends). This sounds bad, but it has always been the case
-		 * for us, and DRM doesn't do per-device allocation either, so
-		 * we would need to fix DRM first...
-		 */
-		ret = of_dma_configure(drm->dev, dev->of_node, true);
-		if (ret)
-			return ret;
-	}
+	/*
+	 * This assume we have the same DMA constraints for all our the
+	 * devices in our pipeline (all the backends, but also the
+	 * frontends). This sounds bad, but it has always been the case
+	 * for us, and DRM doesn't do per-device allocation either, so
+	 * we would need to fix DRM first...
+	 *
+	 * Always use the first bound backend as the DMA device. While
+	 * our device trees always have all backends enabled, some in
+	 * the wild may actually have the first one disabled. If both
+	 * are enabled, the order in which they are bound is guaranteed
+	 * since the driver adds components in order.
+	 */
+	if (drm_dev_dma_dev(drm) == drm->dev)
+		drm_dev_set_dma_dev(drm, dev);
 
 	backend->engine.node = dev->of_node;
 	backend->engine.ops = &sun4i_backend_engine_ops;
diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index 02acc7cbdb97..4071ab38b4ae 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -536,18 +536,21 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
 	mixer->engine.ops = &sun8i_engine_ops;
 	mixer->engine.node = dev->of_node;
 
-	if (of_property_present(dev->of_node, "iommus")) {
-		/*
-		 * This assume we have the same DMA constraints for
-		 * all our the mixers in our pipeline. This sounds
-		 * bad, but it has always been the case for us, and
-		 * DRM doesn't do per-device allocation either, so we
-		 * would need to fix DRM first...
-		 */
-		ret = of_dma_configure(drm->dev, dev->of_node, true);
-		if (ret)
-			return ret;
-	}
+	/*
+	 * This assume we have the same DMA constraints for all our the
+	 * devices in our pipeline (all the backends, but also the
+	 * frontends). This sounds bad, but it has always been the case
+	 * for us, and DRM doesn't do per-device allocation either, so
+	 * we would need to fix DRM first...
+	 *
+	 * Always use the first bound backend as the DMA device. While
+	 * our device trees always have all backends enabled, some in
+	 * the wild may actually have the first one disabled. If both
+	 * are enabled, the order in which they are bound is guaranteed
+	 * since the driver adds components in order.
+	 */
+	if (drm_dev_dma_dev(drm) == drm->dev)
+		drm_dev_set_dma_dev(drm, dev);
 
 	/*
 	 * While this function can fail, we shouldn't do anything
-- 
2.53.0.473.g4a7958ca14-goog


