Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7320FD64099
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 23:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IiCqEW55XHvVf8qTba07pGSpYKmfdNiKgbJzhLD73iM=; b=YoAAy1+dTUNn0muCPiQ3cP3ftY
	OEGntCRasuP0wvrY2EVElgffLbxbq7gBVEhYXBRmh6ALKa7Sr+XgIPvCZJEeDWHDmdDF3JrZlLzH+
	OTLtbVdkP8/40q3kwMN/3EnyaobSJ0CbgBoRNJpjdHGFRXmvZ06kWzs/sIrtLZklRh+xTcU5Cv3/K
	sIZJidJdihjS/yajKLjEPzMXK9fzfKTMMNK+G9xpWwhfny1nbNrP8IKeAPTM0IRbHoXXaHnGzLelB
	CjOQ2COBMNp46X/OOAHLkj1/KC3lvPxnUk5qt410jT3KtbVt3FZ26wloCbrfhz5V9cMxTCA2yuTUA
	MFJ3HP3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Y7H-0000000CBoG-1pGz;
	Fri, 08 Nov 2024 23:10:11 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Y5U-0000000CBaS-3RGL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 23:08:22 +0000
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-3a3b28ac9a1so17845ab.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Nov 2024 15:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731107299; x=1731712099; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IiCqEW55XHvVf8qTba07pGSpYKmfdNiKgbJzhLD73iM=;
        b=kIp8XRDGPwA8/edpQZfxwFyQAUIELsObtQ8i8FBzvENWhA8lFucW41a7PQZi36J3S3
         Hm+hSiSVK/iBkEtoDSqoDpVhxsAwmK19vq2C8YCEYFR6X1Aw7DzZ8okV1gvTS0SSlsR/
         80gTmaY97huR66UhX/L5b2QZnTLyV0M51b7vmnQqCZEbwx+/0OTk+01dXW8H3eeuHuh5
         ZKE8H/bYXbX0/+C4NUFEBe5exQcYB+nAJajVK1Ql05bLIdJHlT67qVTPgD2+60SldBXk
         G4af3S52VI3R3iQppRZd0UEW3RsTAIMdvuW3gD6QPqaeqn2HHiounGg1eeaaTTKm9Pmk
         NmSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731107299; x=1731712099;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IiCqEW55XHvVf8qTba07pGSpYKmfdNiKgbJzhLD73iM=;
        b=ZPOw1hw3y1AItKvSOccXdJC0KgjWxcTHMqOKGybzojYsQIatadIbEPvmtywvOBU2fZ
         wEa///Ku4hFZ3Mdx4tQFWppVM7cJRQOediYTq94Kiv6tJIJ4c/jD0jkFjRPYDrF+bl5p
         l2UHAsNV15zBfMOg3dSvso8I48CrPmNErR2YsU0jsFZ1QSsL3Tc/0RgqyDcXl18nVQlj
         2x2b2VDKl2LhGTHAav7wmNsnG2KfD/RJdp+2tMQgaHCJnMmqo0a6c+TZ69jcbO+C//B/
         UfGZshp+m9Eq6Ee+Yf4nITjeWvaeR23UAxboUtgU82bgWKBBV1Wf22qgtJqM62rA7+vD
         cBtg==
X-Forwarded-Encrypted: i=1; AJvYcCXOs1sFr2JqtD61LeLa4XVOkSv3ShScf9C6vyq0CIc/TNrwCvA+n23ayXQSYBdq0jbMcxFwj/YcZIfK6xX+d2Zx@lists.infradead.org
X-Gm-Message-State: AOJu0Ywf7A1ORq8I+mnKKWcVSrSHWhPkjeS2pPRJq46SXcfAq9WQLSMi
	2ONbVueStBhAuDiO9pMrJGIsCy3F8d1w/My7TyJFCzp0rg0xcKPyR4CRhrgdWgiFHPiShDnAxfx
	QvHy3nojtrRtxrhxpFHNWwjAVUWeLHpv82h9i
X-Gm-Gg: ASbGncs6w6EJNyKMglrYNKW1NPC9thQmKikQ6320/Mhf6/g8nkZelGLpvZ9C3OsRDOI
	hrCnxTFcfVNWAz/nX8fn5P2KojH/Q1q/k
X-Google-Smtp-Source: AGHT+IEukeGFoyo6dh0VbQTAZvTWfrcspZTzt0yr9OYJp6P2e9ETJS0TnoGpuVFVzJTNq6FY+rr4thPlSIkzzSRgbw0=
X-Received: by 2002:a05:6e02:1946:b0:3a0:a224:eb2c with SMTP id
 e9e14a558f8ab-3a6f9564132mr264765ab.25.1731107299142; Fri, 08 Nov 2024
 15:08:19 -0800 (PST)
MIME-Version: 1.0
References: <20241017002520.59124-1-irogers@google.com> <20241017002520.59124-11-irogers@google.com>
 <Zy5udmX6gZAg0wkS@google.com>
In-Reply-To: <Zy5udmX6gZAg0wkS@google.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 8 Nov 2024 15:08:07 -0800
Message-ID: <CAP-5=fWhiLJ97smNySGk+TmmQ=ELOdztqdb7h3hrxT+18wG_HA@mail.gmail.com>
Subject: Re: [PATCH v3 10/20] perf dwarf-regs: Move csky dwarf-regs out of arch
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
X-CRM114-CacheID: sfid-20241108_150820_939466_5F1676D3 
X-CRM114-Status: GOOD (  27.74  )
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

On Fri, Nov 8, 2024 at 12:03=E2=80=AFPM Namhyung Kim <namhyung@kernel.org> =
wrote:
>
> On Wed, Oct 16, 2024 at 05:25:10PM -0700, Ian Rogers wrote:
> > Move arch/csky/util/dwarf-regs.c to util/dwarf-regs-csky.c and compile
> > in unconditionally. To avoid get_arch_regstr being duplicated, rename
> > to get_csky_regstr and add to get_dwarf_regstr switch.
> >
> > Update #ifdefs to allow ABI V1 and V2 tables at the same
> > time. Determine the table from the ELF flags.
> >
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > ---
> >  tools/perf/arch/csky/util/Build               |  1 -
> >  tools/perf/util/Build                         |  1 +
> >  .../dwarf-regs.c =3D> util/dwarf-regs-csky.c}   | 19 ++++++++++-------=
--
> >  tools/perf/util/dwarf-regs.c                  | 11 +++++++----
> >  tools/perf/util/include/dwarf-regs.h          |  2 ++
> >  5 files changed, 20 insertions(+), 14 deletions(-)
> >  rename tools/perf/{arch/csky/util/dwarf-regs.c =3D> util/dwarf-regs-cs=
ky.c} (74%)
> >
> > diff --git a/tools/perf/arch/csky/util/Build b/tools/perf/arch/csky/uti=
l/Build
> > index 1325310cab6a..5e6ea82c4202 100644
> > --- a/tools/perf/arch/csky/util/Build
> > +++ b/tools/perf/arch/csky/util/Build
> > @@ -1,4 +1,3 @@
> >  perf-util-y +=3D perf_regs.o
> >
> > -perf-util-$(CONFIG_LIBDW) +=3D dwarf-regs.o
> >  perf-util-$(CONFIG_LIBDW_DWARF_UNWIND) +=3D unwind-libdw.o
> > diff --git a/tools/perf/util/Build b/tools/perf/util/Build
> > index 4c615611b9d7..99ae4e2802b8 100644
> > --- a/tools/perf/util/Build
> > +++ b/tools/perf/util/Build
> > @@ -203,6 +203,7 @@ endif
> >  perf-util-$(CONFIG_LIBDW) +=3D probe-finder.o
> >  perf-util-$(CONFIG_LIBDW) +=3D dwarf-aux.o
> >  perf-util-$(CONFIG_LIBDW) +=3D dwarf-regs.o
> > +perf-util-$(CONFIG_LIBDW) +=3D dwarf-regs-csky.o
> >  perf-util-$(CONFIG_LIBDW) +=3D dwarf-regs-x86.o
> >  perf-util-$(CONFIG_LIBDW) +=3D debuginfo.o
> >  perf-util-$(CONFIG_LIBDW) +=3D annotate-data.o
> > diff --git a/tools/perf/arch/csky/util/dwarf-regs.c b/tools/perf/util/d=
warf-regs-csky.c
> > similarity index 74%
> > rename from tools/perf/arch/csky/util/dwarf-regs.c
> > rename to tools/perf/util/dwarf-regs-csky.c
> > index ca86ecaeacbb..d38ef1f07f3e 100644
> > --- a/tools/perf/arch/csky/util/dwarf-regs.c
> > +++ b/tools/perf/util/dwarf-regs-csky.c
> > @@ -5,9 +5,8 @@
> >  #include <stddef.h>
> >  #include <dwarf-regs.h>
> >
> > -#if defined(__CSKYABIV2__)
> > -#define CSKY_MAX_REGS 73
> > -const char *csky_dwarf_regs_table[CSKY_MAX_REGS] =3D {
> > +#define CSKY_ABIV2_MAX_REGS 73
> > +const char *csky_dwarf_regs_table_abiv2[CSKY_ABIV2_MAX_REGS] =3D {
> >       /* r0 ~ r8 */
> >       "%a0", "%a1", "%a2", "%a3", "%regs0", "%regs1", "%regs2", "%regs3=
",
> >       /* r9 ~ r15 */
> > @@ -26,9 +25,9 @@ const char *csky_dwarf_regs_table[CSKY_MAX_REGS] =3D =
{
> >       NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
> >       "%epc",
> >  };
> > -#else
> > -#define CSKY_MAX_REGS 57
> > -const char *csky_dwarf_regs_table[CSKY_MAX_REGS] =3D {
> > +
> > +#define CSKY_ABIV1_MAX_REGS 57

Definition of CSKY_ABIV1_MAX_REGS.

> > +const char *csky_dwarf_regs_table_abiv1[CSKY_ABIV1_MAX_REGS] =3D {
> >       /* r0 ~ r8 */
> >       "%sp", "%regs9", "%a0", "%a1", "%a2", "%a3", "%regs0", "%regs1",
> >       /* r9 ~ r15 */
> > @@ -41,9 +40,11 @@ const char *csky_dwarf_regs_table[CSKY_MAX_REGS] =3D=
 {
> >       NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
> >       "%epc",
> >  };
> > -#endif
> >
> > -const char *get_arch_regstr(unsigned int n)
> > +const char *get_csky_regstr(unsigned int n, unsigned int flags)
> >  {
> > -     return (n < CSKY_MAX_REGS) ? csky_dwarf_regs_table[n] : NULL;
> > +     if (flags & EF_CSKY_ABIV2)
>
> Hmm.. you need it here as well.

These constants are part of the dwarf-regs-csky.c file and not elf.h.

> > +             return (n < CSKY_ABIV2_MAX_REGS) ? csky_dwarf_regs_table_=
abiv2[n] : NULL;
> > +
> > +     return (n < CSKY_ABIV1_MAX_REGS) ? csky_dwarf_regs_table_abiv1[n]=
 : NULL;
> >  }
> > diff --git a/tools/perf/util/dwarf-regs.c b/tools/perf/util/dwarf-regs.=
c
> > index fd21f9e90e40..9a76f83af62c 100644
> > --- a/tools/perf/util/dwarf-regs.c
> > +++ b/tools/perf/util/dwarf-regs.c
> > @@ -29,17 +29,18 @@
> >  #define __get_dwarf_regstr(tbl, n) (((n) < ARRAY_SIZE(tbl)) ? (tbl)[(n=
)] : NULL)
> >
> >  /* Return architecture dependent register string (for kprobe-tracer) *=
/
> > -const char *get_dwarf_regstr(unsigned int n, unsigned int machine,
> > -                          unsigned int flags __maybe_unused)
> > +const char *get_dwarf_regstr(unsigned int n, unsigned int machine, uns=
igned int flags)
> >  {
> > -#if EM_HOST =3D=3D EM_X86_64 || EM_HOST =3D=3D EM_386 || EM_HOST =3D=
=3D EM_AARCH64 || EM_HOST =3D=3D EM_ARM
> > +#if EM_HOST =3D=3D EM_X86_64 || EM_HOST =3D=3D EM_386 || EM_HOST =3D=
=3D EM_AARCH64 || EM_HOST =3D=3D EM_ARM \
> > +    || EM_HOST =3D=3D EM_CSKY
>
> And here too.  It seems you also need a rebase.
>
> At this point, I'm giving up.  Can you please refresh the series with
> a fix?

Sure I'll rebase and add ifndef+defines to dwarf-regs.h, I see we have
these currently for EM_AARCH64 and EM_LOONGARCH there.

Thanks,
Ian

