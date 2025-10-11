Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3E9DCCD18D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Oct 2025 03:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nQG0w7dhU7Aew5bKV30plkPn0nBnVdgTnfwSbxYLntU=; b=ynnd1OKX5Ra1dfm063jcJkIzbQ
	B3zOjg9ozbuJE+CAbUG5wLuEj8DwZ97byZaSQIkappErqhoHcZW41OlxGhnaiN5UcE4SWn7XVmpFq
	KCe6Nx3WeKMWP9IDSU51Y82ct/8dOT5bVvWoQPjaFxZ30Whi5k3HMNrR45zKxcxPTMtHb9zCiyv0h
	NESZTwleqCvITExflhhivvzSM0h2bC2RvnObkJUxe6SjK7xsk2PGUE4IMC5ynI9HropIv0zdAxjpY
	piCQmK89LHoHzBE6cqBxDzw/wJrAD1L/c/s1FdedyhH8gfY70anJIjMCLyXC0faaJo44+HwXGf75Q
	oO6SUuDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7QMm-00000009jvH-3QJV;
	Sat, 11 Oct 2025 03:33:56 +0000
Received: from smtpbguseast2.qq.com ([54.204.34.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7QMk-00000009jnP-0bLm;
	Sat, 11 Oct 2025 03:33:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1760153581;
	bh=nQG0w7dhU7Aew5bKV30plkPn0nBnVdgTnfwSbxYLntU=;
	h=From:To:Subject:Date:Message-Id;
	b=Xh28myMqhV9i2CVkS8+rCBcb8w9Fjo+ujmgXLyD8nw1TmDZ3gvnGlIQ6GyYqEIVj3
	 pCBDjI0Sgt6einiW79bKQYyQOPY2h/+XbzYx1Kn1ModeIYwmufAnGUFm4EJH+6DbB0
	 SNsV0QzNpUipMYLt24whCSY2aHBKP/kia3y2Y4mY=
X-QQ-mid: zesmtpgz4t1760153579t96022b44
X-QQ-Originating-IP: Frmd3Nj0ACfLGSy/LlGB4y0vuie5FM7XIF9dzJwwTnM=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 11 Oct 2025 11:32:57 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15541258530940907442
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
Subject: [PATCH v5 5/8] drm/rockchip: cdn-dp: Support handle lane info without extcon
Date: Sat, 11 Oct 2025 11:32:30 +0800
Message-Id: <20251011033233.97-6-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251011033233.97-1-kernel@airkyi.com>
References: <20251011033233.97-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: NZl/JFjf+G/9FTJlWA5PNBORUHPb7Z0wurMcHGaduVm0sgCvZ7qmY8+f
	AF2HT5kzJL4PiYo0FIKJoxcUdSR8yRpEAV/otHwiiNuFWKFw4jjfQEkfXqD59n06whOS8M+
	REMekiVs2kSRmuSS2EMm8/fp7RyElekN3kdjZmdkpWL0Bjz7k48Lf29OUUVooIRZqqlkUkZ
	XbIhHAhTx4v2lnX45EHzOiSW4z6+V2XttV/p3jaQCn9epoCythco2hMgsnzMykB/9qsgK6H
	tLj8nGv5iWV6mDH3DoZvPyUrPeIajychfSbaG4saFYu+AHzfSnLVDDvQrQAXmLxGJIa6j4L
	4/08PFeso/Ggky2Hx4WCSMzkpsmWRmi7NoS2YObOUUq2aCZq7nfKxjquAfq/GfiFvbGt6bL
	y/Ag7WXtIP1hoEcEk9qk62aXHWU14JxiMWtXVKUD4sxdfjtcjjOC6aBZJ/FvGOjvojzdevT
	MY8cfPeJanZY9Y3BPBkDGj2XNFZL8I31R91+2G7Sg4I7aolXgilHTolSRYVWrv+b+SeHKSs
	Wvz27OcyU48+eZqCrDD2xzTATI78xY/hW/JZ3lrCwYgFa3McMrkGfOOBWu6yx6lMe8qQdVR
	Al7oWRDQO/ga/bbgbwCUlcnaQ1+BLGS4xIaSJwzXOjE1/ASftzIJRgmtbqDF+k/93MeIUGW
	FB5D0bC5FCwzFUU4wyjEbDej7BriOCk7/5s7Dy/EKXve94VpupAbuhVCjBIk5iVDHa7dEMQ
	E6NwD1nCWw64nIAOO0K+9QHSTj9x0qFKMKcC17ilMTfkLa3ByHl5Q/xmVoW9SChNeYGX3/0
	z1iZGeH87yvRIfX2TcNOgOCYTK7iEHp3DsKi7tkPhHIF7h01/EplFRcNWSmaiwN8HAc5LjO
	SLw/tVrPxOcSDRSGT2ZGBfC5ahzOgNAyjzurZO8Nak5CNjIzt2MZTMeO8E58kB/E6Ue7+Su
	5kRzhiE4YJ7R/Lp3vuToKoa4IQTQoKll2bsOezZTk68r+66jwZ13E1ym2K15d2W9YUVDOj8
	WajnJYc2UBMOeNlAjr
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_203354_665780_4D679B26 
X-CRM114-Status: GOOD (  16.39  )
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
2.49.0


