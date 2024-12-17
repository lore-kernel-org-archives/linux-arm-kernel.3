Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DB4AE7716A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 06:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XFGEv5JNows93O9McT7psH2HV0wc3zRUxGwU9Q0uDUU=; b=JY0bUku8BWC+Nvj1wM4S8EVhx/
	IL0pJaJoZB0GxrVOaPbK+PMpY9/vX741cgY+KyZDPYzglovXNCz6nFtzzxc0lmdFjU8d1iZ98JQDZ
	lJiTL8DmdcF9Pkfh18aZ7Sw0pPLljP9CHxvlxNqk+UQcxkYzTFb1Sed7WZD6yuWDrTSKow/T4UVLU
	L9E/LE4fdODjh8P+kgecbEFqaAV2L1mbQypdcesrYOyg1t6HAj4ANRrNlpvlGx9sfR1zrJ/ZsQ7Vc
	6noU5av/WPLl4W+Bz8W1spzArJgnWuxNU61/8AIH1YMbajuanW4NOLYvh3WBv2bgoUi3xuB0PbPS4
	JypVyzsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNROJ-0000000CTCn-1z5V;
	Tue, 17 Dec 2024 06:49:11 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNRF5-0000000CQbd-2gdY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 06:39:41 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-7fd2ff40782so4422050a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Dec 2024 22:39:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1734417579; x=1735022379; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XFGEv5JNows93O9McT7psH2HV0wc3zRUxGwU9Q0uDUU=;
        b=xMJZslm+MNNVYCPI47XOhJZ5Qh8EcdgVq5xYn2IjgOPzgZ4BnHNvb4sT8d2yCdzokJ
         x2P6dAhGM1QJcaKSvEt/I1amcCKwIvcoVieKT6/OSW0Hc0iBTWBnyk0IAIS9lxhhsQOV
         Lk9OJOtrEKH4gOAiL92uBBPdT8PNEuMt/OplqoIIGqrveeSRpw2limqzAXLoz4LppHUA
         tjkSjcjKow4D5DkFQWmj85broR/2hppXwWaXi+K4qG7EllKTU+subxSuY9QcpObvAi4q
         KE/5Y87ZVwbXrdKMnNJ5TGi1uJZF10KGjDfhz+5ly9vSeLwjTkP2tKkGzi3ROagOlpUb
         86Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734417579; x=1735022379;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XFGEv5JNows93O9McT7psH2HV0wc3zRUxGwU9Q0uDUU=;
        b=RXlmIBqmaFfy8g9H73Q2VbRCgd49jH9qn9b4+IcG9yG04QqiqHw8YRkHGcA9SsJZpZ
         85n88FpkNPMEjktBM8aYtEXxejDqUrW0WMTCSMFhYGTZw8DlPYq+pJ2RCYAJHbvaYVlw
         w2CrqeQXWWgoFbvKhfeuswRJtZoVBmX7FMBc8dsIOTLl+KTdwFZHWK9SJ0vinXriOmoW
         rTtNjIlfaMlNp9X+yQH1q5lpBEfs695BzjmZd9o05G6lkwyelWWQruLuyHgYOm6itIt1
         AABeJgGgmLMLlMUanqW6XkPZR8IaYRIcaCn7vjljG2IEAtBv6xY7UKevQT34pH5mVU5X
         pTXg==
X-Forwarded-Encrypted: i=1; AJvYcCVdCneYml8MqqaciNIs0GW+vB/j0R9qvG694iVGuTqGj1IOe5azbl4S3HcjoPIRaq1TkaEhqTRQkxxLto4aCF1P@lists.infradead.org
X-Gm-Message-State: AOJu0YzJTqdq4bM2cuINYYDo5ovTNjJi7f2S1OrdI/pbBub74PCZh9nc
	63R838O0zQ7iWv8hOe3qLnIPDwbv67/fJcXKthTQ8R/tdoE2jB3a7li1uovcbo0=
X-Gm-Gg: ASbGncuI8G4XKwYcsgCFRn9TqGx1JKIaOJ50zrP3S3fKXLav6YhP3TzWONcCmxJGVjV
	b0b1aP21ijFO3Iyh9qyLOh2VT6T2k2oErdAmlBt8oR06WQn9hbtAwqCzi+21G8phyMEDq0lewhG
	Rs6mRENccSVyoDcBcXJI1Dx1Ik4FgZ2VQJ/XjAh8t6FEShbudpp/bf/mY1JlB2JFbHwHM4uPwlx
	xr+/Addi2BZY46FMLN+sFcXyzFzOF+yNGkx0aCEGqH6H+N8iFDnbRTE3a/YZgT70dTZlHsN
X-Google-Smtp-Source: AGHT+IH5Jbkj+FBk+q7pXyrm0x94l5RQWYp47xvgMrZI97Q4jsdw7EcFidFs1gtOYxgmPqgr1EUyOQ==
X-Received: by 2002:a17:90b:1b10:b0:2ef:31a9:95af with SMTP id 98e67ed59e1d1-2f2900a2c01mr21501074a91.27.1734417579092;
        Mon, 16 Dec 2024 22:39:39 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f142d90d6bsm9179551a91.2.2024.12.16.22.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 22:39:38 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 16 Dec 2024 22:32:53 -0800
Subject: [PATCH v3 08/16] perf tools: x86: Use generic syscall scripts
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241216-perf_syscalltbl-v3-8-239f032481d5@rivosinc.com>
References: <20241216-perf_syscalltbl-v3-0-239f032481d5@rivosinc.com>
In-Reply-To: <20241216-perf_syscalltbl-v3-0-239f032481d5@rivosinc.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7222; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=RpMzSKzI/oIxW9CZ3PRuoSP5UTLO6XJSBYJ/o7IfArc=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ3qiTP/R/oqn3h+Fbi6wOj6FyZnH5Haz4ISI1Vqdis+/b
 XZSYZLvKGVhEONgkBVTZOG51sDceke/7Kho2QSYOaxMIEMYuDgFYCI7lzD8lXW+xZ/5/3HDVR7m
 iZy/Wgy/suuvDztrWVQwS8ma4cPUXkaGp/pOjmU/nZbrfrj3tnwes4jaPAMj1ewn6T+CFHz3G9o
 wAAA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_223939_751006_8B4F7888 
X-CRM114-Status: GOOD (  18.38  )
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
 tools/perf/Makefile.config                         |  3 +-
 tools/perf/Makefile.perf                           |  2 +-
 tools/perf/arch/x86/Build                          |  1 -
 tools/perf/arch/x86/Makefile                       | 25 -------------
 tools/perf/arch/x86/entry/syscalls/Kbuild          |  3 ++
 .../perf/arch/x86/entry/syscalls/Makefile.syscalls |  6 ++++
 tools/perf/arch/x86/entry/syscalls/syscalltbl.sh   | 42 ----------------------
 tools/perf/arch/x86/include/syscall_table.h        |  8 +++++
 tools/perf/util/syscalltbl.c                       | 10 +-----
 9 files changed, 20 insertions(+), 80 deletions(-)

diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index d3c12c6ba6764e9a8b12acee603a0509154f2c74..218c407c953f8526ea995cc5126a94654ebbae11 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -31,7 +31,7 @@ $(call detected_var,SRCARCH)
 ifneq ($(NO_SYSCALL_TABLE),1)
   NO_SYSCALL_TABLE := 1
 
-  ifeq ($(SRCARCH),$(filter $(SRCARCH),x86 powerpc arm64 s390 mips loongarch riscv))
+  ifeq ($(SRCARCH),$(filter $(SRCARCH),powerpc arm64 s390 mips loongarch))
     NO_SYSCALL_TABLE := 0
   endif
 
@@ -56,7 +56,6 @@ endif
 # Additional ARCH settings for x86
 ifeq ($(SRCARCH),x86)
   $(call detected,CONFIG_X86)
-  CFLAGS += -I$(OUTPUT)arch/x86/include/generated
   ifeq (${IS_64_BIT}, 1)
     CFLAGS += -DHAVE_ARCH_X86_64_SUPPORT
     ARCH_INCLUDE = ../../arch/x86/lib/memcpy_64.S ../../arch/x86/lib/memset_64.S
diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
index 47fe3c41fa13a388803ba804a7c3a4aac81d20ae..698967f50ceb5cfc29dc5c2947c995980120e64e 100644
--- a/tools/perf/Makefile.perf
+++ b/tools/perf/Makefile.perf
@@ -311,7 +311,7 @@ FEATURE_TESTS := all
 endif
 endif
 # architectures that use the generic syscall table
-generic_syscall_table_archs := riscv arc csky arm sh sparc xtensa
+generic_syscall_table_archs := riscv arc csky arm sh sparc xtensa x86
 ifneq ($(filter $(SRCARCH), $(generic_syscall_table_archs)),)
 include $(srctree)/tools/perf/scripts/Makefile.syscalls
 endif
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


