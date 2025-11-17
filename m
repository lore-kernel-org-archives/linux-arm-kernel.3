Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13CBBCEBF97
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 18:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C8whZ0pZrNIRwagAm0ORPy5mFVOpkEuU2Ow6ExYwaLg=; b=kR+hub7lEKWhoJ8CbBAUjVn3TH
	4v4D79jCiRowYbIF8CCFwA8F/lrw3otdrob167bnQTlMiUc2KeaawX9jOY2MWJfPkPc3jq4W0ZtTW
	oY6KOhXmPmZKVOxLzAitci4q2AkbFDyoU52wM8zWAb/c2hNs7f/0vQQIYcPEGjgJphcEZMe+6uNl6
	fFRzkPKZsOZ5sxeVNS0eROHEb4tEspFyUghOncAWg9ikU1czfucVQdHVB49hRH69ClC5dAOWAI7pu
	sM94c1gpuBpK7MYqnGBZZExCRCiFNPgnzs9Y4W+zwUym68gZYSF9Vifr+h3b1yArUjcyDZKn7q5wE
	z8O8dCSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL4HZ-0000000Gdpi-1Ses;
	Mon, 17 Nov 2025 18:48:57 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL4HK-0000000GdWX-1C9p
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 18:48:43 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-429cce847c4so1989237f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 10:48:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763405320; x=1764010120; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=C8whZ0pZrNIRwagAm0ORPy5mFVOpkEuU2Ow6ExYwaLg=;
        b=hVVNPbMAT3ya9u2r2/rYaB2GVNsqEG6kyLqfx6VYOFK0yID4T8IVbA9e65s1SxVsfS
         tkFyYJse/z/XOEsD4kY3jeXWfps25NjPR5//VJ8ETR6PnNLMO6M16q8Gkq6cLAk76r2u
         bSIOjKRt5aRuHoeY3YHOr/rbMuBuOSc/8EWdDwLv0i7ZsQhHAdY8Y78waKBLc+WVtnH9
         4z5LCZ5wRTe1cm3yupCwYRy8foNdjytRBXfDB0Kq8csGR+34vJcqjiFIK80+X2j4qCPK
         QjQrnAnElN/soRkE6nDe0ybmDOelM+koDzxzGkGyEv/2kMfQcSFFsIXlWsGVY+PylFH2
         C7Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763405320; x=1764010120;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C8whZ0pZrNIRwagAm0ORPy5mFVOpkEuU2Ow6ExYwaLg=;
        b=gipShP3bDHjSCwcdZL2HEkEu08LD7nUHgqr8vIpZlfFdTrBiFaAuJNyJ03d8Y80T+L
         ipOO2nshsEZx9NR2sAktMLIJ/0PMsfvYTwhvdziiA1YOBTGUoLny71E4jYC84/QX1QvR
         ZcR1AweS9q0zfVOCcS1K8mytfRmmkBx34F7npyCNTWTsuJCNc4swWXhZ22iAXKTDC8yL
         w81Blaow5HBefhYGhbCrebmkfyZgVr1podS9sYc9wullr0UJgLpTVLIVI+iDlI6T4Ebp
         iY4awyN+bPLxfMbkjn1m0tOrG+BZV+eu/nYy2ZzYcTGzBEprf/lm++/V6yybcZDwFxzL
         TaMA==
X-Gm-Message-State: AOJu0Yy+t0gmAi1QlWbkxdCYjtlfk3gKCv3gYr5THUv9Ah8/IJAwgJxL
	/YpCj3/2qmvTwkyeqhaLOuTPRsyNLNfRf+FFke+KfNCuQEx2gSXJb882Uwli8wdM+iDC6Rqxm5B
	+aQNtD8bTV06AKTEW9newalmDbHJ5Y+MWQJ3lVmLA36398dH1B5C9tCxMFyHRRATWXCDdHugUBE
	44v4cQ4+y4PJc+CSkcSALgTKq2rYFuOa2n8ZBYCpwS+f699W61jBMStwkEtWClMhq2lQ==
X-Google-Smtp-Source: AGHT+IGsLY0ihnfe+d9VivrIlxJpw79fEdNZ7d3k+PXAdZb1HiZsb1oiiqepnVn54b8AHulaH6k3LpFgrXdMyA==
X-Received: from wrmf14.prod.google.com ([2002:adf:e90e:0:b0:42b:b28a:6748])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2c0c:b0:42b:3806:2bb4 with SMTP id ffacd0b85a97d-42b59342e50mr13284074f8f.27.1763405319568;
 Mon, 17 Nov 2025 10:48:39 -0800 (PST)
Date: Mon, 17 Nov 2025 18:48:01 +0000
In-Reply-To: <20251117184815.1027271-1-smostafa@google.com>
Mime-Version: 1.0
References: <20251117184815.1027271-1-smostafa@google.com>
X-Mailer: git-send-email 2.52.0.rc1.455.g30608eb744-goog
Message-ID: <20251117184815.1027271-15-smostafa@google.com>
Subject: [PATCH v5 14/27] iommu/arm-smmu-v3: Support probing KVM emulated devices
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, iommu@lists.linux.dev
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org, jgg@ziepe.ca, 
	praan@google.com, danielmentz@google.com, mark.rutland@arm.com, 
	qperret@google.com, tabba@google.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_104842_351425_6FCAF36F 
X-CRM114-Status: GOOD (  22.79  )
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

When KVM runs in protected mode, and CONFIG_ARM_SMMU_V3_PKVM
is enabled, it will manage the SMMUv3 HW using trap and emulate
and present emulated SMMUs to the host kernel.

In that case, those SMMUs will be on the aux bus, so make it
possibly to the driver to probe those devices.
Otherwise, everything else is the same as the KVM emulation
complies with the architecutre, so the driver doesn't need
to be modified.

Suggested-by: Jason Gunthorpe <jgg@ziepe.ca>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 58 +++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 7b1bd0658910..851d47bedae6 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -11,6 +11,7 @@
 
 #include <linux/acpi.h>
 #include <linux/acpi_iort.h>
+#include <linux/auxiliary_bus.h>
 #include <linux/bitops.h>
 #include <linux/crash_dump.h>
 #include <linux/delay.h>
@@ -4604,6 +4605,63 @@ static struct platform_driver arm_smmu_driver = {
 module_driver(arm_smmu_driver, platform_driver_register,
 	      arm_smmu_driver_unregister);
 
+#ifdef CONFIG_ARM_SMMU_V3_PKVM
+/*
+ * Now we have 2 devices, the aux device bound to this driver, and pdev
+ * which is the physical platform device.
+ * This part is a bit hairy but it works due to the fact that
+ * CONFIG_ARM_SMMU_V3_PKVM forces both drivers to be built in.
+ * The struct device for the SMMU is used in the following cases:
+ * 1) Printing using dev_*()
+ * 2) DMA memory alloc (dmam_alloc_coherent, devm_*)
+ * 3) Requesting resources (iomem, sysfs)
+ * 4) Probing firmware info (of_node, fwnode...)
+ * 5) Dealing with abstracted HW resources (irqs, MSIs, RPM)
+ * 6) Saving/reading driver data
+ * For point 4) and 5) we must use the platform device.
+ * For, 1) pdev is better for debuggability.
+ * For 2), 3), 6) it's better to use the bound device.
+ * However that doesn't really work:
+ * For 2) The DMA allocation using the aux device will fail, as
+ * we need to setup some device DMA attrs (mask), to match the
+ * platform.
+ * For 6) Some contexts from the pdev as MSI, it needs to use the
+ * drvdata.
+ * Based on the following:
+ * 1- Both drivers must be built-in to enable this (enforced by Kconfig),
+ *    which means that none of them can be removed.
+ * 2- The KVM driver doesn't do anythng at runtime and doesn't use drvdata.
+ * We can keep the driver simple and to claim the platform device in all cases.
+ */
+static int arm_smmu_device_probe_emu(struct auxiliary_device *auxdev,
+				     const struct auxiliary_device_id *id)
+{
+	struct device *parent = auxdev->dev.parent;
+
+	dev_info(&auxdev->dev, "Probing from %s\n", dev_name(parent));
+	return arm_smmu_device_probe(to_platform_device(parent));
+}
+
+static void arm_smmu_device_shutdown_emu(struct auxiliary_device *auxdev)
+{
+	arm_smmu_device_shutdown(to_platform_device(auxdev->dev.parent));
+}
+
+const struct auxiliary_device_id arm_smmu_aux_table[] = {
+	{ .name = "protected_kvm.smmu_v3_emu" },
+	{ },
+};
+
+struct auxiliary_driver arm_smmu_driver_emu = {
+	.name = "arm-smmu-v3-emu",
+	.id_table = arm_smmu_aux_table,
+	.probe = arm_smmu_device_probe_emu,
+	.shutdown = arm_smmu_device_shutdown_emu,
+};
+
+module_auxiliary_driver(arm_smmu_driver_emu);
+#endif
+
 MODULE_DESCRIPTION("IOMMU API for ARM architected SMMUv3 implementations");
 MODULE_AUTHOR("Will Deacon <will@kernel.org>");
 MODULE_ALIAS("platform:arm-smmu-v3");
-- 
2.52.0.rc1.455.g30608eb744-goog


