Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EC40D111A8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 02:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sEWMlrnina66f1mkg7MgIF551DMwzRk8lseSsYVXv/E=; b=4r0Dz3FIsXE6X6D1qMLNIj2YUB
	etH6TwUJ11MtxSZ773gd1I70t0jS0dJf9Bl7tHJ+PmdPkEfeIrRQtWq3d+uwwVwW9fICJYxE8J35T
	8Bm1mt5QMZC3+oIJw78oyN8yS1Z6m9DvXUUzJGbjDxceTNJINmBcOhXtYk1khlpRpW4SE2I+g4gwf
	rJvNOSOXSfybW7Wboczysc9T0gpUZZu92IQ/zw++yuz+0k8WIYzshEZnSjVaCLbm/ODDUbm39wMMR
	c/gOSEiHkezUMgOEllXUAmF+WXfp6euTsnXGQiyMQEznlqZ10IW4PXXkOZZST+tId4DL8HD8JbeEV
	ODQzSm6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOnrh-0000000HQdI-0yoy;
	Fri, 28 Nov 2025 02:05:41 +0000
Received: from smtpbg150.qq.com ([18.132.163.193])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOnrV-0000000HQIA-2Arm;
	Fri, 28 Nov 2025 02:05:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1764295493;
	bh=sEWMlrnina66f1mkg7MgIF551DMwzRk8lseSsYVXv/E=;
	h=From:To:Subject:Date:Message-Id;
	b=gdit/o070EBoAyWli+7QQCItqwMQ2Up1hFAVsO0ay7+AJQmxBmm+8UrZuWBBSthv1
	 8o8/f/DxahSlUGUU/UFayVwPk41V6VVrl19MYtm8JLs1e6pmGMgOHoN7bxtcHBarzx
	 Jti0U7QtiGyaT8pr/aX8R4BBeLbXXsp9ITaAbLWw=
X-QQ-mid: esmtpsz21t1764295492t39aeb65b
X-QQ-Originating-IP: HkeozkZkjMzhIQB9uVBGumvb7YNkx7zQ7Dq6hE3efOI=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 28 Nov 2025 10:04:49 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15549458326781898726
From: Chaoyi Chen <kernel@airkyi.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Peter Chen <hzpeterchen@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Yubing Zhang <yubing.zhang@rock-chips.com>,
	Frank Wang <frank.wang@rock-chips.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Amit Sunil Dhamne <amitsd@google.com>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Johan Jonker <jbx6244@gmail.com>,
	Diederik de Haas <didi.debian@cknow.org>,
	Peter Robinson <pbrobinson@gmail.com>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v11 08/11] drm/rockchip: cdn-dp: Support handle lane info without extcon
Date: Fri, 28 Nov 2025 10:04:02 +0800
Message-Id: <20251128020405.90-9-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251128020405.90-1-kernel@airkyi.com>
References: <20251128020405.90-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: OHSHjS6XsuHx852Grv9DhxXgVvfUudbSA35Xril7DiajUbm6Ig/06JzO
	NnjZJCvB6RbtzjQHd/ncdY+ODatdZy1wqmQ2dMCCTLTJ0PqlFxc8G0gAegnRRQ6hXZQ79XG
	Q4pgwHedjYhv+zhYGjF9V0Z3EZ5t4vKO8cnfQaeKgzO4j0txza1ae4hc4TVfto93v3VKZ2Q
	azFc2w80lkJiGTotoSpmwlfEwtx88tdunFpGNF5juM1NILC84DKxxQb72RflQuyrPZflbzd
	2ePyrD4+fSJiy+YpD/lgqMyXJKbvABXOWdawVwZs1ivW4AzxxWpBG9q4stXVCVxZO0ytaTq
	OlRYyNyzMfj/q8HAt39veRLD/WQgZJi1M1Qvn6dLulabiY0nQi4+v6htusvl5hOnQqc6S/l
	8r7Nxg8VfSPuB+2CKdk1XxFZnltm5pyX4qZ6PNj4I9HY7Diujv7tLr/sV8KvCh4v/nGzy8m
	nX05UesJh/JRzAWW/LGA/6jso9ZvEz+dJEBs2DwsSkc+JfdNtV6dN2vPLA6yiT7XUEx91D2
	ZCWFuKdmVv8QMK4QWk1/VkcUDmZ7ttHpTtwpWFrvAc+oBG3VPH7vp1zrbT3Y/vR27NL9GAS
	pZWFMn43EvzsXOqp0bj8qDd2rf3eVhAhjcAFHmlrzRF4BHeHkg1ey0ff2w/O9xyQCxbJU+j
	r6sdrPEiE87oSpOP9vEmM3sJKe8UxsIdsmO4vcipnVHUt6XlN2c+BKvW3o3QDvIISQvdft4
	2qa+REQW8TrLFPWvru76P4AN1dnoN2Gvog/t2Os5leI/QXd77V6DE453TQQUUIWf0pos5GE
	7ue6Bl5OrOxV7tsJclHy/i+8s+ermyVY5kOGLVbHP/S+qZ+G+KEOyTF1K9DvRPxAmTekzpx
	HINoS+8nUfIxwfuoz6Ryq7uS5ZJkwQrG1/iceLaWxcjktAaQlZEEDoCw6k0+r5Ss4eTDAH7
	9jFq7VAEYXJx5WpNzN+RyS2g1U7AlNZoRf1T86Qq2zV1aShOnbn2QOfgnkBqUp40DX+V84Y
	etfrIv1uYqbMvopUYTeOS+QxZ62oBJdR7o2GTpvw==
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_180530_088596_1B402700 
X-CRM114-Status: GOOD (  16.31  )
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

This patch add support for get PHY lane info without help of extcon.

There is no extcon needed if the Type-C controller is present. In this
case, the lane info can be get from PHY instead of extcon.

The extcon device should still be supported if Type-C controller is
not present.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---

(no changes since v5)

Changes in v4:
- Remove cdn_dp_hpd_notify().

(no changes since v3)

Changes in v2:
- Ignore duplicate HPD events.

 drivers/gpu/drm/rockchip/cdn-dp-core.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c b/drivers/gpu/drm/rockchip/cdn-dp-core.c
index b7e3f5dcf8d5..1e27301584a4 100644
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
@@ -1028,6 +1034,9 @@ static int cdn_dp_bind(struct device *dev, struct device *master, void *data)
 	for (i = 0; i < dp->ports; i++) {
 		port = dp->port[i];
 
+		if (!port->extcon)
+			continue;
+
 		port->event_nb.notifier_call = cdn_dp_pd_event;
 		ret = devm_extcon_register_notifier(dp->dev, port->extcon,
 						    EXTCON_DISP_DP,
@@ -1120,14 +1129,14 @@ static int cdn_dp_probe(struct platform_device *pdev)
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
2.51.1


