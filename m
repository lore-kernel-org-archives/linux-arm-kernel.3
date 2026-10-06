Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFE46CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 16:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jEpMztv67Cyg8uTWV9Mrn0QlkmtHYbSR5K1teL2DZsE=; b=jD8HLktw/rC2muyxqIXM3MBub7
	er4YiUYdt6TXzH302f65pjL4qyju/qfkHyp2wErqH1ALt4bwNHvpf3OibrwZg2QqJzSQmSeIfv82V
	zDZE4oTOuCRHvZvtK/BgLI9h1ylewzLG6qWSpZJvcHpUxUYr5l2b/6xnMxJvbWTOQqffQgjRuJCqO
	5/eGBiEeprmjHauk7Vwy+40XnSAxJtGzYXAFHKrF1uOgr7WT4hgARF3NQVh189lFf8PCrEEjNAjms
	rCOxgrUefq/O4XYsY8VniiWIkWHkbtA4sLI6sFgBzKi52PNUKGwtXFHJuG6CUgD5gLptis1dp+qYd
	edS8JMhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE7oK-000000017QP-3esE;
	Tue, 06 Oct 2026 16:14:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE7oJ-000000017QA-3hzM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 16:14:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EF92B602D3;
	Tue,  6 Oct 2026 16:14:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6987C1F0089B;
	Tue,  6 Oct 2026 16:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791303274;
	bh=jEpMztv67Cyg8uTWV9Mrn0QlkmtHYbSR5K1teL2DZsE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Z0MANvwZB3Ncb6gQ4UczWyet44A2z795k3Vf0ROLlRu0t8m3fMCSF3L6Zkbt+/Nuk
	 hnm+yMRM/6LFnTVGkQWVqD6MYfh5ps+/HhOigwcKaP5sXOI/8lN0b1oyumtzLvZPUU
	 uh7ZK/PFNt5z4VHVPGiw8vEbA6hBd/BuFrvExbsdZbO0WQRmFkuoILfjixf+iLVBB3
	 X4zg0zrTkf6aqIpEIv6+4MzgGSOaf/CZZ+BLX1kx6P1zZ3TvVd/tOac5dwEa2WTqyx
	 XhseSscSHJkvG/udQ7ZErNNcy+wtYTGiQpkIc80Z8deaxygt+pIvVqmuWsK80B3S8p
	 YP/nWNmA+PLug==
Date: Tue, 6 Oct 2026 17:14:28 +0100
From: Will Deacon <will@kernel.org>
To: Leo Yan <leo.yan@arm.com>
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
Message-ID: <asUeZA5Z4VjQtf1g@willie-the-truck>
References: <20260810-perf_aux_trace_large_granule-v1-0-03306c9339e3@arm.com>
 <20260810-perf_aux_trace_large_granule-v1-2-03306c9339e3@arm.com>
 <annp-BdTviQoH6vy@willie-the-truck>
 <20260930164311.GK14479@e132581.arm.com>
 <ar4Iuanz_vA4twGP@willie-the-truck>
 <20261005174144.GL1208404@e132581.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261005174144.GL1208404@e132581.arm.com>
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

On Mon, Oct 05, 2026 at 06:41:44PM +0100, Leo Yan wrote:
> On Thu, Oct 01, 2026 at 08:16:09AM +0100, Will Deacon wrote:
> > On Wed, Sep 30, 2026 at 05:43:11PM +0100, Leo Yan wrote:
> 
> > > How about adding a field to struct pmu to specify a preferred maximum
> > > page order for the AUX buffer? The perf core could try that order first
> > > and fall back to smaller orders if the allocation fails.
> > 
> > I'm not sure that's thr right place for it, really. The driver has no
> > clue about whether it makes sense to use large contiguous mappings or
> > not, so I'd have thought that decision should be driven from userspace
> > (e.g. like MADV_HUGEPAGE) because it really depends on the user's
> > preference and isn't a fixed property of the hardware.
> 
> Here MADV_HUGEPAGE cannot directly apply on this case: perf allocates
> the AUX pages during mmap, while TRBE accesses them through a separate
> kernel vmap() mapping.
> 
> MADV_HUGEPAGE is applied after mmap, but a preference (or flag) would
> need to be specified before the AUX mmap.

I was using the madvise option as an example of a user-controllable hint,
I'm not suggesting you use it directly as-is.

> > > Given the single L1 TRBE TLB entry, the TRBE driver could prefer
> > > PMD_ORDER (2 MiB with 4 KiB pages) to reduce TLB pressure. This reflects
> > > the hardware characteristic.
> > > 
> > > This could be a trade-off instead of using PERF_PMU_CAP_AUX_PREFER_LARGE,
> > > avoiding large contiguous allocations that could reintroduce the Android
> > > OOM issue. I did a quick test with this approach and the results look
> > > positive.
> > 
> > I really don't want the driver to second-guess userspace based on whatever
> > information it happens to have hard-coded about the specific CPU it's
> > running on.
> 
> The kernel already takes the PERF_PMU_CAP_AUX_PREFER_LARGE flag from a
> PMU; a preferred maximum order would let the driver give it a bounded
> value.

But the driver doesn't have this information.

> I do not intend to hard-code or guess a preference for a particular CPU
> variant. We can map TRBE or SPE buffer at PMD granularity. On a 4
> KiB-page system, PMD_ORDER is order 9, or 2 MiB. Requesting a larger
> contiguous chunk cannot increase the mapping granule, so I would cap the
> preference there. It remains a preference: perf can fall back to smaller
> orders when allocation fails.

My understanding of 18049c8cff9c is that it's not about allocation
failures, so this doesn't work.

> Exposing the preference to userspace also seems problematic. Users
> generally lack the hardware details needed to choose an appropriate
> value. Even if tools provide a default, the same policy would need to
> be duplicated across perf, simpleperf, and proprietary tools. I don't
> think userspace tools are the right place for this policy.

Well I don't think it belongs in the kernel either. I suppose you could
make it a driver module option but it's ugly as hell. We really need
Yabin's input here, I think.

Will

