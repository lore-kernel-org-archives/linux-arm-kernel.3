Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B819FF45A12
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Apr 2026 01:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5uUkoCeVRblw7zUWJdM9ekrZvgfUtRileoapKEzjQbY=; b=jLgxZKfpXJVYn2Bz5mj0q6kfrv
	pNNp1gw2wrPa7jKhpMaLdPrRoxhXQX+QK8FWctrzajXSyFphQErO43fO4XuHA5tSXiW7sCZbCnKtw
	vd1QLvegZyHp5jy1fWilRlkdnCq+PsBD/Mhs0WwX2709j+bJZhiANRfmR1xeruwBWD6W/CPA91B6f
	7rl09QEUF4jQGZCyZViRTr4r0ef77z6PLBNo1eqPrfxH+X14A4YlfN25F3kYBoKYn661Gh65dh02L
	6Y8FdywwqlD2xQB7GQlzO/zq4jes9J1HJQSuDRqBgg7ZZk7SA/Rp1CNIFCasrs7qFg9/MPgeHpOmA
	L9wp59XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBMmi-0000000CzHE-05tZ;
	Sat, 11 Apr 2026 01:05:16 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBMme-0000000CzGO-1bbu
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Apr 2026 01:05:14 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2b0c12be0ecso266535ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Apr 2026 18:05:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775869511; cv=none;
        d=google.com; s=arc-20240605;
        b=Nho+W86IYz3/OHImZ9FxdTH8v8QIjHkYJL3TSSWvNwhoMEFK6lhvsJ9txt0i6tCZfM
         OvAdG1hO5XwPo95IB6DjwlaU2hc2nOtA6m5PTCHS7xeYH2PYdey3I2Z/SDmeXy2jEyYw
         dgA8zjFnykmdFHIheETz/2Yr4E8pe58wETRsm4+n4EJUsOm3wNK8gMShQ5PI8ylafiJe
         wt8YUUtWKnuoonlrDExHdsTajGBrBXyk2fV7vYpCj3Tat0MD8C5XjI4rIoYJLGyS4CLC
         7Iev04bguDgBtaZkqZOqcO9T/rQ/8mPz5absIS96621nB8geqNn7JxWbwxaz5bsiNMts
         NAkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5uUkoCeVRblw7zUWJdM9ekrZvgfUtRileoapKEzjQbY=;
        fh=nOUQ8Za9zVedQmp/d3Z/e7wuikuqwZDBDCI7oL3aYz0=;
        b=eGcgT8x/v8lryz84oLxJcyt7xHDnYz2LUIwYHnT+8YzEJFoH+OEgrOc5jx8IpuzzVH
         yoVk2Jg992C9iYHLeMNjX4CiTlTWcvbc8FwL/A9uKW2P0A3P7MXVeVFzOvgLfjdVq18A
         9xMfxhvPbcQGMFDZjtu6R6+5X934VZyrgzn7iSA+0b9qldy44f9XlrtLJ2arJwPKLT+B
         wL+fLZKPTJtWKOJSMaU3FeKjHYrjYL6zmFPiljSscuutaXpR71M8Z0PqBFnVsH7eru3u
         BgUEL5D7MJqLTVhwj2PHRvMWGXZadbGlCehrlSuMdmQv5aLZt6c9srzVoOXNpvX5XAbW
         DrBw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775869511; x=1776474311; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5uUkoCeVRblw7zUWJdM9ekrZvgfUtRileoapKEzjQbY=;
        b=DvqXcJ/3aRrblh6ChBwbHuWZpqHPESvkEcjsgwFTUM5GIjgohUdUcYwWVBWkztN3g3
         jrwAFLKZcZ2Df4LKgzYxFGLniljwPDJBxjonebq9KFFgkTh4lTJDmRDNvh4D2sOHqvV+
         iD5RevpYvmFayQVFi7QWfZR6yzMqOvmNfzANaRNKonyuaolY+nEWYqppQYISZdrXeNmN
         q/Alv1rLQFR5fIDZCgMdoay0IWWCCZQReVLNdyt1tWK4tXTzQbK0LlAfGlKe1oYJoEXw
         vP7gkM0KPIEKdYzyW8jbtXtqjbYbSVgy0c2XFxGlx5lKUgqsoQR+9GeL6mY7Ls99xTat
         U+Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775869511; x=1776474311;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5uUkoCeVRblw7zUWJdM9ekrZvgfUtRileoapKEzjQbY=;
        b=c5QbcgZAlE0QEpWk+frkVi9IcCjiCPuRzNAruRf32hEIpwVLy2BvlqCHDlJTqhYlKs
         aTSLE1WXelQI/mFvogCXFS6EjpKTxeFgpSZYcE6kdV3UbLEf+Re3E4uEIKl37DreKwqH
         V3nk+dDcULQ8znRXPkvPLIwek1BxVgKMlOO4favLAKhaaMZHZEQAWuXA/7kCiE5Xszb9
         ojgsLF4XcDtSyKijGfPTUJJ7Pu8rwKBuOnFsmiTtAVGIyMjz7x60qdD72I8whviXGsYu
         HZnwBN6CVSSbxMcC/2/hw013Ih3anujgTkpVhiDBb8bMqjKS0n+HCLoAbWP9sAZ0AyBJ
         ivpw==
X-Forwarded-Encrypted: i=1; AJvYcCXkuTOdap/2orc+YvdKcJSmiYQeZv1mMHtVAmbL4yK8QEuTb7fioNuGh2xjhmWITQsF5k1qsMiUlWaSok0xwksF@lists.infradead.org
X-Gm-Message-State: AOJu0YyM3zxJFXoRrXbQQwWfz+jl/PesXgLweZu7QHcTmTSLKFKI71IS
	zypGEqIDL6WTZskypNUghGWhHZii1d35pJBhbKU6gfuFVCXzP3LPFZjwErJnI9u/UijB8BLoQVa
	eLk/nqZMRYmJszU+NFIDP3bGnmBOS8dYmwkOHPN2I
X-Gm-Gg: AeBDieuZEceuKD5vcI/9HZtdwJ48HX/n6gSFrAP4StgsVk/dytFHh3BvELcjGDtY4Dz
	qwK0ated0Sm9yl4/o7+HHR85+6mnUJ1UciaFzIE6pR9uN6dZqXDiQ7lDsf0oz5Z4r0XEnqW+dbo
	U7zIwCs1CD12bt7soN/Rfq7NdvOU9K0bCN0sY1PlaPIp+rQFPqdVEpIy0PKjm0gVmeWAYWtx/dz
	lKK7DtSVU/HK7DvLIyhA3vKuoSnVOFj9mGqqC0fDvAfax9unTnR0Mdae3ht9MKpQJ03AveNxSbk
	lMr2KPxCxhnkCY2Vu4ypKUb4W5SHCQ==
X-Received: by 2002:a17:903:2b0f:b0:2b0:5e19:1862 with SMTP id
 d9443c01a7336-2b2c8c74a19mr8024825ad.5.1775869509864; Fri, 10 Apr 2026
 18:05:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260305221927.3237145-1-irogers@google.com> <20260404054032.1538095-1-irogers@google.com>
In-Reply-To: <20260404054032.1538095-1-irogers@google.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 10 Apr 2026 18:04:57 -0700
X-Gm-Features: AQROBzCtgctYT5mXdJK7EI3KpOUNV_dJ28NxpQWANsDrRDgoBgsKRGHzUd38rjo
Message-ID: <CAP-5=fUz60Guq_gVV6wb_FfwhPs-fUN+PAbB3rQn3pycXbF3DA@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] perf libunwind multiple remote support
To: acme@kernel.org
Cc: 9erthalion6@gmail.com, adrian.hunter@intel.com, alex@ghiti.fr, 
	alexander.shishkin@linux.intel.com, andrew.jones@oss.qualcomm.com, 
	aou@eecs.berkeley.edu, atrajeev@linux.ibm.com, blakejones@google.com, 
	ctshao@google.com, dapeng1.mi@linux.intel.com, howardchu95@gmail.com, 
	james.clark@linaro.org, john.g.garry@oracle.com, jolsa@kernel.org, 
	leo.yan@linux.dev, libunwind-devel@nongnu.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org, 
	mingo@redhat.com, namhyung@kernel.org, palmer@dabbelt.com, 
	peterz@infradead.org, pjw@kernel.org, shimin.guo@skydio.com, 
	tglozar@redhat.com, tmricht@linux.ibm.com, will@kernel.org, yuzhuo@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_180512_470239_A6F50761 
X-CRM114-Status: GOOD (  25.26  )
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

On Fri, Apr 3, 2026 at 10:40=E2=80=AFPM Ian Rogers <irogers@google.com> wro=
te:
>
> Fix the libunwind build for when libdw and libunwind are feature
> detected, currently failing with a duplicate symbol.
>
> Refactor the libunwind support so that whenever a remote target is
> available, perf functions using the ELF machine can use that remote
> target regardless of what the host/local machine is. Migrate existing
> libunwind supported architectures like powerpc, arm64 and loongarch so
> that they can work in a cross-architecture way. Add support for
> RISC-V. Make the code more regular in function names, etc. and avoid
> including a C-file. This increases the lines of code. It is similar in
> style to the unwind-libdw implementation. It is hoped that the more
> uniform nature of the code with help with refactoring the perf
> registers for SIMD/APX support.
>
> Aside from local host testing these patches are under tested, in part
> as I'm failing to see how to build libunwind with support for multiple
> remote targets. Please could I get help in testing.
>
> v3: Minor whitespace clean up and warn when a dynamic choice of libdw
>     or libunwind is selected for unwinding and support is missing (Arnald=
o).

Hi Arnaldo,

anything else outstanding from this series?

Thanks,
Ian

> v2: Move two fixes patches to position 1 and 2 in the series. Fix
>     struct naming inconsistency, Andrew Jones
>     <andrew.jones@oss.qualcomm.com>. Fix other inconsistencies and
>     potential non-x86 build issues.
> https://lore.kernel.org/lkml/20260305221927.3237145-1-irogers@google.com/
>
> v1: https://lore.kernel.org/lkml/20260224142938.26088-1-irogers@google.co=
m/
>
> Ian Rogers (8):
>   perf unwind: Refactor get_entries to allow dynamic libdw/libunwind
>     selection
>   perf build loongarch: Remove reference to missing file
>   tools build: Deduplicate test-libunwind for different architectures
>   perf build: Be more programmatic when setting up libunwind variables
>   perf unwind-libunwind: Make libunwind register reading cross platform
>   perf unwind-libunwind: Move flush/finish access out of local
>   perf unwind-libunwind: Remove libunwind-local
>   perf unwind-libunwind: Add RISC-V libunwind support
>
>  tools/build/feature/Makefile                  |  38 +-
>  tools/build/feature/test-libunwind-aarch64.c  |  27 -
>  tools/build/feature/test-libunwind-arm.c      |  28 -
>  .../test-libunwind-debug-frame-aarch64.c      |  17 -
>  .../feature/test-libunwind-debug-frame-arm.c  |  17 -
>  .../feature/test-libunwind-debug-frame.c      |   1 -
>  tools/build/feature/test-libunwind-x86.c      |  28 -
>  tools/build/feature/test-libunwind-x86_64.c   |  28 -
>  tools/build/feature/test-libunwind.c          |   1 -
>  tools/perf/Makefile.config                    | 215 ++---
>  tools/perf/arch/arm/util/Build                |   2 -
>  tools/perf/arch/arm/util/unwind-libunwind.c   |  50 --
>  tools/perf/arch/arm64/util/Build              |   1 -
>  tools/perf/arch/arm64/util/unwind-libunwind.c |  17 -
>  tools/perf/arch/loongarch/util/Build          |   3 -
>  .../arch/loongarch/util/unwind-libunwind.c    |  82 --
>  tools/perf/arch/mips/Build                    |   1 -
>  tools/perf/arch/mips/util/Build               |   1 -
>  tools/perf/arch/mips/util/unwind-libunwind.c  |  22 -
>  tools/perf/arch/powerpc/util/Build            |   1 -
>  .../perf/arch/powerpc/util/unwind-libunwind.c |  92 --
>  tools/perf/arch/x86/util/Build                |   3 -
>  tools/perf/arch/x86/util/unwind-libunwind.c   | 115 ---
>  tools/perf/builtin-inject.c                   |   4 +
>  tools/perf/builtin-report.c                   |   4 +
>  tools/perf/builtin-script.c                   |   4 +
>  tools/perf/util/Build                         |   5 +-
>  tools/perf/util/libunwind-arch/Build          |  11 +
>  .../perf/util/libunwind-arch/libunwind-arch.c | 319 +++++++
>  .../perf/util/libunwind-arch/libunwind-arch.h | 296 +++++++
>  .../perf/util/libunwind-arch/libunwind-arm.c  | 290 ++++++
>  .../util/libunwind-arch/libunwind-arm64.c     | 289 ++++++
>  .../perf/util/libunwind-arch/libunwind-i386.c | 312 +++++++
>  .../util/libunwind-arch/libunwind-loongarch.c | 297 +++++++
>  .../perf/util/libunwind-arch/libunwind-mips.c | 299 +++++++
>  .../util/libunwind-arch/libunwind-ppc32.c     | 301 +++++++
>  .../util/libunwind-arch/libunwind-ppc64.c     | 303 +++++++
>  .../util/libunwind-arch/libunwind-riscv.c     | 297 +++++++
>  .../perf/util/libunwind-arch/libunwind-s390.c | 299 +++++++
>  .../util/libunwind-arch/libunwind-x86_64.c    | 320 +++++++
>  tools/perf/util/libunwind/arm64.c             |  40 -
>  tools/perf/util/libunwind/x86_32.c            |  41 -
>  tools/perf/util/maps.c                        |  29 +-
>  tools/perf/util/maps.h                        |   4 +-
>  tools/perf/util/symbol_conf.h                 |  10 +
>  tools/perf/util/thread.c                      |  29 +-
>  tools/perf/util/unwind-libdw.c                |   2 +-
>  tools/perf/util/unwind-libunwind-local.c      | 832 ------------------
>  tools/perf/util/unwind-libunwind.c            | 679 ++++++++++++--
>  tools/perf/util/unwind.c                      |  98 +++
>  tools/perf/util/unwind.h                      |  77 +-
>  51 files changed, 4549 insertions(+), 1732 deletions(-)
>  delete mode 100644 tools/build/feature/test-libunwind-aarch64.c
>  delete mode 100644 tools/build/feature/test-libunwind-arm.c
>  delete mode 100644 tools/build/feature/test-libunwind-debug-frame-aarch6=
4.c
>  delete mode 100644 tools/build/feature/test-libunwind-debug-frame-arm.c
>  delete mode 100644 tools/build/feature/test-libunwind-x86.c
>  delete mode 100644 tools/build/feature/test-libunwind-x86_64.c
>  delete mode 100644 tools/perf/arch/arm/util/unwind-libunwind.c
>  delete mode 100644 tools/perf/arch/arm64/util/unwind-libunwind.c
>  delete mode 100644 tools/perf/arch/loongarch/util/unwind-libunwind.c
>  delete mode 100644 tools/perf/arch/mips/Build
>  delete mode 100644 tools/perf/arch/mips/util/Build
>  delete mode 100644 tools/perf/arch/mips/util/unwind-libunwind.c
>  delete mode 100644 tools/perf/arch/powerpc/util/unwind-libunwind.c
>  delete mode 100644 tools/perf/arch/x86/util/unwind-libunwind.c
>  create mode 100644 tools/perf/util/libunwind-arch/Build
>  create mode 100644 tools/perf/util/libunwind-arch/libunwind-arch.c
>  create mode 100644 tools/perf/util/libunwind-arch/libunwind-arch.h
>  create mode 100644 tools/perf/util/libunwind-arch/libunwind-arm.c
>  create mode 100644 tools/perf/util/libunwind-arch/libunwind-arm64.c
>  create mode 100644 tools/perf/util/libunwind-arch/libunwind-i386.c
>  create mode 100644 tools/perf/util/libunwind-arch/libunwind-loongarch.c
>  create mode 100644 tools/perf/util/libunwind-arch/libunwind-mips.c
>  create mode 100644 tools/perf/util/libunwind-arch/libunwind-ppc32.c
>  create mode 100644 tools/perf/util/libunwind-arch/libunwind-ppc64.c
>  create mode 100644 tools/perf/util/libunwind-arch/libunwind-riscv.c
>  create mode 100644 tools/perf/util/libunwind-arch/libunwind-s390.c
>  create mode 100644 tools/perf/util/libunwind-arch/libunwind-x86_64.c
>  delete mode 100644 tools/perf/util/libunwind/arm64.c
>  delete mode 100644 tools/perf/util/libunwind/x86_32.c
>  delete mode 100644 tools/perf/util/unwind-libunwind-local.c
>  create mode 100644 tools/perf/util/unwind.c
>
> --
> 2.53.0.1213.gd9a14994de-goog
>

