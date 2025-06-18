Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90D4EC71157
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 08:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hRSi6LPnJlewbz9+M2YF21yD0hWG5s8j8Ev4VekeCS4=; b=ic+kI0TV8xOgM2rqGg66VVEQD3
	zgcp7/Zvo6e/xVWqh74Fzc7yxOZvFVvUFmBDlwrbRhhw4SzqdEWg9EPDd6KoF3T3y1kJEC+wpIrw6
	Tm61o/bMzZj6qc1FslQsdrU1ICYSlLAc6xjncGyzuNeUXGHwuLxgiCFReNpP+GfZOYsk40JKljwbp
	Ota9Go//JFwnt9KTy74rTVljUxl9eMLZmlFAInztX8aE8mnfDlSThO5AW5zlDvxQYH+GfRg6Ur4G0
	Qb94ZkBSEjm9ySJo+4sZ96UtqZf5Y9c0fVM6bUGeaoGqRxDGgMKNGLS0ZiFfr8g3+mN7/XR2xtqzX
	U8j1uHSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRntU-00000009NN8-41S4;
	Wed, 18 Jun 2025 08:11:40 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRncJ-00000009LEx-27LQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 07:53:56 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750233234;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hRSi6LPnJlewbz9+M2YF21yD0hWG5s8j8Ev4VekeCS4=;
	b=H//lwHnrCxwgr5Qyne1dSebZ0C/TyDzHnxgNkRFUbl7V9Foo1dPQAUyndYYFRSCve24JFX
	+U9gITtVlgE+7icVecD1ruTrs8B1ggford7mBnDhhcfkXaKQiOenSTkKfdHtKErvXHr2XB
	w+45928VjRAOcQlJZdr2j+y20Pm2ghWlXG84ccC/DWt+8bQnmtnMSX9IFOoYsK0lVnfxi+
	uJFCp42Jf5r3Qo9P9YIiNofXWn736P+O17Rcmzy7GVZD8tPg7ZvVVgnKsUxm9bqTHw8XKs
	wHH6f/WEy/TK+k7+qfG6YVagctnRjA7zvJ9rVAMlmv/yAxA1v1Tps/lDHa1xlg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750233234;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hRSi6LPnJlewbz9+M2YF21yD0hWG5s8j8Ev4VekeCS4=;
	b=P5G7mtx1ZaQLqKuTMGNxDi36WMAI+1JfQ/MuzORfSpbSJ49TWx3v/9mFK4n2WTbB6gO3fC
	Zm2GV+ALFLNk5bDQ==
Date: Wed, 18 Jun 2025 09:52:22 +0200
Subject: [PATCH 3/3] drm/msm: Don't use %pK through printk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250618-restricted-pointers-drm-v1-3-781e0d88cd92@linutronix.de>
References: <20250618-restricted-pointers-drm-v1-0-781e0d88cd92@linutronix.de>
In-Reply-To: <20250618-restricted-pointers-drm-v1-0-781e0d88cd92@linutronix.de>
To: Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750233231; l=3885;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=+2X4ysqtRsTHUcY7E66k0quE5SROmLVa6c2NEYuHLu8=;
 b=MeeQzXgwzNU70goRi3hW4b0ZRIX5paYKudW6CbBEdnXyP3jia+DNmdrTI96uSVghsbe/qLu+G
 rR+U5ckgaEMAZhybeZ7KstPqWrBTAGqWMDI8Grel1fif13GmYkJa2OT
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_005355_685946_568BDA87 
X-CRM114-Status: GOOD (  12.69  )
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

In the past %pK was preferable to %p as it would not leak raw pointer
values into the kernel log.
Since commit ad67b74d2469 ("printk: hash addresses printed with %p")
the regular %p has been improved to avoid this issue.
Furthermore, restricted pointers ("%pK") were never meant to be used
through printk(). They can still unintentionally leak raw pointers or
acquire sleeping locks in atomic contexts.

Switch to the regular pointer formatting which is safer and
easier to reason about.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c | 4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 4 ++--
 drivers/gpu/drm/msm/msm_mdss.c              | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index a4b0fe0d9899b32141928f0b6a16503a49b3c27a..9aa635f9462df6e496635e3316217f0245e03157 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -565,7 +565,7 @@ static void _dpu_crtc_complete_flip(struct drm_crtc *crtc)
 
 	spin_lock_irqsave(&dev->event_lock, flags);
 	if (dpu_crtc->event) {
-		DRM_DEBUG_VBL("%s: send event: %pK\n", dpu_crtc->name,
+		DRM_DEBUG_VBL("%s: send event: %p\n", dpu_crtc->name,
 			      dpu_crtc->event);
 		trace_dpu_crtc_complete_flip(DRMID(crtc));
 		drm_crtc_send_vblank_event(crtc, dpu_crtc->event);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
index 829ca272873e45b122c04bea7da22dc569732e10..08cb1014299bcc9ce146b564721a6058df824cf0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
@@ -31,14 +31,14 @@ static void dpu_setup_dspp_pcc(struct dpu_hw_dspp *ctx,
 	u32 base;
 
 	if (!ctx) {
-		DRM_ERROR("invalid ctx %pK\n", ctx);
+		DRM_ERROR("invalid ctx %p\n", ctx);
 		return;
 	}
 
 	base = ctx->cap->sblk->pcc.base;
 
 	if (!base) {
-		DRM_ERROR("invalid ctx %pK pcc base 0x%x\n", ctx, base);
+		DRM_ERROR("invalid ctx %p pcc base 0x%x\n", ctx, base);
 		return;
 	}
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 1fd82b6747e9058ce11dc2620729921492d5ebdd..4290ef3004985376ebd13afd1f014265cf887490 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1345,7 +1345,7 @@ static int dpu_kms_mmap_mdp5(struct dpu_kms *dpu_kms)
 		dpu_kms->mmio = NULL;
 		return ret;
 	}
-	DRM_DEBUG("mapped dpu address space @%pK\n", dpu_kms->mmio);
+	DRM_DEBUG("mapped dpu address space @%p\n", dpu_kms->mmio);
 
 	dpu_kms->vbif[VBIF_RT] = msm_ioremap_mdss(mdss_dev,
 						  dpu_kms->pdev,
@@ -1380,7 +1380,7 @@ static int dpu_kms_mmap_dpu(struct dpu_kms *dpu_kms)
 		dpu_kms->mmio = NULL;
 		return ret;
 	}
-	DRM_DEBUG("mapped dpu address space @%pK\n", dpu_kms->mmio);
+	DRM_DEBUG("mapped dpu address space @%p\n", dpu_kms->mmio);
 
 	dpu_kms->vbif[VBIF_RT] = msm_ioremap(pdev, "vbif");
 	if (IS_ERR(dpu_kms->vbif[VBIF_RT])) {
diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 709979fcfab6062c0f316f7655823e888638bfea..c5e6e98e0ced3adae9086b220fc9d5d026ac3fd1 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -456,7 +456,7 @@ static struct msm_mdss *msm_mdss_init(struct platform_device *pdev, bool is_mdp5
 	if (IS_ERR(msm_mdss->mmio))
 		return ERR_CAST(msm_mdss->mmio);
 
-	dev_dbg(&pdev->dev, "mapped mdss address space @%pK\n", msm_mdss->mmio);
+	dev_dbg(&pdev->dev, "mapped mdss address space @%p\n", msm_mdss->mmio);
 
 	ret = msm_mdss_parse_data_bus_icc_path(&pdev->dev, msm_mdss);
 	if (ret)

-- 
2.49.0


