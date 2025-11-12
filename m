Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2938BCD3437
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 17:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1lzPVIM0jk6lCfmTlDsfm5un5OoFWyFqiOUlY/XxPP4=; b=OxobUdCPg/hmF4SnspxZUy6Ee7
	BRZPlUkL+YIZpuwcc+oTH82fR79H3IwQlFe51yXWeZmPa9/4OVtfOk0oPG2xxnz22C5bNvngw0+x8
	WE9dQnAKa18slBD/oWhYZeK2Rfcwm1h2lbUNiLHzRn58a77WQIQbObf8EP8ouf4lXLWBoNGXoPRxS
	foA44UgOQTOczGEoBUGBPbmb/GhAJS7lu2wb/32G/lqaboggWRZGxHHZZfQfYk925ZljBHCxWAoRI
	toBPYnsCGEveX7g+DBmeaGK2oaNFi4YjGYCpELwAoCxXrO02/sbqj6toxECZDuINP75wRr+URTkuI
	JTXN3tqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJF2H-00000009HGU-1Q38;
	Wed, 12 Nov 2025 17:53:37 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJF2C-00000009HE3-1kFh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 17:53:33 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-477792eb8e4so7222665e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 09:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762970010; x=1763574810; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1lzPVIM0jk6lCfmTlDsfm5un5OoFWyFqiOUlY/XxPP4=;
        b=1v9t2VYGrvrGbqrAn/blQXyh2eelCdOZ0EvOHKi+nH7x1XX8h0w15ZsYWL/4XZ3FU+
         Nrg1GsVeVrLNCYnitzWElij5ePFE0rXhNcw5UQfePxeWhe5M/8O/FgxHRYWmCr/sF+y8
         KWhG+kwZwUN21afQBf33ZOF/r919eAKLNk16lvpge33jyJhwsuwjr2f9p9kYpK5Nxf9B
         4218oaVxd+TUWR+1AlDXHwAEwEHtm+Nj8OR67Xgd4JCt8pYYDIjB5hRdYcb/3MAdISMZ
         GICGpvl0/ZO8bCbMU5YkY5d/Ly0Bgf6pDLM3yNfa2L27ghB7c96llXO9XRB3NBg+KEjU
         fuBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762970010; x=1763574810;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1lzPVIM0jk6lCfmTlDsfm5un5OoFWyFqiOUlY/XxPP4=;
        b=Jqoj2JqB6137ZewoQS8FQSO15sYA2z2BNa0BNVTfLVpndYbMzCsiiM89L0GIyswMCk
         TWN744c/XMAmi56CDkKhBtxQ1vemi+h1bx/qdOxkTr2qU+oPLnCbF/jblNuTTSpDQdjQ
         /eSbiQWe0Rs+B7iCMGslzl5ZhZeeK72CILDwgq9IzsvhJv3XUhZLgKfar1WGPYnLVBPR
         Bd9b8qNinBfBVKkUzzJt/VrUO+C8yenZTNcFrXiTG0NBG9QEaWUlS7g1svfN3oaaHcOe
         RQy5XoQBsSpk6OdyJNuPoGURbLkxJ8dfSvlBqU6DSzM4f8P3fgSu5eVeB95k3/wHweWA
         ANlw==
X-Gm-Message-State: AOJu0YzurTztuv1i+5HwoaaNFbu0cLgLyw+jbiWteRQ858s/WDzSz/a3
	QuxmW+af0EJxvloAbehTjHLPTswRCHcDvwCxqGT50DH+K6YlmL+B//Whj7VjqN3IkXSzs+n1r+z
	BQt9TeUo21F/ujJ3MPARRq/ZNBgQp4N2CgJm97fpZSON0yCpdU8mix2JbviMJ4YGDc4vQZf2GTq
	2qTHn/91Nj5auo15on2GuYhtvqIYxa5c6PpUQkixNLOBpE
X-Google-Smtp-Source: AGHT+IGIMXmYeRKXlEYO/PcQd+fxrWZjo1uSvFM0H1BRc6rGvHjPZtyXCBPm01G3tFei08dAZ/y0oJAk
X-Received: from wmat24.prod.google.com ([2002:a05:600c:6d18:b0:471:6089:1622])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:c87:b0:477:7f4a:44bd
 with SMTP id 5b1f17b1804b1-4778bc98ae5mr2813645e9.0.1762970010295; Wed, 12
 Nov 2025 09:53:30 -0800 (PST)
Date: Wed, 12 Nov 2025 18:53:19 +0100
In-Reply-To: <20251112175316.2841017-4-ardb+git@google.com>
Mime-Version: 1.0
References: <20251112175316.2841017-4-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=6331; i=ardb@kernel.org;
 h=from:subject; bh=7htj8rfQixeDPnEtJrTCJldExjmPThxir1A3bYKWWBY=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIVPkZP+Dtbe1qqzs7utJ6lceDFJJmPnok/HZlxoLcr84M
 vMx8CztKGVhEONikBVTZBGY/ffdztMTpWqdZ8nCzGFlAhnCwMUpABOxP8rIMMM5U3V6LStTx9Kb
 Cec/r1Gpz741d87hkpnzlB4wbKxvOcTwz3CJl0Yo94FbgZrRrwtP7Y423CYiUGtRNLXGT2jFbp6 bvAA=
X-Mailer: git-send-email 2.52.0.rc1.455.g30608eb744-goog
Message-ID: <20251112175316.2841017-6-ardb+git@google.com>
Subject: [PATCH 2/2] arm64/efi: Remove unneeded SVE/SME fallback
 preserve/store handling
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-efi@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>, 
	Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_095332_514659_1668D5E3 
X-CRM114-Status: GOOD (  26.19  )
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

From: Ard Biesheuvel <ardb@kernel.org>

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
2.52.0.rc1.455.g30608eb744-goog


