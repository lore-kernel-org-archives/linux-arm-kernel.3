Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C0CFD2F32D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 19:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ho649RqPWtDKTBK/otaPjQ2vodB52aFfCurSi2+zmns=; b=a82HdkL3tBf/lF7qU3yvRmJIEQ
	qKXEuX38qUjFgWZtrxxam5DOlmNo4zT0q7t+eaDNjlJxNG1tumxci2vbKOQCGhmAY3vvSB+yMWs4R
	KJkvIPNYIVgP834a5c6I91HklS8Yn3H4iEvfVkdBod71Oex64Cbjn+I44lu9N8ybR7VXPqIMlLJmd
	5VvWl9AAi8FwmZ7Mk//sEd9YsYETYc74cK2ljMvKxjBrZSViBIF0LTTKnLZK2tBp0Iz7Cx4Wwe44l
	gPxsYuz9SPL2ROQpC2FQoyz+9Pjz3lH1U08mQ+4iZcFLokQkINSR9Tt9KDLKn1iYxYSp200ACUPfS
	ePG8l7sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfkJg-00000007e17-3vJx;
	Tue, 13 Jan 2026 19:44:36 +0000
Received: from mail-dl1-x124a.google.com ([2607:f8b0:4864:20::124a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfkJf-00000007e0h-07co
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 19:44:36 +0000
Received: by mail-dl1-x124a.google.com with SMTP id a92af1059eb24-11dd10b03d9so10450004c88.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 11:44:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768333474; x=1768938274; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ho649RqPWtDKTBK/otaPjQ2vodB52aFfCurSi2+zmns=;
        b=fbfJWfM/iqMjEKkPQHLcvXSPfgPKoERLfHFsgU7a04tvS/OPUeF88BWPHBjIhYr+so
         INz5sm+OUD8/99p/t27lnpf3f30SMZV+QhM1Ik0SYU1mjsjrW8C0J6tHyNIiZy6OESRb
         Ncop3QSTt4XH9fJCRCdpLEL+DoKl/mbuPy7awqYgcuvDYNAtpL8H3dCjq4gys9DQ8uhN
         nPFX+LRuMFqQgyVhwqoz+k2L+y12AOM12CObcL44ZopvZc2sNlNaM2bCG58nW2PkG+OI
         23GOyb4WdUHrCpK6dsKKMmtrhaKIQEHU4jrz5T1a0rL6Sccv0CwV2rSXdMTSyC6Qm54/
         CCLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768333474; x=1768938274;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ho649RqPWtDKTBK/otaPjQ2vodB52aFfCurSi2+zmns=;
        b=OVa/Y/QS/L0fkLba6egguUzYyHB/ZarnXebl9U2xoqMeSyKerT/J4bam4DJN84LC1n
         EoPtp+08qQYpRjPGqtfEA9VZ8IddfwakF+2sOJAdIa+bsVu4Ioh0Hx0F43xJGszR0D/D
         JvUthjZ1dy/jBtFsSbKKXGiU+bDEcXsKdXv5JDSJFtXj98eVL0GQzsVJJGWUZ/golUzP
         WB0DA69f3EwjEcgI80lTNv/j+hWAk6VWbEsYIXL706x2orhvYvMpsRxv1WtFes2dwcas
         VEJnqAiy33dTZ1OOZ2NIHnR0rgYuZKTNfoZuQrafl0LGSOvIJ8WBCXkz3rSRvp/+Coln
         zF9Q==
X-Forwarded-Encrypted: i=1; AJvYcCV0NLVQ4897GN4XWrOfcEDw+ctVI9L0XAWBanWJ0vAKSxJKvnotcl0y6x573o3oIBQjB3WrwGipJjV2Km6ty0ag@lists.infradead.org
X-Gm-Message-State: AOJu0YwiTFLjYyj6DO/UlkTahU7iDlMsmNAdIAx82yuLhpU3t/bcId0g
	afpgwmjSIZQGybiT9WqSG/UB8AoNscJOrE7uiTywSyV47RMnyRcxzMLv5OkKW8T6MaSYIEosyTp
	nvOS9aVExiT18xg==
X-Received: from dlbcq13.prod.google.com ([2002:a05:7022:248d:b0:11d:cf4c:62ab])
 (user=pekangas job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:701b:220b:b0:119:e56b:98bf with SMTP id a92af1059eb24-12336a82526mr109229c88.38.1768333473633;
 Tue, 13 Jan 2026 11:44:33 -0800 (PST)
Date: Tue, 13 Jan 2026 19:44:09 +0000
In-Reply-To: <20260113194409.2970324-1-pekangas@google.com>
Mime-Version: 1.0
References: <20260113194409.2970324-1-pekangas@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260113194409.2970324-2-pekangas@google.com>
Subject: [PATCH v2 1/1] KVM: arm64: Calculate hyp VA size only once
From: Petteri Kangaslampi <pekangas@google.com>
To: kvmarm@lists.linux.dev
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Vincent Donnefort <vdonnefort@google.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Petteri Kangaslampi <pekangas@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_114435_076665_0C8F3966 
X-CRM114-Status: GOOD (  23.23  )
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

Calculate the hypervisor's VA size only once to maintain consistency
between the memory layout and MMU initialization logic. Previously the
two would be inconsistent when the kernel is configured for less than
IDMAP_VA_BITS of VA space.

Signed-off-by: Petteri Kangaslampi <pekangas@google.com>
---
 arch/arm64/include/asm/kvm_mmu.h |  3 ++-
 arch/arm64/kvm/arm.c             |  4 ++--
 arch/arm64/kvm/mmu.c             | 28 ++++-----------------------
 arch/arm64/kvm/va_layout.c       | 33 +++++++++++++++++++++++++++-----
 4 files changed, 36 insertions(+), 32 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_mmu.h b/arch/arm64/include/asm/kvm_mmu.h
index 2dc5e6e742bb..d968aca0461a 100644
--- a/arch/arm64/include/asm/kvm_mmu.h
+++ b/arch/arm64/include/asm/kvm_mmu.h
@@ -103,6 +103,7 @@ alternative_cb_end
 void kvm_update_va_mask(struct alt_instr *alt,
 			__le32 *origptr, __le32 *updptr, int nr_inst);
 void kvm_compute_layout(void);
+u32 kvm_hyp_va_bits(void);
 void kvm_apply_hyp_relocations(void);
 
 #define __hyp_pa(x) (((phys_addr_t)(x)) + hyp_physvirt_offset)
@@ -185,7 +186,7 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu);
 
 phys_addr_t kvm_mmu_get_httbr(void);
 phys_addr_t kvm_get_idmap_vector(void);
-int __init kvm_mmu_init(u32 *hyp_va_bits);
+int __init kvm_mmu_init(u32 hyp_va_bits);
 
 static inline void *__kvm_vector_slot2addr(void *base,
 					   enum arm64_hyp_spectre_vector slot)
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 4f80da0c0d1d..4703f0e15102 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -2568,7 +2568,7 @@ static void pkvm_hyp_init_ptrauth(void)
 /* Inits Hyp-mode on all online CPUs */
 static int __init init_hyp_mode(void)
 {
-	u32 hyp_va_bits;
+	u32 hyp_va_bits = kvm_hyp_va_bits();
 	int cpu;
 	int err = -ENOMEM;
 
@@ -2582,7 +2582,7 @@ static int __init init_hyp_mode(void)
 	/*
 	 * Allocate Hyp PGD and setup Hyp identity mapping
 	 */
-	err = kvm_mmu_init(&hyp_va_bits);
+	err = kvm_mmu_init(hyp_va_bits);
 	if (err)
 		goto out_err;
 
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 48d7c372a4cd..d5a506c99f73 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -2284,11 +2284,9 @@ static struct kvm_pgtable_mm_ops kvm_hyp_mm_ops = {
 	.virt_to_phys		= kvm_host_pa,
 };
 
-int __init kvm_mmu_init(u32 *hyp_va_bits)
+int __init kvm_mmu_init(u32 hyp_va_bits)
 {
 	int err;
-	u32 idmap_bits;
-	u32 kernel_bits;
 
 	hyp_idmap_start = __pa_symbol(__hyp_idmap_text_start);
 	hyp_idmap_start = ALIGN_DOWN(hyp_idmap_start, PAGE_SIZE);
@@ -2302,25 +2300,7 @@ int __init kvm_mmu_init(u32 *hyp_va_bits)
 	 */
 	BUG_ON((hyp_idmap_start ^ (hyp_idmap_end - 1)) & PAGE_MASK);
 
-	/*
-	 * The ID map is always configured for 48 bits of translation, which
-	 * may be fewer than the number of VA bits used by the regular kernel
-	 * stage 1, when VA_BITS=52.
-	 *
-	 * At EL2, there is only one TTBR register, and we can't switch between
-	 * translation tables *and* update TCR_EL2.T0SZ at the same time. Bottom
-	 * line: we need to use the extended range with *both* our translation
-	 * tables.
-	 *
-	 * So use the maximum of the idmap VA bits and the regular kernel stage
-	 * 1 VA bits to assure that the hypervisor can both ID map its code page
-	 * and map any kernel memory.
-	 */
-	idmap_bits = IDMAP_VA_BITS;
-	kernel_bits = vabits_actual;
-	*hyp_va_bits = max(idmap_bits, kernel_bits);
-
-	kvm_debug("Using %u-bit virtual addresses at EL2\n", *hyp_va_bits);
+	kvm_debug("Using %u-bit virtual addresses at EL2\n", hyp_va_bits);
 	kvm_debug("IDMAP page: %lx\n", hyp_idmap_start);
 	kvm_debug("HYP VA range: %lx:%lx\n",
 		  kern_hyp_va(PAGE_OFFSET),
@@ -2345,7 +2325,7 @@ int __init kvm_mmu_init(u32 *hyp_va_bits)
 		goto out;
 	}
 
-	err = kvm_pgtable_hyp_init(hyp_pgtable, *hyp_va_bits, &kvm_hyp_mm_ops);
+	err = kvm_pgtable_hyp_init(hyp_pgtable, hyp_va_bits, &kvm_hyp_mm_ops);
 	if (err)
 		goto out_free_pgtable;
 
@@ -2354,7 +2334,7 @@ int __init kvm_mmu_init(u32 *hyp_va_bits)
 		goto out_destroy_pgtable;
 
 	io_map_base = hyp_idmap_start;
-	__hyp_va_bits = *hyp_va_bits;
+	__hyp_va_bits = hyp_va_bits;
 	return 0;
 
 out_destroy_pgtable:
diff --git a/arch/arm64/kvm/va_layout.c b/arch/arm64/kvm/va_layout.c
index 91b22a014610..2346f9435a71 100644
--- a/arch/arm64/kvm/va_layout.c
+++ b/arch/arm64/kvm/va_layout.c
@@ -46,9 +46,31 @@ static void init_hyp_physvirt_offset(void)
 	hyp_physvirt_offset = (s64)__pa(kern_va) - (s64)hyp_va;
 }
 
+/*
+ * Calculate the actual VA size used by the hypervisor
+ */
+__init u32 kvm_hyp_va_bits(void)
+{
+	/*
+	 * The ID map is always configured for 48 bits of translation, which may
+	 * be different from the number of VA bits used by the regular kernel
+	 * stage 1.
+	 *
+	 * At EL2, there is only one TTBR register, and we can't switch between
+	 * translation tables *and* update TCR_EL2.T0SZ at the same time. Bottom
+	 * line: we need to use the extended range with *both* our translation
+	 * tables.
+	 *
+	 * So use the maximum of the idmap VA bits and the regular kernel stage
+	 * 1 VA bits as the hypervisor VA size to assure that the hypervisor can
+	 * both ID map its code page and map any kernel memory.
+	 */
+	return max(IDMAP_VA_BITS, vabits_actual);
+}
+
 /*
  * We want to generate a hyp VA with the following format (with V ==
- * vabits_actual):
+ * hypervisor VA bits):
  *
  *  63 ... V |     V-1    | V-2 .. tag_lsb | tag_lsb - 1 .. 0
  *  ---------------------------------------------------------
@@ -61,10 +83,11 @@ __init void kvm_compute_layout(void)
 {
 	phys_addr_t idmap_addr = __pa_symbol(__hyp_idmap_text_start);
 	u64 hyp_va_msb;
+	u32 hyp_va_bits = kvm_hyp_va_bits();
 
 	/* Where is my RAM region? */
-	hyp_va_msb  = idmap_addr & BIT(vabits_actual - 1);
-	hyp_va_msb ^= BIT(vabits_actual - 1);
+	hyp_va_msb  = idmap_addr & BIT(hyp_va_bits - 1);
+	hyp_va_msb ^= BIT(hyp_va_bits - 1);
 
 	tag_lsb = fls64((u64)phys_to_virt(memblock_start_of_DRAM()) ^
 			(u64)(high_memory - 1));
@@ -72,9 +95,9 @@ __init void kvm_compute_layout(void)
 	va_mask = GENMASK_ULL(tag_lsb - 1, 0);
 	tag_val = hyp_va_msb;
 
-	if (IS_ENABLED(CONFIG_RANDOMIZE_BASE) && tag_lsb != (vabits_actual - 1)) {
+	if (IS_ENABLED(CONFIG_RANDOMIZE_BASE) && tag_lsb != (hyp_va_bits - 1)) {
 		/* We have some free bits to insert a random tag. */
-		tag_val |= get_random_long() & GENMASK_ULL(vabits_actual - 2, tag_lsb);
+		tag_val |= get_random_long() & GENMASK_ULL(hyp_va_bits - 2, tag_lsb);
 	}
 	tag_val >>= tag_lsb;
 
-- 
2.52.0.457.g6b5491de43-goog


