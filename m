Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D4B0CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 03:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Blt27VidEVpijM8X7bK9ygiXu5vv9uysAwWQfZr3MA=; b=iiJNqYZLbMncLX2u/YBOOdL7j+
	FET0cSx215fxF+oz7By09yEbJYHTJ/sCjnHVmKqu6fZ6Fxry/0KrNeSPowwPe/VpS3oM5GI20oD7x
	JKp5bDfUPzL5M1AT5Kv4yFW9i7eYBq7xmZZeF9JKeJwzXaydAMkijIKJR2GVUrfwMlpBs9y8nOAPI
	WsGj3JxzfhQDrA4V2KmKCmBjsO4fj2XmT6nhlCr/NFHLD2sadT4b3RE6OULNVXoE1ahjtinGBP/JI
	0ofSoMxNOESz/DBF9/iLDGvJcTqbNW2DpNdm4J34B8SAwI96lDN8Nce4CIVb33TOsf5l0hrmxzjmy
	bd2AiYFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPu7J-00000006YT6-2OZ9;
	Thu, 21 May 2026 03:30:37 +0000
Received: from smtpbgbr2.qq.com ([54.207.22.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPu7G-00000006YDq-0od4;
	Thu, 21 May 2026 03:30:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1779334185;
	bh=6Blt27VidEVpijM8X7bK9ygiXu5vv9uysAwWQfZr3MA=;
	h=From:To:Subject:Date:Message-Id;
	b=LCbgyyVN8Y3VWy0AWeivpnVl52Ob19FHASafPAW8FxnSKQYaHN6hrgKVuyff0PYGv
	 WCjbZuC4yoEjRLiwYhzVlnaqspLN6F00NfGyvrZIvSjuEzjpJp91qXbhoqRWOaE/7+
	 iLMES5soyz21YNPtl6RObzgTArM7d4ezmtCV12Bc=
X-QQ-mid: zesmtpsz7t1779334176t8f9eb7f1
X-QQ-Originating-IP: d9IETWuCTenKIZFLByWwMHwi0SPZNsWnhksHBq1ofsE=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 21 May 2026 11:29:31 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16407384103375472347
From: Chaoyi Chen <kernel@airkyi.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
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
	Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Vinod Koul <vkoul@kernel.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-phy@lists.infradead.org,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: [PATCH 4/5] drm/rockchip: cdn-dp: Support handle lane info without extcon
Date: Thu, 21 May 2026 11:28:53 +0800
Message-Id: <20260521032854.103-5-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260521032854.103-1-kernel@airkyi.com>
References: <20260521032854.103-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NYG9n5uPxz1WzqGisP2RA1C47w4anwHznAWnLiTn0NxmUUnajisSSOtu
	J9jspH4MXKVpQblgmvcRwFJypGUaDcWqrUtDNCaMtc/F9DPpeVerPOgmjKHRe/oNtgGKHqI
	rGwWstzredojZ7AVeBzQIO2OvD2/Qfc4izBQFfTapo/cVhRwWDmMAdZkEld48+yDBav6HJU
	Bmi/q2Hjn+zo7dM2mCd0prC216cma/hrNONDt1R3yDDUYRv//JRTeybcvGvOsqc4q9VqCWc
	aCR4EgXr1Ft/YU80qLgeCNd14X46D5gJdvkxqSkyC6CqVQCjnLT6EBbRFXte8kwbxnMulDk
	T9se5keNBC5V/WU3JHjZR40QpR4ymPyLUCtfc3aUxswzVvx7Ebfqw0PIeG7SF13+gxnl9v2
	+Uaf8WjRrh9ZT4Bp7bEDIDlkf0MFrzQ0jD07EyXj6uTKqsxFkq1bRxaJPMTjc6WHsfROMVu
	4m182/PLoOA/mHXqyf7YkdSZvBoMokMz9DC7a2IezoTjVKzjIcmFw8FbEZKAGPt5UdT0jop
	miZhYtPQyaWUhUJwNfMgyJ/oNyyyj2K5LDdkbGGW69c3jbTE8CDLywbh2hateCpBGhRwQmH
	sBneenwEPPttZ0zikviXFob0S0peOaE8jB+U+L07KBvQyHehV8I/dDBbbdFaP3FGu3pI1s0
	Ia4CTO9fOFqyx3Wmb9gqI9gUIUiTl5ftknEpHUqWHdB7NaENgsVfZTJPxNoF2sd17+rAFCm
	VH01jfURXG0yazrOa9k5QrLaPP12owWOtS6j91hWq+nqM2IuAHvoEvU16uM+AnT/gNgp4q/
	je2mhIXRtgQvGMkOoCc+Dg7m5x17tatxOXPlfI8Sq/I+DAr4s4BpuKuoPmhVwcQ2iWkTft9
	8X9MaC20A82gicFjcwottTwB6I/Udd56+N8FxEDvz9JZ9+VcOLIAis/cD6nR6YnGBi5iInQ
	FVd2w6IMuTcnAs5WmIvejWyFtaZqDe0qsHAGBgwuH9BlWdRql1FozYy7455VjnJ35pUa4hQ
	ymsBIHsnyzYvfYQQLJHBXt29Irq9d+tsRF3mJyD4YZko0mQCIFXN5HPA5EsS4=
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_203035_095538_4ACFF076 
X-CRM114-Status: GOOD (  16.89  )
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
 drivers/gpu/drm/rockchip/cdn-dp-core.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c b/drivers/gpu/drm/rockchip/cdn-dp-core.c
index 177e30445ee8..9068118859e2 100644
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
@@ -1029,6 +1035,9 @@ static int cdn_dp_bind(struct device *dev, struct device *master, void *data)
 	for (i = 0; i < dp->ports; i++) {
 		port = dp->port[i];
 
+		if (!port->extcon)
+			continue;
+
 		port->event_nb.notifier_call = cdn_dp_pd_event;
 		ret = devm_extcon_register_notifier(dp->dev, port->extcon,
 						    EXTCON_DISP_DP,
@@ -1121,14 +1130,14 @@ static int cdn_dp_probe(struct platform_device *pdev)
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


