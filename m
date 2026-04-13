Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF494F34C65
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 16:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D+FrOfT4Covm9FV8Q8vZRx7hii6aeNYLt2ouslmn3OM=; b=2BBddzapOcWVUAXpYO/IW38UGX
	fMSxv7TTqVsW73bnaRETbcAOxxKwsZMkzyX51BVx2rZMr5Was9ZmH0hTbGimCWVkkUdrKckKKKSWj
	DFXpdN9+Nk6HY3u97zIBhbHZ0SF+wmlpAk2LoYNdnJig+fzB3An8eJGWu3OeY15h+qu2cF48cBjX3
	le5BnyWmemgPJ+JxbH5109DSOoJ1c/PLiU+0Ws+sDDLiR1VA7glu121aTLg67DK9cNMKcWmMvx1l8
	EFs2b0aIhWYrXqgOq2ux4lwvVVyA21M1EZ2sXsZkT7bttPFcETW9j4e2pN10i7DlmBE2VMAzWOZx1
	PKaXmo9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCJxU-0000000G2oB-405d;
	Mon, 13 Apr 2026 16:16:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCJxT-0000000G2o2-0tbv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 16:16:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9314D6133C;
	Mon, 13 Apr 2026 16:16:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 201E9C2BCAF;
	Mon, 13 Apr 2026 16:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776096978;
	bh=s0GwUHExH4iN6ORL9X/gv2Ol3KDyD0IWHk3CIXYTiuQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kSEiYwVVNDqkNOGFJlyXyMEfXbylJRhQHfHiecOFmq/5hD8BLWtz4RNtQBt4oQgUJ
	 IDmkPBS9QF4yIrQjGHjGuni8vDAPswk8iJF4zZsQ3tRvOuYsqWfC+aRdn8YqHNjv/6
	 jHM7kdzTSaQ++71op3y/TQPHhLsNMUYgMjh6ztNrwtBu1KJQS26m/TTiEG2C/X5ZEx
	 VJ97LP/CF1M2ecnrQ3b7mrdVHZn8bgGaYqyUA6HBnvX2NQpUNAdl9GjNC1WJPYP1p1
	 RY1bFEvthjSK1toNlL50id84i1EqNq7rumXyeTrF1u5l+qTxKtvPa6y6mV6zbIWD5Z
	 7ojaosHo643pQ==
Date: Mon, 13 Apr 2026 19:16:10 +0300
From: Mike Rapoport <rppt@kernel.org>
To: "Barry Song (Xiaomi)" <baohua@kernel.org>
Cc: linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
	catalin.marinas@arm.com, will@kernel.org, akpm@linux-foundation.org,
	urezki@gmail.com, linux-kernel@vger.kernel.org,
	anshuman.khandual@arm.com, ryan.roberts@arm.com, ajd@linux.ibm.com,
	david@kernel.org, Xueyuan.chen21@gmail.com
Subject: Re: [RFC PATCH 4/8] mm/vmalloc: Eliminate page table zigzag for huge
 vmalloc mappings
Message-ID: <ad0Wyq5--L0SeIqr@kernel.org>
References: <20260408025115.27368-1-baohua@kernel.org>
 <20260408025115.27368-5-baohua@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260408025115.27368-5-baohua@kernel.org>
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

On Wed, Apr 08, 2026 at 10:51:11AM +0800, Barry Song (Xiaomi) wrote:
> For vmalloc() allocations with VM_ALLOW_HUGE_VMAP, we no longer
> need to iterate over pages one by one, which would otherwise lead to
> zigzag page table mappings.
> 
> The code is now unified with the PAGE_SHIFT case by simply
> calling vmap_small_pages_range_noflush().
> 
> Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> ---
>  mm/vmalloc.c | 22 ++++------------------
>  1 file changed, 4 insertions(+), 18 deletions(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 5bf072297536..eba436386929 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -689,27 +689,13 @@ static int vmap_small_pages_range_noflush(unsigned long addr, unsigned long end,
>  int __vmap_pages_range_noflush(unsigned long addr, unsigned long end,
>  		pgprot_t prot, struct page **pages, unsigned int page_shift)
>  {
> -	unsigned int i, nr = (end - addr) >> PAGE_SHIFT;
> -
>  	WARN_ON(page_shift < PAGE_SHIFT);
>  
> -	if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMALLOC) ||
> -			page_shift == PAGE_SHIFT)
> -		return vmap_small_pages_range_noflush(addr, end, prot, pages, PAGE_SHIFT);
> -
> -	for (i = 0; i < nr; i += 1U << (page_shift - PAGE_SHIFT)) {
> -		int err;
> -
> -		err = vmap_range_noflush(addr, addr + (1UL << page_shift),
> -					page_to_phys(pages[i]), prot,
> -					page_shift);
> -		if (err)
> -			return err;
> +	if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMALLOC))
> +		page_shift = PAGE_SHIFT;
>  
> -		addr += 1UL << page_shift;
> -	}
> -
> -	return 0;
> +	return vmap_small_pages_range_noflush(addr, end, prot, pages,
> +			min(page_shift, PMD_SHIFT));

Wouldn't vmap_range_noflush() already "do the right thing" even without
changes to vmap_small_pages_range_noflush()?

>  }
>  
>  int vmap_pages_range_noflush(unsigned long addr, unsigned long end,
> -- 
> 2.39.3 (Apple Git-146)
> 

-- 
Sincerely yours,
Mike.

