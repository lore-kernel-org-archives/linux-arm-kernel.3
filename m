Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B520C43602
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 03:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FJhajr5kdTmXSpbRHiZGZT3ioUVr6sHAFFO+7D7H7Iw=; b=iOvF7KGn0MRaYFG/LHd3UyK3Y1
	Stow9qkYvSLzM0Xr/OetmnnF8rbxIL48Ig76MqgqM9C/jCWG4ZNujRWPrdKzbtEMx2j/j1fHBQHRj
	NIyJh5JhWUl30hDV3xy3RsjArwz7yLyJVPK3z0CVBMs0G1b1hqH/r/Wm5abrf+tvRDlahFHsFuAxh
	wlZr8eqAn8MZOv/fKEJbBwM2qC90kg6JngIzmvtUTxv/cfB1hZiRT+njjLgyPNbDbmZo6q+NWyOXW
	MputLq9MSCIfVNnYlxyI89bIOzpmsjrjloQxusRfGuoKdO7adHctS9Alkjmnq9PivZFtcthEMBA10
	2xBOPbIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1welKD-00000000Yfg-2btR;
	Wed, 01 Jul 2026 03:09:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1welKC-00000000Yfa-1O8k
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 03:09:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B167D417B9;
	Wed,  1 Jul 2026 03:09:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 598A71F000E9;
	Wed,  1 Jul 2026 03:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782875359;
	bh=FJhajr5kdTmXSpbRHiZGZT3ioUVr6sHAFFO+7D7H7Iw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=Apa1e2TNAD1OXcazOEFCxJl7l5BrVVMLldpRf0byGAFIxmHZcJ9j3O57EBDpqqCGC
	 npNWTMDbd5MynUk+n9TOEgWrKZLUeu0x85rBnH3oE01O8UmQAVgtiT8Oxe0DwbXarq
	 Rhj55UyvnpmtD02vXdUXMyNS/Gwhk3JQUnTOPAcDA46ZE++fUcZtSTuxWdL5uTuivC
	 kvC2jhtCrGypZNaCdpd0nztN0oQqPcwT5h4mHQP6EvhXUQv1O6OZax7pV/JnK+5h4f
	 Xtfv09ZeJ7OVs0ct4YkBueDVTpnVdg+nTb12bqzwLvFUbpPUCF35eDdmAKCrVeiZyW
	 sl8y0F2F3AO0Q==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Alexey Kardashevskiy <aik@amd.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Mostafa Saleh <smostafa@google.com>,
	Petr Tesarik <ptesarik@suse.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, x86@kernel.org
Subject: Re: [PATCH v6 00/20] dma-mapping: Use DMA_ATTR_CC_SHARED through
 direct, pool and swiotlb paths
In-Reply-To: <20260630174216.GK7525@ziepe.ca>
References: <aigYbK12D8uKQvJF@arm.com> <20260609144746.GL2764304@ziepe.ca>
 <2ecfa1a8-6202-4319-9692-a6ffeb5a3dbf@amd.com>
 <yq5aqzm4dz25.fsf@kernel.org> <20260618153705.GH231643@ziepe.ca>
 <yq5ao6h6enhm.fsf@kernel.org> <20260619122148.GL231643@ziepe.ca>
 <yq5aldcaejos.fsf@kernel.org> <20260619140616.GB1068655@ziepe.ca>
 <yq5ao6gtoncp.fsf@kernel.org> <20260630174216.GK7525@ziepe.ca>
Date: Wed, 01 Jul 2026 08:39:06 +0530
Message-ID: <yq5abjcro17x.fsf@kernel.org>
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

Jason Gunthorpe <jgg@ziepe.ca> writes:

> On Mon, Jun 29, 2026 at 12:16:30PM +0530, Aneesh Kumar K.V wrote:
>> >> Thinking about this more, I guess we should mark the swiotlb as
>> >> cc_shared only with  CC_ATTR_GUEST_MEM_ENCRYPT instead of
>> >> CC_ATTR_MEM_ENCRYPT as we have below.
>> >
>> > The name cc_shared should be used for GUEST scenarios only.
>> >
>> > I guess there is some merit in keeping swiotlb using "decrypted" to
>> > mean it usinig pgprot_decrypted and set_memory_decyped() which AMD
>> > gives meaning to on both host and guest.
>> 
>> Are you suggesting to change the struct io_tlb_mem::cc_shared back to
>> struct io_tlb_mem::unencrypted?. 
>
> Yes
>
>> > IDK what AMD should do on the host by default. I guess it should setup
>> > a swiotlb pool of low dma addrs "unencrypted", but not "cc_shared"?
>> >
>> 
>> If by low DMA address you mean using an address with the C-bit
>> cleared. 
>
> Yes
>
>> The current code already does this and uses the swiotlb pool correctly
>> on SME.
>
> Well, through the force_dma_unencrypted() hack...
>
>> The challenge arises when we want to force SWIOTLB
>> bouncing even for devices that can handle encrypted DMA addresses (more
>> on that below). For such a config force_dma_uencrypted(dev) will return
>> false and swiotlb will be marked cc_shared/decrypted = true; This trip
>> the new check we added.
>
> Yes, because cc_shared (guest) and unencrypted (host) are very
> different things and we've mixed them:
>
>> 	if (unlikely(mem->cc_shared != force_dma_unencrypted(dev)))
>
> I'm aruging force_dma_unencrypted should mean cc_shared and be
> guest_only, but the SME hack breaks this.
>
>> We can also do
>> 
>> 	if (cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT)) {
>> 		/* swiotlb pool is incorrect for this device */
>> 		if (unlikely(mem->cc_shared != force_dma_unencrypted(dev)))
>> 			return (phys_addr_t)DMA_MAPPING_ERROR;
>> 
>> 		/* Force attrs to match the kind of memory in the pool */
>> 		if (mem->cc_shared)
>> 			*attrs |= DMA_ATTR_CC_SHARED;
>> 		else
>> 			*attrs &= ~DMA_ATTR_CC_SHARED;
>> 	} else {
>> 		/*
>> 		 * Host memory encryption where device requires an
>> 		 * unencrypted dma_addr_t due to dma mask limit
>>     		 */
>> 		if (force_dma_unencrypted(dev))
>> 			*attrs |= DMA_ATTR_CC_SHARED;
>> 		else
>> 			*attrs &= ~DMA_ATTR_CC_SHARED;
>> 	}
>
> If we do this I would like to split the force_dma_.. functions into
> guest and host, ie force_dma_cc_shared() and force_host_decrypted()
>
> To make it clear there are two very different things here.
>

I have now folded the below change into

modified   kernel/dma/swiotlb.c
@@ -1514,9 +1514,23 @@ phys_addr_t swiotlb_tbl_map_single(struct device *dev, phys_addr_t orig_addr,
 	if (cc_platform_has(CC_ATTR_MEM_ENCRYPT))
 		pr_warn_once("Memory encryption is active and system is using DMA bounce buffers\n");
 
-	/* swiotlb pool is incorrect for this device */
-	if (unlikely(mem->cc_shared != force_dma_unencrypted(dev)))
-		return (phys_addr_t)DMA_MAPPING_ERROR;
+	if (cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT)) {
+
+		/* swiotlb pool is incorrect for this device */
+		if (unlikely(mem->cc_shared != force_dma_unencrypted(dev)))
+			return (phys_addr_t)DMA_MAPPING_ERROR;
+
+	} else if (cc_platform_has(CC_ATTR_HOST_MEM_ENCRYPT)) {
+		/*
+		 * On hosts with memory encryption, SWIOTLB-backed memory is
+		 * unencrypted. DMA addresses returned for bounce buffers must
+		 * therefore be marked unencrypted, even for devices that can
+		 * address encrypted memory. This also preserves swiotlb=force
+		 * behavior for those devices.
+		 */
+		if (unlikely(!mem->cc_shared))
+			return (phys_addr_t)DMA_MAPPING_ERROR;
+	}
 
[PATCH] dma: swiotlb: track pool encryption state and honor DMA_ATTR_CC_SHARED

This is the only code path where we need to special-case host memory
encryption. For this reason, I have avoided renaming
io_tlb_mem::cc_shared to io_tlb_mem::unencrypted. I can send a v7 with
the above and we can review the changes based on that?

-aneesh

