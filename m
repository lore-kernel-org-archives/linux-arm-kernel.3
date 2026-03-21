Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60C79109449C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Mar 2026 21:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=axA4CmT69lySJPtNrwonfZ6h6uQsbmyagkZmN5oAwlA=; b=N5KDjJjrti9JDHDXf/A1vJunFW
	yryF3oVkbUfdAFjVQyXfpsziLd7UKLZZsT3Ge5iVZn2dKHRYJyWln/5DcZnjVE4VA9t0xJke8+gud
	ZNbYMnZYrXkESfRofy+xD/JQAiF5JPZ+jN3HL0JWYiceQEJfHwuGm2CJAsjG7LrlKADr42xDzgSWb
	jNs5xi6Q8bMAv4abhVugJ++G+jgVRfewh2HRbAhfilukQTKQALK/6ZRl+B6gViSObbZ4lCXnkikjK
	hAi3k2OOBBBz+9w20vniajlAoy5PmT/q+owU1pmi3jru94ICTNE3ymiZ9NnYI2Xy6Mp84Fwl31TcN
	lxV0+Obw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w43oG-0000000Enoc-3qJH;
	Sat, 21 Mar 2026 21:24:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w43oG-0000000EnnD-1R8m
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Mar 2026 21:24:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E19EF60123;
	Sat, 21 Mar 2026 21:24:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF480C2BC9E;
	Sat, 21 Mar 2026 21:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774128278;
	bh=mt9QCzuG+fqyJU0ZxSFmuXm78+en65Zd6IdeoBjpJAQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=b3dlWC4P7NWXBi8U3X1oMzyfcFbN1RU/vPG3cD0xIvo8HmOu4nl8zLp11yiOeXUei
	 N8vkV30YqUTaBfyozUZLQ1uzIX0ks6q8aY0W5ejnknqTb5QK94k/ocuuvLBAh40TnT
	 vcY1MM3rTC+r/2rPAMzf9Umx1YTIEWI23W+imr2rUkxxvghmEUc8xlJ1L7k5Hn/FZw
	 nP/TBtZXWTC6RqBa1mWYuBtcFzRhISteB42Cro9myepHi0R6urut8erlGe3VqN8wpa
	 lLx4n6s9XVFhbDPovetgXU14PsFs2y04MmLO2e/pebk9ki0Y/0PIBrppx7u5s4fM7X
	 R9zACdT4JJ4UA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1w43oC-00000004NPB-3Aqg;
	Sat, 21 Mar 2026 21:24:36 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>,
	Mostafa Saleh <smostafa@google.com>,
	Quentin Perret <qperret@google.com>
Subject: [PATCH 4/5] KVM: arm64: pkvm: Use direct function pointers for cpu_{on,resume}
Date: Sat, 21 Mar 2026 21:24:18 +0000
Message-ID: <20260321212419.2803972-5-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260321212419.2803972-1-maz@kernel.org>
References: <20260321212419.2803972-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, tabba@google.com, will@kernel.org, smostafa@google.com, qperret@google.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

Instead of using a boolean to decide whether a CPU is booting or
resuming, just pass an actual function pointer around.

This makes the code a bit more straightforward to understand.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/kvm_asm.h     |  3 ++-
 arch/arm64/kvm/hyp/nvhe/hyp-init.S   |  9 +++----
 arch/arm64/kvm/hyp/nvhe/psci-relay.c | 39 +++++++++++++++++-----------
 3 files changed, 29 insertions(+), 22 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
index a1ad12c72ebf1..f4c769857fdfc 100644
--- a/arch/arm64/include/asm/kvm_asm.h
+++ b/arch/arm64/include/asm/kvm_asm.h
@@ -291,7 +291,8 @@ asmlinkage void __noreturn hyp_panic_bad_stack(void);
 asmlinkage void kvm_unexpected_el2_exception(void);
 struct kvm_cpu_context;
 void handle_trap(struct kvm_cpu_context *host_ctxt);
-asmlinkage void __noreturn __kvm_host_psci_cpu_entry(bool is_cpu_on);
+asmlinkage void __noreturn __kvm_host_psci_cpu_on_entry(void);
+asmlinkage void __noreturn __kvm_host_psci_cpu_resume_entry(void);
 void __noreturn __pkvm_init_finalise(void);
 void kvm_nvhe_prepare_backtrace(unsigned long fp, unsigned long pc);
 void kvm_patch_vector_branch(struct alt_instr *alt,
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-init.S b/arch/arm64/kvm/hyp/nvhe/hyp-init.S
index 2e80fcbff2dff..64296b31da73d 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-init.S
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-init.S
@@ -173,7 +173,7 @@ SYM_CODE_END(___kvm_hyp_init)
  * x0: struct kvm_nvhe_init_params PA
  */
 SYM_CODE_START(kvm_hyp_cpu_entry)
-	mov	x1, #1				// is_cpu_on = true
+	ldr	x29, =__kvm_host_psci_cpu_on_entry
 	b	__kvm_hyp_init_cpu
 
 /*
@@ -182,11 +182,10 @@ SYM_CODE_START(kvm_hyp_cpu_entry)
  * x0: struct kvm_nvhe_init_params PA
  */
 SYM_CODE_START(kvm_hyp_cpu_resume)
-	mov	x1, #0				// is_cpu_on = false
+	ldr	x29, =__kvm_host_psci_cpu_resume_entry
 
 SYM_INNER_LABEL(__kvm_hyp_init_cpu, SYM_L_LOCAL)
 	mov	x28, x0				// Stash arguments
-	mov	x29, x1
 
 	/* Check that the core was booted in EL2. */
 	mrs	x0, CurrentEL
@@ -204,9 +203,7 @@ SYM_INNER_LABEL(__kvm_hyp_init_cpu, SYM_L_LOCAL)
 	bl	___kvm_hyp_init			// Clobbers x0..x2
 
 	/* Leave idmap -- using BLR is OK, LR is restored from host context */
-	mov	x0, x29
-	ldr	x1, =__kvm_host_psci_cpu_entry
-	blr	x1
+	blr	x29
 
 	// The core booted in EL1, or the C code unexpectedly returned.
 	// Either way, KVM cannot be initialized on it.
diff --git a/arch/arm64/kvm/hyp/nvhe/psci-relay.c b/arch/arm64/kvm/hyp/nvhe/psci-relay.c
index c3e196fb8b18f..cc698ceee9c8c 100644
--- a/arch/arm64/kvm/hyp/nvhe/psci-relay.c
+++ b/arch/arm64/kvm/hyp/nvhe/psci-relay.c
@@ -200,23 +200,12 @@ static int psci_system_suspend(u64 func_id, struct kvm_cpu_context *host_ctxt)
 			 __hyp_pa(init_params), 0);
 }
 
-asmlinkage void __noreturn __kvm_host_psci_cpu_entry(bool is_cpu_on)
+static void __noreturn __kvm_host_psci_cpu_entry(unsigned long pc, unsigned long r0)
 {
-	struct psci_boot_args *boot_args;
-	struct kvm_cpu_context *host_ctxt;
-
-	host_ctxt = host_data_ptr(host_ctxt);
-
-	if (is_cpu_on)
-		boot_args = this_cpu_ptr(&cpu_on_args);
-	else
-		boot_args = this_cpu_ptr(&suspend_args);
-
-	cpu_reg(host_ctxt, 0) = boot_args->r0;
-	write_sysreg_el2(boot_args->pc, SYS_ELR);
+	struct kvm_cpu_context *host_ctxt = host_data_ptr(host_ctxt);
 
-	if (is_cpu_on)
-		release_boot_args(boot_args);
+	cpu_reg(host_ctxt, 0) = r0;
+	write_sysreg_el2(pc, SYS_ELR);
 
 	write_sysreg_el1(INIT_SCTLR_EL1_MMU_OFF, SYS_SCTLR);
 	write_sysreg(INIT_PSTATE_EL1, SPSR_EL2);
@@ -224,6 +213,26 @@ asmlinkage void __noreturn __kvm_host_psci_cpu_entry(bool is_cpu_on)
 	__host_enter(host_ctxt);
 }
 
+asmlinkage void __noreturn __kvm_host_psci_cpu_on_entry(void)
+{
+	struct psci_boot_args *boot_args = this_cpu_ptr(&cpu_on_args);
+	unsigned long pc, r0;
+
+	pc = READ_ONCE(boot_args->pc);
+	r0 = READ_ONCE(boot_args->r0);
+
+	release_boot_args(boot_args);
+
+	__kvm_host_psci_cpu_entry(pc, r0);
+}
+
+asmlinkage void __noreturn __kvm_host_psci_cpu_resume_entry(void)
+{
+	struct psci_boot_args *boot_args = this_cpu_ptr(&cpu_on_args);
+
+	__kvm_host_psci_cpu_entry(boot_args->pc, boot_args->r0);
+}
+
 static unsigned long psci_0_1_handler(u64 func_id, struct kvm_cpu_context *host_ctxt)
 {
 	if (is_psci_0_1(cpu_off, func_id) || is_psci_0_1(migrate, func_id))
-- 
2.47.3


