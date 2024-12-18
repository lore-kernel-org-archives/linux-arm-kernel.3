Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A27F0E77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 09:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nj6/YILuiSz3bRgw8K5LxLTzKJz30pINSFnQS/0yP28=; b=tTueSlq1DOTp9ZlgxnP9fQMEnX
	7oxd5MvDbykDM7q6hIfkVz+X5mtqtaAS9RNd06PmmdeUJX452orTe4OTJfRONqocGKOAz88Wxfion
	P1OL08Y64A2GV9MWQaXHtwbcgBnIZkMM0xRADY2UF3F+BkyKJZMFIRru+MqpbVyEZiDlIAnGtSa0D
	8MPnKwjYiVIAJUHzPTJmQDlSgveTYhidlXXuWTB/AU3LoZSeSi0lC/2CjpnyHjvJFaOMbRvMed6Ph
	D/6ZWP+MlkYX8dbQqvoc/aeLodhFwq80J9UyuuwTr5yAarW7dnV9ClWR+h2wc0L4B71E78aG43j+x
	XRZ7GxbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNqLU-0000000G62W-2ml8;
	Wed, 18 Dec 2024 09:27:56 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNqID-0000000G4nV-2BBw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 09:24:34 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-21644e6140cso58822745ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 01:24:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1734513872; x=1735118672; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nj6/YILuiSz3bRgw8K5LxLTzKJz30pINSFnQS/0yP28=;
        b=L/yF4R0eaklAs9LRPJSxAdGl7WflTk7uJ6/KoQ7L6BQip0WlnnVYIIgBIePDYndgBn
         JfTtjf/1jDbDvwX2tncuiSPmmRrVm0kW6hbK0pRVjhO9llMC2DMBGzW1AFe5NPttaZN8
         a0dWQenP8RIRSxbAwITuoJ+uMtRGkFVfSDzfON16hSf0lb14fruPhChHzvumYiHVyvAn
         QreDmNSYDX+iNPeyrps2q9/e5yWUTVlIGFXbzTFGsfEpmZBF5c9psPu2hZ5XQ3mhL/BY
         BCf4xBPhunX9CODezA1ZbxKtHE/hcKWZHvrrZ4KUOqJYlTVytfzzS9DIVuD6FZePVb4Q
         F2vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734513872; x=1735118672;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nj6/YILuiSz3bRgw8K5LxLTzKJz30pINSFnQS/0yP28=;
        b=AiSLvkU+RqcVfP5eQ/GzYQnYEkNvUkqykzjefW2pJnf/EABAek1jVPtoDIFBoat7/F
         pZEPokz9TCK7plkWN8HOAez//zHIzpfv0o8Gk9Y8chR+/ScNGe52ih0dGKpyxhQYheN7
         PmCtaHrLT8nvImyBTKXRdsLER31NjLXNrhhmNuVHneknp5vTs9+IJ/lNTYOgkowBVBTe
         x/c7t1tvRTtUJ/7eWtHGqNazoTLFzrC1tU6OiXg1MbsQA2iqA22AYwYJqElhX4cFN1Yb
         s/PXECs8l5hPyFRkmxraPyZqXGymlHu2gXmR/eJeTxUAy/fjJ9k3SSxfw8wsj7cyMLcg
         llfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVN7XVTfozq0oOYidywxuDnnvC4HkwivhePqb8zIhONEDhj4a4X/MumZ6riFiFlgofDIgQm/obfd7D+5xlbOtjW@lists.infradead.org
X-Gm-Message-State: AOJu0Yz87oaQKzWi7rYQo0AHq//HAaLnGm4GkKoe9N7Sah36POWk9muS
	DT1LUvXnwYMHYhoKzk5wYJZBmZHVyTdFsCTbO7c2yNtnUzkfv/21MwkOj+b41eI=
X-Gm-Gg: ASbGncuZIpXCyu9VpaFNhE1C8qdmvWLobA26DFZ+AvV0BIwdqk8McN5+CeGc+xm438s
	bd9o9RYZFeThLHV+8oxZ5p1ANUSVUjhxpw0Je3g1J+twvDOWSsSHW/jVxV5FVt3VPoCmRjp0cNT
	GeLgy0vYy6J1HUc883H0tpP5yNlxnVVxUvhTX1bswMSjCvwU9ND3OnmKUqnS0J5eJjHImBvhHAq
	y5EIiU2vnpI46Zia8Swby3kfJtTWGdY6wGYYfWIK+4DKbOvHw/W5gLqOMAZa+Sm0wCMItBf
X-Google-Smtp-Source: AGHT+IEhtkJNUuqYcOVKrRhInclVGwI1wduL0wL1bhvLdKVEYtre3SXMJ70XIRjbVO+NQVZb+hCRFA==
X-Received: by 2002:a17:902:c94f:b0:216:281f:820d with SMTP id d9443c01a7336-218d6fd4bdamr25342235ad.11.1734513872495;
        Wed, 18 Dec 2024 01:24:32 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1e64f90sm72119995ad.241.2024.12.18.01.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 01:24:31 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 18 Dec 2024 01:24:00 -0800
Subject: [PATCH v4 02/16] perf tools: arc: Support generic syscall headers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241218-perf_syscalltbl-v4-2-bc8caef2ca8e@rivosinc.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2837; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=X0SL5q6fWt+9GQtD73LJR9GwlfHvHpAQdAMzHn+mSzc=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ3rSlCMr3t06b/vMLCnUT+ixhjTPiRNtF3rMD5lN+pdQu
 1GO76F1RykLgxgHg6yYIgvPtQbm1jv6ZUdFyybAzGFlAhnCwMUpABOZv5yRYXLJ4uXMjxPM2m1z
 WA9IJoRaS/P+MD9gVm/TntmiH35CgOGf2Wmt09vZeLQusHcJKKy+n+q0J8/Vo3zyXh/u44VuD/g
 5AA==
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_012433_610001_2B7A00CE 
X-CRM114-Status: GOOD (  14.85  )
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

Arc uses the generic syscall table, use that in perf instead of
requiring libaudit.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 tools/perf/Makefile.config                           | 2 +-
 tools/perf/Makefile.perf                             | 3 ++-
 tools/perf/arch/arc/entry/syscalls/Kbuild            | 2 ++
 tools/perf/arch/arc/entry/syscalls/Makefile.syscalls | 3 +++
 tools/perf/arch/arc/include/syscall_table.h          | 2 ++
 5 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index 9ff49aeb4fa5d6015dea068f23ea3a135155eb6e..a09e2245a9ba00db79cf3a65e8772a6cb9b6c78e 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -36,7 +36,7 @@ ifneq ($(NO_SYSCALL_TABLE),1)
   endif
 
   # architectures that use the generic syscall table scripts
-  ifeq ($(SRCARCH),riscv)
+  ifneq ($(filter $(SRCARCH), $(generic_syscall_table_archs)),)
     NO_SYSCALL_TABLE := 0
     CFLAGS += -DGENERIC_SYSCALL_TABLE
     CFLAGS += -I$(OUTPUT)tools/perf/arch/$(SRCARCH)/include/generated
diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
index f5278ed9f778f928436693a14e016c5c3c5171c1..f717e4628d9e4632f53fed16524a659a3e4feea5 100644
--- a/tools/perf/Makefile.perf
+++ b/tools/perf/Makefile.perf
@@ -311,7 +311,8 @@ FEATURE_TESTS := all
 endif
 endif
 # architectures that use the generic syscall table
-ifeq ($(SRCARCH),riscv)
+generic_syscall_table_archs := riscv arc
+ifneq ($(filter $(SRCARCH), $(generic_syscall_table_archs)),)
 include $(srctree)/tools/perf/scripts/Makefile.syscalls
 endif
 include Makefile.config
diff --git a/tools/perf/arch/arc/entry/syscalls/Kbuild b/tools/perf/arch/arc/entry/syscalls/Kbuild
new file mode 100644
index 0000000000000000000000000000000000000000..11707c481a24ecf4e220e51eb1aca890fe929a13
--- /dev/null
+++ b/tools/perf/arch/arc/entry/syscalls/Kbuild
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+syscall-y += syscalls_32.h
diff --git a/tools/perf/arch/arc/entry/syscalls/Makefile.syscalls b/tools/perf/arch/arc/entry/syscalls/Makefile.syscalls
new file mode 100644
index 0000000000000000000000000000000000000000..391d30ab7a831b72d2ed3f2e7966fdbf558a9ed7
--- /dev/null
+++ b/tools/perf/arch/arc/entry/syscalls/Makefile.syscalls
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+syscall_abis_32 += arc time32 renameat stat64 rlimit
diff --git a/tools/perf/arch/arc/include/syscall_table.h b/tools/perf/arch/arc/include/syscall_table.h
new file mode 100644
index 0000000000000000000000000000000000000000..4c942821662d95216765b176a84d5fc7974e1064
--- /dev/null
+++ b/tools/perf/arch/arc/include/syscall_table.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/syscalls_32.h>

-- 
2.34.1


