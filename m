Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F31CC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 13:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DEgzWr2E2NAy7FDuPhBSzhgvxiM8c4iYHbXwNyOFveY=; b=PfMz2xskU1Sv4w6dsGBPVOg3P2
	zP4U1LG0Lt0+Ybm4+qmz5WfbtT+huOvXa1dl+oGrIKtYVGE+v5kRlSyt5DFD5zbQcarx5FHZHcinQ
	xqgIuf9e4n1viRqxcgPx8XGD2Ojt8eGWANg2Z9Bl6JL4hRAd3UTOqommGFXTtPNOoh5G1dCeoNm4s
	fsbOxBo/gIiX4lH4jrnsmQ06TcEIuqsoCRYe94CYH50uykFioqQVGm/1QNblMZHp6dpkgC6Bf61WA
	i7T59AKhIU94IScMipty9YbfYk+7vNvSYW2+nEWqs1Lv1z8Wdqepz0Qg2idBj48p8TIUp0IeBBwjQ
	Kg/4FBFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuXDi-000000063UC-34VY;
	Tue, 18 Mar 2025 13:43:02 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuWvo-000000060gp-0fSf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 13:24:33 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-43cf327e9a2so26616265e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 06:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742304270; x=1742909070; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DEgzWr2E2NAy7FDuPhBSzhgvxiM8c4iYHbXwNyOFveY=;
        b=BExRlWu4j+28iBPfO3zOdCUL5gr6O8PL1x++t9uXr2s16hQt07DgZitaoXB1lQdaNu
         xOD6dygBCGFaI3LqAymiz004HSlXpVDrXtx/xNavf0d0/6e2B2ZzThDK8iyOSNbZuZ79
         9Pp+RMA3/Lsx9sWkmDshD40jwIPbFYRM/jmbgWH05IQG0ICSCYSR9Xz9CaXSmei5CYmU
         xikLj8r6EJWkZ9erOPj4RQwqpHf179cQToofh7F9o4ZBPEWx8B8o3mP3Dzc9qLF70s7m
         6jNyMyX/LxQ4TpX/2ryInU/dTxRN+GX5Cf0+NwRhZxxPI5y0mlr+B8eH9AjHimBN3+zk
         O8IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742304270; x=1742909070;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DEgzWr2E2NAy7FDuPhBSzhgvxiM8c4iYHbXwNyOFveY=;
        b=T069LiYjup4DgmRm1n04lZLafLbBJTf7aCOQDGcmQiiirLkP3VEBSU79O0YEG5vGSb
         3vahENTHn5X46nOapXLM420MNhC5S5j8un2IEqpatzYfFjhjrcrVK3QgnLjeFLZXjkOP
         FiV45e3jjqgVJrn30SQVKjPkMbK1fAlf5RAaVKzqg9qbN+6/VNT3u1nKaocGwfNiqjWO
         1cBolDanqypxfaxD6XUrmU6GK+eQZqLoqGeoWkXu7kv+BibcjIUhQN3/F/UTQ+mhRLfJ
         +vhsFhvUbGnma4xxhIehwzfe/+/VYeQpk3N+U5IIw1V7q5Vc/IZWl2ij9YkSCduD3WTW
         wPlQ==
X-Gm-Message-State: AOJu0YzMJCBKU/OizQQrUgi+/DYBQQygZRjWnQLjK9x1/g9oFSFI3jqL
	lCVThNwZ2LoJZ413g+5UzYlNJkm0GkYEpRv/tYz6776T9S7pLxaqp3jXuh8xXtUgUQrBug/L5ez
	zGFPSxjgXWyY6+6bKWxKgDSaWgGQE1ntSS3yG2QRr6dCQy/79MFpymFysia45WpK5z8Qsee9PE4
	QDwyTwlmSJmVoxYeBoKvCvzXyGcs81ATA1p39wC9y3
X-Google-Smtp-Source: AGHT+IG88/y2gUxFHhZYjd0nXNVh9L0hGC3+X2VVnSItfQsqi/IKCNxpAkyqMZIO+vJlAmNrXHgC/TLn
X-Received: from wmbes18.prod.google.com ([2002:a05:600c:8112:b0:43b:c7e5:66e0])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3ca6:b0:43c:f8fc:f6a6
 with SMTP id 5b1f17b1804b1-43d3b9865c2mr25721555e9.9.1742304270191; Tue, 18
 Mar 2025 06:24:30 -0700 (PDT)
Date: Tue, 18 Mar 2025 14:24:22 +0100
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=6366; i=ardb@kernel.org;
 h=from:subject; bh=hrpsKvpCDfcxtB4oZkUT6QqF+MEdOioUp4OeO1ExQqs=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIf1mCZvJcoufl57vnFTjEG+c+XVH492zdVylekv8Oxnsj
 Rx+dB3vKGVhEONgkBVTZBGY/ffdztMTpWqdZ8nCzGFlAhnCwMUpABPhu8zIsH/SoVfT3F+KmDBP
 3plybImVemfvRMYWbU6P55v4v6ruD2VkOKrd4HbzkWuKRYThDtNN13xLN64OMQ5Ot/LKXLLQxmw xMwA=
X-Mailer: git-send-email 2.49.0.rc1.451.g8f38331e32-goog
Message-ID: <20250318132421.3155799-2-ardb+git@google.com>
Subject: [PATCH] arm64/fpsimd: Avoid unnecessary per-CPU buffers for EFI
 runtime calls
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-efi@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org, 
	mark.rutland@arm.com, broonie@kernel.org, Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_062432_202078_F25BE8ED 
X-CRM114-Status: GOOD (  18.21  )
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

The EFI specification has some elaborate rules about which runtime
services may be called while another runtime service call is already in
progress. In Linux, however, for simplicity, all EFI runtime service
invocations are serialized via the efi_runtime_lock semaphore.

This implies that calls to the helper pair arch_efi_call_virt_setup()
and arch_efi_call_virt_teardown() are serialized too, and are guaranteed
not to nest.  Furthermore, the arm64 arch code has its own spinlock to
serialize use of the EFI runtime stack, of which only a single instance
exists.

This all means that the FP/SIMD and SVE state preserve/restore logic in
__efi_fpsimd_begin() and __efi_fpsimd_end() are also serialized, and
only a single instance of the associated per-CPU variables can ever be
in use at the same time. There is therefore no need at all for per-CPU
variables here, and they can all be replaced with singleton instances.
This saves a non-trivial amount of memory on systems with many CPUs.

To be more robust against potential future changes in the core EFI code
that may invalidate the reasoning above, move the invocations of
__efi_fpsimd_begin() and __efi_fpsimd_end() into the critical section
covered by the efi_rt_lock spinlock.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/kernel/efi.c    |  4 +--
 arch/arm64/kernel/fpsimd.c | 54 ++++++++++++++++++--------------------
 2 files changed, 27 insertions(+), 31 deletions(-)

diff --git a/arch/arm64/kernel/efi.c b/arch/arm64/kernel/efi.c
index 1d25d8899dbf..250e9d7c08a7 100644
--- a/arch/arm64/kernel/efi.c
+++ b/arch/arm64/kernel/efi.c
@@ -169,14 +169,14 @@ static DEFINE_RAW_SPINLOCK(efi_rt_lock);
 void arch_efi_call_virt_setup(void)
 {
 	efi_virtmap_load();
-	__efi_fpsimd_begin();
 	raw_spin_lock(&efi_rt_lock);
+	__efi_fpsimd_begin();
 }
 
 void arch_efi_call_virt_teardown(void)
 {
-	raw_spin_unlock(&efi_rt_lock);
 	__efi_fpsimd_end();
+	raw_spin_unlock(&efi_rt_lock);
 	efi_virtmap_unload();
 }
 
diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index 2b601d88762d..788cc3ad6101 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -180,12 +180,12 @@ static inline void set_sve_default_vl(int val)
 	set_default_vl(ARM64_VEC_SVE, val);
 }
 
-static void __percpu *efi_sve_state;
+static u8 *efi_sve_state;
 
 #else /* ! CONFIG_ARM64_SVE */
 
 /* Dummy declaration for code that will be optimised out: */
-extern void __percpu *efi_sve_state;
+extern u8 *efi_sve_state;
 
 #endif /* ! CONFIG_ARM64_SVE */
 
@@ -1131,15 +1131,15 @@ static void __init sve_efi_setup(void)
 	if (!sve_vl_valid(max_vl))
 		goto fail;
 
-	efi_sve_state = __alloc_percpu(
-		SVE_SIG_REGS_SIZE(sve_vq_from_vl(max_vl)), SVE_VQ_BYTES);
+	efi_sve_state = kmalloc(SVE_SIG_REGS_SIZE(sve_vq_from_vl(max_vl)),
+				GFP_KERNEL);
 	if (!efi_sve_state)
 		goto fail;
 
 	return;
 
 fail:
-	panic("Cannot allocate percpu memory for EFI SVE save/restore");
+	panic("Cannot allocate memory for EFI SVE save/restore");
 }
 
 void cpu_enable_sve(const struct arm64_cpu_capabilities *__always_unused p)
@@ -1973,10 +1973,10 @@ EXPORT_SYMBOL_GPL(kernel_neon_end);
 
 #ifdef CONFIG_EFI
 
-static DEFINE_PER_CPU(struct user_fpsimd_state, efi_fpsimd_state);
-static DEFINE_PER_CPU(bool, efi_fpsimd_state_used);
-static DEFINE_PER_CPU(bool, efi_sve_state_used);
-static DEFINE_PER_CPU(bool, efi_sm_state);
+static struct user_fpsimd_state efi_fpsimd_state;
+static bool efi_fpsimd_state_used;
+static bool efi_sve_state_used;
+static bool efi_sm_state;
 
 /*
  * EFI runtime services support functions
@@ -2009,18 +2009,16 @@ void __efi_fpsimd_begin(void)
 		 * If !efi_sve_state, SVE can't be in use yet and doesn't need
 		 * preserving:
 		 */
-		if (system_supports_sve() && likely(efi_sve_state)) {
-			char *sve_state = this_cpu_ptr(efi_sve_state);
+		if (system_supports_sve() && efi_sve_state != NULL) {
 			bool ffr = true;
 			u64 svcr;
 
-			__this_cpu_write(efi_sve_state_used, true);
+			efi_sve_state_used = true;
 
 			if (system_supports_sme()) {
 				svcr = read_sysreg_s(SYS_SVCR);
 
-				__this_cpu_write(efi_sm_state,
-						 svcr & SVCR_SM_MASK);
+				efi_sm_state = svcr & SVCR_SM_MASK;
 
 				/*
 				 * Unless we have FA64 FFR does not
@@ -2030,19 +2028,18 @@ void __efi_fpsimd_begin(void)
 					ffr = !(svcr & SVCR_SM_MASK);
 			}
 
-			sve_save_state(sve_state + sve_ffr_offset(sve_max_vl()),
-				       &this_cpu_ptr(&efi_fpsimd_state)->fpsr,
-				       ffr);
+			sve_save_state(efi_sve_state + sve_ffr_offset(sve_max_vl()),
+				       &efi_fpsimd_state.fpsr, ffr);
 
 			if (system_supports_sme())
 				sysreg_clear_set_s(SYS_SVCR,
 						   SVCR_SM_MASK, 0);
 
 		} else {
-			fpsimd_save_state(this_cpu_ptr(&efi_fpsimd_state));
+			fpsimd_save_state(&efi_fpsimd_state);
 		}
 
-		__this_cpu_write(efi_fpsimd_state_used, true);
+		efi_fpsimd_state_used = true;
 	}
 }
 
@@ -2054,12 +2051,10 @@ void __efi_fpsimd_end(void)
 	if (!system_supports_fpsimd())
 		return;
 
-	if (!__this_cpu_xchg(efi_fpsimd_state_used, false)) {
+	if (!efi_fpsimd_state_used) {
 		kernel_neon_end();
 	} else {
-		if (system_supports_sve() &&
-		    likely(__this_cpu_read(efi_sve_state_used))) {
-			char const *sve_state = this_cpu_ptr(efi_sve_state);
+		if (system_supports_sve() && efi_sve_state_used) {
 			bool ffr = true;
 
 			/*
@@ -2068,7 +2063,7 @@ void __efi_fpsimd_end(void)
 			 * streaming mode.
 			 */
 			if (system_supports_sme()) {
-				if (__this_cpu_read(efi_sm_state)) {
+				if (efi_sm_state) {
 					sysreg_clear_set_s(SYS_SVCR,
 							   0,
 							   SVCR_SM_MASK);
@@ -2082,14 +2077,15 @@ void __efi_fpsimd_end(void)
 				}
 			}
 
-			sve_load_state(sve_state + sve_ffr_offset(sve_max_vl()),
-				       &this_cpu_ptr(&efi_fpsimd_state)->fpsr,
-				       ffr);
+			sve_load_state(efi_sve_state + sve_ffr_offset(sve_max_vl()),
+				       &efi_fpsimd_state.fpsr, ffr);
 
-			__this_cpu_write(efi_sve_state_used, false);
+			efi_sve_state_used = false;
 		} else {
-			fpsimd_load_state(this_cpu_ptr(&efi_fpsimd_state));
+			fpsimd_load_state(&efi_fpsimd_state);
 		}
+
+		efi_fpsimd_state_used = false;
 	}
 }
 
-- 
2.49.0.rc1.451.g8f38331e32-goog


