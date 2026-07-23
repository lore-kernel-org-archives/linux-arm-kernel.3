Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DB98C44536
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 01:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l0bWX0T/C9+uyrM/8UBNH40AhUVCZnkbLT19fVdcryY=; b=EqZkyRS1HgF599vyHP5Va4GiPY
	ThhV36H+5o6bz0Q/Wd3UDcsudGJTDP6QLwFnFNT4k9GuABPxDPPkoy6wkzbixbaSKBvGIUxlkodFq
	Ig6M7DuIfL5jyH7hzMFFvUzVIohU+zCBcq0uW4yHXYjral5RRvPajXEBfruCZL82OFJZ+RfmHze8W
	n+dc5kWN5FUzp0Be+RZYIjXA4OPjifBPUWBAFiJ3VBJWIV7QRkHZMimND7qz4pTxrt1K4VQFexe/P
	6zAf40dlpQ/uWRLXwKnYgVDTEJHZ6C78YLMMF5SXrOrgLRxs+6nc2rycwwguX09ZCpq9LjQ6wDc2t
	SdtWrbOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmiMQ-0000000D5BS-2pVA;
	Thu, 23 Jul 2026 01:36:30 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmiLI-0000000D30b-00xd;
	Thu, 23 Jul 2026 01:35:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784770518;
	bh=dV0x7rF3JzhR7cewopiIDjEo7KmcEmFPkxMQmgjZAds=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bCwsi4oLrvR/u+X8r9WO3WFOMBj8THpFUiDaEJDpmmtpnbBQ3pZ/ML1t6bvQEkEHM
	 ZySUcxcvszNVw54PvzEW3fSbWPVHLa73h6Z8Qs/l3G5c+6XDMzJ5HkIR4qc0wQk5li
	 +1M/1BSGwNVAvwZwFeTIllyPAbeOn5YLfENksybzwKE+NWjlitOe9m4q6ddzBYTKy1
	 SZCSG102YAOWtQgSKel+V6+etkriTdCPA3FDgDBau31YSJcN/TgAkI/0z/uPYpb32Y
	 jPS3v2GfV/I65yELBg02seHRduvHd//2eciF2LHNC7FDoRQ2lZdvgh7iTdI7+MJMAg
	 EHx18BgRKWNJw==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2376517E0857;
	Thu, 23 Jul 2026 03:35:18 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 23 Jul 2026 04:35:12 +0300
Subject: [PATCH v9 23/61] drm/bridge: dw-hdmi-qp: Provide
 dw_hdmi_qp_hpd_notify() helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-dw-hdmi-qp-scramb-v9-23-4fb12ea22ac9@collabora.com>
References: <20260723-dw-hdmi-qp-scramb-v9-0-4fb12ea22ac9@collabora.com>
In-Reply-To: <20260723-dw-hdmi-qp-scramb-v9-0-4fb12ea22ac9@collabora.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Algea Cao <algea.cao@rock-chips.com>, 
 Daniel Stone <daniels@collabora.com>, Liu Ying <victor.liu@nxp.com>, 
 Phong LE <ple@baylibre.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 Maud Spierings <maud_spierings@hotmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_183520_206898_8C485430 
X-CRM114-Status: GOOD (  15.91  )
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

Export dw_hdmi_qp_hpd_notify() for platform drivers to report hot-plug
detection events.  Unlike drm_helper_hpd_irq_event() which polls all
connectors, this helper targets only the affected connector and ensures
.detect_ctx() is invoked on reconnection events to trigger SCDC state
recovery.

Note that this helper may sleep, so it must only be called from a
threaded HPD interrupt handler or a work function.

Tested-by: Maud Spierings <maud_spierings@hotmail.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 36 ++++++++++++++++++++++++++++
 include/drm/bridge/dw_hdmi_qp.h              |  1 +
 2 files changed, 37 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index ee74266b7aa9..be1bd765cb03 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
@@ -28,6 +28,7 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_modes.h>
 #include <drm/drm_print.h>
+#include <drm/drm_probe_helper.h>
 
 #include <media/cec.h>
 
@@ -163,6 +164,7 @@ struct dw_hdmi_qp {
 	struct regmap *regm;
 	int main_irq;
 
+	struct drm_connector *curr_conn;
 	unsigned long tmds_char_rate;
 	bool no_hpd;
 };
@@ -785,6 +787,8 @@ static void dw_hdmi_qp_bridge_atomic_enable(struct drm_bridge *bridge,
 	dw_hdmi_qp_mod(hdmi, op_mode, OPMODE_DVI, LINK_CONFIG0);
 
 	drm_atomic_helper_connector_hdmi_update_infoframes(connector, state);
+
+	hdmi->curr_conn = connector;
 }
 
 static void dw_hdmi_qp_bridge_atomic_disable(struct drm_bridge *bridge,
@@ -793,6 +797,7 @@ static void dw_hdmi_qp_bridge_atomic_disable(struct drm_bridge *bridge,
 	struct dw_hdmi_qp *hdmi = bridge->driver_private;
 	struct drm_connector *connector;
 
+	hdmi->curr_conn = NULL;
 	hdmi->tmds_char_rate = 0;
 
 	connector = drm_atomic_get_old_connector_for_encoder(state, bridge->encoder);
@@ -1409,6 +1414,37 @@ struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platform_device *pdev,
 }
 EXPORT_SYMBOL_GPL(dw_hdmi_qp_bind);
 
+/**
+ * dw_hdmi_qp_hpd_notify() - Notify a hot-plug detection event
+ * @hdmi: pointer to the DW HDMI QP controller
+ *
+ * Platform drivers should call this from their threaded IRQ handler or work
+ * function to notify the bridge of a connection status change.
+ * The bridge's .read_hpd() phy_ops callback is used to read the current
+ * connection status.
+ */
+void dw_hdmi_qp_hpd_notify(struct dw_hdmi_qp *hdmi)
+{
+	struct drm_connector *conn = hdmi->curr_conn;
+	enum drm_connector_status status;
+
+	status = hdmi->phy.ops->read_hpd(hdmi, hdmi->phy.data);
+	dev_dbg(hdmi->dev, "%s status=%d\n", __func__, status);
+
+	/*
+	 * When the display pipeline has been already active, switch to
+	 * drm_connector_helper_hpd_irq_event() to ensure .detect_ctx()
+	 * gets invoked, i.e. via drm_helper_probe_detect(), because
+	 * drm_bridge_hpd_notify() defers to a delayed hotplug path in
+	 * this case.
+	 */
+	if (conn && status == connector_status_connected)
+		drm_connector_helper_hpd_irq_event(conn);
+	else
+		drm_bridge_hpd_notify(&hdmi->bridge, status);
+}
+EXPORT_SYMBOL_GPL(dw_hdmi_qp_hpd_notify);
+
 void dw_hdmi_qp_suspend(struct device *dev, struct dw_hdmi_qp *hdmi)
 {
 	disable_irq(hdmi->main_irq);
diff --git a/include/drm/bridge/dw_hdmi_qp.h b/include/drm/bridge/dw_hdmi_qp.h
index b80fceffc315..b4fb1c578a5b 100644
--- a/include/drm/bridge/dw_hdmi_qp.h
+++ b/include/drm/bridge/dw_hdmi_qp.h
@@ -36,6 +36,7 @@ struct dw_hdmi_qp_plat_data {
 struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platform_device *pdev,
 				   struct drm_encoder *encoder,
 				   const struct dw_hdmi_qp_plat_data *plat_data);
+void dw_hdmi_qp_hpd_notify(struct dw_hdmi_qp *hdmi);
 void dw_hdmi_qp_suspend(struct device *dev, struct dw_hdmi_qp *hdmi);
 void dw_hdmi_qp_resume(struct device *dev, struct dw_hdmi_qp *hdmi);
 #endif /* __DW_HDMI_QP__ */

-- 
2.55.0


