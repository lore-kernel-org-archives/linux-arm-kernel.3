Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3424CE77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 09:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NRJha1SoH0/hFCPzxGAQ47LX039fMVOKupm0XmZAb70=; b=EcWiFf+qWJmZgl
	BPn0xvKplgaDSH7j+ewXYdSYZ+2dvUOWSfpsVsi1poDMPBV3iIePMdGuYwNkFHUhFvzxNCbwLp0v8
	ewHBrlNKK7/bPqssZHcW9HFzbLhS0EjQZHZ6vcxxUz+zbbJ4LZdmKawYqnfAKGZVsHoBjW85lCGMF
	XcaM4we9pvj65+JAs7JPJhlUa+zrUVKW7wM7U36kes/Ak/81MvK9mBkW8mOsfp08Ej9P5s6HrN1gM
	Vlb5R7ire+fi4L3cv1CoAfmgJmreZBr1eRCFqe67P7vkPb+tPndaRwA0VvUWazWpqSEmj792LrMHx
	+lvvd5rNnZejTnFBeOug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNqJH-0000000G5Jl-41Kc;
	Wed, 18 Dec 2024 09:25:39 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNqI7-0000000G4jy-2dF5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 09:24:30 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2165cb60719so50284495ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 01:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1734513867; x=1735118667; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NRJha1SoH0/hFCPzxGAQ47LX039fMVOKupm0XmZAb70=;
        b=HBaZ9MaO6n5Bs6Qth/IBb3CrclzO2ZSHHMw8K1xaa8kklsGUm23Yt9lrGSfFQv0ybu
         t8hCELi1LDvApIl8pzzvRq4cEYVutTD9fhee0AyESL5kUBdHKQ3Elb1i1KnqIkmRw8vz
         nUXQI9gz5HI5ZyiuvtKU7SFIZAK1HEQBfllnrhur0QAQxj+Q53mLoA+Pw/ElaO67U7vT
         jB1bpr60ymUWUXkKqXwSZW80G7pNUjVn61zdHpWoyjk6cxhqq0RDT22uG8oT2OSHoEN+
         VhyYFPs6dDd5K+w91EF6a/Eoj2DzBYtd6rVygUBYMD2ATcVK92uecBxjK39PddNn4/hi
         xqDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734513867; x=1735118667;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NRJha1SoH0/hFCPzxGAQ47LX039fMVOKupm0XmZAb70=;
        b=VLKaOpZX9Wh96BTIo8f9+UiOSTxucfuS0ophlhKUuuCxRmYVSh59MKVTRry+4YJdxv
         Coj5Pos4JJP87wKv0b6+MDvQF+HMsJgTQH8PUkrwXy9mO97X4m9L+rgv7nyxWbRnXll9
         w1ZlL735SLAB5J9cwsmqALyOAeHWnjIXjM5rVvdXysW8Us+AM9TGCMJU6BZefQ85SYhj
         d5fvSorqYHx33AJRQJHCSM/qeAkSgbCyP/QbOFCSCfrv7p3WyUzYHA194k2/cBTCnR1R
         Bt2w/O2O0wy8MwaNCHFR29eWEaOnzV7ap+n/cm0E+9XQON7zwZ/TSYRP8yTLAtCwDyE+
         k64w==
X-Forwarded-Encrypted: i=1; AJvYcCWSjHTVmrqEW0X5uJzenuMLdmXqEIBA5mj2XX+ZZWwFiA7M9w/RXdkaGanG8S/UBSa+Go5heO7KYVNdPiwUk3qP@lists.infradead.org
X-Gm-Message-State: AOJu0YxcTa3x0jS9qaAfpZwu85paGPi311h+3iQzV+Qxkk/1znvivNO+
	Gjg7ytev0fn/rHMHNFJ3Ol/ECNOYWSX4dIjUiXaE8kOTc4U4o6/w8vpwPNyU02M=
X-Gm-Gg: ASbGncsnUxsRTmIL5B6WUGePqoNVqw97N6UtUWShPSZ1rU2PhcYMg8jqMEfkooRpeYD
	nyy3pQp1izlAF/+e8Vqsc82x+6j1SBZI9jmofL+UUvyQxqqn8/TG49cz5f7UmtS2aeG1jsiBk0S
	RLvUnpRjFmlXk/lTaYGxfRmKOQhZTKz6aC/qUqe5Hzq1eWN2X9r++aa4NiH19clnoz3dZdHmf3o
	YVFtq34fc049Faw5usUnuDITC9BV7B8B4D33prEOet9PUb6UEBdau37E3hdR51l5xNYn3D0
X-Google-Smtp-Source: AGHT+IGR4D+hNDWJEhj5SMCJmWDe5Yk0GMudatm20Y3u8muxzsVTwGB13H7qLZBnO+a9tWVs1mqlMg==
X-Received: by 2002:a17:902:da8b:b0:216:2426:767f with SMTP id d9443c01a7336-218d725c2d5mr29562395ad.49.1734513866948;
        Wed, 18 Dec 2024 01:24:26 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1e64f90sm72119995ad.241.2024.12.18.01.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 01:24:25 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v4 00/16] perf tools: Use generic syscall scripts for all
 archs
Date: Wed, 18 Dec 2024 01:23:58 -0800
Message-Id: <20241218-perf_syscalltbl-v4-0-bc8caef2ca8e@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK6UYmcC/23NTQrCMBCG4atI1kby19q48h4iEtMZG6hNSUqwl
 N7dtBvFunw/mGcmEiE4iOS0m0iA5KLzXQ613xHbmO4B1NW5iWBCMc0l7SHgLY7RmrYd7i0tUVc
 1oLUlFiRf9QHQvVbxcs3duDj4MK4PEl/W1eKcqY2VOGVUm9pAYY8lBzwHl3x0nT1Y/yQLl8SHE
 FxsCZEJrKzRlUIExf4Q8psot4TMhJAamRSq4nXxQ8zz/AZvUL/BNwEAAA==
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
 Arnd Bergmann <arnd@arndb.de>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-security-module@vger.kernel.org, 
 bpf@vger.kernel.org, linux-csky@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8126; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=r5X4P4KH+np4q2plC0P/nDZXhnkwoxhAfS7b7JDFHSM=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ3rSlC18lXcqhZ6mOv7M/pesJ7wo5+IV8aTAXacDcuyC1
 teneSt1lLIwiHEwyIopsvBca2BuvaNfdlS0bALMHFYmkCEMXJwCMJEYRkaGWe/TPqTc7PtSv9vV
 +Uj6Ko0GjdWJ9oq+O1QsZFf9WZNizsjwIlR0qnDP/hcaSybFH7xt8d8r3rJVwtnz6+GTPI/+7d/
 PCAA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_012427_943341_758F71E3 
X-CRM114-Status: GOOD (  15.71  )
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
Reviewed-by: Ian Rogers <irogers@google.com>

On x86-64:
Tested-by: Ian Rogers <irogers@google.com>

---
Changes in v4:
- Remove audit_machine member of syscalltbl struct (Ian)
- Rebase on perf-tools-next
- Link to v3: https://lore.kernel.org/r/20241216-perf_syscalltbl-v3-0-239f032481d5@rivosinc.com

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
 tools/perf/util/syscalltbl.h                       |   1 -
 tools/scripts/syscall.tbl                          | 409 ++++++++++++++++
 86 files changed, 4102 insertions(+), 620 deletions(-)
---
base-commit: e8b3012cbd8f2263777347c2e8310b3f00d494f5
change-id: 20240913-perf_syscalltbl-6f98defcc6f5
-- 
- Charlie


