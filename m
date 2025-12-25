Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C335FE7AD40
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Dec 2025 05:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U2wbTJJdGrhHraisi4Kb/n0+0ClNXXkqttU7yvTO+5U=; b=i1NeN6eWD4TzjwOJWyDpVSVow2
	elDV6JCQmV9Bg3St/LrGrgXFJ8Yr8nFuRDarPRsD45EgLsg5mq96K9dQ0JIYdnYhHTCIBZap0l8+T
	Jsp/05JZyqqwlBZ37JVLQf4QW7c2N829CnTEQppnOl4gY4sof7KpmcFYeFqCXpZ7JvtpxtAVkejms
	/Et04h/2yu1whKcClPg5IpxcSjqgOiCW/W6J25xMTrAPaKhhh3RxN8FYuAQm+z83CBi48f8s5pGo9
	FZOr5QNeTrwRMURgeAglca060lqYLHX3KLvrqbEkRimMgNR69ZODW1ZsBiVemkf1XT9ZR24Kwrgez
	t9MoNVog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYdUt-000000004hg-2hi1;
	Thu, 25 Dec 2025 05:02:47 +0000
Received: from mail-dl1-x1230.google.com ([2607:f8b0:4864:20::1230])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYdUn-000000004gg-1NOE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Dec 2025 05:02:45 +0000
Received: by mail-dl1-x1230.google.com with SMTP id a92af1059eb24-11beb0a7bd6so10166748c88.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 21:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=skydio.com; s=google; t=1766638960; x=1767243760; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U2wbTJJdGrhHraisi4Kb/n0+0ClNXXkqttU7yvTO+5U=;
        b=MN1behJZy5yTI+QXgBqDbNtvRIdD4R14LroSDbU2G+PZPDXE4XDoXU0IP6rtsm3NwE
         zOHiKEnO1MCtCjrncXkWTlTjYz1g4bQa5nXLqPtSl0/eVn+hehgmCz4ziTA7UQBdF8Nk
         LgWlsXOpsJybtJxDvusT15nodpp297ThqKmdDmwy5jUd6QwcCOH7AUm7UWEI3mznO3VP
         WpfnYL2iLqYNrEQQ3ee7NrTse7RgmLPLtN6YU600GRJuyC6kdXxynyU7483Q1amkeM3E
         30KXhpptBZfsKk/jXfkv6Fm+onqgdPkcBCMkFbiU/Al6M6LxEOGHFo9LiIead5bXxmom
         DP5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766638960; x=1767243760;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U2wbTJJdGrhHraisi4Kb/n0+0ClNXXkqttU7yvTO+5U=;
        b=BoorNDngEhKlj3gziDhkKJCfqE31srLwvIdwSnNV2JE/Dyv1ceOqUEUbH5bQalY9ru
         7Ma9u9CxrAXRWWd7nZx/bWG6YIDycPRPGOinm389M/D8uVPrTr2T59APeU0MO29Q4gP/
         LMBHO7RaPsGVZDvNrBX4ZQ4CrPznJtTVIHOu2j9/rwSUG6Kh7Mt5YoKvC3tPgB+jUfph
         DKW5wwrhlZcfCMdCQXNO8YERERRrShA7IosW0+aIdWGWuUGLq0x8udmMNBAHy5fFPmgd
         v5xWH+fbe1WqDK/ITpnfHl1mPCabobC0PeOdG1YOaHTAWxBrh2yYvIVMNloHAjjFqsmi
         fOrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNTbCooBMQ4FzpZchmGRBagLXwHou3ifNnB+P6RNvDp6Hl4SlBXHeIDGc3mFwQdyFySs1nxmZJmdQGpc1rbDOZ@lists.infradead.org
X-Gm-Message-State: AOJu0YyO7kXKT64uZk0zlGd43XUtUrx6yqrTjGcA3LmWPPFD8jcHnFZe
	6hfwxxoIXLl3JVHhdTasOXccxpYWIPX0LrxKvzHl0WAwLkHeR7KJHpgkFSqoIpq3giRRhz/zvLK
	JMTHCpcWOI8DIv+/W7Ip/k4M/kv3BFF9CjlckzfC3Bg==
X-Gm-Gg: AY/fxX4bkwQuPo2MBXoAHTK1zStOt4lrx0P3IMPCdLdZexZLDjtWm0YuMijpueW5L9h
	B97EtlZ4jyZeSp6hznl+Q0jJkzMpI5gftQGSf5b5WWTkEmVHJcNWD+FqrGfv+bx5sMuoEfk+tC5
	FMenAXLV6Se2UtBjNmbDA+lDIubecJakJeqf8HrecqpzvX8k7I6uM/beYCNWuRqpQr/r+NEjt82
	K+zjQGodvsaVdTKY5Py6qZS3N4W6vvoyukazfIncBBqpFhCTGOkl3IgH8307uYNWcLQRjSfhWFW
	3xqVOA==
X-Google-Smtp-Source: AGHT+IHF405OTLIUnpDZPz1wFgqAaI4ftQnHSvbrUnCDeurihDC79oUuEYjMUaez4j3D0lX20DltvCoBvxyES26cVAY=
X-Received: by 2002:a05:7022:e01:b0:11b:f271:835a with SMTP id
 a92af1059eb24-120619277e0mr23506891c88.3.1766638959686; Wed, 24 Dec 2025
 21:02:39 -0800 (PST)
MIME-Version: 1.0
References: <20251223-cross-arch-unwind-v1-1-4d71ee7db512@skydio.com> <c25d5032-5a41-4e95-ae76-3466875241a0@linaro.org>
In-Reply-To: <c25d5032-5a41-4e95-ae76-3466875241a0@linaro.org>
From: Shimin Guo <shimin.guo@skydio.com>
Date: Wed, 24 Dec 2025 21:02:28 -0800
X-Gm-Features: AQt7F2paMCn4O_uHhbWd51NzweedFAV7Wnuz-qM4AiZxt0bRs6_UYKvOMTrtOWU
Message-ID: <CAK3u-5hE6zAT21bnEa7H-URAP1CsNrgnYu2fJ+t8CBO=xo3tpA@mail.gmail.com>
Subject: Re: [PATCH] perf unwind-libdw: fix a cross-arch unwinding bug
To: James Clark <james.clark@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, linux-csky@vger.kernel.org, 
	linux-riscv@lists.infradead.org, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Guo Ren <guoren@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_210241_652392_25462C96 
X-CRM114-Status: GOOD (  37.62  )
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

On Wed, Dec 24, 2025 at 5:40=E2=80=AFAM James Clark <james.clark@linaro.org=
> wrote:
>
>
>
> On 24/12/2025 2:19 am, Shimin Guo via B4 Relay wrote:
> > From: Shimin Guo <shimin.guo@skydio.com>
> >
> > The set_initial_registers field of Dwfl_Thread_Callbacks needs to be se=
t
> > according to the arch of the stack samples being analyzed, not the arch
> > that perf itself is built for. Currently perf fails to unwind stack sam=
ples
> > collected from archs different from that of the host perf is running on=
.
> > This patch moves the arch-specific implementations of set_initial_regis=
ters
> > from tools/perf/arch to tools/perf/utli/unwind-libdw-arch, similar to t=
he
> > way the perf-regs-arch folder contains arch-specific functions related =
to
> > registers, and chooses the implementation based on the arch of the data
> > being processed.
> >
> > Signed-off-by: Shimin Guo <shimin.guo@skydio.com>
> > ---
> > checkpatch flagged three issues:
> >> tools/perf/util/unwind-libdw-arch/Build:232: WARNING: added, moved
> > or deleted file(s), does MAINTAINERS need updating?
> >
> > Not sure what to do about that.
> >
>
> You don't need to do anything here because there's a blanket rule for
> the Perf dir.

PERFORMANCE EVENTS TOOLING ARM64 has a rule that matches tools/perf/arch/ar=
m*/.
The new files for arm and arm64 will no longer be matched by the rule.

>
> >> checkpatch.pl: tools/perf/util/unwind-libdw.c:228: WARNING:
> > Non-declarative macros with multiple statements should be enclosed in
> > a do - while loop
>
> I think you can ignore this one.
>
> >> checkpatch.pl: tools/perf/util/unwind-libdw.c:228: WARNING: macros
> > should not use a trailing semicolon
> >
> > Are these two false positives? I'm defining static global variables
> > with the macro.
>
> But I don't see a reason not to follow this one, just remove the semicolo=
n.

Maybe it doesn't matter, but after I removed the semicolon, I got a new err=
or
from checkpatch "Macros with complex values should be enclosed in parenthes=
es"
instead of the warning that suggests do - while.

>
> > ---
> >   tools/perf/arch/arm/util/Build                     |  1 -
> >   tools/perf/arch/arm64/util/Build                   |  1 -
> >   tools/perf/arch/csky/util/Build                    |  2 -
> >   tools/perf/arch/powerpc/util/Build                 |  1 -
> >   tools/perf/arch/riscv/util/Build                   |  1 -
> >   tools/perf/arch/s390/util/Build                    |  2 -
> >   tools/perf/arch/x86/util/Build                     |  1 -
> >   tools/perf/util/Build                              |  1 +
> >   tools/perf/util/unwind-libdw-arch/Build            |  8 ++++
> >   .../unwind-libdw-arch/unwind-libdw-arm.c}          |  4 +-
> >   .../unwind-libdw-arch/unwind-libdw-arm64.c}        |  4 +-
> >   .../unwind-libdw-arch/unwind-libdw-csky.c}         |  6 +--
> >   .../unwind-libdw-arch/unwind-libdw-loongarch.c}    |  4 +-
> >   .../unwind-libdw-arch/unwind-libdw-powerpc.c}      |  4 +-
> >   .../unwind-libdw-arch/unwind-libdw-riscv.c}        |  4 +-
> >   .../unwind-libdw-arch/unwind-libdw-s390.c}         |  6 +--
> >   .../unwind-libdw-arch/unwind-libdw-x86.c}          |  2 +-
> >   tools/perf/util/unwind-libdw.c                     | 49 +++++++++++++=
++++++---
> >   tools/perf/util/unwind-libdw.h                     | 10 ++++-
> >   19 files changed, 79 insertions(+), 32 deletions(-)
> >
> > diff --git a/tools/perf/arch/arm/util/Build b/tools/perf/arch/arm/util/=
Build
> > index fd695e1fdaee2ccc300a206131b8b38a763b00ce..3291f893b943df0722dff58=
3523fff4ae79919bc 100644
> > --- a/tools/perf/arch/arm/util/Build
> > +++ b/tools/perf/arch/arm/util/Build
> > @@ -1,6 +1,5 @@
> >   perf-util-y +=3D perf_regs.o
> >
> >   perf-util-$(CONFIG_LOCAL_LIBUNWIND)    +=3D unwind-libunwind.o
> > -perf-util-$(CONFIG_LIBDW_DWARF_UNWIND) +=3D unwind-libdw.o
> >
> >   perf-util-y +=3D pmu.o auxtrace.o cs-etm.o
> > diff --git a/tools/perf/arch/arm64/util/Build b/tools/perf/arch/arm64/u=
til/Build
> > index d63881081d2eb1e9a83eabf82104d75308f7fc79..0177af19cc00038d6a60055=
92ddc530bf7eb1557 100644
> > --- a/tools/perf/arch/arm64/util/Build
> > +++ b/tools/perf/arch/arm64/util/Build
> > @@ -1,4 +1,3 @@
> > -perf-util-$(CONFIG_LIBDW_DWARF_UNWIND) +=3D unwind-libdw.o
> >   perf-util-$(CONFIG_LIBTRACEEVENT) +=3D kvm-stat.o
> >   perf-util-$(CONFIG_LOCAL_LIBUNWIND) +=3D unwind-libunwind.o
> >   perf-util-y +=3D ../../arm/util/auxtrace.o
> > diff --git a/tools/perf/arch/csky/util/Build b/tools/perf/arch/csky/uti=
l/Build
> > index 5e6ea82c42021d3d5651ca4c4a3a6e5138574e4e..6b2d0e021b11464e46d6b53=
974260d32ea969732 100644
> > --- a/tools/perf/arch/csky/util/Build
> > +++ b/tools/perf/arch/csky/util/Build
> > @@ -1,3 +1 @@
> >   perf-util-y +=3D perf_regs.o
> > -
> > -perf-util-$(CONFIG_LIBDW_DWARF_UNWIND) +=3D unwind-libdw.o
> > diff --git a/tools/perf/arch/powerpc/util/Build b/tools/perf/arch/power=
pc/util/Build
> > index 3d0d5427aef7f26a8c05c883cc7ad763f08cbb30..5fd28ec713a4db74ecd1d26=
866a65ddb20e94bd3 100644
> > --- a/tools/perf/arch/powerpc/util/Build
> > +++ b/tools/perf/arch/powerpc/util/Build
> > @@ -9,5 +9,4 @@ perf-util-y +=3D evsel.o
> >   perf-util-$(CONFIG_LIBDW) +=3D skip-callchain-idx.o
> >
> >   perf-util-$(CONFIG_LIBUNWIND) +=3D unwind-libunwind.o
> > -perf-util-$(CONFIG_LIBDW_DWARF_UNWIND) +=3D unwind-libdw.o
> >   perf-util-y +=3D auxtrace.o
> > diff --git a/tools/perf/arch/riscv/util/Build b/tools/perf/arch/riscv/u=
til/Build
> > index 58a672246024dd0f72e767d11e9958bd9913ec3c..628b9ebd418bde8cdf1ab13=
32bf79f7c9d50760e 100644
> > --- a/tools/perf/arch/riscv/util/Build
> > +++ b/tools/perf/arch/riscv/util/Build
> > @@ -2,4 +2,3 @@ perf-util-y +=3D perf_regs.o
> >   perf-util-y +=3D header.o
> >
> >   perf-util-$(CONFIG_LIBTRACEEVENT) +=3D kvm-stat.o
> > -perf-util-$(CONFIG_LIBDW_DWARF_UNWIND) +=3D unwind-libdw.o
> > diff --git a/tools/perf/arch/s390/util/Build b/tools/perf/arch/s390/uti=
l/Build
> > index c64eb18dbdae93adafabf8542e4c9a763ecfe057..5391d26fedd46b7d30a1bef=
0bff2ec2d58ec30ed 100644
> > --- a/tools/perf/arch/s390/util/Build
> > +++ b/tools/perf/arch/s390/util/Build
> > @@ -2,8 +2,6 @@ perf-util-y +=3D header.o
> >   perf-util-$(CONFIG_LIBTRACEEVENT) +=3D kvm-stat.o
> >   perf-util-y +=3D perf_regs.o
> >
> > -perf-util-$(CONFIG_LIBDW_DWARF_UNWIND) +=3D unwind-libdw.o
> > -
> >   perf-util-y +=3D machine.o
> >   perf-util-y +=3D pmu.o
> >
> > diff --git a/tools/perf/arch/x86/util/Build b/tools/perf/arch/x86/util/=
Build
> > index c0dc5965f3624a6f02525a04d287dff755356d20..fad256252bb95a8f8350b6b=
b1a54e8074eaebbec 100644
> > --- a/tools/perf/arch/x86/util/Build
> > +++ b/tools/perf/arch/x86/util/Build
> > @@ -12,7 +12,6 @@ perf-util-y +=3D evsel.o
> >   perf-util-y +=3D iostat.o
> >
> >   perf-util-$(CONFIG_LOCAL_LIBUNWIND)    +=3D unwind-libunwind.o
> > -perf-util-$(CONFIG_LIBDW_DWARF_UNWIND) +=3D unwind-libdw.o
> >
> >   perf-util-y +=3D auxtrace.o
> >   perf-util-y +=3D archinsn.o
> > diff --git a/tools/perf/util/Build b/tools/perf/util/Build
> > index 1c2a43e1dc68e7f751ec6082352b10de9ffeea62..15f8a4f4b24a46b6300e824=
f672dd9c0d5b7865f 100644
> > --- a/tools/perf/util/Build
> > +++ b/tools/perf/util/Build
> > @@ -226,6 +226,7 @@ perf-util-$(CONFIG_LIBDW) +=3D debuginfo.o
> >   perf-util-$(CONFIG_LIBDW) +=3D annotate-data.o
> >
> >   perf-util-$(CONFIG_LIBDW_DWARF_UNWIND) +=3D unwind-libdw.o
> > +perf-util-$(CONFIG_LIBDW_DWARF_UNWIND) +=3D unwind-libdw-arch/
> >   perf-util-$(CONFIG_LOCAL_LIBUNWIND)    +=3D unwind-libunwind-local.o
> >   perf-util-$(CONFIG_LIBUNWIND)          +=3D unwind-libunwind.o
> >   perf-util-$(CONFIG_LIBUNWIND_X86)      +=3D libunwind/x86_32.o
> > diff --git a/tools/perf/util/unwind-libdw-arch/Build b/tools/perf/util/=
unwind-libdw-arch/Build
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..e016d54ae2a40ecba47156c=
8f09cb72156105727
> > --- /dev/null
> > +++ b/tools/perf/util/unwind-libdw-arch/Build
> > @@ -0,0 +1,8 @@
> > +perf-util-$(CONFIG_LIBDW_DWARF_UNWIND) +=3D unwind-libdw-x86.o
> > +perf-util-$(CONFIG_LIBDW_DWARF_UNWIND) +=3D unwind-libdw-arm.o
> > +perf-util-$(CONFIG_LIBDW_DWARF_UNWIND) +=3D unwind-libdw-arm64.o
> > +perf-util-$(CONFIG_LIBDW_DWARF_UNWIND) +=3D unwind-libdw-csky.o
> > +perf-util-$(CONFIG_LIBDW_DWARF_UNWIND) +=3D unwind-libdw-loongarch.o
> > +perf-util-$(CONFIG_LIBDW_DWARF_UNWIND) +=3D unwind-libdw-powerpc.o
> > +perf-util-$(CONFIG_LIBDW_DWARF_UNWIND) +=3D unwind-libdw-riscv.o
> > +perf-util-$(CONFIG_LIBDW_DWARF_UNWIND) +=3D unwind-libdw-s390.o
> > \ No newline at end of file
> > diff --git a/tools/perf/arch/arm/util/unwind-libdw.c b/tools/perf/util/=
unwind-libdw-arch/unwind-libdw-arm.c
> > similarity index 88%
> > rename from tools/perf/arch/arm/util/unwind-libdw.c
> > rename to tools/perf/util/unwind-libdw-arch/unwind-libdw-arm.c
> > index fbb643f224ec4b27ce9d67051fe0bc4ad555b05e..c2718d6b6cff131cd67883e=
24bb0d3d963c8095a 100644
> > --- a/tools/perf/arch/arm/util/unwind-libdw.c
> > +++ b/tools/perf/util/unwind-libdw-arch/unwind-libdw-arm.c
> > @@ -1,11 +1,11 @@
> >   // SPDX-License-Identifier: GPL-2.0
> >   #include <elfutils/libdwfl.h>
> > -#include "perf_regs.h"
> > +#include "../../../arch/arm/include/uapi/asm/perf_regs.h"
> >   #include "../../../util/unwind-libdw.h"
> >   #include "../../../util/perf_regs.h"
> >   #include "../../../util/sample.h"
> >
> > -bool libdw__arch_set_initial_registers(Dwfl_Thread *thread, void *arg)
> > +bool libdw_set_initial_registers_arm(Dwfl_Thread *thread, void *arg)
> >   {
> >       struct unwind_info *ui =3D arg;
> >       struct regs_dump *user_regs =3D perf_sample__user_regs(ui->sample=
);
> > diff --git a/tools/perf/arch/arm64/util/unwind-libdw.c b/tools/perf/uti=
l/unwind-libdw-arch/unwind-libdw-arm64.c
> > similarity index 92%
> > rename from tools/perf/arch/arm64/util/unwind-libdw.c
> > rename to tools/perf/util/unwind-libdw-arch/unwind-libdw-arm64.c
> > index b89b0a7e5ad919fed23643d219fbdc3d84deff1e..87602503e057badc6efd371=
69cc60c96cf3949ab 100644
> > --- a/tools/perf/arch/arm64/util/unwind-libdw.c
> > +++ b/tools/perf/util/unwind-libdw-arch/unwind-libdw-arm64.c
> > @@ -1,11 +1,11 @@
> >   // SPDX-License-Identifier: GPL-2.0
> >   #include <elfutils/libdwfl.h>
> > -#include "perf_regs.h"
> > +#include "../../../arch/arm64/include/uapi/asm/perf_regs.h"
> >   #include "../../../util/unwind-libdw.h"
> >   #include "../../../util/perf_regs.h"
> >   #include "../../../util/sample.h"
> >
> > -bool libdw__arch_set_initial_registers(Dwfl_Thread *thread, void *arg)
> > +bool libdw_set_initial_registers_arm64(Dwfl_Thread *thread, void *arg)
> >   {
> >       struct unwind_info *ui =3D arg;
> >       struct regs_dump *user_regs =3D perf_sample__user_regs(ui->sample=
);
> > diff --git a/tools/perf/arch/csky/util/unwind-libdw.c b/tools/perf/util=
/unwind-libdw-arch/unwind-libdw-csky.c
> > similarity index 92%
> > rename from tools/perf/arch/csky/util/unwind-libdw.c
> > rename to tools/perf/util/unwind-libdw-arch/unwind-libdw-csky.c
> > index b20b1569783d7e982e91b1b40120d29ccf2f01d1..889d3b788931f3af55b03ef=
8b91d5def364972e5 100644
> > --- a/tools/perf/arch/csky/util/unwind-libdw.c
> > +++ b/tools/perf/util/unwind-libdw-arch/unwind-libdw-csky.c
> > @@ -2,12 +2,12 @@
> >   // Copyright (C) 2019 Hangzhou C-SKY Microsystems co.,ltd.
> >
> >   #include <elfutils/libdwfl.h>
> > -#include "perf_regs.h"
> > +#include "../../../arch/csky/include/uapi/asm/perf_regs.h"
> >   #include "../../util/unwind-libdw.h"
> >   #include "../../util/perf_regs.h"
> > -#include "../../util/event.h"
> > +#include "../../util/sample.h"
> >
> > -bool libdw__arch_set_initial_registers(Dwfl_Thread *thread, void *arg)
> > +bool libdw_set_initial_registers_csky(Dwfl_Thread *thread, void *arg)
> >   {
> >       struct unwind_info *ui =3D arg;
> >       struct regs_dump *user_regs =3D perf_sample__user_regs(ui->sample=
);
> > diff --git a/tools/perf/arch/loongarch/util/unwind-libdw.c b/tools/perf=
/util/unwind-libdw-arch/unwind-libdw-loongarch.c
> > similarity index 91%
> > rename from tools/perf/arch/loongarch/util/unwind-libdw.c
> > rename to tools/perf/util/unwind-libdw-arch/unwind-libdw-loongarch.c
> > index 60b1144bedd5f325e1512eeab05c29a1e8de2b03..1c5753ace6f63be771aa923=
65d3174ad8ed3a6fd 100644
> > --- a/tools/perf/arch/loongarch/util/unwind-libdw.c
> > +++ b/tools/perf/util/unwind-libdw-arch/unwind-libdw-loongarch.c
> > @@ -2,12 +2,12 @@
> >   /* Copyright (C) 2020-2023 Loongson Technology Corporation Limited */
> >
> >   #include <elfutils/libdwfl.h>
> > -#include "perf_regs.h"
> > +#include "../../../arch/loongarch/include/uapi/asm/perf_regs.h"
> >   #include "../../util/unwind-libdw.h"
> >   #include "../../util/perf_regs.h"
> >   #include "../../util/sample.h"
> >
> > -bool libdw__arch_set_initial_registers(Dwfl_Thread *thread, void *arg)
> > +bool libdw_set_initial_registers_loongarch(Dwfl_Thread *thread, void *=
arg)
> >   {
> >       struct unwind_info *ui =3D arg;
> >       struct regs_dump *user_regs =3D perf_sample__user_regs(ui->sample=
);
> > diff --git a/tools/perf/arch/powerpc/util/unwind-libdw.c b/tools/perf/u=
til/unwind-libdw-arch/unwind-libdw-powerpc.c
> > similarity index 93%
> > rename from tools/perf/arch/powerpc/util/unwind-libdw.c
> > rename to tools/perf/util/unwind-libdw-arch/unwind-libdw-powerpc.c
> > index 82d0c28ae3459ecdb0039cac1f534420d142739b..28635af3c4aa420faa4de7e=
53428d82917f78021 100644
> > --- a/tools/perf/arch/powerpc/util/unwind-libdw.c
> > +++ b/tools/perf/util/unwind-libdw-arch/unwind-libdw-powerpc.c
> > @@ -1,7 +1,7 @@
> >   // SPDX-License-Identifier: GPL-2.0
> >   #include <elfutils/libdwfl.h>
> >   #include <linux/kernel.h>
> > -#include "perf_regs.h"
> > +#include "../../../arch/powerpc/include/uapi/asm/perf_regs.h"
> >   #include "../../../util/unwind-libdw.h"
> >   #include "../../../util/perf_regs.h"
> >   #include "../../../util/sample.h"
> > @@ -13,7 +13,7 @@ static const int special_regs[3][2] =3D {
> >       { 109, PERF_REG_POWERPC_CTR },
> >   };
> >
> > -bool libdw__arch_set_initial_registers(Dwfl_Thread *thread, void *arg)
> > +bool libdw_set_initial_registers_powerpc(Dwfl_Thread *thread, void *ar=
g)
> >   {
> >       struct unwind_info *ui =3D arg;
> >       struct regs_dump *user_regs =3D perf_sample__user_regs(ui->sample=
);
> > diff --git a/tools/perf/arch/riscv/util/unwind-libdw.c b/tools/perf/uti=
l/unwind-libdw-arch/unwind-libdw-riscv.c
> > similarity index 92%
> > rename from tools/perf/arch/riscv/util/unwind-libdw.c
> > rename to tools/perf/util/unwind-libdw-arch/unwind-libdw-riscv.c
> > index dc1476e16321736de897ad53a00fbc813bd706db..2a5442b3b5bdc27252378de=
0073deb8a620f8779 100644
> > --- a/tools/perf/arch/riscv/util/unwind-libdw.c
> > +++ b/tools/perf/util/unwind-libdw-arch/unwind-libdw-riscv.c
> > @@ -2,12 +2,12 @@
> >   /* Copyright (C) 2019 Hangzhou C-SKY Microsystems co.,ltd. */
> >
> >   #include <elfutils/libdwfl.h>
> > -#include "perf_regs.h"
> > +#include "../../../arch/riscv/include/uapi/asm/perf_regs.h"
> >   #include "../../util/unwind-libdw.h"
> >   #include "../../util/perf_regs.h"
> >   #include "../../util/sample.h"
> >
> > -bool libdw__arch_set_initial_registers(Dwfl_Thread *thread, void *arg)
> > +bool libdw_set_initial_registers_riscv(Dwfl_Thread *thread, void *arg)
> >   {
> >       struct unwind_info *ui =3D arg;
> >       struct regs_dump *user_regs =3D perf_sample__user_regs(ui->sample=
);
> > diff --git a/tools/perf/arch/s390/util/unwind-libdw.c b/tools/perf/util=
/unwind-libdw-arch/unwind-libdw-s390.c
> > similarity index 89%
> > rename from tools/perf/arch/s390/util/unwind-libdw.c
> > rename to tools/perf/util/unwind-libdw-arch/unwind-libdw-s390.c
> > index c27c7a0d1076c890c35ba19543932c4ed5ac9c2a..18d44074a55bc1c7fa2d715=
0afc1f1a93d4eadf8 100644
> > --- a/tools/perf/arch/s390/util/unwind-libdw.c
> > +++ b/tools/perf/util/unwind-libdw-arch/unwind-libdw-s390.c
> > @@ -4,11 +4,11 @@
> >   #include "../../util/perf_regs.h"
> >   #include "../../util/event.h"
> >   #include "../../util/sample.h"
> > -#include "dwarf-regs-table.h"
> > -#include "perf_regs.h"
> > +#include "../../arch/s390/include/dwarf-regs-table.h"
> > +#include "../../../arch/s390/include/uapi/asm/perf_regs.h"
> >
> >
> > -bool libdw__arch_set_initial_registers(Dwfl_Thread *thread, void *arg)
> > +bool libdw_set_initial_registers_s390(Dwfl_Thread *thread, void *arg)
> >   {
> >       struct unwind_info *ui =3D arg;
> >       struct regs_dump *user_regs =3D perf_sample__user_regs(ui->sample=
);
> > diff --git a/tools/perf/arch/x86/util/unwind-libdw.c b/tools/perf/util/=
unwind-libdw-arch/unwind-libdw-x86.c
> > similarity index 94%
> > rename from tools/perf/arch/x86/util/unwind-libdw.c
> > rename to tools/perf/util/unwind-libdw-arch/unwind-libdw-x86.c
> > index 798493e887d7308cb293e29e4ba11054d0fda722..822e799fe1543d82dab27a8=
efeada3f5cde08a44 100644
> > --- a/tools/perf/arch/x86/util/unwind-libdw.c
> > +++ b/tools/perf/util/unwind-libdw-arch/unwind-libdw-x86.c
>
> You missed converting the unwind-libdw-x86.c perf_regs.h paths to a
> static arch so now Perf can only be built on x86. If you try to build
> for another arch then you get the local header and then missing x86
> definitions.

Yeah you are right. I'm also going to change some of the relative include p=
aths
from "../../../" to "../../" since the new files are two levels under
tools/perf instead of
three. The build worked without the change mostly by accident.

>
> Unfortunately you also have to convert the one in
> tools/perf/arch/x86/include/perf_regs.h which is a bit weird, but the
> build seems to work.

How does tools/perf/arch/x86/include/perf_regs.h come up? I seem to be able=
 to
build an arm64 version without changing this file.

>
> Other than that, looks good.
>
> > @@ -5,7 +5,7 @@
> >   #include "../../../util/perf_regs.h"
> >   #include "util/sample.h"
> >
> > -bool libdw__arch_set_initial_registers(Dwfl_Thread *thread, void *arg)
> > +bool libdw_set_initial_registers_x86(Dwfl_Thread *thread, void *arg)
> >   {
> >       struct unwind_info *ui =3D arg;
> >       struct regs_dump *user_regs =3D perf_sample__user_regs(ui->sample=
);
> > diff --git a/tools/perf/util/unwind-libdw.c b/tools/perf/util/unwind-li=
bdw.c
> > index ae70fb56a05729b9f06a411d162eabebbf29ac52..4a0f13bc5af99de446d440c=
551c718ef0187e195 100644
> > --- a/tools/perf/util/unwind-libdw.c
> > +++ b/tools/perf/util/unwind-libdw.c
> > @@ -225,12 +225,46 @@ static bool memory_read(Dwfl *dwfl __maybe_unused=
, Dwarf_Addr addr, Dwarf_Word *
> >       return true;
> >   }
> >
> > -static const Dwfl_Thread_Callbacks callbacks =3D {
> > -     .next_thread            =3D next_thread,
> > -     .memory_read            =3D memory_read,
> > -     .set_initial_registers  =3D libdw__arch_set_initial_registers,
> > +#define DEFINE_DWFL_THREAD_CALLBACKS(arch)                           \
> > +static const Dwfl_Thread_Callbacks callbacks_##arch =3D {             =
 \
> > +     .next_thread           =3D next_thread,                        \
> > +     .memory_read           =3D memory_read,                        \
> > +     .set_initial_registers =3D libdw_set_initial_registers_##arch, \
> >   };
> >
> > +DEFINE_DWFL_THREAD_CALLBACKS(x86)
> > +DEFINE_DWFL_THREAD_CALLBACKS(arm)
> > +DEFINE_DWFL_THREAD_CALLBACKS(arm64)
> > +DEFINE_DWFL_THREAD_CALLBACKS(csky)
> > +DEFINE_DWFL_THREAD_CALLBACKS(loongarch)
> > +DEFINE_DWFL_THREAD_CALLBACKS(powerpc)
> > +DEFINE_DWFL_THREAD_CALLBACKS(riscv)
> > +DEFINE_DWFL_THREAD_CALLBACKS(s390)
> > +
> > +static const Dwfl_Thread_Callbacks *get_thread_callbacks(const char *a=
rch)
> > +{
> > +     if (!strcmp(arch, "arm"))
> > +             return &callbacks_arm;
> > +     else if (!strcmp(arch, "arm64"))
> > +             return &callbacks_arm64;
> > +     else if (!strcmp(arch, "csky"))
> > +             return &callbacks_csky;
> > +     else if (!strcmp(arch, "loongarch"))
> > +             return &callbacks_loongarch;
> > +     else if (!strcmp(arch, "powerpc"))
> > +             return &callbacks_powerpc;
> > +     else if (!strcmp(arch, "riscv"))
> > +             return &callbacks_riscv;
> > +     else if (!strcmp(arch, "s390"))
> > +             return &callbacks_s390;
> > +     else if (!strcmp(arch, "x86"))
> > +             return &callbacks_x86;
> > +
> > +     pr_err("Fail to get thread callbacks for arch %s, returns NULL\n"=
,
> > +            arch);
> > +     return NULL;
> > +}
> > +
> >   static int
> >   frame_callback(Dwfl_Frame *state, void *arg)
> >   {
> > @@ -278,6 +312,7 @@ int unwind__get_entries(unwind_entry_cb_t cb, void =
*arg,
> >       const char *arch =3D perf_env__arch(ui_buf.machine->env);
> >       Dwarf_Word ip;
> >       int err =3D -EINVAL, i;
> > +     const Dwfl_Thread_Callbacks *callbacks;
> >
> >       if (!data->user_regs || !data->user_regs->regs)
> >               return -EINVAL;
> > @@ -300,7 +335,11 @@ int unwind__get_entries(unwind_entry_cb_t cb, void=
 *arg,
> >       if (err)
> >               goto out;
> >
> > -     err =3D !dwfl_attach_state(ui->dwfl, EM_NONE, thread__tid(thread)=
, &callbacks, ui);
> > +     callbacks =3D get_thread_callbacks(arch);
> > +     if (!callbacks)
> > +             goto out;
> > +
> > +     err =3D !dwfl_attach_state(ui->dwfl, EM_NONE, thread__tid(thread)=
, callbacks, ui);
> >       if (err)
> >               goto out;
> >
> > diff --git a/tools/perf/util/unwind-libdw.h b/tools/perf/util/unwind-li=
bdw.h
> > index 8c88bc4f2304b59561ffd482469ca63ce0f531f0..574b29848cce31e6bfd9302=
1f752b518cebf73b7 100644
> > --- a/tools/perf/util/unwind-libdw.h
> > +++ b/tools/perf/util/unwind-libdw.h
> > @@ -9,7 +9,15 @@ struct machine;
> >   struct perf_sample;
> >   struct thread;
> >
> > -bool libdw__arch_set_initial_registers(Dwfl_Thread *thread, void *arg)=
;
> > +bool libdw_set_initial_registers_x86(Dwfl_Thread *thread, void *arg);
> > +bool libdw_set_initial_registers_arm(Dwfl_Thread *thread, void *arg);
> > +bool libdw_set_initial_registers_arm64(Dwfl_Thread *thread, void *arg)=
;
> > +bool libdw_set_initial_registers_csky(Dwfl_Thread *thread, void *arg);
> > +bool libdw_set_initial_registers_loongarch(Dwfl_Thread *thread, void *=
arg);
> > +bool libdw_set_initial_registers_mips(Dwfl_Thread *thread, void *arg);
> > +bool libdw_set_initial_registers_powerpc(Dwfl_Thread *thread, void *ar=
g);
> > +bool libdw_set_initial_registers_riscv(Dwfl_Thread *thread, void *arg)=
;
> > +bool libdw_set_initial_registers_s390(Dwfl_Thread *thread, void *arg);
> >
> >   struct unwind_info {
> >       Dwfl                    *dwfl;
> >
> > ---
> > base-commit: cbd41c6d4c26c161a2b0e70ad411d3885ff13507
> > change-id: 20251223-cross-arch-unwind-d890d6a5ff0a
> >
> > Best regards,
>

