Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D5CACA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 00:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X4PaN1FBVh+xdnfphbKwqZhoaGiNxq0bOXNDJ6vx+5U=; b=25EZhRtnW61A/kzqKjvKXP3c2l
	hUC91RHSIVEqM8Z144d9NxMVFNKIakvHwqjIozuwLwizihMCcN3BStkS0+tBN+MdzGDe263co0qBc
	FW9qM3MDNhtriYFHBvzgjkryS1u1w/v3aon0JOm63EZYjGtmLD0Ru3L2MlytGuXGeEBUMQWGcelNs
	JfOLqZZU3Gm8+PHtQVnCwBZFAHAjBoT56WFVYLd8VDwUZPROLo8zi8G7jayBfKI2/Bzgilix11hGG
	08OdhsPWJ82UbQ8jnRVcQC7z685FhXZxwn214Rz8lKSWRvChKQEGj/fT0yj6oXr3ayHm4VnJ9nx3J
	o5F8dQlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoWMA-0000000BvBB-0mxm;
	Wed, 20 Aug 2025 00:07:10 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoUFz-0000000BfSq-1EH1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 21:52:40 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-3b9e743736dso2952669f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 14:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755640357; x=1756245157; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=X4PaN1FBVh+xdnfphbKwqZhoaGiNxq0bOXNDJ6vx+5U=;
        b=hPMoXKEEbXIx7OSTkNYkkF/k98HAFZiezfVfPqHGnFc1QJyu03d5+f93ce69QvEMSd
         BAaXfaKVBLLSLCOWCUhp5uaoJ5uCcae5TOweo88BDGuOXqSLfQdwXd4/W+yZIAHlugDw
         /gylTzMWTcA2rXWbM+OpRUZnWUvZvFw5gBctXhi9+NJORg0MxtQEFTpL2nt7wWtFFsWR
         3ZcsmUFyBUf0Af8d7GdYYgVY+VAu0+Xx5mgDxPuIdfYSg6zPvdaRrbXf4bm5Cgt+FUhs
         ufiUgPS1ljqZXcGUFWx21qLQrz04oAsXJe597NGb8qwr9DCb2FDh4ZEiJToNBtZrgleK
         +zXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755640357; x=1756245157;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X4PaN1FBVh+xdnfphbKwqZhoaGiNxq0bOXNDJ6vx+5U=;
        b=tlqpZ666x2HQ+jrg8spiyvLxdVdv97VQAc9OGReUEDZM9W+mTvLC8SdiEq3ITN6MI2
         ekVhecFgxHXiLUc+9oKJQEZPzOux9p0TUJxyzyk9dIt4e6x+B76FgYe7SgDuPfwA8I5z
         ijZWivVhimF++izniFwWNiIaJHLPXHmipnvNZe9TaZD6HtdlcCe406jq+xewWmXoD8SN
         1zX12xamGk+ca2SOF0EFMz5/alltrdq96I6/XoLeMx4jKwpzODmVhBXe6RZ1++A5Xl1l
         rwJcrLD2YA/ZRStH1VbcktPIi34enMHWHpwnjNc/vcdBiZlX5jXDKRYjP/cFkVOTa2r0
         v6AQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5WHDnSrcw6m+UTfGkNnG+FB3l+Fac68seB4SiRg8cUVjxrrKiQg+Pff0t0cT9AuO1ne7XT6DnzfzmhFyiNNPQ@lists.infradead.org
X-Gm-Message-State: AOJu0YxCLqqKQHE4ML6Cc2mX6i+EVJbwER0iqa3/RT8wkdk35qbH5FYo
	Uv5gRv1fFPFiPy9g5L05tkGW7Z8La3uHPgsNBrXYPRDJbqOIoBxjmx3MUXCktsz0KGEQjT92D44
	Eysn7unUJ09jzdg==
X-Google-Smtp-Source: AGHT+IFsd9NA8cMc7rDL27Ho1qYY/f8xjo3m+B7JdKk4faCMk1aV/KdUXjy/UILcCgJqjvIHpGxiAh/dHHuItw==
X-Received: from wmcn3-n2.prod.google.com ([2002:a05:600c:c0c3:20b0:45b:4777:8063])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1e89:b0:459:e398:ed80 with SMTP id 5b1f17b1804b1-45b47a0700bmr2494445e9.32.1755640357365;
 Tue, 19 Aug 2025 14:52:37 -0700 (PDT)
Date: Tue, 19 Aug 2025 21:51:42 +0000
In-Reply-To: <20250819215156.2494305-1-smostafa@google.com>
Mime-Version: 1.0
References: <20250819215156.2494305-1-smostafa@google.com>
X-Mailer: git-send-email 2.51.0.rc1.167.g924127e9c0-goog
Message-ID: <20250819215156.2494305-15-smostafa@google.com>
Subject: [PATCH v4 14/28] iommu/arm-smmu-v3: Add KVM mode in the driver
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
X-CRM114-CacheID: sfid-20250819_145239_331644_FDDE0AA0 
X-CRM114-Status: GOOD (  21.01  )
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

Add a file only compiled for KVM mode.

At the moment it registers the driver with KVM, and add the hook
needed for memory allocation.

Next, it will create the array with available SMMUs and their
description.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/include/asm/kvm_host.h             |  4 +++
 arch/arm64/kvm/iommu.c                        | 10 ++++--
 drivers/iommu/arm/arm-smmu-v3/Makefile        |  1 +
 .../iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c   | 36 +++++++++++++++++++
 4 files changed, 49 insertions(+), 2 deletions(-)
 create mode 100644 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index fcb4b26072f7..52212c0f2e9c 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1678,4 +1678,8 @@ struct kvm_iommu_ops;
 int kvm_iommu_register_driver(struct kvm_iommu_ops *hyp_ops);
 size_t kvm_iommu_pages(void);
 
+#ifdef CONFIG_ARM_SMMU_V3_PKVM
+size_t smmu_hyp_pgt_pages(void);
+#endif
+
 #endif /* __ARM64_KVM_HOST_H__ */
diff --git a/arch/arm64/kvm/iommu.c b/arch/arm64/kvm/iommu.c
index 5460b1bd44a6..0475f7c95c6c 100644
--- a/arch/arm64/kvm/iommu.c
+++ b/arch/arm64/kvm/iommu.c
@@ -17,10 +17,16 @@ int kvm_iommu_register_driver(struct kvm_iommu_ops *hyp_ops)
 
 size_t kvm_iommu_pages(void)
 {
+	size_t nr_pages = 0;
+
 	/*
 	 * This is called very early during setup_arch() where no initcalls,
 	 * so this has to call specific functions per each KVM driver.
 	 */
-	kvm_nvhe_sym(hyp_kvm_iommu_pages) = 0;
-	return 0;
+#ifdef CONFIG_ARM_SMMU_V3_PKVM
+	nr_pages = smmu_hyp_pgt_pages();
+#endif
+
+	kvm_nvhe_sym(hyp_kvm_iommu_pages) = nr_pages;
+	return nr_pages;
 }
diff --git a/drivers/iommu/arm/arm-smmu-v3/Makefile b/drivers/iommu/arm/arm-smmu-v3/Makefile
index 1918b4a64cb0..284ad71c5282 100644
--- a/drivers/iommu/arm/arm-smmu-v3/Makefile
+++ b/drivers/iommu/arm/arm-smmu-v3/Makefile
@@ -4,5 +4,6 @@ arm_smmu_v3-y := arm-smmu-v3.o arm-smmu-v3-common-hyp.o
 arm_smmu_v3-$(CONFIG_ARM_SMMU_V3_IOMMUFD) += arm-smmu-v3-iommufd.o
 arm_smmu_v3-$(CONFIG_ARM_SMMU_V3_SVA) += arm-smmu-v3-sva.o
 arm_smmu_v3-$(CONFIG_TEGRA241_CMDQV) += tegra241-cmdqv.o
+arm_smmu_v3-$(CONFIG_ARM_SMMU_V3_PKVM) += arm-smmu-v3-kvm.o
 
 obj-$(CONFIG_ARM_SMMU_V3_KUNIT_TEST) += arm-smmu-v3-test.o
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c
new file mode 100644
index 000000000000..ac4eac6d567f
--- /dev/null
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c
@@ -0,0 +1,36 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * pKVM host driver for the Arm SMMUv3
+ *
+ * Copyright (C) 2022 Linaro Ltd.
+ */
+#include <asm/kvm_mmu.h>
+#include <asm/kvm_pkvm.h>
+
+#include <linux/of_platform.h>
+
+#include "arm-smmu-v3.h"
+#include "pkvm/arm_smmu_v3.h"
+
+extern struct kvm_iommu_ops kvm_nvhe_sym(smmu_ops);
+
+size_t smmu_hyp_pgt_pages(void)
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
+static int kvm_arm_smmu_v3_register(void)
+{
+	if (!is_protected_kvm_enabled())
+		return 0;
+
+	return kvm_iommu_register_driver(kern_hyp_va(lm_alias(&kvm_nvhe_sym(smmu_ops))));
+};
+
+core_initcall(kvm_arm_smmu_v3_register);
-- 
2.51.0.rc1.167.g924127e9c0-goog


