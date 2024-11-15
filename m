Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1B48D68BC6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 15:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/bIaCsK/jDkSPfbT7lVKDf+YzAo9elooE5czjJzz4a4=; b=WYL+R8z4RvO4ujAZLCMJqLvNBv
	8UpMgFunUrowk1xM/g4i/key97m5bavBv4AyqxWXDMP9sBg663HtkkCAPA78GxE+W3hdOLnr4/69N
	C1QsKaGFGpNmRcU+dbvOBlqLqmtCESzLLHEtznRaaGccLEGxgj0sBnP4b4V+JQqJa0yYxNGze9czi
	haJmRV8LzYOt5UxAamZXezOR72B+O85vxrmyNGCrxO1fVUs7NBNmucT3Ur5tdlDo1CasQit9Ucapt
	k3QGcTaDz/oep4F3TCKm3zzmgY3Af4XItnCloDptoHKZjaZQxiT+UyHSMwiqs1SmGifkcSrrR9pmT
	cR0frCTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tByUR-00000003DgV-13UO;
	Fri, 15 Nov 2024 15:44:07 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tByTV-00000003DSz-1S1m;
	Fri, 15 Nov 2024 15:43:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 95EACA42A0C;
	Fri, 15 Nov 2024 15:41:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD7FBC4CECF;
	Fri, 15 Nov 2024 15:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731685388;
	bh=/dcFxhHKBWLL34nz7gEKNRpldABlavWv3YKIJYlie4s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qm1PMV7mxCVMp40wyrDL58hCCRzwWaEgCxfDMIQCylAkVlFcaqG1PQjKLkYZ6T4w6
	 PtrbyzmY7Cr+ZCdNByLnjTLya3JOwjOUvKFYKJSssn4qvV3m6aVcopLdRF4dOe1plP
	 KiUnUk70zxZU1VrcbybGJoZHHZXv1tVy+Akx3aZkmpsfa9Ts+RLnyLg/pG7GT7ckII
	 nXdO4J9hI0hHh6rRSUMdn9ybG5cO2a8tvRxWI1yBwVKP8olyJbokl1crJTE9P7Gndk
	 2v0KRcW1+Mmueo1wMvdR7lEN9Y71VQKa9jw6CORkFBmpD8dUp87BNaMYrqS0UtiRDm
	 qLeAuWMKjMXBQ==
Date: Fri, 15 Nov 2024 12:43:05 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: James Clark <james.clark@linaro.org>
Cc: Ian Rogers <irogers@google.com>, Xu Yang <xu.yang_2@nxp.com>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Kan Liang <kan.liang@linux.intel.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Huacai Chen <chenhuacai@kernel.org>, Bibo Mao <maobibo@loongson.cn>,
	Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
	Ben Zong-You Xie <ben717@andestech.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Sandipan Das <sandipan.das@amd.com>,
	Benjamin Gray <bgray@linux.ibm.com>,
	Ravi Bangoria <ravi.bangoria@amd.com>,
	=?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clement.legoffic@foss.st.com>,
	Yicong Yang <yangyicong@hisilicon.com>,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
	Dima Kogan <dima@secretsauce.net>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 0/8] Refactor cpuid and metric table lookup code
Message-ID: <ZzdsCWpAULCe839R@x1>
References: <20241107162035.52206-1-irogers@google.com>
 <215ca9a2-0a63-4d0c-8402-5cb1f2bb0794@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <215ca9a2-0a63-4d0c-8402-5cb1f2bb0794@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_074309_513321_D321B3C8 
X-CRM114-Status: GOOD (  19.41  )
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

On Fri, Nov 15, 2024 at 03:35:55PM +0000, James Clark wrote:
> 
> 
> On 07/11/2024 4:20 pm, Ian Rogers wrote:
> > Xu Yang <xu.yang_2@nxp.com> reported issues with the system metric
> > lookup:
> > https://lore.kernel.org/linux-perf-users/20241106085441.3945502-1-xu.yang_2@nxp.com/
> > These patches remove a lot of the logic relating CPUIDs to PMUs so
> > that the PMU isn't part of the question when finding a metric table.
> > For time reasons, it doesn't go as far as allowing system metrics
> > without a metric table as a metric table is needed for metrics to
> > refer to other metrics, and the refactoring of that resolution is a
> > hassle.
> > 
> > Ian Rogers (7):
> >    perf header: Move is_cpu_online to numa bench
> >    perf header: Refactor get_cpuid to take a CPU for ARM
> >    perf arm64 header: Use cpu argument in get_cpuid
> >    perf header: Avoid transitive PMU includes
> >    perf header: Pass a perf_cpu rather than a PMU to get_cpuid_str
> >    perf jevents: Add map_for_cpu
> >    perf pmu: Move pmu_metrics_table__find and remove ARM override
> > 
> > Xu Yang (1):
> >    perf jevents: fix breakage when do perf stat on system metric
> > 
> >   tools/perf/arch/arm64/util/arm-spe.c     | 14 +---
> >   tools/perf/arch/arm64/util/header.c      | 73 ++++++++++-----------
> >   tools/perf/arch/arm64/util/pmu.c         | 20 ------
> >   tools/perf/arch/loongarch/util/header.c  |  4 +-
> >   tools/perf/arch/powerpc/util/header.c    |  4 +-
> >   tools/perf/arch/riscv/util/header.c      |  4 +-
> >   tools/perf/arch/s390/util/header.c       |  6 +-
> >   tools/perf/arch/x86/util/auxtrace.c      |  3 +-
> >   tools/perf/arch/x86/util/header.c        |  5 +-
> >   tools/perf/bench/numa.c                  | 53 +++++++++++++++
> >   tools/perf/builtin-kvm.c                 |  4 +-
> >   tools/perf/pmu-events/empty-pmu-events.c | 39 ++++++-----
> >   tools/perf/pmu-events/jevents.py         | 39 ++++++-----
> >   tools/perf/pmu-events/pmu-events.h       |  2 +-
> >   tools/perf/tests/expr.c                  |  5 +-
> >   tools/perf/util/env.c                    |  4 +-
> >   tools/perf/util/expr.c                   |  6 +-
> >   tools/perf/util/header.c                 | 82 ++++++++----------------
> >   tools/perf/util/header.h                 | 23 +++----
> >   tools/perf/util/pmu.c                    | 25 --------
> >   tools/perf/util/pmu.h                    |  2 -
> >   tools/perf/util/probe-event.c            |  1 +
> >   22 files changed, 189 insertions(+), 229 deletions(-)
> > 
> 
> Reviewed-by: James Clark <james.clark@linaro.org>

Thanks for reviewing James, I'm doing a round of tests to push what I
have in tmp.perf-tools-next to perf-tools-next so that it gets test
merged on linux-next and later today I'll escape from the holiday and
take a last look on this series, apply and test.

- Arnaldo

