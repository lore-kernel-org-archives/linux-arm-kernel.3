Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FFB3E8783D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 14:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JImBtx2rleM56GexehanlSHjvETbI+zQg7hACbfsRAk=; b=JrhyzUun7jQOKhLbFDCKGE3x1E
	FtZfLhmcxlaz0cn5eiPoVX9kYv85CSTuDx4PjSGqtrzSq2kErzvmrT+JUO65MXkIcwylNsX07X9Az
	QplBV2yYC73m5vyUuNhxDztBCqp2nT1gP/zN5G8BJbamSc6TrcMehCdJxbZ5il7u8/aDdWttOrIk6
	4P0K6FQ9OufM2uM/lCVNrrSWH0L+dwSZ1dgSDbQ35frw4I79Ih0AIywlxTSPGWxO19jVBgGmYSPC1
	VaH9wjqGhdsYOe4sBkoDTroHB5fyEsRj0Krg4IfvQZ6qFxnzHAM/68nT6PFfdrWwWkLonB4tYdO6f
	11QGkPMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnHc6-00000006mjR-1NW8;
	Tue, 03 Feb 2026 14:42:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnHc5-00000006mjG-2rXj;
	Tue, 03 Feb 2026 14:42:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BB9B160132;
	Tue,  3 Feb 2026 14:42:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8CC1C116D0;
	Tue,  3 Feb 2026 14:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770129764;
	bh=5ezdefhGyTXcbjuTpqXROio3/fvSXh9q7JAF4cMtYiw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PPJ3309dmaWJP+2oPYosTZ8pHHHNaWduhQLA6Y1f2PFNkz5zGqmiRSrPnKMWMNTvl
	 gQq38H6X9pL2JP83mWhHokUuv0ddj1LEaWfZOXSq5QnqjTMqhzpu5HOHFawV5qWxk2
	 kGaDsgcA6sRmuP+5wXBw35FvNpAjt8q4DHZZWbQ7bEfEeGTs/G18M1e1rrAxLymKBj
	 N4ypTDLIO2EuoaW1fiocyST0Hba2gmCqn3AsIVvFsUko88G5fGRqe3+uas/vf3jzON
	 zWMhPYcWtexyipq7u4afqy1tB2pHnOxFoTRWvh5JN0FruWPJRIs+DBhIpjZ7JYVlz1
	 bz2en7O0FYuEg==
Date: Tue, 3 Feb 2026 11:42:41 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Shimin Guo <shimin.guo@skydio.com>, Yunseong Kim <ysk@kzalloc.com>,
	Athira Rajeev <atrajeev@linux.ibm.com>,
	Quan Zhou <zhouquan@iscas.ac.cn>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Dapeng Mi <dapeng1.mi@linux.intel.com>,
	Thomas Falcon <thomas.falcon@intel.com>,
	Blake Jones <blakejones@google.com>,
	Swapnil Sapkal <swapnil.sapkal@amd.com>,
	Kan Liang <kan.liang@linux.intel.com>,
	Howard Chu <howardchu95@gmail.com>,
	Anubhav Shelat <ashelat@redhat.com>,
	Aditya Bodkhe <aditya.b1@linux.ibm.com>,
	Chun-Tse Shao <ctshao@google.com>, Andi Kleen <ak@linux.intel.com>,
	Dmitry Vyukov <dvyukov@google.com>, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 0/6] perf Cross platform KVM support
Message-ID: <aYIJYVp6T4ClBw0M@x1>
References: <20260131200224.1296136-1-irogers@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260131200224.1296136-1-irogers@google.com>
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

On Sat, Jan 31, 2026 at 12:02:18PM -0800, Ian Rogers wrote:
> The existing perf kvm code is using the arch directory, which means a
> data file can only be processed on the same machine type that it was
> recorded. Switch to using the ELF machine of the session at runtime to
> set up the KVM support, making it cross-architectural. So that the ELF
> machine number is available early in initialization add it to the perf
> data file header.
> 
> v2: Wire up the perf data header to have the e_machine and allow early
>     initialization of the KVM operations based upon it.
> v1: https://lore.kernel.org/lkml/20260128074106.788156-1-irogers@google.com/

Thanks, applied to perf-tools-next,

- Arnaldo
 
> Ian Rogers (6):
>   perf test kvm: Add stat live testing
>   perf kvm stat: Remove use of the arch directory
>   perf kvm: Wire up e_machine
>   perf session: Add e_flags to the e_machine helper
>   perf header: Add e_machine/e_flags to the header
>   perf thread: Don't require machine to compute the e_machine
> 
>  tools/perf/Makefile.config                    |   4 -
>  tools/perf/arch/arm64/Makefile                |   1 -
>  tools/perf/arch/arm64/util/Build              |   1 -
>  tools/perf/arch/loongarch/Makefile            |   1 -
>  tools/perf/arch/loongarch/util/Build          |   1 -
>  tools/perf/arch/powerpc/Makefile              |   1 -
>  tools/perf/arch/powerpc/util/Build            |   1 -
>  tools/perf/arch/riscv/Makefile                |   1 -
>  tools/perf/arch/riscv/util/Build              |   2 -
>  tools/perf/arch/s390/Makefile                 |   1 -
>  tools/perf/arch/s390/util/Build               |   1 -
>  tools/perf/arch/x86/Makefile                  |   1 -
>  tools/perf/arch/x86/util/Build                |   1 -
>  tools/perf/builtin-kvm.c                      |  73 +++---
>  tools/perf/builtin-report.c                   |   4 +-
>  tools/perf/builtin-script.c                   |   6 +-
>  tools/perf/tests/shell/kvm.sh                 |  30 ++-
>  tools/perf/util/Build                         |   3 +-
>  tools/perf/util/env.h                         |   3 +
>  tools/perf/util/evsel.c                       |   6 +-
>  tools/perf/util/evsel.h                       |   1 +
>  tools/perf/util/header.c                      |  33 +++
>  tools/perf/util/header.h                      |   1 +
>  tools/perf/util/kvm-stat-arch/Build           |   6 +
>  .../kvm-stat-arch}/arm64_exception_types.h    |   0
>  .../kvm-stat-arch}/book3s_hcalls.h            |   0
>  .../kvm-stat-arch}/book3s_hv_exits.h          |   0
>  .../kvm-stat-arch/kvm-stat-arm64.c}           |  43 ++--
>  .../kvm-stat-arch/kvm-stat-loongarch.c}       |  48 ++--
>  .../kvm-stat-arch/kvm-stat-powerpc.c}         |  61 ++---
>  .../kvm-stat-arch/kvm-stat-riscv.c}           |  42 ++--
>  .../kvm-stat-arch/kvm-stat-s390.c}            |  38 ++--
>  .../kvm-stat-arch/kvm-stat-x86.c}             |  44 ++--
>  .../kvm-stat-arch}/riscv_trap_types.h         |   2 +-
>  tools/perf/util/kvm-stat.c                    | 215 +++++++++++++++++-
>  tools/perf/util/kvm-stat.h                    |  70 ++++--
>  .../scripting-engines/trace-event-python.c    |   8 +-
>  tools/perf/util/session.c                     |  62 ++++-
>  tools/perf/util/session.h                     |   2 +-
>  tools/perf/util/thread.c                      |   5 +
>  40 files changed, 606 insertions(+), 217 deletions(-)
>  create mode 100644 tools/perf/util/kvm-stat-arch/Build
>  rename tools/perf/{arch/arm64/util => util/kvm-stat-arch}/arm64_exception_types.h (100%)
>  rename tools/perf/{arch/powerpc/util => util/kvm-stat-arch}/book3s_hcalls.h (100%)
>  rename tools/perf/{arch/powerpc/util => util/kvm-stat-arch}/book3s_hv_exits.h (100%)
>  rename tools/perf/{arch/arm64/util/kvm-stat.c => util/kvm-stat-arch/kvm-stat-arm64.c} (62%)
>  rename tools/perf/{arch/loongarch/util/kvm-stat.c => util/kvm-stat-arch/kvm-stat-loongarch.c} (77%)
>  rename tools/perf/{arch/powerpc/util/kvm-stat.c => util/kvm-stat-arch/kvm-stat-powerpc.c} (78%)
>  rename tools/perf/{arch/riscv/util/kvm-stat.c => util/kvm-stat-arch/kvm-stat-riscv.c} (57%)
>  rename tools/perf/{arch/s390/util/kvm-stat.c => util/kvm-stat-arch/kvm-stat-s390.c} (77%)
>  rename tools/perf/{arch/x86/util/kvm-stat.c => util/kvm-stat-arch/kvm-stat-x86.c} (88%)
>  rename tools/perf/{arch/riscv/util => util/kvm-stat-arch}/riscv_trap_types.h (96%)
> 
> -- 
> 2.53.0.rc1.225.gd81095ad13-goog
> 

