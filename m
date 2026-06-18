Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD45FCD98ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 08:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tjfp3FF0f+SxzpFBuG9E9B1amsn/loCXBkKBhFITWIo=; b=i+RL6sBb/wlOpFOVv5lpBXM3sI
	VyvZ2ddBkR8dIYzdnShiX6nX1bZkly2se0Shj7zWp7LKseFEgP9t1mfgEc0d6CDh/+649WTwN0Fny
	+n72oBoW3Puju9/ZT+FgLPGRmoEAr5QCCW1BZC0eIczpOdl2px77DmeYw2Y1EMMVyAta7WaJ93NtH
	EU72stkDBna6dyActizAPnWUGe3PsuUo68pDnB9KQzlMhTiw/xa5AQF6O6tbqE8HTpcoE9AM1aSUk
	SKaS9xb23o2TrE1DTjKqWZdCvSEURLq+DGozzkIllpghFu12Ww+dzpcm1mDJwum9gaeqBnyqgcWlK
	9t7cPbUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa8Fj-00000000rDA-25R9;
	Thu, 18 Jun 2026 08:37:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa8Fh-00000000rCx-39QS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 08:37:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C08CE436FD;
	Thu, 18 Jun 2026 08:37:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 334ED1F000E9;
	Thu, 18 Jun 2026 08:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781771851;
	bh=Tjfp3FF0f+SxzpFBuG9E9B1amsn/loCXBkKBhFITWIo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=bJYmurEUTf4p9ddXp1VSCskBHjygy+xD/oNjB9s2Ep/Uu73ZeAFn3grah/ZH/26bC
	 Z2IKNbkJrX3SQyniq2V3c43nApViK8ptRc8Gz9vZ5aBx3WYWws6jmsSQ1n8wC/ZhsC
	 aPXbP4vBO9+s7L7Gu2B1QTaU30Q3lwF3YsxuWM4vVa7T2kphUxDrfVTBh2RPbtKviM
	 f3h5f4VrWfNGB2xgQRFYm9r1q8fBv53E49ns83ljI6VaL3Opsq3DE6buX9d8xYbXtu
	 r9HlAXaeEfYUQ5HKSssJFRAz7y8WVKnEyAfSl5fBP2P87RedjDBY2R+S227cOm339+
	 HGR07rvOMXPTg==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Alexey Kardashevskiy <aik@amd.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Catalin Marinas <catalin.marinas@arm.com>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
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
In-Reply-To: <2ecfa1a8-6202-4319-9692-a6ffeb5a3dbf@amd.com>
References: <20260604083959.1265923-1-aneesh.kumar@kernel.org>
 <aigYbK12D8uKQvJF@arm.com> <20260609144746.GL2764304@ziepe.ca>
 <2ecfa1a8-6202-4319-9692-a6ffeb5a3dbf@amd.com>
Date: Thu, 18 Jun 2026 09:37:22 +0100
Message-ID: <yq5aqzm4dz25.fsf@kernel.org>
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

Alexey Kardashevskiy <aik@amd.com> writes:

> On 10/6/26 00:47, Jason Gunthorpe wrote:
>> On Tue, Jun 09, 2026 at 02:43:08PM +0100, Catalin Marinas wrote:
>>> On Thu, Jun 04, 2026 at 02:09:39PM +0530, Aneesh Kumar K.V (Arm) wrote:
>>>> This series propagates DMA_ATTR_CC_SHARED through the dma-direct,
>>>> dma-pool, and swiotlb paths so that encrypted and decrypted DMA buffers
>>>> are handled consistently.
>>>>
>>>> Today, the direct DMA path mostly relies on force_dma_unencrypted() for
>>>> shared/decrypted buffer handling. This series consolidates the
>>>> force_dma_unencrypted() checks in the top-level functions and ensures
>>>> that the remaining DMA interfaces use DMA attributes to make the correct
>>>> decisions.
>>>
>>> Please check Sashiko's reports, it has some good points:
>>>
>>> https://sashiko.dev/#/patchset/20260604083959.1265923-1-aneesh.kumar@kernel.org
>>>
>>> I think the main one is the swiotlb_tbl_map_single() changes which break
>>> AMD SME host support. There cc_platform_has(CC_ATTR_MEM_ENCRYPT) is true
>>> but force_dma_unencrypted() is false. Normally you'd not end up on this
>>> path but you can have swiotlb=force.
>> 
>> IMHO that's an AMD issue, not with the design of this series..
>> 
>> The series is right, a device that is !force_dma_decrypted() must be
>> considerd to be a trusted device and we must never place any DMA
>> mappings for a trusted device into shared memory.
>
>
> swiotlb=force forces swiotlb, not decryption.
>
>> That AMD has done somethine insane:
>> 
>> bool force_dma_unencrypted(struct device *dev)
>> {
>> 	/*
>> 	 * For SEV, all DMA must be to unencrypted addresses.
>> 	 */
>> 	if (cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT))
>> 		return true;
>> 
>> 	/*
>> 	 * For SME, all DMA must be to unencrypted addresses if the
>> 	 * device does not support DMA to addresses that include the
>> 	 * encryption mask.
>> 	 */
>> 	if (cc_platform_has(CC_ATTR_HOST_MEM_ENCRYPT)) {
>> 		u64 dma_enc_mask = DMA_BIT_MASK(__ffs64(sme_me_mask));
>> 		u64 dma_dev_mask = min_not_zero(dev->coherent_dma_mask,
>> 						dev->bus_dma_limit);
>> 
>> 		if (dma_dev_mask <= dma_enc_mask)
>> 			return true;
>> 	}
>
>
> So when I try "mem_encrypt=on iommu=pt swiotlb=force" with this patchset, it fails to boot. But it boots with a hack like this:
>
> ===
> @@ -39,7 +41,7 @@ bool force_dma_unencrypted(struct device *dev)
>                          return true;
>          }
>   
> -       return false;
> +       return swiotlb_force_bounce;
>   }
> ===
>
> Or we say "mem_encrypt=on iommu=pt swiotlb=force" combo is just weird and we won't be supporting which bit in this? Thanks,
>

Something like?

modified   arch/x86/mm/mem_encrypt.c
@@ -34,6 +34,13 @@ bool force_dma_unencrypted(struct device *dev)
 		u64 dma_enc_mask = DMA_BIT_MASK(__ffs64(sme_me_mask));
 		u64 dma_dev_mask = min_not_zero(dev->coherent_dma_mask,
 						dev->bus_dma_limit);
+		/*
+		 * With memory encryption enabled, SWIOTLB is marked decrypted.
+		 * If SWIOTLB bouncing is forced, treat the device as requiring
+		 * decrypted DMA.
+		 */
+		if (is_swiotlb_force_bounce(dev))
+			return true;
 
 		if (dma_dev_mask <= dma_enc_mask)
 			return true;



-aneesh

