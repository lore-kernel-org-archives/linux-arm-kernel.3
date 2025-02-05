Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E8C2C02196
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 00:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MpTKFbLMSoKrPhXAQQBFXwIc5BgdqJVRd6V21V7NRDM=; b=S2iSm4XzLsj7Ps1A2xc36bemu5
	EejPCtKLbtVgrNZEO87a/vGrmH373sBs3Nq2JmFqiG9/6zTy5cfdVHBm2IsPgfVO0xHNI3hCvayin
	g2uv+VwOAOvvFw+kZZktIvVhI/m+OniXaY8QB3gmX8lhMYLOEL7xqdNVk75aCaVwjS18BrQLQYl3P
	g4Mehd2KBeGYPAcuoJ3Tr36qIEL0WpQmkxHPicAb7AczNHBuvBk0LUW1QVfvM3greC/TsDRv0Zfk/
	0EqHWos11WE2NpoxkSUjrGPJNnLtWYX9E9t+619hiAH6PoOe1vD3VBBQ5huhyhQjIHDd9xnr7iBUO
	8+v4Py/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfT3Z-00000001trg-3O14;
	Wed, 05 Feb 2025 00:14:17 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfT1c-00000001thy-42Ua;
	Wed, 05 Feb 2025 00:12:18 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-6ef7c9e9592so45886827b3.1;
        Tue, 04 Feb 2025 16:12:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738714335; x=1739319135; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MpTKFbLMSoKrPhXAQQBFXwIc5BgdqJVRd6V21V7NRDM=;
        b=FYRhb0l0vtOrbjcxZNHh47uTQSZAsQRa0zFpbPSpWj5Mjt4CvWjfrVjX9q5Mp0woce
         /OeMS3M8S+TjvX3Z1jWuG22lgwz9GUY0Xn5ORyE3kPZInBEvg1jQpCtw+xdw0LlUPKeS
         tzmM+Cz8Hy+SXn7aRhDCcNHWp4tNkAL+i0L4/8rOoHePJo2mcXhIQB09+J6BSe9n/ovH
         RU+WTfrOzQinNFeVnCnVfC2ci7aEhpPT6EzYrrgGzYfXh3CK9y1mEpFpxhEZmesOS3bu
         YFPPaN7h6jWTusVDKUdYiOP3/BESDhceG90iz6PKPXM2Bpq6vEhEOCarx1vo9TFV3iXd
         9kEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738714335; x=1739319135;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MpTKFbLMSoKrPhXAQQBFXwIc5BgdqJVRd6V21V7NRDM=;
        b=F5JVOFcxFsZZDoCpLaJ6Yxe+76Wp1y0r03J69FlLSr0cLP2mbVDkXsG2VdTbz8fFZq
         /KTMB8aIMRiAO6HDJDfGkSsopn/AGwXcTKxFpVH3d0kY0uhfTQmt707nu3sCWHWkeZZY
         UL9ZG8Yq1UIKdAbLlWhmN8K24nFIY/6HuK5nBf9Lmt2ovAzalNaB6P8Ysa68SUuSGQG1
         uT+aV5H+KaPkzLS8/JC0ba9h+0G1i1DHI0E95MzBswTwqaC/F6oe3tQqs48ka+ZAG/go
         FdO317G6BdJy72cngna1fQI7rSRSOKCnz81icyatWxplN2x8Z2a2qFPrpnaT8R7IpLqI
         QRYg==
X-Forwarded-Encrypted: i=1; AJvYcCVAwZEa8blNoiASteUgItp7vG4ZiahWBtvOG6cJxgNuuRRu/ZdRtunX3/KuiL0kwCLa/U4JAkscMsEjzhRNSzzs@lists.infradead.org, AJvYcCX4DQNAtbZGfIBuAAYvdL6+zI6QrdjJR63jFqXd9FV5geq2CYgjPwHqpeiuZPkE/5N81UMC9TsuJm2R60A=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzt7XGlNO7mNPJwHAqlNpwOnHOEyDOvAU1jCmB106seCG/sMMgp
	TljK9aIdqD48U4xQs4wsNDzchZMTysj3Nf4oyJR7kMlQi1yIQ6Urh2cTdihLVFW8P5h7ah6xbQu
	hHcG4V2Ybr9Jb2TcCnmAD6wq8PPU=
X-Gm-Gg: ASbGnct4y7gXLZQfm+7HpUh5Lmtd3EqsEaIhAsCkjDH1pwtFETGphnYpwJNzJpzaE/1
	Gz9SyzbozBQnkUFDM+uNv5sEQZQizNXxVTKbgRiABOXgsKFw2mYptcl2xW2U+N3FSnUzhKM8=
X-Google-Smtp-Source: AGHT+IHZDxWlHKGGnBPgCLgl8zvxhRaHlC2bhE3+pL8he5Wjieca/BQSaBN5v36SLdGsq1w/fGUvHTp8rgDgGCRQniE=
X-Received: by 2002:a05:690c:3385:b0:6f9:7d7d:a725 with SMTP id
 00721157ae682-6f989f86a5bmr8707697b3.33.1738714334971; Tue, 04 Feb 2025
 16:12:14 -0800 (PST)
MIME-Version: 1.0
References: <20250201071455.718247-1-irogers@google.com> <20250201071455.718247-3-irogers@google.com>
In-Reply-To: <20250201071455.718247-3-irogers@google.com>
From: Howard Chu <howardchu95@gmail.com>
Date: Tue, 4 Feb 2025 16:12:04 -0800
X-Gm-Features: AWEUYZnrLPcAVatH_8hMj0vAgavMm9A_MK2I4QgLyTsUdL2nS8yu-yE3h7vkFJU
Message-ID: <CAH0uvogeG9rUw+1huquE=8fEq8AdJaSygS94G8a05=cHckjndg@mail.gmail.com>
Subject: Re: [PATCH v1 2/7] perf trace: Reorganize syscalls
To: Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
	James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>, 
	Leo Yan <leo.yan@linux.dev>, Guo Ren <guoren@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Charlie Jenkins <charlie@rivosinc.com>, 
	Bibo Mao <maobibo@loongson.cn>, Arnd Bergmann <arnd@arndb.de>, Huacai Chen <chenhuacai@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Jiri Slaby <jirislaby@kernel.org>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_161217_011067_38AA987A 
X-CRM114-Status: GOOD (  32.45  )
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

Hello Ian,

Thanks for doing this.

On Fri, Jan 31, 2025 at 11:15=E2=80=AFPM Ian Rogers <irogers@google.com> wr=
ote:
>
> Identify struct syscall information in the syscalls table by a machine
> type and syscall number, not just system call number. Having the
> machine type means that 32-bit system calls can be differentiated from
> 64-bit ones on a machine capable of both. Having a table for all
> machine types and all system call numbers would be too large, so
> maintain a sorted array of system calls as they are encountered.
>
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>  tools/perf/builtin-trace.c | 178 +++++++++++++++++++++++++------------
>  1 file changed, 119 insertions(+), 59 deletions(-)
>
> diff --git a/tools/perf/builtin-trace.c b/tools/perf/builtin-trace.c
> index ac97632f13dc..10d3ad0d21f7 100644
> --- a/tools/perf/builtin-trace.c
> +++ b/tools/perf/builtin-trace.c
> @@ -66,6 +66,7 @@
>  #include "rb_resort.h"
>  #include "../perf.h"
>  #include "trace_augment.h"
> +#include "dwarf-regs.h"
>
>  #include <errno.h>
>  #include <inttypes.h>
> @@ -86,6 +87,7 @@
>
>  #include <linux/ctype.h>
>  #include <perf/mmap.h>
> +#include <tools/libc_compat.h>
>
>  #ifdef HAVE_LIBTRACEEVENT
>  #include <event-parse.h>
> @@ -143,7 +145,10 @@ struct trace {
>         struct perf_tool        tool;
>         struct syscalltbl       *sctbl;
>         struct {
> +               /** Sorted sycall numbers used by the trace. */
>                 struct syscall  *table;
> +               /** Size of table. */
> +               size_t          table_size;
>                 struct {
>                         struct evsel *sys_enter,
>                                 *sys_exit,
> @@ -1445,22 +1450,37 @@ static const struct syscall_fmt *syscall_fmt__fin=
d_by_alias(const char *alias)
>         return __syscall_fmt__find_by_alias(syscall_fmts, nmemb, alias);
>  }
>
> -/*
> - * is_exit: is this "exit" or "exit_group"?
> - * is_open: is this "open" or "openat"? To associate the fd returned in =
sys_exit with the pathname in sys_enter.
> - * args_size: sum of the sizes of the syscall arguments, anything after =
that is augmented stuff: pathname for openat, etc.
> - * nonexistent: Just a hole in the syscall table, syscall id not allocat=
ed
> +/**
> + * struct syscall
>   */
>  struct syscall {
> +       /** @e_machine: The ELF machine associated with the entry. */
> +       int e_machine;
> +       /** @id: id value from the tracepoint, the system call number. */
> +       int id;
>         struct tep_event    *tp_format;
>         int                 nr_args;
> +       /**
> +        * @args_size: sum of the sizes of the syscall arguments, anythin=
g
> +        * after that is augmented stuff: pathname for openat, etc.
> +        */
> +
>         int                 args_size;
>         struct {
>                 struct bpf_program *sys_enter,
>                                    *sys_exit;
>         }                   bpf_prog;
> +       /** @is_exit: is this "exit" or "exit_group"? */
>         bool                is_exit;
> +       /**
> +        * @is_open: is this "open" or "openat"? To associate the fd retu=
rned in
> +        * sys_exit with the pathname in sys_enter.
> +        */
>         bool                is_open;
> +       /**
> +        * @nonexistent: Name lookup failed. Just a hole in the syscall t=
able,
> +        * syscall id not allocated.
> +        */
>         bool                nonexistent;
>         bool                use_btf;
>         struct tep_format_field *args;
> @@ -2066,22 +2086,21 @@ static int syscall__set_arg_fmts(struct syscall *=
sc)
>         return 0;
>  }
>
> -static int trace__read_syscall_info(struct trace *trace, int id)
> +static int syscall__read_info(struct syscall *sc, struct trace *trace)
>  {
>         char tp_name[128];
> -       struct syscall *sc;
> -       const char *name =3D syscalltbl__name(trace->sctbl, id);
> +       const char *name;
>         int err;
>
> -       if (trace->syscalls.table =3D=3D NULL) {
> -               trace->syscalls.table =3D calloc(trace->sctbl->syscalls.m=
ax_id + 1, sizeof(*sc));
> -               if (trace->syscalls.table =3D=3D NULL)
> -                       return -ENOMEM;
> -       }
> -       sc =3D trace->syscalls.table + id;
>         if (sc->nonexistent)
>                 return -EEXIST;
>
> +       if (sc->name) {
> +               /* Info already read. */
> +               return 0;
> +       }
> +
> +       name =3D syscalltbl__name(trace->sctbl, sc->id);
>         if (name =3D=3D NULL) {
>                 sc->nonexistent =3D true;
>                 return -EEXIST;
> @@ -2104,11 +2123,12 @@ static int trace__read_syscall_info(struct trace =
*trace, int id)
>          */
>         if (IS_ERR(sc->tp_format)) {
>                 sc->nonexistent =3D true;
> -               return PTR_ERR(sc->tp_format);
> +               err =3D PTR_ERR(sc->tp_format);
> +               sc->tp_format =3D NULL;
> +               return err;
>         }
>
> -       if (syscall__alloc_arg_fmts(sc, IS_ERR(sc->tp_format) ?
> -                                       RAW_SYSCALL_ARGS_NUM : sc->tp_for=
mat->format.nr_fields))
> +       if (syscall__alloc_arg_fmts(sc, sc->tp_format->format.nr_fields))

Makes sense because IS_ERR(sc->tp_format) is checked a few lines
above. However, nr_fields can be 7 with the __syscall_nr prefix. I
sent a patch to fix this, but it's not included here... Never mind,
it's off-topic. This patch looks good.

Thanks,
Howard

>                 return -ENOMEM;
>
>         sc->args =3D sc->tp_format->format.fields;
> @@ -2397,13 +2417,67 @@ static size_t syscall__scnprintf_args(struct sysc=
all *sc, char *bf, size_t size,
>         return printed;
>  }
>
> +static void syscall__init(struct syscall *sc, int e_machine, int id)
> +{
> +       memset(sc, 0, sizeof(*sc));
> +       sc->e_machine =3D e_machine;
> +       sc->id =3D id;
> +}
> +
> +static void syscall__exit(struct syscall *sc)
> +{
> +       if (!sc)
> +               return;
> +
> +       zfree(&sc->arg_fmt);
> +}
> +
> +static int syscall__cmp(const void *va, const void *vb)
> +{
> +       const struct syscall *a =3D va, *b =3D vb;
> +
> +       if (a->e_machine !=3D b->e_machine)
> +               return a->e_machine - b->e_machine;
> +
> +       return a->id - b->id;
> +}
> +
> +static struct syscall *trace__find_syscall(struct trace *trace, int e_ma=
chine, int id)
> +{
> +       struct syscall key =3D {
> +               .e_machine =3D e_machine,
> +               .id =3D id,
> +       };
> +       struct syscall *sc, *tmp;
> +
> +       sc =3D bsearch(&key, trace->syscalls.table, trace->syscalls.table=
_size,
> +                    sizeof(struct syscall), syscall__cmp);
> +       if (sc)
> +               return sc;
> +
> +       tmp =3D reallocarray(trace->syscalls.table, trace->syscalls.table=
_size + 1,
> +                          sizeof(struct syscall));
> +       if (!tmp)
> +               return NULL;
> +
> +       trace->syscalls.table =3D tmp;
> +       sc =3D &trace->syscalls.table[trace->syscalls.table_size++];
> +       syscall__init(sc, e_machine, id);
> +       qsort(trace->syscalls.table, trace->syscalls.table_size, sizeof(s=
truct syscall),
> +             syscall__cmp);
> +       sc =3D bsearch(&key, trace->syscalls.table, trace->syscalls.table=
_size,
> +                    sizeof(struct syscall), syscall__cmp);
> +       return sc;
> +}
> +
>  typedef int (*tracepoint_handler)(struct trace *trace, struct evsel *evs=
el,
>                                   union perf_event *event,
>                                   struct perf_sample *sample);
>
> -static struct syscall *trace__syscall_info(struct trace *trace,
> -                                          struct evsel *evsel, int id)
> +static struct syscall *trace__syscall_info(struct trace *trace, struct e=
vsel *evsel,
> +                                          int e_machine, int id)
>  {
> +       struct syscall *sc;
>         int err =3D 0;
>
>         if (id < 0) {
> @@ -2428,28 +2502,20 @@ static struct syscall *trace__syscall_info(struct=
 trace *trace,
>
>         err =3D -EINVAL;
>
> -       if (id > trace->sctbl->syscalls.max_id) {
> -               goto out_cant_read;
> -       }
> -
> -       if ((trace->syscalls.table =3D=3D NULL || trace->syscalls.table[i=
d].name =3D=3D NULL) &&
> -           (err =3D trace__read_syscall_info(trace, id)) !=3D 0)
> -               goto out_cant_read;
> +       sc =3D trace__find_syscall(trace, e_machine, id);
> +       if (sc)
> +               err =3D syscall__read_info(sc, trace);
>
> -       if (trace->syscalls.table && trace->syscalls.table[id].nonexisten=
t)
> -               goto out_cant_read;
> -
> -       return &trace->syscalls.table[id];
> -
> -out_cant_read:
> -       if (verbose > 0) {
> +       if (err && verbose > 0) {
>                 char sbuf[STRERR_BUFSIZE];
> -               fprintf(trace->output, "Problems reading syscall %d: %d (=
%s)", id, -err, str_error_r(-err, sbuf, sizeof(sbuf)));
> -               if (id <=3D trace->sctbl->syscalls.max_id && trace->sysca=
lls.table[id].name !=3D NULL)
> -                       fprintf(trace->output, "(%s)", trace->syscalls.ta=
ble[id].name);
> +
> +               fprintf(trace->output, "Problems reading syscall %d: %d (=
%s)", id, -err,
> +                       str_error_r(-err, sbuf, sizeof(sbuf)));
> +               if (sc && sc->name)
> +                       fprintf(trace->output, "(%s)", sc->name);
>                 fputs(" information\n", trace->output);
>         }
> -       return NULL;
> +       return err ? NULL : sc;
>  }
>
>  struct syscall_stats {
> @@ -2596,14 +2662,6 @@ static void *syscall__augmented_args(struct syscal=
l *sc, struct perf_sample *sam
>         return NULL;
>  }
>
> -static void syscall__exit(struct syscall *sc)
> -{
> -       if (!sc)
> -               return;
> -
> -       zfree(&sc->arg_fmt);
> -}
> -
>  static int trace__sys_enter(struct trace *trace, struct evsel *evsel,
>                             union perf_event *event __maybe_unused,
>                             struct perf_sample *sample)
> @@ -2615,7 +2673,7 @@ static int trace__sys_enter(struct trace *trace, st=
ruct evsel *evsel,
>         int id =3D perf_evsel__sc_tp_uint(evsel, id, sample), err =3D -1;
>         int augmented_args_size =3D 0;
>         void *augmented_args =3D NULL;
> -       struct syscall *sc =3D trace__syscall_info(trace, evsel, id);
> +       struct syscall *sc =3D trace__syscall_info(trace, evsel, EM_HOST,=
 id);
>         struct thread_trace *ttrace;
>
>         if (sc =3D=3D NULL)
> @@ -2689,7 +2747,7 @@ static int trace__fprintf_sys_enter(struct trace *t=
race, struct evsel *evsel,
>         struct thread_trace *ttrace;
>         struct thread *thread;
>         int id =3D perf_evsel__sc_tp_uint(evsel, id, sample), err =3D -1;
> -       struct syscall *sc =3D trace__syscall_info(trace, evsel, id);
> +       struct syscall *sc =3D trace__syscall_info(trace, evsel, EM_HOST,=
 id);
>         char msg[1024];
>         void *args, *augmented_args =3D NULL;
>         int augmented_args_size;
> @@ -2764,7 +2822,7 @@ static int trace__sys_exit(struct trace *trace, str=
uct evsel *evsel,
>         struct thread *thread;
>         int id =3D perf_evsel__sc_tp_uint(evsel, id, sample), err =3D -1,=
 callchain_ret =3D 0, printed =3D 0;
>         int alignment =3D trace->args_alignment;
> -       struct syscall *sc =3D trace__syscall_info(trace, evsel, id);
> +       struct syscall *sc =3D trace__syscall_info(trace, evsel, EM_HOST,=
 id);
>         struct thread_trace *ttrace;
>
>         if (sc =3D=3D NULL)
> @@ -3117,7 +3175,7 @@ static int trace__event_handler(struct trace *trace=
, struct evsel *evsel,
>
>         if (evsel =3D=3D trace->syscalls.events.bpf_output) {
>                 int id =3D perf_evsel__sc_tp_uint(evsel, id, sample);
> -               struct syscall *sc =3D trace__syscall_info(trace, evsel, =
id);
> +               struct syscall *sc =3D trace__syscall_info(trace, evsel, =
EM_HOST, id);
>
>                 if (sc) {
>                         fprintf(trace->output, "%s(", sc->name);
> @@ -3622,7 +3680,7 @@ static struct bpf_program *trace__find_syscall_bpf_=
prog(struct trace *trace, str
>
>  static void trace__init_syscall_bpf_progs(struct trace *trace, int id)
>  {
> -       struct syscall *sc =3D trace__syscall_info(trace, NULL, id);
> +       struct syscall *sc =3D trace__syscall_info(trace, NULL, EM_HOST, =
id);
>
>         if (sc =3D=3D NULL)
>                 return;
> @@ -3633,20 +3691,20 @@ static void trace__init_syscall_bpf_progs(struct =
trace *trace, int id)
>
>  static int trace__bpf_prog_sys_enter_fd(struct trace *trace, int id)
>  {
> -       struct syscall *sc =3D trace__syscall_info(trace, NULL, id);
> +       struct syscall *sc =3D trace__syscall_info(trace, NULL, EM_HOST, =
id);
>         return sc ? bpf_program__fd(sc->bpf_prog.sys_enter) : bpf_program=
__fd(trace->skel->progs.syscall_unaugmented);
>  }
>
>  static int trace__bpf_prog_sys_exit_fd(struct trace *trace, int id)
>  {
> -       struct syscall *sc =3D trace__syscall_info(trace, NULL, id);
> +       struct syscall *sc =3D trace__syscall_info(trace, NULL, EM_HOST, =
id);
>         return sc ? bpf_program__fd(sc->bpf_prog.sys_exit) : bpf_program_=
_fd(trace->skel->progs.syscall_unaugmented);
>  }
>
>  static int trace__bpf_sys_enter_beauty_map(struct trace *trace, int key,=
 unsigned int *beauty_array)
>  {
>         struct tep_format_field *field;
> -       struct syscall *sc =3D trace__syscall_info(trace, NULL, key);
> +       struct syscall *sc =3D trace__syscall_info(trace, NULL, EM_HOST, =
key);
>         const struct btf_type *bt;
>         char *struct_offset, *tmp, name[32];
>         bool can_augment =3D false;
> @@ -3744,7 +3802,7 @@ static struct bpf_program *trace__find_usable_bpf_p=
rog_entry(struct trace *trace
>  try_to_find_pair:
>         for (int i =3D 0; i < trace->sctbl->syscalls.nr_entries; ++i) {
>                 int id =3D syscalltbl__id_at_idx(trace->sctbl, i);
> -               struct syscall *pair =3D trace__syscall_info(trace, NULL,=
 id);
> +               struct syscall *pair =3D trace__syscall_info(trace, NULL,=
 EM_HOST, id);
>                 struct bpf_program *pair_prog;
>                 bool is_candidate =3D false;
>
> @@ -3894,7 +3952,7 @@ static int trace__init_syscalls_bpf_prog_array_maps=
(struct trace *trace)
>          */
>         for (int i =3D 0; i < trace->sctbl->syscalls.nr_entries; ++i) {
>                 int key =3D syscalltbl__id_at_idx(trace->sctbl, i);
> -               struct syscall *sc =3D trace__syscall_info(trace, NULL, k=
ey);
> +               struct syscall *sc =3D trace__syscall_info(trace, NULL, E=
M_HOST, key);
>                 struct bpf_program *pair_prog;
>                 int prog_fd;
>
> @@ -4659,7 +4717,11 @@ static size_t thread__dump_stats(struct thread_tra=
ce *ttrace,
>                         pct =3D avg ? 100.0 * stddev_stats(&stats->stats)=
 / avg : 0.0;
>                         avg /=3D NSEC_PER_MSEC;
>
> -                       sc =3D &trace->syscalls.table[syscall_stats_entry=
->syscall];
> +                       sc =3D trace__syscall_info(trace, /*evsel=3D*/NUL=
L, EM_HOST,
> +                                                syscall_stats_entry->sys=
call);
> +                       if (!sc)
> +                               continue;
> +
>                         printed +=3D fprintf(fp, "   %-15s", sc->name);
>                         printed +=3D fprintf(fp, " %8" PRIu64 " %6" PRIu6=
4 " %9.3f %9.3f %9.3f",
>                                            n, stats->nr_failures, syscall=
_stats_entry->msecs, min, avg);
> @@ -5067,12 +5129,10 @@ static int trace__config(const char *var, const c=
har *value, void *arg)
>
>  static void trace__exit(struct trace *trace)
>  {
> -       int i;
> -
>         strlist__delete(trace->ev_qualifier);
>         zfree(&trace->ev_qualifier_ids.entries);
>         if (trace->syscalls.table) {
> -               for (i =3D 0; i <=3D trace->sctbl->syscalls.max_id; i++)
> +               for (size_t i =3D 0; i < trace->syscalls.table_size; i++)
>                         syscall__exit(&trace->syscalls.table[i]);
>                 zfree(&trace->syscalls.table);
>         }
> --
> 2.48.1.362.g079036d154-goog
>

