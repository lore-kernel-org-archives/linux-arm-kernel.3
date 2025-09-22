Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45857CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 01:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LOGwnycc8Wj8KsW4WQRnp4T1oakm2MKzkiW7+jimOy4=; b=0aLYPzliANX+plE8qb0290drFX
	SwsmwfzD+gHlVpZbtzG5EpuZJ2X57r6aZNcAInFxuug5pRbnbse7/usHfZI481A+uNQLFNcNODS2A
	HUTIPkz0RJhL2gj/SdxRRmmHfY7kLvIpDCpWoyYXIHaMPptqD3kusgSH1ot3DwRuCCnDgNLfnn28b
	6UEuHz0G27xYnFdP2LtxBRun3bru3yhb+DAhW93ST13RRZdt584WaloRBA2bAPK2+uZixX36v0+ED
	gOP4Z6DOhSaF4JJmBrNPBD7z23pDMQv1f5JpjWknBoI7CCs7npvtM07LtTUK9kf6jZOe4Y0MCi0zP
	DN9H0oRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0VFl-00000008Uby-0JMf;
	Mon, 22 Sep 2025 01:22:05 +0000
Received: from smtpbgeu2.qq.com ([18.194.254.142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0VFc-00000008UTV-1hlv;
	Mon, 22 Sep 2025 01:22:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1758504054;
	bh=LOGwnycc8Wj8KsW4WQRnp4T1oakm2MKzkiW7+jimOy4=;
	h=From:To:Subject:Date:Message-Id;
	b=eGX8cnF1nIcrrKoXzQyzKGc/E/lxgfHRUSnZrLMluvX/5GBq3nF7mOhhJVhts3v3I
	 IYeKqyQRgt8aLUhBT0UIhv1oElNL5My5nSRjvf71us3VUiUDYW8LzqkIEHQVPSwhBU
	 eMXIIT8fBDqcYvCreFjb1bCk/VZP8vh0YqwcM50g=
X-QQ-mid: zesmtpgz1t1758504052td7dec9e0
X-QQ-Originating-IP: s3BHummt2O6hkB4Do51eRbWReEkBQZAIDj91AtlHJKk=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 22 Sep 2025 09:20:50 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2496768016836932
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
Subject: [PATCH v4 1/7] usb: typec: Add default HPD device when register DisplayPort altmode
Date: Mon, 22 Sep 2025 09:20:33 +0800
Message-Id: <20250922012039.323-2-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250922012039.323-1-kernel@airkyi.com>
References: <20250922012039.323-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: NSahpW5IwUZOeeb6Ty3oWEiQU6Ml27/E33bEIZDF6ED37pk1HsRkFEns
	QbueUqZkHNebxV2OGdn7MXnTjKT7eCg/KV3sL9rJhRna9GHSxh6dK6kQQ4Rt3Bsi3fY6bhg
	Kt7N5rRsKI2C2qoQG5XHa2nhqEGEN4ej/aLaRBq/cvnLAU6txEXT5Po1dBRSXRX+s4S8K/C
	WjQhVt8FPiypaqKT/Bsbo192QnYZuDSHlIWR8EFx0tnvcbl6BtvYzQ+wen6By1oDFZv5Tgn
	zoF8xNmzTIz9zvT1C+DUyMNy98z5G4uK0cJLdLBWQ8TY6L2E/ZUdJVn1vIFhk8JcLIW4rQz
	WOrlwqLxBzR+eCWGu8COV0wjM6O1wHYZypjz2L0J4LSA5HA0zSWFZH2VVp7cL7pk8EbDt+J
	AOQhoJTxsKXXxrV79Ui5Pl2UOSiiuTPOfu1DqJpGoSpRf2p4/W5iJCa7XeMEtpPaupiUdL9
	rlCCtrUct4jV4bHp7FcIb/dNK4vDY6DYZ1alyTvYM3QHYyhMMlckyBWDUZ8AsrDEmFChcYK
	gmojM1gAY6fNezcEtEFsWiUdmL7bH2U1mRegiu97IhN7DE1NAhM7k/OEyrlsk/8RCDgs4Tf
	9VMazQx7L1isSgwvjRPiaihr54r/d+GRkGeV1aieB7hl5HSXMZMb7sIeWuhSCjCluXOUYFn
	VMTXhuR1TJqQs0XPIMCUO9t7pqwqxz+8FoiQhO/V85Q1+kHpjOM9oZDv/EU1INoSreImVaT
	E3ZGVb56qrAtOlePCu2ThYiU23VbU1tUGqJmohMK6FaiVI1RcmCuA7FJaHhehCqWmcv5wYA
	J1HFm6/lq82G3NBQrq/9ftxuS0RIYn5Sna5bEsruee0uC8gGtvC/wZEmlh8PJ1Se2PDwjfm
	B+5G+QswI7lz1groRabs/GwXI4BB3H/E2aUpRelCFgSOkyO61WSvdgV+UpHjZTmkxKiS1FV
	VZHr0Tu4V+lKUFulToNzAk/U/2BHLe+STvC04z+rX71Whiw==
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_182157_059581_A1D77FE4 
X-CRM114-Status: GOOD (  17.16  )
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

Add default DRM AUX HPD bridge device when register DisplayPort
altmode. That makes it redundant for each Type-C driver to implement
a similar registration process in embedded scenarios.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---
 drivers/usb/typec/altmodes/displayport.c | 27 ++++++++++++++++++++++++
 drivers/usb/typec/altmodes/displayport.h |  2 ++
 drivers/usb/typec/class.c                |  8 +++++++
 include/linux/usb/typec_altmode.h        |  2 ++
 4 files changed, 39 insertions(+)

diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
index 1dcb77faf85d..e026dc6e5430 100644
--- a/drivers/usb/typec/altmodes/displayport.c
+++ b/drivers/usb/typec/altmodes/displayport.c
@@ -14,6 +14,7 @@
 #include <linux/property.h>
 #include <linux/usb/pd_vdo.h>
 #include <linux/usb/typec_dp.h>
+#include <drm/bridge/aux-bridge.h>
 #include <drm/drm_connector.h>
 #include "displayport.h"
 
@@ -182,6 +183,10 @@ static int dp_altmode_status_update(struct dp_altmode *dp)
 				dp->pending_irq_hpd = true;
 		}
 	} else {
+		if (dp->port->hpd_dev)
+			drm_aux_hpd_bridge_notify(dp->port->hpd_dev,
+						  hpd ? connector_status_connected :
+							connector_status_disconnected);
 		drm_connector_oob_hotplug_event(dp->connector_fwnode,
 						hpd ? connector_status_connected :
 						      connector_status_disconnected);
@@ -206,6 +211,9 @@ static int dp_altmode_configured(struct dp_altmode *dp)
 	 * configuration is complete to signal HPD.
 	 */
 	if (dp->pending_hpd) {
+		if (dp->port->hpd_dev)
+			drm_aux_hpd_bridge_notify(dp->port->hpd_dev,
+						  connector_status_connected);
 		drm_connector_oob_hotplug_event(dp->connector_fwnode,
 						connector_status_connected);
 		sysfs_notify(&dp->alt->dev.kobj, "displayport", "hpd");
@@ -391,6 +399,9 @@ static int dp_altmode_vdm(struct typec_altmode *alt,
 			dp->data.status = 0;
 			dp->data.conf = 0;
 			if (dp->hpd) {
+				if (dp->port->hpd_dev)
+					drm_aux_hpd_bridge_notify(dp->port->hpd_dev,
+								  connector_status_disconnected);
 				drm_connector_oob_hotplug_event(dp->connector_fwnode,
 								connector_status_disconnected);
 				dp->hpd = false;
@@ -751,6 +762,18 @@ static const struct attribute_group *displayport_groups[] = {
 	NULL,
 };
 
+void dp_altmode_hpd_device_register(struct typec_altmode *alt)
+{
+	if (alt->svid != USB_TYPEC_DP_SID)
+		return;
+
+	alt->hpd_dev = drm_dp_hpd_bridge_register(alt->dev.parent->parent,
+						  dev_of_node(alt->dev.parent->parent));
+	if (IS_ERR(alt->hpd_dev))
+		alt->hpd_dev = NULL;
+}
+EXPORT_SYMBOL_GPL(dp_altmode_hpd_device_register);
+
 int dp_altmode_probe(struct typec_altmode *alt)
 {
 	const struct typec_altmode *port = typec_altmode_get_partner(alt);
@@ -812,6 +835,10 @@ void dp_altmode_remove(struct typec_altmode *alt)
 	cancel_work_sync(&dp->work);
 	typec_altmode_put_plug(dp->plug_prime);
 
+	if (dp->port->hpd_dev)
+		drm_aux_hpd_bridge_notify(dp->port->hpd_dev,
+					  connector_status_disconnected);
+
 	if (dp->connector_fwnode) {
 		drm_connector_oob_hotplug_event(dp->connector_fwnode,
 						connector_status_disconnected);
diff --git a/drivers/usb/typec/altmodes/displayport.h b/drivers/usb/typec/altmodes/displayport.h
index e120364da9fd..9f3483ec10fb 100644
--- a/drivers/usb/typec/altmodes/displayport.h
+++ b/drivers/usb/typec/altmodes/displayport.h
@@ -2,7 +2,9 @@
 #if IS_ENABLED(CONFIG_TYPEC_DP_ALTMODE)
 int dp_altmode_probe(struct typec_altmode *alt);
 void dp_altmode_remove(struct typec_altmode *alt);
+void dp_altmode_hpd_device_register(struct typec_altmode *alt);
 #else
 int dp_altmode_probe(struct typec_altmode *alt) { return -ENOTSUPP; }
 void dp_altmode_remove(struct typec_altmode *alt) { }
+void dp_altmode_hpd_device_register(struct typec_altmode *alt) { }
 #endif /* CONFIG_TYPEC_DP_ALTMODE */
diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 67a533e35150..95732b6d9a95 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -15,6 +15,7 @@
 #include <linux/usb/typec_mux.h>
 #include <linux/usb/typec_retimer.h>
 #include <linux/usb.h>
+#include "altmodes/displayport.h"
 
 #include "bus.h"
 #include "class.h"
@@ -600,6 +601,13 @@ typec_register_altmode(struct device *parent,
 		return ERR_PTR(ret);
 	}
 
+	/*
+	 * It is too late to register the HPD device when the DisplayPort
+	 * altmode device becomes ready. If the current altmode is DP,
+	 * register a static HPD device.
+	 */
+	dp_altmode_hpd_device_register(&alt->adev);
+
 	return &alt->adev;
 }
 
diff --git a/include/linux/usb/typec_altmode.h b/include/linux/usb/typec_altmode.h
index b3c0866ea70f..acb0af1b9d5d 100644
--- a/include/linux/usb/typec_altmode.h
+++ b/include/linux/usb/typec_altmode.h
@@ -21,6 +21,7 @@ struct typec_altmode_ops;
  * @desc: Optional human readable description of the mode
  * @ops: Operations vector from the driver
  * @cable_ops: Cable operations vector from the driver.
+ * @hpd_dev: HPD device for DisplayPort
  */
 struct typec_altmode {
 	struct device			dev;
@@ -32,6 +33,7 @@ struct typec_altmode {
 	char				*desc;
 	const struct typec_altmode_ops	*ops;
 	const struct typec_cable_ops	*cable_ops;
+	struct device			*hpd_dev;
 };
 
 #define to_typec_altmode(d) container_of(d, struct typec_altmode, dev)
-- 
2.49.0


