Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 280DBF3ED73
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 05:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GzRXCJv6s7nBaWaSPV26wDLtfWq6m8la+VtHkby4pFA=; b=ASXNCF1bqaerN7Js9BtwMzJnps
	SKf+M8O+kqmAbSegE3aNzjpIpbYbGpFlm9/J7SDRJL/YuHcd7sIh8sm+lOpR9Lw77mMde9D323vev
	ncXuK7BNDAm4OrmokJvzVHafnh+QCuBMK6TI/vgdyQJCf80DGusP9VHUYkZ1eWYyrL2lITfg18Zwy
	1WJCwhkQ4ppBpHYQhBakUkUWi7HT5k5ulKSnDhPeelFa6Wauniat56FcI6KpvMXUkYwTBesIw7h6K
	VL6AxXxsEr0hJaQC465irHunoxvZF94rmshrmYlsKhd7M9y/5/9KkcOi9IVvVemRnNrgwdIFHgbj/
	UhCH/LFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEh3n-00000006RFT-1SaZ;
	Mon, 20 Apr 2026 05:20:39 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEh3k-00000006REb-0Z7h
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 05:20:38 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2b2429f98d0so13444475ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Apr 2026 22:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776662434; x=1777267234; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GzRXCJv6s7nBaWaSPV26wDLtfWq6m8la+VtHkby4pFA=;
        b=pWeDDbrAIYC6Z/rKnMef8eyHgABklabxgMnQ8cQVHIfdyvuYOlqTbTMvRHt1JC8OLX
         OTbe+D2XkKk1wlHhiVSjHaP+gh+UpL51B0kif8TB+uKS4tkFPTXnjTdg/9Tke1y86IUb
         2ISk8nU3KPjN0/j0xwtFp/ZSRYt5OKn6oWzIFs9HrDa6l1Xr3wijnow5bBX/wkkphnSd
         d5gtT3o4jG6bCn5zpnKiTRGZZn96PZRAq+d0g4OTCmSaNG5YnN2sM/5T0Vj0K291t15r
         AkyJL3YJsYqVsELbjPoQ/OMcdm80Y20yW1QW/dakYmEFXqZxFxWYk61y4je7lqvhlXCx
         QoRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776662434; x=1777267234;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GzRXCJv6s7nBaWaSPV26wDLtfWq6m8la+VtHkby4pFA=;
        b=DGwu04UGe335xknUA8BG0o9CM8QUS00iCGmPxwxTM4QgPyrq9if93iTnQEQmm9lAP8
         byfc0vmEN95xiLFQbUfuocStFfSGwZIaK3kVRkHbfzxQIhJ7KquvEkY0vjad1WZxJ5cW
         1wADUmvh5yO7o4f1WOsXqXapMD4/WlcmYyGk2bbPmIJYxgkn3/rUyHNH4lcdZPmCihzC
         wsFrvtTRdbZ7yTp5qY5Ixh69nN/QG5B7LKKFPhNUR6fDeG9oDPYDt8zpRQtELZrs8kJM
         frPjEWbwPr+dm3gxXuTj4MPVOw2BP365iv/AEmscWz7KW96dKwZvQbj/eLDsw1zXOv9C
         6lJw==
X-Forwarded-Encrypted: i=1; AFNElJ/63YYvTLFIvrMSaUuw/3AaYwDkR4tA644KNjMbOsiG7SvN0wzeB4QmNdZtM4HL/2NfDdhJCH2eV5gxGy4DsFeI@lists.infradead.org
X-Gm-Message-State: AOJu0YxJ5XlFAQ97eWCPSV79IgFwLnHvFiX4E3psHO4++Wfx7FTHFZdn
	qhZJ4XWMQsfRPIjd34ZQKh0ashpBHK7luChbhaX2gmICrmUT7dzvGW+z
X-Gm-Gg: AeBDievxBISx9yQ10s84gU2kKITyXsnmFHzgKGMdFYs6my/Sc+/XPD4gYZP/kxHINSS
	gbBCqyDmU6Osme6pvl2Dp/lE8+P+08LWJw5mD2cX3oqnyuhRcUsqiNrq57nn5z3UXhY42TzUK2b
	ORTHeTQrIAVR09nNexq2XflaRV8TqVu3ftPfIgbxfexjPb9n/VLvt19eB/3D2V3BjYeH8LZ0v8l
	kkEjIQq2CEt2TUHH1sqXUNTplxrnLwGrwmPqoB4wiQ/65zXnqTsBzQ3mTRFfqyXRc2C9pVtLQiZ
	pNWYA9UbuqGyKCdykon09n+xX3Ssb51ewPvBL6EvIEsEZb4OPrbZbzkBkeYCvOV4xF86yN2MY0u
	tmOLnisQMv+SSAsR4IIcLtX6NSv2pZOHoshPH5VPBmu52ULT1XYmGgOgkHH5PNsZng0YpnB+/s3
	ZBZMIcQLOQAqUqrhveRbZ0n7D4+ZFiN9tQiuyqWnQgczRHXpiV9Po=
X-Received: by 2002:a17:903:124c:b0:2b2:57df:264d with SMTP id d9443c01a7336-2b5f9f61ad2mr132449745ad.33.1776662434501;
        Sun, 19 Apr 2026 22:20:34 -0700 (PDT)
Received: from rahul-mintos.ban-spse ([165.204.156.251])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab30f29sm87965555ad.68.2026.04.19.22.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 22:20:34 -0700 (PDT)
From: Abhishek Rajput <abhiraj21put@gmail.com>
To: chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	abhiraj21put@gmail.com
Subject: [PATCH] drm/mediatek: Convert legacy DRM logging to drm_* helpers in mtk_dsi.c
Date: Mon, 20 Apr 2026 10:50:08 +0530
Message-ID: <20260420052008.5417-1-abhiraj21put@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260419_222036_338712_65345F87 
X-CRM114-Status: GOOD (  14.28  )
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

Replace DRM_INFO(), DRM_WARN() and DRM_ERROR() calls in
drivers/gpu/drm/mediatek/mtk_dsi.c with the corresponding
drm_info(), drm_warn() and drm_err() helpers.

The drm_*() logging helpers take a struct drm_device * argument,
allowing the DRM core to prefix log messages with the correct device
name and instance. This is required to correctly distinguish log
messages on systems with multiple GPUs.

This change aligns the radeon driver with the DRM TODO item:
"Convert logging to drm_* functions with drm_device parameter".

Signed-off-by: Abhishek Rajput <abhiraj21put@gmail.com>

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 0e2bcd5f67b7..a67ad575f5f0 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -510,6 +510,7 @@ static void mtk_dsi_config_vdo_timing_per_line_lp(struct mtk_dsi *dsi)
 	u32 delta;
 	struct mtk_phy_timing *timing = &dsi->phy_timing;
 	struct videomode *vm = &dsi->vm;
+	struct drm_device *drm = dsi->bridge.dev;
 
 	if (dsi->format == MIPI_DSI_FMT_RGB565)
 		dsi_tmp_buf_bpp = 2;
@@ -543,7 +544,7 @@ static void mtk_dsi_config_vdo_timing_per_line_lp(struct mtk_dsi *dsi)
 					     horizontal_backporch_byte /
 					     horizontal_front_back_byte;
 	} else {
-		DRM_WARN("HFP + HBP less than d-phy, FPS will under 60Hz\n");
+		drm_warn(drm, "HFP + HBP less than d-phy, FPS will under 60Hz\n");
 	}
 
 	if ((dsi->mode_flags & MIPI_DSI_HS_PKT_END_ALIGNED) &&
@@ -623,12 +624,13 @@ static s32 mtk_dsi_wait_for_irq_done(struct mtk_dsi *dsi, u32 irq_flag,
 {
 	s32 ret = 0;
 	unsigned long jiffies = msecs_to_jiffies(timeout);
+	struct drm_device *drm = dsi->bridge.dev;
 
 	ret = wait_event_interruptible_timeout(dsi->irq_wait_queue,
 					       dsi->irq_data & irq_flag,
 					       jiffies);
 	if (ret == 0) {
-		DRM_WARN("Wait DSI IRQ(0x%08x) Timeout\n", irq_flag);
+		drm_warn(drm, "Wait DSI IRQ(0x%08x) Timeout\n", irq_flag);
 
 		mtk_dsi_enable(dsi);
 		mtk_dsi_reset_engine(dsi);
@@ -663,9 +665,10 @@ static s32 mtk_dsi_switch_to_cmd_mode(struct mtk_dsi *dsi, u8 irq_flag, u32 t)
 {
 	mtk_dsi_irq_data_clear(dsi, irq_flag);
 	mtk_dsi_set_cmd_mode(dsi);
+	struct drm_device *drm = dsi->bridge.dev;
 
 	if (!mtk_dsi_wait_for_irq_done(dsi, irq_flag, t)) {
-		DRM_ERROR("failed to switch cmd mode\n");
+		drm_err(drm, "failed to switch cmd mode\n");
 		return -ETIME;
 	} else {
 		return 0;
@@ -849,11 +852,12 @@ static void mtk_dsi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 					     struct drm_atomic_state *state)
 {
 	struct mtk_dsi *dsi = bridge_to_dsi(bridge);
+	struct drm_device *drm = bridge->dev;
 	int ret;
 
 	ret = mtk_dsi_poweron(dsi);
 	if (ret < 0)
-		DRM_ERROR("failed to power on dsi\n");
+		drm_err(drm, "failed to power on dsi\n");
 }
 
 static void mtk_dsi_bridge_atomic_post_disable(struct drm_bridge *bridge,
@@ -916,7 +920,7 @@ static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *dsi)
 	ret = drm_simple_encoder_init(drm, &dsi->encoder,
 				      DRM_MODE_ENCODER_DSI);
 	if (ret) {
-		DRM_ERROR("Failed to encoder init to drm\n");
+		drm_err(drm, "Failed to encoder init to drm\n");
 		return ret;
 	}
 
@@ -932,7 +936,7 @@ static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *dsi)
 
 	dsi->connector = drm_bridge_connector_init(drm, &dsi->encoder);
 	if (IS_ERR(dsi->connector)) {
-		DRM_ERROR("Unable to create bridge connector\n");
+		drm_err(drm, "Unable to create bridge connector\n");
 		ret = PTR_ERR(dsi->connector);
 		goto err_cleanup_encoder;
 	}
@@ -985,6 +989,7 @@ static int mtk_dsi_host_attach(struct mipi_dsi_host *host,
 {
 	struct mtk_dsi *dsi = host_to_dsi(host);
 	struct device *dev = host->dev;
+	struct drm_device *drm = dsi->bridge.dev;
 	int ret;
 
 	dsi->lanes = device->lanes;
@@ -1012,7 +1017,7 @@ static int mtk_dsi_host_attach(struct mipi_dsi_host *host,
 
 	ret = component_add(host->dev, &mtk_dsi_component_ops);
 	if (ret) {
-		DRM_ERROR("failed to add dsi_host component: %d\n", ret);
+		drm_err(drm, "failed to add dsi_host component: %d\n", ret);
 		drm_bridge_remove(&dsi->bridge);
 		return ret;
 	}
@@ -1034,11 +1039,12 @@ static void mtk_dsi_wait_for_idle(struct mtk_dsi *dsi)
 {
 	int ret;
 	u32 val;
+	struct drm_device *drm = dsi->bridge.dev;
 
 	ret = readl_poll_timeout(dsi->regs + DSI_INTSTA, val, !(val & DSI_BUSY),
 				 4, 2000000);
 	if (ret) {
-		DRM_WARN("polling dsi wait not busy timeout!\n");
+		drm_warn(drm, "polling dsi wait not busy timeout!\n");
 
 		mtk_dsi_enable(dsi);
 		mtk_dsi_reset_engine(dsi);
@@ -1123,6 +1129,7 @@ static ssize_t mtk_dsi_host_transfer(struct mipi_dsi_host *host,
 				     const struct mipi_dsi_msg *msg)
 {
 	struct mtk_dsi *dsi = host_to_dsi(host);
+	struct drm_device *drm = dsi->bridge.dev;
 	ssize_t recv_cnt;
 	u8 read_data[16];
 	void *src_addr;
@@ -1153,7 +1160,7 @@ static ssize_t mtk_dsi_host_transfer(struct mipi_dsi_host *host,
 	}
 
 	if (!msg->rx_buf) {
-		DRM_ERROR("dsi receive buffer size may be NULL\n");
+		drm_err(drm, "dsi receive buffer size may be NULL\n");
 		ret = -EINVAL;
 		goto restore_dsi_mode;
 	}
@@ -1177,7 +1184,7 @@ static ssize_t mtk_dsi_host_transfer(struct mipi_dsi_host *host,
 	if (recv_cnt)
 		memcpy(msg->rx_buf, src_addr, recv_cnt);
 
-	DRM_INFO("dsi get %zd byte data from the panel address(0x%x)\n",
+	drm_info(drm, "dsi get %zd byte data from the panel address(0x%x)\n",
 		 recv_cnt, *((u8 *)(msg->tx_buf)));
 
 restore_dsi_mode:
-- 
2.43.0


