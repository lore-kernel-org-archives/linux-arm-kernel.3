Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 906CCC982DA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 14:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TTuPpDvpmOeEbZ/SmFYH4VtDDf7zUjAXMw+KmVeaJhk=; b=HEYHPqlrBcI86p
	wTFjZaBUF3qEwujm6zYYel4NJ5t+j7b+eadIlh0rW5DYD+s2stt6yBHuvSpW9/RfyNfvEXZOmiE62
	qejKBz+E0ukPHKhKW/OlelyNCXVq3C/6XG1xp3k5LrYVO8FPb9DIyivOgg/7asPqfYoV5ATKv9pR0
	+tPmbMMxy7ylbCTv2bowpM64gjiKLnw6Fn5z+3Ec2cuT+gen8eYZHw0ZscA0u3I/Aax7LS+M2Jkqv
	fUF7UMCb553hxu7ALfPVI/rBBGveP9RC5CZY2qL9+KXRGIshL1Ph6H4WMn3A9EO/wWPxohefAAVFt
	3p7McS/64Rt9rGBsUIcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ZJV-0000000EfnM-1ojm;
	Fri, 18 Sep 2026 14:11:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ZJR-0000000EflC-23oZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 14:11:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B52B21E4D;
	Fri, 18 Sep 2026 07:11:32 -0700 (PDT)
Received: from e142021.Arm.com (e142021.arm.com [10.41.4.144])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9CF073F86C;
	Fri, 18 Sep 2026 07:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789740696; bh=tqqHViVw4RtjptjFs9M84wpARYpMZc1L7EOtLQIh1oo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YLmw7Nwo80b6aduB5DEetF7b3bjN96QlcDU+DDuMilue4/P/UWwGZXj7+cgSSgiAB
	 +vK7xolsHS6S7ansbLxSMUguVmiqgOUriItR/PIsEwp+bDA3WgfzAwxaVecpy0E+4g
	 TvPPj6M+GMyQnrRryW9okdFmZzx4Ty5aBbfSZoGE=
From: Andre Przywara <andre.przywara@arm.com>
To: Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: [PATCH v4 4/8] firmware: smccc: lfa: Register ACPI notification
Date: Fri, 18 Sep 2026 16:11:07 +0200
Message-ID: <20260918141112.2115555-5-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918141112.2115555-1-andre.przywara@arm.com>
References: <20260918141112.2115555-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_071137_639931_C03AD631 
X-CRM114-Status: GOOD (  20.90  )
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
Cc: Conor Dooley <conor+dt@kernel.org>, vsethi@nvidia.com, Salman Nabi <salman.nabi@arm.com>, Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org, Varun Wadekar <vwadekar@nvidia.com>, Trilok Soni <trilokkumar.soni@oss.qualcomm.com>, devicetree@vger.kernel.org, Nirmoy Das <nirmoyd@nvidia.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
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
[Andre: convert from platform driver to smccc bus]
Signed-off-by: Andre Przywara <andre.przywar@arm.com>
---
 drivers/firmware/smccc/lfa_fw.c | 122 +++++++++++++++++++++++++++++++-
 1 file changed, 121 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/smccc/lfa_fw.c b/drivers/firmware/smccc/lfa_fw.c
index b6ce478d3fc01..bb89fffde6856 100644
--- a/drivers/firmware/smccc/lfa_fw.c
+++ b/drivers/firmware/smccc/lfa_fw.c
@@ -3,12 +3,14 @@
  * Copyright (C) 2025 Arm Limited
  */
 
+#include <linux/acpi.h>
 #include <linux/arm-smccc.h>
 #include <linux/arm-smccc-bus.h>
 #include <linux/array_size.h>
 #include <linux/delay.h>
 #include <linux/fs.h>
 #include <linux/init.h>
+#include <linux/kernel.h>
 #include <linux/kobject.h>
 #include <linux/ktime.h>
 #include <linux/list.h>
@@ -18,11 +20,13 @@
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
 
@@ -733,6 +737,112 @@ static int update_fw_images_tree(void)
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
 static int lfa_smccc_probe(struct arm_smccc_device *sdev)
 {
 	struct arm_smccc_1_2_regs reg = { 0 };
@@ -769,11 +879,21 @@ static int lfa_smccc_probe(struct arm_smccc_device *sdev)
 		destroy_workqueue(fw_images_update_wq);
 	}
 
-	return err;
+	if (!acpi_disabled) {
+		err = lfa_register_acpi(&sdev->dev);
+		if (!err)
+			pr_info("registered LFA ACPI notification\n");
+		if (err != -ENODEV)
+			return err;
+	}
+
+	return 0;
 }
 
 static void lfa_smccc_remove(struct arm_smccc_device *sdev)
 {
+	if (!acpi_disabled)
+		lfa_remove_acpi(&sdev->dev);
 	clean_fw_images_tree();
 	flush_workqueue(fw_images_update_wq);
 	destroy_workqueue(fw_images_update_wq);
-- 
2.43.0


