Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4173C606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 16:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=q8rKub1g;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=LIM32JOg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A8MVaUDS9g20qAiLWN71AYqk9LGiXjGjI7lPzPIyURY=; b=q8rKub1gTfY43EXIITVTpe5gta
	ioDRkwSGy508Jso5qt4ikrf5X0+XL62lmc2/Qh/yv/NF01cKTirxOH3LFwDTdRRxzDfmZuAmz4L6o
	3KhvGJWen7XXBYVN+yya8yrhJGUDb6NHDNGF63KH6VZxeOsrHbeVscnriw523dRrM0NO92tOOwO+R
	yZO++D/Wi9jACghABQkVjg7674Dh0iTLQclkP5z5SHiafAKCn6W6hptsbcj8vIV7XjJYbFqnnKd4g
	iLDk8em7HFAK4E8hVygyOmEcZr6BtFs2me0xRW7ifq9nLuWmTcJeHefyCjfo60JFhWVxYLBs0mGmU
	cpUNgVbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJCeV-0000000AA6u-0S7M;
	Tue, 20 Oct 2026 16:25:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJCeS-0000000AA6A-3pCL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 16:25:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 35FE81596;
	Tue, 20 Oct 2026 09:25:18 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F027D3F7D8;
	Tue, 20 Oct 2026 09:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792513521; bh=AusZ5SvNx27k8Me5tZ9SxcLQrSYBKyfbvDjtzz07Dz0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LIM32JOgAW3tMe54KIhyIZCHSiq35zCM+fcCDc0ni2y1Sfsl4ckP3S3hpARKwtmZF
	 M4f9wZgolpLpzuPWS9/dwzVO30MOdTlIP+ogW6favk960BiBtK05+pjBpeuRJC0YBu
	 0hEg0jzlN4PDLUVN1B4e+rPCoU64Ypm/gYvqcZSU=
Date: Tue, 20 Oct 2026 17:25:10 +0100
From: Leo Yan <leo.yan@arm.com>
To: Dev Jain <dev.jain@arm.com>
Cc: Will Deacon <will@kernel.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Tamas Petz <tamas.petz@arm.com>,
	Tamas Zsoldos <tamas.zsoldos@arm.com>,
	Michiel van Tol <michiel.vantol@arm.com>,
	David Hildenbrand <david@kernel.org>, Yabin Cui <yabinc@google.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org
Subject: Re: [PATCH 2/2] perf: arm_spe: Prefer large AUX mappings
Message-ID: <20261020162510.GF26205@e132581.arm.com>
References: <20260810-perf_aux_trace_large_granule-v1-0-03306c9339e3@arm.com>
 <20260810-perf_aux_trace_large_granule-v1-2-03306c9339e3@arm.com>
 <annp-BdTviQoH6vy@willie-the-truck>
 <20260810174159.GC15499@e132581.arm.com>
 <7c35e399-bc64-43c3-9588-672200758ea5@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7c35e399-bc64-43c3-9588-672200758ea5@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_092524_987060_7B601622 
X-CRM114-Status: GOOD (  15.06  )
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
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 08, 2026 at 04:13:27PM +0530, Dev Jain wrote:
> 
> >>> Commit 18049c8cff9c ("perf/aux: Allocate non-contiguous AUX pages by
> >>> default") made the AUX allocator use order-0 pages by default unless a
> >>> PMU explicitly asks for contiguous allocations.
> >>
> >> But that commit specifically calls out SPE as benefitting from
> >> non-contiguous pages:
> >>
> >>   "For instance, ARM SPE and TRBE operate with virtual pages, and
> >>    Coresight ETR allocates a separate buffer. For these PMUs,
> >>    allocating contiguous AUX pages unnecessarily exacerbates memory
> >>    fragmentation. This fragmentation can prevent their use on
> >>    long-running devices."
> >>
> >> so why doesn't passing PERF_PMU_CAP_AUX_PREFER_LARGE reintroduce the
> >> problems that 18049c8cff9c was trying to solve?

> I don't have the full context here (can look in detail later) so drive-by comment:
> 
> In general, doing large order allocations should *reduce* fragmentation. If you allocate
> 16 order-0 pages as opposed to an order-4 compound page, you may end up spreading your
> allocations across different blocks, thus preventing them from merging later.
> 
> A recent example can be found in vmalloc [1].
>
> [1] https://lore.kernel.org/all/aPjrRkjiIt6HmXmT@casper.infradead.org/

Thanks, Dev. Roughly read the shared link, larger allocations can keep
pages with the same lifetime together, so order-0 allocation is not
necessarily better for fragmentation.

As mentioned in my other reply, the AUX buffer allocator already used
__GFP_NORETRY before the commit 18049c8cff9c, so those allocations do
not directly invoke the kernel OOM killer.

This calls for revisiting that rationale in 18049c8cff9c. The original
issue does not appear to have been investigated sufficiently, and we
still haven't received further details since this series.

I propose reverting 18049c8cff9c to restore the previous allocation
policy. If no objections, I will send a revert for review.

Thanks,
Leo

