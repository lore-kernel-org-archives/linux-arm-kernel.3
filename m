Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9603FD2ECE9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 12:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jvrFng5JflWyfj/acM6l5GlHLKTj1I8ShXgCAALi3Iw=; b=dHFmU3NI6VxKghTDNKJbWOen3D
	gy9uQSuAJnxQR++J9BuRJA/iWYuI2Mz80pTQijYeievOFQeLUkmLCvWImhuC6eDZzSVcsyYjxK5GF
	OMASW700oM0+em5hNpof7dDJRD/XsWxF5TNqg9AvEdYlhVXPR8/Y4UafYjrh1hZASnQ1rZyTBgTcm
	FZjK0XCgA2PyZnERpbu/+epvdlnNPt/7rhkjSgnkSVUisCIcNEaHqedOBqz9KTjfECx6uD7aPQag8
	YoLSNatGmR2mYH8hwnfRHEv8WF643pzcy6bp25HPSd/pvE3Ie4NLnLwXgi4YeP76hjHzn3FOy08vj
	e8/emq6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viAve-00000003qtM-05NG;
	Tue, 20 Jan 2026 12:33:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viAvb-00000003qt0-02g5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 12:33:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5099943FA3;
	Tue, 20 Jan 2026 12:33:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 001ABC16AAE;
	Tue, 20 Jan 2026 12:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768912426;
	bh=Y0bXJFrIMQu42HkX8sO2hSl2uRvMmAIUm4N1kYYXYbg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TxGZV8yxxs7f9OIOe/76/YrYaqjVeBTLmNJdeq9rZnYXtQBKVVFzF9G+vZXhnfGlh
	 vT9CZ7egfF2YJDaVzTZCoXW7WvjE6P9hHlULJeQGsNLJOVQ6GN8ql7pboCjgU4WGCe
	 Vt8ME1f66ylY9a+GCkoyhnoJhXrb39PCRzYGGNaz54bIGYkZiF1bgZi24H9uytWylw
	 9Pa1LQ5sYMXUi5RHj69gPO6rv2NvuLMgE69i3zkNmc//4jIPBEZz5BqT8SQXYiPd6j
	 m+4BX8yGRcFm1xNp3e9O6KxgephbObAfu5q0mTQt6b0ny660NNsJKm//uUu92158VD
	 Rk2ttoJ8XgDvA==
Date: Tue, 20 Jan 2026 12:33:39 +0000
From: Will Deacon <will@kernel.org>
To: Barry Song <21cnbao@gmail.com>
Subject: Re: [PATCH v2 3/8] arm64: Provide dcache_inval_poc_nosync helper
Message-ID: <aW92I_sn9VqDPLKz@willie-the-truck>
References: <20251226225254.46197-1-21cnbao@gmail.com>
 <20251226225254.46197-4-21cnbao@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251226225254.46197-4-21cnbao@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_043347_089638_87626364 
X-CRM114-Status: GOOD (  20.71  )
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
Cc: Tangquan Zheng <zhengtangquan@oppo.com>, Barry Song <baohua@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, Leon Romanovsky <leon@kernel.org>, Anshuman Khandual <anshuman.khandual@arm.com>, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>, iommu@lists.linux.dev, Marc Zyngier <maz@kernel.org>, xen-devel@lists.xenproject.org, robin.murphy@arm.com, Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Sat, Dec 27, 2025 at 11:52:43AM +1300, Barry Song wrote:
> From: Barry Song <baohua@kernel.org>
> 
> dcache_inval_poc_nosync does not wait for the data cache invalidation to
> complete. Later, we defer the synchronization so we can wait for all SG
> entries together.
> 
> Cc: Leon Romanovsky <leon@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Tangquan Zheng <zhengtangquan@oppo.com>
> Signed-off-by: Barry Song <baohua@kernel.org>
> ---
>  arch/arm64/include/asm/cacheflush.h |  1 +
>  arch/arm64/mm/cache.S               | 42 +++++++++++++++++++++--------
>  2 files changed, 32 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/cacheflush.h b/arch/arm64/include/asm/cacheflush.h
> index 9b6d0a62cf3d..382b4ac3734d 100644
> --- a/arch/arm64/include/asm/cacheflush.h
> +++ b/arch/arm64/include/asm/cacheflush.h
> @@ -74,6 +74,7 @@ extern void icache_inval_pou(unsigned long start, unsigned long end);
>  extern void dcache_clean_inval_poc(unsigned long start, unsigned long end);
>  extern void dcache_inval_poc(unsigned long start, unsigned long end);
>  extern void dcache_clean_poc(unsigned long start, unsigned long end);
> +extern void dcache_inval_poc_nosync(unsigned long start, unsigned long end);
>  extern void dcache_clean_poc_nosync(unsigned long start, unsigned long end);
>  extern void dcache_clean_pop(unsigned long start, unsigned long end);
>  extern void dcache_clean_pou(unsigned long start, unsigned long end);
> diff --git a/arch/arm64/mm/cache.S b/arch/arm64/mm/cache.S
> index 4a7c7e03785d..99a093d3aecb 100644
> --- a/arch/arm64/mm/cache.S
> +++ b/arch/arm64/mm/cache.S
> @@ -132,17 +132,7 @@ alternative_else_nop_endif
>  	ret
>  SYM_FUNC_END(dcache_clean_pou)
>  
> -/*
> - *	dcache_inval_poc(start, end)
> - *
> - * 	Ensure that any D-cache lines for the interval [start, end)
> - * 	are invalidated. Any partial lines at the ends of the interval are
> - *	also cleaned to PoC to prevent data loss.
> - *
> - *	- start   - kernel start address of region
> - *	- end     - kernel end address of region
> - */
> -SYM_FUNC_START(__pi_dcache_inval_poc)
> +.macro raw_dcache_inval_poc_macro
>  	dcache_line_size x2, x3
>  	sub	x3, x2, #1
>  	tst	x1, x3				// end cache line aligned?
> @@ -158,11 +148,41 @@ SYM_FUNC_START(__pi_dcache_inval_poc)
>  3:	add	x0, x0, x2
>  	cmp	x0, x1
>  	b.lo	2b
> +.endm
> +
> +/*
> + *	dcache_inval_poc(start, end)
> + *
> + * 	Ensure that any D-cache lines for the interval [start, end)
> + * 	are invalidated. Any partial lines at the ends of the interval are
> + *	also cleaned to PoC to prevent data loss.
> + *
> + *	- start   - kernel start address of region
> + *	- end     - kernel end address of region
> + */
> +SYM_FUNC_START(__pi_dcache_inval_poc)
> +	raw_dcache_inval_poc_macro
>  	dsb	sy
>  	ret
>  SYM_FUNC_END(__pi_dcache_inval_poc)
>  SYM_FUNC_ALIAS(dcache_inval_poc, __pi_dcache_inval_poc)
>  
> +/*
> + *	dcache_inval_poc_nosync(start, end)
> + *
> + * 	Issue the instructions of D-cache lines for the interval [start, end)
> + * 	for invalidation. Not necessarily cleaned to PoC till an explicit dsb
> + *	sy is issued later
> + *
> + *	- start   - kernel start address of region
> + *	- end     - kernel end address of region
> + */
> +SYM_FUNC_START(__pi_dcache_inval_poc_nosync)
> +	raw_dcache_inval_poc_macro
> +	ret

Sorry, similar naming nit to the other patch. Let's have the macro use
the 'nosync' suffix instead of the 'raw' prefix. You can chuck some
underscores at it if you want to keep the name of this function the same.

Will

