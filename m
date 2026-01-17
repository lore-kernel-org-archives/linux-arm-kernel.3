Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B7F5D4A5F5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Jan 2026 05:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eHsNO/7z8jjFX1Qc/WXEy+tfgyKsRWXmvXzihFXmRbQ=; b=xNSxPvEPPUUcyVqHsqZ1xzU2JA
	C1mj8hZhyvlRfJZEAmKW6EbbYOEC7N3RkA4TH+65ECoXHS6EbglYR9CsSCu71H4iahlNdCPNShmny
	Z/1rf+79Z2R4NNrfLKE9SfLIIkrBV3QQD0iU0nindwCwzDkNIsB2zbIvi8Gq8YEZgYF0JN+mUfoI3
	c5IXKihZuwbMgl0m1xkOchSL5eYK0o6f5NM5EcV44U++9c2ewkFqZU7W7ZLnYXn5viQgyyT7PeGte
	rOcvHnLwYFGJaWGbZqAjTXv1Lo7EPnRBSbTC9rVRZGJGZXUnjZJFQYli0jZVo6PdtV/OF6yrN7ar+
	lEh5vGwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgytT-0000000FFgg-1kWR;
	Sat, 17 Jan 2026 05:30:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgysk-0000000FEpj-0oJB
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 17 Jan 2026 05:29:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=eHsNO/7z8jjFX1Qc/WXEy+tfgyKsRWXmvXzihFXmRbQ=; b=Onm4cxrAQKsFtO0xEWEsh/44cC
	MfkHcS27gNLz+Ehzz1RXCB5GZ3kVYDTENzG5aSi4ISotL95wL7hg8zormuvi4pV6eD8hg5tiFvNpZ
	ygPhdDFAthsZLD7dbuxRyNhPoEGcA0JippIy+Q6GbkKZIPDY8yiqCucNyZrXZSlzt5VZKUZToueWV
	BiabXwE+MwSOU4Z+G5hekzr25BBwqz7QlB92i0VIHN4QC1mJPtaW2YTIN+2REOhdnlB3IXKNB3ba7
	zEG1W5wVrW7rxqpfxRFMvXw8BdwUElqILTPDsAgr5/xHp7UhaQYslLsXxmQleAaT9/RDtoxXSBkaP
	iDjctuAA==;
Received: from mail-dy1-x134a.google.com ([2607:f8b0:4864:20::134a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgysg-00000009sdA-0Ag9
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Jan 2026 05:29:52 +0000
Received: by mail-dy1-x134a.google.com with SMTP id 5a478bee46e88-2b6a8b32fa9so10173605eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Jan 2026 21:29:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768627787; x=1769232587; darn=lists.infradead.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eHsNO/7z8jjFX1Qc/WXEy+tfgyKsRWXmvXzihFXmRbQ=;
        b=P0GiBHf+jXnI/QsXwr+DRykayGPeZNcv6BjXz4g3TB/DfWbGlBe5z3x00RzvRfwsrO
         ultRhdWOT6/S6JYTqoJBQfeZdofQdok+8A6Pp/HMWlsfy7vTJ76hnd75GN5HGpd9S/Xx
         qTKAI+A3Ez8mkjaIO7cnMDhLbSZF0kQr6bUR2IDjFCnfpcJNPOHdqJcCHpQi7+XdP7I5
         XAn5rZpwAW62Q089FvlUdH2omPooF3XtouTfEnpAqAs/+fQClC+yUJpUXH9mNR+bBce2
         uQxdk4IIvkoFh8Nl/Q7P0IlOtwuPmy36HM5qcDPxBTxfSBzanG8+dR7Ry3GVkLGMOfh1
         5IxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768627787; x=1769232587;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eHsNO/7z8jjFX1Qc/WXEy+tfgyKsRWXmvXzihFXmRbQ=;
        b=Stai3GmAUrAo2atiMq7e9u51JkhTQRm47S8KsMQ+3XLbMVLtpxJ36t/ylurX1/FLD6
         dXr7OM7qm+BofO5MKxbZcNI/XM2V+5DoNduzg2kCDKYq+E2XsI9A/e85klxQmL7cTr/4
         9637Cxo1Xdy8iZV8I94UqKP83qdwVYuV0axTzR1BH6S0Sc6nDoYwGXqA4PIw/S3kxqNu
         5KflZ5lQaGPaPTfDW/O24rAM+cuRXMsKMBoqSfRC3HHKuRnlYMd5+yXPXu8ig4U6TY8D
         YJ3UEBNGCCaOYL3WRGubuOg1jP8gtO3I5sDIlYmarIE2ZGyWfG3tTPR4h61Aa+zM2kVI
         j1bA==
X-Forwarded-Encrypted: i=1; AJvYcCW73ktjUYvkzL+W0RlE2vwyRAgut9XB7wcalxP26qpB12I35nhY5bA19PplXEUy9QrWOiQBBtbod6PAFGyotRE9@lists.infradead.org
X-Gm-Message-State: AOJu0YxaquWY4qhPUHxBI5uO5eO1XfW13cSNdQFoDcSu5SQD4Jwr9CU0
	lQo95I9TeJEiKAgET5+EagY2SI0n3o2Z9BNvadtTdEPSZyylc09HwwXKm8mhZBcMNu4b3fEAKRp
	47rLyzv4QLQ==
X-Received: from dycue5.prod.google.com ([2002:a05:7300:85:b0:2b6:c560:337])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:5787:b0:2ac:22ac:30
 with SMTP id 5a478bee46e88-2b6b4103759mr4377004eec.34.1768627786832; Fri, 16
 Jan 2026 21:29:46 -0800 (PST)
Date: Fri, 16 Jan 2026 21:28:41 -0800
In-Reply-To: <20260117052849.2205545-1-irogers@google.com>
Mime-Version: 1.0
References: <20260117052849.2205545-1-irogers@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260117052849.2205545-16-irogers@google.com>
Subject: [PATCH v1 15/23] perf dwarf-regs: Add csky perf to dwarf register
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
X-CRM114-CacheID: sfid-20260117_052950_560771_D852E3B2 
X-CRM114-Status: GOOD (  20.41  )
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
 .../util/dwarf-regs-arch/dwarf-regs-csky.c    | 58 ++++++++++++++
 tools/perf/util/dwarf-regs.c                  |  3 +
 tools/perf/util/include/dwarf-regs.h          |  2 +
 tools/perf/util/unwind-libdw-arch/Build       |  1 -
 .../unwind-libdw-arch/unwind-libdw-csky.c     | 78 -------------------
 tools/perf/util/unwind-libdw.c                |  5 +-
 tools/perf/util/unwind-libdw.h                |  1 -
 7 files changed, 64 insertions(+), 84 deletions(-)
 delete mode 100644 tools/perf/util/unwind-libdw-arch/unwind-libdw-csky.c

diff --git a/tools/perf/util/dwarf-regs-arch/dwarf-regs-csky.c b/tools/perf/util/dwarf-regs-arch/dwarf-regs-csky.c
index 86394ed46397..cb44b774f8d9 100644
--- a/tools/perf/util/dwarf-regs-arch/dwarf-regs-csky.c
+++ b/tools/perf/util/dwarf-regs-arch/dwarf-regs-csky.c
@@ -5,6 +5,10 @@
 #include <errno.h>
 #include <stddef.h>
 #include <dwarf-regs.h>
+// Ensure the V2 perf reg definitions are included.
+#undef __CSKYABIV2__
+#define __CSKYABIV2__ 1
+#include "../../../arch/csky/include/uapi/asm/perf_regs.h"
 
 #define CSKY_ABIV2_MAX_REGS 73
 static const char * const csky_dwarf_regs_table_abiv2[CSKY_ABIV2_MAX_REGS] = {
@@ -66,3 +70,57 @@ int __get_csky_regnum(const char *name, unsigned int flags)
 
 	return __get_dwarf_regnum(csky_dwarf_regs_table_abiv1, CSKY_ABIV1_MAX_REGS, name);
 }
+
+int __get_dwarf_regnum_for_perf_regnum_csky(int perf_regnum, unsigned int flags)
+{
+	static const int dwarf_csky_regnums[][2] = {
+		[PERF_REG_CSKY_TLS] = {-ENOENT, 31},
+		[PERF_REG_CSKY_LR] = {15, 15},
+		[PERF_REG_CSKY_PC] = {-ENOENT, 32},
+		/* TODO: PERF_REG_CSKY_SR */
+		[PERF_REG_CSKY_SP] = {0, 14},
+		/* TODO: PERF_REG_CSKY_ORIG_A0 */
+		[PERF_REG_CSKY_A0] = {2, 0},
+		[PERF_REG_CSKY_A1] = {3, 1},
+		[PERF_REG_CSKY_A2] = {4, 2},
+		[PERF_REG_CSKY_A3] = {5, 3},
+		[PERF_REG_CSKY_REGS0] = {6, 4},
+		[PERF_REG_CSKY_REGS1] = {7, 5},
+		[PERF_REG_CSKY_REGS2] = {8, 6},
+		[PERF_REG_CSKY_REGS3] = {9, 7},
+		[PERF_REG_CSKY_REGS4] = {10, 8},
+		[PERF_REG_CSKY_REGS5] = {11, 9},
+		[PERF_REG_CSKY_REGS6] = {12, 10},
+		[PERF_REG_CSKY_REGS7] = {13, 11},
+		[PERF_REG_CSKY_REGS8] = {14, 12},
+		[PERF_REG_CSKY_REGS9] = {1, 13},
+		[PERF_REG_CSKY_EXREGS0] = {-ENOENT, 16},
+		[PERF_REG_CSKY_EXREGS1] = {-ENOENT, 17},
+		[PERF_REG_CSKY_EXREGS2] = {-ENOENT, 18},
+		[PERF_REG_CSKY_EXREGS3] = {-ENOENT, 19},
+		[PERF_REG_CSKY_EXREGS4] = {-ENOENT, 20},
+		[PERF_REG_CSKY_EXREGS5] = {-ENOENT, 21},
+		[PERF_REG_CSKY_EXREGS6] = {-ENOENT, 22},
+		[PERF_REG_CSKY_EXREGS7] = {-ENOENT, 23},
+		[PERF_REG_CSKY_EXREGS8] = {-ENOENT, 24},
+		[PERF_REG_CSKY_EXREGS9] = {-ENOENT, 25},
+		[PERF_REG_CSKY_EXREGS10] = {-ENOENT, 26},
+		[PERF_REG_CSKY_EXREGS11] = {-ENOENT, 27},
+		[PERF_REG_CSKY_EXREGS12] = {-ENOENT, 28},
+		[PERF_REG_CSKY_EXREGS13] = {-ENOENT, 29},
+		[PERF_REG_CSKY_EXREGS14] = {-ENOENT, 30},
+		/* TODO: PERF_REG_CSKY_HI */
+		/* TODO: PERF_REG_CSKY_LO */
+		/* TODO: PERF_REG_CSKY_DCSR */
+	};
+	int idx = 0;
+
+	if (flags & EF_CSKY_ABIV2)
+		idx++;
+
+	if (perf_regnum <  0 || perf_regnum > (int)ARRAY_SIZE(dwarf_csky_regnums) ||
+	    dwarf_csky_regnums[perf_regnum][idx] == 0)
+		return -ENOENT;
+
+	return dwarf_csky_regnums[perf_regnum][idx];
+}
diff --git a/tools/perf/util/dwarf-regs.c b/tools/perf/util/dwarf-regs.c
index c472ec5e4d1a..7fa0930fd298 100644
--- a/tools/perf/util/dwarf-regs.c
+++ b/tools/perf/util/dwarf-regs.c
@@ -202,6 +202,9 @@ int get_dwarf_regnum_for_perf_regnum(int perf_regnum, unsigned int machine,
 	case EM_AARCH64:
 		reg = __get_dwarf_regnum_for_perf_regnum_arm64(perf_regnum);
 		break;
+	case EM_CSKY:
+		reg = __get_dwarf_regnum_for_perf_regnum_csky(perf_regnum, flags);
+		break;
 	default:
 		pr_err("ELF MACHINE %x is not supported.\n", machine);
 		return -ENOENT;
diff --git a/tools/perf/util/include/dwarf-regs.h b/tools/perf/util/include/dwarf-regs.h
index a52df8d1b138..7780bc07e70e 100644
--- a/tools/perf/util/include/dwarf-regs.h
+++ b/tools/perf/util/include/dwarf-regs.h
@@ -108,6 +108,8 @@ int __get_dwarf_regnum_for_perf_regnum_x86_64(int perf_regnum);
 int __get_dwarf_regnum_for_perf_regnum_arm(int perf_regnum);
 int __get_dwarf_regnum_for_perf_regnum_arm64(int perf_regnum);
 
+int __get_dwarf_regnum_for_perf_regnum_csky(int perf_regnum, unsigned int flags);
+
 /*
  * get_dwarf_regnum - Returns DWARF regnum from register name
  * name: architecture register name
diff --git a/tools/perf/util/unwind-libdw-arch/Build b/tools/perf/util/unwind-libdw-arch/Build
index 79c3bbdc2dee..5fa1754fca8d 100644
--- a/tools/perf/util/unwind-libdw-arch/Build
+++ b/tools/perf/util/unwind-libdw-arch/Build
@@ -1,4 +1,3 @@
-perf-util-y += unwind-libdw-csky.o
 perf-util-y += unwind-libdw-loongarch.o
 perf-util-y += unwind-libdw-powerpc.o
 perf-util-y += unwind-libdw-riscv.o
diff --git a/tools/perf/util/unwind-libdw-arch/unwind-libdw-csky.c b/tools/perf/util/unwind-libdw-arch/unwind-libdw-csky.c
deleted file mode 100644
index 2556d034c32a..000000000000
--- a/tools/perf/util/unwind-libdw-arch/unwind-libdw-csky.c
+++ /dev/null
@@ -1,78 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-// Copyright (C) 2019 Hangzhou C-SKY Microsystems co.,ltd.
-
-#include <elfutils/libdwfl.h>
-#include "../arch/csky/include/uapi/asm/perf_regs.h"
-#include "util/unwind-libdw.h"
-#include "util/perf_regs.h"
-#include "util/sample.h"
-
-bool libdw_set_initial_registers_csky(Dwfl_Thread *thread, void *arg)
-{
-	struct unwind_info *ui = arg;
-	struct regs_dump *user_regs = perf_sample__user_regs(ui->sample);
-	Dwarf_Word dwarf_regs[PERF_REG_CSKY_MAX];
-
-#define REG(r) ({						\
-	Dwarf_Word val = 0;					\
-	perf_reg_value(&val, user_regs, PERF_REG_CSKY_##r);	\
-	val;							\
-})
-
-#if defined(__CSKYABIV2__)
-	dwarf_regs[0]  = REG(A0);
-	dwarf_regs[1]  = REG(A1);
-	dwarf_regs[2]  = REG(A2);
-	dwarf_regs[3]  = REG(A3);
-	dwarf_regs[4]  = REG(REGS0);
-	dwarf_regs[5]  = REG(REGS1);
-	dwarf_regs[6]  = REG(REGS2);
-	dwarf_regs[7]  = REG(REGS3);
-	dwarf_regs[8]  = REG(REGS4);
-	dwarf_regs[9]  = REG(REGS5);
-	dwarf_regs[10] = REG(REGS6);
-	dwarf_regs[11] = REG(REGS7);
-	dwarf_regs[12] = REG(REGS8);
-	dwarf_regs[13] = REG(REGS9);
-	dwarf_regs[14] = REG(SP);
-	dwarf_regs[15] = REG(LR);
-	dwarf_regs[16] = REG(EXREGS0);
-	dwarf_regs[17] = REG(EXREGS1);
-	dwarf_regs[18] = REG(EXREGS2);
-	dwarf_regs[19] = REG(EXREGS3);
-	dwarf_regs[20] = REG(EXREGS4);
-	dwarf_regs[21] = REG(EXREGS5);
-	dwarf_regs[22] = REG(EXREGS6);
-	dwarf_regs[23] = REG(EXREGS7);
-	dwarf_regs[24] = REG(EXREGS8);
-	dwarf_regs[25] = REG(EXREGS9);
-	dwarf_regs[26] = REG(EXREGS10);
-	dwarf_regs[27] = REG(EXREGS11);
-	dwarf_regs[28] = REG(EXREGS12);
-	dwarf_regs[29] = REG(EXREGS13);
-	dwarf_regs[30] = REG(EXREGS14);
-	dwarf_regs[31] = REG(TLS);
-	dwarf_regs[32] = REG(PC);
-#else
-	dwarf_regs[0]  = REG(SP);
-	dwarf_regs[1]  = REG(REGS9);
-	dwarf_regs[2]  = REG(A0);
-	dwarf_regs[3]  = REG(A1);
-	dwarf_regs[4]  = REG(A2);
-	dwarf_regs[5]  = REG(A3);
-	dwarf_regs[6]  = REG(REGS0);
-	dwarf_regs[7]  = REG(REGS1);
-	dwarf_regs[8]  = REG(REGS2);
-	dwarf_regs[9]  = REG(REGS3);
-	dwarf_regs[10] = REG(REGS4);
-	dwarf_regs[11] = REG(REGS5);
-	dwarf_regs[12] = REG(REGS6);
-	dwarf_regs[13] = REG(REGS7);
-	dwarf_regs[14] = REG(REGS8);
-	dwarf_regs[15] = REG(LR);
-#endif
-	dwfl_thread_state_register_pc(thread, REG(PC));
-
-	return dwfl_thread_state_registers(thread, 0, PERF_REG_CSKY_MAX,
-					   dwarf_regs);
-}
diff --git a/tools/perf/util/unwind-libdw.c b/tools/perf/util/unwind-libdw.c
index 8f291f9f9469..a193163da707 100644
--- a/tools/perf/util/unwind-libdw.c
+++ b/tools/perf/util/unwind-libdw.c
@@ -292,7 +292,6 @@ static const Dwfl_Thread_Callbacks callbacks_generic = {
 	.set_initial_registers = libdw_set_initial_registers_generic,
 };
 
-DEFINE_DWFL_THREAD_CALLBACKS(csky);
 DEFINE_DWFL_THREAD_CALLBACKS(loongarch);
 DEFINE_DWFL_THREAD_CALLBACKS(powerpc);
 DEFINE_DWFL_THREAD_CALLBACKS(riscv);
@@ -300,9 +299,7 @@ DEFINE_DWFL_THREAD_CALLBACKS(s390);
 
 static const Dwfl_Thread_Callbacks *get_thread_callbacks(const char *arch)
 {
-	if (!strcmp(arch, "csky"))
-		return &callbacks_csky;
-	else if (!strcmp(arch, "loongarch"))
+	if (!strcmp(arch, "loongarch"))
 		return &callbacks_loongarch;
 	else if (!strcmp(arch, "powerpc"))
 		return &callbacks_powerpc;
diff --git a/tools/perf/util/unwind-libdw.h b/tools/perf/util/unwind-libdw.h
index fe3ae2a768ad..ee56f1e827e5 100644
--- a/tools/perf/util/unwind-libdw.h
+++ b/tools/perf/util/unwind-libdw.h
@@ -9,7 +9,6 @@ struct machine;
 struct perf_sample;
 struct thread;
 
-bool libdw_set_initial_registers_csky(Dwfl_Thread *thread, void *arg);
 bool libdw_set_initial_registers_loongarch(Dwfl_Thread *thread, void *arg);
 bool libdw_set_initial_registers_mips(Dwfl_Thread *thread, void *arg);
 bool libdw_set_initial_registers_powerpc(Dwfl_Thread *thread, void *arg);
-- 
2.52.0.457.g6b5491de43-goog


