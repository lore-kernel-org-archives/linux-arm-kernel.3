Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B35E7C44517
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 07:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wyo7ub+4BApocKz9R0jl9tIayPTluBedW1dt0z+RsIE=; b=HSBB1qearGZy2q1b4zuit3L7XL
	vDNAOU5SQtQ+1jxA8+eUVblvVeNPo5u53rnUpbIBK84AtpL8Cv5roQUf2skxMxMNjRDYlv/bECUaK
	W9xAJfkZ9+LVAoScII6wOGUlThg2iEzJ+kdXx1CnSRgxDeWmvDMWnM0ycam/3Cm3i/QcrTXi4m+1K
	AP12AS6B0XDgeQNorsU9LRrZ2G/A7UH+NyLJPX9sBbY+DU0kVWHZFBcpmFM5STniO9hY77KYkVKWo
	4l376DK2Fupj3rUpyElbs9jJCiMeecakOQGuTZllE4w+Os69Sj26Ihd3gF/M2bI99uIO4/HWuq5fd
	ya8GsIng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkcw9-00000001QP4-190R;
	Fri, 17 Jul 2026 07:24:45 +0000
Received: from smtpbguseast2.qq.com ([54.204.34.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkcvs-00000001Q8C-2a9J;
	Fri, 17 Jul 2026 07:24:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1784273017;
	bh=wyo7ub+4BApocKz9R0jl9tIayPTluBedW1dt0z+RsIE=;
	h=From:To:Subject:Date:Message-Id;
	b=DlqopraUkFrslsy1LOTBas2mktEhaeZbD6RmGUYXv1ziJ6kUrJwFc9qycfSb00Cee
	 /YsaAxl3c6pan71zbzCB4Jyz2gJ09V8RRkJXoGrieIhDD00WOpzUyAYaOzM+S7HO24
	 uvMTsmdRq+URJ0KsND/43adg8LUCl2lH5zjkTmsE=
X-QQ-mid: esmtpsz21t1784273015t55286922
X-QQ-Originating-IP: FCFwPLEn8pNCTJOV0JUPVpFgU5y4+bvUtPQEL4lUcV8=
Received: from DESKTOP-8BT1A2O.localdomain ( [61.154.14.86])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 17 Jul 2026 15:23:31 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5852056859405087285
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
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-phy@lists.infradead.org
Subject: [PATCH v3 1/5] drm/bridge: Implement generic USB Type-C DP HPD bridge
Date: Fri, 17 Jul 2026 15:23:19 +0800
Message-Id: <20260717072323.96-2-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260717072323.96-1-kernel@airkyi.com>
References: <20260717072323.96-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: OWrCF2BxNSO81qFU42EyhaIDJdXefRnEV+bk3DTVZttVbLicgPYAQwta
	mZJWcJXqz85rRgUPyWNaG5CSdIl7863t/GTzBDnCeZzjvbXZBQzoGwG7s6I5hXrWbut1FyH
	XwtxpyHnchv+VKBxSysnT2CGS2YnmH8G2/XVRQ7v9CuPTn/voeo+0CiP2LwhRNyY5hzN3PC
	AW760GIevzS+R7lnqza67DIgkVtBjOhibEKdhWddIsWK4Z9YYawCMgrqjOLt8fVb9IE5GJI
	sY3UpmIrZBXZIpRek2mxx4lXUOphew4oz+z3AUpKnnrKmsKP4uuGEJ1goVVlkJOmf2Bb5/U
	pS2tY9Nw/1OdCVmzSRCTjMxjiWAnPfo6Jxd2oDmVL8Xo5rum0zRLXnLYrtbOppw3dgbw1GE
	qUNLflpUY+ujndXHvp9wTvBgviCq8uSaRm9OMr8TXJiAJBqq5EyeP6BZIGIZMS4WZ92Hn6E
	tmWL58UFtMmS1+XmhdGjb5UB7wqplQ/xRYYadK+wgVrJF4+wKLUvR4Sm3Ks/SkZpQoqMjNl
	uI5Zvasq1JFoBdQDHdHlxyUg4tmzbMBANfPmRdPdSdLdDWhYQRo0T3L2Xp763CetTYJGv5F
	Uw+B5Pd161224BblCQGpJRVMUWWLURpMS0534SLJTHJvTaeLlYUEg2rIAY58nd39/EXxYMX
	kDyD14RnVo3IKqdssC4OIpCiJrZ8suG5v83QFZcDbkvXA7rFHp1NnVuMVuQyBc9AKXHa5Td
	j9ZNs7n4W903Pk4dBdhyXr0reBWDaaSsy3QytO8KySSFXX9oTDRcty4G0ZT6opUIljDmJOW
	GWgM2s9xRxrw9/93w2ZTqvUyiT61zlX11S789Zqi6eanSWLU7H5Sz3Bzjf1lylaQDw11z5H
	C9bV0kgOEzb4GfQM1eJOs+7u5DluBywpojTK9hckg+IvbFV0UNcf7Uhs7/umQGFzdMN7KNN
	hzqV3kdC11XQCphLJbJhJhE5L3sVR4ial/+VG52otDQihGYIp9NwaXPtHJi1hLOus3Bixel
	J7hhUExuxmpinOhadAf4X7qJW34L6gQZLaaVTTkg==
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_002429_192808_A2F2FE23 
X-CRM114-Status: GOOD (  18.89  )
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

(no changes since v3)

Changes in v2:
- Add copyright text.
- Remove useless goto.

---
 drivers/gpu/drm/bridge/Kconfig                | 10 ++++
 drivers/gpu/drm/bridge/Makefile               |  1 +
 .../gpu/drm/bridge/aux-hpd-typec-dp-bridge.c  | 54 +++++++++++++++++++
 3 files changed, 65 insertions(+)
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
index 000000000000..c09579ff7ab9
--- /dev/null
+++ b/drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c
@@ -0,0 +1,54 @@
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
+MODULE_AUTHOR("Chaoyi Chen <chaoyi.chen@rock-chips.com>");
+MODULE_DESCRIPTION("DRM TYPEC DP HPD BRIDGE");
+MODULE_LICENSE("GPL");
-- 
2.53.0


