Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BF23C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 05:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:References:Mime-Version:Message-Id:In-Reply-To:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hWY3CQdN9GvCFBctugEPOsen4KmaxcXhCNBBJzS7Stg=; b=NPcjBzjIDiE4tI1sx9qsUyLwOX
	QaphAs+U8zAChs7ehom6MUUXV/465ioc42ZefXr7mpczbRAHcLHsq2QbE0kTLyJr4yA1tlPUpWbfu
	pQ+xMSINYKjwNCcEszfNZxD45HDZR31d8fWvn0HJYmgVJL30j9d5IBXbIfMovbTkmIt9/jnD6gPNq
	KgfYqUsLuqmTP8JN8+eF794LeUoI0AmlpPaekmvYEMFNtMp+nH2XbW9dVmlCTnBT1mW1GwRS86zVs
	bub8+uuv1FBWA8c+UVCmr1xLtw7Q0JXi26LpHocyOP4SJ2BpbqHAmNEaMBvxh5LIyaZs+aNKjcx04
	jhAAAVNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpKjA-000000037gk-4Baw;
	Tue, 04 Mar 2025 05:22:01 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpKSU-000000034jg-1uqc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 05:04:48 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-e608e8cadcaso6547256276.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 21:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741064685; x=1741669485; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hWY3CQdN9GvCFBctugEPOsen4KmaxcXhCNBBJzS7Stg=;
        b=k4Rw2+S1EXBZtIR15pzv890ICajei+7+lN1Dou1Uy2DhR/Zg00fmlSTe/jf05Pfofn
         jEOYe/cvqP5ocwIJDzD7BDcYLPZ7hrciI9TdciVv2EXHE//PQj4olOqaiFK9NzFZ3CPR
         KmxCMN7ceUBpLvaq9jvix3/F6oPzVAKOQ3puHjTRi0QR6mkfyY0SW8MUKMTPc5GNmTaX
         /wAl+V6IQ40l0elSMFFyDDH3+ddnutnb9pngfItc8VQ5HfVQTUCRU03ok4L4LKmzggFr
         Es63q5X4tEKSdz43Ay1x9NSimM+ewf8xHilWdSxtBvUmuNBbYZO+iAZc6VcueCaRGtmY
         HL4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741064685; x=1741669485;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hWY3CQdN9GvCFBctugEPOsen4KmaxcXhCNBBJzS7Stg=;
        b=hVPXWdovzUylnjdR/y7/NcTHhw0QO1Tvnz0wY7BFHqK7hIyREuszl4/5sI4poJHxXq
         uvWYGAElroazA5Oxr+y/ehiAHNuctUt734t69g/GD7k6fHq3u9qzAjijGwmnzG7jTuq5
         OffkOHshZZgSg66o11/2NmcgvJn73gf7ezQwNp8HTzEyiDsbsGjESYCgoodUssE6Us8s
         opTDA8vAsBIuqpSvh0mr7IyM9pcY7vxcKWV1Nzse3bW2wHqjHfFEk4Mt4Xvdf/fcorFG
         UM5QVxLEWZeLmVFC6OyNJw9kHaO8C01JLIPSz49ecBhkV7B0umlYzB6eLIu9OORqFKr3
         /i2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVSiTSzLKHk23V45LPG8SMqDqee2gh5l/PKTeZUFKVQ3ArmXejGaSVpTcXtQgS2yoHjpbetUX4R+Z7bOx4hQ9gx@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2JqStm+qbKQ41YC6rklkUna/M598yJmQv8be7eMxGG++qQnBj
	wjZUbHDroOWr5wDIS/syI5mbYNxuaG7xklhmgPJUEMnOD6fnh7RRZ1jP1tl2m/w7uALw9bxkOFr
	GAIsBpQ==
X-Google-Smtp-Source: AGHT+IHh4Pay//m8IdDD/BM9F/1ItK/YFpkg8J2Ryf9cKAEsEfP/xU4ScJslyfFs74xvOqKJyusJ4dQbbTOq
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:8af9:d1f7:bca9:da2])
 (user=irogers job=sendgmr) by 2002:a25:a442:0:b0:e5d:bd27:92a with SMTP id
 3f1490d57ef6-e60b2f332c6mr152091276.4.1741064685190; Mon, 03 Mar 2025
 21:04:45 -0800 (PST)
Date: Mon,  3 Mar 2025 21:03:04 -0800
In-Reply-To: <20250304050305.901167-1-irogers@google.com>
Message-Id: <20250304050305.901167-11-irogers@google.com>
Mime-Version: 1.0
References: <20250304050305.901167-1-irogers@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Subject: [PATCH v4 10/11] perf build: Remove Makefile.syscalls
From: Ian Rogers <irogers@google.com>
To: Ian Rogers <irogers@google.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
	James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>, 
	Leo Yan <leo.yan@linux.dev>, guoren <guoren@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Charlie Jenkins <charlie@rivosinc.com>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Jiri Slaby <jirislaby@kernel.org>, 
	"=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?=" <bjorn@rivosinc.com>, Howard Chu <howardchu95@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, linux-riscv@lists.infradead.org, 
	Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_210446_510649_20772E62 
X-CRM114-Status: GOOD (  14.22  )
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

Now a single beauty file is generated and used by all architectures,
remove the per-architecture Makefiles, Kbuild files and previous
generator script.

Note: there was conversation with Charlie Jenkins
<charlie@rivosinc.com> and they'd written an alternate approach to
support multiple architectures:
https://lore.kernel.org/all/20250114-perf_syscall_arch_runtime-v1-1-5b304e408e11@rivosinc.com/
It would have been better to have helped Charlie fix their series (my
apologies) but they agreed that the approach taken here was likely
best for longer term maintainability:
https://lore.kernel.org/lkml/Z6Jk_UN9i69QGqUj@ghost/

Signed-off-by: Ian Rogers <irogers@google.com>
Reviewed-by: Howard Chu <howardchu95@gmail.com>
Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
---
 tools/perf/Makefile.perf                      |  1 -
 tools/perf/arch/alpha/entry/syscalls/Kbuild   |  2 -
 .../alpha/entry/syscalls/Makefile.syscalls    |  5 --
 tools/perf/arch/arc/entry/syscalls/Kbuild     |  2 -
 .../arch/arc/entry/syscalls/Makefile.syscalls |  3 -
 tools/perf/arch/arm/entry/syscalls/Kbuild     |  4 -
 .../arch/arm/entry/syscalls/Makefile.syscalls |  2 -
 tools/perf/arch/arm64/entry/syscalls/Kbuild   |  3 -
 .../arm64/entry/syscalls/Makefile.syscalls    |  6 --
 tools/perf/arch/csky/entry/syscalls/Kbuild    |  2 -
 .../csky/entry/syscalls/Makefile.syscalls     |  3 -
 .../perf/arch/loongarch/entry/syscalls/Kbuild |  2 -
 .../entry/syscalls/Makefile.syscalls          |  3 -
 tools/perf/arch/mips/entry/syscalls/Kbuild    |  2 -
 .../mips/entry/syscalls/Makefile.syscalls     |  5 --
 tools/perf/arch/parisc/entry/syscalls/Kbuild  |  3 -
 .../parisc/entry/syscalls/Makefile.syscalls   |  6 --
 tools/perf/arch/powerpc/entry/syscalls/Kbuild |  3 -
 .../powerpc/entry/syscalls/Makefile.syscalls  |  6 --
 tools/perf/arch/riscv/entry/syscalls/Kbuild   |  2 -
 .../riscv/entry/syscalls/Makefile.syscalls    |  4 -
 tools/perf/arch/s390/entry/syscalls/Kbuild    |  2 -
 .../s390/entry/syscalls/Makefile.syscalls     |  5 --
 tools/perf/arch/sh/entry/syscalls/Kbuild      |  2 -
 .../arch/sh/entry/syscalls/Makefile.syscalls  |  4 -
 tools/perf/arch/sparc/entry/syscalls/Kbuild   |  3 -
 .../sparc/entry/syscalls/Makefile.syscalls    |  5 --
 tools/perf/arch/x86/entry/syscalls/Kbuild     |  3 -
 .../arch/x86/entry/syscalls/Makefile.syscalls |  6 --
 tools/perf/arch/xtensa/entry/syscalls/Kbuild  |  2 -
 .../xtensa/entry/syscalls/Makefile.syscalls   |  4 -
 tools/perf/scripts/Makefile.syscalls          | 61 ---------------
 tools/perf/scripts/syscalltbl.sh              | 76 -------------------
 33 files changed, 242 deletions(-)
 delete mode 100644 tools/perf/arch/alpha/entry/syscalls/Kbuild
 delete mode 100644 tools/perf/arch/alpha/entry/syscalls/Makefile.syscalls
 delete mode 100644 tools/perf/arch/arc/entry/syscalls/Kbuild
 delete mode 100644 tools/perf/arch/arc/entry/syscalls/Makefile.syscalls
 delete mode 100644 tools/perf/arch/arm/entry/syscalls/Kbuild
 delete mode 100644 tools/perf/arch/arm/entry/syscalls/Makefile.syscalls
 delete mode 100644 tools/perf/arch/arm64/entry/syscalls/Kbuild
 delete mode 100644 tools/perf/arch/arm64/entry/syscalls/Makefile.syscalls
 delete mode 100644 tools/perf/arch/csky/entry/syscalls/Kbuild
 delete mode 100644 tools/perf/arch/csky/entry/syscalls/Makefile.syscalls
 delete mode 100644 tools/perf/arch/loongarch/entry/syscalls/Kbuild
 delete mode 100644 tools/perf/arch/loongarch/entry/syscalls/Makefile.syscalls
 delete mode 100644 tools/perf/arch/mips/entry/syscalls/Kbuild
 delete mode 100644 tools/perf/arch/mips/entry/syscalls/Makefile.syscalls
 delete mode 100644 tools/perf/arch/parisc/entry/syscalls/Kbuild
 delete mode 100644 tools/perf/arch/parisc/entry/syscalls/Makefile.syscalls
 delete mode 100644 tools/perf/arch/powerpc/entry/syscalls/Kbuild
 delete mode 100644 tools/perf/arch/powerpc/entry/syscalls/Makefile.syscalls
 delete mode 100644 tools/perf/arch/riscv/entry/syscalls/Kbuild
 delete mode 100644 tools/perf/arch/riscv/entry/syscalls/Makefile.syscalls
 delete mode 100644 tools/perf/arch/s390/entry/syscalls/Kbuild
 delete mode 100644 tools/perf/arch/s390/entry/syscalls/Makefile.syscalls
 delete mode 100644 tools/perf/arch/sh/entry/syscalls/Kbuild
 delete mode 100644 tools/perf/arch/sh/entry/syscalls/Makefile.syscalls
 delete mode 100644 tools/perf/arch/sparc/entry/syscalls/Kbuild
 delete mode 100644 tools/perf/arch/sparc/entry/syscalls/Makefile.syscalls
 delete mode 100644 tools/perf/arch/x86/entry/syscalls/Kbuild
 delete mode 100644 tools/perf/arch/x86/entry/syscalls/Makefile.syscalls
 delete mode 100644 tools/perf/arch/xtensa/entry/syscalls/Kbuild
 delete mode 100644 tools/perf/arch/xtensa/entry/syscalls/Makefile.syscalls
 delete mode 100644 tools/perf/scripts/Makefile.syscalls
 delete mode 100755 tools/perf/scripts/syscalltbl.sh

diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
index f949ec72f3d2..f3cd8de15d1a 100644
--- a/tools/perf/Makefile.perf
+++ b/tools/perf/Makefile.perf
@@ -339,7 +339,6 @@ ifeq ($(filter feature-dump,$(MAKECMDGOALS)),feature-dump)
 FEATURE_TESTS := all
 endif
 endif
-include $(srctree)/tools/perf/scripts/Makefile.syscalls
 include Makefile.config
 endif
 
diff --git a/tools/perf/arch/alpha/entry/syscalls/Kbuild b/tools/perf/arch/alpha/entry/syscalls/Kbuild
deleted file mode 100644
index 9a41e3572c3a..000000000000
--- a/tools/perf/arch/alpha/entry/syscalls/Kbuild
+++ /dev/null
@@ -1,2 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-syscall-y += syscalls_64.h
diff --git a/tools/perf/arch/alpha/entry/syscalls/Makefile.syscalls b/tools/perf/arch/alpha/entry/syscalls/Makefile.syscalls
deleted file mode 100644
index 690168aac34d..000000000000
--- a/tools/perf/arch/alpha/entry/syscalls/Makefile.syscalls
+++ /dev/null
@@ -1,5 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-
-syscall_abis_64  +=
-
-syscalltbl = $(srctree)/tools/perf/arch/alpha/entry/syscalls/syscall.tbl
diff --git a/tools/perf/arch/arc/entry/syscalls/Kbuild b/tools/perf/arch/arc/entry/syscalls/Kbuild
deleted file mode 100644
index 11707c481a24..000000000000
--- a/tools/perf/arch/arc/entry/syscalls/Kbuild
+++ /dev/null
@@ -1,2 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-syscall-y += syscalls_32.h
diff --git a/tools/perf/arch/arc/entry/syscalls/Makefile.syscalls b/tools/perf/arch/arc/entry/syscalls/Makefile.syscalls
deleted file mode 100644
index 391d30ab7a83..000000000000
--- a/tools/perf/arch/arc/entry/syscalls/Makefile.syscalls
+++ /dev/null
@@ -1,3 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-
-syscall_abis_32 += arc time32 renameat stat64 rlimit
diff --git a/tools/perf/arch/arm/entry/syscalls/Kbuild b/tools/perf/arch/arm/entry/syscalls/Kbuild
deleted file mode 100644
index 9d777540f089..000000000000
--- a/tools/perf/arch/arm/entry/syscalls/Kbuild
+++ /dev/null
@@ -1,4 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-
-syscall_abis_32 += oabi
-syscalltbl = $(srctree)/tools/perf/arch/arm/entry/syscalls/syscall.tbl
diff --git a/tools/perf/arch/arm/entry/syscalls/Makefile.syscalls b/tools/perf/arch/arm/entry/syscalls/Makefile.syscalls
deleted file mode 100644
index 11707c481a24..000000000000
--- a/tools/perf/arch/arm/entry/syscalls/Makefile.syscalls
+++ /dev/null
@@ -1,2 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-syscall-y += syscalls_32.h
diff --git a/tools/perf/arch/arm64/entry/syscalls/Kbuild b/tools/perf/arch/arm64/entry/syscalls/Kbuild
deleted file mode 100644
index 84c6599b4ea6..000000000000
--- a/tools/perf/arch/arm64/entry/syscalls/Kbuild
+++ /dev/null
@@ -1,3 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-syscall-y += syscalls_32.h
-syscall-y += syscalls_64.h
diff --git a/tools/perf/arch/arm64/entry/syscalls/Makefile.syscalls b/tools/perf/arch/arm64/entry/syscalls/Makefile.syscalls
deleted file mode 100644
index e7e78c2d1c02..000000000000
--- a/tools/perf/arch/arm64/entry/syscalls/Makefile.syscalls
+++ /dev/null
@@ -1,6 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-
-syscall_abis_32 +=
-syscall_abis_64 += renameat rlimit memfd_secret
-
-syscalltbl = $(srctree)/tools/perf/arch/arm64/entry/syscalls/syscall_%.tbl
diff --git a/tools/perf/arch/csky/entry/syscalls/Kbuild b/tools/perf/arch/csky/entry/syscalls/Kbuild
deleted file mode 100644
index 11707c481a24..000000000000
--- a/tools/perf/arch/csky/entry/syscalls/Kbuild
+++ /dev/null
@@ -1,2 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-syscall-y += syscalls_32.h
diff --git a/tools/perf/arch/csky/entry/syscalls/Makefile.syscalls b/tools/perf/arch/csky/entry/syscalls/Makefile.syscalls
deleted file mode 100644
index ea2dd10d0571..000000000000
--- a/tools/perf/arch/csky/entry/syscalls/Makefile.syscalls
+++ /dev/null
@@ -1,3 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-
-syscall_abis_32 += csky time32 stat64 rlimit
diff --git a/tools/perf/arch/loongarch/entry/syscalls/Kbuild b/tools/perf/arch/loongarch/entry/syscalls/Kbuild
deleted file mode 100644
index 9a41e3572c3a..000000000000
--- a/tools/perf/arch/loongarch/entry/syscalls/Kbuild
+++ /dev/null
@@ -1,2 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-syscall-y += syscalls_64.h
diff --git a/tools/perf/arch/loongarch/entry/syscalls/Makefile.syscalls b/tools/perf/arch/loongarch/entry/syscalls/Makefile.syscalls
deleted file mode 100644
index 47d32da2aed8..000000000000
--- a/tools/perf/arch/loongarch/entry/syscalls/Makefile.syscalls
+++ /dev/null
@@ -1,3 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-
-syscall_abis_64 +=
diff --git a/tools/perf/arch/mips/entry/syscalls/Kbuild b/tools/perf/arch/mips/entry/syscalls/Kbuild
deleted file mode 100644
index 9a41e3572c3a..000000000000
--- a/tools/perf/arch/mips/entry/syscalls/Kbuild
+++ /dev/null
@@ -1,2 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-syscall-y += syscalls_64.h
diff --git a/tools/perf/arch/mips/entry/syscalls/Makefile.syscalls b/tools/perf/arch/mips/entry/syscalls/Makefile.syscalls
deleted file mode 100644
index 9ee914bdfb05..000000000000
--- a/tools/perf/arch/mips/entry/syscalls/Makefile.syscalls
+++ /dev/null
@@ -1,5 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-
-syscall_abis_64 += n64
-
-syscalltbl = $(srctree)/tools/perf/arch/mips/entry/syscalls/syscall_n64.tbl
diff --git a/tools/perf/arch/parisc/entry/syscalls/Kbuild b/tools/perf/arch/parisc/entry/syscalls/Kbuild
deleted file mode 100644
index 84c6599b4ea6..000000000000
--- a/tools/perf/arch/parisc/entry/syscalls/Kbuild
+++ /dev/null
@@ -1,3 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-syscall-y += syscalls_32.h
-syscall-y += syscalls_64.h
diff --git a/tools/perf/arch/parisc/entry/syscalls/Makefile.syscalls b/tools/perf/arch/parisc/entry/syscalls/Makefile.syscalls
deleted file mode 100644
index ae326fecb83b..000000000000
--- a/tools/perf/arch/parisc/entry/syscalls/Makefile.syscalls
+++ /dev/null
@@ -1,6 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-
-syscall_abis_32  +=
-syscall_abis_64  +=
-
-syscalltbl = $(srctree)/tools/perf/arch/parisc/entry/syscalls/syscall.tbl
diff --git a/tools/perf/arch/powerpc/entry/syscalls/Kbuild b/tools/perf/arch/powerpc/entry/syscalls/Kbuild
deleted file mode 100644
index 84c6599b4ea6..000000000000
--- a/tools/perf/arch/powerpc/entry/syscalls/Kbuild
+++ /dev/null
@@ -1,3 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-syscall-y += syscalls_32.h
-syscall-y += syscalls_64.h
diff --git a/tools/perf/arch/powerpc/entry/syscalls/Makefile.syscalls b/tools/perf/arch/powerpc/entry/syscalls/Makefile.syscalls
deleted file mode 100644
index e35afbc57c79..000000000000
--- a/tools/perf/arch/powerpc/entry/syscalls/Makefile.syscalls
+++ /dev/null
@@ -1,6 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-
-syscall_abis_32 += nospu
-syscall_abis_64 += nospu
-
-syscalltbl = $(srctree)/tools/perf/arch/powerpc/entry/syscalls/syscall.tbl
diff --git a/tools/perf/arch/riscv/entry/syscalls/Kbuild b/tools/perf/arch/riscv/entry/syscalls/Kbuild
deleted file mode 100644
index 9a41e3572c3a..000000000000
--- a/tools/perf/arch/riscv/entry/syscalls/Kbuild
+++ /dev/null
@@ -1,2 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-syscall-y += syscalls_64.h
diff --git a/tools/perf/arch/riscv/entry/syscalls/Makefile.syscalls b/tools/perf/arch/riscv/entry/syscalls/Makefile.syscalls
deleted file mode 100644
index 9668fd1faf60..000000000000
--- a/tools/perf/arch/riscv/entry/syscalls/Makefile.syscalls
+++ /dev/null
@@ -1,4 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-
-syscall_abis_32 += riscv memfd_secret
-syscall_abis_64 += riscv rlimit memfd_secret
diff --git a/tools/perf/arch/s390/entry/syscalls/Kbuild b/tools/perf/arch/s390/entry/syscalls/Kbuild
deleted file mode 100644
index 9a41e3572c3a..000000000000
--- a/tools/perf/arch/s390/entry/syscalls/Kbuild
+++ /dev/null
@@ -1,2 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-syscall-y += syscalls_64.h
diff --git a/tools/perf/arch/s390/entry/syscalls/Makefile.syscalls b/tools/perf/arch/s390/entry/syscalls/Makefile.syscalls
deleted file mode 100644
index 9762d7abf17c..000000000000
--- a/tools/perf/arch/s390/entry/syscalls/Makefile.syscalls
+++ /dev/null
@@ -1,5 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-
-syscall_abis_64 += renameat rlimit memfd_secret
-
-syscalltbl = $(srctree)/tools/perf/arch/s390/entry/syscalls/syscall.tbl
diff --git a/tools/perf/arch/sh/entry/syscalls/Kbuild b/tools/perf/arch/sh/entry/syscalls/Kbuild
deleted file mode 100644
index 11707c481a24..000000000000
--- a/tools/perf/arch/sh/entry/syscalls/Kbuild
+++ /dev/null
@@ -1,2 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-syscall-y += syscalls_32.h
diff --git a/tools/perf/arch/sh/entry/syscalls/Makefile.syscalls b/tools/perf/arch/sh/entry/syscalls/Makefile.syscalls
deleted file mode 100644
index 25080390e4ed..000000000000
--- a/tools/perf/arch/sh/entry/syscalls/Makefile.syscalls
+++ /dev/null
@@ -1,4 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-
-syscall_abis_32 +=
-syscalltbl = $(srctree)/tools/perf/arch/sh/entry/syscalls/syscall.tbl
diff --git a/tools/perf/arch/sparc/entry/syscalls/Kbuild b/tools/perf/arch/sparc/entry/syscalls/Kbuild
deleted file mode 100644
index 84c6599b4ea6..000000000000
--- a/tools/perf/arch/sparc/entry/syscalls/Kbuild
+++ /dev/null
@@ -1,3 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-syscall-y += syscalls_32.h
-syscall-y += syscalls_64.h
diff --git a/tools/perf/arch/sparc/entry/syscalls/Makefile.syscalls b/tools/perf/arch/sparc/entry/syscalls/Makefile.syscalls
deleted file mode 100644
index 212c1800b644..000000000000
--- a/tools/perf/arch/sparc/entry/syscalls/Makefile.syscalls
+++ /dev/null
@@ -1,5 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-
-syscall_abis_32  +=
-syscall_abis_64  +=
-syscalltbl = $(srctree)/tools/perf/arch/sparc/entry/syscalls/syscall.tbl
diff --git a/tools/perf/arch/x86/entry/syscalls/Kbuild b/tools/perf/arch/x86/entry/syscalls/Kbuild
deleted file mode 100644
index 84c6599b4ea6..000000000000
--- a/tools/perf/arch/x86/entry/syscalls/Kbuild
+++ /dev/null
@@ -1,3 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-syscall-y += syscalls_32.h
-syscall-y += syscalls_64.h
diff --git a/tools/perf/arch/x86/entry/syscalls/Makefile.syscalls b/tools/perf/arch/x86/entry/syscalls/Makefile.syscalls
deleted file mode 100644
index db3d5d6d4e56..000000000000
--- a/tools/perf/arch/x86/entry/syscalls/Makefile.syscalls
+++ /dev/null
@@ -1,6 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-
-syscall_abis_32 += i386
-syscall_abis_64 +=
-
-syscalltbl = $(srctree)/tools/perf/arch/x86/entry/syscalls/syscall_%.tbl
diff --git a/tools/perf/arch/xtensa/entry/syscalls/Kbuild b/tools/perf/arch/xtensa/entry/syscalls/Kbuild
deleted file mode 100644
index 11707c481a24..000000000000
--- a/tools/perf/arch/xtensa/entry/syscalls/Kbuild
+++ /dev/null
@@ -1,2 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-syscall-y += syscalls_32.h
diff --git a/tools/perf/arch/xtensa/entry/syscalls/Makefile.syscalls b/tools/perf/arch/xtensa/entry/syscalls/Makefile.syscalls
deleted file mode 100644
index d4aa2358460c..000000000000
--- a/tools/perf/arch/xtensa/entry/syscalls/Makefile.syscalls
+++ /dev/null
@@ -1,4 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-
-syscall_abis_32  +=
-syscalltbl = $(srctree)/tools/perf/arch/xtensa/entry/syscalls/syscall.tbl
diff --git a/tools/perf/scripts/Makefile.syscalls b/tools/perf/scripts/Makefile.syscalls
deleted file mode 100644
index 8bf55333262e..000000000000
--- a/tools/perf/scripts/Makefile.syscalls
+++ /dev/null
@@ -1,61 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-# This Makefile generates headers in
-# tools/perf/arch/$(SRCARCH)/include/generated/asm from the architecture's
-# syscall table. This will either be from the generic syscall table, or from a
-# table that is specific to that architecture.
-
-PHONY := all
-all:
-
-obj := $(OUTPUT)arch/$(SRCARCH)/include/generated/asm
-
-syscall_abis_32  := common,32
-syscall_abis_64  := common,64
-syscalltbl := $(srctree)/tools/scripts/syscall.tbl
-
-# let architectures override $(syscall_abis_%) and $(syscalltbl)
--include $(srctree)/tools/perf/arch/$(SRCARCH)/entry/syscalls/Makefile.syscalls
-include $(srctree)/tools/build/Build.include
--include $(srctree)/tools/perf/arch/$(SRCARCH)/entry/syscalls/Kbuild
-
-systbl := $(srctree)/tools/perf/scripts/syscalltbl.sh
-
-syscall-y   := $(addprefix $(obj)/, $(syscall-y))
-
-# Remove stale wrappers when the corresponding files are removed from generic-y
-old-headers := $(wildcard $(obj)/*.h)
-unwanted    := $(filter-out $(syscall-y),$(old-headers))
-
-quiet_cmd_remove = REMOVE  $(unwanted)
-      cmd_remove = rm -f $(unwanted)
-
-quiet_cmd_systbl = SYSTBL  $@
-      cmd_systbl = $(CONFIG_SHELL) $(systbl) \
-		   $(if $(systbl-args-$*),$(systbl-args-$*),$(systbl-args)) \
-		   --abis $(subst $(space),$(comma),$(strip $(syscall_abis_$*))) \
-		   $< $@
-
-all: $(syscall-y)
-	$(if $(unwanted),$(call cmd,remove))
-	@:
-
-$(obj)/syscalls_%.h: $(syscalltbl) $(systbl) FORCE
-	$(call if_changed,systbl)
-
-targets := $(syscall-y)
-
-# Create output directory. Skip it if at least one old header exists
-# since we know the output directory already exists.
-ifeq ($(old-headers),)
-$(shell mkdir -p $(obj))
-endif
-
-PHONY += FORCE
-
-FORCE:
-
-existing-targets := $(wildcard $(sort $(targets)))
-
--include $(foreach f,$(existing-targets),$(dir $(f)).$(notdir $(f)).cmd)
-
-.PHONY: $(PHONY)
diff --git a/tools/perf/scripts/syscalltbl.sh b/tools/perf/scripts/syscalltbl.sh
deleted file mode 100755
index a39b3013b103..000000000000
--- a/tools/perf/scripts/syscalltbl.sh
+++ /dev/null
@@ -1,76 +0,0 @@
-#!/bin/sh
-# SPDX-License-Identifier: GPL-2.0
-#
-# Generate a syscall table header.
-#
-# Each line of the syscall table should have the following format:
-#
-# NR ABI NAME [NATIVE] [COMPAT]
-#
-# NR       syscall number
-# ABI      ABI name
-# NAME     syscall name
-# NATIVE   native entry point (optional)
-# COMPAT   compat entry point (optional)
-
-set -e
-
-usage() {
-	echo >&2 "usage: $0 [--abis ABIS] INFILE OUTFILE" >&2
-	echo >&2
-	echo >&2 "  INFILE    input syscall table"
-	echo >&2 "  OUTFILE   output header file"
-	echo >&2
-	echo >&2 "options:"
-	echo >&2 "  --abis ABIS        ABI(s) to handle (By default, all lines are handled)"
-	exit 1
-}
-
-# default unless specified by options
-abis=
-
-while [ $# -gt 0 ]
-do
-	case $1 in
-	--abis)
-		abis=$(echo "($2)" | tr ',' '|')
-		shift 2;;
-	-*)
-		echo "$1: unknown option" >&2
-		usage;;
-	*)
-		break;;
-	esac
-done
-
-if [ $# -ne 2 ]; then
-	usage
-fi
-
-infile="$1"
-outfile="$2"
-
-sorted_table=$(mktemp /tmp/syscalltbl.XXXXXX)
-grep -E "^[0-9]+[[:space:]]+$abis" "$infile" | sort -n > $sorted_table
-
-echo "static const char *const syscall_num_to_name[] = {" > $outfile
-# the params are: nr abi name entry compat
-# use _ for intentionally unused variables according to SC2034
-while read nr _ name _ _; do
-	echo "	[$nr] = \"$name\"," >> $outfile
-done < $sorted_table
-echo "};" >> $outfile
-
-echo "static const uint16_t syscall_sorted_names[] = {" >> $outfile
-
-# When sorting by name, add a suffix of 0s upto 20 characters so that system
-# calls that differ with a numerical suffix don't sort before those
-# without. This default behavior of sort differs from that of strcmp used at
-# runtime. Use sed to strip the trailing 0s suffix afterwards.
-grep -E "^[0-9]+[[:space:]]+$abis" "$infile" | awk '{printf $3; for (i = length($3); i < 20; i++) { printf "0"; }; print " " $1}'| sort | sed 's/\([a-zA-Z1-9]\+\)0\+ \([0-9]\+\)/\1 \2/' > $sorted_table
-while read name nr; do
-	echo "	$nr,	/* $name */" >> $outfile
-done < $sorted_table
-echo "};" >> $outfile
-
-rm -f $sorted_table
-- 
2.48.1.711.g2feabab25a-goog


