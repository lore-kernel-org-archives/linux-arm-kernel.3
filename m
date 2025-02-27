Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 737A1C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 00:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rCKtPSqaLbMiAwTZR5MaQSFBSBzSDQKA0HKE8xQS4c8=; b=XDKiMmZiwZCQ1rMc08kUygGxVB
	ApgFjgImOU1dmVT0jzE9DJn6viKq7pskfMQ/JWntJXfgxDuBzTdIu0NYAFkDUjItDNBu3UmlzNjIp
	2lms8IjvPQnehBy93Tj0eBtb75j/D2ekRHHQo2QckI5Ao+5BxKtLEbXkLYK+lxwfYcu9BefV3Qfxc
	IkNw5ond2hvIHT2BtUkGr8QRjLdgd3VEIH+aeA5bzj+4JIAadsnYCw09gb2toTHM6eEQx1iEiuzsA
	udt13VnQ4hkn5vH9JtceyaKkNkWy4FWE1sHTEIiVyEjGVepgrpry2MtENuO8xKwgzvrzXA6WSJKAw
	SA7kG5wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnRMH-00000005l93-3Pzr;
	Thu, 27 Feb 2025 00:02:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnRKl-00000005l1e-1VaQ;
	Thu, 27 Feb 2025 00:00:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 743DB612B0;
	Thu, 27 Feb 2025 00:00:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F154EC4CED6;
	Thu, 27 Feb 2025 00:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740614458;
	bh=qd5L09r8BbWtp3sAdRkvQxm/boMlegFYOUTq9AxcaRA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JJiViAXPMxyzFzf9Hv16zUQzj8/qcVzYFJj7H31yYwopnzVcgJ3IWMgfHJ+14Oawi
	 FH/2zQ38hXIe2aBZp+k+W5gHvA14Ols6fXDb2nobInHVV9tZuM6fyRIVKnpX3rbSE/
	 S19H8+xhIluAVHCe3LrlHXrLWswcBkjjlrOH/VfX/SdIq/8LgFQBU7vIeh06BAMDzV
	 /XKxRxaQP2UfjOsbZKRHTRhCx0Ozbdy0Apq0EMTCr2HEQfQpk1RSjZunhinNdVW28S
	 /sguI1ft/UZy/3f5o7gSzvdrZJWwnBHVbnYDea42DQwCuDW4sMzAxs15CFkGwqajov
	 yLqLq3Dn7PJJQ==
Date: Wed, 26 Feb 2025 16:00:55 -0800
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
Message-ID: <Z7-rN8iGUpPe6b-1@google.com>
References: <20250219185657.280286-1-irogers@google.com>
 <Z702_CQ7nMx9fZQn@google.com>
 <CAP-5=fWYiQP84BMjm69xud4vYaRrutRG-RASKbxQaGSisRm7jA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAP-5=fWYiQP84BMjm69xud4vYaRrutRG-RASKbxQaGSisRm7jA@mail.gmail.com>
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

On Mon, Feb 24, 2025 at 08:22:50PM -0800, Ian Rogers wrote:
> On Mon, Feb 24, 2025 at 7:20 PM Namhyung Kim <namhyung@kernel.org> wrote:
> >
> > On Wed, Feb 19, 2025 at 10:56:49AM -0800, Ian Rogers wrote:
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
> >
> > Hmm.. then this is limited to live mode and potentially detect wrong
> > machine type if it reads an old data, right?
> >
> > Also IIUC fallback to the perf binary means it cannot use cross-machine
> > table.  For example, it cannot process data from ARM64 on x86, no?  It
> > seems it should use perf_env.arch.
> 
> The perf env arch is kind of horrid. On x86 it has the value x86 and
> then there is an extra 64bit flag, who knows how x32 should be encoded
> - but we barely support x32 as-is. I'd rather we added a new feature
> for the e_machine/e_flags of the executable and worked with those, but
> it is kind of weird with doing system wide mode. I didn't want to drag
> that into this patch series anyway as there is already enough here.

Right, I don't know how to handle x32 properly.  Maybe we can just
ignore it for now.

But anyway looking at /proc/PID for recorded data doesn't seem correct.
Can you please add a flag to do that only from trace__run() and just use
EM_HOST for trace__replay()?

Later, we may need to add a misc flag or so to PERF_RECORD_FORK (and
PERF_RECORD_COMM with MISC_COMM_EXEC) to indicate non-standard ABI for a
new thread.  But it's not clear how to make it arch-independent.

> 
> > One more concern is BPF.  The BPF should know about the ABI of the
> > current process so that it can augment the syscall arguments correctly.
> > Currently it only checks the syscall number but it can be different on
> > 32-bit and 64-bit.
> 
> That's right. This change is trying to clean up
> tools/perf/util/syscalltbl.c and the perf trace usage. I didn't go as
> far as making BPF programs pair system call number with e_machine and
> e_flags, there is enough here and the behavior after these patches
> matches the behavior before - that is to assume the system call ABI
> matches that of the perf binary.

Right, the next step would be adding a BPF kfunc to identify the current
ABI.

Thanks,
Namhyung


