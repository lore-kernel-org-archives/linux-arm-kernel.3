Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A223ECA5FC5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 07:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wXGrqQD9809RW+EIr/bRf710tUjrok9k7DNn43iscUM=; b=k4Y9kVpcQKpQGUI2RXs5AiQrXi
	lAm1ufyuJb+AKGbl0kKY7I0emO7YojMpQl4+AvFsZiqU5y9UNOAXJ3GBQqzxNoniC07qOrmDhiZw3
	ezwriWXT4Dv1UO55FIYiWZyhcKgZvmHeQaZzSrTj8sFcbAUYrfhbE3iD80yCfDa5E4gomILznO3Ac
	QOFqrDP3zgKOtmn8Xg5Q8M3c9CvS/aY0Mi0mHJFiimbxoS9l2zwe/M38OBJWyvTKu7NTaHLS3bnhd
	si4aDlb/U9yZbcPHbQ+bFR6bqPf1UID00bpqD3Ar7aD858FG4dCZJGzkgNq4LkOmnvCAeWjr5BQA7
	39NEPhWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCB1f-00000007yXq-0K7M;
	Thu, 01 Oct 2026 07:16:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCB1d-00000007yXh-2gl8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 07:16:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CC9B7601FE;
	Thu,  1 Oct 2026 07:16:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 977581F000FF;
	Thu,  1 Oct 2026 07:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790838976;
	bh=wXGrqQD9809RW+EIr/bRf710tUjrok9k7DNn43iscUM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AGmiUefpQ6l75QZK6aeQlp9UPq1InEMepRYnLgKRKneJbssdvdgA0t6TjDBM6kQpZ
	 RvPaddId0hCVvOkKMb7AnE/Hm9Jslt4H0RSGIonOTjh2MhRHvFl5+LtyvxBvZFzfzf
	 3gqTiz6bvOdQjIX/37l2f7t5d4FeITcb5glYcxF/5WXerC4BGs/1KB8kX88zNeZfwJ
	 fsEzZDtnAKyMB1o3pKWJxNCeiSQTLmsfYniy9NGi+WQFVMnJB9BYoWukb/CLMek6pR
	 mN8rfZ6btQS8GV+5jxdc15FeCNMObU56CMgzMxynhW1d4NUrI/X19BPINawEoge6zT
	 6LszC3Cp6gx8A==
Date: Thu, 1 Oct 2026 08:16:09 +0100
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
Message-ID: <ar4Iuanz_vA4twGP@willie-the-truck>
References: <20260810-perf_aux_trace_large_granule-v1-0-03306c9339e3@arm.com>
 <20260810-perf_aux_trace_large_granule-v1-2-03306c9339e3@arm.com>
 <annp-BdTviQoH6vy@willie-the-truck>
 <20260930164311.GK14479@e132581.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930164311.GK14479@e132581.arm.com>
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

On Wed, Sep 30, 2026 at 05:43:11PM +0100, Leo Yan wrote:
> On Mon, Aug 10, 2026 at 04:10:48PM +0100, Will Deacon wrote:
> > On Mon, Aug 10, 2026 at 03:44:42PM +0100, Leo Yan wrote:
> > > Commit 18049c8cff9c ("perf/aux: Allocate non-contiguous AUX pages by
> > > default") made the AUX allocator use order-0 pages by default unless a
> > > PMU explicitly asks for contiguous allocations.
> > 
> > But that commit specifically calls out SPE as benefitting from
> > non-contiguous pages:
> > 
> >   "For instance, ARM SPE and TRBE operate with virtual pages, and
> >    Coresight ETR allocates a separate buffer. For these PMUs,
> >    allocating contiguous AUX pages unnecessarily exacerbates memory
> >    fragmentation. This fragmentation can prevent their use on
> >    long-running devices."
> > 
> > so why doesn't passing PERF_PMU_CAP_AUX_PREFER_LARGE reintroduce the
> > problems that 18049c8cff9c was trying to solve?
> 
> How about adding a field to struct pmu to specify a preferred maximum
> page order for the AUX buffer? The perf core could try that order first
> and fall back to smaller orders if the allocation fails.

I'm not sure that's thr right place for it, really. The driver has no
clue about whether it makes sense to use large contiguous mappings or
not, so I'd have thought that decision should be driven from userspace
(e.g. like MADV_HUGEPAGE) because it really depends on the user's
preference and isn't a fixed property of the hardware.

> For example, the Neoverse V2 TRM documents:
> 
>   L1 Trace Buffer Extension (TRBE) TLB: 1 entry

Wow, they really pulled out the stops for that implementation. I bet
we're supposed to be grateful for that entry!

> Given the single L1 TRBE TLB entry, the TRBE driver could prefer
> PMD_ORDER (2 MiB with 4 KiB pages) to reduce TLB pressure. This reflects
> the hardware characteristic.
> 
> This could be a trade-off instead of using PERF_PMU_CAP_AUX_PREFER_LARGE,
> avoiding large contiguous allocations that could reintroduce the Android
> OOM issue. I did a quick test with this approach and the results look
> positive.

I really don't want the driver to second-guess userspace based on whatever
information it happens to have hard-coded about the specific CPU it's
running on.

Will

