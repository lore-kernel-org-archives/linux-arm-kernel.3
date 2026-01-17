Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D405C982C5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Jan 2026 05:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Message-ID:Mime-Version:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1/DlDzZKFpcROxVmgO7qkeA6G7xHNFkkZDHlcU3Uce8=; b=xsyFYAXqKAbay5wwKwqGOcCz6a
	bEeoltkWaqjLMec4vEqJwTBmW56bcHkDwlt65mAD1puir7Y5q3D/dRuGCtKaK6xWqT8JjZzqtIup9
	4AxBVZjLCoFIscfYJ116CJZGWU97m1a00shy4tFATMYYk+Ztfuw4m+mBji941IUEE4D5PFPSDUqIU
	Z0aMkBwE0LYjgwGVnnIU3A2Yfw4PgI/BGZZ4fCCTqN3LjvLoduPeO9FlsAbYI3m2ajoVLDrNWj5Zd
	MfSzUDIHP0roLo6+U3j3KlxqQ5a0tLA2pCjd/D5qvGPHoY/s4S9Z4F1xwLfMBV9swkhbkRxzKNhjv
	WIRjMKVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgysF-0000000FEJx-26E9;
	Sat, 17 Jan 2026 05:29:23 +0000
Received: from mail-dl1-x124a.google.com ([2607:f8b0:4864:20::124a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgysD-0000000FEIk-0fzc
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Jan 2026 05:29:22 +0000
Received: by mail-dl1-x124a.google.com with SMTP id a92af1059eb24-1233b81a92dso3186505c88.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Jan 2026 21:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768627759; x=1769232559; darn=lists.infradead.org;
        h=to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1/DlDzZKFpcROxVmgO7qkeA6G7xHNFkkZDHlcU3Uce8=;
        b=JHPjdiNEMMCIWE4ol20b+4FY/7YPGTKozCFXRTlGOkYv4XTLWG0FRjkGiuKBiziUkW
         aEwQW4GcZd2FwLX6leLievmJENoD8aNQZcHOrsC3a6D4emQM4nmd7FE5/bgY5oZygQVL
         ShqoeJJRIAOAmHf3pLOlj3wvAQ+ED1MTC0U55xdBSppDF90S1RsVkbOxRj86XOM4VXYu
         xZVXEBJNyCKwhda/glt3JKg0ZHz7Lp1qUxpSyUnpr7eCvK+la5YCpVck2ESCVYHqZdpF
         fIkm48gJ/ST877qXI921/FfELxevrU+38LpZaH5GIl4sRaU42U0DNZi/aYVY/16UBVLl
         yfUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768627759; x=1769232559;
        h=to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1/DlDzZKFpcROxVmgO7qkeA6G7xHNFkkZDHlcU3Uce8=;
        b=FgHMTBKwddYV8yQEX2SS+mm2aP2jRkuYlznkJhjfy1qyDIi0OYFCQD2jY0Qu8oVzcl
         C5/EHuOj8oVCcXyfV6JscEn9n97UIcrJ7ia988QNuYRS8gSXQth8IW0lZsVb0QSoSM/3
         OTNqLU6+5HTQMVkpb4lmE0Ays75IdLKTSF1fowuR+4zyveeTk2hNuldyCVkyDygtUSOX
         Sy3eBp0D9L5BBeeyzyrTcEYoC4DBuCTSA0C86veSxPgA8s74/J8C0E9mzjg3/yiIJQaj
         YLqgg6GYzoMa/yYJ8skQP9mzJ+T90pYYooqh2s4ThLLBw84dPQ4dnJ4DQPpw2eMQHeom
         z9qA==
X-Forwarded-Encrypted: i=1; AJvYcCVT/CWlW+2EIyijqP0jqO4x9V+miITFJBTNQf/pCaGYfFMWAqtMXH4MDKH5OU/yWl8hhjtAGDxVphkOaOn7vGRh@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+VpT0GryLMvJkxLi+PYjKG11PhyAUEgQetNyATUBchJRfsrRz
	TX3eS5glP4/m5iRpewYuHuOFcD63DKGOpxzzZI+9g9997Noz4lD5X+lrMEmOoAueRxaI86Nq2j8
	fx50IxUs1sA==
X-Received: from dlbto2.prod.google.com ([2002:a05:7022:3b02:b0:119:9f33:34ae])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:458d:b0:123:3b91:fbe8
 with SMTP id a92af1059eb24-1233ce7a8acmr9381417c88.0.1768627759274; Fri, 16
 Jan 2026 21:29:19 -0800 (PST)
Date: Fri, 16 Jan 2026 21:28:26 -0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260117052849.2205545-1-irogers@google.com>
Subject: [PATCH v1 00/23] perf dwarf/libdw extra support, speed and clean ups
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, Leo Yan <leo.yan@linux.dev>, Guo Ren <guoren@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Shimin Guo <shimin.guo@skydio.com>, 
	Athira Rajeev <atrajeev@linux.ibm.com>, Stephen Brennan <stephen.s.brennan@oracle.com>, 
	Howard Chu <howardchu95@gmail.com>, Thomas Falcon <thomas.falcon@intel.com>, 
	Andi Kleen <ak@linux.intel.com>, "Dr. David Alan Gilbert" <linux@treblig.org>, 
	Dmitry Vyukov <dvyukov@google.com>, 
	"=?UTF-8?q?Krzysztof=20=C5=81opatowski?=" <krzysztof.m.lopatowski@gmail.com>, Chun-Tse Shao <ctshao@google.com>, 
	Aditya Bodkhe <aditya.b1@linux.ibm.com>, Haibo Xu <haibo1.xu@intel.com>, 
	Sergei Trofimovich <slyich@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Mark Wielaard <mark@klomp.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_212921_210963_96BCFA3C 
X-CRM114-Status: GOOD (  17.05  )
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

The first 6 patches are minor tweaks addressing a memory leak,
correctness and performance. Patch 5 incorportes the reviewed patch by
Shimin Guo [1] that makes the libdw unwinding support cross
architecture. The cross architecture files will be refactored in this
series.

Patch 7 unifies the dwfl for dsos and addr2line with that for the
powerpc skip-callchain-idx. An issue described in:
https://lore.kernel.org/lkml/CAP-5=fX+zw-CUEYEtrPA6vYUKqpp4LZp-p==QsbZaNwLcX0Whw@mail.gmail.com/

Patch 8 migrates the perf regs code away from using an architecture
substring to using the ELF machine, which is both more efficient and
more accurate.

Patches 9 to 21 clean up the libdw and dwarf register code removing
the need for different libdw dwarf register initialization routines by
introducing a perf reg to dwarf register mapping function. This
function is added for all perf register supporting architectures.

Patch 22 avoids discarding the dwfl for every libdw unwind, it can
speed up perf report by amounts like 18x.

Patch 23 adds inline information for frame pointers, an issue
described here:
https://lore.kernel.org/lkml/CAP-5=fWh5=AWq_Mav7B9nsuZ0TS2qPMMAwYhQKpt_BYFJRnf2w@mail.gmail.com/

[1] https://lore.kernel.org/lkml/20260107-cross-arch-unwind-v3-1-db0e37c8a652@skydio.com/

Ian Rogers (22):
  perf symbol-elf: Fix leak of ELF files with GNU debugdata
  perf dso: Extra validity checks that e_machine is valid
  perf record: Disable inline frames when marking build IDs
  perf libdw_addr2line: Fixes to srcline memory allocation
  perf unwind-libdw: Correct argument to dwfl_attach_state
  perf powerpc: Unify the skip-callchain-idx libdw with that for
    addr2line
  perf perf_regs: Switch from arch string to int e_machine
  perf dwarf-regs: Add util/dwarf-regs-arch for consistency with
    perf-regs
  perf dwarf-regs: Remove get_arch_regnum
  perf dwarf-regs: Clean up x86 dwarf_regnum code
  perf dwarf-regs: Add get_dwarf_regnum_for_perf_regnum and use for x86
    unwinding
  perf dwarf-regs: Add basic get_dwarf_regnum for most architectures
  perf dwarf-regs: Add ARM perf to dwarf register number mapping
    functions
  perf dwarf-regs: Add csky perf to dwarf register number mapping
    functions
  perf dwarf-regs: Add loongarch perf to dwarf register number mapping
    functions
  perf dwarf-regs: Add powerpc perf to dwarf register number mapping
    functions
  perf dwarf-regs: Add RISC-V perf to dwarf register number mapping
    functions
  perf dwarf-regs: Add S390 perf to dwarf register number mapping
    functions
  perf dwarf-regs: Add MIPS perf to dwarf register number mapping
    functions
  perf build: Remove NO_LIBDW_DWARF_UNWIND option
  perf unwind-libdw: Don't discard loaded ELF/Dwarf after every unwind
  perf machine: Add inline information to frame pointer and LBR
    callchains

Shimin Guo (1):
  perf unwind-libdw: fix a cross-arch unwinding bug

 tools/perf/Makefile.config                    |  19 +-
 tools/perf/arch/arm/util/Build                |   1 -
 tools/perf/arch/arm/util/unwind-libdw.c       |  39 ---
 tools/perf/arch/arm64/util/Build              |   1 -
 tools/perf/arch/arm64/util/unwind-libdw.c     |  61 ----
 tools/perf/arch/csky/util/Build               |   2 -
 tools/perf/arch/csky/util/unwind-libdw.c      |  78 ------
 tools/perf/arch/loongarch/util/unwind-libdw.c |  57 ----
 tools/perf/arch/powerpc/util/Build            |   1 -
 .../arch/powerpc/util/skip-callchain-idx.c    |  52 +---
 tools/perf/arch/powerpc/util/unwind-libdw.c   |  76 -----
 tools/perf/arch/riscv/util/Build              |   1 -
 tools/perf/arch/riscv/util/unwind-libdw.c     |  58 ----
 tools/perf/arch/s390/util/Build               |   2 -
 tools/perf/arch/s390/util/unwind-libdw.c      |  65 -----
 tools/perf/arch/x86/util/Build                |   1 -
 tools/perf/arch/x86/util/unwind-libdw.c       |  54 ----
 tools/perf/builtin-record.c                   |   3 +-
 tools/perf/builtin-script.c                   |  17 +-
 tools/perf/tests/make                         |   3 +-
 tools/perf/tests/shell/addr2line_inlines.sh   |  31 ++-
 tools/perf/util/Build                         |   6 +-
 tools/perf/util/dso.c                         |  33 ++-
 tools/perf/util/dso.h                         |  23 +-
 tools/perf/util/dwarf-regs-arch/Build         |   9 +
 .../util/dwarf-regs-arch/dwarf-regs-arm.c     |  12 +
 .../util/dwarf-regs-arch/dwarf-regs-arm64.c   |  12 +
 .../util/dwarf-regs-arch/dwarf-regs-csky.c    | 126 +++++++++
 .../dwarf-regs-arch/dwarf-regs-loongarch.c    |  12 +
 .../util/dwarf-regs-arch/dwarf-regs-mips.c    |  14 +
 .../util/dwarf-regs-arch/dwarf-regs-powerpc.c | 136 +++++++++
 .../util/dwarf-regs-arch/dwarf-regs-riscv.c   |  12 +
 .../util/dwarf-regs-arch/dwarf-regs-s390.c    |  53 ++++
 .../util/dwarf-regs-arch/dwarf-regs-x86.c     | 260 ++++++++++++++++++
 tools/perf/util/dwarf-regs-csky.c             |  50 ----
 tools/perf/util/dwarf-regs-powerpc.c          |  61 ----
 tools/perf/util/dwarf-regs-x86.c              |  50 ----
 tools/perf/util/dwarf-regs.c                  | 151 +++++++++-
 tools/perf/util/evsel.c                       |  14 +-
 tools/perf/util/include/dwarf-regs.h          |  28 +-
 tools/perf/util/libdw.c                       | 115 ++++----
 tools/perf/util/libdw.h                       |  12 +-
 tools/perf/util/machine.c                     | 104 ++++---
 tools/perf/util/maps.c                        |  36 ++-
 tools/perf/util/maps.h                        |   4 +
 tools/perf/util/perf_regs.c                   | 105 ++++---
 tools/perf/util/perf_regs.h                   |  10 +-
 .../scripting-engines/trace-event-python.c    |  21 +-
 tools/perf/util/session.c                     |  65 +++--
 tools/perf/util/session.h                     |   1 +
 tools/perf/util/srcline.c                     |   2 +-
 tools/perf/util/symbol-elf.c                  |   2 +-
 tools/perf/util/unwind-libdw.c                | 154 +++++++++--
 tools/perf/util/unwind-libdw.h                |  10 +-
 tools/perf/util/unwind-libunwind-local.c      |   7 +-
 55 files changed, 1347 insertions(+), 985 deletions(-)
 delete mode 100644 tools/perf/arch/arm/util/unwind-libdw.c
 delete mode 100644 tools/perf/arch/arm64/util/unwind-libdw.c
 delete mode 100644 tools/perf/arch/csky/util/unwind-libdw.c
 delete mode 100644 tools/perf/arch/loongarch/util/unwind-libdw.c
 delete mode 100644 tools/perf/arch/powerpc/util/unwind-libdw.c
 delete mode 100644 tools/perf/arch/riscv/util/unwind-libdw.c
 delete mode 100644 tools/perf/arch/s390/util/unwind-libdw.c
 delete mode 100644 tools/perf/arch/x86/util/unwind-libdw.c
 create mode 100644 tools/perf/util/dwarf-regs-arch/Build
 create mode 100644 tools/perf/util/dwarf-regs-arch/dwarf-regs-arm.c
 create mode 100644 tools/perf/util/dwarf-regs-arch/dwarf-regs-arm64.c
 create mode 100644 tools/perf/util/dwarf-regs-arch/dwarf-regs-csky.c
 create mode 100644 tools/perf/util/dwarf-regs-arch/dwarf-regs-loongarch.c
 create mode 100644 tools/perf/util/dwarf-regs-arch/dwarf-regs-mips.c
 create mode 100644 tools/perf/util/dwarf-regs-arch/dwarf-regs-powerpc.c
 create mode 100644 tools/perf/util/dwarf-regs-arch/dwarf-regs-riscv.c
 create mode 100644 tools/perf/util/dwarf-regs-arch/dwarf-regs-s390.c
 create mode 100644 tools/perf/util/dwarf-regs-arch/dwarf-regs-x86.c
 delete mode 100644 tools/perf/util/dwarf-regs-csky.c
 delete mode 100644 tools/perf/util/dwarf-regs-powerpc.c
 delete mode 100644 tools/perf/util/dwarf-regs-x86.c

-- 
2.52.0.457.g6b5491de43-goog


