Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFE16C44501
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 07:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZEqHKQJnshBDwnqUujbHpW+soJYVZoj7reUsLZHK68o=; b=kfb5SEPM+2pU5Ut/XiupdjxFIp
	5qVhutAO7X+InLDb0wnJf4FlStEgOYQqWqieXfiakGWuBZxs9x0lt1AQ5vdEaQOWY1O1Kg/AQQ9rI
	Uig1CecPTLcqo7iWL3kiRHA6eUpfxM4EsznT7N2iG7b5tW7eUxQF0CdnnPSD1wiqsez7yq/NRvp91
	5qHvA5ZRjoyrndNFRfPIKbnbHu94O3vYs8xtsp5OfMR716knR9JMEvKSZamtyxO02CaDqrrhaivbT
	qCKp2JYN91pFf0k5XV8H3MYEQLshEc7w85sTamRNICJz0cA+h8bHjRVzEVB6K1s6a2pOmfcEtzOb6
	TNUItrZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjXKW-0000000B8MH-38UY;
	Tue, 14 Jul 2026 07:13:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjXKU-0000000B8Lu-3gEi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 07:13:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9CE7D1477;
	Tue, 14 Jul 2026 00:13:16 -0700 (PDT)
Received: from [10.174.43.51] (unknown [10.174.43.51])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 27E393F93E;
	Tue, 14 Jul 2026 00:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784013200; bh=vGgg3Qhk3LciFAKcCZtv6vtYBkSq7V8PiOHvlnoXqa4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Sz+oIaHuVKKjMMsFlz6Z9rbkRcgyv0VRQJBY+fbnoYAP1bz+y3BcSzbdYwuTwxQvr
	 1hreH7uBfrDuVGG5SXe2x+MKH8SPOl7Q6snfZh1IqWxIqk19CSMJCvpbYb0Zg8TbO9
	 Q+4vW3G/939zbf7aoKsejcM5n6Lyacx78l/pMqCE=
Message-ID: <bc4ab9da-0b16-4203-9901-4845323c3e5c@arm.com>
Date: Tue, 14 Jul 2026 12:43:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/6] arm64/vmalloc: Allow arch_vmap_pte_range_map_size
 to batch multiple CONT_PTE
To: Wen Jiang <jiangwenxiaomi@gmail.com>, akpm@linux-foundation.org,
 catalin.marinas@arm.com, linux-mm@kvack.org, urezki@gmail.com,
 will@kernel.org
Cc: Xueyuan.chen21@gmail.com, ajd@linux.ibm.com, david@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 rppt@kernel.org, ryan.roberts@arm.com, dev.jain@arm.com,
 "Barry Song (Xiaomi)" <baohua@kernel.org>, Wen Jiang <jiangwen6@xiaomi.com>,
 Leo Yan <leo.yan@arm.com>
References: <20260709073823.6643-1-jiangwen6@xiaomi.com>
 <20260709073823.6643-3-jiangwen6@xiaomi.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20260709073823.6643-3-jiangwen6@xiaomi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_001322_982301_917ECCD2 
X-CRM114-Status: GOOD (  17.87  )
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



On 09/07/26 1:08 PM, Wen Jiang wrote:
> From: "Barry Song (Xiaomi)" <baohua@kernel.org>
> 
> Allow arch_vmap_pte_range_map_size to batch across multiple CONT_PTE
> blocks, reducing both PTE setup and TLB flush iterations.

Too little commit description for the proposed change here.
> 
> Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
> Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> Tested-by: Leo Yan <leo.yan@arm.com>
> Reviewed-by: Dev Jain <dev.jain@arm.com>
> ---
>  arch/arm64/include/asm/vmalloc.h | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/vmalloc.h b/arch/arm64/include/asm/vmalloc.h
> index 4ec1acd3c1b34..7d9c7dc795c42 100644
> --- a/arch/arm64/include/asm/vmalloc.h
> +++ b/arch/arm64/include/asm/vmalloc.h
> @@ -23,6 +23,8 @@ static inline unsigned long arch_vmap_pte_range_map_size(unsigned long addr,
>  						unsigned long end, u64 pfn,
>  						unsigned int max_page_shift)
>  {
> +	unsigned long size;
> +
>  	/*
>  	 * If the block is at least CONT_PTE_SIZE in size, and is naturally
>  	 * aligned in both virtual and physical space, then we can pte-map the
> @@ -40,7 +42,9 @@ static inline unsigned long arch_vmap_pte_range_map_size(unsigned long addr,
>  	if (!IS_ALIGNED(PFN_PHYS(pfn), CONT_PTE_SIZE))
>  		return PAGE_SIZE;
>  
> -	return CONT_PTE_SIZE;
> +	size = min3(end - addr, 1UL << max_page_shift, PMD_SIZE >> 1);
> +	size = rounddown_pow_of_two(size);
> +	return size;

Please do explain the fact in a comment that huge pte mappings
upto PMD_SIZE are being allowed here, if the given block is
CONT_PTE_SIZE aligned.

IIUC arch_vmap_pte_range_map_size() gets used only when config
CONFIG_HUGETLB_PAGE is enabled. Hence should not these new huge
sizes being supported here also be added as valid HugeTLB sizes
thus updating __hugetlb_valid_size() and adding corresponding
new HugeTLB page sizes with hugetlb_add_hstate() ?

OR could arch_vmap_pte_range_map_size() and set_huge_pte_at()
can be updated for vmalloc without doing corresponding changes
into HugeTLB itself ?
>  }
>  
>  #define arch_vmap_pte_range_unmap_size arch_vmap_pte_range_unmap_size


