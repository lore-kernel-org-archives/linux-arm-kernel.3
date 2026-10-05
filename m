Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB091CA5FF5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 00:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pj0XzwuUOXvQhvN9UCyqI2834auupPDFuAK0nJE0Dwg=; b=q6sodJXL/83s8A8BzFaGds02US
	Sj2FpggIrwPX7dMsDDsWtwbv52auADUE/Nq2Wve0cZwX8bdZinFPnlaOqDBxaPhWOH33ilBIgHylh
	Yeu7rJEXFSju4AIS354wC9h1fA4OMkyRgXMMnv2d0/WrO2J/dSbADhMavu8Z+uXNGcopV9mRdgTRP
	557e5FpR+v4O2S2zPwyR98bOjPMltpE4ou7HIxnxp2ar4+p/MAsnFJsdxiMo84cQ7gcuLdonOMWfk
	OzKly5jvHpJPpjkoCE8KzHYyM1gSXbs927MAVyaecSOrFrhJJNkSPjAymbaQ3Ympoq5VFH9L9hHcH
	gIRnfKBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDWjZ-0000000FWSY-3I6d;
	Mon, 05 Oct 2026 00:39:13 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDWjJ-0000000FW0V-38YO;
	Mon, 05 Oct 2026 00:39:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1791160735;
	bh=v+xGsao6t/i3km4Z8JIHiXE/qnKUhhLznYcwbU6luJM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PqD52KTubPrs746d0B5Zqs0SCsu3fkOlfLjHLBhM2hJf7vcc+2B+xNPyrrEs5UM+S
	 Ph0asFTO8x4S3WTyWcCi9fOFKpxzs49W8cpWEel21WctOLdM5/qhEI079IYpvH2l9L
	 YgiW1kUOR0tLiinihQu0rosaYuRqim8ASLjrshFcW5aZYGYyFmCPEAe2RPUaqFYbGw
	 2Y9ifQHeUIRK+Rn8RGEEdVT+NtDjWeLSHLjWnKdCE4/LIAGf9w3M31VnXTB7g2ic0H
	 FcYBJewKHVICRs0LX1Fu76+XP9FsSCpuxxju/DF0+Iw9iCLNUMOKCDLQivI24eb/t9
	 g6iJ03R9+yqNQ==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 37B1817E144B;
	Mon, 05 Oct 2026 02:38:55 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Mon, 05 Oct 2026 03:38:15 +0300
Subject: [PATCH v12 14/16] drm/rockchip: dw_hdmi_qp: Control the HPD IRQ
 line via the bridge HPD ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261005-dw-hdmi-qp-scramb-v12-14-195157ba0b40@collabora.com>
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
 Diederik de Haas <diederik@cknow-tech.com>, 
 =?utf-8?q?Robin_R=C3=A4ber?= <robin.raebi@gmail.com>, 
 Igor Paunovic <royalnet026@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_173858_185858_7674E651 
X-CRM114-Status: GOOD (  18.02  )
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

The HPD interrupt must not be delivered before the DRM connector is fully
set up, and it should be quiesced while the display pipeline is suspended.
On top of that, the threaded handler re-arms HPD unconditionally after the
hotplug debounce, which must not override an explicit disable requested by
the DRM core.

Request the HPD IRQ in bind() with IRQF_NO_AUTOEN so it stays disabled
until the core arms it, and drive enable_irq()/disable_irq() from the
phy ops invoked by the bridge through its hpd_{enable,disable}()
callbacks.  This ensures the line is only armed after the connector is
ready.  disable_irq() additionally waits for the threaded handler to
finish, so its GRF re-arm can no longer race with and override a
core-requested disable.

Masking the line is not enough on its own, though: the threaded handler
merely queues hpd_work with a 150 ms debounce, so an event taken shortly
before the disable would still probe the connector and read the EDID
long after the core considers HPD quiesced.  Since disable_irq() has
drained the threaded handler, which is the only site arming the work, it
can no longer be requeued and dropping it is race-free.

Use the non-syncing cancel_delayed_work() for that: waiting on a running
callback would pull mode_config.mutex, taken by the work through
drm_connector_helper_hpd_irq_event(), under the hpd_state_mutex held by
drm_bridge_hpd_disable().  That inverts the order of the connector probe
path, which holds mode_config.mutex while reaching hpd_state_mutex via
drm_kms_helper_poll_enable().  A callback already in progress is drained
by the system-sleep and unbind paths instead.

Note that IRQF_NO_AUTOEN is incompatible with IRQF_SHARED; the latter is
dropped as this IRQ has no other users.

Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # NanoPC-T6 LTS, Rock 5B
Tested-by: Robin Räber <robin.raebi@gmail.com>
Tested-by: Igor Paunovic <royalnet026@gmail.com> # RK3588 Orange Pi 5 Plus, dual HDMI
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 33 +++++++++++++++++++++-----
 1 file changed, 27 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index ecf12403101d..1c547016ee00 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -99,6 +99,7 @@ struct rockchip_hdmi_qp {
 	struct phy *phy;
 	struct gpio_desc *frl_enable_gpio;
 	struct delayed_work hpd_work;
+	int hpd_irq;
 	int port_id;
 	const struct rockchip_hdmi_qp_ctrl_ops *ctrl_ops;
 	unsigned long long tmds_char_rate;
@@ -308,13 +309,23 @@ static void dw_hdmi_qp_rk3588_enable_hpd(struct dw_hdmi_qp *dw_hdmi, void *data)
 	struct rockchip_hdmi_qp *hdmi = (struct rockchip_hdmi_qp *)data;
 
 	dw_hdmi_qp_rk3588_unmask_hpd(hdmi);
+	enable_irq(hdmi->hpd_irq);
 }
 
 static void dw_hdmi_qp_rk3588_disable_hpd(struct dw_hdmi_qp *dw_hdmi, void *data)
 {
 	struct rockchip_hdmi_qp *hdmi = (struct rockchip_hdmi_qp *)data;
 
+	disable_irq(hdmi->hpd_irq);
 	dw_hdmi_qp_rk3588_mask_hpd(hdmi);
+
+	/*
+	 * Cannot use the _sync() variant: the work takes mode_config.mutex,
+	 * which the connector probe path already holds when acquiring the
+	 * hpd_state_mutex this caller runs under. Requeuing is already ruled
+	 * out by disable_irq().
+	 */
+	cancel_delayed_work(&hdmi->hpd_work);
 }
 
 static const struct dw_hdmi_qp_phy_ops rk3588_hdmi_phy_ops = {
@@ -355,13 +366,23 @@ static void dw_hdmi_qp_rk3576_enable_hpd(struct dw_hdmi_qp *dw_hdmi, void *data)
 	struct rockchip_hdmi_qp *hdmi = (struct rockchip_hdmi_qp *)data;
 
 	dw_hdmi_qp_rk3576_unmask_hpd(hdmi);
+	enable_irq(hdmi->hpd_irq);
 }
 
 static void dw_hdmi_qp_rk3576_disable_hpd(struct dw_hdmi_qp *dw_hdmi, void *data)
 {
 	struct rockchip_hdmi_qp *hdmi = (struct rockchip_hdmi_qp *)data;
 
+	disable_irq(hdmi->hpd_irq);
 	dw_hdmi_qp_rk3576_mask_hpd(hdmi);
+
+	/*
+	 * Cannot use the _sync() variant: the work takes mode_config.mutex,
+	 * which the connector probe path already holds when acquiring the
+	 * hpd_state_mutex this caller runs under. Requeuing is already ruled
+	 * out by disable_irq().
+	 */
+	cancel_delayed_work(&hdmi->hpd_work);
 }
 
 static const struct dw_hdmi_qp_phy_ops rk3576_hdmi_phy_ops = {
@@ -584,7 +605,7 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 	struct resource *res;
 	struct clk_bulk_data *clks;
 	struct clk *ref_clk;
-	int ret, irq, i;
+	int ret, i;
 
 	if (!dev->of_node)
 		return -ENODEV;
@@ -688,14 +709,14 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 	if (plat_data.cec_irq < 0)
 		return plat_data.cec_irq;
 
-	irq = platform_get_irq_byname(pdev, "hpd");
-	if (irq < 0)
-		return irq;
+	hdmi->hpd_irq = platform_get_irq_byname(pdev, "hpd");
+	if (hdmi->hpd_irq < 0)
+		return hdmi->hpd_irq;
 
-	ret = devm_request_threaded_irq(dev, irq,
+	ret = devm_request_threaded_irq(dev, hdmi->hpd_irq,
 					cfg->ctrl_ops->hardirq_callback,
 					cfg->ctrl_ops->irq_callback,
-					IRQF_SHARED, "dw-hdmi-qp-hpd",
+					IRQF_NO_AUTOEN, "dw-hdmi-qp-hpd",
 					hdmi);
 	if (ret)
 		return ret;

-- 
2.55.0


