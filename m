Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF217D2CE17
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 01:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/ITohFNSR7lZRzb2jcZzCyseW4V9moYl6cPe0u/7eVQ=; b=hQRHOEg4Yoys6+yQNBC9JkdwkS
	p8N0q5vof3R1yFxfqo3dVJVA50XvowVFEeDyB7GvGkcOsGUPJ0xNSOwtFAy+cO6Ju9e4JbpMsDMGb
	eOVzMS+YMetI4yVY+YYZk6Xff/GmUTH31F4qSLpUHl79AFeNQICxZUmWu0ZzoHl9M9awdLsQQmL1F
	NIaTfnxcmBNUrHR5ZtRdv1/rm1oYLSllbEk0SqtazhyMFwLE8rK9QKr4EQUh7YjbWrT7fjSKddSTi
	R3j+Js6IqQlpDlkYe7a1N7E7/Gl4pCinWSy+UaaQNxUvMr3hJ/EdEHB3AnF5YyvjZRz4r98U6qzMa
	/UnxFQUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSQU2-0000000CPr7-1Nz8;
	Mon, 08 Dec 2025 01:56:14 +0000
Received: from smtpbg151.qq.com ([18.169.211.239])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSQTr-0000000CPlk-3059;
	Mon, 08 Dec 2025 01:56:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1765158926;
	bh=/ITohFNSR7lZRzb2jcZzCyseW4V9moYl6cPe0u/7eVQ=;
	h=From:To:Subject:Date:Message-Id;
	b=VdO0Jn5MduDfj9k13G+diYn9Won2YEFhmTJZ9z5AI9UgkeM6cpL62Pvidk3Fzrgrc
	 gAE/IWbmrXl1jkZYt25/7G5W48dietLPzNdpbhjtHm1vMoYwPeQNo79a1zs9+bDn9J
	 iKkpiL+DNqtH9EcEBMoF9QvIzsKSE39MzSDIZ3LQ=
X-QQ-mid: esmtpsz19t1765158924t760755d5
X-QQ-Originating-IP: 3roZbY8eqQltdEXFqjutnrbNDJ5RRJ4S3DkEoxdunYw=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 08 Dec 2025 09:55:21 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10138295490961143045
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
Subject: [PATCH v13 03/11] drm/bridge: Implement generic USB Type-C DP HPD bridge
Date: Mon,  8 Dec 2025 09:54:52 +0800
Message-Id: <20251208015500.94-4-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251208015500.94-1-kernel@airkyi.com>
References: <20251208015500.94-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MShfLn39PbN2yDcQfiZSX7HG0VX8cENqmu7rD5ouHqomjF9F/FNkYRjc
	zfulT/+yCyE2LYfFSdrjYcKDCnqYI055D3tS2LTd5ueZXKRFtGc9UuQqi9Ha5CKNuuqGpzf
	g55+s2bFrGesK8idGBhNs2xUuqsD1AfW3GyHVE1ds3KTvW5Miw21sjW77oYeQ5x+ZF1IEPI
	vhxrdaNojQ1KtC+5VK1MF1GbuNMmkQIDsLESJ39Nplj9/uPhpCx10fxwtaFlkVRrrcZiXeg
	31RkOSp55zaJu+xONNvAl8Tl08007o8MUI+mB5T3Xw9G6eH8nK9XrCVU2mJfAxdFMf6BMDv
	lRaXVa8RCTJ9021DnphpYQVDr+s/MtrMv+3P3ffGE+uota00Jgzs09GhGQq3uDKYysf3KYV
	ILxxP7dDEOamYNZkLeTMp5AG3tK+Nr/JRB+zr+ltA+ASTM4czq/27WrKX8YCOx/xZ5bJdWJ
	l4HpLS48MbKK1PMR/HQ0bPKoL0JJNzyXdzRoUOBbyDKLEjxC+TVB+bhFSBBkmn5avOQWOWF
	UCrpBVhn2IS0pEDpfSSWxlXbSAskN7JiZGHBm9BBH5ccoDI8P2SoXDK/rvzc4j7Uk5s0DVx
	Rl8wqlBM+s8Qb2piLRSZhYShBhzJnuQVAsX/oSAX9Unj/kNLqShcvBf1be2XayyRE6/eyc9
	yQc/NAuLFRD0wQYWYXUCpFQpZxoqMBGG7trFqEHoQq+58JrtaG6mDE2AvT1UI0tzfSxLZZD
	k8NEb/ETBBXiCLhd/ER5PcPdgHYjYMpwcbeco9G2QZDR30pnWULxXng0pzi3BXAiBph1ZgF
	hyJ/nolDF8z8wqNHoLz6lxLuvknfuEaoAtpgoWhSvdbcqxMOd3KrR9RE6RpW1aa5sa1oy1q
	s6cok4wAfaNP5C/eZyKVV28jhdGqycaFit6zeU9POdZyiLBwzg7pXRaGWVOTgWYcgAgfBAU
	ys/2GKabSP4Im0AemaQdTgkG4FXUW5XobKM/xDmEaSrSPL56J+hWKWi6GsqQh97EKS5mJAo
	FpzE/sXQ==
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251207_175604_379961_39136F74 
X-CRM114-Status: GOOD (  21.12  )
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

Changes in v13:
- Only register drm dp hpd bridge for typec port altmode device.

(no changes since v12)

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
 .../gpu/drm/bridge/aux-hpd-typec-dp-bridge.c  | 49 +++++++++++++++++++
 3 files changed, 60 insertions(+)
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
2.51.1


