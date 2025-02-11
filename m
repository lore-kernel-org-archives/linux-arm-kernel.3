Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C559C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 17:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5eUqaFoF/nA3myl/xKceml4ULdmxAvSOjNMKL2mIwQg=; b=gev0wV282qSb5EU8R+hROY3yIT
	J0Dag+0g6/ZgMKFqa+MVEUOvtVvYC98jv7/N+cNkp05BUElSiOrMaLgfoQVRUNLzsq/YnB8oGVS3A
	MFK/CkD3KIsm6P32uUvJheqW7KZmKIiOp3UCvB1BaAiierG+qftLx4biuLHtNyiHrsZajJFm30O5K
	bq7fPEKcQeuu66+JZCjBQLTCEDKjsWC0eYjlkSefFyTdrZT3kPNqjrHgFHJOl2d2qjH5TJCU8vstV
	Re/zRH5D8x4PE9GkOmmELtJvo8NccRBCpSEc8aDi8cZhZvcs2IhhVLoFaZIwJoZV3EnOR/1/9eD5q
	xEr2H1uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thu2n-00000004feF-2jLR;
	Tue, 11 Feb 2025 17:27:33 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thu0O-00000004fDA-2R2j
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 17:25:05 +0000
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-3d147331fb5so214275ab.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Feb 2025 09:25:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739294704; x=1739899504; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5eUqaFoF/nA3myl/xKceml4ULdmxAvSOjNMKL2mIwQg=;
        b=Qtf++Q+ICRiR3a6do9PV6E+/9rx/LDCZkp8AWkWB5plIhjKfxuncaw0PHJMH5h8w/9
         txqufk+XkimTaAOxYufXypQmb2AJQjjTEZFmrC0dAqwR6sB5bKVkjfZUhJ1c/Z3T09Jv
         XOfta4h9bFDwZJrmTeOT2ww7I4uMDpo9L1BFRj0U8opOtg4z4jtm9LQECf64BTTr/k6B
         1bU7gyxnY6NQ6XibB2MwnyrjcyQDsL0GfljuhblmeELmtRKrMH462TetEZJz3SnKTpAI
         7EQdOZVNdf2v4VtssOBTteJ8c2ir7g/Xn02T1PQE4/CBXRFzaMOyU0JMlnTR5mD4YbGB
         q/dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739294704; x=1739899504;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5eUqaFoF/nA3myl/xKceml4ULdmxAvSOjNMKL2mIwQg=;
        b=Vll+Bvg1hK+xCaotIClXejSPIttrMQLwj2EulSaeNBWd3hQ/Ct9hhfU42cJZivwPm6
         nVvtevGEOxdpSWz4lEN1VtgkhCpqWlMxaEBhJ/3mZ40TwsFGan9zIGI2lZxvNwHNfLu9
         G4jH6/C+dPaYr3nOxW9eeWBD+GdRjjdiVWIqnl+giWW7SC3gzpmCJRpRKNTlvPcONzBl
         klTo/ioZf5gZyijiXDucfbknEH1v7JxwoahFLpDPN4UJYkJGalccvJvNbIyGtFaOdlLf
         EQb+v1CjW4wWqF+z3Q/EqLo5wRCCC95d1EKUQPJi/S7FXYwVuFPZzFp9q9tFLtIs4qZs
         F2xw==
X-Forwarded-Encrypted: i=1; AJvYcCWPfQ54/djsy3Emxob7QIFRqnISyZU6zGsyZmmOZ/aSlyFjlL7A2Ouzi14aTz3ZYwg4wsQwCX4QG0FY1MfSBmDT@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9BWYc8DYsQ7p3kdq/cEvUA1BZmmqXFqV5OF7bC18KOrr4x14I
	M3l4tJOm4YmCHltQwyxXWqAAn86M1wsIAYxu/hSBKfzuI9yV4RCLlvioQJFRi1hjaFVeD+4kkGQ
	YzNPKPwgMzBC1qPb6T950ZK/ZYs0+o54sDwzV
X-Gm-Gg: ASbGncsVzwxDKw+t6Ix+zRzTaBgLcXq4wmaYfDqM3dAyC59k9iOCYYs1/5ryU+z2tFY
	PsYQ04cgu5mLlzbnRG7ZANLNnECRFLUs/NkqeXoSGs/6q4aoYlm3cCkaKdaUq+0ercUOB63359f
	rylal9p/rIWMnlpZ3JcaKDJvSv
X-Google-Smtp-Source: AGHT+IHulOePOuHEHSpuFuNYO6P65ObrRZws2+5sl7jc3tR3t7l3NjrSWpuzOe7Ugxsa9ph5ihwoodwYrD5QTsiZGu4=
X-Received: by 2002:a92:c54b:0:b0:3cf:c075:da88 with SMTP id
 e9e14a558f8ab-3d171e3baa4mr3301595ab.23.1739294703579; Tue, 11 Feb 2025
 09:25:03 -0800 (PST)
MIME-Version: 1.0
References: <20250210165108.95894-1-irogers@google.com> <20250210165108.95894-6-irogers@google.com>
 <d47c35dd-9c52-48e7-a00d-135572f11fbb@app.fastmail.com>
In-Reply-To: <d47c35dd-9c52-48e7-a00d-135572f11fbb@app.fastmail.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 11 Feb 2025 09:24:51 -0800
X-Gm-Features: AWEUYZklUe5R5QefRSuHohckz8hNxM22lvM3Gxp2M1QMZ2_uE8brpR7qpIuJFYo
Message-ID: <CAP-5=fUi4RYebxCGYZVHVEt0BpWVmUA6+-vDQfbai25_KJRs7A@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] perf trace beauty: Add syscalltbl.sh generating
 all system call tables
To: Arnd Bergmann <arnd@arndb.de>, Arnaldo Carvalho de Melo <acme@kernel.org>, Howard Chu <howardchu95@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
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
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_092504_626063_8319EB1F 
X-CRM114-Status: GOOD (  39.66  )
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

On Tue, Feb 11, 2025 at 12:09=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wrot=
e:
>
> On Mon, Feb 10, 2025, at 17:51, Ian Rogers wrote:
>
> > +# Each line of the syscall table should have the following format:
> > +#
> > +# NR ABI NAME [NATIVE] [COMPAT]
> > +#
> > +# NR       syscall number
> > +# ABI      ABI name
> > +# NAME     syscall name
> > +# NATIVE   native entry point (optional)
> > +# COMPAT   compat entry point (optional)
>
> On x86, there is now a sixth optional field.

Thanks, I'll add and repost a v3. I had some other questions below so
I'll try to do everything together to avoid noise.

> > +#if defined(ALL_SYSCALLTBL) || defined(__arm__) || defined(__aarch64__=
)
> > +EOF
> > +build_tables "$tools_dir/perf/arch/arm/entry/syscalls/syscall.tbl"
> > "$outfile" common,32,oabi EM_ARM
> > +build_tables
>
> The oabi syscalls probably shouldn't be part of the default set here.
> Technically these are two separate ABIs, though EABI is a subset of
> OABI for the most most part. Some of the calling conventions are
> also different.

Ack. I was carrying forward:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/too=
ls/perf/arch/arm/entry/syscalls/Kbuild#n3
but noticed that we weren't adding this for arm64:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/too=
ls/perf/arch/arm64/entry/syscalls/Kbuild
I'm happy to drop and have the ARM64 behavior. I'll make it a separate
patch in case there is a desire from someone to revert.

> > "$tools_dir/perf/arch/arm64/entry/syscalls/syscall_64.tbl" "$outfile"
> > common,64,renameat,rlimit,memfd_secret EM_AARCH64
> > +cat >> "$outfile" <<EOF
> > +#endif // defined(ALL_SYSCALLTBL) || defined(__arm__) ||
> > defined(__aarch64__)
>
> Hardcoding the set of ABIs in the middle of the script seems
> too fragile to me, I'm worried that these get out of sync quickly.

I agree, again this is carrying forward a behavior and at least after
these changes the location is just one place. Do you have any
suggestions on how to do better?

Fwiw, I wonder a related problem/question that has come up primarily
with Arnaldo and Howard is in having a way to determine system call
argument types so that perf trace can pretty print them. For example,
if via BTF it is found an argument is a "const char*" then it is
assumed to be a string, but a "char *" is not as it may just be an out
argument. There's a source for more information in the syzkaller
project:
https://github.com/google/syzkaller/blob/master/sys/linux/sys.txt
Perhaps there's a way to generate this information from the Linux
build and feed it into perf's build. It is out-of-scope for what I'm
trying to do here, but I thought it worth a mention given my general
ignorance on wider things.

> > +#if defined(ALL_SYSCALLTBL) || defined(__mips__)
> > +EOF
> > +build_tables
> > "$tools_dir/perf/arch/mips/entry/syscalls/syscall_n64.tbl" "$outfile"
> > common,64,n64 EM_MIPS
> > +cat >> "$outfile" <<EOF
> > +#endif // defined(ALL_SYSCALLTBL) || defined(__mips__)
>
> What about n32/o32? The syscall tables are completely different here.

So perf hasn't historically supported them and no one is asking for
support. Generating more tables isn't the problem, but we need to have
some way of determining which table to use for n32/o32. I see
EF_MIPS_ABI_O32 and EF_MIPS_ABI_O64, so we could add support by
extending the lookup of the table to be both of e_machine and e_flags.
I'm less clear on choosing n32. That said, back in the 90s I was
working to port MIPS code to Itanium via binary translation. Given now
Itanium is obsolete, I'm not sure it is worth adding complexity for
the sake of MIPS. I'm happy to do what others feel is best here, but
my default position is just to carry what the existing behavior is
forward.

> > +#if defined(ALL_SYSCALLTBL) || defined(__powerpc__) ||
> > defined(__powerpc64__)
> > +EOF
> > +build_tables "$tools_dir/perf/arch/powerpc/entry/syscalls/syscall.tbl"
> > "$outfile" common,32,nospu EM_PPC
> > +build_tables "$tools_dir/perf/arch/powerpc/entry/syscalls/syscall.tbl"
> > "$outfile" common,64,nospu EM_PPC64
> > +cat >> "$outfile" <<EOF
> > +#endif // defined(ALL_SYSCALLTBL) || defined(__powerpc__) ||
> > defined(__powerpc64__)
>
> This skips the SPU table, but I think that's fine.
>
> > +EOF
> > +build_tables "$tools_dir/perf/arch/s390/entry/syscalls/syscall.tbl"
> > "$outfile" common,64,renameat,rlimit,memfd_secret EM_S390
> > +cat >> "$outfile" <<EOF
> > +#endif // defined(ALL_SYSCALLTBL) || defined(__s390x__)
>
> This skips the 32-bit table, though I think that one is already
> planned to be discontinued in the future.

Thankfully we have awesome s390 devs on the mailing list, hopefully
they'll shout out if I'm doing things wrong.

> > +#if defined(ALL_SYSCALLTBL) || defined(__i386__) || defined(__x86_64__=
)
> > +EOF
> > +build_tables "$tools_dir/perf/arch/x86/entry/syscalls/syscall_32.tbl"
> > "$outfile" common,32,i386 EM_386
> > +build_tables "$tools_dir/perf/arch/x86/entry/syscalls/syscall_64.tbl"
> > "$outfile" common,64 EM_X86_64
> > +cat >> "$outfile" <<EOF
> > +#endif // defined(ALL_SYSCALLTBL) || defined(__i386__) ||
> > defined(__x86_64__)
>
> This misses the x32 table.

Again I'm carrying forward a behavior. Would it be worth adding x32?

Context: I handled x86 on Android over 10 years ago. x86 phones were
64-bit long before ARM or Apple phones, the kernel was 64-bit but the
userland was forced to be 32-bit. ARM32 has R15 be the program
counter, Sophie Wilson's idea, and when Android's security folks
experimented with ASLR they found it to be free as a consequence of
ARM32. On x86 not x32 then you're in the land of thunk bx, losing a
register and extra instructions. We never did x32 on Android as it
became irrelevant when I brought up x86-64 on Android. The desire for
x32 was for RIP encoding to fix the ASLR issue, not so much the extra
registers, and because Android used to mandate a 32-bit user land
(this was so extreme that even the developer's C to generally ARM
cross-compilers were built as 32-bit binaries). Given x32 was done for
Android, Android never used it, I have a hard time thinking we should
be adding support to perf. That said there is likely other context
that I'm unaware of as I'm surprised x32 still exists. Fwiw, it
saddens me that the x32 experience means that for APX we're still
getting the x86-64 ABI moved forward and silly things like the var
args convention on %al (there for C80 compatibility I once believed -
not really an issue today). On ARM64 registers there are at least 8
callee-save general purpose and floating point registers, so the x86
model of pretty much everything is caller-save means function calls
are expensive and you may need aggressive inlining. Anyway, sorry for
going on so much.

Thanks,
Ian

