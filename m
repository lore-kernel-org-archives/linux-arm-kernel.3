Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B967E9B24A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 10:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fZQZhFCQRs3FRpnRYHy4Ear07Y00uoEUsCQ9F2s8RQ0=; b=h02ZvK4Du7rvFpcqqPRw63yn1i
	uttmskvDaUtu91dyzqba7OI0q7AShS8LJPmiTd0Mx29uU9HhyzfubhBwTRX7ujYvmAE6vwu1lndp7
	DFXmKrdJluFFOMXDlGw5zu8KQjacoQuiTfzsfyCB1rkN+W0HLRT6fa+X8d+a7ZbIrtzRJaAGyYAdH
	uU19/582W7myXkvwgpZjDzwXwEhaqxQgqGp36CY9hkok0DsA04Tw28rMlTutK8LH1i8gNLWzaXaiK
	v5pIEPifgxJJVhNjwYKTK4Bh25eqVAj8T4/4hccGNLQatFDpKaDWFjSgKqfOX4scYpWCU0eCx6NmK
	LdlNHRpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vupLF-00000001p5s-2VZA;
	Tue, 24 Feb 2026 10:08:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vupLD-00000001p5D-3gQT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 10:08:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 96CE2339;
	Tue, 24 Feb 2026 02:08:22 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9AF0B3F62B;
	Tue, 24 Feb 2026 02:08:26 -0800 (PST)
Date: Tue, 24 Feb 2026 10:08:21 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Linu Cherian <linu.cherian@arm.com>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	linux-perf-users@vger.kernel.org
Subject: Re: [RFC V1 04/16] perf/events: Replace READ_ONCE() with standard
 pgtable accessors
Message-ID: <aZ14lUwuA86aiOH-@J2N7QTR9R3>
References: <20260224051153.3150613-1-anshuman.khandual@arm.com>
 <20260224051153.3150613-5-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224051153.3150613-5-anshuman.khandual@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_020831_960049_AD5F719E 
X-CRM114-Status: GOOD (  20.18  )
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

On Tue, Feb 24, 2026 at 10:41:41AM +0530, Anshuman Khandual wrote:
> Replace READ_ONCE() with standard page table accessors i.e pxdp_get() which
> anyways default into READ_ONCE() in cases where platform do not override.

For each of the patches where you make this sort of change, please
explain in the commit message *why* it is necessary to do this.

IIUC the entire point of this is that in subsequent patches, arm64 will
need to use something other than READ_ONCE() for all pXX levels in order
to support D128 translation tables.

Spelling that out in the commit message makes it much easier for
reviewers to see what's going on, and to focus any discussion/questions,
e.g. *why* won't READ_ONCE() work?

Mark.

> 
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Arnaldo Carvalho de Melo <acme@kernel.org>
> Cc: Namhyung Kim <namhyung@kernel.org>
> Cc: linux-perf-users@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
>  kernel/events/core.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/kernel/events/core.c b/kernel/events/core.c
> index ac70d68217b6..4ee151cd2c6d 100644
> --- a/kernel/events/core.c
> +++ b/kernel/events/core.c
> @@ -8422,7 +8422,7 @@ static u64 perf_get_pgtable_size(struct mm_struct *mm, unsigned long addr)
>  	pte_t *ptep, pte;
>  
>  	pgdp = pgd_offset(mm, addr);
> -	pgd = READ_ONCE(*pgdp);
> +	pgd = pgdp_get(pgdp);
>  	if (pgd_none(pgd))
>  		return 0;
>  
> @@ -8430,7 +8430,7 @@ static u64 perf_get_pgtable_size(struct mm_struct *mm, unsigned long addr)
>  		return pgd_leaf_size(pgd);
>  
>  	p4dp = p4d_offset_lockless(pgdp, pgd, addr);
> -	p4d = READ_ONCE(*p4dp);
> +	p4d = p4dp_get(p4dp);
>  	if (!p4d_present(p4d))
>  		return 0;
>  
> @@ -8438,7 +8438,7 @@ static u64 perf_get_pgtable_size(struct mm_struct *mm, unsigned long addr)
>  		return p4d_leaf_size(p4d);
>  
>  	pudp = pud_offset_lockless(p4dp, p4d, addr);
> -	pud = READ_ONCE(*pudp);
> +	pud = pudp_get(pudp);
>  	if (!pud_present(pud))
>  		return 0;
>  
> -- 
> 2.43.0
> 

