Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23453C9830D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Jan 2026 05:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gu6Ay1rV/hnUCdAd59fcfxBvScqY/4/I5R48NWueiwM=; b=RleycoiKW9Gs0AZRKm4kU6L+GV
	yNwVZgxQ08tYfxeTLeJ8m8qo3F0WtXDo2b+DuIk1D4//7x2HP6ApnNqrawX56MNpGA7KDEua5b0v/
	0VTyfjZb3ZHaKbRVtr68rd61dNk7Z+sFLc7OBcxLR+oFCaPNh+lFHPg5vnGvSLcjZbAh3Gbig13rA
	z1nGsTxbQ+U/MPTZs4gI4vtHKSA0B+vzkzfvrzBY2ZOC1HL4vZhAe6vxVBsaDeNzyNVIzkiD/7YCd
	xRhdwEBCdUz/ccOP66ZGWgWEb1PfNDphw6oDecHTtzCGsRFONJSlt6RCfJyanoyedjXT2vOeTCe71
	NIt7VKUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgytq-0000000FG8A-0HiI;
	Sat, 17 Jan 2026 05:31:02 +0000
Received: from mail-dy1-x1349.google.com ([2607:f8b0:4864:20::1349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgysk-0000000FEq4-3VyK
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Jan 2026 05:30:01 +0000
Received: by mail-dy1-x1349.google.com with SMTP id 5a478bee46e88-2b04f8c5e84so3156783eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Jan 2026 21:29:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768627793; x=1769232593; darn=lists.infradead.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gu6Ay1rV/hnUCdAd59fcfxBvScqY/4/I5R48NWueiwM=;
        b=DXFXfi06T/AGprw15CPbDzu3Pz3nEVAcIr27SpqkObxngzkw2zlqBeMyTlgRNUXwno
         8Yy/S/PraBhLKf4VfshDXtR/zsOK+XLZiI8pgn33ElEYPhUHEQyqL1DWYd4kp4zw/gsu
         dcbEWF6Y8hZO2x3Ne213S6WCQePiEpEF8JHVl5EKR5FrS9pz5RHMmtCCQPC43XCyPHdE
         4KveBoZbLS7pT9dpoOMdGdEPJXy+ws2VJ1M2l6aeViuNAeZ307jpQXJP9C9yRZLv64e1
         OCaM/lvVsbo79+HcO/pZXGno3sc7D6ImeWb+0Mk5LZgWqjuyjhlMDX8hjlXxeM1piOxm
         +tOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768627793; x=1769232593;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gu6Ay1rV/hnUCdAd59fcfxBvScqY/4/I5R48NWueiwM=;
        b=vIPSQstSNGfFeVVD4v6RAJZe9LEEtkq8CQg8MJtsGPlAIL+M+GO6irEbwd+4QKWqBS
         3Pbmh0DdZdZqlNuWLjEDaCC851aW3U9sWh2QaArhBL7DLI9qh3MAHNrp0/a9sp6ConOl
         vrvvIjY6Wxmd+f3Wzpo2v5KmJmmNcthlwJaLDbmPJOXe3gtts0j+bgZAKd9Tkvct/uUr
         YGKoLAqMj0AOaIcd9dAVF2CeP7leo5gFMce1odK5yRpK+bvNALeWn2COIHS3BceM5UzD
         S8gIbjwqJu4J0JdvfiwSPDSjY+BvECyK54xJUbI/laGChNk/2LNXFPJdiGQrYTM5NigO
         B55A==
X-Forwarded-Encrypted: i=1; AJvYcCVG3zg/IxB/hcNE+tCXoo5oAMOX1h7DqEW2twoU55rVsOhpvwRS9mnFjLJzgyPLkS85wy05HRdzIsc9hJT3e01x@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2ub7H69vwirSax9C0ZbJMRTE8ceWYVX5wrbFx+GmRnZkNUeHa
	AuoZ635leyPwmvcataMA+b48gs27Ggcwk9mKsylzuTXf573ceerBY9X+5qaQe4YoOURis1uhiZO
	MMVxQsohYRw==
X-Received: from dycnr20-n2.prod.google.com ([2002:a05:7300:e9d4:20b0:2b0:5541:d643])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:2d93:b0:2b0:5028:bafd
 with SMTP id 5a478bee46e88-2b6b46c68femr3497511eec.8.1768627792479; Fri, 16
 Jan 2026 21:29:52 -0800 (PST)
Date: Fri, 16 Jan 2026 21:28:44 -0800
In-Reply-To: <20260117052849.2205545-1-irogers@google.com>
Mime-Version: 1.0
References: <20260117052849.2205545-1-irogers@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260117052849.2205545-19-irogers@google.com>
Subject: [PATCH v1 18/23] perf dwarf-regs: Add RISC-V perf to dwarf register
 number mapping functions
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
X-CRM114-CacheID: sfid-20260116_212955_116388_CA02ADA3 
X-CRM114-Status: GOOD (  19.91  )
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

These functions allow the generic initial register state code in
unwind-libdw to be used.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/dwarf-regs-arch/Build         |  1 +
 .../util/dwarf-regs-arch/dwarf-regs-riscv.c   | 12 ++++
 tools/perf/util/dwarf-regs.c                  |  3 +
 tools/perf/util/include/dwarf-regs.h          |  1 +
 tools/perf/util/unwind-libdw-arch/Build       |  1 -
 .../unwind-libdw-arch/unwind-libdw-riscv.c    | 58 -------------------
 tools/perf/util/unwind-libdw.c                |  5 +-
 tools/perf/util/unwind-libdw.h                |  1 -
 8 files changed, 18 insertions(+), 64 deletions(-)
 create mode 100644 tools/perf/util/dwarf-regs-arch/dwarf-regs-riscv.c
 delete mode 100644 tools/perf/util/unwind-libdw-arch/unwind-libdw-riscv.c

diff --git a/tools/perf/util/dwarf-regs-arch/Build b/tools/perf/util/dwarf-regs-arch/Build
index 188359376ea5..94e4dfceb4d1 100644
--- a/tools/perf/util/dwarf-regs-arch/Build
+++ b/tools/perf/util/dwarf-regs-arch/Build
@@ -3,4 +3,5 @@ perf-util-$(CONFIG_LIBDW) += dwarf-regs-arm.o
 perf-util-$(CONFIG_LIBDW) += dwarf-regs-csky.o
 perf-util-$(CONFIG_LIBDW) += dwarf-regs-loongarch.o
 perf-util-$(CONFIG_LIBDW) += dwarf-regs-powerpc.o
+perf-util-$(CONFIG_LIBDW) += dwarf-regs-riscv.o
 perf-util-$(CONFIG_LIBDW) += dwarf-regs-x86.o
diff --git a/tools/perf/util/dwarf-regs-arch/dwarf-regs-riscv.c b/tools/perf/util/dwarf-regs-arch/dwarf-regs-riscv.c
new file mode 100644
index 000000000000..090db51aba41
--- /dev/null
+++ b/tools/perf/util/dwarf-regs-arch/dwarf-regs-riscv.c
@@ -0,0 +1,12 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <errno.h>
+#include <dwarf-regs.h>
+#include "../../../arch/riscv/include/uapi/asm/perf_regs.h"
+
+int __get_dwarf_regnum_for_perf_regnum_riscv(int perf_regnum)
+{
+	if (perf_regnum < 0 || perf_regnum >= PERF_REG_RISCV_MAX)
+		return -ENOENT;
+
+	return perf_regnum;
+}
diff --git a/tools/perf/util/dwarf-regs.c b/tools/perf/util/dwarf-regs.c
index 3b1c2a436806..137568e15018 100644
--- a/tools/perf/util/dwarf-regs.c
+++ b/tools/perf/util/dwarf-regs.c
@@ -209,6 +209,9 @@ int get_dwarf_regnum_for_perf_regnum(int perf_regnum, unsigned int machine,
 	case EM_PPC64:
 		reg = __get_dwarf_regnum_for_perf_regnum_powerpc(perf_regnum);
 		break;
+	case EM_RISCV:
+		reg = __get_dwarf_regnum_for_perf_regnum_riscv(perf_regnum);
+		break;
 	case EM_LOONGARCH:
 		reg = __get_dwarf_regnum_for_perf_regnum_loongarch(perf_regnum);
 		break;
diff --git a/tools/perf/util/include/dwarf-regs.h b/tools/perf/util/include/dwarf-regs.h
index 9ebb3ba33fba..ae76608da110 100644
--- a/tools/perf/util/include/dwarf-regs.h
+++ b/tools/perf/util/include/dwarf-regs.h
@@ -111,6 +111,7 @@ int __get_dwarf_regnum_for_perf_regnum_arm64(int perf_regnum);
 int __get_dwarf_regnum_for_perf_regnum_csky(int perf_regnum, unsigned int flags);
 int __get_dwarf_regnum_for_perf_regnum_loongarch(int perf_regnum);
 int __get_dwarf_regnum_for_perf_regnum_powerpc(int perf_regnum);
+int __get_dwarf_regnum_for_perf_regnum_riscv(int perf_regnum);
 
 /*
  * get_dwarf_regnum - Returns DWARF regnum from register name
diff --git a/tools/perf/util/unwind-libdw-arch/Build b/tools/perf/util/unwind-libdw-arch/Build
index e6c97e842cd6..6d6e319e1201 100644
--- a/tools/perf/util/unwind-libdw-arch/Build
+++ b/tools/perf/util/unwind-libdw-arch/Build
@@ -1,2 +1 @@
-perf-util-y += unwind-libdw-riscv.o
 perf-util-y += unwind-libdw-s390.o
diff --git a/tools/perf/util/unwind-libdw-arch/unwind-libdw-riscv.c b/tools/perf/util/unwind-libdw-arch/unwind-libdw-riscv.c
deleted file mode 100644
index c2e2c4b6b2e0..000000000000
--- a/tools/perf/util/unwind-libdw-arch/unwind-libdw-riscv.c
+++ /dev/null
@@ -1,58 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/* Copyright (C) 2019 Hangzhou C-SKY Microsystems co.,ltd. */
-
-#include <elfutils/libdwfl.h>
-#include "../arch/riscv/include/uapi/asm/perf_regs.h"
-#include "util/unwind-libdw.h"
-#include "util/perf_regs.h"
-#include "util/sample.h"
-
-bool libdw_set_initial_registers_riscv(Dwfl_Thread *thread, void *arg)
-{
-	struct unwind_info *ui = arg;
-	struct regs_dump *user_regs = perf_sample__user_regs(ui->sample);
-	Dwarf_Word dwarf_regs[32];
-
-#define REG(r) ({						\
-	Dwarf_Word val = 0;					\
-	perf_reg_value(&val, user_regs, PERF_REG_RISCV_##r);	\
-	val;							\
-})
-
-	dwarf_regs[0]  = 0;
-	dwarf_regs[1]  = REG(RA);
-	dwarf_regs[2]  = REG(SP);
-	dwarf_regs[3]  = REG(GP);
-	dwarf_regs[4]  = REG(TP);
-	dwarf_regs[5]  = REG(T0);
-	dwarf_regs[6]  = REG(T1);
-	dwarf_regs[7]  = REG(T2);
-	dwarf_regs[8]  = REG(S0);
-	dwarf_regs[9]  = REG(S1);
-	dwarf_regs[10] = REG(A0);
-	dwarf_regs[11] = REG(A1);
-	dwarf_regs[12] = REG(A2);
-	dwarf_regs[13] = REG(A3);
-	dwarf_regs[14] = REG(A4);
-	dwarf_regs[15] = REG(A5);
-	dwarf_regs[16] = REG(A6);
-	dwarf_regs[17] = REG(A7);
-	dwarf_regs[18] = REG(S2);
-	dwarf_regs[19] = REG(S3);
-	dwarf_regs[20] = REG(S4);
-	dwarf_regs[21] = REG(S5);
-	dwarf_regs[22] = REG(S6);
-	dwarf_regs[23] = REG(S7);
-	dwarf_regs[24] = REG(S8);
-	dwarf_regs[25] = REG(S9);
-	dwarf_regs[26] = REG(S10);
-	dwarf_regs[27] = REG(S11);
-	dwarf_regs[28] = REG(T3);
-	dwarf_regs[29] = REG(T4);
-	dwarf_regs[30] = REG(T5);
-	dwarf_regs[31] = REG(T6);
-	dwfl_thread_state_register_pc(thread, REG(PC));
-
-	return dwfl_thread_state_registers(thread, 0, PERF_REG_RISCV_MAX,
-					   dwarf_regs);
-}
diff --git a/tools/perf/util/unwind-libdw.c b/tools/perf/util/unwind-libdw.c
index e9ba050e7ab1..b3c4380d40b6 100644
--- a/tools/perf/util/unwind-libdw.c
+++ b/tools/perf/util/unwind-libdw.c
@@ -292,14 +292,11 @@ static const Dwfl_Thread_Callbacks callbacks_generic = {
 	.set_initial_registers = libdw_set_initial_registers_generic,
 };
 
-DEFINE_DWFL_THREAD_CALLBACKS(riscv);
 DEFINE_DWFL_THREAD_CALLBACKS(s390);
 
 static const Dwfl_Thread_Callbacks *get_thread_callbacks(const char *arch)
 {
-	if (!strcmp(arch, "riscv"))
-		return &callbacks_riscv;
-	else if (!strcmp(arch, "s390"))
+	if (!strcmp(arch, "s390"))
 		return &callbacks_s390;
 
 	return &callbacks_generic;
diff --git a/tools/perf/util/unwind-libdw.h b/tools/perf/util/unwind-libdw.h
index 0ec1abdabbe7..5c23080cb6c1 100644
--- a/tools/perf/util/unwind-libdw.h
+++ b/tools/perf/util/unwind-libdw.h
@@ -10,7 +10,6 @@ struct perf_sample;
 struct thread;
 
 bool libdw_set_initial_registers_mips(Dwfl_Thread *thread, void *arg);
-bool libdw_set_initial_registers_riscv(Dwfl_Thread *thread, void *arg);
 bool libdw_set_initial_registers_s390(Dwfl_Thread *thread, void *arg);
 
 struct unwind_info {
-- 
2.52.0.457.g6b5491de43-goog


