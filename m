Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1193AC53200
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 01:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=43+X27qI/TbPuXwMFgfhd3B71pHWvOwE8wu/TMq6zqY=; b=arIY1a5hat4kynbP5MwCm3H1lj
	NGcvRfKxMXLC0fjD9uQHnWj1n/SJBseHx5RvJ4K6EB81/057QVNGY0Rgh9TUOJL/qBr2yK2+3UD63
	OnJ2Ua1zH5nyuGWBm+n+63l6rgf+PMf1rgUDkrBtu1ZEyuQpLWJIKLKY8fD34HBDx5Jv1Dm/5CDT+
	ZkbrkCjGyV4Yi2RQrIvAVQP+BgYO+8rkiKkD9s3AUAvm1VktRyvMoLukfb5MTdVIQSsJcUMvsCykl
	OTH39kkRqJvxa4sRhLkW63VF9SRhLKCPQaLBeVLFXz4sshWZOSi2WA0EOEKsgZ7XRsyb1u194bN49
	CF66AvQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpFgK-00000009Ggq-2Jth;
	Thu, 30 Jul 2026 01:35:32 +0000
Received: from smtpbgau1.qq.com ([54.206.16.166])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpFg1-00000009GMl-0XXS;
	Thu, 30 Jul 2026 01:35:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1785375252;
	bh=43+X27qI/TbPuXwMFgfhd3B71pHWvOwE8wu/TMq6zqY=;
	h=From:To:Subject:Date:Message-Id;
	b=dfd+qrFsN6fLWqjGUg/LKliOo1Gb7jON/Q4Lh6uM2eUoxXkwPPIcDAMjNWhubFIc3
	 78jNrmfNwnOKijkrmG0m2X0Ui+eQuZqYUVRm0i0K0+FspwimKexFtKtWoVNPg33XRe
	 1hxcRrDXUAGAri9XARQzj4jY7rFc7sdUsVAQrELA=
X-QQ-mid: esmtpgz16t1785375250t19b9e41f
X-QQ-Originating-IP: dTfTdJtp/NTG1QBfdY8GFurBKpZo3du5oXip7OFw00A=
Received: from DESKTOP-8BT1A2O.localdomain ( [61.154.14.86])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 30 Jul 2026 09:34:02 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12002367343437877311
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
Subject: [PATCH v5 1/6] drm/bridge: Implement generic USB Type-C DP HPD bridge
Date: Thu, 30 Jul 2026 09:33:44 +0800
Message-Id: <20260730013349.51-2-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260730013349.51-1-kernel@airkyi.com>
References: <20260730013349.51-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: N7h1OCCDntujLD7ayqlwE/wl68JMD9fa/mRp/1nF8cp0RsiwIWLjk835
	cvTCFUjRjED3sgnAcjMxs1MwkCweZP5giQI94LWX0hDNOx6yxuwdAyGA2tR1bCYI09kI88K
	87zuriOGqi1siVx/77TpAnk/mDEow9sJ1Z7vmOhC2ih10O0jAJ4+AgMJ1fWCMvxOVeHewtH
	uDHyhnYZG3axTrxwmzcv8ngxnDE4izYtPIkKxco+sOnN61xXdEc91esGIfRYWkAp95nkHEn
	wt2PIaMoT9a7BplH7ASlGqUk/qn3CE3cTXfgDXHurCiiLANlmvffLYGCkRNDd4ZTbRTQjFk
	dpz7h0/HBC0MPvfXkq7Do7HOUSstuCInpRz7vmWfI0cT9Y7+mFlTgDXBEFXJE/7xxB2oNX9
	Rp11CVO9n+h3YGRQsR987b5guLeR96KtyN3+8K22/iZSiMQP1yT5J33PMPxdG67UDdd/ROD
	EjzT64u5307IWgw9DldFDzWcLNFRA7DnGN37OH16w3mY0TqwwIebp/0ztOvQnvAbMCkFRsM
	zEVRA4AxTiDIkvbIqa23XeScbZs4USgyTsR+drurRCyfWPLZjnCNKecvI5R73WABBug/ds0
	orN9MiP3ZbKMYyJwrW+fCmHzl0gNox6jbe/kDd/J1yIEiWtazCOT3W6UmwoGXxJRRhK437P
	/cM+nDWORKe/vtPF/KyYfAoc8wZKkjqYdPPXT41moU5TVtEW9FUvAkJMBWqAPceV1niU9ys
	le7z4RxUJTU4CDmg2SPhRLzB4Vrcf7IMhAKxBeVsQ/iu+kPuMThQQrFgAlkRHLrrZvs0WGi
	dcB6PkwBLzWVnJPmmlIdIXRuUF3UqzHxevYX652oLoYoCO3rEouxEFhe4snnVnhJYxwtS0Q
	gYjtU7ANUp8xv0TEwV6YuC2HXyM8dqab6RbteUaQD2ht02Xv/iVr1q1i50hIWO8pFoYXJbU
	IGuaZB/dSEu6ka0c7wJTGgsEYafvhG9u0ieSNLhJXp3gqSNNFn7bc45vqMHbuPOYODIkwcd
	bkoZwjHWPMSOnbTJQ+8jZ9KbDBz28/3iXEyokWj8D/B82s7rSH2gDT07sfOnU=
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_183513_658542_C68E9360 
X-CRM114-Status: GOOD (  20.25  )
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
 .../gpu/drm/bridge/aux-hpd-typec-dp-bridge.c  | 64 +++++++++++++++++++
 3 files changed, 75 insertions(+)
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
index 000000000000..43af3ea20f20
--- /dev/null
+++ b/drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c
@@ -0,0 +1,64 @@
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
+static int drm_typec_bus_event(struct notifier_block *nb,
+			       unsigned long action, void *data)
+{
+	struct device *dev = (struct device *)data;
+	struct typec_altmode *alt = to_typec_altmode(dev);
+
+	if (action != BUS_NOTIFY_ADD_DEVICE)
+		return NOTIFY_OK;
+
+	/*
+	 * alt->dev.parent->parent : USB-C controller device
+	 * alt->dev.parent         : USB-C connector device
+	 */
+	if (is_typec_port_altmode(&alt->dev) && alt->svid == USB_TYPEC_DP_SID)
+		drm_dp_hpd_bridge_register(alt->dev.parent->parent,
+					   to_of_node(alt->dev.parent->fwnode));
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
+         * Register the HPD bridge for these devices.
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


