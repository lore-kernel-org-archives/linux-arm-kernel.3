Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4487CF64A5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 02:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sEWMlrnina66f1mkg7MgIF551DMwzRk8lseSsYVXv/E=; b=Kh1lwMP+w46+KPEnvD5YLCCAMN
	GxizyONcZcdJQyJo627rHqEzh5U/LFjjsuaZGjGcLjazMhAw6LANbWsAStdZR5cxuTzQAT+RmxRJ2
	o5SW+rmYRL5qOEGGCk2B8I6DqIcGu3iB+QScZPQvkZ9isQFYDM6FreqzUXUm4RpwC+Q6XoHaClRbX
	fne9hfDU+anR8OcR6eMDaQYiKFwl5cNpKEzVVGii/lP0LL0IlGaucgLLKQYylN2QN8oiCPBtrNkWv
	57tAhObN221iv3iBmXJqvQZXdmxTmV/CuON9PDwvUXeuivnwo9BscTAKjeYYqRFtX8tCa8/OmO8Zv
	QhbTpB2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLuMc-00000005z5m-1MqF;
	Thu, 20 Nov 2025 02:25:38 +0000
Received: from smtpbg150.qq.com ([18.132.163.193])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLuMX-00000005ybS-3QWg;
	Thu, 20 Nov 2025 02:25:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1763605468;
	bh=sEWMlrnina66f1mkg7MgIF551DMwzRk8lseSsYVXv/E=;
	h=From:To:Subject:Date:Message-Id;
	b=jFkSOGYd4bz+2FClvD3d3hLyu6AnySMqt4ApzTkigiblWt6x/mm0izUIn2DsoEXta
	 lKEB17d1IhfHAdjiKIuFYJ2kE8ozBd06ogAKcria8KLgiwoWnQfvGSpGBJiw7g63xd
	 Ulbk+zT/AhH3q3rNY/RDpeT5LDlDdE+B/hAhsdDc=
X-QQ-mid: zesmtpsz5t1763605466t8c66b672
X-QQ-Originating-IP: S+B8JF/DgVa037R2Bl9AzL46KN0sWhmzCpkklai7gIY=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 20 Nov 2025 10:24:23 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7295887295416375369
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
Subject: [PATCH v10 08/11] drm/rockchip: cdn-dp: Support handle lane info without extcon
Date: Thu, 20 Nov 2025 10:23:40 +0800
Message-Id: <20251120022343.250-9-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251120022343.250-1-kernel@airkyi.com>
References: <20251120022343.250-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: M1POTEwfcn6kRiZbosOVcjQ5H7e6e2orngQ+UJGPVtvX4S6QFM4g7KKg
	CSotufuW+tonO+p8dO9ZD3RVZfXG5UxwlXVQZ5VUuclxr4y9daSBVCYS8yamzrSiBNVYMli
	cVCm6ooQJ1tOOBMXFFhBwA84q8OqHQP78rjGsZgSgHz4dIxWPCWnz2sMy8RRmDKSegayz8R
	K1m93/lRL05yjb0GmlDqNXgKRz08wM6d6lwv0af+O5VyOVRHRV2Rb477+JXMmwweonLOzRz
	Vtq3dsIeRaOxG3g6CPsDZwfiDB9NHpXbW7OYgMM/5m60Jh0KsRzbMtAbDbPfnlXlJE8IsNi
	9Ieqk2WTdp6pBOrxtOYk2y+Ip0lCqW6QxlveRTc91jwjrrgNC9HfDcANchOdLDRD5oYXwnN
	CgHdKYRMyu9hgmqSA6A9hGRfstePkZnyrm+v9T1QWGaOWaSz50V+IWbyl6NOkBiJPi89z25
	HUq91r287YQ0L0IWFcDEzoEucheRH6XoxZsOk1dgTfvYj3g7jwrT/v6oXSmcv+UIkO1EV/e
	f1WPX/bXibF7TUv7/1aUONundRU26kaxT3vLoNCVTQBxdZxZ6sC1TB53hhcQpzwYDGE72xL
	E3hKS5TA/PcUwtUxv0dZWaSCLa7igNO0VbEbkxyQb8yf7yfaLd3vQz3fHLadtIU5vc73aRD
	7PLMw4PK/9r6S6T8nF9uT2nZJ5pXMCVy6lQc3x7fMhH6AZLRJZpFTpRYCgGCIia+OB47MEc
	AVqgKfE6VW/HZLETZiZY4ABtQbdZnNaCqzRg2a5rDQAURxqVA33MA2fykF5XYLrTi+U/mrE
	UeVbiWP9c9t2LtfVZgAlV0WXWNLAUG5uQdB6dJFXupZHH+t3rDUQkZ9JH3vVKE5TxizdqCz
	ZO9SSWf7VucllIxaWKoID4xWxV9OAl+C11ny0QwV120KaxhyvedZESz+v0X4eSTPsEMLQoY
	x3LiHEht4p7CaJxfHRZJo5TBIDQfhuelh9MEz2eHkFWpTdHd9NGljq10yTsEcZBpiOxQg0V
	pmjRkL0XtYDptQ1seY4qHfyaduuGk=
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_182534_207006_9E907B9A 
X-CRM114-Status: GOOD (  16.30  )
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


