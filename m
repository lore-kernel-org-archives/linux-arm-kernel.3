Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86B9CCC6B27
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 08:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pLz0WUS0mrx3dTeeDzKSgLGzynaLhzlb5S5tCNSjP/8=; b=RPDTf7IMirYudN86lJJ0r/k0Sm
	FsQfZCxfwe1fS+0aVe7EwMchVClFRDbAH2//xM0uc5o71T6cM0cAuCgjKoRSU3QpSEH9dr4ZDbgdB
	zrI2zflerxXiw0k2ZaHMLZuecbA/WnngO6BCsmsJFr+3rA4S919F/6gUDT1rR2IhWZMN9kzHU7VT4
	EIr+NvZf8R1de2T4MoGepo2LMqsfztrVZCaZCrBc4VphfPgV5cJQJ0ELVGWTjLQLOGDjuYji1PLsZ
	0cuZZ8Kfx7ZwTaO5p6/8yDbO80I71DeKeM2XX0bnsz4AcTX4DdOuyZikUBRQKt/6B/Gp9kR1K3ldW
	xxp34Yaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGuMN-0000000EtDZ-0Hzd;
	Wed, 14 Oct 2026 08:29:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGuMJ-0000000EtDG-3obh
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 14 Oct 2026 08:29:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=pLz0WUS0mrx3dTeeDzKSgLGzynaLhzlb5S5tCNSjP/8=; b=i0/7QeRSYXKCluBWSHSO/cewFx
	yKMc+ajcLw8CIx4c42y60x35YIDPQuDi3vjxgL+YBNeSkB72LrQ/ZST+w1JUI2hIUhoJzG6vUn6iX
	MX6FAyppDj+Q9NMi5+NMbvFqQX3FRkZ12Iph1qZkKnIsCzBZwsUW2cFH5sd02K7CykN+HWoQrLMaB
	2UdmSHqUaWg00AqCT9NJqNr3NdWLFkedm+dAnHJ+24D66QXPJ3Ky7Nw7v5p9rHjpXLtFSsqzRDdAc
	atKuyhxGVqqEQTgch9KXSMhRO22MONvwX26dB5vAGJ9a8t5QL3XSVVErFcthNyjpdEkpTI/EecLtm
	FHMEv1Kw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGuMG-0000000GVAp-1eZP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 08:29:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ADB0C1595;
	Wed, 14 Oct 2026 01:29:02 -0700 (PDT)
Received: from [10.164.19.62] (unknown [10.164.19.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7DCA23F7B4;
	Wed, 14 Oct 2026 01:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791966546; bh=uqP6rvffea+dKh44Kw66QNsZgkM+k15AAqbFFCdBQzc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SOprjAZnLFxQFUNswPjzKV3NyMvAa+cqELDDxOZy/T2dOvzLPhV8MisYlsgcPMyj0
	 QXcwMypubhur4Jr+wLDVasbysZkUEWzY4V2UTmjifL3aIeOBnZTwPI0O/w+IYUUpV3
	 4bepahBapz844zPgcczmYHn0Xjy/RiE8Co1chppI=
Message-ID: <51e80f6f-debe-401d-9e9f-140d31d94033@arm.com>
Date: Wed, 14 Oct 2026 13:58:57 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 05/10] arm64/vmalloc: allow
 arch_vmap_pte_range_map_size() to batch multiple CONT_PTE
To: Wen Jiang <jiangwenxiaomi@gmail.com>, akpm@linux-foundation.org,
 catalin.marinas@arm.com, linux-mm@kvack.org, urezki@gmail.com,
 will@kernel.org
Cc: Xueyuan.chen21@gmail.com, ajd@linux.ibm.com, anshuman.khandual@arm.com,
 baohua@kernel.org, chleroy@kernel.org, david@kernel.org,
 jiangwen6@xiaomi.com, leo.yan@arm.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, rppt@kernel.org,
 ryan.roberts@arm.com
References: <20261002090947.869220-1-jiangwen6@xiaomi.com>
 <20261002090947.869220-6-jiangwen6@xiaomi.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20261002090947.869220-6-jiangwen6@xiaomi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_092908_953772_D7E2F010 
X-CRM114-Status: GOOD (  19.30  )
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



On 02/10/26 2:39 pm, Wen Jiang wrote:
> From: "Barry Song (Xiaomi)" <baohua@kernel.org>
> 
> Allow arch_vmap_pte_range_map_size to batch across multiple CONT_PTE
> blocks, reducing both PTE setup and TLB flush iterations.
> 
> Previously the function returned a single CONT_PTE_SIZE for an aligned
> range, so the caller mapped one CONT_PTE block per iteration. Now, for a
> CONT_PTE_SIZE-aligned range, it returns the largest CONT_PTE-aligned size
> that fits within both the remaining range and the caller's max_page_shift,
> so a single pte_set_huge() call installs several CONT_PTE blocks at once.
> 
> Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
> Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> Tested-by: Leo Yan <leo.yan@arm.com>
> ---
>  arch/arm64/include/asm/vmalloc.h | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/vmalloc.h b/arch/arm64/include/asm/vmalloc.h
> index 4ec1acd3c1b34..c29704a19e276 100644
> --- a/arch/arm64/include/asm/vmalloc.h
> +++ b/arch/arm64/include/asm/vmalloc.h
> @@ -23,10 +23,12 @@ static inline unsigned long arch_vmap_pte_range_map_size(unsigned long addr,
>  						unsigned long end, u64 pfn,
>  						unsigned int max_page_shift)
>  {
> +	unsigned long size;
> +
>  	/*
> -	 * If the block is at least CONT_PTE_SIZE in size, and is naturally
> -	 * aligned in both virtual and physical space, then we can pte-map the
> -	 * block using the PTE_CONT bit for more efficient use of the TLB.
> +	 * If the range is at least CONT_PTE_SIZE and naturally aligned in both
> +	 * virtual and physical space, return the largest CONT_PTE-aligned size
> +	 * that fits, for more efficient use of the TLB.
>  	 */
>  	if (max_page_shift < CONT_PTE_SHIFT)
>  		return PAGE_SIZE;
> @@ -40,7 +42,9 @@ static inline unsigned long arch_vmap_pte_range_map_size(unsigned long addr,
>  	if (!IS_ALIGNED(PFN_PHYS(pfn), CONT_PTE_SIZE))
>  		return PAGE_SIZE;
>  
> -	return CONT_PTE_SIZE;
> +	size = min(end - addr, 1UL << max_page_shift);

Okay so we have implicit PMD_SIZE capping due to (end - addr) being
clamped due to pmd_addr_end(), so we are safe.

Reviewed-by: Dev Jain <dev.jain@arm.com>


> +	size = round_down(size, CONT_PTE_SIZE);
> +	return size;
>  }
>  
>  #define arch_vmap_pte_range_unmap_size arch_vmap_pte_range_unmap_size


