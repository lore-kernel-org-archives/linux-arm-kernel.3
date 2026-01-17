Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF6F9D4A5F5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Jan 2026 05:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j0hLW1UHbXT+qiQ2vPFChWMybpQvL2qtJZcRy5QYVbE=; b=Dl7EVEGPAVgMYojrdsLOfiy4oc
	AmJTdPXMruPKMQ/me490P1BJHtsuSO2SN+91L/5fijMLJc8w6vdRfXZ72UEaC3zFqL0AOKRtM1nd4
	Z09kdBA/10mETebNbd2ou2RA5rU39PHt4NRXk6bSv+Isfu56GueyuEbEXXRYjzBEYo6V4cHRzXzaE
	aTczgh8q+aTq9/u2X2K5oD1uN603TlhDrnlUyD8CrWOGuf83oPOnaOLKDWnf1KsZu44Zj/quWKaWh
	3HYnXyuakkx+H5XRsZZHceTh7JcpajkHwuDTZbDaNFyLICgWdaoaLXNKlo3ku4vURJB7iaLn5Wyx7
	DoUc1lGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgyt5-0000000FFG0-2fVU;
	Sat, 17 Jan 2026 05:30:15 +0000
Received: from mail-dl1-x1249.google.com ([2607:f8b0:4864:20::1249])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgysY-0000000FEbT-3WGX
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Jan 2026 05:29:46 +0000
Received: by mail-dl1-x1249.google.com with SMTP id a92af1059eb24-12339e20b66so3204788c88.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Jan 2026 21:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768627782; x=1769232582; darn=lists.infradead.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j0hLW1UHbXT+qiQ2vPFChWMybpQvL2qtJZcRy5QYVbE=;
        b=pZXfeBVzkd37hR8aIX0z8fgC3bcM527UtMX5OoVWBbX/yXg8I6/WR1oxU1eNgamJDv
         L/oEky7BRD8pY9x/8MN2d4j8HszB3lZjm2EpdyP4BBR5RTKRAsyrbocJV3V44IsKnWY+
         c589Au72AfZ24ZRAi2LS0Bktdy77nQYfnyHg3z7XAI/4zTVNOil5EXuhBlVA4fm296nY
         hZR2ytROAbwHurM1NVohlC6/6KEc/AUfweIJEajWXFmdi1hg0SG9uZJgdfbvHiHjLljz
         ejbdGrcPfykOdYSd/NpI8MB1Pk3qr6F4ndTeIZRGcaNEb1ZvCJc1h+impffEn/H/nrmZ
         qvnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768627782; x=1769232582;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j0hLW1UHbXT+qiQ2vPFChWMybpQvL2qtJZcRy5QYVbE=;
        b=einkef7nhFvoc9AQAz3aFBry6VCieXBleHvAM7TTHReQYHZcWHqRtZ5aqqxO+q0d+k
         xiqZ1oACa9Gu9AW4ZIm3vIufahvhDc/HRAW6Kt3KnYbLePZp035f63hHzQYwLic7tMa5
         6hc9teluFOWX/aktwakIFM30b1Clv8eMRE4dlHwgbgVdqa1IEUsAWkFiFWnP7cqtHQqY
         j5HVrS/VFS6UksJ0GKQwxMcHQH01E7t4FweEnWVfc5JZg1C9xePVW9EDWMTXZKZT7jvP
         WcjwZd3V4m0AbBvTMtJP3Dw7LzLxywdi0UTXVWD+mjqCk9AP4xLVLtw+CaNWoL5gqMGq
         hUZw==
X-Forwarded-Encrypted: i=1; AJvYcCXrFra+ZjBqRbe0mCgCjap89vShNegKPNXrkyX+yjGQ5l5Xgzcz0mSMV9BHVGhmowGvnKCX7vaDXusbcbpwi8JA@lists.infradead.org
X-Gm-Message-State: AOJu0YydMW/hrq9yHUxOwzPRZYpWGU72cM74GTMXtbV1q6VAa7rwPH+a
	r6t/n9acXe6cXCISTTE4JzYVlP/yC+EmfVPrfuViT1CHq5LGFBeryRyLIDzGkML3yiEzR11sAOy
	DUXS+ZzqiXA==
X-Received: from dlbqq14.prod.google.com ([2002:a05:7022:ed0e:b0:119:78ff:fe0f])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:6089:b0:11b:9386:8268
 with SMTP id a92af1059eb24-1244b37c27fmr3504641c88.45.1768627781426; Fri, 16
 Jan 2026 21:29:41 -0800 (PST)
Date: Fri, 16 Jan 2026 21:28:38 -0800
In-Reply-To: <20260117052849.2205545-1-irogers@google.com>
Mime-Version: 1.0
References: <20260117052849.2205545-1-irogers@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260117052849.2205545-13-irogers@google.com>
Subject: [PATCH v1 12/23] perf dwarf-regs: Add get_dwarf_regnum_for_perf_regnum
 and use for x86 unwinding
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
X-CRM114-CacheID: sfid-20260116_212942_937929_853B56BE 
X-CRM114-Status: GOOD (  26.32  )
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

Add a utility to map a perf register number to a dwarf register number
for a particular ELF machine type.

Create a generic unwind-libdw initial register initialization routine
that uses this function and thereby avoids arch specific
initialization. The unwind-libdw code does:
1) compute the maximum dwarf register from the set of sampled user registers,
2) allocates a set of dwarf registers,
3) copies the sample registers into the appropriate dwarf registers.

This generic solution is initially implemented for use with x86 as
only get_dwarf_regnum_for_perf_regnum support for x86 is currently present.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 .../util/dwarf-regs-arch/dwarf-regs-x86.c     | 95 +++++++++++++++++++
 tools/perf/util/dwarf-regs.c                  | 55 +++++++++++
 tools/perf/util/include/dwarf-regs.h          |  8 ++
 tools/perf/util/unwind-libdw-arch/Build       |  1 -
 .../util/unwind-libdw-arch/unwind-libdw-x86.c | 54 -----------
 tools/perf/util/unwind-libdw.c                | 70 ++++++++++++--
 tools/perf/util/unwind-libdw.h                |  2 +-
 7 files changed, 222 insertions(+), 63 deletions(-)
 delete mode 100644 tools/perf/util/unwind-libdw-arch/unwind-libdw-x86.c

diff --git a/tools/perf/util/dwarf-regs-arch/dwarf-regs-x86.c b/tools/perf/util/dwarf-regs-arch/dwarf-regs-x86.c
index f0c42e4d7423..cadef120aeb4 100644
--- a/tools/perf/util/dwarf-regs-arch/dwarf-regs-x86.c
+++ b/tools/perf/util/dwarf-regs-arch/dwarf-regs-x86.c
@@ -10,6 +10,7 @@
 #include <string.h> /* for strcmp */
 #include <linux/kernel.h> /* for ARRAY_SIZE */
 #include <dwarf-regs.h>
+#include "../../../arch/x86/include/uapi/asm/perf_regs.h"
 
 struct dwarf_regs_idx {
 	const char *name;
@@ -163,3 +164,97 @@ int __get_dwarf_regnum_x86_64(const char *name)
 {
 	return get_regnum(x86_64_regidx_table, ARRAY_SIZE(x86_64_regidx_table), name);
 }
+
+int __get_dwarf_regnum_for_perf_regnum_i386(int perf_regnum)
+{
+	static const int dwarf_i386_regnums[] = {
+		[PERF_REG_X86_AX] = 0,
+		[PERF_REG_X86_BX] = 3,
+		[PERF_REG_X86_CX] = 1,
+		[PERF_REG_X86_DX] = 2,
+		[PERF_REG_X86_SI] = 6,
+		[PERF_REG_X86_DI] = 7,
+		[PERF_REG_X86_BP] = 5,
+		[PERF_REG_X86_SP] = 4,
+		[PERF_REG_X86_IP] = 8,
+		[PERF_REG_X86_FLAGS] = 9,
+		[PERF_REG_X86_CS] = 41,
+		[PERF_REG_X86_SS] = 42,
+		[PERF_REG_X86_DS] = 43,
+		[PERF_REG_X86_ES] = 40,
+		[PERF_REG_X86_FS] = 44,
+		[PERF_REG_X86_GS] = 45,
+		[PERF_REG_X86_XMM0] = 21,
+		[PERF_REG_X86_XMM1] = 22,
+		[PERF_REG_X86_XMM2] = 23,
+		[PERF_REG_X86_XMM3] = 24,
+		[PERF_REG_X86_XMM4] = 25,
+		[PERF_REG_X86_XMM5] = 26,
+		[PERF_REG_X86_XMM6] = 27,
+		[PERF_REG_X86_XMM7] = 28,
+	};
+
+	if (perf_regnum == 0)
+		return 0;
+
+	if (perf_regnum <  0 || perf_regnum > (int)ARRAY_SIZE(dwarf_i386_regnums) ||
+	    dwarf_i386_regnums[perf_regnum] == 0)
+		return -ENOENT;
+
+	return dwarf_i386_regnums[perf_regnum];
+}
+
+int __get_dwarf_regnum_for_perf_regnum_x86_64(int perf_regnum)
+{
+	static const int dwarf_x86_64_regnums[] = {
+		[PERF_REG_X86_AX] = 0,
+		[PERF_REG_X86_BX] = 3,
+		[PERF_REG_X86_CX] = 2,
+		[PERF_REG_X86_DX] = 1,
+		[PERF_REG_X86_SI] = 4,
+		[PERF_REG_X86_DI] = 5,
+		[PERF_REG_X86_BP] = 6,
+		[PERF_REG_X86_SP] = 7,
+		[PERF_REG_X86_IP] = 16,
+		[PERF_REG_X86_FLAGS] = 49,
+		[PERF_REG_X86_CS] = 51,
+		[PERF_REG_X86_SS] = 52,
+		[PERF_REG_X86_DS] = 53,
+		[PERF_REG_X86_ES] = 50,
+		[PERF_REG_X86_FS] = 54,
+		[PERF_REG_X86_GS] = 55,
+		[PERF_REG_X86_R8] = 8,
+		[PERF_REG_X86_R9] = 9,
+		[PERF_REG_X86_R10] = 10,
+		[PERF_REG_X86_R11] = 11,
+		[PERF_REG_X86_R12] = 12,
+		[PERF_REG_X86_R13] = 13,
+		[PERF_REG_X86_R14] = 14,
+		[PERF_REG_X86_R15] = 15,
+		[PERF_REG_X86_XMM0] = 17,
+		[PERF_REG_X86_XMM1] = 18,
+		[PERF_REG_X86_XMM2] = 19,
+		[PERF_REG_X86_XMM3] = 20,
+		[PERF_REG_X86_XMM4] = 21,
+		[PERF_REG_X86_XMM5] = 22,
+		[PERF_REG_X86_XMM6] = 23,
+		[PERF_REG_X86_XMM7] = 24,
+		[PERF_REG_X86_XMM8] = 25,
+		[PERF_REG_X86_XMM9] = 26,
+		[PERF_REG_X86_XMM10] = 27,
+		[PERF_REG_X86_XMM11] = 28,
+		[PERF_REG_X86_XMM12] = 29,
+		[PERF_REG_X86_XMM13] = 30,
+		[PERF_REG_X86_XMM14] = 31,
+		[PERF_REG_X86_XMM15] = 32,
+	};
+
+	if (perf_regnum == 0)
+		return 0;
+
+	if (perf_regnum <  0 || perf_regnum > (int)ARRAY_SIZE(dwarf_x86_64_regnums) ||
+	    dwarf_x86_64_regnums[perf_regnum] == 0)
+		return -ENOENT;
+
+	return dwarf_x86_64_regnums[perf_regnum];
+}
diff --git a/tools/perf/util/dwarf-regs.c b/tools/perf/util/dwarf-regs.c
index ef249dd589e3..1f7d892612df 100644
--- a/tools/perf/util/dwarf-regs.c
+++ b/tools/perf/util/dwarf-regs.c
@@ -103,3 +103,58 @@ int get_dwarf_regnum(const char *name, unsigned int machine, unsigned int flags
 	free(regname);
 	return reg;
 }
+
+static int get_libdw_frame_nregs(unsigned int machine, unsigned int flags __maybe_unused)
+{
+	switch (machine) {
+	case EM_X86_64:
+		return 17;
+	case EM_386:
+		return 9;
+	case EM_ARM:
+		return 16;
+	case EM_AARCH64:
+		return 97;
+	case EM_CSKY:
+		return 38;
+	case EM_S390:
+		return 32;
+	case EM_PPC:
+	case EM_PPC64:
+		return 145;
+	case EM_RISCV:
+		return 66;
+	case EM_SPARC:
+	case EM_SPARCV9:
+		return 103;
+	case EM_LOONGARCH:
+		return 74;
+	default:
+		return 0;
+	}
+}
+
+int get_dwarf_regnum_for_perf_regnum(int perf_regnum, unsigned int machine,
+				     unsigned int flags, bool only_libdw_supported)
+{
+	int reg;
+
+	switch (machine) {
+	case EM_X86_64:
+		reg = __get_dwarf_regnum_for_perf_regnum_x86_64(perf_regnum);
+		break;
+	case EM_386:
+		reg = __get_dwarf_regnum_for_perf_regnum_i386(perf_regnum);
+		break;
+	default:
+		pr_err("ELF MACHINE %x is not supported.\n", machine);
+		return -ENOENT;
+	}
+	if (reg >= 0 && only_libdw_supported) {
+		int nregs = get_libdw_frame_nregs(machine, flags);
+
+		if (reg >= nregs)
+			reg = -ENOENT;
+	}
+	return reg;
+}
diff --git a/tools/perf/util/include/dwarf-regs.h b/tools/perf/util/include/dwarf-regs.h
index bb5413b0fee4..00881f1d45d6 100644
--- a/tools/perf/util/include/dwarf-regs.h
+++ b/tools/perf/util/include/dwarf-regs.h
@@ -101,6 +101,8 @@ const char *get_dwarf_regstr(unsigned int n, unsigned int machine, unsigned int
 
 int __get_dwarf_regnum_i386(const char *name);
 int __get_dwarf_regnum_x86_64(const char *name);
+int __get_dwarf_regnum_for_perf_regnum_i386(int perf_regnum);
+int __get_dwarf_regnum_for_perf_regnum_x86_64(int perf_regnum);
 
 /*
  * get_dwarf_regnum - Returns DWARF regnum from register name
@@ -109,6 +111,12 @@ int __get_dwarf_regnum_x86_64(const char *name);
  */
 int get_dwarf_regnum(const char *name, unsigned int machine, unsigned int flags);
 
+/*
+ * get_dwarf_regnum - Returns DWARF regnum from perf register number.
+ */
+int get_dwarf_regnum_for_perf_regnum(int perf_regnum, unsigned int machine, unsigned int flags,
+				     bool only_libdw_supported);
+
 void get_powerpc_regs(u32 raw_insn, int is_source, struct annotated_op_loc *op_loc);
 
 #else /* HAVE_LIBDW_SUPPORT */
diff --git a/tools/perf/util/unwind-libdw-arch/Build b/tools/perf/util/unwind-libdw-arch/Build
index ef17a83a7813..5b5682029953 100644
--- a/tools/perf/util/unwind-libdw-arch/Build
+++ b/tools/perf/util/unwind-libdw-arch/Build
@@ -1,4 +1,3 @@
-perf-util-y += unwind-libdw-x86.o
 perf-util-y += unwind-libdw-arm.o
 perf-util-y += unwind-libdw-arm64.o
 perf-util-y += unwind-libdw-csky.o
diff --git a/tools/perf/util/unwind-libdw-arch/unwind-libdw-x86.c b/tools/perf/util/unwind-libdw-arch/unwind-libdw-x86.c
deleted file mode 100644
index dd27545a4a68..000000000000
--- a/tools/perf/util/unwind-libdw-arch/unwind-libdw-x86.c
+++ /dev/null
@@ -1,54 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-#include <elfutils/libdwfl.h>
-#include "../arch/x86/include/uapi/asm/perf_regs.h"
-#include "util/unwind-libdw.h"
-#include "util/perf_regs.h"
-#include "util/sample.h"
-
-bool libdw_set_initial_registers_x86(Dwfl_Thread *thread, void *arg)
-{
-	struct unwind_info *ui = arg;
-	struct regs_dump *user_regs = perf_sample__user_regs(ui->sample);
-	Dwarf_Word dwarf_regs[17];
-	unsigned nregs;
-
-#define REG(r) ({						\
-	Dwarf_Word val = 0;					\
-	perf_reg_value(&val, user_regs, PERF_REG_X86_##r);	\
-	val;							\
-})
-
-	if (user_regs->abi == PERF_SAMPLE_REGS_ABI_32) {
-		dwarf_regs[0] = REG(AX);
-		dwarf_regs[1] = REG(CX);
-		dwarf_regs[2] = REG(DX);
-		dwarf_regs[3] = REG(BX);
-		dwarf_regs[4] = REG(SP);
-		dwarf_regs[5] = REG(BP);
-		dwarf_regs[6] = REG(SI);
-		dwarf_regs[7] = REG(DI);
-		dwarf_regs[8] = REG(IP);
-		nregs = 9;
-	} else {
-		dwarf_regs[0]  = REG(AX);
-		dwarf_regs[1]  = REG(DX);
-		dwarf_regs[2]  = REG(CX);
-		dwarf_regs[3]  = REG(BX);
-		dwarf_regs[4]  = REG(SI);
-		dwarf_regs[5]  = REG(DI);
-		dwarf_regs[6]  = REG(BP);
-		dwarf_regs[7]  = REG(SP);
-		dwarf_regs[8]  = REG(R8);
-		dwarf_regs[9]  = REG(R9);
-		dwarf_regs[10] = REG(R10);
-		dwarf_regs[11] = REG(R11);
-		dwarf_regs[12] = REG(R12);
-		dwarf_regs[13] = REG(R13);
-		dwarf_regs[14] = REG(R14);
-		dwarf_regs[15] = REG(R15);
-		dwarf_regs[16] = REG(IP);
-		nregs = 17;
-	}
-
-	return dwfl_thread_state_registers(thread, 0, nregs, dwarf_regs);
-}
diff --git a/tools/perf/util/unwind-libdw.c b/tools/perf/util/unwind-libdw.c
index c25190cdceb4..055dab921442 100644
--- a/tools/perf/util/unwind-libdw.c
+++ b/tools/perf/util/unwind-libdw.c
@@ -6,6 +6,7 @@
 #include <errno.h>
 #include "debug.h"
 #include "dso.h"
+#include <dwarf-regs.h>
 #include "unwind.h"
 #include "unwind-libdw.h"
 #include "machine.h"
@@ -225,6 +226,59 @@ static bool memory_read(Dwfl *dwfl __maybe_unused, Dwarf_Addr addr, Dwarf_Word *
 	return true;
 }
 
+static bool libdw_set_initial_registers_generic(Dwfl_Thread *thread, void *arg)
+{
+	struct unwind_info *ui = arg;
+	struct regs_dump *user_regs = perf_sample__user_regs(ui->sample);
+	Dwarf_Word *dwarf_regs;
+	int max_dwarf_reg = 0;
+	bool ret;
+	uint16_t e_machine = ui->e_machine;
+	int e_flags = 0;
+	uint64_t ip_perf_reg = perf_arch_reg_ip(e_machine);
+	Dwarf_Word val = 0;
+
+
+	/*
+	 * For every possible perf register in the bitmap determine the dwarf
+	 * register and use to compute the max.
+	 */
+	for (int perf_reg = 0; perf_reg < 64; perf_reg++) {
+		if (user_regs->mask & (1ULL << perf_reg)) {
+			int dwarf_reg =
+				get_dwarf_regnum_for_perf_regnum(perf_reg, e_machine,
+								 e_flags,
+								 /*only_libdw_supported=*/true);
+			if (dwarf_reg > max_dwarf_reg)
+				max_dwarf_reg = dwarf_reg;
+		}
+	}
+
+	dwarf_regs = calloc(max_dwarf_reg + 1, sizeof(*dwarf_regs));
+	if (!dwarf_regs)
+		return false;
+
+	for (int perf_reg = 0; perf_reg < 64; perf_reg++) {
+		if (user_regs->mask & (1ULL << perf_reg)) {
+			int dwarf_reg =
+				get_dwarf_regnum_for_perf_regnum(perf_reg, e_machine,
+								 e_flags,
+								 /*only_libdw_supported=*/true);
+			if (dwarf_reg >= 0) {
+				val = 0;
+				if (perf_reg_value(&val, user_regs, perf_reg) == 0)
+					dwarf_regs[dwarf_reg] = val;
+			}
+		}
+	}
+	if (perf_reg_value(&val, user_regs, ip_perf_reg) == 0)
+		dwfl_thread_state_register_pc(thread, val);
+
+	ret = dwfl_thread_state_registers(thread, 0, max_dwarf_reg + 1, dwarf_regs);
+	free(dwarf_regs);
+	return ret;
+}
+
 #define DEFINE_DWFL_THREAD_CALLBACKS(arch)                           \
 static const Dwfl_Thread_Callbacks callbacks_##arch = {              \
 	.next_thread           = next_thread,                        \
@@ -232,7 +286,12 @@ static const Dwfl_Thread_Callbacks callbacks_##arch = {              \
 	.set_initial_registers = libdw_set_initial_registers_##arch, \
 }
 
-DEFINE_DWFL_THREAD_CALLBACKS(x86);
+static const Dwfl_Thread_Callbacks callbacks_generic = {
+	.next_thread           = next_thread,
+	.memory_read           = memory_read,
+	.set_initial_registers = libdw_set_initial_registers_generic,
+};
+
 DEFINE_DWFL_THREAD_CALLBACKS(arm);
 DEFINE_DWFL_THREAD_CALLBACKS(arm64);
 DEFINE_DWFL_THREAD_CALLBACKS(csky);
@@ -257,12 +316,8 @@ static const Dwfl_Thread_Callbacks *get_thread_callbacks(const char *arch)
 		return &callbacks_riscv;
 	else if (!strcmp(arch, "s390"))
 		return &callbacks_s390;
-	else if (!strcmp(arch, "x86"))
-		return &callbacks_x86;
 
-	pr_err("Fail to get thread callbacks for arch %s, returns NULL\n",
-	       arch);
-	return NULL;
+	return &callbacks_generic;
 }
 
 static int
@@ -301,6 +356,7 @@ int unwind__get_entries(unwind_entry_cb_t cb, void *arg,
 			bool best_effort)
 {
 	struct machine *machine = maps__machine(thread__maps(thread));
+	uint16_t e_machine = thread__e_machine(thread, machine);
 	struct unwind_info *ui, ui_buf = {
 		.sample		= data,
 		.thread		= thread,
@@ -308,9 +364,9 @@ int unwind__get_entries(unwind_entry_cb_t cb, void *arg,
 		.cb		= cb,
 		.arg		= arg,
 		.max_stack	= max_stack,
+		.e_machine	= e_machine,
 		.best_effort    = best_effort
 	};
-	uint16_t e_machine = thread__e_machine(thread, machine);
 	const char *arch = perf_env__arch(machine->env);
 	Dwarf_Word ip;
 	int err = -EINVAL, i;
diff --git a/tools/perf/util/unwind-libdw.h b/tools/perf/util/unwind-libdw.h
index 574b29848cce..496e5898e7ef 100644
--- a/tools/perf/util/unwind-libdw.h
+++ b/tools/perf/util/unwind-libdw.h
@@ -9,7 +9,6 @@ struct machine;
 struct perf_sample;
 struct thread;
 
-bool libdw_set_initial_registers_x86(Dwfl_Thread *thread, void *arg);
 bool libdw_set_initial_registers_arm(Dwfl_Thread *thread, void *arg);
 bool libdw_set_initial_registers_arm64(Dwfl_Thread *thread, void *arg);
 bool libdw_set_initial_registers_csky(Dwfl_Thread *thread, void *arg);
@@ -28,6 +27,7 @@ struct unwind_info {
 	void			*arg;
 	int			max_stack;
 	int			idx;
+	uint16_t		e_machine;
 	bool			best_effort;
 	struct unwind_entry	entries[];
 };
-- 
2.52.0.457.g6b5491de43-goog


