Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 717F1CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 16:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UTb9VOWLgej72NUzrLbG/r3dp+jDNhJ8HUkQVGXZx6E=; b=BXiQtKc91G4gMycl3hr9ICXPml
	XadfvCIcR+lE2kZNz/jdGMooOiFNfkCkBZ+Uyt7rAwXMb6o1MvYDuXTObcxuj1Z+CH/2EtjWubpm7
	IaWZq47IVFXK04D0LzXvCvUSTTmeE4VkON1bJLMlaHW3P4Sga0FfcRda7B1H2zpKxkUyhvFbkzLNP
	L4QvhY+s1/dUFzJRyiVRV9nRAvPrKOyBO7LZqTuAE6K+5dcPxhCj2K4UvJilshR7F7SIdbuhD0VkO
	waPqpOsuTX0kk5Ob78crSHNLA8nFkxT/DFOdva8uNS0Us7k3RC5zs1/UygE2C/SUR/Mk2tJ2JAQX6
	rzrvCZew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNZHS-0000000673i-1Su0;
	Thu, 14 May 2026 16:51:26 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNZHP-0000000672z-40u8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 16:51:25 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2b2e8b95bdbso2645ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 09:51:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778777483; cv=none;
        d=google.com; s=arc-20240605;
        b=Xyo+CMpwNtQkdb+UkHXtmzpZm/6dasaPdzsAxNN+pnBgyE36tAzrepn+UR/JiWhOuL
         jPhrJOnIwRjOr8RLsN6gJCQV2urc2YPgBwfKbCnj4r/B7KppY0rxqwHoDFdNHrdOoonY
         cj31jEz6UkCjOS7Plj/9LRL0HPDiY0F/63VVNpxQqAd4hVlLTfKoyCi+aj6hxaHzahgx
         n/ye2+7R1R74F57u7vf6hj+tgdFEmOV4NSBYjRh8NI2MlPlV4yyaq0rWMwNNJsY0gDE4
         zGNdiU1WpBvlVAi1QA6yMoDVc7egFghUFeJuo32HxZO0x0kQTQg3lG9oI/CYX5eAPrU2
         HtaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UTb9VOWLgej72NUzrLbG/r3dp+jDNhJ8HUkQVGXZx6E=;
        fh=/Vub+a3Ax9nveUM5eQm7bovRXr7JqQoMceLIo9VLgpo=;
        b=SR1NNEoSoCKKDYdDcvjY1/Uue7cYXj06pfzu25bb5uvN+WiK8Aup3Zccwjh4z4T9Wu
         QWAlSizk5RcVKuYcNuqkEFzfVGuxsVzrSdAFFbLniKuzVKUEDMGRsb2hs1GEDZOxpf/T
         Ox13wrEvlue2kZzAOpDroYgAnDCaBjWAcZtTPG8xqLbzox1v5GFmK5pV4CQT+uEmkCSA
         Mmnjo6IWIlfl9q/mrwnk1w9r6e2Fm9tfqKLANrvUxPEFssasdtosS9/bhGCD/0BHFI5h
         EESb4bn2tE3RcaBdUPP9qmxYlvuWOtAfM6iwArmFpY0MxQUL4MA5rNJGYtfw18XfR64M
         KNJg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778777483; x=1779382283; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UTb9VOWLgej72NUzrLbG/r3dp+jDNhJ8HUkQVGXZx6E=;
        b=sO6PA7IDtAkRtBFwcvYBAjf7V+t1vR9sagtdkieGorqvXom2HQzpRn0V+2MLFw681K
         YGxnoe8Z43vFFFYU4osXXu5qjVLR/LUhOtaL53KgXTMBHF2mqWKomdXLwg0UY6IuKCNv
         LtU+JyqMRg6518UYvb0J1sO7Z3HdFl6j4L6jXlw20gc1/wf2zUPWWkqNGJghgMhyha/P
         TYkYCynbYDKS6Hw5BNg2+mUvrhgTcOf3A8U9SHKlYLGV87MdRFRLc/ONaPfbGU99Q+qz
         Pew6bfsv5TW7UKjK3+EIgvazKgD8JwEbArpYbJJ/MS8y+/H84kre0dp9eUr0mD3tnBq3
         mRZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778777483; x=1779382283;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UTb9VOWLgej72NUzrLbG/r3dp+jDNhJ8HUkQVGXZx6E=;
        b=J9wee4b2kMKNhEuFhe7E1qCZOO7RUjbgp/j3fkV7qAxPpAMOoyQUGFEeiKTsazdRl8
         EGMA91TdXt2yueZnGjVQJr/HFp3Rd44tMnXrwW58EFTQc1oQjHC1idgUQvde4Amdxywg
         c6oaXuZ52P1qN9fNA6xmYU/8u3QdGTFfh/5mFqbsS8EL2WUfphs7bUfBWnQu7q56UXzg
         rPEgJp/opaEylKs+u6YtLYBl98eZ/9CAl97PxXyPZboC56FYdKSkhLkri9l8PYVMW8BJ
         ZTV/khsL32pfDqylv5VCXNeWaD8cQQdm/x9frv88H2zdZ9ncZWr06gmS91PuP/g0cIaM
         XUxA==
X-Forwarded-Encrypted: i=1; AFNElJ/rqrD6TxZzJkmO5pWTEnMj1Ok+nV00bqVxXN/Mcnw8K4x+4gnLBJxU7jDjcvakGfza9IP/TObRF+3I7z1ZehS3@lists.infradead.org
X-Gm-Message-State: AOJu0YyZY/70EQIFNfxqS5aa46guIXrZ9nAq2D3AzlRwDtWYdl87Njm5
	lX1UbdfNjdZfdbyBkdcJwVKNY028lF2wn6NQMChimOXzk2qipw2a51v3CCfb+6YIb+lSGbQfhCH
	Bz3p9s7yv6unR2zOx3Lu6odP9YJETsGGxAkZoE4ab
X-Gm-Gg: Acq92OHYGDoK9QRppmkU2qtWcK05KKrnnmtBYzJSFzACBE06iabMoFEr9UndZcP9UIk
	x1YYo6gV47jxRGm1HiBS2OSZuSskManCdhIrGoQ2NtzKW9MTlZYvtV8meS1Qz6UFAZ/uIdZJsK6
	XUMoRaM9z6xlfP9vy0Ck5pfIWwlySevVR6bBZFrrZCAWRvE3O4mvGwM+XKOenTJunW4u6b0HAcK
	UoHlOCRep82nLSQtGnr+zJRCyBYBhj8aOv1a7IxLTxfE0CfiB857iGTaprXC3TfXhsCQYIXedeW
	rBkXoowcQF6rTWuEsvtX/DDISZ7EKiYC7hvXoP92BdkDQCU=
X-Received: by 2002:a17:903:290f:b0:2bd:6dad:7ccb with SMTP id
 d9443c01a7336-2bd6dad7e0bmr1042685ad.23.1778777482418; Thu, 14 May 2026
 09:51:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260413024805.1316480-1-irogers@google.com> <20260513233151.572332-1-irogers@google.com>
In-Reply-To: <20260513233151.572332-1-irogers@google.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 14 May 2026 09:51:09 -0700
X-Gm-Features: AVHnY4IgkWfYDaMSqVQBab29EPYgZmksZltdaS5chOvp2j0mkJEYQvlgA4fqxgU
Message-ID: <CAP-5=fW6S1XzZvq=kWj6ma=O1UCDrVV3ZNbzK0fMS_ho6e1qVg@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] perf libunwind multiple remote support
To: acme@kernel.org, adrian.hunter@intel.com, dapeng1.mi@linux.intel.com, 
	james.clark@linaro.org, namhyung@kernel.org, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Li Guan <guanli.oerv@isrc.iscas.ac.cn>
Cc: 9erthalion6@gmail.com, alex@ghiti.fr, alexander.shishkin@linux.intel.com, 
	andrew.jones@oss.qualcomm.com, aou@eecs.berkeley.edu, atrajeev@linux.ibm.com, 
	howardchu95@gmail.com, john.g.garry@oracle.com, jolsa@kernel.org, 
	leo.yan@linux.dev, libunwind-devel@nongnu.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org, 
	mingo@redhat.com, palmer@dabbelt.com, peterz@infradead.org, pjw@kernel.org, 
	shimin.guo@skydio.com, tglozar@redhat.com, tmricht@linux.ibm.com, 
	will@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_095124_006908_803F2227 
X-CRM114-Status: GOOD (  34.62  )
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

On Wed, May 13, 2026 at 4:32=E2=80=AFPM Ian Rogers <irogers@google.com> wro=
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
> uniform nature of the code will help with refactoring the perf
> registers for SIMD/APX support.
>
> Aside from local host testing these patches are under tested, in part
> as I'm failing to see how to build libunwind with support for multiple
> remote targets. Please could I get help in testing.

So the patches failed to apply in Sashiko:
https://sashiko.dev/#/patchset/20260513233151.572332-1-irogers%40google.com
The baseline logs show perf-tools-next was at commit 8c8f20936143
("perf build: Remove NO_GTK2 build test") which is 6 patches
out-of-date compared to the current tip these patches are against. I
ran Sashiko locally, so I don't expect a huge amount from the reviews.
Currently Sashiko is catching up with a backlog because its tokens
have a lower priority and there was high load earlier in the week.
Anyway, I could repost the patches for Sashiko review but given the
backlog I think that would just create noise at the moment. Hopefully
I can get human review so we can move forward with merging these
improvements.

Thanks,
Ian

> v5: Rebase dropping merged loong arch fix patch. Fixes to Sashiko
>     review feedback:
>     - Patch 1: Hooked unwind__configure() into perf_default_config().
>       Standardized unwinder return contracts (>0 success, 0 fallback,
>       <0 fatal).  Fixed UNWIND_STYLE_UNKNOWN fallback and added
>       memset() to clear config array on override.
>     - Patch 2: Dynamically populated FILES list in
>       tools/build/feature/Makefile using LIBUNWIND_ARCHS. Added
>       libunwind cases to FEATURE_TESTS_EXTRA in
>       tools/build/Makefile.feature for proper FEATURE-DUMP caching.
>     - Patch 3: Restored core -lunwind linkage to
>       FEATURE_CHECK_LDFLAGS.  Restored NO_LIBUNWIND fallback
>       validation, corrected EXTLIBS evaluation ordering for
>       BIONIC/Android compatibility, and restored static linking
>       multiple definition flags.
>     - Patch 4: Fixed out-of-bounds array read bugs (>=3D ARRAY_SIZE) in
>       libunwind-i386.c and libunwind-x86_64.c. Fixed constant typos
>       across LoongArch, PowerPC, and s390x.
>     - Patch 5: Added early EM_NONE and ops validation checks to
>       prevent warnings and NULL dereferences. Checked return value of
>       unwind__prepare_access() in maps__copy_from(). Corrected
>       architecture binding in thread__insert_map() by calculating
>       e_machine after map insertion.
>     - Patch 6: Aligned all remote architecture accessors to match
>       5-argument generic declarations (removing trailing
>       sizeof(unw_word_t)). Prevented frame discard on stack depth
>       limit by returning 0 instead of -1 in unwind_step(). Fixed
>       32-bit big-endian register corruption by replacing memcpy() with
>       conditional type-casted assignment. Fixed max_stack =3D=3D 1
>       fallback trigger. Fixed .debug_frame layout union corruption by
>       changing di.u.rti to di.u.ti across all DWARF find wrappers.
>     - Patch 7: Applied the same corrections (5-argument accessors,
>       u.ti union accessors, 0 return on max_ips) to the newly
>       introduced libunwind-riscv.c.
>
> v4: Rebase, in particular the zalloc->calloc change conflicted.
> https://lore.kernel.org/linux-perf-users/20260413024805.1316480-1-irogers=
@google.com/
>
> v3: Minor whitespace clean up and warn when a dynamic choice of libdw
>     or libunwind is selected for unwinding and support is missing (Arnald=
o).
> https://lore.kernel.org/lkml/20260404054032.1538095-1-irogers@google.com/
>
> v2: Move two fixes patches to position 1 and 2 in the series. Fix
>     struct naming inconsistency, Andrew Jones
>     <andrew.jones@oss.qualcomm.com>. Fix other inconsistencies and
>     potential non-x86 build issues.
> https://lore.kernel.org/lkml/20260305221927.3237145-1-irogers@google.com/
>
> v1: https://lore.kernel.org/lkml/20260224142938.26088-1-irogers@google.co=
m/
>
> Ian Rogers (7):
>   perf unwind: Refactor get_entries to allow dynamic libdw/libunwind
>     selection
>   tools build: Deduplicate test-libunwind for different architectures
>   perf build: Be more programmatic when setting up libunwind variables
>   perf unwind-libunwind: Make libunwind register reading cross platform
>   perf unwind-libunwind: Move flush/finish access out of local
>   perf unwind-libunwind: Remove libunwind-local
>   perf unwind-libunwind: Add RISC-V libunwind support
>
>  tools/build/Makefile.feature                  |  12 +-
>  tools/build/feature/Makefile                  |  46 +-
>  tools/build/feature/test-libunwind-aarch64.c  |  27 -
>  tools/build/feature/test-libunwind-arm.c      |  28 -
>  .../test-libunwind-debug-frame-aarch64.c      |  17 -
>  .../feature/test-libunwind-debug-frame-arm.c  |  17 -
>  .../feature/test-libunwind-debug-frame.c      |   1 -
>  tools/build/feature/test-libunwind-x86.c      |  28 -
>  tools/build/feature/test-libunwind-x86_64.c   |  28 -
>  tools/build/feature/test-libunwind.c          |   1 -
>  tools/perf/Makefile.config                    | 226 +++--
>  tools/perf/arch/arm/util/Build                |   2 -
>  tools/perf/arch/arm/util/unwind-libunwind.c   |  50 --
>  tools/perf/arch/arm64/util/Build              |   1 -
>  tools/perf/arch/arm64/util/unwind-libunwind.c |  17 -
>  tools/perf/arch/loongarch/util/Build          |   2 -
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
>  tools/perf/util/config.c                      |   4 +
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
>  tools/perf/util/maps.c                        |  34 +-
>  tools/perf/util/maps.h                        |   4 +-
>  tools/perf/util/symbol_conf.h                 |  10 +
>  tools/perf/util/thread.c                      |  32 +-
>  tools/perf/util/unwind-libdw.c                |  20 +-
>  tools/perf/util/unwind-libunwind-local.c      | 831 ------------------
>  tools/perf/util/unwind-libunwind.c            | 699 +++++++++++++--
>  tools/perf/util/unwind.c                      | 104 +++
>  tools/perf/util/unwind.h                      |  73 +-
>  53 files changed, 4623 insertions(+), 1739 deletions(-)
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
> 2.54.0.563.g4f69b47b94-goog
>

