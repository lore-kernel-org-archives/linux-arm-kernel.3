Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3366CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 17:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yJIiCnWgSgPvFV/XM+WDh+QBpIXLdDR0vEelpPig27w=; b=d05VKzcsW+ZZJ7MuvZhy30g8n7
	cvjYXGZbzV8NMM23tysNUv05L6XxdTsEW2gWRaUAJ0IRZS/pvYy+7ZA4+7JWdwIFweHpoZXkP25zS
	NjYceetJmLA6ofbFIIJx+LzXpGEvFjvJhFj/P0izCnn9U7dx/UmzWsuqbPKINUYQza0JQ3dEBMUeN
	jjFWo9XaxUtYrzzXiDiJSWz+QJej1ymBiA2vV55/99bTalqnMDAHt3u2hNXUl2XGFw/MNoi+b6OB/
	T8KrZ/5SLJ0tlCx8loiKyhCa9KM/u0Vwh4hZ0/IRiveAbfAD5zLMkSopoYyMch6gt6vNWYyTahCms
	4B7nVzrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDmhF-0000000Gwff-3HMd;
	Mon, 05 Oct 2026 17:41:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDmhC-0000000Gwev-0LXJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 17:41:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6F153152B;
	Mon,  5 Oct 2026 10:41:43 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 742B93F86F;
	Mon,  5 Oct 2026 10:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791222106; bh=f/5e/Z9B77F5t4G8/U+7nSw/Rar9Vnq5D17CPKi5ySY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h7bNc1xnMmNMm0LxBw4vvrZAJzwbes/MqKwyxaPAwqxqA4VMIN41eaGGa9JeE9pPV
	 utijAy+SFxb4Bm31njiiATFVS0Itf5C3lk2RHghO3pFSMUy8GIHEbw18lTsb7b3J7H
	 8QX7xY8IK4b7lWfZjPxKzUTk+drDghTFFuj/wkcY=
Date: Mon, 5 Oct 2026 18:41:44 +0100
From: Leo Yan <leo.yan@arm.com>
To: Will Deacon <will@kernel.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Tamas Petz <tamas.petz@arm.com>,
	Tamas Zsoldos <tamas.zsoldos@arm.com>,
	Michiel van Tol <michiel.vantol@arm.com>,
	Dev Jain <dev.jain@arm.com>, David Hildenbrand <david@kernel.org>,
	Yabin Cui <yabinc@google.com>, James Morse <james.morse@arm.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org
Subject: Re: [PATCH 2/2] perf: arm_spe: Prefer large AUX mappings
Message-ID: <20261005174144.GL1208404@e132581.arm.com>
References: <20260810-perf_aux_trace_large_granule-v1-0-03306c9339e3@arm.com>
 <20260810-perf_aux_trace_large_granule-v1-2-03306c9339e3@arm.com>
 <annp-BdTviQoH6vy@willie-the-truck>
 <20260930164311.GK14479@e132581.arm.com>
 <ar4Iuanz_vA4twGP@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ar4Iuanz_vA4twGP@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_104150_227903_052FF834 
X-CRM114-Status: GOOD (  28.12  )
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

On Thu, Oct 01, 2026 at 08:16:09AM +0100, Will Deacon wrote:
> On Wed, Sep 30, 2026 at 05:43:11PM +0100, Leo Yan wrote:

> > How about adding a field to struct pmu to specify a preferred maximum
> > page order for the AUX buffer? The perf core could try that order first
> > and fall back to smaller orders if the allocation fails.
> 
> I'm not sure that's thr right place for it, really. The driver has no
> clue about whether it makes sense to use large contiguous mappings or
> not, so I'd have thought that decision should be driven from userspace
> (e.g. like MADV_HUGEPAGE) because it really depends on the user's
> preference and isn't a fixed property of the hardware.

Here MADV_HUGEPAGE cannot directly apply on this case: perf allocates
the AUX pages during mmap, while TRBE accesses them through a separate
kernel vmap() mapping.

MADV_HUGEPAGE is applied after mmap, but a preference (or flag) would
need to be specified before the AUX mmap.

> > For example, the Neoverse V2 TRM documents:
> > 
> >   L1 Trace Buffer Extension (TRBE) TLB: 1 entry
> 
> Wow, they really pulled out the stops for that implementation. I bet
> we're supposed to be grateful for that entry!

Yeah, Neoverse V3 was improved to have two entries. Even so, I was told
it still suffers from TLB misses, so still needs a large mapping
granule.

> > Given the single L1 TRBE TLB entry, the TRBE driver could prefer
> > PMD_ORDER (2 MiB with 4 KiB pages) to reduce TLB pressure. This reflects
> > the hardware characteristic.
> > 
> > This could be a trade-off instead of using PERF_PMU_CAP_AUX_PREFER_LARGE,
> > avoiding large contiguous allocations that could reintroduce the Android
> > OOM issue. I did a quick test with this approach and the results look
> > positive.
> 
> I really don't want the driver to second-guess userspace based on whatever
> information it happens to have hard-coded about the specific CPU it's
> running on.

The kernel already takes the PERF_PMU_CAP_AUX_PREFER_LARGE flag from a
PMU; a preferred maximum order would let the driver give it a bounded
value.

I do not intend to hard-code or guess a preference for a particular CPU
variant. We can map TRBE or SPE buffer at PMD granularity. On a 4
KiB-page system, PMD_ORDER is order 9, or 2 MiB. Requesting a larger
contiguous chunk cannot increase the mapping granule, so I would cap the
preference there. It remains a preference: perf can fall back to smaller
orders when allocation fails.

Exposing the preference to userspace also seems problematic. Users
generally lack the hardware details needed to choose an appropriate
value. Even if tools provide a default, the same policy would need to
be duplicated across perf, simpleperf, and proprietary tools. I don't
think userspace tools are the right place for this policy.

Thanks,
Leo

