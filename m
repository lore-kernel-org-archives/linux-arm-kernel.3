Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32122C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 14:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5WCKGCO0L1xJqwI2TikqeNKYi51kTgCx+YW/q/lUiL4=; b=qywVDT+Ld9PJ5s7XdjyeWi/jSH
	evfYOmc8gCHk+EVo15AGMNbzrfZG4WqTMLMsCTsMT2TwrFq/KGJcWjROxXpyejLEiVUD+tNPNTJ1s
	sx/NcXFlid/RsdVAmD6z6NiR/50l0hckSoP7K3Ke8iKFlXEBMohZvOiuhmdHyqlJXQ3q/LD1logCe
	tA06bqpvM98673vqopFrTT1SJdo9XWeRNYU8nhXYQBSYKl2CUIYka5qd0BP3kLbmI2RMdocE2uYgZ
	4A65ejQ9g2JyY+fHmdN4PB15bAJy9u1acAUyEuadTBZwqraRaZaHEcus4LElE6Zl+AScsGjx9YQRi
	fHjM26kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7EJH-00000007Qvj-0UB8;
	Tue, 22 Apr 2025 14:09:15 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7D4a-00000007Bmv-2u3M
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 12:50:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B4D82A4BA23;
	Tue, 22 Apr 2025 12:44:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FAC9C4CEE9;
	Tue, 22 Apr 2025 12:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745326199;
	bh=zGK1SYvl1R3qX4Muyg2URTmK/fEOJmlqm6dSjkPeR90=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NwA3/5J9Ha5NdSIjddtSk2H5ta118ishcIEEwQOH3/kIAelihtsb9UcFAYQxemhHS
	 bi+jk1ryXPj4T1zPSC4Ck44ocqOrd+tm9IRodQAjwzwpt8y48u/W/fqFIPJvgibOF0
	 acROZXRvsitp3oBYOazJIhGaVwTui2wAFREzWwaIRbWRtDA1y2XXm5SPOb8eBI/Ari
	 6Wh1x5rIqZTQNeP9Sjw31E/8oXvN4/zvrEEIhYhy1P84pmIsTqcYRNO9Z6n7QVDnsg
	 YSO+CdirFjG/zdr60H9LjYMbNkroUBoBpKB6VsUzUQcsH8NiyADbDJ+v33L4BFwRwt
	 F1RPuaLlSCh3A==
Date: Tue, 22 Apr 2025 14:49:54 +0200
From: Ingo Molnar <mingo@kernel.org>
To: James Clark <james.clark@linaro.org>
Cc: Yabin Cui <yabinc@google.com>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
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
Message-ID: <aAeQcgmL-iqGbG_g@gmail.com>
References: <20250421215818.3800081-1-yabinc@google.com>
 <20250421215818.3800081-2-yabinc@google.com>
 <48640298-effa-42d4-9137-a18a51637f03@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <48640298-effa-42d4-9137-a18a51637f03@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_055000_855356_486B16AA 
X-CRM114-Status: GOOD (  31.63  )
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


* James Clark <james.clark@linaro.org> wrote:

> 
> 
> On 21/04/2025 10:58 pm, Yabin Cui wrote:
> > For PMUs like ARM ETM/ETE, contiguous AUX buffers are unnecessary
> > and increase memory fragmentation.
> > 
> > This patch introduces PERF_PMU_CAP_AUX_NON_CONTIGUOUS_PAGES, allowing
> > PMUs to request non-contiguous pages for their AUX buffers.
> > 
> > Signed-off-by: Yabin Cui <yabinc@google.com>
> > ---
> >   include/linux/perf_event.h  | 1 +
> >   kernel/events/ring_buffer.c | 6 ++++++
> >   2 files changed, 7 insertions(+)
> > 
> > diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
> > index 0069ba6866a4..26ca35d6a9f2 100644
> > --- a/include/linux/perf_event.h
> > +++ b/include/linux/perf_event.h
> > @@ -301,6 +301,7 @@ struct perf_event_pmu_context;
> >   #define PERF_PMU_CAP_AUX_OUTPUT			0x0080
> >   #define PERF_PMU_CAP_EXTENDED_HW_TYPE		0x0100
> >   #define PERF_PMU_CAP_AUX_PAUSE			0x0200
> > +#define PERF_PMU_CAP_AUX_NON_CONTIGUOUS_PAGES	0x0400
> >   /**
> >    * pmu::scope
> > diff --git a/kernel/events/ring_buffer.c b/kernel/events/ring_buffer.c
> > index 5130b119d0ae..87f42f4e8edc 100644
> > --- a/kernel/events/ring_buffer.c
> > +++ b/kernel/events/ring_buffer.c
> > @@ -710,6 +710,12 @@ int rb_alloc_aux(struct perf_buffer *rb, struct perf_event *event,
> >   		max_order = ilog2(nr_pages);
> >   		watermark = 0;
> >   	}
> > +	/*
> > +	 * When the PMU doesn't prefer contiguous AUX buffer pages, favor
> > +	 * low-order allocations to reduce memory fragmentation.
> > +	 */
> > +	if (event->pmu->capabilities & PERF_PMU_CAP_AUX_NON_CONTIGUOUS_PAGES)
> > +		max_order = 0;
> >   	/*
> >   	 * kcalloc_node() is unable to allocate buffer if the size is larger
> 
> Hi Yabin,
> 
> I was wondering if this is just the opposite of 
> PERF_PMU_CAP_AUX_NO_SG, and that order 0 should be used by default 
> for all devices to solve the issue you describe. Because we already 
> have PERF_PMU_CAP_AUX_NO_SG for devices that need contiguous pages. 
> Then I found commit 5768402fd9c6 ("perf/ring_buffer: Use high order 
> allocations for AUX buffers optimistically") that explains that the 
> current allocation strategy is an optimization.
> 
> Your change seems to decide that for certain devices we want to 
> optimize for fragmentation rather than performance. If these are 
> rarely used features specifically when looking at performance should 
> we not continue to optimize for performance? Or at least make it user 
> configurable?

So there seems to be 3 categories:

 - 1) Must have physically contiguous AUX buffers, it's a hardware ABI. 
      (PERF_PMU_CAP_AUX_NO_SG for Intel BTS and PT.)

 - 2) Would be nice to have continguous AUX buffers, for a bit more 
      performance.

 - 3) Doesn't really care.

So we do have #1, and it appears Yabin's usecase is #3?

I strongly suspect that #2 and #3 are mostly the same in practice, and 
that we don't really need a lot of differentiation and complexity here, 
just the AUX_NO_SG flag that must have a max-order allocation - all 
other cases should allocate the AUX buffer in a default-nice, 
MM-friendly way.

Thanks,

	Ingo

