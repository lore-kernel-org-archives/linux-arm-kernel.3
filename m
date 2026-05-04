Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 104A8CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 16:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/HXaOTiPhr6HlqF4DpI378DLATKoDTWgbR1/li115Qg=; b=0btKzi2Jnzvz0nj6sL9ZAPrwcn
	VoNsnPdEl73geiE7c/20Hbh73dNx1y3UkWYosP+Z4xaO3TlT9p2rZ0G68pHbCt7PoFx5jOQ6QkUQ5
	DQsMRRUlfeW9FNmHcMxzKtEIYT+kSanuasdWtrfSF0mHnpBx/sFjJPZKi8ETpkRTKYxrrPQAxD2KD
	/0OcJdOK+pHl/TmlP+cHnwXl8dtyXVtbY2N5gAc75FHxxkwAJKJs2ed0HkWgpnqMRdNriDgH+/CqV
	6eENa/pQaizsRt3dNqldLvC/G04Cu3zjWbMkMHChSqXo9RR4TyexBsdv1rX2TesXW+tcGmO/Jo1ik
	/8ah9leQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJwWx-0000000DlJ4-0TP8;
	Mon, 04 May 2026 16:52:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJwWu-0000000DlHR-09KN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 16:52:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 297EB25E2;
	Mon,  4 May 2026 09:52:17 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5E9FE3F763;
	Mon,  4 May 2026 09:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777913542; bh=fNj4ckZbgvI8AyVn1FXEnd6VYSCu3WCPkOhkPWudMAs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JHSLk09oshm55IFWHj7GAerZcXmxKUJ/5lldZIEtinybxhlnVpFHO9gXv8ihwL5gP
	 51Kc4yBiAjpK3Ldn81oZRauuMmGpxWpdLeLZWz1IqyRNWdwPniMb1y90mriCCCq1VS
	 UAkSX5hfal9LxL6c5xhJ34Q1kv8Z6OadJARGhzoo=
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: sudeep.holla@kernel.org,
	philip.radford@arm.com,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@foss.st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	gatien.chevallier@foss.st.com,
	u.kleine-koenig@baylibre.com,
	dakr@kernel.org,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH v1 2/3] firmware: arm_scmi: virtio: Rework transport probe sequence
Date: Mon,  4 May 2026 17:52:03 +0100
Message-ID: <20260504165204.639499-3-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260504165204.639499-1-cristian.marussi@arm.com>
References: <20260504165204.639499-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_095224_181053_FA3F0FAB 
X-CRM114-Status: GOOD (  19.67  )
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

Use the new per-instance transport handles helpers to synchronize and
optionally defer the core SCMI driver probe up until the transport driver
has completely been initialized and it is fully operational as a supplier.

Introduce proper module init/exit routines while removing the ugly trick of
registering a driver from within the probe sequence of another one, just to
avoid to have to deal with probe deferrals.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 drivers/firmware/arm_scmi/transports/virtio.c | 137 +++++++++++++++---
 1 file changed, 120 insertions(+), 17 deletions(-)

diff --git a/drivers/firmware/arm_scmi/transports/virtio.c b/drivers/firmware/arm_scmi/transports/virtio.c
index 326c4a93e44b..7ff9c31c3a8c 100644
--- a/drivers/firmware/arm_scmi/transports/virtio.c
+++ b/drivers/firmware/arm_scmi/transports/virtio.c
@@ -4,7 +4,7 @@
  * (SCMI).
  *
  * Copyright (C) 2020-2022 OpenSynergy.
- * Copyright (C) 2021-2024 ARM Ltd.
+ * Copyright (C) 2021-2026 ARM Ltd.
  */
 
 /**
@@ -17,6 +17,7 @@
  * virtqueue. Access to each virtqueue is protected by spinlocks.
  */
 
+#include <linux/cleanup.h>
 #include <linux/completion.h>
 #include <linux/errno.h>
 #include <linux/platform_device.h>
@@ -116,6 +117,79 @@ static struct scmi_transport_core_operations *core;
 /* Only one SCMI VirtIO device can possibly exist */
 static struct virtio_device *scmi_vdev;
 
+/**
+ * struct scmi_virtio_suppliers  - Transport descriptor
+ * @mtx: A mutex to protect @available
+ * @available: A reference to an initialized transport device ready to use
+ *	       which  will cycle through the following 3 states:
+ *	       1. PTR_ERR(-EPROBE_DEFER) at start before transport is ready
+ *	       2. <supplier_dev> when transport is initialized, ready for use,
+ *	          but still unused
+ *	       3. PTR_ERR(-EBUSY) when transport supplier device is in use
+ * @th: An embedded transport handle object that embeds the helpers
+ *	implementing the above mentioned logic
+ *
+ * Note that this transport driver enforces single instance probing.
+ */
+struct scmi_virtio_suppliers {
+	/* Protect @available */
+	struct mutex mtx;
+	struct device *available;
+	const struct scmi_transport_handle th;
+};
+
+#define to_vsup(t)	container_of(t, struct scmi_virtio_suppliers, th)
+
+static int scmi_virtio_supplier_init(const struct scmi_transport_handle *th,
+				     struct device *dev)
+{
+	struct scmi_virtio_suppliers *vsup = to_vsup(th);
+
+	guard(mutex)(&vsup->mtx);
+	/* Was any transport already registered ? */
+	if (!IS_ERR(vsup->available))
+		return -EBUSY;
+
+	vsup->available = dev;
+
+	return 0;
+}
+
+static struct device *
+scmi_virtio_supplier_get(const struct scmi_transport_handle *th)
+{
+	struct scmi_virtio_suppliers *vsup = to_vsup(th);
+	struct device *supplier;
+
+	guard(mutex)(&vsup->mtx);
+	supplier = vsup->available;
+	if (!IS_ERR(supplier))
+		vsup->available = ERR_PTR(-EBUSY);
+
+	return supplier;
+}
+
+static void scmi_virtio_supplier_put(const struct scmi_transport_handle *th,
+				     struct device *supplier)
+{
+	struct scmi_virtio_suppliers *vsup = to_vsup(th);
+
+	guard(mutex)(&vsup->mtx);
+	vsup->available = supplier;
+}
+
+static void scmi_virtio_supplier_cleanup(const struct scmi_transport_handle *th)
+{
+	scmi_virtio_supplier_put(th, ERR_PTR(-EPROBE_DEFER));
+}
+
+static struct scmi_virtio_suppliers scmi_transport_suppliers = {
+	.mtx = __MUTEX_INITIALIZER(mutexname),
+	.available = INIT_ERR_PTR(-EPROBE_DEFER),
+	.th.supplier_get = scmi_virtio_supplier_get,
+	.th.supplier_put = scmi_virtio_supplier_put,
+};
+
 static void scmi_vio_channel_ready(struct scmi_vio_channel *vioch,
 				   struct scmi_chan_info *cinfo)
 {
@@ -377,7 +451,7 @@ static bool virtio_chan_available(struct device_node *of_node, int idx)
 {
 	struct scmi_vio_channel *channels, *vioch = NULL;
 
-	if (WARN_ON_ONCE(!scmi_vdev))
+	if (!scmi_vdev)
 		return false;
 
 	channels = (struct scmi_vio_channel *)scmi_vdev->priv;
@@ -394,6 +468,10 @@ static bool virtio_chan_available(struct device_node *of_node, int idx)
 		return false;
 	}
 
+	dev_dbg(&scmi_vdev->dev, "%s Channel %sAVAILABLE on SCMI Virtio device.\n",
+		idx == VIRTIO_SCMI_VQ_TX ? "TX" : "RX",
+		(vioch && !vioch->cinfo) ? "" : "NOT ");
+
 	return vioch && !vioch->cinfo;
 }
 
@@ -410,7 +488,7 @@ static int virtio_chan_setup(struct scmi_chan_info *cinfo, struct device *dev,
 	int i;
 
 	if (!scmi_vdev)
-		return -EPROBE_DEFER;
+		return -EINVAL;
 
 	vioch = &((struct scmi_vio_channel *)scmi_vdev->priv)[index];
 
@@ -460,6 +538,9 @@ static int virtio_chan_setup(struct scmi_chan_info *cinfo, struct device *dev,
 
 	scmi_vio_channel_ready(vioch, cinfo);
 
+	dev_dbg(&scmi_vdev->dev, "%s Channel SETUP on SCMI Virtio device.\n",
+		tx ? "TX" : "RX");
+
 	return 0;
 }
 
@@ -801,7 +882,7 @@ static struct scmi_desc scmi_virtio_desc = {
 };
 
 static const struct of_device_id scmi_of_match[] = {
-	{ .compatible = "arm,scmi-virtio" },
+	{ .compatible = "arm,scmi-virtio", .data = &scmi_transport_suppliers.th},
 	{ /* Sentinel */ },
 };
 
@@ -864,33 +945,30 @@ static int scmi_vio_probe(struct virtio_device *vdev)
 			sz = MSG_TOKEN_MAX;
 		}
 		channels[i].max_msg = sz;
+		dev_dbg(dev, "VQ%d initialized with max_msg: %d\n", i, sz);
 	}
 
 	vdev->priv = channels;
+	ret = scmi_virtio_supplier_init(&scmi_transport_suppliers.th,
+					&vdev->dev);
+	if (ret) {
+		vdev->priv = NULL;
+		vdev->config->del_vqs(vdev);
+		return ret;
+	}
 
 	/* Ensure initialized scmi_vdev is visible */
 	smp_store_mb(scmi_vdev, vdev);
-
 	/* Set device ready */
 	virtio_device_ready(vdev);
 
-	ret = platform_driver_register(&scmi_virtio_driver);
-	if (ret) {
-		vdev->priv = NULL;
-		vdev->config->del_vqs(vdev);
-		/* Ensure NULLified scmi_vdev is visible */
-		smp_store_mb(scmi_vdev, NULL);
-
-		return ret;
-	}
+	dev_dbg(dev, "Probed and initialized SCMI Virtio device.\n");
 
 	return 0;
 }
 
 static void scmi_vio_remove(struct virtio_device *vdev)
 {
-	platform_driver_unregister(&scmi_virtio_driver);
-
 	/*
 	 * Once we get here, virtio_chan_free() will have already been called by
 	 * the SCMI core for any existing channel and, as a consequence, all the
@@ -900,8 +978,10 @@ static void scmi_vio_remove(struct virtio_device *vdev)
 	 */
 	virtio_reset_device(vdev);
 	vdev->config->del_vqs(vdev);
+
 	/* Ensure scmi_vdev is visible as NULL */
 	smp_store_mb(scmi_vdev, NULL);
+	scmi_virtio_supplier_cleanup(&scmi_transport_suppliers.th);
 }
 
 static int scmi_vio_validate(struct virtio_device *vdev)
@@ -936,7 +1016,30 @@ static struct virtio_driver virtio_scmi_driver = {
 	.validate = scmi_vio_validate,
 };
 
-module_virtio_driver(virtio_scmi_driver);
+static int __init scmi_transport_virtio_init(void)
+{
+	int ret;
+
+	ret = register_virtio_driver(&virtio_scmi_driver);
+	if (ret)
+		return ret;
+
+	ret = platform_driver_register(&scmi_virtio_driver);
+	if (ret) {
+		unregister_virtio_driver(&virtio_scmi_driver);
+		return ret;
+	}
+
+	return ret;
+}
+module_init(scmi_transport_virtio_init);
+
+static void __exit scmi_transport_virtio_exit(void)
+{
+	platform_driver_unregister(&scmi_virtio_driver);
+	unregister_virtio_driver(&virtio_scmi_driver);
+}
+module_exit(scmi_transport_virtio_exit);
 
 MODULE_AUTHOR("Igor Skalkin <igor.skalkin@opensynergy.com>");
 MODULE_AUTHOR("Peter Hilber <peter.hilber@opensynergy.com>");
-- 
2.53.0


