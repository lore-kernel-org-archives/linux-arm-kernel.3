Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36E08CD37B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 15:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PtkM4vjZ6ptvEPROsPSqdnCDhurQk8yp3fWsUH4fDQE=; b=uo7aE3WNUGOLhHmbFvEZ3MOLzJ
	g1w1cygYEXGoRepnCln1SXZ6TNOBxJqsrZzZugY7ag3HTNxqZrpEtVVkqZO2sszU+jD/KH5D4g2BC
	7canZVGohhaOTf/A7cKVJ1nvqXkI1dKzPG2E+u/EDR9JwGWD0zNoZnqc1Ej+wcWonHU0kIuRneh6r
	CB19I91VTjzuj4grGlQEGiJ/JB5sCEbhYCly86OX+8kYLBcf/wldPdRxHSNcqpIFaw46rTmX5DNqd
	PRU50iyg1FUcW0t1S8b8ueKFh3du4DULXp9yKbJluw/SmVhTFr7epRl8WYkEOSt7uF3JDjU9lVeXb
	viYTkT7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMT1x-0000000E7t0-0DlO;
	Mon, 11 May 2026 15:58:53 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMT1u-0000000E7q6-0Yr0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 15:58:51 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 06A50C5E154;
	Mon, 11 May 2026 15:59:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6BAF760646;
	Mon, 11 May 2026 15:58:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 17A6B11AF9F19;
	Mon, 11 May 2026 17:58:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778515125; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=PtkM4vjZ6ptvEPROsPSqdnCDhurQk8yp3fWsUH4fDQE=;
	b=UC3/FJM75zF/6aQSyxjNxqHybcIWFluQDgqYUmDLTWjDE7a9NCRoAorMPmFRkZKZtSQ+IR
	N6XZbpyz3mtDCo6r/43BfHRtAaKRwA5rMEwGrmlDwge3XQWTgktVGe8yOCp3Y48QoQjTO9
	fydI3LNIBZvDyOPzo82QIrC0E2Zl9iBW6kV9yRvIOU6naiWv01E0yHL+Q7cx8mHkjCfYzL
	YETIsm2AUi0GFnLeZL05NRupw/mPZz6v0a9mRa5iJMdjgZvVpGKnn5IyDVS1GUVVYH9w/p
	PpbGNYj8yO31amLXh5+g9H6e/M/65lpnHfXJiuhNITdUBcAZyDzz5JpDefOIRA==
From: Herve Codina <herve.codina@bootlin.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kalle Niemi <kaleposti@gmail.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Mark Brown <broonie@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Len Brown <lenb@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Wolfram Sang <wsa@kernel.org>,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	Allan Nielsen <allan.nielsen@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	Steen Hegelund <steen.hegelund@microchip.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Saravana Kannan <saravanak@google.com>,
	Herve Codina <herve.codina@bootlin.com>
Subject: [PATCH v7 2/3] of: dynamic: Fix overlayed devices not probing because of fw_devlink
Date: Mon, 11 May 2026 17:57:49 +0200
Message-ID: <20260511155755.34428-3-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511155755.34428-1-herve.codina@bootlin.com>
References: <20260511155755.34428-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_085850_460022_F453D9BD 
X-CRM114-Status: GOOD (  23.81  )
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

From: Saravana Kannan <saravanak@google.com>

When an overlay is applied, if the target device has already probed
successfully and bound to a device, then some of the fw_devlink logic
that ran when the device was probed needs to be rerun. This allows newly
created dangling consumers of the overlayed device tree nodes to be
moved to become consumers of the target device.

Fixes: 1a50d9403fb9 ("treewide: Fix probing of devices in DT overlays")
Reported-by: Herve Codina <herve.codina@bootlin.com>
Closes: https://lore.kernel.org/lkml/CAMuHMdXEnSD4rRJ-o90x4OprUacN_rJgyo8x6=9F9rZ+-KzjOg@mail.gmail.com/
Closes: https://lore.kernel.org/all/20240221095137.616d2aaa@bootlin.com/
Closes: https://lore.kernel.org/lkml/20240312151835.29ef62a0@bootlin.com/
Signed-off-by: Saravana Kannan <saravanak@google.com>
Link: https://lore.kernel.org/lkml/20240411235623.1260061-3-saravanak@google.com/
[Herve: Rebase on top of recent kernel]
[Herve: Add the call to driver_deferred_probe_trigger()]
[Herve: Use fwnode_test_flag() to test fwnode flags value]
Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Tested-by: Kalle Niemi <kaleposti@gmail.com>
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/base/core.c    | 83 +++++++++++++++++++++++++++++++++++++-----
 drivers/of/overlay.c   | 15 ++++++++
 include/linux/fwnode.h |  1 +
 3 files changed, 90 insertions(+), 9 deletions(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index bd2ddf2aab50..478aa3fbf1e8 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -235,6 +235,79 @@ static void __fw_devlink_pickup_dangling_consumers(struct fwnode_handle *fwnode,
 		__fw_devlink_pickup_dangling_consumers(child, new_sup);
 }
 
+static void fw_devlink_pickup_dangling_consumers(struct device *dev)
+{
+	struct fwnode_handle *child;
+
+	guard(mutex)(&fwnode_link_lock);
+
+	fwnode_for_each_available_child_node(dev->fwnode, child)
+		__fw_devlink_pickup_dangling_consumers(child, dev->fwnode);
+	__fw_devlink_link_to_consumers(dev);
+}
+
+/**
+ * fw_devlink_refresh_fwnode - Recheck the tree under this firmware node
+ * @fwnode: The fwnode under which the fwnode tree has changed
+ *
+ * This function is mainly meant to adjust the supplier/consumer dependencies
+ * after a fwnode tree overlay has occurred.
+ */
+void fw_devlink_refresh_fwnode(struct fwnode_handle *fwnode)
+{
+	struct device *dev;
+
+	/*
+	 * Find the closest ancestor fwnode that has been converted to a device
+	 * that can bind to a driver (bus device).
+	 */
+	fwnode_handle_get(fwnode);
+	do {
+		if (fwnode_test_flag(fwnode, FWNODE_FLAG_NOT_DEVICE))
+			continue;
+
+		dev = get_dev_from_fwnode(fwnode);
+		if (!dev)
+			continue;
+
+		if (dev->bus)
+			break;
+
+		put_device(dev);
+	} while ((fwnode = fwnode_get_next_parent(fwnode)));
+
+	/*
+	 * If none of the ancestor fwnodes have (yet) been converted to a device
+	 * that can bind to a driver, there's nothing to fix up.
+	 */
+	if (!fwnode)
+		return;
+
+	WARN(device_is_bound(dev) && dev->links.status != DL_DEV_DRIVER_BOUND,
+	     "Don't multithread overlaying and probing the same device!\n");
+
+	/*
+	 * If the device has already bound to a driver, then we need to redo
+	 * some of the work that was done after the device was bound to a
+	 * driver. If the device hasn't bound to a driver, running things too
+	 * soon would incorrectly pick up consumers that it shouldn't.
+	 */
+	if (dev->links.status == DL_DEV_DRIVER_BOUND) {
+		fw_devlink_pickup_dangling_consumers(dev);
+		/*
+		 * Some of dangling consumers could have been put previously in
+		 * the deferred probe list due to the unavailability of their
+		 * suppliers. Those consumers have been picked up and some of
+		 * their suppliers links have been updated. Time to re-try their
+		 * probe sequence.
+		 */
+		driver_deferred_probe_trigger();
+	}
+
+	put_device(dev);
+	fwnode_handle_put(fwnode);
+}
+
 static DEFINE_MUTEX(device_links_lock);
 DEFINE_STATIC_SRCU(device_links_srcu);
 
@@ -1312,16 +1385,8 @@ void device_links_driver_bound(struct device *dev)
 	 * child firmware node.
 	 */
 	if (dev->fwnode && dev->fwnode->dev == dev) {
-		struct fwnode_handle *child;
-
 		fwnode_links_purge_suppliers(dev->fwnode);
-
-		guard(mutex)(&fwnode_link_lock);
-
-		fwnode_for_each_available_child_node(dev->fwnode, child)
-			__fw_devlink_pickup_dangling_consumers(child,
-							       dev->fwnode);
-		__fw_devlink_link_to_consumers(dev);
+		fw_devlink_pickup_dangling_consumers(dev);
 	}
 	device_remove_file(dev, &dev_attr_waiting_for_supplier);
 
diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
index c1c5686fc7b1..4e45f3414c2c 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -185,6 +185,15 @@ static int overlay_notify(struct overlay_changeset *ovcs,
 	return 0;
 }
 
+static void overlay_fw_devlink_refresh(struct overlay_changeset *ovcs)
+{
+	for (int i = 0; i < ovcs->count; i++) {
+		struct device_node *np = ovcs->fragments[i].target;
+
+		fw_devlink_refresh_fwnode(of_fwnode_handle(np));
+	}
+}
+
 /*
  * The values of properties in the "/__symbols__" node are paths in
  * the ovcs->overlay_root.  When duplicating the properties, the paths
@@ -951,6 +960,12 @@ static int of_overlay_apply(struct overlay_changeset *ovcs,
 		pr_err("overlay apply changeset entry notify error %d\n", ret);
 	/* notify failure is not fatal, continue */
 
+	/*
+	 * Needs to happen after changeset notify to give the listeners a chance
+	 * to finish creating all the devices they need to create.
+	 */
+	overlay_fw_devlink_refresh(ovcs);
+
 	ret_tmp = overlay_notify(ovcs, OF_OVERLAY_POST_APPLY);
 	if (ret_tmp)
 		if (!ret)
diff --git a/include/linux/fwnode.h b/include/linux/fwnode.h
index 80b38fbf2121..357592c5b375 100644
--- a/include/linux/fwnode.h
+++ b/include/linux/fwnode.h
@@ -250,6 +250,7 @@ int fwnode_link_add(struct fwnode_handle *con, struct fwnode_handle *sup,
 		    u8 flags);
 void fwnode_links_purge(struct fwnode_handle *fwnode);
 void fw_devlink_purge_absent_suppliers(struct fwnode_handle *fwnode);
+void fw_devlink_refresh_fwnode(struct fwnode_handle *fwnode);
 bool fw_devlink_is_strict(void);
 
 #endif
-- 
2.54.0


