Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59E29D2CE17
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 01:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sEWMlrnina66f1mkg7MgIF551DMwzRk8lseSsYVXv/E=; b=vFkzg2dxtQMzFss8VR0tb7Gj64
	cHgqUGacVCg0IVh95XYi7ab5u1hjT0GeNGscEModU3q8GauT+wt0gg+d8rNq3t3sXftqLA4EQPu0J
	ixXb8+/LCCwZHSQ86LC+LAkH3JMwiXx44YXKcCp+NbmXtzAGFl5o07FtjwFP/WA1Xlhhk2sg7KzIk
	I//fSizK+J50Lxw5KoU7+liaNdRhiRhxwKq+QWAwiO/BCkQIr7qkjO4ahp5z112Q6Hy3VlwnCbq5y
	Mw0W/kQNYx36EsUoevaaiHMLgaK1kOC1lzVM2nOPEQHE3QGk6t/P5F9lsI1eqbVp0R/9AjsXzOuV9
	F645hbxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSQUV-0000000CQQk-0iwD;
	Mon, 08 Dec 2025 01:56:43 +0000
Received: from smtpbg150.qq.com ([18.132.163.193])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSQUL-0000000CPou-23T0;
	Mon, 08 Dec 2025 01:56:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1765158947;
	bh=sEWMlrnina66f1mkg7MgIF551DMwzRk8lseSsYVXv/E=;
	h=From:To:Subject:Date:Message-Id;
	b=AABAJCHoAT9gtWhnuzzQBfRlUkHiuGZ9ex2JhRAOmn6KKlFOh5CVNQ7Es6ARLzc7C
	 jGnp4Juhi9EwxtiXJMueMmQl+SLng2gHK2fg3QzRMZ4L0VNiBqef3HDOfteHxzWMkj
	 rDouv7H8K9Pl/xTGKBuW+65Xo+oYKQweIV7t6dkM=
X-QQ-mid: esmtpsz19t1765158945t702c369c
X-QQ-Originating-IP: YhWIQ0V3ycG7CDzXdW5g+odsXgIz2Zc7DYufLSVOhgU=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 08 Dec 2025 09:55:42 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3081592596976670402
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
Subject: [PATCH v13 08/11] drm/rockchip: cdn-dp: Support handle lane info without extcon
Date: Mon,  8 Dec 2025 09:54:57 +0800
Message-Id: <20251208015500.94-9-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251208015500.94-1-kernel@airkyi.com>
References: <20251208015500.94-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NYz8c2bcbB9MQnNn3zMpWCw84OuTnnaBtcT6uBxjJY9BDC14PdzOdt94
	czfwt2InHnozBNUsP/o0838ntcxcbhDylQvPdmKI262tHrRof2cLiyyyKbTtXrSRA3AjGAH
	0Vz7WAzxhQILRzQXWTwG2fI811JXLircryydAon0IO1nXcGMyOzxsY1o1ZgdHkUN4FVsTfg
	9HJa5jo/vKgTS6ja+Npll8lwUijYUwtiAjLLwXkRWkrVKbpU7VEKnLWoJ2mQqkodzEEg+wL
	+g0IKHB9LnP/jBc5d/boZE2oGvKuZjKzXoD4KADKTxW9oavN1dllOWXk7aZNovZcVbxK77b
	XdNbc4GBr+aaHH/r2sxdIl2VcPq3T8Toed1FWmbide4pf6K27OHPFaeA7DzD/erlUU4IZZf
	XxneJje+4D7nh38I9mZlOZW7kP4h0whsy3lqR+LG7aWauUROAKpSkVO8KtfJlbV6ZMlEm0e
	Y6qGNZDzvWXEoqVF3RHgjnXvUrnrPupuZVrFTxb6/irYNygXrVSbIhTs01zWRRcjf4NTWT1
	fdlcHwyvOR1EQBb57EhZNFl6jFBm0Zg2x2w0oY9aJNmMvCkVkVygSFe18Tcl/RetpcyCvlL
	9Cc0ixKA4NzWi/26Rsy8wX7aviRizV4545MA9V+ocfKih6GGc3ZGoYzkHZWUt/ae1x7TxMq
	sFYDbL2eQNItk3dlBoJGa9h7a2ncKdzrqRBYiJ1Nrmp2qofj3drKZL0hdKAVge4faGdeYho
	7QmNseTO+ewX3zbBmFrK3lpbOPJufyK0RJr95N2Kk9NwfjJO/MySGKHT4FzHcC1amWbtAL1
	PBlz7EvsW36YFRiTVdWqB8jQgxWPNQB4AQAah9jBuTVrEeWCOykwMSU4mfDTBCTCoAd7gdV
	E1PHqxrAE5D2yrSIiJGQGPCJrILyHzNke6D/0VQn6Sr8qNVNjxNm2yNEHXAPnyQOYpR2B4P
	bQe5V8wdKgUu8wXWyHc4yBuiuxP2kIhAEKjCFpQ5nj6PUM/TU+Bn81u/2C+ykQzJCp5vJd6
	mVUqj7Q5pARlYanXK33yc/Epd/WGg=
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251207_175634_111198_3438D741 
X-CRM114-Status: GOOD (  16.36  )
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


