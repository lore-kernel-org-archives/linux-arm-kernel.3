Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6D1AC35FF1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 05:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Mime-Version:Message-Id:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eNtYmofX3K48v9+AGNAWv8ZUFVTmB3LX6qkU47Fxf4Y=; b=V5t5uG3G5bQ4shs8+Sc+F1OwUc
	ACRo6xxzxW2qsDo0nQ3mpE7vrcfJ6ZfE8veZydoVfTYCV6JrZx+R4JD+p5r4ZJ1E0c6vHBdMScHXZ
	T5VNWTxrBP6SkfmIdpLAMo/RY/Lv4kw2Sx1v74XlYDZsIr2q21PRDbxsffNjHk2UUKhVoTAMkypQY
	OtYp5503q6oqLIGUnEfx1nJGdOEut9cwyNX/RyAf6FGMdoUleKZmNG5mKNghffvyMyzgGV1cKl0d7
	ufAd4wyIbG/p2r9Le/K4w/6b84KTXt+YMGNWMdKFg76PjKYPAh63WMWQQoTpUrmXIaT/2Ht9/sl71
	I8K5d/ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tulgJ-00000008184-1Dh3;
	Wed, 19 Mar 2025 05:09:31 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tulec-000000080fG-1fYJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 05:07:47 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e54da6701d2so9482539276.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 22:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742360865; x=1742965665; darn=lists.infradead.org;
        h=to:from:subject:mime-version:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eNtYmofX3K48v9+AGNAWv8ZUFVTmB3LX6qkU47Fxf4Y=;
        b=gVEML0qn+fNbT9Q/5+XQ/YkYO65t0H8b1r74ostXFkDIhtsZ16MeTo5lqSKJMKG/cm
         9qxj6agJfCffTIDiLJRz1bNP/VQYZfHzvQEbugOWhUV3kwq/Tw01HWd9VyB5emhB1MTx
         RZQl2hE2kQ6PZwY3XEC8gwbCrxT49D+cZaB07qR5MmbhXtUcC6lLT2t7ypisS0nwLvsD
         u3mnVaI8TgGeppxY4HXBl+VPJgvwAyeuZf048jiXS3gaXrnBxhHeUrY4uhHWSyLQZqTR
         h3dy4NjkbjrA5AT/VO5+8Ac77XgyrnVE/JshEfRY2F8gZDG+o/aKJwGLp0Lr3F/eougZ
         E96w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742360865; x=1742965665;
        h=to:from:subject:mime-version:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eNtYmofX3K48v9+AGNAWv8ZUFVTmB3LX6qkU47Fxf4Y=;
        b=TZN0PSkdoh3S8nZwJ/N1nlzVeoOWKY1zaa4n8xC6WwmHN5jCETVAPrQ/oV/1d7dOUV
         gTDYGUOU4T7Nb/w3QoX88AOhzemXjUIDaFXfLSi7DxbzIWB/OeGZLWhDr6KY0VPoMBVa
         O3dXckB2SjdcJSMTHf66HyHxeFwefvhs+RvQhtopwjROs/LYfB+acPA8z+yANZ8xlf8f
         r8EAuMkEyQU/P8JcV98GXufbcvUbVeKJ0GJNfE2T4FcixvJOxmAEnaqE8WxhMn/5bELx
         tHMv+xJMHZu9oV6aoFw1CUqYJCWWoTuK9tMAgJ4nAC1doTl40Px/gV1tUA9HqdPWqOLW
         2nsg==
X-Forwarded-Encrypted: i=1; AJvYcCUOIZwBuSvEVmwZIxPyce19Xo0muSQDdjsGncJqHUn4rvfErps2dOcJDEnmpayWxXswik8tqCGT1uwHD/XRSjFd@lists.infradead.org
X-Gm-Message-State: AOJu0YxK3czVfyREAF5hKcdZcCTboDmuX3s+Rr8gK7ym6QiCz1TVZMnd
	8d9tk+sPBmP9zdGuZkourM+IlZUaljuFyB1RZuC/PjGT/0RAzPir7zWBF6h/bKbNkYtEtfnkvhw
	fwYpMpg==
X-Google-Smtp-Source: AGHT+IGtpPuFltr/p+kdPTp/+U20Cs8VXoC5JAcFj/P4uwgj6DWWoUWkCHY+B2XS9Ko2a3d4z9Cm3Vt2RGN7
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:8a11:10b5:af90:6031])
 (user=irogers job=sendgmr) by 2002:a25:6b0e:0:b0:e5d:bd8b:4223 with SMTP id
 3f1490d57ef6-e667b3a1d44mr965276.1.1742360864085; Tue, 18 Mar 2025 22:07:44
 -0700 (PDT)
Date: Tue, 18 Mar 2025 22:07:27 -0700
Message-Id: <20250319050741.269828-1-irogers@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.rc1.451.g8f38331e32-goog
Subject: [PATCH v7 00/14] perf: Support multiple system call tables in the build
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
X-CRM114-CacheID: sfid-20250318_220746_461275_912AA9A9 
X-CRM114-Status: GOOD (  23.48  )
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

This work builds on the clean up of system call tables and removal of
libaudit by Charlie Jenkins <charlie@rivosinc.com>.

The system call table in perf trace is used to map system call numbers
to names and vice versa. Prior to these changes, a single table
matching the perf binary's build was present. The table would be
incorrect if tracing say a 32-bit binary from a 64-bit version of
perf, the names and numbers wouldn't match.

Change the build so that a single system call file is built and the
potentially multiple tables are identifiable from the ELF machine type
of the process being examined. To determine the ELF machine type, the
executable's maps are searched and the associated DSOs ELF headers are
read. When this fails and when live, /proc/pid/exe's ELF header is
read. Fallback to using the perf's binary type when unknown.

Remove some runtime types used by the system call tables and make
equivalents generated at build time.

v7: Rebase for dso data locking changes. Don't NULL check before
    btf__free (Arnaldo). Add patch to clean up perf trace's evlist to
    make leak sanitizer happier.

v6: Incorporate Namhyung's fixes:
    https://lore.kernel.org/lkml/Z9PCjQ8PhOadVGQ8@google.com/
    https://lore.kernel.org/lkml/Z9YHCzINiu4uBQ8B@google.com/
    Which highlighted an issue with syscall pointers becoming
    stale. Add a patch 12 to make the syscall table a table of
    pointers that don't move so that struct syscalls don't move. Add a
    patch 13 fixing a BTF memory leak.

v5: Add byte swap to dso__e_machine and fix comment as suggested by
    Namhyung.

v4: Add reading the e_machine from the thread's maps dsos, only read
    from /proc/pid/exe on failure and when live as requested by
    Namhyung. Add patches to add dso comments and remove unused
    dso_data variables that are unused without libunwind.

v3: Add Charlie's reviewed-by tags. Incorporate feedback from Arnd
    Bergmann <arnd@arndb.de> on additional optional column and MIPS
    system call numbering. Rebase past Namhyung's global system call
    statistics and add comments that they don't yet support an
    e_machine other than EM_HOST.

v2: Change the 1 element cache for the last table as suggested by
    Howard Chu, add Howard's reviewed-by tags.
    Add a comment and apology to Charlie for not doing better in
    guiding:
    https://lore.kernel.org/all/20250114-perf_syscall_arch_runtime-v1-1-5b304e408e11@rivosinc.com/
    After discussion on v1 and he agreed this patch series would be
    the better direction.

Ian Rogers (14):
  perf dso: Move libunwind dso_data variables into ifdef
  perf dso: kernel-doc for enum dso_binary_type
  perf syscalltbl: Remove syscall_table.h
  perf trace: Reorganize syscalls
  perf syscalltbl: Remove struct syscalltbl
  perf dso: Add support for reading the e_machine type for a dso
  perf thread: Add support for reading the e_machine type for a thread
  perf trace beauty: Add syscalltbl.sh generating all system call tables
  perf syscalltbl: Use lookup table containing multiple architectures
  perf build: Remove Makefile.syscalls
  perf syscalltbl: Mask off ABI type for MIPS system calls
  perf trace: Make syscall table stable
  perf trace: Fix BTF memory leak
  perf trace: Fix evlist memory leak

 tools/perf/Makefile.perf                      |  10 +-
 tools/perf/arch/alpha/entry/syscalls/Kbuild   |   2 -
 .../alpha/entry/syscalls/Makefile.syscalls    |   5 -
 tools/perf/arch/alpha/include/syscall_table.h |   2 -
 tools/perf/arch/arc/entry/syscalls/Kbuild     |   2 -
 .../arch/arc/entry/syscalls/Makefile.syscalls |   3 -
 tools/perf/arch/arc/include/syscall_table.h   |   2 -
 tools/perf/arch/arm/entry/syscalls/Kbuild     |   4 -
 .../arch/arm/entry/syscalls/Makefile.syscalls |   2 -
 tools/perf/arch/arm/include/syscall_table.h   |   2 -
 tools/perf/arch/arm64/entry/syscalls/Kbuild   |   3 -
 .../arm64/entry/syscalls/Makefile.syscalls    |   6 -
 tools/perf/arch/arm64/include/syscall_table.h |   8 -
 tools/perf/arch/csky/entry/syscalls/Kbuild    |   2 -
 .../csky/entry/syscalls/Makefile.syscalls     |   3 -
 tools/perf/arch/csky/include/syscall_table.h  |   2 -
 .../perf/arch/loongarch/entry/syscalls/Kbuild |   2 -
 .../entry/syscalls/Makefile.syscalls          |   3 -
 .../arch/loongarch/include/syscall_table.h    |   2 -
 tools/perf/arch/mips/entry/syscalls/Kbuild    |   2 -
 .../mips/entry/syscalls/Makefile.syscalls     |   5 -
 tools/perf/arch/mips/include/syscall_table.h  |   2 -
 tools/perf/arch/parisc/entry/syscalls/Kbuild  |   3 -
 .../parisc/entry/syscalls/Makefile.syscalls   |   6 -
 .../perf/arch/parisc/include/syscall_table.h  |   8 -
 tools/perf/arch/powerpc/entry/syscalls/Kbuild |   3 -
 .../powerpc/entry/syscalls/Makefile.syscalls  |   6 -
 .../perf/arch/powerpc/include/syscall_table.h |   8 -
 tools/perf/arch/riscv/entry/syscalls/Kbuild   |   2 -
 .../riscv/entry/syscalls/Makefile.syscalls    |   4 -
 tools/perf/arch/riscv/include/syscall_table.h |   8 -
 tools/perf/arch/s390/entry/syscalls/Kbuild    |   2 -
 .../s390/entry/syscalls/Makefile.syscalls     |   5 -
 tools/perf/arch/s390/include/syscall_table.h  |   2 -
 tools/perf/arch/sh/entry/syscalls/Kbuild      |   2 -
 .../arch/sh/entry/syscalls/Makefile.syscalls  |   4 -
 tools/perf/arch/sh/include/syscall_table.h    |   2 -
 tools/perf/arch/sparc/entry/syscalls/Kbuild   |   3 -
 .../sparc/entry/syscalls/Makefile.syscalls    |   5 -
 tools/perf/arch/sparc/include/syscall_table.h |   8 -
 tools/perf/arch/x86/entry/syscalls/Kbuild     |   3 -
 .../arch/x86/entry/syscalls/Makefile.syscalls |   6 -
 tools/perf/arch/x86/include/syscall_table.h   |   8 -
 tools/perf/arch/xtensa/entry/syscalls/Kbuild  |   2 -
 .../xtensa/entry/syscalls/Makefile.syscalls   |   4 -
 .../perf/arch/xtensa/include/syscall_table.h  |   2 -
 tools/perf/builtin-trace.c                    | 339 ++++++++++++------
 tools/perf/scripts/Makefile.syscalls          |  61 ----
 tools/perf/scripts/syscalltbl.sh              |  86 -----
 tools/perf/trace/beauty/syscalltbl.sh         | 274 ++++++++++++++
 tools/perf/util/dso.c                         |  89 +++++
 tools/perf/util/dso.h                         |  62 ++++
 tools/perf/util/symbol-elf.c                  |  27 --
 tools/perf/util/syscalltbl.c                  | 148 ++++----
 tools/perf/util/syscalltbl.h                  |  22 +-
 tools/perf/util/thread.c                      |  80 +++++
 tools/perf/util/thread.h                      |  14 +-
 57 files changed, 839 insertions(+), 543 deletions(-)
 delete mode 100644 tools/perf/arch/alpha/entry/syscalls/Kbuild
 delete mode 100644 tools/perf/arch/alpha/entry/syscalls/Makefile.syscalls
 delete mode 100644 tools/perf/arch/alpha/include/syscall_table.h
 delete mode 100644 tools/perf/arch/arc/entry/syscalls/Kbuild
 delete mode 100644 tools/perf/arch/arc/entry/syscalls/Makefile.syscalls
 delete mode 100644 tools/perf/arch/arc/include/syscall_table.h
 delete mode 100644 tools/perf/arch/arm/entry/syscalls/Kbuild
 delete mode 100644 tools/perf/arch/arm/entry/syscalls/Makefile.syscalls
 delete mode 100644 tools/perf/arch/arm/include/syscall_table.h
 delete mode 100644 tools/perf/arch/arm64/entry/syscalls/Kbuild
 delete mode 100644 tools/perf/arch/arm64/entry/syscalls/Makefile.syscalls
 delete mode 100644 tools/perf/arch/arm64/include/syscall_table.h
 delete mode 100644 tools/perf/arch/csky/entry/syscalls/Kbuild
 delete mode 100644 tools/perf/arch/csky/entry/syscalls/Makefile.syscalls
 delete mode 100644 tools/perf/arch/csky/include/syscall_table.h
 delete mode 100644 tools/perf/arch/loongarch/entry/syscalls/Kbuild
 delete mode 100644 tools/perf/arch/loongarch/entry/syscalls/Makefile.syscalls
 delete mode 100644 tools/perf/arch/loongarch/include/syscall_table.h
 delete mode 100644 tools/perf/arch/mips/entry/syscalls/Kbuild
 delete mode 100644 tools/perf/arch/mips/entry/syscalls/Makefile.syscalls
 delete mode 100644 tools/perf/arch/mips/include/syscall_table.h
 delete mode 100644 tools/perf/arch/parisc/entry/syscalls/Kbuild
 delete mode 100644 tools/perf/arch/parisc/entry/syscalls/Makefile.syscalls
 delete mode 100644 tools/perf/arch/parisc/include/syscall_table.h
 delete mode 100644 tools/perf/arch/powerpc/entry/syscalls/Kbuild
 delete mode 100644 tools/perf/arch/powerpc/entry/syscalls/Makefile.syscalls
 delete mode 100644 tools/perf/arch/powerpc/include/syscall_table.h
 delete mode 100644 tools/perf/arch/riscv/entry/syscalls/Kbuild
 delete mode 100644 tools/perf/arch/riscv/entry/syscalls/Makefile.syscalls
 delete mode 100644 tools/perf/arch/riscv/include/syscall_table.h
 delete mode 100644 tools/perf/arch/s390/entry/syscalls/Kbuild
 delete mode 100644 tools/perf/arch/s390/entry/syscalls/Makefile.syscalls
 delete mode 100644 tools/perf/arch/s390/include/syscall_table.h
 delete mode 100644 tools/perf/arch/sh/entry/syscalls/Kbuild
 delete mode 100644 tools/perf/arch/sh/entry/syscalls/Makefile.syscalls
 delete mode 100644 tools/perf/arch/sh/include/syscall_table.h
 delete mode 100644 tools/perf/arch/sparc/entry/syscalls/Kbuild
 delete mode 100644 tools/perf/arch/sparc/entry/syscalls/Makefile.syscalls
 delete mode 100644 tools/perf/arch/sparc/include/syscall_table.h
 delete mode 100644 tools/perf/arch/x86/entry/syscalls/Kbuild
 delete mode 100644 tools/perf/arch/x86/entry/syscalls/Makefile.syscalls
 delete mode 100644 tools/perf/arch/x86/include/syscall_table.h
 delete mode 100644 tools/perf/arch/xtensa/entry/syscalls/Kbuild
 delete mode 100644 tools/perf/arch/xtensa/entry/syscalls/Makefile.syscalls
 delete mode 100644 tools/perf/arch/xtensa/include/syscall_table.h
 delete mode 100644 tools/perf/scripts/Makefile.syscalls
 delete mode 100755 tools/perf/scripts/syscalltbl.sh
 create mode 100755 tools/perf/trace/beauty/syscalltbl.sh

-- 
2.49.0.rc1.451.g8f38331e32-goog


