Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5398CE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 00:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QJpXILRLfXKK0+MdF5T9u9jkQmQMEKo5rgup6DDy1VM=; b=UNo0O3oXrlEaJT
	tQSQ2VryJ0TqUedS7KJiDO9YEyiWL2vKe9t6XPNLoqAMSmNv073WZs2XINmx19uyNt7JnZvPxeYBM
	t//VqqETeyF4cqjsWBxiS3p7da4HBCyiHGOyqd3aXX9pMrNyc90a7LvsitIx5w5CoWOWusS+tbvoH
	ak0+Y/akraW57IbHIf5dI/BvX8T7PYrVRs8BNphfuo2teCrK6z+qJ7PaD95hVJj8I8A7AO4HN5WDU
	ews7AE89pdrnAltrX8ZHYoe6Yw3RhL/aprrfVlHUkQAFaB21fx77zL6iC2omFaO/x3bAdL6XAr9XV
	sZtVbGi+1QvMACaGyGPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLtdK-00000002IUi-3Awj;
	Fri, 13 Dec 2024 00:34:18 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLtcD-00000002Hv7-0f2s
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 00:33:11 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-7fd526d4d9eso1065547a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 16:33:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1734049988; x=1734654788; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QJpXILRLfXKK0+MdF5T9u9jkQmQMEKo5rgup6DDy1VM=;
        b=ZuCTuLtOLpU1fnHp+uixSB1zp2mDcqTOGU7FIENh/ifK9Jf546hiPywSM6aM5SKCNz
         riCJg4FRudOAJtm1whsVmZ3A16jQm0/7BjJHkqnsMpzII6Gz+XUhRq3EfF3lGCjtGum0
         wiKALfcTGOTGoSC5e26voIOPUwalXbG9nwuPLP9psoqUSQsp+c2rvEYPlkoLTbrhr7Hl
         chcS3uYBAMklJRJ6AxzWN9+aRrWfeV/xLBNgbyHVE/NYkkl8Vfdizreu9fcdZ3jQnTnL
         gvCauAXpgnQvWBxP8fB39axF7wxVYm5aCTQIHyuknUvjMt/s9Li4qnC9BoS2lJb7zhee
         /azg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734049988; x=1734654788;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QJpXILRLfXKK0+MdF5T9u9jkQmQMEKo5rgup6DDy1VM=;
        b=RIHyxpavKE+qzdQC4aHoXzp3rrfkCOr85a45ETq13TnBof0mrJAGLMVxafyMAASmx2
         aoKX7u2/vt4NDv1LGfkyiRU6YKSE0Esb7U/aQSDfn35R1O13J2Xc1CsS77n4Vs9s/h/e
         n6eoEop6XKuC+j8+M4CIH0fVpFcWaw86YySpjcSvD6/eTYCUcIOZ/gzbz4E7hD885Nfx
         Z5OOLT9ll89J+k1Ss7cpXwR92n3RIVycn9uMaogiHtH9X6Nooe4dNzVf90wmdx2erXHy
         e+b0+KHiHYI8gAXb0GgWvdPmRGk0AAZLdihw0NpI4fyMI9b+RY3Fi1csuCH/WbIIn59W
         npNg==
X-Forwarded-Encrypted: i=1; AJvYcCUjn39plK17rl+lxuChiA6lRDKvXPPcFcHnRsM61l/AnqG9urYKOXPAGgB8mfkhRkeNPTN0xmwzSmmc046rdNGD@lists.infradead.org
X-Gm-Message-State: AOJu0YwLAC3qXVNcbnUDPufrR0RcN9v7zeXi/zd8VzmAoNI+X4R0womf
	gLkugin1WdFrCWsY+xHIr0lt6jDK7ige26xoZ6zPUjaNyWy6CDLm6RTRQHhk3C8=
X-Gm-Gg: ASbGnctq0jQMCCSyoE+U3D7eQjNfx+/tICIIG2I/6Kn7UfpeTzabX6dysbCLdNyYkao
	9ETU6OLVmMl4xuRVjOs3AMO+b1klCrHsgLrQ6uINeYB/G8tPVVE9K//okHiPAOALyOBNmnumjBX
	b7/6Ve5eMOyceGioYuj7rHRTuCFhxZpDDijLr6IirAWPginME9FxHZRG9AtFSjouF9vQDURKdCf
	tFjIz07s0EQDJRG0YWtiJxN6P8O6T2iOxJXYeKdBdJ5TgbxwKdo2xD21Uja9jZt+7YUqfnz
X-Google-Smtp-Source: AGHT+IG9JHkY7uaO8cnj26AhO6FgsLiu0T95fS/O5OYFvSj2rewtkHH5sLKhgnXsj2ZgFA4t6YukOA==
X-Received: by 2002:a17:90b:3b48:b0:2ee:7415:4768 with SMTP id 98e67ed59e1d1-2f28fd6f5c1mr1368966a91.17.1734049988177;
        Thu, 12 Dec 2024 16:33:08 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f142e0ce50sm1934462a91.39.2024.12.12.16.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 16:33:07 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v2 00/16] perf tools: Use generic syscall scripts for all
 archs
Date: Thu, 12 Dec 2024 16:32:50 -0800
Message-Id: <20241212-perf_syscalltbl-v2-0-f8ca984ffe40@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALKAW2cC/2WNQQ6CMBBFr0JmbU2LgOLKexhi6jCVSbAlHdJIC
 He3snX5XvLfX0EoMglcixUiJRYOPkN5KAAH61+kuM8MpS4r3ZqTmii6hyyCdhzn56ga1156coi
 NqyGvpkiOP3vx3mUeWOYQl/0gmZ/dW8bo6q+VjNKqtb2lGs+NIXeLnIKwxyOGN3Tbtn0Br+Vo5
 LEAAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7428; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=WZq3jkoID8QunDd/Lk9gkIo3P2ul9rqI69DPd+QU7VY=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ3p0w7aTgWd5pnZ/dZ3zhM/4IM9yXcsqu3SRWaUCUtzCO
 5vf8U3rKGVhEONgkBVTZOG51sDceke/7Kho2QSYOaxMIEMYuDgFYCK9/IwMzXFPkxqubI248pU9
 c9HS4/ej7Wcdck6u0kgR6mvs+j1dgpGhryyV5SP7/mXevnGM7//87Dw6vfhr+q72gz5Ce5W/OCr
 yAAA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_163309_202122_39FAF0F4 
X-CRM114-Status: GOOD (  14.41  )
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
 tools/perf/scripts/Makefile.syscalls               |  60 +++
 tools/perf/scripts/syscalltbl.sh                   |  86 ++++
 tools/perf/tests/make                              |   7 +-
 tools/perf/util/env.c                              |   4 +-
 tools/perf/util/generate-cmdlist.sh                |   4 +-
 tools/perf/util/syscalltbl.c                       |  91 +---
 tools/scripts/syscall.tbl                          | 409 ++++++++++++++++
 85 files changed, 4101 insertions(+), 620 deletions(-)
---
base-commit: fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
change-id: 20240913-perf_syscalltbl-6f98defcc6f5
-- 
- Charlie


