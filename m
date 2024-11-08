Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C02ADD64099
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Nov 2024 01:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:References:Mime-Version:Message-Id:In-Reply-To:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w0ToQ23Vppji1Mg1bHWhJCZZXvwmxBw9hPYnixwWKMI=; b=kv1m55xWilSMMQd13hqiaSNDLR
	3p+QmP/NsdUApzyKbW3q0YtK3iiVA8CKySilKYQY3t7vdRx6Ovg6D0bSbRfA+RScNuWqEPHa8d1+M
	tJROpCSBvIHSMhM90BGmzdnR3WZd9JB23QADpHTfgzaswUso7Rrzs/kq4duDkyGkYTTzT00cW+ECs
	Nj+/95QYPpZ8fF4YY8u301e8kro2MHqKXoC4Mw7hM0EWd1aPKhw+AGc3etN1NSSZ1R4YuEvZpU5Gj
	Lu9gFZyvXn/hMWSxwR6pOFuLMB5aYbkQRNkNQpm8CFRmPkzQWfX3q1607x47AJKSH8X+oBUauhD80
	kCH6WVAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9a62-0000000CQ7k-0ol8;
	Sat, 09 Nov 2024 01:17:02 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Ygb-0000000CFDf-0wN7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 23:46:43 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e30cf121024so4596400276.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Nov 2024 15:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731109600; x=1731714400; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w0ToQ23Vppji1Mg1bHWhJCZZXvwmxBw9hPYnixwWKMI=;
        b=Cnt5SRpnXqn4htHTNrtbSUvMOhTA0CdgCF/dUy5ZYT2NX9or+JCdblp1iOQDaW89Hb
         rIl2E4q1MOMJ8oXgHVpp35xOcTBf7x/dNW4jYfbMr581OUp20WD3tnTg3HoQv/u5TW4J
         zL8VhzOk8xdM8dGDU6kmT/7tO08zIv2XHgDr3/1JwX8nk6o8QYT5GG1zBOjrrQpZyPzB
         F28L62rNzL9z8T8ytGHFAj3pdYorCZKAX1Uf9vqtOpZnJahoDJXz/3qa0hgfkeuBxloR
         ME9mxn9pur4K9NY5o5I66Jfaf6QQMD0arueNG7eGhJNbvLuC+vg18xpq/7cIJ02xynKk
         J6GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731109600; x=1731714400;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w0ToQ23Vppji1Mg1bHWhJCZZXvwmxBw9hPYnixwWKMI=;
        b=MazcRQliMY1Ktbf07mrWjm21R6s3cQhuHBtckcP+6rzLYY84K/Uq5OHl2jR+V+LGiv
         EXPaP35Ce3HsJEdaYGe1TcXpLb0zvXVl8n16R1oTSU/2s6FGF/4QSvgzE6jSlyCYPmj3
         xuxbZSz6SWitodkBEMMee3xu9txPChrADsJs6iDcE98+LdL1A7bPTLDJv2fWMwpsZegZ
         RwfnzT6ZHwUix3X1uFxDmeoSX+tOGJcv0gSGEyN7zXpDw3C7Aw1AJmf1jIhAPqVERv7o
         YUZexwOeCtBqhehZpOyMBbn24Vpus8VYR3/gdX4lKmu1m1AwIDNKtMgj3rgAYzElFFep
         DgsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMBshN2qQ2/NgS45p419Qr7zs4WsmBhndjr3dW+oHsZ30jcFteHTpJNux308Xjo21cuEUTFmhZxtdgJzrnxSYM@lists.infradead.org
X-Gm-Message-State: AOJu0YwOnZYeZMi5dK8EG0S2O87zoXU0XRSO25p45wzrUlzrEz0Chw2R
	g0GwT2ba9e/WDOWR6JKGcnWkYBM6gBvAPjOs3m77TdHL62SS0hDnXt4V1+m3RnRa+GmUEMSVgmY
	sSWynLg==
X-Google-Smtp-Source: AGHT+IEJnGD6fjMTvQRjkDpnDqY+9zvc1Y++kQcYFLcdsCZAdV7NT1mihfX2Kbcd4SGfD8gBTDktP9GrSlRZ
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:6fd2:1e36:6d8c:7c49])
 (user=irogers job=sendgmr) by 2002:a5b:acd:0:b0:e30:d561:dad4 with SMTP id
 3f1490d57ef6-e337f8417bemr9668276.2.1731109599715; Fri, 08 Nov 2024 15:46:39
 -0800 (PST)
Date: Fri,  8 Nov 2024 15:45:58 -0800
In-Reply-To: <20241108234606.429459-1-irogers@google.com>
Message-Id: <20241108234606.429459-14-irogers@google.com>
Mime-Version: 1.0
References: <20241108234606.429459-1-irogers@google.com>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Subject: [PATCH v4 13/20] perf dwarf-regs: Move powerpc dwarf-regs out of arch
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>, 
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>, Guo Ren <guoren@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Nick Terrell <terrelln@fb.com>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Changbin Du <changbin.du@huawei.com>, 
	Guilherme Amadio <amadio@gentoo.org>, Yang Jihong <yangjihong@bytedance.com>, 
	Aditya Gupta <adityag@linux.ibm.com>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Kajol Jain <kjain@linux.ibm.com>, 
	Atish Patra <atishp@rivosinc.com>, Shenlin Liang <liangshenlin@eswincomputing.com>, 
	Anup Patel <anup@brainfault.org>, Oliver Upton <oliver.upton@linux.dev>, 
	"Steinar H. Gunderson" <sesse@google.com>, "Dr. David Alan Gilbert" <linux@treblig.org>, 
	Chen Pei <cp0613@linux.alibaba.com>, Dima Kogan <dima@secretsauce.net>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, "David S. Miller" <davem@davemloft.net>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_154641_297711_91A19E8F 
X-CRM114-Status: GOOD (  26.09  )
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

Move arch/powerpc/util/dwarf-regs.c to util/dwarf-regs-powerpc.c and
compile in unconditionally. get_arch_regstr is redundant when EM_NONE
is treated as EM_HOST so remove and update dwarf-regs.c conditions.
Make get_powerpc_regs unconditionally available whwn libdw is.

Reviewed-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/arch/powerpc/util/Build        |   1 -
 tools/perf/arch/powerpc/util/dwarf-regs.c | 141 ----------------------
 tools/perf/util/Build                     |   1 +
 tools/perf/util/dwarf-regs-powerpc.c      |  61 ++++++++++
 tools/perf/util/dwarf-regs.c              |   6 +-
 tools/perf/util/include/dwarf-regs.h      |   9 +-
 6 files changed, 70 insertions(+), 149 deletions(-)
 delete mode 100644 tools/perf/arch/powerpc/util/dwarf-regs.c
 create mode 100644 tools/perf/util/dwarf-regs-powerpc.c

diff --git a/tools/perf/arch/powerpc/util/Build b/tools/perf/arch/powerpc/util/Build
index 3d979480a188..ed82715080f9 100644
--- a/tools/perf/arch/powerpc/util/Build
+++ b/tools/perf/arch/powerpc/util/Build
@@ -7,7 +7,6 @@ perf-util-y += sym-handling.o
 perf-util-y += evsel.o
 perf-util-y += event.o
 
-perf-util-$(CONFIG_LIBDW) += dwarf-regs.o
 perf-util-$(CONFIG_LIBDW) += skip-callchain-idx.o
 
 perf-util-$(CONFIG_LIBUNWIND) += unwind-libunwind.o
diff --git a/tools/perf/arch/powerpc/util/dwarf-regs.c b/tools/perf/arch/powerpc/util/dwarf-regs.c
deleted file mode 100644
index 23846c59a522..000000000000
--- a/tools/perf/arch/powerpc/util/dwarf-regs.c
+++ /dev/null
@@ -1,141 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * Mapping of DWARF debug register numbers into register names.
- *
- * Copyright (C) 2010 Ian Munsie, IBM Corporation.
- */
-
-#include <stddef.h>
-#include <errno.h>
-#include <string.h>
-#include <dwarf-regs.h>
-#include <linux/kernel.h>
-#include <linux/stringify.h>
-
-struct regs_dwarfnum {
-	const char *name;
-	unsigned int dwarfnum;
-};
-
-#define REG_DWARFNUM_NAME(r, num)					\
-	{.name = __stringify(%)__stringify(r), .dwarfnum = num}
-#define GPR_DWARFNUM_NAME(num)						\
-	{.name = __stringify(%gpr##num), .dwarfnum = num}
-#define REG_DWARFNUM_END {.name = NULL, .dwarfnum = 0}
-
-/*
- * Reference:
- * http://refspecs.linuxfoundation.org/ELF/ppc64/PPC-elf64abi-1.9.html
- */
-static const struct regs_dwarfnum regdwarfnum_table[] = {
-	GPR_DWARFNUM_NAME(0),
-	GPR_DWARFNUM_NAME(1),
-	GPR_DWARFNUM_NAME(2),
-	GPR_DWARFNUM_NAME(3),
-	GPR_DWARFNUM_NAME(4),
-	GPR_DWARFNUM_NAME(5),
-	GPR_DWARFNUM_NAME(6),
-	GPR_DWARFNUM_NAME(7),
-	GPR_DWARFNUM_NAME(8),
-	GPR_DWARFNUM_NAME(9),
-	GPR_DWARFNUM_NAME(10),
-	GPR_DWARFNUM_NAME(11),
-	GPR_DWARFNUM_NAME(12),
-	GPR_DWARFNUM_NAME(13),
-	GPR_DWARFNUM_NAME(14),
-	GPR_DWARFNUM_NAME(15),
-	GPR_DWARFNUM_NAME(16),
-	GPR_DWARFNUM_NAME(17),
-	GPR_DWARFNUM_NAME(18),
-	GPR_DWARFNUM_NAME(19),
-	GPR_DWARFNUM_NAME(20),
-	GPR_DWARFNUM_NAME(21),
-	GPR_DWARFNUM_NAME(22),
-	GPR_DWARFNUM_NAME(23),
-	GPR_DWARFNUM_NAME(24),
-	GPR_DWARFNUM_NAME(25),
-	GPR_DWARFNUM_NAME(26),
-	GPR_DWARFNUM_NAME(27),
-	GPR_DWARFNUM_NAME(28),
-	GPR_DWARFNUM_NAME(29),
-	GPR_DWARFNUM_NAME(30),
-	GPR_DWARFNUM_NAME(31),
-	REG_DWARFNUM_NAME(msr,   66),
-	REG_DWARFNUM_NAME(ctr,   109),
-	REG_DWARFNUM_NAME(link,  108),
-	REG_DWARFNUM_NAME(xer,   101),
-	REG_DWARFNUM_NAME(dar,   119),
-	REG_DWARFNUM_NAME(dsisr, 118),
-	REG_DWARFNUM_END,
-};
-
-/**
- * get_arch_regstr() - lookup register name from it's DWARF register number
- * @n:	the DWARF register number
- *
- * get_arch_regstr() returns the name of the register in struct
- * regdwarfnum_table from it's DWARF register number. If the register is not
- * found in the table, this returns NULL;
- */
-const char *get_arch_regstr(unsigned int n)
-{
-	const struct regs_dwarfnum *roff;
-
-	for (roff = regdwarfnum_table; roff->name != NULL; roff++)
-		if (roff->dwarfnum == n)
-			return roff->name;
-	return NULL;
-}
-
-#define PPC_OP(op)	(((op) >> 26) & 0x3F)
-#define PPC_RA(a)	(((a) >> 16) & 0x1f)
-#define PPC_RT(t)	(((t) >> 21) & 0x1f)
-#define PPC_RB(b)	(((b) >> 11) & 0x1f)
-#define PPC_D(D)	((D) & 0xfffe)
-#define PPC_DS(DS)	((DS) & 0xfffc)
-#define OP_LD	58
-#define OP_STD	62
-
-static int get_source_reg(u32 raw_insn)
-{
-	return PPC_RA(raw_insn);
-}
-
-static int get_target_reg(u32 raw_insn)
-{
-	return PPC_RT(raw_insn);
-}
-
-static int get_offset_opcode(u32 raw_insn)
-{
-	int opcode = PPC_OP(raw_insn);
-
-	/* DS- form */
-	if ((opcode == OP_LD) || (opcode == OP_STD))
-		return PPC_DS(raw_insn);
-	else
-		return PPC_D(raw_insn);
-}
-
-/*
- * Fills the required fields for op_loc depending on if it
- * is a source or target.
- * D form: ins RT,D(RA) -> src_reg1 = RA, offset = D, dst_reg1 = RT
- * DS form: ins RT,DS(RA) -> src_reg1 = RA, offset = DS, dst_reg1 = RT
- * X form: ins RT,RA,RB -> src_reg1 = RA, src_reg2 = RB, dst_reg1 = RT
- */
-void get_powerpc_regs(u32 raw_insn, int is_source,
-		struct annotated_op_loc *op_loc)
-{
-	if (is_source)
-		op_loc->reg1 = get_source_reg(raw_insn);
-	else
-		op_loc->reg1 = get_target_reg(raw_insn);
-
-	if (op_loc->multi_regs)
-		op_loc->reg2 = PPC_RB(raw_insn);
-
-	/* TODO: Implement offset handling for X Form */
-	if ((op_loc->mem_ref) && (PPC_OP(raw_insn) != 31))
-		op_loc->offset = get_offset_opcode(raw_insn);
-}
diff --git a/tools/perf/util/Build b/tools/perf/util/Build
index 99ae4e2802b8..eeab8684ddcc 100644
--- a/tools/perf/util/Build
+++ b/tools/perf/util/Build
@@ -204,6 +204,7 @@ perf-util-$(CONFIG_LIBDW) += probe-finder.o
 perf-util-$(CONFIG_LIBDW) += dwarf-aux.o
 perf-util-$(CONFIG_LIBDW) += dwarf-regs.o
 perf-util-$(CONFIG_LIBDW) += dwarf-regs-csky.o
+perf-util-$(CONFIG_LIBDW) += dwarf-regs-powerpc.o
 perf-util-$(CONFIG_LIBDW) += dwarf-regs-x86.o
 perf-util-$(CONFIG_LIBDW) += debuginfo.o
 perf-util-$(CONFIG_LIBDW) += annotate-data.o
diff --git a/tools/perf/util/dwarf-regs-powerpc.c b/tools/perf/util/dwarf-regs-powerpc.c
new file mode 100644
index 000000000000..caf77a234c78
--- /dev/null
+++ b/tools/perf/util/dwarf-regs-powerpc.c
@@ -0,0 +1,61 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Mapping of DWARF debug register numbers into register names.
+ *
+ * Copyright (C) 2010 Ian Munsie, IBM Corporation.
+ */
+
+#include <dwarf-regs.h>
+
+#define PPC_OP(op)	(((op) >> 26) & 0x3F)
+#define PPC_RA(a)	(((a) >> 16) & 0x1f)
+#define PPC_RT(t)	(((t) >> 21) & 0x1f)
+#define PPC_RB(b)	(((b) >> 11) & 0x1f)
+#define PPC_D(D)	((D) & 0xfffe)
+#define PPC_DS(DS)	((DS) & 0xfffc)
+#define OP_LD	58
+#define OP_STD	62
+
+static int get_source_reg(u32 raw_insn)
+{
+	return PPC_RA(raw_insn);
+}
+
+static int get_target_reg(u32 raw_insn)
+{
+	return PPC_RT(raw_insn);
+}
+
+static int get_offset_opcode(u32 raw_insn)
+{
+	int opcode = PPC_OP(raw_insn);
+
+	/* DS- form */
+	if ((opcode == OP_LD) || (opcode == OP_STD))
+		return PPC_DS(raw_insn);
+	else
+		return PPC_D(raw_insn);
+}
+
+/*
+ * Fills the required fields for op_loc depending on if it
+ * is a source or target.
+ * D form: ins RT,D(RA) -> src_reg1 = RA, offset = D, dst_reg1 = RT
+ * DS form: ins RT,DS(RA) -> src_reg1 = RA, offset = DS, dst_reg1 = RT
+ * X form: ins RT,RA,RB -> src_reg1 = RA, src_reg2 = RB, dst_reg1 = RT
+ */
+void get_powerpc_regs(u32 raw_insn, int is_source,
+		struct annotated_op_loc *op_loc)
+{
+	if (is_source)
+		op_loc->reg1 = get_source_reg(raw_insn);
+	else
+		op_loc->reg1 = get_target_reg(raw_insn);
+
+	if (op_loc->multi_regs)
+		op_loc->reg2 = PPC_RB(raw_insn);
+
+	/* TODO: Implement offset handling for X Form */
+	if ((op_loc->mem_ref) && (PPC_OP(raw_insn) != 31))
+		op_loc->offset = get_offset_opcode(raw_insn);
+}
diff --git a/tools/perf/util/dwarf-regs.c b/tools/perf/util/dwarf-regs.c
index d536964df43c..3d98c2bf6035 100644
--- a/tools/perf/util/dwarf-regs.c
+++ b/tools/perf/util/dwarf-regs.c
@@ -32,7 +32,8 @@
 const char *get_dwarf_regstr(unsigned int n, unsigned int machine, unsigned int flags)
 {
 #if EM_HOST == EM_X86_64 || EM_HOST == EM_386 || EM_HOST == EM_AARCH64 || EM_HOST == EM_ARM \
-    || EM_HOST == EM_CSKY || EM_HOST == EM_LOONGARCH || EM_HOST == EM_MIPS
+    || EM_HOST == EM_CSKY || EM_HOST == EM_LOONGARCH || EM_HOST == EM_MIPS || EM_HOST == EM_PPC \
+    || EM_HOST == EM_PPC64
 	if (machine == EM_NONE) {
 		/* Generic arch - use host arch */
 		machine = EM_HOST;
@@ -40,7 +41,8 @@ const char *get_dwarf_regstr(unsigned int n, unsigned int machine, unsigned int
 #endif
 	switch (machine) {
 #if EM_HOST != EM_X86_64 && EM_HOST != EM_386 && EM_HOST != EM_AARCH64 && EM_HOST != EM_ARM \
-    && EM_HOST != EM_CSKY && EM_HOST != EM_LOONGARCH && EM_HOST != EM_MIPS
+    && EM_HOST != EM_CSKY && EM_HOST != EM_LOONGARCH && EM_HOST != EM_MIPS && EM_HOST != EM_PPC \
+    && EM_HOST != EM_PPC64
 	case EM_NONE:	/* Generic arch - use host arch */
 		return get_arch_regstr(n);
 #endif
diff --git a/tools/perf/util/include/dwarf-regs.h b/tools/perf/util/include/dwarf-regs.h
index 55f21d8082a2..e47c4697da36 100644
--- a/tools/perf/util/include/dwarf-regs.h
+++ b/tools/perf/util/include/dwarf-regs.h
@@ -90,7 +90,8 @@
 
 #ifdef HAVE_LIBDW_SUPPORT
 #if !defined(__x86_64__) && !defined(__i386__) && !defined(__aarch64__) && !defined(__arm__) \
-    && !defined(__loongarch__) && !defined(__mips__)
+    && !defined(__loongarch__) && !defined(__mips__) && !defined(__powerpc__) \
+    && !defined(__powerpc64__)
 const char *get_arch_regstr(unsigned int n);
 #endif
 
@@ -117,6 +118,8 @@ int get_arch_regnum(const char *name);
  */
 int get_dwarf_regnum(const char *name, unsigned int machine, unsigned int flags);
 
+void get_powerpc_regs(u32 raw_insn, int is_source, struct annotated_op_loc *op_loc);
+
 #else /* HAVE_LIBDW_SUPPORT */
 
 static inline int get_dwarf_regnum(const char *name __maybe_unused,
@@ -125,16 +128,12 @@ static inline int get_dwarf_regnum(const char *name __maybe_unused,
 {
 	return -1;
 }
-#endif
 
-#if !defined(__powerpc__) || !defined(HAVE_LIBDW_SUPPORT)
 static inline void get_powerpc_regs(u32 raw_insn __maybe_unused, int is_source __maybe_unused,
 		struct annotated_op_loc *op_loc __maybe_unused)
 {
 	return;
 }
-#else
-void get_powerpc_regs(u32 raw_insn, int is_source, struct annotated_op_loc *op_loc);
 #endif
 
 #endif
-- 
2.47.0.277.g8800431eea-goog


