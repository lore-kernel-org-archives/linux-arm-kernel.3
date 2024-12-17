Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BA71E7716A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 06:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5GKwKdXwSXZuL2D8cviPm/qFzDIAQPtFdeTjDmUaPXg=; b=hq62PpXeh9CAeG
	69BiuZ84D4cUsXcxA+2ccDC1QbmuNSaqXB20cwqOoGH9sDMj8flxVqkVHtVGkHEmew5dx3k/SkSKA
	VUzE6tDpTdPRg3D5bEvzkJbSnYqgb0iVj83rRpMSjYv8xPebI3HBQGcOPjjbfqw7gd+kAQn9GXleu
	CHDBdPtqsasG3siiSAC+8hCTwBY3ZVc4YlGvrcbuAIxbEVt3hJvxhAJLhOwY4pidrAVKHIwmyrPxL
	WhICoL/nN/Dg8KOnBLZqlzW+bFN4WM40QUFfBsFGXQJCMwB8Bhthw3U94qXA7svZU5InXPRnPS3ku
	bmKEPgbI6CcUY6aJoIqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNRFq-0000000CQtF-0Pjd;
	Tue, 17 Dec 2024 06:40:26 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNREj-0000000CQPz-16oH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 06:39:18 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-2ee67e9287fso4450855a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Dec 2024 22:39:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1734417556; x=1735022356; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5GKwKdXwSXZuL2D8cviPm/qFzDIAQPtFdeTjDmUaPXg=;
        b=3drToTwBcXiRVDntYHYbfRdwboWD7PofzRIy4os/GQhkl+JZ1t35RhzO1F0z4aO5xv
         nm2Vj2gNs1TDTLBR4GBTh8P95Yp9nExJWp5xmvX7jTgZLsH5FfXIZE7kZgifnX10bEEa
         GScdy2nM8+YL1vUiQPZKEdSh5EZSQWKTbM3nzn8EE9qJ0r7rhaEr4Wu3EZ7p+8nR4exK
         om4/JSn+rNIMealKe9R4+vETsIgMT/B3EPK9NaoO2w8jmDC1TLbPlEzQ6vE/baTPk42y
         tjbtdQdkVJBBWdcXp7iAYd/gN1D4oe80bgQfS0nHzW2yclUue4i1ZK+e/BV3ZVfgfMuy
         oUmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734417556; x=1735022356;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5GKwKdXwSXZuL2D8cviPm/qFzDIAQPtFdeTjDmUaPXg=;
        b=pOvdVP4hCpfpe6HZeY06n3m2ay2wA4FxaplpFHZ6cBPUjyPth8fy8//Vu2T2FNrd7o
         qRq7faFIC5tqmQBdH92BFVJS3h7Y1JvkLYI7qvm1JJxxEDFKSYh5NlkJZ+JSktrN8R6M
         1G9aNxmVqclFpptRsaUIIWHVDXmfPwSSKC+AzZAdoFOf0Cr+GCfEX5iBLqEYVRhSojlz
         w2hqoB8rz2ufPAVnyR6QaePV3+OOPPbPg4T6VeEQrv00qUM3d6HBJV2YW7cblLfALIHP
         GoYcPsii8QmtNxWj85yNXk8U/CdnwaMN8Jas6pLHO+4UBNcBfEGHgMtCwc2EJt0cQ/yE
         B82Q==
X-Forwarded-Encrypted: i=1; AJvYcCVrn6lI41E6AzMA8OG0Ly3G5o+gVLNReNfzM+NfztkMeraek4Nkqqnxtd0Ce9O0uz6N8ZCZYBPK5nY4fmZw/D4W@lists.infradead.org
X-Gm-Message-State: AOJu0YwSqqL8dOVzsxS5F8Wz6dX7CzXCqrwDMy6EQCvf6dBo1By3aVVh
	gW1MKbbTKNbO0o2hRTbymWu8bs36Ab9OIacuWUKpNreM6/CgMoU0EpOepi1glHg=
X-Gm-Gg: ASbGncughsSOwks3nfvgeWhC3ri9twbi+BIftFW40o86xY5K0Hml5SGbqiuJDm1SDPw
	yQ3myDdfjI71p11MTkEJuCg4yE7pRt6kEg+Z/gNewHJtcaoN9cTjrVXkprh1cqGpciJVtVJtuJO
	iRCKrUBZJ0HmA/PcTHd5H1mC0zk3zzqsWfiH1QEEUcNif0YIt0rX2a+krTYEfvsUl5V/MoMm6mj
	CPsxuHPBbFab9GunrIO791rZMfEaRjWrDFeh7DRo2DiPkvR/wfZqZqXiFgOFpEh31WRnbZr
X-Google-Smtp-Source: AGHT+IG8wAmIpqIQU+QN9wyuY7FpuGBEpM1hsVQvRU88nFGSgia4kFPf1I/7uxrw0bEBGiqVKBh0gg==
X-Received: by 2002:a17:90b:2807:b0:2ee:6263:cc0c with SMTP id 98e67ed59e1d1-2f2901b7d57mr23118004a91.37.1734417556372;
        Mon, 16 Dec 2024 22:39:16 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f142d90d6bsm9179551a91.2.2024.12.16.22.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 22:39:15 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v3 00/16] perf tools: Use generic syscall scripts for all
 archs
Date: Mon, 16 Dec 2024 22:32:45 -0800
Message-Id: <20241216-perf_syscalltbl-v3-0-239f032481d5@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA0bYWcC/2XN0QqCMBTG8VeJXbfY5jTXVe8REet4Tg7MySYjE
 d+96U2Ql/8Pzu/MLGJwGNnlMLOAyUXn+xzF8cCgtf0LuWtyMyWUFkYWfMBAjzhFsF03Pjtekak
 bJICKSpavhoDkPpt4u+duXRx9mLYHSa7rZkkp9M5KkgtubGOxhHMlka7BJR9dDyfwb7ZySf0IJ
 dWeUJmgGqypNRFq8Ucsy/IFLsr3rfQAAAA=
X-Change-ID: 20240913-perf_syscalltbl-6f98defcc6f5
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7757; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=CSbFNbbtJpMGr7r+QYmbHb79wr/WkObTrKseW/OIITk=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ3qi9Id/khryJidfsGr8eLdIPP7ResdrS8RPiqu2VF1+4
 ubhtEyvo5SFQYyDQVZMkYXnWgNz6x39sqOiZRNg5rAygQxh4OIUgInI3Wdk6KrVM56s6MG5qlrt
 RXzglZpl92OKLtef41ygIBE7jXOfEsMfrkWRr9U3fVrUJNjmZ2myVKXzt5fwEc2YE2LcjYev7vz
 HDgA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_223917_386560_A3A6CDAC 
X-CRM114-Status: GOOD (  15.34  )
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

Standardize the generation of syscall headers around syscall tables.
Previously each architecture independently selected how syscall headers
would be generated, or would not define a way and fallback onto
libaudit. Convert all architectures to use a standard syscall header
generation script and allow each architecture to override the syscall
table to use if they do not use the generic table.

As a result of these changes, no architecture will require libaudit, and
so the fallback case of using libaudit is removed by this series.

Testing:

I have tested that the syscall mappings of id to name generation works
as expected for every architecture, but I have only validated that perf
trace compiles and runs as expected on riscv, arm64, and x86_64.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
Changes in v3:
- Fix compiliation when OUTPUT is empty
- Correct unused headers to be .h instead of .c  (Namhyung)
- Make variable definition of supported archs (Namhyung)
- Convert += into := for syscalls headers (Namhyung)
- Link to v2: https://lore.kernel.org/r/20241212-perf_syscalltbl-v2-0-f8ca984ffe40@rivosinc.com

Changes in v2:
- Rebase onto 6.13-rc2
- Fix output path so it generates to /tools/perf/arch properly
- Link to v1: https://lore.kernel.org/r/20241104-perf_syscalltbl-v1-0-9adae5c761ef@rivosinc.com

---
Charlie Jenkins (16):
      perf tools: Create generic syscall table support
      perf tools: arc: Support generic syscall headers
      perf tools: csky: Support generic syscall headers
      perf tools: arm: Support syscall headers
      perf tools: sh: Support syscall headers
      perf tools: sparc: Support syscall headers
      perf tools: xtensa: Support syscall header
      perf tools: x86: Use generic syscall scripts
      perf tools: alpha: Support syscall header
      perf tools: parisc: Support syscall header
      perf tools: arm64: Use syscall table
      perf tools: loongarch: Use syscall table
      perf tools: mips: Use generic syscall scripts
      perf tools: powerpc: Use generic syscall table scripts
      perf tools: s390: Use generic syscall table scripts
      perf tools: Remove dependency on libaudit

 Documentation/admin-guide/workload-tracing.rst     |   2 +-
 tools/build/feature/Makefile                       |   4 -
 tools/build/feature/test-libaudit.c                |  11 -
 tools/perf/Documentation/perf-check.txt            |   1 -
 tools/perf/Makefile.config                         |  39 +-
 tools/perf/Makefile.perf                           |  12 +-
 tools/perf/arch/alpha/entry/syscalls/Kbuild        |   2 +
 .../arch/alpha/entry/syscalls/Makefile.syscalls    |   5 +
 tools/perf/arch/alpha/entry/syscalls/syscall.tbl   | 504 ++++++++++++++++++++
 tools/perf/arch/alpha/include/syscall_table.h      |   2 +
 tools/perf/arch/arc/entry/syscalls/Kbuild          |   2 +
 .../perf/arch/arc/entry/syscalls/Makefile.syscalls |   3 +
 tools/perf/arch/arc/include/syscall_table.h        |   2 +
 tools/perf/arch/arm/entry/syscalls/Kbuild          |   4 +
 .../perf/arch/arm/entry/syscalls/Makefile.syscalls |   2 +
 tools/perf/arch/arm/entry/syscalls/syscall.tbl     | 483 +++++++++++++++++++
 tools/perf/arch/arm/include/syscall_table.h        |   2 +
 tools/perf/arch/arm64/Makefile                     |  22 -
 tools/perf/arch/arm64/entry/syscalls/Kbuild        |   3 +
 .../arch/arm64/entry/syscalls/Makefile.syscalls    |   6 +
 tools/perf/arch/arm64/entry/syscalls/mksyscalltbl  |  46 --
 .../perf/arch/arm64/entry/syscalls/syscall_32.tbl  | 476 +++++++++++++++++++
 .../perf/arch/arm64/entry/syscalls/syscall_64.tbl  |   1 +
 tools/perf/arch/arm64/include/syscall_table.h      |   8 +
 tools/perf/arch/csky/entry/syscalls/Kbuild         |   2 +
 .../arch/csky/entry/syscalls/Makefile.syscalls     |   3 +
 tools/perf/arch/csky/include/syscall_table.h       |   2 +
 tools/perf/arch/loongarch/Makefile                 |  22 -
 tools/perf/arch/loongarch/entry/syscalls/Kbuild    |   2 +
 .../loongarch/entry/syscalls/Makefile.syscalls     |   3 +
 .../arch/loongarch/entry/syscalls/mksyscalltbl     |  45 --
 tools/perf/arch/loongarch/include/syscall_table.h  |   2 +
 tools/perf/arch/mips/entry/syscalls/Kbuild         |   2 +
 .../arch/mips/entry/syscalls/Makefile.syscalls     |   5 +
 tools/perf/arch/mips/entry/syscalls/mksyscalltbl   |  32 --
 tools/perf/arch/mips/include/syscall_table.h       |   2 +
 tools/perf/arch/parisc/entry/syscalls/Kbuild       |   3 +
 .../arch/parisc/entry/syscalls/Makefile.syscalls   |   6 +
 tools/perf/arch/parisc/entry/syscalls/syscall.tbl  | 463 +++++++++++++++++++
 tools/perf/arch/parisc/include/syscall_table.h     |   8 +
 tools/perf/arch/powerpc/Makefile                   |  25 -
 tools/perf/arch/powerpc/entry/syscalls/Kbuild      |   3 +
 .../arch/powerpc/entry/syscalls/Makefile.syscalls  |   6 +
 .../perf/arch/powerpc/entry/syscalls/mksyscalltbl  |  39 --
 tools/perf/arch/powerpc/include/syscall_table.h    |   8 +
 tools/perf/arch/riscv/Makefile                     |  22 -
 tools/perf/arch/riscv/entry/syscalls/Kbuild        |   2 +
 .../arch/riscv/entry/syscalls/Makefile.syscalls    |   4 +
 tools/perf/arch/riscv/entry/syscalls/mksyscalltbl  |  47 --
 tools/perf/arch/riscv/include/syscall_table.h      |   8 +
 tools/perf/arch/s390/Makefile                      |  21 -
 tools/perf/arch/s390/entry/syscalls/Kbuild         |   2 +
 .../arch/s390/entry/syscalls/Makefile.syscalls     |   5 +
 tools/perf/arch/s390/entry/syscalls/mksyscalltbl   |  32 --
 tools/perf/arch/s390/include/syscall_table.h       |   2 +
 tools/perf/arch/sh/entry/syscalls/Kbuild           |   2 +
 .../perf/arch/sh/entry/syscalls/Makefile.syscalls  |   4 +
 tools/perf/arch/sh/entry/syscalls/syscall.tbl      | 472 +++++++++++++++++++
 tools/perf/arch/sh/include/syscall_table.h         |   2 +
 tools/perf/arch/sparc/entry/syscalls/Kbuild        |   3 +
 .../arch/sparc/entry/syscalls/Makefile.syscalls    |   5 +
 tools/perf/arch/sparc/entry/syscalls/syscall.tbl   | 514 +++++++++++++++++++++
 tools/perf/arch/sparc/include/syscall_table.h      |   8 +
 tools/perf/arch/x86/Build                          |   1 -
 tools/perf/arch/x86/Makefile                       |  25 -
 tools/perf/arch/x86/entry/syscalls/Kbuild          |   3 +
 .../perf/arch/x86/entry/syscalls/Makefile.syscalls |   6 +
 tools/perf/arch/x86/entry/syscalls/syscalltbl.sh   |  42 --
 tools/perf/arch/x86/include/syscall_table.h        |   8 +
 tools/perf/arch/xtensa/entry/syscalls/Kbuild       |   2 +
 .../arch/xtensa/entry/syscalls/Makefile.syscalls   |   4 +
 tools/perf/arch/xtensa/entry/syscalls/syscall.tbl  | 439 ++++++++++++++++++
 tools/perf/arch/xtensa/include/syscall_table.h     |   2 +
 tools/perf/builtin-check.c                         |   1 -
 tools/perf/builtin-help.c                          |   2 -
 tools/perf/builtin-trace.c                         |  30 --
 tools/perf/check-headers.sh                        |   9 +
 tools/perf/perf.c                                  |   6 +-
 tools/perf/scripts/Makefile.syscalls               |  61 +++
 tools/perf/scripts/syscalltbl.sh                   |  86 ++++
 tools/perf/tests/make                              |   7 +-
 tools/perf/util/env.c                              |   4 +-
 tools/perf/util/generate-cmdlist.sh                |   4 +-
 tools/perf/util/syscalltbl.c                       |  90 +---
 tools/scripts/syscall.tbl                          | 409 ++++++++++++++++
 85 files changed, 4102 insertions(+), 619 deletions(-)
---
base-commit: fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
change-id: 20240913-perf_syscalltbl-6f98defcc6f5
-- 
- Charlie


