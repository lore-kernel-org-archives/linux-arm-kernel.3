Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AFE2C982C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 13:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MD4jPpx6j1WYD4nbW7d8UqWXM8K9b2WkM/tu92eB2HU=; b=XTgKvtC/0tqinEwzjrdb4/qIs5
	BfXY6O5RtmNk8X7GYPzVXW/Ul7Z7h2R/sgPVfrYVAWdrJ2mlSLrPxZLDpx77FpR1N3x7CIN6QKEBn
	DU3SUlCLQ++w14mxXEl6PJRLuodN793OHNRtca/KJb44fYpC9AsQeiNB+aWvn1cRD4aQ+Mbl4sOjH
	PayCMpSSqtwneHu1AL9Ga4YY6NV5IzdpNhGA4RJCAJyA4EYzh3cokfWmBQHacUpf8fryIioDkgAnU
	Ucj3YQnWDADtrZtAc+tX4DE8nk3Ht/ir787kNRDTUl8JlPgfAF4fs4tBwLiN5EWa8PcWDlvLGO3tU
	ec8WxyFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6q0G-00000009KWJ-3nzM;
	Wed, 16 Sep 2026 13:48:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6q00-00000009KIH-2YO2;
	Wed, 16 Sep 2026 13:48:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=MD4jPpx6j1WYD4nbW7d8UqWXM8K9b2WkM/tu92eB2HU=; b=gx5KhnHo2TdghbwQnDVq/lN28p
	7XpHyOwqOysRtu1wmOleLDRc0TH3e/y04kWL3GEXwVUAVZzrqwIx+9c62uK/m0zC5LFL5LlBrDoXv
	NXUmEPsBR8PKlm/dgyJAQdoVp37TUzz59W+oQQy6cGfqiQw4owgihRTormYD5znqe46gwblqkbOa9
	2+77Q51UTKRAbJFne5hne5uqOm2k0FIAW+zAsTiP0vYSBPzf3R3HLaWv9ZmbvKTu/QORFMckuA7Lk
	JvlXM+8UTrILSZPcOOBcaXNxDx9Cx8lKbGLpWme2xUu+UqDmnqa43XpkIsKi89AL7A7AwhQHMtZr4
	Qxu7HpgA==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6pzx-00000007wIM-2f8L;
	Wed, 16 Sep 2026 13:48:31 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E308DC5CD60;
	Wed, 16 Sep 2026 13:49:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E9E0B60337;
	Wed, 16 Sep 2026 13:48:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4B60B11C7B031;
	Wed, 16 Sep 2026 15:48:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789566501; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=MD4jPpx6j1WYD4nbW7d8UqWXM8K9b2WkM/tu92eB2HU=;
	b=lqMs18ptXF8NUeKU+aI21TpbFbBcw1SoqWE6OMCl3CiiAOPaZ2r2AkiTc2GN1UMh6yMoMd
	nHpD4gqZRQF51T9INEtHYF9r5v8vzyhTqH/xqmOYLb7fETXdA5YkCrkhB4qiBZQTWPJkmp
	l1epuxUJcnn5aNIYwdG9nC6z25Ty4A9I3yCUvD81EDNhoZc+bqI9TPyoT5ormKNMLFTSww
	H9zwhIf8a62TuSAbuEYuN5gbZcwErbWDIQzjy2RUzybhp0HDVBHRJGYSrfUxwPMZyc0QTz
	CA6oWZsWkVSOEzQmAPDLNiWz1vhVCLauw7lDX8anlUJiulXnMLM4imFm64hYgA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 16 Sep 2026 15:45:43 +0200
Subject: [PATCH v3 19/19] drm/bridge: analogix_dp: don't create a
 panel_bridge
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-drm-bridge-every-panel-v3-19-83afb4f1a707@bootlin.com>
References: <20260916-drm-bridge-every-panel-v3-0-83afb4f1a707@bootlin.com>
In-Reply-To: <20260916-drm-bridge-every-panel-v3-0-83afb4f1a707@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
 Lucas Stach <l.stach@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Paul Cercueil <paul@crapouillou.net>, 
 Paul Kocialkowski <paulk@sys-base.io>, Linus Walleij <linusw@kernel.org>, 
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, Sean Paul <sean@poorly.run>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Albert Esteve <aesteve@redhat.com>, 
 Anusha Srivatsa <asrivats@redhat.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-mips@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, asahi@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 linux-tegra@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_144829_934239_76221BC1 
X-CRM114-Status: GOOD (  23.34  )
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

Now a panel_bridge is automatically created for every drm_panel and the
panel-bridge API is just a deprecated wrapper to access it.

Update and simplify the code by just getting a reference to the
already-existing bridge using of_drm_get_bridge_by_endpoint().

As of_drm_get_bridge_by_endpoint() returns a refcounted bridge, take care
of putting the bridge reference. This is not easily done in the remove path
due to the different probe paths of the user drivers, so add a devm action
to ensure the reference is put only when it was taken.

Assisted-by: opencode:deepseek-v4-flash-0731
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/analogix/Kconfig            |  1 -
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 40 +++++++++++++---------
 drivers/gpu/drm/exynos/exynos_dp.c                 | 36 ++-----------------
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c    |  9 -----
 include/drm/bridge/analogix_dp.h                   |  1 -
 5 files changed, 25 insertions(+), 62 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/Kconfig b/drivers/gpu/drm/bridge/analogix/Kconfig
index da156fd15764..5672d83cb4a1 100644
--- a/drivers/gpu/drm/bridge/analogix/Kconfig
+++ b/drivers/gpu/drm/bridge/analogix/Kconfig
@@ -33,7 +33,6 @@ config DRM_ANALOGIX_DP
 	depends on DRM
 	depends on OF
 	select DRM_DISPLAY_DP_AUX_BUS
-	select DRM_PANEL
 
 config DRM_ANALOGIX_ANX7625
 	tristate "Analogix Anx7625 MIPI to DP interface support"
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 18e76d1e78e1..6df6963740d2 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -29,7 +29,6 @@
 #include <drm/drm_device.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_of.h>
-#include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
@@ -1567,15 +1566,6 @@ int analogix_dp_bind(struct analogix_dp_device *dp, struct drm_device *drm_dev)
 	if (ret)
 		goto err_unregister_aux;
 
-	if (dp->plat_data->panel) {
-		dp->plat_data->next_bridge = devm_drm_panel_bridge_add(dp->dev,
-								       dp->plat_data->panel);
-		if (IS_ERR(dp->plat_data->next_bridge)) {
-			ret = PTR_ERR(dp->plat_data->next_bridge);
-			goto err_unregister_aux;
-		}
-	}
-
 	ret = drm_bridge_attach(dp->encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 	if (ret) {
 		DRM_ERROR("failed to create bridge (%d)\n", ret);
@@ -1647,6 +1637,11 @@ struct drm_dp_aux *analogix_dp_get_aux(struct analogix_dp_device *dp)
 }
 EXPORT_SYMBOL_GPL(analogix_dp_get_aux);
 
+static void analogix_dp_put_bridge(void *data)
+{
+	drm_bridge_put(data);
+}
+
 static int analogix_dp_aux_done_probing(struct drm_dp_aux *aux)
 {
 	struct analogix_dp_device *dp = to_dp(aux);
@@ -1655,14 +1650,25 @@ static int analogix_dp_aux_done_probing(struct drm_dp_aux *aux)
 	int ret;
 
 	/*
-	 * If drm_of_find_panel_or_bridge() returns -ENODEV, there may be no valid panel
-	 * or bridge nodes. The driver should go on for the driver-free bridge or the DP
-	 * mode applications.
+	 * If of_drm_get_bridge_by_endpoint() returns -ENODEV, there may be no
+	 * valid panel or bridge nodes. The driver should go on for the
+	 * driver-free bridge or the DP mode applications.
 	 */
-	ret = drm_of_find_panel_or_bridge(dp->dev->of_node, port, 0,
-					  &plat_data->panel, &plat_data->next_bridge);
-	if (ret && ret != -ENODEV)
-		return ret;
+	plat_data->next_bridge = of_drm_get_bridge_by_endpoint(dp->dev->of_node,
+							       port, 0);
+	if (IS_ERR(plat_data->next_bridge)) {
+		if (PTR_ERR(plat_data->next_bridge) == -ENODEV)
+			plat_data->next_bridge = NULL;
+		else
+			return PTR_ERR(plat_data->next_bridge);
+	}
+
+	if (plat_data->next_bridge) {
+		ret = devm_add_action_or_reset(dp->dev, analogix_dp_put_bridge,
+					       plat_data->next_bridge);
+		if (ret)
+			return ret;
+	}
 
 	return component_add(dp->dev, plat_data->ops);
 }
diff --git a/drivers/gpu/drm/exynos/exynos_dp.c b/drivers/gpu/drm/exynos/exynos_dp.c
index e1c9e2946b8a..82c238829921 100644
--- a/drivers/gpu/drm/exynos/exynos_dp.c
+++ b/drivers/gpu/drm/exynos/exynos_dp.c
@@ -26,7 +26,6 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_encoder.h>
 #include <drm/drm_of.h>
-#include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/exynos_drm.h>
@@ -147,7 +146,6 @@ static const struct component_ops exynos_dp_ops = {
 static int exynos_dp_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *np;
 	struct exynos_dp_device *dp;
 
 	dp = devm_kzalloc(&pdev->dev, sizeof(struct exynos_dp_device),
@@ -163,18 +161,6 @@ static int exynos_dp_probe(struct platform_device *pdev)
 	 */
 	platform_set_drvdata(pdev, dp);
 
-	/* This is for the backward compatibility. */
-	np = of_parse_phandle(dev->of_node, "panel", 0);
-	if (np) {
-		dp->plat_data.panel = of_drm_find_panel(np);
-
-		of_node_put(np);
-		if (IS_ERR(dp->plat_data.panel))
-			return PTR_ERR(dp->plat_data.panel);
-
-		goto out;
-	}
-
 	if (of_get_display_timings(dev->of_node)) {
 		dp->plat_data.next_bridge = devm_drm_of_display_mode_bridge(dp->dev,
 									dp->dev->of_node,
@@ -189,19 +175,11 @@ static int exynos_dp_probe(struct platform_device *pdev)
 	dp->plat_data.power_off = exynos_dp_poweroff;
 	dp->plat_data.ops = &exynos_dp_ops;
 
-out:
 	dp->adp = analogix_dp_probe(dev, &dp->plat_data);
-	if (IS_ERR(dp->adp)) {
-		/*
-		 * The driver core does not invoke remove() for failed probes,
-		 * so release the probe-time panel reference here.
-		 */
-		if (dp->plat_data.panel)
-			drm_panel_put(dp->plat_data.panel);
+	if (IS_ERR(dp->adp))
 		return PTR_ERR(dp->adp);
-	}
 
-	if (dp->plat_data.panel || dp->plat_data.next_bridge)
+	if (dp->plat_data.next_bridge)
 		return component_add(&pdev->dev, &exynos_dp_ops);
 	else
 		return analogix_dp_finish_probe(dp->adp);
@@ -209,16 +187,6 @@ static int exynos_dp_probe(struct platform_device *pdev)
 
 static void exynos_dp_remove(struct platform_device *pdev)
 {
-	struct exynos_dp_device *dp = platform_get_drvdata(pdev);
-
-	/*
-	 * Release the probe-time reference from of_drm_find_panel(). If bind
-	 * ran, the panel_bridge holds a second reference that devm cleanup
-	 * will release when the bridge is destroyed after remove() returns.
-	 */
-	if (dp->plat_data.panel)
-		drm_panel_put(dp->plat_data.panel);
-
 	component_del(&pdev->dev, &exynos_dp_ops);
 }
 
diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
index 587e60232ec7..071d31aa5288 100644
--- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
@@ -28,7 +28,6 @@
 #include <drm/drm_bridge_connector.h>
 #include <drm/bridge/analogix_dp.h>
 #include <drm/drm_of.h>
-#include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
@@ -488,14 +487,6 @@ static void rockchip_dp_remove(struct platform_device *pdev)
 {
 	struct rockchip_dp_device *dp = platform_get_drvdata(pdev);
 
-	/*
-	 * Release the probe-time reference from of_drm_find_panel(). If bind
-	 * ran, the panel_bridge holds a second reference that devm cleanup
-	 * will release when the bridge is destroyed after remove() returns.
-	 */
-	if (dp->plat_data.panel)
-		drm_panel_put(dp->plat_data.panel);
-
 	component_del(&pdev->dev, &rockchip_dp_component_ops);
 }
 
diff --git a/include/drm/bridge/analogix_dp.h b/include/drm/bridge/analogix_dp.h
index 0e0b87abee59..6033137b651e 100644
--- a/include/drm/bridge/analogix_dp.h
+++ b/include/drm/bridge/analogix_dp.h
@@ -35,7 +35,6 @@ static inline bool analogix_dp_is_rockchip(enum analogix_dp_devtype type)
 
 struct analogix_dp_plat_data {
 	enum analogix_dp_devtype dev_type;
-	struct drm_panel *panel;
 	struct drm_bridge *next_bridge;
 	struct drm_encoder *encoder;
 	struct drm_connector *connector;

-- 
2.55.0


