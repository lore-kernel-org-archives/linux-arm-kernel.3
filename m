Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA3A9D41D41
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 00:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uPqm/j9GML5grkd0K90HJBJ+6dp+iW/S4dreeHv8WiA=; b=dwsuf6UVLAS3MTM/GnhTDbjHxm
	YITpjubZIVb6NJQxA8bWCzPWG/LGttdaDyZY9/O6zAtww38QQKra94hj2rgp7k+udmE01lgfcIn+l
	wJCoEpCPq1sKTfNr/RK+r31w8g+x7VnvKowXO4TX4R22gAtt/OYWHqdgvSTlLMQF7hxt6iZRdiNAD
	h2UUquaihrKgOPVL/9yVt/RKZ9ss7/nYnHaP1D1xssr0t6Nj3neXvdrsYXhtbWfq6RLASJyE3umd+
	2uC46QScLL03xXbuXUmDi7CZJStrrowmF8Y06CcYCWYfIfZ5JgnTbKMSrq53gAE2gBkv4Aa9fjXBk
	IzPPJbTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAetw-00000001lW0-3Gjw;
	Tue, 12 Nov 2024 00:37:00 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAer3-00000001kzP-16ob
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 00:34:02 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-e2939e25402so7840189276.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Nov 2024 16:33:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731371639; x=1731976439; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uPqm/j9GML5grkd0K90HJBJ+6dp+iW/S4dreeHv8WiA=;
        b=36peJKHsXAq/NvClD+0GzaHW8SVGZGPHXKPG8eQe7AkbgP2hluhFkIRzd32nq95JIT
         XuDErkKJ+tfACMbjACh+g49TErdC1Gsjh3gbMAF9y0yu56G2Qwdr8JzeoClGhkPRdqdt
         jw0p+v8HwJWUZpq9DSCzkpB6EMpqeh3goHFO+PUVAvgxdlLCIfOaR8ojPky58TjqAP5J
         gs1dPvqile+/JtTvw2MYgVxa7COoiGnhkirFjbn1dkOib3b0axe4DTtaadF16GtDRBdw
         /02GOHS5ykfmryfGvv2pcpIgk6nmNydxmkh5pzhrXoiXiPhZ2XmcW5RL4vn6XnHVehNT
         KfTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731371639; x=1731976439;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uPqm/j9GML5grkd0K90HJBJ+6dp+iW/S4dreeHv8WiA=;
        b=VdEuUTZjYRp/qnY1s/uh+05iH189QjO+8nYI/G8bZp+yxSvjU6bucfe8z2ElkRX3jb
         0ekxvM2YbER3/Xhaa/q/eujVD7kOeU7rmu5K72x7ClAm8RljF+x0WCeBP+DYiDHHN+1x
         ACu0HatNgSzQz3VRTMndvCGfee6J/Pc9UBkhVCUfsbkz1aKbaE5KZkUJbp/cy9n7+dj5
         3S+NnEobhsUJKXY3TF9MWNPq2ww4MsUEWZSaOKZWXFzgjUqbqfktkG7XRtdq5ZZzu9XU
         Kvgx0AumSNCQlY1bdoXYoIwaHsYVnnQdN0VtSOKrL9dsIZTLxlHcY3ek4uQ6m/hCKZr3
         RFhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWiVP1A5SYI2L+ue4iBu9cYZ2/GWFWGIA6jE21UYQWPoVqAwKuC3FK5mdo8jl/1/WqpHEPnk1RR/zPrz05k+kgt@lists.infradead.org
X-Gm-Message-State: AOJu0YyayWHzo6ZUTt4SGkYoi7TSvB+NHs6cfT6I+P6Ck4IFmmWTbuyr
	llEIE8sevC+6ksVtPwQCZz7V/wOw0DM0rKv19YukV3eTGAApxl7YJeoWPRHvD9FJrNTQSt8g7l0
	Y1UHaipcdEnQA0mw1PBhxgw==
X-Google-Smtp-Source: AGHT+IF2AUPCYUIW/bjEyF6Bagqvriyp8owPVn//zZAu+iYnJp2HZR2/FMhkCxa9HQYN4qZCYWpxjJqGcHfQ1GzhLg==
X-Received: from kalesh.mtv.corp.google.com ([2a00:79e0:2e3f:8:64e3:b06b:ffa7:2d32])
 (user=kaleshsingh job=sendgmr) by 2002:a25:aaaa:0:b0:e30:d61e:b110 with SMTP
 id 3f1490d57ef6-e337f8bfd18mr20453276.5.1731371639080; Mon, 11 Nov 2024
 16:33:59 -0800 (PST)
Date: Mon, 11 Nov 2024 16:32:50 -0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Message-ID: <20241112003336.1375584-1-kaleshsingh@google.com>
Subject: [PATCH v2] arm64: kvm: Introduce nvhe stack size constants
From: Kalesh Singh <kaleshsingh@google.com>
To: will@kernel.or, maz@kernel.org, broonie@kernel.org, mark.rutland@arm.com
Cc: kernel-team@android.com, android-mm@google.com, 
	Kalesh Singh <kaleshsingh@google.com>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Ard Biesheuvel <ardb@kernel.org>, 
	D Scott Phillips <scott@os.amperecomputing.com>, Wang Jinchao <wangjinchao@xfusion.com>, 
	Ankit Agrawal <ankita@nvidia.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Puranjay Mohan <puranjay@kernel.org>, 
	"Madhavan T. Venkataraman" <madvenka@linux.microsoft.com>, Randy Dunlap <rdunlap@infradead.org>, 
	"=?UTF-8?q?Pierre-Cl=C3=A9ment=20Tosi?=" <ptosi@google.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_163401_325047_B4AE6EBF 
X-CRM114-Status: GOOD (  23.66  )
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

Refactor nvhe stack code to use NVHE_STACK_SIZE/SHIFT constants,
instead of directly using PAGE_SIZE/SHIFT. This makes the code a bit
easier to read, without introducing any functional changes.

Cc: Marc Zyngier <maz@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>
Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---

Changes in v2:
  - Drop Kconfig option for nVHE stack size

 arch/arm64/include/asm/memory.h          |  5 ++++-
 arch/arm64/include/asm/stacktrace/nvhe.h |  2 +-
 arch/arm64/kvm/arm.c                     | 18 +++++++++---------
 arch/arm64/kvm/hyp/nvhe/host.S           |  4 ++--
 arch/arm64/kvm/hyp/nvhe/mm.c             | 12 ++++++------
 arch/arm64/kvm/hyp/nvhe/stacktrace.c     |  4 ++--
 arch/arm64/kvm/mmu.c                     | 12 ++++++------
 arch/arm64/kvm/stacktrace.c              |  6 +++---
 8 files changed, 33 insertions(+), 30 deletions(-)

diff --git a/arch/arm64/include/asm/memory.h b/arch/arm64/include/asm/memory.h
index 0480c61dbb4f..96f236f0c141 100644
--- a/arch/arm64/include/asm/memory.h
+++ b/arch/arm64/include/asm/memory.h
@@ -145,13 +145,16 @@
 
 #define OVERFLOW_STACK_SIZE	SZ_4K
 
+#define NVHE_STACK_SHIFT       PAGE_SHIFT
+#define NVHE_STACK_SIZE        (UL(1) << NVHE_STACK_SHIFT)
+
 /*
  * With the minimum frame size of [x29, x30], exactly half the combined
  * sizes of the hyp and overflow stacks is the maximum size needed to
  * save the unwinded stacktrace; plus an additional entry to delimit the
  * end.
  */
-#define NVHE_STACKTRACE_SIZE	((OVERFLOW_STACK_SIZE + PAGE_SIZE) / 2 + sizeof(long))
+#define NVHE_STACKTRACE_SIZE	((OVERFLOW_STACK_SIZE + NVHE_STACK_SIZE) / 2 + sizeof(long))
 
 /*
  * Alignment of kernel segments (e.g. .text, .data).
diff --git a/arch/arm64/include/asm/stacktrace/nvhe.h b/arch/arm64/include/asm/stacktrace/nvhe.h
index 44759281d0d4..171f9edef49f 100644
--- a/arch/arm64/include/asm/stacktrace/nvhe.h
+++ b/arch/arm64/include/asm/stacktrace/nvhe.h
@@ -47,7 +47,7 @@ static inline void kvm_nvhe_unwind_init(struct unwind_state *state,
 
 DECLARE_KVM_NVHE_PER_CPU(unsigned long [OVERFLOW_STACK_SIZE/sizeof(long)], overflow_stack);
 DECLARE_KVM_NVHE_PER_CPU(struct kvm_nvhe_stacktrace_info, kvm_stacktrace_info);
-DECLARE_PER_CPU(unsigned long, kvm_arm_hyp_stack_page);
+DECLARE_PER_CPU(unsigned long, kvm_arm_hyp_stack_base);
 
 void kvm_nvhe_dump_backtrace(unsigned long hyp_offset);
 
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 48cafb65d6ac..d19bffbfcb9e 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -61,7 +61,7 @@ static enum kvm_wfx_trap_policy kvm_wfe_trap_policy __read_mostly = KVM_WFX_NOTR
 
 DECLARE_KVM_HYP_PER_CPU(unsigned long, kvm_hyp_vector);
 
-DEFINE_PER_CPU(unsigned long, kvm_arm_hyp_stack_page);
+DEFINE_PER_CPU(unsigned long, kvm_arm_hyp_stack_base);
 DECLARE_KVM_NVHE_PER_CPU(struct kvm_nvhe_init_params, kvm_init_params);
 
 DECLARE_KVM_NVHE_PER_CPU(struct kvm_cpu_context, kvm_hyp_ctxt);
@@ -2359,7 +2359,7 @@ static void __init teardown_hyp_mode(void)
 
 	free_hyp_pgds();
 	for_each_possible_cpu(cpu) {
-		free_page(per_cpu(kvm_arm_hyp_stack_page, cpu));
+		free_pages(per_cpu(kvm_arm_hyp_stack_base, cpu), NVHE_STACK_SHIFT - PAGE_SHIFT);
 		free_pages(kvm_nvhe_sym(kvm_arm_hyp_percpu_base)[cpu], nvhe_percpu_order());
 
 		if (free_sve) {
@@ -2547,15 +2547,15 @@ static int __init init_hyp_mode(void)
 	 * Allocate stack pages for Hypervisor-mode
 	 */
 	for_each_possible_cpu(cpu) {
-		unsigned long stack_page;
+		unsigned long stack_base;
 
-		stack_page = __get_free_page(GFP_KERNEL);
-		if (!stack_page) {
+		stack_base = __get_free_pages(GFP_KERNEL, NVHE_STACK_SHIFT - PAGE_SHIFT);
+		if (!stack_base) {
 			err = -ENOMEM;
 			goto out_err;
 		}
 
-		per_cpu(kvm_arm_hyp_stack_page, cpu) = stack_page;
+		per_cpu(kvm_arm_hyp_stack_base, cpu) = stack_base;
 	}
 
 	/*
@@ -2624,9 +2624,9 @@ static int __init init_hyp_mode(void)
 	 */
 	for_each_possible_cpu(cpu) {
 		struct kvm_nvhe_init_params *params = per_cpu_ptr_nvhe_sym(kvm_init_params, cpu);
-		char *stack_page = (char *)per_cpu(kvm_arm_hyp_stack_page, cpu);
+		char *stack_base = (char *)per_cpu(kvm_arm_hyp_stack_base, cpu);
 
-		err = create_hyp_stack(__pa(stack_page), &params->stack_hyp_va);
+		err = create_hyp_stack(__pa(stack_base), &params->stack_hyp_va);
 		if (err) {
 			kvm_err("Cannot map hyp stack\n");
 			goto out_err;
@@ -2638,7 +2638,7 @@ static int __init init_hyp_mode(void)
 		 * __hyp_pa() won't do the right thing there, since the stack
 		 * has been mapped in the flexible private VA space.
 		 */
-		params->stack_pa = __pa(stack_page);
+		params->stack_pa = __pa(stack_base);
 	}
 
 	for_each_possible_cpu(cpu) {
diff --git a/arch/arm64/kvm/hyp/nvhe/host.S b/arch/arm64/kvm/hyp/nvhe/host.S
index 3d610fc51f4d..58f0cb2298cc 100644
--- a/arch/arm64/kvm/hyp/nvhe/host.S
+++ b/arch/arm64/kvm/hyp/nvhe/host.S
@@ -188,12 +188,12 @@ SYM_FUNC_END(__host_hvc)
 
 	/*
 	 * Test whether the SP has overflowed, without corrupting a GPR.
-	 * nVHE hypervisor stacks are aligned so that the PAGE_SHIFT bit
+	 * nVHE hypervisor stacks are aligned so that the NVHE_STACK_SHIFT bit
 	 * of SP should always be 1.
 	 */
 	add	sp, sp, x0			// sp' = sp + x0
 	sub	x0, sp, x0			// x0' = sp' - x0 = (sp + x0) - x0 = sp
-	tbz	x0, #PAGE_SHIFT, .L__hyp_sp_overflow\@
+	tbz	x0, #NVHE_STACK_SHIFT, .L__hyp_sp_overflow\@
 	sub	x0, sp, x0			// x0'' = sp' - x0' = (sp + x0) - sp = x0
 	sub	sp, sp, x0			// sp'' = sp' - x0 = (sp + x0) - x0 = sp
 
diff --git a/arch/arm64/kvm/hyp/nvhe/mm.c b/arch/arm64/kvm/hyp/nvhe/mm.c
index 8850b591d775..f41c7440b34b 100644
--- a/arch/arm64/kvm/hyp/nvhe/mm.c
+++ b/arch/arm64/kvm/hyp/nvhe/mm.c
@@ -360,10 +360,10 @@ int pkvm_create_stack(phys_addr_t phys, unsigned long *haddr)
 
 	prev_base = __io_map_base;
 	/*
-	 * Efficient stack verification using the PAGE_SHIFT bit implies
+	 * Efficient stack verification using the NVHE_STACK_SHIFT bit implies
 	 * an alignment of our allocation on the order of the size.
 	 */
-	size = PAGE_SIZE * 2;
+	size = NVHE_STACK_SIZE * 2;
 	addr = ALIGN(__io_map_base, size);
 
 	ret = __pkvm_alloc_private_va_range(addr, size);
@@ -373,12 +373,12 @@ int pkvm_create_stack(phys_addr_t phys, unsigned long *haddr)
 		 * at the higher address and leave the lower guard page
 		 * unbacked.
 		 *
-		 * Any valid stack address now has the PAGE_SHIFT bit as 1
+		 * Any valid stack address now has the NVHE_STACK_SHIFT bit as 1
 		 * and addresses corresponding to the guard page have the
-		 * PAGE_SHIFT bit as 0 - this is used for overflow detection.
+		 * NVHE_STACK_SHIFT bit as 0 - this is used for overflow detection.
 		 */
-		ret = kvm_pgtable_hyp_map(&pkvm_pgtable, addr + PAGE_SIZE,
-					  PAGE_SIZE, phys, PAGE_HYP);
+		ret = kvm_pgtable_hyp_map(&pkvm_pgtable, addr + NVHE_STACK_SIZE,
+					  NVHE_STACK_SIZE, phys, PAGE_HYP);
 		if (ret)
 			__io_map_base = prev_base;
 	}
diff --git a/arch/arm64/kvm/hyp/nvhe/stacktrace.c b/arch/arm64/kvm/hyp/nvhe/stacktrace.c
index ed6b58b19cfa..5b6eeab1a774 100644
--- a/arch/arm64/kvm/hyp/nvhe/stacktrace.c
+++ b/arch/arm64/kvm/hyp/nvhe/stacktrace.c
@@ -28,7 +28,7 @@ static void hyp_prepare_backtrace(unsigned long fp, unsigned long pc)
 	struct kvm_nvhe_stacktrace_info *stacktrace_info = this_cpu_ptr(&kvm_stacktrace_info);
 	struct kvm_nvhe_init_params *params = this_cpu_ptr(&kvm_init_params);
 
-	stacktrace_info->stack_base = (unsigned long)(params->stack_hyp_va - PAGE_SIZE);
+	stacktrace_info->stack_base = (unsigned long)(params->stack_hyp_va - NVHE_STACK_SIZE);
 	stacktrace_info->overflow_stack_base = (unsigned long)this_cpu_ptr(overflow_stack);
 	stacktrace_info->fp = fp;
 	stacktrace_info->pc = pc;
@@ -54,7 +54,7 @@ static struct stack_info stackinfo_get_hyp(void)
 {
 	struct kvm_nvhe_init_params *params = this_cpu_ptr(&kvm_init_params);
 	unsigned long high = params->stack_hyp_va;
-	unsigned long low = high - PAGE_SIZE;
+	unsigned long low = high - NVHE_STACK_SIZE;
 
 	return (struct stack_info) {
 		.low = low,
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 0f7658aefa1a..e366ed8650fe 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -704,10 +704,10 @@ int create_hyp_stack(phys_addr_t phys_addr, unsigned long *haddr)
 
 	mutex_lock(&kvm_hyp_pgd_mutex);
 	/*
-	 * Efficient stack verification using the PAGE_SHIFT bit implies
+	 * Efficient stack verification using the NVHE_STACK_SHIFT bit implies
 	 * an alignment of our allocation on the order of the size.
 	 */
-	size = PAGE_SIZE * 2;
+	size = NVHE_STACK_SIZE * 2;
 	base = ALIGN_DOWN(io_map_base - size, size);
 
 	ret = __hyp_alloc_private_va_range(base);
@@ -724,12 +724,12 @@ int create_hyp_stack(phys_addr_t phys_addr, unsigned long *haddr)
 	 * at the higher address and leave the lower guard page
 	 * unbacked.
 	 *
-	 * Any valid stack address now has the PAGE_SHIFT bit as 1
+	 * Any valid stack address now has the NVHE_STACK_SHIFT bit as 1
 	 * and addresses corresponding to the guard page have the
-	 * PAGE_SHIFT bit as 0 - this is used for overflow detection.
+	 * NVHE_STACK_SHIFT bit as 0 - this is used for overflow detection.
 	 */
-	ret = __create_hyp_mappings(base + PAGE_SIZE, PAGE_SIZE, phys_addr,
-				    PAGE_HYP);
+	ret = __create_hyp_mappings(base + NVHE_STACK_SIZE, NVHE_STACK_SIZE,
+				    phys_addr, PAGE_HYP);
 	if (ret)
 		kvm_err("Cannot map hyp stack\n");
 
diff --git a/arch/arm64/kvm/stacktrace.c b/arch/arm64/kvm/stacktrace.c
index 3ace5b75813b..b9744a932920 100644
--- a/arch/arm64/kvm/stacktrace.c
+++ b/arch/arm64/kvm/stacktrace.c
@@ -50,7 +50,7 @@ static struct stack_info stackinfo_get_hyp(void)
 	struct kvm_nvhe_stacktrace_info *stacktrace_info
 				= this_cpu_ptr_nvhe_sym(kvm_stacktrace_info);
 	unsigned long low = (unsigned long)stacktrace_info->stack_base;
-	unsigned long high = low + PAGE_SIZE;
+	unsigned long high = low + NVHE_STACK_SIZE;
 
 	return (struct stack_info) {
 		.low = low,
@@ -60,8 +60,8 @@ static struct stack_info stackinfo_get_hyp(void)
 
 static struct stack_info stackinfo_get_hyp_kern_va(void)
 {
-	unsigned long low = (unsigned long)*this_cpu_ptr(&kvm_arm_hyp_stack_page);
-	unsigned long high = low + PAGE_SIZE;
+	unsigned long low = (unsigned long)*this_cpu_ptr(&kvm_arm_hyp_stack_base);
+	unsigned long high = low + NVHE_STACK_SIZE;
 
 	return (struct stack_info) {
 		.low = low,

base-commit: 59b723cd2adbac2a34fc8e12c74ae26ae45bf230
-- 
2.47.0.277.g8800431eea-goog


