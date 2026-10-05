Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A9CDCA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 00:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=btf8gmpeFnnba63+8VVUI4o9sAiGRTsgUfyEP06qFt8=; b=EiA3oHSqiP6MZIhXN2TT3neFth
	d9xqOOKQVueiizuCZegTGNWZ3yTmFnAzalOGe3jqxDUjrsKoKPzUFMAZQvxN61Xb4yWjbKjIjoZtr
	9ibdFq3tkDYgUKnDsQWLWqsqU4CmQPs6BSN4upcGJ8++xrKTtdYdeZWst29ahe4542a7Oj7lbWj4M
	VAKr10MuVviXMHabiDuYEq7ILCkvaObKC9mE8dMVzF/Euy5i7yfZsF9P4Yyt+jlCBn1ZqnNF2/3+d
	68mzydzh/KMObzXxc3JnN2jRto7iF8rV5tD7mnTZDIL4t2tbTanfgjA4D19l1LZPC8J5mMMLoI/H7
	7xRxHuZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDWjM-0000000FW5K-0oKG;
	Mon, 05 Oct 2026 00:39:00 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDWjF-0000000FVxR-44cv;
	Mon, 05 Oct 2026 00:38:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1791160729;
	bh=TYdyiMCMQ8jJzb3Pp/1WSpEtutPZs8fJOVBWQ6/Qyao=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MedLEFLp1Gv4gvJFwzGUsHyS7vo3mmF+8kFFQsEnuJMAf5i9iKvUli6NwAiDXVonS
	 RiTSCaQv7yWkiCvZOH1FeJcbxUfi51gQxcRoa/AY+0ZbWQIeWHAlJAx3i46SeelNoZ
	 mH3eVb+MTb5CSq022IxyWPBxeGX5tIJmDfTn2jLvEEjYCnM3VjZyBkf6p8C9GLEBdz
	 Rcav3ar0eLEM8rw/9XSS6/C8sJuMGW8dv85XkHJ6a+WbfcVlf4e0fM3iLuAE+4QFs4
	 jqrCIsg9lBiHqfKzswJkYA2OPa8eGLaCC+3UY4yJj24gsGyasiz3sfoBmrLAVMqHul
	 4861k1a4/6Whg==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 120CF17E0D84;
	Mon, 05 Oct 2026 02:38:49 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Mon, 05 Oct 2026 03:38:06 +0300
Subject: [PATCH v12 05/16] drm/bridge: dw-hdmi-qp: Provide
 dw_hdmi_qp_hpd_notify() helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261005-dw-hdmi-qp-scramb-v12-5-195157ba0b40@collabora.com>
References: <20261005-dw-hdmi-qp-scramb-v12-0-195157ba0b40@collabora.com>
In-Reply-To: <20261005-dw-hdmi-qp-scramb-v12-0-195157ba0b40@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Algea Cao <algea.cao@rock-chips.com>, Daniel Stone <daniels@collabora.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maud_spierings@hotmail.com>, 
 Diederik de Haas <diederik@cknow-tech.com>, 
 =?utf-8?q?Robin_R=C3=A4ber?= <robin.raebi@gmail.com>, 
 Igor Paunovic <royalnet026@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_173854_168830_916B6948 
X-CRM114-Status: GOOD (  20.50  )
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

Track the connector in use in curr_conn, set and cleared by the atomic
enable/disable hooks.  Since the helper runs asynchronously from
IRQ/work context, hold a reference on that connector for as long as the
bridge is enabled, so that the pointer is always safe to dereference.
Otherwise validity would rest on the platform glue quiescing HPD before
the DRM-managed connector is freed during teardown, risking a
use-after-free on a late HPD event.

The helper must take its own temporary reference while running, because
the long-lived reference above only guarantees the pointer is valid at
the time it is read, not that the connector survives a concurrent
atomic_disable dropping that reference while the helper is still using
it.  Moreover, reading the pointer and acquiring the temporary reference
must be atomic with respect to atomic_disable, otherwise a window exists
where drm_connector_get() is called on a connector whose refcount
already reached zero, hence guard curr_conn with a mutex for this
purpose.  Holding the mutex across the whole helper instead is not an
option, as it takes modeset locks while atomic_disable is called with
them held.

Also note that this helper may sleep, so it must only be called from a
threaded HPD interrupt handler or a work function.

Tested-by: Maud Spierings <maud_spierings@hotmail.com>
Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # NanoPC-T6 LTS, Rock 5B
Tested-by: Robin Räber <robin.raebi@gmail.com>
Tested-by: Igor Paunovic <royalnet026@gmail.com> # RK3588 Orange Pi 5 Plus, dual HDMI
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 59 ++++++++++++++++++++++++++++
 include/drm/bridge/dw_hdmi_qp.h              |  1 +
 2 files changed, 60 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index 14723ee5cb05..54181b052fe2 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
@@ -28,6 +28,7 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_modes.h>
 #include <drm/drm_print.h>
+#include <drm/drm_probe_helper.h>
 
 #include <media/cec.h>
 
@@ -81,6 +82,9 @@ struct dw_hdmi_qp {
 	struct regmap *regm;
 	int main_irq;
 
+	/* Guards curr_conn between atomic hooks and HPD notify readers */
+	struct mutex mutex;
+	struct drm_connector *curr_conn;
 	unsigned long tmds_char_rate;
 	bool no_hpd;
 };
@@ -564,6 +568,10 @@ static void dw_hdmi_qp_bridge_atomic_enable(struct drm_bridge *bridge,
 		dev_dbg(hdmi->dev, "%s mode=DVI\n", __func__);
 	}
 
+	drm_connector_get(connector);
+	scoped_guard(mutex, &hdmi->mutex)
+		hdmi->curr_conn = connector;
+
 	hdmi->phy.ops->init(hdmi, hdmi->phy.data);
 
 	dw_hdmi_qp_mod(hdmi, HDCP2_BYPASS, HDCP2_BYPASS, HDCP2LOGIC_CONFIG0);
@@ -578,6 +586,13 @@ static void dw_hdmi_qp_bridge_atomic_disable(struct drm_bridge *bridge,
 	struct dw_hdmi_qp *hdmi = bridge->driver_private;
 	struct drm_connector *connector;
 
+	scoped_guard(mutex, &hdmi->mutex) {
+		if (hdmi->curr_conn) {
+			drm_connector_put(hdmi->curr_conn);
+			hdmi->curr_conn = NULL;
+		}
+	}
+
 	hdmi->tmds_char_rate = 0;
 
 	connector = drm_atomic_get_old_connector_for_encoder(state, bridge->encoder);
@@ -1099,6 +1114,10 @@ struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platform_device *pdev,
 	if (IS_ERR(hdmi))
 		return ERR_CAST(hdmi);
 
+	ret = devm_mutex_init(dev, &hdmi->mutex);
+	if (ret)
+		return ERR_PTR(ret);
+
 	hdmi->dev = dev;
 
 	regs = devm_platform_ioremap_resource(pdev, 0);
@@ -1194,6 +1213,46 @@ struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platform_device *pdev,
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
+	enum drm_connector_status status;
+	struct drm_connector *conn;
+
+	scoped_guard(mutex, &hdmi->mutex) {
+		conn = hdmi->curr_conn;
+		if (conn)
+			drm_connector_get(conn);
+	}
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
+
+	if (conn)
+		drm_connector_put(conn);
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


