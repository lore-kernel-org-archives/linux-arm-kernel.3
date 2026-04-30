Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBDAECD3426
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 22:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ds0Vi4PTi7Vuh8GIjXvQDRZONa5mc8E0nDusKKne/6U=; b=l4FvtFHiVEPDcEoChlVY8FYvJ+
	WyimxRizinuqQpuuFfyIOxe2Skpf88DdIo5EwAX8qqpAwu49853jyibIEX2cC4m27pBKDhxS8nzPT
	4LPeZO4+Yqj9mUkoD7n0iuNGhlkeH5DtgIC+7hPr57mgu1InE50+eCqZRxQY7TDOQgi88TxTkg7EY
	sBytBGH4q1qiBBdsmK7CoMn5qar/WiLGhnEt/Tts+UP0yiKAS8hkjw7YKGvhjO+W0HfcRUh4QrhdL
	0cCDZw8FtwsnxsyKX4w/g9e/+0nK8XwqO2hRkiQBgJqYGUipqdyXFg9mvJ6hOVq/4IXecd3zWA4jD
	AXiKYh5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIZki-000000062EZ-0NT5;
	Thu, 30 Apr 2026 22:21:00 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIZkS-0000000621r-2LRB;
	Thu, 30 Apr 2026 22:20:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777587637;
	bh=KldQJCCytI0EOfv1u6SZhFGOllIGEwoVUPG9lE2ZVeQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Kb+xh3jicDUjQZ8W+iM69FXXFRoRN+CFBp62jfJzmfXWrjUHlYd50eiQSin/F9ULB
	 M3Ez9zwT7855X8iVpgbZZxVsJ1RdZgOwMDmCmgBUqwvbBDrzjQPnR+EgIz4ClXf8zl
	 g+5y7WhwIddE8p27WNDcfckiPiLXQLO8XqovSorBRozn88RJRHF8e6Sz/0GxKD34qN
	 VoHQQg2gqhLmt3DmSIiMRMIiKy1sSyg/ifIKnuPiKdS34+a/xa9ttwFk8bO7NKFjg7
	 bi/O/cSJNbus8FzYLYm/31dn23JlpWpiFk3C5zvgpp63KwUrTtfyxS5mNm0tbpjyYi
	 Wt2KMNVuwSctA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BD27917E1584;
	Fri,  1 May 2026 00:20:37 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 1A618480048; Fri, 01 May 2026 00:20:37 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 01 May 2026 00:20:35 +0200
Subject: [PATCH v2 08/12] drm/bridge: synopsys: dw-dp: Support software
 triggered OOB HPD
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-synopsys-dw-dp-improvements-v2-8-d7e7f6bac77f@collabora.com>
References: <20260501-synopsys-dw-dp-improvements-v2-0-d7e7f6bac77f@collabora.com>
In-Reply-To: <20260501-synopsys-dw-dp-improvements-v2-0-d7e7f6bac77f@collabora.com>
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
 Alexey Charkov <alchark@gmail.com>, dri-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@collabora.com, 
 linux-arm-kernel@lists.infradead.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3782;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=KldQJCCytI0EOfv1u6SZhFGOllIGEwoVUPG9lE2ZVeQ=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGnz1bSYLPjKfe+DkHH3iJ8mNyF4LF/K4ea8o
 VTwmsIMUSzlUokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJp89W0AAoJENju1/PI
 O/qaOe4P/2uhAvGcpzInrYV9+iXJXu5HJQKW5TyvK8kzl5L+iOm+fLiC1tWijU1oEcWJpCwuM88
 kDvBCyPg3hojTGx/wCv2884JPOoqhVVJSihzT7KG2K36pHWAK1GfPQWGP2py4wwYRg9TH2b2zaT
 0NGsL04DmIOz4llF/1qTAgRkIOXj0uV6Y4ADhPSDmwoBzhcjWX0C6Nyh/F7kVBUyVnqTf+NtivM
 imV04L47o3ZxQzdjKFrSdZHJbTwcme67QwAiPdmIZaY0aOgRPjB9yOWPotjWNmAQZrZ3Fix+9Of
 L9gW/ShX8QMbVXUXmgncd4y06dPKILmwjCw78rz2ubJ75wmPc3mSBKSdMVB9kPB37l/Sd93Y2UT
 mwaNIlQBzGJWFrKVLIDshEfCZjLZj4zUXlE4M7DOTG2Z7dbxyVUNhD6rXEY7jDsNt+3dFRnb5o9
 //Ktd/5XoW+rvvbf6n/0Bo1W0mc7Pfbfw27OevtpMPJkQ/FwnHJB+qldlPtq7yZNRGQZK0K/38M
 Yfhs/iw/CZkj9nvqVhUArfxmo0WrrwHjjR8Ov3WbQAOTdjUe7gvis8lvMtsTX2AjOdnsZx1mPXP
 koBdemI+56V9zAE5o9dxLBkUpN5a3KRpmJeobE4RhQDoenH1AkaJ68MnJTFU/3mscm+89gN5CLb
 0maiahiLzbKsyDbQh8SE6HA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_152044_763306_2FDD12F7 
X-CRM114-Status: GOOD (  16.91  )
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
 drivers/gpu/drm/bridge/synopsys/dw-dp.c | 38 ++++++++++++++++++++++++++++++++-
 include/drm/bridge/dw_dp.h              |  3 +++
 2 files changed, 40 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
index ccc55e40e81c..7ade88f74466 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -1817,6 +1817,19 @@ static struct drm_bridge_state *dw_dp_bridge_atomic_duplicate_state(struct drm_b
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
@@ -1829,6 +1842,7 @@ static const struct drm_bridge_funcs dw_dp_bridge_funcs = {
 	.atomic_disable = dw_dp_bridge_atomic_disable,
 	.detect = dw_dp_bridge_detect,
 	.edid_read = dw_dp_bridge_edid_read,
+	.oob_notify = dw_dp_bridge_oob_notify,
 };
 
 static int dw_dp_link_retrain(struct dw_dp *dp)
@@ -1965,6 +1979,19 @@ static void dw_dp_phy_exit(void *data)
 	phy_exit(dp->phy);
 }
 
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
 struct dw_dp *dw_dp_bind(struct device *dev, struct drm_encoder *encoder,
 			 const struct dw_dp_plat_data *plat_data)
 {
@@ -1980,7 +2007,9 @@ struct dw_dp *dw_dp_bind(struct device *dev, struct drm_encoder *encoder,
 
 	dp->dev = dev;
 	dp->pixel_mode = plat_data->pixel_mode;
-
+	dp->plat_data.hpd_sw_sel = plat_data->hpd_sw_sel;
+	dp->plat_data.hpd_sw_cfg = plat_data->hpd_sw_cfg;
+	dp->plat_data.data = plat_data->data;
 	dp->plat_data.max_link_rate = plat_data->max_link_rate;
 	bridge = &dp->bridge;
 	mutex_init(&dp->irq_lock);
@@ -2078,6 +2107,13 @@ struct dw_dp *dw_dp_bind(struct device *dev, struct drm_encoder *encoder,
 		goto unregister_aux;
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
diff --git a/include/drm/bridge/dw_dp.h b/include/drm/bridge/dw_dp.h
index 22105c3e8e4d..2127afa26b2c 100644
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
 
 struct dw_dp *dw_dp_bind(struct device *dev, struct drm_encoder *encoder,

-- 
2.53.0


