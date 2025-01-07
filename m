Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E26AE77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 18:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VJJx+P1BM3o2AclN0fARVZxzF2vJee5sNA/yq96x/gk=; b=iihswfnrs+eXExDGB+KEPgfHaX
	wvew4ynFwD7K+u0eBNt04Ar4iA3Y9wAtqTppH9caLFtGBzUVYWKpba7h2MiX/jNFe1sHm5uaCoolD
	wKhwdF3gQqed7RNhgf8h7ZOiS6v6O35t63aeWo6F2qLwKT+2mg7QGH12CXvks+xHh/zjTG6irivTm
	KEXdRTj0ILThExo+DBiZ+3kNFlUhSxFQ9mlzYo1uYQJxqbFsfPsQG3S8XOivy/TozJRGp9M+XGJ84
	VKGWD23BM8Il1hiU30zBuTRHgml4kBXiDgnIrUnVtEnMm4yQkKLLoVQXMLu4HQPLh/yvoX1lEnP4k
	QAlm7RCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVEar-000000063RG-3QOb;
	Tue, 07 Jan 2025 18:46:21 +0000
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVEZZ-000000063BI-3UWs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 18:45:07 +0000
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-3a815a5fb60so9195ab.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 10:45:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736275501; x=1736880301; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VJJx+P1BM3o2AclN0fARVZxzF2vJee5sNA/yq96x/gk=;
        b=LmjPEX2sPTu2P2fBO8n9lGWSv+fv7PQD7KtH7tuQcqRGVsruwgBVf0q1Fpxu0wvdtk
         fja2Cumf1yRD7t9Lzgi3J65qsodwGmtk1dgmokud//jzlvPjjxpKh04h7JQtSTfIQQMr
         /vS8LXILgI8uOk04VSda4gqqXL2wvihRq8p2/1nKzZJG3byx3xMV/gsGD2buMVFK9P0Q
         Gse1+i6U04nwrEA353eGAKE/ozfcdJeIhnisjF0OEsMjZywSslsEiX85qmiPP5y/f45S
         K7hPGfJhKx/pmKG5JrziIior0poePj5IEGRcmplb+hV8C2ShQJIqyyv4QRqPStBEKvjK
         qS7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736275501; x=1736880301;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VJJx+P1BM3o2AclN0fARVZxzF2vJee5sNA/yq96x/gk=;
        b=pkoBcFXYjpUKOdMnALsu2DVNHMwCpEN+EUbZFCzFDBYym4naFdQaNvFQKFwbhWuZPi
         COzOplq2fftR6AMdjzFIK7VzcO2QOgZyS08b8uXu4m/uOb1Q1p73b1mYSMIEI+63h7pV
         jy2uW4RYY1WIHmr8mAR4MucKfmsqvbqYu/6I9r37tjxHcajfauOGBC3Uy6WrL4tnUB4O
         TcDfwxcGJ/acHhvMGNmNgBmtPT1GB397nR4/uUColExDbSSkLWticpskg6tuWpGoIa7L
         hdiZ9o9DJPjvRYjEbElJJh/jgYZHnIh6tFPCRZH8siuMED/sz4aD6olyKBdTpIVocjL/
         rHBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVa85oKe/Wb80du+v51gQF7+kQBX9HNXFMAS1iZNq0drdVXag0LFyMTWCaIdnNVc5CYSkFp0F894NnMvMntKq4S@lists.infradead.org
X-Gm-Message-State: AOJu0YyBBE3BOw/Z9JAnCknjcJtvVsgLFBJuFCNCpSV7nufJ3Pk0/K0V
	3Q+LBlUTjCV9n0wJpm+/I9RHxH4L9uTkx30t3A3CTnATJlbc0EUpnKzL4k9okd+soPxd3xlmCvJ
	Xu2tTgzlb/JAQrSK3wB4c7Pr3n7sQhkrHqLQ1
X-Gm-Gg: ASbGncslENWm0e/FhE4ewiSzxAelpjv+CoZFvt3Q193QkIMQ3L5keBpqgOvomKOnQH7
	UIRqNCcyJgy/7oiUKBPWJQr0u6erCfirDRub+EIJtRhhP8Hh8m4SBudSZnRdqigwfOKDU9w==
X-Google-Smtp-Source: AGHT+IEseKvNZN6+1U5xaeEFYg5v0HSjPQ42KLZsijQ/hQCyvb+Yo8x6RDlu2GEmFg6ThF8oNhQEjR4YLtlu8w6G6hY=
X-Received: by 2002:a92:cd09:0:b0:3a7:dcc1:9936 with SMTP id
 e9e14a558f8ab-3ce333ac737mr3451575ab.23.1736275500747; Tue, 07 Jan 2025
 10:45:00 -0800 (PST)
MIME-Version: 1.0
References: <20241218-perf_syscalltbl-v4-0-bc8caef2ca8e@rivosinc.com>
In-Reply-To: <20241218-perf_syscalltbl-v4-0-bc8caef2ca8e@rivosinc.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 7 Jan 2025 10:44:49 -0800
X-Gm-Features: AbW1kvZ2ue7zebeJn1ASl6IcPrVI85kIxnXUJ0ZFdYfd60rswaW74SbtuHBtKwI
Message-ID: <CAP-5=fVoH3_naH_UzwBKy9ayCC=Ee5ck6=iJQ9bVPuVCame6Gg@mail.gmail.com>
Subject: Re: [PATCH v4 00/16] perf tools: Use generic syscall scripts for all archs
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	=?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	Christian Brauner <brauner@kernel.org>, Guo Ren <guoren@kernel.org>, 
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
	James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>, 
	Leo Yan <leo.yan@linux.dev>, Jonathan Corbet <corbet@lwn.net>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Arnd Bergmann <arnd@arndb.de>, Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-security-module@vger.kernel.org, bpf@vger.kernel.org, 
	linux-csky@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_104501_880214_6F517362 
X-CRM114-Status: GOOD (  25.88  )
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

On Wed, Dec 18, 2024 at 1:24=E2=80=AFAM Charlie Jenkins <charlie@rivosinc.c=
om> wrote:
>
> Standardize the generation of syscall headers around syscall tables.
> Previously each architecture independently selected how syscall headers
> would be generated, or would not define a way and fallback onto
> libaudit. Convert all architectures to use a standard syscall header
> generation script and allow each architecture to override the syscall
> table to use if they do not use the generic table.
>
> As a result of these changes, no architecture will require libaudit, and
> so the fallback case of using libaudit is removed by this series.
>
> Testing:
>
> I have tested that the syscall mappings of id to name generation works
> as expected for every architecture, but I have only validated that perf
> trace compiles and runs as expected on riscv, arm64, and x86_64.
>
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> Reviewed-by: Ian Rogers <irogers@google.com>
>
> On x86-64:
> Tested-by: Ian Rogers <irogers@google.com>

I'd like to see this land. The patches apply cleanly on
perf-tools-next for me and except for a 1 liner on patch 16 everything
has my:
Tested-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
> Changes in v4:
> - Remove audit_machine member of syscalltbl struct (Ian)
> - Rebase on perf-tools-next
> - Link to v3: https://lore.kernel.org/r/20241216-perf_syscalltbl-v3-0-239=
f032481d5@rivosinc.com
>
> Changes in v3:
> - Fix compiliation when OUTPUT is empty
> - Correct unused headers to be .h instead of .c  (Namhyung)
> - Make variable definition of supported archs (Namhyung)
> - Convert +=3D into :=3D for syscalls headers (Namhyung)
> - Link to v2: https://lore.kernel.org/r/20241212-perf_syscalltbl-v2-0-f8c=
a984ffe40@rivosinc.com
>
> Changes in v2:
> - Rebase onto 6.13-rc2
> - Fix output path so it generates to /tools/perf/arch properly
> - Link to v1: https://lore.kernel.org/r/20241104-perf_syscalltbl-v1-0-9ad=
ae5c761ef@rivosinc.com
>
> ---
> Charlie Jenkins (16):
>       perf tools: Create generic syscall table support
>       perf tools: arc: Support generic syscall headers
>       perf tools: csky: Support generic syscall headers
>       perf tools: arm: Support syscall headers
>       perf tools: sh: Support syscall headers
>       perf tools: sparc: Support syscall headers
>       perf tools: xtensa: Support syscall header
>       perf tools: x86: Use generic syscall scripts
>       perf tools: alpha: Support syscall header
>       perf tools: parisc: Support syscall header
>       perf tools: arm64: Use syscall table
>       perf tools: loongarch: Use syscall table
>       perf tools: mips: Use generic syscall scripts
>       perf tools: powerpc: Use generic syscall table scripts
>       perf tools: s390: Use generic syscall table scripts
>       perf tools: Remove dependency on libaudit
>
>  Documentation/admin-guide/workload-tracing.rst     |   2 +-
>  tools/build/feature/Makefile                       |   4 -
>  tools/build/feature/test-libaudit.c                |  11 -
>  tools/perf/Documentation/perf-check.txt            |   1 -
>  tools/perf/Makefile.config                         |  39 +-
>  tools/perf/Makefile.perf                           |  12 +-
>  tools/perf/arch/alpha/entry/syscalls/Kbuild        |   2 +
>  .../arch/alpha/entry/syscalls/Makefile.syscalls    |   5 +
>  tools/perf/arch/alpha/entry/syscalls/syscall.tbl   | 504 +++++++++++++++=
+++++
>  tools/perf/arch/alpha/include/syscall_table.h      |   2 +
>  tools/perf/arch/arc/entry/syscalls/Kbuild          |   2 +
>  .../perf/arch/arc/entry/syscalls/Makefile.syscalls |   3 +
>  tools/perf/arch/arc/include/syscall_table.h        |   2 +
>  tools/perf/arch/arm/entry/syscalls/Kbuild          |   4 +
>  .../perf/arch/arm/entry/syscalls/Makefile.syscalls |   2 +
>  tools/perf/arch/arm/entry/syscalls/syscall.tbl     | 483 +++++++++++++++=
++++
>  tools/perf/arch/arm/include/syscall_table.h        |   2 +
>  tools/perf/arch/arm64/Makefile                     |  22 -
>  tools/perf/arch/arm64/entry/syscalls/Kbuild        |   3 +
>  .../arch/arm64/entry/syscalls/Makefile.syscalls    |   6 +
>  tools/perf/arch/arm64/entry/syscalls/mksyscalltbl  |  46 --
>  .../perf/arch/arm64/entry/syscalls/syscall_32.tbl  | 476 +++++++++++++++=
++++
>  .../perf/arch/arm64/entry/syscalls/syscall_64.tbl  |   1 +
>  tools/perf/arch/arm64/include/syscall_table.h      |   8 +
>  tools/perf/arch/csky/entry/syscalls/Kbuild         |   2 +
>  .../arch/csky/entry/syscalls/Makefile.syscalls     |   3 +
>  tools/perf/arch/csky/include/syscall_table.h       |   2 +
>  tools/perf/arch/loongarch/Makefile                 |  22 -
>  tools/perf/arch/loongarch/entry/syscalls/Kbuild    |   2 +
>  .../loongarch/entry/syscalls/Makefile.syscalls     |   3 +
>  .../arch/loongarch/entry/syscalls/mksyscalltbl     |  45 --
>  tools/perf/arch/loongarch/include/syscall_table.h  |   2 +
>  tools/perf/arch/mips/entry/syscalls/Kbuild         |   2 +
>  .../arch/mips/entry/syscalls/Makefile.syscalls     |   5 +
>  tools/perf/arch/mips/entry/syscalls/mksyscalltbl   |  32 --
>  tools/perf/arch/mips/include/syscall_table.h       |   2 +
>  tools/perf/arch/parisc/entry/syscalls/Kbuild       |   3 +
>  .../arch/parisc/entry/syscalls/Makefile.syscalls   |   6 +
>  tools/perf/arch/parisc/entry/syscalls/syscall.tbl  | 463 +++++++++++++++=
++++
>  tools/perf/arch/parisc/include/syscall_table.h     |   8 +
>  tools/perf/arch/powerpc/Makefile                   |  25 -
>  tools/perf/arch/powerpc/entry/syscalls/Kbuild      |   3 +
>  .../arch/powerpc/entry/syscalls/Makefile.syscalls  |   6 +
>  .../perf/arch/powerpc/entry/syscalls/mksyscalltbl  |  39 --
>  tools/perf/arch/powerpc/include/syscall_table.h    |   8 +
>  tools/perf/arch/riscv/Makefile                     |  22 -
>  tools/perf/arch/riscv/entry/syscalls/Kbuild        |   2 +
>  .../arch/riscv/entry/syscalls/Makefile.syscalls    |   4 +
>  tools/perf/arch/riscv/entry/syscalls/mksyscalltbl  |  47 --
>  tools/perf/arch/riscv/include/syscall_table.h      |   8 +
>  tools/perf/arch/s390/Makefile                      |  21 -
>  tools/perf/arch/s390/entry/syscalls/Kbuild         |   2 +
>  .../arch/s390/entry/syscalls/Makefile.syscalls     |   5 +
>  tools/perf/arch/s390/entry/syscalls/mksyscalltbl   |  32 --
>  tools/perf/arch/s390/include/syscall_table.h       |   2 +
>  tools/perf/arch/sh/entry/syscalls/Kbuild           |   2 +
>  .../perf/arch/sh/entry/syscalls/Makefile.syscalls  |   4 +
>  tools/perf/arch/sh/entry/syscalls/syscall.tbl      | 472 +++++++++++++++=
++++
>  tools/perf/arch/sh/include/syscall_table.h         |   2 +
>  tools/perf/arch/sparc/entry/syscalls/Kbuild        |   3 +
>  .../arch/sparc/entry/syscalls/Makefile.syscalls    |   5 +
>  tools/perf/arch/sparc/entry/syscalls/syscall.tbl   | 514 +++++++++++++++=
++++++
>  tools/perf/arch/sparc/include/syscall_table.h      |   8 +
>  tools/perf/arch/x86/Build                          |   1 -
>  tools/perf/arch/x86/Makefile                       |  25 -
>  tools/perf/arch/x86/entry/syscalls/Kbuild          |   3 +
>  .../perf/arch/x86/entry/syscalls/Makefile.syscalls |   6 +
>  tools/perf/arch/x86/entry/syscalls/syscalltbl.sh   |  42 --
>  tools/perf/arch/x86/include/syscall_table.h        |   8 +
>  tools/perf/arch/xtensa/entry/syscalls/Kbuild       |   2 +
>  .../arch/xtensa/entry/syscalls/Makefile.syscalls   |   4 +
>  tools/perf/arch/xtensa/entry/syscalls/syscall.tbl  | 439 +++++++++++++++=
+++
>  tools/perf/arch/xtensa/include/syscall_table.h     |   2 +
>  tools/perf/builtin-check.c                         |   1 -
>  tools/perf/builtin-help.c                          |   2 -
>  tools/perf/builtin-trace.c                         |  30 --
>  tools/perf/check-headers.sh                        |   9 +
>  tools/perf/perf.c                                  |   6 +-
>  tools/perf/scripts/Makefile.syscalls               |  61 +++
>  tools/perf/scripts/syscalltbl.sh                   |  86 ++++
>  tools/perf/tests/make                              |   7 +-
>  tools/perf/util/env.c                              |   4 +-
>  tools/perf/util/generate-cmdlist.sh                |   4 +-
>  tools/perf/util/syscalltbl.c                       |  90 +---
>  tools/perf/util/syscalltbl.h                       |   1 -
>  tools/scripts/syscall.tbl                          | 409 +++++++++++++++=
+
>  86 files changed, 4102 insertions(+), 620 deletions(-)
> ---
> base-commit: e8b3012cbd8f2263777347c2e8310b3f00d494f5
> change-id: 20240913-perf_syscalltbl-6f98defcc6f5
> --
> - Charlie
>

