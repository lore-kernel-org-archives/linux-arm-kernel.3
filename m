Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 602FED2ED0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 10:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fZB1XrOVGx5I94foWgQdIF1e5tXPlhCTn5G2L4aKbXM=; b=A9jFQMZ+zSaGQm27bcgPptQYaK
	sqkaZBAMcuqmJmY8rSP4NMJhRSOCHQyL1JXri0Nf1rnA2He15ogwQZEbU0qV6ANoxoitAM0VJJZhM
	9nD42q1FFSyFwt0tVy5oFKS7jHuhPEuixiKhQrZGXaGa1Jm/HHH3TyuioPlw/DA1TIEGQQB3y+KOv
	Q/kGmtxEP5HheivxVbZcOjx2ZVBdig8fsJQd+lD7QAJELAqOveyLSET8shcYlWtlfc5VtkIVteVKo
	CBDqNKihuctaOYpaQfrJdqWUp/5Hci/kSQISmYMPGmN1MEsiZOvRo281mWBdR98zIAJiGRdn8GSQf
	0OeFHJxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi9EN-00000003eAo-1rhm;
	Tue, 20 Jan 2026 10:45:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi9EL-00000003e9u-2umH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 10:45:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 93E291476;
	Tue, 20 Jan 2026 02:44:53 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BAA503F694;
	Tue, 20 Jan 2026 02:44:59 -0800 (PST)
Date: Tue, 20 Jan 2026 10:44:57 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	Leo Yan <leo.yan@linux.dev>, Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Thomas Falcon <thomas.falcon@intel.com>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] perf cs-etm: Fix decoding for sparse CPU maps
Message-ID: <20260120104457.GG2732125@e132581.arm.com>
References: <20260119-james-perf-coresight-cpu-map-segfault-v2-0-56b956a629ee@linaro.org>
 <20260119-james-perf-coresight-cpu-map-segfault-v2-1-56b956a629ee@linaro.org>
 <20260119111509.GD1286628@e132581.arm.com>
 <3b06ea25-2516-406c-8b78-c359d3fb2aa6@linaro.org>
 <20260119145337.GB2732125@e132581.arm.com>
 <dd9a3cde-ea9f-4c53-b537-f15767bf4d99@linaro.org>
 <20260119153846.GD2732125@e132581.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260119153846.GD2732125@e132581.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_024501_786310_F1C18EF3 
X-CRM114-Status: GOOD (  14.72  )
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

On Mon, Jan 19, 2026 at 03:43:18PM +0000, Coresight ML wrote:

[...]

> > > > > > +		auxtrace_fragment.auxtrace.idx = etmq->queue_nr;

> Indeed, per-thread mode needs to be handled separately.
> 
> On the Juno board (6 CPUs), I see "etmq->queue_nr=6".  It seems a bit
> odd that this value is used as the index.  Even in per-thread mode, the
> index is still set to 6.  For correctness, should we instead set the
> index to the CPU ID, and use 0 for per-thread mode?

Sorry I made a mistake.

I messed up "etm->queues.nr_queues" and "etmq->queue_nr".  I can confirm
that "etmq->queue_nr" stores the CPU ID and 0 for per-thread mode.  I
verified the patch:

Tested-by: Leo Yan <leo.yan@arm.com>

