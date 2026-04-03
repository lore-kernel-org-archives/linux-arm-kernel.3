Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C941D730AC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 07:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qhMDeS5MJsqMangPhhuZJQL2DTnTsaxRf2SE3asViXM=; b=5Fma9puZ00dIx95Q3ydli+Hx3n
	Q3MDjcqLw7TukEKVcLMJRbfBQFwXvMgzaOh8sKocvFhW1Huuk+rw+z3LTUUvy+vgNpnVLClQlJnR9
	DAONl7TgCYYquDBiCOLXW36I1GhD/im8gFkdk+NovweSwwLEvgt2fdDGlWDAGLztIDyC0hYc+CgvI
	w3yuAs6iuQ0PVMXrploB8MBJUknlGPIwpN+zyPhtEpQojRiVcNHNXtqQHcoXmqh7suSX6FDWDYnrH
	gmTa/yn6Jaaj4yjDtQHrvnFyRyp2P3twTIg54Zku5AygQYtAt+ITWH+otp6Q+VTJVS46hWCZe40R0
	RTNdhQQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8YWP-00000001Qii-1nOW;
	Fri, 03 Apr 2026 07:00:49 +0000
Received: from mail-m3295.qiye.163.com ([220.197.32.95])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8YWM-00000001Qfz-0pWF;
	Fri, 03 Apr 2026 07:00:47 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 396d58c9f;
	Fri, 3 Apr 2026 15:00:42 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	hjc@rock-chips.com,
	heiko@sntech.de,
	andy.yan@rock-chips.com,
	wens@kernel.org,
	samuel@sholland.org,
	luca.ceresoli@bootlin.com
Cc: Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	victor.liu@nxp.com,
	dmitry.baryshkov@oss.qualcomm.com,
	shengjiu.wang@nxp.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v1 4/4] drm/rockchip: dw_hdmi: Support to find the next bridge
Date: Fri,  3 Apr 2026 15:00:32 +0800
Message-Id: <20260403070032.447102-5-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260403070032.447102-1-damon.ding@rock-chips.com>
References: <20260403070032.447102-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9d5224e24f03a3kunm1d6b6bc811ded4
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGhkeTFZIQ09NQ0hKSktLHR5WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=aFs31TTZtr+bCfSkmGEJmc0xRV7zEwxDbZrhSC+mQNg0U67RwMRuJMxl4yptVlC6kZi5QRfl2dSs3ey2cwYI+2sXDp6VJgBZEO9JDJITLh/JRY5CKD1HhV4l/ODhISn/XFR3t4jpqT9q9y/19yiV87id2R+hDfWQw9s+LbJU9AY=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=qhMDeS5MJsqMangPhhuZJQL2DTnTsaxRf2SE3asViXM=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_000046_392897_EDBB3727 
X-CRM114-Status: GOOD (  10.03  )
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

If there is a remote node connected to the HDMI output (port@1), the
&dw_hdmi_plat_data.output_port should be set to 1. This patch allows
Rockchip dw-hdmi to support the hdmi-connector and the next bridge.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
---
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
index b5cfcb936078..014ac09fd733 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
@@ -544,6 +544,8 @@ static int dw_hdmi_rockchip_bind(struct device *dev, struct device *master,
 	struct drm_encoder *encoder;
 	struct rockchip_hdmi *hdmi;
 	struct drm_connector *connector;
+	struct device_node *remote;
+	struct drm_bridge *next_bridge;
 	int ret;
 
 	if (!pdev->dev.of_node)
@@ -610,6 +612,18 @@ static int dw_hdmi_rockchip_bind(struct device *dev, struct device *master,
 
 	platform_set_drvdata(pdev, hdmi);
 
+	remote = of_graph_get_remote_node(hdmi->dev->of_node, 1, -1);
+	if (remote) {
+		of_node_put(remote);
+
+		ret = drm_of_find_panel_or_bridge(hdmi->dev->of_node, 1, 0,
+						  NULL, &next_bridge);
+		if (ret && ret != -ENODEV)
+			goto err_cleanup_encoder;
+
+		plat_data->output_port = 1;
+	}
+
 	hdmi->hdmi = dw_hdmi_bind(pdev, encoder, plat_data, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 
 	/*
-- 
2.34.1


