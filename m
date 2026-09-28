Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FD33C9833E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 08:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hBKIALctEi57ym1FR2XRmM2+ApHmT5i2YXu5RV+cc8c=; b=D5Tnp9dnNvJv28b18yadCyDN2c
	9BdoVr6iHsR18+KHPOujFodZPsTTXj60876xFWCOxcMSTnMKTOEJXGK6mgdS8GEg0aO5D+IzrBhAn
	BeXCCqg/lyaWVC/Wrr/0AtK+bOdaENk5IbJrnSHEctzvUSr8owaKLMyZ2+vLqN9nZzZLeWZwsYxn5
	TNwCtGODxo6EzPGr87+NfGuY4LmWboM/T/KNp2LN/kl0W9OGJC6E4ugy5cbdAIb2EOcWgrb6Xnh74
	+RzWjPen40ppyOYjD1V49NRsIynttK5it87lOyILi3Yasp0sEBjLKl3bJ3np8SA2QMGUW5GvoPPPx
	gDFh/rCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB6WL-000000002qo-2ryA;
	Mon, 28 Sep 2026 08:15:33 +0000
Received: from mail-m158196.netease.com ([47.251.158.196])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB6WA-000000002do-0YXj;
	Mon, 28 Sep 2026 08:15:24 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4f5398eb6;
	Mon, 28 Sep 2026 16:15:16 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jingoo Han <jingoohan1@gmail.com>,
	Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v3 12/14] drm/bridge: analogix_dp: Restrict forced connected status to panel endpoints
Date: Mon, 28 Sep 2026 16:14:16 +0800
Message-Id: <20260928081418.3605775-13-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260928081418.3605775-1-damon.ding@rock-chips.com>
References: <20260928081418.3605775-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa0e715200603a8kunm323e2b5437cf85
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaQx5CVkkeGk0eTkgeSEJNT1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	JDQkpVSktLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=ORwPU5ccrMdFsHUHHD+zYQwZgoDQ+R71++xMsvckkCJK/kMs6dzaCM6Mg02e1hHmCqWOxTjLLpgGjVz9pDWWcs9JOOzoWEgFZVhQ1PvO+/mca29QHJs1I4Gx+vkye8Hejkn693upG6xH0up2CxAINBaSsLDojR6XD9HXLr/d5L8=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=hBKIALctEi57ym1FR2XRmM2+ApHmT5i2YXu5RV+cc8c=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_011523_006490_77313CDC 
X-CRM114-Status: GOOD (  15.13  )
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

Limit the shortcut which unconditionally returns connected status when
a next bridge exists. Only apply this logic if the last bridge in the
chain is a panel and the bridges attached after Analogix DP bridge lack
DRM_BRIDGE_OP_DETECT, which called 'force_connected_mode'. For all
other cases, rely on analogix_dp_detect_hpd() to report accurate
hotplug state.

Background for the special handling:
- If the chain ends with a DP connector bridge, the connector relies
  on Analogix DP to perform detection. We must avoid hardcoding
  connected status here.
- For intermediate bridges such as PS8625 / PTN3460 without detect
  support [1], historically the bridge connector defaults to connected
  via drm_helper_probe_detect() when no per-bridge detect callback
  exists.

[1] https://lore.kernel.org/all/4939d55e-b560-4235-8295-adf8e48d9b74@samsung.com/

Reported-by: Heiko Stuebner <heiko@sntech.de>
Link: https://lore.kernel.org/all/5209243.oAaWjsssbx@diego/
Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

---

Changes in v3:
- Add missing drm_bridge_put() after drm_bridge_chain_get_last_bridge()
  to fix a reference count leak.(Sashiko)
- Report panel endpoints as always connected from
  analogix_dp_get_plug_in_status() via newly added
  &analogix_dp_device.force_connected_mode.
---
 .../drm/bridge/analogix/analogix_dp_core.c    | 30 +++++++++++++++++--
 .../drm/bridge/analogix/analogix_dp_core.h    |  1 +
 .../gpu/drm/bridge/analogix/analogix_dp_reg.c |  3 ++
 3 files changed, 31 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 853b6a6a7fe4..df898f314254 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -912,15 +912,30 @@ analogix_dp_bridge_detect(struct drm_bridge *bridge, struct drm_connector *conne
 	struct analogix_dp_device *dp = to_dp(bridge);
 	enum drm_connector_status status = connector_status_disconnected;
 
-	if (dp->bridge.next_bridge)
-		return connector_status_connected;
-
 	if (!analogix_dp_detect_hpd(dp))
 		status = connector_status_connected;
 
 	return status;
 }
 
+static bool analogix_dp_bridge_force_connected(struct analogix_dp_device *dp)
+{
+	struct drm_bridge *last_bridge;
+	bool force_connected = false;
+
+	drm_for_each_bridge_in_chain_from(dp->bridge.next_bridge, bridge) {
+		if (bridge->ops & DRM_BRIDGE_OP_DETECT)
+			return false;
+	}
+
+	last_bridge = drm_bridge_chain_get_last_bridge(dp->encoder);
+	if (last_bridge)
+		force_connected = drm_bridge_is_panel(last_bridge);
+	drm_bridge_put(last_bridge);
+
+	return force_connected;
+}
+
 static int analogix_dp_bridge_attach(struct drm_bridge *bridge,
 				     struct drm_encoder *encoder,
 				     enum drm_bridge_attach_flags flags)
@@ -940,6 +955,15 @@ static int analogix_dp_bridge_attach(struct drm_bridge *bridge,
 			dev_err(dp->dev, "failed to attach following panel or bridge (%d)\n", ret);
 			return ret;
 		}
+
+		/*
+		 * Only assume connected when the bridge chain ends with a panel.
+		 * Panel bridges lack a detect callback and historically rely on
+		 * this shortcut. For other next bridge types (e.g., DP connector
+		 * bridges), fall back to analogix_dp_detect_hpd() to report
+		 * accurate hotplug state.
+		 */
+		dp->force_connected_mode = analogix_dp_bridge_force_connected(dp);
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
index 6a3566b2e8de..5f5698c73d88 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
@@ -170,6 +170,7 @@ struct analogix_dp_device {
 	bool			force_hpd;
 	bool			fast_train_enable;
 	bool			psr_supported;
+	bool			force_connected_mode;
 
 	u8 dpcd[DP_RECEIVER_CAP_SIZE];
 
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
index af5e5a8ec88d..abbcdba1a438 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
@@ -533,6 +533,9 @@ int analogix_dp_get_plug_in_status(struct analogix_dp_device *dp)
 {
 	u32 reg;
 
+	if (dp->force_connected_mode)
+		return 0;
+
 	if (dp->hpd_gpiod) {
 		if (gpiod_get_value(dp->hpd_gpiod))
 			return 0;
-- 
2.34.1


