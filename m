Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF830C982D2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 07:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8A8/O+7kImUGwyK+g6ktN1c/AodTX2n+ZCwskgpCIms=; b=Q3l/uu+ZFYeAVRJNfXrQQsoX7b
	e3r5gRNQ4y1K4w3wcgCSImHXZx9dKI/tJXNHvrWYYpb7ijdxThdeVBi2MqSSyuY8p9MdvfMTZDC6i
	Ga+pkSrLTagL542SvCTx5Z+ayza2Z7zdyQ+q+fDDcuq/nHDTDEhgeezcxqeIM/8CWZLY/3OIhfG3M
	BWwHDVE254nuz8MWC5VvNAOj9eSkxFIAfn+XCiz/tgTMr+JtdpYqU0FJcXmloQeB/lCUcLBYD2uNh
	9EDOMQP+faR0px/ljUS2t/MSJxYLD8+kfOYg+80ThRZ70gQAORL3+Mqx+RTwPqiOnS1TNgoq8FQSr
	cc5N+xFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7SfN-0000000De9H-42DT;
	Fri, 18 Sep 2026 07:05:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7SfM-0000000De8o-3fuA;
	Fri, 18 Sep 2026 07:05:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5E75A434A2;
	Fri, 18 Sep 2026 07:05:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F1671F000FF;
	Fri, 18 Sep 2026 07:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789715148;
	bh=8A8/O+7kImUGwyK+g6ktN1c/AodTX2n+ZCwskgpCIms=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=OhbOg+jMAJehO/c3Cb2LnBG1EHaNGxRwW7RCZKKxd0yM2OJJ2I84lIBozdzVSMMs3
	 +WM4nMhZGCgtmfbKF+3FYXPCXP1Fn4FFDij6NV9v6vIfhZZcrzdoad/ioZKk/OLmU7
	 U4BRT2idZTVWZWW7yJkZHO27YBS7pMiTfQDvZSfV9J/5lxNpLMBaC5tQN7SfTOadJv
	 2ad3QLFHUCi8MRnPkgfHrIBMEzM8OuOnv3XlsTimZnNOMHmO/2eVA2IOEf37ZK8x57
	 I3K6leIS7bYtSSIm8iuKjzuG67oG4h4B/uj+r42SlmJq9Rrpr4mu5D0Ji8r74G52jV
	 CtOj2OqWqqw7Q==
X-Mailer: emacs 31.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Jason Gunthorpe <jgg@ziepe.ca>,
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
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	x86@kernel.org
Subject: Re: [PATCH v4 2/5] dma: swiotlb: Centralize minimal pool sizing
In-Reply-To: <aqwLiHQb71hU8cEy@arm.com>
References: <20260914070135.313337-1-aneesh.kumar@kernel.org>
 <20260914070135.313337-3-aneesh.kumar@kernel.org>
 <aqwLiHQb71hU8cEy@arm.com>
Date: Fri, 18 Sep 2026 12:35:33 +0530
Message-ID: <yq5a4ifn11ky.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
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

Catalin Marinas <catalin.marinas@arm.com> writes:

> On Mon, Sep 14, 2026 at 12:31:31PM +0530, Aneesh Kumar K.V (Arm) wrote:
>> NOTE: We lose the RISC-V SWIOTLB_ANY setting in this patch. It will be
>> reinstated in a follow-up patch where we make SWIOTLB_ANY redundant.
>
> [...]
>
>> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
>> index e0e4c103d603..734712230f35 100644
>> --- a/arch/riscv/mm/init.c
>> +++ b/arch/riscv/mm/init.c
>> @@ -165,31 +165,11 @@ static void print_vm_layout(void) { }
>>  
>>  void __init arch_mm_preinit(void)
>>  {
>> -	bool swiotlb = max_pfn > PFN_DOWN(dma32_phys_limit) &&
>> -		       memblock_start_of_DRAM() < dma32_phys_limit;
>>  	unsigned int swiotlb_flags = SWIOTLB_VERBOSE;
>>  #ifdef CONFIG_FLATMEM
>>  	BUG_ON(!mem_map);
>>  #endif /* CONFIG_FLATMEM */
>>  
>> -	if (IS_ENABLED(CONFIG_DMA_BOUNCE_UNALIGNED_KMALLOC) && !swiotlb &&
>> -	    dma_cache_alignment != 1) {
>> -		/*
>> -		 * No 32-bit DMA bouncing needed (either all DRAM is within
>> -		 * the 32-bit limit, or it all starts above it), but
>> -		 * kmalloc() buffers whose sizes are not cache-line-aligned
>> -		 * still require bouncing for non-coherent DMA.  Use
>> -		 * SWIOTLB_ANY so that the buffer can be allocated from high
>> -		 * memory when DRAM starts above dma32_phys_limit.  Allocate
>> -		 * ~1 MB per 1 GB of RAM.
>> -		 */
>> -		unsigned long size =
>> -			DIV_ROUND_UP(memblock_phys_mem_size(), 1024);
>> -		swiotlb_adjust_size(min(swiotlb_size_or_default(), size));
>> -		swiotlb = true;
>> -		swiotlb_flags |= SWIOTLB_ANY;
>> -	}
>
> Does it break the bisectability for risc-v? IIUC this undoes commit
> cfca5a48b03f until patch 5. Basically if there's no low memory and no
> SWIOTLB_ANY passed, memblock_alloc_low() will fail.
>

I mentioned this in the commit message. I can add the change below and
remove it in patch 5. 

modified   arch/riscv/mm/init.c
@@ -165,11 +165,27 @@ static void print_vm_layout(void) { }
 
 void __init arch_mm_preinit(void)
 {
+	bool swiotlb = max_pfn > PFN_DOWN(dma32_phys_limit) &&
+		       memblock_start_of_DRAM() < dma32_phys_limit;
 	unsigned int swiotlb_flags = SWIOTLB_VERBOSE;
 #ifdef CONFIG_FLATMEM
 	BUG_ON(!mem_map);
 #endif /* CONFIG_FLATMEM */
 
+	if (IS_ENABLED(CONFIG_DMA_BOUNCE_UNALIGNED_KMALLOC) && !swiotlb &&
+	    dma_cache_alignment != 1) {
+		/*
+		 * No 32-bit DMA bouncing needed (either all DRAM is within
+		 * the 32-bit limit, or it all starts above it), but
+		 * kmalloc() buffers whose sizes are not cache-line-aligned
+		 * still require bouncing for non-coherent DMA.  Use
+		 * SWIOTLB_ANY so that the buffer can be allocated from high
+		 * memory when DRAM starts above dma32_phys_limit.  Allocate
+		 * ~1 MB per 1 GB of RAM.
+		 */
+		swiotlb_flags |= SWIOTLB_ANY;
+	}
+
 	if ((max_pfn > PFN_DOWN(dma32_phys_limit)) &&
 	     (memblock_start_of_DRAM() < dma32_phys_limit))
 		swiotlb_flags |= SWIOTLB_INIT_ADDRESSING_LIMIT;


>
> I think we could preserve SWIOTLB_ANY until patch 5. Or it might be
> simpler to move patches 2 and 3 at the end (I haven't tried).
>
>> diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
>> index aa19e81ae544..90e0bfd0715c 100644
>> --- a/kernel/dma/swiotlb.c
>> +++ b/kernel/dma/swiotlb.c
>> @@ -304,6 +304,11 @@ unsigned long swiotlb_size_or_default(void)
>>  	return default_nslabs << IO_TLB_SHIFT;
>>  }
>>  
>> +static bool __init swiotlb_default_size_changed(void)
>> +{
>> +	return default_nslabs != IO_TLB_DEFAULT_SIZE >> IO_TLB_SHIFT;
>> +}
>
> I mentioned before in passing
> (https://lore.kernel.org/all/ann6noRzoPLL9kDY@arm.com/), if one sets
> swiotlb= to the default size, it will go unnoticed. I know it's an
> existing issue but we might as well fix it now with a bool that tells us
> the swiotlb size was forced/changed.
>

I will do this as an addtional patch

modified    kernel/dma/swiotlb.c
@@ -108,6 +108,7 @@
 
 static unsigned long default_nslabs = IO_TLB_DEFAULT_SIZE >> IO_TLB_SHIFT;
 static unsigned long default_nareas;
+static bool swiotlb_size_set __initdata;
 
 /**
  * struct io_tlb_area - IO TLB memory area descriptor
@@ -270,6 +271,7 @@
 		/* avoid tail segment of size < IO_TLB_SEGSIZE */
 		default_nslabs =
 			ALIGN(simple_strtoul(str, &str, 0), IO_TLB_SEGSIZE);
+		swiotlb_size_set = true;
 	}
 	if (*str == ',')
 		++str;
@@ -307,7 +309,7 @@
 
 static bool __init swiotlb_default_size_changed(void)
 {
-	return default_nslabs != IO_TLB_DEFAULT_SIZE >> IO_TLB_SHIFT;
+	return swiotlb_size_set;
 }
 
 void __init swiotlb_adjust_size(unsigned long size)



