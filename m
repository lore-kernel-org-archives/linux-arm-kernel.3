Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4FEDC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 15:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Expx/ye3oE5pvFyYQ9T+yKNsmR+Xjb8BtmKwr4b2n40=; b=RqJZe4YtA6N0ftiPyXixqJyLBV
	qma5JSFG9B+wZD8/EY1lvEVH7ul4CHEZyaZPgDxQmN/U0qfeK7+725qXHOJWATDOzbLR+yTWdpV7T
	E7rZmyb84wsfKpouWxr43VJOQkXePOWzrD9t4g6v6PcaFe+iL4OxT3qk0VuRSaZwbsjw4pfeS0msE
	lr8AlhGxHQWUCiuU/fKBumMdLJp40/V/sDfyaZdhWGxjV8iADrJldvRt9Uong2bboSWwyWzku4n3T
	6g2dPR4OBWwskKn32P0CjzCaiqiVArs/owFU6Mcgc68SU0gXWV29KnQ0OTyynvfW8+Xia+XzK4lpJ
	aki0oP9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7FVE-00000007hhC-1M3b;
	Tue, 22 Apr 2025 15:25:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7EKW-00000007RC7-0R1w
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 14:10:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E38D6152B;
	Tue, 22 Apr 2025 07:10:26 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D1D853F66E;
	Tue, 22 Apr 2025 07:10:30 -0700 (PDT)
Date: Tue, 22 Apr 2025 15:10:26 +0100
From: Leo Yan <leo.yan@arm.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: James Clark <james.clark@linaro.org>, Yabin Cui <yabinc@google.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
	Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Liang Kan <kan.liang@linux.intel.com>
Subject: Re: [PATCH 1/2] perf: Allow non-contiguous AUX buffer pages via PMU
 capability
Message-ID: <20250422141026.GH28953@e132581.arm.com>
References: <20250421215818.3800081-1-yabinc@google.com>
 <20250421215818.3800081-2-yabinc@google.com>
 <48640298-effa-42d4-9137-a18a51637f03@linaro.org>
 <aAeQcgmL-iqGbG_g@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAeQcgmL-iqGbG_g@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_071032_178157_58186319 
X-CRM114-Status: GOOD (  23.20  )
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

On Tue, Apr 22, 2025 at 02:49:54PM +0200, Ingo Molnar wrote:

[...]

> > Hi Yabin,
> > 
> > I was wondering if this is just the opposite of 
> > PERF_PMU_CAP_AUX_NO_SG, and that order 0 should be used by default 
> > for all devices to solve the issue you describe. Because we already 
> > have PERF_PMU_CAP_AUX_NO_SG for devices that need contiguous pages. 
> > Then I found commit 5768402fd9c6 ("perf/ring_buffer: Use high order 
> > allocations for AUX buffers optimistically") that explains that the 
> > current allocation strategy is an optimization.
> > 
> > Your change seems to decide that for certain devices we want to 
> > optimize for fragmentation rather than performance. If these are 
> > rarely used features specifically when looking at performance should 
> > we not continue to optimize for performance? Or at least make it user 
> > configurable?
> 
> So there seems to be 3 categories:
> 
>  - 1) Must have physically contiguous AUX buffers, it's a hardware ABI. 
>       (PERF_PMU_CAP_AUX_NO_SG for Intel BTS and PT.)
> 
>  - 2) Would be nice to have continguous AUX buffers, for a bit more 
>       performance.
> 
>  - 3) Doesn't really care.
> 
> So we do have #1, and it appears Yabin's usecase is #3?

In Yabin's case, the AUX buffer work as a bounce buffer.  The hardware
trace data is copied by a driver from low level's contiguous buffer to
the AUX buffer.

In this case we cannot benefit much from continguous AUX buffers.

Thanks,
Leo

