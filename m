Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D48B0E77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 00:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YEDn5fC5f5FID4pLAuv6PhQJ2F5QWxiGvS7quO68Zpo=; b=O6IXifP5u4RQt977sF8GgBfBqI
	Q2qivwnqspLmYDmF2/DHWEON9HD8aJvMX9xBDqgtjUKdBjV79q4B4THBzi2rNCDtvSwhoyJGDRLWB
	SbnMEhZ2MQb/BE8UGZe+dAkeF8netcuk15d/EZ9uRT27cStekTnGxK5RdSUNLiJv1/S0+/bZ0XUU6
	8JluqRpIQJBJJYRkF8A9OxR+6cknCZneADEvaRzHhqpIYztR3NjgWT4Y2/KBLDmDPf8AmG2/olqLt
	7qKKed9eF5YLLsBD7BIIAQkIY4BguMq6HfPtCnv9LNrle5jUJ1uj7rFZVYzOPZeEOdxScIm/5ZF+A
	eUAVbW9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNhZj-0000000FARS-2FmC;
	Wed, 18 Dec 2024 00:06:03 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNhXS-0000000F9du-0S8W
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 00:03:44 +0000
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-3a815a5fb60so58305ab.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 16:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734480221; x=1735085021; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YEDn5fC5f5FID4pLAuv6PhQJ2F5QWxiGvS7quO68Zpo=;
        b=aIh9M0HhogG8EutX3DzpgUuBbpHEA/X6um+gfjB+qN09rvZFVZ42E7UkaP5XhCdhag
         42QaSK8ZzD1PViG2cJgJaM89LUeU+JaWpbhG9BhKgKBin2yMXORvXLxz4bS9EcmzsVR3
         rQU3Po/RlEob+ftZfrjqqvz+ehhmkOku/gtjN8ssky2d8/MABizDaEtREa8WCVjbq5HM
         SMM3cZMHFiSPrQrIU8LMD4QEVkXQeEJ18UmhtzOt9QZPxsWFcmL6nhstFq5MEiZOhltf
         0PpzFrWEahbTMbomGJkbBAscIcYoIgshRDA7PIJ+hqpb9bYa8NBYr5VsKRst14YSIyMW
         hRmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734480221; x=1735085021;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YEDn5fC5f5FID4pLAuv6PhQJ2F5QWxiGvS7quO68Zpo=;
        b=lDj++jEiHpE8uNbOAc+n7KyKB7TODUw3mMRUpCkeB6q+HuI25Z50JtGYPmIXpVsI+k
         tq68cQiposfpM9n4oQcmnmfpJc1kK7m5fL7JsD3sABsH5SVuRVerkpH7NbFIpF2o0hVp
         bOkaEpd74iTKBrnYPE24XgpzX0AsWIqH7fD9PmQ2cGWVWmA2uhKLp9GNxdjoNZl34Qp5
         0ZS2cryTWxCPAbxw0nGrYTH4u72fH16sApNB9GsQ7sMXz0DURSGTTAU5auLPUWkDBQiY
         qfocC8ZvjxAvxjNl0uWioh1BIw0dYjU/PLNmyJRdPmXHrayeJDYoqRBMENBUSp/e5Vr7
         mVGA==
X-Forwarded-Encrypted: i=1; AJvYcCXfStBChrSq1t4pb/3mDr9StyhbjLuOoZoggQHI9J36wpSFO3Fd389PKheT6iXYyvLd9rv7w6xeF1TGeQt4foEr@lists.infradead.org
X-Gm-Message-State: AOJu0YxyABzstuBK/KyJKyiMjpSEbHan7VC8x/RZYukXwIqaLdPESviu
	SMtNlsDL4VZbqrruHufaAlpEXO2mcg5MkW5iSQdnX/nvSHAEny+5InSKsexbySCPxQaLXJTT4Jz
	LxsnbHoe5dxjlWG37p1uL4ttJVfxduRlpPnd/
X-Gm-Gg: ASbGnctNbvIvyrguXguoZJhc59RAMsdfPGpXXkpmywCv40HvkweWpG+gOHpFxEjQ8TE
	kAW8Q4HD0w5GMqhUpnDuBx8/bu+mbHyMWu9I/DtI=
X-Google-Smtp-Source: AGHT+IEM2kfEZmBeZubQwYjUig3tCBFRSkoM/XjhRJzYKmzSCoR/iSXHPJ7Y3tTrfS19f2rLkSTJnLWDPAr0FzYHDQo=
X-Received: by 2002:a05:6e02:1529:b0:3a7:c997:efdb with SMTP id
 e9e14a558f8ab-3be372be692mr214265ab.17.1734480220635; Tue, 17 Dec 2024
 16:03:40 -0800 (PST)
MIME-Version: 1.0
References: <20241216-perf_syscalltbl-v3-0-239f032481d5@rivosinc.com>
In-Reply-To: <20241216-perf_syscalltbl-v3-0-239f032481d5@rivosinc.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 17 Dec 2024 16:03:29 -0800
Message-ID: <CAP-5=fWEUq_nLx7PUx96ixMrX0NqqF8W0EmXV9Zvc449zj0Z7A@mail.gmail.com>
Subject: Re: [PATCH v3 00/16] perf tools: Use generic syscall scripts for all archs
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
	Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-security-module@vger.kernel.org, bpf@vger.kernel.org, 
	linux-csky@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_160342_183829_F8F164DE 
X-CRM114-Status: GOOD (  25.96  )
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

On Mon, Dec 16, 2024 at 10:39=E2=80=AFPM Charlie Jenkins <charlie@rivosinc.=
com> wrote:
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

This is really great, thanks for taking the time for a substantial
clean up. I had difficulty applying the patches to the perf-tools-next
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git/lo=
g/?h=3Dperf-tools-next
using patch and dealing with rejects I was able to test.

Reviewed-by: Ian Rogers <irogers@google.com>
On x86-64:
Tested-by: Ian Rogers <irogers@google.com>

I think there are follow up patches that clean up the ABI, allow >1
table at a time, .. but those things are best saved for a follow up.

Thanks,
Ian

> ---
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
>  tools/scripts/syscall.tbl                          | 409 +++++++++++++++=
+
>  85 files changed, 4102 insertions(+), 619 deletions(-)
> ---
> base-commit: fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
> change-id: 20240913-perf_syscalltbl-6f98defcc6f5
> --
> - Charlie
>

