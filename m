Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ED10CA1010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 18:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RnWShrZLR7vPEU2B78j7+Lb7nzOaNYK0ui51c7MAe+o=; b=jlRSSihWjeT3UUt+NIhpoCdVvF
	/LN8N1gx2qa+Dy1hJKzMZIICl9eyrP6yCcvYD4zaahCDx/KFXknqdRkZcGZfizeYEqKP3aeszJMDb
	aqN8elosr9InK+lCi8EADETMLQj4AYRGg2EEQ3QAtDlXscVTnpziW4tUsNTViDzeOWwPypcvMuZgk
	MruQFYa5H9sofHCjmsdiCZZwcPVkyb2VaEA1IWBmUEnzQ2ycQZMwGowSBSeZbyL4G2lY1slbEfdwK
	+gf7eoUwyNWpm9qmiPxIztK6FxLKae6VD+7JPANy7uuqiQaotgES9NMiaTDWt3GoxNMed5VNzmkew
	GC8tfFyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uubUB-00000003uQk-2BHy;
	Fri, 05 Sep 2025 18:48:35 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuWWf-00000001zP0-1ETt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 13:30:50 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-45cb4f23156so12199125e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Sep 2025 06:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757079048; x=1757683848; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=RnWShrZLR7vPEU2B78j7+Lb7nzOaNYK0ui51c7MAe+o=;
        b=fc30cKWT1Mdmfg18b+dRJRTTvPZ5w1mRmVglsWUWmOskFmsCKOBiakyi7L74v/qs7s
         C3R4+EASHwZzY1TgglWs71MmNzC2cgu+F8SlsCxKC4HNWfHdK6Tle1xb5oD+f6QVGfC5
         rYtydju9r48O1y2e5TEhJHcL7c+ZALzHG8D2Cnw5KYVOLkx1f9+Jz32N5fJCj4sHD6+6
         8s+ygNn8PSlOC3w8s/9W6hYGHZQkYbF34TNpEm2uqkMIKjJEEk5gvdA1fVjbI+CsX7+v
         DX+vwSGw+Od+yjFV97vwdgZ5Loo/rteCefM4Mj8sbJsjMLYW9P5gzWp+J+WGgmduuR0N
         fx6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757079048; x=1757683848;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RnWShrZLR7vPEU2B78j7+Lb7nzOaNYK0ui51c7MAe+o=;
        b=vQSOZ/6ABNMrlqCyHmlb8/Cf8FItJ8wyOU0550roj5NiRbuzeSZuE5z1m9KuBihK5t
         1rIPIMScGR09d/UcxAct+DQEKoSNAwo//FMWIl1bkJ05ZT6KZehNRDmGmMSo/lg+LSWi
         D52Z4JKrWjSMziAib4u4WmK2DV1bAW2WA1EoklK+LT+0Za9VZEzS9oLFq8tkikbl36Fd
         uCgAjXdG/5PpG5eNaeA4nCQvcXASmfMHiHbnbrJjM1+gaG0lDxi8MAqTnqn9YA4kbVLQ
         Muz5uOlP8Z5kq9ebzkDA3agaPI3gKk6CrpsTXTaEV2DkbNGyOZynXdGv6EoG5hMWVh0S
         ZOjQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0akIWFOsj3E53Lt3v3YiU99FG03BxI6JZnDboosbnfNOhq0ID/1dh0VTyIUzGiAdppoP3qnksLEHtcRCd2MaO@lists.infradead.org
X-Gm-Message-State: AOJu0YzdHvNHURGDoWTFk3AmS/EBKNyGshrMjRq6jhU9WesYAK6xNhsP
	Rjds+VBDRZWj39KjRHfKwrG1vJLtoSQxbJh8RbpsVehegmlNZwIUSd/txefvAOQVI1l68lBy0w=
	=
X-Google-Smtp-Source: AGHT+IElALc0lZ+KzdRQ2dRMVCGqhkLpgISWWuaMfOGta1rBFF8GrBs1+cH4A40kb4E6vXjqoOQHmNcF
X-Received: from wmbhj7.prod.google.com ([2002:a05:600c:5287:b0:45b:883d:4704])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:8b22:b0:45b:4a98:91cf
 with SMTP id 5b1f17b1804b1-45b8554fa14mr221341505e9.15.1757079047829; Fri, 05
 Sep 2025 06:30:47 -0700 (PDT)
Date: Fri,  5 Sep 2025 15:30:38 +0200
In-Reply-To: <20250905133035.275517-9-ardb+git@google.com>
Mime-Version: 1.0
References: <20250905133035.275517-9-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=5534; i=ardb@kernel.org;
 h=from:subject; bh=j5/ecr8uALf7Q3nJBo6TOOBIUrCfY89Wx0Sfg11CrLo=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIWPX03/PGg7Hc66b+swzatZ//hyxHTtL6q8f+id1TzVOs
 mP7n33eHaUsDGJcDLJiiiwCs/++23l6olSt8yxZmDmsTCBDGLg4BWAij+8yMhyzX+Fb8tmx1cBh
 ubWomssPdta0xuBQ/kRP/ZqzT5JMDzAy/D6vknj/wtZNKmIrLhlwyp7sfPve3XVZjKvxH7cjZzi KGAE=
X-Mailer: git-send-email 2.51.0.355.g5224444f11-goog
Message-ID: <20250905133035.275517-11-ardb+git@google.com>
Subject: [PATCH v2 2/7] efi/runtime: Return success/failure from arch_efi_call_virt_setup()
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_063049_338580_13240BCB 
X-CRM114-Status: GOOD (  13.57  )
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
index 6c371b158b99..9b03f3d77a25 100644
--- a/arch/arm64/kernel/efi.c
+++ b/arch/arm64/kernel/efi.c
@@ -167,11 +167,12 @@ asmlinkage efi_status_t efi_handle_corrupted_x18(efi_status_t s, const char *f)
 
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
index b4409df2105a..d4b1e70f41fa 100644
--- a/arch/x86/platform/efi/efi_64.c
+++ b/arch/x86/platform/efi/efi_64.c
@@ -443,12 +443,13 @@ static void efi_leave_mm(void)
 	unuse_temporary_mm(efi_prev_mm);
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
2.51.0.355.g5224444f11-goog


