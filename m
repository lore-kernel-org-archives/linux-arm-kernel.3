Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BB17CAC5AA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 10:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sJFIm2d9T+2x529qILYhaPbYtpi/V7t2rebVAI4uzpE=; b=Eha7VRp9cNWf7JvUIbnQGY5a1f
	f/9yKhmYgRyhSuVZAzvow+AVfcsAtyxdbHxYDStScBFA677smjCtqK+Kel4B72wqQLuAQp+aYJrQ3
	DqS96AsfR49MczjPs7vrvXGBDwE/1k5K8g8Z6b8rdUqkfoZYzwFxl0Gr+ENn1+NJFxJ5FQsqA9NIR
	ip8+q+LqfkbKo/DolqYJueq/HZFVy8IAPNzS9/y5eaXgKnUUvIQA604A0s6aJ2ThhEelMc9F5EDzi
	PZPRPfk4X94i1F166DSQDb5iiqXp5c3GxaUpY24lBPXj+uAWv7vCvRRA3yjlfA2GUlE/gfWy2BIIf
	/lAeb1Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzBuX-0000000H4Px-0mCZ;
	Thu, 18 Sep 2025 10:30:45 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzBuQ-0000000H4K3-3V8x
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 10:30:40 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-45f2b9b99f0so4711555e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 03:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758191437; x=1758796237; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=sJFIm2d9T+2x529qILYhaPbYtpi/V7t2rebVAI4uzpE=;
        b=vrPVM0Dr97vbIx7IaqZ/C2x2Lal5eL9j/x+C0QGCtCWLCk8nH1WAqwbOmZpqxOIk7Z
         9WG7wP1SytkSEGgw+L+fEiRcE8cBUAd9yMoVN1MV7Gf1NJOa5Pa/3Xe0DeukuxFDFzM2
         mSBnLco2WCgkJTRIRHrIo86TreQqDftzrOk8kk5q7Jh+mSaRxtEr5c8PiUItK0Sgp81U
         GpAahOyKQ4xpjoYRhGhaHBxFH2kHjj1CU5klk2gq8mrgJx6gF4V496VicP6O9zQfOnLM
         uGf1CLT1f/Y33KRrRd8L39MZXAvABLfIsdgzKjLT2W5/PXRpJqM0HBTYVN3mIxCs6Jrm
         q4QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758191437; x=1758796237;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sJFIm2d9T+2x529qILYhaPbYtpi/V7t2rebVAI4uzpE=;
        b=BNfVvgJPMpn1bZhg/fh17lB1Bo/dPy/8cHh5XV2iUtFQ1PIJwlTOcg2/bql96zBRPP
         gAPx4XjoGdY4/jQ9PjVuWv30GvTqXQ2XdZMFyhmjS4CncdIl3f2cTWDfjhW/0nNNS5S/
         NTPs+NYfhUzMmyVyWQ7dTPtmvM90rx1ueSagH+Wvgvh0MQq6VklyozExOWaA9bWGGPb6
         E5szx9BMa99/YdtrqP5qsOt60yca/FKt5KWcyuUuXBQRxk0UO21+/MsUY/v7lClCYaVc
         WfGqtrR1RBlBlaOaKd3SrAHOzRnXKxzwBeUs+YSdmLz4HBgiPxSTPa4boOPngXyhUN+7
         EkzA==
X-Forwarded-Encrypted: i=1; AJvYcCWXekY0BekxIeM3bqKpTyHrMK+3+cZ3RQzGSEXYyV1Uzh6NA5F4FNksKE/vzvGzNg49ciO7RfFzpbefKzZQV3nn@lists.infradead.org
X-Gm-Message-State: AOJu0YyHQK4YHyAQJwyFZVJs5GoA/AjEZqjtyseEka0FegZavHoXbJkC
	Y8SWR8T/ZaE4PAN2Ji3aRZ86eOkCV9qBrdqgkVXvId8NrbW+J4PjC/REAgaNnKx/c6nex7RfJw=
	=
X-Google-Smtp-Source: AGHT+IECq4I0w3/6A7apwZOsonOjQiQiwYahHKMYIdDTMnYZ7BWgqvCSc9iRaAPTx8Hq2U9oL40BX8Uq
X-Received: from wmbjg18.prod.google.com ([2002:a05:600c:a012:b0:45f:28d1:7681])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a7b:cc13:0:b0:45d:5c71:769d
 with SMTP id 5b1f17b1804b1-465045b4a35mr22803025e9.8.1758191436765; Thu, 18
 Sep 2025 03:30:36 -0700 (PDT)
Date: Thu, 18 Sep 2025 12:30:13 +0200
In-Reply-To: <20250918103010.2973462-10-ardb+git@google.com>
Mime-Version: 1.0
References: <20250918103010.2973462-10-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=5534; i=ardb@kernel.org;
 h=from:subject; bh=jAbiLA3tzC1h/HOwCrnaLpF/g7Oox62158I7TXeI+Yc=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIeP0fbOrV0QyptVlWF8wjmZdefrUxse3p3dosdhdObh1j
 7XsOrVJHaUsDGJcDLJiiiwCs/++23l6olSt8yxZmDmsTCBDGLg4BWAiKYcZ/ifGJYSa/tkbFLAs
 8frv13Nephy5xcfFFbx3otAZ/U8hZ5Yz/DMIqHx75Y+EkqJo6Ml5ApsXv1Ow4a9T2ZziNXdjXsK e5xwA
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
Message-ID: <20250918103010.2973462-12-ardb+git@google.com>
Subject: [PATCH v3 2/8] efi/runtime: Return success/failure from arch_efi_call_virt_setup()
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_033038_901770_447739E2 
X-CRM114-Status: GOOD (  13.93  )
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
2.51.0.384.g4c02a37b29-goog


