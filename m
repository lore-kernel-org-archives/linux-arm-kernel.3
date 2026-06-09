Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87C24CD8CA4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 13:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r+UubitX36JVc6CTd2RtBwcVL2yqRgVyLq15MXv0auc=; b=H6QFKUdvEZXbBW0kzdMsMp4Owq
	4TMnwBxWUO1URjEfpdQvOFdPbw8Y3A52DyilVVgiHZiQrDxFomxzrxUrbVitFzFqA6V5NEHanxm2w
	dtMiMbmF7JFSU/Vlb8jvJm2vRw/25ak5Tow2BvKgj3EWDvcBMbvMKJOBVi2wicfxG4ljebKXX9G35
	1nRUjiiYu9e98C3Sa6tzksAtQKZbtavw+sVQ1y8GixsKjwehO+zkSXE7cwuOFnP36GVTMzEJ9PqGN
	+vpORBhKGxPdpAhGVhEKxElwLisZUCuxurpycxo6K/LdDMcoijmkFwogqpsPAUDo1hBn9wkiysvvv
	WxL/TQQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWwa1-00000005feM-02UG;
	Tue, 09 Jun 2026 13:33:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWwZt-00000005fc8-3pc7
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 09 Jun 2026 13:33:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=r+UubitX36JVc6CTd2RtBwcVL2yqRgVyLq15MXv0auc=; b=SxgQe7HRK03lh/BpGmJUTncY4m
	p5xvQCyOfX4OEl0oW+/Nt+k1kptXqi9ZB8MWf1nhJzl75K0bsnauSAJwoo3nYi1cBE/sDLXTPxnQy
	MLFv6ZQD4edh9x2MupVbKGbM5/u7LUZCCygjoeLdGoDMtt7306eI1RkxuiydJ4JJ0gACp4i6+l0bQ
	4fX8JgERSFA1H1garVamB4OngOmkAjc1PV2xuWwJknZBDSDr3+OPHbpXEFo5LaI0+r9MjIKO6nVLt
	53wuC0/04Jw3vzQhF86uqNczjoXBXoos6TykBSWh4Zq/l89MK68sAM0WjzY8SUkR5u2dsvw8dDZzR
	mn8SR46w==;
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wWwZn-00000002a91-3e1M
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 13:33:12 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-46018d6c00aso310534f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 06:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1781011984; x=1781616784; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r+UubitX36JVc6CTd2RtBwcVL2yqRgVyLq15MXv0auc=;
        b=ZnoToxEIVOSOnV+THofAYbtFIE2VL62dm+Gq5tfp6ro8HJAOLKxLQF18rVOZjDFaKP
         yBuTX1z6lsJVmyd1oT74M6vzok5GTzmPBqQ/ylhEzpLTVZM55NJv0Z8h/xEp31iEOLtz
         8fvB8mQjWbcePPPCH6SrJBX1Bj5fZXHM9uKb2UU0Z712mY6Lcg5viL0CpZCB6djiGpt4
         AU4TDmqVfj7uncp764rdL7B3JpRv5wvc8pcap+W+n7xkz6y17sz3L7ZMUoPV9r+qxsfB
         OAxOEqHgQz7w5rZRW3IaNUcaqB/unw+tIb7d9b0xanjsf42hnRjj+whmS43rUDtsU7Fb
         E8Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781011984; x=1781616784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r+UubitX36JVc6CTd2RtBwcVL2yqRgVyLq15MXv0auc=;
        b=Q/UwcABxFKD2qDHwZzJRWNKhLaUKQdcKiV8ejyC4ovQmmTT0R+rZ1L+DWrk53FrgBd
         Q127fCjJNGzUfCtqJ7RvmtgeX/83HDtsLQ3Ie0I9QRlENH2qaXwKlnZsk3BJufowL8Ra
         QIwspsDrJhdAIZiDU3zfZi77PlmHPrTPmgbS53cEVEDQMCEWnqPDMobBK0bnNQV8JOJ2
         l2TEml018SA49eC2MOOb12fDTB1uACOjskTgegR21ZhvUjyqZi9vh5dm0BX+v22fkjfX
         UvFCxLBs7DGdvl5siD4yhhuRiitG0uTV6URyegRnCRqw2UlETdh/y7grvVzc5fC8v+ZG
         5wKw==
X-Forwarded-Encrypted: i=1; AFNElJ+bGQ/t3tAqzLckhqNpBAHrKpugVy/WnjNrLQj1vMlRkL3pfhnkYi1dNNtlKHMs1o8ktijqPUttUXqHRIhRsmM3@lists.infradead.org
X-Gm-Message-State: AOJu0YySQnWh4Lpt/bNkQBa+lgC7I5Ze2GBvVRKoIf4MnrCbLneiURb7
	E/g/Omj8Nag/tL6Bpb9ABbUubOMnx8xXU4I/431QwyusQMmPqkNNO1EvqabYA3jjb2Q=
X-Gm-Gg: Acq92OFatBi4k6M3fhD0VOSzS9ozvr85dv+JMBTF/tjes9/vzStJl+bdrLvx0oiiiX9
	jumLmCPbsxM+L3Aju0pyOTfrhij6VQlA94oZdW+UbJe04eTrcEaLFUUMTrGc0WZiY3d2XW4S4kI
	J+XUjGXHX02BI8jombSYgs4MXHjcR9zblPG1+7yl/8y3tE6gmyvIoVtr4fO1YiGnFXUGeFcXejs
	bnJPuhxu0wVRG5jWLRIjqQLBPxyjAh/vpbpxT9PvyJB8+De40xTZIK2Rn/ttVGgRPjJLidEtVE/
	pjpwvKvOIGHsQB75IsfvaFMeYlEQyTbK6sakGyzBx9KGBhXft2GTUmX5zeu4q15lfqGn2cWTzKk
	9mowwu6O+su1xXzkbCqXLm5we/yTo8dECKaLzmOpk47Xcl6kHgBk5IHqHv/bwc12JTVkVnsPuax
	+8XqDhW7U+3dzg8xVstf3nN+0=
X-Received: by 2002:a05:6000:4022:b0:45e:f68d:e7ac with SMTP id ffacd0b85a97d-46056439196mr1887515f8f.0.1781011984149;
        Tue, 09 Jun 2026 06:33:04 -0700 (PDT)
Received: from mordecai ([62.77.90.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46059346676sm1079048f8f.26.2026.06.09.06.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 06:32:58 -0700 (PDT)
Date: Tue, 9 Jun 2026 15:32:55 +0200
From: Petr Tesarik <ptesarik@suse.com>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, Robin Murphy
 <robin.murphy@arm.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Will
 Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Steven Price
 <steven.price@arm.com>, Suzuki K Poulose <Suzuki.Poulose@arm.com>, Catalin
 Marinas <catalin.marinas@arm.com>, Jiri Pirko <jiri@resnulli.us>, Jason
 Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, Alexey
 Kardashevskiy <aik@amd.com>, Dan Williams <dan.j.williams@intel.com>, Xu
 Yilun <yilun.xu@linux.intel.com>, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle
 <svens@linux.ibm.com>, x86@kernel.org, Michael Kelley
 <mhklinux@outlook.com>
Subject: Re: [PATCH v6 17/20] dma: swiotlb: handle set_memory_decrypted()
 failures
Message-ID: <20260609153255.4b9e9373@mordecai>
In-Reply-To: <20260604083959.1265923-18-aneesh.kumar@kernel.org>
References: <20260604083959.1265923-1-aneesh.kumar@kernel.org>
	<20260604083959.1265923-18-aneesh.kumar@kernel.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_143308_043291_08A19900 
X-CRM114-Status: GOOD (  30.46  )
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

On Thu,  4 Jun 2026 14:09:56 +0530
"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org> wrote:

> Check the return value when converting swiotlb pools between encrypted and
> decrypted mappings. If the default pool cannot be decrypted after early
> initialization, mark the pool fully used so it cannot satisfy future bounce
> allocations.
> 
> For late initialization, return the `set_memory_decrypted()` failure. For
> restricted DMA pools, fail device initialization if the reserved pool
> cannot be decrypted.
> 
> This prevents swiotlb from using pools whose encryption attributes do not
> match their metadata, and avoids returning pages with uncertain encryption
> state back to the allocator.

This works fine, but instead of effectively leaking the memory, we
could return it to the buddy allocator and reset nslabs to zero as if
SWIOTLB was not even initialized.

OTOH I don't want to overthink this, because the system is probably not
too useful after such a boot-time failure, so unless you _want_ to
improve the error path, you can simply add:

Reviewed-by: Petr Tesarik <ptesarik@suse.com>

Petr T

> Tested-by: Michael Kelley <mhklinux@outlook.com>
> Tested-by: Mostafa Saleh <smostafa@google.com>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> ---
>  kernel/dma/swiotlb.c | 80 +++++++++++++++++++++++++++++++++++---------
>  1 file changed, 65 insertions(+), 15 deletions(-)
> 
> diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
> index 4c56f64602ea..14d834ca298b 100644
> --- a/kernel/dma/swiotlb.c
> +++ b/kernel/dma/swiotlb.c
> @@ -248,6 +248,23 @@ static inline unsigned long nr_slots(u64 val)
>  	return DIV_ROUND_UP(val, IO_TLB_SIZE);
>  }
>  
> +static void swiotlb_mark_pool_used(struct io_tlb_pool *pool)
> +{
> +	unsigned long i;
> +
> +	for (i = 0; i < pool->nareas; i++) {
> +		pool->areas[i].index = 0;
> +		pool->areas[i].used = pool->area_nslabs;
> +	}
> +
> +	for (i = 0; i < pool->nslabs; i++) {
> +		pool->slots[i].list = 0;
> +		pool->slots[i].orig_addr = INVALID_PHYS_ADDR;
> +		pool->slots[i].alloc_size = 0;
> +		pool->slots[i].pad_slots = 0;
> +	}
> +}
> +
>  /*
>   * Early SWIOTLB allocation may be too early to allow an architecture to
>   * perform the desired operations.  This function allows the architecture to
> @@ -272,8 +289,16 @@ void __init swiotlb_update_mem_attributes(void)
>  		return;
>  	bytes = PAGE_ALIGN(mem->nslabs << IO_TLB_SHIFT);
>  
> -	if (io_tlb_default_mem.unencrypted)
> -		set_memory_decrypted((unsigned long)mem->vaddr, bytes >> PAGE_SHIFT);
> +	if (io_tlb_default_mem.unencrypted) {
> +		int ret;
> +
> +		ret = set_memory_decrypted((unsigned long)mem->vaddr,
> +					   bytes >> PAGE_SHIFT);
> +		if (ret) {
> +			pr_warn("Failed to decrypt default memory pool, disabling it\n");
> +			swiotlb_mark_pool_used(mem);
> +		}
> +	}
>  }
>  
>  static void swiotlb_init_io_tlb_pool(struct io_tlb_pool *mem, phys_addr_t start,
> @@ -442,9 +467,10 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask,
>  {
>  	struct io_tlb_pool *mem = &io_tlb_default_mem.defpool;
>  	unsigned long nslabs = ALIGN(size >> IO_TLB_SHIFT, IO_TLB_SEGSIZE);
> +	unsigned int order, area_order, slot_order;
> +	bool leak_pages = false;
>  	unsigned int nareas;
>  	unsigned char *vstart = NULL;
> -	unsigned int order, area_order;
>  	bool retried = false;
>  	int rc = 0;
>  
> @@ -504,6 +530,7 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask,
>  			(PAGE_SIZE << order) >> 20);
>  	}
>  
> +	rc = -ENOMEM;
>  	nareas = limit_nareas(default_nareas, nslabs);
>  	area_order = get_order(array_size(sizeof(*mem->areas), nareas));
>  	mem->areas = (struct io_tlb_area *)
> @@ -511,14 +538,20 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask,
>  	if (!mem->areas)
>  		goto error_area;
>  
> +	slot_order = get_order(array_size(sizeof(*mem->slots), nslabs));
>  	mem->slots = (void *)__get_free_pages(GFP_KERNEL | __GFP_ZERO,
> -		get_order(array_size(sizeof(*mem->slots), nslabs)));
> +					      slot_order);
>  	if (!mem->slots)
>  		goto error_slots;
>  
> -	if (io_tlb_default_mem.unencrypted)
> -		set_memory_decrypted((unsigned long)vstart,
> -				     (nslabs << IO_TLB_SHIFT) >> PAGE_SHIFT);
> +	if (io_tlb_default_mem.unencrypted) {
> +		rc = set_memory_decrypted((unsigned long)vstart,
> +					  (nslabs << IO_TLB_SHIFT) >> PAGE_SHIFT);
> +		if (rc) {
> +			leak_pages = true;
> +			goto error_decrypt;
> +		}
> +	}
>  
>  	swiotlb_init_io_tlb_pool(mem, virt_to_phys(vstart), nslabs, true,
>  				 nareas);
> @@ -527,16 +560,20 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask,
>  	swiotlb_print_info();
>  	return 0;
>  
> +error_decrypt:
> +	free_pages((unsigned long)mem->slots, slot_order);
>  error_slots:
>  	free_pages((unsigned long)mem->areas, area_order);
>  error_area:
> -	free_pages((unsigned long)vstart, order);
> -	return -ENOMEM;
> +	if (!leak_pages)
> +		free_pages((unsigned long)vstart, order);
> +	return rc;
>  }
>  
>  void __init swiotlb_exit(void)
>  {
>  	struct io_tlb_pool *mem = &io_tlb_default_mem.defpool;
> +	bool leak_pages = false;
>  	unsigned long tbl_vaddr;
>  	size_t tbl_size, slots_size;
>  	unsigned int area_order;
> @@ -552,19 +589,23 @@ void __init swiotlb_exit(void)
>  	tbl_size = PAGE_ALIGN(mem->end - mem->start);
>  	slots_size = PAGE_ALIGN(array_size(sizeof(*mem->slots), mem->nslabs));
>  
> -	if (io_tlb_default_mem.unencrypted)
> -		set_memory_encrypted(tbl_vaddr, tbl_size >> PAGE_SHIFT);
> +	if (io_tlb_default_mem.unencrypted) {
> +		if (set_memory_encrypted(tbl_vaddr, tbl_size >> PAGE_SHIFT))
> +			leak_pages = true;
> +	}
>  
>  	if (mem->late_alloc) {
>  		area_order = get_order(array_size(sizeof(*mem->areas),
>  			mem->nareas));
>  		free_pages((unsigned long)mem->areas, area_order);
> -		free_pages(tbl_vaddr, get_order(tbl_size));
> +		if (!leak_pages)
> +			free_pages(tbl_vaddr, get_order(tbl_size));
>  		free_pages((unsigned long)mem->slots, get_order(slots_size));
>  	} else {
>  		memblock_free(mem->areas,
>  			array_size(sizeof(*mem->areas), mem->nareas));
> -		memblock_phys_free(mem->start, tbl_size);
> +		if (!leak_pages)
> +			memblock_phys_free(mem->start, tbl_size);
>  		memblock_free(mem->slots, slots_size);
>  	}
>  
> @@ -1938,9 +1979,18 @@ static int rmem_swiotlb_device_init(struct reserved_mem *rmem,
>  		 * restricted mem pool is decrypted by default
>  		 */
>  		if (cc_platform_has(CC_ATTR_MEM_ENCRYPT)) {
> +			int ret;
> +
>  			mem->unencrypted = true;
> -			set_memory_decrypted((unsigned long)phys_to_virt(rmem->base),
> -					     rmem->size >> PAGE_SHIFT);
> +			ret = set_memory_decrypted((unsigned long)phys_to_virt(rmem->base),
> +						   rmem->size >> PAGE_SHIFT);
> +			if (ret) {
> +				dev_err(dev, "Failed to decrypt restricted DMA pool\n");
> +				kfree(pool->areas);
> +				kfree(pool->slots);
> +				kfree(mem);
> +				return ret;
> +			}
>  		} else {
>  			mem->unencrypted = false;
>  		}


