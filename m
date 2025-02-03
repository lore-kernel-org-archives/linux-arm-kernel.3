Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5AF2C02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 19:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SHHZnqU6DYFLZ8okqBKWpa9FEMJx8sgQSEViBE31WZs=; b=UljDklrjHyW7QIC/ib5t7pjGZB
	NcnKCwgNtz8RSnZKMS9toDs8lyzwNGzVcjt0C5kHYmz9VEQXWaqz4YhvAnGUsC3OrLriH7voClPFA
	vw/mYV6r4kGcQ171fU0QmsqlzGr3Xzgl2nVs5w2Pfy2uyF6YQcBHsS2xdzcdxX0At1221jxQ5YFtm
	LW0rkN/kxjJEKlOnjKqPiR8wpq9b9InYclyaXVqBddIqgop7O6TTNK1RExuMHz6ayXQ8yixQCxsUR
	3DkefWtnnqBiuUW/+6smBNzMMPRZv9iO8XYprGsSnaSNQics0J6MNnbfwWt1cJolHU9fVDZ8rm2sg
	Kt03Ir9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf2J9-0000000GTlj-3pdT;
	Mon, 03 Feb 2025 19:40:35 +0000
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf2Hp-0000000GTgM-1znN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 19:39:14 +0000
Received: by mail-il1-x12e.google.com with SMTP id e9e14a558f8ab-3ce82195aa0so22995ab.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Feb 2025 11:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738611552; x=1739216352; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SHHZnqU6DYFLZ8okqBKWpa9FEMJx8sgQSEViBE31WZs=;
        b=rRmJWHhZhVhixZ3ZXcYOqnTCMkB99Qrh8a83V1Tik1cgVrBQ3G/bz/BT3jU1UjQ1mX
         8ao8+DbBWUafgJtv2P3ZICOP/EqF18ytRiw0r1EYG7D3dKRsCGTbJ+FAO1N2m5ig7H78
         X1Cv8Km60rXKeiJjnyes8nnWB7y8pJa2xwC7sp36GxTQOUHAzxzFQOBUdei+zCMZj4Sr
         9+39AtEmtJb5haLSSBGaBtWXPfuENiuelWYjWkYhr9SwahmOmsi8FZKovIBjC6dAmLSI
         p97Sz7K1x8GmCCCNOdXHWpxehTAIVpu4uDfegHaEeGaQX3XOsuiHNiXcEoOdK7fr/6i4
         33Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738611552; x=1739216352;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SHHZnqU6DYFLZ8okqBKWpa9FEMJx8sgQSEViBE31WZs=;
        b=ejxTP2Fam8zEpfcGoCR+PNR9ShtwwHHL8+Lft9SGC6SUtyxadiNNRcoJSuiSbSxENJ
         OwsFA5E19nXR387cF5X//X9YU0IAKdACTisqmXqr8QK/31HLhNMhqVbJHD2eBbwL3vNq
         SHV96dd5uPcHHwv3K15i5MIpTACibTEh/OwHc0f+IQ7QrSnWyg3ZdUPubRVUy23Hgzx4
         3nDciND9+HN192EoxT5/ofDEfKmfwWFRXjkgyufjuyqQQSr+AsiRq5/VxL9XDqcoI2dD
         sN1WRSe9rBXTL+aWPFfHJlpXftdxKOJlPioe7EeexQfjz64eMg3KpBZzUW9wbyIyaajm
         JEyw==
X-Forwarded-Encrypted: i=1; AJvYcCXymXa3zGFgxCuo5khp05Z9qpnJ8PznlGrT+PsJlNFZcjxN+G6x5A5UmpeWpFL+MQFo5SJokRx3GkJK7hCyIYXd@lists.infradead.org
X-Gm-Message-State: AOJu0YwWROCiEhrac/dPI5HIoRNiCfb5zezbi0oiXNp9UYhQMJ+h2YnL
	c5uRvcrd07tRa/663M3qqSyrmB8oa+0sqeMRujlVnGaKFPoXb/nHK9+Heul3BU5jbArhgJkyIKu
	5s7AuHW/QcvAdwrhRgCt4sJYJjHcu0GtYjY3w
X-Gm-Gg: ASbGnctUS4gtpB7ylSSjCD8lCDhDdVbNZH8SQED/oECxBvobrsTRRFs0Z9XhIkk0At/
	CKz2jgiyGux5TGVD9OB7NZUj79vTf3hMFQjWUdpopvMspjpyqhINME/szSGe47Uf7MJioCfsTgq
	ayZAfu042/niRUJnaibeOQS8Y=
X-Google-Smtp-Source: AGHT+IHdY4s9Hp5Vc4l+FLstuexCcykhpRM8v2E7YaaWlmaZjPVvyG0raU2U/YG4zCFqF4xylbaK4WNzHAHM0z275/A=
X-Received: by 2002:a05:6e02:1aa7:b0:3ce:7852:1e9 with SMTP id
 e9e14a558f8ab-3d03fd784eemr245345ab.17.1738611552232; Mon, 03 Feb 2025
 11:39:12 -0800 (PST)
MIME-Version: 1.0
References: <20250201071455.718247-1-irogers@google.com> <Z6EStkn-YZ8zaO7u@ghost>
 <CAP-5=fXRz_8CKNz4Fr-=0yhKbf_QE2ND+PPykSAO5p8wcUz7xA@mail.gmail.com> <Z6EVwaOVYaKtaK1j@ghost>
In-Reply-To: <Z6EVwaOVYaKtaK1j@ghost>
From: Ian Rogers <irogers@google.com>
Date: Mon, 3 Feb 2025 11:39:01 -0800
X-Gm-Features: AWEUYZmZ9wDy6ohVvcewzzZYhBhzXyoFnlL0nFE9AqdajOcbRo2H1pqd5ez3kHM
Message-ID: <CAP-5=fX1hCNWWmGJPKYxj93S=zM1-eRucqzb4WW5fB_sZBCRLg@mail.gmail.com>
Subject: Re: [PATCH v1 0/7] perf: Support multiple system call tables in the build
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
	James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>, 
	Leo Yan <leo.yan@linux.dev>, Guo Ren <guoren@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Bibo Mao <maobibo@loongson.cn>, 
	Arnd Bergmann <arnd@arndb.de>, Huacai Chen <chenhuacai@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Jiri Slaby <jirislaby@kernel.org>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Howard Chu <howardchu95@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_113913_521105_30906F68 
X-CRM114-Status: GOOD (  41.67  )
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

On Mon, Feb 3, 2025 at 11:15=E2=80=AFAM Charlie Jenkins <charlie@rivosinc.c=
om> wrote:
>
> On Mon, Feb 03, 2025 at 11:10:49AM -0800, Ian Rogers wrote:
> > On Mon, Feb 3, 2025 at 11:02=E2=80=AFAM Charlie Jenkins <charlie@rivosi=
nc.com> wrote:
> > >
> > > On Fri, Jan 31, 2025 at 11:14:48PM -0800, Ian Rogers wrote:
> > > > This work builds on the clean up of system call tables and removal =
of
> > > > libaudit by Charlie Jenkins <charlie@rivosinc.com>.
> > > >
> > > > The system call table in perf trace is used to map system call numb=
ers
> > > > to names and vice versa. Prior to these changes, a single table
> > > > matching the perf binary's build was present. The table would be
> > > > incorrect if tracing say a 32-bit binary from a 64-bit version of
> > > > perf, the names and numbers wouldn't match.
> > > >
> > > > Change the build so that a single system call file is built and the
> > > > potentially multiple tables are identifiable from the ELF machine t=
ype
> > > > of the process being examined. To determine the ELF machine type, t=
he
> > > > executable's header is read from /proc/pid/exe with fallbacks to us=
ing
> > > > the perf's binary type when unknown.
> > > >
> > > > Remove some runtime types used by the system call tables and make
> > > > equivalents generated at build time.
> > >
> > > Our approaches are very different but I sent out a patch to do this a
> > > couple of weeks ago [1].
> > >
> > > Did you look at that and decide you didn't like the approach?
> >
> > Missing link?
>
> Whoops here is the link:
>
> https://lore.kernel.org/all/20250114-perf_syscall_arch_runtime-v1-1-5b304=
e408e11@rivosinc.com/

I agree it is similar and progress, I think I prefer my changes :-)

Anything in the arch directories is only going to be built given a
Makefile SRCARCH:
https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git/tr=
ee/tools/perf/arch/Build?h=3Dperf-tools-next#n2
which means if we want the system call tables for say ARM on x86-64 we
need to reinvent the build - this isn't a problem today but perhaps
something to consider if we wanted a cross-architecture perf trace
record. I'd like to do away entirely with the arch directory for this
kind of reason. For example, if we run perf on a user space emulator
(say a testing set up) and it sees AMD data fabric PMUs, logic for
those PMUs currently lives in the arch directory for x86 and likely
wasn't even built into the perf tool. We should be able to identify
PMUs and act accordingly based on their names. In the case of the
overloaded "cpu" PMU we can identify it with the CPUID. The less code
in arch and the fewer architecture ifdefs, the better things should
work cross-architecture, in testing scenarios, etc. We also win by
getting code coverage without, for example, having to build and test
on csky or super H.

Your changes are using the string for the architecture name. I think
that string is something we should get rid of:
https://lore.kernel.org/lkml/CAP-5=3DfX2BtFzhGLCSqO1QszqfX=3DHT8RrTdG_5Ttp5=
Gw4seSstA@mail.gmail.com/
but there's no reason we couldn't clean that up on top of your change.

The build with lots of separate Build/Makefiles is something of a pain
to port/maintain in a bazel version of the build I maintain at Google
(happy to open source if anyone cares). In these changes you just run
a big script and get a big header file out the end, which largely
matches the other perf trace beauty things we build.

Thanks,
Ian

> >
> > The patches generating a syscall(_32|_64)?.h landed. These changes
> > take your changes and make it so that we just run the script once
> > building a header file for all architectures. On x86 we then have the
> > tables be guarded by ifdefs on i386 and x86-64. Then rather than the
> > table just matching the host architecture the ELF machine is used for
> > the executable running.
> >
> > Thanks,
> > Ian
> >
> > > - Charlie
> > >
> > > >
> > > > Ian Rogers (7):
> > > >   perf syscalltble: Remove syscall_table.h
> > > >   perf trace: Reorganize syscalls
> > > >   perf syscalltbl: Remove struct syscalltbl
> > > >   perf thread: Add support for reading the e_machine type for a thr=
ead
> > > >   perf trace beauty: Add syscalltbl.sh generating all system call t=
ables
> > > >   perf syscalltbl: Use lookup table containing multiple architectur=
es
> > > >   perf build: Remove Makefile.syscalls
> > > >
> > > >  tools/perf/Makefile.perf                      |  10 +-
> > > >  tools/perf/arch/alpha/entry/syscalls/Kbuild   |   2 -
> > > >  .../alpha/entry/syscalls/Makefile.syscalls    |   5 -
> > > >  tools/perf/arch/alpha/include/syscall_table.h |   2 -
> > > >  tools/perf/arch/arc/entry/syscalls/Kbuild     |   2 -
> > > >  .../arch/arc/entry/syscalls/Makefile.syscalls |   3 -
> > > >  tools/perf/arch/arc/include/syscall_table.h   |   2 -
> > > >  tools/perf/arch/arm/entry/syscalls/Kbuild     |   4 -
> > > >  .../arch/arm/entry/syscalls/Makefile.syscalls |   2 -
> > > >  tools/perf/arch/arm/include/syscall_table.h   |   2 -
> > > >  tools/perf/arch/arm64/entry/syscalls/Kbuild   |   3 -
> > > >  .../arm64/entry/syscalls/Makefile.syscalls    |   6 -
> > > >  tools/perf/arch/arm64/include/syscall_table.h |   8 -
> > > >  tools/perf/arch/csky/entry/syscalls/Kbuild    |   2 -
> > > >  .../csky/entry/syscalls/Makefile.syscalls     |   3 -
> > > >  tools/perf/arch/csky/include/syscall_table.h  |   2 -
> > > >  .../perf/arch/loongarch/entry/syscalls/Kbuild |   2 -
> > > >  .../entry/syscalls/Makefile.syscalls          |   3 -
> > > >  .../arch/loongarch/include/syscall_table.h    |   2 -
> > > >  tools/perf/arch/mips/entry/syscalls/Kbuild    |   2 -
> > > >  .../mips/entry/syscalls/Makefile.syscalls     |   5 -
> > > >  tools/perf/arch/mips/include/syscall_table.h  |   2 -
> > > >  tools/perf/arch/parisc/entry/syscalls/Kbuild  |   3 -
> > > >  .../parisc/entry/syscalls/Makefile.syscalls   |   6 -
> > > >  .../perf/arch/parisc/include/syscall_table.h  |   8 -
> > > >  tools/perf/arch/powerpc/entry/syscalls/Kbuild |   3 -
> > > >  .../powerpc/entry/syscalls/Makefile.syscalls  |   6 -
> > > >  .../perf/arch/powerpc/include/syscall_table.h |   8 -
> > > >  tools/perf/arch/riscv/entry/syscalls/Kbuild   |   2 -
> > > >  .../riscv/entry/syscalls/Makefile.syscalls    |   4 -
> > > >  tools/perf/arch/riscv/include/syscall_table.h |   8 -
> > > >  tools/perf/arch/s390/entry/syscalls/Kbuild    |   2 -
> > > >  .../s390/entry/syscalls/Makefile.syscalls     |   5 -
> > > >  tools/perf/arch/s390/include/syscall_table.h  |   2 -
> > > >  tools/perf/arch/sh/entry/syscalls/Kbuild      |   2 -
> > > >  .../arch/sh/entry/syscalls/Makefile.syscalls  |   4 -
> > > >  tools/perf/arch/sh/include/syscall_table.h    |   2 -
> > > >  tools/perf/arch/sparc/entry/syscalls/Kbuild   |   3 -
> > > >  .../sparc/entry/syscalls/Makefile.syscalls    |   5 -
> > > >  tools/perf/arch/sparc/include/syscall_table.h |   8 -
> > > >  tools/perf/arch/x86/entry/syscalls/Kbuild     |   3 -
> > > >  .../arch/x86/entry/syscalls/Makefile.syscalls |   6 -
> > > >  tools/perf/arch/x86/include/syscall_table.h   |   8 -
> > > >  tools/perf/arch/xtensa/entry/syscalls/Kbuild  |   2 -
> > > >  .../xtensa/entry/syscalls/Makefile.syscalls   |   4 -
> > > >  .../perf/arch/xtensa/include/syscall_table.h  |   2 -
> > > >  tools/perf/builtin-trace.c                    | 275 +++++++++++---=
----
> > > >  tools/perf/scripts/Makefile.syscalls          |  61 ----
> > > >  tools/perf/scripts/syscalltbl.sh              |  86 ------
> > > >  tools/perf/trace/beauty/syscalltbl.sh         | 274 ++++++++++++++=
+++
> > > >  tools/perf/util/syscalltbl.c                  | 142 ++++-----
> > > >  tools/perf/util/syscalltbl.h                  |  22 +-
> > > >  tools/perf/util/thread.c                      |  50 ++++
> > > >  tools/perf/util/thread.h                      |  14 +-
> > > >  54 files changed, 598 insertions(+), 506 deletions(-)
> > > >  delete mode 100644 tools/perf/arch/alpha/entry/syscalls/Kbuild
> > > >  delete mode 100644 tools/perf/arch/alpha/entry/syscalls/Makefile.s=
yscalls
> > > >  delete mode 100644 tools/perf/arch/alpha/include/syscall_table.h
> > > >  delete mode 100644 tools/perf/arch/arc/entry/syscalls/Kbuild
> > > >  delete mode 100644 tools/perf/arch/arc/entry/syscalls/Makefile.sys=
calls
> > > >  delete mode 100644 tools/perf/arch/arc/include/syscall_table.h
> > > >  delete mode 100644 tools/perf/arch/arm/entry/syscalls/Kbuild
> > > >  delete mode 100644 tools/perf/arch/arm/entry/syscalls/Makefile.sys=
calls
> > > >  delete mode 100644 tools/perf/arch/arm/include/syscall_table.h
> > > >  delete mode 100644 tools/perf/arch/arm64/entry/syscalls/Kbuild
> > > >  delete mode 100644 tools/perf/arch/arm64/entry/syscalls/Makefile.s=
yscalls
> > > >  delete mode 100644 tools/perf/arch/arm64/include/syscall_table.h
> > > >  delete mode 100644 tools/perf/arch/csky/entry/syscalls/Kbuild
> > > >  delete mode 100644 tools/perf/arch/csky/entry/syscalls/Makefile.sy=
scalls
> > > >  delete mode 100644 tools/perf/arch/csky/include/syscall_table.h
> > > >  delete mode 100644 tools/perf/arch/loongarch/entry/syscalls/Kbuild
> > > >  delete mode 100644 tools/perf/arch/loongarch/entry/syscalls/Makefi=
le.syscalls
> > > >  delete mode 100644 tools/perf/arch/loongarch/include/syscall_table=
.h
> > > >  delete mode 100644 tools/perf/arch/mips/entry/syscalls/Kbuild
> > > >  delete mode 100644 tools/perf/arch/mips/entry/syscalls/Makefile.sy=
scalls
> > > >  delete mode 100644 tools/perf/arch/mips/include/syscall_table.h
> > > >  delete mode 100644 tools/perf/arch/parisc/entry/syscalls/Kbuild
> > > >  delete mode 100644 tools/perf/arch/parisc/entry/syscalls/Makefile.=
syscalls
> > > >  delete mode 100644 tools/perf/arch/parisc/include/syscall_table.h
> > > >  delete mode 100644 tools/perf/arch/powerpc/entry/syscalls/Kbuild
> > > >  delete mode 100644 tools/perf/arch/powerpc/entry/syscalls/Makefile=
.syscalls
> > > >  delete mode 100644 tools/perf/arch/powerpc/include/syscall_table.h
> > > >  delete mode 100644 tools/perf/arch/riscv/entry/syscalls/Kbuild
> > > >  delete mode 100644 tools/perf/arch/riscv/entry/syscalls/Makefile.s=
yscalls
> > > >  delete mode 100644 tools/perf/arch/riscv/include/syscall_table.h
> > > >  delete mode 100644 tools/perf/arch/s390/entry/syscalls/Kbuild
> > > >  delete mode 100644 tools/perf/arch/s390/entry/syscalls/Makefile.sy=
scalls
> > > >  delete mode 100644 tools/perf/arch/s390/include/syscall_table.h
> > > >  delete mode 100644 tools/perf/arch/sh/entry/syscalls/Kbuild
> > > >  delete mode 100644 tools/perf/arch/sh/entry/syscalls/Makefile.sysc=
alls
> > > >  delete mode 100644 tools/perf/arch/sh/include/syscall_table.h
> > > >  delete mode 100644 tools/perf/arch/sparc/entry/syscalls/Kbuild
> > > >  delete mode 100644 tools/perf/arch/sparc/entry/syscalls/Makefile.s=
yscalls
> > > >  delete mode 100644 tools/perf/arch/sparc/include/syscall_table.h
> > > >  delete mode 100644 tools/perf/arch/x86/entry/syscalls/Kbuild
> > > >  delete mode 100644 tools/perf/arch/x86/entry/syscalls/Makefile.sys=
calls
> > > >  delete mode 100644 tools/perf/arch/x86/include/syscall_table.h
> > > >  delete mode 100644 tools/perf/arch/xtensa/entry/syscalls/Kbuild
> > > >  delete mode 100644 tools/perf/arch/xtensa/entry/syscalls/Makefile.=
syscalls
> > > >  delete mode 100644 tools/perf/arch/xtensa/include/syscall_table.h
> > > >  delete mode 100644 tools/perf/scripts/Makefile.syscalls
> > > >  delete mode 100755 tools/perf/scripts/syscalltbl.sh
> > > >  create mode 100755 tools/perf/trace/beauty/syscalltbl.sh
> > > >
> > > > --
> > > > 2.48.1.362.g079036d154-goog
> > > >

