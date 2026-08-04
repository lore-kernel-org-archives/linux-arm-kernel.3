Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC305C5518F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 07:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fH6u5h4xpDz1C8ZdGsVLKRX5KFIbcVXaaz97fyPxnmA=; b=TZM6RDwqfudi7OyPBYUD6OPVVL
	tHSQtlL/xaiCaich4qcJSCKxSobsbAvau7AdBQ8N4cqOcSrjJ/8mMg194PUmH6SxcnGLzjYdt8t44
	wu/Fik8p+Sh2K5jhuh2LFFIwC6fh9fLcLSW/t2ADUyz+mkRvI8TC99cjqI9vKEBN/y4GUAVp6KNzO
	sfp5rOMrvJB5zkOoVgPz6OF+Nng8pkuIdUO7ZD0ARLG5BNxdP/h0VMAtOfowq0ZsevOeNDb4VgsC7
	UGnwmRBlzVP+Ytb2/sZiSUJNGEW6j1Hw/G5RXAowqojukfU8jsRwI0bkTXm3b4wx9vJQb+nKfM+Xz
	516MAj2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr9O5-00000001CJV-2A2g;
	Tue, 04 Aug 2026 07:16:33 +0000
Received: from smtpbgbr1.qq.com ([54.207.19.206])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr9O1-00000001CIR-1jOz;
	Tue, 04 Aug 2026 07:16:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1785827284;
	bh=fH6u5h4xpDz1C8ZdGsVLKRX5KFIbcVXaaz97fyPxnmA=;
	h=From:To:Subject:Date:Message-Id;
	b=AC2Um+bpB/YN2xOHqXB3gYudg5HvdvOuI1t7Iy9JLENbHmhKk3gYMqtYf2iqjYmqi
	 WHSR6eG1TuFRDJjjy50Jd/gPJ76QhN+ng3Qi6LC9usjRVpl6LoN5LHVjYAmJQCYyBs
	 iTPmZEmEACEkQrWldSPPpA0ucIkJIFL7wUvv1ztc=
X-QQ-mid: esmtpsz19t1785827282t0f0d09eb
X-QQ-Originating-IP: UacgRZcbWfS4e/DkD9DWOSe5Fguk5twcxO1gmhIpdfM=
Received: from DESKTOP-8BT1A2O.localdomain ( [61.154.14.86])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 04 Aug 2026 15:07:58 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1834984709830205392
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
Subject: [PATCH v6 2/7] drm/bridge: Implement generic USB Type-C DP HPD bridge
Date: Tue,  4 Aug 2026 15:07:25 +0800
Message-Id: <20260804070730.68-3-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260804070730.68-1-kernel@airkyi.com>
References: <20260804070730.68-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: OAOHw7tUGLQOn9UzO4wfrkx2LQRf2+lt0o2QgyH9noj8dRWHII9EhnIm
	sc4dhkYxH7NA6z/nZzDXPNmYbQ4l3e5aktqGtJWJtVLcQ+ZzFnnw0zocq4TcBFJmcDNWLX4
	6qa9s4p26KN+dC2TwaNUMbyemxe9GZYM/qKF1kE1GyLEM1B826u58BVMtzIn3dko44Z2C0m
	jKnV2r5w/KkOnleNctPnvj4LZgbZ0WiYTbMpdZY85KrQ0UUdXbaHSoVs0Od3wxZgXM5Gnns
	KWsRAJOrKynpKjwzRUYQuGhglnf0ihTtsNguEg4s5QkY/17kgNoK5IuWnk273gVjPEqqafv
	574u0mZ4rcNB6vW9Lc0Dgrl7CRGf7RAWOgLaNcNKYxiseqyTVrYl96HEbBPtiaBlx3870fN
	dOY2a9he/D0MvUkVYshRLa8jVm91C4ZpAkWFFUAPmGypMvst5DraOU9zpYTNzT5peaNoTr5
	DJySOYrLFlTNX0pN00K75h7JFxdJIc/T8pBA+JCoR+Z89A/NSqZeNwrvjpWU+TunT1KYG6z
	1OORbz63k1ZTiKoicHX39uuYo0Sztnc8LtcJoExkPvXyHG2+BYhAAVeZOGsBM8m8h9cOAQf
	ZnfT11631FyuvwPJSilXlaBcLf7WAXUZJnMC5ARTJ4m+HkXuFX1ndqzfA67lBf9l0sBqo2J
	YovW9ZXrWeeQeHX49AxFLihfTLD2qO2x4zferTVjO0ZuYSp2YqMm6GrWQLOK19rFX65qXdJ
	o+KYPMkIbWhl30gWaH9dUnogHsxiC0MPiWIqjCgQNUWt8d2ZlxQy78tM87jewlfbE5UASUk
	PWvquChsNBfNO1TwslPO9Vs6iKfPw35g0JrGyQ3+u+jNav+eVaY3VSEINrZ5j/Bk4tNw2Fi
	1NywMfHzlPXAJvxw2tazvZRrR8/YoXeLpndZtbMmAIb+un7jYZAciLSGi/8lqHkuLo433Ex
	pLqTFvdtDAnUQN/7npMcsU8K9oqFD6fktRCXdH5F6sXVVX5d4kzsGbJMsrb4cwH7AcDAglT
	gW/NzC2RMfTnrqMs9pW5YmF009wSLgzyo9IMAAqRFDM5PQFNTH67w+bn1uGQc=
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_001630_244142_D02DA2E9 
X-CRM114-Status: GOOD (  21.10  )
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
Reviewed-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
Changes in v6:
- Avoid duplicate registration of the same DisplayPort HPD bridge. 

(no changes since v5)

Changes in v4:
- Scan the entire typec_bus and attempt to register the hpd bridge,
  so as not to miss devices that were already added during initialization.

(no changes since v3)

Changes in v2:
- Add copyright text.
- Remove useless goto.
---
 drivers/gpu/drm/bridge/Kconfig                | 10 +++
 drivers/gpu/drm/bridge/Makefile               |  1 +
 .../gpu/drm/bridge/aux-hpd-typec-dp-bridge.c  | 67 +++++++++++++++++++
 3 files changed, 78 insertions(+)
 create mode 100644 drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 4a57d49b4c6d..9739b2a19758 100644
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
index 15cc821d85b7..d88a9e1ccc9a 100644
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
index 000000000000..682bc192e093
--- /dev/null
+++ b/drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Rockchip Electronics Co., Ltd.
+ *
+ * Author: Chaoyi Chen <chaoyi.chen@rock-chips.com>
+ */
+#include <linux/of.h>
+#include <linux/usb/typec_altmode.h>
+#include <linux/usb/typec_dp.h>
+
+#include <drm/bridge/aux-bridge.h>
+
+static int drm_typec_bus_event(struct notifier_block *nb, unsigned long action,
+			       void *data)
+{
+	struct device *dev = (struct device *)data;
+	struct typec_altmode *alt = to_typec_altmode(dev);
+	struct device_node *np;
+
+	if (action != BUS_NOTIFY_ADD_DEVICE)
+		return NOTIFY_OK;
+
+	/*
+	 * alt->dev.parent->parent : USB-C controller device
+	 * alt->dev.parent         : USB-C connector device
+	 */
+	if (is_typec_port_altmode(&alt->dev) && alt->svid == USB_TYPEC_DP_SID) {
+		np = to_of_node(alt->dev.parent->fwnode);
+		if (!drm_dev_has_dp_hpd_bridge(alt->dev.parent->parent, np))
+			drm_dp_hpd_bridge_register(alt->dev.parent->parent, np);
+	}
+
+	return NOTIFY_OK;
+}
+
+static struct notifier_block drm_typec_event_nb = {
+	.notifier_call = drm_typec_bus_event,
+};
+
+static int check_device_already_added(struct device *dev, void *data)
+{
+	drm_typec_bus_event(NULL, BUS_NOTIFY_ADD_DEVICE, dev);
+	return 0;
+}
+
+static void drm_aux_hpd_typec_dp_bridge_module_exit(void)
+{
+	bus_unregister_notifier(&typec_bus, &drm_typec_event_nb);
+}
+
+static int __init drm_aux_hpd_typec_dp_bridge_module_init(void)
+{
+	bus_register_notifier(&typec_bus, &drm_typec_event_nb);
+	/*
+	 * Before module initialization, some devices may have already been added.
+	 * Register the HPD bridge for these devices.
+	 */
+	bus_for_each_dev(&typec_bus, NULL, NULL, check_device_already_added);
+	return 0;
+}
+
+module_init(drm_aux_hpd_typec_dp_bridge_module_init);
+module_exit(drm_aux_hpd_typec_dp_bridge_module_exit);
+
+MODULE_AUTHOR("Chaoyi Chen <chaoyi.chen@rock-chips.com>");
+MODULE_DESCRIPTION("DRM TYPEC DP HPD BRIDGE");
+MODULE_LICENSE("GPL");
-- 
2.53.0


