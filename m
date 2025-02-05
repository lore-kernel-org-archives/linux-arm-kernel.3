Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D89E0C02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 05:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hJTXV5yDycJv8raAF3uFNXNCVIK8L0Jn+Jz97vzfyAc=; b=yGzbbd7vmLglwpGLRvV3TuL9JQ
	VktpXvza9uiYxPhwxCzMOS430P89RSVyU6CdOCrTzCI1+muKf3b09K/KVfjQJoV4qB7mL6FnMQEAM
	wePse0yW0fxD0lxXCokdrE9WjEGq30GPNMURvZSYg3tf41UH0aGXXyjJJQP9aa6/p6fgFUis3o17d
	VrBspOAK2RppDON/OTvLJdalYqndGBbI4iCtynh9fihNjq05zmicIgXnEYkASVN9r69LqduQcgldx
	XdCFXhrEms0FGmri+8Y0TtAq8CQTJ2777kZw+H/aPRojibH/KO/ZBPaG6NcOHeN0Ti94g2ztHfjJ+
	aRsxnQIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfXh7-00000002KEO-3o4N;
	Wed, 05 Feb 2025 05:11:25 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfXfj-00000002K6z-1Csr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 05:10:01 +0000
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-3a9d0c28589so213715ab.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Feb 2025 21:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738732198; x=1739336998; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hJTXV5yDycJv8raAF3uFNXNCVIK8L0Jn+Jz97vzfyAc=;
        b=qrwNmo69kcI0FWMUALn5pnpqsaFqp7Qip8ovDazZuVLdPNOFR0us3SQFBZKS+ejEvS
         1aZFEKEs109HXExD8sJzp4CTCz22NLLZO1NokcaZj7DbdvFKENg70wYC7JvnkMk8M5q8
         +IB4TbZivGgVXu/jGosH2aWPSkFAeN4O+0zKWLVd/vNReGchrasZ4WiaBLh7BkiPJVeR
         daZHSvVsWmf5E9YuWtASmtj5i9X2OxzXacEdA1H6NiRB0oaFVfOxnFIYmiAcp2LSstw4
         G84szwf+8vj7y8xh/Sc/piUMoX++uRk1YvFIcP+/Sjh07r764ezlP7yd5bcQ0MbfugSI
         Smfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738732198; x=1739336998;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hJTXV5yDycJv8raAF3uFNXNCVIK8L0Jn+Jz97vzfyAc=;
        b=eLmie7n59psUBr+rr4YNqGecWxVJSHv6d+41KvCHuGteQ40rnaXkDqD7dCqnOqCj/K
         G5H7i8fgX7R8YAqYe3EyiMwWT7+wmJ3UTzK7lfZF9rH8pwtp6PQPFIg/9TUZ0cc08Cfx
         7RdsKLT1pXuGQ1lLAjbQxv5IJHlkMM3+RzT07SgYi1U55DaXhid0exDrhZ0da8fP1bEr
         NolaDuVNxIHybqupT5f5wyYa3Iy5xHsNbD+oRAG22RZfI5xDcntvKVAXyU0pSw4keZ1t
         zPs6/MkiaubPVdyG7NTeZ8o5dwwzTKUaZ9G5tyE17CIHh/H3DFOHP44ciPn0vJuU6ARj
         X/Qw==
X-Forwarded-Encrypted: i=1; AJvYcCVtTphJIKYe/mrI1iURRMl0meXDH5whVjgHlkHFKsWw/QN0crK8NGkrkn0T+LfFBn5JdvhsFEgVmR2PCBLajNuI@lists.infradead.org
X-Gm-Message-State: AOJu0YypWx4Y4cBlTz5g0d9ZovsNlkBYkCFSwyq0ozOW3B7Tsh3udfpf
	KHJTwZoTre+7LFJRqZANB5QzR4LUEEBTxbYs4kioxQbxR+/VZjovjuOBs2NC3ZevDieSxu2hfC8
	5+F2IGT2g88uji4DOQH2jHE6eQG0FU4zRA6Ot
X-Gm-Gg: ASbGncte4tMP2VeuTsyLw1bQRKd+EmhvmYSj1b4n81MhkxQwq5Wkf77B28CqIDwbfP9
	v2SBeq9pPWWnSyRmpo2rE7/cjQ9kuwG38UEvfcBPS8t59JEdW1EsAm2vgahw4rhZvat9JJqKPdA
	==
X-Google-Smtp-Source: AGHT+IFFGxxkYhMQKVfYDnm7XsyyRreWF85HLpXoENay+/diLyLSAteEHMQPK0Mtl3rY5ZU6wGPxFOo5w7eaD7uEgcE=
X-Received: by 2002:a05:6e02:de5:b0:3d0:51e0:14af with SMTP id
 e9e14a558f8ab-3d051e01979mr722355ab.10.1738732198047; Tue, 04 Feb 2025
 21:09:58 -0800 (PST)
MIME-Version: 1.0
References: <20250201071455.718247-1-irogers@google.com> <20250201071455.718247-4-irogers@google.com>
 <CAH0uvoi8J3mg8UxpiuHrCpH07jyGNkSfDFybs7EFcxgOoxYx7g@mail.gmail.com>
In-Reply-To: <CAH0uvoi8J3mg8UxpiuHrCpH07jyGNkSfDFybs7EFcxgOoxYx7g@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 4 Feb 2025 21:09:46 -0800
X-Gm-Features: AWEUYZmNUtmeqhYy_2pBb03-ke8v-cQ-bbjSct3xaz2BDX5EuOA3zo279OFHR34
Message-ID: <CAP-5=fVO9aQoCHKHud1GFQH9JnPEcPyU2d+3=_eMo1PJnmSTSQ@mail.gmail.com>
Subject: Re: [PATCH v1 3/7] perf syscalltbl: Remove struct syscalltbl
To: Howard Chu <howardchu95@gmail.com>
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
X-CRM114-CacheID: sfid-20250204_210959_346604_D6FE699F 
X-CRM114-Status: GOOD (  35.81  )
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

On Tue, Feb 4, 2025 at 4:18=E2=80=AFPM Howard Chu <howardchu95@gmail.com> w=
rote:
>
> Hello Ian,
>
> On Fri, Jan 31, 2025 at 11:15=E2=80=AFPM Ian Rogers <irogers@google.com> =
wrote:
> >
> > The syscalltbl held entries of system call name and number pairs,
> > generated from a native syscalltbl at start up. As there are gaps in
> > the system call number there is a notion of index into the
> > table. Going forward we want the system call table to be identifiable
> > by a machine type, for example, i386 vs x86-64. Change the interface
> > to the syscalltbl so (1) a (currently unused machine type of EM_HOST)
> > is passed (2) the index to syscall number and system call name mapping
> > is computed at build time.
> >
> > Two tables are used for this, an array of system call number to name,
> > an array of system call numbers sorted by the system call name. The
> > sorted array doesn't store strings in part to save memory and
> > relocations. The index notion is carried forward and is an index into
> > the sorted array of system call numbers, the data structures are
> > opaque (held only in syscalltbl.c), and so the number of indices for a
> > machine type is exposed as a new API.
> >
> > The arrays are computed in the syscalltbl.sh script and so no start-up
> > time computation and storage is necessary.
> >
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > ---
> >  tools/perf/builtin-trace.c       |  88 +++++++++++++-----------
> >  tools/perf/scripts/syscalltbl.sh |  36 ++++------
> >  tools/perf/util/syscalltbl.c     | 113 ++++++++++---------------------
> >  tools/perf/util/syscalltbl.h     |  22 ++----
> >  4 files changed, 103 insertions(+), 156 deletions(-)
> >
> > diff --git a/tools/perf/builtin-trace.c b/tools/perf/builtin-trace.c
> > index 10d3ad0d21f7..7e3aa2f6c5e2 100644
> > --- a/tools/perf/builtin-trace.c
> > +++ b/tools/perf/builtin-trace.c
> > @@ -143,7 +143,6 @@ struct syscall_fmt {
> >
> >  struct trace {
> >         struct perf_tool        tool;
> > -       struct syscalltbl       *sctbl;
> >         struct {
> >                 /** Sorted sycall numbers used by the trace. */
> >                 struct syscall  *table;
> > @@ -2100,7 +2099,7 @@ static int syscall__read_info(struct syscall *sc,=
 struct trace *trace)
> >                 return 0;
> >         }
> >
> > -       name =3D syscalltbl__name(trace->sctbl, sc->id);
> > +       name =3D syscalltbl__name(sc->e_machine, sc->id);
> >         if (name =3D=3D NULL) {
> >                 sc->nonexistent =3D true;
> >                 return -EEXIST;
> > @@ -2196,10 +2195,14 @@ static int trace__validate_ev_qualifier(struct =
trace *trace)
> >
> >         strlist__for_each_entry(pos, trace->ev_qualifier) {
> >                 const char *sc =3D pos->s;
> > -               int id =3D syscalltbl__id(trace->sctbl, sc), match_next=
 =3D -1;
> > +               /*
> > +                * TODO: Assume more than the validation/warnings are a=
ll for
> > +                * the same binary type as perf.
> > +                */
> > +               int id =3D syscalltbl__id(EM_HOST, sc), match_next =3D =
-1;
> >
> >                 if (id < 0) {
> > -                       id =3D syscalltbl__strglobmatch_first(trace->sc=
tbl, sc, &match_next);
> > +                       id =3D syscalltbl__strglobmatch_first(EM_HOST, =
sc, &match_next);
> >                         if (id >=3D 0)
> >                                 goto matches;
> >
> > @@ -2219,7 +2222,7 @@ static int trace__validate_ev_qualifier(struct tr=
ace *trace)
> >                         continue;
> >
> >                 while (1) {
> > -                       id =3D syscalltbl__strglobmatch_next(trace->sct=
bl, sc, &match_next);
> > +                       id =3D syscalltbl__strglobmatch_next(EM_HOST, s=
c, &match_next);
> >                         if (id < 0)
> >                                 break;
> >                         if (nr_allocated =3D=3D nr_used) {
> > @@ -2673,6 +2676,7 @@ static int trace__sys_enter(struct trace *trace, =
struct evsel *evsel,
> >         int id =3D perf_evsel__sc_tp_uint(evsel, id, sample), err =3D -=
1;
> >         int augmented_args_size =3D 0;
> >         void *augmented_args =3D NULL;
> > +       /* TODO: get e_machine from thread. */
> >         struct syscall *sc =3D trace__syscall_info(trace, evsel, EM_HOS=
T, id);
> >         struct thread_trace *ttrace;
> >
> > @@ -2747,6 +2751,7 @@ static int trace__fprintf_sys_enter(struct trace =
*trace, struct evsel *evsel,
> >         struct thread_trace *ttrace;
> >         struct thread *thread;
> >         int id =3D perf_evsel__sc_tp_uint(evsel, id, sample), err =3D -=
1;
> > +       /* TODO: get e_machine from thread. */
> >         struct syscall *sc =3D trace__syscall_info(trace, evsel, EM_HOS=
T, id);
> >         char msg[1024];
> >         void *args, *augmented_args =3D NULL;
> > @@ -2822,6 +2827,7 @@ static int trace__sys_exit(struct trace *trace, s=
truct evsel *evsel,
> >         struct thread *thread;
> >         int id =3D perf_evsel__sc_tp_uint(evsel, id, sample), err =3D -=
1, callchain_ret =3D 0, printed =3D 0;
> >         int alignment =3D trace->args_alignment;
> > +       /* TODO: get e_machine from thread. */
> >         struct syscall *sc =3D trace__syscall_info(trace, evsel, EM_HOS=
T, id);
> >         struct thread_trace *ttrace;
> >
> > @@ -3175,6 +3181,7 @@ static int trace__event_handler(struct trace *tra=
ce, struct evsel *evsel,
> >
> >         if (evsel =3D=3D trace->syscalls.events.bpf_output) {
> >                 int id =3D perf_evsel__sc_tp_uint(evsel, id, sample);
> > +               /* TODO: get e_machine from thread. */
> >                 struct syscall *sc =3D trace__syscall_info(trace, evsel=
, EM_HOST, id);
> >
> >                 if (sc) {
> > @@ -3678,9 +3685,9 @@ static struct bpf_program *trace__find_syscall_bp=
f_prog(struct trace *trace, str
> >         return trace->skel->progs.syscall_unaugmented;
> >  }
> >
> > -static void trace__init_syscall_bpf_progs(struct trace *trace, int id)
> > +static void trace__init_syscall_bpf_progs(struct trace *trace, int e_m=
achine, int id)
> >  {
> > -       struct syscall *sc =3D trace__syscall_info(trace, NULL, EM_HOST=
, id);
> > +       struct syscall *sc =3D trace__syscall_info(trace, NULL, e_machi=
ne, id);
> >
> >         if (sc =3D=3D NULL)
> >                 return;
> > @@ -3689,22 +3696,22 @@ static void trace__init_syscall_bpf_progs(struc=
t trace *trace, int id)
> >         sc->bpf_prog.sys_exit  =3D trace__find_syscall_bpf_prog(trace, =
sc, sc->fmt ? sc->fmt->bpf_prog_name.sys_exit  : NULL,  "exit");
> >  }
> >
> > -static int trace__bpf_prog_sys_enter_fd(struct trace *trace, int id)
> > +static int trace__bpf_prog_sys_enter_fd(struct trace *trace, int e_mac=
hine, int id)
> >  {
> > -       struct syscall *sc =3D trace__syscall_info(trace, NULL, EM_HOST=
, id);
> > +       struct syscall *sc =3D trace__syscall_info(trace, NULL, e_machi=
ne, id);
> >         return sc ? bpf_program__fd(sc->bpf_prog.sys_enter) : bpf_progr=
am__fd(trace->skel->progs.syscall_unaugmented);
> >  }
> >
> > -static int trace__bpf_prog_sys_exit_fd(struct trace *trace, int id)
> > +static int trace__bpf_prog_sys_exit_fd(struct trace *trace, int e_mach=
ine, int id)
> >  {
> > -       struct syscall *sc =3D trace__syscall_info(trace, NULL, EM_HOST=
, id);
> > +       struct syscall *sc =3D trace__syscall_info(trace, NULL, e_machi=
ne, id);
> >         return sc ? bpf_program__fd(sc->bpf_prog.sys_exit) : bpf_progra=
m__fd(trace->skel->progs.syscall_unaugmented);
> >  }
> >
> > -static int trace__bpf_sys_enter_beauty_map(struct trace *trace, int ke=
y, unsigned int *beauty_array)
> > +static int trace__bpf_sys_enter_beauty_map(struct trace *trace, int e_=
machine, int key, unsigned int *beauty_array)
> >  {
> >         struct tep_format_field *field;
> > -       struct syscall *sc =3D trace__syscall_info(trace, NULL, EM_HOST=
, key);
> > +       struct syscall *sc =3D trace__syscall_info(trace, NULL, e_machi=
ne, key);
> >         const struct btf_type *bt;
> >         char *struct_offset, *tmp, name[32];
> >         bool can_augment =3D false;
> > @@ -3800,9 +3807,9 @@ static struct bpf_program *trace__find_usable_bpf=
_prog_entry(struct trace *trace
> >         return NULL;
> >
> >  try_to_find_pair:
> > -       for (int i =3D 0; i < trace->sctbl->syscalls.nr_entries; ++i) {
> > -               int id =3D syscalltbl__id_at_idx(trace->sctbl, i);
> > -               struct syscall *pair =3D trace__syscall_info(trace, NUL=
L, EM_HOST, id);
> > +       for (int i =3D 0, num_idx =3D syscalltbl__num_idx(sc->e_machine=
); i < num_idx; ++i) {
> > +               int id =3D syscalltbl__id_at_idx(sc->e_machine, i);
> > +               struct syscall *pair =3D trace__syscall_info(trace, NUL=
L, sc->e_machine, id);
> >                 struct bpf_program *pair_prog;
> >                 bool is_candidate =3D false;
> >
> > @@ -3886,7 +3893,7 @@ static struct bpf_program *trace__find_usable_bpf=
_prog_entry(struct trace *trace
> >         return NULL;
> >  }
> >
> > -static int trace__init_syscalls_bpf_prog_array_maps(struct trace *trac=
e)
> > +static int trace__init_syscalls_bpf_prog_array_maps(struct trace *trac=
e, int e_machine)
> >  {
> >         int map_enter_fd =3D bpf_map__fd(trace->skel->maps.syscalls_sys=
_enter);
> >         int map_exit_fd  =3D bpf_map__fd(trace->skel->maps.syscalls_sys=
_exit);
> > @@ -3894,27 +3901,27 @@ static int trace__init_syscalls_bpf_prog_array_=
maps(struct trace *trace)
> >         int err =3D 0;
> >         unsigned int beauty_array[6];
> >
> > -       for (int i =3D 0; i < trace->sctbl->syscalls.nr_entries; ++i) {
> > -               int prog_fd, key =3D syscalltbl__id_at_idx(trace->sctbl=
, i);
> > +       for (int i =3D 0, num_idx =3D syscalltbl__num_idx(e_machine); i=
 < num_idx; ++i) {
> > +               int prog_fd, key =3D syscalltbl__id_at_idx(e_machine, i=
);
> >
> >                 if (!trace__syscall_enabled(trace, key))
> >                         continue;
> >
> > -               trace__init_syscall_bpf_progs(trace, key);
> > +               trace__init_syscall_bpf_progs(trace, e_machine, key);
> >
> >                 // It'll get at least the "!raw_syscalls:unaugmented"
> > -               prog_fd =3D trace__bpf_prog_sys_enter_fd(trace, key);
> > +               prog_fd =3D trace__bpf_prog_sys_enter_fd(trace, e_machi=
ne, key);
> >                 err =3D bpf_map_update_elem(map_enter_fd, &key, &prog_f=
d, BPF_ANY);
> >                 if (err)
> >                         break;
> > -               prog_fd =3D trace__bpf_prog_sys_exit_fd(trace, key);
> > +               prog_fd =3D trace__bpf_prog_sys_exit_fd(trace, e_machin=
e, key);
> >                 err =3D bpf_map_update_elem(map_exit_fd, &key, &prog_fd=
, BPF_ANY);
> >                 if (err)
> >                         break;
> >
> >                 /* use beauty_map to tell BPF how many bytes to collect=
, set beauty_map's value here */
> >                 memset(beauty_array, 0, sizeof(beauty_array));
> > -               err =3D trace__bpf_sys_enter_beauty_map(trace, key, (un=
signed int *)beauty_array);
> > +               err =3D trace__bpf_sys_enter_beauty_map(trace, e_machin=
e, key, (unsigned int *)beauty_array);
> >                 if (err)
> >                         continue;
> >                 err =3D bpf_map_update_elem(beauty_map_fd, &key, beauty=
_array, BPF_ANY);
> > @@ -3950,9 +3957,9 @@ static int trace__init_syscalls_bpf_prog_array_ma=
ps(struct trace *trace)
> >          * first and second arg (this one on the raw_syscalls:sys_exit =
prog
> >          * array tail call, then that one will be used.
> >          */
> > -       for (int i =3D 0; i < trace->sctbl->syscalls.nr_entries; ++i) {
> > -               int key =3D syscalltbl__id_at_idx(trace->sctbl, i);
> > -               struct syscall *sc =3D trace__syscall_info(trace, NULL,=
 EM_HOST, key);
> > +       for (int i =3D 0, num_idx =3D syscalltbl__num_idx(e_machine); i=
 < num_idx; ++i) {
> > +               int key =3D syscalltbl__id_at_idx(e_machine, i);
> > +               struct syscall *sc =3D trace__syscall_info(trace, NULL,=
 e_machine, key);
> >                 struct bpf_program *pair_prog;
> >                 int prog_fd;
> >
> > @@ -4389,8 +4396,13 @@ static int trace__run(struct trace *trace, int a=
rgc, const char **argv)
> >                 goto out_error_mem;
> >
> >  #ifdef HAVE_BPF_SKEL
> > -       if (trace->skel && trace->skel->progs.sys_enter)
> > -               trace__init_syscalls_bpf_prog_array_maps(trace);
> > +       if (trace->skel && trace->skel->progs.sys_enter) {
> > +               /*
> > +                * TODO: Initialize for all host binary machine types, =
not just
> > +                * those matching the perf binary.
> > +                */
> > +               trace__init_syscalls_bpf_prog_array_maps(trace, EM_HOST=
);
> > +       }
> >  #endif
> >
> >         if (trace->ev_qualifier_ids.nr > 0) {
> > @@ -4415,7 +4427,8 @@ static int trace__run(struct trace *trace, int ar=
gc, const char **argv)
> >          *  So just disable this beautifier (SCA_FD, SCA_FDAT) when 'cl=
ose' is
> >          *  not in use.
> >          */
> > -       trace->fd_path_disabled =3D !trace__syscall_enabled(trace, sysc=
alltbl__id(trace->sctbl, "close"));
> > +       /* TODO: support for more than just perf binary machine type cl=
ose. */
> > +       trace->fd_path_disabled =3D !trace__syscall_enabled(trace, sysc=
alltbl__id(EM_HOST, "close"));
> >
> >         err =3D trace__expand_filters(trace, &evsel);
> >         if (err)
> > @@ -4688,8 +4701,7 @@ DEFINE_RESORT_RB(syscall_stats, a->msecs > b->mse=
cs,
> >         entry->msecs   =3D stats ? (u64)stats->stats.n * (avg_stats(&st=
ats->stats) / NSEC_PER_MSEC) : 0;
> >  }
> >
> > -static size_t thread__dump_stats(struct thread_trace *ttrace,
> > -                                struct trace *trace, FILE *fp)
> > +static size_t thread__dump_stats(struct thread_trace *ttrace, struct t=
race *trace, int e_machine, FILE *fp)
> >  {
> >         size_t printed =3D 0;
> >         struct syscall *sc;
> > @@ -4717,7 +4729,7 @@ static size_t thread__dump_stats(struct thread_tr=
ace *ttrace,
> >                         pct =3D avg ? 100.0 * stddev_stats(&stats->stat=
s) / avg : 0.0;
> >                         avg /=3D NSEC_PER_MSEC;
> >
> > -                       sc =3D trace__syscall_info(trace, /*evsel=3D*/N=
ULL, EM_HOST,
> > +                       sc =3D trace__syscall_info(trace, /*evsel=3D*/N=
ULL, e_machine,
> >                                                  syscall_stats_entry->s=
yscall);
> >                         if (!sc)
> >                                 continue;
> > @@ -4767,7 +4779,8 @@ static size_t trace__fprintf_thread(FILE *fp, str=
uct thread *thread, struct trac
> >         else if (fputc('\n', fp) !=3D EOF)
> >                 ++printed;
> >
> > -       printed +=3D thread__dump_stats(ttrace, trace, fp);
> > +       /* TODO: get e_machine from thread. */
> > +       printed +=3D thread__dump_stats(ttrace, trace, EM_HOST, fp);
> >
> >         return printed;
> >  }
> > @@ -4999,8 +5012,9 @@ static int trace__parse_events_option(const struc=
t option *opt, const char *str,
> >                         *sep =3D '\0';
> >
> >                 list =3D 0;
> > -               if (syscalltbl__id(trace->sctbl, s) >=3D 0 ||
> > -                   syscalltbl__strglobmatch_first(trace->sctbl, s, &id=
x) >=3D 0) {
> > +               /* TODO: support for more than just perf binary machine=
 type syscalls. */
> > +               if (syscalltbl__id(EM_HOST, s) >=3D 0 ||
> > +                   syscalltbl__strglobmatch_first(EM_HOST, s, &idx) >=
=3D 0) {
> >                         list =3D 1;
> >                         goto do_concat;
> >                 }
> > @@ -5136,7 +5150,6 @@ static void trace__exit(struct trace *trace)
> >                         syscall__exit(&trace->syscalls.table[i]);
> >                 zfree(&trace->syscalls.table);
> >         }
> > -       syscalltbl__delete(trace->sctbl);
> >         zfree(&trace->perfconfig_events);
> >  }
> >
> > @@ -5282,9 +5295,8 @@ int cmd_trace(int argc, const char **argv)
> >         sigaction(SIGCHLD, &sigchld_act, NULL);
> >
> >         trace.evlist =3D evlist__new();
> > -       trace.sctbl =3D syscalltbl__new();
> >
> > -       if (trace.evlist =3D=3D NULL || trace.sctbl =3D=3D NULL) {
> > +       if (trace.evlist =3D=3D NULL) {
> >                 pr_err("Not enough memory to run!\n");
> >                 err =3D -ENOMEM;
> >                 goto out;
> > diff --git a/tools/perf/scripts/syscalltbl.sh b/tools/perf/scripts/sysc=
alltbl.sh
> > index 1ce0d5aa8b50..a39b3013b103 100755
> > --- a/tools/perf/scripts/syscalltbl.sh
> > +++ b/tools/perf/scripts/syscalltbl.sh
> > @@ -50,37 +50,27 @@ fi
> >  infile=3D"$1"
> >  outfile=3D"$2"
> >
> > -nxt=3D0
> > -
> > -syscall_macro() {
> > -    nr=3D"$1"
> > -    name=3D"$2"
> > -
> > -    echo "     [$nr] =3D \"$name\","
> > -}
> > -
> > -emit() {
> > -    nr=3D"$1"
> > -    entry=3D"$2"
> > -
> > -    syscall_macro "$nr" "$entry"
> > -}
> > -
> > -echo "static const char *const syscalltbl[] =3D {" > $outfile
> > -
> >  sorted_table=3D$(mktemp /tmp/syscalltbl.XXXXXX)
> >  grep -E "^[0-9]+[[:space:]]+$abis" "$infile" | sort -n > $sorted_table
> >
> > -max_nr=3D0
> > +echo "static const char *const syscall_num_to_name[] =3D {" > $outfile
> >  # the params are: nr abi name entry compat
> >  # use _ for intentionally unused variables according to SC2034
> >  while read nr _ name _ _; do
> > -    emit "$nr" "$name" >> $outfile
> > -    max_nr=3D$nr
> > +       echo "  [$nr] =3D \"$name\"," >> $outfile
> >  done < $sorted_table
> > +echo "};" >> $outfile
> >
> > -rm -f $sorted_table
> > +echo "static const uint16_t syscall_sorted_names[] =3D {" >> $outfile
> >
> > +# When sorting by name, add a suffix of 0s upto 20 characters so that =
system
> > +# calls that differ with a numerical suffix don't sort before those
> > +# without. This default behavior of sort differs from that of strcmp u=
sed at
> > +# runtime. Use sed to strip the trailing 0s suffix afterwards.
> > +grep -E "^[0-9]+[[:space:]]+$abis" "$infile" | awk '{printf $3; for (i=
 =3D length($3); i < 20; i++) { printf "0"; }; print " " $1}'| sort | sed '=
s/\([a-zA-Z1-9]\+\)0\+ \([0-9]\+\)/\1 \2/' > $sorted_table
> > +while read name nr; do
> > +       echo "  $nr,    /* $name */" >> $outfile
> > +done < $sorted_table
> >  echo "};" >> $outfile
> >
> > -echo "#define SYSCALLTBL_MAX_ID ${max_nr}" >> $outfile
> > +rm -f $sorted_table
> > diff --git a/tools/perf/util/syscalltbl.c b/tools/perf/util/syscalltbl.=
c
> > index 2f76241494c8..760ac4d0869f 100644
> > --- a/tools/perf/util/syscalltbl.c
> > +++ b/tools/perf/util/syscalltbl.c
> > @@ -9,6 +9,7 @@
> >  #include <stdlib.h>
> >  #include <asm/bitsperlong.h>
> >  #include <linux/compiler.h>
> > +#include <linux/kernel.h>
> >  #include <linux/zalloc.h>
> >
> >  #include <string.h>
> > @@ -20,112 +21,66 @@
> >    #include <asm/syscalls_32.h>
> >  #endif
> >
> > -const int syscalltbl_native_max_id =3D SYSCALLTBL_MAX_ID;
> > -static const char *const *syscalltbl_native =3D syscalltbl;
> > +const char *syscalltbl__name(int e_machine __maybe_unused, int id)
> > +{
> > +       if (id >=3D 0 && id <=3D (int)ARRAY_SIZE(syscall_num_to_name))
> > +               return syscall_num_to_name[id];
> > +       return NULL;
> > +}
> >
> > -struct syscall {
> > -       int id;
> > +struct syscall_cmp_key {
> >         const char *name;
> > +       const char *const *tbl;
> >  };
> >
> >  static int syscallcmpname(const void *vkey, const void *ventry)
> >  {
> > -       const char *key =3D vkey;
> > -       const struct syscall *entry =3D ventry;
> > +       const struct syscall_cmp_key *key =3D vkey;
> > +       const uint16_t *entry =3D ventry;
> >
> > -       return strcmp(key, entry->name);
> > +       return strcmp(key->name, key->tbl[*entry]);
> >  }
> >
> > -static int syscallcmp(const void *va, const void *vb)
> > +int syscalltbl__id(int e_machine __maybe_unused, const char *name)
> >  {
> > -       const struct syscall *a =3D va, *b =3D vb;
> > -
> > -       return strcmp(a->name, b->name);
> > +       struct syscall_cmp_key key =3D {
> > +               .name =3D name,
> > +               .tbl =3D syscall_num_to_name,
> > +       };
> > +       const int *id =3D bsearch(&key, syscall_sorted_names,
> > +                               ARRAY_SIZE(syscall_sorted_names),
> > +                               sizeof(syscall_sorted_names[0]),
> > +                               syscallcmpname);
>
> This has puzzled me several times lol. Searching in
> syscall_sorted_names returns an int id... I get that it's sorted by
> name, but maybe call it syscall_ids_sorted_by_name, syscall_ids, or
> syscall_ids_sorted instead?
>
> > +
> > +       return id ? *id : -1;
> >  }
> >
> > -static int syscalltbl__init_native(struct syscalltbl *tbl)
> > +int syscalltbl__num_idx(int e_machine __maybe_unused)
>
> I haven't found many instances of *num_idx in the source tree
> indicating the length of an array. Are you okay with
> syscalltbl__nr_idx()?
>
> Otherwise LGTM.

So the idx rather than id (wish it were called syscall_nr) logic is
used with handling command line system call filters. You can see it in
the glob code:
https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git/tr=
ee/tools/perf/util/syscalltbl.c?h=3Dperf-tools-next#n106
The code wants to iterate over syscalls with no NULLs, as the name to
syscall number table doesn't contain NULLs it serves the same purpose
and is also sorted the same way.

Thanks,
Ian



> Thanks,
> Howard
> >  {
> > -       int nr_entries =3D 0, i, j;
> > -       struct syscall *entries;
> > -
> > -       for (i =3D 0; i <=3D syscalltbl_native_max_id; ++i)
> > -               if (syscalltbl_native[i])
> > -                       ++nr_entries;
> > -
> > -       entries =3D tbl->syscalls.entries =3D malloc(sizeof(struct sysc=
all) * nr_entries);
> > -       if (tbl->syscalls.entries =3D=3D NULL)
> > -               return -1;
> > -
> > -       for (i =3D 0, j =3D 0; i <=3D syscalltbl_native_max_id; ++i) {
> > -               if (syscalltbl_native[i]) {
> > -                       entries[j].name =3D syscalltbl_native[i];
> > -                       entries[j].id =3D i;
> > -                       ++j;
> > -               }
> > -       }
> > -
> > -       qsort(tbl->syscalls.entries, nr_entries, sizeof(struct syscall)=
, syscallcmp);
> > -       tbl->syscalls.nr_entries =3D nr_entries;
> > -       tbl->syscalls.max_id     =3D syscalltbl_native_max_id;
> > -       return 0;
> > +       return ARRAY_SIZE(syscall_sorted_names);
> >  }
> >
> > -struct syscalltbl *syscalltbl__new(void)
> > +int syscalltbl__id_at_idx(int e_machine __maybe_unused, int idx)
> >  {
> > -       struct syscalltbl *tbl =3D malloc(sizeof(*tbl));
> > -       if (tbl) {
> > -               if (syscalltbl__init_native(tbl)) {
> > -                       free(tbl);
> > -                       return NULL;
> > -               }
> > -       }
> > -       return tbl;
> > -}
> > -
> > -void syscalltbl__delete(struct syscalltbl *tbl)
> > -{
> > -       zfree(&tbl->syscalls.entries);
> > -       free(tbl);
> > -}
> > -
> > -const char *syscalltbl__name(const struct syscalltbl *tbl __maybe_unus=
ed, int id)
> > -{
> > -       return id <=3D syscalltbl_native_max_id ? syscalltbl_native[id]=
: NULL;
> > -}
> > -
> > -int syscalltbl__id(struct syscalltbl *tbl, const char *name)
> > -{
> > -       struct syscall *sc =3D bsearch(name, tbl->syscalls.entries,
> > -                                    tbl->syscalls.nr_entries, sizeof(*=
sc),
> > -                                    syscallcmpname);
> > -
> > -       return sc ? sc->id : -1;
> > -}
> > -
> > -int syscalltbl__id_at_idx(struct syscalltbl *tbl, int idx)
> > -{
> > -       struct syscall *syscalls =3D tbl->syscalls.entries;
> > -
> > -       return idx < tbl->syscalls.nr_entries ? syscalls[idx].id : -1;
> > +       return syscall_sorted_names[idx];
> >  }
> >
> > -int syscalltbl__strglobmatch_next(struct syscalltbl *tbl, const char *=
syscall_glob, int *idx)
> > +int syscalltbl__strglobmatch_next(int e_machine __maybe_unused, const =
char *syscall_glob, int *idx)
> >  {
> > -       int i;
> > -       struct syscall *syscalls =3D tbl->syscalls.entries;
> > +       for (int i =3D *idx + 1; i < (int)ARRAY_SIZE(syscall_sorted_nam=
es); ++i) {
> > +               const char *name =3D syscall_num_to_name[syscall_sorted=
_names[i]];
> >
> > -       for (i =3D *idx + 1; i < tbl->syscalls.nr_entries; ++i) {
> > -               if (strglobmatch(syscalls[i].name, syscall_glob)) {
> > +               if (strglobmatch(name, syscall_glob)) {
> >                         *idx =3D i;
> > -                       return syscalls[i].id;
> > +                       return syscall_sorted_names[i];
> >                 }
> >         }
> >
> >         return -1;
> >  }
> >
> > -int syscalltbl__strglobmatch_first(struct syscalltbl *tbl, const char =
*syscall_glob, int *idx)
> > +int syscalltbl__strglobmatch_first(int e_machine, const char *syscall_=
glob, int *idx)
> >  {
> >         *idx =3D -1;
> > -       return syscalltbl__strglobmatch_next(tbl, syscall_glob, idx);
> > +       return syscalltbl__strglobmatch_next(e_machine, syscall_glob, i=
dx);
> >  }
> > diff --git a/tools/perf/util/syscalltbl.h b/tools/perf/util/syscalltbl.=
h
> > index 362411a6d849..2bb628eff367 100644
> > --- a/tools/perf/util/syscalltbl.h
> > +++ b/tools/perf/util/syscalltbl.h
> > @@ -2,22 +2,12 @@
> >  #ifndef __PERF_SYSCALLTBL_H
> >  #define __PERF_SYSCALLTBL_H
> >
> > -struct syscalltbl {
> > -       struct {
> > -               int max_id;
> > -               int nr_entries;
> > -               void *entries;
> > -       } syscalls;
> > -};
> > +const char *syscalltbl__name(int e_machine, int id);
> > +int syscalltbl__id(int e_machine, const char *name);
> > +int syscalltbl__num_idx(int e_machine);
> > +int syscalltbl__id_at_idx(int e_machine, int idx);
> >
> > -struct syscalltbl *syscalltbl__new(void);
> > -void syscalltbl__delete(struct syscalltbl *tbl);
> > -
> > -const char *syscalltbl__name(const struct syscalltbl *tbl, int id);
> > -int syscalltbl__id(struct syscalltbl *tbl, const char *name);
> > -int syscalltbl__id_at_idx(struct syscalltbl *tbl, int idx);
> > -
> > -int syscalltbl__strglobmatch_first(struct syscalltbl *tbl, const char =
*syscall_glob, int *idx);
> > -int syscalltbl__strglobmatch_next(struct syscalltbl *tbl, const char *=
syscall_glob, int *idx);
> > +int syscalltbl__strglobmatch_first(int e_machine, const char *syscall_=
glob, int *idx);
> > +int syscalltbl__strglobmatch_next(int e_machine, const char *syscall_g=
lob, int *idx);
> >
> >  #endif /* __PERF_SYSCALLTBL_H */
> > --
> > 2.48.1.362.g079036d154-goog
> >

