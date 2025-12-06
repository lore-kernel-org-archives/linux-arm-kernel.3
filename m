Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0902D3B7DB
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Dec 2025 19:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xgWJGScccaZn9w2hGf5XunkrVJUFxZ74Q2DgFP4AVF0=; b=SBdkocdo78tp2sjZ+t0PYHl787
	8lSj2t/f7ZAgz94fbdRDGZzqyZi5NkbGtDDBGQOSZGb4ABU40hZP1kSEMgKf7p2B9sHYQst9lYGJ8
	rSJ2gFOothmHHmKkLMrqd6FZ+4vo1avku3zr4EGnTsU+Q3LQ77S4us3XumpOy2tWFLs4eOm0Q4ein
	Znfl9txATCbGOBnAYiYOLruYFLfzc+/2QzNqZ1XgVAY0mslRVdsyiRc18o5HW1LA+DGRZWRD3Yv8/
	Py1DSFHxOFb975u6WE83QWCAwdsDtaMoS1pts7TYvSTtBqv9a0uL5TZs65RGCCWYRAL4sPto5XLx5
	4ogHx5Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRxX7-0000000B9Fo-2eUa;
	Sat, 06 Dec 2025 19:01:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRxX5-0000000B9F6-3qbq
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Dec 2025 19:01:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EECF060097;
	Sat,  6 Dec 2025 19:01:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48C3DC19421;
	Sat,  6 Dec 2025 19:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765047686;
	bh=kUUjaKsfohqrNmtXxJEaE0d09l9YyYzcjeOynrmblQM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tv40BQXfdLIk/yP5RiseJljnqKqUZmIuTCRsQ9h5RmI5BpdLconbIiFydu2GFVZty
	 234WyIHz2zlWYImQWts/VQi9Ln9WcqkYtoo/034RElw1Uc2Hr9m3JQ3n0/1H7FjUlS
	 /A1+I3wxk9Ie/wDjui55ck8Vmjf99pLrT8wm5IE3gtgJdN45wlkayDG/glalyAUlUR
	 t3T6Mb9bOp5PA0beg25SBXj0T3AxhxEkUa+fxQyi326hOrmkmjm85EUtofXz/R7QQw
	 QLO3VH0FFe4SJgMk2VjaG4GHOlleXIpgvTDrzQnCpxpMxtJQIF28RL4je5CLo6JbiQ
	 eZ9OHLIgsirtg==
From: Ard Biesheuvel <ardb@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-efi@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Kees Cook <keescook@chromium.org>
Subject: [PATCH v2 2/2] arm64/efi: Remove unneeded SVE/SME fallback preserve/store handling
Date: Sat,  6 Dec 2025 20:01:17 +0100
Message-ID: <20251206190114.892262-6-ardb@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251206190114.892262-4-ardb@kernel.org>
References: <20251206190114.892262-4-ardb@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6306; i=ardb@kernel.org; h=from:subject; bh=kUUjaKsfohqrNmtXxJEaE0d09l9YyYzcjeOynrmblQM=; b=owGbwMvMwCVmkMcZplerG8N4Wi2JIdOktvaM6fdHmyYwFxqwTNxQmyrTmrHVJ6J8jvR296SNy zjuCE7pKGVhEONikBVTZBGY/ffdztMTpWqdZ8nCzGFlAhnCwMUpABNZzcPwP+l0x9FTJdyfv339 dW2D3Jz/U9e9SuYKm/+S+RxHe0e4QSzD/xoNoTsV8w91LTi1N79sQqzCH+YfRzP1mQ+euNkRKlh gxwQA
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
Content-Transfer-Encoding: 8bit
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

Since commit 7137a203b251 ("arm64/fpsimd: Permit kernel mode NEON with
IRQs off"), the only condition under which the fallback path is taken
for FP/SIMD preserve/restore across a EFI runtime call is when it is
called from hardirq or NMI context.

In practice, this only happens when the EFI pstore driver is called to
dump the kernel log buffer into a EFI variable under a panic, oops or
emergency_restart() condition, and none of these can be expected to
result in a return to user space for the task in question.

This means that the existing EFI-specific logic for preserving and
restoring SVE/SME state is pointless, and can be removed.

Instead, kill the task, so that an exceedingly unlikely inadvertent
return to user space does not proceed with a corrupted FP/SIMD state.
Also, retain the preserve and restore of the base FP/SIMD state, as that
might belong to kernel mode use of FP/SIMD. (Note that EFI runtime calls
are never invoked reentrantly, even in this case, and so any interrupted
kernel mode FP/SIMD usage will be unrelated to EFI)

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/kernel/fpsimd.c | 130 +++-----------------
 1 file changed, 20 insertions(+), 110 deletions(-)

diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index c154f72634e0..9de1d8a604cb 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -180,13 +180,6 @@ static inline void set_sve_default_vl(int val)
 	set_default_vl(ARM64_VEC_SVE, val);
 }
 
-static u8 *efi_sve_state;
-
-#else /* ! CONFIG_ARM64_SVE */
-
-/* Dummy declaration for code that will be optimised out: */
-extern u8 *efi_sve_state;
-
 #endif /* ! CONFIG_ARM64_SVE */
 
 #ifdef CONFIG_ARM64_SME
@@ -1095,36 +1088,6 @@ int vec_verify_vq_map(enum vec_type type)
 	return 0;
 }
 
-static void __init sve_efi_setup(void)
-{
-	int max_vl = 0;
-	int i;
-
-	if (!IS_ENABLED(CONFIG_EFI))
-		return;
-
-	for (i = 0; i < ARRAY_SIZE(vl_info); i++)
-		max_vl = max(vl_info[i].max_vl, max_vl);
-
-	/*
-	 * alloc_percpu() warns and prints a backtrace if this goes wrong.
-	 * This is evidence of a crippled system and we are returning void,
-	 * so no attempt is made to handle this situation here.
-	 */
-	if (!sve_vl_valid(max_vl))
-		goto fail;
-
-	efi_sve_state = kmalloc(SVE_SIG_REGS_SIZE(sve_vq_from_vl(max_vl)),
-				GFP_KERNEL);
-	if (!efi_sve_state)
-		goto fail;
-
-	return;
-
-fail:
-	panic("Cannot allocate memory for EFI SVE save/restore");
-}
-
 void cpu_enable_sve(const struct arm64_cpu_capabilities *__always_unused p)
 {
 	write_sysreg(read_sysreg(CPACR_EL1) | CPACR_EL1_ZEN_EL1EN, CPACR_EL1);
@@ -1185,8 +1148,6 @@ void __init sve_setup(void)
 	if (sve_max_virtualisable_vl() < sve_max_vl())
 		pr_warn("%s: unvirtualisable vector lengths present\n",
 			info->name);
-
-	sve_efi_setup();
 }
 
 /*
@@ -1947,9 +1908,6 @@ EXPORT_SYMBOL_GPL(kernel_neon_end);
 #ifdef CONFIG_EFI
 
 static struct user_fpsimd_state efi_fpsimd_state;
-static bool efi_fpsimd_state_used;
-static bool efi_sve_state_used;
-static bool efi_sm_state;
 
 /*
  * EFI runtime services support functions
@@ -1976,43 +1934,26 @@ void __efi_fpsimd_begin(void)
 	if (may_use_simd()) {
 		kernel_neon_begin(&efi_fpsimd_state);
 	} else {
-		WARN_ON(preemptible());
-
 		/*
-		 * If !efi_sve_state, SVE can't be in use yet and doesn't need
-		 * preserving:
+		 * We are running in hardirq or NMI context, and the only
+		 * legitimate case where this might happen is when EFI pstore
+		 * is attempting to record the system's dying gasps into EFI
+		 * variables. This could be due to an oops, a panic or a call
+		 * to emergency_restart(), and in none of those cases, we can
+		 * expect the current task to ever return to user space again,
+		 * or for the kernel to resume any normal execution, for that
+		 * matter (an oops in hardirq context triggers a panic too).
+		 *
+		 * Therefore, there is no point in attempting to preserve any
+		 * SVE/SME state here. On the off chance that we might have
+		 * ended up here for a different reason inadvertently, kill the
+		 * task and preserve/restore the base FP/SIMD state, which
+		 * might belong to kernel mode FP/SIMD.
 		 */
-		if (system_supports_sve() && efi_sve_state != NULL) {
-			bool ffr = true;
-			u64 svcr;
-
-			efi_sve_state_used = true;
-
-			if (system_supports_sme()) {
-				svcr = read_sysreg_s(SYS_SVCR);
-
-				efi_sm_state = svcr & SVCR_SM_MASK;
-
-				/*
-				 * Unless we have FA64 FFR does not
-				 * exist in streaming mode.
-				 */
-				if (!system_supports_fa64())
-					ffr = !(svcr & SVCR_SM_MASK);
-			}
-
-			sve_save_state(efi_sve_state + sve_ffr_offset(sve_max_vl()),
-				       &efi_fpsimd_state.fpsr, ffr);
-
-			if (system_supports_sme())
-				sysreg_clear_set_s(SYS_SVCR,
-						   SVCR_SM_MASK, 0);
-
-		} else {
-			fpsimd_save_state(&efi_fpsimd_state);
-		}
-
-		efi_fpsimd_state_used = true;
+		pr_warn_ratelimited("Calling EFI runtime from %s context\n",
+				    in_nmi() ? "NMI" : "hardirq");
+		force_signal_inject(SIGKILL, SI_KERNEL, 0, 0);
+		fpsimd_save_state(&efi_fpsimd_state);
 	}
 }
 
@@ -2024,41 +1965,10 @@ void __efi_fpsimd_end(void)
 	if (!system_supports_fpsimd())
 		return;
 
-	if (!efi_fpsimd_state_used) {
+	if (may_use_simd()) {
 		kernel_neon_end(&efi_fpsimd_state);
 	} else {
-		if (system_supports_sve() && efi_sve_state_used) {
-			bool ffr = true;
-
-			/*
-			 * Restore streaming mode; EFI calls are
-			 * normal function calls so should not return in
-			 * streaming mode.
-			 */
-			if (system_supports_sme()) {
-				if (efi_sm_state) {
-					sysreg_clear_set_s(SYS_SVCR,
-							   0,
-							   SVCR_SM_MASK);
-
-					/*
-					 * Unless we have FA64 FFR does not
-					 * exist in streaming mode.
-					 */
-					if (!system_supports_fa64())
-						ffr = false;
-				}
-			}
-
-			sve_load_state(efi_sve_state + sve_ffr_offset(sve_max_vl()),
-				       &efi_fpsimd_state.fpsr, ffr);
-
-			efi_sve_state_used = false;
-		} else {
-			fpsimd_load_state(&efi_fpsimd_state);
-		}
-
-		efi_fpsimd_state_used = false;
+		fpsimd_load_state(&efi_fpsimd_state);
 	}
 }
 
-- 
2.47.3


