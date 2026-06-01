Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15439CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 06:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yJZuY68i6MDKTHNn2ykBZ5f5HU1REKA2FFFIWObwSW8=; b=boLxWUgESQseG0NQRZN4VRgwpL
	rRIcHbVysaOGmDgMF2OaK0Cgk3YMulf7nW3r+iIqroslIRibt4MYMEQE/8pBNXHwAMoztgvQ+eHb3
	yo+AdKGaxE3Dct7LMQx4Gg0dMG546eBqW5MPhV9cP2Og1zksrgNS+0O4wtI0MunQ7/lv/H8gVWLVT
	R68ZFhYnRyCasurQP3EMIttEeWHnF8zYNc47L8/T8ibPY+W3skuXMBVEmrw6rXntpEcVBiN9LGGEh
	+leBYF2EXs19wSo0ivUSEdH7JL0rWUZDYKlnMTtHphg97xSpghFSRsRhedhAZCVMAnyqgjMKTThM/
	6eEzIPdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTwZS-0000000AFoI-1kKQ;
	Mon, 01 Jun 2026 06:56:22 +0000
Received: from mail-m15577.qiye.163.com ([101.71.155.77])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTwZP-0000000AFnM-2x2W;
	Mon, 01 Jun 2026 06:56:21 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 408ded083;
	Mon, 1 Jun 2026 14:51:12 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: hjc@rock-chips.com,
	heiko@sntech.de,
	andy.yan@rock-chips.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	nicolas.frattaroli@collabora.com,
	cristian.ciocaltea@collabora.com,
	sebastian.reichel@collabora.com,
	dmitry.baryshkov@oss.qualcomm.com,
	luca.ceresoli@bootlin.com,
	dianders@chromium.org,
	m.szyprowski@samsung.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v10 06/11] drm/rockchip: analogix_dp: Fix OF node reference leak via auto cleanup
Date: Mon,  1 Jun 2026 14:50:55 +0800
Message-Id: <20260601065100.1103873-7-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260601065100.1103873-1-damon.ding@rock-chips.com>
References: <20260601065100.1103873-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9e81f363b403a8kunm111da268257e31
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCTBhDVk9LH0JLGBkfTUxNSVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=deFm5InC/687QsO2wD9nxR5fYYZQR36H5WyR7KJF0KeTUyaPkU8STH2VQz9pvWnj+2TE+JLIUqml7W+sBG58qJPg7nIH26eVRdsz0uOZkpOrBsfWXBoefa1qhQuMveCPVho4oNMRF65guiFZTdh8hDTp8lOke0EzfjvWwkH81kY=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=yJZuY68i6MDKTHNn2ykBZ5f5HU1REKA2FFFIWObwSW8=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_235619_956885_7445D472 
X-CRM114-Status: GOOD (  10.07  )
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

Sashiko reported a reference leak in rockchip_dp_drm_encoder_enable(),
the of_get_child_by_name() function does not call of_node_put() in a
symmetrical way [1].

Fix the device node reference leak by using __free(device_node) to
automatically manage of_node_put() for all device nodes.

Fixes: 729f8eefdcad ("drm/rockchip: analogix_dp: Add support for RK3588")
Link: https://sashiko.dev/#/patchset/20260527024336.191433-1-damon.ding@rock-chips.com?part=5 #1
Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
---
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
index d2af5eb29dbb..b1ed25cefe5e 100644
--- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
@@ -8,6 +8,7 @@
  *         Jeff Chen <jeff.chen@rock-chips.com>
  */
 
+#include <linux/cleanup.h>
 #include <linux/component.h>
 #include <linux/mfd/syscon.h>
 #include <linux/of.h>
@@ -206,7 +207,6 @@ static void rockchip_dp_drm_encoder_enable(struct drm_encoder *encoder,
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *old_crtc_state;
 	struct of_endpoint endpoint;
-	struct device_node *remote_port, *remote_port_parent;
 	char name[32];
 	u32 port_id;
 	int ret;
@@ -230,18 +230,22 @@ static void rockchip_dp_drm_encoder_enable(struct drm_encoder *encoder,
 	if (ret < 0)
 		return;
 
-	remote_port_parent = of_graph_get_remote_port_parent(endpoint.local_node);
+	struct device_node *remote_port_parent __free(device_node) =
+		of_graph_get_remote_port_parent(endpoint.local_node);
 	if (remote_port_parent) {
-		if (of_get_child_by_name(remote_port_parent, "ports")) {
-			remote_port = of_graph_get_remote_port(endpoint.local_node);
+		struct device_node *ports __free(device_node) =
+			of_get_child_by_name(remote_port_parent, "ports");
+
+		if (ports) {
+			struct device_node *remote_port __free(device_node) =
+				of_graph_get_remote_port(endpoint.local_node);
+
 			of_property_read_u32(remote_port, "reg", &port_id);
-			of_node_put(remote_port);
 			sprintf(name, "%s vp%d", remote_port_parent->full_name, port_id);
 		} else {
 			sprintf(name, "%s %s",
 				remote_port_parent->full_name, endpoint.id ? "vopl" : "vopb");
 		}
-		of_node_put(remote_port_parent);
 
 		DRM_DEV_DEBUG(dp->dev, "vop %s output to dp\n", (ret) ? "LIT" : "BIG");
 	}
-- 
2.34.1


