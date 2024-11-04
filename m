Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B86D5D1BDF2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 21:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=92GrRLDgka7EWUObBkAeZ/OwF0Pa5ocJ0bqq37OhKZU=; b=wgq8QWVlnSPL6zWgAd3LyZaEvR
	vZlqxudUB745BdGv3O+wgiKB6IpGqsiLk8w1Dgmed2IIWv0gA3lFFLOGGXbg0aI1C1Mh/q5I+7Mta
	dINFcYuuC+QWUKJXZuLCadHTM80UAesSVUfaqooANprmpXGPWlnd/dxL98lpqYqdXHJNKrFyuujfc
	FMjOs2MtiTqJ4GcPlO14zAFuAzHVep7YYUNvntCTRs6RKD0eIbD/yDxekLP5zgYzt73Pw0XbAAIph
	iQs+nuDsr5eFvfTOICJFaupvc1Wazl5CjAaAkU+5sSV0OJHogk8vWiiPGi9XJlKRrwUlFVRUSXaUU
	D6MV2RDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t84g1-0000000FAsM-0xBR;
	Mon, 04 Nov 2024 21:31:57 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t84II-0000000F5qi-0cgR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 21:07:29 +0000
Received: by mail-oi1-x22b.google.com with SMTP id 5614622812f47-3e5f533e1c2so2484723b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Nov 2024 13:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1730754445; x=1731359245; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=92GrRLDgka7EWUObBkAeZ/OwF0Pa5ocJ0bqq37OhKZU=;
        b=hFW911veaylURx4+848Cp+AIHBZzqBn0LffuJNUNGULMEjHo12CIj8Ss6l9gmdqNUm
         lZEpaTVs9Gu7NProErP8nWZNtZ/vb0lJRhsa8BLefLxUtgpoA4UcphFEaWl/ahOOc6VW
         zcc5FeBTvHkFRAN9i1AAVo3g8nqcEsXBs8vV8PQfAfB6DiN41AotSDtNDmr5/u4/66VS
         TTmsjOoucIAAW3GpwuL0Zogh86GACu3gntAbFGgcBannG8KUoOppUpKvstsyxknvwY9m
         hnJv3Xhx8L2Kz3Y7LMSrsWYGiZycso/dk1rxhjdnQLol/3GUTLj2ODdsu/hXL7AIO3Nu
         i92w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730754445; x=1731359245;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=92GrRLDgka7EWUObBkAeZ/OwF0Pa5ocJ0bqq37OhKZU=;
        b=TtCH1qwSUlQZfCLmbalPBL+J0dcx3XXggaAgke2uIMixP3Z+MSbXxhZWiHwmu20L7/
         5Ne2+wkB/x+1suPP4O0taBoUMEwF8m4KGy0DtB5VsayxW4KmfenZU3X3lEG//PjdykBw
         0OAHFmlEW8VcX8CGUNt6CoGBODFsxDCcTgaepf0NHWuFHUK86ih3PNUUg1GLpRb/eFaZ
         bbaGWjkSFUQem+pjDEB1mwohiJS2fjocCtQBGEtjvsYWmIJUc1LVWgcQlGq2zHKOGcS1
         GX9H2ph13/qNw2ADXTvGZ2mkT0RpcJAOBUiMms0cBPlpnpbascnCZxCm6Sz+CoVT/evI
         +k6g==
X-Forwarded-Encrypted: i=1; AJvYcCXw3HiE9wKTxxKbiyO61AowYXa/1MEsRish9TXY2RMEMnipurBCcEX94r0sciFPyz90CF1Vzg1bkQ13673QUCdW@lists.infradead.org
X-Gm-Message-State: AOJu0Yxh5NgHBhqBmVoXWQeQ2NoO9pt+3fOsjcrWo+U6nLL9+8i5vjAC
	8WNbmHD+yVaThbOpJ7MeP2kHqvbwgQJawk/HNGxYdhWz9h0OgUEVDbODWwkISxM=
X-Google-Smtp-Source: AGHT+IHwghEtsWHSIgna9eRpd6cfglYULyLkTu6aW9WjgN7UGabPnfWIpz8Ez2eA6OMZ9FOUKr0wsQ==
X-Received: by 2002:a05:6808:2dc6:b0:3e5:d5c3:e88b with SMTP id 5614622812f47-3e638252a38mr30658820b6e.20.1730754443278;
        Mon, 04 Nov 2024 13:07:23 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7ee490e08f4sm7248293a12.40.2024.11.04.13.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 13:07:22 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 04 Nov 2024 13:06:15 -0800
Subject: [PATCH RFT 13/16] perf tools: mips: Use generic syscall scripts
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241104-perf_syscalltbl-v1-13-9adae5c761ef@rivosinc.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5807; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=OoyBSoSR0YKW97xqx60uS1tbyNrKDGxM4Vocad6xjfw=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ7qmeVzDqo9uN3/P0e+Y+X1GiiP7lWxnO5VU4cipb0t8O
 5kz3nN1lLIwiHEwyIopsvBca2BuvaNfdlS0bALMHFYmkCEMXJwCMBEGAYb/defFH23OC3SMv36g
 U1NugXWUcNuMmNgu5wCu+wzKvy8FMzLs5BRVS1Z/f++7lcHm5Gu/D77wY1nimvjxivmqdWe+3k/
 lAAA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_130726_308923_AF16CF03 
X-CRM114-Status: GOOD (  17.01  )
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
mips.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 tools/perf/Makefile.config                         |  4 +--
 tools/perf/Makefile.perf                           |  2 +-
 tools/perf/arch/mips/Makefile                      | 18 ------------
 tools/perf/arch/mips/entry/syscalls/Kbuild         |  2 ++
 .../arch/mips/entry/syscalls/Makefile.syscalls     |  5 ++++
 tools/perf/arch/mips/entry/syscalls/mksyscalltbl   | 32 ----------------------
 tools/perf/arch/mips/include/syscall_table.h       |  2 ++
 tools/perf/util/syscalltbl.c                       |  4 ---
 8 files changed, 12 insertions(+), 57 deletions(-)

diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index 2cf45e3f2659..ce7e9ae276e8 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -31,12 +31,12 @@ $(call detected_var,SRCARCH)
 ifneq ($(NO_SYSCALL_TABLE),1)
   NO_SYSCALL_TABLE := 1
 
-  ifeq ($(SRCARCH),$(filter $(SRCARCH),powerpc s390 mips))
+  ifeq ($(SRCARCH),$(filter $(SRCARCH),powerpc s390))
     NO_SYSCALL_TABLE := 0
   endif
 
   # architectures that use the generic syscall table scripts
-  ifeq ($(SRCARCH),$(filter $(SRCARCH),riscv arc csky arm sh sparc xtensa x86 alpha parisc arm64 loongarch))
+  ifeq ($(SRCARCH),$(filter $(SRCARCH),riscv arc csky arm sh sparc xtensa x86 alpha parisc arm64 loongarch mips))
     NO_SYSCALL_TABLE := 0
     CFLAGS += -DGENERIC_SYSCALL_TABLE
     CFLAGS += -I$(OUTPUT)arch/$(SRCARCH)/include/generated
diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
index ce2c4e1c0623..c9b78518c9a5 100644
--- a/tools/perf/Makefile.perf
+++ b/tools/perf/Makefile.perf
@@ -311,7 +311,7 @@ FEATURE_TESTS := all
 endif
 endif
 # architectures that use the generic syscall table
-ifeq ($(SRCARCH),$(filter $(SRCARCH),riscv arc csky arm sh sparc xtensa x86 alpha parisc arm64 loongarch))
+ifeq ($(SRCARCH),$(filter $(SRCARCH),riscv arc csky arm sh sparc xtensa x86 alpha parisc arm64 loongarch mips))
 include $(srctree)/tools/perf/scripts/Makefile.syscalls
 endif
 include Makefile.config
diff --git a/tools/perf/arch/mips/Makefile b/tools/perf/arch/mips/Makefile
index cd0b011b3be5..6e1106fab26e 100644
--- a/tools/perf/arch/mips/Makefile
+++ b/tools/perf/arch/mips/Makefile
@@ -2,21 +2,3 @@
 ifndef NO_DWARF
 PERF_HAVE_DWARF_REGS := 1
 endif
-
-# Syscall table generation for perf
-out    := $(OUTPUT)arch/mips/include/generated/asm
-header := $(out)/syscalls_n64.c
-sysprf := $(srctree)/tools/perf/arch/mips/entry/syscalls
-sysdef := $(sysprf)/syscall_n64.tbl
-systbl := $(sysprf)/mksyscalltbl
-
-# Create output directory if not already present
-$(shell [ -d '$(out)' ] || mkdir -p '$(out)')
-
-$(header): $(sysdef) $(systbl)
-	$(Q)$(SHELL) '$(systbl)' $(sysdef) > $@
-
-clean::
-	$(call QUIET_CLEAN, mips) $(RM) $(header)
-
-archheaders: $(header)
diff --git a/tools/perf/arch/mips/entry/syscalls/Kbuild b/tools/perf/arch/mips/entry/syscalls/Kbuild
new file mode 100644
index 000000000000..9a41e3572c3a
--- /dev/null
+++ b/tools/perf/arch/mips/entry/syscalls/Kbuild
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+syscall-y += syscalls_64.h
diff --git a/tools/perf/arch/mips/entry/syscalls/Makefile.syscalls b/tools/perf/arch/mips/entry/syscalls/Makefile.syscalls
new file mode 100644
index 000000000000..9ee914bdfb05
--- /dev/null
+++ b/tools/perf/arch/mips/entry/syscalls/Makefile.syscalls
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0
+
+syscall_abis_64 += n64
+
+syscalltbl = $(srctree)/tools/perf/arch/mips/entry/syscalls/syscall_n64.tbl
diff --git a/tools/perf/arch/mips/entry/syscalls/mksyscalltbl b/tools/perf/arch/mips/entry/syscalls/mksyscalltbl
deleted file mode 100644
index c0d93f959c4e..000000000000
--- a/tools/perf/arch/mips/entry/syscalls/mksyscalltbl
+++ /dev/null
@@ -1,32 +0,0 @@
-#!/bin/sh
-# SPDX-License-Identifier: GPL-2.0
-#
-# Generate system call table for perf. Derived from
-# s390 script.
-#
-# Author(s):  Hendrik Brueckner <brueckner@linux.vnet.ibm.com>
-# Changed by: Tiezhu Yang <yangtiezhu@loongson.cn>
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
-	echo 'static const char *const syscalltbl_mips_n64[] = {'
-	while read nr abi sc discard; do
-		printf '\t[%d] = "%s",\n' $nr $sc
-		max_nr=$nr
-	done
-	echo '};'
-	echo "#define SYSCALLTBL_MIPS_N64_MAX_ID $max_nr"
-}
-
-grep -E "^[[:digit:]]+[[:space:]]+(n64)" $SYSCALL_TBL	\
-	|sort -k1 -n					\
-	|create_table
diff --git a/tools/perf/arch/mips/include/syscall_table.h b/tools/perf/arch/mips/include/syscall_table.h
new file mode 100644
index 000000000000..b53e31c15805
--- /dev/null
+++ b/tools/perf/arch/mips/include/syscall_table.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/syscalls_64.h>
diff --git a/tools/perf/util/syscalltbl.c b/tools/perf/util/syscalltbl.c
index 7c8550ef0d7b..724e1391893f 100644
--- a/tools/perf/util/syscalltbl.c
+++ b/tools/perf/util/syscalltbl.c
@@ -25,10 +25,6 @@ static const char *const *syscalltbl_native = syscalltbl_powerpc_64;
 #include <asm/syscalls_32.c>
 const int syscalltbl_native_max_id = SYSCALLTBL_POWERPC_32_MAX_ID;
 static const char *const *syscalltbl_native = syscalltbl_powerpc_32;
-#elif defined(__mips__)
-#include <asm/syscalls_n64.c>
-const int syscalltbl_native_max_id = SYSCALLTBL_MIPS_N64_MAX_ID;
-static const char *const *syscalltbl_native = syscalltbl_mips_n64;
 #elif defined(GENERIC_SYSCALL_TABLE)
 #include <syscall_table.h>
 const int syscalltbl_native_max_id = SYSCALLTBL_MAX_ID;

-- 
2.34.1


