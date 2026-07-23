Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86832C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 01:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V2fG8yrejIgDViNsitf0FiF/JCoTTgpwnlmXYqK1GJg=; b=YQKoOfE9VQEqcDpmpli8xyjRf0
	qEyqh2XVCzR5W5YzFs/dguFn+WAoFGQTjHgW3QomqzHVwfQlv+OwhWYrpvgCBnKg6l7tIanXbFs6O
	WoB6FptO9RHUJsPR/re8DDhzi9ub1rjCyyVjshOJcu5zl+a4HQUWoW0CDnRpzvJNRDiOc181aLsSS
	lPb+aP8sD0epNEg9fgyLuZ7XMyjwqVQBpbzHRIJ98wgKqaXl1uega/uUYoLIBDdkEHEzbrEZxDnDR
	pPz+zX8B+yaqM4D5AIpH7uKaR+s4VhUxWeNeFxhYMW+b1K8WH4dn1ONmlFrotCnJlH3qskkdzbGTr
	IuI6pUQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmiQH-0000000D8p6-2clr;
	Thu, 23 Jul 2026 01:40:29 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmiLN-0000000D36Y-2g1Y;
	Thu, 23 Jul 2026 01:35:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784770523;
	bh=C/E1cpRXtqps6AVDXl0dbsrmxcX9GEPjGXzQ3d8wF4c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=oLapfbuRLtYztsrD5ve5hhxebPuS6qd+1ltXvQFaP9tSBaKrl4JAY24a3G0U4zxTy
	 mr+PfGTkRv45gHr8UoSvdtl1UfL2XR/QpdPD5cw7v7CGeWzeZ784Z5RV2DCG5LcoV0
	 QobWZ9bfWhDgq2R2zbYKFXYvJG8v3VwmQx5j+O/ikGGsUehUHDKKgFLG59TNbBcisV
	 uo8VhjSz8XpXvT7KskzE+i6/1BpL0mS2WiE6YFivD723PhWMZ5NXq66ghPGafQQRSH
	 04gloFr3n6tYp9Ij9iT7Rg0pRoRGVGYpyAb8klJVdYTavagr+8CyvOzNY4ckV/p3n7
	 0Cw0K/EQyw5ug==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BA0A117E023C;
	Thu, 23 Jul 2026 03:35:23 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 23 Jul 2026 04:35:20 +0300
Subject: [PATCH v9 31/61] drm/rockchip: dw_hdmi_qp: Control the HPD IRQ
 line via the bridge HPD ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-dw-hdmi-qp-scramb-v9-31-4fb12ea22ac9@collabora.com>
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
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_183525_840217_B4ECF239 
X-CRM114-Status: GOOD (  15.40  )
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

Note that IRQF_NO_AUTOEN is incompatible with IRQF_SHARED; the latter is
dropped as this IRQ has no other users.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index cdddbbb8b80b..534a2c8da2a0 100644
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
@@ -308,12 +309,14 @@ static void dw_hdmi_qp_rk3588_enable_hpd(struct dw_hdmi_qp *dw_hdmi, void *data)
 	struct rockchip_hdmi_qp *hdmi = (struct rockchip_hdmi_qp *)data;
 
 	dw_hdmi_qp_rk3588_unmask_hpd(hdmi);
+	enable_irq(hdmi->hpd_irq);
 }
 
 static void dw_hdmi_qp_rk3588_disable_hpd(struct dw_hdmi_qp *dw_hdmi, void *data)
 {
 	struct rockchip_hdmi_qp *hdmi = (struct rockchip_hdmi_qp *)data;
 
+	disable_irq(hdmi->hpd_irq);
 	dw_hdmi_qp_rk3588_mask_hpd(hdmi);
 }
 
@@ -355,12 +358,14 @@ static void dw_hdmi_qp_rk3576_enable_hpd(struct dw_hdmi_qp *dw_hdmi, void *data)
 	struct rockchip_hdmi_qp *hdmi = (struct rockchip_hdmi_qp *)data;
 
 	dw_hdmi_qp_rk3576_unmask_hpd(hdmi);
+	enable_irq(hdmi->hpd_irq);
 }
 
 static void dw_hdmi_qp_rk3576_disable_hpd(struct dw_hdmi_qp *dw_hdmi, void *data)
 {
 	struct rockchip_hdmi_qp *hdmi = (struct rockchip_hdmi_qp *)data;
 
+	disable_irq(hdmi->hpd_irq);
 	dw_hdmi_qp_rk3576_mask_hpd(hdmi);
 }
 
@@ -584,7 +589,7 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 	struct resource *res;
 	struct clk_bulk_data *clks;
 	struct clk *ref_clk;
-	int ret, irq, i;
+	int ret, i;
 
 	if (!dev->of_node)
 		return -ENODEV;
@@ -688,14 +693,14 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
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


