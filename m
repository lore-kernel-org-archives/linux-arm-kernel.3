Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3802C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 06:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u/fJt3NKLlyjvcFkI8VZNqRDO7ANl8HQ8B6aLmlQAi4=; b=NsIQebvyQE6Kion5VDCrOy+Rj2
	QyXDMi58fcahYjpLBAVttRETADCk4YrY8RY4o9Z5FzGrRXCrjKzqVYHiRxxLlSD0hegqGOe2u5rZJ
	XGUhP+Qd0pmsDBfyq8TVY7f6LWg1CT+vRRjoUmFaF2EVkQEu77+5maRdcL/SIrU0Dqmlwhn/sa8tR
	hxSOdLk2DzgunRMM1KMoLVlT9MOi/nbAU2cUL6MMj6czbKo1qrPF6d4WnE6iD7m4J4Zqdvz57GPLD
	B8dbKfd5b93WCu1V776wlNxz/ro6vzuNc1tB81BH9qOYyAGJNYQ/4UqOmONO02XKyaco87su5lxmS
	FXvAQiqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we5mD-0000000DnXd-1M1W;
	Mon, 29 Jun 2026 06:47:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we5m4-0000000DnW1-2mwp
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 29 Jun 2026 06:47:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=u/fJt3NKLlyjvcFkI8VZNqRDO7ANl8HQ8B6aLmlQAi4=; b=RQOUl5EWAYVMIlc8EWYwSQMO2t
	k+XlusLCMmMyOm+Vb4ga4PW0ysENCctehaVj4Z6eKU/+RacIkRxXDxgxoz0DFjC92wq4Cn+4AGK+S
	MAktp1llea7oYyWHCEO0k2HZ6fKfQRL4t4DItTDID/ZkvOeKgTQdax+aQNPEM80grN5eKK1j8enHU
	5RY1+Hd7jixf2NrAMaETa7MMYRpWE3KagicNRAAzfy2APcrnFTx3ArA5iuogxeIjkLkvEzbDZbp8C
	yEWVbZ38r8PyTl6mcH2JJPetlKORIlKcaw/REedUwdcwtzmtHAL/upTSZQKgQjHPsURjVGigbMvTq
	gTwKzhbQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1we5m1-00000000hIb-0zpz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 06:47:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2002E176B;
	Sun, 28 Jun 2026 23:47:10 -0700 (PDT)
Received: from [10.164.19.15] (unknown [10.164.19.15])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3C1F03F85F;
	Sun, 28 Jun 2026 23:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782715634; bh=wG+BKRCh7EswG1NnBEIJLxPGzB+YZ6gQORqGiFpNlxk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=L1ipuc6pUg//TJm2iPvJ8j4e8NZzKbVkfx4X1O65glkyl1Z6AzAdvwnb9H9muTdJO
	 yIY6NujGnMcYEdyOgxBHRN6ZdFko2nQQ03RgGjxLf8sfQD0J/IMOFAieH7m5C84m1a
	 DYnT2j6Lc7v4DOn1UajCixH0dkmX1SKs8MWOtFHM=
Message-ID: <aecf8ea2-43e3-4aad-810a-120b036d8bc2@arm.com>
Date: Mon, 29 Jun 2026 12:17:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/6] mm/vmalloc: align vm_area so vmap() can batch
 mappings
To: Wen Jiang <jiangwenxiaomi@gmail.com>, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
 will@kernel.org, akpm@linux-foundation.org, urezki@gmail.com
Cc: baohua@kernel.org, Xueyuan.chen21@gmail.com, rppt@kernel.org,
 david@kernel.org, ryan.roberts@arm.com, anshuman.khandual@arm.com,
 ajd@linux.ibm.com, linux-kernel@vger.kernel.org, jiangwen6@xiaomi.com,
 shanghaoqiang@xiaomi.com
References: <20260618084726.1070022-1-jiangwen6@xiaomi.com>
 <20260618084726.1070022-7-jiangwen6@xiaomi.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20260618084726.1070022-7-jiangwen6@xiaomi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_074717_701839_132709CF 
X-CRM114-Status: GOOD (  20.66  )
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



On 18/06/26 2:17 pm, Wen Jiang wrote:
> From: "Barry Song (Xiaomi)" <baohua@kernel.org>
> 
> Try to align the vmap virtual address to PMD_SHIFT or a
> larger PTE mapping size hinted by the architecture, so
> contiguous pages can be batch-mapped when setting PMD or
> PTE entries.
> 
> Add __get_vm_area_node_aligned_caller() as a wrapper over
> __get_vm_area_node() to simplify repeated calls with fixed
> arguments.
> 
> Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
> Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> ---
>  mm/vmalloc.c | 37 ++++++++++++++++++++++++++++++++++++-
>  1 file changed, 36 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index fffb885cb2158..bc9fa93e2bdc6 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -3628,6 +3628,41 @@ static int vmap_batched(unsigned long addr, unsigned long end,
>  	return err;
>  }
>  
> +static struct vm_struct *__get_vm_area_node_aligned_caller(unsigned long size,
> +		unsigned long align, unsigned long flags, const void *caller)

There are 3 similar functions below __get_vm_area_node: they are __get_vm_area_caller,
get_vm_area and get_vm_area_caller. You can put this one just below them.


> +{
> +	return __get_vm_area_node(size, align, PAGE_SHIFT, flags,
> +			VMALLOC_START, VMALLOC_END,
> +			NUMA_NO_NODE, GFP_KERNEL, caller);
> +}
> +
> +static struct vm_struct *vmap_get_aligned_vm_area(unsigned long size,
> +		unsigned long flags, const void *caller)
> +{
> +	struct vm_struct *vm_area;
> +	unsigned int shift;
> +
> +	/* Try PMD alignment for large sizes */

This comment feels excessive. Can remove it.


> +	if (size >= PMD_SIZE) {

Need an arch_vmap_pmd_supported() check here.


> +		vm_area = __get_vm_area_node_aligned_caller(size, PMD_SIZE,
> +				flags, caller);
> +		if (vm_area)
> +			return vm_area;
> +	}
> +
> +	/* Try CONT_PTE alignment */

Comment feels excessive, and again no need to mention arm64 specific stuff here.
Just remove it.

> +	shift = arch_vmap_pte_supported_shift(size);
> +	if (shift > PAGE_SHIFT) {
> +		vm_area = __get_vm_area_node_aligned_caller(size, 1UL << shift,
> +				flags, caller);
> +		if (vm_area)
> +			return vm_area;
> +	}
> +
> +	/* Fall back to page alignment */

This comment can also be dropped, but I am fine either way.


> +	return __get_vm_area_node_aligned_caller(size, PAGE_SIZE, flags, caller);
> +}
> +
>  /**
>   * vmap - map an array of pages into virtually contiguous space
>   * @pages: array of page pointers
> @@ -3666,7 +3701,7 @@ void *vmap(struct page **pages, unsigned int count,
>  		return NULL;
>  
>  	size = (unsigned long)count << PAGE_SHIFT;
> -	area = get_vm_area_caller(size, flags, __builtin_return_address(0));
> +	area = vmap_get_aligned_vm_area(size, flags, __builtin_return_address(0));

So the effect is that now we search for an aligned vm_struct unconditionally. Better
to mention in the commit message that we do not expect any significant overhead for
this.


>  	if (!area)
>  		return NULL;
>  


