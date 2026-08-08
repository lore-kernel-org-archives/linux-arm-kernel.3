Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D562FC5AD44
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 23:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Be3iB63/Gi5xDaGZSUXwPMb6b9lt0/rDWU2nNBXifRk=; b=IBLKJrAkIS1TIlvMBMFCxdi9HO
	l/HEp3AlbZfLObnVk7q1GR08PM4VRNoN99fFyisp9uW8dXLW17dWHqUaBdII5sPRfrE45WM2N2pMZ
	nM2zgQbROYy4o5v3Vqu1sVsLUaCuDBlTFPLnxU0CqdcCOQE/JQ9S9I7UvayPJeoSGMBEql0FbtWWS
	trTANIyMZkRFtYh0FLH9FXzImi6gYv3HdnpjH2F1V/Og28eKvw5gLWcjyOguxPIrmf7Bbh8r5GwqT
	qIrBSkJCekvRw8H6fiXyhWUkXvq3Pk6g48uTAHTu/UNZ1GiLmBAoh1ed7JyACFwbWXHI30Vo4p0dh
	SI2EW5BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsqJf-00000009maw-09vn;
	Sat, 08 Aug 2026 23:18:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsqJO-00000009mJA-2LMG
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Aug 2026 23:18:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F33C460A6E;
	Sat,  8 Aug 2026 23:18:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 152381F01558;
	Sat,  8 Aug 2026 23:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786231121;
	bh=Be3iB63/Gi5xDaGZSUXwPMb6b9lt0/rDWU2nNBXifRk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ITKKCm5PhWs9WBCtcXA3mUlo/KSk95vOKS5DFNExB/Vaw3M+myEV/ZPEU0zaQRC5s
	 X5MmAVqU6MsEk/eVtr5t7eCPA7ZAhSrmqzs31hpR32GcXLJXxA/8UFVkZe6Qd5DgJj
	 qfG+pcl+J0Tpt35tKSNbPXe2qigzoxzWgQW1tFILByxhLGmwRjq7DXApsWbstzDDk5
	 yUJ4jpAsEGaQ38q2xpeCVtoCnYfjR54E3eabCkEcacqrIq/tra6twW0rmXuK4p9Dso
	 K+UuslRHTpbxKgREbiUamW9zGpJIFit7sGLQXQvlBfKMrYmsxTOJFA6iQWt5plWspx
	 sicNTRFivDdBw==
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	live-patching@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Joe Lawrence <joe.lawrence@redhat.com>,
	Song Liu <song@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Miroslav Benes <mbenes@suse.cz>,
	Petr Mladek <pmladek@suse.com>
Subject: [PATCH v4 20/22] objtool/klp: Introduce objtool for arm64
Date: Sat,  8 Aug 2026 16:17:24 -0700
Message-ID: <73024f3fce343bd6fba3d08fa366a61b4e2c0fa1.1786230311.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1786230311.git.jpoimboe@kernel.org>
References: <cover.1786230311.git.jpoimboe@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Add basic support for arm64 on objtool.  Only "objtool klp" subcommands
are currently supported.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 arch/arm64/Kconfig                            |   2 +
 tools/objtool/Makefile                        |   4 +
 tools/objtool/arch/arm64/Build                |   2 +
 tools/objtool/arch/arm64/decode.c             | 177 ++++++++++++++++++
 .../arch/arm64/include/arch/cfi_regs.h        |  11 ++
 tools/objtool/arch/arm64/include/arch/elf.h   |  15 ++
 .../objtool/arch/arm64/include/arch/special.h |  21 +++
 tools/objtool/arch/arm64/special.c            |  30 +++
 8 files changed, 262 insertions(+)
 create mode 100644 tools/objtool/arch/arm64/Build
 create mode 100644 tools/objtool/arch/arm64/decode.c
 create mode 100644 tools/objtool/arch/arm64/include/arch/cfi_regs.h
 create mode 100644 tools/objtool/arch/arm64/include/arch/elf.h
 create mode 100644 tools/objtool/arch/arm64/include/arch/special.h
 create mode 100644 tools/objtool/arch/arm64/special.c

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 11e733b6a3cf3..06b30924509ac 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -209,9 +209,11 @@ config ARM64
 	select HAVE_HW_BREAKPOINT if PERF_EVENTS
 	select HAVE_IOREMAP_PROT
 	select HAVE_IRQ_TIME_ACCOUNTING
+	select HAVE_KLP_BUILD
 	select HAVE_LIVEPATCH
 	select HAVE_MOD_ARCH_SPECIFIC
 	select HAVE_NMI
+	select HAVE_OBJTOOL
 	select HAVE_PERF_EVENTS
 	select HAVE_PERF_EVENTS_NMI if ARM64_PSEUDO_NMI
 	select HAVE_PERF_REGS
diff --git a/tools/objtool/Makefile b/tools/objtool/Makefile
index a4484fd22a96d..94aabeee97367 100644
--- a/tools/objtool/Makefile
+++ b/tools/objtool/Makefile
@@ -11,6 +11,10 @@ ifeq ($(SRCARCH),loongarch)
 	BUILD_ORC	   := y
 endif
 
+ifeq ($(SRCARCH),arm64)
+	ARCH_HAS_KLP := y
+endif
+
 ifeq ($(ARCH_HAS_KLP),y)
 	HAVE_XXHASH = $(shell printf "$(pound)include <xxhash.h>\nXXH3_state_t *state;int main() {}" | \
 		      $(HOSTCC) $(HOSTCFLAGS) -xc - -o /dev/null -lxxhash 2> /dev/null && echo y || echo n)
diff --git a/tools/objtool/arch/arm64/Build b/tools/objtool/arch/arm64/Build
new file mode 100644
index 0000000000000..d24d5636a5b84
--- /dev/null
+++ b/tools/objtool/arch/arm64/Build
@@ -0,0 +1,2 @@
+objtool-y += decode.o
+objtool-y += special.o
diff --git a/tools/objtool/arch/arm64/decode.c b/tools/objtool/arch/arm64/decode.c
new file mode 100644
index 0000000000000..47658c76e1af0
--- /dev/null
+++ b/tools/objtool/arch/arm64/decode.c
@@ -0,0 +1,177 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <objtool/check.h>
+#include <objtool/disas.h>
+#include <objtool/elf.h>
+#include <objtool/arch.h>
+#include <objtool/warn.h>
+#include <objtool/builtin.h>
+
+const char *arch_reg_name[CFI_NUM_REGS] = {};
+
+int arch_ftrace_match(const char *name)
+{
+	return 0;
+}
+
+s64 arch_insn_adjusted_addend(struct instruction *insn, struct reloc *reloc)
+{
+	return reloc_addend(reloc);
+}
+
+bool arch_callee_saved_reg(unsigned char reg)
+{
+	return false;
+}
+
+int arch_decode_hint_reg(u8 sp_reg, int *base)
+{
+	exit(-1);
+}
+
+const char *arch_nop_insn(int len)
+{
+	exit(-1);
+}
+
+const char *arch_ret_insn(int len)
+{
+	exit(-1);
+}
+
+int arch_decode_instruction(struct objtool_file *file, const struct section *sec,
+			    unsigned long offset, unsigned int maxlen,
+			    struct instruction *insn)
+{
+	u32 ins;
+
+	if (maxlen < 4) {
+		ERROR_INSN(insn, "can't decode instruction");
+		return -1;
+	}
+
+	/* arm64 instructions are always LE, thus no bswap_if_needed() */
+	ins = le32toh(*(u32 *)(sec->data->d_buf + offset));
+
+	/*
+	 * These are the bare minimum needed for static branch detection and
+	 * checksum calculations.
+	 */
+	if (ins == 0xd503201f) {
+		/* NOP: static branch */
+		insn->type = INSN_NOP;
+	} else if ((ins & 0xfc000000) == 0x14000000) {
+		/* B: static branch, intra-TU sibling call */
+		insn->type = INSN_JUMP_UNCONDITIONAL;
+		insn->immediate = sign_extend64(ins & 0x03ffffff, 25);
+	} else if ((ins & 0xfc000000) == 0x94000000) {
+		/* BL: intra-TU call */
+		insn->type = INSN_CALL;
+		insn->immediate = sign_extend64(ins & 0x03ffffff, 25);
+	} else if ((ins & 0xff000000) == 0x54000000) {
+		/* B.cond: intra-TU sibling call */
+		insn->type = INSN_JUMP_CONDITIONAL;
+		insn->immediate = sign_extend64((ins >> 5) & 0x7ffff, 18);
+	} else if ((ins & 0x7e000000) == 0x34000000) {
+		/* CBZ/CBNZ: intra-TU sibling call */
+		insn->type = INSN_JUMP_CONDITIONAL;
+		insn->immediate = sign_extend64((ins >> 5) & 0x7ffff, 18);
+	} else if ((ins & 0x7e000000) == 0x36000000) {
+		/* TBZ/TBNZ: intra-TU sibling call */
+		insn->type = INSN_JUMP_CONDITIONAL;
+		insn->immediate = sign_extend64((ins >> 5) & 0x3fff, 13);
+	} else {
+		insn->type = INSN_OTHER;
+	}
+
+	insn->len = 4;
+	return 0;
+}
+
+size_t arch_jump_opcode_bytes(struct objtool_file *file, struct instruction *insn,
+			      unsigned char *buf)
+{
+	u32 ins;
+
+	ins = le32toh(*(u32 *)(insn->sec->data->d_buf + insn->offset));
+
+	switch (insn->type) {
+	case INSN_JUMP_UNCONDITIONAL:
+	case INSN_CALL:
+		ins &= ~0x03ffffff;
+		break;
+	case INSN_JUMP_CONDITIONAL:
+		if ((ins & 0xff000000) == 0x54000000)
+			ins &= ~0x00ffffe0;		   /* B.cond */
+		else if ((ins & 0x7e000000) == 0x34000000)
+			ins &= ~0x00ffffe0;		   /* CBZ/CBNZ */
+		else
+			ins &= ~0x0007ffe0;		   /* TBZ/TBNZ */
+		break;
+	default:
+		break;
+	}
+
+	ins = htole32(ins);
+	memcpy(buf, &ins, 4);
+	return 4;
+}
+
+u64 arch_adjusted_addend(struct reloc *reloc)
+{
+	return reloc_addend(reloc);
+}
+
+unsigned long arch_jump_destination(struct instruction *insn)
+{
+	return insn->offset + (insn->immediate << 2);
+}
+
+bool arch_pc_relative_reloc(struct reloc *reloc)
+{
+	switch (reloc_type(reloc)) {
+	case R_AARCH64_PREL64:
+	case R_AARCH64_PREL32:
+	case R_AARCH64_PREL16:
+	case R_AARCH64_LD_PREL_LO19:
+	case R_AARCH64_ADR_PREL_LO21:
+	case R_AARCH64_ADR_PREL_PG_HI21:
+	case R_AARCH64_ADR_PREL_PG_HI21_NC:
+	case R_AARCH64_JUMP26:
+	case R_AARCH64_CALL26:
+	case R_AARCH64_CONDBR19:
+	case R_AARCH64_TSTBR14:
+		return true;
+	default:
+		return false;
+	}
+}
+
+void arch_initial_func_cfi_state(struct cfi_init_state *state)
+{
+	state->cfa.base = CFI_UNDEFINED;
+}
+
+unsigned int arch_reloc_size(struct reloc *reloc)
+{
+	switch (reloc_type(reloc)) {
+	case R_AARCH64_ABS64:
+	case R_AARCH64_PREL64:
+		return 8;
+	case R_AARCH64_PREL16:
+		return 2;
+	default:
+		return 4;
+	}
+}
+
+#ifdef DISAS
+int arch_disas_info_init(struct disassemble_info *dinfo)
+{
+	return disas_info_init(dinfo, bfd_arch_aarch64,
+			       bfd_mach_arm_unknown, bfd_mach_aarch64,
+			       NULL);
+}
+#endif /* DISAS */
diff --git a/tools/objtool/arch/arm64/include/arch/cfi_regs.h b/tools/objtool/arch/arm64/include/arch/cfi_regs.h
new file mode 100644
index 0000000000000..49c81cbb6646d
--- /dev/null
+++ b/tools/objtool/arch/arm64/include/arch/cfi_regs.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#ifndef _OBJTOOL_ARCH_CFI_REGS_H
+#define _OBJTOOL_ARCH_CFI_REGS_H
+
+/* These aren't actually used for arm64 */
+#define CFI_BP 0
+#define CFI_SP 0
+#define CFI_RA 0
+#define CFI_NUM_REGS 2
+
+#endif /* _OBJTOOL_ARCH_CFI_REGS_H */
diff --git a/tools/objtool/arch/arm64/include/arch/elf.h b/tools/objtool/arch/arm64/include/arch/elf.h
new file mode 100644
index 0000000000000..418b90885c501
--- /dev/null
+++ b/tools/objtool/arch/arm64/include/arch/elf.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#ifndef _OBJTOOL_ARCH_ELF_H
+#define _OBJTOOL_ARCH_ELF_H
+
+#define R_NONE		R_AARCH64_NONE
+#define R_ABS64		R_AARCH64_ABS64
+#define R_ABS32		R_AARCH64_ABS32
+#define R_DATA32	R_AARCH64_PREL32
+#define R_DATA64	R_AARCH64_PREL64
+#define R_TEXT32	R_AARCH64_PREL32
+#define R_TEXT64	R_AARCH64_PREL64
+
+#define ARCH_HAS_INLINE_ALTS 1
+
+#endif /* _OBJTOOL_ARCH_ELF_H */
diff --git a/tools/objtool/arch/arm64/include/arch/special.h b/tools/objtool/arch/arm64/include/arch/special.h
new file mode 100644
index 0000000000000..8ae804a83ea49
--- /dev/null
+++ b/tools/objtool/arch/arm64/include/arch/special.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#ifndef _OBJTOOL_ARCH_SPECIAL_H
+#define _OBJTOOL_ARCH_SPECIAL_H
+
+#define EX_ENTRY_SIZE 12
+#define EX_ORIG_OFFSET 0
+#define EX_NEW_OFFSET 4
+
+#define JUMP_ENTRY_SIZE 16
+#define JUMP_ORIG_OFFSET 0
+#define JUMP_NEW_OFFSET 4
+#define JUMP_KEY_OFFSET 8
+
+#define ALT_ENTRY_SIZE 12
+#define ALT_ORIG_OFFSET 0
+#define ALT_NEW_OFFSET 4
+#define ALT_FEATURE_OFFSET 8
+#define ALT_ORIG_LEN_OFFSET 10
+#define ALT_NEW_LEN_OFFSET 11
+
+#endif /* _OBJTOOL_ARCH_SPECIAL_H */
diff --git a/tools/objtool/arch/arm64/special.c b/tools/objtool/arch/arm64/special.c
new file mode 100644
index 0000000000000..5a6424a59e1c5
--- /dev/null
+++ b/tools/objtool/arch/arm64/special.c
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+#include <objtool/special.h>
+
+/*
+ * On arm64 a zero-length replacement means the alternative has a callback,
+ * whose address is stored in the replacement offset.  It must be preserved.
+ */
+bool arch_alt_ignore_new_reloc(struct section *sec, unsigned long offset)
+{
+	return false;
+}
+
+bool arch_support_alt_relocation(struct special_alt *special_alt,
+				 struct instruction *insn,
+				 struct reloc *reloc)
+{
+	return true;
+}
+
+struct reloc *arch_find_switch_table(struct objtool_file *file,
+				     struct instruction *insn,
+				     unsigned long *table_size)
+{
+	return NULL;
+}
+
+const char *arch_cpu_feature_name(int feature_number)
+{
+	return NULL;
+}
-- 
2.54.0


