Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26EDFE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 18:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PfVS3osJ9q22MREQZzZV+YBtg9RTu0l7wPS76L6zkGo=; b=oBreQWg8Jvzs0XDJPDJYoJA2Ry
	dVYpdc2p7Ru8iiVrOygrCWBIYBzACqsavb+D53vYo947Qz7HvYsCQsjLFzThY1S87SG58vhzvJ3mD
	zFt9BfEmB0q6q6CoTP+mQzk/rb5ZzsS1jUd5AS47dHOpn/fdHJx3rWbetop9eNyPKuLbycxauJv7l
	D9ZME7u7fgDwB7L1GU58AoZE7pa/vHcaGszuXEwSpYHF5ru+URQDQXXB82JtGSQXSTWn7YTsXLYVI
	/jkoNqc9b+xjfUPdZ/rSbEQI0byBrfoMXapflWuk0Ypt6fvSfYJ3Etc0dNbgXAu5bDtMxzzYIk2gh
	cijz7jrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLo62-00000001SjQ-1WNX;
	Thu, 12 Dec 2024 18:39:34 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLnZO-00000001Jsc-1faZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 18:05:51 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-436228ebc5eso5626995e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 10:05:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734026748; x=1734631548; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PfVS3osJ9q22MREQZzZV+YBtg9RTu0l7wPS76L6zkGo=;
        b=Lu9/DI55V/U4iEULbyx1+XnpalR4vXk6pYCoY8ovfqvDXdhtVQY1ZbtiBqI025kuG1
         F2MuGiuaxznKjFR4QmrTGqkxU56BRgqAnxRUTT9VrkBnxrIyACriYwPMsmHhy43ZJuYX
         il9+Q40kMdFYNqLkB12rreuXkAVD4jeEtuyV5CFAxBUbjFR7yTbkQB23H9Ax9b72ZARI
         gCCeKmVKyQpgeDEDNm/RU70alvZr0ipKAHsxtVjkuoCrrpkXY9AnvSTURDpk8asGbTTw
         /fjZkNOI4p2FIsVcpYFUIMe+JG9VYmOIhqYGiBNAfa5Azdj9gQ/MwXw3DfYKy/X6ZtTH
         lKdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734026748; x=1734631548;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PfVS3osJ9q22MREQZzZV+YBtg9RTu0l7wPS76L6zkGo=;
        b=SEbzvAznFN25eSDPeakcmwYMsAHG28VdnPZ5rlQF+wCDiqIIlzfNYoH1Txdz4Txf07
         ZYkbUzjOB9m7OOcXOoCrgmQxbYBmBD0jsJWxiuMZQZ+Qcf/WwtvHO4/X6mO47mFdzuBW
         fKHZxh/GIaCzaa63rhzLM2i14RLTx5Q5B80xmKQjduCEkMPDCDbXs4qzPkbS4s30nqBt
         NBPHlk67AOJRCb+6kPp3URPg1eDdxsmpJQHwkRa82Hx15BVXmhfhYv8gCIxg8FhpCd70
         OwyUbPPElxsWJ2GKcFxxKWTXiOEbGtEzGKECNUaA6xgRwuqSy8EODeUrCgYB/aplHJ8o
         1HIg==
X-Forwarded-Encrypted: i=1; AJvYcCU42YVQUKFstg0uguQugM3o8oCch+AfXBzX2LwbyioLzSqZx0+EeYwcP+9ZuV+iCTDhrv8AE2LaMcu2WjwPhvQR@lists.infradead.org
X-Gm-Message-State: AOJu0YzIfKnerzvzEkxLn15vZ1oj6lHFrQyzG+34P4y4YCXb7qktuyKX
	kE/rVIilmwV1Rz4Lsu/5goMVHreFe+lR6JChpuHsZminiMNw+/QIwpgHCqPC4296e1wpfmmaJo5
	5H+Gu2coOMQ==
X-Google-Smtp-Source: AGHT+IGxFKclHRVEq5ycO+SmEmjwkOwSKayY3zd4xYSx9lryA9h551F87hCr0p5MkmL1i0ozD721MEZuLPSrCg==
X-Received: from wmgg28.prod.google.com ([2002:a05:600d:1c:b0:434:f847:ba1b])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:468b:b0:431:54d9:da57 with SMTP id 5b1f17b1804b1-4361c41811cmr73715735e9.30.1734026748472;
 Thu, 12 Dec 2024 10:05:48 -0800 (PST)
Date: Thu, 12 Dec 2024 18:03:55 +0000
In-Reply-To: <20241212180423.1578358-1-smostafa@google.com>
Mime-Version: 1.0
References: <20241212180423.1578358-1-smostafa@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241212180423.1578358-32-smostafa@google.com>
Subject: [RFC PATCH v2 31/58] KVM: arm64: smmu-v3: Support io-pgtable
From: Mostafa Saleh <smostafa@google.com>
To: iommu@lists.linux.dev, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, robdclark@gmail.com, joro@8bytes.org, 
	robin.murphy@arm.com, jean-philippe@linaro.org, jgg@ziepe.ca, 
	nicolinc@nvidia.com, vdonnefort@google.com, qperret@google.com, 
	tabba@google.com, danielmentz@google.com, tzukui@google.com, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_100550_441849_68CD4E58 
X-CRM114-Status: GOOD (  18.14  )
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

Implement the hypervisor version of io-pgtable allocation functions,
mirroring drivers/iommu/io-pgtable-arm.c. Page allocation uses the
IOMMU pool filled by the host.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/kvm/hyp/nvhe/Makefile              |   2 +
 .../arm64/kvm/hyp/nvhe/iommu/io-pgtable-arm.c | 153 ++++++++++++++++++
 include/linux/io-pgtable-arm.h                |  11 ++
 3 files changed, 166 insertions(+)
 create mode 100644 arch/arm64/kvm/hyp/nvhe/iommu/io-pgtable-arm.c

diff --git a/arch/arm64/kvm/hyp/nvhe/Makefile b/arch/arm64/kvm/hyp/nvhe/Makefile
index edfd8a11ac90..e4f662b1447f 100644
--- a/arch/arm64/kvm/hyp/nvhe/Makefile
+++ b/arch/arm64/kvm/hyp/nvhe/Makefile
@@ -17,6 +17,8 @@ hyp-obj-$(CONFIG_MODULES) += modules.o
 hyp-obj-y += $(lib-objs)
 
 hyp-obj-$(CONFIG_ARM_SMMU_V3_PKVM) += iommu/arm-smmu-v3.o
+hyp-obj-$(CONFIG_ARM_SMMU_V3_PKVM) += iommu/io-pgtable-arm.o \
+	../../../../../drivers/iommu/io-pgtable-arm-common.o
 
 $(obj)/hyp.lds: $(src)/hyp.lds.S FORCE
 	$(call if_changed_dep,cpp_lds_S)
diff --git a/arch/arm64/kvm/hyp/nvhe/iommu/io-pgtable-arm.c b/arch/arm64/kvm/hyp/nvhe/iommu/io-pgtable-arm.c
new file mode 100644
index 000000000000..aa5bf7c0ed03
--- /dev/null
+++ b/arch/arm64/kvm/hyp/nvhe/iommu/io-pgtable-arm.c
@@ -0,0 +1,153 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2022 Arm Ltd.
+ */
+#include <asm/kvm_hyp.h>
+#include <asm/kvm_mmu.h>
+#include <kvm/arm_smmu_v3.h>
+#include <linux/types.h>
+#include <linux/gfp_types.h>
+#include <linux/io-pgtable-arm.h>
+
+#include <nvhe/alloc.h>
+#include <nvhe/iommu.h>
+#include <nvhe/mem_protect.h>
+
+int arm_lpae_map_exists(void)
+{
+	return -EEXIST;
+}
+
+int arm_lpae_unmap_empty(void)
+{
+	return -EEXIST;
+}
+
+void *__arm_lpae_alloc_pages(size_t size, gfp_t gfp,
+			     struct io_pgtable_cfg *cfg, void *cookie)
+{
+	void *addr;
+
+	if (!PAGE_ALIGNED(size))
+		return NULL;
+
+	addr = kvm_iommu_donate_pages(get_order(size), 0);
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
+	u8 order;
+
+	/*
+	 * It's guaranteed all allocations are aligned, but core code
+	 * might free PGD with it's actual size.
+	 */
+	order = get_order(PAGE_ALIGN(size));
+
+	if (!cfg->coherent_walk)
+		kvm_flush_dcache_to_poc(addr, size);
+
+	kvm_iommu_reclaim_pages(addr, order);
+}
+
+void __arm_lpae_sync_pte(arm_lpae_iopte *ptep, int num_entries,
+			 struct io_pgtable_cfg *cfg)
+{
+	if (!cfg->coherent_walk)
+		kvm_flush_dcache_to_poc(ptep, sizeof(*ptep) * num_entries);
+}
+
+static int kvm_arm_io_pgtable_init(struct io_pgtable_cfg *cfg,
+				   struct arm_lpae_io_pgtable *data)
+{
+	int ret = -EINVAL;
+
+	if (cfg->fmt == ARM_64_LPAE_S2)
+		ret = arm_lpae_init_pgtable_s2(cfg, data);
+	else if (cfg->fmt == ARM_64_LPAE_S1)
+		ret = arm_lpae_init_pgtable_s1(cfg, data);
+
+	if (ret)
+		return ret;
+
+	data->iop.cfg = *cfg;
+	data->iop.fmt	= cfg->fmt;
+
+	return 0;
+}
+
+struct io_pgtable *kvm_arm_io_pgtable_alloc(struct io_pgtable_cfg *cfg,
+					    void *cookie,
+					    int *out_ret)
+{
+	size_t pgd_size, alignment;
+	struct arm_lpae_io_pgtable *data;
+	int ret;
+
+	data = hyp_alloc(sizeof(*data));
+	if (!data) {
+		*out_ret = hyp_alloc_errno();
+		return NULL;
+	}
+
+	ret = kvm_arm_io_pgtable_init(cfg, data);
+	if (ret)
+		goto out_free;
+
+	pgd_size = PAGE_ALIGN(ARM_LPAE_PGD_SIZE(data));
+	data->pgd = __arm_lpae_alloc_pages(pgd_size, 0, &data->iop.cfg, cookie);
+	if (!data->pgd) {
+		ret = -ENOMEM;
+		goto out_free;
+	}
+	/*
+	 * If it has eight or more entries, the table must be aligned on
+	 * its size. Otherwise 64 bytes.
+	 */
+	alignment = max(pgd_size, 8 * sizeof(arm_lpae_iopte));
+	if (!IS_ALIGNED(hyp_virt_to_phys(data->pgd), alignment)) {
+		__arm_lpae_free_pages(data->pgd, pgd_size,
+				      &data->iop.cfg, cookie);
+		ret = -EINVAL;
+		goto out_free;
+	}
+
+	data->iop.cookie = cookie;
+	if (cfg->fmt == ARM_64_LPAE_S2)
+		data->iop.cfg.arm_lpae_s2_cfg.vttbr = __arm_lpae_virt_to_phys(data->pgd);
+	else if (cfg->fmt == ARM_64_LPAE_S1)
+		data->iop.cfg.arm_lpae_s1_cfg.ttbr = __arm_lpae_virt_to_phys(data->pgd);
+
+	if (!data->iop.cfg.coherent_walk)
+		kvm_flush_dcache_to_poc(data->pgd, pgd_size);
+
+	/* Ensure the empty pgd is visible before any actual TTBR write */
+	wmb();
+
+	*out_ret = 0;
+	return &data->iop;
+out_free:
+	hyp_free(data);
+	*out_ret = ret;
+	return NULL;
+}
+
+int kvm_arm_io_pgtable_free(struct io_pgtable *iopt)
+{
+	struct arm_lpae_io_pgtable *data = io_pgtable_to_data(iopt);
+	size_t pgd_size = ARM_LPAE_PGD_SIZE(data);
+
+	if (!data->iop.cfg.coherent_walk)
+		kvm_flush_dcache_to_poc(data->pgd, pgd_size);
+
+	io_pgtable_tlb_flush_all(iopt);
+	__arm_lpae_free_pgtable(data, data->start_level, data->pgd);
+	hyp_free(data);
+	return 0;
+}
diff --git a/include/linux/io-pgtable-arm.h b/include/linux/io-pgtable-arm.h
index 337e9254fdbd..88922314157d 100644
--- a/include/linux/io-pgtable-arm.h
+++ b/include/linux/io-pgtable-arm.h
@@ -191,8 +191,19 @@ static inline bool iopte_table(arm_lpae_iopte pte, int lvl)
 	return iopte_type(pte) == ARM_LPAE_PTE_TYPE_TABLE;
 }
 
+#ifdef __KVM_NVHE_HYPERVISOR__
+#include <nvhe/memory.h>
+#define __arm_lpae_virt_to_phys	hyp_virt_to_phys
+#define __arm_lpae_phys_to_virt	hyp_phys_to_virt
+
+struct io_pgtable *kvm_arm_io_pgtable_alloc(struct io_pgtable_cfg *cfg,
+					    void *cookie,
+					    int *out_ret);
+int kvm_arm_io_pgtable_free(struct io_pgtable *iop);
+#else
 #define __arm_lpae_virt_to_phys	__pa
 #define __arm_lpae_phys_to_virt	__va
+#endif
 
 /* Generic functions */
 void __arm_lpae_free_pgtable(struct arm_lpae_io_pgtable *data, int lvl,
-- 
2.47.0.338.g60cca15819-goog


