Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8844F108B8FF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Mar 2026 03:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G1u2A7Wmr7+BgkJQ4sTGR6krxwXZYsSpdKl+44diHvM=; b=CTJ9vg5ycv0gMnUsKV6s//g1Tx
	zr/c1LA3/99oxsqcCuBjSM6nszFAzGpmOZnT9XjnwJjU6jI5v1t/MQhOj17luJHBCecYnCj8a+r4c
	7mN3Ajg0dRaC5mLM/29B4wHU+7SRzHNfaVC9oi9sTy5xQxw7xoHKuzJdOcTtaAMGkfhJ2rnnHtAHv
	/UWBMrgshYKgisBzOndwUej7EB1oYMHCK1eNucL6zYrbDxgvqvXJpexBYdIUHj/0tcztlK22KPH5B
	m+yKlaSlbdtUGZYmhYLvIsI+5RX/YzAAvwD8VMwDRcRs3e7PEUf4wWZKzfpQNr89+ZoytBFmgWtdm
	5vAOryDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3mfy-0000000DwUC-3Zey;
	Sat, 21 Mar 2026 03:06:58 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3mfw-0000000DwTR-0w9v
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Mar 2026 03:06:57 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2b052562254so52785ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 20:06:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774062414; cv=none;
        d=google.com; s=arc-20240605;
        b=QB0NEQykaRSC6YHSUuuzE0Z7wO2fc8dtTYIPqxQ7/m8qWBa8mU1Qs4KDFxuu3ouJ/s
         CA5AE+W7/2S/mOp8UXpsiMKwvYqYJy3chmrDgUqzs6azhZGloyGKKicifv/nSfC1KOYd
         JMklxIRX+IlpA8ZTrijuPSOymBoZw+J+ySvAwV4S7KTK5hsR254upSnLSQzmpUVzmL22
         hXF3XOvXxwNcq+44Mp/nKOfmLUESu4xGF+iazlrK+qsVzvE1B+A70PVsBPmWS35yz3ay
         WROfUYQBmk40rGS+OPZlGhySqyeIjIs3IUr7jdcMk/TOfw3pUIWIfAh3U4tV7zWHTfHa
         CbSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=G1u2A7Wmr7+BgkJQ4sTGR6krxwXZYsSpdKl+44diHvM=;
        fh=URZJ9KUC1rAGN94Q/j2nt7mI5IMLVfLAyz1+MquklUg=;
        b=kBzyKAlwAPwhrHp4p1YbCpJ38dgGcfvb1qgenbSF4Z8KDUA0USF31vG+HAlhM8cjqi
         5qn5pSR/QbW2oNUjInBKQmpflCS0mb7nQgu+PtbDcF+a3rlBboB7jUrCS98CZwUYy+qR
         3cEpMCGqJuM7rN+ITwynqIHdxU50oN23x0Nvs575Eym7udnpRMOdCd+rY4ctiRfcyAA2
         om0tVWOxFzJRLWpXDPrZecVJ3xwUsxSDUfXiTEY80S74YN4NmPHBjtEdtlDjDorPXpyU
         8gaXtoHHhPL58eu/7UjJvvpl/6X2nHIZPPEdeKpAh/l8dY5h4knqHZT3AwGoquIoQlLy
         Abzw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774062414; x=1774667214; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G1u2A7Wmr7+BgkJQ4sTGR6krxwXZYsSpdKl+44diHvM=;
        b=e6CRFY2b2t8tzTdNrGKjRsDExc/yzX9drTvUi4qdqfhJklPzX+jf1hWkpYEjFT/+jK
         W8i9TAziagjmxQRLU1n+ezqRJ9CQrtmKAZhTRq0uQa3JvxeFz2Osv4U+dxJCarTBXE2t
         ZHR9aoNRDh24gimAq8Nx3RE8Eq1zzdR52S5k1MRi6Nwj4xBQffXMT943R4xwA6XopVLo
         4HydKrwg0kG4arF8RPPw736z2qdpazjpBCl7jaPyzl1RMvbGSD1YMq5PCFBjm9KOg+sw
         tUBHKMCLKhQ0xHOG0wtt1kv8nsBIVVnXHyOEQiVIXemf9fuRnb+tFNwWrJf671vTAteO
         TVmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774062414; x=1774667214;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=G1u2A7Wmr7+BgkJQ4sTGR6krxwXZYsSpdKl+44diHvM=;
        b=jlJ5x7ndlHgwzpP8BT4rn/Bi4pcKfH0sU6TMh00+rUNLCzB7KTFWmCRdP+dgjH5yEu
         O6qXZlVgIiL05qfvmr535NpwdlYJ3VHnNrpW5IYMm+iTs0wpdowQufgLPLtVCAeYK7mv
         IftE4mIySjw2BgoCKAkOPOmJDrgDC629KR2lOXV/1f8W0e/bznc8tjcTIVFwlyZwpnvq
         2J1gK7BMy4+ScHEiv8jpvhFlsKA2RKd6hW015xnbibZEq0Qm/6Z+6Iq4aIns5fHe38sr
         4SYg9n3on9/J/3jCFoY+0oWpj94sQT3N1ByAWaHhsezxXckxyWlGUcztlpmeP9Gvx6wO
         RNcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjLTQNzCNTJu56DA0N9Ir/A7ENAyDZ51XoBJfaUJvLBRy037q1Q1U2iCzra/yIJ74kEkUjcBmgY3nOYwBbEkqX@lists.infradead.org
X-Gm-Message-State: AOJu0Ywm3AY/hCQMzEbvLS7sWFEXvrHEyrsh01vVii/fRg+WpZm+uQ2J
	bXs9/NcEFi9+8mRnJ1puexcvZFeBWEio9ua1VIXHHaR48KEHmYE32euf1IBn6rduuiczhiXjmm1
	Q7hXek1ENGjTw0GEexOoVUhf5ltcAy8snqkS/YQSi
X-Gm-Gg: ATEYQzz4m/Z8VpjONeBMB4r5b56t0hxaXZ8yRpT1tk+MAk/DJD8PywlvVEFqjhBalTV
	CD1rxFU6WXOGsIMfAxhg1sO3/hnDpiMINgzbArN5aAnNDgO2y2nzbHgawZ1dci1tDCiqMxOSRZJ
	n6nm810XW3/dQEbPQpIbiK9ftn0jaEe6zzOlEcWgpdRvYHhA023fW7ag8Cn4S46HbjWjlA+s0WV
	wq/ooaupF0bX2cP8AeGLzl/e0yGJnQ+mhq8hUUlf1NNS4IvUwyXQ06s3MVvFGZ7Wyh5Uu/qGQU7
	onloe3Iz
X-Received: by 2002:a17:903:1b2b:b0:2ad:6f9b:3b2e with SMTP id
 d9443c01a7336-2b08c46bb85mr1193195ad.23.1774062414044; Fri, 20 Mar 2026
 20:06:54 -0700 (PDT)
MIME-Version: 1.0
References: <CAP-5=fWVU3ktkGAnZQrjQJf+Z5AtQo73BVUhj-nr3H95GdcEJQ@mail.gmail.com>
 <20260305221927.3237145-1-irogers@google.com> <abxs-2rozL1tBEO1@google.com>
In-Reply-To: <abxs-2rozL1tBEO1@google.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 20 Mar 2026 20:06:42 -0700
X-Gm-Features: AaiRm50GKgA2m097_r_LRBfJe7uc84BV7Ex9dBKU2eCRmJOWzuBOeVNhLtt3CGs
Message-ID: <CAP-5=fVEKifx7VZJAsoPFguMPipW66k-06vgb9iE2oO6GxSxdw@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] perf libunwind multiple remote support
To: Namhyung Kim <namhyung@kernel.org>, Guilherme Amadio <amadio@gentoo.org>
Cc: 9erthalion6@gmail.com, acme@kernel.org, adrian.hunter@intel.com, 
	alex@ghiti.fr, alexander.shishkin@linux.intel.com, 
	andrew.jones@oss.qualcomm.com, aou@eecs.berkeley.edu, atrajeev@linux.ibm.com, 
	blakejones@google.com, ctshao@google.com, dapeng1.mi@linux.intel.com, 
	howardchu95@gmail.com, james.clark@linaro.org, john.g.garry@oracle.com, 
	jolsa@kernel.org, leo.yan@linux.dev, libunwind-devel@nongnu.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org, 
	mingo@redhat.com, palmer@dabbelt.com, peterz@infradead.org, pjw@kernel.org, 
	shimin.guo@skydio.com, tglozar@redhat.com, tmricht@linux.ibm.com, 
	will@kernel.org, yuzhuo@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_200656_315968_CBF4F890 
X-CRM114-Status: GOOD (  33.36  )
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

On Thu, Mar 19, 2026 at 2:39=E2=80=AFPM Namhyung Kim <namhyung@kernel.org> =
wrote:
>
> Hi Ian,
>
> On Thu, Mar 05, 2026 at 02:19:19PM -0800, Ian Rogers wrote:
> > Fix the libunwind build for when libdw and libunwind are feature
> > detected, currently failing with a duplicate symbol.
> >
> > Refactor the libunwind support so that whenever a remote target is
> > available, perf functions using the ELF machine can use that remote
> > target regardless of what the host/local machine is. Migrate existing
> > libunwind supported architectures like powerpc, arm64 and loongarch so
> > that they can work in a cross-architecture way. Add support for
> > RISC-V. Make the code more regular in function names, etc. and avoid
> > including a C-file. This increases the lines of code. It is similar in
> > style to the unwind-libdw implementation. It is hoped that the more
> > uniform nature of the code with help with refactoring the perf
> > registers for SIMD/APX support.
> >
> > Aside from local host testing these patches are under tested, in part
> > as I'm failing to see how to build libunwind with support for multiple
> > remote targets. Please could I get help in testing.
>
> It seems libunwind project is not actively maintained.  Assuming libdw
> unwinding is performant enough, we may want to get rid of libunwind
> support.

Guilherme, is it true that libunwind is built into perf with Gentoo?

The performance fix for unwinding with libdw is in commit
6b2658b3f36a ("perf unwind-libdw: Don't discard loaded ELF/DWARF after
every unwind") that is currently only in v7.0-rc[1-4].

In commit 13e17c9ff49119aa ("perf build: Make libunwind opt-in rather
than opt-out"), perf made libunwind opt-in rather than opt-out. This
change is in v6.13.

LLVM has a libunwind project but LLVM scares me because its library
dependencies are so large.

Perhaps we should merge these changes and then delete the libunwind
support in 2 or 3 releases time. I believe this is closer to how
libbpf deprecated the pre-1.0 behaviors. Personally I don't mind if we
just delete everything now, but typically we're not that aggressive.

Thanks,
Ian

> Thanks,
> Namhyung
>
> >
> > v2: Move two fixes patches to position 1 and 2 in the series. Fix
> >     struct naming inconsistency, Andrew Jones
> >     <andrew.jones@oss.qualcomm.com>. Fix other inconsistencies and
> >     potential non-x86 build issues.
> >
> > v1: https://lore.kernel.org/lkml/20260224142938.26088-1-irogers@google.=
com/
> >
> > Ian Rogers (8):
> >   perf unwind: Refactor get_entries to allow dynamic libdw/libunwind
> >     selection
> >   perf build loongarch: Remove reference to missing file
> >   tools build: Deduplicate test-libunwind for different architectures
> >   perf build: Be more programmatic when setting up libunwind variables
> >   perf unwind-libunwind: Make libunwind register reading cross platform
> >   perf unwind-libunwind: Move flush/finish access out of local
> >   perf unwind-libunwind: Remove libunwind-local
> >   perf unwind-libunwind: Add RISC-V libunwind support
> >
> >  tools/build/feature/Makefile                  |  38 +-
> >  tools/build/feature/test-libunwind-aarch64.c  |  27 -
> >  tools/build/feature/test-libunwind-arm.c      |  28 -
> >  .../test-libunwind-debug-frame-aarch64.c      |  17 -
> >  .../feature/test-libunwind-debug-frame-arm.c  |  17 -
> >  .../feature/test-libunwind-debug-frame.c      |   1 -
> >  tools/build/feature/test-libunwind-x86.c      |  28 -
> >  tools/build/feature/test-libunwind-x86_64.c   |  28 -
> >  tools/build/feature/test-libunwind.c          |   1 -
> >  tools/perf/Makefile.config                    | 215 ++---
> >  tools/perf/arch/arm/util/Build                |   2 -
> >  tools/perf/arch/arm/util/unwind-libunwind.c   |  50 --
> >  tools/perf/arch/arm64/util/Build              |   1 -
> >  tools/perf/arch/arm64/util/unwind-libunwind.c |  17 -
> >  tools/perf/arch/loongarch/util/Build          |   3 -
> >  .../arch/loongarch/util/unwind-libunwind.c    |  82 --
> >  tools/perf/arch/mips/Build                    |   1 -
> >  tools/perf/arch/mips/util/Build               |   1 -
> >  tools/perf/arch/mips/util/unwind-libunwind.c  |  22 -
> >  tools/perf/arch/powerpc/util/Build            |   1 -
> >  .../perf/arch/powerpc/util/unwind-libunwind.c |  92 --
> >  tools/perf/arch/x86/util/Build                |   3 -
> >  tools/perf/arch/x86/util/unwind-libunwind.c   | 115 ---
> >  tools/perf/builtin-inject.c                   |   4 +
> >  tools/perf/builtin-report.c                   |   4 +
> >  tools/perf/builtin-script.c                   |   4 +
> >  tools/perf/util/Build                         |   5 +-
> >  tools/perf/util/libunwind-arch/Build          |  11 +
> >  .../perf/util/libunwind-arch/libunwind-arch.c | 319 +++++++
> >  .../perf/util/libunwind-arch/libunwind-arch.h | 296 +++++++
> >  .../perf/util/libunwind-arch/libunwind-arm.c  | 290 ++++++
> >  .../util/libunwind-arch/libunwind-arm64.c     | 289 ++++++
> >  .../perf/util/libunwind-arch/libunwind-i386.c | 312 +++++++
> >  .../util/libunwind-arch/libunwind-loongarch.c | 297 +++++++
> >  .../perf/util/libunwind-arch/libunwind-mips.c | 299 +++++++
> >  .../util/libunwind-arch/libunwind-ppc32.c     | 301 +++++++
> >  .../util/libunwind-arch/libunwind-ppc64.c     | 303 +++++++
> >  .../util/libunwind-arch/libunwind-riscv.c     | 297 +++++++
> >  .../perf/util/libunwind-arch/libunwind-s390.c | 299 +++++++
> >  .../util/libunwind-arch/libunwind-x86_64.c    | 320 +++++++
> >  tools/perf/util/libunwind/arm64.c             |  40 -
> >  tools/perf/util/libunwind/x86_32.c            |  41 -
> >  tools/perf/util/maps.c                        |  29 +-
> >  tools/perf/util/maps.h                        |   4 +-
> >  tools/perf/util/symbol_conf.h                 |  15 +
> >  tools/perf/util/thread.c                      |  29 +-
> >  tools/perf/util/unwind-libdw.c                |   2 +-
> >  tools/perf/util/unwind-libunwind-local.c      | 832 ------------------
> >  tools/perf/util/unwind-libunwind.c            | 679 ++++++++++++--
> >  tools/perf/util/unwind.c                      | 102 +++
> >  tools/perf/util/unwind.h                      |  56 +-
> >  51 files changed, 4536 insertions(+), 1733 deletions(-)
> >  delete mode 100644 tools/build/feature/test-libunwind-aarch64.c
> >  delete mode 100644 tools/build/feature/test-libunwind-arm.c
> >  delete mode 100644 tools/build/feature/test-libunwind-debug-frame-aarc=
h64.c
> >  delete mode 100644 tools/build/feature/test-libunwind-debug-frame-arm.=
c
> >  delete mode 100644 tools/build/feature/test-libunwind-x86.c
> >  delete mode 100644 tools/build/feature/test-libunwind-x86_64.c
> >  delete mode 100644 tools/perf/arch/arm/util/unwind-libunwind.c
> >  delete mode 100644 tools/perf/arch/arm64/util/unwind-libunwind.c
> >  delete mode 100644 tools/perf/arch/loongarch/util/unwind-libunwind.c
> >  delete mode 100644 tools/perf/arch/mips/Build
> >  delete mode 100644 tools/perf/arch/mips/util/Build
> >  delete mode 100644 tools/perf/arch/mips/util/unwind-libunwind.c
> >  delete mode 100644 tools/perf/arch/powerpc/util/unwind-libunwind.c
> >  delete mode 100644 tools/perf/arch/x86/util/unwind-libunwind.c
> >  create mode 100644 tools/perf/util/libunwind-arch/Build
> >  create mode 100644 tools/perf/util/libunwind-arch/libunwind-arch.c
> >  create mode 100644 tools/perf/util/libunwind-arch/libunwind-arch.h
> >  create mode 100644 tools/perf/util/libunwind-arch/libunwind-arm.c
> >  create mode 100644 tools/perf/util/libunwind-arch/libunwind-arm64.c
> >  create mode 100644 tools/perf/util/libunwind-arch/libunwind-i386.c
> >  create mode 100644 tools/perf/util/libunwind-arch/libunwind-loongarch.=
c
> >  create mode 100644 tools/perf/util/libunwind-arch/libunwind-mips.c
> >  create mode 100644 tools/perf/util/libunwind-arch/libunwind-ppc32.c
> >  create mode 100644 tools/perf/util/libunwind-arch/libunwind-ppc64.c
> >  create mode 100644 tools/perf/util/libunwind-arch/libunwind-riscv.c
> >  create mode 100644 tools/perf/util/libunwind-arch/libunwind-s390.c
> >  create mode 100644 tools/perf/util/libunwind-arch/libunwind-x86_64.c
> >  delete mode 100644 tools/perf/util/libunwind/arm64.c
> >  delete mode 100644 tools/perf/util/libunwind/x86_32.c
> >  delete mode 100644 tools/perf/util/unwind-libunwind-local.c
> >  create mode 100644 tools/perf/util/unwind.c
> >
> > --
> > 2.53.0.473.g4a7958ca14-goog
> >

