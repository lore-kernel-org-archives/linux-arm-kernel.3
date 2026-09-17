Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B77D9C982D6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 14:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1TXHNfPeizA8o8U5zeR9HPM854xm6a245g4oK4MpUHk=; b=UA3x2w3obd8iSbyHLTjVIjVz+R
	Oht/tBA7Qv6vp3WM3PP50gUZ5vZ/zT6mP1g2GQx3/klJjF4GMBv4IiR72Lj7o999sZduHupzjZHF6
	BI4waBJhv/4JuE3q7BuHRo3q8FUmjFEFHp2n8C8RBy3fahgcnmuawtF+6jkv4no786tUQRXSKuCCM
	+OqPbL43d8KUEki1kdUJ9bvYG5y8j7mJ8WGtd28kWHrYLetuEqblQ/Bb5u1/2VoCVYDnpuV6tWSLT
	EuuFpMpj2OqZKbrc5Y4l2cUtd4Ik7xmRyRCYBfjK5wxx3QgoZLAXpFVByvbMvjeCTI5OT39zzExhx
	GNB/1/Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7DOy-0000000BaGv-19d0;
	Thu, 17 Sep 2026 14:47:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7DOv-0000000BaGX-3dfq;
	Thu, 17 Sep 2026 14:47:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 52F5B1476;
	Thu, 17 Sep 2026 07:47:42 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 011E03F86F;
	Thu, 17 Sep 2026 07:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789656465; bh=M6L3gDgo7kZ+fxTWrN1ZIsrMlAv/aP6jh31bZohJ0Rs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FfOzLZ+3Qia0W7RivVKaHNN7ieAHkjlQ0vn4TRTzuF7z8OiKjJ/k086OfMvanwLe4
	 ELpOh1p5+42rsPtfbx27NAQlMXC2xMiCbIVs5xTJrXk64zRBISqHGguvSJA4aBz7vA
	 RLAIQplJPf8iM7ccnFiG8UpvaheI8Ih5+YH3OgPE=
Date: Thu, 17 Sep 2026 15:47:37 +0100
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
Subject: Re: [PATCH v4 1/5] dma: swiotlb: Centralize default pool policy
 selection
Message-ID: <aqv9icxsfN3PLErN@arm.com>
References: <20260914070135.313337-1-aneesh.kumar@kernel.org>
 <20260914070135.313337-2-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914070135.313337-2-aneesh.kumar@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_074750_083283_D0C9A078 
X-CRM114-Status: GOOD (  10.37  )
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

On Mon, Sep 14, 2026 at 12:31:30PM +0530, Aneesh Kumar K.V (Arm) wrote:
> diff --git a/arch/x86/include/asm/iommu.h b/arch/x86/include/asm/iommu.h
> index 3be2451e7bc8..22c8190fe34d 100644
> --- a/arch/x86/include/asm/iommu.h
> +++ b/arch/x86/include/asm/iommu.h
> @@ -14,8 +14,10 @@ extern bool amd_iommu_snp_en;
>  
>  #ifdef CONFIG_SWIOTLB
>  extern bool x86_swiotlb_enable;
> +extern unsigned int x86_swiotlb_flags;
>  #else
>  #define x86_swiotlb_enable false
> +#define x86_swiotlb_flags 0
>  #endif
>  
>  /* 10 seconds */
> diff --git a/arch/x86/kernel/amd_gart_64.c b/arch/x86/kernel/amd_gart_64.c
> index b5f1f031d45b..d0fbc0271e43 100644
> --- a/arch/x86/kernel/amd_gart_64.c
> +++ b/arch/x86/kernel/amd_gart_64.c
> @@ -814,6 +814,7 @@ int __init gart_iommu_init(void)
>  	dma_ops = &gart_dma_ops;
>  	x86_platform.iommu_shutdown = gart_iommu_shutdown;
>  	x86_swiotlb_enable = false;
> +	x86_swiotlb_flags = 0;

I don't think the flags are still read anywhere after this function.
gart_iommu_init() is called long after swiotlb_init(). So you can drop
this and make x86_swiotlb_flags static in pci-dma.c.

With this:

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

