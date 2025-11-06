Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E48ECCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 13:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zk0hSGMdNmcO2aaoSMkmZgbL3yCpkYLYwRRGMJbNMUg=; b=g2qnuPklSLcnONDeQcOxjJNgs7
	i+KJuizIr1ebreAmvPSINYoOpJmwf7RoU5zKadU4dCzW0USLYaSELlWjYaZLfnenLnKMIygFN3OIj
	CuN9kAFinnZrabC2po/LKGbMAa6UNunp13OWCNZILnRemacWub01HhBAJppxlBGSGPv8WN6sfxV8A
	sZ7cEl85xBSgivORWj8Q/buKxajO4TdJRHL4ZUHx0/q5xVUJIc2f8RS4HXMPoBKzkjW3wEYS49mLj
	PKt9+yy2WfgBe4yOpeL8CBXMTGtLfw0/pRurQoykyLaAUVMIczUuKdMOVFZiBrQD8pG8FctIHXgF9
	0kiqRQCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH0U8-0000000FeGL-11dd;
	Thu, 06 Nov 2025 13:57:08 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH0U5-0000000FeFh-2nDO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 13:57:06 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2953ad5517dso10095965ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 05:57:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762437424; x=1763042224; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zk0hSGMdNmcO2aaoSMkmZgbL3yCpkYLYwRRGMJbNMUg=;
        b=jRaTlb8FjwQnqnkK1X7SqgODdsApUcU8NFv2zNoGQDXyAERVkx6awqn35q66u3j/PM
         za6kSrSI15yJPPm/oyo6blcK111OdpWfsbMz6YOF1/IQGNB8eAh1KqAI0nflI+5SQTXn
         dKB+IXFXDz2lMlYfFC5TJwqJvT3+1lbwh/D2Mz7m9NeVkYBLhSOjrp52mwiKlnc794GZ
         tqdiygtbmIAzOQ7m5iWTE3lKhZSpe+wweO7d0LsYd/IqZiVUxvhIxqVx6ipGlhAFCir1
         UHu6TupsptztZE8tWDZcDva125e1OK+Zp0XOGIFLLORxdBTBtTlDiwV7jUtB3QPYv/2V
         +k2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762437424; x=1763042224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zk0hSGMdNmcO2aaoSMkmZgbL3yCpkYLYwRRGMJbNMUg=;
        b=urtzspiM6b8m36zT0/YpQ6FCo1qfUPNg5sFllp+tT7lF02QyHQ9Lu8DQM6a23a4hg1
         lVLY0YpDksVccy7v+xhOH/oVOK3Cu2HI2+pka6WSJJNhwAA2fLNUm7P+3VRGIefpEjCy
         mG/0M997UO5vWyr8mADP0XYOmgHF9WrBsneoHjRlA16UkdBXykLrqa6RQMYIC4FTgM2Z
         dVz8dnhb28BeSnrDDVKvsm6Dqt4wAcNbTAfIpEE30Uh8ZRNTidCaOpItgx2J5WhxZ44h
         Am7CoqqyewC8PSW2mC+2V0DEQWgeC+64A6wo457urfFeLn8yfD2WkibPpigwI2to31Qf
         qvsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOepy9aqcZvBQKu/MELAuRjGz3xZNUp8oFpkKqQMXUmfQYs3dJzxFoG3tbn6MB1fdv9MBys0aJIRBA0KQbjQZv@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9qN74B5Ze73kzox7h6qoGHZhtnFODF0eXudddwS93m1fww4of
	gR/QhoSkH+cwYeXqp8xq8gmZ2v+Nx/DN2SH1LdRNtZVmhwOPGQJCweNt
X-Gm-Gg: ASbGncs+zu+xBBQ8mUulvuHWE5lkgWbMCazzxTJFDJCUKNzA3LzE97toO5DgVfYeHyV
	O/NvaGvSLRBCs7gLJbL+ehKUfAJHEKieadEpNGNnXvKm6FSTRJIER5WZbRNyfEWpSeF14QizbPI
	5jJKnIed0NJvPd0kErPWkedBJ73mPJUiqYXfHndDU2HtTTmV1702y3k/409IZv/pu+hP907sD5g
	LqJCdu4H6xl22WYv21y1eg7ETUxRovCXRqKl9jy2+QcjspHTLPvECpLlLrhNHLYdOQVcxHFI+FQ
	YaFGjo8G0gkfArfYcD4dgpkhqqPxgLghLxLoyWZe4mGptzDzbvS1PQUiru0miP1FJjiC8cHSQxJ
	KWAfvrxehbyHPim+6nNPSQd7U+1YPMI/tvQD1bZZwFATIXyDWDln7k41Im6kpfbCTEs12xWQXGg
	==
X-Google-Smtp-Source: AGHT+IFSlCh2xOVnYKc19IDVXeUpYAZ82vxUuFNJoqpZ/lT1BpyDzOE653dSdbmHWllLs6qxlighWg==
X-Received: by 2002:a17:903:1ae4:b0:295:2cb6:f4a2 with SMTP id d9443c01a7336-2962ae9414dmr99721585ad.55.1762437423861;
        Thu, 06 Nov 2025 05:57:03 -0800 (PST)
Received: from n.. ([171.61.239.77])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651cb47dbsm29955905ad.96.2025.11.06.05.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 05:57:03 -0800 (PST)
From: mrigendrachaubey <mrigendra.chaubey@gmail.com>
To: will@kernel.org
Cc: catalin.marinas@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	mrigendrachaubey <mrigendra.chaubey@gmail.com>
Subject: [PATCH v2] arm64: Fix typos and spelling errors in comments
Date: Thu,  6 Nov 2025 19:26:55 +0530
Message-Id: <20251106135655.8441-1-mrigendra.chaubey@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <aQoF3pu8CjO3tAl6@willie-the-truck>
References: <aQoF3pu8CjO3tAl6@willie-the-truck>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_055705_725515_A0580770 
X-CRM114-Status: GOOD (  35.72  )
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

This patch corrects several minor typographical and spelling errors
in comments across multiple arm64 source files.

No functional changes.

Signed-off-by: mrigendrachaubey <mrigendra.chaubey@gmail.com>
---
 arch/arm64/include/asm/assembler.h  | 4 ++--
 arch/arm64/include/asm/cpufeature.h | 4 ++--
 arch/arm64/include/asm/el2_setup.h  | 2 +-
 arch/arm64/include/asm/pgtable.h    | 4 ++--
 arch/arm64/include/asm/suspend.h    | 2 +-
 arch/arm64/kernel/acpi.c            | 2 +-
 arch/arm64/kernel/cpufeature.c      | 2 +-
 arch/arm64/kernel/ftrace.c          | 2 +-
 arch/arm64/kernel/machine_kexec.c   | 2 +-
 arch/arm64/kernel/probes/uprobes.c  | 2 +-
 arch/arm64/kernel/sdei.c            | 2 +-
 arch/arm64/kernel/smp.c             | 4 ++--
 arch/arm64/kernel/traps.c           | 2 +-
 arch/arm64/kvm/arch_timer.c         | 2 +-
 arch/arm64/kvm/hyp/nvhe/ffa.c       | 2 +-
 arch/arm64/kvm/mmu.c                | 2 +-
 arch/arm64/kvm/nested.c             | 2 +-
 arch/arm64/net/bpf_jit_comp.c       | 2 +-
 18 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/arch/arm64/include/asm/assembler.h b/arch/arm64/include/asm/assembler.h
index 23be85d93348..b8b1229e05e5 100644
--- a/arch/arm64/include/asm/assembler.h
+++ b/arch/arm64/include/asm/assembler.h
@@ -371,7 +371,7 @@ alternative_endif
  * [start, end) with dcache line size explicitly provided.
  *
  * 	op:		operation passed to dc instruction
- * 	domain:		domain used in dsb instruciton
+ * 	domain:		domain used in dsb instruction
  * 	start:          starting virtual address of the region
  * 	end:            end virtual address of the region
  *	linesz:		dcache line size
@@ -412,7 +412,7 @@ alternative_endif
  * [start, end)
  *
  * 	op:		operation passed to dc instruction
- * 	domain:		domain used in dsb instruciton
+ * 	domain:		domain used in dsb instruction
  * 	start:          starting virtual address of the region
  * 	end:            end virtual address of the region
  * 	fixup:		optional label to branch to on user fault
diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
index e223cbf350e4..71ba4a47ab18 100644
--- a/arch/arm64/include/asm/cpufeature.h
+++ b/arch/arm64/include/asm/cpufeature.h
@@ -199,7 +199,7 @@ extern struct arm64_ftr_reg arm64_ftr_reg_ctrel0;
  *    registers (e.g, SCTLR, TCR etc.) or patching the kernel via
  *    alternatives. The kernel patching is batched and performed at later
  *    point. The actions are always initiated only after the capability
- *    is finalised. This is usally denoted by "enabling" the capability.
+ *    is finalised. This is usually denoted by "enabling" the capability.
  *    The actions are initiated as follows :
  *	a) Action is triggered on all online CPUs, after the capability is
  *	finalised, invoked within the stop_machine() context from
@@ -251,7 +251,7 @@ extern struct arm64_ftr_reg arm64_ftr_reg_ctrel0;
 #define ARM64_CPUCAP_SCOPE_LOCAL_CPU		((u16)BIT(0))
 #define ARM64_CPUCAP_SCOPE_SYSTEM		((u16)BIT(1))
 /*
- * The capabilitiy is detected on the Boot CPU and is used by kernel
+ * The capability is detected on the Boot CPU and is used by kernel
  * during early boot. i.e, the capability should be "detected" and
  * "enabled" as early as possibly on all booting CPUs.
  */
diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
index b37da3ee8529..f593ce79fe15 100644
--- a/arch/arm64/include/asm/el2_setup.h
+++ b/arch/arm64/include/asm/el2_setup.h
@@ -28,7 +28,7 @@
 	 * Fruity CPUs seem to have HCR_EL2.E2H set to RAO/WI, but
 	 * don't advertise it (they predate this relaxation).
 	 *
-	 * Initalize HCR_EL2.E2H so that later code can rely upon HCR_EL2.E2H
+	 * Initialize HCR_EL2.E2H so that later code can rely upon HCR_EL2.E2H
 	 * indicating whether the CPU is running in E2H mode.
 	 */
 	mrs_s	x1, SYS_ID_AA64MMFR4_EL1
diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index aa89c2e67ebc..36bf4655bc3d 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -432,7 +432,7 @@ bool pgattr_change_is_safe(pteval_t old, pteval_t new);
  *   1      0      |   1           0          1
  *   1      1      |   0           1          x
  *
- * When hardware DBM is not present, the sofware PTE_DIRTY bit is updated via
+ * When hardware DBM is not present, the software PTE_DIRTY bit is updated via
  * the page fault mechanism. Checking the dirty status of a pte becomes:
  *
  *   PTE_DIRTY || (PTE_WRITE && !PTE_RDONLY)
@@ -598,7 +598,7 @@ static inline int pte_protnone(pte_t pte)
 	/*
 	 * pte_present_invalid() tells us that the pte is invalid from HW
 	 * perspective but present from SW perspective, so the fields are to be
-	 * interpretted as per the HW layout. The second 2 checks are the unique
+	 * interpreted as per the HW layout. The second 2 checks are the unique
 	 * encoding that we use for PROT_NONE. It is insufficient to only use
 	 * the first check because we share the same encoding scheme with pmds
 	 * which support pmd_mkinvalid(), so can be present-invalid without
diff --git a/arch/arm64/include/asm/suspend.h b/arch/arm64/include/asm/suspend.h
index 0cde2f473971..e65f33edf9d6 100644
--- a/arch/arm64/include/asm/suspend.h
+++ b/arch/arm64/include/asm/suspend.h
@@ -23,7 +23,7 @@ struct cpu_suspend_ctx {
  * __cpu_suspend_enter()'s caller, and populated by __cpu_suspend_enter().
  * This data must survive until cpu_resume() is called.
  *
- * This struct desribes the size and the layout of the saved cpu state.
+ * This struct describes the size and the layout of the saved cpu state.
  * The layout of the callee_saved_regs is defined by the implementation
  * of __cpu_suspend_enter(), and cpu_resume(). This struct must be passed
  * in by the caller as __cpu_suspend_enter()'s stack-frame is gone once it
diff --git a/arch/arm64/kernel/acpi.c b/arch/arm64/kernel/acpi.c
index 7aca29e1d30b..d1ac0e58651c 100644
--- a/arch/arm64/kernel/acpi.c
+++ b/arch/arm64/kernel/acpi.c
@@ -133,7 +133,7 @@ static int __init acpi_fadt_sanity_check(void)
 
 	/*
 	 * FADT is required on arm64; retrieve it to check its presence
-	 * and carry out revision and ACPI HW reduced compliancy tests
+	 * and carry out revision and ACPI HW reduced compliance tests
 	 */
 	status = acpi_get_table(ACPI_SIG_FADT, 0, &table);
 	if (ACPI_FAILURE(status)) {
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 5ed401ff79e3..5c673778e28f 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -1002,7 +1002,7 @@ static void __init sort_ftr_regs(void)
 
 /*
  * Initialise the CPU feature register from Boot CPU values.
- * Also initiliases the strict_mask for the register.
+ * Also initialises, the strict_mask for the register.
  * Any bits that are not covered by an arm64_ftr_bits entry are considered
  * RES0 for the system-wide value, and must strictly match.
  */
diff --git a/arch/arm64/kernel/ftrace.c b/arch/arm64/kernel/ftrace.c
index 5adad37ab4fa..5a1554a44162 100644
--- a/arch/arm64/kernel/ftrace.c
+++ b/arch/arm64/kernel/ftrace.c
@@ -492,7 +492,7 @@ int ftrace_make_nop(struct module *mod, struct dyn_ftrace *rec,
 		return ret;
 
 	/*
-	 * When using mcount, callsites in modules may have been initalized to
+	 * When using mcount, callsites in modules may have been initialized to
 	 * call an arbitrary module PLT (which redirects to the _mcount stub)
 	 * rather than the ftrace PLT we'll use at runtime (which redirects to
 	 * the ftrace trampoline). We can ignore the old PLT when initializing
diff --git a/arch/arm64/kernel/machine_kexec.c b/arch/arm64/kernel/machine_kexec.c
index 6f121a0164a4..239c16e3d02f 100644
--- a/arch/arm64/kernel/machine_kexec.c
+++ b/arch/arm64/kernel/machine_kexec.c
@@ -251,7 +251,7 @@ void crash_post_resume(void)
  * marked as Reserved as memory was allocated via memblock_reserve().
  *
  * In hibernation, the pages which are Reserved and yet "nosave" are excluded
- * from the hibernation iamge. crash_is_nosave() does thich check for crash
+ * from the hibernation image. crash_is_nosave() does thich check for crash
  * dump kernel and will reduce the total size of hibernation image.
  */
 
diff --git a/arch/arm64/kernel/probes/uprobes.c b/arch/arm64/kernel/probes/uprobes.c
index 2799bdb2fb82..941668800aea 100644
--- a/arch/arm64/kernel/probes/uprobes.c
+++ b/arch/arm64/kernel/probes/uprobes.c
@@ -131,7 +131,7 @@ void arch_uprobe_abort_xol(struct arch_uprobe *auprobe, struct pt_regs *regs)
 	struct uprobe_task *utask = current->utask;
 
 	/*
-	 * Task has received a fatal signal, so reset back to probbed
+	 * Task has received a fatal signal, so reset back to probed
 	 * address.
 	 */
 	instruction_pointer_set(regs, utask->vaddr);
diff --git a/arch/arm64/kernel/sdei.c b/arch/arm64/kernel/sdei.c
index 95169f7b6531..965b03fedfb8 100644
--- a/arch/arm64/kernel/sdei.c
+++ b/arch/arm64/kernel/sdei.c
@@ -202,7 +202,7 @@ unsigned long sdei_arch_get_entry_point(int conduit)
 /*
  * do_sdei_event() returns one of:
  *  SDEI_EV_HANDLED -  success, return to the interrupted context.
- *  SDEI_EV_FAILED  -  failure, return this error code to firmare.
+ *  SDEI_EV_FAILED  -  failure, return this error code to firmware.
  *  virtual-address -  success, return to this address.
  */
 unsigned long __kprobes do_sdei_event(struct pt_regs *regs,
diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 68cea3a4a35c..a0bfe624f899 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -350,7 +350,7 @@ void arch_cpuhp_cleanup_dead_cpu(unsigned int cpu)
 
 	/*
 	 * Now that the dying CPU is beyond the point of no return w.r.t.
-	 * in-kernel synchronisation, try to get the firwmare to help us to
+	 * in-kernel synchronisation, try to get the firmware to help us to
 	 * verify that it has really left the kernel before we consider
 	 * clobbering anything it might still be using.
 	 */
@@ -523,7 +523,7 @@ int arch_register_cpu(int cpu)
 
 	/*
 	 * Availability of the acpi handle is sufficient to establish
-	 * that _STA has aleady been checked. No need to recheck here.
+	 * that _STA has already been checked. No need to recheck here.
 	 */
 	c->hotpluggable = arch_cpu_is_hotpluggable(cpu);
 
diff --git a/arch/arm64/kernel/traps.c b/arch/arm64/kernel/traps.c
index 681939ef5d16..914282016069 100644
--- a/arch/arm64/kernel/traps.c
+++ b/arch/arm64/kernel/traps.c
@@ -922,7 +922,7 @@ void __noreturn panic_bad_stack(struct pt_regs *regs, unsigned long esr, unsigne
 	__show_regs(regs);
 
 	/*
-	 * We use nmi_panic to limit the potential for recusive overflows, and
+	 * We use nmi_panic to limit the potential for recursive overflows, and
 	 * to get a better stack trace.
 	 */
 	nmi_panic(NULL, "kernel stack overflow");
diff --git a/arch/arm64/kvm/arch_timer.c b/arch/arm64/kvm/arch_timer.c
index dbd74e4885e2..ebcb7f1a55ee 100644
--- a/arch/arm64/kvm/arch_timer.c
+++ b/arch/arm64/kvm/arch_timer.c
@@ -815,7 +815,7 @@ static void timer_set_traps(struct kvm_vcpu *vcpu, struct timer_map *map)
 		tpt = tpc = true;
 
 	/*
-	 * For the poor sods that could not correctly substract one value
+	 * For the poor sods that could not correctly subtract one value
 	 * from another, trap the full virtual timer and counter.
 	 */
 	if (has_broken_cntvoff() && timer_get_offset(map->direct_vtimer))
diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index 4e16f9b96f63..0ee7ebb2485e 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -115,7 +115,7 @@ static void ffa_set_retval(struct kvm_cpu_context *ctxt,
 	 *
 	 * FFA-1.3 introduces 64-bit variants of the CPU cycle management
 	 * interfaces. Moreover, FF-A 1.3 clarifies that SMC32 direct requests
-	 * complete with SMC32 direct reponses which *should* allow us use the
+	 * complete with SMC32 direct responses which *should* allow us use the
 	 * function ID sent by the caller to determine whether to return x8-x17.
 	 *
 	 * Note that we also cannot rely on function IDs in the response.
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 7cc964af8d30..9a6a80c3fbe5 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1755,7 +1755,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 
 	/*
 	 * Check if this is non-struct page memory PFN, and cannot support
-	 * CMOs. It could potentially be unsafe to access as cachable.
+	 * CMOs. It could potentially be unsafe to access as cacheable.
 	 */
 	if (vm_flags & (VM_PFNMAP | VM_MIXEDMAP) && !pfn_is_map_memory(pfn)) {
 		if (is_vma_cacheable) {
diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 7a045cad6bdf..4c16dbbd6e90 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -85,7 +85,7 @@ int kvm_vcpu_init_nested(struct kvm_vcpu *vcpu)
 	/*
 	 * Let's treat memory allocation failures as benign: If we fail to
 	 * allocate anything, return an error and keep the allocated array
-	 * alive. Userspace may try to recover by intializing the vcpu
+	 * alive. Userspace may try to recover by initializing the vcpu
 	 * again, and there is no reason to affect the whole VM for this.
 	 */
 	num_mmus = atomic_read(&kvm->online_vcpus) * S2_MMU_PER_VCPU;
diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.c
index ab83089c3d8f..26b93e0f11b1 100644
--- a/arch/arm64/net/bpf_jit_comp.c
+++ b/arch/arm64/net/bpf_jit_comp.c
@@ -3053,7 +3053,7 @@ bool bpf_jit_supports_exceptions(void)
 	/* We unwind through both kernel frames starting from within bpf_throw
 	 * call and BPF frames. Therefore we require FP unwinder to be enabled
 	 * to walk kernel frames and reach BPF frames in the stack trace.
-	 * ARM64 kernel is aways compiled with CONFIG_FRAME_POINTER=y
+	 * ARM64 kernel is always compiled with CONFIG_FRAME_POINTER=y
 	 */
 	return true;
 }
-- 
2.34.1


