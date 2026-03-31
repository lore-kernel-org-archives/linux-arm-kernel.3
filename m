Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80F4C1061B26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 11:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=36J1iwO3uewGR7LwpckoN3+SUciZBWS6Lj6AbSclXvk=; b=adNlM2hL48J9Inm0D2/saAxbY2
	LhsgCGrCfAG2UcUBr5UyO+T183W6hu9ozwP4qM83cz0MlEzJA1NFbqW7xbSOGIV+bu/fDdrkf8eoZ
	dETlua5CeE9PG8IznRUD3KoVC5i6fh2GygT8KDCIY9V3TvcUmORYbFMPfgLDedcFDc2LBYzIhEfng
	RQQZEr0/CkbtAvRkp1qMDnrbpG7MAamxoi3Gj1NksXj79OI0sMxxX7MJqYCDGPgM9EJgf9YQEnBgC
	TJOHLfFDBpx71G4+l/8Vy1xjFjUJ5We/EakC+MFMm97pi15KvfTJN16xBAdK2JGVxdu1d+iRPMCxQ
	F2bpmp0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Wtd-0000000CpIY-3KSz;
	Tue, 31 Mar 2026 11:04:33 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Wtb-0000000CpHt-1nZR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 11:04:32 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-43d03db814eso1306550f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 04:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774955069; x=1775559869; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=36J1iwO3uewGR7LwpckoN3+SUciZBWS6Lj6AbSclXvk=;
        b=aYYtrubBsKu5Le91W9ZSVkzSypFkCMuq2AcnacuFxRzNYLjk4SUfrjb9xcw4wlw8Bv
         lByWZ9jm+Z/EbqcWBLZRwVSEPNqZmV4NuVPupMsT2LIqqPAukqJu01vQTHPI7mMdgk0l
         ww6Cbb03JAlh+DLRBu76GofsiWRgkO3/TcgAaM1+0y+X199U9mp1IXzLot1J2iND8ylt
         Gmm9ZRf5GTmbWezKGHsIqsASi3IWWu8YacH79Y/DNCADB+RPhLZiRMI508tv8o1VHqaA
         BVPtKIvtsJR8Vn/ea8I4ObrPKp+meq88HSFTPgCLDkYz/h/dYQkdSp5zjiV/eoNVWwWU
         mpKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774955069; x=1775559869;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=36J1iwO3uewGR7LwpckoN3+SUciZBWS6Lj6AbSclXvk=;
        b=RFwyET6bEzfbT8XSvx5rbJhXU904dMfuIjwJ5hriBDzfooEEToJFLysDoK+Y+1JZ/Q
         fR19xyVg9YpqlElJBxcrLgwb7AHk4Hf00DlwNlto3OqnMF7TFV+lqdawtjXZH/fYMQX3
         SwIq3jYvMeJJ5xxSHHcziC5GqcAaTi66C/2GbHLYWX+TFMycjs6qm8SwTSICkWUsQUD+
         y+OTyerg9qok6BgLcK4jToHoZHHFZGQMg2amu251GXtn/o8la4IgpcqM52/hJ2qiJR19
         g2BYR/um4LfE6XeKqJfjL0u2OMdI+pHI/RfxJ5JKDE4/czEp5QB6DxwJ0A+c1YWNuZH7
         Pnwg==
X-Gm-Message-State: AOJu0YxklIg7EZDkIUOVonmg3vCdZFGS+bX4Y0Z4QXDJDWPZ1y5viESh
	aefFGISpCo5Mlmx7zsD2s5To1PqK6Cbs9VmpgK0aN1fF8aAwSIBbabriN6KtKUQP1PLZjB6LxOC
	PLgy3Uun+EynyiF34zxzkxzdvBfDO8VJgLWZJcZ4k+drCAQX6f5USQwMamFQDAcZQVIaj8WfL+r
	NJgjWis8w4B0zGjVfw9hFuwPZV46qNRXUVSDPM96lLrLIq
X-Received: from wrnl9.prod.google.com ([2002:adf:e9c9:0:b0:43c:ffbe:2059])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:4013:b0:43b:5b25:67f8
 with SMTP id ffacd0b85a97d-43b9e99790bmr28653172f8f.20.1774955068516; Tue, 31
 Mar 2026 04:04:28 -0700 (PDT)
Date: Tue, 31 Mar 2026 13:04:23 +0200
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=5752; i=ardb@kernel.org;
 h=from:subject; bh=UkgpvkytwmrQFmSMa05ABh3qtcMUUiZ2w9uwBJoLROk=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIfP0KvPZS/7WLjKrffvxxo/vfMwzRDb/yF08s3iforadt
 u62vumXOkpZGMS4GGTFFFkEZv99t/P0RKla51myMHNYmUCGMHBxCsBEmm0Y/leWZ9/Ou39Sbc4p
 xeaZWQKKpWtUxB4ktlU4vJx6Vfj7BH6G/xEtFzaX8MoutFYJKLH+u4Sxt3Vt30tTz0n1X1rY/zO 2cgEA
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
Message-ID: <20260331110422.301901-2-ardb+git@google.com>
Subject: [PATCH v8] arm64: Use static call trampolines when kCFI is enabled
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-hardening@vger.kernel.org, will@kernel.org, mark.rutland@arm.com, 
	Ard Biesheuvel <ardb@kernel.org>, Carlos Llamas <cmllamas@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Sean Christopherson <seanjc@google.com>, Kees Cook <kees@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Will McVicker <willmcvicker@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_040431_504973_99AC667A 
X-CRM114-Status: GOOD (  21.01  )
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

Implement arm64 support for the 'unoptimized' static call variety, which
routes all calls through a trampoline that performs a tail call to the
chosen function, and wire it up for use when kCFI is enabled. This works
around an issue with kCFI and generic static calls, where the prototypes
of default handlers such as __static_call_nop() and __static_call_ret0()
don't match the expected prototype of the call site, resulting in kCFI
false positives [0].

Since static call targets may be located in modules loaded out of direct
branching range, this needs a ADRP/ADD pair to load the branch target
into R16 and a branch-to-register (BR) instruction to perform an
indirect call. This is the exact code sequence that is used by modules
when the call target is out of direct branching range.

Unlike on x86, there is no pressing need on arm64 to avoid indirect
calls at all cost, but hiding it from the compiler as is done here does
have some benefits:
- the literal is located in .rodata, which gives us the same robustness
  advantage that code patching does;
- no D-cache pollution from fetching hash values from .text sections.

From an execution speed PoV, this is unlikely to make any difference at
all.

[0] https://lore.kernel.org/all/20260311225822.1565895-1-cmllamas@google.com/

Cc: Carlos Llamas <cmllamas@google.com>
Cc: Sami Tolvanen <samitolvanen@google.com>
Cc: Sean Christopherson <seanjc@google.com>
Cc: Kees Cook <kees@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Will McVicker <willmcvicker@google.com>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
v8: Simplify the trampoline by combining the NULL and RET0 cases, and
    dropping the conditional branch and return
v7: https://lore.kernel.org/all/20260313061852.4025964-1-cmllamas@google.com/

 arch/arm64/Kconfig                   |  1 +
 arch/arm64/include/asm/static_call.h | 31 ++++++++++++++++++++
 arch/arm64/kernel/Makefile           |  1 +
 arch/arm64/kernel/static_call.c      | 23 +++++++++++++++
 arch/arm64/kernel/vmlinux.lds.S      |  1 +
 5 files changed, 57 insertions(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 38dba5f7e4d2..9ea19b74b6c3 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -252,6 +252,7 @@ config ARM64
 	select HAVE_RSEQ
 	select HAVE_RUST if RUSTC_SUPPORTS_ARM64
 	select HAVE_STACKPROTECTOR
+	select HAVE_STATIC_CALL if CFI
 	select HAVE_SYSCALL_TRACEPOINTS
 	select HAVE_KPROBES
 	select HAVE_KRETPROBES
diff --git a/arch/arm64/include/asm/static_call.h b/arch/arm64/include/asm/static_call.h
new file mode 100644
index 000000000000..b73960c949e4
--- /dev/null
+++ b/arch/arm64/include/asm/static_call.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_STATIC_CALL_H
+#define _ASM_STATIC_CALL_H
+
+#define __ARCH_DEFINE_STATIC_CALL_TRAMP(name, target)		    \
+	asm("	.pushsection .static_call.text, \"ax\"		\n" \
+	    "	.align	4					\n" \
+	    "	.globl	" name "				\n" \
+	    name ":						\n" \
+	    "	hint	34	/* BTI C */			\n" \
+	    "	adrp	x16, 1f					\n" \
+	    "	ldr	x16, [x16, :lo12:1f]			\n" \
+	    "	br	x16					\n" \
+	    "	.type	" name ", %function			\n" \
+	    "	.size	" name ", . - " name "			\n" \
+	    "	.popsection					\n" \
+	    "	.pushsection .rodata, \"a\"			\n" \
+	    "	.align	3					\n" \
+	    "1:	.quad	" #target "				\n" \
+	    "	.popsection					\n")
+
+#define ARCH_DEFINE_STATIC_CALL_TRAMP(name, func)			\
+	__ARCH_DEFINE_STATIC_CALL_TRAMP(STATIC_CALL_TRAMP_STR(name), #func)
+
+#define ARCH_DEFINE_STATIC_CALL_NULL_TRAMP(name)			\
+	ARCH_DEFINE_STATIC_CALL_TRAMP(name, __static_call_return0)
+
+#define ARCH_DEFINE_STATIC_CALL_RET0_TRAMP(name)			\
+	ARCH_DEFINE_STATIC_CALL_TRAMP(name, __static_call_return0)
+
+#endif /* _ASM_STATIC_CALL_H */
diff --git a/arch/arm64/kernel/Makefile b/arch/arm64/kernel/Makefile
index 76f32e424065..fe627100d199 100644
--- a/arch/arm64/kernel/Makefile
+++ b/arch/arm64/kernel/Makefile
@@ -46,6 +46,7 @@ obj-$(CONFIG_MODULES)			+= module.o module-plts.o
 obj-$(CONFIG_PERF_EVENTS)		+= perf_regs.o perf_callchain.o
 obj-$(CONFIG_HARDLOCKUP_DETECTOR_PERF)	+= watchdog_hld.o
 obj-$(CONFIG_HAVE_HW_BREAKPOINT)	+= hw_breakpoint.o
+obj-$(CONFIG_HAVE_STATIC_CALL)		+= static_call.o
 obj-$(CONFIG_CPU_PM)			+= sleep.o suspend.o
 obj-$(CONFIG_KGDB)			+= kgdb.o
 obj-$(CONFIG_EFI)			+= efi.o efi-rt-wrapper.o
diff --git a/arch/arm64/kernel/static_call.c b/arch/arm64/kernel/static_call.c
new file mode 100644
index 000000000000..8b3a19e10871
--- /dev/null
+++ b/arch/arm64/kernel/static_call.c
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <linux/static_call.h>
+#include <linux/memory.h>
+#include <asm/text-patching.h>
+
+void arch_static_call_transform(void *site, void *tramp, void *func, bool tail)
+{
+	u64 literal;
+	int ret;
+
+	if (!func)
+		func = __static_call_return0;
+
+	/* decode the instructions to discover the literal address */
+	literal = ALIGN_DOWN((u64)tramp + 4, SZ_4K) +
+		  aarch64_insn_adrp_get_offset(le32_to_cpup(tramp + 4)) +
+		  8 * aarch64_insn_decode_immediate(AARCH64_INSN_IMM_12,
+						    le32_to_cpup(tramp + 8));
+
+	ret = aarch64_insn_write_literal_u64((void *)literal, (u64)func);
+	WARN_ON_ONCE(ret);
+}
+EXPORT_SYMBOL_GPL(arch_static_call_transform);
diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
index 2964aad0362e..2d1e75263f03 100644
--- a/arch/arm64/kernel/vmlinux.lds.S
+++ b/arch/arm64/kernel/vmlinux.lds.S
@@ -191,6 +191,7 @@ SECTIONS
 			LOCK_TEXT
 			KPROBES_TEXT
 			HYPERVISOR_TEXT
+			STATIC_CALL_TEXT
 			*(.gnu.warning)
 	}
 
-- 
2.53.0.1018.g2bb0e51243-goog


