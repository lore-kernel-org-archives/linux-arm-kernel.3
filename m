Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 516C1CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 10:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6H562hA4phalkuc9iW32nFe+iytT6ATVUAyAxRehk0A=; b=EVjkAp5tND1hCLqxdX/ugGpaRT
	T5y4L3Y/+kxFGvA1z/F7Bz5mcQNRPh8KLJrHGkQ77fFrOWeZwHfOSbD0hiyJk7ByqA6+/quwjAtDe
	X4+nXOZ0w9ir1PiOl+NtrXWXai+TzgQ4GmAlKIr7uJorJP3PaR/q0/1C0qyadCoSQIrgHAdXgK46e
	uruO5bG37z/KAKApTu4i3xMIaY8bx72q2+Z//zba5n2KoMF8Hk2gATPf4ZiFiHjVdjVLqWQ7L0vAN
	VMW0f8E9Qc24+wJTP52BSSFvJTh3r0M7YajuwPYx8uprPmJ8McsiEYUCSoWGChNypn+pYYXqhM6fs
	iVd9o1xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzBuY-0000000H4Rc-0sLi;
	Thu, 18 Sep 2025 10:30:46 +0000
Received: from mail-ed1-x54a.google.com ([2a00:1450:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzBuU-0000000H4MQ-1kWf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 10:30:43 +0000
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-62f4f1c70c9so738582a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 03:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758191440; x=1758796240; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6H562hA4phalkuc9iW32nFe+iytT6ATVUAyAxRehk0A=;
        b=EVeWlQSbhsNpWoL553sep76253EUyXemizeV4pLQRbCKqLySXgMGqp2SUuUNZFTI9u
         ZmWwOloi2+ZkogVfVaLWLUTE/tO4GuNxnzZGfvIPlVMvobuUtdcQqFTf6rhi6oDpDEBH
         8LHlMse66SweRYBQYVfsyQOa/S8TpdrmZ5lBsPtOzMAWk3LINRRmSjy5x9z84lz6wJ4m
         tibus/1/Qla+cimWa9cQmJTYR2cKxOtdzeIATIMmyfTuwExjgpnofynPrTlhw6F2Jg6A
         r6rRXwskchCVqGAbvQ6or3oYSDVkk4ELZjjT8sKByrFmGv7m9XPGO3mY1koKyVHmosg7
         Ol2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758191440; x=1758796240;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6H562hA4phalkuc9iW32nFe+iytT6ATVUAyAxRehk0A=;
        b=BN5lMwtaXdEyRr8aZ/DpWA6l7iBh5UhAZR/W/IyxMdHMIR4MmSt74uGeNm5GR3FjLu
         GngBV7HVetBgMDfku7xzSANC2+/zWB/LwtK4nNpDFIq6f3Es2xvJvcWfWc1BDh6oZvsn
         gANnZFs7VDaHInssfMuWZyWra41aqXjy9vzeu5JuXVARUqVCtFGnMehG+E8fz3y33QWU
         FMX752ThxVQJzx3V6wmSx2P9t5QoI10M6K+Q7IoP/6zdxkYI/e5KIjo6qvvL27vPZo/d
         qMPYQ75ZVizJvwPJ1UzUUtsxiCRg35J/IwFaEppRjjQamq/1y0jb5ZSPziDsXrhOjRS1
         QlWw==
X-Forwarded-Encrypted: i=1; AJvYcCWUwJ42XzzPWYox7p4MSTFat5ZceALd6bTC+idRPtQXKNxR90YGEMS5KDNpIjHY6EvDUCnCSx66veMhFe3lYeH+@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0/bWM28ZrsHFcShdLmrwXDWp1jCHGg6AlmaP4e3/uJnIoJJyG
	J5jNFDfE8L/hyVnhs2YeKf3HqW/6WSt9U+a6JIiO7HWiy8gpPmYnK2ixDMZa7O2hLxpX9SrHmg=
	=
X-Google-Smtp-Source: AGHT+IFkRHFzfELswznyWLkr4CvOF50Fe853eqdKU+2tOajHyQGbMjOvGvY8FOB3foL9HdzwA1/E0NRu
X-Received: from ede13.prod.google.com ([2002:a05:6402:20cd:b0:62f:48cb:a0])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:35d2:b0:62f:48e3:2224
 with SMTP id 4fb4d7f45d1cf-62f8444146amr4820234a12.20.1758191440174; Thu, 18
 Sep 2025 03:30:40 -0700 (PDT)
Date: Thu, 18 Sep 2025 12:30:16 +0200
In-Reply-To: <20250918103010.2973462-10-ardb+git@google.com>
Mime-Version: 1.0
References: <20250918103010.2973462-10-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=5359; i=ardb@kernel.org;
 h=from:subject; bh=mQrrF+d2zLkSHcwIimPMiS9vJSwzrw0LbijljjwZNyA=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIeP0feskWV6NoLork+f7ttzccMu/xfTijM+qp5L37fx7L
 rrsZPPWjlIWBjEuBlkxRRaB2X/f7Tw9UarWeZYszBxWJpAhDFycAjAR6S5Ghjf1zQcPLCm9mPG4
 XmWlicr89ZPmXw4q2rlK0pD7h3rpndeMDDu3TlBgWrWp4PP1q2p6bawHWIpTpvF1rme6ynCree+ a1TwA
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
Message-ID: <20250918103010.2973462-15-ardb+git@google.com>
Subject: [PATCH v3 5/8] arm64/fpsimd: Drop special handling for EFI runtime services
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_033042_491311_9C6EE7F5 
X-CRM114-Status: GOOD (  23.90  )
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

Now that the use of kernel mode FP/SIMD is generally permitted when IRQs
are disabled, the only purpose served by the EFI-specific fallback code
in fpsimd.c is the case where an EFI call occurs from hardirq or NMI
context. No such cases are known to occur in practice, and it is
doubtful whether calling into the EFI firmware for any reason under such
conditions would be a good idea to begin with.

So disallow EFI runtime services in such cases. This means all the
fallback code can be dropped.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/include/asm/fpsimd.h |   4 -
 arch/arm64/kernel/efi.c         |   8 +-
 arch/arm64/kernel/fpsimd.c      | 121 --------------------
 3 files changed, 6 insertions(+), 127 deletions(-)

diff --git a/arch/arm64/include/asm/fpsimd.h b/arch/arm64/include/asm/fpsimd.h
index b8cf0ea43cc0..139ee1393730 100644
--- a/arch/arm64/include/asm/fpsimd.h
+++ b/arch/arm64/include/asm/fpsimd.h
@@ -458,10 +458,6 @@ static inline size_t sme_state_size(struct task_struct const *task)
 
 #endif /* ! CONFIG_ARM64_SME */
 
-/* For use by EFI runtime services calls only */
-extern void __efi_fpsimd_begin(void);
-extern void __efi_fpsimd_end(void);
-
 #endif
 
 #endif
diff --git a/arch/arm64/kernel/efi.c b/arch/arm64/kernel/efi.c
index 9b03f3d77a25..0d52414415f3 100644
--- a/arch/arm64/kernel/efi.c
+++ b/arch/arm64/kernel/efi.c
@@ -14,6 +14,7 @@
 #include <linux/vmalloc.h>
 
 #include <asm/efi.h>
+#include <asm/simd.h>
 #include <asm/stacktrace.h>
 #include <asm/vmap_stack.h>
 
@@ -169,15 +170,18 @@ static DEFINE_RAW_SPINLOCK(efi_rt_lock);
 
 bool arch_efi_call_virt_setup(void)
 {
+	if (!may_use_simd())
+		return false;
+
 	efi_virtmap_load();
 	raw_spin_lock(&efi_rt_lock);
-	__efi_fpsimd_begin();
+	kernel_neon_begin();
 	return true;
 }
 
 void arch_efi_call_virt_teardown(void)
 {
-	__efi_fpsimd_end();
+	kernel_neon_end();
 	raw_spin_unlock(&efi_rt_lock);
 	efi_virtmap_unload();
 }
diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index 96a226316d1f..e543dd569bd7 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -1907,127 +1907,6 @@ void kernel_neon_end(void)
 		clear_thread_flag(TIF_KERNEL_FPSTATE);
 }
 EXPORT_SYMBOL_GPL(kernel_neon_end);
-
-#ifdef CONFIG_EFI
-
-static struct user_fpsimd_state efi_fpsimd_state;
-static bool efi_fpsimd_state_used;
-static bool efi_sve_state_used;
-static bool efi_sm_state;
-
-/*
- * EFI runtime services support functions
- *
- * The ABI for EFI runtime services allows EFI to use FPSIMD during the call.
- * This means that for EFI (and only for EFI), we have to assume that FPSIMD
- * is always used rather than being an optional accelerator.
- *
- * These functions provide the necessary support for ensuring FPSIMD
- * save/restore in the contexts from which EFI is used.
- *
- * Do not use them for any other purpose -- if tempted to do so, you are
- * either doing something wrong or you need to propose some refactoring.
- */
-
-/*
- * __efi_fpsimd_begin(): prepare FPSIMD for making an EFI runtime services call
- */
-void __efi_fpsimd_begin(void)
-{
-	if (!system_supports_fpsimd())
-		return;
-
-	WARN_ON(preemptible());
-
-	if (may_use_simd()) {
-		kernel_neon_begin();
-	} else {
-		/*
-		 * If !efi_sve_state, SVE can't be in use yet and doesn't need
-		 * preserving:
-		 */
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
-	}
-}
-
-/*
- * __efi_fpsimd_end(): clean up FPSIMD after an EFI runtime services call
- */
-void __efi_fpsimd_end(void)
-{
-	if (!system_supports_fpsimd())
-		return;
-
-	if (!efi_fpsimd_state_used) {
-		kernel_neon_end();
-	} else {
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
-	}
-}
-
-#endif /* CONFIG_EFI */
-
 #endif /* CONFIG_KERNEL_MODE_NEON */
 
 #ifdef CONFIG_CPU_PM
-- 
2.51.0.384.g4c02a37b29-goog


