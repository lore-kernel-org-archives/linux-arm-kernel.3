Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C81DCD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 23:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GF6+meBarktmg9PT7lIng2imybEQb4SO5LqEh3kzy3Y=; b=A8nn680oA0lb/uE1JgTOPQUPJP
	w2yeYQKGZkimEbSLc+HjLGRCVP2TX35G/PkrgE92QM2KmGEiy8hFVvwpf2F+uyrIz1U+uUz5qD7Vr
	wOYFW8urg8R3D5pPgHKE4DjuAxVuP6mGGzQyORl7oKCU3E4p2YrKO9V7E5X53bq6X0EiCYbPwk7Ud
	P11uctvj1lP2uiuTo0De1wb+LBEPLZegFTivY2TsHjYemZJmYCsLNo1CF8uHJg06eA+wqkBg2LcEN
	0L5iJiCYl/OG37S4KdwxGjEfFzFqoniBXDGHQY1WZRSMp6uOugn7Uc4dQ6nVphOQpK6BTOpspQ134
	sS4XVOzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNJ3q-000000042Zr-0Vau;
	Wed, 13 May 2026 23:32:18 +0000
Received: from mail-dy1-x1349.google.com ([2607:f8b0:4864:20::1349])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNJ3h-000000042Rk-3hZX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 23:32:10 +0000
Received: by mail-dy1-x1349.google.com with SMTP id 5a478bee46e88-2ee1da7a13fso9268059eec.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 16:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778715128; x=1779319928; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GF6+meBarktmg9PT7lIng2imybEQb4SO5LqEh3kzy3Y=;
        b=ivOs3W8khRZQrgk/eBk/w7hSE1s6ua8mxmiZCREQJqUrhkPnvTCobyoKkhhoYCQcOV
         4S/XyysGo4ZY6Xh3BPVeGPzXo6jF6jg+6zC5WqADZj3DKgUAYQv9aAS184jpW9/6hmsj
         7TLKJ/i7hOixUi0R+TestlzNExNdao5XJ87IrP4aFx0tX0FXKhLiKcJK5PP7Op4efHZ0
         OBisUHyfhtKuFXFGFdVmLzWAqA5uam5dONxH6744OaAs9Mek9tDgKDb3ZxwtQyvWmL5v
         Fl22q26GtRqH2V8337N5nfIl+GX0xAbBKVwnxt+ia0vLORRp7OrtZyqKWKYO+a2qV8Le
         vO5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778715128; x=1779319928;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GF6+meBarktmg9PT7lIng2imybEQb4SO5LqEh3kzy3Y=;
        b=Q98nk9juaNbJgIPLAvmUVps6Kk8rBqaqW1cnCAxdWhz8iTPJGvflq6XfH1qOf+UtdW
         n/ML23rPsl97QspdDEH1bnC9D1VTheFiL3HpZ0v81ESbecCd8/j76J51/6DYArK9LIW/
         tXp2aNLewPTZouUbtEJDvJ5upLTJ9wJc4S5HzWR/NNZwpf+4AgIMetQzvWRtwYWjqFX5
         krHKzTOUlpYvVTH8OQj0d8hpfluV69t7lHitDzNYPIOgDt5iKH6HbKeczxb+8F6LzBkJ
         N1Nil851zKm/zpLCUmkvCDS0A6ykOSHIQcY2xXtypo3vlYYhVhPtK2OHtY+LFvQn5FJU
         79Mg==
X-Forwarded-Encrypted: i=1; AFNElJ+OPI6v6/0ALF4Ad/1x79MHaKecplK8IsIfSGefrI82H1epYsJw+9CciZzKW6QYcU22GgZSuLYQOC/wOlyjDAcn@lists.infradead.org
X-Gm-Message-State: AOJu0YysS5xceWq2OBxfUSkQJyQRf1CPY/t+Wev7b+ine1mc46N7Lh3u
	KbSxA6g38OvTzvrP2CpQ7u5IEcMeV8Hgpbp45jLGpLKv9xkxxMmMDGbaMPfs/hb75GJl/jHecKy
	qxbp4rl3Paw==
X-Received: from dlbvv13.prod.google.com ([2002:a05:7022:5f0d:b0:128:cfd6:a3c6])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7023:b0a:b0:12d:f0b1:75de
 with SMTP id a92af1059eb24-1349ac70cd0mr2732683c88.22.1778715127777; Wed, 13
 May 2026 16:32:07 -0700 (PDT)
Date: Wed, 13 May 2026 16:31:46 -0700
In-Reply-To: <20260513233151.572332-1-irogers@google.com>
Mime-Version: 1.0
References: <20260413024805.1316480-1-irogers@google.com> <20260513233151.572332-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260513233151.572332-3-irogers@google.com>
Subject: [PATCH v5 2/7] tools build: Deduplicate test-libunwind for different architectures
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
X-CRM114-CacheID: sfid-20260513_163209_929573_B28E5455 
X-CRM114-Status: GOOD (  16.64  )
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

The separate test files only exist to pass a different #include,
instead have a single source file and pass -include to $(CC) to
include the relevant header file for the architecture being
tested. Generate the rules using a foreach loop. Include tests for all
current libunwind architectures.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/build/Makefile.feature                  | 12 ++++-
 tools/build/feature/Makefile                  | 46 +++++++++----------
 tools/build/feature/test-libunwind-aarch64.c  | 27 -----------
 tools/build/feature/test-libunwind-arm.c      | 28 -----------
 .../test-libunwind-debug-frame-aarch64.c      | 17 -------
 .../feature/test-libunwind-debug-frame-arm.c  | 17 -------
 .../feature/test-libunwind-debug-frame.c      |  1 -
 tools/build/feature/test-libunwind-x86.c      | 28 -----------
 tools/build/feature/test-libunwind-x86_64.c   | 28 -----------
 tools/build/feature/test-libunwind.c          |  1 -
 10 files changed, 32 insertions(+), 173 deletions(-)
 delete mode 100644 tools/build/feature/test-libunwind-aarch64.c
 delete mode 100644 tools/build/feature/test-libunwind-arm.c
 delete mode 100644 tools/build/feature/test-libunwind-debug-frame-aarch64.c
 delete mode 100644 tools/build/feature/test-libunwind-debug-frame-arm.c
 delete mode 100644 tools/build/feature/test-libunwind-x86.c
 delete mode 100644 tools/build/feature/test-libunwind-x86_64.c

diff --git a/tools/build/Makefile.feature b/tools/build/Makefile.feature
index 2f192d3bf61b..af79c6cf0229 100644
--- a/tools/build/Makefile.feature
+++ b/tools/build/Makefile.feature
@@ -104,6 +104,9 @@ FEATURE_TESTS_BASIC :=                  \
 
 # FEATURE_TESTS_BASIC + FEATURE_TESTS_EXTRA is the complete list
 # of all feature tests
+
+LIBUNWIND_ARCHS:=aarch64 arm loongarch64 mips ppc32 ppc64 riscv s390x x86 x86_64
+
 FEATURE_TESTS_EXTRA :=                  \
          bionic                         \
          compile-32                     \
@@ -127,7 +130,10 @@ FEATURE_TESTS_EXTRA :=                  \
          libpfm4                        \
          libdebuginfod			\
          clang-bpf-co-re		\
-         bpftool-skeletons
+         bpftool-skeletons		\
+         libunwind			\
+         libunwind-debug-frame		\
+         $(foreach arch,$(LIBUNWIND_ARCHS),libunwind-$(arch) libunwind-debug-frame-$(arch))
 
 
 FEATURE_TESTS ?= $(FEATURE_TESTS_BASIC)
@@ -212,6 +218,10 @@ ifeq ($(feature-all), 1)
   $(call feature_check,compile-x32)
   $(call feature_check,bionic)
   $(call feature_check,libbabeltrace)
+  $(call feature_check,libunwind)
+  $(call feature_check,libunwind-debug-frame)
+  $(foreach arch,$(LIBUNWIND_ARCHS),$(call feature_check,libunwind-$(arch)))
+  $(foreach arch,$(LIBUNWIND_ARCHS),$(call feature_check,libunwind-debug-frame-$(arch)))
 else
   $(foreach feat,$(FEATURE_TESTS),$(call feature_check,$(feat)))
 endif
diff --git a/tools/build/feature/Makefile b/tools/build/feature/Makefile
index 704c687ed3ad..4e4a92ef5e1e 100644
--- a/tools/build/feature/Makefile
+++ b/tools/build/feature/Makefile
@@ -1,6 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0
 include ../../scripts/Makefile.include
 
+LIBUNWIND_ARCHS:=aarch64 arm loongarch64 mips ppc32 ppc64 riscv s390x x86 x86_64
+
 FILES=                                          \
          test-all.bin                           \
          test-backtrace.bin                     \
@@ -38,12 +40,7 @@ FILES=                                          \
          test-libtracefs.bin                    \
          test-libunwind.bin                     \
          test-libunwind-debug-frame.bin         \
-         test-libunwind-x86.bin                 \
-         test-libunwind-x86_64.bin              \
-         test-libunwind-arm.bin                 \
-         test-libunwind-aarch64.bin             \
-         test-libunwind-debug-frame-arm.bin     \
-         test-libunwind-debug-frame-aarch64.bin \
+         $(foreach arch,$(LIBUNWIND_ARCHS),test-libunwind-$(arch).bin test-libunwind-debug-frame-$(arch).bin) \
          test-pthread-attr-setaffinity-np.bin   \
          test-pthread-barrier.bin		\
          test-stackprotector-all.bin            \
@@ -211,27 +208,26 @@ $(OUTPUT)test-numa_num_possible_cpus.bin:
 	$(BUILD) -lnuma
 
 $(OUTPUT)test-libunwind.bin:
-	$(BUILD) -lelf -llzma
+	$(BUILD) -include libunwind.h -lelf -llzma -lunwind
 
 $(OUTPUT)test-libunwind-debug-frame.bin:
-	$(BUILD) -lelf -llzma
-$(OUTPUT)test-libunwind-x86.bin:
-	$(BUILD) -lelf -llzma -lunwind-x86
-
-$(OUTPUT)test-libunwind-x86_64.bin:
-	$(BUILD) -lelf -llzma -lunwind-x86_64
-
-$(OUTPUT)test-libunwind-arm.bin:
-	$(BUILD) -lelf -llzma -lunwind-arm
-
-$(OUTPUT)test-libunwind-aarch64.bin:
-	$(BUILD) -lelf -llzma -lunwind-aarch64
-
-$(OUTPUT)test-libunwind-debug-frame-arm.bin:
-	$(BUILD) -lelf -llzma -lunwind-arm
-
-$(OUTPUT)test-libunwind-debug-frame-aarch64.bin:
-	$(BUILD) -lelf -llzma -lunwind-aarch64
+	$(BUILD) -include libunwind.h -lelf -llzma -lunwind
+
+define LIBUNWIND_RULE
+$$(OUTPUT)test-libunwind-$(1).bin:
+	$$(CC) $$(CFLAGS) -MD -Wall -Werror -include libunwind-$(1).h -o $$@ \
+		test-libunwind.c $$(LDFLAGS) -lelf -llzma -lunwind-$(1) \
+		> $$(@:.bin=.make.output) 2>&1
+
+$$(OUTPUT)test-libunwind-debug-frame-$(1).bin:
+	$$(CC) $$(CFLAGS) -MD -Wall -Werror -include libunwind-$(1).h -o $$@ \
+		test-libunwind-debug-frame.c $$(LDFLAGS) -lelf -llzma -lunwind-$(1) \
+		> $$(@:.bin=.make.output) 2>&1
+
+endef
+$(foreach arch,$(LIBUNWIND_ARCHS), \
+    $(eval $(call LIBUNWIND_RULE,$(arch))) \
+)
 
 $(OUTPUT)test-libslang.bin:
 	$(BUILD) -lslang
diff --git a/tools/build/feature/test-libunwind-aarch64.c b/tools/build/feature/test-libunwind-aarch64.c
deleted file mode 100644
index 323803f49212..000000000000
--- a/tools/build/feature/test-libunwind-aarch64.c
+++ /dev/null
@@ -1,27 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-#include <libunwind-aarch64.h>
-#include <stdlib.h>
-
-extern int UNW_OBJ(dwarf_search_unwind_table) (unw_addr_space_t as,
-					       unw_word_t ip,
-					       unw_dyn_info_t *di,
-					       unw_proc_info_t *pi,
-					       int need_unwind_info, void *arg);
-
-#define dwarf_search_unwind_table UNW_OBJ(dwarf_search_unwind_table)
-
-static unw_accessors_t accessors;
-
-int main(void)
-{
-	unw_addr_space_t addr_space;
-
-	addr_space = unw_create_addr_space(&accessors, 0);
-	if (addr_space)
-		return 0;
-
-	unw_init_remote(NULL, addr_space, NULL);
-	dwarf_search_unwind_table(addr_space, 0, NULL, NULL, 0, NULL);
-
-	return 0;
-}
diff --git a/tools/build/feature/test-libunwind-arm.c b/tools/build/feature/test-libunwind-arm.c
deleted file mode 100644
index cb378b7d6866..000000000000
--- a/tools/build/feature/test-libunwind-arm.c
+++ /dev/null
@@ -1,28 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-#include <libunwind-arm.h>
-#include <stdlib.h>
-
-extern int UNW_OBJ(dwarf_search_unwind_table) (unw_addr_space_t as,
-					       unw_word_t ip,
-					       unw_dyn_info_t *di,
-					       unw_proc_info_t *pi,
-					       int need_unwind_info, void *arg);
-
-
-#define dwarf_search_unwind_table UNW_OBJ(dwarf_search_unwind_table)
-
-static unw_accessors_t accessors;
-
-int main(void)
-{
-	unw_addr_space_t addr_space;
-
-	addr_space = unw_create_addr_space(&accessors, 0);
-	if (addr_space)
-		return 0;
-
-	unw_init_remote(NULL, addr_space, NULL);
-	dwarf_search_unwind_table(addr_space, 0, NULL, NULL, 0, NULL);
-
-	return 0;
-}
diff --git a/tools/build/feature/test-libunwind-debug-frame-aarch64.c b/tools/build/feature/test-libunwind-debug-frame-aarch64.c
deleted file mode 100644
index 36d6646c185e..000000000000
--- a/tools/build/feature/test-libunwind-debug-frame-aarch64.c
+++ /dev/null
@@ -1,17 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-#include <libunwind-aarch64.h>
-#include <stdlib.h>
-
-extern int
-UNW_OBJ(dwarf_find_debug_frame) (int found, unw_dyn_info_t *di_debug,
-				 unw_word_t ip, unw_word_t segbase,
-				 const char *obj_name, unw_word_t start,
-				 unw_word_t end);
-
-#define dwarf_find_debug_frame UNW_OBJ(dwarf_find_debug_frame)
-
-int main(void)
-{
-	dwarf_find_debug_frame(0, NULL, 0, 0, NULL, 0, 0);
-	return 0;
-}
diff --git a/tools/build/feature/test-libunwind-debug-frame-arm.c b/tools/build/feature/test-libunwind-debug-frame-arm.c
deleted file mode 100644
index 8696e48e1268..000000000000
--- a/tools/build/feature/test-libunwind-debug-frame-arm.c
+++ /dev/null
@@ -1,17 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-#include <libunwind-arm.h>
-#include <stdlib.h>
-
-extern int
-UNW_OBJ(dwarf_find_debug_frame) (int found, unw_dyn_info_t *di_debug,
-				 unw_word_t ip, unw_word_t segbase,
-				 const char *obj_name, unw_word_t start,
-				 unw_word_t end);
-
-#define dwarf_find_debug_frame UNW_OBJ(dwarf_find_debug_frame)
-
-int main(void)
-{
-	dwarf_find_debug_frame(0, NULL, 0, 0, NULL, 0, 0);
-	return 0;
-}
diff --git a/tools/build/feature/test-libunwind-debug-frame.c b/tools/build/feature/test-libunwind-debug-frame.c
index efb55cdd8d01..4c57e37004b3 100644
--- a/tools/build/feature/test-libunwind-debug-frame.c
+++ b/tools/build/feature/test-libunwind-debug-frame.c
@@ -1,5 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-#include <libunwind.h>
 #include <stdlib.h>
 
 extern int
diff --git a/tools/build/feature/test-libunwind-x86.c b/tools/build/feature/test-libunwind-x86.c
deleted file mode 100644
index e5e0f6c89637..000000000000
--- a/tools/build/feature/test-libunwind-x86.c
+++ /dev/null
@@ -1,28 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-#include <libunwind-x86.h>
-#include <stdlib.h>
-
-extern int UNW_OBJ(dwarf_search_unwind_table) (unw_addr_space_t as,
-					       unw_word_t ip,
-					       unw_dyn_info_t *di,
-					       unw_proc_info_t *pi,
-					       int need_unwind_info, void *arg);
-
-
-#define dwarf_search_unwind_table UNW_OBJ(dwarf_search_unwind_table)
-
-static unw_accessors_t accessors;
-
-int main(void)
-{
-	unw_addr_space_t addr_space;
-
-	addr_space = unw_create_addr_space(&accessors, 0);
-	if (addr_space)
-		return 0;
-
-	unw_init_remote(NULL, addr_space, NULL);
-	dwarf_search_unwind_table(addr_space, 0, NULL, NULL, 0, NULL);
-
-	return 0;
-}
diff --git a/tools/build/feature/test-libunwind-x86_64.c b/tools/build/feature/test-libunwind-x86_64.c
deleted file mode 100644
index 62ae4db597dc..000000000000
--- a/tools/build/feature/test-libunwind-x86_64.c
+++ /dev/null
@@ -1,28 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-#include <libunwind-x86_64.h>
-#include <stdlib.h>
-
-extern int UNW_OBJ(dwarf_search_unwind_table) (unw_addr_space_t as,
-					       unw_word_t ip,
-					       unw_dyn_info_t *di,
-					       unw_proc_info_t *pi,
-					       int need_unwind_info, void *arg);
-
-
-#define dwarf_search_unwind_table UNW_OBJ(dwarf_search_unwind_table)
-
-static unw_accessors_t accessors;
-
-int main(void)
-{
-	unw_addr_space_t addr_space;
-
-	addr_space = unw_create_addr_space(&accessors, 0);
-	if (addr_space)
-		return 0;
-
-	unw_init_remote(NULL, addr_space, NULL);
-	dwarf_search_unwind_table(addr_space, 0, NULL, NULL, 0, NULL);
-
-	return 0;
-}
diff --git a/tools/build/feature/test-libunwind.c b/tools/build/feature/test-libunwind.c
index 53fd26614ff0..5af5dc3a73d4 100644
--- a/tools/build/feature/test-libunwind.c
+++ b/tools/build/feature/test-libunwind.c
@@ -1,5 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-#include <libunwind.h>
 #include <stdlib.h>
 
 extern int UNW_OBJ(dwarf_search_unwind_table) (unw_addr_space_t as,
-- 
2.54.0.563.g4f69b47b94-goog


