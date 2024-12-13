Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D96AE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 00:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wqtsJdH0T6zZbhdBCcLZmUo3J7d8jbx2wRY5+ZHZK5Y=; b=J6mIgxdylmYYxlBQCrNa8hLecX
	Hje2krnQI6CHcCOQbMk/v/fZVkAHzSEANiD/69CEl6S8Ad8iUOAYoyyXnnnNncpzWrgnQcRre3p/H
	LOGZBTHU1T2YFpfAnYI5Cjv+hrvFA5fy0VeyhwbdVzhLnVcDO2u3w6GLMXpFDwAjjphV8QaW7/zN1
	sl0n9wUGxOYv2+ZbhXI5mrEgwNCaE3A8XRxOIZtp19v3kT8NhNqUP5Ey3kSnLf5bbAUusMPOMddHh
	m11bDEF1HUsTcwLhsLuLBaC/V9vEOCgzJdS1H+L3syo/gDwCIWReAfyg3HA+iaQygmixT7jIwhfJe
	O/C6eS6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLtlk-00000002KNH-1sN0;
	Fri, 13 Dec 2024 00:43:00 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLtcX-00000002I7o-1UHn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 00:33:30 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-2ee9a780de4so789346a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 16:33:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1734050009; x=1734654809; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wqtsJdH0T6zZbhdBCcLZmUo3J7d8jbx2wRY5+ZHZK5Y=;
        b=n76CFWBHhMr4Uinqj2NaZXXL60KsA4BEGfLFw6s5DbqcW4qw6BmpfAD3j6Yg70aFfU
         oi0ZamIZI1uqQuegFNTIsvQOdPiFMnvfsQ0sECmaueIzPCNMlFQNLGxo++v/8QYaavMn
         18X2AdkqpKSsEsQjqYxYtqLwNuGHVyvOvg5l2++P76kb6aS6mvCcQM0Fc1TfpCzm8/Gc
         TM7BNr8Bcg+PG+cJPyyYpCDCAwVucxVcB/4fgix+KWtKYh/pnb9vGzw3x/XNXCl4JIhu
         ktQEjT+tsWBdvJklYff7XXoeUwJ/WY9YorqsQgGNXzwANvviiAPFieZrbHHkDiEEO60q
         nrpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734050009; x=1734654809;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wqtsJdH0T6zZbhdBCcLZmUo3J7d8jbx2wRY5+ZHZK5Y=;
        b=pjrrD91fTU2xsgeReKsuCiSee3Rfz1j3CzmUHu61PWYZyulOAfErlUHN8iYiyBqlxA
         ZAeJcWeD81h051jHRdZP5h32Hk47kHJhH/Xxm4xq2GIE+nA26mq9RdZNXNIUDe8dDkpR
         7euDs9V1kJgsp/KYUFtE00SMVumg+KpKgxfIYtiYgI1DhjpIEwXKJ/X5bYP8ti/+OUQY
         lKuO19lOWzYr3nMGP4X5iIkZJQtBBIGLzZn28xAWWu4eThMb4Vczk1MZydolAnh5vOoh
         j9Upg68SU5a+DNTdu+M4TjlJYyhse10BQWboISoZ8L4ui46xXn2d0AlvevH1X9mGxlmN
         Pdbg==
X-Forwarded-Encrypted: i=1; AJvYcCW3CBKTetC1t0IvNvaz3bjxPAhixmHQ7KwoiXt4HdjcqSbXJysk3F68uNJCDqsDLYOjAzLlQshqrde2HNENbHp+@lists.infradead.org
X-Gm-Message-State: AOJu0YwFD2w+96MfzFkPj+t1hyavDM1vyRKlX4zYZKu3hfUmoyJzVNV2
	o2ythDmUmBgsNr4312VvnVgJ69se4IZv1teIY7+LqKUdwmal73yQame/WThhOWtgs0qB6j9KX1e
	M
X-Gm-Gg: ASbGncsXGCKqqnTMjO6ODZL5PrD0NVgfA9o+XssDPKqoeReMQA7DjQpB0mY2iHwzhmO
	mTtqfhg4V4uzh0sdlUWpiAjRzG/ID78wTDcjIF3V6o89KP1eENoqkbhjN27miADSqDEZQ8fxlLB
	N7zpsSm3C/NLveET5BWNrOz8YWZv2xdiZU3Z58kqBQZP1asnQlp9EfQWNz7RRLZICVceKf6uObq
	8IZ4XW3n0Lq0szkmco+IxNJVhaA9OITV+veo9ominPYQPMvj41YXJyauamnc4CuHi0PHZQE
X-Google-Smtp-Source: AGHT+IGi90vHo4yCrr7BQy/TsA036N7tv/gNvOdFJlDNh6L5trY7iFH3eAjPqcmD14GDGTyDF3GXKQ==
X-Received: by 2002:a17:90b:3b52:b0:2ef:2d9f:8e55 with SMTP id 98e67ed59e1d1-2f28fd66b3dmr1299199a91.17.1734050008781;
        Thu, 12 Dec 2024 16:33:28 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f142e0ce50sm1934462a91.39.2024.12.12.16.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 16:33:27 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 12 Dec 2024 16:32:58 -0800
Subject: [PATCH v2 08/16] perf tools: x86: Use generic syscall scripts
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-perf_syscalltbl-v2-8-f8ca984ffe40@rivosinc.com>
References: <20241212-perf_syscalltbl-v2-0-f8ca984ffe40@rivosinc.com>
In-Reply-To: <20241212-perf_syscalltbl-v2-0-f8ca984ffe40@rivosinc.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
 Christian Brauner <brauner@kernel.org>, Guo Ren <guoren@kernel.org>, 
 John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
 James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>, 
 Leo Yan <leo.yan@linux.dev>, Jonathan Corbet <corbet@lwn.net>, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@rivosinc.com>, 
 Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-security-module@vger.kernel.org, 
 bpf@vger.kernel.org, linux-csky@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7567; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=vWB516XE68OePgZAgArR+UCA4Mc0u0OEiQYLsE2X2xs=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ3p0w35j+78f3skpZFdbZ2kttLGZ2dZ67d2VOa//eIo+C
 D475UJURykLgxgHg6yYIgvPtQbm1jv6ZUdFyybAzGFlAhnCwMUpABM5Mpfhf/rukAKHT13bVNYl
 mU0Ij9YO3n4h+lTgG0tZrTVLri3d7crIsIv7+gXDvZw/5aed4fthqCzMe/t99Msn7cYzb5mGsyz
 azAIA
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_163329_404784_C933AAF4 
X-CRM114-Status: GOOD (  18.20  )
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

Use the generic scripts to generate headers from the syscall table for
both 32- and 64-bit x86.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 tools/perf/Makefile.config                         |  5 ++-
 tools/perf/Makefile.perf                           |  2 +-
 tools/perf/arch/x86/Build                          |  1 -
 tools/perf/arch/x86/Makefile                       | 25 -------------
 tools/perf/arch/x86/entry/syscalls/Kbuild          |  3 ++
 .../perf/arch/x86/entry/syscalls/Makefile.syscalls |  6 ++++
 tools/perf/arch/x86/entry/syscalls/syscalltbl.sh   | 42 ----------------------
 tools/perf/arch/x86/include/syscall_table.h        |  8 +++++
 tools/perf/util/syscalltbl.c                       | 10 +-----
 9 files changed, 21 insertions(+), 81 deletions(-)

diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index 9348c1e72bf00f43faf1c9aadab171236e6c3621..ada51e0dc17fbf5012e606ffc0b580c6993ebe64 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -31,12 +31,12 @@ $(call detected_var,SRCARCH)
 ifneq ($(NO_SYSCALL_TABLE),1)
   NO_SYSCALL_TABLE := 1
 
-  ifeq ($(SRCARCH),$(filter $(SRCARCH),x86 powerpc arm64 s390 mips loongarch riscv))
+  ifeq ($(SRCARCH),$(filter $(SRCARCH),powerpc arm64 s390 mips loongarch))
     NO_SYSCALL_TABLE := 0
   endif
 
   # architectures that use the generic syscall table scripts
-  ifeq ($(SRCARCH),$(filter $(SRCARCH),riscv arc csky arm sh sparc xtensa))
+  ifeq ($(SRCARCH),$(filter $(SRCARCH),riscv arc csky arm sh sparc xtensa x86))
     NO_SYSCALL_TABLE := 0
     CFLAGS += -DGENERIC_SYSCALL_TABLE
     CFLAGS += -I$(OUTPUT)/tools/perf/arch/$(SRCARCH)/include/generated
@@ -56,7 +56,6 @@ endif
 # Additional ARCH settings for x86
 ifeq ($(SRCARCH),x86)
   $(call detected,CONFIG_X86)
-  CFLAGS += -I$(OUTPUT)arch/x86/include/generated
   ifeq (${IS_64_BIT}, 1)
     CFLAGS += -DHAVE_ARCH_X86_64_SUPPORT
     ARCH_INCLUDE = ../../arch/x86/lib/memcpy_64.S ../../arch/x86/lib/memset_64.S
diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
index c7e1c6b7f8d97dddf07eab122a169b379ec43a19..efce35bb535b8ce4c20ee0a9250a548e4af1fbce 100644
--- a/tools/perf/Makefile.perf
+++ b/tools/perf/Makefile.perf
@@ -311,7 +311,7 @@ FEATURE_TESTS := all
 endif
 endif
 # architectures that use the generic syscall table
-ifeq ($(SRCARCH),$(filter $(SRCARCH),riscv arc csky arm sh sparc xtensa))
+ifeq ($(SRCARCH),$(filter $(SRCARCH),riscv arc csky arm sh sparc xtensa x86))
 include $(srctree)/tools/perf/scripts/Makefile.syscalls
 endif
 include Makefile.config
diff --git a/tools/perf/arch/x86/Build b/tools/perf/arch/x86/Build
index 87d0574913431b7c4505caf78f41d48b180a2fbc..02a1ca780a2071d322f75fb2885c3a36bc278e8d 100644
--- a/tools/perf/arch/x86/Build
+++ b/tools/perf/arch/x86/Build
@@ -2,7 +2,6 @@ perf-util-y += util/
 perf-test-y += tests/
 
 ifdef SHELLCHECK
-  SHELL_TESTS := entry/syscalls/syscalltbl.sh
   TEST_LOGS := $(SHELL_TESTS:%=%.shellcheck_log)
 else
   SHELL_TESTS :=
diff --git a/tools/perf/arch/x86/Makefile b/tools/perf/arch/x86/Makefile
index a6b6e0a9308a8e401c65eb802e5815a41fbdefe9..a295a80ea078199547e816d18531820bfdba7961 100644
--- a/tools/perf/arch/x86/Makefile
+++ b/tools/perf/arch/x86/Makefile
@@ -1,28 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
 HAVE_KVM_STAT_SUPPORT := 1
 PERF_HAVE_JITDUMP := 1
-
-###
-# Syscall table generation
-#
-
-generated := $(OUTPUT)arch/x86/include/generated
-out       := $(generated)/asm
-header    := $(out)/syscalls_64.c
-header_32 := $(out)/syscalls_32.c
-sys       := $(srctree)/tools/perf/arch/x86/entry/syscalls
-systbl    := $(sys)/syscalltbl.sh
-
-# Create output directory if not already present
-$(shell [ -d '$(out)' ] || mkdir -p '$(out)')
-
-$(header): $(sys)/syscall_64.tbl $(systbl)
-	$(Q)$(SHELL) '$(systbl)' $(sys)/syscall_64.tbl 'x86_64' > $@
-
-$(header_32): $(sys)/syscall_32.tbl $(systbl)
-	$(Q)$(SHELL) '$(systbl)' $(sys)/syscall_32.tbl 'x86' > $@
-
-clean::
-	$(call QUIET_CLEAN, x86) $(RM) -r $(header) $(generated)
-
-archheaders: $(header) $(header_32)
diff --git a/tools/perf/arch/x86/entry/syscalls/Kbuild b/tools/perf/arch/x86/entry/syscalls/Kbuild
new file mode 100644
index 0000000000000000000000000000000000000000..84c6599b4ea6a160217a3496449b205f2263f0fb
--- /dev/null
+++ b/tools/perf/arch/x86/entry/syscalls/Kbuild
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+syscall-y += syscalls_32.h
+syscall-y += syscalls_64.h
diff --git a/tools/perf/arch/x86/entry/syscalls/Makefile.syscalls b/tools/perf/arch/x86/entry/syscalls/Makefile.syscalls
new file mode 100644
index 0000000000000000000000000000000000000000..db3d5d6d4e5699d338afc55f6415612ef924d985
--- /dev/null
+++ b/tools/perf/arch/x86/entry/syscalls/Makefile.syscalls
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0
+
+syscall_abis_32 += i386
+syscall_abis_64 +=
+
+syscalltbl = $(srctree)/tools/perf/arch/x86/entry/syscalls/syscall_%.tbl
diff --git a/tools/perf/arch/x86/entry/syscalls/syscalltbl.sh b/tools/perf/arch/x86/entry/syscalls/syscalltbl.sh
deleted file mode 100755
index 2b71f99933a549607b0c18aa2b8be16b860f603c..0000000000000000000000000000000000000000
--- a/tools/perf/arch/x86/entry/syscalls/syscalltbl.sh
+++ /dev/null
@@ -1,42 +0,0 @@
-#!/bin/sh
-# SPDX-License-Identifier: GPL-2.0
-
-in="$1"
-arch="$2"
-
-syscall_macro() {
-    nr="$1"
-    name="$2"
-
-    echo "	[$nr] = \"$name\","
-}
-
-emit() {
-    nr="$1"
-    entry="$2"
-
-    syscall_macro "$nr" "$entry"
-}
-
-echo "static const char *const syscalltbl_${arch}[] = {"
-
-sorted_table=$(mktemp /tmp/syscalltbl.XXXXXX)
-grep '^[0-9]' "$in" | sort -n > $sorted_table
-
-max_nr=0
-# the params are: nr abi name entry compat
-# use _ for intentionally unused variables according to SC2034
-while read nr _ name _ _; do
-    if [ $nr -ge 512 ] ; then # discard compat sycalls
-        break
-    fi
-
-    emit "$nr" "$name"
-    max_nr=$nr
-done < $sorted_table
-
-rm -f $sorted_table
-
-echo "};"
-
-echo "#define SYSCALLTBL_${arch}_MAX_ID ${max_nr}"
diff --git a/tools/perf/arch/x86/include/syscall_table.h b/tools/perf/arch/x86/include/syscall_table.h
new file mode 100644
index 0000000000000000000000000000000000000000..7ff51b783000d727ec48be960730b81ecdb05575
--- /dev/null
+++ b/tools/perf/arch/x86/include/syscall_table.h
@@ -0,0 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/bitsperlong.h>
+
+#if __BITS_PER_LONG == 64
+#include <asm/syscalls_64.h>
+#else
+#include <asm/syscalls_32.h>
+#endif
diff --git a/tools/perf/util/syscalltbl.c b/tools/perf/util/syscalltbl.c
index ccf234a54366f9921c3b9a02ffb0a365d17244bc..02f23483bfff83809c4e649a2d054dba6975d12c 100644
--- a/tools/perf/util/syscalltbl.c
+++ b/tools/perf/util/syscalltbl.c
@@ -14,15 +14,7 @@
 #include <string.h>
 #include "string2.h"
 
-#if defined(__x86_64__)
-#include <asm/syscalls_64.c>
-const int syscalltbl_native_max_id = SYSCALLTBL_x86_64_MAX_ID;
-static const char *const *syscalltbl_native = syscalltbl_x86_64;
-#elif defined(__i386__)
-#include <asm/syscalls_32.c>
-const int syscalltbl_native_max_id = SYSCALLTBL_x86_MAX_ID;
-static const char *const *syscalltbl_native = syscalltbl_x86;
-#elif defined(__s390x__)
+#if defined(__s390x__)
 #include <asm/syscalls_64.c>
 const int syscalltbl_native_max_id = SYSCALLTBL_S390_64_MAX_ID;
 static const char *const *syscalltbl_native = syscalltbl_s390_64;

-- 
2.34.1


