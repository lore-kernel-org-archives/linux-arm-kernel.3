Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6395CA0EF7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 00:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kQKSjbAOLoARkZeCpW60ga+O1M1bwmJjgvA8RqrWhDQ=; b=nKYW++op/JCS7aPFBR5w5BMylT
	P9Wv3Cnn8Cfd/bszslCmIEn441HhFBduvHiX4+u0MKxNdSS246v1nqnJ7Ox81fuUt32HM9V8FJkSa
	LPQVyV8CWDeY8QjqCZffmIxuzLi2WoUpdrozR2x70k4q4iSbEJhn62WyxuFkm5zbtRohvtEtEDR7H
	oewzidrL8zAXigDlWWUWmM5LwBuqBcTAN2PkusYIXGNMJ5Au2jpsiZviBekViabcHTANnqOCJkxYt
	hoU35Z6dFxVjRZy1M7q0VvBSyC8cUSAwfpPpUzZYSObMl6ToEsT/7+KMtuzlfdOxeEUwRxfb0Jbfa
	GePDIBUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoWrN-0000000ByTy-0CTL;
	Wed, 20 Aug 2025 00:39:25 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoUGA-0000000BfZ4-37qd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 21:52:51 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-45b467f5173so4286045e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 14:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755640368; x=1756245168; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kQKSjbAOLoARkZeCpW60ga+O1M1bwmJjgvA8RqrWhDQ=;
        b=lFnF5/vMwuUI7R4kZEny4F00Ob9KHHmowVP6qAFK5kZuCC8McCYXo27LFm3WTeUyHH
         Mro5Zrhtq8acMlIFmLrln7a35x/gS49x1462Wo4LKBX0RseKdA6Ah6Oru4hgWfLt/vl1
         GrICvzl9uU34Ct0sWtN2UfZMF3DFA+mLVj8QcQe6iAlSu9WMpXT4cw1RhtDlcLx/sd8S
         nltKHmyPxApBiNj1gEeDZ7LkQ/g4QldVhzg5lKY3ABJNWVYTvCRlgQBZCb2UiS4Uuuv8
         +WlLHno4EBY664R3mL/Qqed5576oyqWMH5uPMN/ZJErOKQ+RKiLeoS5BrE3JDU7BnYye
         5aGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755640368; x=1756245168;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kQKSjbAOLoARkZeCpW60ga+O1M1bwmJjgvA8RqrWhDQ=;
        b=oqeEYfP37gAAgzC8hJUfjfrcwQ88Vm8EjQOU917Ntxffdx6VPjwoBJ1fXbPpIKTCLq
         iLz3bhxKG+Z7h6+1qY1HkkHz7i3XxeepSsYEEzqcPzLbp+x0g3+v6QVXLjQHVXW0fkZ4
         haV/YNsGJL7CV+GcbWGXmxVxgfgArYZGo29ABheBjeKuIRDyflPx9Unjc52K11vm5qne
         4StIrgErRKusYj0669GZbaA0MOpzDhWqumNYjYk0PgSn6jhNz3RlUKYC0FvyEHEjR6mL
         aS0cZf6PEHbMApf3LoWDJFGMgwI+SgJBjiTOCfj9YoHwLglBLb3fqT6iyYFZtCuVYykS
         Dgwg==
X-Forwarded-Encrypted: i=1; AJvYcCWiq3NmP6qjWCQ6UmXADmSTKyC5lBlBWyxQJcuDX16sfUrXMj114EKQmGnACLTu1T0cogfW5cZ8ASvoIyc64Ilw@lists.infradead.org
X-Gm-Message-State: AOJu0YwlqSniYuCtmknfOihZF9L0xGJ+JZvmR0icPg4e4u1jjudtDYUO
	daz9u0+grYpCyA0861+WoY9RPqo3kbKjdiFKDCQaC+SDi1zLtfxaMOnZeFZ2CxaH0kF3dMxudBj
	M80bwA35ieHVXwg==
X-Google-Smtp-Source: AGHT+IEeSFl8aQhXA74KHxoebV5C+2+fcJhttjMY5RrNdpsd+ZTDbX53WFbbWrnver3BkDgaNxReEk7xnsBkcQ==
X-Received: from wmsr18.prod.google.com ([2002:a05:600c:8b12:b0:459:dcaa:ec9e])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5250:b0:459:10de:551e with SMTP id 5b1f17b1804b1-45b479fd300mr2516095e9.27.1755640368689;
 Tue, 19 Aug 2025 14:52:48 -0700 (PDT)
Date: Tue, 19 Aug 2025 21:51:54 +0000
In-Reply-To: <20250819215156.2494305-1-smostafa@google.com>
Mime-Version: 1.0
References: <20250819215156.2494305-1-smostafa@google.com>
X-Mailer: git-send-email 2.51.0.rc1.167.g924127e9c0-goog
Message-ID: <20250819215156.2494305-27-smostafa@google.com>
Subject: [PATCH v4 26/28] iommu/arm-smmu-v3-kvm: Support io-pgtable
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
X-CRM114-CacheID: sfid-20250819_145250_783128_CC1ECFE3 
X-CRM114-Status: GOOD (  18.69  )
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

Add hooks needed to support io-pgtable-arm, mostly about
memory allocation.

Also add a function to allocate s2 64 bit page table.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/kvm/hyp/nvhe/Makefile              |  4 +-
 .../arm/arm-smmu-v3/pkvm/io-pgtable-arm-hyp.c | 64 +++++++++++++++++++
 drivers/iommu/io-pgtable-arm.c                |  2 +-
 drivers/iommu/io-pgtable-arm.h                | 11 ++++
 4 files changed, 79 insertions(+), 2 deletions(-)
 create mode 100644 drivers/iommu/arm/arm-smmu-v3/pkvm/io-pgtable-arm-hyp.c

diff --git a/arch/arm64/kvm/hyp/nvhe/Makefile b/arch/arm64/kvm/hyp/nvhe/Makefile
index c71c96262378..10090be6b067 100644
--- a/arch/arm64/kvm/hyp/nvhe/Makefile
+++ b/arch/arm64/kvm/hyp/nvhe/Makefile
@@ -34,7 +34,9 @@ hyp-obj-y += $(lib-objs)
 HYP_SMMU_V3_DRV_PATH = ../../../../../drivers/iommu/arm/arm-smmu-v3
 
 hyp-obj-$(CONFIG_ARM_SMMU_V3_PKVM) += $(HYP_SMMU_V3_DRV_PATH)/pkvm/arm-smmu-v3.o \
-	$(HYP_SMMU_V3_DRV_PATH)/arm-smmu-v3-common-hyp.o
+	$(HYP_SMMU_V3_DRV_PATH)/arm-smmu-v3-common-hyp.o \
+	$(HYP_SMMU_V3_DRV_PATH)/pkvm/io-pgtable-arm-hyp.o \
+	$(HYP_SMMU_V3_DRV_PATH)/../../io-pgtable-arm.o
 
 ##
 ## Build rules for compiling nVHE hyp code
diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/io-pgtable-arm-hyp.c b/drivers/iommu/arm/arm-smmu-v3/pkvm/io-pgtable-arm-hyp.c
new file mode 100644
index 000000000000..6cf9e5bb76e7
--- /dev/null
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/io-pgtable-arm-hyp.c
@@ -0,0 +1,64 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2022 Arm Ltd.
+ */
+#include <nvhe/iommu.h>
+
+#include "../../../io-pgtable-arm.h"
+
+struct io_pgtable_ops *kvm_alloc_io_pgtable_ops(enum io_pgtable_fmt fmt,
+						struct io_pgtable_cfg *cfg,
+						void *cookie)
+{
+	struct io_pgtable *iop;
+
+	if (fmt != ARM_64_LPAE_S2)
+		return NULL;
+
+	iop = arm_64_lpae_alloc_pgtable_s2(cfg, cookie);
+	iop->fmt	= fmt;
+	iop->cookie	= cookie;
+	iop->cfg	= *cfg;
+
+	return &iop->ops;
+}
+
+void *__arm_lpae_alloc_pages(size_t size, gfp_t gfp,
+			     struct io_pgtable_cfg *cfg, void *cookie)
+{
+	void *addr;
+
+	addr = kvm_iommu_donate_pages(get_order(size));
+
+	if (addr && !cfg->coherent_walk)
+		kvm_flush_dcache_to_poc(addr, size);
+
+	return addr;
+}
+
+void __arm_lpae_free_pages(void *addr, size_t size, struct io_pgtable_cfg *cfg,
+			   void *cookie)
+{
+	if (!cfg->coherent_walk)
+		kvm_flush_dcache_to_poc(addr, size);
+
+	kvm_iommu_reclaim_pages(addr);
+}
+
+void __arm_lpae_sync_pte(arm_lpae_iopte *ptep, int num_entries,
+			 struct io_pgtable_cfg *cfg)
+{
+	if (!cfg->coherent_walk)
+		kvm_flush_dcache_to_poc(ptep, sizeof(*ptep) * num_entries);
+}
+
+/* At the moment this is only used once, so rounding up to a page is not really a problem. */
+void *__arm_lpae_alloc_data(size_t size, gfp_t gfp)
+{
+	return kvm_iommu_donate_pages(get_order(size));
+}
+
+void __arm_lpae_free_data(void *p)
+{
+	return kvm_iommu_reclaim_pages(p);
+}
diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index 2ca09081c3b0..211f6d54b902 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -947,7 +947,7 @@ arm_64_lpae_alloc_pgtable_s1(struct io_pgtable_cfg *cfg, void *cookie)
 	return NULL;
 }
 
-static struct io_pgtable *
+struct io_pgtable *
 arm_64_lpae_alloc_pgtable_s2(struct io_pgtable_cfg *cfg, void *cookie)
 {
 	u64 sl;
diff --git a/drivers/iommu/io-pgtable-arm.h b/drivers/iommu/io-pgtable-arm.h
index 7d9f0b759275..194c3e975288 100644
--- a/drivers/iommu/io-pgtable-arm.h
+++ b/drivers/iommu/io-pgtable-arm.h
@@ -78,8 +78,19 @@ void *__arm_lpae_alloc_pages(size_t size, gfp_t gfp,
 			     void *cookie);
 void *__arm_lpae_alloc_data(size_t size, gfp_t gfp);
 void __arm_lpae_free_data(void *p);
+struct io_pgtable *
+arm_64_lpae_alloc_pgtable_s2(struct io_pgtable_cfg *cfg, void *cookie);
 #ifndef __KVM_NVHE_HYPERVISOR__
 #define __arm_lpae_virt_to_phys	__pa
 #define __arm_lpae_phys_to_virt	__va
+#else
+#include <nvhe/memory.h>
+#define __arm_lpae_virt_to_phys	hyp_virt_to_phys
+#define __arm_lpae_phys_to_virt	hyp_phys_to_virt
+#undef WARN_ONCE
+#define WARN_ONCE(condition, format...)	WARN_ON(1)
+struct io_pgtable_ops *kvm_alloc_io_pgtable_ops(enum io_pgtable_fmt fmt,
+						struct io_pgtable_cfg *cfg,
+						void *cookie);
 #endif /* !__KVM_NVHE_HYPERVISOR__ */
 #endif /* IO_PGTABLE_ARM_H_ */
-- 
2.51.0.rc1.167.g924127e9c0-goog


