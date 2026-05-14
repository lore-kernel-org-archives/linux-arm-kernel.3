Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E769ECD4851
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 09:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4SktOkNP/xDqCnPvViOltvRGAOFGL3Bakh0uQvPmHjQ=; b=CgePM2gdtjpJJ7vKqYWyp/ljZS
	TJFMrjJ4gsuwtoa0T+Q+bXCSsxndk36Q4syhjrG5Tpf5wajiBEg2H9pL63S0BxqdYQ9lvXoD6RESf
	mM8t8RsO1o3DyqDrJrUvQf71ahxeJ7OeHCCgdIp/1H0xWTZ+nxvLtf9/ee1pNJBOduiY67znGxsP4
	AB9A0YPpb8yhLM7AMmw51AUsjN+uYQcQfW8/tKhce/NkePNMNrFGSRbwYBVbqP47wYmxgvHIs/aUW
	2jC4eAQqe9t2/N3WtqRK8Cc/cV2Jlnzm2qqK1xm/ZiLE1+MG4+uxnDpdAAonSBZw4mSSkScVQq29K
	E7sDEhIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNSYq-000000055fY-3uZm;
	Thu, 14 May 2026 09:40:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNSYp-000000055fD-2WJs
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 14 May 2026 09:40:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=4SktOkNP/xDqCnPvViOltvRGAOFGL3Bakh0uQvPmHjQ=; b=RabK/hbnhHU8L1ybn4rn84i6x5
	ctbaFqlwKFunPIiDtUxa2pNC6lujkL3vDuZ3XNFF2CF66x1Pk3ck0gNqvSd7gBYFzNTOErfmcQ2gb
	hpX7mPki+37FEumLWxqOtiqD5ZtZdRiDcwULClBF+NDizRLaG8F3hgRAv2E5tPluK/w+UMxEQXWeU
	4TybtuOlhvK4nKTz2sE4nrUZEAeIPuTZ9X7TtvXs36RQWRhN/belLvJhmOE06QsSp08+AVA/h187R
	4tzgYgQNkp/EjOnlEoEE8DPh9VSfTG7KUaSYf4ig//ZgysyBSavh1BeM8jE5fQNQD+ksu7v9S/qQe
	E/TgHTyw==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNSYl-00000002Zb8-44Ib
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 09:40:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 671624388D;
	Thu, 14 May 2026 09:40:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67C22C2BCB3;
	Thu, 14 May 2026 09:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778751650;
	bh=oAbmsYmyQL4uWzHLbBhhUhVHXHB9PBmOF69eGHy61Vo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qwNsaUUp/cF/OG4Q79wj57Io9A9M6SUwpdOs7EC4f0dMR69c0JAISw+KdIU+SBQGl
	 5FbRZbXRmJqsQKRun6BOKZLtiMxx3/rfTf4JihSu5xmiqNXBuUoF/WOP1WqfvpVm41
	 qhJB8sNtghDdQI2H9SGrZJebVbagIU9gqtkP1ym4xJ1ukzT9XRpzycp+yv2D9eABA3
	 kzKJT+XnNjlKonyjh/NbYINqssgKbnNElUOGjdDaxMdxNk9aY4z/+D77NPS5r0rAyw
	 BZs3WYkzjcUkORl3c79GJzgMt+Y9Z0CwBA/ZCyYcl2oPzTUaQNnA/8SnMDC5Gx4mxx
	 fS0cZ1THkPwMQ==
From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
To: linux-coco@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>
Subject: [PATCH v5 1/3] firmware: smccc: coco: Manage arm-smccc platform device and CCA auxiliary drivers
Date: Thu, 14 May 2026 15:10:28 +0530
Message-ID: <20260514094030.42495-2-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260514094030.42495-1-aneesh.kumar@kernel.org>
References: <20260514094030.42495-1-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_104052_735390_CD9DC022 
X-CRM114-Status: GOOD (  29.76  )
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

Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 arch/arm64/include/asm/rsi.h                  |  2 +-
 arch/arm64/kernel/rsi.c                       |  2 +-
 drivers/firmware/smccc/Kconfig                |  1 +
 drivers/firmware/smccc/Makefile               |  1 +
 drivers/firmware/smccc/rmm.c                  | 24 ++++++++
 drivers/firmware/smccc/rmm.h                  | 17 ++++++
 drivers/firmware/smccc/smccc.c                | 17 ++++++
 drivers/virt/coco/arm-cca-guest/Kconfig       |  1 +
 drivers/virt/coco/arm-cca-guest/Makefile      |  2 +
 .../{arm-cca-guest.c => arm-cca.c}            | 59 +++++++++----------
 10 files changed, 94 insertions(+), 32 deletions(-)
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
index 9e846ce4ef9c..8380e5ba88d2 100644
--- a/arch/arm64/kernel/rsi.c
+++ b/arch/arm64/kernel/rsi.c
@@ -161,7 +161,7 @@ void __init arm64_rsi_init(void)
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
index 000000000000..728338cb5a22
--- /dev/null
+++ b/drivers/firmware/smccc/rmm.c
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 Arm Limited
+ */
+
+#include <linux/auxiliary_bus.h>
+
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
index bdee057db2fd..eb077b9aa6da 100644
--- a/drivers/firmware/smccc/smccc.c
+++ b/drivers/firmware/smccc/smccc.c
@@ -12,6 +12,8 @@
 #include <linux/platform_device.h>
 #include <asm/archrandom.h>
 
+#include "rmm.h"
+
 static u32 smccc_version = ARM_SMCCC_VERSION_1_0;
 static enum arm_smccc_conduit smccc_conduit = SMCCC_CONDUIT_NONE;
 
@@ -85,6 +87,21 @@ static int __init smccc_devices_init(void)
 {
 	struct platform_device *pdev;
 
+	if (smccc_conduit == SMCCC_CONDUIT_NONE)
+		return 0;
+
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
index 0c9ea24a200c..7daada072cc0 100644
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
+		const struct auxiliary_device_id *id)
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


