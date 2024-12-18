Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2A8DE77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 09:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XpB0w9ruWZ9SB1Z/oNB+riFactYhWVOiHklRjLiS9dw=; b=H1ANOr7sW5i0QwlVtEcLL+kmRI
	DIczU6S/aDQUw+vUubbI3TP6bNorrzsnwHasbY5/GOKe9eGT6+dRRaWs7tLVZN9nuTimzp7Wky/uB
	4XmS5DQ4fBlJSCzdA6g+rQAiNALs+fHj7K3ZZXrOtLO2KPmFzcc/lKsCJcsGOd6H7eINdyNs7MtjE
	Fh7X3QE1VQMW6C+T3BzUHfZ7hIIrGJpcNpyBNQKpY+0A9/JkUuI6Q94Oz/zYxq67Z0mP0orzQfTAm
	hHxSwNBOqX7X9k8fCqOJUVS61098t4TXZ2jU7Ik+TkYHsYM+zk2m0fc1RDgzugR1qcmrOb03TtkDI
	PuNMWKIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNqZR-0000000G9S5-2EqK;
	Wed, 18 Dec 2024 09:42:21 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNqIh-0000000G58V-21mH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 09:25:04 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2165cb60719so50289715ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 01:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1734513902; x=1735118702; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XpB0w9ruWZ9SB1Z/oNB+riFactYhWVOiHklRjLiS9dw=;
        b=lvJQldD/YDcCzUWN7fCxBMH2y63Iv1HZqMXe24TRHsjRbpbqmXYoBH9S8CcWYLlcJR
         ufdIFwxxVqqBOrhNA6NoXeK46AJX8d/WyAFMXarWVUQB5AL/Jq7krlEdOkNdtY+8Nndu
         xDeshy6X5AeJgfv4kt8EqXVXj2JIttk0umJG3xgn9Cu/UNh+iNLUPTRpaMnOh+83ZlZ5
         ekxbfxNX5q9SUM5J45674v7dL+o+bVkCwj2Hw48D4SdGnQYnswqDoCsoUGoezh2GRqRR
         FroQk0ful6yaC4YFbAewy2lrDy4G6kQOyjSoD+xrSJyX6VtonQ6rrNsY9d4wZsymYh6X
         DIfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734513902; x=1735118702;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XpB0w9ruWZ9SB1Z/oNB+riFactYhWVOiHklRjLiS9dw=;
        b=upmD//JR3zRJUjv6XtjDL+59R3tCf+pUD2ckyRkeSQqqSrU+8FeWnjHPOi6oZWy+kk
         XT5scZem0jos/sUruq7+i6ju36JOCHOCD6OIiGIK0BVp9idoL0zdY7Tzm+1AsfpbOW/v
         klUV0y+O7H9KU6/qi2Dj7PJV2nowg+Fh7lA3Yzl7KLbLuBmYdiMOfhzRPDEB8IJpUBg4
         IxBFDsmrjC4VeTIt338zX3vV+sDuUlzq41nrPQ5b1EOtPR7BC2pXUpGyG+cFO0ANCyF7
         Td0PdtNWxfTyGwjpLFMnHjadztR2LeuVWjR5RrDvjvv5KNntS+BWiMPQYed109G6S4ku
         9W1w==
X-Forwarded-Encrypted: i=1; AJvYcCWEuT9GsNl2K4pgOKf3wNNeA2u1IRy4+lfki5TCpZXhkEq4nHXxlvQOfmlBzsan+dVK4GgQc0lumf81+9rICqZg@lists.infradead.org
X-Gm-Message-State: AOJu0YzbdTV05YDDOPhbBQEaCiA/u5XgGbdbukNGRB1R25ZDOfvauo0c
	ozxLaPdFKpzxPXHMr3sv8necfay0wCxlwecMFzmjuu84VgsIuIoIcrLtOvU9DBM=
X-Gm-Gg: ASbGncsEHCHs6ZGnd3raHahKBR1t8PN0HrAeyAG1I80sCODwO5gi6ce7F5524bi2Ol+
	mVHLMdUF3koLV66xJzoi4wsMmtVFhxpM9oyq1JsZzrFQKkUeNKsuUQFz2PDkSniWLEMUZp3S/Eh
	6ZPc0vldLYH3Mf7OQSrZ+1OYxAXs0SEKAxS0uYHqV6igVXiwowmzdluQoTIquY5UGoH/axSF8wO
	VLDMsZHQIWLFrMcSD8MuIW1AXtnv1JtgP2hVCa3Vt1fEBRZ6QQx0UmCqQlyYfD4tRHP57su
X-Google-Smtp-Source: AGHT+IGKe+8ij/HO8AmXo0RPPksyUi5lXeicjPos2lbsx7I5HkIPFWr92YNR3oTNDVvC+EepAJA4Bg==
X-Received: by 2002:a17:902:e889:b0:216:2dc5:2330 with SMTP id d9443c01a7336-218d724958bmr36900625ad.36.1734513902511;
        Wed, 18 Dec 2024 01:25:02 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1e64f90sm72119995ad.241.2024.12.18.01.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 01:25:01 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 18 Dec 2024 01:24:12 -0800
Subject: [PATCH v4 14/16] perf tools: powerpc: Use generic syscall table
 scripts
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241218-perf_syscalltbl-v4-14-bc8caef2ca8e@rivosinc.com>
References: <20241218-perf_syscalltbl-v4-0-bc8caef2ca8e@rivosinc.com>
In-Reply-To: <20241218-perf_syscalltbl-v4-0-bc8caef2ca8e@rivosinc.com>
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
 Arnd Bergmann <arnd@arndb.de>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-security-module@vger.kernel.org, 
 bpf@vger.kernel.org, linux-csky@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6924; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=Xs8/OCRHaThmnGTloYD6BuiZxAXMMDrRVok4B3GhSuw=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ3rSlOMhLe6PvAWyAy/O43hgPX3hy8UvFuzgEi1b2O9h8
 GvKwm95HaUsDGIcDLJiiiw81xqYW+/olx0VLZsAM4eVCWQIAxenAEwkUIyRYbHqmexTZ+xjhFn3
 sBVLinMdvTdFTkljR/fb2cc8Gq54v2T4w7NCqTB5/rUzb9QL2UTVWddtWa0wY6lNf1VHgqJ1s44
 JIwA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_012503_529118_16A9DFAD 
X-CRM114-Status: GOOD (  18.06  )
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
instead of the custom ones for powerpc.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 tools/perf/Makefile.config                         |  3 +-
 tools/perf/Makefile.perf                           |  2 +-
 tools/perf/arch/powerpc/Makefile                   | 25 --------------
 tools/perf/arch/powerpc/entry/syscalls/Kbuild      |  3 ++
 .../arch/powerpc/entry/syscalls/Makefile.syscalls  |  6 ++++
 .../perf/arch/powerpc/entry/syscalls/mksyscalltbl  | 39 ----------------------
 tools/perf/arch/powerpc/include/syscall_table.h    |  8 +++++
 tools/perf/util/syscalltbl.c                       |  8 -----
 8 files changed, 19 insertions(+), 75 deletions(-)

diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index 972af3a363c7bbbf5f5226377fea9bd0d306fa38..478045f29b04e2f848e76cf86bc8bc457e37b07a 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -31,7 +31,7 @@ $(call detected_var,SRCARCH)
 ifneq ($(NO_SYSCALL_TABLE),1)
   NO_SYSCALL_TABLE := 1
 
-  ifeq ($(SRCARCH),$(filter $(SRCARCH),powerpc s390))
+  ifeq ($(SRCARCH),s390)
     NO_SYSCALL_TABLE := 0
   endif
 
@@ -49,7 +49,6 @@ endif
 
 # Additional ARCH settings for ppc
 ifeq ($(SRCARCH),powerpc)
-  CFLAGS += -I$(OUTPUT)arch/powerpc/include/generated
   ifndef NO_LIBUNWIND
     LIBUNWIND_LIBS := -lunwind -lunwind-ppc64
   endif
diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
index 74c1097f790cba5abfd1f2fbdaf4e7540c553482..f76b23d96fc91aa56807fc581bf820a117c2bda0 100644
--- a/tools/perf/Makefile.perf
+++ b/tools/perf/Makefile.perf
@@ -311,7 +311,7 @@ FEATURE_TESTS := all
 endif
 endif
 # architectures that use the generic syscall table
-generic_syscall_table_archs := riscv arc csky arm sh sparc xtensa x86 alpha parisc arm64 loongarch mips
+generic_syscall_table_archs := riscv arc csky arm sh sparc xtensa x86 alpha parisc arm64 loongarch mips powerpc
 ifneq ($(filter $(SRCARCH), $(generic_syscall_table_archs)),)
 include $(srctree)/tools/perf/scripts/Makefile.syscalls
 endif
diff --git a/tools/perf/arch/powerpc/Makefile b/tools/perf/arch/powerpc/Makefile
index dc8f4fb8e324ab6679d78b5fee3636ba7d2ff7c0..a295a80ea078199547e816d18531820bfdba7961 100644
--- a/tools/perf/arch/powerpc/Makefile
+++ b/tools/perf/arch/powerpc/Makefile
@@ -1,28 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
 HAVE_KVM_STAT_SUPPORT := 1
 PERF_HAVE_JITDUMP := 1
-
-#
-# Syscall table generation for perf
-#
-
-out    := $(OUTPUT)arch/powerpc/include/generated/asm
-header32 := $(out)/syscalls_32.c
-header64 := $(out)/syscalls_64.c
-sysprf := $(srctree)/tools/perf/arch/powerpc/entry/syscalls
-sysdef := $(sysprf)/syscall.tbl
-systbl := $(sysprf)/mksyscalltbl
-
-# Create output directory if not already present
-$(shell [ -d '$(out)' ] || mkdir -p '$(out)')
-
-$(header64): $(sysdef) $(systbl)
-	$(Q)$(SHELL) '$(systbl)' '64' $(sysdef) > $@
-
-$(header32): $(sysdef) $(systbl)
-	$(Q)$(SHELL) '$(systbl)' '32' $(sysdef) > $@
-
-clean::
-	$(call QUIET_CLEAN, powerpc) $(RM) $(header32) $(header64)
-
-archheaders: $(header32) $(header64)
diff --git a/tools/perf/arch/powerpc/entry/syscalls/Kbuild b/tools/perf/arch/powerpc/entry/syscalls/Kbuild
new file mode 100644
index 0000000000000000000000000000000000000000..84c6599b4ea6a160217a3496449b205f2263f0fb
--- /dev/null
+++ b/tools/perf/arch/powerpc/entry/syscalls/Kbuild
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+syscall-y += syscalls_32.h
+syscall-y += syscalls_64.h
diff --git a/tools/perf/arch/powerpc/entry/syscalls/Makefile.syscalls b/tools/perf/arch/powerpc/entry/syscalls/Makefile.syscalls
new file mode 100644
index 0000000000000000000000000000000000000000..f7e87a61401c14a1d3a8a04fe2c8ecc8bedcc1b0
--- /dev/null
+++ b/tools/perf/arch/powerpc/entry/syscalls/Makefile.syscalls
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0
+
+syscall_abis_32 += spu nospu
+syscall_abis_64 += spu nospu
+
+syscalltbl = $(srctree)/tools/perf/arch/powerpc/entry/syscalls/syscall.tbl
diff --git a/tools/perf/arch/powerpc/entry/syscalls/mksyscalltbl b/tools/perf/arch/powerpc/entry/syscalls/mksyscalltbl
deleted file mode 100755
index 0eb316fe6dd1175a86035f76f9f3cf7501c376bd..0000000000000000000000000000000000000000
--- a/tools/perf/arch/powerpc/entry/syscalls/mksyscalltbl
+++ /dev/null
@@ -1,39 +0,0 @@
-#!/bin/sh
-# SPDX-License-Identifier: GPL-2.0
-#
-# Generate system call table for perf. Derived from
-# s390 script.
-#
-# Copyright IBM Corp. 2017
-# Author(s):  Hendrik Brueckner <brueckner@linux.vnet.ibm.com>
-# Changed by: Ravi Bangoria <ravi.bangoria@linux.vnet.ibm.com>
-
-wordsize=$1
-SYSCALL_TBL=$2
-
-if ! test -r $SYSCALL_TBL; then
-	echo "Could not read input file" >&2
-	exit 1
-fi
-
-create_table()
-{
-	local wordsize=$1
-	local max_nr nr abi sc discard
-	max_nr=-1
-	nr=0
-
-	echo "static const char *const syscalltbl_powerpc_${wordsize}[] = {"
-	while read nr abi sc discard; do
-		if [ "$max_nr" -lt "$nr" ]; then
-			printf '\t[%d] = "%s",\n' $nr $sc
-			max_nr=$nr
-		fi
-	done
-	echo '};'
-	echo "#define SYSCALLTBL_POWERPC_${wordsize}_MAX_ID $max_nr"
-}
-
-grep -E "^[[:digit:]]+[[:space:]]+(common|spu|nospu|${wordsize})" $SYSCALL_TBL \
-	|sort -k1 -n                                                           \
-	|create_table ${wordsize}
diff --git a/tools/perf/arch/powerpc/include/syscall_table.h b/tools/perf/arch/powerpc/include/syscall_table.h
new file mode 100644
index 0000000000000000000000000000000000000000..7ff51b783000d727ec48be960730b81ecdb05575
--- /dev/null
+++ b/tools/perf/arch/powerpc/include/syscall_table.h
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
index 675702d686d0d1b53dd3ee2017cc9695686b9c63..8869fed1a58946c590484816354d8c74aff52ee3 100644
--- a/tools/perf/util/syscalltbl.c
+++ b/tools/perf/util/syscalltbl.c
@@ -18,14 +18,6 @@
 #include <asm/syscalls_64.c>
 const int syscalltbl_native_max_id = SYSCALLTBL_S390_64_MAX_ID;
 static const char *const *syscalltbl_native = syscalltbl_s390_64;
-#elif defined(__powerpc64__)
-#include <asm/syscalls_64.c>
-const int syscalltbl_native_max_id = SYSCALLTBL_POWERPC_64_MAX_ID;
-static const char *const *syscalltbl_native = syscalltbl_powerpc_64;
-#elif defined(__powerpc__)
-#include <asm/syscalls_32.c>
-const int syscalltbl_native_max_id = SYSCALLTBL_POWERPC_32_MAX_ID;
-static const char *const *syscalltbl_native = syscalltbl_powerpc_32;
 #elif defined(GENERIC_SYSCALL_TABLE)
 #include <syscall_table.h>
 const int syscalltbl_native_max_id = SYSCALLTBL_MAX_ID;

-- 
2.34.1


