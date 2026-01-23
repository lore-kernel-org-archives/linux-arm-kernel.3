Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 007A2D74EFB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 16:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vOkRLjnifceecHRFjfFtA9Hu0YVFrmdtZP58mWOpjc8=; b=AguLuwFSXtI8Hrn8OiPVwdOlgL
	SM2KLPgyJjavJPIiRw+hYx0WOJJCbyTsfkXpFy5CHTtUVbD572hVPDGrBw4fCxln5dbnHY6OqF1GS
	iSSx+NI3NxyNs3ilGc/4OTFba9nugUquhRHm4szGqbbCjKlI7wzgH8cNXadqZAhgJvvTbcjJBlnpQ
	gBnVvZ/p6Ilb+qmMHWW9YJNKwy/pB77NmK+t4g2x3VR0HVV00tonYEsyfFflZ5GMVHMoojG2QCn49
	8IOPzikty/YJi8RR4J1V8iQ6XJ9CNxESltwSTOI4Vjxw9T19bw7g7lwTylY9+mmGz5bSl6joPS09c
	IVTPT2vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjK3T-00000009CaP-1CoH;
	Fri, 23 Jan 2026 16:30:39 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjK3Q-00000009CZh-32cU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 16:30:38 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2a76b39587aso120995ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 08:30:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769185835; cv=none;
        d=google.com; s=arc-20240605;
        b=QjuJ0vxS7u2hD9/IYte+qnDLgAV1HYFAsLvm2M9ApwipQ/UGTk+JG5ganZMY1jZaFM
         FHsEh7y9jl9NAfEvvFCK+9dH82tkGhJirqd2sDYdYYmapYXMEVAdgbs49vbWmLkSoMxZ
         wQgycuYAACYMglXHcOwE7pQEazUO/Vkb4zy1sFCOPggv/5vO3gh9gMHqw7cfNq5ZHJ1T
         y/Y/qEptDC/+fa3owPZIFwdatv3GP3QpBt8ngpZ1iNmmuBY+ZbGjKhyrTaUCSdvb0nqC
         LC9JqYAeYerCMQQFw+tarn+BMla9VEMp1I/GKVvPM4FXKyiKI+CpzJkqCGC39DB7EJc1
         suLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vOkRLjnifceecHRFjfFtA9Hu0YVFrmdtZP58mWOpjc8=;
        fh=Fo2UmYVsixyQkF4YKHPvHhdC5xlOg9w+gg3gjhazM0I=;
        b=fjuye9sLPBCb+HPdgpaVKS/rgv4Yhmwyul0sx1mBDlwIoDRTW6E2rEp/Dq/ulMhQ7o
         OmbbE45S0MlsCQGlEjIJ32Kr/AkGPo34ec2Jhs+r+2AeIfb0v03UaV3b4KU6r6e6Q5t+
         sxv+pkqTG5Y9wXZH/xkJy1mIEdEeM3FraU++B8svcmEUvnlYiY8vePAw1fprn+dYtq8g
         r2MaVnPh8RdlS2LbArOkMURihgOIqfyImbZpmU+NhbAAGs+kKOZRPnIyrIMhT3uuWBGT
         J4VHdaHor1JpUqFfGR5grYvgvix6yZg5GDtCfowFLm017f6voZUbW+UmP2HBOM3vfGHB
         juzA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769185835; x=1769790635; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vOkRLjnifceecHRFjfFtA9Hu0YVFrmdtZP58mWOpjc8=;
        b=rqTRurjId1+36FhA1ipsJ4ILjta1zkSafRC6j6O/NkwxRy4SapCpCK+sFS6ClgKIOc
         5RScswGD91zpgZGeDNP1pOus4yGPejfN9EoKIYIMcl6feNMfzDYVcp6OqSoHpzkJ5tRh
         53Xmw87P7AgRsuuLQOHcJMxBV13ApDAQ0MSKZv9glRorCcRediTO/4BI5xGH6TPE0AKW
         8+DrwXD3ehC70lXaoE/ZEQjaLAr5O2uNr/mGDsODgTCMlPq8F8/FPhCsfD55mWk1rN8l
         tu5MTri4nyCrtzs38WqYdOFjVtL86nVQOEnGq/mW16AeBN4WoFkCirV9ne0mCUH77sKM
         z58A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769185835; x=1769790635;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vOkRLjnifceecHRFjfFtA9Hu0YVFrmdtZP58mWOpjc8=;
        b=NV0Njhv67TqF16Fm9nLLD9LMTgsLR1jtK1tRe9dH9krgb6GoowB89gvpwDNTgec2G0
         /U+s0gIPB3vifGXLhVKcxsGokKE3WAPttPof1uRSgujVzKmTwUqgTwPt5MsBHuhrTze7
         Qh0HHly7i2JYr1t348QckU4cSzjaKdEMk6TurOLK1T1pCQ6owWOlAlucjCE01PhICM4H
         tS8HpGw6CRuqhAA/fU15QzVo7vLGyG/HiagJjr00V8CZXq9JCa3ps9fybQD+XSdKJKTC
         11St47kI5v0dbgcnGO90XWYvzzwhFtXZXBQR3CwDemQcV96OsXz5fDfS8huzotq+q+wx
         QVwA==
X-Forwarded-Encrypted: i=1; AJvYcCWrTgaCuewNdl3WFvtB7oLVr+yDMVJbZVLfq7CO/uETsGNvhsEyJAytuPc9WRMeAO/yMfNF1HuSXu5VHlQzZ/3q@lists.infradead.org
X-Gm-Message-State: AOJu0YxqUN43Sa4HrKAvAUQakaHzyqWBCqN3ge44F6QeUUuEotckhIvP
	vHVJC12801rZUW5yFQJo2pk6+kdCmE5+5wvtEstmjWVa1F7R1e6vkHY6ShKuYpxpYHBmBfmspAS
	/V3RJt6vWBflFHKDYeOKWkIM6hb1I6pDbbShgYgf1
X-Gm-Gg: AZuq6aJWBqiqlZ20Jz6wY3ZdL8MOxiDZM0pFvSDb25O+bE8zoomdJm7YY9/Z/rpF0h/
	5Qxg5KS2EeHx1BOZp/76/7ghFE89kbR/B6CexvzGAKSa+n4eJT3kAynRui2zrPb3kpw90sO1DRQ
	dSHC6Z3FFs+1oLgV2nlDHRs0rTkbrLUTKYwi/Tw+PTi6YUPaMGpliGRr3Pa0zQOF/N50vGUVUEE
	xAOkYbNBTOSPXUiW+HVMA7uKyrPowiTjg30or98vHhspU9ib7BZTaECObRdvUJTsPqsLfFE3O9g
	Nj3s1wcFuHWl5jyKuPgVRcdXWQ==
X-Received: by 2002:a17:902:cf01:b0:2a1:3cda:8e99 with SMTP id
 d9443c01a7336-2a805d45517mr2449745ad.21.1769185834577; Fri, 23 Jan 2026
 08:30:34 -0800 (PST)
MIME-Version: 1.0
References: <20260122213516.671089-1-irogers@google.com> <1310a240-077a-49f6-b83a-a8a4fd52127b@linaro.org>
In-Reply-To: <1310a240-077a-49f6-b83a-a8a4fd52127b@linaro.org>
From: Ian Rogers <irogers@google.com>
Date: Fri, 23 Jan 2026 08:30:22 -0800
X-Gm-Features: AZwV_QjNay75wDxp2FcK9a1wDgjF2FHge-tLUo_wNfVirsr-f2GGtodRNG80OvI
Message-ID: <CAP-5=fWrJoej0XprvPmYg5qa7SRU2s3yeCF-hWgj+3MTdTZLzQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/12] perf annotate arch clean up
To: James Clark <james.clark@linaro.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, Leo Yan <leo.yan@linux.dev>, Guo Ren <guoren@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Zecheng Li <zecheng@google.com>, 
	Tianyou Li <tianyou.li@intel.com>, Thomas Falcon <thomas.falcon@intel.com>, 
	Julia Lawall <Julia.Lawall@inria.fr>, Suchit Karunakaran <suchitkarunakaran@gmail.com>, 
	Athira Rajeev <atrajeev@linux.ibm.com>, Aditya Bodkhe <aditya.b1@linux.ibm.com>, 
	Howard Chu <howardchu95@gmail.com>, 
	=?UTF-8?Q?Krzysztof_=C5=81opatowski?= <krzysztof.m.lopatowski@gmail.com>, 
	"Dr. David Alan Gilbert" <linux@treblig.org>, Shimin Guo <shimin.guo@skydio.com>, 
	Sergei Trofimovich <slyich@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_083036_778418_0E39B27A 
X-CRM114-Status: GOOD (  31.77  )
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

On Fri, Jan 23, 2026 at 3:02=E2=80=AFAM James Clark <james.clark@linaro.org=
> wrote:
>
>
>
> On 22/01/2026 9:35 pm, Ian Rogers wrote:
> > 3 initial memory leak fix patches for perf annotate.
> >
> > Move the disasm.c #included arch files into a new util/annotate-arch
> > directory. Make the code compile standalone. Try to better encapsulate
> > architecture specific code within the files and with a
> > arch__new_<arch> function that allows additional data to be associated
> > with the struct arch using the standard container_of trick.
> >
> > Make the lookup of struct arch use the ELF machine gather from a
> > thread rather than an evsel. For example, the evsel can't determine
> > the difference between EM_386 and EM_X86_64 so generally the latter
> > has currently been used. This means the dwarf registers are off as
> > register 1 is CX with EM_386 and DX with EM_X86_64. To facilitate this
> > change map_symbol is refactored to use a struct thread rather than a
> > struct maps, the maps being obtainable from the thread.
> >
> > To make in and out arguments clearer, for safety, etc. try to constify
> > struct arch and its related structs.
> >
> > v3: Fix arch initialization on arm, arm64, powerpc and sparc as spotted=
 by Suchit
> >      Karunakaranw.
> >
> > v2: Add a patch to fix a domain info memory leak that was blocking
> >      leak sanitizer analysis. Fix more map_symbol leaks or uses after
> >      reference count put (Suchit Karunakaranw
> >      <suchitkarunakaran@gmail.com>).  Try to repro annotate test crash
> >      (James Clark) but suspect it was addressed in the other reference
> >      count fixes.
> >      https://lore.kernel.org/lkml/20260122165407.561888-1-irogers@googl=
e.com/
> >
> > v1: https://lore.kernel.org/lkml/20260122073127.375139-1-irogers@google=
.com/
> >
> > Ian Rogers (12):
> >    perf header: Fix memory leaks in process_cpu_domain_info
> >    perf annotate: Fix args leak of map_symbol
> >    perf maps: Fix reference count leak in maps__find_ams
> >    perf disasm: Constify use of struct arch
> >    perf disasm: Constify use of struct ins_op
> >    perf disasm: Constify use of struct ins
> >    perf disasm: Rework the string arch__is to use the ELF machine
> >    perf disasm: Don't include C files from the arch directory
> >    perf disasm: Refactor ins__is_call/jump to avoid exposing arch ins_o=
ps
> >    perf map_symbol: Switch from holding maps to holding thread
> >    perf disasm: Refactor arch__find and initialization of arch structs
> >    perf disasm: Minor layout tweaks for struct arch
> >
> >   tools/perf/arch/arc/annotate/instructions.c   |  11 -
> >   .../perf/arch/riscv64/annotate/instructions.c |  36 --
> >   tools/perf/ui/browsers/annotate.c             |   6 +-
> >   tools/perf/ui/browsers/hists.c                |   3 +-
> >   tools/perf/util/Build                         |   1 +
> >   tools/perf/util/addr_location.c               |   4 -
> >   tools/perf/util/addr_location.h               |   1 -
> >   tools/perf/util/annotate-arch/Build           |  11 +
> >   tools/perf/util/annotate-arch/annotate-arc.c  |  18 +
> >   .../annotate-arch/annotate-arm.c}             |  50 +-
> >   .../annotate-arch/annotate-arm64.c}           |  59 +--
> >   .../annotate-arch/annotate-csky.c}            |  29 +-
> >   .../annotate-arch/annotate-loongarch.c}       |  71 +--
> >   .../annotate-arch/annotate-mips.c}            |  29 +-
> >   .../annotate-arch/annotate-powerpc.c}         | 127 +++++-
> >   .../util/annotate-arch/annotate-riscv64.c     |  41 ++
> >   .../annotate-arch/annotate-s390.c}            |  70 +--
> >   .../annotate-arch/annotate-sparc.c}           |  28 +-
> >   .../annotate-arch/annotate-x86.c}             |  89 ++--
> >   tools/perf/util/annotate-data.c               |  12 +-
> >   tools/perf/util/annotate-data.h               |   2 +-
> >   tools/perf/util/annotate.c                    |  88 ++--
> >   tools/perf/util/annotate.h                    |  10 +-
> >   tools/perf/util/callchain.c                   |  12 +-
> >   tools/perf/util/capstone.c                    |  18 +-
> >   tools/perf/util/db-export.c                   |   1 -
> >   tools/perf/util/disasm.c                      | 428 +++++++----------=
-
> >   tools/perf/util/disasm.h                      |  95 ++--
> >   tools/perf/util/event.c                       |   2 -
> >   tools/perf/util/header.c                      |  17 +-
> >   tools/perf/util/hist.c                        |  18 +-
> >   tools/perf/util/llvm.c                        |   8 +-
> >   tools/perf/util/machine.c                     |  13 +-
> >   tools/perf/util/map_symbol.c                  |   5 +-
> >   tools/perf/util/map_symbol.h                  |   3 +-
> >   tools/perf/util/maps.c                        |   1 +
> >   tools/perf/util/sort.c                        |   2 +-
> >   tools/perf/util/unwind-libdw.c                |   2 +-
> >   tools/perf/util/unwind-libunwind-local.c      |   2 +-
> >   39 files changed, 775 insertions(+), 648 deletions(-)
> >   delete mode 100644 tools/perf/arch/arc/annotate/instructions.c
> >   delete mode 100644 tools/perf/arch/riscv64/annotate/instructions.c
> >   create mode 100644 tools/perf/util/annotate-arch/Build
> >   create mode 100644 tools/perf/util/annotate-arch/annotate-arc.c
> >   rename tools/perf/{arch/arm/annotate/instructions.c =3D> util/annotat=
e-arch/annotate-arm.c} (59%)
> >   rename tools/perf/{arch/arm64/annotate/instructions.c =3D> util/annot=
ate-arch/annotate-arm64.c} (70%)
> >   rename tools/perf/{arch/csky/annotate/instructions.c =3D> util/annota=
te-arch/annotate-csky.c} (67%)
> >   rename tools/perf/{arch/loongarch/annotate/instructions.c =3D> util/a=
nnotate-arch/annotate-loongarch.c} (60%)
> >   rename tools/perf/{arch/mips/annotate/instructions.c =3D> util/annota=
te-arch/annotate-mips.c} (59%)
> >   rename tools/perf/{arch/powerpc/annotate/instructions.c =3D> util/ann=
otate-arch/annotate-powerpc.c} (73%)
> >   create mode 100644 tools/perf/util/annotate-arch/annotate-riscv64.c
> >   rename tools/perf/{arch/s390/annotate/instructions.c =3D> util/annota=
te-arch/annotate-s390.c} (66%)
> >   rename tools/perf/{arch/sparc/annotate/instructions.c =3D> util/annot=
ate-arch/annotate-sparc.c} (85%)
> >   rename tools/perf/{arch/x86/annotate/instructions.c =3D> util/annotat=
e-arch/annotate-x86.c} (93%)
> >
>
> Reviewed-by: James Clark <james.clark@linaro.org>

Thanks James!

Arnaldo, it'd be nice for this to land so I can look into addressing
the missing e_flags issue - namely, we should optionally read the
e_flags along with the e_machine so that we have a proper e_flags
value to make csky work properly (not an issue on anything else). At
the same time I think some of the e_machine should be made more robust
like with:
https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/commit/tools/perf?h=3Dperf-tools-next&id=3De99d544c7f3691eb321c88fdbadf04=
b777c114c4
but here:
https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/tree/tools/perf/util/thread.c?h=3Dperf-tools-next#n452
the code should probably be shared.
Anyway, this series does enough without adding all that to it and
waiting for more tags.

Thanks,
Ian

