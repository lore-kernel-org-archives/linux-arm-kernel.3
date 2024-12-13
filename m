Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C77CE77183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 02:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S2idtNdPI7nInDelrf+RzTQSMc2p9eCa1XxS9I9D/38=; b=aZBmU7xWRyDJOUG6WgSxsXK9K9
	Xbf+l+KhIcA8RznnwZ0ZfLItm8C6wZDdgSRDZXvxJvcRywFclBgJT5EmedtL9zslyGqm0z2GYlMJa
	yOoWy4kyIdv1Vp0g6i+WqOdueAMuEHuk40hVY196Foe2KYkG1SJ6PUH/TbkAJrtwaJ70i30O4BVE3
	2ciGyeGHx77/YXC/00PlFWF29RsjjdPNE4IlGuDGBbCN/yl8385ZL+ozEkPRIWHJXPtMO3yrFozNi
	d1WjWYCS7NOEH+lQC1iEj/hRpZ77dmHsEA5bbU2OaHDBv9L1eXRWn3gkKTy8JdgaSuB2wx0ijtmhX
	PAcfLJVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLuyp-00000002SaE-17yF;
	Fri, 13 Dec 2024 02:00:35 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLtck-00000002IGi-0tAg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 00:33:43 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-2efa806acfdso941750a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 16:33:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1734050022; x=1734654822; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S2idtNdPI7nInDelrf+RzTQSMc2p9eCa1XxS9I9D/38=;
        b=y1PTd5IRdwWYWn7xOSGZ6rg+LnB4samF+uhPQID3/b/WiK9l3ZxrUhW3HVnLnTh+J9
         fKqIwybN79gQ2qzoaCwsyaXjbyQYWXrIxLTcpYs0PjZOUsGxtI36z88ghrMgutsI6apb
         VwCV9c04mxKhUoKwUB0tcBx6tSwSKPN8EAlzctOqe5INFkg7YQE4vIX7UTaTULE1k0/k
         WVM42IHXnbG2OzaRh7/i70EwNYh0ChKz0dkhe4YUamuT5LKFRyjd/EzrV5qldBXZ/Cim
         fxBA0ihtSrUpseGjxc1rXUCC1TR6hK7wYT40Rmf7Fe1mUCBa6NaBmVxU0tQUDNyGvFET
         FOrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734050022; x=1734654822;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S2idtNdPI7nInDelrf+RzTQSMc2p9eCa1XxS9I9D/38=;
        b=WZw3GmPzawXsIG9cyZgBBeJ/xuhvJaPQv5VikvT2cb2xAP0s9CVzZy8tyh8ul14Bhr
         DpFC244V1oMDnqe3vI1HFDY/+W/fkWs7MmhRG36X/A5CAN1nLQVpDUTzwzJiaawqd8pd
         leQ/IEypHFXl0kBpc0JQ2VTVnDiZG09XrSYffcDZELs7qFp3ndjXoB4RFFOb1erbYjdU
         /Sel10dRrG5vl7KNQo0h5RP6r5ANirxjAHkMD4axpciky2LYu7MGcHyzBynqhilhuMdd
         jWMvzcrB9X8TVN7WlG2+ZrUJL3KbejEb3UayJEoHM/0D4jBbbpWijzoDF7B3E8Ifppfu
         CmGw==
X-Forwarded-Encrypted: i=1; AJvYcCVpAOuDV2lG2MjAzKzYtojQX81bshuLD/Ai/vD4F2RlB2kk/u1Ygcgw7sz90bchnhBVoG6R3CVRyn/aMlM7Uj+Q@lists.infradead.org
X-Gm-Message-State: AOJu0YzBfWsrRp4t6u0isvY6afuEVstxv9/YMerQLF1WUNjPJMaa5I4S
	1JhZ9EePwUe5BE9rUgsS3Z7Laqrqw3Z1UimSEK/wV6SRlZGrjCUQaPQ6O0g9EC4=
X-Gm-Gg: ASbGnctPHU8NL/j5ktoh8rr0eeWmAoQ8fOCZ3rRW4D75axgpiPl/eLo0WoxwgzqNpDc
	VOdd9h1jW06BIrQwbAOgsoArBn/K3So+Dc5GI9+q00Bu7UsP8a1l4nE2zNrSoJ+JCKAjupzAoWC
	t2So/ki5242yysIwyTvQHyYjBtMqFSIB5r72+FtySWZ8LWTVFkzM2vliJRuhlXtkIAwBnHZa6kB
	hsF4YK6h++mflRh0yujDN9S2R8qeq18ZSh08MCDnMbWhfALsmAs6q9lPolG6yOT9B+Vv6bu
X-Google-Smtp-Source: AGHT+IF6BURL1n4KGxBBXYaFHFvEAEgkwIEbZP9XzYad/neAWQoyVE5vKYzrvukdADh1RKZudrbbcA==
X-Received: by 2002:a17:90b:2f8d:b0:2ee:cd83:8fe7 with SMTP id 98e67ed59e1d1-2f2901b268bmr1191557a91.35.1734050021702;
        Thu, 12 Dec 2024 16:33:41 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f142e0ce50sm1934462a91.39.2024.12.12.16.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 16:33:40 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 12 Dec 2024 16:33:03 -0800
Subject: [PATCH v2 13/16] perf tools: mips: Use generic syscall scripts
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-perf_syscalltbl-v2-13-f8ca984ffe40@rivosinc.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5531; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=8jL6WlIkbrQRkhOaXlyZOazSVy7Wwmif0Dswgn5tqQU=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ3p0wwFOt/4g6/kMAhbTf/8p13DiuffjIdMmf8fMKR5qZ
 SlxdVkdpSwMYhwMsmKKLDzXGphb7+iXHRUtmwAzh5UJZAgDF6cATGSvFiPD212lr27ftpdsPifR
 Ef5Q+pvhdVM5l8BJ7wXVKuY0xcw9zPC/sO3c7qj53Gbyb47WB7C1z36z1awvRqT10478lo3GiT8
 ZAA==
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_163342_286751_6EBA283B 
X-CRM114-Status: GOOD (  16.32  )
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
 tools/perf/Makefile.config                         |  5 ++--
 tools/perf/Makefile.perf                           |  2 +-
 tools/perf/arch/mips/entry/syscalls/Kbuild         |  2 ++
 .../arch/mips/entry/syscalls/Makefile.syscalls     |  5 ++++
 tools/perf/arch/mips/entry/syscalls/mksyscalltbl   | 32 ----------------------
 tools/perf/arch/mips/include/syscall_table.h       |  2 ++
 tools/perf/util/syscalltbl.c                       |  4 ---
 7 files changed, 12 insertions(+), 40 deletions(-)

diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index 84ed266ce54f5291af5c59c02ccb06bfe17d840f..09c4bb713648a9ca3c5223910bd7634fe8234e52 100644
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
     CFLAGS += -I$(OUTPUT)/tools/perf/arch/$(SRCARCH)/include/generated
@@ -83,7 +83,6 @@ ifeq ($(ARCH),s390)
 endif
 
 ifeq ($(ARCH),mips)
-  CFLAGS += -I$(OUTPUT)arch/mips/include/generated
   LIBUNWIND_LIBS = -lunwind -lunwind-mips
 endif
 
diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
index 7fefeea1799231af61e77c9372318e025bed078a..b5a5f04a373e174269fe5ae8a7e8707e0b7e5835 100644
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
diff --git a/tools/perf/arch/mips/entry/syscalls/Kbuild b/tools/perf/arch/mips/entry/syscalls/Kbuild
new file mode 100644
index 0000000000000000000000000000000000000000..9a41e3572c3afd4f202321fd9e492714540e8fd3
--- /dev/null
+++ b/tools/perf/arch/mips/entry/syscalls/Kbuild
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+syscall-y += syscalls_64.h
diff --git a/tools/perf/arch/mips/entry/syscalls/Makefile.syscalls b/tools/perf/arch/mips/entry/syscalls/Makefile.syscalls
new file mode 100644
index 0000000000000000000000000000000000000000..9ee914bdfb05860fdd37a49f1ced03fcf2c9ed78
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
index c0d93f959c4e1b8c12edcb5624bbc131231df7e3..0000000000000000000000000000000000000000
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
index 0000000000000000000000000000000000000000..b53e31c15805319a01719c22d489c4037378b02b
--- /dev/null
+++ b/tools/perf/arch/mips/include/syscall_table.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/syscalls_64.h>
diff --git a/tools/perf/util/syscalltbl.c b/tools/perf/util/syscalltbl.c
index 3001386e13a502be5279aa6e4742af0b96202b35..675702d686d0d1b53dd3ee2017cc9695686b9c63 100644
--- a/tools/perf/util/syscalltbl.c
+++ b/tools/perf/util/syscalltbl.c
@@ -26,10 +26,6 @@ static const char *const *syscalltbl_native = syscalltbl_powerpc_64;
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


