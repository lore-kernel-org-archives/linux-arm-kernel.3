Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F7E3C02197
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 19:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s5WYJSVQEj2dIPfcyxFbM6JaAz2cg3KwbW58tJF8Jpk=; b=zkjSa0mheMHDDa4PPrY2tq20cw
	Lp1JIa/pSsy2khbiH2HuCm9KzndSskRD/uekJfalCW672kSfpiHa68WgtSkLUsQzRWQCsNUzaz8d5
	noKLsVh/MugD9XGCqYQNMDp9yUXxBH93r/2WvjkBuf8+iMRQ17w4OsmbuDyZdlwNBYjb+0dq03A92
	M5QMm+BuTk712ecTkC0gxK1ym9edQJ5vwp741QhvHF8ciQc05ofG8EY2nFFhePXCAUerht7JzH+nK
	jRrUMj00uDCDzzFQBw9KACG3G3YmyGmXj1Ceub8fcVsd+f/s/gUQdaupLL4dSC4pFKCyPRbX7O8mQ
	FxUkPJ9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf1yY-0000000GRP5-1j6u;
	Mon, 03 Feb 2025 19:19:18 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf1uf-0000000GQ8c-47Z2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 19:15:19 +0000
Received: by mail-pl1-x641.google.com with SMTP id d9443c01a7336-21669fd5c7cso84578125ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Feb 2025 11:15:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738610117; x=1739214917; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s5WYJSVQEj2dIPfcyxFbM6JaAz2cg3KwbW58tJF8Jpk=;
        b=KPwVotLM1cIhrYXYSoJznNxSkt6qbEne/etPSq0kYA2ZddsULeuJVUbj5JoejMC9Xk
         IiusdqyoeDGz66SrN+Onn1TfxDJiStJQsAZDA7susut9mZtsEILCRFI7nb+V/Xnv6BAM
         wtcY8irJhWr85fjRzn2NKQa5P7m+UIM6G8hhe9W5AqoMW/SLTLM5iDGQrTywha+TuDMj
         uplC54vso0jYXGA8BnavVpwXDVCYFziMwG8XiqRKeuYvB2M8CKFV38WbpYg6FNm2gYK8
         NPZMaTN/3WGBbupitS/o2UOEiVG3ESbyb3z2DSkPvMBAS7t1nnEgATm4rQ8pl0vhM5j8
         g5ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738610117; x=1739214917;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s5WYJSVQEj2dIPfcyxFbM6JaAz2cg3KwbW58tJF8Jpk=;
        b=aEQD8mmPBi+eD+OG9tp2HQzWuE7mglZx5GgvMVcDT9gXymmzESHRClnR3RgXmc7eaW
         50H8904NxhFYpk9QZdYEcwRA4ewiIEqCNEAKsf4+OiBXtvjOSWPDSqzfmF7yAU1jWsmJ
         UXobHMlT6q9TMKJIRyX77QWGhaPO5zpDyU17w/2HFt4Nz+ewj6wEHu3MNT3kOX44bf0c
         ZItkf/HVkEpRKb4cY1Gg4s2oi8192bemZhoSKt+vQ08MAgnAb2LZWIf7Qn/oL7tNa116
         DsZCtT2Sjyowr4N2arFzJxQ9j9X+D4MksX9Ykhj/lREbab9Q0DKo9tzcYd0/7/Y1SzZv
         dvLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmbCqdecozH0jnrvfsjTXSQcJM82ROl/+vizq5IkmCjjblu3LmcW9GJkI1doGSCslDzFSm09rjlhjozIWSz/SQ@lists.infradead.org
X-Gm-Message-State: AOJu0YzZcMmiFkNrwIyKTgUtxNFQSnmetgEp/F4JWZGrkxddU89KPJpH
	DDqkzR7tutt42ifjSObbvqTjKyADX0qti2QlwCUDRLcp0xR6ecRfjBf65F3XcYs=
X-Gm-Gg: ASbGnctsS/LpHP1mKB3QM58pY7WgjToY/ubVCKwwowhAsLQjouAbglLojxRvdECQQ30
	FyRmkB3tO39OrcLGWUf8ixdWdaUO68YibrBEqoE/A0vg/K5hirtICI9JNnLuX+xlJMeztFWmKnT
	blggPFPqSbWusRosOgqoAySK6+ICwMLdGiHmvMrqwQVl8W8qNKrVs4MT1YxEM2n/BTOkbnV3J+f
	GWcuv1ws8KK/WLMsWSf1MS59L7/ug6y47dtTOy/7UZxAe1mpOzzQ05bSByoxilLH+XssouG5YjT
	+odVmI3slFk=
X-Google-Smtp-Source: AGHT+IGa8q1L/w2WsP8N8nsLp1KLayBcPH09Ym4t3KD9fyuAGMJmjHdlYaNkbdFwKMu+prfIEcxVEw==
X-Received: by 2002:a17:902:db04:b0:216:4c88:d93a with SMTP id d9443c01a7336-21dd7dd7356mr392103185ad.48.1738610117017;
        Mon, 03 Feb 2025 11:15:17 -0800 (PST)
Received: from ghost ([2601:647:6700:64d0:4f63:f9d5:2cbd:2947])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de331f8c9sm80863205ad.227.2025.02.03.11.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 11:15:16 -0800 (PST)
Date: Mon, 3 Feb 2025 11:15:13 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Kan Liang <kan.liang@linux.intel.com>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
	Guo Ren <guoren@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Bibo Mao <maobibo@loongson.cn>,
	Arnd Bergmann <arnd@arndb.de>, Huacai Chen <chenhuacai@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Howard Chu <howardchu95@gmail.com>, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v1 0/7] perf: Support multiple system call tables in the
 build
Message-ID: <Z6EVwaOVYaKtaK1j@ghost>
References: <20250201071455.718247-1-irogers@google.com>
 <Z6EStkn-YZ8zaO7u@ghost>
 <CAP-5=fXRz_8CKNz4Fr-=0yhKbf_QE2ND+PPykSAO5p8wcUz7xA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAP-5=fXRz_8CKNz4Fr-=0yhKbf_QE2ND+PPykSAO5p8wcUz7xA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_111518_029676_40833BBC 
X-CRM114-Status: GOOD (  33.15  )
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

On Mon, Feb 03, 2025 at 11:10:49AM -0800, Ian Rogers wrote:
> On Mon, Feb 3, 2025 at 11:02 AM Charlie Jenkins <charlie@rivosinc.com> wrote:
> >
> > On Fri, Jan 31, 2025 at 11:14:48PM -0800, Ian Rogers wrote:
> > > This work builds on the clean up of system call tables and removal of
> > > libaudit by Charlie Jenkins <charlie@rivosinc.com>.
> > >
> > > The system call table in perf trace is used to map system call numbers
> > > to names and vice versa. Prior to these changes, a single table
> > > matching the perf binary's build was present. The table would be
> > > incorrect if tracing say a 32-bit binary from a 64-bit version of
> > > perf, the names and numbers wouldn't match.
> > >
> > > Change the build so that a single system call file is built and the
> > > potentially multiple tables are identifiable from the ELF machine type
> > > of the process being examined. To determine the ELF machine type, the
> > > executable's header is read from /proc/pid/exe with fallbacks to using
> > > the perf's binary type when unknown.
> > >
> > > Remove some runtime types used by the system call tables and make
> > > equivalents generated at build time.
> >
> > Our approaches are very different but I sent out a patch to do this a
> > couple of weeks ago [1].
> >
> > Did you look at that and decide you didn't like the approach?
> 
> Missing link?

Whoops here is the link:

https://lore.kernel.org/all/20250114-perf_syscall_arch_runtime-v1-1-5b304e408e11@rivosinc.com/

> 
> The patches generating a syscall(_32|_64)?.h landed. These changes
> take your changes and make it so that we just run the script once
> building a header file for all architectures. On x86 we then have the
> tables be guarded by ifdefs on i386 and x86-64. Then rather than the
> table just matching the host architecture the ELF machine is used for
> the executable running.
> 
> Thanks,
> Ian
> 
> > - Charlie
> >
> > >
> > > Ian Rogers (7):
> > >   perf syscalltble: Remove syscall_table.h
> > >   perf trace: Reorganize syscalls
> > >   perf syscalltbl: Remove struct syscalltbl
> > >   perf thread: Add support for reading the e_machine type for a thread
> > >   perf trace beauty: Add syscalltbl.sh generating all system call tables
> > >   perf syscalltbl: Use lookup table containing multiple architectures
> > >   perf build: Remove Makefile.syscalls
> > >
> > >  tools/perf/Makefile.perf                      |  10 +-
> > >  tools/perf/arch/alpha/entry/syscalls/Kbuild   |   2 -
> > >  .../alpha/entry/syscalls/Makefile.syscalls    |   5 -
> > >  tools/perf/arch/alpha/include/syscall_table.h |   2 -
> > >  tools/perf/arch/arc/entry/syscalls/Kbuild     |   2 -
> > >  .../arch/arc/entry/syscalls/Makefile.syscalls |   3 -
> > >  tools/perf/arch/arc/include/syscall_table.h   |   2 -
> > >  tools/perf/arch/arm/entry/syscalls/Kbuild     |   4 -
> > >  .../arch/arm/entry/syscalls/Makefile.syscalls |   2 -
> > >  tools/perf/arch/arm/include/syscall_table.h   |   2 -
> > >  tools/perf/arch/arm64/entry/syscalls/Kbuild   |   3 -
> > >  .../arm64/entry/syscalls/Makefile.syscalls    |   6 -
> > >  tools/perf/arch/arm64/include/syscall_table.h |   8 -
> > >  tools/perf/arch/csky/entry/syscalls/Kbuild    |   2 -
> > >  .../csky/entry/syscalls/Makefile.syscalls     |   3 -
> > >  tools/perf/arch/csky/include/syscall_table.h  |   2 -
> > >  .../perf/arch/loongarch/entry/syscalls/Kbuild |   2 -
> > >  .../entry/syscalls/Makefile.syscalls          |   3 -
> > >  .../arch/loongarch/include/syscall_table.h    |   2 -
> > >  tools/perf/arch/mips/entry/syscalls/Kbuild    |   2 -
> > >  .../mips/entry/syscalls/Makefile.syscalls     |   5 -
> > >  tools/perf/arch/mips/include/syscall_table.h  |   2 -
> > >  tools/perf/arch/parisc/entry/syscalls/Kbuild  |   3 -
> > >  .../parisc/entry/syscalls/Makefile.syscalls   |   6 -
> > >  .../perf/arch/parisc/include/syscall_table.h  |   8 -
> > >  tools/perf/arch/powerpc/entry/syscalls/Kbuild |   3 -
> > >  .../powerpc/entry/syscalls/Makefile.syscalls  |   6 -
> > >  .../perf/arch/powerpc/include/syscall_table.h |   8 -
> > >  tools/perf/arch/riscv/entry/syscalls/Kbuild   |   2 -
> > >  .../riscv/entry/syscalls/Makefile.syscalls    |   4 -
> > >  tools/perf/arch/riscv/include/syscall_table.h |   8 -
> > >  tools/perf/arch/s390/entry/syscalls/Kbuild    |   2 -
> > >  .../s390/entry/syscalls/Makefile.syscalls     |   5 -
> > >  tools/perf/arch/s390/include/syscall_table.h  |   2 -
> > >  tools/perf/arch/sh/entry/syscalls/Kbuild      |   2 -
> > >  .../arch/sh/entry/syscalls/Makefile.syscalls  |   4 -
> > >  tools/perf/arch/sh/include/syscall_table.h    |   2 -
> > >  tools/perf/arch/sparc/entry/syscalls/Kbuild   |   3 -
> > >  .../sparc/entry/syscalls/Makefile.syscalls    |   5 -
> > >  tools/perf/arch/sparc/include/syscall_table.h |   8 -
> > >  tools/perf/arch/x86/entry/syscalls/Kbuild     |   3 -
> > >  .../arch/x86/entry/syscalls/Makefile.syscalls |   6 -
> > >  tools/perf/arch/x86/include/syscall_table.h   |   8 -
> > >  tools/perf/arch/xtensa/entry/syscalls/Kbuild  |   2 -
> > >  .../xtensa/entry/syscalls/Makefile.syscalls   |   4 -
> > >  .../perf/arch/xtensa/include/syscall_table.h  |   2 -
> > >  tools/perf/builtin-trace.c                    | 275 +++++++++++-------
> > >  tools/perf/scripts/Makefile.syscalls          |  61 ----
> > >  tools/perf/scripts/syscalltbl.sh              |  86 ------
> > >  tools/perf/trace/beauty/syscalltbl.sh         | 274 +++++++++++++++++
> > >  tools/perf/util/syscalltbl.c                  | 142 ++++-----
> > >  tools/perf/util/syscalltbl.h                  |  22 +-
> > >  tools/perf/util/thread.c                      |  50 ++++
> > >  tools/perf/util/thread.h                      |  14 +-
> > >  54 files changed, 598 insertions(+), 506 deletions(-)
> > >  delete mode 100644 tools/perf/arch/alpha/entry/syscalls/Kbuild
> > >  delete mode 100644 tools/perf/arch/alpha/entry/syscalls/Makefile.syscalls
> > >  delete mode 100644 tools/perf/arch/alpha/include/syscall_table.h
> > >  delete mode 100644 tools/perf/arch/arc/entry/syscalls/Kbuild
> > >  delete mode 100644 tools/perf/arch/arc/entry/syscalls/Makefile.syscalls
> > >  delete mode 100644 tools/perf/arch/arc/include/syscall_table.h
> > >  delete mode 100644 tools/perf/arch/arm/entry/syscalls/Kbuild
> > >  delete mode 100644 tools/perf/arch/arm/entry/syscalls/Makefile.syscalls
> > >  delete mode 100644 tools/perf/arch/arm/include/syscall_table.h
> > >  delete mode 100644 tools/perf/arch/arm64/entry/syscalls/Kbuild
> > >  delete mode 100644 tools/perf/arch/arm64/entry/syscalls/Makefile.syscalls
> > >  delete mode 100644 tools/perf/arch/arm64/include/syscall_table.h
> > >  delete mode 100644 tools/perf/arch/csky/entry/syscalls/Kbuild
> > >  delete mode 100644 tools/perf/arch/csky/entry/syscalls/Makefile.syscalls
> > >  delete mode 100644 tools/perf/arch/csky/include/syscall_table.h
> > >  delete mode 100644 tools/perf/arch/loongarch/entry/syscalls/Kbuild
> > >  delete mode 100644 tools/perf/arch/loongarch/entry/syscalls/Makefile.syscalls
> > >  delete mode 100644 tools/perf/arch/loongarch/include/syscall_table.h
> > >  delete mode 100644 tools/perf/arch/mips/entry/syscalls/Kbuild
> > >  delete mode 100644 tools/perf/arch/mips/entry/syscalls/Makefile.syscalls
> > >  delete mode 100644 tools/perf/arch/mips/include/syscall_table.h
> > >  delete mode 100644 tools/perf/arch/parisc/entry/syscalls/Kbuild
> > >  delete mode 100644 tools/perf/arch/parisc/entry/syscalls/Makefile.syscalls
> > >  delete mode 100644 tools/perf/arch/parisc/include/syscall_table.h
> > >  delete mode 100644 tools/perf/arch/powerpc/entry/syscalls/Kbuild
> > >  delete mode 100644 tools/perf/arch/powerpc/entry/syscalls/Makefile.syscalls
> > >  delete mode 100644 tools/perf/arch/powerpc/include/syscall_table.h
> > >  delete mode 100644 tools/perf/arch/riscv/entry/syscalls/Kbuild
> > >  delete mode 100644 tools/perf/arch/riscv/entry/syscalls/Makefile.syscalls
> > >  delete mode 100644 tools/perf/arch/riscv/include/syscall_table.h
> > >  delete mode 100644 tools/perf/arch/s390/entry/syscalls/Kbuild
> > >  delete mode 100644 tools/perf/arch/s390/entry/syscalls/Makefile.syscalls
> > >  delete mode 100644 tools/perf/arch/s390/include/syscall_table.h
> > >  delete mode 100644 tools/perf/arch/sh/entry/syscalls/Kbuild
> > >  delete mode 100644 tools/perf/arch/sh/entry/syscalls/Makefile.syscalls
> > >  delete mode 100644 tools/perf/arch/sh/include/syscall_table.h
> > >  delete mode 100644 tools/perf/arch/sparc/entry/syscalls/Kbuild
> > >  delete mode 100644 tools/perf/arch/sparc/entry/syscalls/Makefile.syscalls
> > >  delete mode 100644 tools/perf/arch/sparc/include/syscall_table.h
> > >  delete mode 100644 tools/perf/arch/x86/entry/syscalls/Kbuild
> > >  delete mode 100644 tools/perf/arch/x86/entry/syscalls/Makefile.syscalls
> > >  delete mode 100644 tools/perf/arch/x86/include/syscall_table.h
> > >  delete mode 100644 tools/perf/arch/xtensa/entry/syscalls/Kbuild
> > >  delete mode 100644 tools/perf/arch/xtensa/entry/syscalls/Makefile.syscalls
> > >  delete mode 100644 tools/perf/arch/xtensa/include/syscall_table.h
> > >  delete mode 100644 tools/perf/scripts/Makefile.syscalls
> > >  delete mode 100755 tools/perf/scripts/syscalltbl.sh
> > >  create mode 100755 tools/perf/trace/beauty/syscalltbl.sh
> > >
> > > --
> > > 2.48.1.362.g079036d154-goog
> > >

