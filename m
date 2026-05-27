Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B796CD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 05:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+ikkV6QQjvmdEtsbaLRrdn+vkusNG4Ps4hZDblpGimw=; b=kNT3tOUSsfBnxUfkMy/LRPa3+j
	wuB9OQTxmSBvhnoFodMBUd3bDivTorOSoaaXA08Hjs6+V99lT192RsNgFx5HPl9wZj6bRd+ELmm7k
	Y2XtniWvDJlwXXhUHBfkjZvGHNLtRnWxtC24JHCs8cIY7v3dC5VGicg3gvm2tB0hkEX82A3lVRGvb
	65RX9h2QMi0fYmEhpH799JJTqt6W4CswA3p5gOsvjgU8toaTsDVXILb7NBqp1vMD3iy1hWrTpTe6P
	IIdDAV+V2k0F8m3TNEqdJ0NxglwPJElwHDAzTtM0+d8LDmjaW74K3Mrg++12G6fY7g+pGPTjuPY28
	Xd5I7INg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS734-00000003MSs-1VRq;
	Wed, 27 May 2026 05:43:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS731-00000003MST-1rit
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 05:43:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1EA7A16F2;
	Tue, 26 May 2026 22:43:12 -0700 (PDT)
Received: from [10.164.19.7] (unknown [10.164.19.7])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 22BAA3F632;
	Tue, 26 May 2026 22:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779860597; bh=kN7v8Yo/h9jLVzSWJYwp5pXMcuNhkzPz7FVEiIHcY5E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mAxCWDZsUUqwMXDxAEIrGKbX+vEH2ZtBW3H5sftYz90tkf+jWEvMRM58EXGsOd5OH
	 /4JoDFW3EvPipQtTEXBdiPAAkNZQh16kAU2D2kd2ukurqyQmjmDJGTzVRiTh1sjbeU
	 PCPEY+mYQKZo353Hglks4w84JtcVfQdZb2/VSHqU=
Message-ID: <9e3343c3-eef3-419b-868d-ab02dc66e47d@arm.com>
Date: Wed, 27 May 2026 11:13:08 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] arm64/vmalloc: Allow arch_vmap_pte_range_map_size
 to batch multiple CONT_PTE
To: Wen Jiang <jiangwenxiaomi@gmail.com>, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
 will@kernel.org, akpm@linux-foundation.org, urezki@gmail.com
Cc: baohua@kernel.org, Xueyuan.chen21@gmail.com, rppt@kernel.org,
 david@kernel.org, ryan.roberts@arm.com, anshuman.khandual@arm.com,
 ajd@linux.ibm.com, linux-kernel@vger.kernel.org, jiangwen6@xiaomi.com
References: <20260522053146.83209-1-jiangwenxiaomi@gmail.com>
 <20260522053146.83209-3-jiangwenxiaomi@gmail.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20260522053146.83209-3-jiangwenxiaomi@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_224319_627199_28EC1CBF 
X-CRM114-Status: GOOD (  14.15  )
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



On 22/05/26 11:01 am, Wen Jiang wrote:
> From: "Barry Song (Xiaomi)" <baohua@kernel.org>
> 
> Allow arch_vmap_pte_range_map_size to batch multiple CONT_PTE hugepages,

..."to batch across multiple CONT_PTE blocks"

> reducing both PTE setup and TLB flush iterations.
> 
> Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
> Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> ---
>  arch/arm64/include/asm/vmalloc.h | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/vmalloc.h b/arch/arm64/include/asm/vmalloc.h
> index 4ec1acd3c1b34..787fd17b48e2c 100644
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
> +	size = 1UL << __fls(size);
> +	return size;
>  }
>  
>  #define arch_vmap_pte_range_unmap_size arch_vmap_pte_range_unmap_size


