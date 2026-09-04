Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20F33C624DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 09:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j91SZM4aDJbM7C+/1XdkYfA2OhaMRcOpXiX/V1LncyI=; b=kyVF7HQ+rB2IfrXZ12YDJOR7I/
	yokEqrckIEzeb/fSTWu5/uukBzX5P5Q51VySZFN9YrjJpcu/a+jgKGzVDdtxLExLaTyk8S1iHpaGd
	NepA5avCJ5PywWoljiQPAF42FcPNm7Laq+ycAGtK1Dis4ocOwKq3KJDWZuPeeYKDSvfHDT6TDeVZ8
	x33zDHeuB2VILQRx4D40sat/m1xfX5m2jyqE0KPAXrWi/7oLU0hjDCPl6FpYs7Mf9ejUO7RwQYfNf
	A6XYcMZo59HRqe6DaUSK92BJ8RUCrYJgpgm11XBidiJl7BRkty4av7pjuVLtN/1S3Wzw85Qvr4sZF
	LG2r7/uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2QZS-00000001aB8-1dDg;
	Fri, 04 Sep 2026 09:50:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2QZQ-00000001a9q-3uIn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 09:50:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 63C5260211;
	Fri,  4 Sep 2026 09:50:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 230AD1F00AC4;
	Fri,  4 Sep 2026 09:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788515452;
	bh=j91SZM4aDJbM7C+/1XdkYfA2OhaMRcOpXiX/V1LncyI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=nMw6/jHXRLZ300Uy05j+VFnsZEPFTUbUIymI3B/rcbFteIidW8+wDeKMilXWp71Fl
	 9PfpMC2422mnjU9O0eG1DUmfwlWAw/05X8XZAKRlp9kCfrAn+GSEHSVUJxJaphuXZ+
	 CcPyiziVmHtNj0As95pf6tZRjQVwSHMh/4Is+NXinP+bKq2/dLqfmrWBXi2GNTUIrr
	 68OhYvYSjZKzuwzGnq0yKZm4x2Ze9pItM1v8U2wJWaWi84DRF66lLWq+oCQceS7lHy
	 3CP7DbaYkbjoFGZv7KBNVogxO1+8T28avD0bmhy4Aus/OgmlUca8HrI9V5O+SpLYDe
	 pWT3lwglXQIuA==
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
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH v10 6/7] firmware: smccc: arm-cca-guest: Bind the TSM provider to an SMCCC device
Date: Fri,  4 Sep 2026 15:19:59 +0530
Message-ID: <20260904095000.1184861-7-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260904095000.1184861-1-aneesh.kumar@kernel.org>
References: <20260904095000.1184861-1-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The Arm CCA guest TSM provider currently binds through the arm-cca-dev
platform device. Like arm-smccc-trng, this device is not an independent
platform resource; it is a software representation of the RSI firmware
service discovered through SMCCC.

Move RSI discovery into the SMCCC firmware driver. When the SMCCC conduit
is SMC and if RSI ABI version call is supported, create an arm-rsi-dev
SMCCC device. Convert the Arm CCA guest TSM provider to an SMCCC driver so
it binds to that discovered RSI service and keeps module autoloading
through the SMCCC device id table.

Keep the old arm-cca-dev platform-device registration for now. Userspace
has used that device as a Realm-guest indicator, so removing it is left to
a follow-up patch that adds a replacement sysfs ABI.

Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 drivers/firmware/arm_rmm/rsi.c          |  2 +-
 drivers/firmware/smccc/smccc.c          |  6 ++++
 drivers/virt/coco/arm-cca-guest/Kconfig |  1 +
 drivers/virt/coco/arm-cca-guest/main.c  | 44 +++++++++++--------------
 include/linux/arm-rsi-cmds.h            |  1 -
 5 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/drivers/firmware/arm_rmm/rsi.c b/drivers/firmware/arm_rmm/rsi.c
index ada139d0e344..2dd69febedbd 100644
--- a/drivers/firmware/arm_rmm/rsi.c
+++ b/drivers/firmware/arm_rmm/rsi.c
@@ -183,7 +183,7 @@ void __init arm64_rsi_init(void)
 }
 
 static struct platform_device rsi_dev = {
-	.name = RSI_PDEV_NAME,
+	.name = "arm-cca-dev",
 	.id = PLATFORM_DEVID_NONE
 };
 
diff --git a/drivers/firmware/smccc/smccc.c b/drivers/firmware/smccc/smccc.c
index 5ea3478be9d3..854276a3cd57 100644
--- a/drivers/firmware/smccc/smccc.c
+++ b/drivers/firmware/smccc/smccc.c
@@ -10,6 +10,7 @@
 #include <linux/arm-smccc.h>
 #include <linux/kernel.h>
 #include <linux/arm-smccc-bus.h>
+#include <linux/arm-smccc-rsi.h>
 
 #include <asm/archrandom.h>
 
@@ -94,6 +95,11 @@ static const struct smccc_device_info smccc_devices[] __initconst = {
 		.requires_smc   = false,
 		.device_name    = "arm-smccc-trng",
 	},
+	{
+		.func_id        = SMC_RSI_ABI_VERSION,
+		.requires_smc   = true,
+		.device_name    = "arm-rsi",
+	},
 };
 
 static bool __init smccc_probe_smccc_device(const struct smccc_device_info *smccc_dev)
diff --git a/drivers/virt/coco/arm-cca-guest/Kconfig b/drivers/virt/coco/arm-cca-guest/Kconfig
index 2582ebb36922..0d4ce72e2d86 100644
--- a/drivers/virt/coco/arm-cca-guest/Kconfig
+++ b/drivers/virt/coco/arm-cca-guest/Kconfig
@@ -1,6 +1,7 @@
 config ARM_CCA_GUEST
 	tristate "Arm CCA Guest driver"
 	depends on ARM_RMM_RSI
+	depends on HAVE_ARM_SMCCC_DISCOVERY
 	select TSM_REPORTS
 	help
 	  The driver provides userspace interface to request and
diff --git a/drivers/virt/coco/arm-cca-guest/main.c b/drivers/virt/coco/arm-cca-guest/main.c
index 80659f0885e9..7b1fa008a8f4 100644
--- a/drivers/virt/coco/arm-cca-guest/main.c
+++ b/drivers/virt/coco/arm-cca-guest/main.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/arm-rsi-cmds.h>
+#include <linux/arm-smccc-bus.h>
 #include <linux/arm-smccc-rsi.h>
 #include <linux/cc_platform.h>
 #include <linux/kernel.h>
@@ -161,16 +162,7 @@ static const struct tsm_report_ops arm_cca_tsm_report_ops = {
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
+static int cca_tsm_probe(struct arm_smccc_device *sdev)
 {
 	int ret;
 
@@ -178,30 +170,32 @@ static int __init arm_cca_guest_init(void)
 		return -ENODEV;
 
 	ret = tsm_report_register(&arm_cca_tsm_report_ops, NULL);
-	if (ret < 0)
-		pr_err("Error %d registering with TSM\n", ret);
+	if (ret < 0) {
+		dev_err_probe(&sdev->dev, ret, "Error registering with TSM\n");
+		return ret;
+	}
 
-	return ret;
+	return 0;
 }
-module_init(arm_cca_guest_init);
 
-/**
- * arm_cca_guest_exit - unregister with the Trusted Security Module (TSM)
- * interface.
- */
-static void __exit arm_cca_guest_exit(void)
+static void cca_tsm_remove(struct arm_smccc_device *sdev)
 {
 	tsm_report_unregister(&arm_cca_tsm_report_ops);
 }
-module_exit(arm_cca_guest_exit);
 
-/* modalias, so userspace can autoload this module when RSI is available */
-static const struct platform_device_id arm_cca_match[] __maybe_unused = {
-	{ .name = RSI_PDEV_NAME },
-	{ }
+static const struct arm_smccc_device_id cca_tsm_id_table[] = {
+	{ .func_id = SMC_RSI_ABI_VERSION },
+	{}
 };
+MODULE_DEVICE_TABLE(arm_smccc, cca_tsm_id_table);
 
-MODULE_DEVICE_TABLE(platform, arm_cca_match);
+static struct arm_smccc_driver cca_tsm_driver = {
+	.name = KBUILD_MODNAME,
+	.probe = cca_tsm_probe,
+	.remove = cca_tsm_remove,
+	.id_table = cca_tsm_id_table,
+};
+module_arm_smccc_driver(cca_tsm_driver);
 MODULE_AUTHOR("Sami Mujawar <sami.mujawar@arm.com>");
 MODULE_DESCRIPTION("Arm CCA Guest TSM Driver");
 MODULE_LICENSE("GPL");
diff --git a/include/linux/arm-rsi-cmds.h b/include/linux/arm-rsi-cmds.h
index 9e8a8c189ca1..3f7a6a833993 100644
--- a/include/linux/arm-rsi-cmds.h
+++ b/include/linux/arm-rsi-cmds.h
@@ -11,7 +11,6 @@
 #include <linux/string.h>
 #include <asm/memory.h>
 
-#define RSI_PDEV_NAME "arm-cca-dev"
 #ifdef CONFIG_ARM_RMM_RSI
 DECLARE_STATIC_KEY_FALSE(rsi_present);
 
-- 
2.43.0


