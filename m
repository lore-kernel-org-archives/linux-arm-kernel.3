Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A334CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 15:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vUcpx5Qe0legPw/0+w+dnAdYl2CDGyyRFIFqnaHMwOI=; b=ZFSwk22/o09vYWGdnrMURq9AOJ
	wkWMbkP205+eWohG2NL5yY+7MIxmbzYuPUofft4K3i3t1HRZpD7OKgc0CHEeuy2e/PKD82kE0C4QR
	Wg9dlS5H024j8e2gd03yUsspZV6WqowmWC2rixWfIaYioa7O6K7zdZNTBC2BHnHjHxJp3pS9fOnkJ
	mqROTpBF+ACUXq4kllh+armnr+AMkEsuzeuyAVfzCG0iQ242QnxB2rNZ+ZV5xf5u5c4RGdJZvjDJB
	dgq8OvCpqRCx0LknYRKYXAG95X1QqIr5TOOJ4p+gt/zgaFyMTyEBtqeDAj2invLcQs6dj5nyIbahd
	kMy54KFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFwIE-0000000A7Cs-2Zrk;
	Mon, 03 Nov 2025 15:16:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFwIC-0000000A7CM-3qRQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 15:16:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 17C5A601B0;
	Mon,  3 Nov 2025 15:16:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCF2AC4CEE7;
	Mon,  3 Nov 2025 15:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762182983;
	bh=a7Sly8r5rJSn8UiWfcBTEec93SjyF2qNVYwgy1GFu3U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aqT5IikweKWlorBwalEXS2IlYs1upmgnJ6ht0nany2uPjrTvyTJihkpYi7lOCgFP8
	 safG2ointwkqDoMMip3YC0INvu1QKps+DwITD2ckNnw93COpyXjWzmQT2+zSI/usjU
	 uc4hmWYj0ozFXDnMa0eyuW4/oRrKr+lnKXZfBXf6A93HuQTN6mEQc39pWcprNCTi9/
	 5+MAjRhMZCULhmC3NTUlw+VFzbpC0VVvnEDV4FMPuiLSEiLXry6GGu2wXYvUtPm0gQ
	 JQFuNzPpWTLzFxoPO27DtY10O3C4AwU2JnCbHiyQQ99QG8754il1VVCFiFvdMhDhXL
	 P1MXDW4GbBeoA==
Date: Mon, 3 Nov 2025 15:16:18 +0000
From: Will Deacon <will@kernel.org>
To: Dev Jain <dev.jain@arm.com>
Cc: catalin.marinas@arm.com, ryan.roberts@arm.com, rppt@kernel.org,
	shijie@os.amperecomputing.com, yang@os.amperecomputing.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] arm64/pageattr: Propagate return value from
 __change_memory_common
Message-ID: <aQjHQt2rYL6av4qw@willie-the-truck>
References: <20251103061306.82034-1-dev.jain@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251103061306.82034-1-dev.jain@arm.com>
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

On Mon, Nov 03, 2025 at 11:43:06AM +0530, Dev Jain wrote:
> Post a166563e7ec3 ("arm64: mm: support large block mapping when rodata=full"),
> __change_memory_common has a real chance of failing due to split failure.
> Before that commit, this line was introduced in c55191e96caa, still having
> a chance of failing if it needs to allocate pagetable memory in
> apply_to_page_range, although that has never been observed to be true.
> In general, we should always propagate the return value to the caller.
> 
> Cc: stable@vger.kernel.org
> Fixes: c55191e96caa ("arm64: mm: apply r/o permissions of VM areas to its linear alias as well")
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> ---
> Based on Linux 6.18-rc4.
> 
>  arch/arm64/mm/pageattr.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
> index 5135f2d66958..b4ea86cd3a71 100644
> --- a/arch/arm64/mm/pageattr.c
> +++ b/arch/arm64/mm/pageattr.c
> @@ -148,6 +148,7 @@ static int change_memory_common(unsigned long addr, int numpages,
>  	unsigned long size = PAGE_SIZE * numpages;
>  	unsigned long end = start + size;
>  	struct vm_struct *area;
> +	int ret;
>  	int i;
>  
>  	if (!PAGE_ALIGNED(addr)) {
> @@ -185,8 +186,10 @@ static int change_memory_common(unsigned long addr, int numpages,
>  	if (rodata_full && (pgprot_val(set_mask) == PTE_RDONLY ||
>  			    pgprot_val(clear_mask) == PTE_RDONLY)) {
>  		for (i = 0; i < area->nr_pages; i++) {
> -			__change_memory_common((u64)page_address(area->pages[i]),
> +			ret = __change_memory_common((u64)page_address(area->pages[i]),
>  					       PAGE_SIZE, set_mask, clear_mask);
> +			if (ret)
> +				return ret;

Hmm, this means we can return failure half-way through the operation. Is
that something callers are expecting to handle? If so, how can they tell
how far we got?

Will

