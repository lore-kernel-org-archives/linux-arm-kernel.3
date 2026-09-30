Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4901FCA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 16:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YVsWBRzr0YBWZtrqQA7SF1KLLkepFTJlHQ8uP4wNhL8=; b=wB8gNTA2bvF4hMKqxkGhKg5am2
	UDJsn9PpMjCjQVFK4Z8MG3qAl6IooRiFfKMol7qcYGFxCJ65pIFcyAFiwRUOOHaZCNbKgujjLKety
	+XJUPQrStmrHxNKEiFAE52G/gH8HaBZiSPu92Qb7tC1oYu6V+b3KymzucPXZqySyyZcdom8e9wWGa
	X3JO95DGUjZXnlMzvO1E9mn/WJxvWjPN5U2qH/nYqQvexnmKMXYs+/lVOEJbqQKgM6C74TLy79QNm
	WG0LljPnco8WoCLrKyjoR2MXKx2wUt3rfnlnZfLjTTyNgyPgEMSOlwQK34WsbeGZKxCpq4qtIb9Jq
	4ChAcAyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBxOr-00000006jFc-3sB5;
	Wed, 30 Sep 2026 16:43:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBxOq-00000006jFJ-0HE8
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Sep 2026 16:43:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=YVsWBRzr0YBWZtrqQA7SF1KLLkepFTJlHQ8uP4wNhL8=; b=IObKYvhoEDGUbCi6wvwTfoA+fX
	LRCwClOQhiWz07ZNppefdjA0o1Fn+4ZCJVnbba5DWxHF9fyaYq2N6k7XpxLhD0gRh+86k/iOrlnTe
	Ak7rRjd8JajVIJGUZYnO1cJc5jBO2BvL7A+0ICpbDDN1Ul3DSzYLx2w1/bMfRWjguA/GlXgBkP79+
	s7HkMRZGSbISIin739DA50Ee2cosA+r1B9HtyMA3kdg8F2NyWTwf/soK53Un6ln3NrzUJPGtUv1Dt
	b9hPikBsQzJ55dis/vTtcFnxeo5LW6xkT7Xkd4s5iyrelqpg1tDAoZ+fFbvQD1h0CAFW8952+dso4
	9VyJUUlg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBxOm-000000045ik-3cir
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 16:43:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 118EC497;
	Wed, 30 Sep 2026 09:43:11 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0F3713F85F;
	Wed, 30 Sep 2026 09:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790786594; bh=+ZQQF2h9wliOPrMz684FyPaCAEQVKIU22UOLcW8B9DU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nt7xGr1XngY7AXps+0QzGOhk/AqApXQZu9RwBkbxHcHmRvMiGAhwX/+OYrgmbQt2g
	 C8ax0Sr59DyL7okecWYUwf70W2O7KmCQBqw0XbJOAel9byN122uEuH89YRvsy2pJfe
	 a5u3N0avZIxgHNvUDykVknZ8vLnz1jVyNJrE6QHQ=
Date: Wed, 30 Sep 2026 17:43:11 +0100
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
Message-ID: <20260930164311.GK14479@e132581.arm.com>
References: <20260810-perf_aux_trace_large_granule-v1-0-03306c9339e3@arm.com>
 <20260810-perf_aux_trace_large_granule-v1-2-03306c9339e3@arm.com>
 <annp-BdTviQoH6vy@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <annp-BdTviQoH6vy@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_174317_160240_A66258D9 
X-CRM114-Status: GOOD (  17.01  )
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

Hi Will,

On Mon, Aug 10, 2026 at 04:10:48PM +0100, Will Deacon wrote:
> On Mon, Aug 10, 2026 at 03:44:42PM +0100, Leo Yan wrote:
> > Commit 18049c8cff9c ("perf/aux: Allocate non-contiguous AUX pages by
> > default") made the AUX allocator use order-0 pages by default unless a
> > PMU explicitly asks for contiguous allocations.
> 
> But that commit specifically calls out SPE as benefitting from
> non-contiguous pages:
> 
>   "For instance, ARM SPE and TRBE operate with virtual pages, and
>    Coresight ETR allocates a separate buffer. For these PMUs,
>    allocating contiguous AUX pages unnecessarily exacerbates memory
>    fragmentation. This fragmentation can prevent their use on
>    long-running devices."
> 
> so why doesn't passing PERF_PMU_CAP_AUX_PREFER_LARGE reintroduce the
> problems that 18049c8cff9c was trying to solve?

How about adding a field to struct pmu to specify a preferred maximum
page order for the AUX buffer? The perf core could try that order first
and fall back to smaller orders if the allocation fails.

For example, the Neoverse V2 TRM documents:

  L1 Trace Buffer Extension (TRBE) TLB: 1 entry

Given the single L1 TRBE TLB entry, the TRBE driver could prefer
PMD_ORDER (2 MiB with 4 KiB pages) to reduce TLB pressure. This reflects
the hardware characteristic.

This could be a trade-off instead of using PERF_PMU_CAP_AUX_PREFER_LARGE,
avoiding large contiguous allocations that could reintroduce the Android
OOM issue. I did a quick test with this approach and the results look
positive.

Does this sound like a reasonable direction? I might also need Yabin's
judgement from Android side.

Thanks,
Leo

