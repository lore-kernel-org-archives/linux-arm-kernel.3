Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34F6FF357B6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 14:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l6zGB6KXVZgGBJvevzesELin0ooFg0kJVSoJ6gwXlmk=; b=uJKX+uwuN4cnCRbNDqhe0+hIac
	Lp8L6Rmo9IlgiC5apicO1TEwQFGO+0uYPTgNSwNP3iL+R7Yr/S3bdX8AXoFJ5uaDMTwGLHQMfnt+M
	c5ccFRGouEWHy/cNak2Ej8rEToGG4wCYh8U0p/GjBdUWzujab9DGwh9Z3xbWpsJi5r0vDDacTfF0o
	omhDXUkxF+zoQbMFs7t2rNrF1CpaBH4I33ebpLeK2IV6dSy5z6bpPNNEoaUu+D8XAFtSy3yRly3s2
	Wg81pgCRufPGHq1WDqrgbU3ZOc686otkFY9NwWBYCDPFeb5Kv9hgHAG5twpccfhNu08ZbeD1RMOo6
	cd+pSWPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vutQD-00000002CpE-37ds;
	Tue, 24 Feb 2026 14:29:57 +0000
Received: from mail-dy1-x134a.google.com ([2607:f8b0:4864:20::134a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vutQ9-00000002Cmc-3xVT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 14:29:54 +0000
Received: by mail-dy1-x134a.google.com with SMTP id 5a478bee46e88-2ba9f033a5bso49059802eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 06:29:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771943392; x=1772548192; darn=lists.infradead.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l6zGB6KXVZgGBJvevzesELin0ooFg0kJVSoJ6gwXlmk=;
        b=BJ8PI0Aw+MRV9LC+AzuiQeVj4O3fKqZzbrAOOKGo1a2tIV6rFfyGYD0F8fgP0Q9icq
         rKfz2wdX6DrR+wkzDme40rBWOaUE09d1rP6Uj6QHqGz/6qVvLeLpBS1tHUhoNRY4jHxM
         uZJ5F/PiSpUCFocPXSXosvbeU6sAmYh2prr26hII4wfGuBD/sMhwe26x6WKOt5F7FCQc
         p1ROnHRr8O6p5xVnRxdPqlKPeL8ZHz8hp5u+Pu1Ry7IeymG21fSIxwYwTRmpOj7nqc2m
         bvMZhD6JaSR0IOyQneWooFmZrJ83Ry/C2KfHPbek0lzp9PZyqILqczfQBd8cAe5RNPfe
         5/yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771943392; x=1772548192;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l6zGB6KXVZgGBJvevzesELin0ooFg0kJVSoJ6gwXlmk=;
        b=vMdI6drT/JLNuK1w0YwT3FITl7fW/0yyKgAjXBlhRD+CqWzV3FFZwnCxDvKu7wOQmZ
         bAiUnxG2Xb98mrkvvMjyX7J87otfxwIEfgvRsNZRvZW3F8WAlr4Hj+O17n5/ffzGNlyb
         tNOscR3Fhc7Yb3Qey9y6AUkm6zIlnw4WeNrZpv+dKi+zIjahKJesvQ8g6E4LtT8Acw2D
         ELVTioSVOLtZFP/NXvXVJNTYu64KYffc/DLv3gF3zjNDUAs7OS47fTgohYS98xTdr/Mr
         FlAI/BYFqQ1yHkSDCjtpJt6dvkpW6nf/ctHIsM6PUEUSaDAEk+uPh7DAxzr25agGh3Yd
         blOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOUKMnsBXJu2hesLqyAgPsSE7fQXkdQwYxVUuTj/5BpfzTRqpsi+ts9WAI4hOUBYq/2a5C0N8MagqgDDJptZE4@lists.infradead.org
X-Gm-Message-State: AOJu0YxYIlXATZ+UHqvVrkOsmgHkZCAQ2cTWRquRZtatu0eXnTW4bqdm
	b1RUWNBWqs7eMddmFjYSmTmWBjowmlR+t7YnehkFLA4xHdvRtsnXk2V1vEE+2fKi2I5UMa8wKLU
	HKgAMZV9NbA==
X-Received: from dybgx25.prod.google.com ([2002:a05:7301:2419:b0:2ba:7b4a:c331])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:7491:b0:2b7:2f29:648c
 with SMTP id 5a478bee46e88-2bd7b9efb89mr5937089eec.8.1771943392130; Tue, 24
 Feb 2026 06:29:52 -0800 (PST)
Date: Tue, 24 Feb 2026 06:29:31 -0800
In-Reply-To: <20260224142938.26088-1-irogers@google.com>
Mime-Version: 1.0
References: <20260224142938.26088-1-irogers@google.com>
X-Mailer: git-send-email 2.53.0.371.g1d285c8824-goog
Message-ID: <20260224142938.26088-2-irogers@google.com>
Subject: [RFC PATCH v1 1/7] tools build: Deduplicate test-libunwind for
 different architectures
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, Leo Yan <leo.yan@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Dmitrii Dolgov <9erthalion6@gmail.com>, 
	Blake Jones <blakejones@google.com>, Tomas Glozar <tglozar@redhat.com>, 
	Yuzhuo Jing <yuzhuo@google.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>, 
	Shimin Guo <shimin.guo@skydio.com>, Athira Rajeev <atrajeev@linux.ibm.com>, 
	Chun-Tse Shao <ctshao@google.com>, Howard Chu <howardchu95@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, Thomas Richter <tmricht@linux.ibm.com>, 
	libunwind-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_062953_981357_0004B2C2 
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

The separate test files only exist to pass a different #include,
instead have a single source file and pass -include to $(CC) to
include the relevant header file for the architecture being
tested. Generate the rules using a foreach loop. Include tests for all
current libunwind architectures.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/build/feature/Makefile                  | 38 +++++++++----------
 tools/build/feature/test-libunwind-aarch64.c  | 27 -------------
 tools/build/feature/test-libunwind-arm.c      | 28 --------------
 .../test-libunwind-debug-frame-aarch64.c      | 17 ---------
 .../feature/test-libunwind-debug-frame-arm.c  | 17 ---------
 .../feature/test-libunwind-debug-frame.c      |  1 -
 tools/build/feature/test-libunwind-x86.c      | 28 --------------
 tools/build/feature/test-libunwind-x86_64.c   | 28 --------------
 tools/build/feature/test-libunwind.c          |  1 -
 9 files changed, 19 insertions(+), 166 deletions(-)
 delete mode 100644 tools/build/feature/test-libunwind-aarch64.c
 delete mode 100644 tools/build/feature/test-libunwind-arm.c
 delete mode 100644 tools/build/feature/test-libunwind-debug-frame-aarch64.c
 delete mode 100644 tools/build/feature/test-libunwind-debug-frame-arm.c
 delete mode 100644 tools/build/feature/test-libunwind-x86.c
 delete mode 100644 tools/build/feature/test-libunwind-x86_64.c

diff --git a/tools/build/feature/Makefile b/tools/build/feature/Makefile
index 1fbcb3ce74d2..a0b40e826688 100644
--- a/tools/build/feature/Makefile
+++ b/tools/build/feature/Makefile
@@ -204,27 +204,27 @@ $(OUTPUT)test-numa_num_possible_cpus.bin:
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
+LIBUNWIND_ARCHS:=aarch64 arm loongarch64 mips ppc32 ppc64 riscv s390x x86 x86_64
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
2.53.0.371.g1d285c8824-goog


