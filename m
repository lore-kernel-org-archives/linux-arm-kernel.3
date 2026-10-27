Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F9D606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 13:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qqUDmWTa;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=cn5cnMUx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OZLecs9ULaW3R1e0H0Cp/hBp2cEn1xWlIbXGia1G9b8=; b=qqUDmWTal44yo1
	c/uImcXztGV97sp2tAW090AZ0pq6fdY+UHXDvK0WuwgaJ+kbryhGAk4mdwWs5eUDuKVLx6bAwJ98U
	4fFolxs5VunzpH53bbOqxCcTfpodEu2Cfe8vHOvM+GHsrDH5s7EUaPGL3aSZYDbbpUo0gWBNsepsS
	fYOrqhAy1fnXXG01dq5RE0dwkgDuG0ZRJXEomm3cZ9LC0sqsxfEVM4MiJoMuc0TtPgwdIzA8FHX8J
	xRKQM/I8Jy50feoUzqGLBW8yez1rVVJA8cVjCrb4hpqI7kAUbe5RM1Ksqnk1WUXdiJUevKkkwtmQs
	zM8BRBJRYzHAVyfmJ/xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLhEk-00000004rgO-3F50;
	Tue, 27 Oct 2026 13:29:10 +0000
Received: from mail-m83247.xmail.ntesmail.com ([156.224.83.247])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLhEF-00000004r0j-04yc;
	Tue, 27 Oct 2026 13:28:40 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 528777a45;
	Tue, 27 Oct 2026 21:28:34 +0800 (GMT+08:00)
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
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Sandy Huang <hjc@rock-chips.com>
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
Subject: [PATCH v5 16/18] drm/bridge: analogix_dp: Declare DRM_BRIDGE_OP_HPD for hotplug reporting
Date: Tue, 27 Oct 2026 21:28:08 +0800
Message-Id: <20261027132810.1746118-17-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261027132810.1746118-1-damon.ding@rock-chips.com>
References: <20261027132810.1746118-1-damon.ding@rock-chips.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa17d8c61a003a8kunm87c266213d573a
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaThlNVktKGUxITElJTktIT1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=cn5cnMUxh+tZTsig1iD2lQuSkdIGiC0kgc/4tU5mfTr/mpDNBFkratkKfz9mtQDTVNwCpBE7VrlcRBgQFGW00WXH88y3yH/fqMA2+VvKOnztqoaS7JNVik65gW2OQofxUvXKWLDsqr3ngTaDqqvudLg/qv+p7ffQsS7NIG9rv/A=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=OZLecs9ULaW3R1e0H0Cp/hBp2cEn1xWlIbXGia1G9b8=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_062839_388805_4AF3ADA9 
X-CRM114-Status: GOOD (  13.68  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The connector created by drm_bridge_connector_init() only gets
DRM_CONNECTOR_POLL_HPD when a bridge in the chain declares
DRM_BRIDGE_OP_HPD.  Without it, the HPD events reported from the IRQ
thread were silently dropped and the connection state was only
refreshed by the periodic poll worker.

Declare DRM_BRIDGE_OP_HPD on the Analogix DP bridge, implement the
no-op .hpd_enable/.hpd_disable callbacks, and report the hotplug
events via drm_bridge_hpd_notify() with the status read from the
hardware.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
---
 .../drm/bridge/analogix/analogix_dp_core.c    | 22 +++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 009567da5f17..938c70dc8e15 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -31,7 +31,6 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_of.h>
 #include <drm/drm_print.h>
-#include <drm/drm_probe_helper.h>
 
 #include <video/of_display_timing.h>
 
@@ -741,9 +740,13 @@ static irqreturn_t analogix_dp_irq_thread(int irq, void *arg)
 		hpd_detected = (irq_type & DP_IRQ_TYPE_HP_CABLE_IN) ||
 			       (irq_type & DP_IRQ_TYPE_HP_CABLE_OUT);
 	if (hpd_detected) {
+		enum drm_connector_status status;
+
 		dev_dbg(dp->dev, "Detected cable status changed!\n");
-		if (dp->drm_dev)
-			drm_helper_hpd_irq_event(dp->drm_dev);
+
+		status = analogix_dp_get_plug_in_status(dp) == 0 ? connector_status_connected :
+								   connector_status_disconnected;
+		drm_bridge_hpd_notify(&dp->bridge, status);
 	}
 
 	pm_runtime_mark_last_busy(dp->dev);
@@ -1280,6 +1283,14 @@ static void analogix_dp_bridge_atomic_post_disable(struct drm_bridge *bridge,
 		DRM_ERROR("Failed to enable psr (%d)\n", ret);
 }
 
+static void analogix_dp_bridge_hpd_enable(struct drm_bridge *bridge)
+{
+}
+
+static void analogix_dp_bridge_hpd_disable(struct drm_bridge *bridge)
+{
+}
+
 static const struct drm_bridge_funcs analogix_dp_bridge_funcs = {
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
@@ -1292,6 +1303,8 @@ static const struct drm_bridge_funcs analogix_dp_bridge_funcs = {
 	.attach = analogix_dp_bridge_attach,
 	.edid_read = analogix_dp_bridge_edid_read,
 	.detect = analogix_dp_bridge_detect,
+	.hpd_enable = analogix_dp_bridge_hpd_enable,
+	.hpd_disable = analogix_dp_bridge_hpd_disable,
 };
 
 static int analogix_dp_dt_parse_lanes_map(struct analogix_dp_device *dp)
@@ -1612,7 +1625,8 @@ int analogix_dp_bind(struct analogix_dp_device *dp, struct drm_device *drm_dev)
 		return ret;
 	}
 
-	bridge->ops = DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_DETECT;
+	bridge->ops = DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_DETECT |
+		      DRM_BRIDGE_OP_HPD;
 	bridge->of_node = dp->dev->of_node;
 	bridge->type = DRM_MODE_CONNECTOR_eDP;
 	ret = devm_drm_bridge_add(dp->dev, &dp->bridge);
-- 
2.34.1


