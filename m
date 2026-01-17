Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A707BC9830D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Jan 2026 05:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uUzN9Y1aSzyUn7IkPpsP+ciLuVYqFUqLe8fSLq1UShc=; b=N0IUSO9XqW+IP4WlQr4JPXd1Y6
	+hgzRdI86wNZRbyt0KZe69cISg8R15bPYEZgiCTcCOmQP69DjZRrgcjy540qtQ7gVPUG6yTJuyYyv
	jzJGydQunRMPjZvj3+YEqon46B7FIlLcAcMcBzkwa9C74xmJG6svT9xJHlMuyHO2FaTBR0N029MEG
	7NO1fGzoTXY4Kh9hSqtP35LS8NJNHwodeja68Lx5bg1qYBj5ku1j442Eq7ZkKM4KTpB6j/1j8rXqA
	2ud+Ukn8JEJuKjhW0enxSWD4r2C0yysXtSpnJZ2szaHDomB3s8aWSiDFVYmtct6xuKn/PfKhwSoys
	my6HWwWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgytQ-0000000FFcK-1KRw;
	Sat, 17 Jan 2026 05:30:36 +0000
Received: from mail-dy1-x1349.google.com ([2607:f8b0:4864:20::1349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgysa-0000000FEdt-3Tty
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Jan 2026 05:29:49 +0000
Received: by mail-dy1-x1349.google.com with SMTP id 5a478bee46e88-2b6a8afb513so3064571eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Jan 2026 21:29:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768627783; x=1769232583; darn=lists.infradead.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uUzN9Y1aSzyUn7IkPpsP+ciLuVYqFUqLe8fSLq1UShc=;
        b=Pz2Wl3upBnE6zlqwKCBfqhh9EZWYP2118i6fU4tFIOfeWDN8LC0xkUTBaBQ2RHnN81
         vgQ/4KNnTNHvcHiIdxj+BY2Lyi1r/Qm7SqHTeWj0jBIwLCR9MFKgdbVtCUp4hGsq0+Ec
         RVLdq3ApQyfr0rtcl9GgFCz80IqBNOrq5MEGijRrehRTzc4PekH8arWbNZHNO7xFA93v
         lVDSk6NKH3TM/CJnha+7+3kAw0yHWiErMVsKCxR7TgucZFwSIBJtrGM1smjdFDgB1evf
         960ITi0rgbOhDDPBvltPsd1pEnBG52QLGH4oigxhrEBiDy1YTIPjl0pR90oCmPCAHUsP
         mggg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768627783; x=1769232583;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uUzN9Y1aSzyUn7IkPpsP+ciLuVYqFUqLe8fSLq1UShc=;
        b=wkQhMcvShCJ+fnfrnwadvJNn5HfEA317nWCAumOTCAjF9Q0Mgk0zk8fyftn4O7q4eg
         Oz2UvxhnFUfutoxNIvmOSEPGfTdwpdt55lN/uPjj1M7krpzw4qLyPMi7uE5HaP1YWrfB
         TWA2D+jfJNpt6E1XMgLaWRtac7sNbbgrclg71uF248+NBZ/5n1dECJuuTjL2RKDrEgCM
         Hjna56HQczxDou4MSlHWtWUhn8uc80ch0oEbEA4RUcppbY9UrYyuaV3chyNr1yv1Yotq
         5KjOgLAdj1W5+jmsFDd5deP5NvS8GNOh+4ZO7jxjSrzDZHKGVPptowJeGFCVWuE4LBvr
         P1eQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEaKHR46Efm7e/sp787QDZXOIE7wVXyKwNndtlu6GIP1olRq7gbOEP7l1EWzF/xOvBI1kY1kbI/F3PDxBbtcyQ@lists.infradead.org
X-Gm-Message-State: AOJu0YywXqVxO0UuBwHY5edM63qP/9ZEQiS+suzdbbwWB3TT2NFGU9T1
	X78FPhERFNcXpyPcVSkHvR74kJIZ5fyyNtPwanVqI39A2Lel+M2o91QsCkLFDU/bO6KnEfkGnqn
	S59tbJtQj2Q==
X-Received: from dlae5.prod.google.com ([2002:a05:701b:2305:b0:123:2aa4:47a4])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:660f:b0:123:2d00:1668
 with SMTP id a92af1059eb24-1244b37f8bdmr4510370c88.49.1768627783323; Fri, 16
 Jan 2026 21:29:43 -0800 (PST)
Date: Fri, 16 Jan 2026 21:28:39 -0800
In-Reply-To: <20260117052849.2205545-1-irogers@google.com>
Mime-Version: 1.0
References: <20260117052849.2205545-1-irogers@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260117052849.2205545-14-irogers@google.com>
Subject: [PATCH v1 13/23] perf dwarf-regs: Add basic get_dwarf_regnum for most architectures
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, Leo Yan <leo.yan@linux.dev>, Guo Ren <guoren@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Shimin Guo <shimin.guo@skydio.com>, 
	Athira Rajeev <atrajeev@linux.ibm.com>, Stephen Brennan <stephen.s.brennan@oracle.com>, 
	Howard Chu <howardchu95@gmail.com>, Thomas Falcon <thomas.falcon@intel.com>, 
	Andi Kleen <ak@linux.intel.com>, "Dr. David Alan Gilbert" <linux@treblig.org>, 
	Dmitry Vyukov <dvyukov@google.com>, 
	"=?UTF-8?q?Krzysztof=20=C5=81opatowski?=" <krzysztof.m.lopatowski@gmail.com>, Chun-Tse Shao <ctshao@google.com>, 
	Aditya Bodkhe <aditya.b1@linux.ibm.com>, Haibo Xu <haibo1.xu@intel.com>, 
	Sergei Trofimovich <slyich@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Mark Wielaard <mark@klomp.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_212944_940672_0D0DC5D6 
X-CRM114-Status: GOOD (  17.25  )
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

Add a basic get_dwarf_regnum implementation for most architectures by
using the get_dwarf_regstr tables and returning the index of the name
within the table.

Some minor name and constification clean up for csky.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 .../util/dwarf-regs-arch/dwarf-regs-csky.c    | 24 +++++++-
 tools/perf/util/dwarf-regs.c                  | 58 +++++++++++++++++--
 tools/perf/util/include/dwarf-regs.h          |  5 +-
 3 files changed, 78 insertions(+), 9 deletions(-)

diff --git a/tools/perf/util/dwarf-regs-arch/dwarf-regs-csky.c b/tools/perf/util/dwarf-regs-arch/dwarf-regs-csky.c
index d38ef1f07f3e..86394ed46397 100644
--- a/tools/perf/util/dwarf-regs-arch/dwarf-regs-csky.c
+++ b/tools/perf/util/dwarf-regs-arch/dwarf-regs-csky.c
@@ -2,11 +2,12 @@
 // Copyright (C) 2019 Hangzhou C-SKY Microsystems co.,ltd.
 // Mapping of DWARF debug register numbers into register names.
 
+#include <errno.h>
 #include <stddef.h>
 #include <dwarf-regs.h>
 
 #define CSKY_ABIV2_MAX_REGS 73
-const char *csky_dwarf_regs_table_abiv2[CSKY_ABIV2_MAX_REGS] = {
+static const char * const csky_dwarf_regs_table_abiv2[CSKY_ABIV2_MAX_REGS] = {
 	/* r0 ~ r8 */
 	"%a0", "%a1", "%a2", "%a3", "%regs0", "%regs1", "%regs2", "%regs3",
 	/* r9 ~ r15 */
@@ -27,7 +28,7 @@ const char *csky_dwarf_regs_table_abiv2[CSKY_ABIV2_MAX_REGS] = {
 };
 
 #define CSKY_ABIV1_MAX_REGS 57
-const char *csky_dwarf_regs_table_abiv1[CSKY_ABIV1_MAX_REGS] = {
+static const char * const csky_dwarf_regs_table_abiv1[CSKY_ABIV1_MAX_REGS] = {
 	/* r0 ~ r8 */
 	"%sp", "%regs9", "%a0", "%a1", "%a2", "%a3", "%regs0", "%regs1",
 	/* r9 ~ r15 */
@@ -41,10 +42,27 @@ const char *csky_dwarf_regs_table_abiv1[CSKY_ABIV1_MAX_REGS] = {
 	"%epc",
 };
 
-const char *get_csky_regstr(unsigned int n, unsigned int flags)
+const char *__get_csky_regstr(unsigned int n, unsigned int flags)
 {
 	if (flags & EF_CSKY_ABIV2)
 		return (n < CSKY_ABIV2_MAX_REGS) ? csky_dwarf_regs_table_abiv2[n] : NULL;
 
 	return (n < CSKY_ABIV1_MAX_REGS) ? csky_dwarf_regs_table_abiv1[n] : NULL;
 }
+
+static int __get_dwarf_regnum(const char *const *regstr, size_t num_regstr, const char *name)
+{
+	for (size_t i = 0; i < num_regstr; i++) {
+		if (regstr[i] && !strcmp(regstr[i], name))
+			return i;
+	}
+	return -ENOENT;
+}
+
+int __get_csky_regnum(const char *name, unsigned int flags)
+{
+	if (flags & EF_CSKY_ABIV2)
+		return __get_dwarf_regnum(csky_dwarf_regs_table_abiv2, CSKY_ABIV2_MAX_REGS, name);
+
+	return __get_dwarf_regnum(csky_dwarf_regs_table_abiv1, CSKY_ABIV1_MAX_REGS, name);
+}
diff --git a/tools/perf/util/dwarf-regs.c b/tools/perf/util/dwarf-regs.c
index 1f7d892612df..dffa0c8bdd14 100644
--- a/tools/perf/util/dwarf-regs.c
+++ b/tools/perf/util/dwarf-regs.c
@@ -27,11 +27,11 @@
 #include "../arch/mips/include/dwarf-regs-table.h"
 #include "../arch/loongarch/include/dwarf-regs-table.h"
 
-#define __get_dwarf_regstr(tbl, n) (((n) < ARRAY_SIZE(tbl)) ? (tbl)[(n)] : NULL)
-
 /* Return architecture dependent register string (for kprobe-tracer) */
 const char *get_dwarf_regstr(unsigned int n, unsigned int machine, unsigned int flags)
 {
+	#define __get_dwarf_regstr(tbl, n) (((n) < ARRAY_SIZE(tbl)) ? (tbl)[(n)] : NULL)
+
 	if (machine == EM_NONE) {
 		/* Generic arch - use host arch */
 		machine = EM_HOST;
@@ -46,7 +46,7 @@ const char *get_dwarf_regstr(unsigned int n, unsigned int machine, unsigned int
 	case EM_AARCH64:
 		return __get_dwarf_regstr(aarch64_regstr_tbl, n);
 	case EM_CSKY:
-		return get_csky_regstr(n, flags);
+		return __get_csky_regstr(n, flags);
 	case EM_SH:
 		return __get_dwarf_regstr(sh_regstr_tbl, n);
 	case EM_S390:
@@ -69,15 +69,28 @@ const char *get_dwarf_regstr(unsigned int n, unsigned int machine, unsigned int
 		pr_err("ELF MACHINE %x is not supported.\n", machine);
 	}
 	return NULL;
+
+	#undef __get_dwarf_regstr
+}
+
+static int __get_dwarf_regnum(const char *const *regstr, size_t num_regstr, const char *name)
+{
+	for (size_t i = 0; i < num_regstr; i++) {
+		if (regstr[i] && !strcmp(regstr[i], name))
+			return i;
+	}
+	return -ENOENT;
 }
 
 /* Return DWARF register number from architecture register name */
-int get_dwarf_regnum(const char *name, unsigned int machine, unsigned int flags __maybe_unused)
+int get_dwarf_regnum(const char *name, unsigned int machine, unsigned int flags)
 {
 	char *regname = strdup(name);
 	int reg = -1;
 	char *p;
 
+	#define _get_dwarf_regnum(tbl, name) __get_dwarf_regnum(tbl, ARRAY_SIZE(tbl), name)
+
 	if (regname == NULL)
 		return -EINVAL;
 
@@ -97,11 +110,48 @@ int get_dwarf_regnum(const char *name, unsigned int machine, unsigned int flags
 	case EM_386:
 		reg = __get_dwarf_regnum_i386(name);
 		break;
+	case EM_ARM:
+		reg = _get_dwarf_regnum(arm_regstr_tbl, name);
+		break;
+	case EM_AARCH64:
+		reg = _get_dwarf_regnum(aarch64_regstr_tbl, name);
+		break;
+	case EM_CSKY:
+		reg = __get_csky_regnum(name, flags);
+		break;
+	case EM_SH:
+		reg = _get_dwarf_regnum(sh_regstr_tbl, name);
+		break;
+	case EM_S390:
+		reg = _get_dwarf_regnum(s390_regstr_tbl, name);
+		break;
+	case EM_PPC:
+	case EM_PPC64:
+		reg = _get_dwarf_regnum(powerpc_regstr_tbl, name);
+		break;
+	case EM_RISCV:
+		reg = _get_dwarf_regnum(riscv_regstr_tbl, name);
+		break;
+	case EM_SPARC:
+	case EM_SPARCV9:
+		reg = _get_dwarf_regnum(sparc_regstr_tbl, name);
+		break;
+	case EM_XTENSA:
+		reg = _get_dwarf_regnum(xtensa_regstr_tbl, name);
+		break;
+	case EM_MIPS:
+		reg = _get_dwarf_regnum(mips_regstr_tbl, name);
+		break;
+	case EM_LOONGARCH:
+		reg = _get_dwarf_regnum(loongarch_regstr_tbl, name);
+		break;
 	default:
 		pr_err("ELF MACHINE %x is not supported.\n", machine);
 	}
 	free(regname);
 	return reg;
+
+	#undef _get_dwarf_regnum
 }
 
 static int get_libdw_frame_nregs(unsigned int machine, unsigned int flags __maybe_unused)
diff --git a/tools/perf/util/include/dwarf-regs.h b/tools/perf/util/include/dwarf-regs.h
index 00881f1d45d6..a120c97a5fac 100644
--- a/tools/perf/util/include/dwarf-regs.h
+++ b/tools/perf/util/include/dwarf-regs.h
@@ -89,8 +89,6 @@
 #define DWARF_REG_FB  0xd3affb /* random number */
 
 #ifdef HAVE_LIBDW_SUPPORT
-const char *get_csky_regstr(unsigned int n, unsigned int flags);
-
 /**
  * get_dwarf_regstr() - Returns ftrace register string from DWARF regnum.
  * @n: DWARF register number.
@@ -99,6 +97,9 @@ const char *get_csky_regstr(unsigned int n, unsigned int flags);
  */
 const char *get_dwarf_regstr(unsigned int n, unsigned int machine, unsigned int flags);
 
+const char *__get_csky_regstr(unsigned int n, unsigned int flags);
+int __get_csky_regnum(const char *name, unsigned int flags);
+
 int __get_dwarf_regnum_i386(const char *name);
 int __get_dwarf_regnum_x86_64(const char *name);
 int __get_dwarf_regnum_for_perf_regnum_i386(int perf_regnum);
-- 
2.52.0.457.g6b5491de43-goog


