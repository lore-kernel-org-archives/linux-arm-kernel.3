Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B89F4CD13D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 22:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8u/sZ8x0J2Lh4aK6hTajZmRohv/DhLd0frggnYqSnFc=; b=eXEZqyUDhUfDQlGfY+meN5Yqd2
	XvAecU/zzTPNJ1fiUWl27V6pIZwOHGWZ4WjIyG/EHUdT2Y2iDJn9hA0mffqdtvHNwIXcIAdH9Mmik
	SaLsebXUFj/RQKW49oLuvlkqXvvniUz5djjWQwld24sBmC2ucXqXhZfbDYiHZxmHj+GDi4p3X7m8O
	ZsMPvfKE0B0KA/BRoTcZOyD7nEMHc2cknic5vfKL4z4OlKqY1EZU1sZSFrSRWDX4ngSRjhY9Zee5r
	o8ighMv/sL1k3ryq6+/Z0biDCPCm3J3nVSJLobLVdNCRoy8sDNFrhIFh5+OKX85LoyHyg7z4fUNwb
	KfIoUg7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIZkn-000000062Ob-02cu;
	Thu, 30 Apr 2026 22:21:05 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIZkT-0000000622I-3j1F;
	Thu, 30 Apr 2026 22:20:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777587638;
	bh=UpJydPSEIZYrzoOTiPVegXJbyb0WiNsGK55Z3gP9UGo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nsoZA4SWkBwmFZlor3WnB+VOkYO+7bH5BWzl1KtpCBmT5PaIx/Rh5HQZoobGwtahE
	 i/dIVC1yyDV12GD8DIJACfV+6yBLWJFTqKqdLMyRhNdN95I089w4QZ4R00npImP5TE
	 /1pv4fsnwyrqD3PPgcHfmrUujixypk4hQL3kb0H8r8pPFNz6v7vmdYu+utEpa5+9p2
	 6gAwWFWQvQfhDqMYQgOdlfYABtnbu+M7mzkdQdpfcJGkRpKPnE1+5vSsgXFUnKhkev
	 oCVo9oyWEh6dqgSPPr12iWw5DFINzBgDP/zoXlkMh7TLzearI/8yJP5xUX7XA4f4lM
	 RGHDjshMx0iXA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C7D6217E15A3;
	Fri,  1 May 2026 00:20:37 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 1BE5848004C; Fri, 01 May 2026 00:20:37 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 01 May 2026 00:20:36 +0200
Subject: [PATCH v2 09/12] drm/bridge: synopsys: dw-dp: Add Runtime PM
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-synopsys-dw-dp-improvements-v2-9-d7e7f6bac77f@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3017;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=UpJydPSEIZYrzoOTiPVegXJbyb0WiNsGK55Z3gP9UGo=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGnz1bTqRZJwgtWYJFBE4wqKXqkBQH6tl6/E8
 5y/xYq4t8knqokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJp89W0AAoJENju1/PI
 O/qaMxkP+weNMRsakT0uthrf3vnQYAuSNH1/0DYSbODzSFWJhx9CIWcB26Ctxq0Osz8n8t5meYV
 7qw2AetPEeFV0+INaF8Q/kn4BGIGapY7BcJ1w+miJUozvvEYJGiTMgPXtWdPpnffBxbHk2MOVPy
 kd2cU8T1JO2jrbxhO38O43zJSBQGBv5BNUC12lPtTd9NWRcTHJiB0TSpTDCQ9UCbvcPbLXGcCrv
 a69zymYAToT4ehmWKDbJATmMMOe+vxo075QUxBmYcQlt+Y3xaEM3uRawbw6e4p6Y0bSKwZIHdnL
 pPfwmDOBzPplZyLaFHOAUxGcnUfkGua1Ta4a1chLzvUmJyW3OJRYcK9d5R4onBGwz44K7gBsUpr
 ZPAtXmHhExmouO0u+FoFDgi01xR33ZvCmHchFYhtXJiGJwoSov6h8Kyo8+t+L6+4gUJEXr2L3bJ
 bbeNqhP6fCxpkixrMXo4tLE2QBDpd9gpvWBztDvytPiLqrPjdSj/CKj5TjtuqUJNuoUKYPnsluT
 hhp3Bh0Kp8TG1RIuwPHcNiIZZtu/2taqZn4nCCvHPqX65iVOYUQ5xJ+K0TC/7cjCTs4lMX2PIeN
 z5z6WGprkHDZ2+21EmM6IvpAzENOGhipjrM6b+Qb6ClE4Pde4IVrQHncSJuYQxPHYtKSDL279PE
 zEM0sFmLciQJhMtvh8XMw6A==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_152046_349443_228CB4EF 
X-CRM114-Status: GOOD (  14.18  )
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

Add runtime PM stubs to the Synopsys DesignWare DisplayPort bridge
driver. Support is not enabled automatically and must be hooked up
in the vendor specific glue code.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-dp.c | 27 +++++++++++++++++++++++++++
 include/drm/bridge/dw_dp.h              |  3 +++
 2 files changed, 30 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
index 7ade88f74466..b0ab2b3d478d 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -1465,6 +1465,8 @@ static ssize_t dw_dp_aux_transfer(struct drm_dp_aux *aux,
 	if (WARN_ON(msg->size > 16))
 		return -E2BIG;
 
+	ACQUIRE(pm_runtime_active_auto, pm)(dp->dev);
+
 	switch (msg->request & ~DP_AUX_I2C_MOT) {
 	case DP_AUX_NATIVE_WRITE:
 	case DP_AUX_I2C_WRITE:
@@ -1655,6 +1657,8 @@ static void dw_dp_bridge_atomic_enable(struct drm_bridge *bridge,
 	struct drm_connector_state *conn_state;
 	int ret;
 
+	pm_runtime_get_sync(dp->dev);
+
 	connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
 	if (!connector) {
 		dev_err(dp->dev, "failed to get connector\n");
@@ -1709,6 +1713,7 @@ static void dw_dp_bridge_atomic_disable(struct drm_bridge *bridge,
 	dw_dp_link_disable(dp);
 	bitmap_zero(dp->sdp_reg_bank, SDP_REG_BANK_SIZE);
 	dw_dp_reset(dp);
+	pm_runtime_put_autosuspend(dp->dev);
 }
 
 static bool dw_dp_hpd_detect_link(struct dw_dp *dp, struct drm_connector *connector)
@@ -1729,6 +1734,8 @@ static enum drm_connector_status dw_dp_bridge_detect(struct drm_bridge *bridge,
 {
 	struct dw_dp *dp = bridge_to_dp(bridge);
 
+	ACQUIRE(pm_runtime_active_auto, pm)(dp->dev);
+
 	if (!dw_dp_hpd_detect(dp))
 		return connector_status_disconnected;
 
@@ -2153,6 +2160,26 @@ void dw_dp_unbind(struct dw_dp *dp)
 }
 EXPORT_SYMBOL_GPL(dw_dp_unbind);
 
+int dw_dp_runtime_suspend(struct dw_dp *dp)
+{
+	clk_disable_unprepare(dp->aux_clk);
+	clk_disable_unprepare(dp->apb_clk);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(dw_dp_runtime_suspend);
+
+int dw_dp_runtime_resume(struct dw_dp *dp)
+{
+	clk_prepare_enable(dp->apb_clk);
+	clk_prepare_enable(dp->aux_clk);
+
+	dw_dp_init_hw(dp);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(dw_dp_runtime_resume);
+
 MODULE_AUTHOR("Andy Yan <andyshrk@163.com>");
 MODULE_DESCRIPTION("DW DP Core Library");
 MODULE_LICENSE("GPL");
diff --git a/include/drm/bridge/dw_dp.h b/include/drm/bridge/dw_dp.h
index 2127afa26b2c..3037e0290861 100644
--- a/include/drm/bridge/dw_dp.h
+++ b/include/drm/bridge/dw_dp.h
@@ -28,4 +28,7 @@ struct dw_dp_plat_data {
 struct dw_dp *dw_dp_bind(struct device *dev, struct drm_encoder *encoder,
 			 const struct dw_dp_plat_data *plat_data);
 void dw_dp_unbind(struct dw_dp *dp);
+
+int dw_dp_runtime_suspend(struct dw_dp *dp);
+int dw_dp_runtime_resume(struct dw_dp *dp);
 #endif /* __DW_DP__ */

-- 
2.53.0


