Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A383C79F83
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 09:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z9n+eNgtC33tgUqsKq2i0GSZBuy9IMo2Y3m611XMpLY=; b=WbLOOoTVwgzA3tYXdPL6df8g9I
	ov83MOnVzMw6T0TNcvPFMpvxlA5pbAf0lzcdvZjZlgPBHajq6QlhJZUxV45/b7M5w6tQUXr3p/GkT
	VNuVkfafOsXO8ZAZlHwd/nV5P7qMpMX2L+tQmWYs2iAxYro8Rt2tuVp7Zy4rSJS1VJQ079XgRC7KX
	LDQUgTt1DPo0k3Q1pe2fxSXS6x14isCUdaetUanbVNGVtO/bqs/Ru+BTUE2TKSQGJLD/aG/4ZdmWi
	qp/e3/gPS54HGsoZQ2GAvaJ4ljL9yu8wUKtF1JtKJf3Z8xPD4+X/ht2e4Yk7F7gTMZOSLJW3XfsJy
	Pu7CxFwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2QZ5-00000001ZwT-3N6c;
	Fri, 04 Sep 2026 09:50:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2QZ3-00000001Zvd-1u9y
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 09:50:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 03D6B43F75;
	Fri,  4 Sep 2026 09:50:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C8B21F00ACA;
	Fri,  4 Sep 2026 09:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788515428;
	bh=Z9n+eNgtC33tgUqsKq2i0GSZBuy9IMo2Y3m611XMpLY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=JkML5p/8QuVVVF4nG6sQEGDWs/9HZcEucXVEfIn+sBSXOLaN3uZQ7CvWX2S50BbYD
	 avhcDHYTDKc8aKNdUmkAYcwqbIMDbtMPJ1AExAMtHeInWqF1gsV9422n60XbKTn+8Q
	 DIQu8XIQWATfjhKT9kiJBO9iTNdfvYAK8IFEj3Hj4lPbzEYXwxLv9//9B/Ua/2Nmj6
	 qgURT1oJA0k0svG/ECfzwawO56Ox5CBljLMIuxLQx5ajE+ng8Lyc/0R5mhHcJGOeCm
	 6OthFTLwJnBwopXKkFMmVCRVlzVD97Myex76hrPul8shYgSxb6Pjp4UxqQ5iZa4KIQ
	 FA2J9F/8G8eCA==
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
	Andre Przywara <andre.przywara@arm.com>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: [PATCH v10 2/7] firmware: hwrng: arm_smccc_trng: Register as an SMCCC device
Date: Fri,  4 Sep 2026 15:19:55 +0530
Message-ID: <20260904095000.1184861-3-aneesh.kumar@kernel.org>
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

The SMCCC TRNG interface is a firmware-provided SMCCC service rather than a
standalone platform device. Now that the SMCCC core has an SMCCC bus,
create an arm-smccc-trng device for the discovered TRNG service and convert
the hwrng driver to an SMCCC driver.

The SMCCC id table preserves module autoloading for systems where the TRNG
driver is built as a module.

The sysfs device path changes from the old smccc_trng platform-device path
to an arm-smccc device path. No known userspace dependency on the old path
was found; a Debian Code Search lookup for the existing platform-device
name/path did not find any users.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Tested-by: Andre Przywara <andre.przywara@arm.com>
Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 arch/arm/include/asm/archrandom.h       |  2 +-
 arch/arm64/include/asm/archrandom.h     |  2 +-
 drivers/char/hw_random/arm_smccc_trng.c | 32 ++++++++-----
 drivers/firmware/smccc/smccc.c          | 61 +++++++++++++++++++++----
 4 files changed, 75 insertions(+), 22 deletions(-)

diff --git a/arch/arm/include/asm/archrandom.h b/arch/arm/include/asm/archrandom.h
index cc4714eb1a75..ee39a03ddf8a 100644
--- a/arch/arm/include/asm/archrandom.h
+++ b/arch/arm/include/asm/archrandom.h
@@ -2,7 +2,7 @@
 #ifndef _ASM_ARCHRANDOM_H
 #define _ASM_ARCHRANDOM_H
 
-static inline bool __init smccc_probe_trng(void)
+static inline bool smccc_probe_trng(void)
 {
 	return false;
 }
diff --git a/arch/arm64/include/asm/archrandom.h b/arch/arm64/include/asm/archrandom.h
index 8babfbe31f95..7605dd81bd1e 100644
--- a/arch/arm64/include/asm/archrandom.h
+++ b/arch/arm64/include/asm/archrandom.h
@@ -12,7 +12,7 @@
 
 extern bool smccc_trng_available;
 
-static inline bool __init smccc_probe_trng(void)
+static inline bool smccc_probe_trng(void)
 {
 	struct arm_smccc_res res;
 
diff --git a/drivers/char/hw_random/arm_smccc_trng.c b/drivers/char/hw_random/arm_smccc_trng.c
index dcb8e7f37f25..01c1a30cbab8 100644
--- a/drivers/char/hw_random/arm_smccc_trng.c
+++ b/drivers/char/hw_random/arm_smccc_trng.c
@@ -16,8 +16,10 @@
 #include <linux/device.h>
 #include <linux/hw_random.h>
 #include <linux/module.h>
-#include <linux/platform_device.h>
 #include <linux/arm-smccc.h>
+#include <linux/arm-smccc-bus.h>
+
+#include <asm/archrandom.h>
 
 #ifdef CONFIG_ARM64
 #define ARM_SMCCC_TRNG_RND	ARM_SMCCC_TRNG_RND64
@@ -94,29 +96,37 @@ static int smccc_trng_read(struct hwrng *rng, void *data, size_t max, bool wait)
 	return copied;
 }
 
-static int smccc_trng_probe(struct platform_device *pdev)
+static int smccc_trng_probe(struct arm_smccc_device *sdev)
 {
 	struct hwrng *trng;
 
-	trng = devm_kzalloc(&pdev->dev, sizeof(*trng), GFP_KERNEL);
+	/* validate the minimum version requirement */
+	if (!smccc_probe_trng())
+		return -ENODEV;
+
+	trng = devm_kzalloc(&sdev->dev, sizeof(*trng), GFP_KERNEL);
 	if (!trng)
 		return -ENOMEM;
 
 	trng->name = "smccc_trng";
 	trng->read = smccc_trng_read;
 
-	return devm_hwrng_register(&pdev->dev, trng);
+	return devm_hwrng_register(&sdev->dev, trng);
 }
 
-static struct platform_driver smccc_trng_driver = {
-	.driver = {
-		.name		= "smccc_trng",
-	},
-	.probe		= smccc_trng_probe,
+static const struct arm_smccc_device_id smccc_trng_id_table[] = {
+	{ .func_id = ARM_SMCCC_TRNG_VERSION },
+	{}
+};
+MODULE_DEVICE_TABLE(arm_smccc, smccc_trng_id_table);
+
+static struct arm_smccc_driver smccc_trng_driver = {
+	.name	  = KBUILD_MODNAME,
+	.probe	  = smccc_trng_probe,
+	.id_table = smccc_trng_id_table,
 };
-module_platform_driver(smccc_trng_driver);
+module_arm_smccc_driver(smccc_trng_driver);
 
-MODULE_ALIAS("platform:smccc_trng");
 MODULE_AUTHOR("Andre Przywara");
 MODULE_DESCRIPTION("Arm SMCCC TRNG firmware interface support");
 MODULE_LICENSE("GPL");
diff --git a/drivers/firmware/smccc/smccc.c b/drivers/firmware/smccc/smccc.c
index bdee057db2fd..5ea3478be9d3 100644
--- a/drivers/firmware/smccc/smccc.c
+++ b/drivers/firmware/smccc/smccc.c
@@ -9,7 +9,8 @@
 #include <linux/init.h>
 #include <linux/arm-smccc.h>
 #include <linux/kernel.h>
-#include <linux/platform_device.h>
+#include <linux/arm-smccc-bus.h>
+
 #include <asm/archrandom.h>
 
 static u32 smccc_version = ARM_SMCCC_VERSION_1_0;
@@ -81,16 +82,58 @@ bool arm_smccc_hypervisor_has_uuid(const uuid_t *hyp_uuid)
 }
 EXPORT_SYMBOL_GPL(arm_smccc_hypervisor_has_uuid);
 
+struct smccc_device_info {
+	u32 func_id;
+	bool requires_smc;
+	const char *device_name;
+};
+
+static const struct smccc_device_info smccc_devices[] __initconst = {
+	{
+		.func_id        = ARM_SMCCC_TRNG_VERSION,
+		.requires_smc   = false,
+		.device_name    = "arm-smccc-trng",
+	},
+};
+
+static bool __init smccc_probe_smccc_device(const struct smccc_device_info *smccc_dev)
+{
+	int ret;
+	struct arm_smccc_res res = {};
+
+	if (smccc_conduit == SMCCC_CONDUIT_NONE)
+		return false;
+
+	if (smccc_dev->requires_smc && smccc_conduit != SMCCC_CONDUIT_SMC)
+		return false;
+
+	if (IS_ENABLED(CONFIG_ARM) && ARM_SMCCC_IS_64(smccc_dev->func_id))
+		return false;
+
+	arm_smccc_1_1_invoke(smccc_dev->func_id, &res);
+	ret = res.a0;
+
+	if (ret == SMCCC_RET_NOT_SUPPORTED)
+		return false;
+
+	return true;
+}
+
 static int __init smccc_devices_init(void)
 {
-	struct platform_device *pdev;
-
-	if (smccc_trng_available) {
-		pdev = platform_device_register_simple("smccc_trng", -1,
-						       NULL, 0);
-		if (IS_ERR(pdev))
-			pr_err("smccc_trng: could not register device: %ld\n",
-			       PTR_ERR(pdev));
+	struct arm_smccc_device *sdev;
+	const struct smccc_device_info *smccc_dev;
+
+	for (int i = 0; i < ARRAY_SIZE(smccc_devices); i++) {
+		smccc_dev = &smccc_devices[i];
+
+		if (!smccc_probe_smccc_device(smccc_dev))
+			continue;
+
+		sdev = arm_smccc_device_register(smccc_dev->device_name, smccc_dev->func_id);
+		if (IS_ERR(sdev))
+			pr_err("%s: could not register device: %ld\n",
+			       smccc_dev->device_name, PTR_ERR(sdev));
 	}
 
 	return 0;
-- 
2.43.0


