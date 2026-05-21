Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 884D7CD5BAA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 08:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xo9jNx72J31UDHUkHSULoe2IcJFJnFlT88xcGflytr0=; b=LipxCsmPlmp1kymFTUWlg4mHyy
	seEEG4xLRbc7PifYuWK1L92aLQWgrdiEIV5WbDo+6HGlpzR9ZmhsOwHCrVFEuLhK7OeWDzrky9ddG
	rEZuMyJ7S2bfRI3N+Yur2MNqLGe+LlgYGhj8dEv7VRZ/n3PHOoTlc/jt3+BeXHIHbKZnUuM0M3yrc
	jmGCdX5lTXml9EixfEMCfoNdaYgSteeRlAdiA8ULiIbXrsXpkZc5apjol4w4wqWYa7kmqIKo8dyAs
	oBkuKQtKxea+2m4BUiLZisZoBDFF2z9oDydmffHcOj/se/Q/c4aXtkJu5jw91OgHOrL/2T/bZnYDD
	NGMU825w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPz6d-00000007Czh-46tm;
	Thu, 21 May 2026 08:50:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPz6a-00000007CyP-05qT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 08:50:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 30B541BF7;
	Thu, 21 May 2026 01:50:03 -0700 (PDT)
Received: from [10.57.91.212] (unknown [10.57.91.212])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 646F43F7B4;
	Thu, 21 May 2026 01:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779353408; bh=MhXGOMEd2ldhJe/G+pIUhlGCzdCvGYuxSKbJNXUFwXc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KRb/njuApSQvSrZXK69MxzbGVc+jTfDi1eLbtHMzb0Bzm96Zr5kSL+qO7AKIrUAqU
	 c9mByq/mzLEvf3pqVXjeDZ8b4WmkeMNNBumUECFH2081l5PACk4vRK6GilZCgx2XzZ
	 QZTfkmo4Y4f6HQ2vn6b62Bs3Cb6alv21CCqc1t7U=
Message-ID: <bc96d822-bb68-4945-9f74-68f77e389ac6@arm.com>
Date: Thu, 21 May 2026 09:50:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [RFC] arm64: mmu: use range based TLB flushing when hot
 unplugging memory
Content-Language: en-GB
To: Alistair Popple <apopple@nvidia.com>, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 catalin.marinas@arm.com, will@kernel.org, david@kernel.org,
 anshuman.khandual@arm.com, dev.jain@arm.com, balbirs@nvidia.com,
 jhubbard@nvidia.com
References: <20260521042426.2128731-1-apopple@nvidia.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20260521042426.2128731-1-apopple@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_015012_347211_A15370BF 
X-CRM114-Status: GOOD (  28.17  )
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

On 21/05/2026 05:24, Alistair Popple wrote:
> Hot unplugging memory on ARM64 requires a TLB invalidate after unmapping
> the page to be hot unplugged from the direct map. Currently that happens
> one page at a time, meaning range based invalidates cannot be used. The
> result of this is that removing large amounts of memory takes a long
> time and in some cases can trigger an RCU stall warning.
> 
> For example on one system hot unplugging 480GB of memory takes ~1
> minute. With this change the same operation took ~1 second, a 60x
> improvement.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> 
> ---
> 
> This is an RFC, because I'm not sure the change is correct as it frees
> the PTE page before flushing the TLB. I'm not familiar enough with ARM64
> architecture to be sure this is safe, for example I don't know if HW
> can update PTE bits such as access/dirty in the page through a stale
> TLB entry.
> 
> If so this would open a window during which the page is free but could
> still be written to. Likely the safe option would be to collect all the
> pages to be free on a list and free them after doing the range based TLB
> flush, but wanted to get feedback on the approach before implementing it
> which is the goal of this RFC.

Hi Alistair,

This patch doesn't apply on v7.1-rc4 because it conflicts with this patch:

Commit 48478b9f79137 ("arm64/mm: Enable batched TLB flush in unmap_hotplug_range()")

which has a very similar performance improvement, so hopefully it solves your
problem?

There are two paths which use this logic; unmapping the linear map and unmapping
the corresponding vmemmap. In the latter case, the memory is also freed, so we
can't safely do the range optimizaiton there since the TLB needs to be flushed
before freeing the memory. But the linear map is the big, slow bit so hopefully
it's sufficent for you?

Thanks,
Ryan



> ---
>  arch/arm64/mm/mmu.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index 0c24fe650e95..75c773232c14 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -1459,11 +1459,12 @@ static void unmap_hotplug_pte_range(pmd_t *pmdp, unsigned long addr,
>  
>  		WARN_ON(!pte_present(pte));
>  		__pte_clear(&init_mm, addr, ptep);
> -		flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
>  		if (free_mapped)
>  			free_hotplug_page_range(pte_page(pte),
>  						PAGE_SIZE, altmap);
>  	} while (addr += PAGE_SIZE, addr < end);
> +
> +	flush_tlb_kernel_range(addr, end);
>  }
>  
>  static void unmap_hotplug_pmd_range(pud_t *pudp, unsigned long addr,


