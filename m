Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2122FD1CA07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 22:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/9aAf//xsc+qyoWm90gSA4rERDZKwTaDGDbX2kwPoNk=; b=2t0h60Q7UBGdWfWA5r0ePeTDK3
	hqPrsjSszBPqyFJhuyZbBTPFdKieBlqnnyJ23JXXLIL6YdZgvrH+WJbzPCQ85EvFDgE/Ksp0i/+Mz
	vOnFMZY7OCtmMA4OyaNsT+4JAhlbDSx2CfOI7A6cqrwc0GwE7P4Du1r00UnfCH/xP9xPw/AQhhnWE
	+1qU13kFEDvZU4crFiwmldArSrEt24smOw4GMFhSaK64z1tHyGhltq5rIe83cbmGRM8KRkLVsJYYc
	mYU9Y4JHRsftki4QuwPWxPhcNoFPns2sYTlD5hFE1P6Tw59uRoIrE1k6B6tQKumq20PqRlPC9YhZg
	w16PgT5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t85pt-0000000FKSo-3teI;
	Mon, 04 Nov 2024 22:46:13 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t84IL-0000000F5tf-12Ct
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 21:07:32 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-7206304f93aso4465703b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Nov 2024 13:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1730754448; x=1731359248; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/9aAf//xsc+qyoWm90gSA4rERDZKwTaDGDbX2kwPoNk=;
        b=zes/r95YuEh33uA8Jo+7p5vipGvlz74Sa3d8EI/YZukYCUh57G8BegN24DsabjPgJU
         RtDIEXbV3l/lBOpQ0gTe8F5hGRGUrzdz5yib+yczXzUQQO+eHRccMrcHkExS9VoQeBpq
         UvboYNFyCTZ2qq1LiO5C12XpGLOWtmzOcP7fCjlxKi0Yt3yA+3rdy5LCcmJWoMGiAADd
         Pv2fmjlor6NhusPfelLyduYsOkgPWMHQ0oTE+xzsYERUH3nmIYxHyYeiseLTLddA07Wg
         mdUAQf/P9ejg7VbOa8o5nJ/SJKy/1TO83UmiCWIORjlzV/YMuz8FNbbOCi2/+Mnz8epj
         uA9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730754448; x=1731359248;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/9aAf//xsc+qyoWm90gSA4rERDZKwTaDGDbX2kwPoNk=;
        b=kA8aPGjvSzE4sT6UoNsTWgZ4SOBDW7rQFtEvk+Rb150Ifjb+NqUTRQnN1UesDjsUcE
         15H2e1lTQDQaGio99vEhrmoERUig8xiF+dAeXe5COZ+efyR+U7cd91FiJPTBrj8fkxNJ
         7YrOIwAckVoFzXwK8nCo3Y2JXtj3XqMCvkVXjOh6r3wyZSNmQwwtMWf4yWPO9R47BP3C
         +YjkS59uGJZRJ7lS9PX7k30+cVOwELwZ4ljiegD2CQxvSYJP6P35Ru7UMfecM8v6Eo9n
         +iIPAk3PHKlyvncwMuX1uFzb9Tb2CSpNBShu+bYytxFKoC/ON8xVvlEnVW2DzIms2wHd
         V/mA==
X-Forwarded-Encrypted: i=1; AJvYcCW8Ygn1A6o1JCqvOXzp7hTKUJoiEwfLagoIfxxQbBXqEi08FP2fnzuedN4VHUJ1sU/wotEjauJK1ZMYPvBBgwki@lists.infradead.org
X-Gm-Message-State: AOJu0YyOEXegozz+eB0T+L8eSh5HP6SkadgSqsLzuJcU2Lzblii9Mmsa
	GUARsx2X/eMu+R0+t0Sjy6fkSkW9BuTu3Pvq/0AaNyBNjaER1CShsK0BSu2ZZYEvYApNiUVuRu9
	m
X-Google-Smtp-Source: AGHT+IGvYeT+krz8voIyeoeU2/dXj8vAkufm8V4iViqZtgJPyxxokpzx5Frwcvtmq4ySA6UxRwfZZA==
X-Received: by 2002:a05:6a21:6da2:b0:1db:ee29:4f4c with SMTP id adf61e73a8af0-1dbee294f98mr1611579637.23.1730754448579;
        Mon, 04 Nov 2024 13:07:28 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7ee490e08f4sm7248293a12.40.2024.11.04.13.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 13:07:27 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 04 Nov 2024 13:06:17 -0800
Subject: [PATCH RFT 15/16] perf tools: s390: Use generic syscall table
 scripts
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241104-perf_syscalltbl-v1-15-9adae5c761ef@rivosinc.com>
References: <20241104-perf_syscalltbl-v1-0-9adae5c761ef@rivosinc.com>
In-Reply-To: <20241104-perf_syscalltbl-v1-0-9adae5c761ef@rivosinc.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
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
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5741; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=eFfpWK4xa8S+wLkT7ES+qqXB5NBSakxC8AalGF7WLEk=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ7qmeXxL3MUlp9x8JC/YbXVeJXFjb2DN0+pTIbNyCpekK
 D9S+lDRUcrCIMbBICumyMJzrYG59Y5+2VHRsgkwc1iZQIYwcHEKwERU5zL8FehLKJDQOunZK13R
 El059cySv/KN1/WX3bW28WPuO5pygZHh649Fy9k3VTp/OtR7fHtE51ln19UPnUruZMsV/j3yo/U
 BMwA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_130729_530266_ADA8F3AE 
X-CRM114-Status: GOOD (  17.00  )
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

Use the generic scripts to generate headers from the syscall table
instead of the custom ones for s390.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 tools/perf/Makefile.config                         |  6 +---
 tools/perf/Makefile.perf                           |  2 +-
 tools/perf/arch/s390/Makefile                      | 21 --------------
 tools/perf/arch/s390/entry/syscalls/Kbuild         |  2 ++
 .../arch/s390/entry/syscalls/Makefile.syscalls     |  5 ++++
 tools/perf/arch/s390/entry/syscalls/mksyscalltbl   | 32 ----------------------
 tools/perf/arch/s390/include/syscall_table.h       |  2 ++
 tools/perf/util/syscalltbl.c                       |  6 +---
 8 files changed, 12 insertions(+), 64 deletions(-)

diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index 76dbd368aa9f..787be3201eec 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -31,12 +31,8 @@ $(call detected_var,SRCARCH)
 ifneq ($(NO_SYSCALL_TABLE),1)
   NO_SYSCALL_TABLE := 1
 
-  ifeq ($(SRCARCH),s390)
-    NO_SYSCALL_TABLE := 0
-  endif
-
   # architectures that use the generic syscall table scripts
-  ifeq ($(SRCARCH),$(filter $(SRCARCH),riscv arc csky arm sh sparc xtensa x86 alpha parisc arm64 loongarch mips powerpc))
+  ifeq ($(SRCARCH),$(filter $(SRCARCH),riscv arc csky arm sh sparc xtensa x86 alpha parisc arm64 loongarch mips powerpc s390))
     NO_SYSCALL_TABLE := 0
     CFLAGS += -DGENERIC_SYSCALL_TABLE
     CFLAGS += -I$(OUTPUT)arch/$(SRCARCH)/include/generated
diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
index c42cc4901005..410d850f7b9a 100644
--- a/tools/perf/Makefile.perf
+++ b/tools/perf/Makefile.perf
@@ -311,7 +311,7 @@ FEATURE_TESTS := all
 endif
 endif
 # architectures that use the generic syscall table
-ifeq ($(SRCARCH),$(filter $(SRCARCH),riscv arc csky arm sh sparc xtensa x86 alpha parisc arm64 loongarch mips powerpc))
+ifeq ($(SRCARCH),$(filter $(SRCARCH),riscv arc csky arm sh sparc xtensa x86 alpha parisc arm64 loongarch mips powerpc s390))
 include $(srctree)/tools/perf/scripts/Makefile.syscalls
 endif
 include Makefile.config
diff --git a/tools/perf/arch/s390/Makefile b/tools/perf/arch/s390/Makefile
index 56994e63b43a..51dd7d7827e5 100644
--- a/tools/perf/arch/s390/Makefile
+++ b/tools/perf/arch/s390/Makefile
@@ -5,24 +5,3 @@ endif
 HAVE_KVM_STAT_SUPPORT := 1
 PERF_HAVE_ARCH_REGS_QUERY_REGISTER_OFFSET := 1
 PERF_HAVE_JITDUMP := 1
-
-#
-# Syscall table generation for perf
-#
-
-out    := $(OUTPUT)arch/s390/include/generated/asm
-header := $(out)/syscalls_64.c
-sysprf := $(srctree)/tools/perf/arch/s390/entry/syscalls
-sysdef := $(sysprf)/syscall.tbl
-systbl := $(sysprf)/mksyscalltbl
-
-# Create output directory if not already present
-$(shell [ -d '$(out)' ] || mkdir -p '$(out)')
-
-$(header): $(sysdef) $(systbl)
-	$(Q)$(SHELL) '$(systbl)' $(sysdef) > $@
-
-clean::
-	$(call QUIET_CLEAN, s390) $(RM) $(header)
-
-archheaders: $(header)
diff --git a/tools/perf/arch/s390/entry/syscalls/Kbuild b/tools/perf/arch/s390/entry/syscalls/Kbuild
new file mode 100644
index 000000000000..9a41e3572c3a
--- /dev/null
+++ b/tools/perf/arch/s390/entry/syscalls/Kbuild
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+syscall-y += syscalls_64.h
diff --git a/tools/perf/arch/s390/entry/syscalls/Makefile.syscalls b/tools/perf/arch/s390/entry/syscalls/Makefile.syscalls
new file mode 100644
index 000000000000..9762d7abf17c
--- /dev/null
+++ b/tools/perf/arch/s390/entry/syscalls/Makefile.syscalls
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0
+
+syscall_abis_64 += renameat rlimit memfd_secret
+
+syscalltbl = $(srctree)/tools/perf/arch/s390/entry/syscalls/syscall.tbl
diff --git a/tools/perf/arch/s390/entry/syscalls/mksyscalltbl b/tools/perf/arch/s390/entry/syscalls/mksyscalltbl
deleted file mode 100755
index 52eb88a77c94..000000000000
--- a/tools/perf/arch/s390/entry/syscalls/mksyscalltbl
+++ /dev/null
@@ -1,32 +0,0 @@
-#!/bin/sh
-# SPDX-License-Identifier: GPL-2.0
-#
-# Generate system call table for perf
-#
-# Copyright IBM Corp. 2017, 2018
-# Author(s):  Hendrik Brueckner <brueckner@linux.vnet.ibm.com>
-#
-
-SYSCALL_TBL=$1
-
-if ! test -r $SYSCALL_TBL; then
-	echo "Could not read input file" >&2
-	exit 1
-fi
-
-create_table()
-{
-	local max_nr nr abi sc discard
-
-	echo 'static const char *const syscalltbl_s390_64[] = {'
-	while read nr abi sc discard; do
-		printf '\t[%d] = "%s",\n' $nr $sc
-		max_nr=$nr
-	done
-	echo '};'
-	echo "#define SYSCALLTBL_S390_64_MAX_ID $max_nr"
-}
-
-grep -E "^[[:digit:]]+[[:space:]]+(common|64)" $SYSCALL_TBL	\
-	|sort -k1 -n					\
-	|create_table
diff --git a/tools/perf/arch/s390/include/syscall_table.h b/tools/perf/arch/s390/include/syscall_table.h
new file mode 100644
index 000000000000..b53e31c15805
--- /dev/null
+++ b/tools/perf/arch/s390/include/syscall_table.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/syscalls_64.h>
diff --git a/tools/perf/util/syscalltbl.c b/tools/perf/util/syscalltbl.c
index 4320876242ae..9341f0d442fe 100644
--- a/tools/perf/util/syscalltbl.c
+++ b/tools/perf/util/syscalltbl.c
@@ -13,11 +13,7 @@
 #include <string.h>
 #include "string2.h"
 
-#if defined(__s390x__)
-#include <asm/syscalls_64.c>
-const int syscalltbl_native_max_id = SYSCALLTBL_S390_64_MAX_ID;
-static const char *const *syscalltbl_native = syscalltbl_s390_64;
-#elif defined(GENERIC_SYSCALL_TABLE)
+#if defined(GENERIC_SYSCALL_TABLE)
 #include <syscall_table.h>
 const int syscalltbl_native_max_id = SYSCALLTBL_MAX_ID;
 static const char *const *syscalltbl_native = syscalltbl;

-- 
2.34.1


