Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E37F3CD6E56
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 11:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xJ6q700kUF7wjF4x7VovFZph81ig181xRJbw3b4wh8w=; b=I9+y4Fvfg+q1v34L5X553XxIuB
	LQuNMPxtlDTPAi2OIsU9k4hKSa4rWOwxEwRItnkaK9L9epF3HBLymGe17kdk+HROnjXiETLa6fL6i
	fzfyOBO8Q2oKBDN7s+kYf7nGu3sX/WYbzQKyTgeCb0YCvaO1TN+SnMzHEB5pUxUgvzVc3ZGu+A5PD
	K0FZlFOVyt6BcObK4DNf8656Y2KGmmjNZQcaeczEGW1IR1YugzM2PxYAZ3TH2dJRsqpDuZqTIe/Rd
	RObygQWDGsWTBUtu52xcPiyTKLNhk9TMBHpWdQOYj6oll/504+iT65ibj+2tQBDaBo6iSNQTxAkMr
	l81sYhDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUjPn-0000000EsU6-3pcG;
	Wed, 03 Jun 2026 11:05:39 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUjPj-0000000EsQ4-3IoZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 11:05:37 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-490ae016853so17726945e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 04:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780484733; x=1781089533; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xJ6q700kUF7wjF4x7VovFZph81ig181xRJbw3b4wh8w=;
        b=e/lHEjn9wNPcLcxXrxwosGmTmIZ9+S8Nv2w2K2nRg/7R1ncI7/9lWtEiH/r6dbwAnH
         jHRGS0MgZbx21UN38AJF4hwbKKEq0BmplT4VxlEst5hIlG7+TNdL8PIqWHPR0uC7NvWg
         XSQoITXYt+RltyhWbkZEWrT0axzgDDmJGY2ZmAQQCjdD1hYMwUcwEMUkM7b+kyWdwJv0
         f+CA+bTj8r2rJC6BbEdUn31+h2fsqdBlPHJrss6LKF80FscQZJ4kFjJZVtfwJSyCzdxB
         9DazJ5FYDStFF4tvYkIXBeVIvx5J+Lpqep70z/O3Z8zM0F5qxj3auPC/85uY342XWw/E
         keLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780484733; x=1781089533;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xJ6q700kUF7wjF4x7VovFZph81ig181xRJbw3b4wh8w=;
        b=N3U9vsklpR40y3xyVvogcEXFsxOPjVIR63j7QdLZdBoXBg8VLp5yVzzzf2KLZ5O4eI
         2F2HNme6TEgaANZggEcCV6tifPup9K+uudaphfZQEzO8hWFNGfNhQcYNytYVzrv6WOEJ
         BYfWKiZzKXMVbl9X1roICYqKBUkUiPMFpreMMInKCDJN7PVix6HTIQXloFkmT3DDRbrc
         tWCzuRkHZAyKX4B8mViN/Hmsb9o3ljzatzEjysYxBhQqz8OYBbahpla62uQqMsiNtLHt
         nCkBcnC/iq2OETjbQ5MgtlZr9Ad5KvNDEO+F5UXGdg5+n8Udfj+zIaNFzQcFAUXwHLm3
         THog==
X-Gm-Message-State: AOJu0YxtPHg+OSRPby8BROf7Am7B9AEAj0aa5T0HIxiRoEZgX6YSzn6d
	0gV/Mk+HpQKa41IU+j8UwaKQZH5J6vqhyoDvC6vL5hlGhX/dwPCcN61Inbyb21mq3wyx64kvUAs
	qrt8WYfGEBYeSuNYdaAOHH8sp7n9o/NWPNKKQR2mi4fqJm5zV9C21Efk6iYklOmB1QrEGfF7SpE
	g9Eyo4uh0CZ8GCzVm6J64+goh4YikZuPhHu2Qbu+wRb4Esww0dIZ5G0kGvK/PsL2jlKw==
X-Received: from wrp11.prod.google.com ([2002:a05:6000:41eb:b0:45e:f3a6:7475])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:46ce:b0:490:4b89:535f with SMTP id 5b1f17b1804b1-490b5ec0349mr42159705e9.8.1780484733255;
 Wed, 03 Jun 2026 04:05:33 -0700 (PDT)
Date: Wed,  3 Jun 2026 11:05:22 +0000
In-Reply-To: <20260603110522.3331819-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260603110522.3331819-1-smostafa@google.com>
X-Mailer: git-send-email 2.54.0.1032.g2f8565e1d1-goog
Message-ID: <20260603110522.3331819-4-smostafa@google.com>
Subject: [PATCH 3/3] arm64/coco: Add pKVM as a CC platform
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: akpm@linux-foundation.org, catalin.marinas@arm.com, will@kernel.org, 
	rppt@kernel.org, maz@kernel.org, aneesh.kumar@kernel.org, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_040535_850560_8549E1D7 
X-CRM114-Status: GOOD (  19.49  )
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

pKVM does support memory encryption, expose that to the rest of
the kernel through cc_platform_has()

At the moment, all devices inside the guest are emulated which
requires its memory to be shared back to the host (decrypted), so
set force_dma_unencrypted() to always return true.

Although, typically pKVM guests rely on restricted-dma-pools to
bounce traffic, with this change, it is possible to solely rely on
the default SWIOTLB for that (assuming the appropriate size is set
from the command line)

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
This change is critical for the ongoing refactoring of the DMA-API[1]
that will break protected guests under pKVM with this patch. That is
due to this rework will make the state of the SWIOTLB and restricted
dma pools depends on the value returned by cc_platform_has()

[1] https://lore.kernel.org/all/20260522042815.370873-1-aneesh.kumar@kernel.org/
---
 arch/arm64/include/asm/hypervisor.h           | 13 +++++++++++++
 arch/arm64/include/asm/mem_encrypt.h          |  3 ++-
 arch/arm64/kernel/rsi.c                       | 12 ------------
 arch/arm64/mm/init.c                          | 15 ++++++++++++++-
 drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c |  3 +++
 5 files changed, 32 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/include/asm/hypervisor.h b/arch/arm64/include/asm/hypervisor.h
index a12fd897c877..8889a0ba1ec5 100644
--- a/arch/arm64/include/asm/hypervisor.h
+++ b/arch/arm64/include/asm/hypervisor.h
@@ -3,6 +3,9 @@
 #define _ASM_ARM64_HYPERVISOR_H
 
 #include <asm/xen/hypervisor.h>
+#include <linux/jump_label.h>
+
+DECLARE_STATIC_KEY_FALSE(pkvm_guest);
 
 void kvm_init_hyp_services(void);
 bool kvm_arm_hyp_service_available(u32 func_id);
@@ -10,8 +13,18 @@ void kvm_arm_target_impl_cpu_init(void);
 
 #ifdef CONFIG_ARM_PKVM_GUEST
 void pkvm_init_hyp_services(void);
+
+static inline bool is_protected_kvm_guest(void)
+{
+	return static_branch_unlikely(&pkvm_guest);
+}
 #else
 static inline void pkvm_init_hyp_services(void) { };
+
+static inline bool is_protected_kvm_guest(void)
+{
+	return false;
+}
 #endif
 
 static inline void kvm_arch_init_hyp_services(void)
diff --git a/arch/arm64/include/asm/mem_encrypt.h b/arch/arm64/include/asm/mem_encrypt.h
index 314b2b52025f..636f45b4d8af 100644
--- a/arch/arm64/include/asm/mem_encrypt.h
+++ b/arch/arm64/include/asm/mem_encrypt.h
@@ -2,6 +2,7 @@
 #ifndef __ASM_MEM_ENCRYPT_H
 #define __ASM_MEM_ENCRYPT_H
 
+#include <asm/hypervisor.h>
 #include <asm/rsi.h>
 
 struct device;
@@ -20,7 +21,7 @@ int realm_register_memory_enc_ops(void);
 
 static inline bool force_dma_unencrypted(struct device *dev)
 {
-	return is_realm_world();
+	return is_realm_world() || is_protected_kvm_guest();
 }
 
 /*
diff --git a/arch/arm64/kernel/rsi.c b/arch/arm64/kernel/rsi.c
index 92160f2e57ff..25ca75ce1a4d 100644
--- a/arch/arm64/kernel/rsi.c
+++ b/arch/arm64/kernel/rsi.c
@@ -7,7 +7,6 @@
 #include <linux/memblock.h>
 #include <linux/psci.h>
 #include <linux/swiotlb.h>
-#include <linux/cc_platform.h>
 #include <linux/platform_device.h>
 
 #include <asm/io.h>
@@ -23,17 +22,6 @@ EXPORT_SYMBOL(prot_ns_shared);
 DEFINE_STATIC_KEY_FALSE_RO(rsi_present);
 EXPORT_SYMBOL(rsi_present);
 
-bool cc_platform_has(enum cc_attr attr)
-{
-	switch (attr) {
-	case CC_ATTR_MEM_ENCRYPT:
-		return is_realm_world();
-	default:
-		return false;
-	}
-}
-EXPORT_SYMBOL_GPL(cc_platform_has);
-
 static bool rsi_version_matches(void)
 {
 	unsigned long ver_lower, ver_higher;
diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
index fcc9c05a8fe6..edcc305ec883 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -11,6 +11,7 @@
 #include <linux/errno.h>
 #include <linux/swap.h>
 #include <linux/init.h>
+#include <linux/cc_platform.h>
 #include <linux/cache.h>
 #include <linux/mman.h>
 #include <linux/nodemask.h>
@@ -36,6 +37,7 @@
 
 #include <asm/boot.h>
 #include <asm/fixmap.h>
+#include <asm/hypervisor.h>
 #include <asm/kasan.h>
 #include <asm/kernel-pgtable.h>
 #include <asm/kvm_host.h>
@@ -338,7 +340,7 @@ void __init arch_mm_preinit(void)
 	unsigned int flags = SWIOTLB_VERBOSE;
 	bool limited_addressing = max_pfn > PFN_DOWN(arm64_dma_phys_limit);
 
-	if (is_realm_world()) {
+	if (is_realm_world() || is_protected_kvm_guest()) {
 		flags |= SWIOTLB_FORCE;
 	} else if (!limited_addressing) {
 		/*
@@ -413,6 +415,17 @@ void dump_mem_limit(void)
 	}
 }
 
+bool cc_platform_has(enum cc_attr attr)
+{
+	switch (attr) {
+	case CC_ATTR_MEM_ENCRYPT:
+		return is_realm_world() || is_protected_kvm_guest();
+	default:
+		return false;
+	}
+}
+EXPORT_SYMBOL_GPL(cc_platform_has);
+
 #ifdef CONFIG_EXECMEM
 static u64 module_direct_base __ro_after_init = 0;
 static u64 module_plt_base __ro_after_init = 0;
diff --git a/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c b/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
index d66291def0f4..26fe9c3f22e3 100644
--- a/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
+++ b/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
@@ -17,6 +17,7 @@
 #include <asm/hypervisor.h>
 
 static size_t pkvm_granule;
+DEFINE_STATIC_KEY_FALSE_RO(pkvm_guest);
 
 static int arm_smccc_do_one_page(u32 func_id, phys_addr_t phys)
 {
@@ -120,4 +121,6 @@ void pkvm_init_hyp_services(void)
 
 	if (kvm_arm_hyp_service_available(ARM_SMCCC_KVM_FUNC_MMIO_GUARD))
 		arm64_ioremap_prot_hook_register(&mmio_guard_ioremap_hook);
+
+	static_branch_enable(&pkvm_guest);
 }
-- 
2.54.0.1032.g2f8565e1d1-goog


