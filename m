Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F1D0D730B2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 07:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sFB8BBIFFL7jpCc3yoYdeIALzzlxyXt+AtPHpod/PGU=; b=evg3wMlymnZz2IAnV8rjMor5Ow
	P6gTatYBtSnX9KCRbKJiZw+aDAt35S39PuUfzNvdoxK3me7YY5IOijhcwW1HaTAA+AWT13LCiUCeY
	3Hbyn3MeAJnflGh9Xp8krncQua0fSabtPTuA0CHDHbJ3wQ/oS+qS9WmuzbgdBnSmNdG4uyzvBVyKZ
	b5mWf7CoijtmVBNMBNuHR9K7W4YNBy5bOiaqTL+BOY83Om9IFNOafKQn/Mf8qN6cZRkCwnCW0KQiW
	yYCCsUGfmyhrLbGWeGNvZWtT54c9GnV/JFdXjbYm9ctcVpFP1tfZLczWMYVTs/+LwBr2rho9PSbHi
	QaxMaktg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8YWQ-00000001Qkk-46Je;
	Fri, 03 Apr 2026 07:00:50 +0000
Received: from mail-m49210.qiye.163.com ([45.254.49.210])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8YWN-00000001QfP-07Sk;
	Fri, 03 Apr 2026 07:00:48 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 396d58c8f;
	Fri, 3 Apr 2026 15:00:40 +0800 (GMT+08:00)
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
Subject: [PATCH v1 3/4] drm/rockchip: dw_hdmi: Apply DRM_BRIDGE_ATTACH_NO_CONNECTOR and the bridge-connector
Date: Fri,  3 Apr 2026 15:00:31 +0800
Message-Id: <20260403070032.447102-4-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260403070032.447102-1-damon.ding@rock-chips.com>
References: <20260403070032.447102-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9d5224db2703a3kunm1d6b6bc811deb5
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQx4ZGlZJSR1LQx5KSUpOHUlWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=MTggQTmpvpDAkUCTK+phVdqDF0DwSlKrX4o0Bg/D6d8/YgiJQvd2U4TtW6aulksm8kWQCkkqT/Ro3s7iM9nTfEtoe5vhyLxHKXrEjMWzebV5O55UTD9Pdo/33xyT4OzM8T64sJq1OVNcHA+xnQTvFkBOxlhy0fryPFt2AjdYZDk=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=sFB8BBIFFL7jpCc3yoYdeIALzzlxyXt+AtPHpod/PGU=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_000047_249431_031A72FA 
X-CRM114-Status: GOOD (  11.96  )
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

Convert this driver to DRM_BRIDGE_ATTACH_NO_CONNECTOR and to the
drm_bridge_connector framework which is the current DRM bridge best
practice.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
---
 drivers/gpu/drm/rockchip/Kconfig            |  1 +
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 19 +++++++++++++++----
 2 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/Kconfig b/drivers/gpu/drm/rockchip/Kconfig
index e7f49fe845ea..69b832d0c8c4 100644
--- a/drivers/gpu/drm/rockchip/Kconfig
+++ b/drivers/gpu/drm/rockchip/Kconfig
@@ -76,6 +76,7 @@ config ROCKCHIP_DW_DP
 
 config ROCKCHIP_DW_HDMI
 	bool "Rockchip specific extensions for Synopsys DW HDMI"
+	select DRM_BRIDGE_CONNECTOR
 	help
 	  This selects support for Rockchip SoC specific extensions
 	  for the Synopsys DesignWare HDMI driver. If you want to
diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
index 21b141b7cb9c..b5cfcb936078 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
@@ -13,6 +13,7 @@
 #include <linux/regulator/consumer.h>
 
 #include <drm/bridge/dw_hdmi.h>
+#include <drm/drm_bridge_connector.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_of.h>
 #include <drm/drm_probe_helper.h>
@@ -542,6 +543,7 @@ static int dw_hdmi_rockchip_bind(struct device *dev, struct device *master,
 	struct drm_device *drm = data;
 	struct drm_encoder *encoder;
 	struct rockchip_hdmi *hdmi;
+	struct drm_connector *connector;
 	int ret;
 
 	if (!pdev->dev.of_node)
@@ -608,7 +610,7 @@ static int dw_hdmi_rockchip_bind(struct device *dev, struct device *master,
 
 	platform_set_drvdata(pdev, hdmi);
 
-	hdmi->hdmi = dw_hdmi_bind(pdev, encoder, plat_data, 0);
+	hdmi->hdmi = dw_hdmi_bind(pdev, encoder, plat_data, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 
 	/*
 	 * If dw_hdmi_bind() fails we'll never call dw_hdmi_unbind(),
@@ -616,12 +618,21 @@ static int dw_hdmi_rockchip_bind(struct device *dev, struct device *master,
 	 */
 	if (IS_ERR(hdmi->hdmi)) {
 		ret = PTR_ERR(hdmi->hdmi);
-		goto err_bind;
+		goto err_cleanup_encoder;
 	}
 
-	return 0;
+	connector = drm_bridge_connector_init(drm, encoder);
+	if (IS_ERR(connector)) {
+		ret = PTR_ERR(connector);
+		dev_err(hdmi->dev, "Failed to initialize bridge_connector\n");
+		goto err_unbind_bridge;
+	}
 
-err_bind:
+	return drm_connector_attach_encoder(connector, encoder);
+
+err_unbind_bridge:
+	dw_hdmi_unbind(hdmi->hdmi);
+err_cleanup_encoder:
 	drm_encoder_cleanup(encoder);
 
 	return ret;
-- 
2.34.1


