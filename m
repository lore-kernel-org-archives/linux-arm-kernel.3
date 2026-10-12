Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3B71CA9ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 15:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P/Q4nFBYsii5RLmePNAPJ+fdVFCY7TJHBVJr5R7oOUU=; b=YJwzu4D/ldCEQzAzC2O9MPCuh7
	bs8O5Whh/4o+oSRm/4arcRaXpYmDkvpjJvlg6THZyhk42zYLmUT4F/Rcl90jgf1Gxs+X4kCfaqJf4
	yjpg4bwM5yrayAT+jHsTeexNSPnoCgg0mYS+GruT2aIsSzExxB227CYVkEuEsFrTe4yaZ/fpgCJcP
	wlMWkHC2Nr36y+m3XUbPhCxg5Lh50YSP1jMazqtiFIndsXNeqSZRkE36VVnsSm5MujHNblsu5jEof
	lpQ4zd0u9/zkRGlVZvAbPjSvUJ9tnZFiPWlC+5hpwMv3+D4EBlQF8efm7v9+eN3pGFKn9hAORkLUy
	BfVkZS9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGHha-0000000AlzW-0YOI;
	Mon, 12 Oct 2026 15:12:34 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGHhL-0000000AloZ-1TDB;
	Mon, 12 Oct 2026 15:12:21 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A5D541A11E9;
	Mon, 12 Oct 2026 15:12:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 71B30601A6;
	Mon, 12 Oct 2026 15:12:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AFF8411D70CD6;
	Mon, 12 Oct 2026 17:12:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791817935; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=P/Q4nFBYsii5RLmePNAPJ+fdVFCY7TJHBVJr5R7oOUU=;
	b=QEw4ceLzWeB8qinUu3mC0wNsLS4KwoVzdMeNR1LuDZOqpeG4PwWut/oihiBkHGQnbMZxhl
	OZp32Dlsdo/K2c61sEs2QPrVvPALXX8V2EcPeErhamuicCpfdVR20vOzkjxnlgKCaJU0Yr
	exCKtpfmW3UbWGlASwH576cy09yT7rUudgRtXAeGCZNYkyHiGgHQwOTi9/PvsrPO8E6Lls
	N2qpi/NxPYL9Cm/9PeF0JNTF7bdFq7AaEr90/6sAOncIfSe0wPcROPU/Prd7nCb56dQ7c9
	rdyz+0CVJcpxqT964ronT75nEzdCaq9aXxGrcGzf01uBswPl3tFKxLGSMOIsqA==
From: Kory Maincent <kory.maincent@bootlin.com>
Date: Mon, 12 Oct 2026 17:11:03 +0200
Subject: [PATCH RFC v3 8/8] drm/mediatek: Use dp_connector helpers to
 expose link training state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-feat_link_cap-v3-8-7517f4aba0f3@bootlin.com>
References: <20261012-feat_link_cap-v3-0-7517f4aba0f3@bootlin.com>
In-Reply-To: <20261012-feat_link_cap-v3-0-7517f4aba0f3@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Daniel Stone <daniels@collabora.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mark Yacoub <markyacoub@google.com>, Sean Paul <seanpaul@google.com>, 
 Manasi Navare <navaremanasi@google.com>, 
 Drew Davenport <ddavenport@google.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Kory Maincent <kory.maincent@bootlin.com>
X-Mailer: b4 0.16.1-dev-17221
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_081219_735250_4921782D 
X-CRM114-Status: GOOD (  23.07  )
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

Adopt the DRM core DisplayPort helpers by setting DRM_BRIDGE_OP_DP and
populating the bridge dp_link_caps at probe time. Report the sink
capabilities on hotplug, reset them on disconnect, and report the link
parameters once link training succeeds.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
Not tested. I believed I had a board with this device, but it actually uses
an anx7625 bridge. I'm unable to test it; it would be appreciated if
someone else could, so the change isn't dropped.

Changes in v3:
- Sync and report sink capabilities from the HPD thread for DisplayPort,
  or in atomic_enable for eDP. Reset them on unplug, or atomic disable
  and only report link parameters after successful training.
- Add connection_mutex lock for DisplayPort in the IRQ thread.

Changes in v2:
- Remove voltage swing and pre emphasis properties.
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 79 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 75 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index f656b85b84212..2e2596eaa342e 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -1812,6 +1812,35 @@ static void mtk_dp_train_change_mode(struct mtk_dp *mtk_dp)
 	mtk_dp_reset_swing_pre_emphasis(mtk_dp);
 }
 
+static void _mtk_dp_report_link_train(struct mtk_dp *mtk_dp)
+{
+	u32 rate, nlanes;
+	bool dsc = false;
+
+	rate = drm_dp_bw_code_to_link_rate(mtk_dp->train_info.link_rate);
+	nlanes = mtk_dp->train_info.lane_count;
+
+	drm_dp_set_cur_link_params(mtk_dp->conn, rate, nlanes, dsc);
+}
+
+static void mtk_dp_report_link_train(struct mtk_dp *mtk_dp)
+{
+	struct drm_modeset_lock *lock;
+	int ret;
+
+	if (!mtk_dp->conn)
+		return;
+
+	lock = &mtk_dp->conn->dev->mode_config.connection_mutex;
+	ret = drm_modeset_lock_single_interruptible(lock);
+	if (ret)
+		return;
+
+	_mtk_dp_report_link_train(mtk_dp);
+
+	drm_modeset_unlock(lock);
+}
+
 static int mtk_dp_training(struct mtk_dp *mtk_dp)
 {
 	int ret;
@@ -2015,6 +2044,8 @@ static irqreturn_t mtk_dp_hpd_event_thread(int hpd, void *dev)
 			ret = mtk_dp_training(mtk_dp);
 			if (ret)
 				drm_err(mtk_dp->drm_dev, "Training failed, %d\n", ret);
+			else
+				mtk_dp_report_link_train(mtk_dp);
 
 			mtk_dp->enabled = true;
 		}
@@ -2145,9 +2176,12 @@ mtk_dp_bdg_detect(struct drm_bridge *bridge, struct drm_connector *connector)
 	struct mtk_dp *mtk_dp = mtk_dp_from_bridge(bridge);
 	enum drm_connector_status ret = connector_status_disconnected;
 	bool enabled = mtk_dp->enabled;
+	int err;
 
-	if (!mtk_dp->train_info.cable_plugged_in)
+	if (!mtk_dp->train_info.cable_plugged_in) {
+		drm_dp_sink_reset_caps(connector);
 		return ret;
+	}
 
 	if (!enabled)
 		mtk_dp_aux_panel_poweron(mtk_dp, true);
@@ -2160,9 +2194,18 @@ mtk_dp_bdg_detect(struct drm_bridge *bridge, struct drm_connector *connector)
 	 * whether we connect to a sink device.
 	 */
 
-	if (drm_dp_read_sink_count(&mtk_dp->aux) > 0)
+	if (drm_dp_read_sink_count(&mtk_dp->aux) > 0) {
 		ret = connector_status_connected;
 
+		err = drm_dp_sink_sync_caps(connector, &mtk_dp->aux, NULL);
+		if (err)
+			drm_dbg_kms(mtk_dp->aux.drm_dev,
+				    "%s: error sink caps synchronisation (%d)\n",
+				    mtk_dp->aux.name, err);
+	} else {
+		drm_dp_sink_reset_caps(connector);
+	}
+
 	if (!enabled)
 		mtk_dp_aux_panel_poweron(mtk_dp, false);
 
@@ -2390,12 +2433,20 @@ static void mtk_dp_bridge_atomic_enable(struct drm_bridge *bridge,
 	if (mtk_dp->data->bridge_type == DRM_MODE_CONNECTOR_eDP) {
 		mtk_dp_aux_panel_poweron(mtk_dp, true);
 
+		ret = drm_dp_sink_sync_caps(mtk_dp->conn, &mtk_dp->aux, NULL);
+		if (ret)
+			drm_dbg_kms(mtk_dp->aux.drm_dev,
+				    "%s: error sink caps synchronisation (%d)\n",
+				    mtk_dp->aux.name, ret);
+
 		/* Training */
 		ret = mtk_dp_training(mtk_dp);
 		if (ret) {
 			drm_err(mtk_dp->drm_dev, "Training failed, %d\n", ret);
 			goto power_off_aux;
 		}
+
+		_mtk_dp_report_link_train(mtk_dp);
 	}
 
 	ret = mtk_dp_video_config(mtk_dp);
@@ -2435,6 +2486,7 @@ static void mtk_dp_bridge_atomic_disable(struct drm_bridge *bridge,
 	if (mtk_dp->data->bridge_type == DRM_MODE_CONNECTOR_eDP) {
 		mtk_dp->enabled = false;
 		mtk_dp_aux_panel_poweron(mtk_dp, false);
+		drm_dp_sink_reset_caps(mtk_dp->conn);
 	}
 
 	mtk_dp_update_plugged_status(mtk_dp);
@@ -2740,11 +2792,14 @@ static int mtk_dp_edp_link_panel(struct drm_dp_aux *mtk_aux)
 	return 0;
 }
 
+static int mtk_dp_rates[] = {162000, 270000, 540000, 810000};
+
 static int mtk_dp_probe(struct platform_device *pdev)
 {
+	struct drm_connector_dp_link_caps *source_caps;
 	struct mtk_dp *mtk_dp;
 	struct device *dev = &pdev->dev;
-	int ret;
+	int ret, i, max_rate;
 
 	mtk_dp = devm_drm_bridge_alloc(dev, struct mtk_dp, bridge,
 				       &mtk_dp_bridge_funcs);
@@ -2758,6 +2813,20 @@ static int mtk_dp_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to parse dt\n");
 
+	source_caps = devm_kzalloc(dev, sizeof(*source_caps), GFP_KERNEL);
+	if (!source_caps)
+		return -ENOMEM;
+
+	source_caps->nlanes = mtk_dp->max_lanes;
+	source_caps->link_rates = mtk_dp_rates;
+
+	max_rate = drm_dp_bw_code_to_link_rate(mtk_dp->max_linkrate);
+	for (i = 0; i < ARRAY_SIZE(mtk_dp_rates); i++)
+		if (mtk_dp_rates[i] > max_rate)
+			break;
+
+	source_caps->nlink_rates = i;
+
 	/*
 	 * Request the interrupt and install service routine only if we are
 	 * on full DisplayPort.
@@ -2809,6 +2878,8 @@ static int mtk_dp_probe(struct platform_device *pdev)
 
 	mtk_dp->bridge.of_node = dev->of_node;
 	mtk_dp->bridge.type = mtk_dp->data->bridge_type;
+	mtk_dp->bridge.dp_link_caps = source_caps;
+	mtk_dp->bridge.ops = DRM_BRIDGE_OP_DP;
 
 	if (mtk_dp->bridge.type == DRM_MODE_CONNECTOR_eDP) {
 		/*
@@ -2849,7 +2920,7 @@ static int mtk_dp_probe(struct platform_device *pdev)
 			}
 		}
 	} else {
-		mtk_dp->bridge.ops = DRM_BRIDGE_OP_DETECT |
+		mtk_dp->bridge.ops |= DRM_BRIDGE_OP_DETECT |
 				     DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_HPD;
 		ret = devm_drm_bridge_add(dev, &mtk_dp->bridge);
 		if (ret)

-- 
2.43.0


