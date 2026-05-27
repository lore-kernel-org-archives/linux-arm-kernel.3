Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7469CD5BDE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 06:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m1zgrGPeMao8J4xGlyLb/q2cSMf+8Wq1BfCmY/13lV4=; b=LwfKi21QKMfjgKKuWK7sIhQRMI
	ZE9htp8NRb+yppybD3nr/rGh1qM1ntLM6xDhpr9wX8gMwQWp0nwGx80zBxLGRNKQKVnwo4aPgq3BZ
	bD0+werrcEt/A8t6bdUWOLJfv/GzR7RT+ADSaktqrAI4C9eYOB5uk1JksxLLlsdzCAEzmvZlZSDjX
	t0vN3/jfPFnXn5ZN59sQSpniOmIULxeuiKx48YaJPRcUMUUtifOYT5+aLmVxggtVMHvh+IUszVz5q
	I4dq4Vs48Yk2C/npwNQ7GyxXxE1ar0k8c3NlUgI+gtdCuHgQz+s9cPOUUNNjybHBLuY148biUX90i
	Ep6fjo6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS7hr-00000003OgW-0ts2;
	Wed, 27 May 2026 06:25:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS7hp-00000003Og8-0Wsu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 06:25:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0538016F2;
	Tue, 26 May 2026 23:25:21 -0700 (PDT)
Received: from [10.164.19.7] (unknown [10.164.19.7])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0A8BB3F7D8;
	Tue, 26 May 2026 23:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779863126; bh=XYu6VQADzDpdw6q2TY6lK1+GI951HIpJzp0bX60oZgU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PydP0UjdZDCNTpScwrFAsMRsTLKwFIK5YBghaJduK7HGmvo3TZq2q2T+sFXXX+2gf
	 MwwRXey5UkH5o+sbVLxMa+putsdHUQ792P59cEXT9BIZrcuEAI92zO0/yD4aXgRpMH
	 rjWFdBF1fQ8EBemiyat4eK/Kw+oHpwIRoZos6Oqs=
Message-ID: <3f55655c-b50b-45fa-9314-23e35d04ae7e@arm.com>
Date: Wed, 27 May 2026 11:55:17 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] mm/vmalloc: align vm_area so vmap() can batch
 mappings
To: Wen Jiang <jiangwenxiaomi@gmail.com>, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
 will@kernel.org, akpm@linux-foundation.org, urezki@gmail.com
Cc: baohua@kernel.org, Xueyuan.chen21@gmail.com, rppt@kernel.org,
 david@kernel.org, ryan.roberts@arm.com, anshuman.khandual@arm.com,
 ajd@linux.ibm.com, linux-kernel@vger.kernel.org, jiangwen6@xiaomi.com
References: <20260522053146.83209-1-jiangwenxiaomi@gmail.com>
 <20260522053146.83209-7-jiangwenxiaomi@gmail.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20260522053146.83209-7-jiangwenxiaomi@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_232529_251031_F62F0493 
X-CRM114-Status: GOOD (  19.91  )
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
> Try to align the vmap virtual address to PMD_SHIFT or a
> larger PTE mapping size hinted by the architecture, so
> contiguous pages can be batch-mapped when setting PMD or
> PTE entries.
> 
> Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
> Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>


Hmm okay I would have preferred to squash this in the previous, but
the correctness of previous patch does not rely on this, so it's fine.

> ---
>  mm/vmalloc.c | 33 ++++++++++++++++++++++++++++++++-
>  1 file changed, 32 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 50642246f4d40..040d400928aab 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -3620,6 +3620,37 @@ static int vmap_batched(unsigned long addr, unsigned long end,
>  	return err;
>  }
>  

This is screaming for a helper :)

> +static struct vm_struct *get_aligned_vm_area(unsigned long size,
> +		unsigned long flags, const void *caller)


Call this vmap_get_aligned_vm_area, then ...


> +{
> +	struct vm_struct *vm_area;
> +	unsigned int shift;
> +
> +	/* Try PMD alignment for large sizes */
> +	if (size >= PMD_SIZE) {
> +		vm_area = __get_vm_area_node(size, PMD_SIZE, PAGE_SHIFT, flags,
> +				VMALLOC_START, VMALLOC_END,
> +				NUMA_NO_NODE, GFP_KERNEL, caller);

Add a wrapper over this called __get_vm_area_node_aligned_caller, which can
call __get_vm_area_node() with all other arguments fixed, except "align".

> +		if (vm_area)
> +			return vm_area;
> +	}
> +
> +	/* Try CONT_PTE alignment */
> +	shift = arch_vmap_pte_supported_shift(size);
> +	if (shift > PAGE_SHIFT) {
> +		vm_area = __get_vm_area_node(size, 1UL << shift, PAGE_SHIFT, flags,
> +				VMALLOC_START, VMALLOC_END,
> +				NUMA_NO_NODE, GFP_KERNEL, caller);
> +		if (vm_area)
> +			return vm_area;
> +	}
> +
> +	/* Fall back to page alignment */
> +	return __get_vm_area_node(size, PAGE_SIZE, PAGE_SHIFT, flags,
> +			VMALLOC_START, VMALLOC_END,
> +			NUMA_NO_NODE, GFP_KERNEL, caller);
> +}
> +
>  /**
>   * vmap - map an array of pages into virtually contiguous space
>   * @pages: array of page pointers
> @@ -3658,7 +3689,7 @@ void *vmap(struct page **pages, unsigned int count,
>  		return NULL;
>  
>  	size = (unsigned long)count << PAGE_SHIFT;
> -	area = get_vm_area_caller(size, flags, __builtin_return_address(0));
> +	area = get_aligned_vm_area(size, flags, __builtin_return_address(0));
>  	if (!area)
>  		return NULL;
>  


