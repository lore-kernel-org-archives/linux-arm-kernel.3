Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7DC9EA3C33
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 10:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aCoI6i+DnPocxOUwqSH9KXFV1m27WvxSYZQ8ms3/tSs=; b=gu8QAqKhOryk4wcrCt5kasgA/b
	YI7XzNGDwoIdqdNevdrS+A25JFzfJrgEIlASS050zdT7U91Rhph3+oHRb1dafODQYeHT7HMRZEDhn
	iJwGRMhHEyT7TT4winUBqUoLOiWLM51kyYlL7SOQURoo4LuAibeLZkBAw5ilofc/V8p7V1NCGZQK0
	aA2kFg1medzc5zDONyY27DwHyM+ESbCvsSFUJLEBkEnFtfOr14VEvQ8EqDz6DahnLPUh7vmA8ZPBK
	7XNN2hFq3VZZMndmwaBHKnR1dvtudEoi0PgD2P3J12DRWRgYQzmGh23cLKXOoHr/jYldVDqMUh0Ia
	1ydwISbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAmhr-0000000AAKc-0O59;
	Thu, 09 Apr 2026 10:33:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAmhp-0000000AAKF-38xZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 10:33:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C26A2600CB;
	Thu,  9 Apr 2026 10:33:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0B1CC19424;
	Thu,  9 Apr 2026 10:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775730828;
	bh=TNpoG6jI5tUlUTjT6ng/gxK0PSSrOAvTDidVFPbVzI4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=orvo0MZx+9BgWSKdcdjIjZM78aRRqk52xsQRs/dx4vvzLle+gsk275Dc2SFF0l16c
	 iXiyU6gWr5G+gjcSqa1AxqUl1CS06FnZyI50l/0f+ZoGS1AgwJrmfePzeyTpf+h+/L
	 quTJs6pzboQRHwuZfUFx/RrVRnNsWwuWPXL75BficN9lewEnKvzx7aVpEON50Ssg6z
	 3/ox1uad544T+pg543Lv/nByorHBIxlZmrW/RcM3vrxNXhgmpGpGemo5LVN4JD9uRz
	 B7XyNXv6xVbmrCfNSxP7GAnQpRS5x7U60UxwASry2gvxTISV3rowKMPC13VMb9uByq
	 z/qpI/Pm4z38Q==
Date: Thu, 9 Apr 2026 13:33:41 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Linu Cherian <linu.cherian@arm.com>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [RFC V1 01/16] mm: Abstract printing of pxd_val()
Message-ID: <adeAhYW-hJ7-6-Xy@kernel.org>
References: <20260224051153.3150613-1-anshuman.khandual@arm.com>
 <20260224051153.3150613-2-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224051153.3150613-2-anshuman.khandual@arm.com>
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

Hi Anshuman,

On Tue, Feb 24, 2026 at 10:41:38AM +0530, Anshuman Khandual wrote:
> Ahead of adding support for D128 pgtables, refactor places that print
> PTE values to use the new __PRIpte format specifier and __PRIpte_args()
> macro to prepare the argument(s). When using D128 pgtables in future,
> we can simply redefine __PRIpte and __PTIpte_args().
> 
> Besides there is also an assumption about pxd_val() being always capped
> at 'unsigned long long' size but that will not work for D128 pgtables.
> Just increase its size to u128 if the compiler supports via a separate
> data type pxdval_t which also defaults to existing 'unsigned long long'.
> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: David Hildenbrand <david@kernel.org>
> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: linux-mm@kvack.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
>  include/linux/pgtable.h |  5 +++++
>  mm/memory.c             | 29 +++++++++++++++++++----------
>  2 files changed, 24 insertions(+), 10 deletions(-)
> 
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index a50df42a893f..da17139a1279 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -17,6 +17,11 @@
>  #include <asm-generic/pgtable_uffd.h>
>  #include <linux/page_table_check.h>
>  
> +#ifndef __PRIpte
> +#define __PRIpte		"016llx"
> +#define __PRIpte_args(val)	((u64)val)
> +#endif
> +
>  #if 5 - defined(__PAGETABLE_P4D_FOLDED) - defined(__PAGETABLE_PUD_FOLDED) - \
>  	defined(__PAGETABLE_PMD_FOLDED) != CONFIG_PGTABLE_LEVELS
>  #error CONFIG_PGTABLE_LEVELS is not consistent with __PAGETABLE_{P4D,PUD,PMD}_FOLDED
> diff --git a/mm/memory.c b/mm/memory.c
> index 07778814b4a8..cfc3077fc52f 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -532,9 +532,15 @@ static bool is_bad_page_map_ratelimited(void)
>  	return false;
>  }
>  
> +#ifdef __SIZEOF_INT128__
> +	typedef u128 pxdval_t;

I don't think the typedef should be indented.

> +#else
> +	typedef unsigned long long pxdval_t;
> +#endif

Don't we want this in, say, include/linux/pgtable.h?

-- 
Sincerely yours,
Mike.

