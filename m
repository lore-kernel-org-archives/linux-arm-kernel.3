Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2293CE77182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 18:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ke5HF+07C19gyf64zaMrtB1MJ91CLJx66lSBSZ4+t8c=; b=4JfNjvDO2mHvqh1Sqt5CEhRk2H
	huJkIvSCes3gA6MAUzpQ4xkrbNvCW6dpDlgfX53qE6ukIDRJsK7YL8Olj85Y3qBITi9Gs2jGhQwFm
	g/+mc+cf7XczbdbnJBOeKt52sH+BU6O4D/iaENTTlx0WHiGFRSC1BkNiHlHmDCwMBOuxthAkMWA+H
	T9BhquD7sgn9m12xfl3dgTNbXsPdrTMOjRGzvOPCsW76flv+TDh5wCWl8Tk9j2tttvINNlBnHDMI1
	huz807XPNVNjlqc+RSz83dBDphKF+J9lDYf7QzEq3kQuN81Sqe555jlMHZA4a4Ces735PFT5YfqtR
	E+gY8G/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLnqL-00000001PCX-36ST;
	Thu, 12 Dec 2024 18:23:21 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLnYs-00000001Jg1-3l0Q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 18:05:20 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-3862b364578so1090103f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 10:05:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734026717; x=1734631517; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ke5HF+07C19gyf64zaMrtB1MJ91CLJx66lSBSZ4+t8c=;
        b=C6Z3lBR8YIPjaBb1+eGBALeoG8bCePpq8n3r0hpon9LzbCDUdwW31N5DlSGXhF9KqI
         Iy/Eno/txZuWXwxbrlImZLZivlAF48rieGvWW+u+a97WJZROUM/QU1uq4pJx90uPwGpo
         iFjQ3C934CjLiZ4iFum8x1RzDN918K2TXOGdXZVJfbYl0bFpg9qfINoJqMIqLwrEKWfc
         w82SKOEzKxU4Fz8f2DqAjHYKRwsJWUG4F/H6Inw7RnAl0LKRmuTZCJhR60cuFG+2HYwj
         /bNkVC59Ysk/AakTYhXudZq0MEcfRE61GO616tj4ai6N5It8LCXz2E/wWrjVombqTDUu
         jO3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734026717; x=1734631517;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ke5HF+07C19gyf64zaMrtB1MJ91CLJx66lSBSZ4+t8c=;
        b=cjEk/5GoOBJiB3+KbVvHBKOkxpEavA9AG1tl5j7G2jnf0Xjlp2dVvFwU46jpqYn+AW
         vwz/t8qX7QnnLsvXagE0P8hBb/73JpDu7zAwGHRuyK3kcNN9f6ftorAGPdYsSs5sj90l
         sPPMa/VhEvQtkv8Z7rtX+0L0Y11Kro7uCxfrlW/nCzP80KA8efjx8ZhI+zNI1qGChcGT
         o61HGJM4JuWHsm9FuFJQHEHjUAIxd5FdOh879f1p09HcZRb8tN+q4akyjc+tmDLzn39Y
         V04B9v4rHXICjwgU6CTrepLQuqFhstNl1Y3rfompNWv+oR5+GrvfRTK62DAfk0FJOlSm
         mcQw==
X-Forwarded-Encrypted: i=1; AJvYcCUJxenbREtwTe3hrvBY9oJUD1KI7aTmmJ1wZr2x7raPjyeq9+QXFs9/7FHsDrHio3BiLNNQ/7HH2R8cw6QEoL/9@lists.infradead.org
X-Gm-Message-State: AOJu0YxrHFNP7oO6unrYNwAF0hr3t5ACT7rOkF8z36kVWsEJ4yAYrL82
	nlHgvhIDUdm5u2aR7sN0X9CIG2lJ56tqjU9LRAhIfjjrcxF3dXb1LCKcRrVSbOEtQGRwYaNBUwk
	wahut9A7JXw==
X-Google-Smtp-Source: AGHT+IF+toprrwxOBtfU6Qu/y99TnI5qbHVjvJgvBhzHP1r3wGKXRWAe497Prx6Jb15z54DCzP6NFkkS78Yvng==
X-Received: from wmnm21.prod.google.com ([2002:a05:600c:1615:b0:436:1923:6cf5])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:1fa2:b0:386:3213:5b80 with SMTP id ffacd0b85a97d-3878886283cmr3258934f8f.24.1734026717185;
 Thu, 12 Dec 2024 10:05:17 -0800 (PST)
Date: Thu, 12 Dec 2024 18:03:40 +0000
In-Reply-To: <20241212180423.1578358-1-smostafa@google.com>
Mime-Version: 1.0
References: <20241212180423.1578358-1-smostafa@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241212180423.1578358-17-smostafa@google.com>
Subject: [RFC PATCH v2 16/58] KVM: arm64: iommu: Add domains
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
X-CRM114-CacheID: sfid-20241212_100518_938336_0BBCDF4C 
X-CRM114-Status: GOOD (  30.02  )
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

The IOMMU domain abstraction allows to share the same page tables
between multiple devices. That may be necessary due to hardware
constraints, if multiple devices cannot be isolated by the IOMMU
(conventional PCI bus for example). It may also help with optimizing
resource or TLB use. For pKVM in particular, it may be useful to reduce
the amount of memory required for page tables. All devices owned by the
host kernel could be attached to the same domain (though that requires
host changes).

There is one shared domain space with all IOMMUs holding up to 2^16
domains.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/kvm/hyp/hyp-constants.c      |   1 +
 arch/arm64/kvm/hyp/include/nvhe/iommu.h |   4 +
 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c   | 102 +++++++++++++++++++++++-
 arch/arm64/kvm/iommu.c                  |  10 +++
 include/kvm/iommu.h                     |  48 +++++++++++
 5 files changed, 161 insertions(+), 4 deletions(-)
 create mode 100644 include/kvm/iommu.h

diff --git a/arch/arm64/kvm/hyp/hyp-constants.c b/arch/arm64/kvm/hyp/hyp-constants.c
index 5fb26cabd606..96a6b45b424a 100644
--- a/arch/arm64/kvm/hyp/hyp-constants.c
+++ b/arch/arm64/kvm/hyp/hyp-constants.c
@@ -8,5 +8,6 @@
 int main(void)
 {
 	DEFINE(STRUCT_HYP_PAGE_SIZE,	sizeof(struct hyp_page));
+	DEFINE(HYP_SPINLOCK_SIZE,       sizeof(hyp_spinlock_t));
 	return 0;
 }
diff --git a/arch/arm64/kvm/hyp/include/nvhe/iommu.h b/arch/arm64/kvm/hyp/include/nvhe/iommu.h
index 5f91605cd48a..8f619f415d1f 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/iommu.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/iommu.h
@@ -4,6 +4,8 @@
 
 #include <asm/kvm_host.h>
 
+#include <kvm/iommu.h>
+
 #include <nvhe/alloc_mgt.h>
 
 /* Hypercall handlers */
@@ -31,6 +33,8 @@ void kvm_iommu_reclaim_pages(void *p, u8 order);
 
 struct kvm_iommu_ops {
 	int (*init)(void);
+	int (*alloc_domain)(struct kvm_hyp_iommu_domain *domain, int type);
+	void (*free_domain)(struct kvm_hyp_iommu_domain *domain);
 };
 
 int kvm_iommu_init(void);
diff --git a/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c b/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c
index af6ae9b4dc51..ba2aed52a74f 100644
--- a/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c
+++ b/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c
@@ -4,12 +4,15 @@
  *
  * Copyright (C) 2022 Linaro Ltd.
  */
+#include <kvm/iommu.h>
+
 #include <nvhe/iommu.h>
 #include <nvhe/mem_protect.h>
 #include <nvhe/mm.h>
 
 /* Only one set of ops supported, similary to the kernel */
 struct kvm_iommu_ops *kvm_iommu_ops;
+void **kvm_hyp_iommu_domains;
 
 /*
  * Common pool that can be used by IOMMU driver to allocate pages.
@@ -18,6 +21,9 @@ static struct hyp_pool iommu_host_pool;
 
 DECLARE_PER_CPU(struct kvm_hyp_req, host_hyp_reqs);
 
+/* Protects domains in kvm_hyp_iommu_domains */
+static DEFINE_HYP_SPINLOCK(kvm_iommu_domain_lock);
+
 static int kvm_iommu_refill(struct kvm_hyp_memcache *host_mc)
 {
 	if (!kvm_iommu_ops)
@@ -89,28 +95,116 @@ void kvm_iommu_reclaim_pages(void *p, u8 order)
 	hyp_put_page(&iommu_host_pool, p);
 }
 
+static struct kvm_hyp_iommu_domain *
+handle_to_domain(pkvm_handle_t domain_id)
+{
+	int idx;
+	struct kvm_hyp_iommu_domain *domains;
+
+	if (domain_id >= KVM_IOMMU_MAX_DOMAINS)
+		return NULL;
+	domain_id = array_index_nospec(domain_id, KVM_IOMMU_MAX_DOMAINS);
+
+	idx = domain_id / KVM_IOMMU_DOMAINS_PER_PAGE;
+	domains = (struct kvm_hyp_iommu_domain *)READ_ONCE(kvm_hyp_iommu_domains[idx]);
+	if (!domains) {
+		domains = kvm_iommu_donate_page();
+		if (!domains)
+			return NULL;
+		/*
+		 * handle_to_domain() does not have to be called under a lock,
+		 * but even though we allocate a leaf in all cases, it's only
+		 * really a valid thing to do under alloc_domain(), which uses a
+		 * lock. Races are therefore a host bug and we don't need to be
+		 * delicate about it.
+		 */
+		if (WARN_ON(cmpxchg64_relaxed(&kvm_hyp_iommu_domains[idx], 0,
+					      (void *)domains) != 0)) {
+			kvm_iommu_reclaim_page(domains);
+			return NULL;
+		}
+	}
+	return &domains[domain_id % KVM_IOMMU_DOMAINS_PER_PAGE];
+}
+
 int kvm_iommu_init(void)
 {
 	int ret;
+	u64 domain_root_pfn = __hyp_pa(kvm_hyp_iommu_domains) >> PAGE_SHIFT;
 
-	if (!kvm_iommu_ops || !kvm_iommu_ops->init)
+	if (!kvm_iommu_ops ||
+	    !kvm_iommu_ops->init ||
+	    !kvm_iommu_ops->alloc_domain ||
+	    !kvm_iommu_ops->free_domain)
 		return -ENODEV;
 
 	ret = hyp_pool_init_empty(&iommu_host_pool, 64);
 	if (ret)
 		return ret;
 
-	return kvm_iommu_ops->init();
+	ret = __pkvm_host_donate_hyp(domain_root_pfn,
+				     KVM_IOMMU_DOMAINS_ROOT_ORDER_NR);
+	if (ret)
+		return ret;
+
+	ret = kvm_iommu_ops->init();
+	if (ret)
+		goto out_reclaim_domain;
+
+	return ret;
+
+out_reclaim_domain:
+	__pkvm_hyp_donate_host(domain_root_pfn, KVM_IOMMU_DOMAINS_ROOT_ORDER_NR);
+	return ret;
 }
 
 int kvm_iommu_alloc_domain(pkvm_handle_t domain_id, int type)
 {
-	return -ENODEV;
+	int ret = -EINVAL;
+	struct kvm_hyp_iommu_domain *domain;
+
+	domain = handle_to_domain(domain_id);
+	if (!domain)
+		return -ENOMEM;
+
+	hyp_spin_lock(&kvm_iommu_domain_lock);
+	if (atomic_read(&domain->refs))
+		goto out_unlock;
+
+	domain->domain_id = domain_id;
+	ret = kvm_iommu_ops->alloc_domain(domain, type);
+	if (ret)
+		goto out_unlock;
+
+	atomic_set_release(&domain->refs, 1);
+out_unlock:
+	hyp_spin_unlock(&kvm_iommu_domain_lock);
+	return ret;
 }
 
 int kvm_iommu_free_domain(pkvm_handle_t domain_id)
 {
-	return -ENODEV;
+	int ret = 0;
+	struct kvm_hyp_iommu_domain *domain;
+
+	domain = handle_to_domain(domain_id);
+	if (!domain)
+		return -EINVAL;
+
+	hyp_spin_lock(&kvm_iommu_domain_lock);
+	if (WARN_ON(atomic_cmpxchg_acquire(&domain->refs, 1, 0) != 1)) {
+		ret = -EINVAL;
+		goto out_unlock;
+	}
+
+	kvm_iommu_ops->free_domain(domain);
+
+	memset(domain, 0, sizeof(*domain));
+
+out_unlock:
+	hyp_spin_unlock(&kvm_iommu_domain_lock);
+
+	return ret;
 }
 
 int kvm_iommu_attach_dev(pkvm_handle_t iommu_id, pkvm_handle_t domain_id,
diff --git a/arch/arm64/kvm/iommu.c b/arch/arm64/kvm/iommu.c
index ed77ea0d12bb..af3417e6259d 100644
--- a/arch/arm64/kvm/iommu.c
+++ b/arch/arm64/kvm/iommu.c
@@ -5,6 +5,9 @@
  */
 
 #include <asm/kvm_mmu.h>
+
+#include <kvm/iommu.h>
+
 #include <linux/kvm_host.h>
 
 struct kvm_iommu_driver *iommu_driver;
@@ -37,6 +40,13 @@ int kvm_iommu_init_driver(void)
 		return -ENODEV;
 	}
 
+	kvm_hyp_iommu_domains = (void *)__get_free_pages(GFP_KERNEL | __GFP_ZERO,
+				get_order(KVM_IOMMU_DOMAINS_ROOT_SIZE));
+	if (!kvm_hyp_iommu_domains)
+		return -ENOMEM;
+
+	kvm_hyp_iommu_domains = kern_hyp_va(kvm_hyp_iommu_domains);
+
 	return iommu_driver->init_driver();
 }
 
diff --git a/include/kvm/iommu.h b/include/kvm/iommu.h
new file mode 100644
index 000000000000..10ecaae0f6a3
--- /dev/null
+++ b/include/kvm/iommu.h
@@ -0,0 +1,48 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __KVM_IOMMU_H
+#define __KVM_IOMMU_H
+
+#include <asm/kvm_host.h>
+#include <linux/io-pgtable.h>
+#ifdef __KVM_NVHE_HYPERVISOR__
+#include <nvhe/spinlock.h>
+#else
+#include "hyp_constants.h"
+#endif
+
+struct kvm_hyp_iommu_domain {
+	atomic_t		refs;
+	pkvm_handle_t		domain_id;
+	void			*priv;
+};
+
+extern void **kvm_nvhe_sym(kvm_hyp_iommu_domains);
+#define kvm_hyp_iommu_domains kvm_nvhe_sym(kvm_hyp_iommu_domains)
+
+/*
+ * At the moment the number of domains is limited to 2^16
+ * In practice we're rarely going to need a lot of domains. To avoid allocating
+ * a large domain table, we use a two-level table, indexed by domain ID. With
+ * 4kB pages and 16-bytes domains, the leaf table contains 256 domains, and the
+ * root table 256 pointers. With 64kB pages, the leaf table contains 4096
+ * domains and the root table 16 pointers. In this case, or when using 8-bit
+ * VMIDs, it may be more advantageous to use a single level. But using two
+ * levels allows to easily extend the domain size.
+ */
+#define KVM_IOMMU_MAX_DOMAINS	(1 << 16)
+
+/* Number of entries in the level-2 domain table */
+#define KVM_IOMMU_DOMAINS_PER_PAGE \
+	(PAGE_SIZE / sizeof(struct kvm_hyp_iommu_domain))
+
+/* Number of entries in the root domain table */
+#define KVM_IOMMU_DOMAINS_ROOT_ENTRIES \
+	(KVM_IOMMU_MAX_DOMAINS / KVM_IOMMU_DOMAINS_PER_PAGE)
+
+#define KVM_IOMMU_DOMAINS_ROOT_SIZE \
+	(KVM_IOMMU_DOMAINS_ROOT_ENTRIES * sizeof(void *))
+
+#define KVM_IOMMU_DOMAINS_ROOT_ORDER_NR	\
+	(1 << get_order(KVM_IOMMU_DOMAINS_ROOT_SIZE))
+
+#endif /* __KVM_IOMMU_H */
-- 
2.47.0.338.g60cca15819-goog


