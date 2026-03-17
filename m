Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A9C6FD706B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 10:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o9rP5SkTCzm7t9extvzTJHULZcxWva7A1dtUn+MvjRU=; b=CklZCUVTYXpT6g
	1KVOD71dAXxBEKVUm1OvEwkab5avXARgbPjtwA70vSUZ4DYYVgzhh1X1wCEgRM2H90F0rnrX9gdSO
	nlV7zfJT3F1VYspJ7aliw/GZbijnV2o893pm6t1jkaSysyG6uvItM2x+DTFYawCp6YCtkLMomOItz
	8wfYSdVQbNuHJIlyqW4TZASmiyAc1bxvIUOUXpc/QB5LKBWTPQG7B3Yexkv+bAXaOAxjeQe/3dHpT
	8knhNMVorQqKPZRo4RVe+51fhp5PbW9iFUIxa5XG4ttfNoZcS6pMfci77JsqPam3DrBDzkP0ZNzdW
	7ObqtQ4KvPZwARuSOAmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Rkc-000000062Es-0LaV;
	Tue, 17 Mar 2026 10:34:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2RkP-00000006276-3RIF
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 17 Mar 2026 10:34:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=o9rP5SkTCzm7t9extvzTJHULZcxWva7A1dtUn+MvjRU=; b=dV/3jlXFGzUKT1Zr+i8aXPqH0K
	wXvM1NVOMhRKc0UBZijj1BwC+CuPZlAKzbRyVuwcgwSY36t/MzEbR7hyfpwoZtHqMfGEfT727Omfu
	d2rd/gse0IZNWEPbiRncbLOq89U9wkG3y5/osdWu9sVwBbvtaJCJxi5AXSRsfLBnnvssOoJXL9sul
	d2hStMFZgcpfct6/KlhUM2yZAGjjV5z7pzQhS3Y5Fe0qPD3f8Dc3c1x2ULHYFta7ImM8n/uDnQ4lD
	lprQDIpntpRNEomXsvR6SYx3Qk0SPnwWSjChv7mYxasVpfkqziiImZbyQObMAHx8K0Zu3F188+Jx6
	7931EeXA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2RkM-00000008iL2-1H1T
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 10:34:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EA4371476;
	Tue, 17 Mar 2026 03:33:49 -0700 (PDT)
Received: from e142021.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2A9813F7BD;
	Tue, 17 Mar 2026 03:33:54 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: [PATCH v2 5/8] firmware: smccc: lfa: Register ACPI notification
Date: Tue, 17 Mar 2026 11:33:31 +0100
Message-ID: <20260317103336.1273582-6-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260317103336.1273582-1-andre.przywara@arm.com>
References: <20260317103336.1273582-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_103358_738744_5049D4CB 
X-CRM114-Status: GOOD (  22.58  )
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
Cc: vsethi@nvidia.com, Salman Nabi <salman.nabi@arm.com>, linux-kernel@vger.kernel.org, vwadekar@nvidia.com, Trilok Soni <trilokkumar.soni@oss.qualcomm.com>, Nirmoy Das <nirmoyd@nvidia.com>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Vedashree Vidwans <vvidwans@nvidia.com>

The Arm LFA spec describes an ACPI notification mechanism, where the
platform (firmware) can notify an LFA client about newly available
firmware imag updates ("pending images" in LFA terms).

Add a faux device after discovering the existence of an LFA agent via
the SMCCC discovery mechnism, and use that device to check for the ACPI
notification description. Register this when one is provided.

The notification just conveys the fact that at least one firmware image
has now a pending update, it doesn't say which, also there could be more
than one pending. Loop through all images to find every which needs to
be activated, and trigger the activation. We need to do this is a loop,
since an activation might change the number and the status of available
images.

Signed-off-by: Vedashree Vidwans <vvidwans@nvidia.com>
[Andre: convert from platform driver to faux device]
Signed-off-by: Andre Przywara <andre.przywar@arm.com>
---
 drivers/firmware/smccc/lfa_fw.c | 147 ++++++++++++++++++++++++++++++++
 1 file changed, 147 insertions(+)

diff --git a/drivers/firmware/smccc/lfa_fw.c b/drivers/firmware/smccc/lfa_fw.c
index d1b5cd29b8a0..f20ea45cdbd9 100644
--- a/drivers/firmware/smccc/lfa_fw.c
+++ b/drivers/firmware/smccc/lfa_fw.c
@@ -3,11 +3,14 @@
  * Copyright (C) 2025 Arm Limited
  */
 
+#include <linux/acpi.h>
 #include <linux/arm-smccc.h>
 #include <linux/array_size.h>
 #include <linux/delay.h>
+#include <linux/device/faux.h>
 #include <linux/fs.h>
 #include <linux/init.h>
+#include <linux/kernel.h>
 #include <linux/kobject.h>
 #include <linux/ktime.h>
 #include <linux/list.h>
@@ -17,11 +20,13 @@
 #include <linux/stop_machine.h>
 #include <linux/string.h>
 #include <linux/sysfs.h>
+#include <linux/types.h>
 #include <linux/uuid.h>
 #include <linux/workqueue.h>
 
 #include <uapi/linux/psci.h>
 
+#define DRIVER_NAME	"ARM_LFA"
 #undef pr_fmt
 #define pr_fmt(fmt) "Arm LFA: " fmt
 
@@ -702,6 +707,139 @@ static int update_fw_images_tree(void)
 	return 0;
 }
 
+/*
+ * Go through all FW images in a loop and trigger activation
+ * of all activatible and pending images.
+ * We have to restart enumeration after every triggered activation,
+ * since the firmware images might have changed during the activation.
+ */
+static int activate_pending_image(void)
+{
+	struct kobject *kobj;
+	bool found_pending = false;
+	struct fw_image *image;
+	int ret;
+
+	spin_lock(&lfa_kset->list_lock);
+	list_for_each_entry(kobj, &lfa_kset->list, entry) {
+		image = kobj_to_fw_image(kobj);
+
+		if (image->fw_seq_id == -1)
+			continue; /* Invalid FW component */
+
+		update_fw_image_pending(image);
+		if (image->activation_capable && image->activation_pending) {
+			found_pending = true;
+			break;
+		}
+	}
+	spin_unlock(&lfa_kset->list_lock);
+
+	if (!found_pending)
+		return -ENOENT;
+
+	ret = prime_fw_image(image);
+	if (ret)
+		return ret;
+
+	ret = activate_fw_image(image);
+	if (ret)
+		return ret;
+
+	pr_info("%s: automatic activation succeeded\n", get_image_name(image));
+
+	return 0;
+}
+
+#ifdef CONFIG_ACPI
+static void lfa_acpi_notify_handler(acpi_handle handle, u32 event, void *data)
+{
+	int ret;
+
+	while (!(ret = activate_pending_image()))
+		;
+
+	if (ret != -ENOENT)
+		pr_warn("notified image activation failed: %d\n", ret);
+}
+
+static int lfa_register_acpi(struct device *dev)
+{
+	struct acpi_device *acpi_dev;
+	acpi_handle handle;
+	acpi_status status;
+
+	acpi_dev = acpi_dev_get_first_match_dev("ARML0003", NULL, -1);
+	if (!acpi_dev)
+		return -ENODEV;
+	handle = acpi_device_handle(acpi_dev);
+	if (!handle) {
+		acpi_dev_put(acpi_dev);
+		return -ENODEV;
+	}
+
+	/* Register notify handler that indicates LFA updates are available */
+	status = acpi_install_notify_handler(handle, ACPI_DEVICE_NOTIFY,
+					     lfa_acpi_notify_handler, NULL);
+	if (ACPI_FAILURE(status)) {
+		acpi_dev_put(acpi_dev);
+		return -EIO;
+	}
+
+	ACPI_COMPANION_SET(dev, acpi_dev);
+
+	return 0;
+}
+
+static void lfa_remove_acpi(struct device *dev)
+{
+	struct acpi_device *acpi_dev = ACPI_COMPANION(dev);
+	acpi_handle handle = acpi_device_handle(acpi_dev);
+
+	if (handle)
+		acpi_remove_notify_handler(handle,
+					   ACPI_DEVICE_NOTIFY,
+					   lfa_acpi_notify_handler);
+	acpi_dev_put(acpi_dev);
+}
+#else	/* !CONFIG_ACPI */
+static int lfa_register_acpi(struct device *dev)
+{
+	return -ENODEV;
+}
+
+static void lfa_remove_acpi(struct device *dev)
+{
+}
+#endif
+
+static int lfa_faux_probe(struct faux_device *fdev)
+{
+	int ret;
+
+	if (!acpi_disabled) {
+		ret = lfa_register_acpi(&fdev->dev);
+		if (ret != -ENODEV) {
+			if (!ret)
+				pr_info("registered LFA ACPI notification\n");
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static void lfa_faux_remove(struct faux_device *fdev)
+{
+	lfa_remove_acpi(&fdev->dev);
+}
+
+static struct faux_device *lfa_dev;
+static struct faux_device_ops lfa_device_ops = {
+	.probe = lfa_faux_probe,
+	.remove = lfa_faux_remove,
+};
+
 static int __init lfa_init(void)
 {
 	struct arm_smccc_1_2_regs reg = { 0 };
@@ -731,6 +869,14 @@ static int __init lfa_init(void)
 	if (!lfa_kset)
 		return -ENOMEM;
 
+	/*
+	 * This faux device is just used for the optional notification
+	 * mechanism, to register the ACPI notification or interrupt.
+	 * If the firmware tables do not contain this information, the
+	 * driver will still work.
+	 */
+	lfa_dev = faux_device_create("arm-lfa", NULL, &lfa_device_ops);
+
 	err = update_fw_images_tree();
 	if (err != 0) {
 		kset_unregister(lfa_kset);
@@ -747,6 +893,7 @@ static void __exit lfa_exit(void)
 	destroy_workqueue(fw_images_update_wq);
 	clean_fw_images_tree();
 	kset_unregister(lfa_kset);
+	faux_device_destroy(lfa_dev);
 }
 module_exit(lfa_exit);
 
-- 
2.43.0


