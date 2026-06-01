Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3675FCD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 22:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9j71zy6FuoMLjc7d+oDTA28QG1LTMNJxgFl/j5wfDEQ=; b=qFULjmR8nEAVreqQHxD5IBsGE2
	67sdnP5RAOJ6YVXd5PSk+vl4pqELJ7AZR2TJn8rQJ+PgHY2Z5pebx/0rjVP4SmuImnkA9cMxgstWO
	5o5fWmZp48icjz2gKObbSgb/sggBX0xIFNVyOFidFqP8cb0uvN6B0UkM4hnln8VCeHCxNdZWw7+e7
	diQQ67kF5oMgJ0vOCj4wajGML7PIw8XnVtuaj6mHHrabYyIjVc0e148N5giyLO4eTlgDvEBCO3wuY
	MdBcDi37NW9m5MqqDsAI5eozivdcP9GlllyYG4DGSNH9IDgZlxW+JUOQNIunMF7EfD2c7fQmts0ze
	WFEMIYkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUBO4-0000000ByfV-22qN;
	Mon, 01 Jun 2026 22:45:36 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUBNp-0000000By9A-3z6v;
	Mon, 01 Jun 2026 22:45:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1780353920;
	bh=pOLKcJluwdl4dR4SYTYCdJO0qZsDIUNN5uK3N2fcug8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=O97dHyckQg7AYiBjI72hk5WdF7GPbH5OafSKUpRt5krhegCt9zBu3rdcWbiSwPned
	 eL1B13hc/kl8HAsytFrTNKo12chbjfHIUAl1xt6HORvWA6cFTcowsuDvYtlWow3IXx
	 dFBL1P+qEb4QQEIjpsC8CDkAapcAfzv2s8Nb85mUXm/pc1w4x/HyDCJwDrx5Ee6Bmz
	 KtVHzQuhTNLBVTKbzxKdbVC+z6c/HB/JwT8p/wnWAXfzFpcuvT6bKFWI2QNwl8gdeW
	 h80I0hNw9LlmqeOKR14vPimRoV3tiKwVxHUDljud0Qn2H/6z27c2XNYcfr4S72xVeg
	 zh4r9/tjJo8Xg==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 11D0917E0DE9;
	Tue,  2 Jun 2026 00:45:20 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 02 Jun 2026 01:44:13 +0300
Subject: [PATCH v7 13/30] drm/bridge: dw-hdmi-qp: Provide
 .{enable|disable}_hpd() PHY ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-dw-hdmi-qp-scramb-v7-13-445eb54ee1ed@collabora.com>
References: <20260602-dw-hdmi-qp-scramb-v7-0-445eb54ee1ed@collabora.com>
In-Reply-To: <20260602-dw-hdmi-qp-scramb-v7-0-445eb54ee1ed@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Daniel Stone <daniels@collabora.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_154522_152286_44079889 
X-CRM114-Status: GOOD (  10.40  )
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

Implement the .hpd_enable() and .hpd_disable() bridge callbacks and
extend dw_hdmi_qp_phy_ops with corresponding hooks.

This enables the DRM core to control when HPD interrupts are armed,
which is needed to prevent premature interrupt delivery before the
connector is fully initialized, and to properly quiesce HPD during
suspend.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 18 ++++++++++++++++++
 include/drm/bridge/dw_hdmi_qp.h              |  2 ++
 2 files changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index b3318655ceab..3f72bea20ba4 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
@@ -1189,6 +1189,22 @@ static int dw_hdmi_qp_cec_transmit(struct drm_bridge *bridge, u8 attempts,
 #define dw_hdmi_qp_cec_transmit NULL
 #endif /* CONFIG_DRM_DW_HDMI_QP_CEC */
 
+static void dw_hdmi_qp_bridge_hpd_enable(struct drm_bridge *bridge)
+{
+	struct dw_hdmi_qp *hdmi = bridge->driver_private;
+
+	if (hdmi->phy.ops->enable_hpd)
+		hdmi->phy.ops->enable_hpd(hdmi, hdmi->phy.data);
+}
+
+static void dw_hdmi_qp_bridge_hpd_disable(struct drm_bridge *bridge)
+{
+	struct dw_hdmi_qp *hdmi = bridge->driver_private;
+
+	if (hdmi->phy.ops->disable_hpd)
+		hdmi->phy.ops->disable_hpd(hdmi, hdmi->phy.data);
+}
+
 static const struct drm_bridge_funcs dw_hdmi_qp_bridge_funcs = {
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
@@ -1196,6 +1212,8 @@ static const struct drm_bridge_funcs dw_hdmi_qp_bridge_funcs = {
 	.atomic_enable = dw_hdmi_qp_bridge_atomic_enable,
 	.atomic_disable = dw_hdmi_qp_bridge_atomic_disable,
 	.detect = dw_hdmi_qp_bridge_detect,
+	.hpd_enable = dw_hdmi_qp_bridge_hpd_enable,
+	.hpd_disable = dw_hdmi_qp_bridge_hpd_disable,
 	.edid_read = dw_hdmi_qp_bridge_edid_read,
 	.hdmi_tmds_char_rate_valid = dw_hdmi_qp_bridge_tmds_char_rate_valid,
 	.hdmi_clear_avi_infoframe = dw_hdmi_qp_bridge_clear_avi_infoframe,
diff --git a/include/drm/bridge/dw_hdmi_qp.h b/include/drm/bridge/dw_hdmi_qp.h
index 6ea9c561cfef..b80fceffc315 100644
--- a/include/drm/bridge/dw_hdmi_qp.h
+++ b/include/drm/bridge/dw_hdmi_qp.h
@@ -17,6 +17,8 @@ struct dw_hdmi_qp_phy_ops {
 	void (*disable)(struct dw_hdmi_qp *hdmi, void *data);
 	enum drm_connector_status (*read_hpd)(struct dw_hdmi_qp *hdmi, void *data);
 	void (*setup_hpd)(struct dw_hdmi_qp *hdmi, void *data);
+	void (*enable_hpd)(struct dw_hdmi_qp *hdmi, void *data);
+	void (*disable_hpd)(struct dw_hdmi_qp *hdmi, void *data);
 };
 
 struct dw_hdmi_qp_plat_data {

-- 
2.54.0


