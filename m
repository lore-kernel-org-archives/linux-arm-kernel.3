Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEF2ECD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 07:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BJBXqIdMo0uJb9odMwXPl2LzKb3wWNT/icd4kKoMmsw=; b=LNyfFzu+ya0HItx6m9Dc0TI7Yq
	eUYRIVmDkLDJ5GCrxXGJwUQgzvP6bWUk/zQpru3DB8igi+652hvCmKc1EWtQ62imdDT0WcjR91Xjn
	clevPXKEfCAoQ7wLZuUsprdPDnbddu7AF7lWj68t2vDUNiC0krVLfko8rgiWbQWrlIzXYj5iuSWRU
	elaiqGyed2ZBh8SpTfEj4mCEyGR1gX81+Zh3bAIF7b4skpHOkx3IuAO7LWg9f5JGfi5FfWW3l7VmG
	JfIhDm9Scf5BIb1/4skpP/znxN+AaPSgC2TmdOiMYLp4mEgyBMmSAmSSt5rQY4J3tVyz8j3wpFMOQ
	91o3Lhkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWU7W-00000002xRj-0tVM;
	Mon, 08 Jun 2026 07:10:02 +0000
Received: from smtpbgau2.qq.com ([54.206.34.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWU7Q-00000002x9p-0Zne;
	Mon, 08 Jun 2026 07:09:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1780902525;
	bh=BJBXqIdMo0uJb9odMwXPl2LzKb3wWNT/icd4kKoMmsw=;
	h=From:To:Subject:Date:Message-Id;
	b=SD+s+nC3W+DsOCGoU1QcxXW4EWqB6d2JP1f95gV/OOD9gnl4cML8RdrjC/e767VwI
	 RnEDvavwREQgWBW/bBpZAKvaBkZzQFNsDllV79kA3VWpakr95knryR7a1Qcjgc3X3m
	 4EwR3mUUeYcIV+DIPODzOdHU0Z/Wulk4rXsyXHEA=
X-QQ-mid: esmtpsz10t1780902520t711901a3
X-QQ-Originating-IP: Jz5ZQWmRqpeGhkm7cKGk5fyrmUiArGhysVK7jI09zek=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 08 Jun 2026 15:08:35 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15018740618981124911
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
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-phy@lists.infradead.org,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: [PATCH 4/5] drm/rockchip: cdn-dp: Support handle lane info without extcon
Date: Mon,  8 Jun 2026 15:08:04 +0800
Message-Id: <20260608070805.88-5-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260608070805.88-1-kernel@airkyi.com>
References: <20260608070805.88-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MIAHdi1iQo+z1GmPE0rKtuhunHepKwu2QTXP5QZ7eFdleOfePEgY5NH0
	QVzvXJg1x0c2a/Gt0jIJlxu6Sgb+4Rb927BifXkNuidf4ABON3de+0rzGt1iWL0FhBxiR8Z
	WStYOvrkpVIfcmYFuP+1DGa8yauLsRfjcWLrOCD+x6SVThQcOON75tItbIFnWl3OJv1VeCv
	o/U+ny+tDSkI5U3AHK9tEvkyyQay0ZbMrVopneZaZmYnOAOca1BWXq3WInEcGDw6bYd8clo
	Z7kdbK4mui3MaJ4nm2JRYwvp1/DPuuhBIMNbGV7GTfE1uxz5EWWCOE7r3GA51pwkkUh5QwU
	tiRYQSX0Ma+n5iujLMIkFiJUybVgX45M/sA8qcxki/WaUZj5IdLavIQjKrMpWnx3p0sxuDm
	MEg91cW1yi8SzIsF8vdVNKUTvU4WMpXLzHOjinKUt2XtEkIATFdLfFo24uFmtaP8YL8AZvo
	kFUOEybLdVfAxhSmmMEQMDJga+8qqianA5yA29Ocke6sV+al31g6GFge93QOGzO99V/5i+b
	jTM4hA3zRSbUHfT+sqflTYKshrRYk2wBwIW4qwjIFjPkAkZt6NoYM9r7phgqnCDZGUaZ0vx
	ME4E/xWwYMX93o0wV5t3YV7L534EnJc6LCXCJGg91178zRaQ2TAhPGB4BUV6XJ9GQjrqaOx
	8TO9c+8/uY5EC7W6vUitDsNIvlZ7tyshnX0L0EQ0ZDBHNFvc1mS9MKZod3/HSPkSjB44K+U
	bYDVXy9dV3E3vIuSSb7SM98SaoxHqPVJWjqMM5Z1Zl3PkZxyJbICkMqObSaXe4eKPG7VwcO
	5zD4yGT2ZW0W8VatdkZQofoSpK7ZLI2j6kcmuCqWJhkTj9QtEC6UO/ZbeQhfolSjRdQFCzD
	3Zu9mGM2g5oVXHi34YZbYO5dMQLCoadhEJdyabTQUuFT/6MPH44WUUQSbCl5CwnxmpsZnuL
	c7AzXmSZ0VYlBCGZIVCKtzzfugTm1+3C2R8wXrdufxanBNpvyzTPcqDFqkypSGU6vWyrEI1
	vCVb75bUH0BcuYNQ0kWeykG9Gzw0X+8nibzIqX+pKh7OuWlUy6
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_000956_974517_179921B9 
X-CRM114-Status: GOOD (  15.40  )
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
2.54.0


