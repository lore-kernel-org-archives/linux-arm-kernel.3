Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D949A109449D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Mar 2026 23:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Lt+rwRrqT065vfUOo6yVpO/YAP7pOX34Tn4qVl2j8c=; b=J9UidtPaVhblxO8WrsB8bblrtm
	o78rDqT6YgC56AcpE/KNNbNU9y0nkU00Nqe3hzHaL1C36jP8LkWdgv6/osXpo3Fh6Og6yO0q0KWiq
	5027rqxVPn+LKS/tRe0lbKbhrr1u43e9JkDflcuGh/abErAv/tr5vHvrT7ij6sO3pKL96SD1Yux4g
	AMFeuNy6qwEL2/Ga6jjJZWzYDqvAghF3xfZ78sSZFlnsmFo8W7xtc8ZI9t9REC2kfDpp/jm2BJn2b
	klztqWw9seVSBUbBvTSYA3Nn7cBm/E5bo0X5nNzGDNv/y655yYBkVT80/52AOSSVZ3+sNatscMh8W
	viu7yxpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w45yI-0000000Et1o-36IG;
	Sat, 21 Mar 2026 23:43:10 +0000
Received: from mail-dl1-x124a.google.com ([2607:f8b0:4864:20::124a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w45xd-0000000Esoo-003L
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Mar 2026 23:42:30 +0000
Received: by mail-dl1-x124a.google.com with SMTP id a92af1059eb24-12776bebeb3so459083c88.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Mar 2026 16:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774136548; x=1774741348; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0Lt+rwRrqT065vfUOo6yVpO/YAP7pOX34Tn4qVl2j8c=;
        b=M5TyvR30hIHdhPlrCJo2i41RiylP5EsGIDDtIbnDDq46JCCN6MRwbs8V9DZAtZoFGY
         BW583U4sY1kK+uSU7FEEOP4tc4ujFN7fumIQipJGkMR0ZfR2Q42k84fQU025HKbMAdsO
         g/6s6T7fqjCebiM9PkMtlQnhdLZSAqXuXyxWLuIv+j6otacWnQG/BwQE2KPl4TGUEqH3
         kHdxfZiENrvS0Cnmu45xAd1vZ75GMmTZjPYWb/R49nnOyx1N73LIrbsaEBpmBuAlvx9o
         Rg1zMtTUO1SEzShYN586MM7h9Eexl+ga8LrRltaLB5UwU/9tT2whPea/LugjuPbSjnvk
         gANA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774136548; x=1774741348;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0Lt+rwRrqT065vfUOo6yVpO/YAP7pOX34Tn4qVl2j8c=;
        b=s9YxXH9qP4jZECMX0DKmeB945JqFhcX7I7heLPkBVqaRtXWe8mc22ECsSNDF2yqbUL
         157+ucbgebtNyweT4/+NxV+Wpg6Cisqb4iXxlG0ui53pSXyOe8XmUDpYflmrTRGnKISD
         1J2diNUwvgkLmQHA0uGg+U0MvIuFN2ZImx9TpokF4fLzWLzauQtlqgN4Flc6gOEuSF5K
         t9eyByLASZBR/TqgQjFSjW1o3o0a5KBvC+awTTmIKS+KbYPMca8pezgUm3YVgzHzZdFR
         hSD8DHH1WlwDLg1S7hRnzaW1j8y8sY42OPjb8WEvYZ4sO31VjBq7Rx3FH1R/NxwN6IDV
         DnAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCWFtYAgY5fW8D1HJK3K8AdvBUDMF4QIoozntorvCl0cLRdjgtx9WsaFDViDw7qYYVSLEAhUrw7oSQNWTfWAwH@lists.infradead.org
X-Gm-Message-State: AOJu0YxgbINDk3uJxLqWmN/gqEAwNgnafgqjYLT5oOGcfjeMVo4r2Oy8
	ELwrvj+eYfBTDx7NKbjO4rITkH3QHsa29CiAgU3jQ8Vu+MGyEmIzmM2utDWWy2JjRxlzk22SFcy
	B8ovPRPbJTw==
X-Received: from dlbrh17.prod.google.com ([2002:a05:7022:f311:b0:128:d4d5:93c3])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7023:b14:b0:128:e2a9:d97b
 with SMTP id a92af1059eb24-12a726dd9b5mr3614344c88.42.1774136547707; Sat, 21
 Mar 2026 16:42:27 -0700 (PDT)
Date: Sat, 21 Mar 2026 16:42:20 -0700
In-Reply-To: <20260321234220.848859-1-irogers@google.com>
Mime-Version: 1.0
References: <abxs-2rozL1tBEO1@google.com> <20260321234220.848859-1-irogers@google.com>
X-Mailer: git-send-email 2.53.0.959.g497ff81fa9-goog
Message-ID: <20260321234220.848859-3-irogers@google.com>
Subject: [PATCH v1 2/2] tools build: Remove libunwind feature tests
From: Ian Rogers <irogers@google.com>
To: namhyung@kernel.org
Cc: 9erthalion6@gmail.com, acme@kernel.org, adrian.hunter@intel.com, 
	alex@ghiti.fr, alexander.shishkin@linux.intel.com, 
	andrew.jones@oss.qualcomm.com, aou@eecs.berkeley.edu, atrajeev@linux.ibm.com, 
	blakejones@google.com, ctshao@google.com, dapeng1.mi@linux.intel.com, 
	howardchu95@gmail.com, irogers@google.com, james.clark@linaro.org, 
	john.g.garry@oracle.com, jolsa@kernel.org, leo.yan@linux.dev, 
	libunwind-devel@nongnu.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-riscv@lists.infradead.org, mingo@redhat.com, palmer@dabbelt.com, 
	peterz@infradead.org, pjw@kernel.org, shimin.guo@skydio.com, 
	tglozar@redhat.com, tmricht@linux.ibm.com, will@kernel.org, amadio@gentoo.org, 
	yuzhuo@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260321_164229_067659_AB622443 
X-CRM114-Status: GOOD (  10.93  )
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

Libunwind support has been removed from perf, so the feature tests
used to detect its presence are no longer needed. Remove the
test-libunwind-*.c files and their references in the feature Makefile.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/build/feature/Makefile                  | 31 -------------------
 tools/build/feature/test-libunwind-aarch64.c  | 27 ----------------
 tools/build/feature/test-libunwind-arm.c      | 28 -----------------
 .../test-libunwind-debug-frame-aarch64.c      | 17 ----------
 .../feature/test-libunwind-debug-frame-arm.c  | 17 ----------
 .../feature/test-libunwind-debug-frame.c      | 17 ----------
 tools/build/feature/test-libunwind-x86.c      | 28 -----------------
 tools/build/feature/test-libunwind-x86_64.c   | 28 -----------------
 tools/build/feature/test-libunwind.c          | 28 -----------------
 9 files changed, 221 deletions(-)
 delete mode 100644 tools/build/feature/test-libunwind-aarch64.c
 delete mode 100644 tools/build/feature/test-libunwind-arm.c
 delete mode 100644 tools/build/feature/test-libunwind-debug-frame-aarch64.c
 delete mode 100644 tools/build/feature/test-libunwind-debug-frame-arm.c
 delete mode 100644 tools/build/feature/test-libunwind-debug-frame.c
 delete mode 100644 tools/build/feature/test-libunwind-x86.c
 delete mode 100644 tools/build/feature/test-libunwind-x86_64.c
 delete mode 100644 tools/build/feature/test-libunwind.c

diff --git a/tools/build/feature/Makefile b/tools/build/feature/Makefile
index 1fbcb3ce74d2..37b972526987 100644
--- a/tools/build/feature/Makefile
+++ b/tools/build/feature/Makefile
@@ -36,14 +36,6 @@ FILES=                                          \
          test-libtraceevent.bin                 \
          test-libcpupower.bin                   \
          test-libtracefs.bin                    \
-         test-libunwind.bin                     \
-         test-libunwind-debug-frame.bin         \
-         test-libunwind-x86.bin                 \
-         test-libunwind-x86_64.bin              \
-         test-libunwind-arm.bin                 \
-         test-libunwind-aarch64.bin             \
-         test-libunwind-debug-frame-arm.bin     \
-         test-libunwind-debug-frame-aarch64.bin \
          test-pthread-attr-setaffinity-np.bin   \
          test-pthread-barrier.bin		\
          test-stackprotector-all.bin            \
@@ -203,29 +195,6 @@ $(OUTPUT)test-libnuma.bin:
 $(OUTPUT)test-numa_num_possible_cpus.bin:
 	$(BUILD) -lnuma
 
-$(OUTPUT)test-libunwind.bin:
-	$(BUILD) -lelf -llzma
-
-$(OUTPUT)test-libunwind-debug-frame.bin:
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
-
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
deleted file mode 100644
index efb55cdd8d01..000000000000
--- a/tools/build/feature/test-libunwind-debug-frame.c
+++ /dev/null
@@ -1,17 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-#include <libunwind.h>
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
deleted file mode 100644
index 53fd26614ff0..000000000000
--- a/tools/build/feature/test-libunwind.c
+++ /dev/null
@@ -1,28 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-#include <libunwind.h>
-#include <stdlib.h>
-
-extern int UNW_OBJ(dwarf_search_unwind_table) (unw_addr_space_t as,
-                                      unw_word_t ip,
-                                      unw_dyn_info_t *di,
-                                      unw_proc_info_t *pi,
-                                      int need_unwind_info, void *arg);
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
-- 
2.53.0.959.g497ff81fa9-goog


