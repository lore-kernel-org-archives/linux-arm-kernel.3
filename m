Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2115A606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 18:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dZrVRmno;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=MNVGjWhQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=63CZrMtGcQlClpiL21azWW0LHyKIVqNYpAKHa21JDoo=; b=dZrVRmnog6/pvBO+WKQgn5H4em
	rzLIJ6xg1bPC21S4IsaDDv8fYt2dKssQisWhvL/oawaTyvDCkt8a/0kl4XfXGHZnmzOFENRjR1geo
	oc+e1hDT/SS/i/Tpbk6O6b894HjX5jHXK12aFiO73dDe6OFuXJd2lgxzRVUATzR/v9o45D2KmrerF
	9gU08r6Nu6Uw2SAxtRdhY+k1HfLhoVDeGhDiCWVzX4kt3W/wg5NunI74FaUs3WMiEdciVnrXWkP8I
	gcRwUCrQLdAe9aWidOV1VrWXe4xLQ5E5xKc9Tk8QHM9pSFypGx4pYLXodol5x0bNkqtXliT4uUSYj
	+wGKi2KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMUTX-0000000A2oY-08uf;
	Thu, 29 Oct 2026 18:03:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMUTU-0000000A2ng-2fPd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 18:03:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4DA501682;
	Thu, 29 Oct 2026 11:03:35 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E77923F673;
	Thu, 29 Oct 2026 11:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793297018; bh=i8iHH4lB14MXZsmaBvM9GhJ2IkOhplEK+iLl3dHE+BU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MNVGjWhQQrvfjLwXQVHwIY9Gt/WjKBxsN3KkL/NCujlzi/NjOXdY7wGey76gB5QtY
	 +NNscg5odXnpfAwSyK29F0DnVe55rUgbiHK/scEPp7rw0Xj/yH5CHyxaHEr8DMuucr
	 kY6w7DE9juSejGZ87yReyMeGsp+EGaj2wJC+YdvQ=
Date: Thu, 29 Oct 2026 18:03:35 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Mike Leach <mike.leach@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Subject: Re: [PATCH v2 11/14] perf tests: Check CoreSight IRQ entry and exit
Message-ID: <20261029180335.GD9176@e132581.arm.com>
References: <20260923-perf_cs_etm_fix_non_taken-v2-0-6ab8c07a5455@arm.com>
 <20260923-perf_cs_etm_fix_non_taken-v2-11-6ab8c07a5455@arm.com>
 <d371220f-9ad2-41ca-a2a5-930c46801c31@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d371220f-9ad2-41ca-a2a5-930c46801c31@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_110340_764083_5AC40608 
X-CRM114-Status: GOOD (  22.67  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Sep 29, 2026 at 01:22:55PM +0100, James Clark wrote:
> 
> On 23/09/2026 16:21, Leo Yan wrote:
> > Add an AArch64 branch_not_taken_loop workload and a CoreSight shell test
> > checking IRQ entry and exit PCs. Use cpu-clock generates timer
> > interrupts.
> > 
> > Retry at different timer frequencies and skip if no complete pair is
> > captured.
> 
> Maybe we need to look into storing existing recordings somewhere or
> committing small ones into the repo again. This test took 3 minutes to run
> on my N1SDP, which is 3x longer than the entire Coresight suite, and then it
> skipped anyway:
> 
> 173: CoreSight IRQ entry and exit:
> ---- start ----
> test child forked, pid 6804
> Recording timer IRQs at 1000 Hz
> No complete exception entry/exit pair
> No complete IRQ pair in this recording
> Recording timer IRQs at 4000 Hz
> No complete exception entry/exit pair
> No complete IRQ pair in this recording
> Recording timer IRQs at 10000 Hz
> No complete exception entry/exit pair
> No complete IRQ pair in this recording
> [Skip] No complete IRQ pair after three recordings
> ---- end(-2) ----
> 173: CoreSight IRQ entry and exit
> 
> 
> Really this test is only looking for how a single exception on a single
> branch is decoded, it shouldn't be affected by how it was recorded. Even a
> few bytes of trace would be enough to test it. Or maybe we could add some
> kind of unit test framework that mocks out OpenCSD and allows us to script
> how different packets affect the decoder?

As discussed I will reduce the loop in branch_not_taken_loop.c and
don't skip the test if no IRQ pair found.

> > +++ b/tools/perf/tests/shell/coresight/irq_entry_exit.sh
> > @@ -0,0 +1,37 @@
> > +#!/bin/bash
> > +# SPDX-License-Identifier: GPL-2.0
> > +# CoreSight IRQ entry and exit (exclusive)
> > +
> > +# shellcheck source=../lib/coresight_exception.sh
> 
> No need for these anymore, see https://lore.kernel.org/linux-perf-users/20260921-james-perf-shellcheck-source-v1-1-adcfc107c997@linaro.org/

Will do.

> > +record_trace_with_cpu_clock()
> > +{
> > +	local clock_opts=()
> > +
> > +	record_freq=$1
> > +	shift
> > +
> > +	# A zero frequency omits the cpu-clock event.
> > +	if [ "$record_freq" -gt 0 ]; then
> > +		# Generate timer IRQs without delivering a signal to the workload.
> > +		clock_opts=(-e cpu-clock:u -F "$record_freq")
> > +	fi
> > +
> > +	# FIFO control bounds the trace to the workload.
> > +	# --kcore supplies the running kernel's instructions for decoding.
> > +	taskset -c "$cpu" perf record -B --no-bpf-event --per-thread --kcore \
> > +		-e cs_etm/timestamp=0/uk "${clock_opts[@]}" \
> > +		-m,4M -D -1 --control fifo:"$tmpdir/ctl","$tmpdir/ack" \
> > +		-o "$tmpdir/data" -- \
> > +		perf test --record-ctl fifo:"$tmpdir/ctl","$tmpdir/ack" -w "$@" \
> > +		> "$tmpdir/record.log" 2>&1
> 
> There's a shellcheck warning here:
> 
>   (warning): Word is of the form "A"B"C" (B indicated). Did you mean "ABC"
> or "A\"B\"C"?
> 
> You can avoid it by passing the whole path as "$cf" and "$af" like the other
> coresight tests.

Will do. Thanks for suggestions!

