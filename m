Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5409CCA472
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 13:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=M1XVEyoz0MeouRu+ZRgvng/HPZcRfKvZumD2u9GTDmI=; b=OgCzeNiOghmSeM7lqLD7CSXn1U
	bv0W55pKP7BJfsSg4flcbqoRXOtDJp5B8mv490x7rzyPvJGRdLyDvH4lf+3flkphETEvjiIkrGX7+
	i+M9LcF3b46YcfwWQQau1DmEhW4z1ddZQmqPMFgMc/QDJbuAS6kG6d4RCdHlOU5JxKoR9PCTIVIVI
	8T6UcFvGXSXX1jN0Sat5jIp9uUAqmumOLEPPTwv7cpQ32ZyTy3tXftVQ6TqRQKKUhHWcCqLnaZz+o
	ZCB+uFiQgKtAIz+mNubn/R6ILriPVxIehZv0XkmXuaAsuM07Wp07Pe8gKz8+Hxv0Tk/WuQzZDj2S6
	L5hh5O+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6UDW-00000003wBS-15Vu;
	Wed, 08 Oct 2025 13:28:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6UDT-00000003wAl-0myS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Oct 2025 13:28:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 34C3B43851;
	Wed,  8 Oct 2025 13:28:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAAE7C4CEF5;
	Wed,  8 Oct 2025 13:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759930106;
	bh=3pzYmZsg41AQcq91tl/+v0TTgt/Rx1I3erEHNiUptHw=;
	h=From:To:Cc:Subject:Date:From;
	b=ALqSMpbyhOP/U2/Oba7VywE4t3mM6yESXdsSrrpLY8YjKp6mKpbHvMLMh0VSTh4Gl
	 L5jEQ/fY28WB9CD+FLEjXXVBRWbikg56myQTW8uFGRbUluX6h/87QNoF/v1GsPCd5Y
	 dui0SpY/S+OZClkcOfz6BnXyZEX6HEy9Wx8lIfrWiQtQSPAR1BGeeaUmV/lvDweDcA
	 XVWQoHZCk0OLh1YuJUtCnOqWi3xl21AKNElSEqU9Vj/pLe7fY4P645Z3wzp/Fjbj5K
	 0yRIBe9yIuL2v8uqVYQBdOVaoOw08DcKGc/UQRJmHPMU/nRS6kN5nTMb5ZkkfRYC4E
	 zjQSUr5lLbaqQ==
From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
To: linux-coco@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Gavin Shan <gshan@redhat.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Sami Mujawar <sami.mujawar@arm.com>,
	"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Subject: [PATCH] coco: guest: arm64: Update ARM CCA guest driver
Date: Wed,  8 Oct 2025 18:57:58 +0530
Message-ID: <20251008132758.784275-1-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_062827_265137_B79B9796 
X-CRM114-Status: GOOD (  21.55  )
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

Make preparatory updates to the ARM CCA guest driver:

 - Switch from using a platform device to a faux device (based on
   feedback in [1])
 - Rename the device from `arm-cca-dev` to `arm-rsi-dev`, so that the
   host driver can register an equivalent `arm-rmi-dev`

These changes are purely structural and introduce no new functionality.
Subsequent patches will extend this driver to add guest device
assignment support.

[1] https://lore.kernel.org/all/2025073035-bulginess-rematch-b92e@gregkh

Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
NOTE:
This patch is sent early outside the patchseries to avoid userspace from
depending on the presence of the newly introduced platform device.
The platform device was added in v6.14-rc1. 

 arch/arm64/include/asm/rsi.h                  |  2 +-
 arch/arm64/kernel/rsi.c                       | 15 -----
 drivers/virt/coco/arm-cca-guest/Makefile      |  3 +
 .../{arm-cca-guest.c => arm-cca.c}            | 65 +++++++++++--------
 4 files changed, 41 insertions(+), 44 deletions(-)
 rename drivers/virt/coco/arm-cca-guest/{arm-cca-guest.c => arm-cca.c} (85%)

diff --git a/arch/arm64/include/asm/rsi.h b/arch/arm64/include/asm/rsi.h
index b42aeac05340..26ef6143562b 100644
--- a/arch/arm64/include/asm/rsi.h
+++ b/arch/arm64/include/asm/rsi.h
@@ -10,7 +10,7 @@
 #include <linux/jump_label.h>
 #include <asm/rsi_cmds.h>
 
-#define RSI_PDEV_NAME "arm-cca-dev"
+#define RSI_DEV_NAME "arm-rsi-dev"
 
 DECLARE_STATIC_KEY_FALSE(rsi_present);
 
diff --git a/arch/arm64/kernel/rsi.c b/arch/arm64/kernel/rsi.c
index ce4778141ec7..569ef08750e5 100644
--- a/arch/arm64/kernel/rsi.c
+++ b/arch/arm64/kernel/rsi.c
@@ -140,18 +140,3 @@ void __init arm64_rsi_init(void)
 
 	static_branch_enable(&rsi_present);
 }
-
-static struct platform_device rsi_dev = {
-	.name = RSI_PDEV_NAME,
-	.id = PLATFORM_DEVID_NONE
-};
-
-static int __init arm64_create_dummy_rsi_dev(void)
-{
-	if (is_realm_world() &&
-	    platform_device_register(&rsi_dev))
-		pr_err("failed to register rsi platform device\n");
-	return 0;
-}
-
-arch_initcall(arm64_create_dummy_rsi_dev)
diff --git a/drivers/virt/coco/arm-cca-guest/Makefile b/drivers/virt/coco/arm-cca-guest/Makefile
index 69eeba08e98a..609462ea9438 100644
--- a/drivers/virt/coco/arm-cca-guest/Makefile
+++ b/drivers/virt/coco/arm-cca-guest/Makefile
@@ -1,2 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
+#
 obj-$(CONFIG_ARM_CCA_GUEST) += arm-cca-guest.o
+
+arm-cca-guest-$(CONFIG_TSM) +=  arm-cca.o
diff --git a/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c b/drivers/virt/coco/arm-cca-guest/arm-cca.c
similarity index 85%
rename from drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
rename to drivers/virt/coco/arm-cca-guest/arm-cca.c
index 0c9ea24a200c..89d9e7f8eb5d 100644
--- a/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
+++ b/drivers/virt/coco/arm-cca-guest/arm-cca.c
@@ -1,8 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2023 ARM Ltd.
+ * Copyright (C) 2025 ARM Ltd.
  */
 
+#include <linux/device/faux.h>
 #include <linux/arm-smccc.h>
 #include <linux/cc_platform.h>
 #include <linux/kernel.h>
@@ -181,52 +182,60 @@ static int arm_cca_report_new(struct tsm_report *report, void *data)
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
+static int cca_tsm_probe(struct faux_device *fdev)
 {
 	int ret;
 
 	if (!is_realm_world())
 		return -ENODEV;
 
-	ret = tsm_report_register(&arm_cca_tsm_ops, NULL);
-	if (ret < 0)
+	ret = tsm_report_register(&arm_cca_tsm_report_ops, NULL);
+	if (ret < 0) {
 		pr_err("Error %d registering with TSM\n", ret);
+		return ret;
+	}
+
+	ret = devm_add_action_or_reset(&fdev->dev, unregister_cca_tsm_report, NULL);
+	if (ret < 0) {
+		pr_err("Error %d registering devm action\n", ret);
+		unregister_cca_tsm_report(NULL);
+		return ret;
+	}
 
 	return ret;
 }
-module_init(arm_cca_guest_init);
 
-/**
- * arm_cca_guest_exit - unregister with the Trusted Security Module (TSM)
- * interface.
- */
-static void __exit arm_cca_guest_exit(void)
+static struct faux_device *cca_tsm;
+
+static const struct faux_device_ops cca_device_ops = {
+	.probe = cca_tsm_probe,
+};
+
+static int __init cca_tsm_init(void)
 {
-	tsm_report_unregister(&arm_cca_tsm_ops);
+	cca_tsm = faux_device_create(RSI_DEV_NAME, NULL, &cca_device_ops);
+	if (!cca_tsm)
+		return -ENOMEM;
+	return 0;
 }
-module_exit(arm_cca_guest_exit);
+module_init(cca_tsm_init);
 
-/* modalias, so userspace can autoload this module when RSI is available */
-static const struct platform_device_id arm_cca_match[] __maybe_unused = {
-	{ RSI_PDEV_NAME, 0},
-	{ }
-};
+static void __exit cca_tsm_exit(void)
+{
+	faux_device_destroy(cca_tsm);
+}
+module_exit(cca_tsm_exit);
 
-MODULE_DEVICE_TABLE(platform, arm_cca_match);
 MODULE_AUTHOR("Sami Mujawar <sami.mujawar@arm.com>");
 MODULE_DESCRIPTION("Arm CCA Guest TSM Driver");
 MODULE_LICENSE("GPL");
-- 
2.43.0


