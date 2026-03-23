Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75E34F483CC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 16:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7oW8eeWlrFIS0etByx1jJuYk3xwlUeH3LcLLLh3/AUU=; b=mqFSlNUnpMPVBNxCkeRcxieGlZ
	pD3OsubiUQ7L4nA73ZPckHBIQWERFI+GXk3LRSSPN1TLRmwg4tnwcmxlF3Mqzn5eSaBBjpd4q6uXK
	rbRyggq4WZaJGVqKs1Q46qGdITi8SoDV1dy5veiuvq1lUwah0anz3c/EjR8tbYiBNBm8PQW9BKDMF
	ltTox2MmTbOJVNcLnHICW2PGIfELzQSXtZbkCrBnihDOqAsK/JyyNJnTfEMfOOv05x1AQF1OGteNB
	780pX0FqEirGHQCgj8zKK+Xd+z8/9RcP38Kmk/j6OoopAs3Sbrzjx6czcseveg+FwvS04wuaA3Q+e
	l/Cl9x3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4iWR-0000000HAmP-3kgr;
	Mon, 23 Mar 2026 16:52:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4iWP-0000000HAla-0nRB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 16:52:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 201FD14BF;
	Mon, 23 Mar 2026 09:52:48 -0700 (PDT)
Received: from [10.57.58.207] (unknown [10.57.58.207])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A68A33F73B;
	Mon, 23 Mar 2026 09:52:51 -0700 (PDT)
Message-ID: <71261065-7895-492f-8457-998901391530@arm.com>
Date: Mon, 23 Mar 2026 17:52:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] arm64: mm: Fix rodata=full block mapping support
 for realm guests
To: Ryan Roberts <ryan.roberts@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 "David Hildenbrand (Arm)" <david@kernel.org>, Dev Jain <dev.jain@arm.com>,
 Yang Shi <yang@os.amperecomputing.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Jinjiang Tu <tujinjiang@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20260323130317.1737522-1-ryan.roberts@arm.com>
 <20260323130317.1737522-2-ryan.roberts@arm.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <20260323130317.1737522-2-ryan.roberts@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_095257_355473_BA49AEEC 
X-CRM114-Status: GOOD (  22.66  )
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

On 23/03/2026 14:03, Ryan Roberts wrote:
> [...]
>
> diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
> index 96711b8578fd0..b9b248d24fd10 100644
> --- a/arch/arm64/mm/init.c
> +++ b/arch/arm64/mm/init.c
> @@ -350,7 +350,6 @@ void __init arch_mm_preinit(void)
>  	}
>  
>  	swiotlb_init(swiotlb, flags);
> -	swiotlb_update_mem_attributes();
>  
>  	/*
>  	 * Check boundaries twice: Some fundamental inconsistencies can be
> @@ -377,6 +376,14 @@ void __init arch_mm_preinit(void)
>  	}
>  }
>  
> +bool page_alloc_available __ro_after_init;
> +
> +void __init mem_init(void)
> +{
> +	page_alloc_available = true;
> +	swiotlb_update_mem_attributes();

The move seems reasonable, x86 calls this function even later (from
arch_cpu_finalize_init()).

> +}
> +
>  void free_initmem(void)
>  {
>  	void *lm_init_begin = lm_alias(__init_begin);
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index a6a00accf4f93..5b6a8d53e64b7 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -773,14 +773,33 @@ int split_kernel_leaf_mapping(unsigned long start, unsigned long end)
>  {
>  	int ret;
>  
> -	/*
> -	 * !BBML2_NOABORT systems should not be trying to change permissions on
> -	 * anything that is not pte-mapped in the first place. Just return early
> -	 * and let the permission change code raise a warning if not already
> -	 * pte-mapped.
> -	 */
> -	if (!system_supports_bbml2_noabort())
> -		return 0;
> +	if (!system_supports_bbml2_noabort()) {
> +		/*
> +		 * !BBML2_NOABORT systems should not be trying to change
> +		 * permissions on anything that is not pte-mapped in the first
> +		 * place. Just return early and let the permission change code
> +		 * raise a warning if not already pte-mapped.
> +		 */
> +		if (system_capabilities_finalized() ||
> +		    !cpu_supports_bbml2_noabort())
> +			return 0;
> +
> +		/*
> +		 * Boot-time: split_kernel_leaf_mapping_locked() allocates from
> +		 * page allocator. Can't split until it's available.
> +		 */
> +		extern bool page_alloc_available;

Could we at least have the declaration in say <asm/mmu.h>? x86 defines a
similar global so we could eventually have a generic global (defined
before mem_init() is called).

Looks good otherwise:

Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>

> +		if (WARN_ON(!page_alloc_available))
> +			return -EBUSY;
> +
> +		/*
> +		 * Boot-time: Started secondary cpus but don't know if they
> +		 * support BBML2_NOABORT yet. Can't allow splitting in this
> +		 * window in case they don't.
> +		 */
> +		if (WARN_ON(num_online_cpus() > 1))
> +			return -EBUSY;
> +	}
>  
>  	/*
>  	 * If the region is within a pte-mapped area, there is no need to try to

