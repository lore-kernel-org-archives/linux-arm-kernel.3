Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24A57E77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 19:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8LOnKB51DX+hbW0El8jQ5+VtfI8i+DJEmanKBr5IaOc=; b=4DQAOju24trZV0s0yN37mghh6P
	995BfBhSPsScE73hNROoHmIg1u+TSu13NoNKnBgt2P52toEltdf/4AiWlV22dxMn0gzZ+MxgCLBEE
	LAwQc4n3xw9p3a3ZWGOJUwRWH6YbEmDiorJCpN/rVgeAhGdMFbwurRRsRnsUavfy4mj/XSw5bEnpR
	ABXcKSFAi1iKmdGrNvutdW/IhJdZ5HdGUvqUyq40Nmsbld3buep9oXVWDFpipGuMLhYuqv/NeOsBA
	DAqrAJ3Ml1un1oT8lS3hqbne3JZ9fGcGstR0ZXYP5D3jSZmBMCKYfMs+bCayBNyIn7hfha/NJ+MDs
	dNMltNvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLofN-00000001aCW-2W6m;
	Thu, 12 Dec 2024 19:16:05 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLnaE-00000001KC1-1G0Z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 18:06:44 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4361ecebc5bso5657655e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 10:06:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734026800; x=1734631600; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8LOnKB51DX+hbW0El8jQ5+VtfI8i+DJEmanKBr5IaOc=;
        b=zAamf+YrFEZvRHAPBTxBzlj7yC3jHE7JtF4E3dE4EWQDlnzSkHo4HlhUO6jYF+6On9
         nlBit0NAyw53+bFxzFnH6cbpGffikjdMJYOWMk0dClArkOTEqZFZatqG/llVNgmAYFop
         2GhbkA9kiWooGdhjSX/pomW5kCD5S3GrBsaTe4IajWapFizSij7qtyaZklwi99oFMhP2
         +LvO5YaDB6D30Y7YrIO3IRWCt9Yt/Ue5LzzdBHQdnrKPaoiA9R2tDRilM7yox1U9JrAK
         Kp4X7sv5siCuJ5ZaPV9MItsLP8fTyHsiMuzKk/6ehA1AM/9gm6i5Yq589LBK8WYOYC1b
         j79w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734026800; x=1734631600;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8LOnKB51DX+hbW0El8jQ5+VtfI8i+DJEmanKBr5IaOc=;
        b=U/Lm+xYFeVWINk3H77rF0FtOZbI+CIgggGyjHYCPEXhWntysz2AHNuTron9F+CHFBr
         3KEXl7S8y0ZbMnBw0qnT5pcV1HZYAphygYy1MQ3BcnjgXmV3ZNbaabVy5m+tBwcwH9vk
         YnLZ3/mO/xXLKuXxm4atMLUyQDwL7tWggn1P82N/5BGrF/a4DuATz8823g/3YPuMkIdf
         NiDSOzenvRCb/ASn7WtyWyEGnBvYUs9S+Qr3gUD84NOra0u72/0QJfjsok0PoINfvT/K
         hpfGV9Xzmze0+zcPiNMmNha4hT35cVvOsjXDtQvAFo9E+Umys36iuv5yGtJPMGsFyLm0
         lO9w==
X-Forwarded-Encrypted: i=1; AJvYcCWvPdbMC1QeLY7jd8oL+1F7yXlz8/BDzDeraBybgIsdfVtuRJVKvQZ59M6IOlWoJzl9CvroX3X6ZLHG0qKweqZo@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8ypGuKV5F0krEQvrq4n/6p2MeweVSPXktzz+8ANk3U6pWZpBW
	Y04rgjPN52fRgpDXZwytt7cKwhQX79C7rvor8C7691LHPtDn8nOYPevHxxLl/vEpbrgaQ/4hnmm
	Ey9UQSfflIw==
X-Google-Smtp-Source: AGHT+IE8zSOvadgYlQu/oyCrvtp7QB6KNjjif3fcyBgRNu+AsyTgZxEHuVmvUAgeCaCC/YUaZxC98HiuTjTEZA==
X-Received: from wmgg15.prod.google.com ([2002:a05:600d:f:b0:434:feb1:add1])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3109:b0:434:fafe:edb with SMTP id 5b1f17b1804b1-4361c3e22e7mr61901735e9.24.1734026800793;
 Thu, 12 Dec 2024 10:06:40 -0800 (PST)
Date: Thu, 12 Dec 2024 18:04:20 +0000
In-Reply-To: <20241212180423.1578358-1-smostafa@google.com>
Mime-Version: 1.0
References: <20241212180423.1578358-1-smostafa@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241212180423.1578358-57-smostafa@google.com>
Subject: [RFC PATCH v2 56/58] KVM: arm64: iommu: Add hypercall for map_sg
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
X-CRM114-CacheID: sfid-20241212_100642_337977_1457836A 
X-CRM114-Status: GOOD (  18.07  )
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

Add a new type struct kvm_iommu_sg, that describes a simple sglist,
and a hypercall that can consume it while calling the map_pages ops.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/include/asm/kvm_asm.h        |  1 +
 arch/arm64/include/asm/kvm_host.h       | 19 ++++++++
 arch/arm64/kvm/hyp/include/nvhe/iommu.h |  2 +
 arch/arm64/kvm/hyp/nvhe/hyp-main.c      | 14 ++++++
 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c   | 58 +++++++++++++++++++++++++
 arch/arm64/kvm/iommu.c                  | 32 ++++++++++++++
 6 files changed, 126 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
index 3dbf30cd10f3..f2b86d1a62ed 100644
--- a/arch/arm64/include/asm/kvm_asm.h
+++ b/arch/arm64/include/asm/kvm_asm.h
@@ -115,6 +115,7 @@ enum __kvm_host_smccc_func {
 	__KVM_HOST_SMCCC_FUNC___pkvm_host_iommu_unmap_pages,
 	__KVM_HOST_SMCCC_FUNC___pkvm_host_iommu_iova_to_phys,
 	__KVM_HOST_SMCCC_FUNC___pkvm_host_hvc_pd,
+	__KVM_HOST_SMCCC_FUNC___pkvm_host_iommu_map_sg,
 
 	/*
 	 * Start of the dynamically registered hypercalls. Start a bit
diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 3cdc99ebdd0d..704648619d28 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1655,4 +1655,23 @@ int kvm_iommu_register_driver(struct kvm_iommu_driver *kern_ops,
 int kvm_iommu_init_driver(void);
 void kvm_iommu_remove_driver(void);
 
+struct kvm_iommu_sg {
+	phys_addr_t phys;
+	size_t pgsize;
+	unsigned int pgcount;
+};
+
+static inline struct kvm_iommu_sg *kvm_iommu_sg_alloc(unsigned int nents, gfp_t gfp)
+{
+	return alloc_pages_exact(PAGE_ALIGN(nents * sizeof(struct kvm_iommu_sg)), gfp);
+}
+
+static inline void kvm_iommu_sg_free(struct kvm_iommu_sg *sg, unsigned int nents)
+{
+	free_pages_exact(sg, PAGE_ALIGN(nents * sizeof(struct kvm_iommu_sg)));
+}
+
+int kvm_iommu_share_hyp_sg(struct kvm_iommu_sg *sg, unsigned int nents);
+int kvm_iommu_unshare_hyp_sg(struct kvm_iommu_sg *sg, unsigned int nents);
+
 #endif /* __ARM64_KVM_HOST_H__ */
diff --git a/arch/arm64/kvm/hyp/include/nvhe/iommu.h b/arch/arm64/kvm/hyp/include/nvhe/iommu.h
index cff75d67d807..1004465b680a 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/iommu.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/iommu.h
@@ -22,6 +22,8 @@ size_t kvm_iommu_unmap_pages(pkvm_handle_t domain_id, unsigned long iova,
 			     size_t pgsize, size_t pgcount);
 phys_addr_t kvm_iommu_iova_to_phys(pkvm_handle_t domain_id, unsigned long iova);
 bool kvm_iommu_host_dabt_handler(struct kvm_cpu_context *host_ctxt, u64 esr, u64 addr);
+size_t kvm_iommu_map_sg(pkvm_handle_t domain, unsigned long iova, struct kvm_iommu_sg *sg,
+			unsigned int nent, unsigned int prot);
 
 /* Flags for memory allocation for IOMMU drivers */
 #define IOMMU_PAGE_NOCACHE				BIT(0)
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 1ab8e5507825..5659aae0c758 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -1682,6 +1682,19 @@ static void handle___pkvm_host_hvc_pd(struct kvm_cpu_context *host_ctxt)
 	cpu_reg(host_ctxt, 1) = pkvm_host_hvc_pd(device_id, on);
 }
 
+static void handle___pkvm_host_iommu_map_sg(struct kvm_cpu_context *host_ctxt)
+{
+	unsigned long ret;
+	DECLARE_REG(pkvm_handle_t, domain, host_ctxt, 1);
+	DECLARE_REG(unsigned long, iova, host_ctxt, 2);
+	DECLARE_REG(struct kvm_iommu_sg *, sg, host_ctxt, 3);
+	DECLARE_REG(unsigned int, nent, host_ctxt, 4);
+	DECLARE_REG(unsigned int, prot, host_ctxt, 5);
+
+	ret = kvm_iommu_map_sg(domain, iova, kern_hyp_va(sg), nent, prot);
+	hyp_reqs_smccc_encode(ret, host_ctxt, this_cpu_ptr(&host_hyp_reqs));
+}
+
 typedef void (*hcall_t)(struct kvm_cpu_context *);
 
 #define HANDLE_FUNC(x)	[__KVM_HOST_SMCCC_FUNC_##x] = (hcall_t)handle_##x
@@ -1747,6 +1760,7 @@ static const hcall_t host_hcall[] = {
 	HANDLE_FUNC(__pkvm_host_iommu_unmap_pages),
 	HANDLE_FUNC(__pkvm_host_iommu_iova_to_phys),
 	HANDLE_FUNC(__pkvm_host_hvc_pd),
+	HANDLE_FUNC(__pkvm_host_iommu_map_sg),
 };
 
 static void handle_host_hcall(struct kvm_cpu_context *host_ctxt)
diff --git a/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c b/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c
index e45dadd0c4aa..b0c9b9086fd1 100644
--- a/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c
+++ b/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c
@@ -392,6 +392,64 @@ bool kvm_iommu_host_dabt_handler(struct kvm_cpu_context *host_ctxt, u64 esr, u64
 	return ret;
 }
 
+size_t kvm_iommu_map_sg(pkvm_handle_t domain_id, unsigned long iova, struct kvm_iommu_sg *sg,
+			unsigned int nent, unsigned int prot)
+{
+	int ret;
+	size_t total_mapped = 0, mapped;
+	struct kvm_hyp_iommu_domain *domain;
+	phys_addr_t phys;
+	size_t size, pgsize, pgcount;
+	unsigned int orig_nent = nent;
+	struct kvm_iommu_sg *orig_sg = sg;
+
+	if (!kvm_iommu_ops || !kvm_iommu_ops->map_pages)
+		return 0;
+
+	if (prot & ~IOMMU_PROT_MASK)
+		return 0;
+
+	domain = handle_to_domain(domain_id);
+	if (!domain || domain_get(domain))
+		return 0;
+
+	ret = hyp_pin_shared_mem(sg, sg + nent);
+	if (ret)
+		goto out_put_domain;
+
+	while (nent--) {
+		phys = sg->phys;
+		pgsize = sg->pgsize;
+		pgcount = sg->pgcount;
+
+		if (__builtin_mul_overflow(pgsize, pgcount, &size) ||
+		    iova + size < iova)
+			goto out_unpin_sg;
+
+		ret = __pkvm_host_use_dma(phys, size);
+		if (ret)
+			goto out_unpin_sg;
+
+		mapped = 0;
+		kvm_iommu_ops->map_pages(domain, iova, phys, pgsize, pgcount, prot, &mapped);
+		total_mapped += mapped;
+		phys += mapped;
+		iova += mapped;
+		/* Might need memory */
+		if (mapped != size) {
+			__pkvm_host_unuse_dma(phys, size - mapped);
+			break;
+		}
+		sg++;
+	}
+
+out_unpin_sg:
+	hyp_unpin_shared_mem(orig_sg, orig_sg + orig_nent);
+out_put_domain:
+	domain_put(domain);
+	return total_mapped;
+}
+
 static int iommu_power_on(struct kvm_power_domain *pd)
 {
 	struct kvm_hyp_iommu *iommu = container_of(pd, struct kvm_hyp_iommu,
diff --git a/arch/arm64/kvm/iommu.c b/arch/arm64/kvm/iommu.c
index af3417e6259d..99718af0cba6 100644
--- a/arch/arm64/kvm/iommu.c
+++ b/arch/arm64/kvm/iommu.c
@@ -55,3 +55,35 @@ void kvm_iommu_remove_driver(void)
 	if (smp_load_acquire(&iommu_driver))
 		iommu_driver->remove_driver();
 }
+
+int kvm_iommu_share_hyp_sg(struct kvm_iommu_sg *sg, unsigned int nents)
+{
+	size_t nr_pages = PAGE_ALIGN(sizeof(*sg) * nents) >> PAGE_SHIFT;
+	phys_addr_t sg_pfn = virt_to_phys(sg) >> PAGE_SHIFT;
+	int i;
+	int ret;
+
+	for (i = 0 ; i < nr_pages ; ++i) {
+		ret = kvm_call_hyp_nvhe(__pkvm_host_share_hyp, sg_pfn + i);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+int kvm_iommu_unshare_hyp_sg(struct kvm_iommu_sg *sg, unsigned int nents)
+{
+	size_t nr_pages = PAGE_ALIGN(sizeof(*sg) * nents) >> PAGE_SHIFT;
+	phys_addr_t sg_pfn = virt_to_phys(sg) >> PAGE_SHIFT;
+	int i;
+	int ret;
+
+	for (i = 0 ; i < nr_pages ; ++i) {
+		ret = kvm_call_hyp_nvhe(__pkvm_host_unshare_hyp, sg_pfn + i);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
-- 
2.47.0.338.g60cca15819-goog


