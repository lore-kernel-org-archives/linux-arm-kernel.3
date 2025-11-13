Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E59A6CD5BCE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 11:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Je9sPl7CMia/pWe34qqksHNEvXHDAqK5zU+RCpAHu/8=; b=nGvxYkEKWTSReAREC9350IwmSt
	ca0GB3GxDKoNArDv+/LYG3LorW+KoOIPScZ3xtPI6xqyPC9iu2NEgsAiKK8QUCjKBRgcCz8uk9pKu
	vpRfX/aXlOvt3Ay2vtUjuFaTBmMg6scZUs1agwCc1UZbT+JYKys233SfVP3ldLwMTXaQJ8JXscwJS
	hWfXZDEMzu8f6YKjP3y5wKesX2DQe3CsjuruB78KQ3lzvnSCDkn7RDzhroeFfNS1dR6La7WD0vbkZ
	Dmb5qJKBobzwfzIEHWkM+JTJCoiGKDoWY2E7J158nVgmV127tr71c9qy7gQNLiQRi8au90yOvuuc6
	I5Xnj1Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJVvh-0000000AQ4K-2769;
	Thu, 13 Nov 2025 11:55:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJVvd-0000000AQ3n-15RF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 11:55:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C339D12FC;
	Thu, 13 Nov 2025 03:55:43 -0800 (PST)
Received: from [10.57.88.12] (unknown [10.57.88.12])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 274493F5A1;
	Thu, 13 Nov 2025 03:55:50 -0800 (PST)
Message-ID: <6bc0fac0-3c00-4ecf-948e-5648584ec939@arm.com>
Date: Thu, 13 Nov 2025 11:55:48 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64/pageattr: Propagate return value from
 __change_memory_common
Content-Language: en-GB
To: Dev Jain <dev.jain@arm.com>, catalin.marinas@arm.com, will@kernel.org
Cc: rppt@kernel.org, shijie@os.amperecomputing.com,
 yang@os.amperecomputing.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251112062716.64801-1-dev.jain@arm.com>
 <20251112062716.64801-2-dev.jain@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20251112062716.64801-2-dev.jain@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_035553_343778_38008663 
X-CRM114-Status: GOOD (  19.45  )
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

On 12/11/2025 06:27, Dev Jain wrote:
> The rodata=on security measure requires that any code path which does
> vmalloc -> set_memory_ro/set_memory_rox must protect the linear map alias
> too. Therefore, if such a call fails, we must abort set_memory_* and caller
> must take appropriate action; currently we are suppressing the error, and
> there is a real chance of such an error arising post commit a166563e7ec3
> ("arm64: mm: support large block mapping when rodata=full"). Therefore,
> propagate any error to the caller.
> 
> Fixes: a166563e7ec3 ("arm64: mm: support large block mapping when rodata=full")
> Signed-off-by: Dev Jain <dev.jain@arm.com>

Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>

It would be good to get this into v6.18 I guess?

Although I think this will conflict with a patch from Yang that makes this work
with a partial vm area range - But I think that one will only go to v6.19.

Thanks,
Ryan

> ---
> v1 of this patch: https://lore.kernel.org/all/20251103061306.82034-1-dev.jain@arm.com/
> I have dropped stable since no real chance of failure was there.
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
>  		}
>  	}
>  


