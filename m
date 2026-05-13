Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A16EFCD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 23:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gPLFhSOFXg8XvMX2IDXEDDbF5gvH36sKVzKbndlTdZw=; b=SGP6TFzcQNlxujr4H+AM6F0Uba
	qyEV1ywNgsdMySaE6AiQmNBV3Gfv/EIWty08QhQQChbkBmMlgZqGzJMkUY0z76OXBrKRfd8N2L4Ev
	0BekYapRkEqa/WP7GIt/nt65xLq6iAiC+XcuWULar69/f1Cdk274GV0wZDCgZ6aj9UOYDUO1+3u2P
	GKteuDLkaFAOo6Dg6RLA55Iv3D/1pszQbwX5lHQbWmsZgpUZFYR5frqvR15kQmBCyUxy9XJYz2++P
	V3PrFhvgnKSgwYJ6Tolxq2R21NHNwCJW010FHL9G/ozD76oHWv/ZdCCxoWQiRRYTQoSvqfHbdYleU
	GbE53h5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNJ3q-000000042b7-2VdX;
	Wed, 13 May 2026 23:32:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNJ3p-000000042YT-1dm6
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 13 May 2026 23:32:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=gPLFhSOFXg8XvMX2IDXEDDbF5gvH36sKVzKbndlTdZw=; b=o2siDvnV104r3gMZY+T4Us0VGy
	+NtTHv23iderNQVWU/4j6Tf3IjU81GNs5/keUs8WkChjVR+Fba3TEXrPxuvkuHxzYzwv8JR36Kbxe
	0xHIT+ltHc1YlcG2vbQ1FOw0t3n7TCiyMRIKFdKT9dw2f1f2/WDfFo6AyR62At9kdY/NEqIOpv9pA
	MHcFBAfHU4QN+hDCu5bvXLeOxIXfNz3bMbtSin4s6nbv3n0+vAzaN5y0eNp68XzQDj7qgjeFk++c/
	dPyfLIpGFKwbzUMrhmjOVX0hhTyuesw5tyN2xs0r0yjWrMPzFiVInro0n+/FH3KvOU6O1+fXyLY7j
	rU5QtozA==;
Received: from mail-dy1-x1349.google.com ([2607:f8b0:4864:20::1349])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNJ3l-00000001kR1-3hDI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 23:32:16 +0000
Received: by mail-dy1-x1349.google.com with SMTP id 5a478bee46e88-2fded513994so1525269eec.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 16:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778715132; x=1779319932; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=gPLFhSOFXg8XvMX2IDXEDDbF5gvH36sKVzKbndlTdZw=;
        b=LRyMhfJP7YOOpm/DTVWAujelsDYbDNQNXAvGttT00jYoFMWhgJPijVNvLYr+GAQ47b
         HeKEQhtctDi6bme0lY1dLUOMJBzfq870mrPsj/qZ9dyvWzgvkP9cSmI2uziAZWcQwIyc
         HnlwWwQRWr20dTZH/LYzxa/Z9dyffoN5R4sriJlHoDJHf/Ev5YlrCelCQVC2KYIY30i7
         IvWY+TfldnaN47/KbwO5P7w5pRNGcvbNJfMCMzZzp1rWUt6JQX+wUfhljbAtN8GmBcgn
         6dBI9goVOs553DCYpFrnrYce2Gkct89mKQVOdaHbrxVue/lEOo1+vaXM422GfOmOLGVp
         TATQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778715132; x=1779319932;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gPLFhSOFXg8XvMX2IDXEDDbF5gvH36sKVzKbndlTdZw=;
        b=IOX409abcuszZcCY0wdArD56cgblBTb11tXY6mkGOjTzBA14G+QwVSbrRZlp6QqkJ+
         kKZOwrTmz2uljJnHRhWH8NmKkjqE1A84qpg+IwTw3N2N28EJCWX1U6X1q9rLmJOzpW+U
         QnNPEwGTd25n2LekU+if2r1L2MAedfoj/TYW97nNVLAUrPWSW5i+auIjEYeoRX8DzOmI
         TaI3fQcn2UliV+4Pd0z7PG1z3xYbijau7uivFqoze/iHEnD+ZLsD/h1kNf7vdz3v1vvt
         Iwjqop6AyPY79N55DAmF5SAbGOs+6eM4DAcueg4sfkW+A7Ja4FaRowNQvIvQe84bFEq4
         QMiw==
X-Forwarded-Encrypted: i=1; AFNElJ95mS817l3FlVUD2ugG6MvKF6u6yXBAK7sl7urZcT87LxqDucTvelCXMDUWpymP02SCvVvpRS0SRWw09P2BK1//@lists.infradead.org
X-Gm-Message-State: AOJu0Yxp1b5wzd8TMrjzxMKpxEpGLHqchUbOF1ee2OG/4ru1fqkd740s
	eee1JgokFh2Qbn2Xp9AmqWb0fo9L9+K1Vl6a6t6ob71NkPFSqZN7e/bneqkRqQr/ckqTvmO/RXT
	TfzJ1AAzaUQ==
X-Received: from dlbpt6.prod.google.com ([2002:a05:7022:e806:b0:12a:83c5:a16f])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7023:b18:b0:133:144f:b095
 with SMTP id a92af1059eb24-1349a808241mr3274566c88.15.1778715132143; Wed, 13
 May 2026 16:32:12 -0700 (PDT)
Date: Wed, 13 May 2026 16:31:48 -0700
In-Reply-To: <20260513233151.572332-1-irogers@google.com>
Mime-Version: 1.0
References: <20260413024805.1316480-1-irogers@google.com> <20260513233151.572332-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260513233151.572332-5-irogers@google.com>
Subject: [PATCH v5 4/7] perf unwind-libunwind: Make libunwind register reading
 cross platform
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org, adrian.hunter@intel.com, dapeng1.mi@linux.intel.com, 
	james.clark@linaro.org, namhyung@kernel.org, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Li Guan <guanli.oerv@isrc.iscas.ac.cn>
Cc: 9erthalion6@gmail.com, alex@ghiti.fr, alexander.shishkin@linux.intel.com, 
	andrew.jones@oss.qualcomm.com, aou@eecs.berkeley.edu, atrajeev@linux.ibm.com, 
	howardchu95@gmail.com, john.g.garry@oracle.com, jolsa@kernel.org, 
	leo.yan@linux.dev, libunwind-devel@nongnu.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org, 
	mingo@redhat.com, palmer@dabbelt.com, peterz@infradead.org, pjw@kernel.org, 
	shimin.guo@skydio.com, tglozar@redhat.com, tmricht@linux.ibm.com, 
	will@kernel.org, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_003214_381661_B51FED43 
X-CRM114-Status: GOOD (  19.25  )
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

Move the libunwind register to perf register mapping functions in
arch/../util/unwind-libunwind.c into a new libunwind-arch
directory. Rename the functions to
__get_perf_regnum_for_unw_regnum_<arch>. Add untested ppc32 and s390
functions. Add a get_perf_regnum_for_unw_regnum function that takes an
ELF machine as well as a register number and chooses the appropriate
architecture implementation.

Split the x86 and powerpc 32 and 64-bit implementations apart so that
a single libunwind-<arch>.h header is included.

Move the e_machine into the unwind_info struct to make it easier to
pass.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/arch/arm/util/Build                |   2 -
 tools/perf/arch/arm/util/unwind-libunwind.c   |  50 --------
 tools/perf/arch/arm64/util/Build              |   1 -
 tools/perf/arch/arm64/util/unwind-libunwind.c |  17 ---
 tools/perf/arch/loongarch/util/Build          |   2 -
 .../arch/loongarch/util/unwind-libunwind.c    |  82 -------------
 tools/perf/arch/mips/Build                    |   1 -
 tools/perf/arch/mips/util/Build               |   1 -
 tools/perf/arch/mips/util/unwind-libunwind.c  |  22 ----
 tools/perf/arch/powerpc/util/Build            |   1 -
 .../perf/arch/powerpc/util/unwind-libunwind.c |  92 --------------
 tools/perf/arch/x86/util/Build                |   3 -
 tools/perf/arch/x86/util/unwind-libunwind.c   | 115 ------------------
 tools/perf/util/Build                         |   1 +
 tools/perf/util/libunwind-arch/Build          |  10 ++
 .../perf/util/libunwind-arch/libunwind-arch.c |  32 +++++
 .../perf/util/libunwind-arch/libunwind-arch.h |  16 +++
 .../perf/util/libunwind-arch/libunwind-arm.c  |  15 +++
 .../util/libunwind-arch/libunwind-arm64.c     |  14 +++
 .../perf/util/libunwind-arch/libunwind-i386.c |  43 +++++++
 .../util/libunwind-arch/libunwind-loongarch.c |  27 ++++
 .../perf/util/libunwind-arch/libunwind-mips.c |  29 +++++
 .../util/libunwind-arch/libunwind-ppc32.c     |  31 +++++
 .../util/libunwind-arch/libunwind-ppc64.c     |  33 +++++
 .../perf/util/libunwind-arch/libunwind-s390.c |  29 +++++
 .../util/libunwind-arch/libunwind-x86_64.c    |  52 ++++++++
 tools/perf/util/libunwind/arm64.c             |   5 -
 tools/perf/util/libunwind/x86_32.c            |  12 --
 tools/perf/util/unwind-libunwind-local.c      |  12 +-
 tools/perf/util/unwind.h                      |   5 -
 30 files changed, 338 insertions(+), 417 deletions(-)
 delete mode 100644 tools/perf/arch/arm/util/unwind-libunwind.c
 delete mode 100644 tools/perf/arch/arm64/util/unwind-libunwind.c
 delete mode 100644 tools/perf/arch/loongarch/util/unwind-libunwind.c
 delete mode 100644 tools/perf/arch/mips/Build
 delete mode 100644 tools/perf/arch/mips/util/Build
 delete mode 100644 tools/perf/arch/mips/util/unwind-libunwind.c
 delete mode 100644 tools/perf/arch/powerpc/util/unwind-libunwind.c
 delete mode 100644 tools/perf/arch/x86/util/unwind-libunwind.c
 create mode 100644 tools/perf/util/libunwind-arch/Build
 create mode 100644 tools/perf/util/libunwind-arch/libunwind-arch.c
 create mode 100644 tools/perf/util/libunwind-arch/libunwind-arch.h
 create mode 100644 tools/perf/util/libunwind-arch/libunwind-arm.c
 create mode 100644 tools/perf/util/libunwind-arch/libunwind-arm64.c
 create mode 100644 tools/perf/util/libunwind-arch/libunwind-i386.c
 create mode 100644 tools/perf/util/libunwind-arch/libunwind-loongarch.c
 create mode 100644 tools/perf/util/libunwind-arch/libunwind-mips.c
 create mode 100644 tools/perf/util/libunwind-arch/libunwind-ppc32.c
 create mode 100644 tools/perf/util/libunwind-arch/libunwind-ppc64.c
 create mode 100644 tools/perf/util/libunwind-arch/libunwind-s390.c
 create mode 100644 tools/perf/util/libunwind-arch/libunwind-x86_64.c

diff --git a/tools/perf/arch/arm/util/Build b/tools/perf/arch/arm/util/Build
index b94bf3c5279a..768ae5d16553 100644
--- a/tools/perf/arch/arm/util/Build
+++ b/tools/perf/arch/arm/util/Build
@@ -1,3 +1 @@
-perf-util-$(CONFIG_LOCAL_LIBUNWIND)    += unwind-libunwind.o
-
 perf-util-y += pmu.o auxtrace.o cs-etm.o
diff --git a/tools/perf/arch/arm/util/unwind-libunwind.c b/tools/perf/arch/arm/util/unwind-libunwind.c
deleted file mode 100644
index 438906bf0014..000000000000
--- a/tools/perf/arch/arm/util/unwind-libunwind.c
+++ /dev/null
@@ -1,50 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-
-#include <errno.h>
-#include <libunwind.h>
-#include "perf_regs.h"
-#include "../../../util/unwind.h"
-#include "../../../util/debug.h"
-
-int libunwind__arch_reg_id(int regnum)
-{
-	switch (regnum) {
-	case UNW_ARM_R0:
-		return PERF_REG_ARM_R0;
-	case UNW_ARM_R1:
-		return PERF_REG_ARM_R1;
-	case UNW_ARM_R2:
-		return PERF_REG_ARM_R2;
-	case UNW_ARM_R3:
-		return PERF_REG_ARM_R3;
-	case UNW_ARM_R4:
-		return PERF_REG_ARM_R4;
-	case UNW_ARM_R5:
-		return PERF_REG_ARM_R5;
-	case UNW_ARM_R6:
-		return PERF_REG_ARM_R6;
-	case UNW_ARM_R7:
-		return PERF_REG_ARM_R7;
-	case UNW_ARM_R8:
-		return PERF_REG_ARM_R8;
-	case UNW_ARM_R9:
-		return PERF_REG_ARM_R9;
-	case UNW_ARM_R10:
-		return PERF_REG_ARM_R10;
-	case UNW_ARM_R11:
-		return PERF_REG_ARM_FP;
-	case UNW_ARM_R12:
-		return PERF_REG_ARM_IP;
-	case UNW_ARM_R13:
-		return PERF_REG_ARM_SP;
-	case UNW_ARM_R14:
-		return PERF_REG_ARM_LR;
-	case UNW_ARM_R15:
-		return PERF_REG_ARM_PC;
-	default:
-		pr_err("unwind: invalid reg id %d\n", regnum);
-		return -EINVAL;
-	}
-
-	return -EINVAL;
-}
diff --git a/tools/perf/arch/arm64/util/Build b/tools/perf/arch/arm64/util/Build
index 4e06a08d281a..4b70c4788c80 100644
--- a/tools/perf/arch/arm64/util/Build
+++ b/tools/perf/arch/arm64/util/Build
@@ -1,4 +1,3 @@
-perf-util-$(CONFIG_LOCAL_LIBUNWIND) += unwind-libunwind.o
 perf-util-y += ../../arm/util/auxtrace.o
 perf-util-y += ../../arm/util/cs-etm.o
 perf-util-y += ../../arm/util/pmu.o
diff --git a/tools/perf/arch/arm64/util/unwind-libunwind.c b/tools/perf/arch/arm64/util/unwind-libunwind.c
deleted file mode 100644
index 871af5992298..000000000000
--- a/tools/perf/arch/arm64/util/unwind-libunwind.c
+++ /dev/null
@@ -1,17 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-#include <errno.h>
-
-#ifndef REMOTE_UNWIND_LIBUNWIND
-#include <libunwind.h>
-#include "perf_regs.h"
-#include "../../../util/unwind.h"
-#endif
-#include "../../../util/debug.h"
-
-int LIBUNWIND__ARCH_REG_ID(int regnum)
-{
-	if (regnum < 0 || regnum >= PERF_REG_ARM64_EXTENDED_MAX)
-		return -EINVAL;
-
-	return regnum;
-}
diff --git a/tools/perf/arch/loongarch/util/Build b/tools/perf/arch/loongarch/util/Build
index 8d91e78d31c9..2328fb9a30a3 100644
--- a/tools/perf/arch/loongarch/util/Build
+++ b/tools/perf/arch/loongarch/util/Build
@@ -1,3 +1 @@
 perf-util-y += header.o
-
-perf-util-$(CONFIG_LOCAL_LIBUNWIND) += unwind-libunwind.o
diff --git a/tools/perf/arch/loongarch/util/unwind-libunwind.c b/tools/perf/arch/loongarch/util/unwind-libunwind.c
deleted file mode 100644
index f693167b86ef..000000000000
--- a/tools/perf/arch/loongarch/util/unwind-libunwind.c
+++ /dev/null
@@ -1,82 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-
-#include <errno.h>
-#include <libunwind.h>
-#include "perf_regs.h"
-#include "../../util/unwind.h"
-#include "util/debug.h"
-
-int libunwind__arch_reg_id(int regnum)
-{
-	switch (regnum) {
-	case UNW_LOONGARCH64_R1:
-		return PERF_REG_LOONGARCH_R1;
-	case UNW_LOONGARCH64_R2:
-		return PERF_REG_LOONGARCH_R2;
-	case UNW_LOONGARCH64_R3:
-		return PERF_REG_LOONGARCH_R3;
-	case UNW_LOONGARCH64_R4:
-		return PERF_REG_LOONGARCH_R4;
-	case UNW_LOONGARCH64_R5:
-		return PERF_REG_LOONGARCH_R5;
-	case UNW_LOONGARCH64_R6:
-		return PERF_REG_LOONGARCH_R6;
-	case UNW_LOONGARCH64_R7:
-		return PERF_REG_LOONGARCH_R7;
-	case UNW_LOONGARCH64_R8:
-		return PERF_REG_LOONGARCH_R8;
-	case UNW_LOONGARCH64_R9:
-		return PERF_REG_LOONGARCH_R9;
-	case UNW_LOONGARCH64_R10:
-		return PERF_REG_LOONGARCH_R10;
-	case UNW_LOONGARCH64_R11:
-		return PERF_REG_LOONGARCH_R11;
-	case UNW_LOONGARCH64_R12:
-		return PERF_REG_LOONGARCH_R12;
-	case UNW_LOONGARCH64_R13:
-		return PERF_REG_LOONGARCH_R13;
-	case UNW_LOONGARCH64_R14:
-		return PERF_REG_LOONGARCH_R14;
-	case UNW_LOONGARCH64_R15:
-		return PERF_REG_LOONGARCH_R15;
-	case UNW_LOONGARCH64_R16:
-		return PERF_REG_LOONGARCH_R16;
-	case UNW_LOONGARCH64_R17:
-		return PERF_REG_LOONGARCH_R17;
-	case UNW_LOONGARCH64_R18:
-		return PERF_REG_LOONGARCH_R18;
-	case UNW_LOONGARCH64_R19:
-		return PERF_REG_LOONGARCH_R19;
-	case UNW_LOONGARCH64_R20:
-		return PERF_REG_LOONGARCH_R20;
-	case UNW_LOONGARCH64_R21:
-		return PERF_REG_LOONGARCH_R21;
-	case UNW_LOONGARCH64_R22:
-		return PERF_REG_LOONGARCH_R22;
-	case UNW_LOONGARCH64_R23:
-		return PERF_REG_LOONGARCH_R23;
-	case UNW_LOONGARCH64_R24:
-		return PERF_REG_LOONGARCH_R24;
-	case UNW_LOONGARCH64_R25:
-		return PERF_REG_LOONGARCH_R25;
-	case UNW_LOONGARCH64_R26:
-		return PERF_REG_LOONGARCH_R26;
-	case UNW_LOONGARCH64_R27:
-		return PERF_REG_LOONGARCH_R27;
-	case UNW_LOONGARCH64_R28:
-		return PERF_REG_LOONGARCH_R28;
-	case UNW_LOONGARCH64_R29:
-		return PERF_REG_LOONGARCH_R29;
-	case UNW_LOONGARCH64_R30:
-		return PERF_REG_LOONGARCH_R30;
-	case UNW_LOONGARCH64_R31:
-		return PERF_REG_LOONGARCH_R31;
-	case UNW_LOONGARCH64_PC:
-		return PERF_REG_LOONGARCH_PC;
-	default:
-		pr_err("unwind: invalid reg id %d\n", regnum);
-		return -EINVAL;
-	}
-
-	return -EINVAL;
-}
diff --git a/tools/perf/arch/mips/Build b/tools/perf/arch/mips/Build
deleted file mode 100644
index e63eabc2c8f4..000000000000
--- a/tools/perf/arch/mips/Build
+++ /dev/null
@@ -1 +0,0 @@
-perf-util-y += util/
diff --git a/tools/perf/arch/mips/util/Build b/tools/perf/arch/mips/util/Build
deleted file mode 100644
index 818b808a8247..000000000000
--- a/tools/perf/arch/mips/util/Build
+++ /dev/null
@@ -1 +0,0 @@
-perf-util-$(CONFIG_LOCAL_LIBUNWIND) += unwind-libunwind.o
diff --git a/tools/perf/arch/mips/util/unwind-libunwind.c b/tools/perf/arch/mips/util/unwind-libunwind.c
deleted file mode 100644
index 0d8c99c29da6..000000000000
--- a/tools/perf/arch/mips/util/unwind-libunwind.c
+++ /dev/null
@@ -1,22 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-
-#include <errno.h>
-#include <libunwind.h>
-#include "perf_regs.h"
-#include "../../util/unwind.h"
-#include "util/debug.h"
-
-int libunwind__arch_reg_id(int regnum)
-{
-	switch (regnum) {
-	case UNW_MIPS_R1 ... UNW_MIPS_R25:
-		return regnum - UNW_MIPS_R1 + PERF_REG_MIPS_R1;
-	case UNW_MIPS_R28 ... UNW_MIPS_R31:
-		return regnum - UNW_MIPS_R28 + PERF_REG_MIPS_R28;
-	case UNW_MIPS_PC:
-		return PERF_REG_MIPS_PC;
-	default:
-		pr_err("unwind: invalid reg id %d\n", regnum);
-		return -EINVAL;
-	}
-}
diff --git a/tools/perf/arch/powerpc/util/Build b/tools/perf/arch/powerpc/util/Build
index d66574cbb9a9..ae928050e07a 100644
--- a/tools/perf/arch/powerpc/util/Build
+++ b/tools/perf/arch/powerpc/util/Build
@@ -6,5 +6,4 @@ perf-util-y += evsel.o
 
 perf-util-$(CONFIG_LIBDW) += skip-callchain-idx.o
 
-perf-util-$(CONFIG_LIBUNWIND) += unwind-libunwind.o
 perf-util-y += auxtrace.o
diff --git a/tools/perf/arch/powerpc/util/unwind-libunwind.c b/tools/perf/arch/powerpc/util/unwind-libunwind.c
deleted file mode 100644
index 90a6beda20de..000000000000
--- a/tools/perf/arch/powerpc/util/unwind-libunwind.c
+++ /dev/null
@@ -1,92 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * Copyright 2016 Chandan Kumar, IBM Corporation.
- */
-
-#include <errno.h>
-#include <libunwind.h>
-#include <asm/perf_regs.h>
-#include "../../util/unwind.h"
-#include "../../util/debug.h"
-
-int libunwind__arch_reg_id(int regnum)
-{
-	switch (regnum) {
-	case UNW_PPC64_R0:
-		return PERF_REG_POWERPC_R0;
-	case UNW_PPC64_R1:
-		return PERF_REG_POWERPC_R1;
-	case UNW_PPC64_R2:
-		return PERF_REG_POWERPC_R2;
-	case UNW_PPC64_R3:
-		return PERF_REG_POWERPC_R3;
-	case UNW_PPC64_R4:
-		return PERF_REG_POWERPC_R4;
-	case UNW_PPC64_R5:
-		return PERF_REG_POWERPC_R5;
-	case UNW_PPC64_R6:
-		return PERF_REG_POWERPC_R6;
-	case UNW_PPC64_R7:
-		return PERF_REG_POWERPC_R7;
-	case UNW_PPC64_R8:
-		return PERF_REG_POWERPC_R8;
-	case UNW_PPC64_R9:
-		return PERF_REG_POWERPC_R9;
-	case UNW_PPC64_R10:
-		return PERF_REG_POWERPC_R10;
-	case UNW_PPC64_R11:
-		return PERF_REG_POWERPC_R11;
-	case UNW_PPC64_R12:
-		return PERF_REG_POWERPC_R12;
-	case UNW_PPC64_R13:
-		return PERF_REG_POWERPC_R13;
-	case UNW_PPC64_R14:
-		return PERF_REG_POWERPC_R14;
-	case UNW_PPC64_R15:
-		return PERF_REG_POWERPC_R15;
-	case UNW_PPC64_R16:
-		return PERF_REG_POWERPC_R16;
-	case UNW_PPC64_R17:
-		return PERF_REG_POWERPC_R17;
-	case UNW_PPC64_R18:
-		return PERF_REG_POWERPC_R18;
-	case UNW_PPC64_R19:
-		return PERF_REG_POWERPC_R19;
-	case UNW_PPC64_R20:
-		return PERF_REG_POWERPC_R20;
-	case UNW_PPC64_R21:
-		return PERF_REG_POWERPC_R21;
-	case UNW_PPC64_R22:
-		return PERF_REG_POWERPC_R22;
-	case UNW_PPC64_R23:
-		return PERF_REG_POWERPC_R23;
-	case UNW_PPC64_R24:
-		return PERF_REG_POWERPC_R24;
-	case UNW_PPC64_R25:
-		return PERF_REG_POWERPC_R25;
-	case UNW_PPC64_R26:
-		return PERF_REG_POWERPC_R26;
-	case UNW_PPC64_R27:
-		return PERF_REG_POWERPC_R27;
-	case UNW_PPC64_R28:
-		return PERF_REG_POWERPC_R28;
-	case UNW_PPC64_R29:
-		return PERF_REG_POWERPC_R29;
-	case UNW_PPC64_R30:
-		return PERF_REG_POWERPC_R30;
-	case UNW_PPC64_R31:
-		return PERF_REG_POWERPC_R31;
-	case UNW_PPC64_LR:
-		return PERF_REG_POWERPC_LINK;
-	case UNW_PPC64_CTR:
-		return PERF_REG_POWERPC_CTR;
-	case UNW_PPC64_XER:
-		return PERF_REG_POWERPC_XER;
-	case UNW_PPC64_NIP:
-		return PERF_REG_POWERPC_NIP;
-	default:
-		pr_err("unwind: invalid reg id %d\n", regnum);
-		return -EINVAL;
-	}
-	return -EINVAL;
-}
diff --git a/tools/perf/arch/x86/util/Build b/tools/perf/arch/x86/util/Build
index b94c91984c66..7f89fffe4615 100644
--- a/tools/perf/arch/x86/util/Build
+++ b/tools/perf/arch/x86/util/Build
@@ -8,9 +8,6 @@ perf-util-y += evlist.o
 perf-util-y += mem-events.o
 perf-util-y += evsel.o
 perf-util-y += iostat.o
-
-perf-util-$(CONFIG_LOCAL_LIBUNWIND)    += unwind-libunwind.o
-
 perf-util-y += auxtrace.o
 perf-util-y += intel-pt.o
 perf-util-y += intel-bts.o
diff --git a/tools/perf/arch/x86/util/unwind-libunwind.c b/tools/perf/arch/x86/util/unwind-libunwind.c
deleted file mode 100644
index 47357973b55b..000000000000
--- a/tools/perf/arch/x86/util/unwind-libunwind.c
+++ /dev/null
@@ -1,115 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-
-#include <errno.h>
-#include "../../util/debug.h"
-#ifndef REMOTE_UNWIND_LIBUNWIND
-#include <libunwind.h>
-#include "perf_regs.h"
-#include "../../util/unwind.h"
-#endif
-
-#ifdef HAVE_ARCH_X86_64_SUPPORT
-int LIBUNWIND__ARCH_REG_ID(int regnum)
-{
-	int id;
-
-	switch (regnum) {
-	case UNW_X86_64_RAX:
-		id = PERF_REG_X86_AX;
-		break;
-	case UNW_X86_64_RDX:
-		id = PERF_REG_X86_DX;
-		break;
-	case UNW_X86_64_RCX:
-		id = PERF_REG_X86_CX;
-		break;
-	case UNW_X86_64_RBX:
-		id = PERF_REG_X86_BX;
-		break;
-	case UNW_X86_64_RSI:
-		id = PERF_REG_X86_SI;
-		break;
-	case UNW_X86_64_RDI:
-		id = PERF_REG_X86_DI;
-		break;
-	case UNW_X86_64_RBP:
-		id = PERF_REG_X86_BP;
-		break;
-	case UNW_X86_64_RSP:
-		id = PERF_REG_X86_SP;
-		break;
-	case UNW_X86_64_R8:
-		id = PERF_REG_X86_R8;
-		break;
-	case UNW_X86_64_R9:
-		id = PERF_REG_X86_R9;
-		break;
-	case UNW_X86_64_R10:
-		id = PERF_REG_X86_R10;
-		break;
-	case UNW_X86_64_R11:
-		id = PERF_REG_X86_R11;
-		break;
-	case UNW_X86_64_R12:
-		id = PERF_REG_X86_R12;
-		break;
-	case UNW_X86_64_R13:
-		id = PERF_REG_X86_R13;
-		break;
-	case UNW_X86_64_R14:
-		id = PERF_REG_X86_R14;
-		break;
-	case UNW_X86_64_R15:
-		id = PERF_REG_X86_R15;
-		break;
-	case UNW_X86_64_RIP:
-		id = PERF_REG_X86_IP;
-		break;
-	default:
-		pr_err("unwind: invalid reg id %d\n", regnum);
-		return -EINVAL;
-	}
-
-	return id;
-}
-#else
-int LIBUNWIND__ARCH_REG_ID(int regnum)
-{
-	int id;
-
-	switch (regnum) {
-	case UNW_X86_EAX:
-		id = PERF_REG_X86_AX;
-		break;
-	case UNW_X86_EDX:
-		id = PERF_REG_X86_DX;
-		break;
-	case UNW_X86_ECX:
-		id = PERF_REG_X86_CX;
-		break;
-	case UNW_X86_EBX:
-		id = PERF_REG_X86_BX;
-		break;
-	case UNW_X86_ESI:
-		id = PERF_REG_X86_SI;
-		break;
-	case UNW_X86_EDI:
-		id = PERF_REG_X86_DI;
-		break;
-	case UNW_X86_EBP:
-		id = PERF_REG_X86_BP;
-		break;
-	case UNW_X86_ESP:
-		id = PERF_REG_X86_SP;
-		break;
-	case UNW_X86_EIP:
-		id = PERF_REG_X86_IP;
-		break;
-	default:
-		pr_err("unwind: invalid reg id %d\n", regnum);
-		return -EINVAL;
-	}
-
-	return id;
-}
-#endif /* HAVE_ARCH_X86_64_SUPPORT */
diff --git a/tools/perf/util/Build b/tools/perf/util/Build
index 01edfccebb88..bf4204135ccb 100644
--- a/tools/perf/util/Build
+++ b/tools/perf/util/Build
@@ -228,6 +228,7 @@ perf-util-$(CONFIG_LIBDW) += unwind-libdw.o
 
 perf-util-$(CONFIG_LOCAL_LIBUNWIND)    += unwind-libunwind-local.o
 perf-util-$(CONFIG_LIBUNWIND)          += unwind-libunwind.o
+perf-util-$(CONFIG_LIBUNWIND)          += libunwind-arch/
 perf-util-$(CONFIG_LIBUNWIND_X86)      += libunwind/x86_32.o
 perf-util-$(CONFIG_LIBUNWIND_AARCH64)  += libunwind/arm64.o
 
diff --git a/tools/perf/util/libunwind-arch/Build b/tools/perf/util/libunwind-arch/Build
new file mode 100644
index 000000000000..87fd657a3248
--- /dev/null
+++ b/tools/perf/util/libunwind-arch/Build
@@ -0,0 +1,10 @@
+perf-util-$(CONFIG_LIBUNWIND) += libunwind-arch.o
+perf-util-$(CONFIG_LIBUNWIND) += libunwind-arm64.o
+perf-util-$(CONFIG_LIBUNWIND) += libunwind-arm.o
+perf-util-$(CONFIG_LIBUNWIND) += libunwind-loongarch.o
+perf-util-$(CONFIG_LIBUNWIND) += libunwind-mips.o
+perf-util-$(CONFIG_LIBUNWIND) += libunwind-ppc32.o
+perf-util-$(CONFIG_LIBUNWIND) += libunwind-ppc64.o
+perf-util-$(CONFIG_LIBUNWIND) += libunwind-s390.o
+perf-util-$(CONFIG_LIBUNWIND) += libunwind-i386.o
+perf-util-$(CONFIG_LIBUNWIND) += libunwind-x86_64.o
diff --git a/tools/perf/util/libunwind-arch/libunwind-arch.c b/tools/perf/util/libunwind-arch/libunwind-arch.c
new file mode 100644
index 000000000000..5439bf90d161
--- /dev/null
+++ b/tools/perf/util/libunwind-arch/libunwind-arch.c
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: GPL-2.0
+#include "libunwind-arch.h"
+#include "../debug.h"
+#include <elf.h>
+#include <errno.h>
+
+int get_perf_regnum_for_unw_regnum(unsigned int e_machine, int unw_regnum)
+{
+	switch (e_machine) {
+	case EM_ARM:
+		return __get_perf_regnum_for_unw_regnum_arm(unw_regnum);
+	case EM_AARCH64:
+		return __get_perf_regnum_for_unw_regnum_arm64(unw_regnum);
+	case EM_LOONGARCH:
+		return __get_perf_regnum_for_unw_regnum_loongarch(unw_regnum);
+	case EM_MIPS:
+		return __get_perf_regnum_for_unw_regnum_mips(unw_regnum);
+	case EM_PPC:
+		return __get_perf_regnum_for_unw_regnum_ppc32(unw_regnum);
+	case EM_PPC64:
+		return __get_perf_regnum_for_unw_regnum_ppc64(unw_regnum);
+	case EM_S390:
+		return __get_perf_regnum_for_unw_regnum_s390(unw_regnum);
+	case EM_386:
+		return __get_perf_regnum_for_unw_regnum_i386(unw_regnum);
+	case EM_X86_64:
+		return __get_perf_regnum_for_unw_regnum_x86_64(unw_regnum);
+	default:
+		pr_err("ELF MACHINE %x is not supported.\n", e_machine);
+		return -EINVAL;
+	}
+}
diff --git a/tools/perf/util/libunwind-arch/libunwind-arch.h b/tools/perf/util/libunwind-arch/libunwind-arch.h
new file mode 100644
index 000000000000..e1009c6cb965
--- /dev/null
+++ b/tools/perf/util/libunwind-arch/libunwind-arch.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __LIBUNWIND_ARCH_H
+#define __LIBUNWIND_ARCH_H
+
+int __get_perf_regnum_for_unw_regnum_arm(int unw_regnum);
+int __get_perf_regnum_for_unw_regnum_arm64(int unw_regnum);
+int __get_perf_regnum_for_unw_regnum_loongarch(int unw_regnum);
+int __get_perf_regnum_for_unw_regnum_mips(int unw_regnum);
+int __get_perf_regnum_for_unw_regnum_ppc32(int unw_regnum);
+int __get_perf_regnum_for_unw_regnum_ppc64(int unw_regnum);
+int __get_perf_regnum_for_unw_regnum_s390(int unw_regnum);
+int __get_perf_regnum_for_unw_regnum_i386(int unw_regnum);
+int __get_perf_regnum_for_unw_regnum_x86_64(int unw_regnum);
+int get_perf_regnum_for_unw_regnum(unsigned int e_machine, int unw_regnum);
+
+#endif /* __LIBUNWIND_ARCH_H */
diff --git a/tools/perf/util/libunwind-arch/libunwind-arm.c b/tools/perf/util/libunwind-arch/libunwind-arm.c
new file mode 100644
index 000000000000..6740ee55b043
--- /dev/null
+++ b/tools/perf/util/libunwind-arch/libunwind-arm.c
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0
+#include "libunwind-arch.h"
+#include "../debug.h"
+#include "../../../arch/arm/include/uapi/asm/perf_regs.h"
+#include <linux/compiler.h>
+#include <errno.h>
+
+int __get_perf_regnum_for_unw_regnum_arm(int unw_regnum)
+{
+	if (unw_regnum < 0 || unw_regnum >= PERF_REG_ARM_MAX) {
+		pr_err("unwind: invalid reg id %d\n", unw_regnum);
+		return -EINVAL;
+	}
+	return unw_regnum;
+}
diff --git a/tools/perf/util/libunwind-arch/libunwind-arm64.c b/tools/perf/util/libunwind-arch/libunwind-arm64.c
new file mode 100644
index 000000000000..53b1877dfa04
--- /dev/null
+++ b/tools/perf/util/libunwind-arch/libunwind-arm64.c
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0
+#include "libunwind-arch.h"
+#include "../debug.h"
+#include "../../../arch/arm64/include/uapi/asm/perf_regs.h"
+#include <errno.h>
+
+int __get_perf_regnum_for_unw_regnum_arm64(int unw_regnum)
+{
+	if (unw_regnum < 0 || unw_regnum >= PERF_REG_ARM64_EXTENDED_MAX) {
+		pr_err("unwind: invalid reg id %d\n", unw_regnum);
+		return -EINVAL;
+	}
+	return unw_regnum;
+}
diff --git a/tools/perf/util/libunwind-arch/libunwind-i386.c b/tools/perf/util/libunwind-arch/libunwind-i386.c
new file mode 100644
index 000000000000..a41f7c3c2fa5
--- /dev/null
+++ b/tools/perf/util/libunwind-arch/libunwind-i386.c
@@ -0,0 +1,43 @@
+// SPDX-License-Identifier: GPL-2.0
+#include "libunwind-arch.h"
+#include "../debug.h"
+#include "../../../arch/x86/include/uapi/asm/perf_regs.h"
+#include <linux/compiler.h>
+#include <linux/kernel.h>
+#include <errno.h>
+
+#ifdef HAVE_LIBUNWIND_X86_SUPPORT
+#include <libunwind-x86.h>
+#endif
+
+int __get_perf_regnum_for_unw_regnum_i386(int unw_regnum __maybe_unused)
+{
+#ifndef HAVE_LIBUNWIND_X86_SUPPORT
+	return -EINVAL;
+#else
+	static const int perf_i386_regnums[] = {
+#define REGNUM(reg) [UNW_X86_E ## reg] = PERF_REG_X86_ ## reg
+		REGNUM(AX),
+		REGNUM(DX),
+		REGNUM(CX),
+		REGNUM(BX),
+		REGNUM(SI),
+		REGNUM(DI),
+		REGNUM(BP),
+		REGNUM(SP),
+		REGNUM(IP),
+#undef REGNUM
+	};
+
+	if (unw_regnum == UNW_X86_EAX)
+		return PERF_REG_X86_AX;
+
+	if (unw_regnum <  0 || unw_regnum >= (int)ARRAY_SIZE(perf_i386_regnums) ||
+	    perf_i386_regnums[unw_regnum] == 0) {
+		pr_err("unwind: invalid reg id %d\n", unw_regnum);
+		return -EINVAL;
+	}
+
+	return perf_i386_regnums[unw_regnum];
+#endif // HAVE_LIBUNWIND_X86_SUPPORT
+}
diff --git a/tools/perf/util/libunwind-arch/libunwind-loongarch.c b/tools/perf/util/libunwind-arch/libunwind-loongarch.c
new file mode 100644
index 000000000000..0431757505f9
--- /dev/null
+++ b/tools/perf/util/libunwind-arch/libunwind-loongarch.c
@@ -0,0 +1,27 @@
+// SPDX-License-Identifier: GPL-2.0
+#include "libunwind-arch.h"
+#include "../debug.h"
+#include "../../../arch/loongarch/include/uapi/asm/perf_regs.h"
+#include <linux/compiler.h>
+#include <errno.h>
+
+#ifdef HAVE_LIBUNWIND_LOONGARCH64_SUPPORT
+#include <libunwind-loongarch64.h>
+#endif
+
+int __get_perf_regnum_for_unw_regnum_loongarch(int unw_regnum __maybe_unused)
+{
+#ifndef HAVE_LIBUNWIND_LOONGARCH64_SUPPORT
+	return -EINVAL;
+#else
+	switch (unw_regnum) {
+	case UNW_LOONGARCH64_R1 ... UNW_LOONGARCH64_R31:
+		return unw_regnum - UNW_LOONGARCH64_R1 + PERF_REG_LOONGARCH_R1;
+	case UNW_LOONGARCH64_PC:
+		return PERF_REG_LOONGARCH_PC;
+	default:
+		pr_err("unwind: invalid reg id %d\n", unw_regnum);
+		return -EINVAL;
+	}
+#endif // HAVE_LIBUNWIND_LOONGARCH64_SUPPORT
+}
diff --git a/tools/perf/util/libunwind-arch/libunwind-mips.c b/tools/perf/util/libunwind-arch/libunwind-mips.c
new file mode 100644
index 000000000000..01a506c8079c
--- /dev/null
+++ b/tools/perf/util/libunwind-arch/libunwind-mips.c
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: GPL-2.0
+#include "libunwind-arch.h"
+#include "../debug.h"
+#include "../../../arch/mips/include/uapi/asm/perf_regs.h"
+#include <linux/compiler.h>
+#include <errno.h>
+
+#ifdef HAVE_LIBUNWIND_MIPS_SUPPORT
+#include <libunwind-mips.h>
+#endif
+
+int __get_perf_regnum_for_unw_regnum_mips(int unw_regnum __maybe_unused)
+{
+#ifndef HAVE_LIBUNWIND_MIPS_SUPPORT
+	return -EINVAL;
+#else
+	switch (unw_regnum) {
+	case UNW_MIPS_R1 ... UNW_MIPS_R25:
+		return unw_regnum - UNW_MIPS_R1 + PERF_REG_MIPS_R1;
+	case UNW_MIPS_R28 ... UNW_MIPS_R31:
+		return unw_regnum - UNW_MIPS_R28 + PERF_REG_MIPS_R28;
+	case UNW_MIPS_PC:
+		return PERF_REG_MIPS_PC;
+	default:
+		pr_err("unwind: invalid reg id %d\n", unw_regnum);
+		return -EINVAL;
+	}
+#endif // HAVE_LIBUNWIND_MIPS_SUPPORT
+}
diff --git a/tools/perf/util/libunwind-arch/libunwind-ppc32.c b/tools/perf/util/libunwind-arch/libunwind-ppc32.c
new file mode 100644
index 000000000000..bcdeed34d0a8
--- /dev/null
+++ b/tools/perf/util/libunwind-arch/libunwind-ppc32.c
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+#include "libunwind-arch.h"
+#include "../debug.h"
+#include "../../../arch/powerpc/include/uapi/asm/perf_regs.h"
+#include <linux/compiler.h>
+#include <errno.h>
+
+#ifdef HAVE_LIBUNWIND_PPC32_SUPPORT
+#include <libunwind-ppc32.h>
+#endif
+
+int __get_perf_regnum_for_unw_regnum_ppc32(int unw_regnum __maybe_unused)
+{
+#ifndef HAVE_LIBUNWIND_PPC32_SUPPORT
+	return -EINVAL;
+#else
+	switch (unw_regnum) {
+	case UNW_PPC32_R0 ... UNW_PPC32_R31:
+		return unw_regnum - UNW_PPC32_R0 + PERF_REG_POWERPC_R0;
+	case UNW_PPC32_LR:
+		return PERF_REG_POWERPC_LINK;
+	case UNW_PPC32_CTR:
+		return PERF_REG_POWERPC_CTR;
+	case UNW_PPC32_XER:
+		return PERF_REG_POWERPC_XER;
+	default:
+		pr_err("unwind: invalid reg id %d\n", unw_regnum);
+		return -EINVAL;
+	}
+#endif // HAVE_LIBUNWIND_PPC32_SUPPORT
+}
diff --git a/tools/perf/util/libunwind-arch/libunwind-ppc64.c b/tools/perf/util/libunwind-arch/libunwind-ppc64.c
new file mode 100644
index 000000000000..c508dc89615b
--- /dev/null
+++ b/tools/perf/util/libunwind-arch/libunwind-ppc64.c
@@ -0,0 +1,33 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+#include "libunwind-arch.h"
+#include "../debug.h"
+#include "../../../arch/powerpc/include/uapi/asm/perf_regs.h"
+#include <linux/compiler.h>
+#include <errno.h>
+
+#ifdef HAVE_LIBUNWIND_PPC64_SUPPORT
+#include <libunwind-ppc64.h>
+#endif
+
+int __get_perf_regnum_for_unw_regnum_ppc64(int unw_regnum __maybe_unused)
+{
+#ifndef HAVE_LIBUNWIND_PPC64_SUPPORT
+	return -EINVAL;
+#else
+	switch (unw_regnum) {
+	case UNW_PPC64_R0 ... UNW_PPC64_R31:
+		return unw_regnum - UNW_PPC64_R0 + PERF_REG_POWERPC_R0;
+	case UNW_PPC64_LR:
+		return PERF_REG_POWERPC_LINK;
+	case UNW_PPC64_CTR:
+		return PERF_REG_POWERPC_CTR;
+	case UNW_PPC64_XER:
+		return PERF_REG_POWERPC_XER;
+	case UNW_PPC64_NIP:
+		return PERF_REG_POWERPC_NIP;
+	default:
+		pr_err("unwind: invalid reg id %d\n", unw_regnum);
+		return -EINVAL;
+	}
+#endif // HAVE_LIBUNWIND_PPC64_SUPPORT
+}
diff --git a/tools/perf/util/libunwind-arch/libunwind-s390.c b/tools/perf/util/libunwind-arch/libunwind-s390.c
new file mode 100644
index 000000000000..7088991015e6
--- /dev/null
+++ b/tools/perf/util/libunwind-arch/libunwind-s390.c
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: GPL-2.0
+#include "libunwind-arch.h"
+#include "../debug.h"
+#include "../../../arch/s390/include/uapi/asm/perf_regs.h"
+#include <linux/compiler.h>
+#include <errno.h>
+
+#ifdef HAVE_LIBUNWIND_S390X_SUPPORT
+#include <libunwind-s390x.h>
+#endif
+
+int __get_perf_regnum_for_unw_regnum_s390(int unw_regnum __maybe_unused)
+{
+#ifndef HAVE_LIBUNWIND_S390X_SUPPORT
+	return -EINVAL;
+#else
+	switch (unw_regnum) {
+	case UNW_S390X_R0 ... UNW_S390X_R15:
+		return unw_regnum - UNW_S390X_R0 + PERF_REG_S390_R0;
+	case UNW_S390X_F0 ... UNW_S390X_F15:
+		return unw_regnum - UNW_S390X_F0 + PERF_REG_S390_FP0;
+	case UNW_S390X_IP:
+		return PERF_REG_S390_PC;
+	default:
+		pr_err("unwind: invalid reg id %d\n", unw_regnum);
+		return -EINVAL;
+	}
+#endif // HAVE_LIBUNWIND_S390X_SUPPORT
+}
diff --git a/tools/perf/util/libunwind-arch/libunwind-x86_64.c b/tools/perf/util/libunwind-arch/libunwind-x86_64.c
new file mode 100644
index 000000000000..82dfb2c7152a
--- /dev/null
+++ b/tools/perf/util/libunwind-arch/libunwind-x86_64.c
@@ -0,0 +1,52 @@
+// SPDX-License-Identifier: GPL-2.0
+#include "libunwind-arch.h"
+#include "../debug.h"
+#include "../../../arch/x86/include/uapi/asm/perf_regs.h"
+#include <linux/compiler.h>
+#include <linux/kernel.h>
+#include <errno.h>
+
+#ifdef HAVE_LIBUNWIND_X86_64_SUPPORT
+#include <libunwind-x86_64.h>
+#endif
+
+int __get_perf_regnum_for_unw_regnum_x86_64(int unw_regnum __maybe_unused)
+{
+#ifndef HAVE_LIBUNWIND_X86_64_SUPPORT
+	return -EINVAL;
+#else
+	static const int perf_x86_64_regnums[] = {
+#define REGNUM(reg) [UNW_X86_64_R ## reg] = PERF_REG_X86_ ## reg
+		REGNUM(AX),
+		REGNUM(DX),
+		REGNUM(CX),
+		REGNUM(BX),
+		REGNUM(SI),
+		REGNUM(DI),
+		REGNUM(BP),
+		REGNUM(SP),
+		REGNUM(IP),
+#undef REGNUM
+#define REGNUM(reg) [UNW_X86_64_ ## reg] = PERF_REG_X86_ ## reg
+		REGNUM(R8),
+		REGNUM(R9),
+		REGNUM(R10),
+		REGNUM(R11),
+		REGNUM(R12),
+		REGNUM(R13),
+		REGNUM(R14),
+		REGNUM(R15),
+#undef REGNUM
+	};
+
+	if (unw_regnum == UNW_X86_64_RAX)
+		return PERF_REG_X86_AX;
+
+	if (unw_regnum <  0 || unw_regnum >= (int)ARRAY_SIZE(perf_x86_64_regnums) ||
+            perf_x86_64_regnums[unw_regnum] == 0) {
+		pr_err("unwind: invalid reg id %d\n", unw_regnum);
+		return -EINVAL;
+	}
+	return perf_x86_64_regnums[unw_regnum];
+#endif // HAVE_LIBUNWIND_X86_64_SUPPORT
+}
diff --git a/tools/perf/util/libunwind/arm64.c b/tools/perf/util/libunwind/arm64.c
index 37ecef0c53b9..15670a964495 100644
--- a/tools/perf/util/libunwind/arm64.c
+++ b/tools/perf/util/libunwind/arm64.c
@@ -14,11 +14,6 @@
 
 #define REMOTE_UNWIND_LIBUNWIND
 
-/* Define arch specific functions & regs for libunwind, should be
- * defined before including "unwind.h"
- */
-#define LIBUNWIND__ARCH_REG_ID(regnum) libunwind__arm64_reg_id(regnum)
-
 #include "unwind.h"
 #include "libunwind-aarch64.h"
 #define perf_event_arm_regs perf_event_arm64_regs
diff --git a/tools/perf/util/libunwind/x86_32.c b/tools/perf/util/libunwind/x86_32.c
index 1697dece1b74..1e9fb8bfec44 100644
--- a/tools/perf/util/libunwind/x86_32.c
+++ b/tools/perf/util/libunwind/x86_32.c
@@ -14,20 +14,8 @@
 
 #define REMOTE_UNWIND_LIBUNWIND
 
-/* Define arch specific functions & regs for libunwind, should be
- * defined before including "unwind.h"
- */
-#define LIBUNWIND__ARCH_REG_ID(regnum) libunwind__x86_reg_id(regnum)
-
 #include "unwind.h"
 #include "libunwind-x86.h"
-#include <../../../../arch/x86/include/uapi/asm/perf_regs.h>
-
-/* HAVE_ARCH_X86_64_SUPPORT is used in'arch/x86/util/unwind-libunwind.c'
- * for x86_32, we undef it to compile code for x86_32 only.
- */
-#undef HAVE_ARCH_X86_64_SUPPORT
-#include "../../arch/x86/util/unwind-libunwind.c"
 
 /* Explicitly define NO_LIBUNWIND_DEBUG_FRAME, because non-ARM has no
  * dwarf_find_debug_frame() function.
diff --git a/tools/perf/util/unwind-libunwind-local.c b/tools/perf/util/unwind-libunwind-local.c
index 27e2f7b31789..adc6e82b5f27 100644
--- a/tools/perf/util/unwind-libunwind-local.c
+++ b/tools/perf/util/unwind-libunwind-local.c
@@ -39,6 +39,7 @@
 #include "debug.h"
 #include "asm/bug.h"
 #include "dso.h"
+#include "libunwind-arch/libunwind-arch.h"
 
 extern int
 UNW_OBJ(dwarf_search_unwind_table) (unw_addr_space_t as,
@@ -95,6 +96,7 @@ struct unwind_info {
 	struct perf_sample	*sample;
 	struct machine		*machine;
 	struct thread		*thread;
+	uint16_t		 e_machine;
 	bool			 best_effort;
 };
 
@@ -583,9 +585,7 @@ static int access_mem(unw_addr_space_t __maybe_unused as,
 	}
 
 	ret = perf_reg_value(&start, perf_sample__user_regs(ui->sample),
-			     perf_arch_reg_sp(thread__e_machine(ui->thread,
-								ui->machine,
-								/*e_flags=*/NULL)));
+			     perf_arch_reg_sp(ui->e_machine));
 	if (ret)
 		return ret;
 
@@ -633,7 +633,7 @@ static int access_reg(unw_addr_space_t __maybe_unused as,
 		return 0;
 	}
 
-	id = LIBUNWIND__ARCH_REG_ID(regnum);
+	id = get_perf_regnum_for_unw_regnum(ui->e_machine, regnum);
 	if (id < 0)
 		return -EINVAL;
 
@@ -734,7 +734,6 @@ static void _unwind__finish_access(struct maps *maps)
 static int get_entries(struct unwind_info *ui, unwind_entry_cb_t cb,
 		       void *arg, int max_stack)
 {
-	uint16_t e_machine = thread__e_machine(ui->thread, ui->machine, /*e_flags=*/NULL);
 	u64 val;
 	unw_word_t ips[max_stack];
 	unw_addr_space_t addr_space;
@@ -742,7 +741,7 @@ static int get_entries(struct unwind_info *ui, unwind_entry_cb_t cb,
 	int ret, i = 0;
 
 	ret = perf_reg_value(&val, perf_sample__user_regs(ui->sample),
-			     perf_arch_reg_ip(e_machine));
+			     perf_arch_reg_ip(ui->e_machine));
 	if (ret)
 		return 0;
 
@@ -820,6 +819,7 @@ static int _unwind__get_entries(unwind_entry_cb_t cb, void *arg,
 		.sample       = data,
 		.thread       = thread,
 		.machine      = maps__machine(thread__maps(thread)),
+		.e_machine    = thread__e_machine(thread, /*machine=*/NULL, /*e_flags=*/NULL),
 		.best_effort  = best_effort
 	};
 
diff --git a/tools/perf/util/unwind.h b/tools/perf/util/unwind.h
index 28db3e3b9b51..fd33d779f03d 100644
--- a/tools/perf/util/unwind.h
+++ b/tools/perf/util/unwind.h
@@ -64,11 +64,6 @@ int libunwind__get_entries(unwind_entry_cb_t cb, void *arg,
 			   struct thread *thread,
 			   struct perf_sample *data, int max_stack,
 			   bool best_effort);
-#ifndef LIBUNWIND__ARCH_REG_ID
-#define LIBUNWIND__ARCH_REG_ID(regnum) libunwind__arch_reg_id(regnum)
-#endif
-
-int LIBUNWIND__ARCH_REG_ID(int regnum);
 int unwind__prepare_access(struct maps *maps, struct map *map, bool *initialized);
 void unwind__flush_access(struct maps *maps);
 void unwind__finish_access(struct maps *maps);
-- 
2.54.0.563.g4f69b47b94-goog


