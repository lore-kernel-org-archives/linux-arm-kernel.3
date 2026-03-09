Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD94FEFCD77
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 10:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2pfXPN1VkZ9Q4y6kVfe2nYJl4mugl8/rJyi/HnlpDP4=; b=zKR+3bBwDbVVfhooN5r1KuEJYc
	HFvKatP6RrLZEIXKNke6vTecxEPMQCwtlL5LTn4poyeqdPSBCQEgupnVQ6rgX1nemQmB5Cf1AuADs
	i8AEr8HlRx94r6hFbmGMM6oOZ+Kzd+Q55YHHnf/VxQvLxXHFjyRFvoxSWNOFHp0PwapYCUf3vIg4K
	jK+ca+4I9qfnvbqQ0yeaH4WKo1YgsOgd5aisRSCsQrxl/+OSLcgsNmMAMdRHfEvNjlQdMNhjnK9k4
	6zfOP/zQZh/sok4DeEP7kczACmBznixYcVSuM0OUqiG7J8kMWbAmAARCTDiLRk7mEcwHdsM+PH//k
	PIrvXm6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzXUU-000000072uU-2ZP5;
	Mon, 09 Mar 2026 10:05:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzXUR-000000072tT-3zYt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 10:05:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1743040A06;
	Mon,  9 Mar 2026 10:05:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C743C4CEF7;
	Mon,  9 Mar 2026 10:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773050730;
	bh=xPSJd137iZ97gApesuSI4uBxCcoVkF/tDgKsfYZvNlo=;
	h=From:To:Cc:Subject:Date:From;
	b=Yd5vUmXQ+IbIBuDzn/PpfkZR3FqZkG5TtWNaO9TdGjAp582dyOy4+b8sJdRHJ05Gy
	 EGnHHT91NE6/+w0w7FTqWNjaqpqo4MjUrjh9hSmSUBpJF45EZQpWOhRebh2ERKgkkr
	 IVWUJtaR2DRa8HK1Y8EnKvglzElce0SdWqVoW/W0lpAhz7Gd/ArjBZ503jecShOx9U
	 LkllhGLqa/TOIlG+g58wOdoQqVz6fwfklBf707RfVvxeDLIrPMRhASLNTYejg52JWu
	 1JH3nU9v2umO1yQhTITKkoQ/tXXqnguxzsHHwbHf4vPxRzQehPHT1gXVL8uJzw2LGs
	 0YoH9aRk2YUjg==
From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: [PATCH v3 1/2] firmware: smccc: coco: Manage arm-smccc platform device and CCA auxiliary drivers
Date: Mon,  9 Mar 2026 15:35:06 +0530
Message-ID: <20260309100507.2303361-1-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_030532_049778_5DE74595 
X-CRM114-Status: GOOD (  30.11  )
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

Make the SMCCC driver responsible for registering the arm-smccc platform
device and after confirming the relevant SMCCC function IDs, create
the arm_cca_guest auxiliary device.

Also update the arm-cca-guest driver to use the auxiliary device
interface instead of the platform device (arm-cca-dev). The removal of
the platform device registration will follow in a subsequent patch,
allowing this change to be applied without immediately breaking existing
userspace dependencies [1].

[1] https://lore.kernel.org/all/4a7d84b2-2ec4-4773-a2d5-7b63d5c683cf@arm.com

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Jeremy Linton <jeremy.linton@arm.com>
Cc: Greg KH <gregkh@linuxfoundation.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 arch/arm64/include/asm/rsi.h                  |  2 +-
 arch/arm64/kernel/rsi.c                       |  2 +-
 drivers/firmware/smccc/Kconfig                |  1 +
 drivers/firmware/smccc/Makefile               |  1 +
 drivers/firmware/smccc/rmm.c                  | 25 ++++++++
 drivers/firmware/smccc/rmm.h                  | 17 ++++++
 drivers/firmware/smccc/smccc.c                | 14 +++++
 drivers/virt/coco/arm-cca-guest/Kconfig       |  1 +
 drivers/virt/coco/arm-cca-guest/Makefile      |  2 +
 .../{arm-cca-guest.c => arm-cca.c}            | 59 +++++++++----------
 10 files changed, 92 insertions(+), 32 deletions(-)
 create mode 100644 drivers/firmware/smccc/rmm.c
 create mode 100644 drivers/firmware/smccc/rmm.h
 rename drivers/virt/coco/arm-cca-guest/{arm-cca-guest.c => arm-cca.c} (84%)

diff --git a/arch/arm64/include/asm/rsi.h b/arch/arm64/include/asm/rsi.h
index 88b50d660e85..2d2d363aaaee 100644
--- a/arch/arm64/include/asm/rsi.h
+++ b/arch/arm64/include/asm/rsi.h
@@ -10,7 +10,7 @@
 #include <linux/jump_label.h>
 #include <asm/rsi_cmds.h>
 
-#define RSI_PDEV_NAME "arm-cca-dev"
+#define RSI_DEV_NAME "arm-rsi-dev"
 
 DECLARE_STATIC_KEY_FALSE(rsi_present);
 
diff --git a/arch/arm64/kernel/rsi.c b/arch/arm64/kernel/rsi.c
index c64a06f58c0b..5d711942e543 100644
--- a/arch/arm64/kernel/rsi.c
+++ b/arch/arm64/kernel/rsi.c
@@ -160,7 +160,7 @@ void __init arm64_rsi_init(void)
 }
 
 static struct platform_device rsi_dev = {
-	.name = RSI_PDEV_NAME,
+	.name = "arm-cca-dev",
 	.id = PLATFORM_DEVID_NONE
 };
 
diff --git a/drivers/firmware/smccc/Kconfig b/drivers/firmware/smccc/Kconfig
index 15e7466179a6..2b6984757241 100644
--- a/drivers/firmware/smccc/Kconfig
+++ b/drivers/firmware/smccc/Kconfig
@@ -8,6 +8,7 @@ config HAVE_ARM_SMCCC
 config HAVE_ARM_SMCCC_DISCOVERY
 	bool
 	depends on ARM_PSCI_FW
+	select AUXILIARY_BUS
 	default y
 	help
 	 SMCCC v1.0 lacked discoverability and hence PSCI v1.0 was updated
diff --git a/drivers/firmware/smccc/Makefile b/drivers/firmware/smccc/Makefile
index 40d19144a860..146dc3c03c20 100644
--- a/drivers/firmware/smccc/Makefile
+++ b/drivers/firmware/smccc/Makefile
@@ -2,3 +2,4 @@
 #
 obj-$(CONFIG_HAVE_ARM_SMCCC_DISCOVERY)	+= smccc.o kvm_guest.o
 obj-$(CONFIG_ARM_SMCCC_SOC_ID)	+= soc_id.o
+obj-$(CONFIG_ARM64) += rmm.o
diff --git a/drivers/firmware/smccc/rmm.c b/drivers/firmware/smccc/rmm.c
new file mode 100644
index 000000000000..03496330630f
--- /dev/null
+++ b/drivers/firmware/smccc/rmm.c
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 Arm Limited
+ */
+
+#define pr_fmt(fmt) "smccc: " fmt
+
+#include <linux/auxiliary_bus.h>
+#include "rmm.h"
+
+void __init register_rsi_device(struct platform_device *pdev)
+{
+	unsigned long ret;
+	unsigned long ver_lower, ver_higher;
+
+	if (arm_smccc_1_1_get_conduit() != SMCCC_CONDUIT_SMC)
+		return;
+
+	ret = rsi_request_version(RSI_ABI_VERSION, &ver_lower, &ver_higher);
+	if (ret != RSI_SUCCESS)
+		return;
+
+	__devm_auxiliary_device_create(&pdev->dev,
+				       "arm_cca_guest", RSI_DEV_NAME, NULL, 0);
+}
diff --git a/drivers/firmware/smccc/rmm.h b/drivers/firmware/smccc/rmm.h
new file mode 100644
index 000000000000..a47a650d4f51
--- /dev/null
+++ b/drivers/firmware/smccc/rmm.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _SMCCC_RMM_H
+#define _SMCCC_RMM_H
+
+#include <linux/platform_device.h>
+
+#ifdef CONFIG_ARM64
+#include <asm/rsi_cmds.h>
+void __init register_rsi_device(struct platform_device *pdev);
+#else
+
+static void __init register_rsi_device(struct platform_device *pdev)
+{
+
+}
+#endif
+#endif
diff --git a/drivers/firmware/smccc/smccc.c b/drivers/firmware/smccc/smccc.c
index bdee057db2fd..fc9b44b7c687 100644
--- a/drivers/firmware/smccc/smccc.c
+++ b/drivers/firmware/smccc/smccc.c
@@ -12,6 +12,8 @@
 #include <linux/platform_device.h>
 #include <asm/archrandom.h>
 
+#include "rmm.h"
+
 static u32 smccc_version = ARM_SMCCC_VERSION_1_0;
 static enum arm_smccc_conduit smccc_conduit = SMCCC_CONDUIT_NONE;
 
@@ -85,6 +87,18 @@ static int __init smccc_devices_init(void)
 {
 	struct platform_device *pdev;
 
+	pdev = platform_device_register_simple("arm-smccc",
+					PLATFORM_DEVID_NONE, NULL, 0);
+	if (IS_ERR(pdev)) {
+		pr_err("arm-smccc: could not register device: %ld\n", PTR_ERR(pdev));
+	} else {
+		/*
+		 * Register the RMI and RSI devices only when firmware exposes
+		 * the required SMCCC function IDs at a supported revision.
+		 */
+		register_rsi_device(pdev);
+	}
+
 	if (smccc_trng_available) {
 		pdev = platform_device_register_simple("smccc_trng", -1,
 						       NULL, 0);
diff --git a/drivers/virt/coco/arm-cca-guest/Kconfig b/drivers/virt/coco/arm-cca-guest/Kconfig
index 3f0f013f03f1..a42359a90558 100644
--- a/drivers/virt/coco/arm-cca-guest/Kconfig
+++ b/drivers/virt/coco/arm-cca-guest/Kconfig
@@ -2,6 +2,7 @@ config ARM_CCA_GUEST
 	tristate "Arm CCA Guest driver"
 	depends on ARM64
 	select TSM_REPORTS
+	select AUXILIARY_BUS
 	help
 	  The driver provides userspace interface to request and
 	  attestation report from the Realm Management Monitor(RMM).
diff --git a/drivers/virt/coco/arm-cca-guest/Makefile b/drivers/virt/coco/arm-cca-guest/Makefile
index 69eeba08e98a..75a120e24fda 100644
--- a/drivers/virt/coco/arm-cca-guest/Makefile
+++ b/drivers/virt/coco/arm-cca-guest/Makefile
@@ -1,2 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-$(CONFIG_ARM_CCA_GUEST) += arm-cca-guest.o
+
+arm-cca-guest-y +=  arm-cca.o
diff --git a/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c b/drivers/virt/coco/arm-cca-guest/arm-cca.c
similarity index 84%
rename from drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
rename to drivers/virt/coco/arm-cca-guest/arm-cca.c
index 0c9ea24a200c..3d5c0fe75500 100644
--- a/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
+++ b/drivers/virt/coco/arm-cca-guest/arm-cca.c
@@ -3,6 +3,7 @@
  * Copyright (C) 2023 ARM Ltd.
  */
 
+#include <linux/auxiliary_bus.h>
 #include <linux/arm-smccc.h>
 #include <linux/cc_platform.h>
 #include <linux/kernel.h>
@@ -181,52 +182,50 @@ static int arm_cca_report_new(struct tsm_report *report, void *data)
 	return ret;
 }
 
-static const struct tsm_report_ops arm_cca_tsm_ops = {
+static const struct tsm_report_ops arm_cca_tsm_report_ops = {
 	.name = KBUILD_MODNAME,
 	.report_new = arm_cca_report_new,
 };
 
-/**
- * arm_cca_guest_init - Register with the Trusted Security Module (TSM)
- * interface.
- *
- * Return:
- * * %0        - Registered successfully with the TSM interface.
- * * %-ENODEV  - The execution context is not an Arm Realm.
- * * %-EBUSY   - Already registered.
- */
-static int __init arm_cca_guest_init(void)
+static void unregister_cca_tsm_report(void *data)
+{
+	tsm_report_unregister(&arm_cca_tsm_report_ops);
+}
+
+static int cca_devsec_tsm_probe(struct auxiliary_device *adev,
+				const struct auxiliary_device_id *id)
 {
 	int ret;
 
 	if (!is_realm_world())
 		return -ENODEV;
 
-	ret = tsm_report_register(&arm_cca_tsm_ops, NULL);
-	if (ret < 0)
-		pr_err("Error %d registering with TSM\n", ret);
+	ret = tsm_report_register(&arm_cca_tsm_report_ops, NULL);
+	if (ret < 0) {
+		dev_err_probe(&adev->dev, ret, "Error registering with TSM\n");
+		return ret;
+	}
 
-	return ret;
-}
-module_init(arm_cca_guest_init);
+	ret = devm_add_action_or_reset(&adev->dev, unregister_cca_tsm_report, NULL);
+	if (ret < 0) {
+		dev_err_probe(&adev->dev, ret, "Error registering devm action\n");
+		return ret;
+	}
 
-/**
- * arm_cca_guest_exit - unregister with the Trusted Security Module (TSM)
- * interface.
- */
-static void __exit arm_cca_guest_exit(void)
-{
-	tsm_report_unregister(&arm_cca_tsm_ops);
+	return 0;
 }
-module_exit(arm_cca_guest_exit);
 
-/* modalias, so userspace can autoload this module when RSI is available */
-static const struct platform_device_id arm_cca_match[] __maybe_unused = {
-	{ RSI_PDEV_NAME, 0},
-	{ }
+static const struct auxiliary_device_id cca_devsec_tsm_id_table[] = {
+	{ .name =  KBUILD_MODNAME "." RSI_DEV_NAME },
+	{}
 };
+MODULE_DEVICE_TABLE(auxiliary, cca_devsec_tsm_id_table);
 
-MODULE_DEVICE_TABLE(platform, arm_cca_match);
+static struct auxiliary_driver cca_devsec_tsm_driver = {
+	.probe = cca_devsec_tsm_probe,
+	.id_table = cca_devsec_tsm_id_table,
+};
+module_auxiliary_driver(cca_devsec_tsm_driver);
 MODULE_AUTHOR("Sami Mujawar <sami.mujawar@arm.com>");
 MODULE_DESCRIPTION("Arm CCA Guest TSM Driver");
 MODULE_LICENSE("GPL");
-- 
2.43.0


