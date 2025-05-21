Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 968F3C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 13:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JPzlBmS/vixQNlnFlLNVTrpyQWywNNSCiH/beuvalSg=; b=5GTkUW3k3PO8TvcTMdKb/j3xVv
	9wk9z9H5rpHGrzS/OKusIrAn89EjmtWoU2XY70IOUBe/h8XhTDnLDMRD/BBuinS6GLEMzXIKmpKaA
	GgVeys39VCgy1HkM7FBsVEv58klc4AqPMwVTVe8DqpAtXxu4an7czZIcWMCroYV1KDD+YuZopThKx
	oqRBHQsPrQ0xUKn86saE+Ya2CrQdVCyuCiUkqQLYx9oYogkMzRGQT2blu1FDTFZe8g03I/bhY2+yT
	3dD5jE+jE1UwqX4XKagq7bI6hLhLpY5gw0xj4Kcl9AOOPk2sY8wMhZWda8jhniElmhOqj2rCDnx0G
	2j4MBGsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHjEq-0000000FtQw-3Mpg;
	Wed, 21 May 2025 13:12:04 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHiuq-0000000FphS-0ugc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 12:51:25 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-3a36416aef2so1843929f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 May 2025 05:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747831882; x=1748436682; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=JPzlBmS/vixQNlnFlLNVTrpyQWywNNSCiH/beuvalSg=;
        b=VZJV1QVT3OGGkd7BEEa7fX+TsmBz6o+M03raeLRmmGw+ZB7yXxFc0M5WuSW5So3DSh
         B95pHqkmw1LN8N4neBEW1O5oYoZ34hHjOl04pZNe7Wh1K80L2pFpMrRrtUqHWxfa6g8B
         btPmxQdYsGAg/hqebhM58IzMcnEwFjYeCWFYyJ1fl7hAm6Hq5oNvRgh9f1eJGLvtbMjw
         4xemM5Dr5uWrMRbrab+HfnDhmrHFnJwF40sWK4+L/2lKXfUUscTUpAB2KUwz1X2/0NFb
         UcuAh0CFKga6LYGikHWaOtmM3SQs0UDmj8pxVx4Z4o975j2H0xVq7qkF37qmZ6OLmD3z
         aIOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747831882; x=1748436682;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JPzlBmS/vixQNlnFlLNVTrpyQWywNNSCiH/beuvalSg=;
        b=wve2+9L1qOe2L0yrrWQqBjKWH4ueZ8m+19QcARQZ4Xj/qGpYCqyjQ6W5sBrF7oG/KG
         q3FHXLVZolX4WQe8v0Vic9PLA2qv8pUyanY+lbHFtm9N9ECQsSkPPMRQmYyd4CLpaDNQ
         lXdNnm/yuvofBs6gn3go3Jx51C2hDQWRu81WzCZ0c5h/QT1NpMWvMR3f7+MK/DAGrj4V
         x6L7hKwL6OKdn8vH/ItOLl1RpEB02fpDOkcGIUXEQ34jWXYNU+ADRTfhyEgYv43wQZun
         RguV71cI2F4fMuox+2R9qrJNl8HYBAvBHOf2N4f90FCLS0xjnrPrfhSZNk+1+aQVh0tL
         Wu4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWvHRJTpAVSplWkYHbZIlPovXxDvD4U6DHrdQomHQcivqyA1+cIzEyfrfD7exHEbTbVvqwQdq8VQsKdmXmY6sLy@lists.infradead.org
X-Gm-Message-State: AOJu0YxN0yseM0v9GcDQfC6TlSZNdS5HX8VKje7LMd0jPpa3V1Icx8Yl
	Ug89GbjJBQAQeVPuV16TvoU3JM37y0BHxtmHmFvb/XnEVk+tEWROV8R6E1GFRRKy8ir2er0NJ/j
	kfSC7Dolnp0WRARtFlzJn5A==
X-Google-Smtp-Source: AGHT+IE/jsEpHUOKUoZ6F/+QjPoabXMpV1/0WZAcaBafnmGb5uaRjEjbFBFVLyfZWlGhTulY1NK7gFRGkHiLEeFY
X-Received: from wmbdr13.prod.google.com ([2002:a05:600c:608d:b0:43d:1f28:b8bf])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:40ce:b0:3a3:68c7:e486 with SMTP id ffacd0b85a97d-3a368c7e67bmr14514425f8f.51.1747831882368;
 Wed, 21 May 2025 05:51:22 -0700 (PDT)
Date: Wed, 21 May 2025 13:48:34 +0100
In-Reply-To: <20250521124834.1070650-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250521124834.1070650-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.49.0.1112.g889b7c5bd8-goog
Message-ID: <20250521124834.1070650-11-vdonnefort@google.com>
Subject: [PATCH v6 10/10] KVM: arm64: np-guest CMOs with PMD_SIZE fixmap
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: qperret@google.com, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kernel-team@android.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_055124_256320_A906CAEE 
X-CRM114-Status: GOOD (  18.70  )
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
index 230e4f2527de..6e83ce35c2f2 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mm.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mm.h
@@ -13,9 +13,11 @@
 extern struct kvm_pgtable pkvm_pgtable;
 extern hyp_spinlock_t pkvm_pgd_lock;
 
-int hyp_create_pcpu_fixmap(void);
+int hyp_create_fixmap(void);
 void *hyp_fixmap_map(phys_addr_t phys);
 void hyp_fixmap_unmap(void);
+void *hyp_fixblock_map(phys_addr_t phys, size_t *size);
+void hyp_fixblock_unmap(void);
 
 int hyp_create_idmap(u32 hyp_va_bits);
 int hyp_map_vectors(void);
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 1c18fca82209..f67c1a91e4eb 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -216,34 +216,42 @@ static void guest_s2_put_page(void *addr)
 	hyp_put_page(&current_vm->pool, addr);
 }
 
-static void clean_dcache_guest_page(void *va, size_t size)
+static void __apply_guest_page(void *va, size_t size,
+			       void (*func)(void *addr, size_t size))
 {
 	size += va - PTR_ALIGN_DOWN(va, PAGE_SIZE);
 	va = PTR_ALIGN_DOWN(va, PAGE_SIZE);
 	size = PAGE_ALIGN(size);
 
 	while (size) {
-		__clean_dcache_guest_page(hyp_fixmap_map(__hyp_pa(va)),
-					  PAGE_SIZE);
-		hyp_fixmap_unmap();
-		va += PAGE_SIZE;
-		size -= PAGE_SIZE;
+		size_t map_size = PAGE_SIZE;
+		void *map;
+
+		if (IS_ALIGNED((unsigned long)va, PMD_SIZE) && size >= PMD_SIZE)
+			map = hyp_fixblock_map(__hyp_pa(va), &map_size);
+		else
+			map = hyp_fixmap_map(__hyp_pa(va));
+
+		func(map, map_size);
+
+		if (map_size == PMD_SIZE)
+			hyp_fixblock_unmap();
+		else
+			hyp_fixmap_unmap();
+
+		size -= map_size;
+		va += map_size;
 	}
 }
 
-static void invalidate_icache_guest_page(void *va, size_t size)
+static void clean_dcache_guest_page(void *va, size_t size)
 {
-	size += va - PTR_ALIGN_DOWN(va, PAGE_SIZE);
-	va = PTR_ALIGN_DOWN(va, PAGE_SIZE);
-	size = PAGE_ALIGN(size);
+	__apply_guest_page(va, size, __clean_dcache_guest_page);
+}
 
-	while (size) {
-		__invalidate_icache_guest_page(hyp_fixmap_map(__hyp_pa(va)),
-					       PAGE_SIZE);
-		hyp_fixmap_unmap();
-		va += PAGE_SIZE;
-		size -= PAGE_SIZE;
-	}
+static void invalidate_icache_guest_page(void *va, size_t size)
+{
+	__apply_guest_page(va, size, __invalidate_icache_guest_page);
 }
 
 int kvm_guest_prepare_stage2(struct pkvm_hyp_vm *vm, void *pgd)
diff --git a/arch/arm64/kvm/hyp/nvhe/mm.c b/arch/arm64/kvm/hyp/nvhe/mm.c
index f41c7440b34b..ae8391baebc3 100644
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
@@ -296,13 +306,84 @@ static int create_fixmap_slot(u64 addr, u64 cpu)
 	struct kvm_pgtable_walker walker = {
 		.cb	= __create_fixmap_slot_cb,
 		.flags	= KVM_PGTABLE_WALK_LEAF,
-		.arg = (void *)cpu,
+		.arg	= per_cpu_ptr(&fixmap_slots, cpu),
 	};
 
 	return kvm_pgtable_walk(&pkvm_pgtable, addr, PAGE_SIZE, &walker);
 }
 
-int hyp_create_pcpu_fixmap(void)
+#if PAGE_SHIFT < 16
+#define HAS_FIXBLOCK
+static struct hyp_fixmap_slot hyp_fixblock_slot;
+static DEFINE_HYP_SPINLOCK(hyp_fixblock_lock);
+#endif
+
+static int create_fixblock(void)
+{
+#ifdef HAS_FIXBLOCK
+	struct kvm_pgtable_walker walker = {
+		.cb	= __create_fixmap_slot_cb,
+		.flags	= KVM_PGTABLE_WALK_LEAF,
+		.arg	= &hyp_fixblock_slot,
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
+#else
+	return 0;
+#endif
+}
+
+void *hyp_fixblock_map(phys_addr_t phys, size_t *size)
+{
+#ifdef HAS_FIXBLOCK
+	*size = PMD_SIZE;
+	hyp_spin_lock(&hyp_fixblock_lock);
+	return fixmap_map_slot(&hyp_fixblock_slot, phys);
+#else
+	*size = PAGE_SIZE;
+	return hyp_fixmap_map(phys);
+#endif
+}
+
+void hyp_fixblock_unmap(void)
+{
+#ifdef HAS_FIXBLOCK
+	fixmap_clear_slot(&hyp_fixblock_slot);
+	hyp_spin_unlock(&hyp_fixblock_lock);
+#else
+	hyp_fixmap_unmap();
+#endif
+}
+
+int hyp_create_fixmap(void)
 {
 	unsigned long addr, i;
 	int ret;
@@ -322,7 +403,7 @@ int hyp_create_pcpu_fixmap(void)
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
2.49.0.1112.g889b7c5bd8-goog


