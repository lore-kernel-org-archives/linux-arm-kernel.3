Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE887C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 05:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rRaYq/2pKzlXdYXFBCK443SOjoWqLtid9IHc6sh0FFs=; b=Zx2TzayeuYeMbj20zWEUweQem3
	T7l174i60ZuFDfVmEX7ZWnUY7W4feEvYSWPBRGy3enwSUd61YiiuALfTqVi0Tcx4Sl6fQTdE+uuVX
	XNX6soJcH7WDFBdQZhU+yvIFYPkZlDPCeT+WHu3plkJf39n9nJ4nLkmyNtRC0eQnWOGJKGPneSkgk
	j7UReZlBgxETTUF41uQL5rKAtNPFllChakIETghdT2PV6ZLHZQ1try9BYN9iejYLA14xTc3kAEZy/
	61g8+rvAD3xhkhDld8rQ1vrvTCQKF5ms89fcsn1ahRvLQNQOkrnKG2IvSnG89GS8bjxLSJaqJNVQW
	Be/j79yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjVKS-0000000AuWC-1Hxr;
	Tue, 14 Jul 2026 05:05:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjVKP-0000000AuVg-34Du
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 05:05:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0E2101570;
	Mon, 13 Jul 2026 22:05:04 -0700 (PDT)
Received: from [10.164.148.52] (unknown [10.164.148.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 22C9D3F7D8;
	Mon, 13 Jul 2026 22:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784005508; bh=qT2mgHMj6QJLWSA0zgmN/WGwxPyCB1BtgvzkcnB5MEE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IskI8LYMi4GXyfPv7L8xPVpvWDxpiq8313AKc2M43sY5KWhxkTyocowGn4AGEEyJv
	 h44kaMYYonhUoEWFqSxZ0jdW4tTEI3H2Xaqo/l/lc9ViKG0y333AP70WBnwJ1SDx3L
	 9P/n83Am3WBMzsWH5EFM54C0a4T+luMARG5rJaxE=
Message-ID: <6b526275-0e43-413e-adfe-b466155d9ae0@arm.com>
Date: Tue, 14 Jul 2026 10:35:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/6] mm/vmalloc: align vm_area so vmap() can batch
 mappings
To: Wen Jiang <jiangwenxiaomi@gmail.com>, akpm@linux-foundation.org,
 catalin.marinas@arm.com, linux-mm@kvack.org, urezki@gmail.com,
 will@kernel.org
Cc: Xueyuan.chen21@gmail.com, ajd@linux.ibm.com, anshuman.khandual@arm.com,
 david@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, rppt@kernel.org, ryan.roberts@arm.com,
 "Barry Song (Xiaomi)" <baohua@kernel.org>, Wen Jiang <jiangwen6@xiaomi.com>,
 Leo Yan <leo.yan@arm.com>
References: <20260709073823.6643-1-jiangwen6@xiaomi.com>
 <20260709073823.6643-7-jiangwen6@xiaomi.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20260709073823.6643-7-jiangwen6@xiaomi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_220509_863080_5B05DED3 
X-CRM114-Status: GOOD (  18.63  )
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



On 09/07/26 1:08 pm, Wen Jiang wrote:
> From: "Barry Song (Xiaomi)" <baohua@kernel.org>
> 
> Try to align the vmap virtual address to PMD_SHIFT or a
> larger PTE mapping size hinted by the architecture, so
> contiguous pages can be batch-mapped when setting PMD or
> PTE entries. We do not expect any significant overhead for
> this.
> 
> Add __get_vm_area_node_aligned_caller() as a wrapper over
> __get_vm_area_node() to simplify repeated calls with fixed
> arguments.
> 
> Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
> Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> Tested-by: Leo Yan <leo.yan@arm.com>
> Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
> ---

Reviewed-by: Dev Jain <dev.jain@arm.com>


>  mm/vmalloc.c | 35 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 34 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index db0492151ad08..2ac805cdf18ad 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -3314,6 +3314,14 @@ struct vm_struct *get_vm_area_caller(unsigned long size, unsigned long flags,
>  				  NUMA_NO_NODE, GFP_KERNEL, caller);
>  }
>  
> +static struct vm_struct *__get_vm_area_node_aligned_caller(unsigned long size,
> +		unsigned long align, unsigned long flags, const void *caller)
> +{
> +	return __get_vm_area_node(size, align, PAGE_SHIFT, flags,
> +				  VMALLOC_START, VMALLOC_END,
> +				  NUMA_NO_NODE, GFP_KERNEL, caller);
> +}
> +
>  /**
>   * find_vm_area - find a continuous kernel virtual area
>   * @addr:	  base address
> @@ -3626,6 +3634,30 @@ static int vmap_pages_range_batched(unsigned long addr, unsigned long end,
>  	return err;
>  }
>  
> +static struct vm_struct *vmap_get_aligned_vm_area(unsigned long size,
> +		unsigned long flags, pgprot_t prot, const void *caller)
> +{
> +	struct vm_struct *vm_area;
> +	unsigned int shift;
> +
> +	if (arch_vmap_pmd_supported(prot) && size >= PMD_SIZE) {
> +		vm_area = __get_vm_area_node_aligned_caller(size, PMD_SIZE,
> +				flags, caller);
> +		if (vm_area)
> +			return vm_area;
> +	}
> +
> +	shift = arch_vmap_pte_supported_shift(size);
> +	if (shift > PAGE_SHIFT) {
> +		vm_area = __get_vm_area_node_aligned_caller(size, 1UL << shift,
> +				flags, caller);
> +		if (vm_area)
> +			return vm_area;
> +	}
> +
> +	return __get_vm_area_node_aligned_caller(size, PAGE_SIZE, flags, caller);
> +}
> +
>  /**
>   * vmap - map an array of pages into virtually contiguous space
>   * @pages: array of page pointers
> @@ -3664,7 +3696,8 @@ void *vmap(struct page **pages, unsigned int count,
>  		return NULL;
>  
>  	size = (unsigned long)count << PAGE_SHIFT;
> -	area = get_vm_area_caller(size, flags, __builtin_return_address(0));
> +	area = vmap_get_aligned_vm_area(size, flags, prot,
> +				__builtin_return_address(0));
>  	if (!area)
>  		return NULL;
>  


