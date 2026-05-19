Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32222CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 06:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=09BVAzCIUqOtkX4/stwVI7xX6xNgSRElI8wKp45KCp0=; b=yon+Ek1QzOFWJYoDCqG8MO2FFq
	gxnIf5LachQ9vljeYgUdfwJfQNPZ+VM3nYNTP+E8d0md0/Qt0rAxV6zCcGobiAhq8dEm+0tWz06rO
	vBxgZwZ0wuN3Q1TyyoNwRyVG42pIkWUf/7X5WYIgEYj2LKD94F4pcYS32bm9t4vBB4+PzP9DiO4r/
	7uvT5XOJutbCybH0YiDsz+NGgxXJQiCaS/s1z4wwPr0SWzkNiLqcP73wzWbJgH5DqaxAUfP8pQM0m
	Zf0ov+adLlmBt9qq4LnGXU8SdAtNTlkyhmBhPkLvYMr7WjykTF4qhgAUZieoe68sOQXralXleEw6G
	FBXcdUdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPEHd-00000000Ogk-0mNm;
	Tue, 19 May 2026 06:50:29 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPEHT-00000000OYl-1t65
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 06:50:20 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-368edd5fec4so3525845a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 23:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779173418; x=1779778218; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=09BVAzCIUqOtkX4/stwVI7xX6xNgSRElI8wKp45KCp0=;
        b=KJ7B+a//I2+UKP3eoxjkonYSEaJ6NnT9zqRQ7j8K8Xjf4L9Oqn9fHMyv0dxgmDwSTj
         UFe5LZPtFZbkM5VerA0V0936OxMf/xBS5t4A40eJuk8xiFczLg9UJHZeeNsu3E8adUh6
         O/prytGOD3JCiR6/Ubv/haOThf29EAK7XSG5zovwHCL5YKDtBWFn5J0xUQicW6S4wgc/
         mt3sBvJWTMxOrBf30dFQ1knYQ5an0IMB/JJwboW9jufT+62WpzBICs3XQK9RrMwUo5qJ
         rDH5I1QWmMkfSMt+/cUqsJwMufOndS/lfBoXewgFFz2CWcXzR+xIQy3fOpNSPFi/QCmN
         AcMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779173418; x=1779778218;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=09BVAzCIUqOtkX4/stwVI7xX6xNgSRElI8wKp45KCp0=;
        b=e8S0nIgts5Ei++4LG11Lo10iIrtawosPTyxB8HWgmOnKx9QbYoGvhXxgxLuaGZEe79
         LNSs0+x03Ua0TjVtxhxuE5ZLZpEwkfDnnDEOByp9SrHzvglnTA+4Jg7SzabJxA+kdEoF
         h2gDUNySVaCAarPCgwjnGnJnwZDBwdg9MEabVlrmmpx40ZcrVlkx2xACE1R3Yhsrobql
         BU6IHMRvemvtI6+fNf9ki0lHlgZWrfdQnPa40JHhN24tbEn8HqsE79eb/FkDXGyUlhTG
         O/Csxw+vwp/XZkPygv6HsGUSjbJAVYtmIV6ByLggbe+PnXvni2ompT8VHTw1iBmDjTGt
         JJpg==
X-Forwarded-Encrypted: i=1; AFNElJ+r6fJC/wbaDnKaB8wUw8ZbemgIHbiBN8H8OvLDoJwwZx6iDWnyEcKGsFbrWD3I6US80d7Rbw2XdzWCz5YxkncF@lists.infradead.org
X-Gm-Message-State: AOJu0Yw723qpYZISDCq6W7v0RTwzuREBwTdtLQa+6Z87k31Iq1nqm/94
	pzJytcVCCUNyCipoZy5xIqNKYqf6fyTcAbnzscuKF/t2lAuwI55FLNFF6D532ua7eaRE9LGk1s6
	zp2s6LTDgYSnV/rEkjLuzea0geQ==
X-Received: from pjbta4.prod.google.com ([2002:a17:90b:4ec4:b0:368:edd5:fe57])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:58c4:b0:367:b9ed:665f with SMTP id 98e67ed59e1d1-36951a6cdf4mr16650731a91.13.1779173418242;
 Mon, 18 May 2026 23:50:18 -0700 (PDT)
Date: Tue, 19 May 2026 06:49:48 +0000
In-Reply-To: <20260519064950.493949-1-dylanbhatch@google.com>
Mime-Version: 1.0
References: <20260519064950.493949-1-dylanbhatch@google.com>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260519064950.493949-8-dylanbhatch@google.com>
Subject: [PATCH v6 7/9] sframe: Introduce in-kernel SFRAME_VALIDATION
From: Dylan Hatch <dylanbhatch@google.com>
To: Roman Gushchin <roman.gushchin@linux.dev>, Weinan Liu <wnliu@google.com>, 
	Will Deacon <will@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Indu Bhagat <ibhagatgnu@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Jiri Kosina <jikos@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Jens Remus <jremus@linux.ibm.com>
Cc: Dylan Hatch <dylanbhatch@google.com>, Prasanna Kumar T S M <ptsm@linux.microsoft.com>, 
	Puranjay Mohan <puranjay@kernel.org>, Song Liu <song@kernel.org>, joe.lawrence@redhat.com, 
	linux-toolchains@vger.kernel.org, linux-kernel@vger.kernel.org, 
	live-patching@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Randy Dunlap <rdunlap@infradead.org>, Mostafa Saleh <smostafa@google.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_235019_499295_36454757 
X-CRM114-Status: GOOD (  23.09  )
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
 arch/arm64/include/asm/unwind_sframe.h | 46 ++++++++++++++++++++++++++
 arch/arm64/kernel/vmlinux.lds.S        |  2 ++
 include/linux/sframe.h                 |  2 ++
 kernel/unwind/sframe.c                 | 25 ++++++++++++--
 6 files changed, 75 insertions(+), 3 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index f931b5848593..fa1f43f47a53 100644
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
index 876412881196..eb269a54b9ef 100644
--- a/arch/arm64/include/asm/unwind_sframe.h
+++ b/arch/arm64/include/asm/unwind_sframe.h
@@ -2,7 +2,53 @@
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
index e1ac876200a3..68700b4d5070 100644
--- a/arch/arm64/kernel/vmlinux.lds.S
+++ b/arch/arm64/kernel/vmlinux.lds.S
@@ -225,12 +225,14 @@ SECTIONS
 
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
index dfa013450705..e8ede0343cb2 100644
--- a/kernel/unwind/sframe.c
+++ b/kernel/unwind/sframe.c
@@ -24,10 +24,18 @@
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
 
@@ -155,7 +163,7 @@ static __always_inline int __read_fde(struct sframe_section *sec,
 		  sizeof(struct sframe_fde_v3), Efault);
 
 	func_addr = fde_addr + _fde.func_start_off;
-	if (func_addr < sec->text_start || func_addr >= sec->text_end)
+	if (!sframe_func_start_addr_valid(sec, func_addr))
 		return -EINVAL;
 
 	fda_addr = sec->fres_start + _fde.fres_off;
@@ -607,6 +615,9 @@ static int safe_read_fde(struct sframe_section *sec,
 {
 	int ret;
 
+	if (sec->sec_type == SFRAME_KERNEL)
+		return __read_fde(sec, fde_num, fde);
+
 	if (!user_read_access_begin((void __user *)sec->sframe_start,
 				    sec->sframe_end - sec->sframe_start))
 		return -EFAULT;
@@ -622,6 +633,9 @@ static int safe_read_fre(struct sframe_section *sec,
 {
 	int ret;
 
+	if (sec->sec_type == SFRAME_KERNEL)
+		return __read_fre(sec, fde, fre_addr, fre);
+
 	if (!user_read_access_begin((void __user *)sec->sframe_start,
 				    sec->sframe_end - sec->sframe_start))
 		return -EFAULT;
@@ -636,6 +650,9 @@ static int safe_read_fre_datawords(struct sframe_section *sec,
 {
 	int ret;
 
+	if (sec->sec_type == SFRAME_KERNEL)
+		return __read_fre_datawords(sec, fde, fre);
+
 	if (!user_read_access_begin((void __user *)sec->sframe_start,
 				    sec->sframe_end - sec->sframe_start))
 		return -EFAULT;
@@ -1021,6 +1038,8 @@ void __init init_sframe_table(void)
 
 	if (WARN_ON(sframe_read_header(&kernel_sfsec)))
 		return;
+	if (WARN_ON(sframe_validate_section(&kernel_sfsec)))
+		return;
 
 	sframe_init = true;
 }
@@ -1084,6 +1103,8 @@ void sframe_module_init(struct module *mod, void *sframe, size_t sframe_size,
 		return;
 	if (WARN_ON(sframe_sort_fdes(sec)))
 		return;
+	if (WARN_ON(sframe_validate_section(sec)))
+		return;
 
 	mod->arch.sframe_init = true;
 }
-- 
2.54.0.563.g4f69b47b94-goog


