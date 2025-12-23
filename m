Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1374E6F07B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 09:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IPXyR+DtSHvjmSw63vey96VhbW0eHbWu1L3mVM+HHkU=; b=j7sLRnwADC9jVOvEvtwYBH2Co2
	Zc352rRnQklfvzw7Raq32Hd5oQ0dGix2DBtb2LYHy+kdwJ+0VrGUcphoD1bqvHemtdMKbJqVqVXoT
	YZ/P47nTKOYynFkTcGXE/kSdqx3d/hJO0VwmLLMBsgm5ytu/SEjF00+rI7SpVwqRYx4LoDI7Q+E56
	f3tRpXPHQaIjTyeyillpQxxEGumRexhOcWFpLmBjPYpQUt1Dbx+41kCnyPtjc1oi9D3PfBi0VM7Os
	GbaOHvSakR4POZFbUOhDHHKHRUEI/sv7xhJVx6zZ+cFOD+QkOCjKQRgwtm8wpSbhRjButdgg4NKSW
	JGpKGZVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXz6j-0000000EnhF-07Vl;
	Tue, 23 Dec 2025 09:55:09 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXz6g-0000000Eng2-078Y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 09:55:07 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-7f216280242so1792013b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 01:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766483705; x=1767088505; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IPXyR+DtSHvjmSw63vey96VhbW0eHbWu1L3mVM+HHkU=;
        b=T1cW5R0peH6cr9+4OlL5SWanGTDEMlYSjidc1pq23/Ai+DoAMqShV4w5r7Q77ZpRVh
         ImVOwO7EnksN7G98/3V9p/p+zpT8wwIrMP4vVOaEwmPb2bkBsok6j5ue7HLTOCKnH9jx
         YxAA9YCHbNlUfqUxWTHTEp3+xpyC0xRoZzL5jFW4EM2SYXv1E8Lb+Nxim7XSYr/wpEbO
         fvqjk4El7i8WqotyeiDEi3l2qMcUWaErn1K6s4FOvt1hPcdQzAuUXpb3uf/xGQUgyaYI
         Gn5Ra8VFwKOv1cCQCUUYiRPWwvLgvnIW/3pw94dO00LvMi+Q0bZta4JJ2HKXwVx7MZzO
         3Vqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766483705; x=1767088505;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IPXyR+DtSHvjmSw63vey96VhbW0eHbWu1L3mVM+HHkU=;
        b=Z/jcuRJo665tQNlB9zztXgfXQhrZNeApSHi86sv8Fw1XA9pHtx2X7DnkcY3j/F7iaZ
         YacZg4vWfAuJqA8Gc6QWdtEXRNxZ2tWqfkAFY4EWwAV0rTYe9blh2dWiYV46QlAT+JOG
         aFO3kp2U8TVKqpL5RpjbHL26XI4hA7UeGGGgctcNQurOKdm7DV4tZ8FEcEK32f2UEJtU
         Fb7dVcJMCP+cHwZ48SaLGp6NqKCvsLGm+kMTtMu4urihRV0UosjdMo4RSPw80EpWEuWa
         LRO//7T32oSQntAs6CK70hxQ203XrccgB4uoUJwQHgCskkT/lA5ezm/HgwjLIMnROUnW
         rcMA==
X-Forwarded-Encrypted: i=1; AJvYcCVMsjXcguiZ/As6lZAO+k2EhIH+22NCrQBngqsCwmPiW9xuTLpCMNIEr8TFKIjDifShamHwN35tlrlEt0CDKsDh@lists.infradead.org
X-Gm-Message-State: AOJu0YwB656Bk+UfBXGbVSLtvTOrHJWxKiBBvv9PpnjQ9HVuu1SGCpg6
	mtThGkfJFFr4+IL1wyjMHC36AveZIE5yjShxKofbyn7vyrlhKxm2KNvq
X-Gm-Gg: AY/fxX6I9DtwUQJQlVQEXHhg23l6A4jDsOL44AbiEtRQ1K3N+BjfuoxSx1tRiDmfhF5
	HttNvSLwE7NFfvyfMg7Cwa/zMRK2SmO1xUszapJUBSRfCfq11CzgmSNdoRhFwtB+1/ttGE4jQd0
	16DYWTSrNmaNGbmRPCX3GxTBUZL1XOaR+Y/t9movlvd2dShyAE2qYhGjzvRzeK6yUqiO/TBvpBF
	kBd7UDlHhw9oVjA6DNTOwrohXCja7MjZZXWc+Kw987w/Zr8dtwCXIQAlx2nYr2bKOWhVFCIlacO
	E2aMZYa6VTf2b2mFXeuzxhpZo0dZcEbWUZYUDA4mThgKP9Fhlw7EPGzRXgTdkoiKrLimKwUyzN4
	xwfqH+gAsj5zM7iIZ44DcMLp+jZe0PSfQP2BSFPku1B+ZaSbsVMr8/eLiPk9dvKUOUUq2RkeopM
	LuQ5fUqzeEtEtAcNgzpUgg5hZj+A7C
X-Google-Smtp-Source: AGHT+IEdzNfnqNUJyDypKzn3dPYc29vkogAq63TVtVQNeWPmClzH/fQB7OhCe8Q/j5leeIRr37dB1w==
X-Received: by 2002:a05:6a20:6a07:b0:371:7666:648c with SMTP id adf61e73a8af0-3769f3351f4mr13306712637.24.1766483704666;
        Tue, 23 Dec 2025 01:55:04 -0800 (PST)
Received: from rahul-mintos.ban-spse ([165.204.156.251])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d776ebsm124413885ad.99.2025.12.23.01.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 01:55:04 -0800 (PST)
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
	lkp@intel.com,
	abhiraj21put@gmail.com
Subject: [PATCH v2] drm/mediatek: Convert legacy DRM logging to drm_* helpers in mtk_crtc.c
Date: Tue, 23 Dec 2025 15:24:34 +0530
Message-ID: <20251223095434.492041-1-abhiraj21put@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_015506_096735_60EB74E1 
X-CRM114-Status: GOOD (  17.40  )
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

Reported-by: kernel test robot <lkp@intel.com>
Closes:
https://lore.kernel.org/oe-kbuild-all/202512220515.z3QybJ8I-lkp@intel.com/
Signed-off-by: Abhishek Rajput <abhiraj21put@gmail.com>
---
v2:
- Fix unused variable warning when CONFIG_MTK_CMDQ is disabled
- Added Reported-by and Closes tags
Link to v1:
https://lore.kernel.org/all/20251217070303.689913-1-abhiraj21put@gmail.com/
 drivers/gpu/drm/mediatek/mtk_crtc.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediatek/mtk_crtc.c
index 991cdb3d7d5f..bca2e40bca54 100644
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
 
@@ -648,10 +650,11 @@ static void mtk_crtc_ddp_irq(void *data)
 	struct mtk_drm_private *priv = crtc->dev->dev_private;
 
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
+	struct drm_device *dev = mtk_crtc->base.dev;
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
2.34.1


