Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7004410AB82D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 23:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T2YD6pwogaEbBAngQ7jzL1Df9t10z5n8+TMyot+6ut0=; b=2N9UVSrQ42A4n7jDlOd6nmlO6g
	varQr+VDwFLlQTb25xWiKdIyOQVfi3gSql5kZolekNkU4encKuULPS4IzsN+RjP+1oeioqdoWTJdT
	kzzuc+cqsEl7unrZI/8Yxv8wLJQUWcPXJCMyp0Lik0RZHXrxN8Y6wc9eqsuggX9uoraxlHAsh5hP8
	A+/W7wFBTyCRF8uZ05MoTuCTz/grAN5sd7qbJicfAxAnLJgzIJpUphXXk+ncV+kY1F2KadaqOzq4y
	GNNQGIiNeXUPOytcPhzhWIBk9PqDSX7WOhb4w7rmfOB4S0cnrbiEPnDTEC8IvLIph3TVwTfiQjYms
	pAeRHJxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5tuw-00000006NG9-1ZXK;
	Thu, 26 Mar 2026 23:15:10 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5tut-00000006NEz-1TRy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 23:15:08 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2b052562254so39905ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 16:15:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774566906; cv=none;
        d=google.com; s=arc-20240605;
        b=bgO017QICBWckQpS48znH5CwjUrgV79izYDi5Ju3ODZctBj1A05ICXpXnn20uimbmz
         GfOi5WfmCg1/qSRjovTTBRViZ23rG8AuLKOfxDd14cqH9q/mW4D9rhg3Wq0RFXFEh8Ff
         13xDOVIpiGcPwJnPBEnQlf03vCZnyumaFftLRPVTjhEbU9GbxLpChcEEWGePXWfooD1V
         3lRPMq0yDqgWy54qM0MJ7Pmjez32zgN+pS0NS/TFFztdWr8VhhwF1VLbLucqdT9BwyyG
         2efuiMq5Arz2qMRY8/QDGSq8/I5Q1AYr7ZEZjGsAqX2H1HrkqBNqsd4TWwaxWSqczlB+
         sMSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T2YD6pwogaEbBAngQ7jzL1Df9t10z5n8+TMyot+6ut0=;
        fh=RVXsjcLLHwh0ceC6QRkfmT9rxlDlcSXGUO9zD/6Z4vM=;
        b=NOrHSX0GiUmjpsh0V3K/AfBxFuaPpyH/AmsYMt1HjfEy65LNWKfWppLpPTPpbmi0yC
         44SvBobw8M96h1cPOtS7UfDVKF0N5sS09jAnCkv3K5obahMol+GOXQDOBocBB62rJuPu
         KxsMfV7lliMM/Osr+wpzYyZ/Mhm26+YlNtIX28e8YJvtbPWs/bMM0oQ5+Wju1oQkOwQh
         T1OKSd1BquFv8WOQ6nZz21JfMHNzaDLdsrTGvkmn8RpAfPmKA0T/j9n6R2XjJoApjBRV
         mBVG2lAzCPObUZyUE2BF0Qnl44mJEIEXFI7qu7SqRSo8Hv1/L0F96uN3umCFjF+W4Nx0
         Haeg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774566906; x=1775171706; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T2YD6pwogaEbBAngQ7jzL1Df9t10z5n8+TMyot+6ut0=;
        b=Q5byEToFW33y3G6LkZ8zaiTI9gbY6xdj0AVtG0Ul+siTO3iVbDnrrlbx1jY46Onu2K
         I/VSltMui89tWahQBDBYk7Vl5WgQfMQInk6m8MtvijmK+X5R7eqex33HXHvd6iB4XMTo
         Rr9bQaUqDHuSeBNDWr3RUl16HCTT3oXue2wwQV6aaHZ3iHUSV2aVxPuNpXcL2S8irGuw
         X4Fvisa+jKgjPrNJzhx4qG1YFMkpxGSkPOAJB3+7b2vM2sbVGkYsGq6N06HtNIX7HO0L
         MP1MWfj4DHjkwUCQi5PWNEzaVn61rPkQhwFHwaT3IjqF1PRk7t2NKgh0LRpdNYzCgs43
         7GEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774566906; x=1775171706;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T2YD6pwogaEbBAngQ7jzL1Df9t10z5n8+TMyot+6ut0=;
        b=P7ec0eKE02W0etD1sEJNzt9ZVMU/Z/7szQAiDN926ZcUfAHggSK/pkt1kORtoKC2pb
         rllvFXy9VgAnKbfwkWSRMsfMIKPBw+tTkgIqW8ncmkEkFniV4bHEQ1NHskABM/x3+qGv
         a0yxg4UJDaz1fZoLgxFxBPc0rckdmagdqSojir8KKUT9acevJfe2d7U0J2Hcl/YNR8bp
         58TgHNLCVrtBVB7xXXq+8AMOlKNx+KzeChAfyFs1LrP08PO9TPCzR6+Ie6CR/BrEZ5Te
         U7Szo3ZezR2G75bGFqaUnQW+mFQjIa+iqVck8YEXqQpyFg9H95cmGvxjCPoh/AVMiJQs
         ksTg==
X-Forwarded-Encrypted: i=1; AJvYcCXjugZxRtVYHo7aqehJxqUQ6o3ui+iETe57ztsbxGVm8a+DpvvqdMg+aXl9vdrgNKKNAftM0HsicDFDLNzzaaDo@lists.infradead.org
X-Gm-Message-State: AOJu0YwXWDexQhfwYBjETyj9+w6MC5PI6ckm//kd1TLdqVFsLMYZBlNP
	8tLpIyxkAtjclnOE71J0A34uyhixkwmrNCgKIFpzCSQUnpJSykL/Tvtsb/NmxWewoum0c8bVvS9
	peXwwh7ea+jyNFa3AsgFIlK2aXiahjW6MHxXG2baV
X-Gm-Gg: ATEYQzz9MAKw6HGaC6YF2kiJhRXtanzyhUwWXqnkUkK6Ei3H0RmsE1tnnDvzQIbmgsX
	DprPxNyox1JOL4jmNOh9afyER5suBmBATT/zdShusOyMrQaIhua9ZrwmN3B4UmmA88lbXXCWQpT
	jMVDK88awjQi/AF76u0dTLK6qpuB1ObjfwLaWo2zQogBeXCeu/yec/ikUid4GJUhdTergX/0HBw
	RV2lGklXVtS1MtQImccIWW3d2Ix8RW/O02xHeR6sFtNS3WEWWuI+LUNYLSGIDgltWRQUREkI6Po
	ImGszG4=
X-Received: by 2002:a17:902:ef46:b0:2b0:5193:1212 with SMTP id
 d9443c01a7336-2b0cc23f103mr1451505ad.4.1774566905014; Thu, 26 Mar 2026
 16:15:05 -0700 (PDT)
MIME-Version: 1.0
References: <abxs-2rozL1tBEO1@google.com> <20260321234220.848859-1-irogers@google.com>
 <acW4Z2KJbyPZM1SG@google.com>
In-Reply-To: <acW4Z2KJbyPZM1SG@google.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 26 Mar 2026 16:14:52 -0700
X-Gm-Features: AQROBzAygKd6oTfrEHZEo1yOPUniUJvjrCTN9i1V25cS3M3lNv5jNRoxNUpz8Kw
Message-ID: <CAP-5=fV54H9o4FjALZU3wzEjBjNgGBb6zhaRmrjhseT_noggZA@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] perf build: Remove libunwind support
To: Namhyung Kim <namhyung@kernel.org>
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
	will@kernel.org, amadio@gentoo.org, yuzhuo@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_161507_388739_F9373F2E 
X-CRM114-Status: GOOD (  30.30  )
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

On Thu, Mar 26, 2026 at 3:51=E2=80=AFPM Namhyung Kim <namhyung@kernel.org> =
wrote:
>
> On Sat, Mar 21, 2026 at 04:42:18PM -0700, Ian Rogers wrote:
> > libunwind support exists for "--call-graph dwarf", however, libunwind
> > support has been opt-in rather than opt-out since Linux v6.13 as libdw
> > is preferred - commit 13e17c9ff49119aa ("perf build: Make libunwind
> > opt-in rather than opt-out"). A problem with the libdw support was
> > that it was slow, an issue fixed in Linux v7.0 in commit 6b2658b3f36a
> > ("perf unwind-libdw: Don't discard loaded ELF/DWARF after every
> > unwind"). As such libunwind support is now unnecessary.
> >
> > The patch series:
> > https://lore.kernel.org/lkml/20260305221927.3237145-1-irogers@google.co=
m/
> > looked to make the libunwind support in perf similar to the libdw
> > support, allow cross-architecture unwinding, etc. This was motivated
> > by the perf regs conventions being altered by the addition of x86 APX
> > support:
> > https://lore.kernel.org/lkml/20260209072047.2180332-1-dapeng1.mi@linux.=
intel.com/
> > It is necessary to translate the library's notion of registers to the
> > perf register convention so that the stack unwinding state can be
> > initialized. On this series it was stated that removing libunwind
> > support from perf should be an option, rather than updating support:
> > https://lore.kernel.org/lkml/abxs-2rozL1tBEO1@google.com/
> > This was also what motivated making libunwind opt-in rather than
> > opt-out.
> >
> > Given that 7 minor releases have happened with libunwind "deprecated"
> > by making it opt-in, let's remove the libunwind support. There doesn't
> > appear to be any disagreement to this on the mailing list.
>
> I'm not sure if we want to remove it now.  I think we need more time to
> verify libdw unwinding is stable and fast enough.  Also maybe we can
> add build- or run-time warning when people try to use libunwind.

I've had issues with old versions of libdw, but presumably the
distributions won't update perf without libdw. Given we're waiting
should we land the cleanup in:
https://lore.kernel.org/lkml/20260305221927.3237145-1-irogers@google.com/
We have test coverage.

Thanks,
Ian

> Thanks,
> Namhyung
>
> >
> > Ian Rogers (2):
> >   perf build: Remove libunwind support
> >   tools build: Remove libunwind feature tests
> >
> >  tools/build/feature/Makefile                  |  31 -
> >  tools/build/feature/test-libunwind-aarch64.c  |  27 -
> >  tools/build/feature/test-libunwind-arm.c      |  28 -
> >  .../test-libunwind-debug-frame-aarch64.c      |  17 -
> >  .../feature/test-libunwind-debug-frame-arm.c  |  17 -
> >  .../feature/test-libunwind-debug-frame.c      |  17 -
> >  tools/build/feature/test-libunwind-x86.c      |  28 -
> >  tools/build/feature/test-libunwind-x86_64.c   |  28 -
> >  tools/build/feature/test-libunwind.c          |  28 -
> >  tools/perf/Documentation/perf-check.txt       |   1 -
> >  tools/perf/Documentation/perf-config.txt      |   4 +-
> >  tools/perf/Documentation/perf-record.txt      |   2 +-
> >  tools/perf/Makefile.config                    | 163 +---
> >  tools/perf/Makefile.perf                      |   3 -
> >  tools/perf/arch/arm/util/Build                |   1 -
> >  tools/perf/arch/arm/util/unwind-libunwind.c   |  50 --
> >  tools/perf/arch/arm64/util/Build              |   1 -
> >  tools/perf/arch/arm64/util/unwind-libunwind.c |  17 -
> >  tools/perf/arch/loongarch/util/Build          |   1 -
> >  .../arch/loongarch/util/unwind-libunwind.c    |  82 --
> >  tools/perf/arch/mips/util/Build               |   1 -
> >  tools/perf/arch/mips/util/unwind-libunwind.c  |  22 -
> >  tools/perf/arch/powerpc/util/Build            |   1 -
> >  .../perf/arch/powerpc/util/unwind-libunwind.c |  92 --
> >  tools/perf/arch/x86/util/Build                |   1 -
> >  tools/perf/arch/x86/util/unwind-libunwind.c   | 115 ---
> >  tools/perf/builtin-check.c                    |   1 -
> >  tools/perf/builtin-report.c                   |   4 +-
> >  tools/perf/tests/make                         |   2 -
> >  tools/perf/util/Build                         |   5 -
> >  tools/perf/util/callchain.c                   |   2 +-
> >  tools/perf/util/dso.h                         |   6 -
> >  tools/perf/util/libunwind/arm64.c             |  40 -
> >  tools/perf/util/libunwind/x86_32.c            |  41 -
> >  tools/perf/util/maps.c                        |  47 +-
> >  tools/perf/util/maps.h                        |   6 -
> >  tools/perf/util/thread.c                      |  40 +-
> >  tools/perf/util/thread.h                      |   1 -
> >  tools/perf/util/unwind-libunwind-local.c      | 832 ------------------
> >  tools/perf/util/unwind-libunwind.c            |  92 --
> >  tools/perf/util/unwind.h                      |  41 +-
> >  41 files changed, 19 insertions(+), 1919 deletions(-)
> >  delete mode 100644 tools/build/feature/test-libunwind-aarch64.c
> >  delete mode 100644 tools/build/feature/test-libunwind-arm.c
> >  delete mode 100644 tools/build/feature/test-libunwind-debug-frame-aarc=
h64.c
> >  delete mode 100644 tools/build/feature/test-libunwind-debug-frame-arm.=
c
> >  delete mode 100644 tools/build/feature/test-libunwind-debug-frame.c
> >  delete mode 100644 tools/build/feature/test-libunwind-x86.c
> >  delete mode 100644 tools/build/feature/test-libunwind-x86_64.c
> >  delete mode 100644 tools/build/feature/test-libunwind.c
> >  delete mode 100644 tools/perf/arch/arm/util/unwind-libunwind.c
> >  delete mode 100644 tools/perf/arch/arm64/util/unwind-libunwind.c
> >  delete mode 100644 tools/perf/arch/loongarch/util/unwind-libunwind.c
> >  delete mode 100644 tools/perf/arch/mips/util/unwind-libunwind.c
> >  delete mode 100644 tools/perf/arch/powerpc/util/unwind-libunwind.c
> >  delete mode 100644 tools/perf/arch/x86/util/unwind-libunwind.c
> >  delete mode 100644 tools/perf/util/libunwind/arm64.c
> >  delete mode 100644 tools/perf/util/libunwind/x86_32.c
> >  delete mode 100644 tools/perf/util/unwind-libunwind-local.c
> >  delete mode 100644 tools/perf/util/unwind-libunwind.c
> >
> > --
> > 2.53.0.959.g497ff81fa9-goog
> >

