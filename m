Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A794F94CB3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 22:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nEd1rBfN1UN8u0n4o9rP4+aQumOHvzk1E9l2M+hyRdQ=; b=ulVvPr11ByxdHmZJk1Xg0cVAEg
	3nRbSZUppu375rfCOBcdj3ThVxs3g2YFLoBzuFmW2o+rJ74ixh1FdKDLEGk2bwK7pjdV5Y4oTr18+
	HkOu43mAdjYkERdHJi1ArNSBYifsoEHKP+JnBG80ZDHf8c97UCYs5AR6o7bS3ECHGimGteYJKUyHP
	KAl0Bgf3z8D1Oimn0PTpJ5uMl75Gznya2HKFh97ue4xWISsJVIBkchJUzjCIzY458D9oOsK6ySL5c
	tqqeO23+qFenASTWPu7pD10g+WKH6YXFeB+ji6RI3ZRzPCp522PkpcP3PjuoVuJca8653uHt0+lNb
	wsKBv1fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFJxK-00000009NcO-1NNO;
	Tue, 21 Apr 2026 22:52:34 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFJxF-00000009NWN-45OE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 22:52:31 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-82f8bbb4045so2987183b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 15:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776811948; x=1777416748; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nEd1rBfN1UN8u0n4o9rP4+aQumOHvzk1E9l2M+hyRdQ=;
        b=e/BRAbnfoV41Lz5lZXArCwLOE/4azE5xd/k5m5w/PLIWCuHFOBiO1LDFxfQx41ZObt
         WAT1/6QenHtIkK8Xu49nxD4y7qubVvTkO9hkUiPoKfolak5Y+4ZCbvXvUnPe7y7t/nfh
         6n5q2PBQuu2YDaXz1gskwoipajj7npokCv+Dh/MW+YufJ9DtJHL2LKN5Kjc2zgHfcSK/
         coWhFyzLHqGCtoSS4Bh3MLW+9bwHpWaLgD0STdrqQdTcf0u5OvMJiS3G0qvWom1irCmO
         OcIZQNdhZ/lqe2LtJ5VG2PCqjkfVupuENJbntrBOBnpi08H/es41ZzrltGsECEdr6ZmO
         pVNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776811948; x=1777416748;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nEd1rBfN1UN8u0n4o9rP4+aQumOHvzk1E9l2M+hyRdQ=;
        b=ppFvEdhBQ2xcoufQyNL95dR9lh419fmWRxnzLxWVLJWiuV6/WHumFtiZCHbZ+s9zH8
         NSbKoTU+aN0MjqBwjwnJClOoJqtThxZwDOvyclTZzB+PhJB7YrjNKHlpL3/nK3opbJ29
         LCaZzEt1cTVfS+KQ5SwmnftR9ni0AHPfWgH94A0T3eiuyc8aSDEB5EGhEjb+5wdujRXC
         xGPS+VFHo7wie8CUak8loARaewKUlSPoU2zz9EQnHqvlR5traXkkT6zX358rCb5YdotC
         0vH/dxQ4qqgvqbyr0ZSOUbs1Ucs5U6Pxpc767BAG+aEWUvQcay3J7i1bIBFkz/4z4/Ez
         /OUA==
X-Forwarded-Encrypted: i=1; AFNElJ9D5WM41biD08q/NHU5ZHl0cBE6DmdC/FoSZmfPvYCa63og86MiYZ+A/roPA3p+InUXCLxqZHMrY87KkS0zaqkj@lists.infradead.org
X-Gm-Message-State: AOJu0YyWT6NwHB4TItijUFx55u8aCjcE1E516P2kk3TqkGoSZgm+4tmQ
	sG3KaBLyxDxGUhUVSft7VbmU3UF0BPJLDXgLneX95ys9t53KgICCIg5HEquoAB/+PgkPKVSB+vE
	1ex5omXjIN1WpDO4j5R3hclO1Cg==
X-Received: from pfoo23.prod.google.com ([2002:a05:6a00:1a17:b0:82f:aad4:3985])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:a90:b0:827:433c:ba7e with SMTP id d2e1a72fcca58-82f8c970703mr20257960b3a.41.1776811948135;
 Tue, 21 Apr 2026 15:52:28 -0700 (PDT)
Date: Tue, 21 Apr 2026 22:51:59 +0000
In-Reply-To: <20260421225200.1198447-1-dylanbhatch@google.com>
Mime-Version: 1.0
References: <20260421225200.1198447-1-dylanbhatch@google.com>
X-Mailer: git-send-email 2.54.0.rc1.555.g9c883467ad-goog
Message-ID: <20260421225200.1198447-8-dylanbhatch@google.com>
Subject: [PATCH v4 7/8] sframe: Introduce in-kernel SFRAME_VALIDATION
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
X-CRM114-CacheID: sfid-20260421_155230_022377_19BFFA54 
X-CRM114-Status: GOOD (  22.36  )
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
arm64 vmlinux has an .rodata.text section which lies outside the bounds
of the normal .text. It contains code that is never executed by the
kernel mapping, but for which the toolchain nonetheless generates sframe
data, and needs to be considered valid for a PC lookup.

This arch-specific address validation logic is only necessary to support
SFRAME_VALIDATION for the vmlinux .sframe, since these .rodata.text
functions would never be encountered during normal unwinding.

Signed-off-by: Dylan Hatch <dylanbhatch@google.com>
Suggested-by: Jens Remus <jremus@linux.ibm.com>
---
 arch/Kconfig                           |  2 +-
 arch/arm64/include/asm/sections.h      |  1 +
 arch/arm64/include/asm/unwind_sframe.h | 21 +++++++++++++++++++++
 arch/arm64/kernel/vmlinux.lds.S        |  2 ++
 include/linux/sframe.h                 |  2 ++
 kernel/unwind/sframe.c                 | 25 +++++++++++++++++++++++--
 6 files changed, 50 insertions(+), 3 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index 8d27b3249e7a..cd4849bb675c 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -503,7 +503,7 @@ config HAVE_UNWIND_USER_SFRAME
 
 config SFRAME_VALIDATION
 	bool "Enable .sframe section debugging"
-	depends on HAVE_UNWIND_USER_SFRAME
+	depends on SFRAME_LOOKUP
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
index 876412881196..1e9d7b74c0c8 100644
--- a/arch/arm64/include/asm/unwind_sframe.h
+++ b/arch/arm64/include/asm/unwind_sframe.h
@@ -2,7 +2,28 @@
 #ifndef _ASM_ARM64_UNWIND_SFRAME_H
 #define _ASM_ARM64_UNWIND_SFRAME_H
 
+#include <linux/sframe.h>
+#include <asm/sections.h>
+
 #define SFRAME_REG_SP	31
 #define SFRAME_REG_FP	29
 
+static inline bool sframe_func_start_addr_valid(struct sframe_section *sec,
+						unsigned long func_addr)
+{
+	/*
+	 * The .rodata.text section is outside the normal kernel .text, but the
+	 * toolchain still generates sframe data for it. Allow sframe lookups
+	 * for these functions, even though they are never executed from the
+	 * kernel mapping.
+	 */
+	if (sec->sec_type == SFRAME_KERNEL && sec == &kernel_sfsec &&
+	    func_addr >= (unsigned long)_srodatatext &&
+	    func_addr < (unsigned long)_erodatatext)
+		return true;
+
+	return (sec->text_start <= func_addr && func_addr < sec->text_end);
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
index 20178e02f428..d76968547bad 100644
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
2.54.0.rc1.555.g9c883467ad-goog


