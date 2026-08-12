Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B18ADC5CFCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 16:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vJygTOdKukhuIJluqdbJ7WiouK0OKaet42x7L+IQKj0=; b=kL9j4fKHyD1X+dlGlXu2WLPaS+
	bdqM4xP8BIXR4Or64K0w3GXH97X3QOW3HKOWShIa596lNC7w+LO6PEFFnydxGhD4L22/a/jcDXMNh
	fh+xG+5IyFV3i4e2e3q2SStb+fpY2r7yE/vafIxSnHmmsnMeHiNMwgZFebikt57JBnpen7bFHLrHQ
	4xjH+moOtTyXeibQW9ATBbr/IeT5SViCsAO/xbkA1e0eUjDXxe/x2i+eeYtav00pEpXZw6xW+oI/8
	PeziViVx+2jIzxI4GhCuuhfhZli4vY8nnYLDAiw/geWQkXssktkTcMIym/oaD+4HQDOHWpSa560hk
	u/DjAm7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuBRJ-0000000GYOg-0Pjh;
	Wed, 12 Aug 2026 16:04:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuBRH-0000000GYOV-3UgL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 16:04:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F1D6760A7D;
	Wed, 12 Aug 2026 16:04:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E8D81F000E9;
	Wed, 12 Aug 2026 16:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786550662;
	bh=vJygTOdKukhuIJluqdbJ7WiouK0OKaet42x7L+IQKj0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XRAkMb1z0FwoU0GOlr0v1j1Qh82G3qkt9/i6Ka0KY5hWaHAlqCiQ7f7rgfeIXUWpT
	 WMOqPQm8VIJQKDWOkbEZJnS0oqwjGIt5qTcgDr2NDzvVTd8sx3ruOPUS2l7AoYtOuZ
	 U17s9gLEGECpmn6p6oaYgM4HVS7qtFqqEeBts5YO/HuXQLuFwZM0f/VNCG6KnuOuKx
	 el8J94c/i4TxfMjBKdGqWH/KcDhwrsL9qYsBVFZXSVorCrjVI4pO6p8T3HLMOeo0EH
	 gAfx+Q9dbIqa76L4taNjBKTQAkW98FiOluYBq85ua0j7ArA/cu1uay6fwIyID7OTzO
	 wvYX6CF/UMTpQ==
Date: Wed, 12 Aug 2026 13:04:18 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: Amir Ayupov <aaupov@fb.com>, linux-perf-users@vger.kernel.org,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	linux-doc@vger.kernel.org, Mike Leach <mike.leach@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Swapnil Sapkal <swapnil.sapkal@amd.com>
Subject: Re: [PATCH 2/9] perf thread-stack: Report branch stack hw_idx as not
 available
Message-ID: <anyZgnHNV_P3fqbe@x1>
References: <20260803090640.2412336-1-aaupov@fb.com>
 <20260803090640.2412336-2-aaupov@fb.com>
 <544211a6-29c5-49ab-b9f9-543f199b9533@intel.com>
 <83378be0-1e89-4e31-94a4-ba083f0f7c8c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <83378be0-1e89-4e31-94a4-ba083f0f7c8c@intel.com>
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

On Wed, Aug 12, 2026 at 06:48:24PM +0300, Adrian Hunter wrote:
> On 11/08/2026 18:58, Adrian Hunter wrote:
> > On 03/08/2026 12:06, Amir Ayupov wrote:
> >> thread_stack__br_sample() and thread_stack__br_sample_late() fill a
> >> caller-supplied branch_stack that is typically allocated with zalloc(),
> >> leaving hw_idx as 0. Zero is a valid hardware index, so consumers that
> >> honour PERF_SAMPLE_BRANCH_HW_INDEX see a reconstructed branch stack
> >> claiming to start at LBR TOS entry 0.
> >>
> >> These branch stacks are reconstructed from instruction trace and have no
> >> hardware index at all. Set hw_idx to -1ULL, which is the established way
> >> to say "not available" and matches what intel-pt and cs-etm already put
> >> in the branch stacks they synthesise directly.
> >>
> >> Signed-off-by: Amir Ayupov <aaupov@fb.com>
> > 
> > Fixes tag?
> > 
> > Otherwise:
> > 
> > Reviewed-by: Adrian Hunter <adrian.hunter@intel.com>
> 
> On second thoughts, it seems that hw_idx is only used for stitching
> LBRs which is anyway disabled by default and only enabled by --stitch-lbr.
> 
> Setting -1ULL will prevent has_stitched_lbr() making a match, but we can
> rely on the user to decide that for themselves via --stitch-lbr.

This is one of those options that few people use as its so specialized,
do you think we could auto-enable it if we notice it is a good idea for
some specific machine and request from the user? I.e. user requests
callchains, unlimited or with a limit that is more than what we can do
without stitching: we auto stich?

- Arnaldo
 
> So, in fact, it doesn't look like this change should be needed?
> 
> > 
> >> ---
> >>  tools/perf/util/thread-stack.c | 2 ++
> >>  1 file changed, 2 insertions(+)
> >>
> >> diff --git a/tools/perf/util/thread-stack.c b/tools/perf/util/thread-stack.c
> >> index c5ce741b07446..1a3dffa83bde2 100644
> >> --- a/tools/perf/util/thread-stack.c
> >> +++ b/tools/perf/util/thread-stack.c
> >> @@ -624,6 +624,7 @@ void thread_stack__br_sample(struct thread *thread, int cpu,
> >>  	unsigned int nr;
> >>  
> >>  	dst->nr = 0;
> >> +	dst->hw_idx = -1ULL;
> >>  
> >>  	if (!ts)
> >>  		return;
> >> @@ -686,6 +687,7 @@ void thread_stack__br_sample_late(struct thread *thread, int cpu,
> >>  	bool start = false;
> >>  
> >>  	dst->nr = 0;
> >> +	dst->hw_idx = -1ULL;
> >>  
> >>  	if (!ts)
> >>  		return;
> > 

