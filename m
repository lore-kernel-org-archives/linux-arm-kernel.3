Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67E7AC982E6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 15:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/G4SJ10TLwoXOF2o6hT3EIcBx3zt7MidRUkw+4U/uKI=; b=C1XSeHYdmCIWgPV2wtmgODffTf
	bCuLyzcbBykc7JaEhIcgtolkhSb4/v9DAHUzRs/O3gvi5W8+LJEmf1203PdoetiDfoTLIyzi8G943
	AssfRzn0hGYezHr1n0tv9bmLLKOl/ujSMS7v2vsghOitmbM203zMXRAs+TLMFZmtbgcx4RFYUIVfm
	C+tlQuJUIc9uJpnAPpnwPop3LwXwttEHR28DO4php5Z5ImzkKWurroCAZ/7paqqnndthJic+63keo
	2sOVBUfgxb4YlBWOENOy8mbY1JrfGW6I4pvJxkgepyiGGYNAot9lC4i2CbzapnuSqMdelhitmkU8g
	wJK6uP0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8fto-00000002bKS-48Zq;
	Mon, 21 Sep 2026 15:25:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8fti-00000002bIO-3lSa;
	Mon, 21 Sep 2026 15:25:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 467AE176C;
	Mon, 21 Sep 2026 08:25:31 -0700 (PDT)
Received: from [10.2.212.23] (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4049D3F9A2;
	Mon, 21 Sep 2026 08:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790004334; bh=zzx3mjbudK64AmYFt4zDvBW4IWB8i50rKocOK6Kc+dM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bJ6BTSYHKivo2/eRF9c4tWP/TAAVxpqB5Gki+6hqB70gMH9c6T0DN/7LvVp33NcYt
	 fV1Z2JO0j2YRGDrhpnqtAy2GN69cKLeg4YLIjHpGCN+UjR/tG+22iBWPqhPA/ijEBI
	 8cO8DvQWcF+Nt3XHK3carG/MXQkDFh2hAqfz/P4w=
Message-ID: <4ef23d65-02d2-4187-904b-9d1665d8cff5@arm.com>
Date: Mon, 21 Sep 2026 16:25:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/6] dma: swiotlb: Centralize default pool policy
 selection
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Will Deacon
 <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Steven Price <steven.price@arm.com>,
 Suzuki K Poulose <Suzuki.Poulose@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Jiri Pirko <jiri@resnulli.us>,
 Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>,
 Petr Tesarik <ptesarik@suse.com>, Alexey Kardashevskiy <aik@amd.com>,
 Dan Williams <dan.j.williams@intel.com>, Xu Yilun
 <yilun.xu@linux.intel.com>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Russell King <linux@armlinux.org.uk>,
 Huacai Chen <chenhuacai@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, x86@kernel.org
References: <20260921063628.362078-1-aneesh.kumar@kernel.org>
 <20260921063628.362078-2-aneesh.kumar@kernel.org>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20260921063628.362078-2-aneesh.kumar@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_082539_043753_70ACBF97 
X-CRM114-Status: GOOD (  15.60  )
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

On 21/09/2026 7:36 am, Aneesh Kumar K.V (Arm) wrote:
[...]
> diff --git a/arch/powerpc/kernel/dma-swiotlb.c b/arch/powerpc/kernel/dma-swiotlb.c
> index ba256c37bcc0..97fffa46f05a 100644
> --- a/arch/powerpc/kernel/dma-swiotlb.c
> +++ b/arch/powerpc/kernel/dma-swiotlb.c
> @@ -14,8 +14,10 @@ unsigned int ppc_swiotlb_flags;
>   
>   void __init swiotlb_detect_4g(void)
>   {
> -	if ((memblock_end_of_DRAM() - 1) > 0xffffffff)
> +	if ((memblock_end_of_DRAM() - 1) > 0xffffffff) {
>   		ppc_swiotlb_enable = 1;

Nit: Perhaps it's beyond the functional scope of this patch, but I do 
wonder if these <arch>_swiotlb_enable conditions become redundant and 
could just be replaced with "if (<arch>_swiotlb_flags != 0)" too.

> +		ppc_swiotlb_flags |= SWIOTLB_INIT_ADDRESSING_LIMIT;
> +	}
>   }
>   
>   static int __init check_swiotlb_enabled(void)
[...]
> diff --git a/arch/x86/kernel/pci-dma.c b/arch/x86/kernel/pci-dma.c
> index 75cf8f6ae8cd..0cff255827ba 100644
> --- a/arch/x86/kernel/pci-dma.c
> +++ b/arch/x86/kernel/pci-dma.c
> @@ -44,8 +44,10 @@ static unsigned int x86_swiotlb_flags;
>   static void __init pci_swiotlb_detect(void)
>   {
>   	/* don't initialize swiotlb if iommu=off (no_iommu=1) */
> -	if (!no_iommu && max_possible_pfn > MAX_DMA32_PFN)
> +	if (!no_iommu && max_possible_pfn > MAX_DMA32_PFN) {
>   		x86_swiotlb_enable = true;
> +		x86_swiotlb_flags |= SWIOTLB_INIT_ADDRESSING_LIMIT;
> +	}
>   
>   	/*
>   	 * Set swiotlb to 1 so that bounce buffers are allocated and used for
> @@ -81,8 +83,10 @@ static void __init pci_xen_swiotlb_init(void)
>   	if (!xen_swiotlb_enabled())
>   		return;
>   	x86_swiotlb_enable = true;
> -	x86_swiotlb_flags |= SWIOTLB_ANY;
> -	swiotlb_init_remap(true, x86_swiotlb_flags, xen_swiotlb_fixup);
> +	/* Xen can use a SWIOTLB pool anywhere in directly mapped memory. */
> +	x86_swiotlb_flags &= ~SWIOTLB_INIT_ADDRESSING_LIMIT;
> +	x86_swiotlb_flags |= SWIOTLB_INIT_REMAP | SWIOTLB_ANY;

Similarly, I see how having a SWIOTLB_INIT_REMAP flag keeps 
swiotlb_select_pool_policy() neat, but couldn't we technically already 
infer that from the fact that a non-NULL remap function was passed?

Nits aside, the overall change seems reasonable to me;

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

