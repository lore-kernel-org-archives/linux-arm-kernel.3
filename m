Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17BD4CAC5AA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 01:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bU2sAmzXCR713CrWSoUTQXsce2x0+sMC5yQVrxIUCRM=; b=RGT9WqjqZTqMeMjBLL3k0yH+uT
	i5p5Zv8g2oyL7GLRmruoAZrVLNdeppxnxnwVgS8rzQAhMlfaBo+0pgYr2DY6OpC53YS21HxeV1eDd
	pzbEa3fvadA68w5bzBCZ6Mf6MXBjtLBKaYuAxQxSXYs6r1dpr+fhIvPfJd9YcY92G5O3TAX6q/5Fn
	NpZ7AkA0rnrSrCJuxOs+J7k9ucCobFiWP/1CamGXMGBcGIbRlbVPIR6NN8Ciqeu+6RyzspWmgIB0A
	gnx4fI8PXRUqDqnaFtT/WJbtlLtOPsvrUo03ezXqhZx9AutiQ+hOKM3EXv4Z1UZQMfB1KVdxX6c3U
	5rBauWdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0VG1-00000008UsP-138G;
	Mon, 22 Sep 2025 01:22:21 +0000
Received: from smtpbgsg1.qq.com ([54.254.200.92])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0VFl-00000008UWk-3Wov;
	Mon, 22 Sep 2025 01:22:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1758504065;
	bh=bU2sAmzXCR713CrWSoUTQXsce2x0+sMC5yQVrxIUCRM=;
	h=From:To:Subject:Date:Message-Id;
	b=hp5OAXZnfvcYiEOnalIQqkanqol5thjeWSEc3caa+ilFkfSMFi0r4Wp8j8gh5mfAj
	 +N9MeNwucQMVlA8zwkoVM+RzUQiXFd7zcVD0V1xyQjq+7cml19YrZuycIPHrvTCCC3
	 5UBnR9m6YilgTP3jNOFU5kmh5WSmYkDt73284U7M=
X-QQ-mid: zesmtpgz1t1758504063t10fb6b9b
X-QQ-Originating-IP: DDHFghLsHmSB71st719yB2ojgwG4K8hbUJVFjP+vjd8=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 22 Sep 2025 09:21:01 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17509678942044025662
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
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Johan Jonker <jbx6244@gmail.com>,
	Diederik de Haas <didi.debian@cknow.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Peter Robinson <pbrobinson@gmail.com>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v4 4/7] drm/rockchip: cdn-dp: Support handle lane info without extcon
Date: Mon, 22 Sep 2025 09:20:36 +0800
Message-Id: <20250922012039.323-5-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250922012039.323-1-kernel@airkyi.com>
References: <20250922012039.323-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: NIBco6FKK+x4bpEa4FfNLpONEPzR1GSRt1zS+jFwpWgEWgnGHPDwj5+P
	bua7yNyERieoj7rffE2LsLSKqJsFhbcKeed59SQrvKBHULgTe31jpAdUBE2XBNhTzpvTd/H
	UgCuZWufvnoDcD0xUjONMIDbKkr0EReeLaqwqy4mckta0hN9QysTs95Ybi2AFXZAOve0x5u
	KXtyebv10HLcjJwAlk1TN/MkSgCFYjZ2Yyyg5aBlDInfWvH8ijXRnR8XEnqh3RCGOjXtVrP
	S1NKYGLdOxV+oCQUCfyisrnxjw8RvoF1nHA0bxO2alhQsKDMV+2lPlUOGpHfaKW20VZw32h
	GwD5XFX/7nYDCDWFEzyTMMV5lR0SYuH0dK+Hr2pAMgY1OiMmDmBYDNWX8NPJOZls7hPkZsD
	1muaU24ZBOsPk/GwpuCQRwo/B5ghqSRujb8bicyqe6GGMSid1o/A+G6N7kx99RVW0aN+woI
	YRugKQ0RYsawzeCxO7N0eW6jDqWPkR56XQE8U6QQEIzcJtzrSJmk5vJzAbZBkH8RtHFfnB1
	ygtRT+L8VE2+U3e9wyEEHrKe5JGCuw4mp1X+dtqsHk5ZjjSr0j3bledHQTid56S9SJ7GDoy
	gXCltKOr7Wig4KcAEeiLZAd6q9KFz0S7rulPh8MrPYk8SXnosKuNIJPOIED6BeRySEGRAwh
	1I6OjhdgvjsENiaP2D0+KDRCVPFY0tlpu8dToFW/2kdGCLILOBp3LFabiIzH084+gDXdXsc
	0scSmiqKlW3aY4ijB37KsqcylVOQCFiSGjgbl0TckUhbXx8GYkZLOZ/U9fuQ5v/LMnGjfdA
	9Q725pD1i76A5dpgjR03y+bIOtwdP3wU1YSaen1UIZd6uuSM4GfzIUk061IowrMsr/jMEOO
	3XzadE4AF7mjWxjcTGF0wSvlQaJGZ/34DPC0o+J/AbNdsqAVKpDT/c7HrY6hHXuFzzSYaP4
	zS64KhJ+UCDir/7R3YudNzG7QQ6Ay+rzprivm34NkY3JPhthxU/Rr3qQv
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_182206_289454_8AF399C9 
X-CRM114-Status: GOOD (  17.15  )
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
2.49.0


