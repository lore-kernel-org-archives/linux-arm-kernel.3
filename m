Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9BFBC021BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 05:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bnEz81f237FPFDdRQFlVRCVwc99gvba5x2QOCkc+RR0=; b=4+nLJo44XPPsiMfhTVB4wLE9fd
	NUFnsg6D7Hy9Xm6gqGED6/AcLfdOuQM5A5S+hW5eda1xZlwu3cCrXrwoG9AV+Ahc6a7cSg+yekyfY
	FkJZsa05pVV88TFuAxe5bKGmTFN6a22ZamFlLCmVZSi8+nfbH7/Iqmu9/Nyn0lKt7iIGZFORnyP8A
	4YfrnSDJ9E5ZsKMJSL5g8XGFHc5eqS6mgggWokky5nH5rL/cPWfipE2swAEjG66DQrr3cFV3nUUaU
	+LsgT1Ao6xFGotyBmASh2kCP3llpwjmQfEtg122jiEvElbGQ6x/oUyMXmx8MqS5pkrCJsSLSkIx5o
	h6dOR+mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnWPM-00000006N0G-2mz5;
	Thu, 27 Feb 2025 05:26:04 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnWNn-00000006MlS-2FGo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 05:24:30 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-221ac1f849fso67535ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 21:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740633866; x=1741238666; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bnEz81f237FPFDdRQFlVRCVwc99gvba5x2QOCkc+RR0=;
        b=CG1lVElkPuPxfvyQQpGleIUPo8+jh+QCBR7AgjzHGwrdC2PsaSB7+/foMa5LJY3us+
         EXx0wdC2LUpuXn313EUT66n9Ns4XU5oHWaL9TMpZq6/GCy2m16aaVz/EVPhwn8uth4bc
         OanX5CxDx1nX3bD45Ckua4cXCThiJBDxm6iC/qOWriKPAoN59FKrHsDK01be0Qjpngq3
         e5FuTqEW5GhnxQ9Q0wFM9o6eiuDzuluEesCAUwJsolk5mJgnDwPYWzqs803Z18D1f7OW
         cKDFtKEAh/D45l58yrvD92w4UTSNI+xZvayIgSvuiVGCVlYb4illNce+cu4Hm0Vd4NSu
         0dQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740633866; x=1741238666;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bnEz81f237FPFDdRQFlVRCVwc99gvba5x2QOCkc+RR0=;
        b=jFfKKi334kcikOCpukBWqeVl3P0zZDKVyYsLQoWs+eClhRqUcZXyQZgHwqCYlBKJua
         qlee3sBgP42Di3fuiHLpMlEgZ4YvZjZzOi9ST0GyMQ9/SXSq84JzZZd6O0h23lprQMKy
         PPUd+pKaQTxz6oW7TA+TcIKtyk7UmOpSu3S2s1Ei3o2qoNyVvQVtD3MbO2g9JBEbDLU7
         658J2wy/BxUyp+8AwJ5B66kppMOp52D4htHmVXTdAffDz5XcN8p99zETKOq0SOdQfznf
         TM/UkWqwbSsZSJ0FqjujFWo4Y2CIrO0sf3zSqCY8OqLP6eOXNyr3CxzC+tMCsH2b/VUI
         CdSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBu8JZsucscOinc2rZZRQslSzpKl4OUWycAoKP3lQWX2FH2fNADsomuMULrw1FPVb+pMKsME2Hof0pcKorQshP@lists.infradead.org
X-Gm-Message-State: AOJu0YzjzP+8p7t5KG2qMiMgzRBqbs5yClUzybXQfThL3R3MAjH5UIYK
	iZlp/MhWYp9niS+VcIpseUfFYnSOVmxKhFBBQuly3rG2ri+eJT8T4KqA+Qw2jPHn9LwmIlGpkXb
	2qZ/w4p0Qqvli8scUKmx+ZF1PbXCZrhPc6VgS
X-Gm-Gg: ASbGncsdWsWr5JliIgYNHGl9dEh0WATNpKftAIYeS0Rx7x5a4X6OlHy3Ok9A+CZ7ac3
	lAC1P12VofMhK4Rs0XCFIc9ZAJN0PcOnBHASP1Bx6c+/hwHaohiq+FPNdJnJ/rQoyvQzhFruIT4
	jtOH0o/3iz
X-Google-Smtp-Source: AGHT+IESGHDEUIPVrjNTh39ynN60aQSgX7N+PvnUqhcTHIKp7IZB5bqsgXo3vv32FxrjQl6qmhQtj7bSXHofxTNEMow=
X-Received: by 2002:a17:902:f7cc:b0:200:97b5:dc2b with SMTP id
 d9443c01a7336-223517240a4mr1111615ad.15.1740633866391; Wed, 26 Feb 2025
 21:24:26 -0800 (PST)
MIME-Version: 1.0
References: <20250219185657.280286-1-irogers@google.com> <Z702_CQ7nMx9fZQn@google.com>
 <CAP-5=fWYiQP84BMjm69xud4vYaRrutRG-RASKbxQaGSisRm7jA@mail.gmail.com> <Z7-rN8iGUpPe6b-1@google.com>
In-Reply-To: <Z7-rN8iGUpPe6b-1@google.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 26 Feb 2025 21:24:15 -0800
X-Gm-Features: AQ5f1JpYoEre35TWzYAHXMZBSPsriPeINrD-jPxutBzlTEFdOvLRV6EZPh8_ULw
Message-ID: <CAP-5=fVAuCF4i8HQEGYx_ApcSuBg82pXCsgk98oU9-2Gm=NOcw@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] perf: Support multiple system call tables in the build
To: Namhyung Kim <namhyung@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
	James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>, 
	Leo Yan <leo.yan@linux.dev>, guoren <guoren@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Charlie Jenkins <charlie@rivosinc.com>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Jiri Slaby <jirislaby@kernel.org>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Howard Chu <howardchu95@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, linux-riscv@lists.infradead.org, 
	linux-mips@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_212427_616714_C85CDC77 
X-CRM114-Status: GOOD (  46.54  )
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

On Wed, Feb 26, 2025 at 4:00=E2=80=AFPM Namhyung Kim <namhyung@kernel.org> =
wrote:
>
> On Mon, Feb 24, 2025 at 08:22:50PM -0800, Ian Rogers wrote:
> > On Mon, Feb 24, 2025 at 7:20=E2=80=AFPM Namhyung Kim <namhyung@kernel.o=
rg> wrote:
> > >
> > > On Wed, Feb 19, 2025 at 10:56:49AM -0800, Ian Rogers wrote:
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
> > >
> > > Hmm.. then this is limited to live mode and potentially detect wrong
> > > machine type if it reads an old data, right?
> > >
> > > Also IIUC fallback to the perf binary means it cannot use cross-machi=
ne
> > > table.  For example, it cannot process data from ARM64 on x86, no?  I=
t
> > > seems it should use perf_env.arch.
> >
> > The perf env arch is kind of horrid. On x86 it has the value x86 and
> > then there is an extra 64bit flag, who knows how x32 should be encoded
> > - but we barely support x32 as-is. I'd rather we added a new feature
> > for the e_machine/e_flags of the executable and worked with those, but
> > it is kind of weird with doing system wide mode. I didn't want to drag
> > that into this patch series anyway as there is already enough here.
>
> Right, I don't know how to handle x32 properly.  Maybe we can just
> ignore it for now.
>
> But anyway looking at /proc/PID for recorded data doesn't seem correct.
> Can you please add a flag to do that only from trace__run() and just use
> EM_HOST for trace__replay()?

So I was hoping at some later point the e_machine on the thread could
be populated from the data file - hence the accessor being on thread
and not part of the trace code. We could add a global flag to thread
to disable the reading from /proc but we do similar reading in
machine.c for /proc/version, /proc/kallsyms, /proc/modules, etc. I
think the chance a pid is recycled and the process has a different
e_machine are remote enough that it is similar in nature. Adding the
flag means we need to go and fix up all uses, we only need to set the
flag in builtin-trace.c currently, but we've been historically bad at
setting these globals and bugs creep in. I also don't think
record/replay is working well and I didn't want the syscalltbl cleanup
to turn into a perf trace record/replay fixing exercise.

Thanks,
Ian

> Later, we may need to add a misc flag or so to PERF_RECORD_FORK (and
> PERF_RECORD_COMM with MISC_COMM_EXEC) to indicate non-standard ABI for a
> new thread.  But it's not clear how to make it arch-independent.
>
> >
> > > One more concern is BPF.  The BPF should know about the ABI of the
> > > current process so that it can augment the syscall arguments correctl=
y.
> > > Currently it only checks the syscall number but it can be different o=
n
> > > 32-bit and 64-bit.
> >
> > That's right. This change is trying to clean up
> > tools/perf/util/syscalltbl.c and the perf trace usage. I didn't go as
> > far as making BPF programs pair system call number with e_machine and
> > e_flags, there is enough here and the behavior after these patches
> > matches the behavior before - that is to assume the system call ABI
> > matches that of the perf binary.
>
> Right, the next step would be adding a BPF kfunc to identify the current
> ABI.
>
> Thanks,
> Namhyung
>

