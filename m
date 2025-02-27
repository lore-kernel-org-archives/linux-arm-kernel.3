Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9A4CC19F38
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 07:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ytJFUEqsaBUJ+lrbM5hc3QzUjfz69ZuqvWz/RpVovhg=; b=YUmXLRiZ0NdPwrBT6PTlnv0jY1
	Lniga0xAozwmJLwEUUkBvK5DwWoJvfuUYaICWgOAYhfmtkM1e59zG4CcD9efsNM6XR4GB/xE22/z6
	oXuXPIUJ4+JEqrRi9wIVdK6YGYPUe124RAJpAfRZMpUcY0bdSEC++0By4JIyRveRdjrdIawq9kXUY
	dQd9I/v9OjQZSoq/dWRY4LUi6JZU17d+S55BiWT9DQzmbeYpKI6yADY8gjej/DnFpEtcQNMRGkY2u
	ZWSnWyjE7RCuBBxIkml4qyfqdClvRIgcKvCfEIqGKoKbVMbl7j7fzUFkwepdQcmzLjy2u2KuzcG5Q
	jmlE1VWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnYHW-00000006Y0N-2sOD;
	Thu, 27 Feb 2025 07:26:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnYFz-00000006Xsa-15J1;
	Thu, 27 Feb 2025 07:24:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D19FF5C1298;
	Thu, 27 Feb 2025 07:23:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B3C2C4CEDD;
	Thu, 27 Feb 2025 07:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740641070;
	bh=6mhB09gcTzebblAjDFwvrQdiH2lOS2WxVu0HWi5oqno=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YppbzpmdBkKGD8B+tk+kU7/CkxwHuweAntSFmQesgJES1prcypRfA0PjZtDrwr05t
	 4i4mbwqUb6xLvmSRMqCCXVFUF15PoS0zFEeQMzVnVsIJtIAZ2ZhyP7SYbh7SmeZBAs
	 K2/rOA7kCRj1r/0bffpP5aeSTmf1uYeYCXGCRSY4afykZWeqw8wNY2dBuOeWQCiv50
	 yG7v9uvXKWI3CoIjot+vXoVVAHizez7tWk/lYXjd3l+FO4jUD5ckUqhc5bp8iGywd6
	 kX0/qnby7bbBwg27HGU/eKsXqMLYzsp0pRh73ONE5MReYXR9nXPQdvPstdCebvxC2w
	 D6NX1pHw51foA==
Date: Wed, 26 Feb 2025 23:24:27 -0800
From: Namhyung Kim <namhyung@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Kan Liang <kan.liang@linux.intel.com>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
	guoren <guoren@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
	Howard Chu <howardchu95@gmail.com>, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
	linux-riscv@lists.infradead.org, linux-mips@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v3 0/8] perf: Support multiple system call tables in the
 build
Message-ID: <Z8ATKyAhb-67NGIM@google.com>
References: <20250219185657.280286-1-irogers@google.com>
 <Z702_CQ7nMx9fZQn@google.com>
 <CAP-5=fWYiQP84BMjm69xud4vYaRrutRG-RASKbxQaGSisRm7jA@mail.gmail.com>
 <Z7-rN8iGUpPe6b-1@google.com>
 <CAP-5=fVAuCF4i8HQEGYx_ApcSuBg82pXCsgk98oU9-2Gm=NOcw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAP-5=fVAuCF4i8HQEGYx_ApcSuBg82pXCsgk98oU9-2Gm=NOcw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_232431_375021_9B7AB438 
X-CRM114-Status: GOOD (  50.58  )
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

On Wed, Feb 26, 2025 at 09:24:15PM -0800, Ian Rogers wrote:
> On Wed, Feb 26, 2025 at 4:00 PM Namhyung Kim <namhyung@kernel.org> wrote:
> >
> > On Mon, Feb 24, 2025 at 08:22:50PM -0800, Ian Rogers wrote:
> > > On Mon, Feb 24, 2025 at 7:20 PM Namhyung Kim <namhyung@kernel.org> wrote:
> > > >
> > > > On Wed, Feb 19, 2025 at 10:56:49AM -0800, Ian Rogers wrote:
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
> > > >
> > > > Hmm.. then this is limited to live mode and potentially detect wrong
> > > > machine type if it reads an old data, right?
> > > >
> > > > Also IIUC fallback to the perf binary means it cannot use cross-machine
> > > > table.  For example, it cannot process data from ARM64 on x86, no?  It
> > > > seems it should use perf_env.arch.
> > >
> > > The perf env arch is kind of horrid. On x86 it has the value x86 and
> > > then there is an extra 64bit flag, who knows how x32 should be encoded
> > > - but we barely support x32 as-is. I'd rather we added a new feature
> > > for the e_machine/e_flags of the executable and worked with those, but
> > > it is kind of weird with doing system wide mode. I didn't want to drag
> > > that into this patch series anyway as there is already enough here.
> >
> > Right, I don't know how to handle x32 properly.  Maybe we can just
> > ignore it for now.
> >
> > But anyway looking at /proc/PID for recorded data doesn't seem correct.
> > Can you please add a flag to do that only from trace__run() and just use
> > EM_HOST for trace__replay()?
> 
> So I was hoping at some later point the e_machine on the thread could
> be populated from the data file - hence the accessor being on thread
> and not part of the trace code.

Fair enough.


> We could add a global flag to thread
> to disable the reading from /proc but we do similar reading in
> machine.c for /proc/version, /proc/kallsyms, /proc/modules, etc.

You can add a flag to struct trace and only care about the perf trace
use case - whether to call thread__get_e_machine() or not.

In general, reading /proc from perf record is fine.  But doing that from
perf report or similar is not good.  You don't need to fix them, if any,
with this change.  But let's not introduce more bugs.


> I think the chance a pid is recycled and the process has a different
> e_machine are remote enough that it is similar in nature. Adding the
> flag means we need to go and fix up all uses, we only need to set the
> flag in builtin-trace.c currently, but we've been historically bad at
> setting these globals and bugs creep in. I also don't think
> record/replay is working well and I didn't want the syscalltbl cleanup
> to turn into a perf trace record/replay fixing exercise.

Yep, please see above.  Anyway I think record/replay on the same machine
is working well.

Thanks,
Namhyung

> 
> > Later, we may need to add a misc flag or so to PERF_RECORD_FORK (and
> > PERF_RECORD_COMM with MISC_COMM_EXEC) to indicate non-standard ABI for a
> > new thread.  But it's not clear how to make it arch-independent.
> >
> > >
> > > > One more concern is BPF.  The BPF should know about the ABI of the
> > > > current process so that it can augment the syscall arguments correctly.
> > > > Currently it only checks the syscall number but it can be different on
> > > > 32-bit and 64-bit.
> > >
> > > That's right. This change is trying to clean up
> > > tools/perf/util/syscalltbl.c and the perf trace usage. I didn't go as
> > > far as making BPF programs pair system call number with e_machine and
> > > e_flags, there is enough here and the behavior after these patches
> > > matches the behavior before - that is to assume the system call ABI
> > > matches that of the perf binary.
> >
> > Right, the next step would be adding a BPF kfunc to identify the current
> > ABI.
> >
> > Thanks,
> > Namhyung
> >

