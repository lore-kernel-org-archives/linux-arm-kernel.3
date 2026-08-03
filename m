Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C70CC56204
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 18:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ghp7IlgSGAkktmWG76+/KYRDjfh2JesOk9n1fGTlGp8=; b=GtoCM9F7ZwGPfbUlkuOFo28/xh
	c0Bfl/MCfC57N4laB6cDXHqf0FKkaJVeUF5iWkyu/3+q7uvu2QoKllVwJKrsqTbmTzPW0R1QNWo6Y
	pyThQENyZF+b/4OReOkOVNCcXj2qeUYgRZynILGTd/cig3OSMkqh3367IzjW0vr7PK5CH7nY2dt82
	vEfmE7+/dn7vEQZBe5REJYNXuY2i4BRW5xgncF9LTl5TmvkSKBmL2yehMA5mO0+D+CtPkVDjjluyb
	H2Bc/UkjHPOgiepjVVGdP7Kdcrn4JnPUsVZbwXkKenwxYjiTECJ2gZKsR6dSzXlui++Ti7pyrwh05
	2nSZw6NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqx2F-00000000Hyw-25yu;
	Mon, 03 Aug 2026 18:05:11 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqx2B-00000000Hw5-3VNQ;
	Mon, 03 Aug 2026 18:05:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785780303;
	bh=T9YLXYV9yscTLz/3RQjqOP1ZHffRl5hykzJn/q2OMQQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UaeMKjjpvsbB+MglPm9psjHNT7kEOg880PmrCBE1lnlCbiab1gWTsKi+4EA60ir6w
	 DmElKuWM01ZIkHuaQqTniMoc5EYopp06wtci/l6HsX1bjnl3oRHNFQtj+MqA2b4rCC
	 yryBItRhq95Tl3I+FTocPCkfkZN6EXxkBK0K5kA6P3SspScfxEVI/kCq5G+8s7dNfs
	 rCSoOKTzdyrXzVqxenwI9wrSfwCfOGBsl5ldVOuLJ34wpMGckOFg7xF2L1LXmZfa4C
	 wp0HwSD8Y6IhD4Z7fe9hDiZpprugyMszWwUXz5X/ssohBVyJo3Q1Dgz0xSSdVPNGvP
	 Hl2rF6siB2Syw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BBC4317E0FCF;
	Mon, 03 Aug 2026 20:05:03 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 6218E480028; Mon, 03 Aug 2026 20:05:03 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Mon, 03 Aug 2026 20:05:02 +0200
Subject: [PATCH v9 01/22] drm/bridge: synopsys: dw-dp: Register DP AUX on
 bridge attach
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-synopsys-dw-dp-improvements-v9-1-2e6e46135312@collabora.com>
References: <20260803-synopsys-dw-dp-improvements-v9-0-2e6e46135312@collabora.com>
In-Reply-To: <20260803-synopsys-dw-dp-improvements-v9-0-2e6e46135312@collabora.com>
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
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 Damon Ding <damon.ding@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Alexey Charkov <alchark@flipper.net>, dri-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@collabora.com, 
 linux-arm-kernel@lists.infradead.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3652;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=T9YLXYV9yscTLz/3RQjqOP1ZHffRl5hykzJn/q2OMQQ=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpw2E7OcysV0axgOUxitewZ83rSYK7f/9/SP
 cOhmsIGjQOxpYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqcNhOAAoJENju1/PI
 O/qaQUsP/1Pz+EdyzwF/+ss11FcXAATWNc4fjKH3boYBwy+X0/pJ1uDAZFmVc66fjrym9ttdoSC
 7frbIZ9UTwwIQAENot0DGmaCIuZFfNe6gz9jnLA0ZzsoiijGvcTgC372HthbVxBmX10EwaBtpSA
 VxbsQrO/7XJf6EmucLLU8VtlTCUmWobJC4GKDGiZOkDLPqfJaUGyI7mLd2ipAJPh+DisYxQOt63
 WYUjTQgwhjRC1knbTCgXq2bNnQdSFRJGKzwBNqu5IFRxXPc9LS1NjNSqRPYllaQsZUkADvGI/30
 I1M6PxVhwoMC9fiUjqw4tigigdWKMRUlriSefKNbvO5LYkjQJatyRsm9Q6m6vhvByjF2PrqtfFL
 dUBjvzFIXFyCdKr1vL3qrFdiUCRKrT10+iA84J1FOqz21BYuHM54kUsKOwJxMyAcBMvLrG14jeH
 L2/2zOrJcrr4+EYfu4VfevYrpN4wCdkd73+oi7obO8kGwyB1JjHM2r5DVFpdo5IQPe95VmLQXbz
 cEKtoioxwwPIs6jn53cL1NL8FfQqM8RVZg9wpA3Sg+JpQxnifnJnkoUxrk0PGW/bbQbA2SGtXnc
 c/ZKNVZ2Q6ZPRifv/V6UUS+izPrBHtlwfTnj32mYKIdpq50ZLixvIADpCTw11PTBSHuxVsEubgq
 DvsV8uiNoe+uzrZssnV8pWg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_110508_037687_F1D52DE1 
X-CRM114-Status: GOOD (  16.63  )
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

Unregister the DP AUX device at the right spot as documented in the
drm_dp_aux_register() function description. This helps that it is
only accessed when the DRM device is ready and the bridge is powered
and initialized (further fixes are required for that).

Fixes: 86eecc3a9c2e ("drm/bridge: synopsys: Add DW DPTX Controller support library")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-dp.c | 55 +++++++++++++++++++++------------
 1 file changed, 35 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
index 3445c82e6f50..112a49911309 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -1813,7 +1813,36 @@ static struct drm_bridge_state *dw_dp_bridge_atomic_duplicate_state(struct drm_b
 	return &state->base;
 }
 
+static int dw_dp_bridge_attach(struct drm_bridge *bridge,
+			       struct drm_encoder *encoder,
+			       enum drm_bridge_attach_flags flags)
+{
+	struct dw_dp *dp = bridge_to_dp(bridge);
+	struct device *dev = dp->dev;
+	int ret;
+
+	dp->aux.dev = dev;
+	dp->aux.drm_dev = encoder->dev;
+	dp->aux.name = dev_name(dev);
+	dp->aux.transfer = dw_dp_aux_transfer;
+
+	ret = drm_dp_aux_register(&dp->aux);
+	if (ret)
+		dev_err(dev, "Aux register failed: %d\n", ret);
+
+	return ret;
+}
+
+static void dw_dp_bridge_detach(struct drm_bridge *bridge)
+{
+	struct dw_dp *dp = bridge_to_dp(bridge);
+
+	drm_dp_aux_unregister(&dp->aux);
+}
+
 static const struct drm_bridge_funcs dw_dp_bridge_funcs = {
+	.attach = dw_dp_bridge_attach,
+	.detach = dw_dp_bridge_detach,
 	.atomic_duplicate_state = dw_dp_bridge_atomic_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
 	.atomic_create_state = drm_atomic_helper_bridge_create_state,
@@ -2044,20 +2073,10 @@ struct dw_dp *dw_dp_bind(struct device *dev, struct drm_encoder *encoder,
 	if (ret)
 		return ERR_PTR(ret);
 
-	dp->aux.dev = dev;
-	dp->aux.drm_dev = encoder->dev;
-	dp->aux.name = dev_name(dev);
-	dp->aux.transfer = dw_dp_aux_transfer;
-	ret = drm_dp_aux_register(&dp->aux);
-	if (ret) {
-		dev_err_probe(dev, ret, "Aux register failed\n");
-		return ERR_PTR(ret);
-	}
-
 	ret = drm_bridge_attach(encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 	if (ret) {
 		dev_err_probe(dev, ret, "Failed to attach bridge\n");
-		goto unregister_aux;
+		return ERR_PTR(ret);
 	}
 
 	dw_dp_init_hw(dp);
@@ -2065,37 +2084,33 @@ struct dw_dp *dw_dp_bind(struct device *dev, struct drm_encoder *encoder,
 	ret = phy_init(dp->phy);
 	if (ret) {
 		dev_err_probe(dev, ret, "phy init failed\n");
-		goto unregister_aux;
+		return ERR_PTR(ret);
 	}
 
 	ret = devm_add_action_or_reset(dev, dw_dp_phy_exit, dp);
 	if (ret)
-		goto unregister_aux;
+		return ERR_PTR(ret);
 
 	dp->irq = platform_get_irq(pdev, 0);
 	if (dp->irq < 0) {
 		ret = dp->irq;
-		goto unregister_aux;
+		return ERR_PTR(ret);
 	}
 
 	ret = devm_request_threaded_irq(dev, dp->irq, NULL, dw_dp_irq,
 					IRQF_ONESHOT, dev_name(dev), dp);
 	if (ret) {
 		dev_err_probe(dev, ret, "failed to request irq\n");
-		goto unregister_aux;
+		return ERR_PTR(ret);
 	}
 
 	return dp;
-
-unregister_aux:
-	drm_dp_aux_unregister(&dp->aux);
-	return ERR_PTR(ret);
 }
 EXPORT_SYMBOL_GPL(dw_dp_bind);
 
 void dw_dp_unbind(struct dw_dp *dp)
 {
-	drm_dp_aux_unregister(&dp->aux);
+	/* nothing to do */
 }
 EXPORT_SYMBOL_GPL(dw_dp_unbind);
 

-- 
2.53.0


