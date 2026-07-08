Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63AFEC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 09:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1/1+F1RFMl2GV9XWTGIsSj/agttsISF6u+8SbWZvUWE=; b=O4PXdclSvQWJH2CqhZyP6BmKe1
	5PBTjbGolyiToSRzXlBWkIFRYoZSj2ecdj7L5Fp0SOsZkuHZzDTLkWdx4lVl/Sn8bWsRAVVkgQ4aN
	tOLHjnpNdxPf4XAaXgzmxh+lE5xDu17UsBsvUXSdeW42POEn2C0T4OwcvlMnTyW6sIWuv82rPI4MQ
	iRzQKhPxUJTM/E1nyxVNrJUyYp0zfERCyASuXnFJmvlx2MxrGpZhBuGdUIFN0TERXXx49F5WZkmJN
	nz7AIRT6nRjj8D8ksCQTF75b7QyZWQwHr+QPAsy5ef5F8pL2OcQdkulVLAxYL7Jsi1dlcB/TJdC5r
	LH2VyccQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whO9B-0000000GgEj-1veU;
	Wed, 08 Jul 2026 09:00:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whO8y-0000000Gfzd-1Na4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 09:00:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C13B66001D;
	Wed,  8 Jul 2026 09:00:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E438C1F000E9;
	Wed,  8 Jul 2026 09:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783501235;
	bh=1/1+F1RFMl2GV9XWTGIsSj/agttsISF6u+8SbWZvUWE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=HJEiVZsPywwMg6M5aHHmJM3FibXT6peOFS+hroRKr5p41D/reu45046H83c/F5nIl
	 15nhGsyGBFoqkibdcAyq9hdWbH32iknd4RAP80iPNYI8etPiSslov3CWGOyVrNZ0cW
	 2kiUkbqhrQ1pNC2FDV3d/s0pN66eqaIFu2O9aCoj4QQbDQ9O5WhbpA5K82AmxN2Yju
	 fhGlZzq6kqe3KghAofTydnPLW0Z1W1eYhpogO8zbJNPYfgJtHX/m/zAHjs6KV6ipAY
	 3YntcNZVrYMNDIUGw9O++miscbE7NzDBipJoUIk/C+t3LLonrJuG86f4y1v1nKu0g+
	 s5KUFBqbtoGww==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Wed, 08 Jul 2026 10:00:07 +0100
Subject: [PATCH v4 11/16] firmware: arm_scmi: Clear SystemPower flag on
 create failure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-scmi_core_fixes-v4-11-53142cd60b63@kernel.org>
References: <20260708-scmi_core_fixes-v4-0-53142cd60b63@kernel.org>
In-Reply-To: <20260708-scmi_core_fixes-v4-0-53142cd60b63@kernel.org>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Cristian Marussi <cristian.marussi@arm.com>
X-Mailer: b4 0.15.2
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

__scmi_device_create() reserves the singleton SystemPower protocol device
before registering the SCMI device. If any later step fails, a stale
reservation can make a later retry reject SystemPower device creation
permanently, for example after probe deferral.

A plain global boolean is not enough to track the reservation. A delayed
final release of an older SystemPower device could clear the boolean after
a newer device has already claimed it, breaking the singleton guarantee for
the active device.

Track the reservation with the scmi_device pointer itself. Claim it with
cmpxchg(NULL, scmi_dev) after allocating the device object, and release it
with cmpxchg(scmi_dev, NULL) from the common cleanup helper. This lets the
create-failure, explicit destroy and final release paths clear only the
reservation owned by the device being cleaned up.

Fixes: 2c3e674465e7 ("firmware: arm_scmi: Refactor device create/destroy helpers")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/bus.c | 59 ++++++++++++++++++++++-------------------
 1 file changed, 32 insertions(+), 27 deletions(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index 793be9eabaed..dcaefc1aa892 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -7,7 +7,6 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
-#include <linux/atomic.h>
 #include <linux/types.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -33,8 +32,8 @@ struct scmi_requested_dev {
 	struct list_head node;
 };
 
-/* Track globally the creation of SCMI SystemPower related devices */
-static atomic_t scmi_syspower_registered = ATOMIC_INIT(0);
+/* Track globally the SCMI SystemPower protocol device. */
+static struct scmi_device *scmi_syspower_registered;
 
 /**
  * scmi_protocol_device_request  - Helper to request a device
@@ -391,10 +390,17 @@ void scmi_driver_unregister(struct scmi_driver *driver)
 }
 EXPORT_SYMBOL_GPL(scmi_driver_unregister);
 
+static void scmi_device_release_syspower(struct scmi_device *scmi_dev)
+{
+	if (scmi_dev->protocol_id == SCMI_PROTOCOL_SYSTEM)
+		cmpxchg(&scmi_syspower_registered, scmi_dev, NULL);
+}
+
 static void scmi_device_release(struct device *dev)
 {
 	struct scmi_device *scmi_dev = to_scmi_dev(dev);
 
+	scmi_device_release_syspower(scmi_dev);
 	kfree_const(scmi_dev->name);
 	kfree(scmi_dev);
 }
@@ -406,9 +412,7 @@ static void __scmi_device_destroy(struct scmi_device *scmi_dev)
 		 dev_name(&scmi_dev->dev), scmi_dev->protocol_id,
 		 scmi_dev->name);
 
-	if (scmi_dev->protocol_id == SCMI_PROTOCOL_SYSTEM)
-		atomic_set(&scmi_syspower_registered, 0);
-
+	scmi_device_release_syspower(scmi_dev);
 	ida_free(&scmi_bus_id, scmi_dev->id);
 	device_unregister(&scmi_dev->dev);
 }
@@ -419,6 +423,7 @@ __scmi_device_create(struct device_node *np, struct device *parent,
 {
 	int id, retval;
 	struct scmi_device *scmi_dev;
+	bool syspower = (protocol == SCMI_PROTOCOL_SYSTEM);
 
 	/*
 	 * If the same protocol/name device already exist under the same parent
@@ -431,39 +436,33 @@ __scmi_device_create(struct device_node *np, struct device *parent,
 	if (scmi_dev)
 		return scmi_dev;
 
+	scmi_dev = kzalloc_obj(*scmi_dev);
+	if (!scmi_dev)
+		return NULL;
+
+	scmi_dev->protocol_id = protocol;
+
 	/*
-	 * Ignore any possible subsequent failures while creating the device
-	 * since we are doomed anyway at that point; not using a mutex which
-	 * spans across this whole function to keep things simple and to avoid
-	 * to serialize all the __scmi_device_create calls across possibly
-	 * different SCMI server instances (parent)
+	 * Reserve the singleton SystemPower protocol device using the device
+	 * pointer itself, so delayed release of an older device cannot clear
+	 * a reservation owned by a newer device.
 	 */
-	if (protocol == SCMI_PROTOCOL_SYSTEM &&
-	    atomic_cmpxchg(&scmi_syspower_registered, 0, 1)) {
+	if (syspower && cmpxchg(&scmi_syspower_registered, NULL, scmi_dev)) {
 		dev_warn(parent,
 			 "SCMI SystemPower protocol device must be unique !\n");
+		kfree(scmi_dev);
 		return NULL;
 	}
 
-	scmi_dev = kzalloc_obj(*scmi_dev);
-	if (!scmi_dev)
-		return NULL;
-
 	scmi_dev->name = kstrdup_const(name ?: "unknown", GFP_KERNEL);
-	if (!scmi_dev->name) {
-		kfree(scmi_dev);
-		return NULL;
-	}
+	if (!scmi_dev->name)
+		goto free_dev;
 
 	id = ida_alloc_min(&scmi_bus_id, 1, GFP_KERNEL);
-	if (id < 0) {
-		kfree_const(scmi_dev->name);
-		kfree(scmi_dev);
-		return NULL;
-	}
+	if (id < 0)
+		goto free_name;
 
 	scmi_dev->id = id;
-	scmi_dev->protocol_id = protocol;
 	scmi_dev->dev.parent = parent;
 	device_set_node(&scmi_dev->dev, of_fwnode_handle(np));
 	scmi_dev->dev.bus = &scmi_bus_type;
@@ -482,6 +481,12 @@ __scmi_device_create(struct device_node *np, struct device *parent,
 	put_device(&scmi_dev->dev);
 	ida_free(&scmi_bus_id, id);
 	return NULL;
+free_name:
+	kfree_const(scmi_dev->name);
+free_dev:
+	scmi_device_release_syspower(scmi_dev);
+	kfree(scmi_dev);
+	return NULL;
 }
 
 static struct scmi_device *

-- 
2.43.0


