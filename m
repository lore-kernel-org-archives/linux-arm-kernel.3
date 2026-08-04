Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48B09C55172
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 08:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=++hasEF6aBrRfCl+8wlVRjHt23leSsAweKpeIh4oR8k=; b=zhI3goHxREHjFu37jSIX5OgaJB
	KnuMRcuFzgFERZIydStVdCs9uwCpPmoEz0uTK7ZzoGDzTEEHikC0ppbv2q2mLBwzeaMYWr9ObR/Fg
	Fnn/8Byl2MFF+ssdNxxoSbo8t0KAjDBbouYgolBKsZBOOWdbLu117aGe/KJFtlv+ajibeWhLb3iB6
	KC4yK+FcZ3fuFhPuxQE4QySMtAHgU8/Dgr90oUrVl4A3mQLalbdN4u51khDRSrOkPyu74oxQaoUas
	sNBg7g3Pcn5l8aouMEGQwK79N2qyBmNuVHMhBuO4Or5TnK31EbSMH+K3IRhUvvtNh9TIUeIXXKWlH
	XfcUJAZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrALH-00000001JA7-465k;
	Tue, 04 Aug 2026 08:17:43 +0000
Received: from mail-m12868.netease.com ([103.209.128.68])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrALC-00000001Ivs-3Urc;
	Tue, 04 Aug 2026 08:17:41 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 48b4fff21;
	Tue, 4 Aug 2026 16:17:34 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Heiko Stuebner <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v2 09/10] drm/bridge: analogix_dp: Restrict forced connected status only for panel endpoint
Date: Tue,  4 Aug 2026 16:17:16 +0800
Message-Id: <20260804081717.741404-10-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260804081717.741404-1-damon.ding@rock-chips.com>
References: <20260804081717.741404-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9fcbd9777003a8kunma7b8cbe762b0ed
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCQh4eVkJIQx5LSEIZSkkaQlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=RoKQnGWYAYRI7Qa3lvdPLalCuoRZUR+wcRtqd5S/f6K2s5PC8vLunb1kwJ2FtSXrOKj+EjsbMUpc4rPNa7/jF6u0e2FWxLzMut6IPJfCzd8Pe77wh/8rQUm0TUcIT8/l6fGkIfjWfxuH1pVFAv3CiSMUrqdCxJRBYxp0qEbz6CU=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=++hasEF6aBrRfCl+8wlVRjHt23leSsAweKpeIh4oR8k=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_011740_134586_63E56DAE 
X-CRM114-Status: GOOD (  14.04  )
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
chain is a panel. For all other cases, rely on analogix_dp_detect_hpd()
to report accurate hotplug state.

Background for the special handling:
- If the chain ends with a DP connector bridge, the connector relies
on analogix_dp to perform detection. We must avoid hardcoding connected
status here.
- For intermediate bridges such as PS8625 / PTN3460 without detect
support [1], historically the bridge connector defaults to connected
via drm_helper_probe_detect() when no per-bridge detect callback
exists. Maintain compatibility by keeping the shortcut exclusively for
panel endpoints.

[1] https://lore.kernel.org/all/4939d55e-b560-4235-8295-adf8e48d9b74@samsung.com/

Reported-by: Heiko Stuebner <heiko@sntech.de>
Link: https://lore.kernel.org/all/5209243.oAaWjsssbx@diego/
Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
---
 .../gpu/drm/bridge/analogix/analogix_dp_core.c   | 16 ++++++++++++++--
 .../gpu/drm/bridge/analogix/analogix_dp_core.h   |  1 +
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index f05db455b430..a5a50b9ab8a7 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -906,8 +906,15 @@ analogix_dp_bridge_detect(struct drm_bridge *bridge, struct drm_connector *conne
 	struct analogix_dp_device *dp = to_dp(bridge);
 	enum drm_connector_status status = connector_status_disconnected;
 
-	if (dp->plat_data->next_bridge)
-		return connector_status_connected;
+	/*
+	 * Only assume connected when the bridge chain ends with a panel.
+	 * Panel bridges lack a detect callback and historically rely on
+	 * this shortcut. For other next bridge types (e.g., DP connector
+	 * bridges), fall through to analogix_dp_detect_hpd() to report
+	 * accurate hotplug state.
+	 */
+	if (dp->plat_data->next_bridge && dp->last_bridge_is_panel)
+		status = connector_status_connected;
 
 	if (!analogix_dp_detect_hpd(dp))
 		status = connector_status_connected;
@@ -920,6 +927,7 @@ static int analogix_dp_bridge_attach(struct drm_bridge *bridge,
 				     enum drm_bridge_attach_flags flags)
 {
 	struct analogix_dp_device *dp = to_dp(bridge);
+	struct drm_bridge *last_bridge;
 	int ret = 0;
 
 	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
@@ -934,6 +942,10 @@ static int analogix_dp_bridge_attach(struct drm_bridge *bridge,
 			dev_err(dp->dev, "failed to attach following panel or bridge (%d)\n", ret);
 			return ret;
 		}
+
+		last_bridge = drm_bridge_chain_get_last_bridge(dp->encoder);
+		if (drm_bridge_is_panel(last_bridge))
+			dp->last_bridge_is_panel = true;
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
index 2066e575ce10..bcb5674801a2 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
@@ -168,6 +168,7 @@ struct analogix_dp_device {
 	bool			force_hpd;
 	bool			fast_train_enable;
 	bool			psr_supported;
+	bool			last_bridge_is_panel;
 
 	u8 dpcd[DP_RECEIVER_CAP_SIZE];
 
-- 
2.34.1


