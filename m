Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CBF6CD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 23:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z/G4RlBPz/1FhVhJ+hkmK/O47djbhkf5nNV0WY5rxaI=; b=vg5mcSJZuHEUOwWmt2skHfUfSf
	yTIHM5fMAjNlfOSrBbBmKk38IhXYLfITKQbPArdbq/EJrbtjX9Wi05Wmc9/8YUS/m6I66UAMN7rwS
	R9H5WJOuJVS6ml1LFzDsuGMZ2Hfym4/zIqYGhyBCT6EPXWRoMDj0m9E1OfHDs5XfxmRHDzAMae7DH
	jQK/Rgm0eFfKs4OTpEEY5eov1zVgEsAIN4yuTD1pHjBwj2uvO296wCim5EAVqLNux8cT1wAXV5N9g
	FLsWcQE9TT9z8qyK/xFhhA6fKifKkiZfzPeF6dnLEnmUhBrSQ0MjmWzU1rg3efzIcj+v/fvFfWcRD
	riCv7etw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNJ3h-000000042S7-1PvH;
	Wed, 13 May 2026 23:32:09 +0000
Received: from mail-dy1-x134a.google.com ([2607:f8b0:4864:20::134a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNJ3d-000000042Pu-3PkF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 23:32:07 +0000
Received: by mail-dy1-x134a.google.com with SMTP id 5a478bee46e88-30230e64087so922599eec.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 16:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778715124; x=1779319924; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=z/G4RlBPz/1FhVhJ+hkmK/O47djbhkf5nNV0WY5rxaI=;
        b=hSaCeL8cewWi4nIaokkXn3hFQ0HwVEq2cwCx6JrHVeW6nIX2iQufV8uu66FxASG+R5
         sn+QLmGNMYNORoCijC+BuXO1rctGUzWszUyyb5ansUDcokztyjnzuyqtmv58pejXr0rI
         WM+4aRJ+tggrEXw3DTFkQDaW07oBhMGzJL6acmhD7QDBpakYO0IekaJZehmurUWnwcqy
         RLeU0IfflrN941ZrhU7688vfRKfvwY5OwHn0+K0tk8b1FcrUBwJVUE0NrEQgB+6NxE53
         pzv7+35oOSJlAWRJKP9N2/9Fz/l4+mVRnmB0TVPIh+w6flmrWBqjHOUfhnAzXvF+tK0O
         ITkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778715124; x=1779319924;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z/G4RlBPz/1FhVhJ+hkmK/O47djbhkf5nNV0WY5rxaI=;
        b=RdSzuVK+hVGam+2cd00ySJWAHc9MdfDUiio8sVv4aXUkfGQP72q+7GqDtaTkouNMAp
         c/PDxBIPa9khqAhFAWhXL4ryvrCZW1npWs2G/Y+MY/wGTKVkPqvzoJCd3p6oCFSr1Fyk
         LSBqqfAjcResrpAoc78M1rxaNE+Pvdg6dYaXoSC7hody8/hiuWRC2Jm/gUSk10Xl7Q5x
         BOAZmxO7Jrel4eSZxqFsWnoIqYIXtvpqU7EsqxvcT4PmFppjg4nNsSMgzX5KvoJOiaoN
         04mEXmoTR3TR+vojBQJgoeto8oRvVRnBITYDCl3c/U6Ry1cjX0SR5mM7Bc271eibfK8c
         ciZQ==
X-Forwarded-Encrypted: i=1; AFNElJ8FgVxrglHHoJKMfgLyeZBQGa9rDpsRcR3UsClyHKYZQF4YGasGQIltfC24l6C16WeE8DVHVx4K3zQ9wr39Dmkx@lists.infradead.org
X-Gm-Message-State: AOJu0Yy38bFQf40Z8BG2XsKlIaJJ/iCfPIFZDvuMkhSFCsm4cEPqVnuA
	4HEGXQmYkx8u8YeGf8f7HTDcJPSWiixxudxedi9mQYOFe9hPPHT8yQPlw4dlYk3y+SBf9bAu+Xh
	yFyA3FlFckw==
X-Received: from dlboy14.prod.google.com ([2002:a05:7022:128e:b0:12b:fe5e:215])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:6b91:b0:129:fe5:117e
 with SMTP id a92af1059eb24-1349ab50ec8mr2869316c88.26.1778715124133; Wed, 13
 May 2026 16:32:04 -0700 (PDT)
Date: Wed, 13 May 2026 16:31:44 -0700
In-Reply-To: <20260413024805.1316480-1-irogers@google.com>
Mime-Version: 1.0
References: <20260413024805.1316480-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260513233151.572332-1-irogers@google.com>
Subject: [PATCH v5 0/7] perf libunwind multiple remote support
From: Ian Rogers <irogers@google.com>
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
	will@kernel.org, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_163205_864686_0843FF37 
X-CRM114-Status: GOOD (  21.42  )
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

Fix the libunwind build for when libdw and libunwind are feature
detected, currently failing with a duplicate symbol.

Refactor the libunwind support so that whenever a remote target is
available, perf functions using the ELF machine can use that remote
target regardless of what the host/local machine is. Migrate existing
libunwind supported architectures like powerpc, arm64 and loongarch so
that they can work in a cross-architecture way. Add support for
RISC-V. Make the code more regular in function names, etc. and avoid
including a C-file. This increases the lines of code. It is similar in
style to the unwind-libdw implementation. It is hoped that the more
uniform nature of the code will help with refactoring the perf
registers for SIMD/APX support.

Aside from local host testing these patches are under tested, in part
as I'm failing to see how to build libunwind with support for multiple
remote targets. Please could I get help in testing.

v5: Rebase dropping merged loong arch fix patch. Fixes to Sashiko
    review feedback:
    - Patch 1: Hooked unwind__configure() into perf_default_config().
      Standardized unwinder return contracts (>0 success, 0 fallback,
      <0 fatal).  Fixed UNWIND_STYLE_UNKNOWN fallback and added
      memset() to clear config array on override.
    - Patch 2: Dynamically populated FILES list in
      tools/build/feature/Makefile using LIBUNWIND_ARCHS. Added
      libunwind cases to FEATURE_TESTS_EXTRA in
      tools/build/Makefile.feature for proper FEATURE-DUMP caching.
    - Patch 3: Restored core -lunwind linkage to
      FEATURE_CHECK_LDFLAGS.  Restored NO_LIBUNWIND fallback
      validation, corrected EXTLIBS evaluation ordering for
      BIONIC/Android compatibility, and restored static linking
      multiple definition flags.
    - Patch 4: Fixed out-of-bounds array read bugs (>= ARRAY_SIZE) in
      libunwind-i386.c and libunwind-x86_64.c. Fixed constant typos
      across LoongArch, PowerPC, and s390x.
    - Patch 5: Added early EM_NONE and ops validation checks to
      prevent warnings and NULL dereferences. Checked return value of
      unwind__prepare_access() in maps__copy_from(). Corrected
      architecture binding in thread__insert_map() by calculating
      e_machine after map insertion.
    - Patch 6: Aligned all remote architecture accessors to match
      5-argument generic declarations (removing trailing
      sizeof(unw_word_t)). Prevented frame discard on stack depth
      limit by returning 0 instead of -1 in unwind_step(). Fixed
      32-bit big-endian register corruption by replacing memcpy() with
      conditional type-casted assignment. Fixed max_stack == 1
      fallback trigger. Fixed .debug_frame layout union corruption by
      changing di.u.rti to di.u.ti across all DWARF find wrappers.
    - Patch 7: Applied the same corrections (5-argument accessors,
      u.ti union accessors, 0 return on max_ips) to the newly
      introduced libunwind-riscv.c.

v4: Rebase, in particular the zalloc->calloc change conflicted.
https://lore.kernel.org/linux-perf-users/20260413024805.1316480-1-irogers@google.com/

v3: Minor whitespace clean up and warn when a dynamic choice of libdw
    or libunwind is selected for unwinding and support is missing (Arnaldo).
https://lore.kernel.org/lkml/20260404054032.1538095-1-irogers@google.com/

v2: Move two fixes patches to position 1 and 2 in the series. Fix
    struct naming inconsistency, Andrew Jones
    <andrew.jones@oss.qualcomm.com>. Fix other inconsistencies and
    potential non-x86 build issues.
https://lore.kernel.org/lkml/20260305221927.3237145-1-irogers@google.com/

v1: https://lore.kernel.org/lkml/20260224142938.26088-1-irogers@google.com/

Ian Rogers (7):
  perf unwind: Refactor get_entries to allow dynamic libdw/libunwind
    selection
  tools build: Deduplicate test-libunwind for different architectures
  perf build: Be more programmatic when setting up libunwind variables
  perf unwind-libunwind: Make libunwind register reading cross platform
  perf unwind-libunwind: Move flush/finish access out of local
  perf unwind-libunwind: Remove libunwind-local
  perf unwind-libunwind: Add RISC-V libunwind support

 tools/build/Makefile.feature                  |  12 +-
 tools/build/feature/Makefile                  |  46 +-
 tools/build/feature/test-libunwind-aarch64.c  |  27 -
 tools/build/feature/test-libunwind-arm.c      |  28 -
 .../test-libunwind-debug-frame-aarch64.c      |  17 -
 .../feature/test-libunwind-debug-frame-arm.c  |  17 -
 .../feature/test-libunwind-debug-frame.c      |   1 -
 tools/build/feature/test-libunwind-x86.c      |  28 -
 tools/build/feature/test-libunwind-x86_64.c   |  28 -
 tools/build/feature/test-libunwind.c          |   1 -
 tools/perf/Makefile.config                    | 226 +++--
 tools/perf/arch/arm/util/Build                |   2 -
 tools/perf/arch/arm/util/unwind-libunwind.c   |  50 --
 tools/perf/arch/arm64/util/Build              |   1 -
 tools/perf/arch/arm64/util/unwind-libunwind.c |  17 -
 tools/perf/arch/loongarch/util/Build          |   2 -
 .../arch/loongarch/util/unwind-libunwind.c    |  82 --
 tools/perf/arch/mips/Build                    |   1 -
 tools/perf/arch/mips/util/Build               |   1 -
 tools/perf/arch/mips/util/unwind-libunwind.c  |  22 -
 tools/perf/arch/powerpc/util/Build            |   1 -
 .../perf/arch/powerpc/util/unwind-libunwind.c |  92 --
 tools/perf/arch/x86/util/Build                |   3 -
 tools/perf/arch/x86/util/unwind-libunwind.c   | 115 ---
 tools/perf/builtin-inject.c                   |   4 +
 tools/perf/builtin-report.c                   |   4 +
 tools/perf/builtin-script.c                   |   4 +
 tools/perf/util/Build                         |   5 +-
 tools/perf/util/config.c                      |   4 +
 tools/perf/util/libunwind-arch/Build          |  11 +
 .../perf/util/libunwind-arch/libunwind-arch.c | 319 +++++++
 .../perf/util/libunwind-arch/libunwind-arch.h | 296 +++++++
 .../perf/util/libunwind-arch/libunwind-arm.c  | 290 ++++++
 .../util/libunwind-arch/libunwind-arm64.c     | 289 ++++++
 .../perf/util/libunwind-arch/libunwind-i386.c | 312 +++++++
 .../util/libunwind-arch/libunwind-loongarch.c | 297 +++++++
 .../perf/util/libunwind-arch/libunwind-mips.c | 299 +++++++
 .../util/libunwind-arch/libunwind-ppc32.c     | 301 +++++++
 .../util/libunwind-arch/libunwind-ppc64.c     | 303 +++++++
 .../util/libunwind-arch/libunwind-riscv.c     | 297 +++++++
 .../perf/util/libunwind-arch/libunwind-s390.c | 299 +++++++
 .../util/libunwind-arch/libunwind-x86_64.c    | 320 +++++++
 tools/perf/util/libunwind/arm64.c             |  40 -
 tools/perf/util/libunwind/x86_32.c            |  41 -
 tools/perf/util/maps.c                        |  34 +-
 tools/perf/util/maps.h                        |   4 +-
 tools/perf/util/symbol_conf.h                 |  10 +
 tools/perf/util/thread.c                      |  32 +-
 tools/perf/util/unwind-libdw.c                |  20 +-
 tools/perf/util/unwind-libunwind-local.c      | 831 ------------------
 tools/perf/util/unwind-libunwind.c            | 699 +++++++++++++--
 tools/perf/util/unwind.c                      | 104 +++
 tools/perf/util/unwind.h                      |  73 +-
 53 files changed, 4623 insertions(+), 1739 deletions(-)
 delete mode 100644 tools/build/feature/test-libunwind-aarch64.c
 delete mode 100644 tools/build/feature/test-libunwind-arm.c
 delete mode 100644 tools/build/feature/test-libunwind-debug-frame-aarch64.c
 delete mode 100644 tools/build/feature/test-libunwind-debug-frame-arm.c
 delete mode 100644 tools/build/feature/test-libunwind-x86.c
 delete mode 100644 tools/build/feature/test-libunwind-x86_64.c
 delete mode 100644 tools/perf/arch/arm/util/unwind-libunwind.c
 delete mode 100644 tools/perf/arch/arm64/util/unwind-libunwind.c
 delete mode 100644 tools/perf/arch/loongarch/util/unwind-libunwind.c
 delete mode 100644 tools/perf/arch/mips/Build
 delete mode 100644 tools/perf/arch/mips/util/Build
 delete mode 100644 tools/perf/arch/mips/util/unwind-libunwind.c
 delete mode 100644 tools/perf/arch/powerpc/util/unwind-libunwind.c
 delete mode 100644 tools/perf/arch/x86/util/unwind-libunwind.c
 create mode 100644 tools/perf/util/libunwind-arch/Build
 create mode 100644 tools/perf/util/libunwind-arch/libunwind-arch.c
 create mode 100644 tools/perf/util/libunwind-arch/libunwind-arch.h
 create mode 100644 tools/perf/util/libunwind-arch/libunwind-arm.c
 create mode 100644 tools/perf/util/libunwind-arch/libunwind-arm64.c
 create mode 100644 tools/perf/util/libunwind-arch/libunwind-i386.c
 create mode 100644 tools/perf/util/libunwind-arch/libunwind-loongarch.c
 create mode 100644 tools/perf/util/libunwind-arch/libunwind-mips.c
 create mode 100644 tools/perf/util/libunwind-arch/libunwind-ppc32.c
 create mode 100644 tools/perf/util/libunwind-arch/libunwind-ppc64.c
 create mode 100644 tools/perf/util/libunwind-arch/libunwind-riscv.c
 create mode 100644 tools/perf/util/libunwind-arch/libunwind-s390.c
 create mode 100644 tools/perf/util/libunwind-arch/libunwind-x86_64.c
 delete mode 100644 tools/perf/util/libunwind/arm64.c
 delete mode 100644 tools/perf/util/libunwind/x86_32.c
 delete mode 100644 tools/perf/util/unwind-libunwind-local.c
 create mode 100644 tools/perf/util/unwind.c

-- 
2.54.0.563.g4f69b47b94-goog


