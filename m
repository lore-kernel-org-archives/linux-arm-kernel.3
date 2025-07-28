Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45F26C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 19:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xnVOsxgU67R0nV/fO8T4bnA6x+CirofbbwX52wOtcVg=; b=LJ6+1KBPSq91S3u0njrBgYTCmf
	ueUSWTFaiz2Ro4cFdwCZBRK0u/A1gRR9IQcpfyjEOCCm4HBkBrC4AfDd9yQuxP87DqFrmaLA7B16q
	LJMTmseig9MN20rntQkuhuz59azyq1xLYvXWK+iQXse0MyUGOG9n/OioAgzh4OYVFn3rr5cOoTs2e
	JQxmYYv9yUC0Jt4QtyRkfuRHB7EVkL1iIXscZt6ghFylS6pFhl9I0QtODfsc8AZpjYltIFh4b8wVE
	XEhOJximfX27n6CoB6AsF4zuiRpxHajr5nz0WG6jVPbKaIHasFH2LnzFvNeIMNvatAWtXFoDgtbRE
	MY8/4wGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugTir-0000000FI6U-1dwx;
	Mon, 28 Jul 2025 19:41:21 +0000
Received: from mail-wr1-f73.google.com ([209.85.221.73])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugS2u-0000000F90q-2bKE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 17:53:57 +0000
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3b7886bfc16so777514f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Jul 2025 10:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753725235; x=1754330035; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xnVOsxgU67R0nV/fO8T4bnA6x+CirofbbwX52wOtcVg=;
        b=PMbfcqeLWK/qAcYTNA5xrsUtr5d2Bm4JlSR3pxKFHXqhg5p6H3GDTql3OCLp4LRJ12
         3z+eOxluWafgK200UgIhXP619WiOCFKtwO+QTFazpM7bso3389oxLxVo8uI++Qhnqwv+
         34/QjOKS4f1llbdbuxRIOSp1nnOO8cVWrhKksiAqOov8cwgfV7gCcResfQb9XmHdMIIg
         +hhsnvYb7VQ/WdO12jzY15DdzJXvTe47I07b4pjbswZlHuHBH4K5CRvSZSPJVY15AQRO
         Wl89IbLZNCSWUD0m51J+TIPHyYZsu2LmWWILYaRjcrTd+aGKY3AwUJO/GS3NGPW/Nr30
         I1vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753725235; x=1754330035;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xnVOsxgU67R0nV/fO8T4bnA6x+CirofbbwX52wOtcVg=;
        b=Q7xnvxu6St5MupIDJ93NH8aANtAzz7x7q0cKu2ClCjr9XWXgHEaAOVK4qHZvEBtSE2
         QS1cs+4D8PL6Sqbv0wpKWibOn+jgipZG227FQIZABX1O3DKVHYmqoCi3/5/62/xrCVa7
         VKXNaEJWHbE+SINfmbQaDvb+zmJd2dxacEQteMKpeFxj+A0C/mJQAxUiZ77K3stB8jY5
         p5NaQy/XjsGYJf5gC36rDbYiWQA2Ch/Xun2UZ+F70fNg9a9I7neuXMMdyXS0UlR4fDZd
         ZhF/8WP2OWXi9SrWthVRqZNCjeGGpbxG00anqb6rfq1przv/zBvmbLB4li7ewa94sYzr
         z16g==
X-Forwarded-Encrypted: i=1; AJvYcCWKXYrPxJYMRSQo+15Q/piGr0fE7N5DnfCQ26hpWPpUAhtqhNfMSWpuSaTSewY5+SzozLEhpL4rQaT0ztlPU17V@lists.infradead.org
X-Gm-Message-State: AOJu0YxpNpGo5OekBz1Krwq/tzwanCGRyYQ+NVKinZ11wIP+LvB2yjY0
	/B9D6jLdwo5QRxUu8d0Yb59f8xcIIoyL8ANk+RzPZTB2mjJThq3ViJgy4mOLdl6o4eIN7RXXnKb
	th90lsSLnCAMxyQ==
X-Google-Smtp-Source: AGHT+IGnl/hQ8HSC/Tho/ut7229jQGE40+OgRIcPIDPwy4KsZJSVzNmlFutAK2C03YtagjdgRV48tnX6dLo2CA==
X-Received: from wmpz20.prod.google.com ([2002:a05:600c:a14:b0:442:dc75:51ef])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:5d89:0:b0:3a0:9dfc:da4 with SMTP id ffacd0b85a97d-3b776787c79mr7873948f8f.42.1753725234757;
 Mon, 28 Jul 2025 10:53:54 -0700 (PDT)
Date: Mon, 28 Jul 2025 17:53:13 +0000
In-Reply-To: <20250728175316.3706196-1-smostafa@google.com>
Mime-Version: 1.0
References: <20250728175316.3706196-1-smostafa@google.com>
X-Mailer: git-send-email 2.50.1.552.g942d659e1b-goog
Message-ID: <20250728175316.3706196-27-smostafa@google.com>
Subject: [PATCH v3 26/29] iommu/arm-smmu-v3-kvm: Add host driver for pKVM
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, robin.murphy@arm.com, jean-philippe@linaro.org, 
	qperret@google.com, tabba@google.com, jgg@ziepe.ca, mark.rutland@arm.com, 
	praan@google.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_105356_662873_E1F62859 
X-CRM114-Status: GOOD (  19.88  )
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

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

Under protected KVM (pKVM), the host does not have access to guest or
hypervisor memory. This means that devices owned by the host must be
isolated by the SMMU, and the hypervisor is in charge of the SMMU.

Introduce the host component that replaces the normal SMMUv3 driver when
pKVM is enabled, and sends configuration and requests to the actual
driver running in the hypervisor (EL2).

Rather than rely on regular driver probe, pKVM directly calls
kvm_arm_smmu_v3_init(), which synchronously finds all SMMUs and hands
them to the hypervisor. If the regular driver is enabled, it will not
find any free SMMU to drive once it gets probed.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/iommu/arm/arm-smmu-v3/Makefile        |  5 ++
 .../iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c   | 62 +++++++++++++++++++
 2 files changed, 67 insertions(+)
 create mode 100644 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c

diff --git a/drivers/iommu/arm/arm-smmu-v3/Makefile b/drivers/iommu/arm/arm-smmu-v3/Makefile
index 16be1249000a..6829860f2ce3 100644
--- a/drivers/iommu/arm/arm-smmu-v3/Makefile
+++ b/drivers/iommu/arm/arm-smmu-v3/Makefile
@@ -7,3 +7,8 @@ arm_smmu_v3-$(CONFIG_ARM_SMMU_V3_SVA) += arm-smmu-v3-sva.o
 arm_smmu_v3-$(CONFIG_TEGRA241_CMDQV) += tegra241-cmdqv.o
 
 obj-$(CONFIG_ARM_SMMU_V3_KUNIT_TEST) += arm-smmu-v3-test.o
+
+obj-$(CONFIG_ARM_SMMU_V3_PKVM) += arm_smmu_v3_kvm.o
+arm_smmu_v3_kvm-objs-y += arm-smmu-v3-kvm.o
+arm_smmu_v3_kvm-objs-y += arm-smmu-v3-common.o
+arm_smmu_v3_kvm-objs := $(arm_smmu_v3_kvm-objs-y)
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c
new file mode 100644
index 000000000000..73c0150bdc81
--- /dev/null
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c
@@ -0,0 +1,62 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * pKVM host driver for the Arm SMMUv3
+ *
+ * Copyright (C) 2022 Linaro Ltd.
+ */
+#include <asm/kvm_mmu.h>
+
+#include <linux/of_platform.h>
+
+#include "arm-smmu-v3.h"
+#include "pkvm/arm_smmu_v3.h"
+
+extern struct kvm_iommu_ops kvm_nvhe_sym(smmu_ops);
+
+static int kvm_arm_smmu_probe(struct platform_device *pdev)
+{
+	return -ENOSYS;
+}
+
+static void kvm_arm_smmu_remove(struct platform_device *pdev)
+{
+}
+
+static const struct of_device_id arm_smmu_of_match[] = {
+	{ .compatible = "arm,smmu-v3", },
+	{ },
+};
+
+static struct platform_driver kvm_arm_smmu_driver = {
+	.driver = {
+		.name = "kvm-arm-smmu-v3",
+		.of_match_table = arm_smmu_of_match,
+	},
+	.remove = kvm_arm_smmu_remove,
+};
+
+static int kvm_arm_smmu_v3_init_drv(void)
+{
+	return platform_driver_probe(&kvm_arm_smmu_driver, kvm_arm_smmu_probe);
+}
+
+static void kvm_arm_smmu_v3_remove_drv(void)
+{
+	platform_driver_unregister(&kvm_arm_smmu_driver);
+}
+
+struct kvm_iommu_driver kvm_smmu_v3_ops = {
+	.init_driver = kvm_arm_smmu_v3_init_drv,
+	.remove_driver = kvm_arm_smmu_v3_remove_drv,
+};
+
+static int kvm_arm_smmu_v3_register(void)
+{
+	if (!is_protected_kvm_enabled())
+		return 0;
+
+	return kvm_iommu_register_driver(&kvm_smmu_v3_ops,
+					kern_hyp_va(lm_alias(&kvm_nvhe_sym(smmu_ops))));
+};
+
+core_initcall(kvm_arm_smmu_v3_register);
-- 
2.50.1.552.g942d659e1b-goog


