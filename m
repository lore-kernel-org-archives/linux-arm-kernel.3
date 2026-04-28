Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE618FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 18:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Goh3F7XcpkTSr7iRpzcfIAl6DDNpb912M5nWLNqSnmg=; b=EcbgCdalT9BlGR7180Y3g41mFr
	q6khZnCbJDMAPFul24ubqJEASRaJl2hvL5CiDclWl9fOxl/Tc2Bc1OBOZ201mot3rExN8azG12k3t
	SOt6sIHQmkqTUggWFr7k2wf5c+p8nFIj5E1ZIz1/c9THaGwPwxUYBc30GyM0PbTcCCbY6FowUT35R
	wt1BLXkjwtTd7yaRuvLq4ObBMn7GLrw01r9IZ0hDKOHNChxtHq7yQ3C9MtPupiMz457hHz4k15W9O
	QZWO31ngbdcQVSnr8k64BaHspI28a4udMAtiFUFiPIEatrX0Zt7PZ42t533FViLkiBnZk1RLwyOk3
	K8uYI34Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHnJN-000000026WB-1M2U;
	Tue, 28 Apr 2026 18:37:33 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHnJJ-000000026Sa-2Ksb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 18:37:30 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2b7a77b8ec9so21920665ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 11:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777401448; x=1778006248; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Goh3F7XcpkTSr7iRpzcfIAl6DDNpb912M5nWLNqSnmg=;
        b=BoFuXpAnghthwIWcGvvcgtu9UJLKpdpQslFbnBUguMoSOohYBoVPDb6iQ02PfeFYLs
         1Bn4vzTs7CwBO7ooIJis4HykPrCefLrvKdjnxJiMRV4k0Y+ROD+ivrOVn/9e4TR0MYYq
         9Swn0aGiqmW6tHPKxxNIy2vUYYETUCZ2LDL5kqbNS8gUK783/zsG71LGJWytv9TbpfR1
         vg/DMfLreVzka6ym+Q42tHMamNS63mNqRC3Ik+stzgvYy77l0PNyLfg9SInzbXyfpmkQ
         OsJguNnhUP30+An3uD/t46QYcGdW6SHJFByIM/IS6AQVgHGyQsEOGsDEGbVuBM0+JslW
         jSlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777401448; x=1778006248;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Goh3F7XcpkTSr7iRpzcfIAl6DDNpb912M5nWLNqSnmg=;
        b=IiG7mBj3C2f/tUKgT/m5wDDJEGDt9h1BPsilMcIe2b2s9ZGtQTroiOOGM3/NEcT+bT
         9FpjA7uH7V8avVeLDoA5BdFOW/gCpf2PEZU6HKR7yL+VflHdCuQtbkSW3Pd7AS9pvPY9
         ECcqs/c/kpAOthdOT7q8PI6GxmCc0Hpul3f7B0AZuD2pfTCD+bwnYWRZ+lzSlKS+yaXq
         MD7Fk/Sh5hXwGjLFCy4Gl/JcU1j1s9uPBArb0qpJcxK4vEku0eGRjYXx+5kUNTASWyZd
         ng+f+WHqwLfKOb9wGQwp+dkKzxI3wQuWZ9IT0qt5bRWFDY8VXRXNYFjUb8mbLnegIIJo
         bjsA==
X-Forwarded-Encrypted: i=1; AFNElJ9dYPbziA8qB8pANk+axEtgG7zCdCOheWH/SGTPMZp+vfEk8L0TpQBit62GLz912M3veCSM5Tta17Nb+Cy2XiHT@lists.infradead.org
X-Gm-Message-State: AOJu0YxlKmVUJqBwFdY2lxPOzNS+u/LoW9MHQ2BuMYvKvDzEkPtbIaSz
	R2F9YbT3PgK8BLFeYxJ0OqxflPrYLC2AzeVJoIizALyZIOSwGFrpB0vPoC2H7dFV/Dg58hwVrTE
	TCXHj7zZsusIVbNOr9rsi1qL5iQ==
X-Received: from plbkg3.prod.google.com ([2002:a17:903:603:b0:2b4:5fd0:a45d])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:3583:b0:2b0:59c4:e9dc with SMTP id d9443c01a7336-2b987407cfamr4803655ad.22.1777401447910;
 Tue, 28 Apr 2026 11:37:27 -0700 (PDT)
Date: Tue, 28 Apr 2026 18:36:42 +0000
In-Reply-To: <20260428183643.3796063-1-dylanbhatch@google.com>
Mime-Version: 1.0
References: <20260428183643.3796063-1-dylanbhatch@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260428183643.3796063-8-dylanbhatch@google.com>
Subject: [PATCH v5 7/8] sframe: Introduce in-kernel SFRAME_VALIDATION
From: Dylan Hatch <dylanbhatch@google.com>
To: Roman Gushchin <roman.gushchin@linux.dev>, Weinan Liu <wnliu@google.com>, 
	Will Deacon <will@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Indu Bhagat <ibhagatgnu@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Jiri Kosina <jikos@kernel.org>, Jens Remus <jremus@linux.ibm.com>
Cc: Dylan Hatch <dylanbhatch@google.com>, Mark Rutland <mark.rutland@arm.com>, 
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>, Puranjay Mohan <puranjay@kernel.org>, 
	Song Liu <song@kernel.org>, joe.lawrence@redhat.com, linux-toolchains@vger.kernel.org, 
	linux-kernel@vger.kernel.org, live-patching@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_113729_611733_B0E18012 
X-CRM114-Status: GOOD (  22.61  )
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

Generalize the __safe* helpers to support a non-user-access code path.

This requires arch-specific function address validation. This is because
arm64 vmlinux keeps .exit.text (normally discarded), and .rodata.text
sections both of which lie outside the bounds of the normal .text.
.rodata.text contains code that is never executed by the kernel mapping,
but for which the toolchain nonetheless generates sframe data, and needs
to be considered valid for a PC lookup.

Additionally .init.text lies outside .text for all arches and must be
accounted for as well.

Suggested-by: Jens Remus <jremus@linux.ibm.com>
Reviewed-by: Jens Remus <jremus@linux.ibm.com>
Signed-off-by: Dylan Hatch <dylanbhatch@google.com>
---
 arch/Kconfig                           |  2 +-
 arch/arm64/include/asm/sections.h      |  1 +
 arch/arm64/include/asm/unwind_sframe.h | 47 ++++++++++++++++++++++++++
 arch/arm64/kernel/vmlinux.lds.S        |  2 ++
 include/linux/sframe.h                 |  2 ++
 kernel/unwind/sframe.c                 | 25 ++++++++++++--
 6 files changed, 76 insertions(+), 3 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index 8d27b3249e7a..a528f5b23647 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -503,7 +503,7 @@ config HAVE_UNWIND_USER_SFRAME
 
 config SFRAME_VALIDATION
 	bool "Enable .sframe section debugging"
-	depends on HAVE_UNWIND_USER_SFRAME
+	depends on UNWIND_SFRAME_LOOKUP
 	depends on DYNAMIC_DEBUG
 	help
 	  When adding an .sframe section for a task, validate the entire
diff --git a/arch/arm64/include/asm/sections.h b/arch/arm64/include/asm/sections.h
index 51b0d594239e..5edb4304f661 100644
--- a/arch/arm64/include/asm/sections.h
+++ b/arch/arm64/include/asm/sections.h
@@ -23,6 +23,7 @@ extern char __irqentry_text_start[], __irqentry_text_end[];
 extern char __mmuoff_data_start[], __mmuoff_data_end[];
 extern char __entry_tramp_text_start[], __entry_tramp_text_end[];
 extern char __relocate_new_kernel_start[], __relocate_new_kernel_end[];
+extern char _srodatatext[], _erodatatext[];
 
 static inline size_t entry_tramp_text_size(void)
 {
diff --git a/arch/arm64/include/asm/unwind_sframe.h b/arch/arm64/include/asm/unwind_sframe.h
index 876412881196..66ebe5f38bd0 100644
--- a/arch/arm64/include/asm/unwind_sframe.h
+++ b/arch/arm64/include/asm/unwind_sframe.h
@@ -2,7 +2,54 @@
 #ifndef _ASM_ARM64_UNWIND_SFRAME_H
 #define _ASM_ARM64_UNWIND_SFRAME_H
 
+#include <linux/module.h>
+#include <linux/sframe.h>
+#include <asm/sections.h>
+
 #define SFRAME_REG_SP	31
 #define SFRAME_REG_FP	29
 
+static inline bool sframe_func_start_addr_valid(struct sframe_section *sec,
+						unsigned long func_addr)
+{
+	/* Common case for unwinding */
+	if (sec->text_start <= func_addr && func_addr < sec->text_end)
+		return true;
+
+	if (sec->sec_type != SFRAME_KERNEL)
+		return false;
+
+	/*
+	 * Account for vmlinux and module code outside the normal .text section.
+	 * The toolchain still generates sframe data for these functions, so
+	 * sframe lookups on them should be allowed.
+	 */
+	if (sec == &kernel_sfsec) {
+		if (is_kernel_inittext(func_addr))
+			return true;
+
+		/* .exit.text is retained in vmlinux on arm64. */
+		if (func_addr >= (unsigned long)__exittext_begin &&
+		    func_addr < (unsigned long)__exittext_end)
+			return true;
+
+
+		/*
+		 * .rodata.text is never executed from the kernel mapping, but
+		 * still has sframe data
+		 */
+		if (func_addr >= (unsigned long)_srodatatext &&
+		    func_addr < (unsigned long)_erodatatext)
+			return true;
+	} else {
+		struct module *mod = container_of(sec, struct module,
+						  arch.sframe_sec);
+		if (within_module_mem_type(func_addr, mod, MOD_INIT_TEXT))
+			return true;
+	}
+
+	return false;
+}
+#define sframe_func_start_addr_valid sframe_func_start_addr_valid
+
 #endif /* _ASM_ARM64_UNWIND_SFRAME_H */
diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
index 2964aad0362e..8c2dae6e7a86 100644
--- a/arch/arm64/kernel/vmlinux.lds.S
+++ b/arch/arm64/kernel/vmlinux.lds.S
@@ -213,12 +213,14 @@ SECTIONS
 
 	/* code sections that are never executed via the kernel mapping */
 	.rodata.text : {
+		_srodatatext = .;
 		TRAMP_TEXT
 		HIBERNATE_TEXT
 		KEXEC_TEXT
 		IDMAP_TEXT
 		. = ALIGN(PAGE_SIZE);
 	}
+	_erodatatext = .;
 
 	idmap_pg_dir = .;
 	. += PAGE_SIZE;
diff --git a/include/linux/sframe.h b/include/linux/sframe.h
index 27f5a66190af..ac3aa9db7d91 100644
--- a/include/linux/sframe.h
+++ b/include/linux/sframe.h
@@ -34,6 +34,8 @@ struct sframe_section {
 	signed char		fp_off;
 };
 
+extern struct sframe_section kernel_sfsec __ro_after_init;
+
 #endif /* CONFIG_UNWIND_SFRAME_LOOKUP */
 
 #ifdef CONFIG_HAVE_UNWIND_USER_SFRAME
diff --git a/kernel/unwind/sframe.c b/kernel/unwind/sframe.c
index 70001c8e586d..99c2a39c51ce 100644
--- a/kernel/unwind/sframe.c
+++ b/kernel/unwind/sframe.c
@@ -21,10 +21,18 @@
 #include "sframe.h"
 #include "sframe_debug.h"
 
+#ifndef sframe_func_start_addr_valid
+static inline bool sframe_func_start_addr_valid(struct sframe_section *sec,
+						unsigned long func_addr)
+{
+	return (sec->text_start <= func_addr && func_addr < sec->text_end);
+}
+#endif
+
 #ifdef CONFIG_HAVE_UNWIND_KERNEL_SFRAME
 
 static bool sframe_init __ro_after_init;
-static struct sframe_section kernel_sfsec __ro_after_init;
+struct sframe_section kernel_sfsec __ro_after_init;
 
 #endif /* CONFIG_HAVE_UNWIND_KERNEL_SFRAME */
 
@@ -152,7 +160,7 @@ static __always_inline int __read_fde(struct sframe_section *sec,
 		  sizeof(struct sframe_fde_v3), Efault);
 
 	func_addr = fde_addr + _fde.func_start_off;
-	if (func_addr < sec->text_start || func_addr > sec->text_end)
+	if (!sframe_func_start_addr_valid(sec, func_addr))
 		return -EINVAL;
 
 	fda_addr = sec->fres_start + _fde.fres_off;
@@ -636,6 +644,9 @@ static int safe_read_fde(struct sframe_section *sec,
 {
 	int ret;
 
+	if (sec->sec_type == SFRAME_KERNEL)
+		return __read_fde(sec, fde_num, fde);
+
 	if (!user_read_access_begin((void __user *)sec->sframe_start,
 				    sec->sframe_end - sec->sframe_start))
 		return -EFAULT;
@@ -651,6 +662,9 @@ static int safe_read_fre(struct sframe_section *sec,
 {
 	int ret;
 
+	if (sec->sec_type == SFRAME_KERNEL)
+		return __read_fre(sec, fde, fre_addr, fre);
+
 	if (!user_read_access_begin((void __user *)sec->sframe_start,
 				    sec->sframe_end - sec->sframe_start))
 		return -EFAULT;
@@ -665,6 +679,9 @@ static int safe_read_fre_datawords(struct sframe_section *sec,
 {
 	int ret;
 
+	if (sec->sec_type == SFRAME_KERNEL)
+		return __read_fre_datawords(sec, fde, fre);
+
 	if (!user_read_access_begin((void __user *)sec->sframe_start,
 				    sec->sframe_end - sec->sframe_start))
 		return -EFAULT;
@@ -1013,6 +1030,8 @@ void __init init_sframe_table(void)
 
 	if (WARN_ON(sframe_read_header(&kernel_sfsec)))
 		return;
+	if (WARN_ON(sframe_validate_section(&kernel_sfsec)))
+		return;
 
 	sframe_init = true;
 }
@@ -1031,6 +1050,8 @@ void sframe_module_init(struct module *mod, void *sframe, size_t sframe_size,
 
 	if (WARN_ON(sframe_read_header(&sec)))
 		return;
+	if (WARN_ON(sframe_validate_section(&sec)))
+		return;
 
 	mod->arch.sframe_sec = sec;
 	mod->arch.sframe_init = true;
-- 
2.54.0.545.g6539524ca2-goog


