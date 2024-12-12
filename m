Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A40BE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 18:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=is6Al2H2AiqMxaqLQL7gdzUm7OUxIBSFMLQ1Q2t4888=; b=vk/0ZuSpxybtG/6664Q/ZVoxiK
	CtnHRwMtWu0m5pCIFd3XYR6FLKWfbvmGdizJgHIhiowrAuds5bleNlwXygGnHPRlkqFcpQpF8ebNs
	Q6aApjSf9i6hITkd1xjTZJRJlmWqtqMmBkdVn3lI5E/SRZ5iVTSFRwUGpzqIGi72EPeAUTxyILTI9
	xXOcew9QCQqtzb5z/MiPY1fua3RJ2E/p+79s+n1R4zRj/gjYMGd/TbmJTiXrhLrqkUsqpU2haMSqx
	LM2JECVnN+Gwja9UVmuzG8PbUDVum4NnbLeqSw/gH0cqT6UFBIt0dDl3C+tNQFRWnQU9f1mnvNBr9
	ijJb7r2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLnpI-00000001Ouo-0MyO;
	Thu, 12 Dec 2024 18:22:16 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLnYq-00000001JfH-3NmT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 18:05:18 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-436228ebc5eso5624165e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 10:05:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734026715; x=1734631515; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=is6Al2H2AiqMxaqLQL7gdzUm7OUxIBSFMLQ1Q2t4888=;
        b=FmQkS8zUWBGrmUhubTFoiewySzgNGLznhabGWVRcClQWPQH2xKoevdvGJ6GfVeUhf+
         h8WuWMHKZy65I1mwnraFbNkpW2AvOrrmc6UPf0qV+qBFrkd/kOaoXXn7j+xzYkPr1ZxF
         r+u1CkUcDWkoUlSjQcxeUJJomF4if52EbIiuLhq0sR6N03Zx74DGIdijMhAQxaK0dJmv
         PKkOZCz2xU6/da/xDROzqjbzHzCK8IWDN+4yRPWbbDY6igP0dt4phR5F/lZO0KYJcxs9
         lzoKGOf9mvwWYkavrLLV5CSDtqpcIIOO6ZjdI/bUd03X5D6Ak0k34Cy+3hvjMITJ7Un7
         tL1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734026715; x=1734631515;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=is6Al2H2AiqMxaqLQL7gdzUm7OUxIBSFMLQ1Q2t4888=;
        b=kaMpn+Rfk6AL4mRrWeIs1JQ9L9aXw9mh/uF4X/Dd4tYlS9yWXVCvzVC3CrIQks+PCO
         tTEvHN/Tc38QbWYkN4fOreAeKCFTAd6/HHA8iATS44WSMyuIV/VTSmN8+fwEKqI1Uxzb
         bDPDCtMAnHACYxyAsOl//zTApq1UD3NBUkpr/WzKBikIitX6SgdkLGUoRqPfJ82weL50
         yj4vzSQPiMh8CyOL6rdkG1gFhkR5WCLglZC/y/ox9MtVk6n3VDm7CgCpUrkelQhQFfEe
         Gbqju0IdAgsld9C1F+MiPbKgNPXmIyCcqsUTX1lei7kdz2Wb3PctbFq0eUYB6jcSdig5
         5DBw==
X-Forwarded-Encrypted: i=1; AJvYcCVNLlHH1WkqSHawku5+n3GITOu3609yaUq8sxT/BH9TTmQGtHFZLMrcQbQYyh/sA2+lFwb0wc9pGBx6Us4sanjD@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6RDXMylNShe5o6B5wdyPfSKwCCvyM8OAkmWOlvWGjZUvxGhK5
	isZv5uFIg4EX21k4peEs5SSaYhjYxPkwOKxFYHA86i7r+erOQnooEY+hzn2cKJHMwTcmwStsL8V
	MbsQReevs+Q==
X-Google-Smtp-Source: AGHT+IHgLyGmzSPkmfPVAl03VtCFCec89plA2sOh31ATkaIn3otdhgvEhbA1+34qV92LIfAmgGb4yfu9wRTYfQ==
X-Received: from wmso20.prod.google.com ([2002:a05:600c:5114:b0:436:1abf:b8fe])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:350c:b0:434:ff9d:a370 with SMTP id 5b1f17b1804b1-4361c2b5351mr69806205e9.0.1734026715242;
 Thu, 12 Dec 2024 10:05:15 -0800 (PST)
Date: Thu, 12 Dec 2024 18:03:39 +0000
In-Reply-To: <20241212180423.1578358-1-smostafa@google.com>
Mime-Version: 1.0
References: <20241212180423.1578358-1-smostafa@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241212180423.1578358-16-smostafa@google.com>
Subject: [RFC PATCH v2 15/58] KVM: arm64: iommu: Add a memory pool for the IOMMU
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
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_100516_847773_887E5FAB 
X-CRM114-Status: GOOD (  25.38  )
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

This patch defines a new hypervisor allocator which is an instance of
the hyp buddy allocator.
This allocator would be used from the IOMMU drivers to be used for
the page tables, generally these pages have 2 properties:
- Can be multi order
- Can be non-coherent

The interface provide functions and wrappers for those types of
allocations.

The IOMMU hypervisor will leverage the allocator interface which
provides a standardized interface that can be called from the kernel
part of the IOMMU driver to top up the allocator, and can be
reclaimed through the shrinker for pKVM.

Also, the allocation function would automatically create a request
when it fails to allocate memory from the pool, so it=E2=80=99s sufficient
for the driver to return an error code and the kernel part of the
driver should check the requests in the return and fill the
hypervisor allocator.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/include/asm/kvm_host.h       |  1 +
 arch/arm64/kvm/hyp/include/nvhe/iommu.h | 13 ++++
 arch/arm64/kvm/hyp/include/nvhe/mm.h    |  1 +
 arch/arm64/kvm/hyp/nvhe/alloc_mgt.c     |  2 +
 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c   | 86 +++++++++++++++++++++++++
 arch/arm64/kvm/hyp/nvhe/mm.c            | 17 +++++
 6 files changed, 120 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm=
_host.h
index 54416cfea573..a3b5d8dd8995 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1625,6 +1625,7 @@ void kvm_set_vm_id_reg(struct kvm *kvm, u32 reg, u64 =
val);
=20
 /* Allocator interface IDs. */
 #define HYP_ALLOC_MGT_HEAP_ID		0
+#define HYP_ALLOC_MGT_IOMMU_ID		1
=20
 unsigned long __pkvm_reclaim_hyp_alloc_mgt(unsigned long nr_pages);
=20
diff --git a/arch/arm64/kvm/hyp/include/nvhe/iommu.h b/arch/arm64/kvm/hyp/i=
nclude/nvhe/iommu.h
index 908863f07b0b..5f91605cd48a 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/iommu.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/iommu.h
@@ -4,6 +4,8 @@
=20
 #include <asm/kvm_host.h>
=20
+#include <nvhe/alloc_mgt.h>
+
 /* Hypercall handlers */
 int kvm_iommu_alloc_domain(pkvm_handle_t domain_id, int type);
 int kvm_iommu_free_domain(pkvm_handle_t domain_id);
@@ -18,10 +20,21 @@ size_t kvm_iommu_unmap_pages(pkvm_handle_t domain_id, u=
nsigned long iova,
 			     size_t pgsize, size_t pgcount);
 phys_addr_t kvm_iommu_iova_to_phys(pkvm_handle_t domain_id, unsigned long =
iova);
=20
+/* Flags for memory allocation for IOMMU drivers */
+#define IOMMU_PAGE_NOCACHE				BIT(0)
+void *kvm_iommu_donate_pages(u8 order, int flags);
+void kvm_iommu_reclaim_pages(void *p, u8 order);
+
+#define kvm_iommu_donate_page()		kvm_iommu_donate_pages(0, 0)
+#define kvm_iommu_donate_page_nc()	kvm_iommu_donate_pages(0, IOMMU_PAGE_NO=
CACHE)
+#define kvm_iommu_reclaim_page(p)	kvm_iommu_reclaim_pages(p, 0)
+
 struct kvm_iommu_ops {
 	int (*init)(void);
 };
=20
 int kvm_iommu_init(void);
=20
+extern struct hyp_mgt_allocator_ops kvm_iommu_allocator_ops;
+
 #endif /* __ARM64_KVM_NVHE_IOMMU_H__ */
diff --git a/arch/arm64/kvm/hyp/include/nvhe/mm.h b/arch/arm64/kvm/hyp/incl=
ude/nvhe/mm.h
index 5d33aca7d686..7b425f811efb 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mm.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mm.h
@@ -37,6 +37,7 @@ int __hyp_allocator_map(unsigned long start, phys_addr_t =
phys);
 int __pkvm_map_module_page(u64 pfn, void *va, enum kvm_pgtable_prot prot, =
bool is_protected);
 void __pkvm_unmap_module_page(u64 pfn, void *va);
 void *__pkvm_alloc_module_va(u64 nr_pages);
+int pkvm_remap_range(void *va, int nr_pages, bool nc);
 #ifdef CONFIG_NVHE_EL2_DEBUG
 void assert_in_mod_range(unsigned long addr);
 #else
diff --git a/arch/arm64/kvm/hyp/nvhe/alloc_mgt.c b/arch/arm64/kvm/hyp/nvhe/=
alloc_mgt.c
index 4a0f33b9820a..cfd903b30427 100644
--- a/arch/arm64/kvm/hyp/nvhe/alloc_mgt.c
+++ b/arch/arm64/kvm/hyp/nvhe/alloc_mgt.c
@@ -7,9 +7,11 @@
=20
 #include <nvhe/alloc.h>
 #include <nvhe/alloc_mgt.h>
+#include <nvhe/iommu.h>
=20
 static struct hyp_mgt_allocator_ops *registered_allocators[] =3D {
 	[HYP_ALLOC_MGT_HEAP_ID] =3D &hyp_alloc_ops,
+	[HYP_ALLOC_MGT_IOMMU_ID] =3D &kvm_iommu_allocator_ops,
 };
=20
 #define MAX_ALLOC_ID		(ARRAY_SIZE(registered_allocators))
diff --git a/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c b/arch/arm64/kvm/hyp/nvh=
e/iommu/iommu.c
index 9022fd612a49..af6ae9b4dc51 100644
--- a/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c
+++ b/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c
@@ -5,15 +5,101 @@
  * Copyright (C) 2022 Linaro Ltd.
  */
 #include <nvhe/iommu.h>
+#include <nvhe/mem_protect.h>
+#include <nvhe/mm.h>
=20
 /* Only one set of ops supported, similary to the kernel */
 struct kvm_iommu_ops *kvm_iommu_ops;
=20
+/*
+ * Common pool that can be used by IOMMU driver to allocate pages.
+ */
+static struct hyp_pool iommu_host_pool;
+
+DECLARE_PER_CPU(struct kvm_hyp_req, host_hyp_reqs);
+
+static int kvm_iommu_refill(struct kvm_hyp_memcache *host_mc)
+{
+	if (!kvm_iommu_ops)
+		return -EINVAL;
+
+	return refill_hyp_pool(&iommu_host_pool, host_mc);
+}
+
+static void kvm_iommu_reclaim(struct kvm_hyp_memcache *host_mc, int target=
)
+{
+	if (!kvm_iommu_ops)
+		return;
+
+	reclaim_hyp_pool(&iommu_host_pool, host_mc, target);
+}
+
+static int kvm_iommu_reclaimable(void)
+{
+	if (!kvm_iommu_ops)
+		return 0;
+
+	return hyp_pool_free_pages(&iommu_host_pool);
+}
+
+struct hyp_mgt_allocator_ops kvm_iommu_allocator_ops =3D {
+	.refill =3D kvm_iommu_refill,
+	.reclaim =3D kvm_iommu_reclaim,
+	.reclaimable =3D kvm_iommu_reclaimable,
+};
+
+void *kvm_iommu_donate_pages(u8 order, int flags)
+{
+	void *p;
+	struct kvm_hyp_req *req =3D this_cpu_ptr(&host_hyp_reqs);
+	int ret;
+
+	p =3D hyp_alloc_pages(&iommu_host_pool, order);
+	if (p) {
+		/*
+		 * If page request is non-cacheable remap it as such
+		 * as all pages in the pool are mapped before hand and
+		 * assumed to be cacheable.
+		 */
+		if (flags & IOMMU_PAGE_NOCACHE) {
+			ret =3D pkvm_remap_range(p, 1 << order, true);
+			if (ret) {
+				hyp_put_page(&iommu_host_pool, p);
+				return NULL;
+			}
+		}
+		return p;
+	}
+
+	req->type =3D KVM_HYP_REQ_TYPE_MEM;
+	req->mem.dest =3D REQ_MEM_DEST_HYP_IOMMU;
+	req->mem.sz_alloc =3D (1 << order) * PAGE_SIZE;
+	req->mem.nr_pages =3D 1;
+	return NULL;
+}
+
+void kvm_iommu_reclaim_pages(void *p, u8 order)
+{
+	/*
+	 * Remap all pages to cacheable, as we don't know, may be use a flag
+	 * in the vmemmap or trust the driver to pass the cacheability same
+	 * as the allocation on free?
+	 */
+	pkvm_remap_range(p, 1 << order, false);
+	hyp_put_page(&iommu_host_pool, p);
+}
+
 int kvm_iommu_init(void)
 {
+	int ret;
+
 	if (!kvm_iommu_ops || !kvm_iommu_ops->init)
 		return -ENODEV;
=20
+	ret =3D hyp_pool_init_empty(&iommu_host_pool, 64);
+	if (ret)
+		return ret;
+
 	return kvm_iommu_ops->init();
 }
=20
diff --git a/arch/arm64/kvm/hyp/nvhe/mm.c b/arch/arm64/kvm/hyp/nvhe/mm.c
index 76bbb4c9012e..7a18b31538ae 100644
--- a/arch/arm64/kvm/hyp/nvhe/mm.c
+++ b/arch/arm64/kvm/hyp/nvhe/mm.c
@@ -564,3 +564,20 @@ int reclaim_hyp_pool(struct hyp_pool *pool, struct kvm=
_hyp_memcache *host_mc,
=20
 	return 0;
 }
+
+/* Remap hyp memory with different cacheability */
+int pkvm_remap_range(void *va, int nr_pages, bool nc)
+{
+	size_t size =3D nr_pages << PAGE_SHIFT;
+	phys_addr_t phys =3D hyp_virt_to_phys(va);
+	enum kvm_pgtable_prot prot =3D PKVM_HOST_MEM_PROT;
+	int ret;
+
+	if (nc)
+		prot |=3D KVM_PGTABLE_PROT_NORMAL_NC;
+	hyp_spin_lock(&pkvm_pgd_lock);
+	WARN_ON(kvm_pgtable_hyp_unmap(&pkvm_pgtable, (u64)va, size) !=3D size);
+	ret =3D kvm_pgtable_hyp_map(&pkvm_pgtable, (u64)va, size, phys, prot);
+	hyp_spin_unlock(&pkvm_pgd_lock);
+	return ret;
+}
--=20
2.47.0.338.g60cca15819-goog


