Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C046FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Apr 2026 00:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k1dAfYsMWRGzDnHYpeJOmc3b4sEHtkREXg+b2xWTJqI=; b=SMcB7qveKtRNPnPO4PK/mYHmix
	/D/vz//7xXn8HJJPyE1LId2txqmxrooIMF01+biEZjozxMPZwHmtd+EeIGOQXPk5cRxH0r813VTT0
	EgHSABdaUAD0AKsVZUhTqiSPNBKDZDptjPPxFI8aqJ6LymqjowPqOQM8qTS4OlPXqHzVTTYEXIBbg
	viVomR1cv/JnSQa+fi9TtcCtRkYggyyuXTzqFCHDYwfhEH+4/YXZ7Khp/kg8gsMRBFwZlfHgjrK7S
	aq9mBo3oRTC/uiXVAVa+bd7WA3BxiEInuvGoeOrdGbEPNiEjt4fYBr17sY4REHKb4x9jqAYSEeC5J
	V8kTG8TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGnEt-0000000F6zi-3iqe;
	Sun, 26 Apr 2026 00:20:47 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGnEi-0000000F6jI-3916;
	Sun, 26 Apr 2026 00:20:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777162835;
	bh=jgysKGQ2uKrEiDbiSpIyt4MLZj/8UeOF2e7BOMrKLbA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Mfb60Yprpj/NPTxhsvkSQjfqWSBHgqZO7R2HTsn1Xaa8vaiH7xnfTnvlAKcLaNg65
	 WkTZ/WQByzwl4aK8TY92PNosZvYthig1rzPiOJxRJ82vW00CVHuww/JLVDGF4cMqZ4
	 0vGKGb2/EVKVfGWdDwhQegWV4wH70xQLZ6vqZvCS+jd3Kj2+WnBXV7Sgpi0IiyDpTz
	 sAkYeNYrjPLmfhs2HIcKhtIeoDla8h0d1JeMuNBthV2wbrg8cz+OMRg34Dy4dhFpfS
	 hU1f6gI2Y1P7mRNbR6+IixNZFdF1/Vr2pp7XZR5oAQyWhVfRVPGub/qUar8Pxsnlo8
	 MYaGC6pXR6V4Q==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D29FB17E15A3;
	Sun, 26 Apr 2026 02:20:34 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Sun, 26 Apr 2026 03:20:22 +0300
Subject: [PATCH v5 10/10] drm/rockchip: dw_hdmi_qp: Restrict HPD event to
 the affected connector
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260426-dw-hdmi-qp-scramb-v5-10-d778e70c317b@collabora.com>
References: <20260426-dw-hdmi-qp-scramb-v5-0-d778e70c317b@collabora.com>
In-Reply-To: <20260426-dw-hdmi-qp-scramb-v5-0-d778e70c317b@collabora.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Diederik de Haas <diederik@cknow-tech.com>, 
 Maud Spierings <maud_spierings@hotmail.com>
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_172036_997683_EBE172F4 
X-CRM114-Status: GOOD (  12.74  )
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

Switch from drm_helper_hpd_irq_event(), which polls all connectors, to
drm_connector_helper_hpd_irq_event(), which runs the detect cycle only
on the affected connector.

This avoids unnecessary work and redundant detect calls on unrelated
connectors.

Tested-by: Diederik de Haas <diederik@cknow-tech.com>
Tested-by: Maud Spierings <maud_spierings@hotmail.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index fbbe26f8730c..d6338195a5b7 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -93,6 +93,7 @@ struct rockchip_hdmi_qp {
 	struct regmap *regmap;
 	struct regmap *vo_regmap;
 	struct rockchip_encoder encoder;
+	struct drm_connector *connector;
 	struct dw_hdmi_qp *hdmi;
 	struct phy *phy;
 	struct gpio_desc *frl_enable_gpio;
@@ -252,11 +253,10 @@ static void dw_hdmi_qp_rk3588_hpd_work(struct work_struct *work)
 	struct rockchip_hdmi_qp *hdmi = container_of(work,
 						     struct rockchip_hdmi_qp,
 						     hpd_work.work);
-	struct drm_device *drm = hdmi->encoder.encoder.dev;
 	bool changed;
 
-	if (drm) {
-		changed = drm_helper_hpd_irq_event(drm);
+	if (hdmi->connector) {
+		changed = drm_connector_helper_hpd_irq_event(hdmi->connector);
 		if (changed)
 			dev_dbg(hdmi->dev, "connector status changed\n");
 	}
@@ -467,7 +467,6 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 	struct dw_hdmi_qp_plat_data plat_data = {};
 	const struct rockchip_hdmi_qp_cfg *cfg;
 	struct drm_device *drm = data;
-	struct drm_connector *connector;
 	struct drm_encoder *encoder;
 	struct rockchip_hdmi_qp *hdmi;
 	struct resource *res;
@@ -589,12 +588,12 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 		return dev_err_probe(dev, PTR_ERR(hdmi->hdmi),
 				     "Failed to bind dw-hdmi-qp\n");
 
-	connector = drm_bridge_connector_init(drm, encoder);
-	if (IS_ERR(connector))
-		return dev_err_probe(dev, PTR_ERR(connector),
+	hdmi->connector = drm_bridge_connector_init(drm, encoder);
+	if (IS_ERR(hdmi->connector))
+		return dev_err_probe(dev, PTR_ERR(hdmi->connector),
 				     "Failed to init bridge connector\n");
 
-	ret = drm_connector_attach_encoder(connector, encoder);
+	ret = drm_connector_attach_encoder(hdmi->connector, encoder);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to attach connector\n");
 
@@ -612,6 +611,8 @@ static void dw_hdmi_qp_rockchip_unbind(struct device *dev,
 	struct rockchip_hdmi_qp *hdmi = dev_get_drvdata(dev);
 
 	cancel_delayed_work_sync(&hdmi->hpd_work);
+
+	hdmi->connector = NULL;
 }
 
 static const struct component_ops dw_hdmi_qp_rockchip_ops = {
@@ -646,8 +647,8 @@ static int __maybe_unused dw_hdmi_qp_rockchip_resume(struct device *dev)
 
 	dw_hdmi_qp_resume(dev, hdmi->hdmi);
 
-	if (hdmi->encoder.encoder.dev)
-		drm_helper_hpd_irq_event(hdmi->encoder.encoder.dev);
+	if (hdmi->connector)
+		drm_connector_helper_hpd_irq_event(hdmi->connector);
 
 	return 0;
 }

-- 
2.53.0


