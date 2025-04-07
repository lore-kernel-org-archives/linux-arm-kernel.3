Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72EACC36018
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 18:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kk+sJ5uIUChiU10ulvk3xbtqOOJOIxtcCt00TnkAFo4=; b=b5UiW9GavWCdE3Fz/oRI6XaDjk
	ckYY6tOa3nYBpsAD57Sp8nWT/cO6XFehcuqo9enWJpymtBmEMNXFSn2joam7l0HWpHzqW6u0jJfwy
	KXsloZihAC9GgYW52jAAGBrituzoeU9NheGyISvj9AswYDXzbfjSI/4VyKM0EkGLmuSQK495CuDxQ
	HIVzoIleyLnf7HnDN9AXyeY+MEvTB32Etk71awSnPxdDzEffFwC1tL4i/mffGahjEXBLAqVQLiDP6
	4PXecWvKE3XeKa6wYHpQhaErFYnK9uU/3ztk0guwGVVrd/hGuSgJ5EtWxp9Jg5cwpi+LS3hZ0arpy
	+49W55PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1rdt-00000001iEK-3REJ;
	Mon, 07 Apr 2025 18:56:21 +0000
Received: from sender3-pp-f112.zoho.com ([136.143.184.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1qv9-00000001Tjh-3aRq;
	Mon, 07 Apr 2025 18:10:09 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1744049390; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Necu4VPR/VUul1b+RBujP89FTiCPjqO/Si5Jh01ACaOTbHqylyWqyQ7e2hBq3Qd/kSGArFXMfuiisrC/MF/Sm/qy1JaMMdt2bg4xTeXSvyISgS1WIL1wxGqLDJRQtd9wCIMgxjKpYghvZ1RQA7HrcMf5jEASc9LQkYlQQQzCwbg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1744049390; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Kk+sJ5uIUChiU10ulvk3xbtqOOJOIxtcCt00TnkAFo4=; 
	b=mDDmyjXxgsyT6LQl1niZKJEuYW6a4ZgAiM+PbKd3RgMSuIr+0ueD9zC7e0L/ytg4Sj1XpWg2mr9NA67NsCLrtkKvThQtknnDw9Da4ldxVyZq0Cvu7fw95EOQ3r/9kPX+9aw90oHmSE9Ba3lF0rDD65noUcJHMr/uwgURi+ncu+c=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744049390;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=Kk+sJ5uIUChiU10ulvk3xbtqOOJOIxtcCt00TnkAFo4=;
	b=CTSUKXVCsZIacwoTbuUCDyLQX8AgWIkRchue8FyNix1y1bqePf2q7ojKJwPEz9m0
	NR0tlGrOz2dHOFUyoqIZhFYUhX8m1USdh0WOtnXJZ2SWVIgUIfe2czjQnTWWpQ0HFyo
	bkSmjqaVadC2gUSf/QSWfoDNCdR793HPtX9mtgg8=
Received: by mx.zohomail.com with SMTPS id 174404938859027.759672499582507;
	Mon, 7 Apr 2025 11:09:48 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 07 Apr 2025 20:09:15 +0200
Subject: [PATCH 2/4] phy: rockchip: inno-usb2: add soft vbusvalid control
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-rk3576-sige5-usb-v1-2-67eec166f82f@collabora.com>
References: <20250407-rk3576-sige5-usb-v1-0-67eec166f82f@collabora.com>
In-Reply-To: <20250407-rk3576-sige5-usb-v1-0-67eec166f82f@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Frank Wang <frank.wang@rock-chips.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 kernel@collabora.com, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_111008_004748_18A61BB8 
X-CRM114-Status: GOOD (  19.53  )
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

With USB type C connectors, the vbus detect pin of the OTG controller
attached to it is pulled high by a USB Type C controller chip such as
the fusb302. This means USB enumeration on Type-C ports never works, as
the vbus is always seen as high.

Rockchip added some GRF register flags to deal with this situation. The
RK3576 TRM calls these "soft_vbusvalid_bvalid" (con0 bit index 15) and
"soft_vbusvalid_bvalid_sel" (con0 bit index 14).

Downstream introduces a new vendor property which tells the USB 2 PHY
that it's connected to a type C port, but we can do better. Since in
such an arrangement, we'll have an OF graph connection to the USB
connector anyway, we can walk said OF graph and check the connector's
compatible to determine this without adding any further vendor
properties.

Do keep in mind that the usbdp PHY driver seemingly fiddles with these
register fields as well, but what it does doesn't appear to be enough
for us to get working USB enumeration, presumably because the whole
vbus_attach logic needs to be adjusted as well either way.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 78 +++++++++++++++++++++++++--
 1 file changed, 74 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
index b5e6a864deebbcb33375001fc6ed67b2dfee6954..7dc4f53e18fcf0c9d010dd78e5fcd089b6bae43f 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
@@ -17,6 +17,7 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
+#include <linux/of_graph.h>
 #include <linux/of_irq.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
@@ -114,6 +115,8 @@ struct rockchip_chg_det_reg {
 /**
  * struct rockchip_usb2phy_port_cfg - usb-phy port configuration.
  * @phy_sus: phy suspend register.
+ * @svbus_en: soft vbus bvalid enable register.
+ * @svbus_sel: soft vbus bvalid selection register.
  * @bvalid_det_en: vbus valid rise detection enable register.
  * @bvalid_det_st: vbus valid rise detection status register.
  * @bvalid_det_clr: vbus valid rise detection clear register.
@@ -140,6 +143,8 @@ struct rockchip_chg_det_reg {
  */
 struct rockchip_usb2phy_port_cfg {
 	struct usb2phy_reg	phy_sus;
+	struct usb2phy_reg	svbus_en;
+	struct usb2phy_reg	svbus_sel;
 	struct usb2phy_reg	bvalid_det_en;
 	struct usb2phy_reg	bvalid_det_st;
 	struct usb2phy_reg	bvalid_det_clr;
@@ -203,6 +208,7 @@ struct rockchip_usb2phy_cfg {
  * @event_nb: hold event notification callback.
  * @state: define OTG enumeration states before device reset.
  * @mode: the dr_mode of the controller.
+ * @typec_vbus_det: whether to apply Type C logic to OTG vbus detection.
  */
 struct rockchip_usb2phy_port {
 	struct phy	*phy;
@@ -222,6 +228,7 @@ struct rockchip_usb2phy_port {
 	struct notifier_block	event_nb;
 	enum usb_otg_state	state;
 	enum usb_dr_mode	mode;
+	bool typec_vbus_det;
 };
 
 /**
@@ -495,6 +502,13 @@ static int rockchip_usb2phy_init(struct phy *phy)
 	mutex_lock(&rport->mutex);
 
 	if (rport->port_id == USB2PHY_PORT_OTG) {
+		if (rport->typec_vbus_det) {
+			if (rport->port_cfg->svbus_en.enable &&
+					rport->port_cfg->svbus_sel.enable) {
+				property_enable(rphy->grf, &rport->port_cfg->svbus_en, true);
+				property_enable(rphy->grf, &rport->port_cfg->svbus_sel, true);
+			}
+		}
 		if (rport->mode != USB_DR_MODE_HOST &&
 		    rport->mode != USB_DR_MODE_UNKNOWN) {
 			/* clear bvalid status and enable bvalid detect irq */
@@ -535,8 +549,7 @@ static int rockchip_usb2phy_init(struct phy *phy)
 			if (ret)
 				goto out;
 
-			schedule_delayed_work(&rport->otg_sm_work,
-					      OTG_SCHEDULE_DELAY * 3);
+			schedule_delayed_work(&rport->otg_sm_work, 0);
 		} else {
 			/* If OTG works in host only mode, do nothing. */
 			dev_dbg(&rport->phy->dev, "mode %d\n", rport->mode);
@@ -666,8 +679,17 @@ static void rockchip_usb2phy_otg_sm_work(struct work_struct *work)
 	unsigned long delay;
 	bool vbus_attach, sch_work, notify_charger;
 
-	vbus_attach = property_enabled(rphy->grf,
-				       &rport->port_cfg->utmi_bvalid);
+	if (rport->port_cfg->svbus_en.enable && rport->typec_vbus_det) {
+		if (property_enabled(rphy->grf, &rport->port_cfg->svbus_en) &&
+		    property_enabled(rphy->grf, &rport->port_cfg->svbus_sel)) {
+			vbus_attach = true;
+		} else {
+			vbus_attach = false;
+		}
+	} else {
+		vbus_attach = property_enabled(rphy->grf,
+					       &rport->port_cfg->utmi_bvalid);
+	}
 
 	sch_work = false;
 	notify_charger = false;
@@ -1276,6 +1298,48 @@ static int rockchip_otg_event(struct notifier_block *nb,
 	return NOTIFY_DONE;
 }
 
+static const char *const rockchip_usb2phy_typec_cons[] = {
+	"usb-c-connector",
+	NULL,
+};
+
+static bool rockchip_usb2phy_otg_is_type_c(struct rockchip_usb2phy *rphy)
+{
+	struct device_node *node = rphy->dev->of_node;
+	struct device_node *ports;
+	struct device_node *ep = NULL;
+	struct device_node *parent;
+
+	ports = of_get_child_by_name(node, "ports");
+	if (ports)
+		node = ports;
+
+	for_each_of_graph_port(node, port) {
+		ep = of_get_child_by_name(port, "endpoint");
+		if (!ep)
+			continue;
+
+		parent = of_graph_get_remote_port_parent(ep);
+		of_node_put(ep);
+		if (!parent)
+			continue;
+
+		if (of_device_compatible_match(parent, rockchip_usb2phy_typec_cons)) {
+			of_node_put(parent);
+			if (ports)
+				of_node_put(ports);
+			return true;
+		}
+
+		of_node_put(parent);
+	}
+
+	if (ports)
+		of_node_put(ports);
+
+	return false;
+}
+
 static int rockchip_usb2phy_otg_port_init(struct rockchip_usb2phy *rphy,
 					  struct rockchip_usb2phy_port *rport,
 					  struct device_node *child_np)
@@ -1297,6 +1361,8 @@ static int rockchip_usb2phy_otg_port_init(struct rockchip_usb2phy *rphy,
 
 	mutex_init(&rport->mutex);
 
+	rport->typec_vbus_det = rockchip_usb2phy_otg_is_type_c(rphy);
+
 	rport->mode = of_usb_get_dr_mode_by_phy(child_np, -1);
 	if (rport->mode == USB_DR_MODE_HOST ||
 	    rport->mode == USB_DR_MODE_UNKNOWN) {
@@ -1971,6 +2037,8 @@ static const struct rockchip_usb2phy_cfg rk3576_phy_cfgs[] = {
 		.port_cfgs	= {
 			[USB2PHY_PORT_OTG] = {
 				.phy_sus	= { 0x0000, 8, 0, 0, 0x1d1 },
+				.svbus_en	= { 0x0000, 15, 15, 0, 1 },
+				.svbus_sel	= { 0x0000, 14, 14, 0, 1 },
 				.bvalid_det_en	= { 0x00c0, 1, 1, 0, 1 },
 				.bvalid_det_st	= { 0x00c4, 1, 1, 0, 1 },
 				.bvalid_det_clr = { 0x00c8, 1, 1, 0, 1 },
@@ -2008,6 +2076,8 @@ static const struct rockchip_usb2phy_cfg rk3576_phy_cfgs[] = {
 		.port_cfgs	= {
 			[USB2PHY_PORT_OTG] = {
 				.phy_sus	= { 0x2000, 8, 0, 0, 0x1d1 },
+				.svbus_en	= { 0x2000, 15, 15, 0, 1 },
+				.svbus_sel	= { 0x2000, 14, 14, 0, 1 },
 				.bvalid_det_en	= { 0x20c0, 1, 1, 0, 1 },
 				.bvalid_det_st	= { 0x20c4, 1, 1, 0, 1 },
 				.bvalid_det_clr = { 0x20c8, 1, 1, 0, 1 },

-- 
2.49.0


