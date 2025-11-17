Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14639CEBF93
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 18:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6trFz58Gu4UJEu1ThwWz2XtrxsLtl476+uXL3Pe7jcQ=; b=PFzHE3edz3hTzrWJS64IGdjJ3H
	4p7Y2RUZBZ42QbyCTp6sQUU6Jk3U1vx0pq9SzTqGtxjavoqao1Jlvrq54QcxwkYcsyhVnUhCygzFu
	ZUvf0nmND84eZzKsIyNfPu0moHY1Zy7nKEUSGgjGqZ6gmqYtsUadBnwx8KOw8/WnLJ+qa5mJYpd1/
	kyydribJi+e9RqfEy8qqHW1G/6kQ/96oZeMZrrJQnekNlViZYty6h4Z+L83OF1nDHTlIjD+Gqydpz
	nmVVBIdgMzjzyw28cN4JxnJBbGbqI2L99/4fZB4ineu1JMh470CTvGhtmB9gn/qgX4yYLjKe7ziR8
	X1FlAI8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL4HW-0000000Gdkf-01l1;
	Mon, 17 Nov 2025 18:48:54 +0000
Received: from mail-ed1-x549.google.com ([2a00:1450:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL4HJ-0000000GdW2-2oZM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 18:48:42 +0000
Received: by mail-ed1-x549.google.com with SMTP id 4fb4d7f45d1cf-6407bd092b6so7043759a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 10:48:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763405319; x=1764010119; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6trFz58Gu4UJEu1ThwWz2XtrxsLtl476+uXL3Pe7jcQ=;
        b=hhoY7SWMkzNzonBW9Rn6G9SEZlDFNKM1iW/BlplTuRdkWBMqoInUxV/rFyUqK4uVHm
         6BjV0PpOMs8dfbmb/kzKbAW79PZhTSZF+9cgwi1vu6HwDoonsvXpGwKdhkmqUS5sN0jh
         /RT+YhKiJc88Q18Y8drQEnFf+77tQjgCpB3QrXeLem8aLMYXCI19KkAM2Cii/JGZef33
         yehuIKBuzA5v19mnWc1QSgQWx+SL36sLdt454wKSqNiRGnDtMZmqU4UO39gQQKS+a8gB
         a436UR37tr2UwO21qFxOvjteyEXAd7KnrPehm9gKtDrFER3lHa73qoO9dGHOjfJkc5F1
         9xNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763405319; x=1764010119;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6trFz58Gu4UJEu1ThwWz2XtrxsLtl476+uXL3Pe7jcQ=;
        b=aH4W/2qORrQktW5AZdEfBHNSyA3BBbHGL7TgoP/LkrJ5zLaKwAYTvU1hgv336Set65
         jl2huTARC7e2ZBQGU/2LAEjUMeR+U46dwOAW6lWIk2qDayaCw6xW7E4f2Ce3eWrtCQ/y
         rbqloDk4B6Os+giqlGpNyLv72VDQ/JI8eB/XdI1HXy8Jn/OpLfk3/UNgqMzn5OOEBjHY
         O2jxYqitc+70UTkTWjsVQUOInEnEcUV5rqoFI7HZOkgDQOgrM/LBGuTi4hxMizwD9zNH
         GeryiCKqyPjYRnXLDIi7Dj1JzUinSzBqnO3sdYupQzmb57O7eu3MU+NI6BKezOb5uAa+
         lJkA==
X-Gm-Message-State: AOJu0YyI3owWiFdOr4/OFxI8mmGpowYycuPIJ0gmx9L3xnNFJTLMZPDk
	YivEAvxaCRs+8ZvIe9Nr1+FaSyur7vky9x6pmnYm/X2TgO7O+VWY/mQQQpmM/6ctDqttfd6AF7a
	W7wErz6QZHJ1ys0Dom0Y+n5BzmLqLz7fMf9ihoQe8tIu66oVl/zOow9f9/6+dlIYLNcstD2gM9G
	j9nL6Fg/aSpnV9xzw4CTeiSXw3xxuTaoK8YxRfsBlxtVU95PmZTBHwpHu49y+hSUNT+Q==
X-Google-Smtp-Source: AGHT+IE3+viO3srJHAcHB3c5RRKlLg8klxOmp1l9jNQ0CtxcTZZi09dcfnPoyGFkFEx9s/uAX82FyaMdOVjXZg==
X-Received: from ejsr3.prod.google.com ([2002:a17:906:7fc3:b0:b6d:5546:e475])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:3c90:b0:b70:b077:b94b with SMTP id a640c23a62f3a-b7367b99c79mr1398956966b.43.1763405318837;
 Mon, 17 Nov 2025 10:48:38 -0800 (PST)
Date: Mon, 17 Nov 2025 18:48:00 +0000
In-Reply-To: <20251117184815.1027271-1-smostafa@google.com>
Mime-Version: 1.0
References: <20251117184815.1027271-1-smostafa@google.com>
X-Mailer: git-send-email 2.52.0.rc1.455.g30608eb744-goog
Message-ID: <20251117184815.1027271-14-smostafa@google.com>
Subject: [PATCH v5 13/27] iommu/arm-smmu-v3-kvm: Add the kernel driver
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
X-CRM114-CacheID: sfid-20251117_104841_743913_47C342C2 
X-CRM114-Status: GOOD (  19.77  )
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

A platform driver is created to probe the SMMUs, which then creates
aux devices for the emulated SMMUs.

Then the driver registers with KVM.

Next, the SMMUv3 driver will probed the aux devices.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/iommu/arm/arm-smmu-v3/Makefile        |  1 +
 .../iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c   | 91 +++++++++++++++++++
 2 files changed, 92 insertions(+)
 create mode 100644 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c

diff --git a/drivers/iommu/arm/arm-smmu-v3/Makefile b/drivers/iommu/arm/arm-smmu-v3/Makefile
index c9ce392e6d31..c3fc5c4a4a1e 100644
--- a/drivers/iommu/arm/arm-smmu-v3/Makefile
+++ b/drivers/iommu/arm/arm-smmu-v3/Makefile
@@ -4,5 +4,6 @@ arm_smmu_v3-y := arm-smmu-v3.o arm-smmu-v3-common-lib.o
 arm_smmu_v3-$(CONFIG_ARM_SMMU_V3_IOMMUFD) += arm-smmu-v3-iommufd.o
 arm_smmu_v3-$(CONFIG_ARM_SMMU_V3_SVA) += arm-smmu-v3-sva.o
 arm_smmu_v3-$(CONFIG_TEGRA241_CMDQV) += tegra241-cmdqv.o
+arm_smmu_v3-$(CONFIG_ARM_SMMU_V3_PKVM) += arm-smmu-v3-kvm.o
 
 obj-$(CONFIG_ARM_SMMU_V3_KUNIT_TEST) += arm-smmu-v3-test.o
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c
new file mode 100644
index 000000000000..ca12560639c5
--- /dev/null
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c
@@ -0,0 +1,91 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * pKVM host driver for the Arm SMMUv3
+ *
+ * Copyright (C) 2022 Linaro Ltd.
+ */
+#include <asm/kvm_mmu.h>
+#include <asm/kvm_pkvm.h>
+
+#include <linux/auxiliary_bus.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+
+#include "arm-smmu-v3.h"
+#include "pkvm/arm_smmu_v3.h"
+
+extern struct kvm_iommu_ops kvm_nvhe_sym(smmu_ops);
+
+static size_t smmu_hyp_pgt_pages(void)
+{
+	/*
+	 * SMMUv3 uses the same format as stage-2 and hence have the same memory
+	 * requirements, we add extra 500 pages for L2 ste.
+	 */
+	if (of_find_compatible_node(NULL, NULL, "arm,smmu-v3"))
+		return host_s2_pgtable_pages() + 500;
+	return 0;
+}
+
+static struct platform_driver smmuv3_nesting_driver;
+static int smmuv3_nesting_probe(struct platform_device *pdev)
+{
+	return 0;
+}
+
+static int kvm_arm_smmu_v3_register(void)
+{
+	size_t nr_pages = smmu_hyp_pgt_pages();
+	int ret;
+
+	if (!is_protected_kvm_enabled() || !nr_pages)
+		return 0;
+
+	ret = platform_driver_probe(&smmuv3_nesting_driver, smmuv3_nesting_probe);
+	if (ret)
+		return ret;
+
+	return kvm_iommu_register_driver(kern_hyp_va(lm_alias(&kvm_nvhe_sym(smmu_ops))),
+					 nr_pages);
+};
+
+static int smmu_create_aux_device(struct device *dev, void *data)
+{
+	static int dev_id;
+	struct auxiliary_device *auxdev;
+
+	auxdev = __devm_auxiliary_device_create(dev, "protected_kvm",
+						"smmu_v3_emu", NULL, dev_id++);
+	if (!auxdev)
+		return -ENODEV;
+
+	auxdev->dev.parent = dev;
+
+	return 0;
+}
+
+static struct platform_driver smmuv3_nesting_driver;
+static int kvm_arm_smmu_v3_post_init(void)
+{
+	if (!is_protected_kvm_enabled())
+		return 0;
+
+	WARN_ON(driver_for_each_device(&smmuv3_nesting_driver.driver, NULL,
+				       NULL, smmu_create_aux_device));
+
+	return 0;
+}
+
+static const struct of_device_id smmuv3_nested_of_match[] = {
+	{ .compatible = "arm,smmu-v3", },
+	{ },
+};
+
+static struct platform_driver smmuv3_nesting_driver = {
+	.driver = {
+		.name = "smmuv3-nesting",
+		.of_match_table = smmuv3_nested_of_match,
+	},
+};
+late_initcall(kvm_arm_smmu_v3_post_init);
+subsys_initcall(kvm_arm_smmu_v3_register);
-- 
2.52.0.rc1.455.g30608eb744-goog


