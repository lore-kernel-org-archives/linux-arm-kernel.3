Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2563E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 06:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cHyl1g0+sRT3I8Hteex+5Qbsh7vI83GUNuysWmoDrBQ=; b=iv4tcHPfQrf9+eS7Mq2k9tAD6r
	A0dXHEHLNQhJbKZXVlEvuZUoGPuw6ODlp+b6Wo4/ORmNfwgSkHBZ79hCUHZrUplMqiO6gdRwWucgA
	DrvLDVyilwizdbb6z8NeytpP+8DuCwTVeMh/hESum6aPjiI87BF/7I3WPF5oQfJtw1LnYjr1Py7vr
	v7Qcu1Bz1Jyh5/Ue2C3K01x1ro6YWvdoEwaiUWU4U+vRBRnQ4eEyhVx9K5Sxp1x+Ug9hU3nb0ryzw
	BV1yIXSk4eBGCngTS7UGlQTyjIc7aEBsFlFQ+hQ3Y1Xnyy7NdQbtnRsAMCaam37X2zz8PYqGdiZai
	KD/BRwrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNRTZ-0000000CUL6-1Lb6;
	Tue, 17 Dec 2024 06:54:37 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNRFK-0000000CQi5-1Tdm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 06:39:55 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-7fdc6e04411so2928813a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Dec 2024 22:39:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1734417594; x=1735022394; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cHyl1g0+sRT3I8Hteex+5Qbsh7vI83GUNuysWmoDrBQ=;
        b=AGvxIpGZ+1JdsuBe7w/0tNc6ngtFEaVqZLUuQlsjUQsqfX5uCNq2PrRUgzscpb4Q7C
         vnKPd0OwrDH0/MAem15DNGe5zJbaZtx7SpM/bFZOHLc0491LkkNm+ttobJ1txRiQJPH0
         Bd/jD/P4CHEwAw7x4ADscD/VXaksq+KfT5qJtjamwJEGIBcn4fTmVrHdOGA/5WtFlVbN
         BhHtgm2Wb8obu7EECbetDnzp43DA8NlN0OOBmM96OitGwMzF83FigISl8UV1oyJzwN+J
         TPHkxKGc/TSNRRgtAHJS5lleEypjBGOs/hcYn2YRUxEBypTsrXvWerJbWTab/nHpog45
         y4zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734417594; x=1735022394;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cHyl1g0+sRT3I8Hteex+5Qbsh7vI83GUNuysWmoDrBQ=;
        b=sUhzQUEa+8mmcAfvDcFIqF3QCEZnGoL+1jsZE9Gdhl+PgCz9uqBupi1AroqVn1B3Sd
         vbXAkyrUafR/Nu75nfBm/ig6PUYgT+K+FgdJZQFJq0cixEsNbCID677gtWdswBaSo/lT
         bdHvqZiWuzlLH08qB3MvBtwlYnHSdBZrdFC3IxciFqm3EB74Gvfd9Tkh9gQWgi0uCv2T
         3kc1wHHXcr0q6C4B11CWPxEBxkZnxqFn73hRIxC+0XGu2qBOXz65nl/xX25ofAOybBLN
         5tRd+ZkbKlPvgZKp/eIhFwfFnwJv+dgH3GVgSwmYjoPdX6mwk15AaaAp+BKnL8wRutTr
         7vSw==
X-Forwarded-Encrypted: i=1; AJvYcCUYeLJfaQyiR/DxJGzzPDrzYhvCO8314KDZcORR8PkSHxFVjUx/7n/0+GmjAAY8jaHaccxL4mwpkQ/bI2BMVIrq@lists.infradead.org
X-Gm-Message-State: AOJu0YyRcCYRSiJZaChLjzwVddFYkdOo9ZNpv0xGGP4PEq+L/Y0Z3p4Y
	Hl7hT26pEwI2FXQ+Pep1OT4f9kz8trudAQ37JzAt3XbIy2eoe8mkJassb7eW14U=
X-Gm-Gg: ASbGncv7yzVrxrOF7pTW5gXmtqHwM3bvij0huWCS8hH2K2i/cGqYt77I/kipwV9rXV8
	LM//P6Ez8S+29VS/W1hJmiG2CZKJu9CMlXQ07woBjooz4ExGoymIeVdCMXEvrhrXcjkOn/7ouvz
	EHefDl3ZSwTjpT+AJvT5LRTGuR7zoLShnj1//ImrWC+lfQ6VqbygKHC/QoelKYbb21ZK7bhhaGe
	cIZlTU4oZ1g7YY5lRt/PFlUS4I4Ln0K7seeYZqZvriSvIvlVqiZN+IoRjkKY7DFSUV7R+qq
X-Google-Smtp-Source: AGHT+IFoaipwC2179ze8wQOpvHmHMFx6ymf7ESylLaD3Rm2XmAXWZ/V8V9e7vcr7pOC2tvAcEDAQBg==
X-Received: by 2002:a17:90b:3512:b0:2ee:f440:53ed with SMTP id 98e67ed59e1d1-2f290dbcbddmr19458064a91.31.1734417593752;
        Mon, 16 Dec 2024 22:39:53 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f142d90d6bsm9179551a91.2.2024.12.16.22.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 22:39:52 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 16 Dec 2024 22:32:58 -0800
Subject: [PATCH v3 13/16] perf tools: mips: Use generic syscall scripts
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241216-perf_syscalltbl-v3-13-239f032481d5@rivosinc.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5118; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=TnnZd5SCCPCHQNsuSYVO2k9/ZD5FlCiOStCtnlFJLqM=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ3qizASWQyaSkWbvJq7mPple35XLHy9yNvzQlulZS22se
 mK2Gfp2lLIwiHEwyIopsvBca2BuvaNfdlS0bALMHFYmkCEMXJwCMJFXGYwMfbP32fHf/VZ80CXh
 mvWJH3PtOPYGp8aoP1zX/LHeY+2qSYwMuy0my3r4i7OkT7631fO/eUa9wu/zG8MjIjQWGk3MdQx
 iAwA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_223954_407082_62CBBFC1 
X-CRM114-Status: GOOD (  16.51  )
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
 tools/perf/Makefile.config                         |  3 +-
 tools/perf/Makefile.perf                           |  2 +-
 tools/perf/arch/mips/entry/syscalls/Kbuild         |  2 ++
 .../arch/mips/entry/syscalls/Makefile.syscalls     |  5 ++++
 tools/perf/arch/mips/entry/syscalls/mksyscalltbl   | 32 ----------------------
 tools/perf/arch/mips/include/syscall_table.h       |  2 ++
 tools/perf/util/syscalltbl.c                       |  4 ---
 7 files changed, 11 insertions(+), 39 deletions(-)

diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index d5e1bd03ae0f9d10df2da25a75eab50eb7334b45..ec2902e8f5f9baf6bed9946a9c7315527b23b8fb 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -31,7 +31,7 @@ $(call detected_var,SRCARCH)
 ifneq ($(NO_SYSCALL_TABLE),1)
   NO_SYSCALL_TABLE := 1
 
-  ifeq ($(SRCARCH),$(filter $(SRCARCH),powerpc s390 mips))
+  ifeq ($(SRCARCH),$(filter $(SRCARCH),powerpc s390))
     NO_SYSCALL_TABLE := 0
   endif
 
@@ -83,7 +83,6 @@ ifeq ($(ARCH),s390)
 endif
 
 ifeq ($(ARCH),mips)
-  CFLAGS += -I$(OUTPUT)arch/mips/include/generated
   LIBUNWIND_LIBS = -lunwind -lunwind-mips
 endif
 
diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
index c85262db770d18828fc3d9dc65eca00733645d41..74c1097f790cba5abfd1f2fbdaf4e7540c553482 100644
--- a/tools/perf/Makefile.perf
+++ b/tools/perf/Makefile.perf
@@ -311,7 +311,7 @@ FEATURE_TESTS := all
 endif
 endif
 # architectures that use the generic syscall table
-generic_syscall_table_archs := riscv arc csky arm sh sparc xtensa x86 alpha parisc arm64 loongarch
+generic_syscall_table_archs := riscv arc csky arm sh sparc xtensa x86 alpha parisc arm64 loongarch mips
 ifneq ($(filter $(SRCARCH), $(generic_syscall_table_archs)),)
 include $(srctree)/tools/perf/scripts/Makefile.syscalls
 endif
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


