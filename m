Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05ED7D1D862
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 06:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tnGvdgabwSIu+i1OtiOksigRJkfBAJHpGnwVCXS2P5o=; b=CVxCQ8dfpXEkwTZoE+mTAGTVlq
	n0BB2k2Grv36Xty0ZdgInqijHG7TZw2obks9wrjHWW+/jT+BqXUmHNfXgb7DbpkzInlnefCw6pwbB
	Fnr9P1K85CiA0YEq9dNKi9LRL6wN/TAC1Kz7RPHOM74Qt2WGb2sDIEnPcYIW8cTTVJSrbYvoGWLiN
	LBBa3SorgUX7u6j/2XELrOKxgIpy8KhY9d8FHEJfxgMQSemqxEI3KoopIa6V98CHVUpeHxa4bEu85
	f37IRafseUrTNKEmHvmIAs8PAPPQbSl6QeVpSs+F6aSvJb1ffyPxcILjHgXYpdXOfWYijCOZ7TLOE
	v355NZoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR2t4-00000007Y6K-2d2f;
	Thu, 04 Dec 2025 06:32:22 +0000
Received: from smtpbg154.qq.com ([15.184.224.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR2sr-00000007Y3P-1Y0J;
	Thu, 04 Dec 2025 06:32:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1764829895;
	bh=tnGvdgabwSIu+i1OtiOksigRJkfBAJHpGnwVCXS2P5o=;
	h=From:To:Subject:Date:Message-Id;
	b=Wly4Kw73/pv+BwUIyoj+tHuX+rgURbCqcvwg8PEJdStO0ld6E+50DJSc9qnl4p09O
	 WB7Yc72L/TMVPepBxMq5gVA/GgwiN6Xja3eBWJ6Q8D6NeP89CNiB+8N2NV2qEyei9L
	 ChWiMvd/xJNydB2l0JHGG3VjU11eOpdyQFxKkb+Q=
X-QQ-mid: esmtpsz21t1764829893t62e7fee3
X-QQ-Originating-IP: 4q1w9+bgCS0LGdPqbRhxoDeHWokBVZZFuy5QX+5KrZI=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 04 Dec 2025 14:31:30 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9830896031001290684
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
Subject: [RESEND PATCH v11 03/11] drm/bridge: Implement generic USB Type-C DP HPD bridge
Date: Thu,  4 Dec 2025 14:31:01 +0800
Message-Id: <20251204063109.104-4-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251204063109.104-1-kernel@airkyi.com>
References: <20251204063109.104-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NXrWVyDJhsq8W2ET7yKoB0uKe+t43ldi95YEsav3te1+YgTaUAhdPit/
	wW8P7UNNkhp/tUczZ+xY3LBRTO3XgOXRUOAaYlaZQkZodZYKG+7by0BN+SkWo1zq6eXM+yB
	xQBvTbXFCeVgQr/mXpiZhs38TBwZRdQenC4jUJ8dZf88FilOCPOnc4b9jPhg6lkk38am/kF
	anhYsnbZvk1cHxC8G6HJp45ldYBCtX8B1sZdd4Q+HLOQqn46UlDJ6NWhPq4hJR5iZ5MhOTP
	q/SXwNhY0IStqu7quPygst7enrFa2DOpOcj4KYKESWQBxqQnG0DMHBTCgdN6I4fUoBM54JN
	aMCaY8dTTW+LWj+uFYOPYZ45Tb0a1kzsT5AKxjYHOeczRM97kxEp0Ayls1FdhO3hprpJYJU
	DyOtaNbSdkQUJLQCee/MF9RcJuhcwciHcNE+n1AgnpFEO7TzCSLdzMPB1Eidbnzl96p07sW
	gHnRQy7t5EhYQ585ZN4DdEVS7pCamipV87fgiDUywFPjeNY6/7LvtoorvV8PA8U8fXeL+yQ
	4AqxXzCX3murRPVBA8EdCj/VAkM1SENQ+vhDNhxZCR09f5iinBmoSwXCxix8Kn4hUQ1Ewh1
	1dOc4twAlJFWed1sNyFImmioBjnpVDGUftgKsdfL3KoKIBk9Pp5GyZ+8S/9m99lFhxifJiz
	sn8z6Ripq44Nd1GeTREUbGKycXseCjMqrXLIByxEn8ZGzwbAgqHgIM3wwn9ZH8gL3m2rIb0
	pSG1VyHiw8aRt4YUFMimJ4b7/WOTI4KKJR+ykrmBafN9UCD2NyV66deyTLM9WPKIO1a1a0v
	cRjbJFjuwHtbyQQTI/zDsUSUIbttk9nymBksVP3QYXBQRZtHuSJa+6l/0UFb0eFD1YyYs+o
	xbSH/6rUhA+v/7p1C2a5wb6TsVR7qhYYlGDOmCEedvL79xK2eCaTyzESeRjG+aAv2nIjI/f
	IWcADVUDg5CZoBhHXuE9jD7JZJXQBNdJYL1rNNVUE/qxMV5n0N01XZmDntz/BUZn50QCtbc
	NDtDrSedR4tIqowh9RKLckj3mY/M0=
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_223210_018836_1745BABE 
X-CRM114-Status: GOOD (  21.00  )
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
---

Changes in v11:
- Switch to using typec bus notifiers.

(no changes since v10)

Changes in v9:
- Remove the exposed DRM_AUX_HPD_BRIDGE option, and select
DRM_AUX_HPD_TYPEC_BRIDGE when it is available.
- Add more commit comment about problem background.

Changes in v8:
- Merge generic DP HPD bridge into one module.

 drivers/gpu/drm/bridge/Kconfig                | 10 ++++
 drivers/gpu/drm/bridge/Makefile               |  1 +
 .../gpu/drm/bridge/aux-hpd-typec-dp-bridge.c  | 51 +++++++++++++++++++
 3 files changed, 62 insertions(+)
 create mode 100644 drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index a250afd8d662..559487aa09a9 100644
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
index c7dc03182e59..a3a0393d2e72 100644
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
index 000000000000..94be3d5f69e9
--- /dev/null
+++ b/drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c
@@ -0,0 +1,51 @@
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
+	if (is_typec_partner_altmode(&alt->dev) || alt->svid != USB_TYPEC_DP_SID)
+		goto done;
+
+	/*
+	 * alt->dev.parent->parent : USB-C controller device
+	 * alt->dev.parent         : USB-C connector device
+	 */
+	drm_dp_hpd_bridge_register(alt->dev.parent->parent,
+				   to_of_node(alt->dev.parent->fwnode));
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
2.51.1


