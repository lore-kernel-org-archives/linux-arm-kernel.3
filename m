Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E00DE77199
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 02:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GiD2Rla/xsm4bXG8M0ZJW8z5mN+wlqQHFTji6CER+Qg=; b=UtGK35R8Zv/I9UpQ9XwNBYvh+L
	p3wNN3lDZkwQwuGH8cUG7YFp7Ht38z2iYHm/jnuweMTL0UKBBDsYA9fAS3kXyR37C8totEmglq7Ou
	vb3KSyXYSF9xZEW759a1E7iaRaBAqOzK88FU9MX6Eeay3ZmCw9MQ9PKR7bHakox0dG8Vf6jZ0Wifv
	9k21xtoX6VVya7dJwGPvRCscXQz+sxjJQ7ixUpKNlpsN0+z2X6EWBj8dygMduBjaL8fSznbCMQbVX
	ssUKz43vSDfholvzwz2qfKOaXJNeDCEGq9IjRDFayeCUFYlirVF0ibjtw1ykMUbBBhfomrU99rRb1
	mc8EPo8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tViaV-0000000AVde-2Xhm;
	Thu, 09 Jan 2025 02:47:59 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tViPo-0000000ASMc-0zZ6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 02:36:57 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-21669fd5c7cso5746075ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jan 2025 18:36:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736390216; x=1736995016; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GiD2Rla/xsm4bXG8M0ZJW8z5mN+wlqQHFTji6CER+Qg=;
        b=fmF8WjNhBMtu74PYms2KdOKf7ihRchvODPtl4Jr44m8ZynWCdrG4glszJ+FZ1lwcSd
         HtU1aKxtWnLnmXFxGPWAdn4ak8cL2IkPPziO6hi58IDp7T6vQyHFi4TarHliQ7d84GWt
         jdAG318qtONmqhUQDyoRknhRQkoMdrAdbLIUsW8j1DzpXqAmMzjoejxfZkK87HChaWsC
         uN+NBYgPuJYKl7FbG6rbdy8MXYHj3JLctfEmslBDSDfJO0NfIPbyU56f7UtzL0Z6cUF0
         PmAcvR+nuMmC4VrbqdXvonKJGcJaKz5n/eQ/N3FsumOvSeL7uJdPnJ4oUBqTlqApoCZA
         FqLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736390216; x=1736995016;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GiD2Rla/xsm4bXG8M0ZJW8z5mN+wlqQHFTji6CER+Qg=;
        b=Ld9Edr7Wsc3iHcXz3k3WGBtaEY3ZAZItheN+MyI1B2nF1XdQr4Ei2YnTcDmI7OiU3+
         q2jgpwBOA6BffZw4WeAszba5FUjNCUzmUA0N/6iu8IRVnw9/8308cZLZpQEgCdDciNS7
         wZqj3eByILcn+ND0DwABKWpbjE+bkFSFReFur0C0bfZHJp5aA30MMReOzaLGAF68fl9i
         zZJf25XkYdyhycIBOuL9YCobksnefzcAJ6QtT6JvFjvBWRsoVHtCfQrdMFe02E2GFTF2
         eIdqAPNSLfHNN6NKUpR56WXQX/7lFDC6hZy+4DODMhYfUD2OCCr4xzzpGUk3sspC8CCP
         GJgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmPi4HAWxVN+hQOl4+iE76iyvlXtehPUhZftxXChqvrSn7Sj3RGtGEusCIEzP+Crc8KG5/lOaS8cup2KlrLIJg@lists.infradead.org
X-Gm-Message-State: AOJu0Yyvr+hYqrLBBlthVFQ4SIkERKVLfprBYa94q3svIG1QblhLD2yO
	R2WIhvNM5qtjKSpr9UI+fzxdhNT4ICDHjc1+LW2e7mXECCUxz1ETPeibTcblkfQ=
X-Gm-Gg: ASbGncv3nQp7xszOppN1KJFAC8j37xuRrCiBhtBp1bjjHLrLgMjaf6lvAMo3VKFyrRC
	o1yYRDc9Fajl8b75FvTEdTG11WJDgLPfEXYUy3dMSNZ35yjLJIHFrnl7cTcs7dVN8twLXKqbx87
	KO3wSMAii9CQ8KFKfuAI06tYWI84PDStk9ivM0tv5MMBJdyrYMNIdKxIF9PyxF6085YS1gd1Hm+
	KkzkoCcQs4N7OgxbvYJ2nrt+8aCzOC+wOK+S3pFCgkbsZW526I932+IR2vuamG4ZyTLPqp0
X-Google-Smtp-Source: AGHT+IF1E9ojkYyov3rq6iNODiY3KeXkhrxgkkEk8sPp9F/0DPBAqGbwDKSK5SzGNbbw8dZD/j1fzg==
X-Received: by 2002:a17:902:e5c2:b0:215:b33b:e26d with SMTP id d9443c01a7336-21a83f55103mr82204285ad.21.1736390215677;
        Wed, 08 Jan 2025 18:36:55 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9176bed6sm1434365ad.12.2025.01.08.18.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 18:36:54 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 08 Jan 2025 18:36:23 -0800
Subject: [PATCH v6 08/16] perf tools: x86: Use generic syscall scripts
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250108-perf_syscalltbl-v6-8-7543b5293098@rivosinc.com>
References: <20250108-perf_syscalltbl-v6-0-7543b5293098@rivosinc.com>
In-Reply-To: <20250108-perf_syscalltbl-v6-0-7543b5293098@rivosinc.com>
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
 Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-security-module@vger.kernel.org, 
 bpf@vger.kernel.org, linux-csky@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7222; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=I9cHVjQ2uo3OIuDJZJCfKTtcXpKfadJsSGAtAuWupyg=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ3q9me7HyQu0pvRlTWI8erHTpV+s+sGhJgvGoy/UDtX/q
 v7y7uyKjlIWBjEOBlkxRRaeaw3MrXf0y46Klk2AmcPKBDKEgYtTACYSfZ6RoV+pZtp6Y94pbae+
 6f8S+8AVU5f73IT92KmcjN0vT36u/s7wm63OseOoA9+PkqXtW3xOL/ihohkx+2iV3LblexZun9K
 uwgsA
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_183656_305211_A85E0D1A 
X-CRM114-Status: GOOD (  18.43  )
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
index 4e05dd2e9596e87cdd0dc91f4c5b071b4545c574..a9606e7254908c101ad41f1e3f249af5418711f3 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -31,7 +31,7 @@ $(call detected_var,SRCARCH)
 ifneq ($(NO_SYSCALL_TABLE),1)
   NO_SYSCALL_TABLE := 1
 
-  ifeq ($(SRCARCH),$(filter $(SRCARCH),x86 powerpc arm64 s390 mips loongarch riscv))
+  ifeq ($(SRCARCH),$(filter $(SRCARCH),powerpc arm64 s390 mips loongarch))
     NO_SYSCALL_TABLE := 0
   endif
 
@@ -58,7 +58,6 @@ endif
 # Additional ARCH settings for x86
 ifeq ($(SRCARCH),x86)
   $(call detected,CONFIG_X86)
-  CFLAGS += -I$(OUTPUT)arch/x86/include/generated
   ifeq (${IS_64_BIT}, 1)
     CFLAGS += -DHAVE_ARCH_X86_64_SUPPORT
     ARCH_INCLUDE = ../../arch/x86/lib/memcpy_64.S ../../arch/x86/lib/memset_64.S
diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
index 52d2a02f0813d67ed1159b30b6ce0b431eda28f2..51282ee096f53718c8311a392a410b4e580cb76b 100644
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


