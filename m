Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5360C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 17:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fqIi3eUgcKuJONzezWaTQQ5R3JceKvZT0aW4EVwXeiM=; b=IeShxBK4C4+etkaXQytaFpKWhW
	QpWMJZlpTEFTEsKv1AuoVd2J9NC/GouDEDefNq8sXZKonod5QGbZ0s1n+CeI8lZlk9JjYH53MsS5q
	B3tcOrlDxD9aIP4tr6Wppksem8jOZ8WphNm+La/kkP6p6iiMadD9nUpi2ND4VjX2tA9Vt1vQ/HjNQ
	3StA+gkPofnJGvGO+BBwP6X7GvUiStLCUv7SCtygnH/7Cwz8+LOEazxRA2k4WVLnK69c7CivMTbCT
	5ps0urU9+jhVyfpB9lS9KuPU2VZ2kQZFnMANeSaegkcxUyeA6/dPOedU5snQPIppoQAJc2zca8piz
	bWmxH9rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqbcf-0000000F42i-1x5A;
	Fri, 07 Mar 2025 17:36:33 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqbYh-0000000F3Oe-3ZMH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 17:32:29 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-223a0da61easo915ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Mar 2025 09:32:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741368746; x=1741973546; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fqIi3eUgcKuJONzezWaTQQ5R3JceKvZT0aW4EVwXeiM=;
        b=2tzkNXikVivl7w170rYrQ5fBgAdbnt99Csam6V4Ayv7bi9gxe5b361+B79XAZUH53o
         pcGhp0tim9vsvEd4ozhOALEZG9LRA+04LO68bMcbNM+4eXBRkcbpRSqN+pgzGGXntAfg
         vV81jdE1jqo7vT/sxRlvs1TmGxvbncd3a3x+V/Ee5w7rRR1HZwNaLPl1C3BbQwCZ2Usj
         AGr1OwGDygD6eaQB0nZijNR2L6IRhEfX4ttE7Zu1CtlgmEDM1q6oWTYBW/JnwStOb2Kx
         J49wzzWif3sUCk8+glf2aVMPGVB1osGVRvlO/d3jLDaxpW5CSW0mi43eq/t6BAkmpsRG
         K+QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741368746; x=1741973546;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fqIi3eUgcKuJONzezWaTQQ5R3JceKvZT0aW4EVwXeiM=;
        b=azLdF4ktwu1hv6kagPhdXLrMlZHPlQwhJ6lVM7ya+eGhScKEMSawpG8V586LUAky4V
         53yoaVM+xseoYhzrlqvAH6++48dboSr3udvWB+Ll+bubIJWtBMK+GejkG4/G//z7WfJm
         /JrP0+c4xxPocK5btyJZJmOSfn52PMODF1ojt7hBP90HlZkhSmEa0WR2qPgxw2Xdpcmt
         wpLwvMAGYMAiUHrM9SRWGpbiPfUF/6RbSi+2FDxrOD5XvC5wLQB5DFfqQ+0mLAIrwZAD
         8O9MgnaTeXIx38DKsgi7Ywd8XmpzqUrvnG30vXNGK88kpnXcMg/l5NRfZ/O/qUUo2epD
         /S7w==
X-Forwarded-Encrypted: i=1; AJvYcCW/HIBYY4tdWa3YyoHMnOiFIVyK0YvXHhNJ6evuNRfx/k3QN2vwD4NBzhHX/7eGdza43smRfnn5l6T4jMTUG+V/@lists.infradead.org
X-Gm-Message-State: AOJu0Yw06e9axzthxrNykAwqZJomga3mJH7nE6Zep3/OdXAalhrkqyh2
	0C6NDqXHGokDzzCoZmZUqjKAQaJo7pAag8/3x7AkPDKc9NSNZDEi8PBuXGkdrNvAatCsaM66sEk
	zAaXP4sTURL4IXH+eGlyeBAq6Ak5u1v/aHcBP
X-Gm-Gg: ASbGncsrCPR9SJ7TVOfo4q17KMcqHMo7SdR4YCmxOjDEBJE8osls5eWVVa/ezOSyqHU
	9tAc7ntnLe1akk2z9d5QiNZWXrDiX3jEzRzrf5qp/n+jRohNs7NqGY1uM4EYAcmTwMXvTJRBU02
	+099R35EL1Q+4nFr5u7JapHZYFOps=
X-Google-Smtp-Source: AGHT+IFFpfCVIaBpSWKZFwIn7l+IfdxUPFNfLp51LskZyc/+m49bu6CbiATC948quvo165zd/aagrh0KZRAGge8PVew=
X-Received: by 2002:a17:902:ea08:b0:220:c905:689f with SMTP id
 d9443c01a7336-22434db57c2mr931045ad.25.1741368745951; Fri, 07 Mar 2025
 09:32:25 -0800 (PST)
MIME-Version: 1.0
References: <20250307153448.250871-1-acme@kernel.org>
In-Reply-To: <20250307153448.250871-1-acme@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Fri, 7 Mar 2025 09:32:14 -0800
X-Gm-Features: AQ5f1Jpeu53Av8JRCHrL53sKmcp1rYJ23clcd_69KjyKT-K0q8opkRjRdH0x8-I
Message-ID: <CAP-5=fUHozmMFVCX1Sn+4gsSkXQicLqYWHLrN2DSJgAGdnd0gA@mail.gmail.com>
Subject: Re: [PATCH 1/1 next] perf libunwind: Fixup conversion
 perf_sample->user_regs to a pointer
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Namhyung Kim <namhyung@kernel.org>, Ingo Molnar <mingo@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, James Clark <james.clark@linaro.org>, 
	Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Clark Williams <williams@redhat.com>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	Arnaldo Carvalho de Melo <acme@redhat.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Andi Kleen <ak@linux.intel.com>, Charlie Jenkins <charlie@rivosinc.com>, 
	Ingo Molnar <mingo@redhat.com>, John Garry <john.g.garry@oracle.com>, Leo Yan <leo.yan@linux.dev>, 
	Mark Rutland <mark.rutland@arm.com>, Michael Petlan <mpetlan@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Tavian Barnes <tavianator@tavianator.com>, 
	Veronika Molnarova <vmolnaro@redhat.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_093227_910724_5D99D57D 
X-CRM114-Status: GOOD (  24.57  )
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

On Fri, Mar 7, 2025 at 7:35=E2=80=AFAM Arnaldo Carvalho de Melo <acme@kerne=
l.org> wrote:
>
> From: Arnaldo Carvalho de Melo <acme@redhat.com>
>
> The dc6d2bc2d893a878 ("perf sample: Make user_regs and intr_regs optional=
") misses
> the changes to a file, resulting in this problem:
>
>   $ make LIBUNWIND=3D1 -C tools/perf O=3D/tmp/build/perf-tools-next insta=
ll-bin
>   <SNIP>
>     CC      /tmp/build/perf-tools-next/util/unwind-libunwind-local.o
>     CC      /tmp/build/perf-tools-next/util/unwind-libunwind.o
>   <SNIP>
>   util/unwind-libunwind-local.c: In function =E2=80=98access_mem=E2=80=99=
:
>   util/unwind-libunwind-local.c:582:56: error: =E2=80=98ui->sample->user_=
regs=E2=80=99 is a pointer; did you mean to use =E2=80=98->=E2=80=99?
>     582 |         if (__write || !stack || !ui->sample->user_regs.regs) {
>         |                                                        ^
>         |                                                        ->
>   util/unwind-libunwind-local.c:587:38: error: passing argument 2 of =E2=
=80=98perf_reg_value=E2=80=99 from incompatible pointer type [-Wincompatibl=
e-pointer-types]
>     587 |         ret =3D perf_reg_value(&start, &ui->sample->user_regs,
>         |                                      ^~~~~~~~~~~~~~~~~~~~~~
>         |                                      |
>         |                                      struct regs_dump **
> <SNIP>
>   =E2=AC=A2 [acme@toolbox perf-tools-next]$ git bisect bad
>   dc6d2bc2d893a878e7b58578ff01b4738708deb4 is the first bad commit
>   commit dc6d2bc2d893a878e7b58578ff01b4738708deb4 (HEAD)
>   Author: Ian Rogers <irogers@google.com>
>   Date:   Mon Jan 13 11:43:45 2025 -0800
>
>       perf sample: Make user_regs and intr_regs optional
>
> Detected using:
>
>   make -C tools/perf build-test
>
> Fixes: dc6d2bc2d893a878 ("perf sample: Make user_regs and intr_regs optio=
nal")
> Cc: Adrian Hunter <adrian.hunter@intel.com>
> Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>
> Cc: Andi Kleen <ak@linux.intel.com>
> Cc: Charlie Jenkins <charlie@rivosinc.com>
> Cc: Ian Rogers <irogers@google.com>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: James Clark <james.clark@linaro.org>
> Cc: John Garry <john.g.garry@oracle.com>
> Cc: Kan Liang <kan.liang@linux.intel.com>
> Cc: Leo Yan <leo.yan@linux.dev>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Michael Petlan <mpetlan@redhat.com>
> Cc: Namhyung Kim <namhyung@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Tavian Barnes <tavianator@tavianator.com>
> Cc: Veronika Molnarova <vmolnaro@redhat.com>
> Cc: coresight@lists.linaro.org
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>

Sorry for the breakage, thanks for fixing this!

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
>  tools/perf/util/unwind-libunwind-local.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/tools/perf/util/unwind-libunwind-local.c b/tools/perf/util/u=
nwind-libunwind-local.c
> index 16c2b03831f39afc..cc0e41f2c2f2ef10 100644
> --- a/tools/perf/util/unwind-libunwind-local.c
> +++ b/tools/perf/util/unwind-libunwind-local.c
> @@ -579,12 +579,12 @@ static int access_mem(unw_addr_space_t __maybe_unus=
ed as,
>         int ret;
>
>         /* Don't support write, probably not needed. */
> -       if (__write || !stack || !ui->sample->user_regs.regs) {
> +       if (__write || !stack || !ui->sample->user_regs->regs) {
>                 *valp =3D 0;
>                 return 0;
>         }
>
> -       ret =3D perf_reg_value(&start, &ui->sample->user_regs,
> +       ret =3D perf_reg_value(&start, perf_sample__user_regs(ui->sample)=
,
>                              perf_arch_reg_sp(arch));
>         if (ret)
>                 return ret;
> @@ -628,7 +628,7 @@ static int access_reg(unw_addr_space_t __maybe_unused=
 as,
>                 return 0;
>         }
>
> -       if (!ui->sample->user_regs.regs) {
> +       if (!ui->sample->user_regs->regs) {
>                 *valp =3D 0;
>                 return 0;
>         }
> @@ -637,7 +637,7 @@ static int access_reg(unw_addr_space_t __maybe_unused=
 as,
>         if (id < 0)
>                 return -EINVAL;
>
> -       ret =3D perf_reg_value(&val, &ui->sample->user_regs, id);
> +       ret =3D perf_reg_value(&val, perf_sample__user_regs(ui->sample), =
id);
>         if (ret) {
>                 if (!ui->best_effort)
>                         pr_err("unwind: can't read reg %d\n", regnum);
> @@ -741,7 +741,7 @@ static int get_entries(struct unwind_info *ui, unwind=
_entry_cb_t cb,
>         unw_cursor_t c;
>         int ret, i =3D 0;
>
> -       ret =3D perf_reg_value(&val, &ui->sample->user_regs,
> +       ret =3D perf_reg_value(&val, perf_sample__user_regs(ui->sample),
>                              perf_arch_reg_ip(arch));
>         if (ret)
>                 return ret;
> @@ -808,7 +808,7 @@ static int _unwind__get_entries(unwind_entry_cb_t cb,=
 void *arg,
>                 .best_effort  =3D best_effort
>         };
>
> -       if (!data->user_regs.regs)
> +       if (!data->user_regs->regs)
>                 return -EINVAL;
>
>         if (max_stack <=3D 0)
> --
> 2.47.0
>

