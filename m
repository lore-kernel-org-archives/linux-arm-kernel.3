Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B128CD5BC9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 10:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wylaKNd2CHrEQW+XLvJau+CZQ81dCr5zLWwwhdvlBFA=; b=aODPe9iy9QL30sg1c9dtxRD4uN
	f8OpP33rGpGBQyv5HiY6trp5CWPtM2WX7WIx4G0NjT/2QdTl50QebXWNAk7a9M3LFdEx6RPnQ6Nuo
	vy3zWFJgeOJND3j6B8ex9p/JR8e9G62HrVv/YSBFYcDx3aEnRIpa0FqBhBz209N8kD2feUB999bjs
	lJmmMzxquDbL27l72WQnvJMbokW/GMRWhqGCMQVw3ziDOTfP9g8yrYez1Gg8r3ZS0x9tVhetY5HvA
	OXm6B6EwgnoHEpngGqzhJU83l2gt6fK6uKiuxcxQPtKphPT93I38l3Oig0+S0A/G/7OwelsR52QH2
	DSNygeFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSB6K-00000003hcA-2k1a;
	Wed, 27 May 2026 10:03:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSB6G-00000003hat-2vba
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 10:02:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2832860121;
	Wed, 27 May 2026 10:02:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C41C71F00A3A;
	Wed, 27 May 2026 10:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779876175;
	bh=wylaKNd2CHrEQW+XLvJau+CZQ81dCr5zLWwwhdvlBFA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=RlxYQLHqGYpPtmiHQ/qkHW3867G18XVAYMbTH/mTZbDMDATw+LzXVtEEIKLX9j1AN
	 OexQWWcNJST7gwOFxdNE52zfRdoHMXlvM1u/+35cfyVIja3qnmTxLHtez3F+94SJhQ
	 1C2KpijYL2UEaHreWTdmu/sPnLvCfXzmvQ+yQA/jRsaRI2QqYZadoCEoVeYDegObNG
	 LabBfY73DBtsKXrOW1aMWs4YKgmdVBQ6jDGnb7gHR10vMa+9SlZISWKf97TWIXkLjx
	 zfrSP7T7QDvIXX6D0kvFHDze5shCvge6K46Q/jnsprX6K86B/RvEddr7bSM+CNLdIp
	 biHgkGFnMW5WA==
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
Subject: [PATCH v6 2/4] firmware: hwrng: arm_smccc_trng: Register as an SMCCC device
Date: Wed, 27 May 2026 15:32:31 +0530
Message-ID: <20260527100233.428018-3-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260527100233.428018-1-aneesh.kumar@kernel.org>
References: <20260527100233.428018-1-aneesh.kumar@kernel.org>
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

Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 drivers/char/hw_random/arm_smccc_trng.c | 26 ++++++++++++++-----------
 drivers/firmware/smccc/smccc.c          | 14 ++++++-------
 2 files changed, 21 insertions(+), 19 deletions(-)

diff --git a/drivers/char/hw_random/arm_smccc_trng.c b/drivers/char/hw_random/arm_smccc_trng.c
index dcb8e7f37f25..d273e6fc7129 100644
--- a/drivers/char/hw_random/arm_smccc_trng.c
+++ b/drivers/char/hw_random/arm_smccc_trng.c
@@ -16,8 +16,8 @@
 #include <linux/device.h>
 #include <linux/hw_random.h>
 #include <linux/module.h>
-#include <linux/platform_device.h>
 #include <linux/arm-smccc.h>
+#include <linux/arm-smccc-bus.h>
 
 #ifdef CONFIG_ARM64
 #define ARM_SMCCC_TRNG_RND	ARM_SMCCC_TRNG_RND64
@@ -94,29 +94,33 @@ static int smccc_trng_read(struct hwrng *rng, void *data, size_t max, bool wait)
 	return copied;
 }
 
-static int smccc_trng_probe(struct platform_device *pdev)
+static int smccc_trng_probe(struct arm_smccc_device *sdev)
 {
 	struct hwrng *trng;
 
-	trng = devm_kzalloc(&pdev->dev, sizeof(*trng), GFP_KERNEL);
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
+	{ .name = "arm-smccc-trng" },
+	{}
 };
-module_platform_driver(smccc_trng_driver);
+MODULE_DEVICE_TABLE(arm_smccc, smccc_trng_id_table);
+
+static struct arm_smccc_driver smccc_trng_driver = {
+	.name	  = KBUILD_MODNAME,
+	.probe	  = smccc_trng_probe,
+	.id_table = smccc_trng_id_table,
+};
+module_arm_smccc_driver(smccc_trng_driver);
 
-MODULE_ALIAS("platform:smccc_trng");
 MODULE_AUTHOR("Andre Przywara");
 MODULE_DESCRIPTION("Arm SMCCC TRNG firmware interface support");
 MODULE_LICENSE("GPL");
diff --git a/drivers/firmware/smccc/smccc.c b/drivers/firmware/smccc/smccc.c
index 695c920a8087..6d260354d0f9 100644
--- a/drivers/firmware/smccc/smccc.c
+++ b/drivers/firmware/smccc/smccc.c
@@ -9,7 +9,6 @@
 #include <linux/init.h>
 #include <linux/arm-smccc.h>
 #include <linux/kernel.h>
-#include <linux/platform_device.h>
 #include <linux/arm-smccc-bus.h>
 #include <linux/idr.h>
 #include <linux/slab.h>
@@ -241,14 +240,13 @@ subsys_initcall(arm_smccc_bus_init);
 
 static int __init smccc_devices_init(void)
 {
-	struct platform_device *pdev;
-
 	if (smccc_trng_available) {
-		pdev = platform_device_register_simple("smccc_trng", -1,
-						       NULL, 0);
-		if (IS_ERR(pdev))
-			pr_err("smccc_trng: could not register device: %ld\n",
-			       PTR_ERR(pdev));
+		struct arm_smccc_device *sdev;
+
+		sdev = arm_smccc_device_register("arm-smccc-trng");
+		if (IS_ERR(sdev))
+			pr_err("arm-smccc-trng: could not register device: %ld\n",
+			       PTR_ERR(sdev));
 	}
 
 	return 0;
-- 
2.43.0


