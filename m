Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3830C531FC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 06:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hfSDcA/VFf5O36XZ1jIbDeiIvlPOe5N0iYnQa5D5SVg=; b=gwOai7UDEnvqR3ottyQ13cZM40
	Ev30lSQ9bBTKYL2nAF5CeuiwcRzLau6LMuk/IGhmDEGdvRsV35gWiDkm96mLN35lETWu02ncCliRC
	gbSzDct8kw98fBOsX9rF5Ah/NL1moxdRR3umcKHqEDJmRbZy5BpA7+hcQ2jj17TXE/m0I1xqn6n7o
	rLuWiGwR1vusycRes6RygoosQ6P8HKVc+647aC6u22jaKEYcmyO/p9txH1CGLeOMkurrVdix4yA+r
	bO1oeomV/WH0DiL6fbJYTdY5aopCRZAA5wxXJiAv1/VvPA4kCzNzqbStP9oMJwoGJ1I0MXBUgWu05
	V356lXtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woF60-000000023HE-0oXe;
	Mon, 27 Jul 2026 06:45:52 +0000
Received: from smtpbgau1.qq.com ([54.206.16.166])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woF5r-00000002310-1cZM;
	Mon, 27 Jul 2026 06:45:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1785134690;
	bh=hfSDcA/VFf5O36XZ1jIbDeiIvlPOe5N0iYnQa5D5SVg=;
	h=From:To:Subject:Date:Message-Id;
	b=AMflhvr8A+NH6hwlzk/MHyKNHoyqzuMQwUqFRay9/0IDynqFNCp+wPQ43oFDVd/Bs
	 AESLHIgayuDF652pnWBKGs5zFUEo6a0QKdhJ4t8Gh0nNArKI9QE+qFjB7DHSl1COVD
	 ypmFIIWIv9jhQm3el45GNul82EYdpj0kpHWbWGwc=
X-QQ-mid: esmtpgz10t1785134688t5dee5c19
X-QQ-Originating-IP: JD2yQrbP0AKFsNHvK+l6Wv5zjAVvpOG41JCgU7YJc/I=
Received: from DESKTOP-8BT1A2O.localdomain ( [61.154.14.86])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 27 Jul 2026 14:44:44 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6495474740739693013
From: Chaoyi Chen <kernel@airkyi.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Vinod Koul <vkoul@kernel.org>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-phy@lists.infradead.org
Subject: [PATCH v4 4/5] drm/rockchip: cdn-dp: Support handle lane info without extcon
Date: Mon, 27 Jul 2026 14:44:07 +0800
Message-Id: <20260727064408.101-5-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260727064408.101-1-kernel@airkyi.com>
References: <20260727064408.101-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MUe2PhP7Eq79FMvW41JmG4vAurHtl/yWUrsJUyFwt0wbHYGVGn3HuSWN
	kNrh5DMV/bmmdCKyxjeDaXfuudmLLYI9RXFriw/X7+uNRlzIngtihnTMut7PWvW4HaRvLns
	dUUtNtt569JH9rI6JppgWgjURBLOzSBMGsp4otGA7b5kqy/hpI7PRhq3LZ7KgI7ADF8XAGL
	iSSsK6R7zl3YlnuNGVWoYFze0VHkc7AQh/4oj9KWLQbknL7q0bFxrJ4T30hMtJkZ0fqe35Y
	vxPAkJ4CcVpfT/bLU77gy/riE7sA38z0smxL/JxPVXFXfm/YbGtpOHsW6FY2k6ySP2VH3nw
	cVdLy+2VQLrbvru+1gX1sWq0/eEMrJctpWnD49JR/52ZtwNs/Po9Fj1iAv+Reya11DyxwFN
	5RxVzSpBduv6RtB2k5C9RYr6flQBiZuzBtWuEZD1W6GDxyE4dLtPCmu80rWljOoLy+3n9zu
	Id9qBXWWhPY4rN4ZWIUhPJtfLiJNUWxPnecos34RBy+yL5JeqE7Bmg3Bf1acMYT0VS67shW
	Om6UsHKaN4fdwZk1MCHRN+2ky6uBpuixP8Fk/mh8Evb5qy+QXdtQl01F0TwMtRJItbgdcVX
	df2dafiLwRH/UAk+qw0mOhcisbSB2+FmcgkjTE0JFFVWaOmtDkj+RcuD1o+LFXLayN+yJ7y
	SHZt5TMIOKgP209bdGYkApcz1hg+cXIRjKAPwCAuJ+azqgl6SwG9Z+v6irKHP8DveGpO4+1
	9JP4LZIkJm2ngLLWAlB9W15xB+kP8VJ2xcvrcZHwhFX0zWB2xPytnV6mIB9o2ZBaANulIDY
	MXZ9NMl3swrZYupWVIPnCQQGWmTvlpEQNhK9mKBeBp7aBDpzVEpc5Cey+9ncev4cHog3Kfv
	jx8yB00gBBi7zaXNg0p9vZb7aBmGch4uri4les05X+awWTYJgVvpzg0eZqQt/JA6P4FapFv
	MgXH8Op1sM1BTEWjBpy5X2+DN8YI+u9cN7DC6LK1xfhO9S6qVK+2yKzbI4Jxliw2clOmXYF
	6NzHzImcGuypMHYd7SypVf+xbPKtJQhiHAP1RnCg==
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_234543_910239_4F7DA51F 
X-CRM114-Status: GOOD (  15.24  )
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
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
---

(no changes since v1)

---
 drivers/gpu/drm/rockchip/cdn-dp-core.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c b/drivers/gpu/drm/rockchip/cdn-dp-core.c
index 190cce9530c8..74e1f5422a6e 100644
--- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
+++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
@@ -157,6 +157,9 @@ static int cdn_dp_get_port_lanes(struct cdn_dp_port *port)
 	int dptx;
 	u8 lanes;
 
+	if (!edev)
+		return phy_get_bus_width(port->phy);
+
 	dptx = extcon_get_state(edev, EXTCON_DISP_DP);
 	if (dptx > 0) {
 		extcon_get_property(edev, EXTCON_DISP_DP,
@@ -220,7 +223,7 @@ static bool cdn_dp_check_sink_connection(struct cdn_dp_device *dp)
 	 * some docks need more time to power up.
 	 */
 	while (time_before(jiffies, timeout)) {
-		if (!extcon_get_state(port->extcon, EXTCON_DISP_DP))
+		if (port->extcon && !extcon_get_state(port->extcon, EXTCON_DISP_DP))
 			return false;
 
 		if (!cdn_dp_get_sink_count(dp, &sink_count))
@@ -386,11 +389,14 @@ static int cdn_dp_enable_phy(struct cdn_dp_device *dp, struct cdn_dp_port *port)
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
@@ -1027,6 +1033,9 @@ static int cdn_dp_bind(struct device *dev, struct device *master, void *data)
 	for (i = 0; i < dp->ports; i++) {
 		port = dp->port[i];
 
+		if (!port->extcon)
+			continue;
+
 		port->event_nb.notifier_call = cdn_dp_pd_event;
 		ret = devm_extcon_register_notifier(dp->dev, port->extcon,
 						    EXTCON_DISP_DP,
@@ -1119,14 +1128,14 @@ static int cdn_dp_probe(struct platform_device *pdev)
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
2.53.0


