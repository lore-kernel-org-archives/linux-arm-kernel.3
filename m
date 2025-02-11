Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2264BC0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 18:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iypHFQvapErVvgNM+puH+9um03GI3lSJujH4j3iqa9M=; b=ZmT7ZvO8LmsUj7M5I4QxU0Gekp
	N3LYLEA/dkoinD2nKbdVv3Wtu0ZqNmTug94oIxSGk05lqNMeUClErUMKFmuHXjTmgJE1sqeKWf0VN
	2lRyjGIjWTiNltkH6dRQZ0BSQ05vh449upHdlCJ/9T24TCWqk939f3MV4t2aeu46s+8kQrTrF3KtW
	ZcInadw8P7I46M6fvt20S3KJx5tdgeQME4qqMCaGqgR3bEmc76GvtQWmJXFgdCwrKe/2r9isGAlY8
	wJipi3tPYEzBeNK3ft7x3RZMN006+zclfIMZ0p+GkIt2Dk4i8clZOiVKL/ju/7dU1t2qujmQI4UXB
	6i6+GglQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thvTB-00000004w0x-2kO4;
	Tue, 11 Feb 2025 18:58:53 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thvGY-00000004tdc-1Mny
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 18:45:52 +0000
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-3d147331fb5so13965ab.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Feb 2025 10:45:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739299549; x=1739904349; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iypHFQvapErVvgNM+puH+9um03GI3lSJujH4j3iqa9M=;
        b=NVXQrfba1kravpKc2zjgpvdgKK9j/1HAnHzcwa09SwPI28jKOo5r95lZdgC0hKZk4C
         JHGro9X+eX0OW22IbQLYGcUOJLZxWYYLZbc6jDIKPezQ8Rdy+iLfQF3pCXpARnh5SJkt
         mY+p71SEnYx7Lkz13cacvULv5bKtva/8k+JW5vQdZ/qn0RFDnIoaBekGC5VtwL0OMn2X
         QDcKc2tnnSz6aJrJtCKD/9Wen+mMqG8WtoMzgOH3F3L7OY37I7LzavsQ1UVVR1TST5Q7
         2OrjuNtcsxSEfoCmsjjNx0BT0NF4vZz1DQt8PHlqlIVjLHPbbMNsuHa8AF7wHNWJ/F9Q
         m1jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739299549; x=1739904349;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iypHFQvapErVvgNM+puH+9um03GI3lSJujH4j3iqa9M=;
        b=BEyTRxWPBJuLVzRXhUMaEsffVIAx5B9VIBohnonXyiFA5Yeu+dtKTdgemImKiqYXwD
         7HbiZAThTiYMU1i2Ex1iA/CoPUgQX85B3NPT2n6wi/ruvykDkLeF2wcNMq/8R9ZQv+H0
         dEmOT4aC1iE42h/IP0DaGADbs/ahHPRWbhxAKKOQQWXmsF6iPCD8kiuQ2KiysjXi84Ed
         Gzsk0sE+WukxpITM5CcNDSJeuyn8uHGCqR8BnTVEz1kJF+IrP9s8vVrS2StJg+IKqLRf
         sneZAOuPU6LyY4eijYW4RBcr7+riOVy4+lrnntCRtRWG22G2Rw3yqwnmZBdnk5a2/ACv
         6BiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZwPCnbznO1nQbnFqHi26pzT0DsJPMimC/92V5efloaRU9wLjdE2ohvBiHqM0MLHc+za3wHLBf7xQCXR43wIEs@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4rBMLsLcbWOSOAhErL+ZwzVLnFEKwSrxCd1x6OkLJAXnk7vpg
	1oXxOhDm5KS0gqrd5WFZXaMSKpnyQCzyYBc+FH6+309tW0/bzkD9rVbM1mSwC2EleNomw2wuxQN
	5/sLDgdLz/DZ5cFb63JGvf3H68ztvqIeUYbc/
X-Gm-Gg: ASbGnctrqL0h1ZSiDk5pyerAad7lwf9Y1QL4DoxEeeoEFJ3e9CjOpfMkzh0x4ex+qFs
	vJGiTrDlzlseeifbUe6GqKh2iHbJrm9NKZMUxv+kPNS1x0ls43fBgPdM5jghL46ea6eWUm7Tply
	2Fqc/cMOAdJBd56FxalSdZIMs3
X-Google-Smtp-Source: AGHT+IHqX3vr00VskyAmXO8pPWLaM+ymT5Q0Notk3eM864X6DrnAlyqB2GWGar0qHREmdunm54q6ghSQTM4GDELbVQ4=
X-Received: by 2002:a05:6e02:17cb:b0:3a7:e3b3:2e3 with SMTP id
 e9e14a558f8ab-3d171e154dcmr3944225ab.17.1739299548993; Tue, 11 Feb 2025
 10:45:48 -0800 (PST)
MIME-Version: 1.0
References: <20250210165108.95894-1-irogers@google.com> <20250210165108.95894-6-irogers@google.com>
 <d47c35dd-9c52-48e7-a00d-135572f11fbb@app.fastmail.com> <CAP-5=fUi4RYebxCGYZVHVEt0BpWVmUA6+-vDQfbai25_KJRs7A@mail.gmail.com>
 <0195f9a0-5198-4ee0-b4ff-ea7126dc8299@app.fastmail.com>
In-Reply-To: <0195f9a0-5198-4ee0-b4ff-ea7126dc8299@app.fastmail.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 11 Feb 2025 10:45:37 -0800
X-Gm-Features: AWEUYZmLh2xLEkqSk7Km_nwXZM8Hrzxp2BxzKEHyN48kgEtbMNsw6rc4K0YX_9w
Message-ID: <CAP-5=fULk0L4H23E_j2qktmLRJD8_iuLf=_UWK+pghSO+_eMGg@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] perf trace beauty: Add syscalltbl.sh generating
 all system call tables
To: Arnd Bergmann <arnd@arndb.de>, linux-mips@vger.kernel.org
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Howard Chu <howardchu95@gmail.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
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
X-CRM114-CacheID: sfid-20250211_104550_371485_A9B5060B 
X-CRM114-Status: GOOD (  62.27  )
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

On Tue, Feb 11, 2025 at 9:53=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wrote=
:
>
> On Tue, Feb 11, 2025, at 18:24, Ian Rogers wrote:
> > On Tue, Feb 11, 2025 at 12:09=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> =
wrote:
> >> On Mon, Feb 10, 2025, at 17:51, Ian Rogers wrote:
> >> > "$tools_dir/perf/arch/arm64/entry/syscalls/syscall_64.tbl" "$outfile=
"
> >> > common,64,renameat,rlimit,memfd_secret EM_AARCH64
> >> > +cat >> "$outfile" <<EOF
> >> > +#endif // defined(ALL_SYSCALLTBL) || defined(__arm__) ||
> >> > defined(__aarch64__)
> >>
> >> Hardcoding the set of ABIs in the middle of the script seems
> >> too fragile to me, I'm worried that these get out of sync quickly.
> >
> > I agree, again this is carrying forward a behavior and at least after
> > these changes the location is just one place. Do you have any
> > suggestions on how to do better?
>
> Not sure, but I have some patches that I was planning to send
> that puts these into arch/*/kernel/Makefile.syscalls for all
> architectures in a consistent way. Ideally we'd use the same
> Makefile contents for tools/perf in order to trivially sync
> them, but I'm also happy to hear other suggestions.
>
> Your patches are currently ahead of mine, so I don't want to
> hold you up.
>
> > Fwiw, I wonder a related problem/question that has come up primarily
> > with Arnaldo and Howard is in having a way to determine system call
> > argument types so that perf trace can pretty print them. For example,
> > if via BTF it is found an argument is a "const char*" then it is
> > assumed to be a string, but a "char *" is not as it may just be an out
> > argument. There's a source for more information in the syzkaller
> > project:
> > https://github.com/google/syzkaller/blob/master/sys/linux/sys.txt
> > Perhaps there's a way to generate this information from the Linux
> > build and feed it into perf's build. It is out-of-scope for what I'm
> > trying to do here, but I thought it worth a mention given my general
> > ignorance on wider things.
>
> Yes, this is also something I've been trying to work on. In particular
> the calling conventions for 64-bit register arguments on 32-bit
> targets need some help. My plan for this is to have a consistent
> mapping of internal (sys_foo()) function names to argument lists,
> instead of having some calls that are slightly different depending
> on the architecture or ABI.
>
> This should be in a machine-readable format so it can be parsed
> not only by perf but also any other project that needs a list
> (libc, gdb, qemu, strace, rust, ...)

Awesome, thanks for working on this!

> >> > +#if defined(ALL_SYSCALLTBL) || defined(__mips__)
> >> > +EOF
> >> > +build_tables
> >> > "$tools_dir/perf/arch/mips/entry/syscalls/syscall_n64.tbl" "$outfile=
"
> >> > common,64,n64 EM_MIPS
> >> > +cat >> "$outfile" <<EOF
> >> > +#endif // defined(ALL_SYSCALLTBL) || defined(__mips__)
> >>
> >> What about n32/o32? The syscall tables are completely different here.
> >
> > So perf hasn't historically supported them and no one is asking for
> > support. Generating more tables isn't the problem, but we need to have
> > some way of determining which table to use for n32/o32. I see
> > EF_MIPS_ABI_O32 and EF_MIPS_ABI_O64, so we could add support by
> > extending the lookup of the table to be both of e_machine and e_flags.
> > I'm less clear on choosing n32. That said, back in the 90s I was
> > working to port MIPS code to Itanium via binary translation. Given now
> > Itanium is obsolete, I'm not sure it is worth adding complexity for
> > the sake of MIPS. I'm happy to do what others feel is best here, but
> > my default position is just to carry what the existing behavior is
> > forward.
>
> I think the way it actually works on mips is that all syscalls are
> allowed in any task and the actual number identifies both the
> ABI and the syscall. In some variant, the same is true on arm
> (oabi/eabi) and x86-64 (64/x32), but oabi and x32 are both too
> obsolete to put much work into them.
>
> There is still some interest in mips, maybe you can poke the
> maintainers and see if someone is willing to help out since you
> have done the bulk of the work already.

Thanks, adding linux-mips@vger.kernel.org. Here is the original
feedback for them for context:
https://lore.kernel.org/lkml/07c5c3ad-5a6d-4eda-95f2-ed16e7504d4c@app.fastm=
ail.com/

> >> > +EOF
> >> > +build_tables "$tools_dir/perf/arch/s390/entry/syscalls/syscall.tbl"
> >> > "$outfile" common,64,renameat,rlimit,memfd_secret EM_S390
> >> > +cat >> "$outfile" <<EOF
> >> > +#endif // defined(ALL_SYSCALLTBL) || defined(__s390x__)
> >>
> >> This skips the 32-bit table, though I think that one is already
> >> planned to be discontinued in the future.
> >
> > Thankfully we have awesome s390 devs on the mailing list, hopefully
> > they'll shout out if I'm doing things wrong.
>
> I also remembered that I had a patch to bring the s390 syscall.tbl
> into the same format as the others, since the behavior is currently
> a bit different for compat calls. I think there is also a chance
> that they want to discontinue 32-bit mode entirely, given that
> the last 32-bit machine was discontinued over 20 years ago, and
> support for native 32-bit kernels got removed 10 years ago
> after Debian 8 moved to 64 bit.
>
> If they are confident that there are no more remaining users that
> rely on 32-bit binaries, we could both save some work.
>
> >> > +#if defined(ALL_SYSCALLTBL) || defined(__i386__) || defined(__x86_6=
4__)
> >> > +EOF
> >> > +build_tables "$tools_dir/perf/arch/x86/entry/syscalls/syscall_32.tb=
l"
> >> > "$outfile" common,32,i386 EM_386
> >> > +build_tables "$tools_dir/perf/arch/x86/entry/syscalls/syscall_64.tb=
l"
> >> > "$outfile" common,64 EM_X86_64
> >> > +cat >> "$outfile" <<EOF
> >> > +#endif // defined(ALL_SYSCALLTBL) || defined(__i386__) ||
> >> > defined(__x86_64__)
> >>
> >> This misses the x32 table.
> >
> > Again I'm carrying forward a behavior. Would it be worth adding x32?
>
> I would probably document it in the file as an intentional
> omission, same as for arm oabi

Ack.

> > That said there is likely other context
> > that I'm unaware of as I'm surprised x32 still exists.
>
> There are a handful of people still testing it, and some still
> using it, but I agree it completely failed to get enough
> traction to be worth maintaining.
>
> I view x32 (and the corresponding arm64 ilp32 mode that never
> made it in) mostly as an exercise in benchmark(et)ing, since
> it showed noticeably higher results in some versions of specint
> and some compiler workloads, compared to both normal 32-bit and
> 64-bit modes. The time that we already wasted on maintaining
> it must have long surpassed any such benefits though, so I
> certainly don't want to waste more time on it.

:-) I ate part of a cake intended as a goodwill gesture toward getting
x32 into Android.

Thanks,
Ian

