Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C653C54F5D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 17:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/8S63x2R4lPZU8hxn8S26/YRvUcDLG7h7gxcYC4QQ0s=; b=0sCChtMABP6oIPegq0eVaBMCtB
	Xep3FNWTBt18cuV6DPxFTebWapENN/WGp7uZ7lLlAn3gzhPygKuofEwaxXu/ozsT4gYJ8wX3WZe5K
	nd22E08UwEwbX+EV5GXr3rg3BK890yniovivb30crgeqfNVQ6/ZgbMYeLCMrrJ5NBLwb1Z0HgLNAE
	OfyM5scRMwRqUkugfH1fyIwYwVIS4ybCF2uZrRW3c6LXQMREj0QNrl4cZ5oQpBZi1z8BxP4DK7l6e
	AGNcPGqawGpULSOTKug7nsqOStYC54n5Biigqs47faPHTJmCtCmRXK7drYYrvDENe6UrsGx7j9T2m
	G+0gl8tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wolnu-00000005zQt-3oeS;
	Tue, 28 Jul 2026 17:41:22 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wolnR-00000005z2k-49QQ;
	Tue, 28 Jul 2026 17:40:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785260446;
	bh=52cVYZKJL8pFg8EqIp7KJVygDv198u5nbIuiljjR+48=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Jo/mHEzw1mvPZBT51/V0UrlR4MbY2lAc006k1RyCH6dtmA9tI9FB7Sv9IIo2e0twC
	 daINQ3IHoMhxWzHTiD6QuFsppjddVLMqYAX53Zr1mHyoaYWv3tMgeNyd2iH3KNIj9u
	 tmQP3yZJ+khsXZTY7JWbO4t+5Xc1zBiHGq8mrlza84RgfmMcWcljMdIawPAfV1lJmT
	 wKuR22SdpzqIMPhIWNjVU6iVgHjixyEMzK4gkoJniLfvczum4UUviby1eOLk7HqhM0
	 n3oBq5pGvIbh02hcJgH+V1KCm+CNBIg248MY28mMODnN72i8kMR0vXpnsC63SgvdzQ
	 mJIyMYORaj/yw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BD5F817E075D;
	Tue, 28 Jul 2026 19:40:46 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 181EF48002B; Tue, 28 Jul 2026 19:40:46 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 28 Jul 2026 19:40:46 +0200
Subject: [PATCH v7 10/18] drm/bridge: synopsys: dw-dp: Support software
 triggered OOB HPD
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-synopsys-dw-dp-improvements-v7-10-b7640fa8cf48@collabora.com>
References: <20260728-synopsys-dw-dp-improvements-v7-0-b7640fa8cf48@collabora.com>
In-Reply-To: <20260728-synopsys-dw-dp-improvements-v7-0-b7640fa8cf48@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 Damon Ding <damon.ding@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Alexey Charkov <alchark@flipper.net>, dri-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@collabora.com, 
 linux-arm-kernel@lists.infradead.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3736;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=52cVYZKJL8pFg8EqIp7KJVygDv198u5nbIuiljjR+48=;
 b=kA0DAAoB2O7X88g7+poByyZiAGpo6Z2hN9vVs5czYRPsvXcBD/9DHxIQRYb9uimfEfge6NQge
 YkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqaOmdAAoJENju1/PIO/qai5QP/iQY
 ftE+bsQZygH98NNzHcdnaK5h4EYZOBLJDZuAyP1VVd3zZNB8XXbA8jbRzlT++UMT4UEdlGK0f6r
 /tc9Rvc3AAonr0FNwdzmN13qLTIN/nEJX2NvxsRrf7LeyPO79tQuhgMs46rbDknJlPAb0k49567
 ldMboeCaTawDUQDFY+fEX6vSdVijp2LF/9tYHrNZ5yHsT3DoOFJkoDYtA4abG7sBFLfVzqUxQF3
 Nrdk0mjA8mKscuYHrRICw6uwWkPXjIklz8WZcD8gn5qjvrRjuHf1U/dP3VYcuhMqg3pHDAGqNel
 Y2txqgl70oT/XZ6r7L2CICWDbkkHy25NrOtiQ+ekEjc4f0xQB1AVDCqusmP6gMwQaz4sMuKSrKq
 agFSwCPi4Iknm8/qpn3lcXHVFnGSlbIKCADTx/v+nZqpKN4reE2M1tQdVx9kiFKPG8dWgyDDbOR
 Tavvdg30410/FO5WczF7Yt0nnejwT00raijCnF/qvXKlYzNGJmowVyRoPeeT28U7ZiL0nyqhHdp
 UY2ZQBwIRpt1nR4Nq0/pWLzwDsqUaPVTAg6LydbFaKkcCPqUFK173L5SprlHl05wnG7r87JXHLC
 tOQD5XoRBAbd4eqm2clb0SHoozvjK02YcWKG3WyKv1Z0qY8AsEIduWouMc43BLwWUgjPfH09iml
 u3il4
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_104054_190106_DCD8423E 
X-CRM114-Status: GOOD (  15.75  )
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

Add support for USB-C DP AltMode out-of-band hotplug handling. The
handling itself is implemented in the platform specific driver as the
registers to force HPD state are not part of the Designware DisplayPort
IP itself. Instead the platform integration might provide the necessary
functionality to mux the HPD signal.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-dp.c | 38 +++++++++++++++++++++++++++++++++
 include/drm/bridge/dw_dp.h              |  3 +++
 2 files changed, 41 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
index 719f22578ed6..d4f75b7f85d0 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -1857,6 +1857,19 @@ static struct drm_bridge_state *dw_dp_bridge_atomic_duplicate_state(struct drm_b
 	return &state->base;
 }
 
+static void dw_dp_bridge_oob_notify(struct drm_bridge *bridge,
+				    struct drm_connector *connector,
+				    enum drm_connector_status status)
+{
+	bool hpd_high = status != connector_status_disconnected;
+	struct dw_dp *dp = bridge_to_dp(bridge);
+
+	if (dp->plat_data.hpd_sw_cfg)
+		dp->plat_data.hpd_sw_cfg(dp->plat_data.data, hpd_high);
+	else
+		dev_err_once(dp->dev, "Missing platform handler for OOB HPD handling\n");
+}
+
 static const struct drm_bridge_funcs dw_dp_bridge_funcs = {
 	.atomic_duplicate_state = dw_dp_bridge_atomic_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
@@ -1869,6 +1882,7 @@ static const struct drm_bridge_funcs dw_dp_bridge_funcs = {
 	.atomic_disable = dw_dp_bridge_atomic_disable,
 	.detect = dw_dp_bridge_detect,
 	.edid_read = dw_dp_bridge_edid_read,
+	.oob_notify = dw_dp_bridge_oob_notify,
 };
 
 static int dw_dp_link_retrain(struct dw_dp *dp)
@@ -1998,6 +2012,19 @@ static const struct regmap_config dw_dp_regmap_config = {
 	.rd_table = &dw_dp_readable_table,
 };
 
+static bool dw_dp_is_routed_to_usb_c(struct drm_encoder *encoder)
+{
+	struct drm_bridge *last_bridge __free(drm_bridge_put) = NULL;
+	struct fwnode_handle *fwnode;
+
+	last_bridge = drm_bridge_chain_get_last_bridge(encoder);
+	if (!last_bridge)
+		return false;
+
+	fwnode = of_fwnode_handle(last_bridge->of_node);
+	return fwnode_device_is_compatible(fwnode, "usb-c-connector");
+}
+
 int dw_dp_bind(struct dw_dp *dp, struct drm_encoder *encoder)
 {
 	struct device *dev = dp->dev;
@@ -2032,6 +2059,13 @@ int dw_dp_bind(struct dw_dp *dp, struct drm_encoder *encoder)
 		goto put_next_bridge;
 	}
 
+	if (dw_dp_is_routed_to_usb_c(encoder)) {
+		dev_dbg(dev, "USB-C mode\n");
+
+		if (dp->plat_data.hpd_sw_sel)
+			dp->plat_data.hpd_sw_sel(dp->plat_data.data, 1);
+	}
+
 	dw_dp_init_hw(dp);
 
 	ret = phy_init(dp->phy);
@@ -2078,6 +2112,10 @@ struct dw_dp *dw_dp_probe(struct platform_device *pdev, const struct dw_dp_plat_
 
 	dp->dev = dev;
 	dp->pixel_mode = plat_data->pixel_mode;
+
+	dp->plat_data.hpd_sw_sel = plat_data->hpd_sw_sel;
+	dp->plat_data.hpd_sw_cfg = plat_data->hpd_sw_cfg;
+	dp->plat_data.data = plat_data->data;
 	dp->plat_data.max_link_rate = plat_data->max_link_rate;
 
 	bridge = &dp->bridge;
diff --git a/include/drm/bridge/dw_dp.h b/include/drm/bridge/dw_dp.h
index a82412a9e769..79b2cdf0df99 100644
--- a/include/drm/bridge/dw_dp.h
+++ b/include/drm/bridge/dw_dp.h
@@ -20,6 +20,9 @@ enum {
 struct dw_dp_plat_data {
 	u32 max_link_rate;
 	u8 pixel_mode;
+	void *data;
+	void (*hpd_sw_sel)(void *data, bool hpd);
+	void (*hpd_sw_cfg)(void *data, bool hpd);
 };
 
 int dw_dp_bind(struct dw_dp *dp, struct drm_encoder *encoder);

-- 
2.53.0


