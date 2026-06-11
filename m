Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5839ECD98CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 12:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kp9O7wzrL6h0rXcNXk1AY6eWMkCkBpieYXogJ1TapEg=; b=B6VllwYdoD8BX8KA6V0oyfISRQ
	9Ux1V4/2qokB5usWEF65eXs1RzSHIb/rdrJBdURoPHHgCqX1D8AZKr9C7ClqHIzmnWu8sxL3T83ox
	LvbQAWsqIJYnYsglvPYT49hLGsSnfXsmBWQ8pWwCMY+CZYhl8j0c/QDTXMiakq0bq6l9ITGXi/MP7
	q/QIs8MQyGBkP6WNZzAAdYsbLgiwWoRRQ+P2ZGjfeDtYfApfiOiHT4eTBbszI4G4Q54tcCbqm9vwH
	3nC7AnV22pKXwsMj52y3Hg1ZMhUEJrNzHZXS5Xnd9eVx+kZNlRDqglT0kzqhwBQG+NQ1RR/dxlugj
	jkefw5Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXejm-00000009Qex-3ia0;
	Thu, 11 Jun 2026 12:42:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXejk-00000009QeM-21RA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 12:42:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0400C497;
	Thu, 11 Jun 2026 05:42:12 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4B70E3FD88;
	Thu, 11 Jun 2026 05:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781181736; bh=MSudZ5zCzii3klUWWm5+I6Li1DcZAve7/o6hW7n+OBc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DOYVnOIZVOG54P+iZ8fsBoQ2cxMCONmAJLNk1I8SaIdNqPXPXDbVUcxqZzugyRg57
	 rhMcfwNIOSoenHsMC4IXjirg3vrQb7kt8hIMkHrauLsJDwBvPUeV4m/9xI6KrnN4JU
	 +MQ9VgNXKuTTmwMeEhCLBTXMr3SlDemCyB0AmzUQ=
Date: Thu, 11 Jun 2026 13:42:14 +0100
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
	linux-perf-users@vger.kernel.org,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	Mike Leach <mike.leach@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Al Grant <al.grant@arm.com>,
	Paschalis Mpeis <paschalis.mpeis@arm.com>,
	Amir Ayupov <aaupov@fb.com>
Subject: Re: [PATCH v7 8/8] perf test: Add Arm CoreSight callchain test
Message-ID: <20260611124214.GX101133@e132581.arm.com>
References: <20260611-b4-arm_cs_callchain_support_v1-v7-0-1ba770c862ae@arm.com>
 <20260611-b4-arm_cs_callchain_support_v1-v7-8-1ba770c862ae@arm.com>
 <c6f6766b-ef3f-4260-9569-620d351027ff@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c6f6766b-ef3f-4260-9569-620d351027ff@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_054220_563826_73917295 
X-CRM114-Status: GOOD (  18.59  )
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

On Thu, Jun 11, 2026 at 10:11:37AM +0100, James Clark wrote:
> 
> 
> On 11/06/2026 8:57 am, Leo Yan wrote:
> > Add a CoreSight shell test for synthesized callchains.
> > 
> > The test uses the new callchain workload to generate trace and decodes
> > it with synthesis callchain. It then verifies that the instruction
> > samples show the expected callchain push and pop.
> > 
> > Use control FIFOs so tracing starts only around the workload, which
> > keeps the trace data small. The test is limited to arm64 systems with
> > the cs_etm event available.
> > 
> > After:
> > 
> >    perf test 136 -vvv
> >    136: CoreSight synthesized callchain:
> >    --- start ---
> >    test child forked, pid 3539
> >    ---- end(0) ----
> >    136: CoreSight synthesized callchain			: Ok
> > 
> > Assisted-by: Codex:GPT-5.5
> > Signed-off-by: Leo Yan <leo.yan@arm.com>
> > ---
> >   tools/perf/Documentation/perf-test.txt        |   6 +-
> >   tools/perf/tests/builtin-test.c               |   1 +
> >   tools/perf/tests/shell/coresight/callchain.sh | 168 ++++++++++++++++++++++++++
> >   tools/perf/tests/tests.h                      |   1 +
> >   tools/perf/tests/workloads/Build              |   2 +
> >   tools/perf/tests/workloads/callchain.c        |  24 ++++
> 
> Maybe "syscall" is a better name? There's not any difference between this
> one and others like the deterministic one I added with regards to the
> callchain.

The callchain workload has function calls in userspace and system call
for the switch between userspace and kernel.

Connecting to another comment for not static attribute to avoid LTO's
function name tweaking, I will rename functions with prefix
"callchain_", this can dismiss concern for naming conflict.

For above two reasons, I will keep the name.

Thanks,
Leo

