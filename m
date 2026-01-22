Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6199CC44536
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 11:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BJsfpOClmaQvG81S67nCd+VIer0uq8erZuxF5hyxS28=; b=Wc1b+VizuaGJJ1J0mJf3Kmkt46
	lpK22RCd5X5wvSYRroMQF6vDuZ1Q4XwOaJMCp6c4aIT2i4SJlp3SPj4IFyBtEUPZmeWDL2/7zdcdn
	4fRfSodVqAoDT+C7YYxMyEoqRRjo9u+bbRoIwZCCuP1ljj8IJ1rXv3M97GofkWx4uKF/so4pyFuA7
	hUMZRDzzoL1KS/AOCj4N2jTi2hfVoNse69jcyfwzr80zECj4ph3pBGLvmP1Vf/Gldix8DdJqiNhu8
	XURXKH5WnBTxLhDKa722JeZxH55/U1kWrdZ1dqm6NqijEO4RdXXAwQDssd6pBDehrQL7NXW4sQY1g
	eClX7SEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vitJB-000000071DH-0RNb;
	Thu, 22 Jan 2026 11:57:05 +0000
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vitJ8-000000071CY-1EFD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 11:57:03 +0000
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-45c92df37fdso339090b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 03:57:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769083021; cv=none;
        d=google.com; s=arc-20240605;
        b=B2XGY2UOMvmcxF4AP21PB2W38ohxzr70Sk4F7dqQxjxpjzpl7jpq8fYPvvY31+EP8D
         5mh+NtHDqhaKpDTHrr/LOYifHWr6R5fImbd5gMmB3KwJStVqrKH1v2HNXCytVfwaslTl
         WB+UqAKR/fgZBUSLFE/iy5p3EavG9bana+Zz0KS4I/9zx6IKXDl34YzMGVOITTMDaWa2
         +R8Bjq2TkS2MAqW2PBPDlhrAt9hRMDcJ87Tb0ueBs/3JubJtPe0oSp2+umV7cIK8yaVZ
         SJmr/RGzJSS4A7VfH7T1AVMv5dYSsc2TZvkhuXRxDYOTycqt5+28+ZjoBmSB72nlbo0g
         1x+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=BJsfpOClmaQvG81S67nCd+VIer0uq8erZuxF5hyxS28=;
        fh=M5lIARYUTFocTodfLOHEHKeZAu7n21IRo2krlL/cFF4=;
        b=D6yxKgelSReKr5ZXuxbEafx/hTStBZKAPo4iOtMB7Q9ZpHFpyVK62vK1wuabuwHzL/
         oBUL8qNVAl8uw+OLKu9XfP9QDGo3WwJkY0VVtrY0aIYnL+NTeUmPw1TXIx3YYgLJ16Pe
         3Jcl5v4WkTVarLqQluKPIf9WVcdBs5+ia10h4PjiIkX3qkzfV5Ffd2ZrTf8C9dNoMqKw
         X61tZbliOFvlQ3H6Ct264VSAZMwFnj3sO0s+7kmVgy0LgPAK6+V5x4xjTn/lO6bwdfVx
         h5hCs5+gmf0NprHwPyjinP+h6homvc1Eftb5ufmLOtFIt0heGjxMc47nUhhMAg/a+CRC
         45vQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769083021; x=1769687821; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BJsfpOClmaQvG81S67nCd+VIer0uq8erZuxF5hyxS28=;
        b=HH2jv+hVQVLhhxGUwLnE4GmGSZMTeNqra/GiOAT3kuP5EMPjiEtQWFkEudJg19Mjm3
         8UP02UWygNFaF/9lC0ucK8fNucPJb8aNhTQmgsXmt7tpV0TryGe2uKUBoZVfFVO9A0o9
         uI5/BDMIVjPPSKEZaWW4GvVSpfHd3ydSWVPdL/D2cOwYk0bFuM6uZmwbJ9VfMrwSQII2
         2u4XscrlwqoYHOw+GNi5gWOTTK3IJWPKfJGp/OVe5WsoIAPlf2/8VvxNg5mybQEsAlCZ
         GirZlvPztI7xaXbu5t9rfOZFDRPhJ1D/jo7N7LGQHnK/ENqUWwP1LtfyaoHoDytQkgu9
         AcuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769083021; x=1769687821;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BJsfpOClmaQvG81S67nCd+VIer0uq8erZuxF5hyxS28=;
        b=Yd9Wl+3ZMKUUpKbAIIJRoabmNP1DkU4h8MYC1SkSRRdx3Zjpdi0eckkx42wd1YW/YF
         I7INm8g70MD8/Uvf+SSkeKSWLqesKNcwyDmOXXNmj7Jxo9A7WnipM0XcnUqZL3u9NVT+
         3sX2V/BCb1WhRt/G947/iIgC55+zZAFB6RxxHJ+eVwKfJ3iHkOVOBaylpXbX75nrTQMA
         xajG5SFQY7/nQQ6hRMQfs3whCZ/0RwJK8/4ZAXKJrCLQQEio1apSnpLO51kQ/UxVXXba
         S8Op41p3Zbf1I3HiKtI6v6dECjVpMig9x9FEOTGIEGcQZi1mq4wuVzrk25j8cVss7grg
         ln2g==
X-Forwarded-Encrypted: i=1; AJvYcCVlgWUWUb+lcGUnZ05a+t2JhioEXmLjUwWoLsormpRaSHgblhM3aTKv+LWHG7XG4MNaqvNHcjzu7DarbK/Ww40k@lists.infradead.org
X-Gm-Message-State: AOJu0YyswzBiIuQUgNZ2cwPUer7jzGw3DD7mDe/WgR18UjumhGq4S2ju
	szVqZPXh+zNxVUI/Sp8kUJc189RDSAUke+6QatL1ZiyGBgb5sX+0RwNnasnevPldCYNrDZmpuAH
	Pn47h19Ex7ddaE1EYRxcaLuoS2vv4UnM=
X-Gm-Gg: AZuq6aI5vrSuYvbwuOafPEkFuFNLiQkbgUT8phzvfvW4Asim98ms5oiZjwS7LRlrYIl
	gqyyd9SWWmEcqAssjYnW/6wSr5psujRMhlFY5ocyuDBR0BMZHQ3YdjCUjnv9dx8VozoE/xX9d5A
	F14thoyIfIVGku68KftJLz7a6YD8qT0qRuUWRKMiewMz8F6jP/dT+wv/kJg867e2aGvQg3w9ETT
	GSkAmc/qS3Napo4pWkTht18LjbXmhTkbRKiEiQYGuUSd8qOp4/wu+Fhm2GT0tYeiPSZxeJ3
X-Received: by 2002:a05:6870:c69b:b0:3fd:ec4f:d1d2 with SMTP id
 586e51a60fabf-4044c157df6mr10910160fac.10.1769083020732; Thu, 22 Jan 2026
 03:57:00 -0800 (PST)
MIME-Version: 1.0
References: <20260122073127.375139-1-irogers@google.com> <9fd8375c-2de7-4305-ac3e-42ff8f919964@linaro.org>
 <10c875e6-6cc2-4695-a0aa-01507541daf4@linaro.org>
In-Reply-To: <10c875e6-6cc2-4695-a0aa-01507541daf4@linaro.org>
From: Suchit Karunakaran <suchitkarunakaran@gmail.com>
Date: Thu, 22 Jan 2026 17:26:49 +0530
X-Gm-Features: AZwV_QjFtuAtj7gs3qI-DenUm1XMW9RrPz13HXtm-zTDxJ_0wzsKC5Z_5vStStw
Message-ID: <CAO9wTFjaxNMcH7TgQyYjKR=3fNoO+D3cp6FgtRd9Li6JparYbA@mail.gmail.com>
Subject: Re: [PATCH v1 00/11] perf annotate arch clean up
To: James Clark <james.clark@linaro.org>
Cc: Ian Rogers <irogers@google.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, Leo Yan <leo.yan@linux.dev>, Guo Ren <guoren@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Zecheng Li <zecheng@google.com>, 
	Tianyou Li <tianyou.li@intel.com>, Thomas Falcon <thomas.falcon@intel.com>, 
	Julia Lawall <Julia.Lawall@inria.fr>, Athira Rajeev <atrajeev@linux.ibm.com>, 
	Aditya Bodkhe <aditya.b1@linux.ibm.com>, Howard Chu <howardchu95@gmail.com>, 
	=?UTF-8?Q?Krzysztof_=C5=81opatowski?= <krzysztof.m.lopatowski@gmail.com>, 
	"Dr. David Alan Gilbert" <linux@treblig.org>, Shimin Guo <shimin.guo@skydio.com>, 
	Sergei Trofimovich <slyich@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_035702_345503_3AC84CD2 
X-CRM114-Status: GOOD (  28.51  )
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

On Thu, 22 Jan 2026 at 16:17, James Clark <james.clark@linaro.org> wrote:
>
>
>
> On 22/01/2026 10:43 am, James Clark wrote:
> >
> >
> > On 22/01/2026 7:31 am, Ian Rogers wrote:
> >> 2 initial memory leak fix patches for perf annotate.
> >>
> >> Move the disasm.c #included arch files into a new util/annotate-arch
> >> directory. Make the code compile standalone. Try to better encapsulate
> >> architecture specific code within the files and with a
> >> arch__new_<arch> function that allows additional data to be associated
> >> with the struct arch using the standard container_of trick.
> >>
> >> Make the lookup of struct arch use the ELF machine gather from a
> >> thread rather than an evsel. For example, the evsel can't determine
> >> the difference between EM_386 and EM_X86_64 so generally the latter
> >> has currently been used. This means the dwarf registers are off as
> >> register 1 is CX with EM_386 and DX with EM_X86_64. To facilitate this
> >> change map_symbol is refactored to use a struct thread rather than a
> >> struct maps, the maps being obtainable from the thread.
> >>
> >> To make in and out arguments clearer, for safety, etc. try to constify
> >> struct arch and its related structs.
> >>
> >
> > Hi Ian,
> >
> > I get this crash, not sure which commit causes it exactly but it
> > happened 2/2 times on both x86 and arm:
> >
> >   $ perf record -- true
> >   $ perf report
> >
> >   < Select first sample >
> >   < Select annotate >
> >
> > perf: Segmentation fault
> > -------- backtrace --------
> >      #0 0x5df8f58ba973 in ui__signal_backtrace setup.c:110
> >      #1 0x74373a642520 in __restore_rt libc_sigaction.c:0
> >      #2 0x5df8f5963f0d in dso__kernel dso.h:532
> >      #3 0x5df8f5965d0a in __map__const_kmap map.c:627
> >      #4 0x5df8f5965a36 in map__rip_2objdump map.c:531
> >      #5 0x5df8f58e5bef in symbol__parse_objdump_line disasm.c:1032
> >      #6 0x5df8f58e498b in symbol__disassemble_objdump disasm.c:1503
> >      #7 0x5df8f58e3852 in symbol__disassemble disasm.c:1621
> >      #8 0x5df8f58c638d in symbol__annotate annotate.c:1055
> >      #9 0x5df8f58c8628 in symbol__annotate2 annotate.c:2209
> >      #10 0x5df8f58a36b7 in __hist_entry__tui_annotate annotate.c:1189
> >      #11 0x5df8f58adf86 in do_annotate hists.c:2488
> >      #12 0x5df8f58ad762 in evsel__hists_browse hists.c:3441
> >      #13 0x5df8f58b78f2 in perf_evsel_menu__run hists.c:3556
> >      #14 0x5df8f58adabc in __evlist__tui_browse_hists hists.c:3643
> >      #15 0x5df8f58abf3b in evlist__tui_browse_hists hists.c:3691
> >      #16 0x5df8f571ac3a in report__browse_hists builtin-report.c:688
> >      #17 0x5df8f5719943 in __cmd_report builtin-report.c:1177
> >      #18 0x5df8f57181bc in cmd_report builtin-report.c:1890
> >      #19 0x5df8f57b5c3a in run_builtin perf.c:348
> >      #20 0x5df8f57b53b3 in handle_internal_command perf.c:398
> >      #21 0x5df8f57b5b2f in run_argv perf.c:445
> >      #22 0x5df8f57b5091 in main perf.c:551
> >      #23 0x74373a629d90 in __libc_start_call_main libc_start_call_main.h:58
> >      #24 0x74373a629e40 in __libc_start_main@@GLIBC_2.34 libc-start.c:128
> >      #25 0x5df8f56ead35 in _start perf[55d35]
> >
> >
>
> Also the annotate test fails:
>
>   $ sudo perf test 74
>   74: perf annotate basic tests                       : FAILED!
>
>
> >> Ian Rogers (11):
> >>    perf maps: Fix reference count leak in maps__find_ams
> >>    perf annotate: Fix args leak of map_symbol
> >>    perf disasm: Constify use of struct arch
> >>    perf disasm: Constify use of struct ins_op
> >>    perf disasm: Constify use of struct ins
> >>    perf disasm: Rework the string arch__is to use the ELF machine
> >>    perf disasm: Don't include C files from the arch directory
> >>    perf disasm: Refactor ins__is_call/jump to avoid exposing arch ins_ops
> >>    perf map_symbol: Switch from holding maps to holding thread
> >>    perf disasm: Refactor arch__find and initialization of arch structs
> >>    perf disasm: Minor layout tweaks for struct arch
> >>
> >>   tools/perf/arch/arc/annotate/instructions.c   |  11 -
> >>   .../perf/arch/riscv64/annotate/instructions.c |  36 --
> >>   tools/perf/ui/browsers/annotate.c             |   6 +-
> >>   tools/perf/ui/browsers/hists.c                |   3 +-
> >>   tools/perf/util/Build                         |   1 +
> >>   tools/perf/util/addr_location.c               |   4 -
> >>   tools/perf/util/addr_location.h               |   1 -
> >>   tools/perf/util/annotate-arch/Build           |  11 +
> >>   tools/perf/util/annotate-arch/annotate-arc.c  |  18 +
> >>   .../annotate-arch/annotate-arm.c}             |  48 +-
> >>   .../annotate-arch/annotate-arm64.c}           |  59 +--
> >>   .../annotate-arch/annotate-csky.c}            |  29 +-
> >>   .../annotate-arch/annotate-loongarch.c}       |  57 ++-
> >>   .../annotate-arch/annotate-mips.c}            |  29 +-
> >>   .../annotate-arch/annotate-powerpc.c}         | 125 +++++-
> >>   .../util/annotate-arch/annotate-riscv64.c     |  41 ++
> >>   .../annotate-arch/annotate-s390.c}            |  59 ++-
> >>   .../annotate-arch/annotate-sparc.c}           |  26 +-
> >>   .../annotate-arch/annotate-x86.c}             |  89 ++--
> >>   tools/perf/util/annotate-data.c               |  12 +-
> >>   tools/perf/util/annotate-data.h               |   2 +-
> >>   tools/perf/util/annotate.c                    |  88 ++--
> >>   tools/perf/util/annotate.h                    |  10 +-
> >>   tools/perf/util/callchain.c                   |  12 +-
> >>   tools/perf/util/capstone.c                    |  18 +-
> >>   tools/perf/util/db-export.c                   |   1 -
> >>   tools/perf/util/disasm.c                      | 424 +++++++-----------
> >>   tools/perf/util/disasm.h                      |  95 ++--
> >>   tools/perf/util/event.c                       |   2 -
> >>   tools/perf/util/hist.c                        |  18 +-
> >>   tools/perf/util/llvm.c                        |   8 +-
> >>   tools/perf/util/machine.c                     |  13 +-
> >>   tools/perf/util/map_symbol.c                  |   5 +-
> >>   tools/perf/util/map_symbol.h                  |   3 +-
> >>   tools/perf/util/maps.c                        |   1 +
> >>   tools/perf/util/sort.c                        |   2 +-
> >>   tools/perf/util/unwind-libdw.c                |   2 +-
> >>   tools/perf/util/unwind-libunwind-local.c      |   2 +-
> >>   38 files changed, 752 insertions(+), 619 deletions(-)
> >>   delete mode 100644 tools/perf/arch/arc/annotate/instructions.c
> >>   delete mode 100644 tools/perf/arch/riscv64/annotate/instructions.c
> >>   create mode 100644 tools/perf/util/annotate-arch/Build
> >>   create mode 100644 tools/perf/util/annotate-arch/annotate-arc.c
> >>   rename tools/perf/{arch/arm/annotate/instructions.c => util/
> >> annotate-arch/annotate-arm.c} (59%)
> >>   rename tools/perf/{arch/arm64/annotate/instructions.c => util/
> >> annotate-arch/annotate-arm64.c} (70%)
> >>   rename tools/perf/{arch/csky/annotate/instructions.c => util/
> >> annotate-arch/annotate-csky.c} (67%)
> >>   rename tools/perf/{arch/loongarch/annotate/instructions.c => util/
> >> annotate-arch/annotate-loongarch.c} (66%)
> >>   rename tools/perf/{arch/mips/annotate/instructions.c => util/
> >> annotate-arch/annotate-mips.c} (59%)
> >>   rename tools/perf/{arch/powerpc/annotate/instructions.c => util/
> >> annotate-arch/annotate-powerpc.c} (73%)
> >>   create mode 100644 tools/perf/util/annotate-arch/annotate-riscv64.c
> >>   rename tools/perf/{arch/s390/annotate/instructions.c => util/
> >> annotate-arch/annotate-s390.c} (70%)
> >>   rename tools/perf/{arch/sparc/annotate/instructions.c => util/
> >> annotate-arch/annotate-sparc.c} (85%)
> >>   rename tools/perf/{arch/x86/annotate/instructions.c => util/
> >> annotate-arch/annotate-x86.c} (93%)
> >>
> >
>

The annotate test fails after applying the 4th patch.

