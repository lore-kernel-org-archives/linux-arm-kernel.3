Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3558CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 23:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bHyXp0c9r8a6Z3kqM6MYogJzQkCF/sRbjU6o05FpAFo=; b=LnydPJYJ0cOjnVSTLf/QsxVXJl
	5BlZ1qZLx2Y47kS6n1eZY8do0ZT6d2ibKe46Pfp7r4siOqQxow3Hz6+eUa2d5v8M6LrL3HhBxsmGL
	ehFwfVNB/yNcdXwduW2ld9kOWlc8bHMWKbZovB92+8C0FAiwPdYm2vCY7JjdxNgpzWS/xHEnEoZLx
	zBVaU8h0oiQdlP6eETBSfL/cvbZcgJpOsZqRa14vGb6QjtEVrIzlopyfI77UnLFEwOTsW1zSyI0Qx
	h7YCX3wUcKUYVKFy2VYkZonqCIT8MI5dwljnqzCH538iCelTJsAPrYf2hB9+3LXNTn6zC85D76KuV
	ypeW9tVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoWEM-0000000BubD-3lY9;
	Tue, 19 Aug 2025 23:59:06 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoUFw-0000000BfRU-2TIC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 21:52:37 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-3b9e4f039ecso2429600f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 14:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755640355; x=1756245155; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=bHyXp0c9r8a6Z3kqM6MYogJzQkCF/sRbjU6o05FpAFo=;
        b=KBOF3FZsMGFe5I4cvLqq+BNXozmNKqUaPU4hTeuIh6vLBY9L3kA3U7a/hdXaXAj5Vt
         jH5eOV3oWvFNusaepgt+Tu0Cr2t6B7xGaqoRNsYDtUEe38GX6Y3+UjT5txo1rF5non36
         YgnTSiDr1o9unnAHxwdwVI/+0rQfiSATMalAUdkFj9VPP0mO7fmsDGBZpTfnz6F+OhoZ
         LrAs+o0PZYMrmqOou24lTABSkC/6QK/sYYIG9ytEU+6DM9GaNfzq82KiFtgHuM87N4Bx
         ETJbciI9qid/SkEGo6fqMX6+569+60dMniHhFLUvFPMr87JFHQD8dwkHCakZY5xWweV7
         FIog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755640355; x=1756245155;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bHyXp0c9r8a6Z3kqM6MYogJzQkCF/sRbjU6o05FpAFo=;
        b=hqo/BstoL3HnQ4sVDNZLh6jUrE52qURvNpr7a3chXgE0R555RALE6epG/uSlmHqN2N
         Cv9K0aUbOBlbPE4tdI9oYfcYuS8MLq9NUnXSsMt9+G2deEidbVljxFsA1pxypKOYpnPJ
         uDowy+Fks1JxucFKo7yD2RHUuyQS8yrHmlZ87WQpdtfii4YEF+sAdgFOxfyEyY/Fn0Mb
         ozyjxc3+hI411LSCAr9o16yaTIU9AwF2G5kS36WiqThsA8OOMZrdQ6qaRl8mSCnLrsXK
         EdfQ7OzPAKdEfsMSkNR2QL7bTo8uS+FL3vJkkOVwaZGwkFKF1N3fJz/EZq/0iHqOSijd
         v+iQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/O7sC//Roxg9/6SQTdtLz217bjb4IEYqmgiLlL0lre4loW5uD7ViVNTd3ptdJEmALXsCnvEvm/k4ZRO0nfm7m@lists.infradead.org
X-Gm-Message-State: AOJu0YyYOOiKrSqyHjLh8jv35Se/NFJ1EzGlf1kpaGJ7jC7FSV+UaIkd
	+ACQX+pzdozoieEw3M+7FcYYGyN7Ye3qYDGBfVOclv6w4hfwsu6ejwZkhZjtHJZU8tFfjO1q7IZ
	t4f42gVs4WttPoA==
X-Google-Smtp-Source: AGHT+IF09z/zChrY/XKW2p3rPVo1I7WRsoRzioqDNTUyJHzYESu4rlz8VOrrsAe/v0WNmek1lpwYcIduC6GS/A==
X-Received: from wmth10.prod.google.com ([2002:a05:600c:8b6a:b0:459:e347:8a6e])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:4284:b0:3a6:d145:e2cc with SMTP id ffacd0b85a97d-3c32e03e447mr337072f8f.15.1755640354609;
 Tue, 19 Aug 2025 14:52:34 -0700 (PDT)
Date: Tue, 19 Aug 2025 21:51:39 +0000
In-Reply-To: <20250819215156.2494305-1-smostafa@google.com>
Mime-Version: 1.0
References: <20250819215156.2494305-1-smostafa@google.com>
X-Mailer: git-send-email 2.51.0.rc1.167.g924127e9c0-goog
Message-ID: <20250819215156.2494305-12-smostafa@google.com>
Subject: [PATCH v4 11/28] KVM: arm64: iommu: Add memory pool
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
X-CRM114-CacheID: sfid-20250819_145236_627665_2D174E51 
X-CRM114-Status: GOOD (  23.32  )
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

IOMMU drivers would require to allocate memory for the shadow page
table. Similar to the host stage-2 CPU page table, the IOMMU pool
is allocated early from the carveout and it's memory is added in
a pool which the IOMMU driver can allocate from and reclaim at
run time.

At this point the nr_pages is 0 as there are no driver, in the next
patches when the SMMUv3 driver is added, it will add it's own function
to return the number of pages needed in kvm/iommu.c.
Unfortunately, this part has 2 leak into kvm/iommu as this happens too
early before drivers can have any init calls.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/include/asm/kvm_host.h       |  1 +
 arch/arm64/kvm/hyp/include/nvhe/iommu.h |  5 ++++-
 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c   | 20 +++++++++++++++++++-
 arch/arm64/kvm/hyp/nvhe/setup.c         | 10 +++++++++-
 arch/arm64/kvm/iommu.c                  | 11 +++++++++++
 arch/arm64/kvm/pkvm.c                   |  1 +
 6 files changed, 45 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 1a08066eaf7e..fcb4b26072f7 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1676,5 +1676,6 @@ void check_feature_map(void);
 
 struct kvm_iommu_ops;
 int kvm_iommu_register_driver(struct kvm_iommu_ops *hyp_ops);
+size_t kvm_iommu_pages(void);
 
 #endif /* __ARM64_KVM_HOST_H__ */
diff --git a/arch/arm64/kvm/hyp/include/nvhe/iommu.h b/arch/arm64/kvm/hyp/include/nvhe/iommu.h
index 219363045b1c..9f4906c6dcc9 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/iommu.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/iommu.h
@@ -10,8 +10,11 @@ struct kvm_iommu_ops {
 	void (*host_stage2_idmap)(phys_addr_t start, phys_addr_t end, int prot);
 };
 
-int kvm_iommu_init(void);
+int kvm_iommu_init(void *pool_base, size_t nr_pages);
 
 void kvm_iommu_host_stage2_idmap(phys_addr_t start, phys_addr_t end,
 				 enum kvm_pgtable_prot prot);
+void *kvm_iommu_donate_pages(u8 order);
+void kvm_iommu_reclaim_pages(void *ptr);
+
 #endif /* __ARM64_KVM_NVHE_IOMMU_H__ */
diff --git a/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c b/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c
index f7d1c8feb358..1673165c7330 100644
--- a/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c
+++ b/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c
@@ -15,6 +15,7 @@ struct kvm_iommu_ops *kvm_iommu_ops;
 
 /* Protected by host_mmu.lock */
 static bool kvm_idmap_initialized;
+static struct hyp_pool iommu_pages_pool;
 
 static inline int pkvm_to_iommu_prot(enum kvm_pgtable_prot prot)
 {
@@ -72,7 +73,7 @@ static int kvm_iommu_snapshot_host_stage2(void)
 	return ret;
 }
 
-int kvm_iommu_init(void)
+int kvm_iommu_init(void *pool_base, size_t nr_pages)
 {
 	int ret;
 
@@ -80,6 +81,13 @@ int kvm_iommu_init(void)
 	    !kvm_iommu_ops->host_stage2_idmap)
 		return -ENODEV;
 
+	if (nr_pages) {
+		ret = hyp_pool_init(&iommu_pages_pool, hyp_virt_to_pfn(pool_base),
+				    nr_pages, 0);
+		if (ret)
+			return ret;
+	}
+
 	ret = kvm_iommu_ops->init();
 	if (ret)
 		return ret;
@@ -95,3 +103,13 @@ void kvm_iommu_host_stage2_idmap(phys_addr_t start, phys_addr_t end,
 		return;
 	kvm_iommu_ops->host_stage2_idmap(start, end, pkvm_to_iommu_prot(prot));
 }
+
+void *kvm_iommu_donate_pages(u8 order)
+{
+	return hyp_alloc_pages(&iommu_pages_pool, order);
+}
+
+void kvm_iommu_reclaim_pages(void *ptr)
+{
+	hyp_put_page(&iommu_pages_pool, ptr);
+}
diff --git a/arch/arm64/kvm/hyp/nvhe/setup.c b/arch/arm64/kvm/hyp/nvhe/setup.c
index bdbc77395e03..09ecee2cd864 100644
--- a/arch/arm64/kvm/hyp/nvhe/setup.c
+++ b/arch/arm64/kvm/hyp/nvhe/setup.c
@@ -21,6 +21,7 @@
 #include <nvhe/trap_handler.h>
 
 unsigned long hyp_nr_cpus;
+size_t hyp_kvm_iommu_pages;
 
 #define hyp_percpu_size ((unsigned long)__per_cpu_end - \
 			 (unsigned long)__per_cpu_start)
@@ -33,6 +34,7 @@ static void *selftest_base;
 static void *ffa_proxy_pages;
 static struct kvm_pgtable_mm_ops pkvm_pgtable_mm_ops;
 static struct hyp_pool hpool;
+static void *iommu_base;
 
 static int divide_memory_pool(void *virt, unsigned long size)
 {
@@ -70,6 +72,12 @@ static int divide_memory_pool(void *virt, unsigned long size)
 	if (!ffa_proxy_pages)
 		return -ENOMEM;
 
+	if (hyp_kvm_iommu_pages) {
+		iommu_base = hyp_early_alloc_contig(hyp_kvm_iommu_pages);
+		if (!iommu_base)
+			return -ENOMEM;
+	}
+
 	return 0;
 }
 
@@ -321,7 +329,7 @@ void __noreturn __pkvm_init_finalise(void)
 	if (ret)
 		goto out;
 
-	ret = kvm_iommu_init();
+	ret = kvm_iommu_init(iommu_base, hyp_kvm_iommu_pages);
 	if (ret)
 		goto out;
 
diff --git a/arch/arm64/kvm/iommu.c b/arch/arm64/kvm/iommu.c
index 926a1a94698f..5460b1bd44a6 100644
--- a/arch/arm64/kvm/iommu.c
+++ b/arch/arm64/kvm/iommu.c
@@ -7,9 +7,20 @@
 #include <linux/kvm_host.h>
 
 extern struct kvm_iommu_ops *kvm_nvhe_sym(kvm_iommu_ops);
+extern size_t kvm_nvhe_sym(hyp_kvm_iommu_pages);
 
 int kvm_iommu_register_driver(struct kvm_iommu_ops *hyp_ops)
 {
 	kvm_nvhe_sym(kvm_iommu_ops) = hyp_ops;
 	return 0;
 }
+
+size_t kvm_iommu_pages(void)
+{
+	/*
+	 * This is called very early during setup_arch() where no initcalls,
+	 * so this has to call specific functions per each KVM driver.
+	 */
+	kvm_nvhe_sym(hyp_kvm_iommu_pages) = 0;
+	return 0;
+}
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index fcd70bfe44fb..6098beda36fa 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -63,6 +63,7 @@ void __init kvm_hyp_reserve(void)
 	hyp_mem_pages += hyp_vmemmap_pages(STRUCT_HYP_PAGE_SIZE);
 	hyp_mem_pages += pkvm_selftest_pages();
 	hyp_mem_pages += hyp_ffa_proxy_pages();
+	hyp_mem_pages += kvm_iommu_pages();
 
 	/*
 	 * Try to allocate a PMD-aligned region to reduce TLB pressure once
-- 
2.51.0.rc1.167.g924127e9c0-goog


