Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98A56CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 00:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hnAma4aN5tsPdS/jjyMmbZfsTnQTSpSC3oyoUpPnLbg=; b=0FyiYAOCah15+cCOabO0aBRJFC
	Z7nr2pzMEU3r8rnIUHLopu1b3uiECrG+VJKANabAG84Jqx9c0VLsbNYTSj+Bukfy2MYDElfMVopA7
	zOm3vG3mRK4V18IbIVieCfRvUtb4Zna0ekgLH57ZqyO5kegCB12FsPDzexoQzgV+Kwt3ICskMwEuQ
	+ajdj1AjtiSKzYsxlCFQVh/kME74BPuMUWpBEtjYCzNTSuaSHiWlW1o9YvYNK99v148duA4OrwDah
	LqrZXCcSpXq53SCVSDhVqJVoC8RrOvJTgnjMjoQgZyqNklfMHCDMh7f9mb/bFiTH6B0BqALySwiYF
	ZeT2f8TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDWjj-0000000FWmn-0bH7;
	Mon, 05 Oct 2026 00:39:23 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDWjI-0000000FVz3-0aqF;
	Mon, 05 Oct 2026 00:39:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1791160734;
	bh=I3uk4ZGFS9FKIrsT9vdsouFcemminnmo88qp4GJ00Ys=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bxwAsKhMbAo2163wZ0uNelzGr1iHhcpsYEd2y4q4BJCOrpDFWWZ27xtYThGTYH5z0
	 pFRy6AODL+essv8TkszCCJHd60hhok2V75h2dvwc7RMoRlE9NxaPL/mcuZgYM9FxYI
	 fmAsJMfLEmWhRbuckhZSr/QxwRKmU1XqoIDUwfYzJPgb3yKDWhHopSRqFxMGXANCyu
	 kXWxpygyMOyQAefIjfKgufomAGW7o9Jhlegln/QvfihmLjLpXiA1lqnm+3nPmf2eqj
	 8JmOVb0MdFIqTdmz7n9H4izIFKDUY8nB0fFPjJ+vrcFlwazi6BYEAR509YtjxevqzW
	 fPP4DM40QoBUw==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DA89B17E1313;
	Mon, 05 Oct 2026 02:38:53 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Mon, 05 Oct 2026 03:38:13 +0300
Subject: [PATCH v12 12/16] drm/rockchip: dw_hdmi_qp: Implement
 .{enable,disable}_hpd() PHY ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261005-dw-hdmi-qp-scramb-v12-12-195157ba0b40@collabora.com>
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
X-CRM114-CacheID: sfid-20261004_173858_351755_4DE97DA8 
X-CRM114-Status: GOOD (  12.64  )
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

Implement .enable_hpd() and .disable_hpd() phy ops for RK3576 and RK3588
SoCs, used by the corresponding bridge callbacks for HPD activation
control.

Consolidate the interrupt clear-and-unmask sequence into enable_hpd()
and the mask-only operation into disable_hpd(), replacing the open-coded
register writes in the interrupt handlers and io_init().

The .setup_hpd() phy op, which was previously called from
dw_hdmi_qp_init_hw(), is no longer needed and its users are removed.

Tested-by: Maud Spierings <maud_spierings@hotmail.com>
Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # NanoPC-T6 LTS, Rock 5B
Tested-by: Robin Räber <robin.raebi@gmail.com>
Tested-by: Igor Paunovic <royalnet026@gmail.com> # RK3588 Orange Pi 5 Plus, dual HDMI
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 78 +++++++++++++-------------
 1 file changed, 38 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index bcfa6646546e..9e48ec06eb66 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -277,7 +277,7 @@ dw_hdmi_qp_rk3588_read_hpd(struct dw_hdmi_qp *dw_hdmi, void *data)
 	return val ? connector_status_connected : connector_status_disconnected;
 }
 
-static void dw_hdmi_qp_rk3588_setup_hpd(struct dw_hdmi_qp *dw_hdmi, void *data)
+static void dw_hdmi_qp_rk3588_enable_hpd(struct dw_hdmi_qp *dw_hdmi, void *data)
 {
 	struct rockchip_hdmi_qp *hdmi = (struct rockchip_hdmi_qp *)data;
 	u32 val;
@@ -292,11 +292,25 @@ static void dw_hdmi_qp_rk3588_setup_hpd(struct dw_hdmi_qp *dw_hdmi, void *data)
 	regmap_write(hdmi->regmap, RK3588_GRF_SOC_CON2, val);
 }
 
+static void dw_hdmi_qp_rk3588_disable_hpd(struct dw_hdmi_qp *dw_hdmi, void *data)
+{
+	struct rockchip_hdmi_qp *hdmi = (struct rockchip_hdmi_qp *)data;
+	u32 val;
+
+	if (hdmi->port_id)
+		val = FIELD_PREP_WM16(RK3588_HDMI1_HPD_INT_MSK, 1);
+	else
+		val = FIELD_PREP_WM16(RK3588_HDMI0_HPD_INT_MSK, 1);
+
+	regmap_write(hdmi->regmap, RK3588_GRF_SOC_CON2, val);
+}
+
 static const struct dw_hdmi_qp_phy_ops rk3588_hdmi_phy_ops = {
 	.init		= dw_hdmi_qp_rk3588_phy_init,
 	.disable	= dw_hdmi_qp_rk3588_phy_disable,
 	.read_hpd	= dw_hdmi_qp_rk3588_read_hpd,
-	.setup_hpd	= dw_hdmi_qp_rk3588_setup_hpd,
+	.enable_hpd	= dw_hdmi_qp_rk3588_enable_hpd,
+	.disable_hpd	= dw_hdmi_qp_rk3588_disable_hpd,
 };
 
 static enum drm_connector_status
@@ -311,7 +325,7 @@ dw_hdmi_qp_rk3576_read_hpd(struct dw_hdmi_qp *dw_hdmi, void *data)
 		connector_status_connected : connector_status_disconnected;
 }
 
-static void dw_hdmi_qp_rk3576_setup_hpd(struct dw_hdmi_qp *dw_hdmi, void *data)
+static void dw_hdmi_qp_rk3576_enable_hpd(struct dw_hdmi_qp *dw_hdmi, void *data)
 {
 	struct rockchip_hdmi_qp *hdmi = (struct rockchip_hdmi_qp *)data;
 	u32 val;
@@ -320,14 +334,22 @@ static void dw_hdmi_qp_rk3576_setup_hpd(struct dw_hdmi_qp *dw_hdmi, void *data)
 	       FIELD_PREP_WM16(RK3576_HDMI_HPD_INT_MSK, 0));
 
 	regmap_write(hdmi->regmap, RK3576_IOC_MISC_CON0, val);
-	regmap_write(hdmi->regmap, 0xa404, 0xffff0102);
+}
+
+static void dw_hdmi_qp_rk3576_disable_hpd(struct dw_hdmi_qp *dw_hdmi, void *data)
+{
+	struct rockchip_hdmi_qp *hdmi = (struct rockchip_hdmi_qp *)data;
+
+	regmap_write(hdmi->regmap, RK3576_IOC_MISC_CON0,
+		     FIELD_PREP_WM16(RK3576_HDMI_HPD_INT_MSK, 1));
 }
 
 static const struct dw_hdmi_qp_phy_ops rk3576_hdmi_phy_ops = {
 	.init		= dw_hdmi_qp_rk3588_phy_init,
 	.disable	= dw_hdmi_qp_rk3588_phy_disable,
 	.read_hpd	= dw_hdmi_qp_rk3576_read_hpd,
-	.setup_hpd	= dw_hdmi_qp_rk3576_setup_hpd,
+	.enable_hpd	= dw_hdmi_qp_rk3576_enable_hpd,
+	.disable_hpd	= dw_hdmi_qp_rk3576_disable_hpd,
 };
 
 static void dw_hdmi_qp_rk3588_hpd_work(struct work_struct *work)
@@ -348,13 +370,12 @@ static void dw_hdmi_qp_rk3588_hpd_work(struct work_struct *work)
 static irqreturn_t dw_hdmi_qp_rk3576_hardirq(int irq, void *dev_id)
 {
 	struct rockchip_hdmi_qp *hdmi = dev_id;
-	u32 intr_stat, val;
+	u32 intr_stat;
 
 	regmap_read(hdmi->regmap, RK3576_IOC_HDMI_HPD_STATUS, &intr_stat);
-	if (intr_stat & RK3576_HDMI_OHPD_INT) {
-		val = FIELD_PREP_WM16(RK3576_HDMI_HPD_INT_MSK, 1);
 
-		regmap_write(hdmi->regmap, RK3576_IOC_MISC_CON0, val);
+	if (intr_stat & RK3576_HDMI_OHPD_INT) {
+		dw_hdmi_qp_rk3576_disable_hpd(NULL, hdmi);
 		return IRQ_WAKE_THREAD;
 	}
 
@@ -364,15 +385,11 @@ static irqreturn_t dw_hdmi_qp_rk3576_hardirq(int irq, void *dev_id)
 static irqreturn_t dw_hdmi_qp_rk3576_irq(int irq, void *dev_id)
 {
 	struct rockchip_hdmi_qp *hdmi = dev_id;
-	u32 val;
 
-	val = FIELD_PREP_WM16(RK3576_HDMI_HPD_INT_CLR, 1);
-	regmap_write(hdmi->regmap, RK3576_IOC_MISC_CON0, val);
 	mod_delayed_work(system_percpu_wq, &hdmi->hpd_work,
 			 msecs_to_jiffies(HOTPLUG_DEBOUNCE_MS));
 
-	val = FIELD_PREP_WM16(RK3576_HDMI_HPD_INT_MSK, 0);
-	regmap_write(hdmi->regmap, RK3576_IOC_MISC_CON0, val);
+	dw_hdmi_qp_rk3576_enable_hpd(NULL, hdmi);
 
 	return IRQ_HANDLED;
 }
@@ -380,18 +397,14 @@ static irqreturn_t dw_hdmi_qp_rk3576_irq(int irq, void *dev_id)
 static irqreturn_t dw_hdmi_qp_rk3588_hardirq(int irq, void *dev_id)
 {
 	struct rockchip_hdmi_qp *hdmi = dev_id;
-	u32 intr_stat, val;
+	u32 intr_stat;
 
 	regmap_read(hdmi->regmap, RK3588_GRF_SOC_STATUS1, &intr_stat);
 
 	intr_stat &= hdmi->port_id ? RK3588_HDMI1_OHPD_INT : RK3588_HDMI0_OHPD_INT;
 
 	if (intr_stat) {
-		if (hdmi->port_id)
-			val = FIELD_PREP_WM16(RK3588_HDMI1_HPD_INT_MSK, 1);
-		else
-			val = FIELD_PREP_WM16(RK3588_HDMI0_HPD_INT_MSK, 1);
-		regmap_write(hdmi->regmap, RK3588_GRF_SOC_CON2, val);
+		dw_hdmi_qp_rk3588_disable_hpd(NULL, hdmi);
 		return IRQ_WAKE_THREAD;
 	}
 
@@ -401,22 +414,11 @@ static irqreturn_t dw_hdmi_qp_rk3588_hardirq(int irq, void *dev_id)
 static irqreturn_t dw_hdmi_qp_rk3588_irq(int irq, void *dev_id)
 {
 	struct rockchip_hdmi_qp *hdmi = dev_id;
-	u32 val;
-
-	if (hdmi->port_id)
-		val = FIELD_PREP_WM16(RK3588_HDMI1_HPD_INT_CLR, 1);
-	else
-		val = FIELD_PREP_WM16(RK3588_HDMI0_HPD_INT_CLR, 1);
-	regmap_write(hdmi->regmap, RK3588_GRF_SOC_CON2, val);
 
 	mod_delayed_work(system_percpu_wq, &hdmi->hpd_work,
 			 msecs_to_jiffies(HOTPLUG_DEBOUNCE_MS));
 
-	if (hdmi->port_id)
-		val |= FIELD_PREP_WM16(RK3588_HDMI1_HPD_INT_MSK, 0);
-	else
-		val |= FIELD_PREP_WM16(RK3588_HDMI0_HPD_INT_MSK, 0);
-	regmap_write(hdmi->regmap, RK3588_GRF_SOC_CON2, val);
+	dw_hdmi_qp_rk3588_enable_hpd(NULL, hdmi);
 
 	return IRQ_HANDLED;
 }
@@ -429,11 +431,11 @@ static void dw_hdmi_qp_rk3576_io_init(struct rockchip_hdmi_qp *hdmi)
 	      FIELD_PREP_WM16(RK3576_SDAIN_MASK, 1) |
 	      FIELD_PREP_WM16(RK3576_HDMI_GRANT_SEL, 1) |
 	      FIELD_PREP_WM16(RK3576_I2S_SEL_MASK, 1);
-
 	regmap_write(hdmi->vo_regmap, RK3576_VO0_GRF_SOC_CON14, val);
 
-	val = FIELD_PREP_WM16(RK3576_HDMI_HPD_INT_MSK, 1);
-	regmap_write(hdmi->regmap, RK3576_IOC_MISC_CON0, val);
+	regmap_write(hdmi->regmap, 0xa404, 0xffff0102);
+
+	dw_hdmi_qp_rk3576_disable_hpd(NULL, hdmi);
 }
 
 static void dw_hdmi_qp_rk3588_io_init(struct rockchip_hdmi_qp *hdmi)
@@ -458,11 +460,7 @@ static void dw_hdmi_qp_rk3588_io_init(struct rockchip_hdmi_qp *hdmi)
 		val = FIELD_PREP_WM16(RK3588_HDMI0_GRANT_SEL, 1);
 	regmap_write(hdmi->vo_regmap, RK3588_GRF_VO1_CON9, val);
 
-	if (hdmi->port_id)
-		val = FIELD_PREP_WM16(RK3588_HDMI1_HPD_INT_MSK, 1);
-	else
-		val = FIELD_PREP_WM16(RK3588_HDMI0_HPD_INT_MSK, 1);
-	regmap_write(hdmi->regmap, RK3588_GRF_SOC_CON2, val);
+	dw_hdmi_qp_rk3588_disable_hpd(NULL, hdmi);
 }
 
 static void dw_hdmi_qp_rk3576_enc_init(struct rockchip_hdmi_qp *hdmi,

-- 
2.55.0


