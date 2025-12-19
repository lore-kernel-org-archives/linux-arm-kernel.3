Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DA5BD767EE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 12:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z0JtX9L0NnorvB8gicCgz8OSaKzf+5a4WnKOaibMaeM=; b=V2tdZkpK7hbntu
	dMcGpOtdTm9qA/x6f6r0nZaZcUQlWvhSTeTdAX1EdRB3PE/CIf/f6gJiWHFfpawt1dg+9yE0rsLON
	b6tA58tUcJVAANGQQnqkOvQy969tPEv9C2sbJ9FdGyhdkpaE/G4Ik7KEFs1QcuurbL31/m7YesbqM
	RFvoYmZgKCuh85tmK2gAASS1wpcxysJtapjsnZ47Gs1RW32ISgA6Yht8qB+5MMjIZ+aVfBvvU4WPI
	4SnurS5fAjYwzME8HgLYaZT3jqfzHHqwzxPJy+Tv8UkiDBWOgKr9TB02uthfAE6mHjhBhfdqNhyJo
	GOl2UC87Szsbfh0xeAPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWZhD-0000000AIiY-0130;
	Fri, 19 Dec 2025 12:34:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWZhA-0000000AIiC-1dfB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 12:34:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AA0C9FEC;
	Fri, 19 Dec 2025 04:34:47 -0800 (PST)
Received: from [10.57.47.58] (unknown [10.57.47.58])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 13CAC3F5CA;
	Fri, 19 Dec 2025 04:34:51 -0800 (PST)
Message-ID: <99bb1797-06ba-440d-b173-db62d5f54e08@arm.com>
Date: Fri, 19 Dec 2025 12:34:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] arm64: Provide dcache_inval_poc_nosync helper
To: Barry Song <21cnbao@gmail.com>, catalin.marinas@arm.com,
 m.szyprowski@samsung.com, will@kernel.org
References: <20251219053658.84978-1-21cnbao@gmail.com>
 <20251219053658.84978-4-21cnbao@gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20251219053658.84978-4-21cnbao@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_043456_566559_7714F557 
X-CRM114-Status: GOOD (  16.94  )
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
Cc: v-songbaohua@oppo.com, zhengtangquan@oppo.com, ryan.roberts@arm.com, anshuman.khandual@arm.com, maz@kernel.org, linux-kernel@vger.kernel.org, iommu@lists.linux.dev, surenb@google.com, ardb@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 2025-12-19 5:36 am, Barry Song wrote:
> From: Barry Song <v-songbaohua@oppo.com>
> 
> dcache_inval_poc_nosync does not wait for the data cache invalidation to
> complete. Later, we defer the synchronization so we can wait for all SG
> entries together.
> 
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
> Signed-off-by: Barry Song <v-songbaohua@oppo.com>
> ---
>   arch/arm64/include/asm/cacheflush.h |  1 +
>   arch/arm64/mm/cache.S               | 43 +++++++++++++++++++++--------
>   2 files changed, 33 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/cacheflush.h b/arch/arm64/include/asm/cacheflush.h
> index 9b6d0a62cf3d..382b4ac3734d 100644
> --- a/arch/arm64/include/asm/cacheflush.h
> +++ b/arch/arm64/include/asm/cacheflush.h
> @@ -74,6 +74,7 @@ extern void icache_inval_pou(unsigned long start, unsigned long end);
>   extern void dcache_clean_inval_poc(unsigned long start, unsigned long end);
>   extern void dcache_inval_poc(unsigned long start, unsigned long end);
>   extern void dcache_clean_poc(unsigned long start, unsigned long end);
> +extern void dcache_inval_poc_nosync(unsigned long start, unsigned long end);
>   extern void dcache_clean_poc_nosync(unsigned long start, unsigned long end);
>   extern void dcache_clean_pop(unsigned long start, unsigned long end);
>   extern void dcache_clean_pou(unsigned long start, unsigned long end);
> diff --git a/arch/arm64/mm/cache.S b/arch/arm64/mm/cache.S
> index 4a7c7e03785d..8c1043c9b9e5 100644
> --- a/arch/arm64/mm/cache.S
> +++ b/arch/arm64/mm/cache.S
> @@ -132,17 +132,7 @@ alternative_else_nop_endif
>   	ret
>   SYM_FUNC_END(dcache_clean_pou)
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
> +.macro _dcache_inval_poc_impl, do_sync
>   	dcache_line_size x2, x3
>   	sub	x3, x2, #1
>   	tst	x1, x3				// end cache line aligned?
> @@ -158,11 +148,42 @@ SYM_FUNC_START(__pi_dcache_inval_poc)
>   3:	add	x0, x0, x2
>   	cmp	x0, x1
>   	b.lo	2b
> +.if \do_sync
>   	dsb	sy
> +.endif

Similarly, don't bother with complication like this, just put the DSB in 
the one place it needs to be.

Thanks,
Robin.

>   	ret
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
> +	_dcache_inval_poc_impl 1
>   SYM_FUNC_END(__pi_dcache_inval_poc)
>   SYM_FUNC_ALIAS(dcache_inval_poc, __pi_dcache_inval_poc)
>   
> +/*
> + *	dcache_inval_poc_nosync(start, end)
> + *
> + * 	Issue the instructions of D-cache lines for the interval [start, end)
> + * 	for invalidation. Not necessarily cleaned to PoC till an explicit dsb
> + *	sy later
> + *
> + *	- start   - kernel start address of region
> + *	- end     - kernel end address of region
> + */
> +SYM_FUNC_START(__pi_dcache_inval_poc_nosync)
> +	_dcache_inval_poc_impl 0
> +SYM_FUNC_END(__pi_dcache_inval_poc_nosync)
> +SYM_FUNC_ALIAS(dcache_inval_poc_nosync, __pi_dcache_inval_poc_nosync)
> +
>   /*
>    *	dcache_clean_poc(start, end)
>    *


