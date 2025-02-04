Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81DA3C02192
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 02:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=av7mIowXw/9z91sfKm94CO7sTInESQe4v382zCXM7Ts=; b=cBfZGszFn457Ch7r2Q5oXvLaH5
	U8MIpcfJGhoVR1BqS5SsAF9mXflTLbZ31hoT6hzXYWVQH1/Z+bUxy2nfRyR1WATw2Fr3FWwKTWjQP
	DmgHus67gIIC0dPSZwsm5iN0TQZ6leyllqLRgK8w+mQnQpyFKjB0wvNSM59R4L7nOVS0SbzMwtuml
	lNy+bue3SdAGSbzElw/GAhoPxwyvEnE8gzvjwgiMGlsLVv1iXrNIuBqzPBjnypy0IlkJDMk9ZmcCA
	FLRkxCoZVWnLvynKM24H+I1YQNXI3lM3OEudLdkws6tUx1LOM4xb/Qf4PZosVsr+uKDLB5NNZaNCx
	KpTErxtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf8EP-0000000H5lI-25XV;
	Tue, 04 Feb 2025 02:00:05 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf8D3-0000000H5bf-49dC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 01:58:43 +0000
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-3a7dfcd40fcso25155ab.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Feb 2025 17:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738634321; x=1739239121; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=av7mIowXw/9z91sfKm94CO7sTInESQe4v382zCXM7Ts=;
        b=SUcGR3mLxdRA6yrKWi77q3ZfBr7fW8ObxRSglF5RCLNnU5pPHF5JOWtP1aNNqFMxB/
         0VPSus2mMfkzSXcuflkv5OhbzK06bvNeowwiVOJXa0jrcy7B7L1z7XEYmXUo1UKt0Sz9
         eMza/vP8+9lfOl/3W7ofYKVL0AGVPSMFV6M8dqfn9l4AzubqDoTqOQf+T/bCHA518qDY
         FcO8nJSVPXxEwpOQ7aJBN0PQYU49gQ0KbLwvfvB25UTOPTqyi/glDhuLyUD31OsycX9p
         8oqb0MJoZFjLaPs8N/7em/V2xWapj1CEnQnHvfghVwjgJtoWjbzizd5e0i7fQ+JL5luc
         59PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738634321; x=1739239121;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=av7mIowXw/9z91sfKm94CO7sTInESQe4v382zCXM7Ts=;
        b=t0byUmaE3EjmDo0W1S5Kto6TxwRIM5q9G4JFVkUctKbokDdrC6ggHYWaMpl3tVD/Sn
         fuMwavfcHDwgXBa1bs+IyAo8JKIYP725/Uni3PLHSYedRoGL1mDUDZ+YPuTIbGeVW7FH
         11Vd+I4UHPQYB9N9Ogw0sAK3CWVBSLSFC6sbJnWyPpbToj0cztAsuVbuT2WQPfoRoePd
         rtbM9DeHiNjfVQqyjhW3oQYIS8SufZDQHRlnfWJ/cGC/vBkZrvJhBJiLVSJ82waPupvB
         jE6ad6r51y/DrfCFW+baEry/6N2OUArTjO2GQ1rwxs2lSa0LTkxSrxvs/cxjkm0TfTrt
         2dww==
X-Forwarded-Encrypted: i=1; AJvYcCXd0JHgmSRQkFmzruJT6iYwPGfmb+3jfUWPeVJTJOrdAH8B7So0lCENkxZbv0QX4mDYE7W4mMUEBq6QeHWtGIj+@lists.infradead.org
X-Gm-Message-State: AOJu0YyG0cCsQUHkvkluV1c8fgn6qp5bUHdvzLQoW7rOs2adVj9kTVSO
	Iy6IYNQYipqZlGSi6+dPIaBaxc4/mCc3kEn33vpFAPagtM9XuYgBszRX+JapJobDe6FNUVy4zPG
	d0IPX7n2S7JWVabY3ySxN4gAROUPbURG4rl5Q
X-Gm-Gg: ASbGncseT5nK0/9KzGgpvH3nsEKRTDkM6GLo70lwsaUqlRK4VrIWLUdMywLcyUAy/qn
	nmGcQVIxmB4GpN0kYvEU621dGiPaPGvlT51uQcijhjOpUEpNn58AXHG38PgqVX0mPbKmsX/dr0g
	==
X-Google-Smtp-Source: AGHT+IFSTGGsIToVAem8d3RPstMMmOgQL91UDPwPQKGKwSo9BvPHGLa6a2hOvXGKifufQ1ktwWV2laPTQRiNavnNF4g=
X-Received: by 2002:a05:6e02:1546:b0:3cf:c825:cc6b with SMTP id
 e9e14a558f8ab-3d03fbc14ebmr1570415ab.10.1738634320753; Mon, 03 Feb 2025
 17:58:40 -0800 (PST)
MIME-Version: 1.0
References: <20250201071455.718247-1-irogers@google.com> <Z6EStkn-YZ8zaO7u@ghost>
 <CAP-5=fXRz_8CKNz4Fr-=0yhKbf_QE2ND+PPykSAO5p8wcUz7xA@mail.gmail.com>
 <Z6EVwaOVYaKtaK1j@ghost> <CAP-5=fX1hCNWWmGJPKYxj93S=zM1-eRucqzb4WW5fB_sZBCRLg@mail.gmail.com>
 <Z6Eh1QLuqTbUKLCc@ghost> <CAP-5=fXZr8L4Z=Lb28QDZF8cbv2eJJEHSb0H9zcqSOB9cn5-9g@mail.gmail.com>
 <Z6FLDHz6V5L-HGR7@ghost>
In-Reply-To: <Z6FLDHz6V5L-HGR7@ghost>
From: Ian Rogers <irogers@google.com>
Date: Mon, 3 Feb 2025 17:58:29 -0800
X-Gm-Features: AWEUYZl4VPDQDYEEJe2b_m05PnnWBufqWLrhyYXjVGpczvYgfi2M8V9it8-CAj4
Message-ID: <CAP-5=fVk6N=FVXsJ9xRJZhYSh2sbmUkEPr5HqRd-pR7mbGts+w@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250203_175842_037736_ABFF8C8D 
X-CRM114-Status: GOOD (  37.19  )
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

On Mon, Feb 3, 2025 at 3:02=E2=80=AFPM Charlie Jenkins <charlie@rivosinc.co=
m> wrote:
> On Mon, Feb 03, 2025 at 12:54:59PM -0800, Ian Rogers wrote:
[snip]
> > I think it makes sense in the kernel, as the built binary doesn't have
> > cross-platform concerns. This is probably also the reason why the perf
> > tool has an arch directory. Let me know what you think is the right
> > direction for the perf tool syscall table code.
>
> I am hesitant about moving all of the arch-specific syscall generation
> flags into a single file.

In these changes I had a single file to build up a mapping from ELF
machine to syscall table in an array and I wanted to keep the logic to
build the array alongside the logic to build up the components of the
array - so the ifdefs were visually the same. As the scope is a single
file and the variables are static, this can give useful C compiler
"unused definition" warnings. You can trick the linker to give similar
warnings at the scope of a file, so this isn't a deal breaker.

> There is currently a really clean separation
> between the architectures and it's possible to generate all of the
> syscall tables for all of the architecutures based on the paths to the
> syscall table.

This doesn't happen currently as the build of the arch directory is to
add in $(SRCARCH) only. So
tools/perf/arch/arm64/entry/syscalls/Makefile.syscalls will only be
included into the build if SRCARCH=3D=3Darm64. As I've said I'm against
the idea of the arch directory as it nearly always causes cross
platform problems - not an issue in a Linux kernel build. We recently
eliminated dwarf-regs for this reason (and hopefully fixing up cross
platform disassembly issues as a consequence):
https://lore.kernel.org/all/20241108234606.429459-1-irogers@google.com/
We could have the syscall table logic not under arch and generate
multiple files, but we'd be adding extra logic to pull things apart to
then pull things back together again, which feels like unnecessary
complexity.

It seems in your changes the Kbuild and Makefile.syscalls are running
in the arch directory - this feels like a lot of peculiar and
separated build logic for just iterating over a bunch of arch
directory names and calling a shell function on them - albeit with
some arch specific parameters. There's also an extra C helper
executable in your code. I kind of like that I get a single header
that is the same across all architectures and with no more build
system requirements than to support ifdefs - in fact the ifdefs are
just there to keep the code size down there is a #define to make them
all have no effect. I hear your "clean separation" but I also think
separation across files can make things harder to read, state is in >1
place. I've tried to cleanly separate within the script.

I do think there is some tech debt in both changes. My:
```
#if defined(ALL_SYSCALLTBL) || defined(__riscv)
#if __BITS_PER_LONG !=3D 64
EOF
build_tables "$tools_dir/scripts/syscall.tbl" "$outfile"
common,32,riscv,memfd_secret EM_RISCV
echo "#else" >> "$outfile"
build_tables "$tools_dir/scripts/syscall.tbl" "$outfile"
common,64,riscv,rlimit,memfd_secret EM_RISC
V
cat >> "$outfile" <<EOF
#endif //__BITS_PER_LONG !=3D 64
```
means the perf binary word size determines the syscall table support.
This is because the e_machine in the ELF header isn't unique in these
two cases and having both tables would have no effect. You've moved
this into the env arch name handling, but I think having >1 way to
encode a binary type is suboptimal. There are some ELF flag ABI bits
that resolve disassembler things on csky, so perhaps a resolution is
to pass ELF flags along with the machine type. I'm not clear in your
change how "32_riscv" is generated to solve the same problem. Imo,
it'd kind of be nice not to introduce notions like "64_arm64" as we
seem to be always mapping/normalizing/... these different notions and
they feel inherently brittle.

> What causes the arch directory to be a pain for Bazel? I
> guess I am mostly confused why it makes sense to change the kernel
> Makefiles in order to accomidate a rewrite of the build system in Bazel
> that isn't planned to be used upstream.

It's just software and so the issues are resolvable, ie I don't think
bazel should be determining what happens upstream - it motivates me to
some extent. For the bazel build I need to match the Makefile behavior
with bits of script called genrule, the scope and quantity of these
increase with the arch directory model, extra executables to have in
the build etc. I also imagine cross platform stuff will add
complexity, like mapping blaze's notions of machine type to those
introduced in your change. It is all a lot of stuff and I think what's
in these changes keeps things about as simple as they can be. It'd be
nice to integrate the best features of both changes and I think some
of the e_machine stuff here can be added onto your change to get the
i386/x86-64 case to work. I'm not sold on the complexity of the build
in your changes though, multiple files, Kbuild and Makefile.syscalls,
the arch directory not optionally being built, helper executables.
Ultimately it is the same shell logic in both changes, and your
previous work laid out all the ground work for this (I'm very grateful
for it :-) ).

Thanks,
Ian

