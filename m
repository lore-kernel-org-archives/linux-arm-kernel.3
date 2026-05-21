Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 761A4CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 03:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dvxDCR9NEJvWoy2vX4KZL4araFw0lNuTo/DvCOAIkrU=; b=eyeFZFj3qLS1lRoRTY12PTnrdJ
	IvrK7lan0zytz7MYporf9N+Obkm5rxf3ZNWLp1XWAC6G8wqFdpLccR0wvLqd2PWDQIEl3D6kjFIYa
	f4jFOy1mGBwxskMPt7de5OKW+65Rv7XWnQoA3PdtOMyBUk8GcHJXqfMVZgN4hSw/D96qJG8a9c1oE
	pmBc3+5B7FbWCvGjaS8k54HwdW8PHJKbhcfp3Km37yowOm/wNEixzv5kgqd390YwMLznIvyminH5v
	yRaIYJ8UK5s04lux0jNbAsyciaV72vQYCFA5Q0qta6hFCRwluacO3YjLYs0xPMmoGZhS5BIYx14Ve
	dN8PrAwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPu6v-00000006Y8U-1843;
	Thu, 21 May 2026 03:30:13 +0000
Received: from bg1.exmail.qq.com ([114.132.73.137])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPu6n-00000006Y2X-45nc;
	Thu, 21 May 2026 03:30:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1779334169;
	bh=dvxDCR9NEJvWoy2vX4KZL4araFw0lNuTo/DvCOAIkrU=;
	h=From:To:Subject:Date:Message-Id;
	b=sGxDprLTwMGuGNjaS/DqdN/VeQzEE05Vscc6ZdPsLWlfut1SyjYXYLEZjwbhMA6k9
	 lrdf3jkVJ7YQkEdtsalfqfduQ85mc36VIMiVOu96geWZx99n/IfTAQ82/u4iehOc9j
	 dReHPjnKH5HCMVJtQaMlCnr4048RRYvnHYdnrhm0=
X-QQ-mid: zesmtpsz7t1779334159t70c25ab6
X-QQ-Originating-IP: ADiEYj7Uo9gkcTDRzLm44seRmsr0fa8KAQZuAK83eDk=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 21 May 2026 11:29:13 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1170275653122731540
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
Subject: [PATCH 1/5] drm/bridge: Implement generic USB Type-C DP HPD bridge
Date: Thu, 21 May 2026 11:28:50 +0800
Message-Id: <20260521032854.103-2-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260521032854.103-1-kernel@airkyi.com>
References: <20260521032854.103-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: M5r28j6evhA17O7FKjcTb8WLpB0fcZJeh7fSThyDvLFhaHK6o6j9m3pw
	IAlAOmvHEURDhPZGiKPI2636Y/xstHkbjTBuobHtKrr4+gNuroFTXEhfa55KYz6Jw26/hn/
	6pSCcV9MBnRl3P0oVpBT/KU3cELhTdk4W+r45wPnpWDWOa3UZNu0W8Q/dL4mDk04GXDA4bY
	OKKsmForwFKjnkOoOKx8xV+HuPvKIGH5sZov1keJ1cU7raYUAdD/DiYhJveDVoALM6C8UDf
	Y0f9ayM6BORyB2L5OBuw8V+Nw0e/UcSyEK2Fu5F9qP0VnPev4LB3IYXJ5a3kqysyrZjR5P5
	fsmaVHQKcwWMeKYZvCbd+wNnwQhyvt/sk3SOqpK57zMijd+4hcynDIYzxCkK/1WCjc2A1JM
	beXHMcQNH2mdph+CkWm+F9R7YFsNwsn1egYfnmO5oLZ4RLYi/eHTDMhJmKeioR8uv/h2vJ7
	gkKF2gJc5ZA5r/IpW/gHsuE+wz0fe0GbpmoIuSvpoTHoL9oaZTT3QkzAolZqXMZGHMn1vaX
	NNjfhh3Mg+k1InMR2b1ccW0cgrjj0vttAHuiIvXjHjuuaSv5uGYVKVpS5b+Z9C7fGshQfKb
	7ejBcR8sHCf6KwIALQzI516CvF49pigseIARwoVjF7vzHY5VfaPTwKykm9MLAVy31ymWt+z
	PQ4jLKNMfXEBQ+1YLP1uqaXyM2IhBo7yQ9IB2wlfTYfvwkKX9ccfD+gipHML+IAucaytShW
	eH61KVec+Eqw4fF0Eqpd0ULvBO4foHMF1b6jonZCXXMrRSMLYs3p0urCWTyY2kRAYD2Ywp+
	fRZQQR949FGmtTkJS8pn23FLy1zXNsJKKuXqEDRTQWMrwnp61MO0himRnqB8jdAYxyN/Trh
	2sJBQPviQsRuyOiTiLSYfqq1tuajMPl4wwo3coD8Bx9UD7+bFztwT80V//KobEt7yPFjr4B
	rsqFhb651raJ7uqES/8SQMnsD+470Apy0fk+BKd5dwahDn+ftrk+FP5/bgVn7IE7gmH/XyI
	CbPktOc4fWxmz7d1ZUvd7w0bGfkbdfvTEJt1LifITKdOeDpu/G
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_203006_392626_601F3B43 
X-CRM114-Status: GOOD (  18.93  )
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

The HPD function of Type-C DP is implemented through
drm_connector_oob_hotplug_event(). For embedded DP, it is required
that the DRM connector fwnode corresponds to the Type-C port fwnode.

To describe the relationship between the DP controller and the Type-C
port device, we usually using drm_bridge to build a bridge chain.

Now several USB-C controller drivers have already implemented the DP
HPD bridge function provided by aux-hpd-bridge.c, it will build a DP
HPD bridge on USB-C connector port device.

But this requires the USB-C controller driver to manually register the
HPD bridge. If the driver does not implement this feature, the bridge
will not be create.

So this patch implements a generic DP HPD bridge based on
aux-hpd-bridge.c. It will monitor Type-C bus events, and when a
Type-C port device containing the DP svid is registered, it will
create an HPD bridge for it without the need for the USB-C controller
driver to implement it.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/gpu/drm/bridge/Kconfig                | 10 ++++
 drivers/gpu/drm/bridge/Makefile               |  1 +
 .../gpu/drm/bridge/aux-hpd-typec-dp-bridge.c  | 49 +++++++++++++++++++
 3 files changed, 60 insertions(+)
 create mode 100644 drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index c3209b0f4678..d92e93875793 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -30,6 +30,16 @@ config DRM_AUX_HPD_BRIDGE
 	  Simple bridge that terminates the bridge chain and provides HPD
 	  support.
 
+if DRM_AUX_HPD_BRIDGE
+config DRM_AUX_HPD_TYPEC_BRIDGE
+	tristate
+	depends on TYPEC || !TYPEC
+	default TYPEC
+	help
+	  Simple bridge that terminates the bridge chain and provides HPD
+	  support. It build bridge on each USB-C connector device node.
+endif
+
 menu "Display Interface Bridges"
 	depends on DRM && DRM_BRIDGE
 
diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
index beab5b695a6e..c4761526ba0a 100644
--- a/drivers/gpu/drm/bridge/Makefile
+++ b/drivers/gpu/drm/bridge/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_DRM_AUX_BRIDGE) += aux-bridge.o
 obj-$(CONFIG_DRM_AUX_HPD_BRIDGE) += aux-hpd-bridge.o
+obj-$(CONFIG_DRM_AUX_HPD_TYPEC_BRIDGE) += aux-hpd-typec-dp-bridge.o
 obj-$(CONFIG_DRM_CHIPONE_ICN6211) += chipone-icn6211.o
 obj-$(CONFIG_DRM_CHRONTEL_CH7033) += chrontel-ch7033.o
 obj-$(CONFIG_DRM_CROS_EC_ANX7688) += cros-ec-anx7688.o
diff --git a/drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c b/drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c
new file mode 100644
index 000000000000..d915e0fb0668
--- /dev/null
+++ b/drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c
@@ -0,0 +1,49 @@
+// SPDX-License-Identifier: GPL-2.0+
+#include <linux/of.h>
+#include <linux/usb/typec_altmode.h>
+#include <linux/usb/typec_dp.h>
+
+#include <drm/bridge/aux-bridge.h>
+
+static int drm_typec_bus_event(struct notifier_block *nb,
+			       unsigned long action, void *data)
+{
+	struct device *dev = (struct device *)data;
+	struct typec_altmode *alt = to_typec_altmode(dev);
+
+	if (action != BUS_NOTIFY_ADD_DEVICE)
+		goto done;
+
+	/*
+	 * alt->dev.parent->parent : USB-C controller device
+	 * alt->dev.parent         : USB-C connector device
+	 */
+	if (is_typec_port_altmode(&alt->dev) && alt->svid == USB_TYPEC_DP_SID)
+		drm_dp_hpd_bridge_register(alt->dev.parent->parent,
+					   to_of_node(alt->dev.parent->fwnode));
+
+done:
+	return NOTIFY_OK;
+}
+
+static struct notifier_block drm_typec_event_nb = {
+	.notifier_call = drm_typec_bus_event,
+};
+
+static void drm_aux_hpd_typec_dp_bridge_module_exit(void)
+{
+	bus_unregister_notifier(&typec_bus, &drm_typec_event_nb);
+}
+
+static int __init drm_aux_hpd_typec_dp_bridge_module_init(void)
+{
+	bus_register_notifier(&typec_bus, &drm_typec_event_nb);
+
+	return 0;
+}
+
+module_init(drm_aux_hpd_typec_dp_bridge_module_init);
+module_exit(drm_aux_hpd_typec_dp_bridge_module_exit);
+
+MODULE_DESCRIPTION("DRM TYPEC DP HPD BRIDGE");
+MODULE_LICENSE("GPL");
-- 
2.53.0


