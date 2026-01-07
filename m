Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C7F9D0D17C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 23:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VnK4Ewc8hN+ARSrftsR1VA6lcIUmoKo6afmRZuoPxlI=; b=DJu86Ha8+LgN9tv+bsWL1fuwdy
	2CVeGPazNXKgLGsrcyxadqX6m8aE6ym1QxCR+X09iLBnZ9zhkC2uAUMMGs8xbxJ4kuyg/J7ssldoh
	2wvf79uuicFwWMG4Nx8txaTyTII3SH7LtNBKH4feMydnBReE78CwIKYqrnUwDmwMfDEUx8g0Hgjqp
	C8Qp1DSIl2rTJiPoeWGvzV0/6NUOS/x/rXugz+FjeptNQ9ZZYpXl2c7Nd9d6q6G0LzIld629LS8ge
	eDV51S8xmWHqdc6IXdfw9Y8kfdn1LP3bZR4uA2RVcw3CW8XEMt5oSqEbuEsufIL9pndM9cZf7iiH4
	O75CBPWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdcit-0000000FjQR-0WB1;
	Wed, 07 Jan 2026 23:13:51 +0000
Received: from mail-dl1-x1231.google.com ([2607:f8b0:4864:20::1231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdcil-0000000FjPa-3Q4M
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 23:13:49 +0000
Received: by mail-dl1-x1231.google.com with SMTP id a92af1059eb24-11f42e971d6so3846244c88.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 15:13:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=skydio.com; s=google; t=1767827620; x=1768432420; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VnK4Ewc8hN+ARSrftsR1VA6lcIUmoKo6afmRZuoPxlI=;
        b=loNPD8LKZjwSQhISGYrafcFuYTIsawQjSnuaxYQb6wIcx8b/NLtn0QUgjUYXL4cM0E
         /HpKvE3h2zU4auenSp6mcdhd1eRprH9Wc+WCHeINn+/fYrzkRiGIGPoCMiXLVmCmyZpg
         5IXvQTk6Oao5/9DNpNlkM3nrZpfYKkiyMzHrj8TLGTlzGtF53/HMStz/EXRboE2QopAO
         u70ATdgVmVoIVi/YpWbT05mrdiEXLMDyOdzL4lVw4CWdxE0tcsygvNQNhSLg8x9FkTWR
         x7V6OAnt63ubWULz+xj4Wu7GDC7y4K2wdv230rtAeWEmOVzI4/YIGt7WV2qJ0qTMcMaU
         weOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767827620; x=1768432420;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VnK4Ewc8hN+ARSrftsR1VA6lcIUmoKo6afmRZuoPxlI=;
        b=v7CBr+Nr0jCzfLF79V7+JA/wSB4OwNoQt4Vv5CETsIjz8WqZOwdUjehUqxOV2VbNSS
         dhENuaQ78o2uUjQeg9wl+KiSGICydlMQAYEm74xEAQqVQXhMpiuTg8v2vEa3qa5pazBG
         lG6Z9X8N/gS459vHpXBELMiL2KpLhX7ltVHYPFrZ9gBg2dKhAqP5Ndae9m0IHQvXfp76
         KPYOz+xA/omMUoSMv8vuYt8xSs/20uREBUYroCc1YC5NBAcqbq2DmatWqLdyKnRgEIdn
         /XDyajIuU8E5TsaZs/tLY+kn4+xLSxFuI557x6qc3qnpdC5H7Mi1N6oTthz/jBFV/C6M
         BcBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHmEKrrOAlwnFVA319giapTDNNX4biVTVrtQUw3jF0yZaBe8bh4jB/NuXs7J/9fpMwqcR42yGWtE19sKhxOx+H@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0PjyxkVN8Jg7isIighfkE1cqo6/cJ2Mm2hxhrv7b8I4dCcPog
	SlQ5apks2AxNikUnztqeZXQalqClvjTrPFbPJ3hItNTTVWMMB5JuUA9AiaRxfMBQ2xv3FUY46JR
	AlxFFdWZyds8fh94jJ3sgA0gibAtMAJ6MfCCxLFjVmQ==
X-Gm-Gg: AY/fxX7v+QDbRe/eqMBAOngQU5QT2ZSr57nq6kaxBUoyG3BtDMJnGnb1i1Rp5cHVjpu
	pUgG1I+m22LCURRRL1N7SADU4+kiU274Q1eSykqn3vN7GjKD6YezIEPlH1mBY1xcHFCwYto9hO3
	ifOwbCdvn+YqRflRRuGp249C6BnbcXLwE1RcLBs8bD7h+k0JQJAu+ztMFFsyrOKDtN92BDJcuXz
	F6Msl6O6YcWjffOWJDVYIJS6yEeI2yuxf1u7SV3xUdwb3e10k6tgPGdsxdv5Tk0HcAHmw==
X-Google-Smtp-Source: AGHT+IEysz/5tWAMJaFn+KNXDO0p0klUrP71rBqwVW2QNmTwqmgmGGmUOOcgjCbYzpgemldTFn3NmJJTN3/ClvM7lwA=
X-Received: by 2002:a05:7022:608f:b0:11b:9386:a3cf with SMTP id
 a92af1059eb24-121f8b6fa2emr3103840c88.48.1767827620030; Wed, 07 Jan 2026
 15:13:40 -0800 (PST)
MIME-Version: 1.0
References: <20260105-cross-arch-unwind-v2-1-9a8b0b14ce7b@skydio.com> <aV4SRdNWzBpDVbfz@google.com>
In-Reply-To: <aV4SRdNWzBpDVbfz@google.com>
From: Shimin Guo <shimin.guo@skydio.com>
Date: Wed, 7 Jan 2026 15:13:28 -0800
X-Gm-Features: AQt7F2pIT-u6cvUiv8c9O6ineKBrseF9Ym_6j-HoPsO-jPl7mayag5mVrIC69DA
Message-ID: <CAK3u-5i3mR7325ebhvvB3JupnH_BT95LAewoTwDQM9QBTjxdNg@mail.gmail.com>
Subject: Re: [PATCH v2] perf unwind-libdw: fix a cross-arch unwinding bug
To: Namhyung Kim <namhyung@kernel.org>
Cc: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
	James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>, 
	Leo Yan <leo.yan@linux.dev>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Guo Ren <guoren@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
	linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_151344_070193_879F852E 
X-CRM114-Status: GOOD (  36.44  )
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

On Tue, Jan 6, 2026 at 11:59=E2=80=AFPM Namhyung Kim <namhyung@kernel.org> =
wrote:
>
> Hello,
>
> On Mon, Jan 05, 2026 at 01:13:38PM -0800, Shimin Guo via B4 Relay wrote:
> > From: Shimin Guo <shimin.guo@skydio.com>
> >
> > The set_initial_registers field of Dwfl_Thread_Callbacks needs to be se=
t
> > according to the arch of the stack samples being analyzed, not the arch
> > that perf itself is built for. Currently perf fails to unwind stack sam=
ples
> > collected from archs different from that of the host perf is running on=
.
>
> Thanks for the contribution!
>
> > This patch moves the arch-specific implementations of set_initial_regis=
ters
> > from tools/perf/arch to tools/perf/utli/unwind-libdw-arch, similar to t=
he
> > way the perf-regs-arch folder contains arch-specific functions related =
to
> > registers, and chooses the implementation based on the arch of the data
> > being processed.
>
> I feel like some day we will just include all top-level arch directories
> for multi-arch builds..
>
> Btw, can you please show me an example how you tested this?

Sure. I initially tested with an embedded target. I also did the
following with qemu:
- run an arm64 ubuntu guest under qemu, where the folder /host is
shared with host
- install sysbench, sysbench-dbgsym, and libc6-dbgsym on the guest
- collect data on the guest:
  sysbench cpu --threads=3D4 --time=3D60 run & \
    perf record -a --call-graph dwarf -o /host/perf.data -- sleep 60
- save /proc/kallsyms: cp /proc/kallsyms /host/kallsyms
- Terminate guest. Mount the guest disk image on the host at /mnt/guestroot
- On the host, install libdw1 and libdw-dev.
- On the host, under tools/perf, build perf: make NO_LIBUNWIND=3D1
NO_LIBTRACEEVENT=3D1
- On the host, run
  ./perf script -i $SHARED_FOLDER/perf.data --symfs /mnt/guestroot
--kallsyms $SHARED_FOLDER/kallsyms
- Without this patch, I get records like
sysbench    4166 [001]  2309.569275:          5   cycles:
                   e27e0 [unknown] ([unknown])
- With the patch, I get proper backtraces like
sysbench    4166 [001]  2309.569275:          5   cycles:
            aaaab906a338 cpu_execute_event+0x98 (/usr/bin/sysbench)
            aaaab9067a57 worker_thread+0x197 (/usr/bin/sysbench)
            ffffa8940397 start_thread+0x2d7
(/usr/lib/aarch64-linux-gnu/libc.so.6)
            ffffa89a9e9b thread_start+0xb (/usr/lib/aarch64-linux-gnu/libc.=
so.6)


>
> >
> > Signed-off-by: Shimin Guo <shimin.guo@skydio.com>
> > ---
> > Changes in v2:
> > - Fixed the include path for perf_regs.h in unwind-libdw-x86.c
> > - Removed one level of "../" from the include paths in the moved files
> > now that they are two directory levels under tools/perf instead of thre=
e.
> > - Link to v1: https://lore.kernel.org/r/20251223-cross-arch-unwind-v1-1=
-4d71ee7db512@skydio.com
> > ---
> >  tools/perf/arch/arm/util/Build                     |  1 -
> >  tools/perf/arch/arm64/util/Build                   |  1 -
> >  tools/perf/arch/csky/util/Build                    |  2 -
> >  tools/perf/arch/powerpc/util/Build                 |  1 -
> >  tools/perf/arch/riscv/util/Build                   |  1 -
> >  tools/perf/arch/s390/util/Build                    |  2 -
> >  tools/perf/arch/x86/util/Build                     |  1 -
> >  tools/perf/util/Build                              |  1 +
> >  tools/perf/util/unwind-libdw-arch/Build            |  8 ++++
> >  .../unwind-libdw-arch/unwind-libdw-arm.c}          | 10 ++---
> >  .../unwind-libdw-arch/unwind-libdw-arm64.c}        | 10 ++---
> >  .../unwind-libdw-arch/unwind-libdw-csky.c}         |  6 +--
> >  .../unwind-libdw-arch/unwind-libdw-loongarch.c}    |  4 +-
> >  .../unwind-libdw-arch/unwind-libdw-powerpc.c}      | 10 ++---
> >  .../unwind-libdw-arch/unwind-libdw-riscv.c}        |  4 +-
> >  .../unwind-libdw-arch/unwind-libdw-s390.c}         |  6 +--
> >  .../unwind-libdw-arch/unwind-libdw-x86.c}          |  8 ++--
> >  tools/perf/util/unwind-libdw.c                     | 51 ++++++++++++++=
+++++---
> >  tools/perf/util/unwind-libdw.h                     | 10 ++++-
> >  19 files changed, 92 insertions(+), 45 deletions(-)
> >
> > diff --git a/tools/perf/arch/arm/util/Build b/tools/perf/arch/arm/util/=
Build
> > index fd695e1fdaee2ccc300a206131b8b38a763b00ce..3291f893b943df0722dff58=
3523fff4ae79919bc 100644
> > --- a/tools/perf/arch/arm/util/Build
> > +++ b/tools/perf/arch/arm/util/Build
> > @@ -1,6 +1,5 @@
> >  perf-util-y +=3D perf_regs.o
> >
> >  perf-util-$(CONFIG_LOCAL_LIBUNWIND)    +=3D unwind-libunwind.o
> > -perf-util-$(CONFIG_LIBDW_DWARF_UNWIND) +=3D unwind-libdw.o
> >
> >  perf-util-y +=3D pmu.o auxtrace.o cs-etm.o
> > diff --git a/tools/perf/arch/arm64/util/Build b/tools/perf/arch/arm64/u=
til/Build
> > index d63881081d2eb1e9a83eabf82104d75308f7fc79..0177af19cc00038d6a60055=
92ddc530bf7eb1557 100644
> > --- a/tools/perf/arch/arm64/util/Build
> > +++ b/tools/perf/arch/arm64/util/Build
> > @@ -1,4 +1,3 @@
> > -perf-util-$(CONFIG_LIBDW_DWARF_UNWIND) +=3D unwind-libdw.o
> >  perf-util-$(CONFIG_LIBTRACEEVENT) +=3D kvm-stat.o
> >  perf-util-$(CONFIG_LOCAL_LIBUNWIND) +=3D unwind-libunwind.o
> >  perf-util-y +=3D ../../arm/util/auxtrace.o
> > diff --git a/tools/perf/arch/csky/util/Build b/tools/perf/arch/csky/uti=
l/Build
> > index 5e6ea82c42021d3d5651ca4c4a3a6e5138574e4e..6b2d0e021b11464e46d6b53=
974260d32ea969732 100644
> > --- a/tools/perf/arch/csky/util/Build
> > +++ b/tools/perf/arch/csky/util/Build
> > @@ -1,3 +1 @@
> >  perf-util-y +=3D perf_regs.o
> > -
> > -perf-util-$(CONFIG_LIBDW_DWARF_UNWIND) +=3D unwind-libdw.o
> > diff --git a/tools/perf/arch/powerpc/util/Build b/tools/perf/arch/power=
pc/util/Build
> > index 3d0d5427aef7f26a8c05c883cc7ad763f08cbb30..5fd28ec713a4db74ecd1d26=
866a65ddb20e94bd3 100644
> > --- a/tools/perf/arch/powerpc/util/Build
> > +++ b/tools/perf/arch/powerpc/util/Build
> > @@ -9,5 +9,4 @@ perf-util-y +=3D evsel.o
> >  perf-util-$(CONFIG_LIBDW) +=3D skip-callchain-idx.o
> >
> >  perf-util-$(CONFIG_LIBUNWIND) +=3D unwind-libunwind.o
> > -perf-util-$(CONFIG_LIBDW_DWARF_UNWIND) +=3D unwind-libdw.o
> >  perf-util-y +=3D auxtrace.o
> > diff --git a/tools/perf/arch/riscv/util/Build b/tools/perf/arch/riscv/u=
til/Build
> > index 58a672246024dd0f72e767d11e9958bd9913ec3c..628b9ebd418bde8cdf1ab13=
32bf79f7c9d50760e 100644
> > --- a/tools/perf/arch/riscv/util/Build
> > +++ b/tools/perf/arch/riscv/util/Build
> > @@ -2,4 +2,3 @@ perf-util-y +=3D perf_regs.o
> >  perf-util-y +=3D header.o
> >
> >  perf-util-$(CONFIG_LIBTRACEEVENT) +=3D kvm-stat.o
> > -perf-util-$(CONFIG_LIBDW_DWARF_UNWIND) +=3D unwind-libdw.o
> > diff --git a/tools/perf/arch/s390/util/Build b/tools/perf/arch/s390/uti=
l/Build
> > index c64eb18dbdae93adafabf8542e4c9a763ecfe057..5391d26fedd46b7d30a1bef=
0bff2ec2d58ec30ed 100644
> > --- a/tools/perf/arch/s390/util/Build
> > +++ b/tools/perf/arch/s390/util/Build
> > @@ -2,8 +2,6 @@ perf-util-y +=3D header.o
> >  perf-util-$(CONFIG_LIBTRACEEVENT) +=3D kvm-stat.o
> >  perf-util-y +=3D perf_regs.o
> >
> > -perf-util-$(CONFIG_LIBDW_DWARF_UNWIND) +=3D unwind-libdw.o
> > -
> >  perf-util-y +=3D machine.o
> >  perf-util-y +=3D pmu.o
> >
> > diff --git a/tools/perf/arch/x86/util/Build b/tools/perf/arch/x86/util/=
Build
> > index c0dc5965f3624a6f02525a04d287dff755356d20..fad256252bb95a8f8350b6b=
b1a54e8074eaebbec 100644
> > --- a/tools/perf/arch/x86/util/Build
> > +++ b/tools/perf/arch/x86/util/Build
> > @@ -12,7 +12,6 @@ perf-util-y +=3D evsel.o
> >  perf-util-y +=3D iostat.o
> >
> >  perf-util-$(CONFIG_LOCAL_LIBUNWIND)    +=3D unwind-libunwind.o
> > -perf-util-$(CONFIG_LIBDW_DWARF_UNWIND) +=3D unwind-libdw.o
> >
> >  perf-util-y +=3D auxtrace.o
> >  perf-util-y +=3D archinsn.o
> > diff --git a/tools/perf/util/Build b/tools/perf/util/Build
> > index 1c2a43e1dc68e7f751ec6082352b10de9ffeea62..15f8a4f4b24a46b6300e824=
f672dd9c0d5b7865f 100644
> > --- a/tools/perf/util/Build
> > +++ b/tools/perf/util/Build
> > @@ -226,6 +226,7 @@ perf-util-$(CONFIG_LIBDW) +=3D debuginfo.o
> >  perf-util-$(CONFIG_LIBDW) +=3D annotate-data.o
> >
> >  perf-util-$(CONFIG_LIBDW_DWARF_UNWIND) +=3D unwind-libdw.o
> > +perf-util-$(CONFIG_LIBDW_DWARF_UNWIND) +=3D unwind-libdw-arch/
> >  perf-util-$(CONFIG_LOCAL_LIBUNWIND)    +=3D unwind-libunwind-local.o
> >  perf-util-$(CONFIG_LIBUNWIND)          +=3D unwind-libunwind.o
> >  perf-util-$(CONFIG_LIBUNWIND_X86)      +=3D libunwind/x86_32.o
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
>
> Please fix.  And I think they can be simply perf-util-y at this point
> since you added the directory with CONFIG_LIBDW_DWARF_UNWIND in the
> Build file in the parent directory.

Will fix in the next version.

>
>
> > diff --git a/tools/perf/arch/arm/util/unwind-libdw.c b/tools/perf/util/=
unwind-libdw-arch/unwind-libdw-arm.c
> > similarity index 78%
> > rename from tools/perf/arch/arm/util/unwind-libdw.c
> > rename to tools/perf/util/unwind-libdw-arch/unwind-libdw-arm.c
> > index fbb643f224ec4b27ce9d67051fe0bc4ad555b05e..3c7f91a1af7416f57b0e4fa=
0dcd15a530cb44f8a 100644
> > --- a/tools/perf/arch/arm/util/unwind-libdw.c
> > +++ b/tools/perf/util/unwind-libdw-arch/unwind-libdw-arm.c
> > @@ -1,11 +1,11 @@
> >  // SPDX-License-Identifier: GPL-2.0
> >  #include <elfutils/libdwfl.h>
> > -#include "perf_regs.h"
> > -#include "../../../util/unwind-libdw.h"
> > -#include "../../../util/perf_regs.h"
> > -#include "../../../util/sample.h"
> > +#include "../../../arch/arm/include/uapi/asm/perf_regs.h"
> > +#include "../../util/unwind-libdw.h"
> > +#include "../../util/perf_regs.h"
> > +#include "../../util/sample.h"
>
> I think it'd be simpler if we assume the include path always starts from
> tools/perf directory (which is set with -I already).  Then we don't need
> to change the relative paths when we move files around.

Will fix in the next version.

>
> Thanks,
> Namhyung
>
> >
> > -bool libdw__arch_set_initial_registers(Dwfl_Thread *thread, void *arg)
> > +bool libdw_set_initial_registers_arm(Dwfl_Thread *thread, void *arg)
> >  {
> >       struct unwind_info *ui =3D arg;
> >       struct regs_dump *user_regs =3D perf_sample__user_regs(ui->sample=
);
> > diff --git a/tools/perf/arch/arm64/util/unwind-libdw.c b/tools/perf/uti=
l/unwind-libdw-arch/unwind-libdw-arm64.c
> > similarity index 86%
> > rename from tools/perf/arch/arm64/util/unwind-libdw.c
> > rename to tools/perf/util/unwind-libdw-arch/unwind-libdw-arm64.c
> > index b89b0a7e5ad919fed23643d219fbdc3d84deff1e..a237af99d1f87a72b99d5ed=
2ff965d4ef2f75434 100644
> > --- a/tools/perf/arch/arm64/util/unwind-libdw.c
> > +++ b/tools/perf/util/unwind-libdw-arch/unwind-libdw-arm64.c
> > @@ -1,11 +1,11 @@
> >  // SPDX-License-Identifier: GPL-2.0
> >  #include <elfutils/libdwfl.h>
> > -#include "perf_regs.h"
> > -#include "../../../util/unwind-libdw.h"
> > -#include "../../../util/perf_regs.h"
> > -#include "../../../util/sample.h"
> > +#include "../../../arch/arm64/include/uapi/asm/perf_regs.h"
> > +#include "../../util/unwind-libdw.h"
> > +#include "../../util/perf_regs.h"
> > +#include "../../util/sample.h"
> >
> > -bool libdw__arch_set_initial_registers(Dwfl_Thread *thread, void *arg)
> > +bool libdw_set_initial_registers_arm64(Dwfl_Thread *thread, void *arg)
> >  {
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
> >  // Copyright (C) 2019 Hangzhou C-SKY Microsystems co.,ltd.
> >
> >  #include <elfutils/libdwfl.h>
> > -#include "perf_regs.h"
> > +#include "../../../arch/csky/include/uapi/asm/perf_regs.h"
> >  #include "../../util/unwind-libdw.h"
> >  #include "../../util/perf_regs.h"
> > -#include "../../util/event.h"
> > +#include "../../util/sample.h"
> >
> > -bool libdw__arch_set_initial_registers(Dwfl_Thread *thread, void *arg)
> > +bool libdw_set_initial_registers_csky(Dwfl_Thread *thread, void *arg)
> >  {
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
> >  /* Copyright (C) 2020-2023 Loongson Technology Corporation Limited */
> >
> >  #include <elfutils/libdwfl.h>
> > -#include "perf_regs.h"
> > +#include "../../../arch/loongarch/include/uapi/asm/perf_regs.h"
> >  #include "../../util/unwind-libdw.h"
> >  #include "../../util/perf_regs.h"
> >  #include "../../util/sample.h"
> >
> > -bool libdw__arch_set_initial_registers(Dwfl_Thread *thread, void *arg)
> > +bool libdw_set_initial_registers_loongarch(Dwfl_Thread *thread, void *=
arg)
> >  {
> >       struct unwind_info *ui =3D arg;
> >       struct regs_dump *user_regs =3D perf_sample__user_regs(ui->sample=
);
> > diff --git a/tools/perf/arch/powerpc/util/unwind-libdw.c b/tools/perf/u=
til/unwind-libdw-arch/unwind-libdw-powerpc.c
> > similarity index 88%
> > rename from tools/perf/arch/powerpc/util/unwind-libdw.c
> > rename to tools/perf/util/unwind-libdw-arch/unwind-libdw-powerpc.c
> > index 82d0c28ae3459ecdb0039cac1f534420d142739b..d5012f20a87e30809b8b44e=
e20572fab8668b7dd 100644
> > --- a/tools/perf/arch/powerpc/util/unwind-libdw.c
> > +++ b/tools/perf/util/unwind-libdw-arch/unwind-libdw-powerpc.c
> > @@ -1,10 +1,10 @@
> >  // SPDX-License-Identifier: GPL-2.0
> >  #include <elfutils/libdwfl.h>
> >  #include <linux/kernel.h>
> > -#include "perf_regs.h"
> > -#include "../../../util/unwind-libdw.h"
> > -#include "../../../util/perf_regs.h"
> > -#include "../../../util/sample.h"
> > +#include "../../../arch/powerpc/include/uapi/asm/perf_regs.h"
> > +#include "../../util/unwind-libdw.h"
> > +#include "../../util/perf_regs.h"
> > +#include "../../util/sample.h"
> >
> >  /* See backends/ppc_initreg.c and backends/ppc_regs.c in elfutils.  */
> >  static const int special_regs[3][2] =3D {
> > @@ -13,7 +13,7 @@ static const int special_regs[3][2] =3D {
> >       { 109, PERF_REG_POWERPC_CTR },
> >  };
> >
> > -bool libdw__arch_set_initial_registers(Dwfl_Thread *thread, void *arg)
> > +bool libdw_set_initial_registers_powerpc(Dwfl_Thread *thread, void *ar=
g)
> >  {
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
> >  /* Copyright (C) 2019 Hangzhou C-SKY Microsystems co.,ltd. */
> >
> >  #include <elfutils/libdwfl.h>
> > -#include "perf_regs.h"
> > +#include "../../../arch/riscv/include/uapi/asm/perf_regs.h"
> >  #include "../../util/unwind-libdw.h"
> >  #include "../../util/perf_regs.h"
> >  #include "../../util/sample.h"
> >
> > -bool libdw__arch_set_initial_registers(Dwfl_Thread *thread, void *arg)
> > +bool libdw_set_initial_registers_riscv(Dwfl_Thread *thread, void *arg)
> >  {
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
> >  #include "../../util/perf_regs.h"
> >  #include "../../util/event.h"
> >  #include "../../util/sample.h"
> > -#include "dwarf-regs-table.h"
> > -#include "perf_regs.h"
> > +#include "../../arch/s390/include/dwarf-regs-table.h"
> > +#include "../../../arch/s390/include/uapi/asm/perf_regs.h"
> >
> >
> > -bool libdw__arch_set_initial_registers(Dwfl_Thread *thread, void *arg)
> > +bool libdw_set_initial_registers_s390(Dwfl_Thread *thread, void *arg)
> >  {
> >       struct unwind_info *ui =3D arg;
> >       struct regs_dump *user_regs =3D perf_sample__user_regs(ui->sample=
);
> > diff --git a/tools/perf/arch/x86/util/unwind-libdw.c b/tools/perf/util/=
unwind-libdw-arch/unwind-libdw-x86.c
> > similarity index 86%
> > rename from tools/perf/arch/x86/util/unwind-libdw.c
> > rename to tools/perf/util/unwind-libdw-arch/unwind-libdw-x86.c
> > index 798493e887d7308cb293e29e4ba11054d0fda722..6619c60728ef6ad1e725cd8=
6c7bcbf06b8aad28d 100644
> > --- a/tools/perf/arch/x86/util/unwind-libdw.c
> > +++ b/tools/perf/util/unwind-libdw-arch/unwind-libdw-x86.c
> > @@ -1,11 +1,11 @@
> >  // SPDX-License-Identifier: GPL-2.0
> >  #include <elfutils/libdwfl.h>
> > -#include "perf_regs.h"
> > -#include "../../../util/unwind-libdw.h"
> > -#include "../../../util/perf_regs.h"
> > +#include "../../../arch/x86/include/uapi/asm/perf_regs.h"
> > +#include "../../util/unwind-libdw.h"
> > +#include "../../util/perf_regs.h"
> >  #include "util/sample.h"
> >
> > -bool libdw__arch_set_initial_registers(Dwfl_Thread *thread, void *arg)
> > +bool libdw_set_initial_registers_x86(Dwfl_Thread *thread, void *arg)
> >  {
> >       struct unwind_info *ui =3D arg;
> >       struct regs_dump *user_regs =3D perf_sample__user_regs(ui->sample=
);
> > diff --git a/tools/perf/util/unwind-libdw.c b/tools/perf/util/unwind-li=
bdw.c
> > index ae70fb56a05729b9f06a411d162eabebbf29ac52..f32694ff4ea52d4bf80a384=
05341864e7ff5e6c8 100644
> > --- a/tools/perf/util/unwind-libdw.c
> > +++ b/tools/perf/util/unwind-libdw.c
> > @@ -225,11 +225,45 @@ static bool memory_read(Dwfl *dwfl __maybe_unused=
, Dwarf_Addr addr, Dwarf_Word *
> >       return true;
> >  }
> >
> > -static const Dwfl_Thread_Callbacks callbacks =3D {
> > -     .next_thread            =3D next_thread,
> > -     .memory_read            =3D memory_read,
> > -     .set_initial_registers  =3D libdw__arch_set_initial_registers,
> > -};
> > +#define DEFINE_DWFL_THREAD_CALLBACKS(arch)                           \
> > +static const Dwfl_Thread_Callbacks callbacks_##arch =3D {             =
 \
> > +     .next_thread           =3D next_thread,                        \
> > +     .memory_read           =3D memory_read,                        \
> > +     .set_initial_registers =3D libdw_set_initial_registers_##arch, \
> > +}
> > +
> > +DEFINE_DWFL_THREAD_CALLBACKS(x86);
> > +DEFINE_DWFL_THREAD_CALLBACKS(arm);
> > +DEFINE_DWFL_THREAD_CALLBACKS(arm64);
> > +DEFINE_DWFL_THREAD_CALLBACKS(csky);
> > +DEFINE_DWFL_THREAD_CALLBACKS(loongarch);
> > +DEFINE_DWFL_THREAD_CALLBACKS(powerpc);
> > +DEFINE_DWFL_THREAD_CALLBACKS(riscv);
> > +DEFINE_DWFL_THREAD_CALLBACKS(s390);
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
> >
> >  static int
> >  frame_callback(Dwfl_Frame *state, void *arg)
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
> >  struct perf_sample;
> >  struct thread;
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
> >  struct unwind_info {
> >       Dwfl                    *dwfl;
> >
> > ---
> > base-commit: cbd41c6d4c26c161a2b0e70ad411d3885ff13507
> > change-id: 20260105-cross-arch-unwind-7238af40fb14
> >
> > Best regards,
> > --
> > Shimin Guo <shimin.guo@skydio.com>
> >
> >

