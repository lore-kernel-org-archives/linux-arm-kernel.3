Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8ED8C5DF85
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 15:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WmlYvjQrS9cRDoxrtm+bpABjVzgRdOhtdLbmKOqxeSk=; b=JWhSqKdKrSoMgnw2AoDFiKAhtM
	wn/1qA7vFxmsLBga2qQRNVy2171tVjMGnp6/+xiTU08BZwFosBEqt8p+E24FpZ/7o6c8rw45B3BVM
	7zeuMhCJ5Eac936LTwaZNYyusfMbZgyMPDqfADI9My7rPQtUxpzedeapNe0C++2nONNoalB5NaJ47
	ymhD/CANfowNrO064y8dWz9IwU8i5SAYErUPA2/ajNs2JgxOQjxi5VTEK2hesu82F9VGpi5GHb75/
	rLcs+Y+os8BU8YxKVoASVlxBPN9plFUT/dyMMLVGVSmjivQd41EklncNxyD2o7YNDTOK2EDPGGR5I
	5I3poCRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx4yF-0000000BqF7-2LWG;
	Thu, 20 Aug 2026 15:46:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx4yC-0000000BqEN-2qae
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 15:46:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DD998153B;
	Thu, 20 Aug 2026 08:46:15 -0700 (PDT)
Received: from [10.1.25.29] (e122027.cambridge.arm.com [10.1.25.29])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9E8093F763;
	Thu, 20 Aug 2026 08:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787240779; bh=tizP7ZAWokMmTCHa05IgHIYRQP5Cvz/WFcQTr2EbS1s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bId47STGDLWIojqSJdvsJV3QfdP2sGWTntnl86S5P3JChqvbokbvJHFhew/3s6bQ6
	 PQ+whQcNBfyu7Wmkw9Z1n3TJXAF69n5vS6RqcTAr89WRZ6ZWwep5+kkuyfmwjO+vuW
	 OqBssSecBtzw6YMdUgx77Pwz3ImrC0vzeyHuYJ0A=
Message-ID: <c25502d3-35c6-4281-a9ec-856f789fb1b4@arm.com>
Date: Thu, 20 Aug 2026 16:46:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] irqchip/gic-v3-its: Allocate VPE tables from
 sleepable context
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Marc Zyngier <maz@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Thomas Gleixner <tglx@kernel.org>
Cc: "T.J. Mercier" <tjmercier@google.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>,
 Jiri Pirko <jiri@resnulli.us>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>
References: <20260820150034.88729-1-steven.price@arm.com>
 <20260820150034.88729-3-steven.price@arm.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20260820150034.88729-3-steven.price@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_084620_813692_B2C671E9 
X-CRM114-Status: GOOD (  27.59  )
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

On 20/08/2026 16:00, Steven Price wrote:
> The VPE L1 table is allocated from the CPU-starting hotplug state,
> where interrupts are disabled. Although the page allocation uses
> GFP_ATOMIC, its_alloc_pages() subsequently calls
> set_memory_decrypted(), which can sleep while splitting the arm64
> linear map.
> 
> Move the allocation to the existing CPU-online callback, which runs in
> sleepable context, and use GFP_KERNEL for both allocations performed
> there. Register the callback even without EFI, since it is now also
> responsible for VPE table allocation.

Ok, Sashiko pointed out this is bunk:

> Does moving this allocation to the CPUHP_AP_ONLINE_DYN callback expose
> uninitialized GICv4.1 redistributor state to concurrent VPE mappings?
> 
> The CPUHP_AP_ONLINE_DYN state runs for its_cpu_memreserve_lpi() in the hotplug
> thread asynchronously after the CPU has already been marked online in
> cpu_online_mask.
> 
> Could a concurrent process changing IRQ affinities (like irqbalance) observe
> the CPU in cpu_online_mask and route a virtual interrupt to it via
> its_vpe_set_affinity() before the hotplug thread has executed this table
> allocation?
> 
> If a VMAPP command executes before allocate_vpe_l1_table() programs the
> GICR_VPROPBASER, it appears the hardware could use stale or uninitialized
> physical addresses, leading to unpredictable behavior or dropped interrupts.

Please ignore this patch. I thought this was a bit too simple to fix :(
I guess some sort of preallocation might be the solution.

Thanks,
Steve

> Fixes: b08e2f42e86b ("irqchip/gic-v3-its: Share ITS tables with a non-trusted hypervisor")
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
>  drivers/irqchip/irq-gic-v3-its.c | 30 +++++++++++++++---------------
>  1 file changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
> index a055837832bc..71515dbff9ec 100644
> --- a/drivers/irqchip/irq-gic-v3-its.c
> +++ b/drivers/irqchip/irq-gic-v3-its.c
> @@ -2932,7 +2932,7 @@ static int allocate_vpe_l1_table(void)
>  	if (val & GICR_VPROPBASER_4_1_VALID)
>  		goto out;
>  
> -	gic_data_rdist()->vpe_table_mask = kzalloc_obj(cpumask_t, GFP_ATOMIC);
> +	gic_data_rdist()->vpe_table_mask = kzalloc_obj(cpumask_t, GFP_KERNEL);
>  	if (!gic_data_rdist()->vpe_table_mask)
>  		return -ENOMEM;
>  
> @@ -2999,7 +2999,7 @@ static int allocate_vpe_l1_table(void)
>  
>  	pr_debug("np = %d, npg = %lld, psz = %d, epp = %d, esz = %d\n",
>  		 np, npg, psz, epp, esz);
> -	page = its_alloc_pages(GFP_ATOMIC | __GFP_ZERO, get_order(np * PAGE_SIZE));
> +	page = its_alloc_pages(GFP_KERNEL | __GFP_ZERO, get_order(np * PAGE_SIZE));
>  	if (!page)
>  		return -ENOMEM;
>  
> @@ -3268,16 +3268,6 @@ static void its_cpu_init_lpis(void)
>  		val = its_clear_vpend_valid(vlpi_base, 0, 0);
>  	}
>  
> -	if (allocate_vpe_l1_table()) {
> -		/*
> -		 * If the allocation has failed, we're in massive trouble.
> -		 * Disable direct injection, and pray that no VM was
> -		 * already running...
> -		 */
> -		gic_rdists->has_rvpeid = false;
> -		gic_rdists->has_vlpis = false;
> -	}
> -
>  	/* Make sure the GIC has seen the above */
>  	dsb(sy);
>  	gic_data_rdist()->flags |= RD_LOCAL_LPI_ENABLED;
> @@ -5452,6 +5442,19 @@ static int its_cpu_memreserve_lpi(unsigned int cpu)
>  	if (gic_data_rdist()->flags & RD_LOCAL_MEMRESERVE_DONE)
>  		return 0;
>  
> +	if (allocate_vpe_l1_table()) {
> +		/*
> +		 * If the allocation has failed, we're in massive trouble.
> +		 * Disable direct injection, and pray that no VM was
> +		 * already running...
> +		 */
> +		gic_rdists->has_rvpeid = false;
> +		gic_rdists->has_vlpis = false;
> +	}
> +
> +	if (!efi_enabled(EFI_CONFIG_TABLES))
> +		goto out;
> +
>  	pend_page = gic_data_rdist()->pend_page;
>  	if (WARN_ON(!pend_page)) {
>  		ret = -ENOMEM;
> @@ -5793,9 +5796,6 @@ int __init its_lpi_memreserve_init(void)
>  {
>  	int state;
>  
> -	if (!efi_enabled(EFI_CONFIG_TABLES))
> -		return 0;
> -
>  	if (list_empty(&its_nodes))
>  		return 0;
>  


