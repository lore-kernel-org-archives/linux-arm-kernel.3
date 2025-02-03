Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71133C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 21:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zn842Fm2SvvoNPi7A8bTdA+SWs8V2Ex9Kn5BCkaIK+k=; b=3l1o/GgGbK7yHvIBIUf9aa2CdR
	+VVrr4LDgRiQ2+M+SFTVWnHyeIC2zG9Oa9+gyKGKcBzuoR3Qr26BNnqxRa0A3SMPEL7eP3ghUy60h
	PeLxuFWexHi4KWiQPHkqEylTSAXzfKayMPLk8hJw6RFs8iZabuDZi2IR8rlSWSiQigkTFgw/BgOSQ
	xTbQuQOzUtmyFLHdsGiJICkILmueRym4u6HLX38mFiBTlg0SVXvqJYckLalaEUOtrHkuRv/MlwLMj
	DEU0QFJfqZ1I2UnA8dqA9NxB9hS9buHbLxtypl3VRNIKw/QCYBapv/BMPe+S3XPvymVzu9V+ycxkd
	PQa0u4GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf3nP-0000000GdKg-1fjg;
	Mon, 03 Feb 2025 21:15:55 +0000
Received: from mail-pj1-f66.google.com ([209.85.216.66])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf2iY-0000000GVjv-0gW6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 20:06:52 +0000
Received: by mail-pj1-f66.google.com with SMTP id 98e67ed59e1d1-2eec9b3a1bbso6323005a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Feb 2025 12:06:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738613209; x=1739218009; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zn842Fm2SvvoNPi7A8bTdA+SWs8V2Ex9Kn5BCkaIK+k=;
        b=wSTIOUkxubZfRKs21LcsV2PbP8zWmcTD0csTzOD0ylfcHI4EGYP8ypKz3Y+YbYGWZd
         JZrOkpPhN/0SuCHFjcdz7d2zlcFQUDwctG4q4rJd5dlqzFeLZ25LY7e/U88QM6MPPrF+
         g2vGAMs7S3kzOiyyQK4GqkBMfBR6m0GWuHRoQA8JjdHkHOjWnk0ahp1/h3ZdPEMMN2dz
         oqiPVWMAQfwQr1zQ0AIE1s4hZlBh1zS1zadJKy/Gd70vuoZ2FuPrZqs7y2bn/QUbmhtV
         QHd66DhGesl7pUdFWIYOuxRHthJnZnRaH4egBcSwqT+jX+mOkEHedHlhj/DOvTXT3i7+
         6S4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738613209; x=1739218009;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zn842Fm2SvvoNPi7A8bTdA+SWs8V2Ex9Kn5BCkaIK+k=;
        b=Wsibv1pNOB/Rbyw0xiJlCjn2Gh5e3xmhvmb0f5YA8pPTvPB/U5EaccDsBaJd+/1cdC
         FOh4ji6V0tl6gL7VAt0Er5xe/nzp3tEd7Ii4nGyVn1Gj05yBgof2ncG9YwyfI6P7trkU
         35JFX9vr3EX3MD26aQ/CovIIx14PS9fyv72T8JBczpY4/uOVNZAylmMgvik2nhGZUcHj
         k4fjqI1i9CRBwmnDJdFHbxtzxurh2QQx23y9jzo7m0mRSw2VKI8+RP58pr5qRiEYzCd8
         RoAq8RhJB/17g/ayZ5WFUiuAq5tswstmZzIzQ0uBBs3ZOaFIWPcH5bqcZ0ObGG4/2avk
         x9iw==
X-Forwarded-Encrypted: i=1; AJvYcCVxgxKqEBx2hWvQiR0sHhmfoLSWSCEASgYvFcyf6b/f+IG1HASlpQxwReezNSSYJeTW8H0YeLyicfPe2jLr6i3q@lists.infradead.org
X-Gm-Message-State: AOJu0YwHlqUP4EjpiJM2JMPLVq17eZ2ngWW3plBYGqL0yU+N2nnM0nzK
	hwZaeGM5IMAKzA5J3AVXWfGhfL4qcvzxqXA3K3OndNQ848KDV0tIa1BAQD3LQAc=
X-Gm-Gg: ASbGnctSukEBx15C5am9iMIqS/7E07mJi5a2FwbR2oLDbYtS81dFAGwQDmqJ15GSm3u
	YPDS7hUUb4icntJSRMBEgv3pQz4j3ECj5ajGH2x288KbNRC65vPeA3qrEEIUSdmnyKANLJo4aM0
	K89gtyx7kZC2k7VLcxKl81vz95dHNigLUb//vxUHb8RuKiK1oCORYZh27ylYIYUPcUtS5uJynuv
	MZcWV+8VL9VIWhoZKe9YYyswZ+ikEivOigrMinnXSWfUclcA/6ahNztKP5LIkXJN6j1Pu9QwKHW
	y68H6r4LM7I=
X-Google-Smtp-Source: AGHT+IGS8njPUir6FnFenAdtBINMEb+gIsqCrIFalq62SUNtJzt7ER4ln9yxJJRFPrJv3bhAJTVV+Q==
X-Received: by 2002:a17:90b:4b88:b0:2f4:9e8b:6aad with SMTP id 98e67ed59e1d1-2f83aa804cfmr41636277a91.0.1738613209064;
        Mon, 03 Feb 2025 12:06:49 -0800 (PST)
Received: from ghost ([2601:647:6700:64d0:4f63:f9d5:2cbd:2947])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f83bccc8bcsm11799434a91.13.2025.02.03.12.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 12:06:48 -0800 (PST)
Date: Mon, 3 Feb 2025 12:06:45 -0800
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
Message-ID: <Z6Eh1QLuqTbUKLCc@ghost>
References: <20250201071455.718247-1-irogers@google.com>
 <Z6EStkn-YZ8zaO7u@ghost>
 <CAP-5=fXRz_8CKNz4Fr-=0yhKbf_QE2ND+PPykSAO5p8wcUz7xA@mail.gmail.com>
 <Z6EVwaOVYaKtaK1j@ghost>
 <CAP-5=fX1hCNWWmGJPKYxj93S=zM1-eRucqzb4WW5fB_sZBCRLg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAP-5=fX1hCNWWmGJPKYxj93S=zM1-eRucqzb4WW5fB_sZBCRLg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_120650_475678_28CA9C49 
X-CRM114-Status: GOOD (  48.41  )
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

On Mon, Feb 03, 2025 at 11:39:01AM -0800, Ian Rogers wrote:
> On Mon, Feb 3, 2025 at 11:15 AM Charlie Jenkins <charlie@rivosinc.com> wrote:
> >
> > On Mon, Feb 03, 2025 at 11:10:49AM -0800, Ian Rogers wrote:
> > > On Mon, Feb 3, 2025 at 11:02 AM Charlie Jenkins <charlie@rivosinc.com> wrote:
> > > >
> > > > On Fri, Jan 31, 2025 at 11:14:48PM -0800, Ian Rogers wrote:
> > > > > This work builds on the clean up of system call tables and removal of
> > > > > libaudit by Charlie Jenkins <charlie@rivosinc.com>.
> > > > >
> > > > > The system call table in perf trace is used to map system call numbers
> > > > > to names and vice versa. Prior to these changes, a single table
> > > > > matching the perf binary's build was present. The table would be
> > > > > incorrect if tracing say a 32-bit binary from a 64-bit version of
> > > > > perf, the names and numbers wouldn't match.
> > > > >
> > > > > Change the build so that a single system call file is built and the
> > > > > potentially multiple tables are identifiable from the ELF machine type
> > > > > of the process being examined. To determine the ELF machine type, the
> > > > > executable's header is read from /proc/pid/exe with fallbacks to using
> > > > > the perf's binary type when unknown.
> > > > >
> > > > > Remove some runtime types used by the system call tables and make
> > > > > equivalents generated at build time.
> > > >
> > > > Our approaches are very different but I sent out a patch to do this a
> > > > couple of weeks ago [1].
> > > >
> > > > Did you look at that and decide you didn't like the approach?
> > >
> > > Missing link?
> >
> > Whoops here is the link:
> >
> > https://lore.kernel.org/all/20250114-perf_syscall_arch_runtime-v1-1-5b304e408e11@rivosinc.com/
> 
> I agree it is similar and progress, I think I prefer my changes :-)
> 
> Anything in the arch directories is only going to be built given a
> Makefile SRCARCH:
> https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git/tree/tools/perf/arch/Build?h=perf-tools-next#n2
> which means if we want the system call tables for say ARM on x86-64 we
> need to reinvent the build - this isn't a problem today but perhaps
> something to consider if we wanted a cross-architecture perf trace
> record. I'd like to do away entirely with the arch directory for this
> kind of reason. For example, if we run perf on a user space emulator
> (say a testing set up) and it sees AMD data fabric PMUs, logic for
> those PMUs currently lives in the arch directory for x86 and likely
> wasn't even built into the perf tool. We should be able to identify
> PMUs and act accordingly based on their names. In the case of the
> overloaded "cpu" PMU we can identify it with the CPUID. The less code
> in arch and the fewer architecture ifdefs, the better things should
> work cross-architecture, in testing scenarios, etc. We also win by
> getting code coverage without, for example, having to build and test
> on csky or super H.
> 
> Your changes are using the string for the architecture name. I think
> that string is something we should get rid of:
> https://lore.kernel.org/lkml/CAP-5=fX2BtFzhGLCSqO1QszqfX=HT8RrTdG_5Ttp5Gw4seSstA@mail.gmail.com/
> but there's no reason we couldn't clean that up on top of your change.

Yes that part is not ideal.

> 
> The build with lots of separate Build/Makefiles is something of a pain
> to port/maintain in a bazel version of the build I maintain at Google
> (happy to open source if anyone cares). In these changes you just run
> a big script and get a big header file out the end, which largely
> matches the other perf trace beauty things we build.

Fair enough! I wanted to mimic how the kernel was building the syscall
tables as closely as possible, it's convenient to have cohesion.

What is the usecase for the bazel version?

- Charlie

> 
> Thanks,
> Ian
> 
> > >
> > > The patches generating a syscall(_32|_64)?.h landed. These changes
> > > take your changes and make it so that we just run the script once
> > > building a header file for all architectures. On x86 we then have the
> > > tables be guarded by ifdefs on i386 and x86-64. Then rather than the
> > > table just matching the host architecture the ELF machine is used for
> > > the executable running.
> > >
> > > Thanks,
> > > Ian
> > >
> > > > - Charlie
> > > >
> > > > >
> > > > > Ian Rogers (7):
> > > > >   perf syscalltble: Remove syscall_table.h
> > > > >   perf trace: Reorganize syscalls
> > > > >   perf syscalltbl: Remove struct syscalltbl
> > > > >   perf thread: Add support for reading the e_machine type for a thread
> > > > >   perf trace beauty: Add syscalltbl.sh generating all system call tables
> > > > >   perf syscalltbl: Use lookup table containing multiple architectures
> > > > >   perf build: Remove Makefile.syscalls
> > > > >
> > > > >  tools/perf/Makefile.perf                      |  10 +-
> > > > >  tools/perf/arch/alpha/entry/syscalls/Kbuild   |   2 -
> > > > >  .../alpha/entry/syscalls/Makefile.syscalls    |   5 -
> > > > >  tools/perf/arch/alpha/include/syscall_table.h |   2 -
> > > > >  tools/perf/arch/arc/entry/syscalls/Kbuild     |   2 -
> > > > >  .../arch/arc/entry/syscalls/Makefile.syscalls |   3 -
> > > > >  tools/perf/arch/arc/include/syscall_table.h   |   2 -
> > > > >  tools/perf/arch/arm/entry/syscalls/Kbuild     |   4 -
> > > > >  .../arch/arm/entry/syscalls/Makefile.syscalls |   2 -
> > > > >  tools/perf/arch/arm/include/syscall_table.h   |   2 -
> > > > >  tools/perf/arch/arm64/entry/syscalls/Kbuild   |   3 -
> > > > >  .../arm64/entry/syscalls/Makefile.syscalls    |   6 -
> > > > >  tools/perf/arch/arm64/include/syscall_table.h |   8 -
> > > > >  tools/perf/arch/csky/entry/syscalls/Kbuild    |   2 -
> > > > >  .../csky/entry/syscalls/Makefile.syscalls     |   3 -
> > > > >  tools/perf/arch/csky/include/syscall_table.h  |   2 -
> > > > >  .../perf/arch/loongarch/entry/syscalls/Kbuild |   2 -
> > > > >  .../entry/syscalls/Makefile.syscalls          |   3 -
> > > > >  .../arch/loongarch/include/syscall_table.h    |   2 -
> > > > >  tools/perf/arch/mips/entry/syscalls/Kbuild    |   2 -
> > > > >  .../mips/entry/syscalls/Makefile.syscalls     |   5 -
> > > > >  tools/perf/arch/mips/include/syscall_table.h  |   2 -
> > > > >  tools/perf/arch/parisc/entry/syscalls/Kbuild  |   3 -
> > > > >  .../parisc/entry/syscalls/Makefile.syscalls   |   6 -
> > > > >  .../perf/arch/parisc/include/syscall_table.h  |   8 -
> > > > >  tools/perf/arch/powerpc/entry/syscalls/Kbuild |   3 -
> > > > >  .../powerpc/entry/syscalls/Makefile.syscalls  |   6 -
> > > > >  .../perf/arch/powerpc/include/syscall_table.h |   8 -
> > > > >  tools/perf/arch/riscv/entry/syscalls/Kbuild   |   2 -
> > > > >  .../riscv/entry/syscalls/Makefile.syscalls    |   4 -
> > > > >  tools/perf/arch/riscv/include/syscall_table.h |   8 -
> > > > >  tools/perf/arch/s390/entry/syscalls/Kbuild    |   2 -
> > > > >  .../s390/entry/syscalls/Makefile.syscalls     |   5 -
> > > > >  tools/perf/arch/s390/include/syscall_table.h  |   2 -
> > > > >  tools/perf/arch/sh/entry/syscalls/Kbuild      |   2 -
> > > > >  .../arch/sh/entry/syscalls/Makefile.syscalls  |   4 -
> > > > >  tools/perf/arch/sh/include/syscall_table.h    |   2 -
> > > > >  tools/perf/arch/sparc/entry/syscalls/Kbuild   |   3 -
> > > > >  .../sparc/entry/syscalls/Makefile.syscalls    |   5 -
> > > > >  tools/perf/arch/sparc/include/syscall_table.h |   8 -
> > > > >  tools/perf/arch/x86/entry/syscalls/Kbuild     |   3 -
> > > > >  .../arch/x86/entry/syscalls/Makefile.syscalls |   6 -
> > > > >  tools/perf/arch/x86/include/syscall_table.h   |   8 -
> > > > >  tools/perf/arch/xtensa/entry/syscalls/Kbuild  |   2 -
> > > > >  .../xtensa/entry/syscalls/Makefile.syscalls   |   4 -
> > > > >  .../perf/arch/xtensa/include/syscall_table.h  |   2 -
> > > > >  tools/perf/builtin-trace.c                    | 275 +++++++++++-------
> > > > >  tools/perf/scripts/Makefile.syscalls          |  61 ----
> > > > >  tools/perf/scripts/syscalltbl.sh              |  86 ------
> > > > >  tools/perf/trace/beauty/syscalltbl.sh         | 274 +++++++++++++++++
> > > > >  tools/perf/util/syscalltbl.c                  | 142 ++++-----
> > > > >  tools/perf/util/syscalltbl.h                  |  22 +-
> > > > >  tools/perf/util/thread.c                      |  50 ++++
> > > > >  tools/perf/util/thread.h                      |  14 +-
> > > > >  54 files changed, 598 insertions(+), 506 deletions(-)
> > > > >  delete mode 100644 tools/perf/arch/alpha/entry/syscalls/Kbuild
> > > > >  delete mode 100644 tools/perf/arch/alpha/entry/syscalls/Makefile.syscalls
> > > > >  delete mode 100644 tools/perf/arch/alpha/include/syscall_table.h
> > > > >  delete mode 100644 tools/perf/arch/arc/entry/syscalls/Kbuild
> > > > >  delete mode 100644 tools/perf/arch/arc/entry/syscalls/Makefile.syscalls
> > > > >  delete mode 100644 tools/perf/arch/arc/include/syscall_table.h
> > > > >  delete mode 100644 tools/perf/arch/arm/entry/syscalls/Kbuild
> > > > >  delete mode 100644 tools/perf/arch/arm/entry/syscalls/Makefile.syscalls
> > > > >  delete mode 100644 tools/perf/arch/arm/include/syscall_table.h
> > > > >  delete mode 100644 tools/perf/arch/arm64/entry/syscalls/Kbuild
> > > > >  delete mode 100644 tools/perf/arch/arm64/entry/syscalls/Makefile.syscalls
> > > > >  delete mode 100644 tools/perf/arch/arm64/include/syscall_table.h
> > > > >  delete mode 100644 tools/perf/arch/csky/entry/syscalls/Kbuild
> > > > >  delete mode 100644 tools/perf/arch/csky/entry/syscalls/Makefile.syscalls
> > > > >  delete mode 100644 tools/perf/arch/csky/include/syscall_table.h
> > > > >  delete mode 100644 tools/perf/arch/loongarch/entry/syscalls/Kbuild
> > > > >  delete mode 100644 tools/perf/arch/loongarch/entry/syscalls/Makefile.syscalls
> > > > >  delete mode 100644 tools/perf/arch/loongarch/include/syscall_table.h
> > > > >  delete mode 100644 tools/perf/arch/mips/entry/syscalls/Kbuild
> > > > >  delete mode 100644 tools/perf/arch/mips/entry/syscalls/Makefile.syscalls
> > > > >  delete mode 100644 tools/perf/arch/mips/include/syscall_table.h
> > > > >  delete mode 100644 tools/perf/arch/parisc/entry/syscalls/Kbuild
> > > > >  delete mode 100644 tools/perf/arch/parisc/entry/syscalls/Makefile.syscalls
> > > > >  delete mode 100644 tools/perf/arch/parisc/include/syscall_table.h
> > > > >  delete mode 100644 tools/perf/arch/powerpc/entry/syscalls/Kbuild
> > > > >  delete mode 100644 tools/perf/arch/powerpc/entry/syscalls/Makefile.syscalls
> > > > >  delete mode 100644 tools/perf/arch/powerpc/include/syscall_table.h
> > > > >  delete mode 100644 tools/perf/arch/riscv/entry/syscalls/Kbuild
> > > > >  delete mode 100644 tools/perf/arch/riscv/entry/syscalls/Makefile.syscalls
> > > > >  delete mode 100644 tools/perf/arch/riscv/include/syscall_table.h
> > > > >  delete mode 100644 tools/perf/arch/s390/entry/syscalls/Kbuild
> > > > >  delete mode 100644 tools/perf/arch/s390/entry/syscalls/Makefile.syscalls
> > > > >  delete mode 100644 tools/perf/arch/s390/include/syscall_table.h
> > > > >  delete mode 100644 tools/perf/arch/sh/entry/syscalls/Kbuild
> > > > >  delete mode 100644 tools/perf/arch/sh/entry/syscalls/Makefile.syscalls
> > > > >  delete mode 100644 tools/perf/arch/sh/include/syscall_table.h
> > > > >  delete mode 100644 tools/perf/arch/sparc/entry/syscalls/Kbuild
> > > > >  delete mode 100644 tools/perf/arch/sparc/entry/syscalls/Makefile.syscalls
> > > > >  delete mode 100644 tools/perf/arch/sparc/include/syscall_table.h
> > > > >  delete mode 100644 tools/perf/arch/x86/entry/syscalls/Kbuild
> > > > >  delete mode 100644 tools/perf/arch/x86/entry/syscalls/Makefile.syscalls
> > > > >  delete mode 100644 tools/perf/arch/x86/include/syscall_table.h
> > > > >  delete mode 100644 tools/perf/arch/xtensa/entry/syscalls/Kbuild
> > > > >  delete mode 100644 tools/perf/arch/xtensa/entry/syscalls/Makefile.syscalls
> > > > >  delete mode 100644 tools/perf/arch/xtensa/include/syscall_table.h
> > > > >  delete mode 100644 tools/perf/scripts/Makefile.syscalls
> > > > >  delete mode 100755 tools/perf/scripts/syscalltbl.sh
> > > > >  create mode 100755 tools/perf/trace/beauty/syscalltbl.sh
> > > > >
> > > > > --
> > > > > 2.48.1.362.g079036d154-goog
> > > > >

