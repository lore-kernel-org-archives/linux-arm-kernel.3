Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DB75C982D6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 16:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LVmGYlFs0uJZy11DqwxXc7AaOZYaiiXCxuJXlBvXYwk=; b=FCBU+CZlQ5hDBvZiNlpVaWT9yD
	cNfR16jw8K1EisE7zSUlsPgGCobIfqNi4wWDVldpeLoP2wK/pJs6gvOmX9ixOMbiiq4Hz/8AELM8q
	rRgPLb/4RntbELY7Tq4R30/S7XoL2VZJ7vxcBdp7NTSjRKrFxzcuok/tIafxPj7PjFH8kz3qKYpAJ
	BhBjB796DhyLn1pOX/XIhZjtcP/gAX2RfD/XbmgKCCvcmWrblkSJhHVz+k3TulSksji1SilKRFrft
	wxpnBsl2Iy/F+8ymJumFyGCEIOa7K8YpmnrFab++B+9LhFe9gyMCIZD8p27dimvyqH7n/0RR6t/ef
	+Tm9tdRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7EKl-0000000BkF1-3Hxa;
	Thu, 17 Sep 2026 15:47:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7EKj-0000000BkEY-0E94;
	Thu, 17 Sep 2026 15:47:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EA9981476;
	Thu, 17 Sep 2026 08:47:25 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 91A183F7B4;
	Thu, 17 Sep 2026 08:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789660049; bh=G4HWLVNXzhSCswJXl+GAJjZ5dE9EPV7jBwWTmIkK6T0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jujJeTkRY9cy1NiL8rY70s3FzxqxUPmYtddnwYMekhhHo/JoTCrFo6hMKOk9rLuOm
	 twsIKR3Ht2HCoURivfSghdsivEyGC4q6zt9yB8X/Lo5a+tO7z6Y8Zh38KNsuDkXoA+
	 03JZSCS3IMQ44FpHgVwMp+OhHuQl0PQKLatASQKE=
Date: Thu, 17 Sep 2026 16:47:20 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Jiri Pirko <jiri@resnulli.us>, Jason Gunthorpe <jgg@ziepe.ca>,
	Mostafa Saleh <smostafa@google.com>,
	Petr Tesarik <ptesarik@suse.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Russell King <linux@armlinux.org.uk>,
	Huacai Chen <chenhuacai@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	x86@kernel.org
Subject: Re: [PATCH v4 2/5] dma: swiotlb: Centralize minimal pool sizing
Message-ID: <aqwLiHQb71hU8cEy@arm.com>
References: <20260914070135.313337-1-aneesh.kumar@kernel.org>
 <20260914070135.313337-3-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914070135.313337-3-aneesh.kumar@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_084733_180701_713C1B05 
X-CRM114-Status: GOOD (  20.20  )
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

On Mon, Sep 14, 2026 at 12:31:31PM +0530, Aneesh Kumar K.V (Arm) wrote:
> NOTE: We lose the RISC-V SWIOTLB_ANY setting in this patch. It will be
> reinstated in a follow-up patch where we make SWIOTLB_ANY redundant.

[...]

> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index e0e4c103d603..734712230f35 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -165,31 +165,11 @@ static void print_vm_layout(void) { }
>  
>  void __init arch_mm_preinit(void)
>  {
> -	bool swiotlb = max_pfn > PFN_DOWN(dma32_phys_limit) &&
> -		       memblock_start_of_DRAM() < dma32_phys_limit;
>  	unsigned int swiotlb_flags = SWIOTLB_VERBOSE;
>  #ifdef CONFIG_FLATMEM
>  	BUG_ON(!mem_map);
>  #endif /* CONFIG_FLATMEM */
>  
> -	if (IS_ENABLED(CONFIG_DMA_BOUNCE_UNALIGNED_KMALLOC) && !swiotlb &&
> -	    dma_cache_alignment != 1) {
> -		/*
> -		 * No 32-bit DMA bouncing needed (either all DRAM is within
> -		 * the 32-bit limit, or it all starts above it), but
> -		 * kmalloc() buffers whose sizes are not cache-line-aligned
> -		 * still require bouncing for non-coherent DMA.  Use
> -		 * SWIOTLB_ANY so that the buffer can be allocated from high
> -		 * memory when DRAM starts above dma32_phys_limit.  Allocate
> -		 * ~1 MB per 1 GB of RAM.
> -		 */
> -		unsigned long size =
> -			DIV_ROUND_UP(memblock_phys_mem_size(), 1024);
> -		swiotlb_adjust_size(min(swiotlb_size_or_default(), size));
> -		swiotlb = true;
> -		swiotlb_flags |= SWIOTLB_ANY;
> -	}

Does it break the bisectability for risc-v? IIUC this undoes commit
cfca5a48b03f until patch 5. Basically if there's no low memory and no
SWIOTLB_ANY passed, memblock_alloc_low() will fail.

I think we could preserve SWIOTLB_ANY until patch 5. Or it might be
simpler to move patches 2 and 3 at the end (I haven't tried).

> diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
> index aa19e81ae544..90e0bfd0715c 100644
> --- a/kernel/dma/swiotlb.c
> +++ b/kernel/dma/swiotlb.c
> @@ -304,6 +304,11 @@ unsigned long swiotlb_size_or_default(void)
>  	return default_nslabs << IO_TLB_SHIFT;
>  }
>  
> +static bool __init swiotlb_default_size_changed(void)
> +{
> +	return default_nslabs != IO_TLB_DEFAULT_SIZE >> IO_TLB_SHIFT;
> +}

I mentioned before in passing
(https://lore.kernel.org/all/ann6noRzoPLL9kDY@arm.com/), if one sets
swiotlb= to the default size, it will go unnoticed. I know it's an
existing issue but we might as well fix it now with a bool that tells us
the swiotlb size was forced/changed.

-- 
Catalin

