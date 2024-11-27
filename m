Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F8D0D6ACF7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 17:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U3AfadLNOJOlI07wW+Dqnxc4+9gExV2K4OvFNVXCS1s=; b=Rqym1FLjTH6tdQRIaQS7liNhkz
	XGYHa9FeoYTJSIXZuq01tfeT47PNqBgrWUaxtJVAFJQlkI6fj64FGcJMZuvk+jq7ixSEazhfqsYRt
	1LMFRPICKmujIgjVGvY0Wk0BDO3rPxeU6lZ4aFnTPml/XhTCCCxTH1rhG2yxtHgCJ9zz7naqJc9b4
	XfflR74krCGJk83KjVp1p47xkmml0nqNN8lxV1ZseX8aeEbO+Ra4Kd2NRBORNXAJA4I1Dd/di+ii1
	yFi8UVUaq5umzvan/KS7Zea9v7+y39nyyWyYqKGVkNYalFw7B+3YY14cOU5ZWsgpk39Z1y3EEQvx1
	W4zTUEwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGMBY-0000000DmQ6-1HJT;
	Wed, 27 Nov 2024 17:50:44 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGMAZ-0000000DmLe-2HBN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 17:49:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 56540A43985;
	Wed, 27 Nov 2024 17:47:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41123C4CECC;
	Wed, 27 Nov 2024 17:49:40 +0000 (UTC)
Date: Wed, 27 Nov 2024 17:49:37 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Yang Shi <yang@os.amperecomputing.com>
Cc: Baruch Siach <baruch@tkos.co.il>, will@kernel.org, ptesarik@suse.com,
	hch@lst.de, jiangyutang@os.amperecomputing.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] arm64: mm: fix zone_dma_limit calculation
Message-ID: <Z0dbsRCsWT3hiVds@arm.com>
References: <20241125171650.77424-1-yang@os.amperecomputing.com>
 <87ttbu8q7s.fsf@tarshish>
 <98583682-a95e-440e-bd89-03828998b48e@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <98583682-a95e-440e-bd89-03828998b48e@os.amperecomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_094943_706257_E39B7B08 
X-CRM114-Status: GOOD (  35.21  )
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

+ Robin

On Tue, Nov 26, 2024 at 09:38:22AM -0800, Yang Shi wrote:
> On 11/25/24 10:27 PM, Baruch Siach wrote:
> > On Mon, Nov 25 2024, Yang Shi wrote:
> > > The commit ba0fb44aed47 ("dma-mapping: replace zone_dma_bits by
> > > zone_dma_limit") changed how zone_dma_limit was calculated.  Now it
> > > returns the memsize limit in IORT or device tree instead of U32_MAX if
> > > the memsize limit is greater than U32_MAX.
> > 
> > Can you give a concrete example of memory layout and dma-ranges that
> > demonstrates this issue?
> 
> Our 2 sockets system has physical memory starts at 0x0 on node 0 and
> 0x200000000000 on node 1. The memory size limit defined in IORT is 0x30 (48
> bits).
> 
> The DMA zone is:
> 
> pages free     887722
>         boost    0
>         min      229
>         low      1108
>         high     1987
>         promo    2866
>         spanned  983040
>         present  982034
>         managed  903238
>         cma      16384
>         protection: (0, 0, 124824, 0, 0)
>  start_pfn:           65536
> 
> When allocating DMA buffer, dma_direct_optimal_gfp_mask() is called to
> determine the proper zone constraints. If the phys_limit is less than
> zone_dma_limit, it will use GFP_DMA. But zone_dma_limit is 0xffffffffffff on
> v6.12 instead of 4G prior v6.12, it means all DMA buffer allocation will go
> to DMA zone even though the devices don't require it.
> 
> DMA zone is on node 0, so we saw excessive remote access on 2 sockets
> system.
[...]
> The physical addr range for DMA zone is correct, the problem is wrong
> zone_dma_limit. Before commit ba0fb44aed47 zone_dma_limit was 4G, after it
> it is the whole memory even though DMA zone just covers low 4G.

Thanks for the details. I agree that zone_dma_limit shouldn't be higher
than the ZONE_DMA upper boundary, otherwise it gets confusing for
functions like dma_direct_optimal_gfp_mask() and we may force
allocations to a specific range unnecessarily.

If IORT or DT indicate a large mask covering the whole RAM (i.e. no
restrictions), in an ideal world, we should normally extend ZONE_DMA to
the same. One problem is ZONE_DMA32 (and GFP_DMA32) and the fact that
ZONE_DMA sits below it. Until we hear otherwise, we assume a DMA offset
of 0 for such 32-bit devices and therefore define ZONE_DMA32 in the
lower 4GB if RAM starts below this limit (and an empty ZONE_DMA32 if RAM
starts above).

Another aspect to consider is that we don't always have DT or IORT
information or some devices need a smaller limit than what's advertised
in the firmware tables (typically 32-bit masks). This code went through
a couple of fixes already:

833bd284a454 ("arm64: mm: fix DMA zone when dma-ranges is missing")
122c234ef4e1 ("arm64: mm: keep low RAM dma zone")

Since our current assumption is to assume ZONE_DMA within 32-bit if RAM
below 4GB, I'm happy to make this conditional on CONFIG_ZONE_DMA32 also
being enabled. So, from your patch below:

> diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
> index d21f67d67cf5..ccdef53872a0 100644
> --- a/arch/arm64/mm/init.c
> +++ b/arch/arm64/mm/init.c
> @@ -117,15 +117,6 @@ static void __init arch_reserve_crashkernel(void)
>   static phys_addr_t __init max_zone_phys(phys_addr_t zone_limit)
>   {
> -	/**
> -	 * Information we get from firmware (e.g. DT dma-ranges) describe DMA
> -	 * bus constraints. Devices using DMA might have their own limitations.
> -	 * Some of them rely on DMA zone in low 32-bit memory. Keep low RAM
> -	 * DMA zone on platforms that have RAM there.
> -	 */
> -	if (memblock_start_of_DRAM() < U32_MAX)
> -		zone_limit = min(zone_limit, U32_MAX);
> -
>   	return min(zone_limit, memblock_end_of_DRAM() - 1) + 1;
>   }

This part is fine.

> @@ -141,6 +132,14 @@ static void __init zone_sizes_init(void)
>   	acpi_zone_dma_limit = acpi_iort_dma_get_max_cpu_address();
>   	dt_zone_dma_limit = of_dma_get_max_cpu_address(NULL);
>   	zone_dma_limit = min(dt_zone_dma_limit, acpi_zone_dma_limit);
> +	/*
> +	 * Information we get from firmware (e.g. DT dma-ranges) describe DMA
> +	 * bus constraints. Devices using DMA might have their own limitations.
> +	 * Some of them rely on DMA zone in low 32-bit memory. Keep low RAM
> +	 * DMA zone on platforms that have RAM there.
> +	 */
> +	if (memblock_start_of_DRAM() < U32_MAX)
> +		zone_dma_limit = min(zone_dma_limit, U32_MAX);
>   	arm64_dma_phys_limit = max_zone_phys(zone_dma_limit);
>   	max_zone_pfns[ZONE_DMA] = PFN_DOWN(arm64_dma_phys_limit);
>   #endif

But I'd move the zone_dma_limit update further down in the
CONFIG_ZONE_DMA32 block. I think we only need to limit it to
dma32_phys_limit and ignore the U32_MAX check. The former is already
capped to 32-bit. For the second hunk, something like below (untested):

diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
index d21f67d67cf5..ffaf5bd8d0a1 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -146,8 +146,10 @@ static void __init zone_sizes_init(void)
 #endif
 #ifdef CONFIG_ZONE_DMA32
 	max_zone_pfns[ZONE_DMA32] = PFN_DOWN(dma32_phys_limit);
-	if (!arm64_dma_phys_limit)
+	if (!arm64_dma_phys_limit || arm64_dma_phys_limit > dma32_phys_limit) {
 		arm64_dma_phys_limit = dma32_phys_limit;
+		zone_dma_limit = arm64_dma_phys_limit - 1;
+	}
 #endif
 	if (!arm64_dma_phys_limit)
 		arm64_dma_phys_limit = PHYS_MASK + 1;

With some comment on why we do this but most likely not the current
comment in max_zone_phys() (more like keep ZONE_DMA below ZONE_DMA32).

-- 
Catalin

