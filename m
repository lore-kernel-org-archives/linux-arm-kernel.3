Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C64F9C5475C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 18:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tXVJMsufZ9sm0rGmcq7nqIrA1daerFrHzMfPhoL+63A=; b=Tyz3woJ/rtdHUmPy+eBtwd1O/e
	ekzuFnuPj4rJsWYS8xcN0TJ5gI4sYlCRD4VJiPpV2TDo1R2MTvo+Wo8bZkxltJgrMbSYwlmd8Sw/u
	f4vmp1JHKBsOtukY+ELfvkB+vMQYCSnJTyp605hEF0RCU3scB9XTj/1CerZeoihSQFNGUPR0KPN2W
	854tFaTH4r/TSF69amJIKN80LJjQd405teIeGSH0l4/4tLeifF842hjtwAueV46DYZYUpbOqa0Lj0
	LPeWtC+CNQ4cGWP+1G/Sa8lGyUWU/Js3PBn2gspKTWmsPLsVeE/Z4CPo30+rp3cN2uGL5RHz25WHD
	jEAywlFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFGvO-0000000G1vx-2mgk;
	Wed, 14 May 2025 18:33:50 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFG9B-0000000Ft14-0bEG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 17:44:02 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-43cfda30a3cso345135e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 May 2025 10:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747244639; x=1747849439; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=tXVJMsufZ9sm0rGmcq7nqIrA1daerFrHzMfPhoL+63A=;
        b=FxPI+ASedoPiR66KLxj3HP7n6r9HI+BIxIilbKP6upSUkuKgb8Z1kNMSfZsTN1B+3Z
         Lj/Pcf4fJWCsd3yqjZWRgT43JSNTVOxLq44bADi8nPuILHWAyJ/qpAz/Ko2K5z1pM5JL
         0cxHFlpOZ6IhhZWw0cxkfT1gqAe6sZIEm+m5OCqEaTIHdt6WPkG8R7HdQgN4mYSnbE6V
         ap2WzdDD3GwJY5UiRol0MIbVrmYcR8cx8POV7PY67tmANtJuJZkSNiDLpy7TSVDtopHP
         hXCnk0eCu+PSZkw72qXNpHi1h+PVcvLWIG0RdKjfCaOe7s/X09wegT2vcFu5p04qsn7W
         jAng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747244639; x=1747849439;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tXVJMsufZ9sm0rGmcq7nqIrA1daerFrHzMfPhoL+63A=;
        b=peQdAgVj8876Sx1gX0Tat8LE1QyyTckUIniUc8YTEP/zRy52F/BZ2fscesELZidXUD
         X/cSxx1mCaC1Lc3uzv1pC5u6tbmGMTTaEetW1WlYJ8Xk/nd++R8q0yMPBy2wHhQwF7Ex
         HLXJXlHQzVwB8gwkGFfPKmsLn16p271YPK786IbeefXH9Lh8/EH7KhL8dQS9xSpkczHz
         bR0nZUuiqLjxDIwqhsEZ8/fuXBnc6+W5kepNPWnduKuos6UGkeEQnIG8wHqgFEsyqJEc
         eRlSEScYMIov3Qx2NC0q4/F7tkpofnyH1V7CMqnUocpyWFiZ83YpGzsrwmEajxtySBh4
         aN7g==
X-Forwarded-Encrypted: i=1; AJvYcCXCbTp+zPbQfqtgW4gdqgtDs0ax2gMR6w+hW2C+zUDvlcElHLGaZFd6TdMuKH90C/vUfP99yTHvaxlUEIBvSPsx@lists.infradead.org
X-Gm-Message-State: AOJu0YzkKphfKhXJir0ECYHX4GhSs+yqDw2O9rw8JMZz/Y1k7dRQg0in
	s4jkGM94Vc7X/04bdGcBFTaj9VPlD1gmmJpECnYj3uh5lkK1lGaLR5qbicF3YE8FLXpEgg==
X-Google-Smtp-Source: AGHT+IEFMJweCFn/YJy00TUveKZvloJ8ozZW7ocyXdHKJvi0QMeGWaS9uMuGA5J4Ptlhdx+EEwEvRi9t
X-Received: from wmrn6.prod.google.com ([2002:a05:600c:5006:b0:43c:fe64:2de3])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1e84:b0:43c:e7a7:1e76
 with SMTP id 5b1f17b1804b1-442f20b8554mr32240165e9.1.1747244639223; Wed, 14
 May 2025 10:43:59 -0700 (PDT)
Date: Wed, 14 May 2025 19:43:42 +0200
In-Reply-To: <20250514174339.1834871-9-ardb+git@google.com>
Mime-Version: 1.0
References: <20250514174339.1834871-9-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=5541; i=ardb@kernel.org;
 h=from:subject; bh=5U5zQ0g4Nylx2meOob6iW9ucS95iuPh4XIaL8oIC4Co=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIUPlWuD06w/y06a7Tpn6tO6j+rPwRDlL+xfXBFZv+6jOu
 tKxdW9CRykLgxgHg6yYIovA7L/vdp6eKFXrPEsWZg4rE8gQBi5OAZhIBxfDP4OTO6NSUk0c1NZu
 E5HaJNtptfjfmibztg1O+ilpqgrK8xj+B4Qt7urwXH1sys6X8fMMBBJ92Rf8SeuPdC7fuORk58p PPAA=
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250514174339.1834871-11-ardb+git@google.com>
Subject: [RFC PATCH 2/7] efi/runtime: Return success/failure from arch_efi_call_virt_setup()
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_104401_182043_6B0067ED 
X-CRM114-Status: GOOD (  13.51  )
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

Permit the arch glue to signal failure from arch_efi_call_virt_setup().
This permits the use of sleeping locks in the call wrappers, and this
will allow EFI runtime services to be invoked without the need for
disabling preemption.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm/include/asm/efi.h           | 2 +-
 arch/arm64/include/asm/efi.h         | 2 +-
 arch/arm64/kernel/efi.c              | 3 ++-
 arch/loongarch/include/asm/efi.h     | 2 +-
 arch/riscv/include/asm/efi.h         | 2 +-
 arch/x86/include/asm/efi.h           | 2 +-
 arch/x86/platform/efi/efi_32.c       | 3 ++-
 arch/x86/platform/efi/efi_64.c       | 3 ++-
 drivers/firmware/efi/riscv-runtime.c | 3 ++-
 9 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/arch/arm/include/asm/efi.h b/arch/arm/include/asm/efi.h
index e408399d5f0e..0809a69bb579 100644
--- a/arch/arm/include/asm/efi.h
+++ b/arch/arm/include/asm/efi.h
@@ -23,7 +23,7 @@ void arm_efi_init(void);
 int efi_create_mapping(struct mm_struct *mm, efi_memory_desc_t *md);
 int efi_set_mapping_permissions(struct mm_struct *mm, efi_memory_desc_t *md, bool);
 
-#define arch_efi_call_virt_setup()	efi_virtmap_load()
+#define arch_efi_call_virt_setup()	(efi_virtmap_load(), true)
 #define arch_efi_call_virt_teardown()	efi_virtmap_unload()
 
 #ifdef CONFIG_CPU_TTBR0_PAN
diff --git a/arch/arm64/include/asm/efi.h b/arch/arm64/include/asm/efi.h
index bcd5622aa096..decf87777f57 100644
--- a/arch/arm64/include/asm/efi.h
+++ b/arch/arm64/include/asm/efi.h
@@ -37,7 +37,7 @@ int efi_set_mapping_permissions(struct mm_struct *mm, efi_memory_desc_t *md,
 extern u64 *efi_rt_stack_top;
 efi_status_t __efi_rt_asm_wrapper(void *, const char *, ...);
 
-void arch_efi_call_virt_setup(void);
+bool arch_efi_call_virt_setup(void);
 void arch_efi_call_virt_teardown(void);
 
 /*
diff --git a/arch/arm64/kernel/efi.c b/arch/arm64/kernel/efi.c
index 250e9d7c08a7..44ad5e759af4 100644
--- a/arch/arm64/kernel/efi.c
+++ b/arch/arm64/kernel/efi.c
@@ -166,11 +166,12 @@ asmlinkage efi_status_t efi_handle_corrupted_x18(efi_status_t s, const char *f)
 
 static DEFINE_RAW_SPINLOCK(efi_rt_lock);
 
-void arch_efi_call_virt_setup(void)
+bool arch_efi_call_virt_setup(void)
 {
 	efi_virtmap_load();
 	raw_spin_lock(&efi_rt_lock);
 	__efi_fpsimd_begin();
+	return true;
 }
 
 void arch_efi_call_virt_teardown(void)
diff --git a/arch/loongarch/include/asm/efi.h b/arch/loongarch/include/asm/efi.h
index eddc8e79b3fa..84cf2151123f 100644
--- a/arch/loongarch/include/asm/efi.h
+++ b/arch/loongarch/include/asm/efi.h
@@ -14,7 +14,7 @@ void efifb_setup_from_dmi(struct screen_info *si, const char *opt);
 
 #define ARCH_EFI_IRQ_FLAGS_MASK  0x00000004  /* Bit 2: CSR.CRMD.IE */
 
-#define arch_efi_call_virt_setup()
+#define arch_efi_call_virt_setup()	true
 #define arch_efi_call_virt_teardown()
 
 #define EFI_ALLOC_ALIGN		SZ_64K
diff --git a/arch/riscv/include/asm/efi.h b/arch/riscv/include/asm/efi.h
index 46a355913b27..a7b4d719e7be 100644
--- a/arch/riscv/include/asm/efi.h
+++ b/arch/riscv/include/asm/efi.h
@@ -40,7 +40,7 @@ static inline unsigned long efi_get_kimg_min_align(void)
 
 #define EFI_KIMG_PREFERRED_ADDRESS	efi_get_kimg_min_align()
 
-void arch_efi_call_virt_setup(void);
+bool arch_efi_call_virt_setup(void);
 void arch_efi_call_virt_teardown(void);
 
 unsigned long stext_offset(void);
diff --git a/arch/x86/include/asm/efi.h b/arch/x86/include/asm/efi.h
index f227a70ac91f..879c8402e024 100644
--- a/arch/x86/include/asm/efi.h
+++ b/arch/x86/include/asm/efi.h
@@ -140,7 +140,7 @@ extern void efi_delete_dummy_variable(void);
 extern void efi_crash_gracefully_on_page_fault(unsigned long phys_addr);
 extern void efi_free_boot_services(void);
 
-void arch_efi_call_virt_setup(void);
+bool arch_efi_call_virt_setup(void);
 void arch_efi_call_virt_teardown(void);
 
 extern u64 efi_setup;
diff --git a/arch/x86/platform/efi/efi_32.c b/arch/x86/platform/efi/efi_32.c
index b2cc7b4552a1..215f16ce84ab 100644
--- a/arch/x86/platform/efi/efi_32.c
+++ b/arch/x86/platform/efi/efi_32.c
@@ -141,10 +141,11 @@ void __init efi_runtime_update_mappings(void)
 	}
 }
 
-void arch_efi_call_virt_setup(void)
+bool arch_efi_call_virt_setup(void)
 {
 	efi_fpu_begin();
 	firmware_restrict_branch_speculation_start();
+	return true;
 }
 
 void arch_efi_call_virt_teardown(void)
diff --git a/arch/x86/platform/efi/efi_64.c b/arch/x86/platform/efi/efi_64.c
index ac57259a432b..023368e9698a 100644
--- a/arch/x86/platform/efi/efi_64.c
+++ b/arch/x86/platform/efi/efi_64.c
@@ -445,12 +445,13 @@ static void efi_leave_mm(void)
 	switch_mm(&efi_mm, efi_prev_mm, NULL);
 }
 
-void arch_efi_call_virt_setup(void)
+bool arch_efi_call_virt_setup(void)
 {
 	efi_sync_low_kernel_mappings();
 	efi_fpu_begin();
 	firmware_restrict_branch_speculation_start();
 	efi_enter_mm();
+	return true;
 }
 
 void arch_efi_call_virt_teardown(void)
diff --git a/drivers/firmware/efi/riscv-runtime.c b/drivers/firmware/efi/riscv-runtime.c
index fa71cd898120..07e04b8f982a 100644
--- a/drivers/firmware/efi/riscv-runtime.c
+++ b/drivers/firmware/efi/riscv-runtime.c
@@ -142,10 +142,11 @@ static void efi_virtmap_unload(void)
 	preempt_enable();
 }
 
-void arch_efi_call_virt_setup(void)
+bool arch_efi_call_virt_setup(void)
 {
 	sync_kernel_mappings(efi_mm.pgd);
 	efi_virtmap_load();
+	return true;
 }
 
 void arch_efi_call_virt_teardown(void)
-- 
2.49.0.1101.gccaa498523-goog


