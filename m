Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58380CD4F42
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 09:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TzNCrcD5HyV4t9MZ1B7WHoM1bfnJhxdpeOO/uee06c4=; b=lr1dVoeBtG0kmkBX6hwNa1Orcy
	g0lL/lc313u9AkvHueqjglYxvoxBJgW8G/lpppAJxOt09HWMXhwqfN2lfnSSQX0m47LA9n6vQ/ZPR
	jInY3aVIdjvWHheFznF+n6snUUuFaq4sQMZjrzasQEyd0/ka4e2DkJKucvm9eccVkzrG/CyRxPUKH
	Q4gEypqbk9ySPxgCShBvy2a9JpnxiqW1ntHTFgMHZ8/jaJYd2SLI6/XEX+OG7bmltUkFDweEoUIZY
	U2xW2JRQSyHO7OroANgj51xnLCHAQ739WBOdiJKDmzT/PQLHt9p9blSrWhj14YHZ/7ScZdWgCShL8
	Uog0VGLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNSYu-000000055gj-0Wfq;
	Thu, 14 May 2026 09:41:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNSYq-000000055fV-3nPQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 09:40:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1F42860008;
	Thu, 14 May 2026 09:40:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E973AC2BCB3;
	Thu, 14 May 2026 09:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778751655;
	bh=cYm8KIacQw1yy4uZwh8PXHJpvBgJW6Pi20fiqsOilQg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MdjAV5q/aYCjj17JWcDcqPsfHVk0bqU2ezMp5iwRULQ2FMLp5TSdRzIbwi/hM2MEv
	 5F3KpU35XiBFG9zv5rPEJzkqaIRg1k9vX6qkfxInwgC+HFIaozOzlJACW5RotFhC3r
	 2wk8XOAd8OA9kfLZQBaAGYS/F76lwU/Q4LImPg85SHHnVEA01GRubgdfYn938SXaeN
	 kT6AY0OxRUG2riu5+72nRzMuQfHD3dJcXTHLpdiN9S+FPeNc11mIkfRroPUjBFL+Ws
	 Set4FM8AQduqmBQbwdRAYeCinkZ1sk/GDlDxVuvcAgwEWZFL0ln6sCkjqvkElJ50s4
	 ibWNwFv2y1ihQ==
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
Subject: [PATCH v5 2/3] hwrng: arm_smccc_trng: Register as an auxiliary device
Date: Thu, 14 May 2026 15:10:29 +0530
Message-ID: <20260514094030.42495-3-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260514094030.42495-1-aneesh.kumar@kernel.org>
References: <20260514094030.42495-1-aneesh.kumar@kernel.org>
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

The SMCCC TRNG interface is a firmware-provided function rather than a
standalone platform device. Register it as an auxiliary device under the
arm-smccc platform device and convert the hwrng driver to an auxiliary
driver.

This keeps the TRNG device tied to the SMCCC core device while preserving
module autoloading through the auxiliary device ID table.

The conversion changes the device path from the old platform device path,
but no userspace dependency on that path was found. This was confirmed with
a Debian Code Search lookup for the existing platform device name/path.

Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 drivers/char/hw_random/arm_smccc_trng.c | 25 ++++++++++++++-----------
 drivers/firmware/smccc/smccc.c          | 24 +++++++++++++-----------
 2 files changed, 27 insertions(+), 22 deletions(-)

diff --git a/drivers/char/hw_random/arm_smccc_trng.c b/drivers/char/hw_random/arm_smccc_trng.c
index dcb8e7f37f25..5d56fcbcefa0 100644
--- a/drivers/char/hw_random/arm_smccc_trng.c
+++ b/drivers/char/hw_random/arm_smccc_trng.c
@@ -16,7 +16,7 @@
 #include <linux/device.h>
 #include <linux/hw_random.h>
 #include <linux/module.h>
-#include <linux/platform_device.h>
+#include <linux/auxiliary_bus.h>
 #include <linux/arm-smccc.h>
 
 #ifdef CONFIG_ARM64
@@ -94,29 +94,32 @@ static int smccc_trng_read(struct hwrng *rng, void *data, size_t max, bool wait)
 	return copied;
 }
 
-static int smccc_trng_probe(struct platform_device *pdev)
+static int smccc_trng_probe(struct auxiliary_device *adev,
+		const struct auxiliary_device_id *id)
 {
 	struct hwrng *trng;
 
-	trng = devm_kzalloc(&pdev->dev, sizeof(*trng), GFP_KERNEL);
+	trng = devm_kzalloc(&adev->dev, sizeof(*trng), GFP_KERNEL);
 	if (!trng)
 		return -ENOMEM;
 
 	trng->name = "smccc_trng";
 	trng->read = smccc_trng_read;
 
-	return devm_hwrng_register(&pdev->dev, trng);
+	return devm_hwrng_register(&adev->dev, trng);
 }
 
-static struct platform_driver smccc_trng_driver = {
-	.driver = {
-		.name		= "smccc_trng",
-	},
-	.probe		= smccc_trng_probe,
+static const struct auxiliary_device_id smccc_trng_id_table[] = {
+	{ .name =  KBUILD_MODNAME ".smccc_trng" },
+	{}
 };
-module_platform_driver(smccc_trng_driver);
+MODULE_DEVICE_TABLE(auxiliary, smccc_trng_id_table);
 
-MODULE_ALIAS("platform:smccc_trng");
+static struct auxiliary_driver smccc_trng_driver = {
+	.probe	  = smccc_trng_probe,
+	.id_table = smccc_trng_id_table,
+};
+module_auxiliary_driver(smccc_trng_driver);
 MODULE_AUTHOR("Andre Przywara");
 MODULE_DESCRIPTION("Arm SMCCC TRNG firmware interface support");
 MODULE_LICENSE("GPL");
diff --git a/drivers/firmware/smccc/smccc.c b/drivers/firmware/smccc/smccc.c
index eb077b9aa6da..49ac8172def4 100644
--- a/drivers/firmware/smccc/smccc.c
+++ b/drivers/firmware/smccc/smccc.c
@@ -10,6 +10,7 @@
 #include <linux/arm-smccc.h>
 #include <linux/kernel.h>
 #include <linux/platform_device.h>
+#include <linux/auxiliary_bus.h>
 #include <asm/archrandom.h>
 
 #include "rmm.h"
@@ -94,20 +95,21 @@ static int __init smccc_devices_init(void)
 					PLATFORM_DEVID_NONE, NULL, 0);
 	if (IS_ERR(pdev)) {
 		pr_err("arm-smccc: could not register device: %ld\n", PTR_ERR(pdev));
-	} else {
-		/*
-		 * Register the RMI and RSI devices only when firmware exposes
-		 * the required SMCCC function IDs at a supported revision.
-		 */
-		register_rsi_device(pdev);
+		return 0;
 	}
+	/*
+	 * Register the RMI and RSI devices only when firmware exposes
+	 * the required SMCCC function IDs at a supported revision.
+	 */
+	register_rsi_device(pdev);
 
 	if (smccc_trng_available) {
-		pdev = platform_device_register_simple("smccc_trng", -1,
-						       NULL, 0);
-		if (IS_ERR(pdev))
-			pr_err("smccc_trng: could not register device: %ld\n",
-			       PTR_ERR(pdev));
+		struct auxiliary_device *adev;
+
+		adev = __devm_auxiliary_device_create(&pdev->dev,
+					"arm_smccc_trng", "smccc_trng", NULL, 0);
+		if (!adev)
+			pr_err("smccc_trng: could not register device\n");
 	}
 
 	return 0;
-- 
2.43.0


