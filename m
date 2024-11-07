Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93C5CD43374
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 16:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n+7ho61/oAoiWQbCyZG6AJoc8iLMZGuZ9+96uL2SaXc=; b=k5f13s6Fk++ro8Hb5+omgDaP/Q
	YEScTmLD5w3Gt5DO0Nzi4HWYIDJ5VfemZ8Xx1jeBCFAtYc8pZIgIKWQVCNHkUQR21DoW5vGgWRPGL
	0wdrN34832ZWeIWV04/oTZepiQEfjRSWJjD3cswSgoDDskP7Cv7jwNAIpd4mFDKg/r7pz81gdQ7tK
	hfPVl4t0loD1QJveSjcTxxI7sp3sNneTgZkfUf72EW23DlzsIaFfCwbmLQpf9M/jnUSF17vZ9Z+XP
	/r/qFicPl/UzcxF9BewD/is0k9pFTTq/9Y9YOxtx3zcLNyWpm2l7q4kff6CTZaEp+ahQcTrFtq8Fm
	6xQIXa5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t94zX-00000007XTb-3r74;
	Thu, 07 Nov 2024 16:04:15 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t94t4-00000007W3H-3bwJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 15:57:36 +0000
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-460b295b9eeso227951cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Nov 2024 07:57:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730995053; x=1731599853; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n+7ho61/oAoiWQbCyZG6AJoc8iLMZGuZ9+96uL2SaXc=;
        b=zE1yKcORw+9mW/75rOdyG5FYTVpVLnFMwDDleuidJoInNopCP408pUsyWncQbRJCRO
         LkzFOpN6F7yBLZDlTqjJ7wX+P+H/Nr+pPP+BYG3DDxuc+K4StkLUYsDl/v8ubQ0frq9Q
         Xb74zsKTcR5fNx/hV6RDV+M3qOehkri4oU1NPfA39k/jFuehI0vxbfSPwOWOb24PDBMn
         zSiHPgyW8Q8AurGrMBXeaILFX5ILYm0sSUmyUgmncJb5vpuYZ3zYacipvfWbDTDa9gQv
         bogzkgKPa3BAOK3Sw8Wr9YGMbU+5H1AnG7NYrP5ZSPbpUA6YATGkr7dCDbxdPq3sj4ZM
         zQpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730995053; x=1731599853;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n+7ho61/oAoiWQbCyZG6AJoc8iLMZGuZ9+96uL2SaXc=;
        b=b3ROxMcp5JBUR2Z9UqODmk9+VaVkeXVYbvsEsnsXTWjcxBYhqAlBCR24Fh7NkmzCq9
         OgxIpzvmNUA66pUuoIA77OPRaxyOQIdYXKD1USmRmjB5RJAKgr6N/O9bYaCG/WziGE9C
         Go3Wb8IORACYNbj0DaNbBhjNrAw+myVUX+4H6KdjwZAlfwZYxxiTcDeH/wizw2QybAL8
         6IyTRPGB9rVRqRYxRpiwldP8JgcsxrxEC22FVytanN20eWy+h/ZalH5FUR37GTrD2qJL
         asS60IpWdzGfVFUwOHTGXtxNrHa9GkJk9FgYTvWeL6FYNE9yRzhxJHN+2mIKceKxqRBU
         Omlg==
X-Forwarded-Encrypted: i=1; AJvYcCW7UTKt4AjhrR9iOBQYWu/MQT4ya6+x5m3vqC0ijz9xDaiLuJm2IrAWmBzU4ObZz8cKB48WHJKDneMgkW6VaUrV@lists.infradead.org
X-Gm-Message-State: AOJu0YyqWFHIvtFwQl+INFfjaIGG6be1HlFLux1LtOF/XskfIQU4aXW2
	WXtgrJXt+82Jpc/M2h0NWhvsBSeVDxYUwBfjwGGbEMBOsBgPURxvT5zD7r6bu30Ckb1XncwZC2J
	DCu5mbGbXUG5ubtxmITjAFLDA18uo/caMwnVs
X-Gm-Gg: ASbGncsNOqrz131yIvZfDt/bOu5SEld0VVyiM09nEYAW1JVEqKEEWnWkbXLgvYESLHB
	8K+BfzwLlJEw1MskbuXn9BtLXHveH5GxsX3CfiBM3d9oeguFvfMXwkhkEUnENuGE=
X-Google-Smtp-Source: AGHT+IHVKHBvB2cCzxWI5DhXsQxE1wxEcC6cL+BUBfk+cOX40yCQNgt2BOrt/ugueoPHNZE5j5DaoRIma6XSWf55aH0=
X-Received: by 2002:a05:622a:4e8f:b0:460:3f4a:40a1 with SMTP id
 d75a77b69052e-462fa5a3211mr4869671cf.13.1730995053179; Thu, 07 Nov 2024
 07:57:33 -0800 (PST)
MIME-Version: 1.0
References: <20241107071600.9082-1-irogers@google.com> <20241107082807.ipb7xzqvs24tto2e@hippo>
In-Reply-To: <20241107082807.ipb7xzqvs24tto2e@hippo>
From: Ian Rogers <irogers@google.com>
Date: Thu, 7 Nov 2024 07:57:21 -0800
Message-ID: <CAP-5=fXn3GSR88=UVqZ6zxsuv6s+ZBMGY1A0U8D-_oU4sm10kQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/7] Refactor cpuid and metric table lookup code
To: Xu Yang <xu.yang_2@nxp.com>
Cc: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
	James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>, 
	Leo Yan <leo.yan@linux.dev>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, 
	Bibo Mao <maobibo@loongson.cn>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, 
	Ben Zong-You Xie <ben717@andestech.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Sandipan Das <sandipan.das@amd.com>, Benjamin Gray <bgray@linux.ibm.com>, 
	Ravi Bangoria <ravi.bangoria@amd.com>, =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>, 
	Yicong Yang <yangyicong@hisilicon.com>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Dima Kogan <dima@secretsauce.net>, 
	"Dr. David Alan Gilbert" <linux@treblig.org>, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_075734_952946_6E95DE73 
X-CRM114-Status: GOOD (  20.02  )
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

On Thu, Nov 7, 2024 at 1:05=E2=80=AFAM Xu Yang <xu.yang_2@nxp.com> wrote:
>
> Hi Ian Rogers,
>
> On Wed, Nov 06, 2024 at 11:15:53PM -0800, Ian Rogers wrote:
> > Xu Yang <xu.yang_2@nxp.com> reported issues with the system metric
> > lookup:
> > https://lore.kernel.org/linux-perf-users/20241106085441.3945502-1-xu.ya=
ng_2@nxp.com/
> > These patches remove a lot of the logic relating CPUIDs to PMUs so
> > that the PMU isn't part of the question when finding a metric table.
> > For time reasons, it doesn't go as far as allowing system metrics
> > without a metric table as a metric table is needed for metrics to
> > refer to other metrics, and the refactoring of that resolution is a
> > hassle.
> >
> > Ian Rogers (7):
> >   perf header: Move is_cpu_online to numa bench
> >   perf header: Refactor get_cpuid to take a CPU for ARM
> >   perf arm64 header: Use cpu argument in get_cpuid
> >   perf header: Avoid transitive PMU includes
> >   perf header: Pass a perf_cpu rather than a PMU to get_cpuid_str
> >   perf jevents: Add map_for_cpu
> >   perf pmu: Move pmu_metrics_table__find and remove ARM override
> >
> >  tools/perf/arch/arm64/util/arm-spe.c     | 14 +---
> >  tools/perf/arch/arm64/util/header.c      | 73 ++++++++++-----------
> >  tools/perf/arch/arm64/util/pmu.c         | 20 ------
> >  tools/perf/arch/loongarch/util/header.c  |  4 +-
> >  tools/perf/arch/powerpc/util/header.c    |  4 +-
> >  tools/perf/arch/riscv/util/header.c      |  4 +-
> >  tools/perf/arch/s390/util/header.c       |  6 +-
> >  tools/perf/arch/x86/util/auxtrace.c      |  3 +-
> >  tools/perf/arch/x86/util/header.c        |  5 +-
> >  tools/perf/bench/numa.c                  | 51 +++++++++++++++
>
> Meet error when build perf tool:
>
>   CC      util/levenshtein.o
>   CC      tests/mem.o
>   CC      util/mmap.o
> bench/numa.c: In function =E2=80=98is_cpu_online=E2=80=99:
> bench/numa.c:550:21: error: storage size of =E2=80=98statbuf=E2=80=99 isn=
=E2=80=99t known
>   550 |         struct stat statbuf;
>       |                     ^~~~~~~
> bench/numa.c:554:13: error: implicit declaration of function =E2=80=98sta=
t=E2=80=99; did you mean =E2=80=98strcat=E2=80=99? [-Werror=3Dimplicit-func=
tion-declaration]
>   554 |         if (stat(buf, &statbuf) !=3D 0)
>       |             ^~~~
>       |             strcat
> bench/numa.c:578:13: error: implicit declaration of function =E2=80=98sys=
fs__read_str=E2=80=99 [-Werror=3Dimplicit-function-declaration]
>   578 |         if (sysfs__read_str(buf, &str, &strlen) < 0)
>       |             ^~~~~~~~~~~~~~~
> bench/numa.c:550:21: error: unused variable =E2=80=98statbuf=E2=80=99 [-W=
error=3Dunused-variable]
>   550 |         struct stat statbuf;
>       |                     ^~~~~~~
>   CC      tests/cpumap.o
>   CC      tests/stat.o
>
> After remove these errors, my issue is disappeared.

Thanks, I'll fix this in v2. I'll also add your patch to the front for
the sake of backport fixing. If you could provide tags for my changes
it would be appreciated.

Thanks,
Ian

