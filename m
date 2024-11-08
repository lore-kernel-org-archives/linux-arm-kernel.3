Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6D81D64072
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 18:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oq7W5H+t/LruxWYJFi93XWxZ+SC0sXDXHOurVmQo/Bw=; b=qj7cXBZGbw/Yo2/x69PMBrASgn
	wE49jc18F33EqtsIzXwDK4jMiLfsKmvydIuR9BEZ8r/WxzAcnkADmU8WaDA83YoS7I06nVgeWnQHf
	5uAbG+vViRCFN3ArVNWSHTjHL1vKJxuCzasK/zQn/zw3uY/gy2AUnGzl5bnNDcYBPj45Y0zFuUA5i
	QkL+Dwf1HHIMO8CJdYYjm5EHaOYZssOQjgiA30kD/dl/eWA0E6FtxcbAF8YsqgEDDfUc+ZIazXxUu
	JnXjjTd3MIBpxjEFk1vd87Awc1UnFiLYV95GTPM1egDOIWglORq9z0R3R4xwS4ADM3ufRlF2AmOXM
	8rZanEMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9U1W-0000000BdoI-2zMP;
	Fri, 08 Nov 2024 18:47:58 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Tzj-0000000BdUD-2tBS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 18:46:09 +0000
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-3a4e54d3cefso7335ab.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Nov 2024 10:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731091566; x=1731696366; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oq7W5H+t/LruxWYJFi93XWxZ+SC0sXDXHOurVmQo/Bw=;
        b=eqnByBSRZ94AQYRWOfoZUZL+IYsPkP2D0jQ1zNoljvTfCZJ5ZV5EMADisHuoNrqtmE
         IOCdaJ1KtcAv9zxC0y91Pwi1JqMr90kiSg+Cy/kFaYvabHQlitL0DlE2EjnTcTmEnm5h
         5erauz2RxbmJZXziRzoYzq5K+SWapFw8poY5/Ni5wC6KhmoWtjfEP9rYoGcgW7KPlh51
         Hpj7Tk2X0lrbwz2Pkt4/hEvfZzRx3U2Ay21LtFStmaMVyEBKPkMEKrgMvsDVCA95gkNB
         vPdX5dJvKdqoma3qoFgC0ozcRbwD2DmNW82eMXvFT+0T31K9FJtOEIm1H0anzf5Nw8bk
         dfKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731091566; x=1731696366;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oq7W5H+t/LruxWYJFi93XWxZ+SC0sXDXHOurVmQo/Bw=;
        b=X4FvygtIQtcpX6oxES0Bsmd/WimCnbLdGN09bW8emI4hhm/10incUCuLyzvrKoFLjC
         5zv26hw8/HacyE9ZSJdnsXwhTly10j3T4saTyvqmWBVanyathypmPCPWOQBbdf57fUzc
         OZcABuaFcX/IGhOqvhiAYi8Upbez1iY61V6goexotWo8ip0C8DcfHWbRGPKZjjiJEoS6
         SuKmwzN+Kmylbp0p0/NLgMC/D9YLEb9myG+CAiouOLWmR+OVk30Stm9sche+5VoBzdsO
         LFEzqCNJOdvMQB/aeNLZhoEqEpqMOx2n57QgBeb+A19GoZ83LfmuK/lL9yoYjA0wCmVr
         nIeg==
X-Forwarded-Encrypted: i=1; AJvYcCWUCEslHVk4tQWnOO2B13X2kjOfe+KTash+03VjmbV1KNjggb3AzV5RmdleQ3I4eCVR2H4zU7DJDCLK8msZnDNH@lists.infradead.org
X-Gm-Message-State: AOJu0Yx187fqY68NTKDV3gs4WD7zvOvX3qmW+H8WH3sP9ETk+D2A2VS8
	nq5Lk1mtiUdYYpzE3dhL4qE/5Pl+GnzYTKnoofta94TBg6rTsUC3TcZRhGqSNYp+YKdqxma8re/
	XZUt4U4dJ51XjWVnJW6jrl+VMwbYPUDzQ2suY
X-Gm-Gg: ASbGncuzBMhX3fckjm2TXJcguLgkt1/c+KBs3KrMzlHAkWZnYDuuPy0MG3Eo/NbaGI2
	UGdaxZg+3CEW74Qwu8FTdK/LTtMVS+Tza
X-Google-Smtp-Source: AGHT+IHdLRWHy0a2E8ArZqPLt9njQZotEfT+CpO+S5UTw1lpU681rHBzVlJvCzLHGs/O89svRJOnyjbXFrmZAfHjHVI=
X-Received: by 2002:a05:6e02:1c81:b0:3a6:f43d:a24e with SMTP id
 e9e14a558f8ab-3a6f8a06128mr98245ab.10.1731091565707; Fri, 08 Nov 2024
 10:46:05 -0800 (PST)
MIME-Version: 1.0
References: <20241017002520.59124-1-irogers@google.com> <20241017002520.59124-5-irogers@google.com>
 <Zy5Le-xn4gzQ2WLo@google.com> <CAP-5=fXe-gJ6pXwdTgGqScCR+mKS2FBfVDsbih7vL-1kPKAvaA@mail.gmail.com>
 <Zy5aoMnY2nupb7SX@google.com>
In-Reply-To: <Zy5aoMnY2nupb7SX@google.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 8 Nov 2024 10:45:54 -0800
Message-ID: <CAP-5=fW7m0AVVn42XK9s=RFmAs63mh4Mk5QehpLKLFMAGje+9A@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20241108_104607_764181_7D014F83 
X-CRM114-Status: GOOD (  41.54  )
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

On Fri, Nov 8, 2024 at 10:38=E2=80=AFAM Namhyung Kim <namhyung@kernel.org> =
wrote:
>
> On Fri, Nov 08, 2024 at 10:19:52AM -0800, Ian Rogers wrote:
> > On Fri, Nov 8, 2024 at 9:33=E2=80=AFAM Namhyung Kim <namhyung@kernel.or=
g> wrote:
> > >
> > > On Wed, Oct 16, 2024 at 05:25:04PM -0700, Ian Rogers wrote:
> > > > Currently functions like get_dwarf_regnum only work with the host
> > > > architecture. Carry the elf machine and flags in struct arch so tha=
t
> > > > in disassembly these can be used to allow cross platform disassembl=
y.
> > > >
> > > > Signed-off-by: Ian Rogers <irogers@google.com>
> > > > ---
> > > >  tools/perf/arch/arc/annotate/instructions.c       | 2 ++
> > > >  tools/perf/arch/arm/annotate/instructions.c       | 2 ++
> > > >  tools/perf/arch/arm64/annotate/instructions.c     | 2 ++
> > > >  tools/perf/arch/csky/annotate/instructions.c      | 7 ++++++-
> > > >  tools/perf/arch/loongarch/annotate/instructions.c | 2 ++
> > > >  tools/perf/arch/mips/annotate/instructions.c      | 2 ++
> > > >  tools/perf/arch/powerpc/annotate/instructions.c   | 2 ++
> > > >  tools/perf/arch/riscv64/annotate/instructions.c   | 2 ++
> > > >  tools/perf/arch/s390/annotate/instructions.c      | 2 ++
> > > >  tools/perf/arch/sparc/annotate/instructions.c     | 2 ++
> > > >  tools/perf/arch/x86/annotate/instructions.c       | 3 ++-
> > > >  tools/perf/util/disasm.h                          | 4 ++++
> > > >  12 files changed, 30 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/tools/perf/arch/arc/annotate/instructions.c b/tools/pe=
rf/arch/arc/annotate/instructions.c
> > > > index 2f00e995c7e3..e5619770a1af 100644
> > > > --- a/tools/perf/arch/arc/annotate/instructions.c
> > > > +++ b/tools/perf/arch/arc/annotate/instructions.c
> > > > @@ -5,5 +5,7 @@ static int arc__annotate_init(struct arch *arch, ch=
ar *cpuid __maybe_unused)
> > > >  {
> > > >       arch->initialized =3D true;
> > > >       arch->objdump.comment_char =3D ';';
> > > > +     arch->e_machine =3D EM_ARC;
> > > > +     arch->e_flags =3D 0;
> > > >       return 0;
> > > >  }
> > > > diff --git a/tools/perf/arch/arm/annotate/instructions.c b/tools/pe=
rf/arch/arm/annotate/instructions.c
> > > > index 2ff6cedeb9c5..cf91a43362b0 100644
> > > > --- a/tools/perf/arch/arm/annotate/instructions.c
> > > > +++ b/tools/perf/arch/arm/annotate/instructions.c
> > > > @@ -53,6 +53,8 @@ static int arm__annotate_init(struct arch *arch, =
char *cpuid __maybe_unused)
> > > >       arch->associate_instruction_ops   =3D arm__associate_instruct=
ion_ops;
> > > >       arch->objdump.comment_char        =3D ';';
> > > >       arch->objdump.skip_functions_char =3D '+';
> > > > +     arch->e_machine =3D EM_ARM;
> > > > +     arch->e_flags =3D 0;
> > > >       return 0;
> > > >
> > > >  out_free_call:
> > > > diff --git a/tools/perf/arch/arm64/annotate/instructions.c b/tools/=
perf/arch/arm64/annotate/instructions.c
> > > > index f86d9f4798bd..d465d093e7eb 100644
> > > > --- a/tools/perf/arch/arm64/annotate/instructions.c
> > > > +++ b/tools/perf/arch/arm64/annotate/instructions.c
> > > > @@ -113,6 +113,8 @@ static int arm64__annotate_init(struct arch *ar=
ch, char *cpuid __maybe_unused)
> > > >       arch->associate_instruction_ops   =3D arm64__associate_instru=
ction_ops;
> > > >       arch->objdump.comment_char        =3D '/';
> > > >       arch->objdump.skip_functions_char =3D '+';
> > > > +     arch->e_machine =3D EM_AARCH64;
> > > > +     arch->e_flags =3D 0;
> > > >       return 0;
> > > >
> > > >  out_free_call:
> > > > diff --git a/tools/perf/arch/csky/annotate/instructions.c b/tools/p=
erf/arch/csky/annotate/instructions.c
> > > > index 5337bfb7d5fc..14270311d215 100644
> > > > --- a/tools/perf/arch/csky/annotate/instructions.c
> > > > +++ b/tools/perf/arch/csky/annotate/instructions.c
> > > > @@ -43,6 +43,11 @@ static int csky__annotate_init(struct arch *arch=
, char *cpuid __maybe_unused)
> > > >       arch->initialized =3D true;
> > > >       arch->objdump.comment_char =3D '/';
> > > >       arch->associate_instruction_ops =3D csky__associate_ins_ops;
> > > > -
> > > > +     arch->e_machine =3D EM_CSKY;
> > > > +#if defined(__CSKYABIV2__)
> > > > +     arch->e_flags =3D EF_CSKY_ABIV2;
> > > > +#else
> > > > +     arch->e_flags =3D EF_CSKY_ABIV1;
> > > > +#endif
> > >
> > > By moving this into the general code, it should take care of old syst=
ems
> > > that doesn't have the macro.
> > >
> > >   In file included from util/disasm.c:109:
> > >   /linux/tools/perf/arch/csky/annotate/instructions.c: In function 'c=
sky__annotate_init':
> > >   /linux/tools/perf/arch/csky/annotate/instructions.c:50:25: error: '=
EF_CSKY_ABIV1' undeclared (first use in this function)
> > >      50 |         arch->e_flags =3D EF_CSKY_ABIV1;
> > >         |                         ^~~~~~~~~~~~~
> > >   /linux/tools/perf/arch/csky/annotate/instructions.c:50:25: note: ea=
ch undeclared identifier is reported only once for each function it appears=
 in
> >
> > EF_CSKY_ABIV1 is defined in elf.h and has been there at least 5 years i=
n libelf:
> > https://sourceware.org/git/?p=3Delfutils.git;a=3Dcommit;f=3Dlibelf/elf.=
h;h=3D9c82942ae7355a3226c53a92c2c73b33193c5e33
> > I suspected the issue here is missing elf.h include, but the .c file
> > is included in tools/perf/util/disasm.c and that must have a
> > transitive dependency given other things are building. Do you want me
> > to send a patch making this conditional with extra #ifdefs or re-send
> > the series?
>
> Yeah, it's unfortunate but I think we can have a small incremental diff
> here to define them if it's not there.  Then I'll squash it to the
> patch.

Thanks, sgtm. Could you also explicitly include elf.h into disasm.c
rather than depending on the transitive #include? There's obviously
tech debt to not have .c files including each other to work around the
build system.

Ian

> >
> > > Also, I think __CSKYABIV2__ is defined only when the host is csky.  S=
o
> > > it'll use ABI v1 on cross env.  I'm not sure if it's a problem.  We m=
ay
> > > need to save the ABI somewhere in the metadata later.
> >
> > Agreed. In general we should read e_machine and e_flags from the ELF
> > file, so I'm not sure new metadata is needed. This patch is trying to
> > lay groundwork for that.
>
> I understand that.  Yeah it should come from the binary.
>
> Thanks,
> Namhyung
>

