Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D60C4C55172
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 07:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hfSDcA/VFf5O36XZ1jIbDeiIvlPOe5N0iYnQa5D5SVg=; b=aNVb7RdD1kqLrA/r6RzCrP7c29
	HTrX1pHnqixjEsez18TcWzf8ij98ZU3dxuVbOdw4PU8tChU8Y5W/VSwFyS88+lI++hyOa3eKZbDiX
	K/ckIs+vozot1ywtA51rhtyDhwIxv1HYD8QNnx34wZjSImNnIjrlpGCoLDCKHWpVuM1ugGDnsSxl+
	+mUFP0Tu8weawXmkwNLYQ49qkmwLXWb7M3oGq+Ip6Cvr7sulSWrBwRWRROFO7u/bBODmQTY9+gRth
	8X5Aaozsf3zVtkDfHohCc6BWog5poYPAIg36yQ3UsqAGrJLywV/e8PmDjafxU/mEwFmlV8jIWsXU8
	Fx+P8HoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr9OU-00000001CU0-2QgU;
	Tue, 04 Aug 2026 07:16:58 +0000
Received: from smtpbguseast2.qq.com ([54.204.34.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr9OR-00000001CLM-1XBM;
	Tue, 04 Aug 2026 07:16:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1785827304;
	bh=hfSDcA/VFf5O36XZ1jIbDeiIvlPOe5N0iYnQa5D5SVg=;
	h=From:To:Subject:Date:Message-Id;
	b=gGBFqoBrLYjgIoQf93SB0LsFUNWmWzBa0WAeEL/CHcGgcyXOOUJJdKp6h2PjRTt7U
	 TnNS74zYEUuYk7g+Qv4ewQwYmq60MX6DWWPFz7/6CcN5V0LEZwk85grZkMx60sbYj4
	 kU1WD4obc4kW82hHefJGXY3+julCFOm2ql+LOYq0=
X-QQ-mid: esmtpsz19t1785827303t5bf198e5
X-QQ-Originating-IP: lvl2+FbaNh+rQwA9UiH/mIq1IbGfwWu7ceGOLF34ChE=
Received: from DESKTOP-8BT1A2O.localdomain ( [61.154.14.86])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 04 Aug 2026 15:08:17 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9591211564925430359
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
Subject: [PATCH v6 6/7] drm/rockchip: cdn-dp: Support handle lane info without extcon
Date: Tue,  4 Aug 2026 15:07:29 +0800
Message-Id: <20260804070730.68-7-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260804070730.68-1-kernel@airkyi.com>
References: <20260804070730.68-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NafziRg7Bx69Ky8gt3DQzRSfr0W8y7zq1y3IDxbbpadrIDh2+K0tUx9A
	iqYjL9Y918jfku0q+E0xHOa8pmoUMPIRWfwYP8k2PsyPQbtVGQDuSk+Dz4Rfurr4x9OVmZo
	pceR/dYE8DFYjfw+Q6G+V332kZOF8G5NveBEGfjKXANTcHQiWqwGjkbKpUwKdi4XNWaUQiB
	HXW6EVQVs/tuE7AfAYqOYIcGqHn7LsqXXHA4nZATBo3pCVGjQl4Mk+cIUosnEL0P/w7/uRL
	GWJy3mjC4nbK9Fx+NrVDAuBNDXAAPzELxXopL1R2caevXoU0OS8gm/0+G4PWN1e2NBW7BnE
	O6q+ulMzhRKixq1B2MfJ4JCI0Avz4lp2gMlmbwlVCHKmvEBBsaNC7SIGyE0lpn42V9mpM+E
	GbxlioOLE6nHAnxcPp+JPmLe+xqPcEtnR+HzLOhXQi37j0OJLu/ZigWqEsvZZ8lk/dui3Qw
	OcjJSLZsuXn5c5a4GOlMiq0YJ2hqPNbkAZlBuHCpr32gTeMuAP4A+uNiL2r86Ay6G0NDkik
	TFpdHOlF0OB65NVka9vf2d8oIkLw/c14aTj7NMnDjpXG/jGGzmYyzdViN073Vaq+0x4KMfi
	0f8vRZ+TMHNQaN00U3utYY+2fYz3nIrHWRHxU1PxLYsLeTmLFDIAt4asTwKjJQIFsh9FUFU
	oKuqNc++0F2SuHIlGc7noii+v30OkGZaw3ouJU1c49fSVlkby5OSbD6fB2ibOZRwYYuSMA8
	e1zSchizhozKyGinc2mdaV40x+9oZIAhFjz95FI3NpodI0YS5g278TO/AMHm9W5pt20I4mm
	iAF/gjaOjfq0lOnOMkCxbMlvKswPcX9zhB9XyovuWawj/WY1wru/y6ejPtQsxuKWTSkREBi
	Ma1RTBTzsaftFi5BM7wcjxNC9myDvqJ+RPpJNjUf+UtGOm7+tiJzvk071YEbTKLrNiK2Ox9
	IieH6bz5nxVxjyb0gr/fE54qU3biFuyVAnwZVFEO7h0PJeRB7C3XiysGAaY4xgCMJT4kONk
	UKEcpE3A==
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_001655_905656_FF20A837 
X-CRM114-Status: GOOD (  15.52  )
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


