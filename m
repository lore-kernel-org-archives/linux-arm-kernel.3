Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECC81D68BE7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 Nov 2024 19:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H9x1adwFkQdi2/mFvQQhliJfIumUrKrGgTMhTpCMAvg=; b=BgdB92ud5yejJFdsBITBnQH1lL
	eaLyUj8Gg+Uet/PuwYUwaKwCR6bBIE3P7edTZayPkB3BSSvqatI1b1Ww5KRU5FjExzwJgUTXRStW0
	yrTdptgVxohf9Nwxqjnm5bC1Oa5+b4Kl/51QoVU3u1G3iCfryeduxOIKXjLoXeal3xgKVCNekrg8J
	qQU3He9RyG7zLQJWGijCVENjEf8EyoaFVKv+ortGMcjVlGBnlKOEiYlAk1Z17CxHcGcod0zdVLS3n
	oKgYMLWyEMHBWjY4ZnjhE7pEzwzenDIFcpIIN46QS3Eb/OEfkjAXJsfUIVImvdCBj9GRjSm7fq+MH
	hRmNb6/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCOmA-0000000681N-0341;
	Sat, 16 Nov 2024 19:48:10 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCOlE-000000067wj-08OU;
	Sat, 16 Nov 2024 19:47:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8CA4FA4023C;
	Sat, 16 Nov 2024 19:45:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3692FC4CEC3;
	Sat, 16 Nov 2024 19:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731786429;
	bh=A4qVV9tDRxaJPJNkj5ZNN9jdW4qqoLjHW6sCHUJGmwY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lijy5qYMACLMDKO9zLfN0EkUShWwPvHiK09RgoEfqUrA8nMuZ7wyyw/8HkACqdJ+S
	 TJUHv8WjeYrvvCtGH+bVLgQ1Agx3sMYv7duG84oLFfVYvH45N0x/W0iugVmeJVF2QA
	 t9Xr3baoXf3AIxJqQmaooeMHwalOVSm7qArFZ2Ou2vlXcBBT3BlUwWWKELqs14CO0W
	 80v3SUgVLwghFBhUbEQ7g2fe3Sss95jMEYnw3d8uyVLMtkg+lZxd1IpNzLg4974WOK
	 M/XemHAqU5tdfQnwUWQdbx4bwRg/FqYNYv3qwat4mMhVEYwj6ReOMEpMQZiqtv3EXr
	 bYq4/SrnQZ+WQ==
Date: Sat, 16 Nov 2024 16:47:06 -0300
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
Message-ID: <Zzj2usdkgdyZ9Z8I@x1>
References: <20241107162035.52206-1-irogers@google.com>
 <215ca9a2-0a63-4d0c-8402-5cb1f2bb0794@linaro.org>
 <ZzdsCWpAULCe839R@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZzdsCWpAULCe839R@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241116_114712_205227_4DCC1000 
X-CRM114-Status: GOOD (  22.03  )
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

On Fri, Nov 15, 2024 at 12:43:05PM -0300, Arnaldo Carvalho de Melo wrote:
> On Fri, Nov 15, 2024 at 03:35:55PM +0000, James Clark wrote:
> > 
> > 
> > On 07/11/2024 4:20 pm, Ian Rogers wrote:
> > > Xu Yang <xu.yang_2@nxp.com> reported issues with the system metric
> > > lookup:
> > > https://lore.kernel.org/linux-perf-users/20241106085441.3945502-1-xu.yang_2@nxp.com/
> > > These patches remove a lot of the logic relating CPUIDs to PMUs so
> > > that the PMU isn't part of the question when finding a metric table.
> > > For time reasons, it doesn't go as far as allowing system metrics
> > > without a metric table as a metric table is needed for metrics to
> > > refer to other metrics, and the refactoring of that resolution is a
> > > hassle.
> > > 
> > > Ian Rogers (7):
> > >    perf header: Move is_cpu_online to numa bench
> > >    perf header: Refactor get_cpuid to take a CPU for ARM
> > >    perf arm64 header: Use cpu argument in get_cpuid
> > >    perf header: Avoid transitive PMU includes
> > >    perf header: Pass a perf_cpu rather than a PMU to get_cpuid_str
> > >    perf jevents: Add map_for_cpu
> > >    perf pmu: Move pmu_metrics_table__find and remove ARM override
> > > 
> > > Xu Yang (1):
> > >    perf jevents: fix breakage when do perf stat on system metric
> > > 
> > >   tools/perf/arch/arm64/util/arm-spe.c     | 14 +---
> > >   tools/perf/arch/arm64/util/header.c      | 73 ++++++++++-----------
> > >   tools/perf/arch/arm64/util/pmu.c         | 20 ------
> > >   tools/perf/arch/loongarch/util/header.c  |  4 +-
> > >   tools/perf/arch/powerpc/util/header.c    |  4 +-
> > >   tools/perf/arch/riscv/util/header.c      |  4 +-
> > >   tools/perf/arch/s390/util/header.c       |  6 +-
> > >   tools/perf/arch/x86/util/auxtrace.c      |  3 +-
> > >   tools/perf/arch/x86/util/header.c        |  5 +-
> > >   tools/perf/bench/numa.c                  | 53 +++++++++++++++
> > >   tools/perf/builtin-kvm.c                 |  4 +-
> > >   tools/perf/pmu-events/empty-pmu-events.c | 39 ++++++-----
> > >   tools/perf/pmu-events/jevents.py         | 39 ++++++-----
> > >   tools/perf/pmu-events/pmu-events.h       |  2 +-
> > >   tools/perf/tests/expr.c                  |  5 +-
> > >   tools/perf/util/env.c                    |  4 +-
> > >   tools/perf/util/expr.c                   |  6 +-
> > >   tools/perf/util/header.c                 | 82 ++++++++----------------
> > >   tools/perf/util/header.h                 | 23 +++----
> > >   tools/perf/util/pmu.c                    | 25 --------
> > >   tools/perf/util/pmu.h                    |  2 -
> > >   tools/perf/util/probe-event.c            |  1 +
> > >   22 files changed, 189 insertions(+), 229 deletions(-)
> > > 
> > 
> > Reviewed-by: James Clark <james.clark@linaro.org>
> 
> Thanks for reviewing James, I'm doing a round of tests to push what I
> have in tmp.perf-tools-next to perf-tools-next so that it gets test
> merged on linux-next and later today I'll escape from the holiday and
> take a last look on this series, apply and test.

Applied locally, pushing to tmp.perf-tools-next as I'm still testing the
hwmon case, building it on an 32-bit ARM machine:

processor	: 3
model name	: ARMv7 Processor rev 4 (v7l)
BogoMIPS	: 38.40
Features	: half thumb fastmult vfp edsp neon vfpv3 tls vfpv4 idiva idivt vfpd32 lpae evtstrm crc32 
CPU implementer	: 0x41
CPU architecture: 7
CPU variant	: 0x0
CPU part	: 0xd03
CPU revision	: 4

Hardware	: BCM2835
Revision	: a020d3
Serial		: 00000000783939e0
Model		: Raspberry Pi 3 Model B Plus Rev 1.3

- Arnaldo

