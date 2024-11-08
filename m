Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FA99D64072
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 18:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nf7MfvQHFHsMilMOcrRu8oE+bBUT3BnfeKEv0/Bnz2U=; b=3ZeEZ1QAVGe0ABLw+HbJZUdMk2
	3/IKI3Y60hj79j8J5Xv7ypl6wFGyJA1qUz7SVrSdCfc4+L+xYuc4ExlxdsCV0djJgUlD4G3rSEstT
	0h+cYAMIZLb2wpyq7wf71dae2HwDksIe668uZ76ik4Ws+sB0guEXy2+TrnFbP/ZAxlRUS2ULOgOWX
	Bey48XMBDvovfZLZc4uaUWg3WoHYnR+H738sBDlcxiuU6PursKYlYg32ro0iEE/v0a5Yyv68G/sHM
	4cI+Vu6ixKuxh0TRjjUr4fv+Oh8ZJPbMBLu5hcAetjzoCqaA8tDnQJtXJ/sV0cwSmX8e+buQL7fhs
	gMbmNmMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9TcM-0000000BaPb-0VS1;
	Fri, 08 Nov 2024 18:21:58 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9TaY-0000000Ba83-1ADe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 18:20:08 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-20c87b0332cso6805ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Nov 2024 10:20:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731090004; x=1731694804; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nf7MfvQHFHsMilMOcrRu8oE+bBUT3BnfeKEv0/Bnz2U=;
        b=MgCQW3qokMXXz6s7H3sTwe5yDUA+vCutFyTQhrZWvFRdCNH3NPLRRSYTCioxNeL/31
         xlZ7T4UHq0Jw2aJYqaLjnRSJ9tde0sBWFZeldt/8rI5BUhDmozHqyjBhyuvtSlo6Wx69
         /6Ig7oGhimf1+5wqRx0vK5f1r3ErJZUVldyrVIWkeY0B3xHWq5QPPqt8aFZfTw3NqUe9
         RRtLce+HjH/LMVQ9CND+PWAFiKh15+ECU52kXIisq9GDtiVSaK4+T9fFQUp/lWI/RqsG
         36GsfxYuAKROVM9L19vduxqZr1xn/V+fKVxY2ZZN8uPunSA0MDj6vKY3/jCxhj9dMsGD
         Kv2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731090004; x=1731694804;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nf7MfvQHFHsMilMOcrRu8oE+bBUT3BnfeKEv0/Bnz2U=;
        b=L2IuGNG3Kwj43XhmX22sFJB5z4pJzRgaN9qELXVwhvR8qADFCheGCUDMUsnpu1zZk8
         2/Lgo/UpSHoiHH+pzkW/s5EZPZICpimjVb60HGe1hwplbT50PB7MZr5OotfT8sc19NEr
         2ve4+ErlAwetQ7v1f3pVtYR9GHX19jwQH68MhnHcf1Adf9wkFJrh0/OreJ2hQ9lqCx6A
         sdReqBLK3A79nr19YJL//xKIUOo0E3y2NbnTBC6lo8jgSouBEF96npMGtixZO0zg7F6M
         LoMrp9j6ilw5Zo22Mx6mDhWVOPTMBLe1UXLUgE1rTTxapG7Iz+6aVOc38jGRSmwQ3QL1
         KDoA==
X-Forwarded-Encrypted: i=1; AJvYcCXJ3FKVHBNt+4ORscymkmn14vuOHiNskCHLkrf98Yb+PHUDe79TIQBvnuflrAbCRzqGShC5lYVq6+441888a4gW@lists.infradead.org
X-Gm-Message-State: AOJu0YzzFL0xKxvfxmDzzmqikEG5xzxiawOUIp1BMYeRrGJgUj5XAZFI
	cZ/B0wx/CbLGO7LaZhlcoF1iICZrDrArcYYn1FMu50RcDD0TT/b+L6AXhuGvUuX602p2n6wSpLd
	X0b4LTh2oiVtz8jfquFqTeEiLzZ65RRAEm1LD
X-Gm-Gg: ASbGncvsJa43Scg9VNLDXKll/mCIkdv8MkV6xMzemdCLQEXoTVuuFnYPwcT8G16sThh
	YnWHvXBcdGl4dHy2mzvgGpVh5YuvtsclK
X-Google-Smtp-Source: AGHT+IGAGxygO8zIMuBBzlLrISaHhzYu5CrxNemIriyDIaZe+XR//zXcE6s13MhITP3HJRDsgVoeguyaiFUqTkwRFOs=
X-Received: by 2002:a17:902:d4c7:b0:205:968b:31e9 with SMTP id
 d9443c01a7336-211748f482dmr6592465ad.1.1731090004012; Fri, 08 Nov 2024
 10:20:04 -0800 (PST)
MIME-Version: 1.0
References: <20241017002520.59124-1-irogers@google.com> <20241017002520.59124-5-irogers@google.com>
 <Zy5Le-xn4gzQ2WLo@google.com>
In-Reply-To: <Zy5Le-xn4gzQ2WLo@google.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 8 Nov 2024 10:19:52 -0800
Message-ID: <CAP-5=fXe-gJ6pXwdTgGqScCR+mKS2FBfVDsbih7vL-1kPKAvaA@mail.gmail.com>
Subject: Re: [PATCH v3 04/20] perf disasm: Add e_machine/e_flags to struct arch
To: Namhyung Kim <namhyung@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
	James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>, 
	Leo Yan <leo.yan@linux.dev>, Guo Ren <guoren@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Nick Terrell <terrelln@fb.com>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Changbin Du <changbin.du@huawei.com>, 
	Guilherme Amadio <amadio@gentoo.org>, Yang Jihong <yangjihong@bytedance.com>, 
	Aditya Gupta <adityag@linux.ibm.com>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Kajol Jain <kjain@linux.ibm.com>, 
	Atish Patra <atishp@rivosinc.com>, Shenlin Liang <liangshenlin@eswincomputing.com>, 
	Anup Patel <anup@brainfault.org>, Oliver Upton <oliver.upton@linux.dev>, 
	"Steinar H. Gunderson" <sesse@google.com>, "Dr. David Alan Gilbert" <linux@treblig.org>, 
	Chen Pei <cp0613@linux.alibaba.com>, Dima Kogan <dima@secretsauce.net>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, "David S. Miller" <davem@davemloft.net>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_102006_352627_F349FD2B 
X-CRM114-Status: GOOD (  31.12  )
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

On Fri, Nov 8, 2024 at 9:33=E2=80=AFAM Namhyung Kim <namhyung@kernel.org> w=
rote:
>
> On Wed, Oct 16, 2024 at 05:25:04PM -0700, Ian Rogers wrote:
> > Currently functions like get_dwarf_regnum only work with the host
> > architecture. Carry the elf machine and flags in struct arch so that
> > in disassembly these can be used to allow cross platform disassembly.
> >
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > ---
> >  tools/perf/arch/arc/annotate/instructions.c       | 2 ++
> >  tools/perf/arch/arm/annotate/instructions.c       | 2 ++
> >  tools/perf/arch/arm64/annotate/instructions.c     | 2 ++
> >  tools/perf/arch/csky/annotate/instructions.c      | 7 ++++++-
> >  tools/perf/arch/loongarch/annotate/instructions.c | 2 ++
> >  tools/perf/arch/mips/annotate/instructions.c      | 2 ++
> >  tools/perf/arch/powerpc/annotate/instructions.c   | 2 ++
> >  tools/perf/arch/riscv64/annotate/instructions.c   | 2 ++
> >  tools/perf/arch/s390/annotate/instructions.c      | 2 ++
> >  tools/perf/arch/sparc/annotate/instructions.c     | 2 ++
> >  tools/perf/arch/x86/annotate/instructions.c       | 3 ++-
> >  tools/perf/util/disasm.h                          | 4 ++++
> >  12 files changed, 30 insertions(+), 2 deletions(-)
> >
> > diff --git a/tools/perf/arch/arc/annotate/instructions.c b/tools/perf/a=
rch/arc/annotate/instructions.c
> > index 2f00e995c7e3..e5619770a1af 100644
> > --- a/tools/perf/arch/arc/annotate/instructions.c
> > +++ b/tools/perf/arch/arc/annotate/instructions.c
> > @@ -5,5 +5,7 @@ static int arc__annotate_init(struct arch *arch, char *=
cpuid __maybe_unused)
> >  {
> >       arch->initialized =3D true;
> >       arch->objdump.comment_char =3D ';';
> > +     arch->e_machine =3D EM_ARC;
> > +     arch->e_flags =3D 0;
> >       return 0;
> >  }
> > diff --git a/tools/perf/arch/arm/annotate/instructions.c b/tools/perf/a=
rch/arm/annotate/instructions.c
> > index 2ff6cedeb9c5..cf91a43362b0 100644
> > --- a/tools/perf/arch/arm/annotate/instructions.c
> > +++ b/tools/perf/arch/arm/annotate/instructions.c
> > @@ -53,6 +53,8 @@ static int arm__annotate_init(struct arch *arch, char=
 *cpuid __maybe_unused)
> >       arch->associate_instruction_ops   =3D arm__associate_instruction_=
ops;
> >       arch->objdump.comment_char        =3D ';';
> >       arch->objdump.skip_functions_char =3D '+';
> > +     arch->e_machine =3D EM_ARM;
> > +     arch->e_flags =3D 0;
> >       return 0;
> >
> >  out_free_call:
> > diff --git a/tools/perf/arch/arm64/annotate/instructions.c b/tools/perf=
/arch/arm64/annotate/instructions.c
> > index f86d9f4798bd..d465d093e7eb 100644
> > --- a/tools/perf/arch/arm64/annotate/instructions.c
> > +++ b/tools/perf/arch/arm64/annotate/instructions.c
> > @@ -113,6 +113,8 @@ static int arm64__annotate_init(struct arch *arch, =
char *cpuid __maybe_unused)
> >       arch->associate_instruction_ops   =3D arm64__associate_instructio=
n_ops;
> >       arch->objdump.comment_char        =3D '/';
> >       arch->objdump.skip_functions_char =3D '+';
> > +     arch->e_machine =3D EM_AARCH64;
> > +     arch->e_flags =3D 0;
> >       return 0;
> >
> >  out_free_call:
> > diff --git a/tools/perf/arch/csky/annotate/instructions.c b/tools/perf/=
arch/csky/annotate/instructions.c
> > index 5337bfb7d5fc..14270311d215 100644
> > --- a/tools/perf/arch/csky/annotate/instructions.c
> > +++ b/tools/perf/arch/csky/annotate/instructions.c
> > @@ -43,6 +43,11 @@ static int csky__annotate_init(struct arch *arch, ch=
ar *cpuid __maybe_unused)
> >       arch->initialized =3D true;
> >       arch->objdump.comment_char =3D '/';
> >       arch->associate_instruction_ops =3D csky__associate_ins_ops;
> > -
> > +     arch->e_machine =3D EM_CSKY;
> > +#if defined(__CSKYABIV2__)
> > +     arch->e_flags =3D EF_CSKY_ABIV2;
> > +#else
> > +     arch->e_flags =3D EF_CSKY_ABIV1;
> > +#endif
>
> By moving this into the general code, it should take care of old systems
> that doesn't have the macro.
>
>   In file included from util/disasm.c:109:
>   /linux/tools/perf/arch/csky/annotate/instructions.c: In function 'csky_=
_annotate_init':
>   /linux/tools/perf/arch/csky/annotate/instructions.c:50:25: error: 'EF_C=
SKY_ABIV1' undeclared (first use in this function)
>      50 |         arch->e_flags =3D EF_CSKY_ABIV1;
>         |                         ^~~~~~~~~~~~~
>   /linux/tools/perf/arch/csky/annotate/instructions.c:50:25: note: each u=
ndeclared identifier is reported only once for each function it appears in

EF_CSKY_ABIV1 is defined in elf.h and has been there at least 5 years in li=
belf:
https://sourceware.org/git/?p=3Delfutils.git;a=3Dcommit;f=3Dlibelf/elf.h;h=
=3D9c82942ae7355a3226c53a92c2c73b33193c5e33
I suspected the issue here is missing elf.h include, but the .c file
is included in tools/perf/util/disasm.c and that must have a
transitive dependency given other things are building. Do you want me
to send a patch making this conditional with extra #ifdefs or re-send
the series?

> Also, I think __CSKYABIV2__ is defined only when the host is csky.  So
> it'll use ABI v1 on cross env.  I'm not sure if it's a problem.  We may
> need to save the ABI somewhere in the metadata later.

Agreed. In general we should read e_machine and e_flags from the ELF
file, so I'm not sure new metadata is needed. This patch is trying to
lay groundwork for that.

Thanks,
Ian

