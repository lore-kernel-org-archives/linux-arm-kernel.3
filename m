Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E504FC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 09:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RN1WwuxpO4LBAyRHMTh9poQETUIZdvEm0QRwkE/4D2M=; b=iH6IRpiyAQ2G9QGIetBK2eIhFT
	xh3lplDClhz9ylkQsfA+PVbH2JfQ2NZ0Tee/Nshh+TDHyuo3VNUhvhtYPVMOCv/k4h8RhTC4MpGRY
	PGh0StgNNfrMsLiWpm5v4hsJiCkDijX9+if7xd09kMVGP+MClOFX2aCaoSlX1yuHkFomknGUjTTM/
	cQ8WMUFFpoexfHdxUztGW3qkdWK/ik6MkvgX3zm+90HOLoYQsujT5foPkCeymz+jwL4/SvI9GhgOE
	hehUjPBFkinyVE7enGOoTVUXY04XgStjkXoq1hYiXJ3tYEqQ+pAQliUB0+Z0eeBsiT8dPp0tjPwGf
	FsGUCXDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uggG6-0000000GKfS-1NYD;
	Tue, 29 Jul 2025 09:04:30 +0000
Received: from smtpbg154.qq.com ([15.184.224.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uggDb-0000000GK46-1UxS;
	Tue, 29 Jul 2025 09:01:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1753779659;
	bh=RN1WwuxpO4LBAyRHMTh9poQETUIZdvEm0QRwkE/4D2M=;
	h=From:To:Subject:Date:Message-Id;
	b=KkG2ySehTeBQkOmAt5k0R0G0NtoKWFklOzK/saBy4xqKa4sCChrtgN94J7N5xFzrp
	 c+GR9alQnc8GoIXC0vMY9Iv00LAMx1vrLZJa0cKv+fQJWgK/CMQ4bKz9SKGEyjQ06I
	 fzPL0v6NBxA56RH4ieUKQAP6cSgHIF210+CbCdj4=
X-QQ-mid: zesmtpgz1t1753779650tbf9605c9
X-QQ-Originating-IP: HOYsq8iA7FlhH8Rvf76IYCZ9Rt5I5SBH31MTUBKXFD4=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 29 Jul 2025 17:00:48 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 18407573237461644155
From: Chaoyi Chen <kernel@airkyi.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Yubing Zhang <yubing.zhang@rock-chips.com>,
	Frank Wang <frank.wang@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Amit Sunil Dhamne <amitsd@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Johan Jonker <jbx6244@gmail.com>,
	Diederik de Haas <didi.debian@cknow.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Peter Robinson <pbrobinson@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 3/5] drm/rockchip: cdn-dp: Support handle lane info and HPD without extcon
Date: Tue, 29 Jul 2025 17:00:30 +0800
Message-Id: <20250729090032.97-4-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250729090032.97-1-kernel@airkyi.com>
References: <20250729090032.97-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: NNy5VkfPTUBB1aBU7kJ+xjDPayt1AIYaz0QiCOWf2xy80aMQ08Nyl71m
	13siKxWIvK/ee0aI3k6b5OwkPXiplWUcRfVJ1i/3x3rZfKOfNUU6hIpgedzvxrdv6ib4o2F
	4Dg7nYIToKWu/Uvdr+th/bC45+fKLQ0e77vk6DDRhFOOLSjzIRZjVRQfhBb9nMLt7Bipj0k
	sx8chqQWYFMNqgXBdP2wjuIFSAO14L7Vbr5YPkVUULkM3pRd7WlNI9VExPy5WEyuiegzKBB
	1us94CwyVHflMMqnUO8lHexOFD8jSf3s3tnbRWfTxGF/cfSexCMVD23tKgQLcni5eeJh0+/
	BTsnweVgI9UrDgmoLAlnkMwHbMnzFq48DIwBg6qki/MYJkaHC85/EueK5H9v/HAbTFhbPvu
	nBsLoemqVT8bukMZdnUtDsLovN2XFtYzH+tOZwPs1mdEGErEO1VojvV7CZqH1ouoI4syHe4
	iBc+wA5YUsrh3NjGSUHOyncQyxOs725AtZPMo7w85fXr+fsYj/QCrLCNsx+nZlLwRDf0Q2l
	XPhUb2s6tXMGTiHTfa5BndpqePnJirs1B8FGn+kHQIrPKCDOzi8fnnfbR742Nfc4CHVR3+L
	8OUu0a8tDuAmv5+2aaq8TkSTB44ytqssZQWq0NkGLDoK15z0EVoYazwbxoncgHpeQUxOvOz
	vpDVc2A2wFhBDjO+oNsgMc9yEBryaXZE9LqBlIIlAtAGWdq39j8WN7Vp1XY5PQ2CGNSpaXk
	51qUOVJRvlLTK9mXIXPyJe9gCD0xVxJe6pR2NzZvEhPFe8D9KbdX05DVBaJSSSoZXgbIRwt
	87AEkky5h507WPQIsit+jpxVZ2gvk86oZ3GdFZUeNxbBomzU/3y5Rpq7u2BVgqQv4NYZcUU
	9zmk6KzEI8a/m4nwoBml0eV4/BK7s+owv7E4rOvyDKydN7loVIETLgy5Ok7gHpqA9++jg6P
	TNETq5q7OZUIdYi7/obMHoLI1lGHGrAlO6d+6Xai8TJXXZtQyPNt9rrm353vmh5SkwSAUJ9
	D3eNfE60Kn1E5XXBwU
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_020156_012840_15475C3B 
X-CRM114-Status: GOOD (  17.67  )
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

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

This patch add support for get PHY lane info and handle HPD state
without help of extcon.

There is no extcon needed if the Type-C controller is present. In this
case, cdn_dp_hpd_notify() will handle HPD event from USB/DP combo PHY,
and the lane info can be get from PHY instead of extcon.

The extcon device should still be supported if Type-C controller is
not present.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---

Changes in v2:
- Ignore duplicate HPD events.

 drivers/gpu/drm/rockchip/cdn-dp-core.c | 37 ++++++++++++++++++++------
 1 file changed, 29 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c b/drivers/gpu/drm/rockchip/cdn-dp-core.c
index 24f6b3879f4b..b574b059b58d 100644
--- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
+++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
@@ -156,6 +156,9 @@ static int cdn_dp_get_port_lanes(struct cdn_dp_port *port)
 	int dptx;
 	u8 lanes;
 
+	if (!edev)
+		return phy_get_bus_width(port->phy);
+
 	dptx = extcon_get_state(edev, EXTCON_DISP_DP);
 	if (dptx > 0) {
 		extcon_get_property(edev, EXTCON_DISP_DP,
@@ -219,7 +222,7 @@ static bool cdn_dp_check_sink_connection(struct cdn_dp_device *dp)
 	 * some docks need more time to power up.
 	 */
 	while (time_before(jiffies, timeout)) {
-		if (!extcon_get_state(port->extcon, EXTCON_DISP_DP))
+		if (port->extcon && !extcon_get_state(port->extcon, EXTCON_DISP_DP))
 			return false;
 
 		if (!cdn_dp_get_sink_count(dp, &sink_count))
@@ -385,11 +388,14 @@ static int cdn_dp_enable_phy(struct cdn_dp_device *dp, struct cdn_dp_port *port)
 		goto err_power_on;
 	}
 
-	ret = extcon_get_property(port->extcon, EXTCON_DISP_DP,
-				  EXTCON_PROP_USB_TYPEC_POLARITY, &property);
-	if (ret) {
-		DRM_DEV_ERROR(dp->dev, "get property failed\n");
-		goto err_power_on;
+	property.intval = 0;
+	if (port->extcon) {
+		ret = extcon_get_property(port->extcon, EXTCON_DISP_DP,
+					  EXTCON_PROP_USB_TYPEC_POLARITY, &property);
+		if (ret) {
+			DRM_DEV_ERROR(dp->dev, "get property failed\n");
+			goto err_power_on;
+		}
 	}
 
 	port->lanes = cdn_dp_get_port_lanes(port);
@@ -821,6 +827,17 @@ static int cdn_dp_audio_mute_stream(struct drm_connector *connector,
 	return ret;
 }
 
+static void cdn_dp_hpd_notify(struct drm_bridge *bridge,
+			      enum drm_connector_status status)
+{
+	struct cdn_dp_device *dp = bridge_to_dp(bridge);
+	enum drm_connector_status last_status =
+		dp->connected ? connector_status_connected : connector_status_disconnected;
+
+	if (last_status != status)
+		schedule_work(&dp->event_work);
+}
+
 static const struct drm_bridge_funcs cdn_dp_bridge_funcs = {
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
@@ -831,6 +848,7 @@ static const struct drm_bridge_funcs cdn_dp_bridge_funcs = {
 	.atomic_disable = cdn_dp_bridge_atomic_disable,
 	.mode_valid = cdn_dp_bridge_mode_valid,
 	.mode_set = cdn_dp_bridge_mode_set,
+	.hpd_notify = cdn_dp_hpd_notify,
 
 	.dp_audio_prepare = cdn_dp_audio_prepare,
 	.dp_audio_mute_stream = cdn_dp_audio_mute_stream,
@@ -1028,6 +1046,9 @@ static int cdn_dp_bind(struct device *dev, struct device *master, void *data)
 	for (i = 0; i < dp->ports; i++) {
 		port = dp->port[i];
 
+		if (!port->extcon)
+			continue;
+
 		port->event_nb.notifier_call = cdn_dp_pd_event;
 		ret = devm_extcon_register_notifier(dp->dev, port->extcon,
 						    EXTCON_DISP_DP,
@@ -1120,14 +1141,14 @@ static int cdn_dp_probe(struct platform_device *pdev)
 		    PTR_ERR(phy) == -EPROBE_DEFER)
 			return -EPROBE_DEFER;
 
-		if (IS_ERR(extcon) || IS_ERR(phy))
+		if (IS_ERR(phy) || PTR_ERR(extcon) != -ENODEV)
 			continue;
 
 		port = devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);
 		if (!port)
 			return -ENOMEM;
 
-		port->extcon = extcon;
+		port->extcon = IS_ERR(extcon) ? NULL : extcon;
 		port->phy = phy;
 		port->dp = dp;
 		port->id = i;
-- 
2.49.0


