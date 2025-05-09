Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EB56C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 14:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Nkys3MADPIj5Es68fiIJTGNjZ/cE1BlJNsvbA6coAk=; b=ADFELM037GJjslSs5z3JWqV9QR
	mYKLOdBv7iMYoLOs1c8KCsL3T/kOE4q5MNie7s9LNeOaM7+InH7Rezhrbu4FVGSs84C7R5EdaN2yx
	rSIt/EInbR2Ad3QfGBsetT55A6Kc0wNxGnBaOGG49tRholwjha2sgGoBztCyrtzRuSQ7pfrlGfIbm
	9U6aEoAgC8ZcJRwIjuN9b2hKb+QflHBcNwsv4UX/jYGftC3MqTMybVniJUn7HbCL1QrBx1aZIyAAG
	UUW+2hxO/mZE8Z6KLWDvmG+dRqLc5s+xM3a64RvxggSj4DEL2npc1OpUT/rxFu0kb2rWChcQoOqQd
	BeSiDZTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDOz7-00000003yvP-17qh;
	Fri, 09 May 2025 14:45:57 +0000
Received: from mail-wm1-f74.google.com ([209.85.128.74])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDNbY-00000003j49-0pM6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 13:17:33 +0000
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43d0830c3f7so14041045e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 06:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746796650; x=1747401450; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+Nkys3MADPIj5Es68fiIJTGNjZ/cE1BlJNsvbA6coAk=;
        b=ZlLtIHyjvGQtebyGIqtuibntcHrwPueF+4Dy4fxFpKVKgFU2bMekdw5qtDJ8p/DMzd
         Cj8hBJkQJCxUIc2OQIEFPn4A+wVpH+r/EE4zyJjx6vrNqE9ZEbMy3JaGkKBwfy5x8gfE
         nlKf73xFWG3s386OzWVttoY3AMC14DnJadvHZ+U+LDENgIkGPWfoZhvyJe2bgtjBPAQc
         8x7zQPI7dqgxn1GrMCpwY0GTSWPAyhzJHufB1RMzJgX4IAHwtB6XI2PKrYW28sGNofEU
         bWYzNIFcqPQG/x+ScMNyuhHpcVOV11eYOnaQUmmv3A2lTpVPCUH3KuQ8qgsIt3AaTs5/
         dX7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746796650; x=1747401450;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+Nkys3MADPIj5Es68fiIJTGNjZ/cE1BlJNsvbA6coAk=;
        b=JtSjdOojv5yo9jC4s2iuXG6tr+7LFvzJOPvX+xYB7fvX5YxM4HKcRv6Vcl64t0oYRC
         +fYrFAVLDJ8gZxfjN/z+5PXzM8VfIiNrduTXHSujOSUzNXWOSmVfFoSMA+VI6XY21CVg
         Y4o/baJqKiwT0A0NIOwva3S0vj0Eb8uQMNgpETXgEl8uh3JOEJN8YJ7aJzq7N4a/qtiy
         zIyg8eeDM73k5uTRQyphKX9M0nNAOMremQaoEwJKkF5J6gr/VVHno+Scpn/1E+mW6vOJ
         jw837z5j0S3wEhw5dB9EKHQzOV+X+aZaOyBdrWIXXh0dQ5zZX41SWMAXQ/uV9jc/EELF
         GYyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrNXrI03s9+Pf0q0N8gvpD7nr+CKIMUt/2RU/GUfbobfhBtKopkLBaMLHPSJeshfYjwzcbCWUWC21zPdadhSjv@lists.infradead.org
X-Gm-Message-State: AOJu0YxWuO5ADpxroI6mp/4YuQ4j1gCd4zSgXmGyaK4jfVB/Gqt5dez/
	wxWJ/pYlOR+RefiJgh7v7IA51UI8yrSytm6nFVQ3l8hMbMzCM3+ZevKaR7ZpckJTJygTjQjc2ie
	Hz8uVFCK4YMDBXJI5Qg==
X-Google-Smtp-Source: AGHT+IHJ6Ug2lZ+EwcnN/sajdCCAyKS2oET8piVm/uCVqDq6/j9BnOqfKPaK7OSzRMQ+TH//37e8HgXM+UiJR6KC
X-Received: from wmbji3.prod.google.com ([2002:a05:600c:a343:b0:43c:eba5:f9b3])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b0e:b0:43c:f6b0:e807 with SMTP id 5b1f17b1804b1-442d6ddea12mr29578065e9.31.1746796649880;
 Fri, 09 May 2025 06:17:29 -0700 (PDT)
Date: Fri,  9 May 2025 14:17:06 +0100
In-Reply-To: <20250509131706.2336138-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250509131706.2336138-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.49.0.1015.ga840276032-goog
Message-ID: <20250509131706.2336138-11-vdonnefort@google.com>
Subject: [PATCH v4 10/10] KVM: arm64: np-guest CMOs with PMD_SIZE fixmap
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: qperret@google.com, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kernel-team@android.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_061732_236314_8C277728 
X-CRM114-Status: GOOD (  18.39  )
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

With the introduction of stage-2 huge mappings in the pKVM hypervisor,
guest pages CMO is needed for PMD_SIZE size. Fixmap only supports
PAGE_SIZE and iterating over the huge-page is time consuming (mostly due
to TLBI on hyp_fixmap_unmap) which is a problem for EL2 latency.

Introduce a shared PMD_SIZE fixmap (hyp_fixblock_map/hyp_fixblock_unmap)
to improve guest page CMOs when stage-2 huge mappings are installed.

On a Pixel6, the iterative solution resulted in a latency of ~700us,
while the PMD_SIZE fixmap reduces it to ~100us.

Because of the horrendous private range allocation that would be
necessary, this is disabled for 64KiB pages systems.

Suggested-by: Quentin Perret <qperret@google.com>
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
Signed-off-by: Quentin Perret <qperret@google.com>

diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
index 1b43bcd2a679..2888b5d03757 100644
--- a/arch/arm64/include/asm/kvm_pgtable.h
+++ b/arch/arm64/include/asm/kvm_pgtable.h
@@ -59,6 +59,11 @@ typedef u64 kvm_pte_t;
 
 #define KVM_PHYS_INVALID		(-1ULL)
 
+#define KVM_PTE_TYPE			BIT(1)
+#define KVM_PTE_TYPE_BLOCK		0
+#define KVM_PTE_TYPE_PAGE		1
+#define KVM_PTE_TYPE_TABLE		1
+
 #define KVM_PTE_LEAF_ATTR_LO		GENMASK(11, 2)
 
 #define KVM_PTE_LEAF_ATTR_LO_S1_ATTRIDX	GENMASK(4, 2)
diff --git a/arch/arm64/kvm/hyp/include/nvhe/mm.h b/arch/arm64/kvm/hyp/include/nvhe/mm.h
index 230e4f2527de..b0c72bc2d5ba 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mm.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mm.h
@@ -13,9 +13,11 @@
 extern struct kvm_pgtable pkvm_pgtable;
 extern hyp_spinlock_t pkvm_pgd_lock;
 
-int hyp_create_pcpu_fixmap(void);
+int hyp_create_fixmap(void);
 void *hyp_fixmap_map(phys_addr_t phys);
 void hyp_fixmap_unmap(void);
+void *hyp_fixblock_map(phys_addr_t phys);
+void hyp_fixblock_unmap(void);
 
 int hyp_create_idmap(u32 hyp_va_bits);
 int hyp_map_vectors(void);
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 97e0fea9db4e..9f3ffa4e0690 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -220,16 +220,52 @@ static void guest_s2_put_page(void *addr)
 	hyp_put_page(&current_vm->pool, addr);
 }
 
+static void *__fixmap_guest_page(void *va, size_t *size)
+{
+	if (IS_ALIGNED(*size, PMD_SIZE)) {
+		void *addr = hyp_fixblock_map(__hyp_pa(va));
+
+		if (addr)
+			return addr;
+
+		*size = PAGE_SIZE;
+	}
+
+	if (IS_ALIGNED(*size, PAGE_SIZE))
+		return hyp_fixmap_map(__hyp_pa(va));
+
+	WARN_ON(1);
+
+	return NULL;
+}
+
+static void __fixunmap_guest_page(size_t size)
+{
+	switch (size) {
+	case PAGE_SIZE:
+		hyp_fixmap_unmap();
+		break;
+	case PMD_SIZE:
+		hyp_fixblock_unmap();
+		break;
+	default:
+		WARN_ON(1);
+	}
+}
+
 static void clean_dcache_guest_page(void *va, size_t size)
 {
 	WARN_ON(!PAGE_ALIGNED(size));
 
 	while (size) {
-		__clean_dcache_guest_page(hyp_fixmap_map(__hyp_pa(va)),
-					  PAGE_SIZE);
-		hyp_fixmap_unmap();
-		va += PAGE_SIZE;
-		size -= PAGE_SIZE;
+		size_t fixmap_size = size == PMD_SIZE ? size : PAGE_SIZE;
+		void *addr = __fixmap_guest_page(va, &fixmap_size);
+
+		__clean_dcache_guest_page(addr, fixmap_size);
+		__fixunmap_guest_page(fixmap_size);
+
+		size -= fixmap_size;
+		va += fixmap_size;
 	}
 }
 
@@ -238,11 +274,14 @@ static void invalidate_icache_guest_page(void *va, size_t size)
 	WARN_ON(!PAGE_ALIGNED(size));
 
 	while (size) {
-		__invalidate_icache_guest_page(hyp_fixmap_map(__hyp_pa(va)),
-					       PAGE_SIZE);
-		hyp_fixmap_unmap();
-		va += PAGE_SIZE;
-		size -= PAGE_SIZE;
+		size_t fixmap_size = size == PMD_SIZE ? size : PAGE_SIZE;
+		void *addr = __fixmap_guest_page(va, &fixmap_size);
+
+		__invalidate_icache_guest_page(addr, fixmap_size);
+		__fixunmap_guest_page(fixmap_size);
+
+		size -= fixmap_size;
+		va += fixmap_size;
 	}
 }
 
diff --git a/arch/arm64/kvm/hyp/nvhe/mm.c b/arch/arm64/kvm/hyp/nvhe/mm.c
index f41c7440b34b..e3b1bece8504 100644
--- a/arch/arm64/kvm/hyp/nvhe/mm.c
+++ b/arch/arm64/kvm/hyp/nvhe/mm.c
@@ -229,9 +229,8 @@ int hyp_map_vectors(void)
 	return 0;
 }
 
-void *hyp_fixmap_map(phys_addr_t phys)
+static void *fixmap_map_slot(struct hyp_fixmap_slot *slot, phys_addr_t phys)
 {
-	struct hyp_fixmap_slot *slot = this_cpu_ptr(&fixmap_slots);
 	kvm_pte_t pte, *ptep = slot->ptep;
 
 	pte = *ptep;
@@ -243,10 +242,21 @@ void *hyp_fixmap_map(phys_addr_t phys)
 	return (void *)slot->addr;
 }
 
+void *hyp_fixmap_map(phys_addr_t phys)
+{
+	return fixmap_map_slot(this_cpu_ptr(&fixmap_slots), phys);
+}
+
 static void fixmap_clear_slot(struct hyp_fixmap_slot *slot)
 {
 	kvm_pte_t *ptep = slot->ptep;
 	u64 addr = slot->addr;
+	u32 level;
+
+	if (FIELD_GET(KVM_PTE_TYPE, *ptep) == KVM_PTE_TYPE_PAGE)
+		level = KVM_PGTABLE_LAST_LEVEL;
+	else
+		level = KVM_PGTABLE_LAST_LEVEL - 1; /* create_fixblock() guarantees PMD level */
 
 	WRITE_ONCE(*ptep, *ptep & ~KVM_PTE_VALID);
 
@@ -260,7 +270,7 @@ static void fixmap_clear_slot(struct hyp_fixmap_slot *slot)
 	 * https://lore.kernel.org/kvm/20221017115209.2099-1-will@kernel.org/T/#mf10dfbaf1eaef9274c581b81c53758918c1d0f03
 	 */
 	dsb(ishst);
-	__tlbi_level(vale2is, __TLBI_VADDR(addr, 0), KVM_PGTABLE_LAST_LEVEL);
+	__tlbi_level(vale2is, __TLBI_VADDR(addr, 0), level);
 	dsb(ish);
 	isb();
 }
@@ -273,9 +283,9 @@ void hyp_fixmap_unmap(void)
 static int __create_fixmap_slot_cb(const struct kvm_pgtable_visit_ctx *ctx,
 				   enum kvm_pgtable_walk_flags visit)
 {
-	struct hyp_fixmap_slot *slot = per_cpu_ptr(&fixmap_slots, (u64)ctx->arg);
+	struct hyp_fixmap_slot *slot = (struct hyp_fixmap_slot *)ctx->arg;
 
-	if (!kvm_pte_valid(ctx->old) || ctx->level != KVM_PGTABLE_LAST_LEVEL)
+	if (!kvm_pte_valid(ctx->old) || (ctx->end - ctx->start) != kvm_granule_size(ctx->level))
 		return -EINVAL;
 
 	slot->addr = ctx->addr;
@@ -296,13 +306,73 @@ static int create_fixmap_slot(u64 addr, u64 cpu)
 	struct kvm_pgtable_walker walker = {
 		.cb	= __create_fixmap_slot_cb,
 		.flags	= KVM_PGTABLE_WALK_LEAF,
-		.arg = (void *)cpu,
+		.arg = (void *)per_cpu_ptr(&fixmap_slots, cpu),
 	};
 
 	return kvm_pgtable_walk(&pkvm_pgtable, addr, PAGE_SIZE, &walker);
 }
 
-int hyp_create_pcpu_fixmap(void)
+#ifndef CONFIG_ARM64_64K_PAGES
+static struct hyp_fixmap_slot hyp_fixblock_slot;
+static DEFINE_HYP_SPINLOCK(hyp_fixblock_lock);
+
+void *hyp_fixblock_map(phys_addr_t phys)
+{
+	hyp_spin_lock(&hyp_fixblock_lock);
+	return fixmap_map_slot(&hyp_fixblock_slot, phys);
+}
+
+void hyp_fixblock_unmap(void)
+{
+	fixmap_clear_slot(&hyp_fixblock_slot);
+	hyp_spin_unlock(&hyp_fixblock_lock);
+}
+
+static int create_fixblock(void)
+{
+	struct kvm_pgtable_walker walker = {
+		.cb	= __create_fixmap_slot_cb,
+		.flags	= KVM_PGTABLE_WALK_LEAF,
+		.arg = (void *)&hyp_fixblock_slot,
+	};
+	unsigned long addr;
+	phys_addr_t phys;
+	int ret, i;
+
+	/* Find a RAM phys address, PMD aligned */
+	for (i = 0; i < hyp_memblock_nr; i++) {
+		phys = ALIGN(hyp_memory[i].base, PMD_SIZE);
+		if (phys + PMD_SIZE < (hyp_memory[i].base + hyp_memory[i].size))
+			break;
+	}
+
+	if (i >= hyp_memblock_nr)
+		return -EINVAL;
+
+	hyp_spin_lock(&pkvm_pgd_lock);
+	addr = ALIGN(__io_map_base, PMD_SIZE);
+	ret = __pkvm_alloc_private_va_range(addr, PMD_SIZE);
+	if (ret)
+		goto unlock;
+
+	ret = kvm_pgtable_hyp_map(&pkvm_pgtable, addr, PMD_SIZE, phys, PAGE_HYP);
+	if (ret)
+		goto unlock;
+
+	ret = kvm_pgtable_walk(&pkvm_pgtable, addr, PMD_SIZE, &walker);
+
+unlock:
+	hyp_spin_unlock(&pkvm_pgd_lock);
+
+	return ret;
+}
+#else
+void hyp_fixblock_unmap(void) { WARN_ON(1); }
+void *hyp_fixblock_map(phys_addr_t phys) { return NULL; }
+static int create_fixblock(void) { return 0; }
+#endif
+
+int hyp_create_fixmap(void)
 {
 	unsigned long addr, i;
 	int ret;
@@ -322,7 +392,7 @@ int hyp_create_pcpu_fixmap(void)
 			return ret;
 	}
 
-	return 0;
+	return create_fixblock();
 }
 
 int hyp_create_idmap(u32 hyp_va_bits)
diff --git a/arch/arm64/kvm/hyp/nvhe/setup.c b/arch/arm64/kvm/hyp/nvhe/setup.c
index c19860fc8183..a48d3f5a5afb 100644
--- a/arch/arm64/kvm/hyp/nvhe/setup.c
+++ b/arch/arm64/kvm/hyp/nvhe/setup.c
@@ -312,7 +312,7 @@ void __noreturn __pkvm_init_finalise(void)
 	if (ret)
 		goto out;
 
-	ret = hyp_create_pcpu_fixmap();
+	ret = hyp_create_fixmap();
 	if (ret)
 		goto out;
 
diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index df5cc74a7dd0..c351b4abd5db 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -11,12 +11,6 @@
 #include <asm/kvm_pgtable.h>
 #include <asm/stage2_pgtable.h>
 
-
-#define KVM_PTE_TYPE			BIT(1)
-#define KVM_PTE_TYPE_BLOCK		0
-#define KVM_PTE_TYPE_PAGE		1
-#define KVM_PTE_TYPE_TABLE		1
-
 struct kvm_pgtable_walk_data {
 	struct kvm_pgtable_walker	*walker;
 
-- 
2.49.0.1015.ga840276032-goog


