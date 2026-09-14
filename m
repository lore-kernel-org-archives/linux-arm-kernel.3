Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC5ECC88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 01:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cjQJOduHqAwj6o7DipSItmVFnQfPwlvihYn4mDcpUD0=; b=Mwrgpa0okPEqCR9pU1FEyMJlDd
	05+VUrPb13cCWu5ao2xkTrWUhzMVbgvDIAzZr4PW4SoT1P3yMimOwJS8sYVyGHPYxFA/VlEUgIouF
	XxoNNA3vwUph10ZcJReOz+PWXrF6Fi4YhcI4X1D3x5dU1aN8uoY3qFQ4CHju+U4T9lzfpvCU4zsFT
	BEBcyuzIwHFaxEI+8/qpzbZ9KG/2wZ765O6K6ng0Si2o8i2zU7ILa6nuEr0uUqImqEolznbjCrVMA
	kEMR77zX4TX0m60oMGz55R41OFwgP9o66f1SqhhKVc5HWXEQUbh0OcMgDnQ818Qi6pSVTH4tZp8Qj
	kiwO+nWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5vN8-000000028oq-3U9u;
	Mon, 14 Sep 2026 01:20:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5vN6-000000028ok-3N4z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 01:20:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BA57261057;
	Mon, 14 Sep 2026 01:20:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EF0F1F000FF;
	Mon, 14 Sep 2026 01:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789348835;
	bh=cjQJOduHqAwj6o7DipSItmVFnQfPwlvihYn4mDcpUD0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kq24UEU3HqY8/TTUrb1EXUbWdo5ZauWVeW/Z5ll7ftQHqY4sVATatElsiAsoBMR6q
	 D+d8stydFiSSF70rz4XefQXbO/yl93pWYgxUwmcVaIY7qkMn86/thfoU+Vdz8H3D9p
	 /59xH3aSNtdc27ZV6rpmcEWnxftOSsxILMWWvfXL5tkRE3apKASq2hSI6iP9hjQUla
	 FglS3eUuU8hbp/h41PmnY583lhfq8P3L9lapGAriHK4U+RmWUAD2zcigPP9bkIp5AT
	 7RxBcSDSqSM6zvdg3OBqzg1ZBLcLhbHpCwpjPSh11u9fSqDLT6dveM0/K4Ln7FmtqZ
	 DenlbWQmZFsjw==
Date: Sun, 13 Sep 2026 22:20:31 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Suyash Mahar <smahar@meta.com>, Leo Yan <leo.yan@linux.dev>,
	linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 00/14] perf cs-etm: Per-thread mode fixes and snapshot
 wrap support
Message-ID: <aqdL33fw9AoxTrPq@x2>
References: <20260811-james-cs-unformatted-per-thread-fix-v1-0-90565318f5f8@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260811-james-cs-unformatted-per-thread-fix-v1-0-90565318f5f8@linaro.org>
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

On Tue, Aug 11, 2026 at 04:30:03PM +0100, James Clark wrote:
> Fix a few issues with per-thread mode:
>   - With TRBE, thread migrations hit a queue without a decoder assert
>   - On nVHE, everything looks like guest trace instead of host
>   - Tracing multiple threads didn't really work

This series applies cleanly to perf-tools-next but has no Reviewed-by
nor was processed by Sashiko.

Can somebody from the ARM camp take a look at it, please?

Thanks,

- Arnaldo
 
> After adding a tests for those, it turns out there were some snapshot
> bugs not picked up by the other snapshot tests. That showed that the
> different snapshot searches for Intel BTS and Arm SPE were inconsistent
> and I think all tracers can benefit from using the same pointer fixup
> logic, so that gets refactored into the common auxtrace.c. Then SPE can
> just share the Intel BTS search as it was obviously copied from it
> originally. IntelPT keeps the more advanced duplicate data search, but
> in the future that could probably be made the common one and all tracers
> would benefit from using it (except maybe BTS if it always has a very
> small buffer, but I doubt the overhead of the duplicate search would be
> an issue). For now this is more of a refactor rather than behavioral
> change so don't do that yet.
> 
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
> James Clark (14):
>       perf cs-etm: Fix nVHE per-thread decoding
>       perf cs-etm: Warn for invalid timestamp option
>       perf cs-etm: Turn on context packet timestamps in per-thread mode
>       perf cs-etm: Use per-CPU queues for per-thread mode
>       perf cs-etm: Increase default timestamp generation period
>       perf auxtrace: Turn Intel BTS snapshot search into a generic one
>       perf arm-spe: Use generic snapshot search
>       perf auxtrace: intel-pt: Use new snapshot_has_wrapped callback
>       perf cs-etm: Queue partial AUX records
>       perf cs-etm: Don't print missing buffers in snapshot mode
>       perf auxtrace: cs-etm: Capture wrapped snapshots
>       perf test: Allow infinite named_thread loops
>       perf test: Add test for per-thread mode
>       perf cs-etm: Test multiple per-thread threads
> 
>  Documentation/userspace-api/perf_ring_buffer.rst   |   6 +-
>  tools/perf/Documentation/perf-test.txt             |   2 +-
>  tools/perf/arch/arm/util/cs-etm.c                  |  30 ++++-
>  tools/perf/arch/arm64/util/arm-spe.c               | 147 +--------------------
>  tools/perf/arch/x86/util/intel-bts.c               | 115 +---------------
>  tools/perf/arch/x86/util/intel-pt.c                |  58 +++-----
>  .../perf/tests/shell/coresight/per-thread-multi.sh |  78 +++++++++++
>  tools/perf/tests/shell/coresight/per-thread.sh     |  48 +++++++
>  .../perf/tests/shell/coresight/raw_dump_stress.sh  |   5 -
>  tools/perf/tests/workloads/named_threads.c         |   7 +-
>  tools/perf/util/auxtrace.c                         | 136 +++++++++++++++++--
>  tools/perf/util/auxtrace.h                         |  20 ++-
>  tools/perf/util/cs-etm.c                           |  98 ++++++++++----
>  13 files changed, 382 insertions(+), 368 deletions(-)
> ---
> base-commit: bf10e6ee2ac3034c9068e03eed418fd16961984e
> change-id: 20260605-james-cs-unformatted-per-thread-fix-50e723aa7f0e
> 
> Best regards,
> --  
> James Clark <james.clark@linaro.org>

