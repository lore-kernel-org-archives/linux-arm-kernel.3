Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0764CC6B1D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 10:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nBmmlrjRf6kiAPDnWG0bIPmLpvBk+xT5O40dRmfvp1g=; b=MwZgLEmKgMSgSSPRNg+it9MEdY
	BTbopBfFLyk3bcKDnHJE2Xstn8v+QYuW6G1gOvRGZEhceI8mZKLr6U92h6rOwSsHJwa8Cy2FyYzPJ
	89rUufpw+te7Kigg04nxwSolr4ML1o//1iFL3JnczO465cPjgKZtJYUeTDg77NPSY6d+T35mvR8Tu
	B8vxkhoCyoou792EcBVgWeLNozNQKu8d7w+xV9pqZgk8dMtLjOUoc5Y+Y72cighSO/h2/gw6RTl+D
	McfYg40f1UL+GGXK3n8JphEZ9nTD2VhCXG5E5cU1uw72MU2qKunYYS45KkVP/qP48mhr8PWae3IDF
	WdTk40mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGwCQ-0000000FCrM-1Onc;
	Wed, 14 Oct 2026 10:27:06 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGwCO-0000000FCqz-1irY
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 14 Oct 2026 10:27:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=nBmmlrjRf6kiAPDnWG0bIPmLpvBk+xT5O40dRmfvp1g=; b=VIHanN21Peaph5zThAGFzLv7J6
	adaWTxv+LFZ9iHD6K+I1uqxMiDOfTdwt4dwa1WSORjDUPT6o9h5ZoTfCJHuRlCWja+zQ+Mp9sF+IP
	PwPiI34+E4crA25WYxEJdQCZ/5T0gS9NT812fSr7o4JveXv3BAZR6WqTWgGOqiRShDDgCCqZogEOq
	oVkPngrFalNvy7telg+TitooXXFcL/p0pOirl3C9MWiwSNiL6Ca7hEzkJBpu+rCWbKSjWQLJtCNLW
	rv4CbD53FaewVRf2ETA7Hg2242/Af7hoaTDHyNavba0kiwsJH9UTPcnhDgfRBh3mla/goInICx5xz
	4qrvk0Ig==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGwCL-00000002tBD-2GdW;
	Wed, 14 Oct 2026 10:27:01 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id A95CA30063F; Wed, 14 Oct 2026 12:27:00 +0200 (CEST)
Date: Wed, 14 Oct 2026 12:27:00 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Haris Okanovic <harisokn@amazon.com>
Cc: Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] perf/core: Add PERF_PMU_SCOPE_DEVICE
Message-ID: <20261014102700.GC4121339@noisy.programming.kicks-ass.net>
References: <20261013185603.1347265-1-harisokn@amazon.com>
 <20261013185603.1347265-3-harisokn@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013185603.1347265-3-harisokn@amazon.com>
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

On Tue, Oct 13, 2026 at 01:56:01PM -0500, Haris Okanovic wrote:
> Add a "device" pmu::scope for PMUs counted on a single CPU drawn
> from a driver-supplied set instead of a fixed topology.
> 
> This mechanism is implemented by new callbacks: filter_allowed_cpus()
> is invoked to constrain the running CPU set to an allowed set for a
> particular device; migrate_cpu() is used to perform any device specific
> migration steps. Both are optional, e.g. for devices that can run on
> any CPU or have no additional migration steps.
> 
> Placement initially happens in perf_pmu_register() before the PMU
> becomes visible, and is subsequently re-evaluated on hotplug events.
> A new CPU selection is made by cpumask_any_distribute() to spread out
> load from multiple devices, but only when the previous CPU selection is
> offline or no longer allowed by filter_allowed_cpus().
> 
> PMU events of these devices follow the chosen CPU. They are initially
> bound to a CPU in perf_try_init_event() then reassigned by
> perf_pmu_migrate_context() when a new CPU is selected.

> 
> The initial CPU assignment can race with migration, leaving a stranded
> event. A sequence counter is added to close this gap without additional
> locks. A count in struct pmu increments on each migration and is copied
> to struct perf_event on init. The copied count is checked again before
> the event is installed, under the same context mutex, which causes
> perf_event_open() and perf_event_create_kernel_counter() to return -EBUSY
> during migration periods.

I'm not entirely sure on this. How is this race different from changing
CPU on hotplug? 

