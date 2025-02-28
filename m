Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCC6DC19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 10:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=okFrKrhPumydq8rLHSqC6+IdPsjGdyC8aVxeiqDQVLo=; b=ZsYRp45vimZRjX9lag/Y+SpWlS
	K64jSgwP/rKANERSa+SpgrGBK3DWH9Jhi1iJVrYDy7udF0b4aKdujKF+3vJ7RLjMsc9IoaMEfBnYD
	188EgcUiPeom376O+5ZGoV1n9bWoIGkGJVdRRT0apmXNNr8pItaOtyRNedY/9xaWUJ6I3t81f7z8P
	KLF5XBtLEbzgOrbmHK95ge2OQyA0H+PrAyk8RIuWGHOwhajwliQrPHXdfwogvb8rDb1ucLfOdhXwj
	3caxYKiq1G4J0t9mIkubkds6TW2i/e1J1Aqzjl71c4ZnB4f1Fd4pVQlTKZKRUJlX2SYH+wkm3GjP5
	uB8tvoFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tny5i-0000000AgI4-269T;
	Fri, 28 Feb 2025 10:59:38 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnxZP-0000000AaaZ-42aM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 10:26:17 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4394c747c72so8301575e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Feb 2025 02:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740738374; x=1741343174; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=okFrKrhPumydq8rLHSqC6+IdPsjGdyC8aVxeiqDQVLo=;
        b=QLycJR0iXtYnO1w8NlSmIUiBQPTxFjh7UaQrxJ6Kfh+l4ihucgR4cIE/863OHkrrZy
         nOBrsu0HsVeniZjhvSyIkSu1FDJBjPL9ENO85pvHjix6QnlYfTA1Vz+vx74Y8qDCEvLP
         Sshm7hd68uU9cMlL+bkUbuaUbJ6XT2ZF4jvFAPlrHujiWcYNMOlxccUdv2+Q34CLLxuU
         X3R1raQ73xSQba/+tKqX/wT1Apw8NbmFtk7SaobU5DQOjk1N7WbMCFNxIuRu//VgguZP
         prYRS90qXr0AQDla72IT+pzVEDiJQO4QLPyRjlmE0T38E7XF/OB5uXTdsVK/bGhAIpEo
         zD5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740738374; x=1741343174;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=okFrKrhPumydq8rLHSqC6+IdPsjGdyC8aVxeiqDQVLo=;
        b=TzWW0+lS9anYNVRoP5Dyw3Q0NWI5Lj7o36Ge0TrpeTIioJArWjPyoJeChvxVdH66yT
         73JiuxFNvonEWHdOmw20uVRhntwbBaOWPcOvXupJQNtXBRv3IC+2Ah/EcSFP2llyeBCC
         uHWJKTczA/PRFh29wBdgaXPJ+GdqQhUFVBUOPHMNq7IocjSl5sHDfq5sh+ThrbItVtd6
         cWvdc63gSFdVFKqCILPzvrAojhxGW3sYZhiEfcSbUfOrdvcQMWvQ8wMeJYsNoNPAJO6E
         5OsRT5N8sGa8cHADC0G6VfHhlhs9aA+P2oClEZ1iyXqlylUcUzisgZdD2liQS8FGZAyo
         YlCQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/xzl38P90jvqELoJtj3X+0hMxyYAwpw2xoaObtbuwv2OZ7tU8ReZ/93VACFI0dcLjImQNNeQSl0BTfuyvk5Nk@lists.infradead.org
X-Gm-Message-State: AOJu0YywUxn0UxLcAZmKaAd8jU/A2bnXGXiYJGjHwhX4/YXwX7c+2LDM
	lwwNheK06GnUbbxbDZxmNA3al0quJIPVF3f7+1duqZkLhgD8gphat0ROZ3HiLuXjkqjJ5zAHagM
	Oa5Jw5EhHL3+rzvasgQ==
X-Google-Smtp-Source: AGHT+IHw8E3se+rg2k3z4uSikRRjQKSYo2S3MZjJ8Y0FSN5936j7LMJM+12PR3REuojrFW4s9g1hMmiAVM7Iz4UL
X-Received: from wmbfm6.prod.google.com ([2002:a05:600c:c06:b0:439:9601:298d])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4f0d:b0:439:9828:c450 with SMTP id 5b1f17b1804b1-43ba67082e6mr22770435e9.15.1740738374284;
 Fri, 28 Feb 2025 02:26:14 -0800 (PST)
Date: Fri, 28 Feb 2025 10:25:30 +0000
In-Reply-To: <20250228102530.1229089-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250228102530.1229089-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250228102530.1229089-15-vdonnefort@google.com>
Subject: [PATCH 9/9] KVM: arm64: np-guest CMOs with PMD_SIZE fixmap
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: qperret@google.com, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kernel-team@android.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_022616_005180_0DBF28D0 
X-CRM114-Status: GOOD (  17.81  )
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
index 271893eff021..d27ce31370aa 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -220,25 +220,64 @@ static void guest_s2_put_page(void *addr)
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
 
 static void invalidate_icache_guest_page(void *va, size_t size)
 {
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
index d62bcb5634a2..fb69cf5e6ea8 100644
--- a/arch/arm64/kvm/hyp/nvhe/setup.c
+++ b/arch/arm64/kvm/hyp/nvhe/setup.c
@@ -295,7 +295,7 @@ void __noreturn __pkvm_init_finalise(void)
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
2.48.1.711.g2feabab25a-goog


