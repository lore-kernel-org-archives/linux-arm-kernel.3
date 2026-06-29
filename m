Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 263F1C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 09:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ans8cQyuz+4bONK8ZwcfQWnEefdUl8mlhioaHY5g7cg=; b=2MoE7DX/lVZuSg9E525WKQINLz
	+wOF5VGMH9B+y1/hCJPtkF1Bs8drkKVXpBQJpLF6IwT9E/SuY5SHTJlh3lQ42Sf/ccN1jq9YuTlto
	jdGPuStfKpFgvRU1ec4dz0lKRlzdTfT59lLx+iO9kEF+w+Hfje2Zydy1g+44GgHfq4kTWqU5QwrA9
	MMOrJH8O4L7n/LnujIXFEN8V3Ewzc/ZwBx9v6G6BqKfkV7XE+NC3waeT1RCI4FkVgGYp0AE8IV3yE
	59sT3bfqNHmTR4qP80CwTIRguOlAxrBKRjhZnTbCwoLxUX5rDTO8p10D8EY+8k0ouyJ6mvymcPOL5
	YonDTpHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we8eD-0000000EG1O-1cwm;
	Mon, 29 Jun 2026 09:51:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we8eB-0000000EG1A-3Jqm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 09:51:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C3B2C60008;
	Mon, 29 Jun 2026 09:51:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 681D11F000E9;
	Mon, 29 Jun 2026 09:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782726682;
	bh=Ans8cQyuz+4bONK8ZwcfQWnEefdUl8mlhioaHY5g7cg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=OVJB8yvfXgbiOBWbfWIoCv4EaqRoiMKbn/u81nCdeww8OY0lsKYD5YUIGjzxCGvda
	 QELTkKii4nlxFHZwgwLIfbn0ZuR6eySGblk232ZI6431dTMGNSMlXLKKQ9Qa1qM3jm
	 PwJPy2IiyYjaHq4ALlzg8wobD7QaTTEdFsyUk4xvyyOGmzo8YP5EJ5x6ldFZ4JvAPS
	 iXqMh0s+dbaUW+YKPGg0H5u/nJIvCb4b7ivUOvUQoo34xbrDTEkKt9Iy9BelIW2fDb
	 FhaZMyl2j8BRqrNZGVnrwnyxL/L/6vRUJ4wxARUZ8wqDwoPUKvuyLL22OYmDijOqQ3
	 V3iAOA40OozrQ==
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
In-Reply-To: <yq5ao6gtoncp.fsf@kernel.org>
References: <20260604083959.1265923-1-aneesh.kumar@kernel.org>
 <aigYbK12D8uKQvJF@arm.com> <20260609144746.GL2764304@ziepe.ca>
 <2ecfa1a8-6202-4319-9692-a6ffeb5a3dbf@amd.com>
 <yq5aqzm4dz25.fsf@kernel.org> <20260618153705.GH231643@ziepe.ca>
 <yq5ao6h6enhm.fsf@kernel.org> <20260619122148.GL231643@ziepe.ca>
 <yq5aldcaejos.fsf@kernel.org> <20260619140616.GB1068655@ziepe.ca>
 <yq5ao6gtoncp.fsf@kernel.org>
Date: Mon, 29 Jun 2026 15:21:08 +0530
Message-ID: <yq5ah5mloesz.fsf@kernel.org>
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


Alexey,

Aneesh Kumar K.V <aneesh.kumar@kernel.org> writes:

> The current code already does this and uses the swiotlb pool correctly
> on SME. The challenge arises when we want to force SWIOTLB
> bouncing even for devices that can handle encrypted DMA addresses (more
> on that below). For such a config force_dma_uencrypted(dev) will return
> false and swiotlb will be marked cc_shared/decrypted = true; This trip
> the new check we added.
>
> 	/* swiotlb pool is incorrect for this device */
> 	if (unlikely(mem->cc_shared != force_dma_unencrypted(dev)))
> 		return (phys_addr_t)DMA_MAPPING_ERROR;
>
> We can also do
>
> 	if (cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT)) {
> 		/* swiotlb pool is incorrect for this device */
> 		if (unlikely(mem->cc_shared != force_dma_unencrypted(dev)))
> 			return (phys_addr_t)DMA_MAPPING_ERROR;
>
> 		/* Force attrs to match the kind of memory in the pool */
> 		if (mem->cc_shared)
> 			*attrs |= DMA_ATTR_CC_SHARED;
> 		else
> 			*attrs &= ~DMA_ATTR_CC_SHARED;
> 	} else {
> 		/*
> 		 * Host memory encryption where device requires an
> 		 * unencrypted dma_addr_t due to dma mask limit
>     		 */
> 		if (force_dma_unencrypted(dev))
> 			*attrs |= DMA_ATTR_CC_SHARED;
> 		else
> 			*attrs &= ~DMA_ATTR_CC_SHARED;
> 	}
>
>
> Here I see value in having DMA_ATTR_UNENCRYPTED. The question is do we
> need to split this into two flags and introduce the resulting code
> duplication.
>

Can you help to test this patch?

commit 0275ed870ff8dadb4890fe8342e84b294f657c43
Author: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
Date:   Mon Jun 29 11:55:08 2026 +0530

    swiotlb: Return unencrypted DMA addresses for SME bounce buffers
    
    On hosts with memory encryption, the default swiotlb pool is marked shared
    and decrypted when memory encryption is active.
    
    Make host-memory-encryption swiotlb mappings consistently return
    unencrypted DMA addresses. This applies regardless of whether the device
    itself requires unencrypted DMA due to its DMA mask, because the bounce
    buffer memory backing the mapping is already unencrypted. It also preserves
    swiotlb=force for devices that can address encrypted memory: forced bounce
    mappings use the unencrypted swiotlb pool and receive unencrypted DMA
    addresses.
    
    Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>

diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index a62e1571ec95..9ba23cf8d97b 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -1514,15 +1514,26 @@ phys_addr_t swiotlb_tbl_map_single(struct device *dev, phys_addr_t orig_addr,
 	if (cc_platform_has(CC_ATTR_MEM_ENCRYPT))
 		pr_warn_once("Memory encryption is active and system is using DMA bounce buffers\n");
 
-	/* swiotlb pool is incorrect for this device */
-	if (unlikely(mem->cc_shared != force_dma_unencrypted(dev)))
-		return (phys_addr_t)DMA_MAPPING_ERROR;
+	if (cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT)) {
+		/* swiotlb pool is incorrect for this device */
+		if (unlikely(mem->cc_shared != force_dma_unencrypted(dev)))
+			return (phys_addr_t)DMA_MAPPING_ERROR;
 
-	/* Force attrs to match the kind of memory in the pool */
-	if (mem->cc_shared)
+		/* Force attrs to match the kind of memory in the pool */
+		if (mem->cc_shared)
+			*attrs |= DMA_ATTR_CC_SHARED;
+		else
+			*attrs &= ~DMA_ATTR_CC_SHARED;
+	} else if (cc_platform_has(CC_ATTR_HOST_MEM_ENCRYPT)) {
+		/*
+		 * On hosts with memory encryption, SWIOTLB-backed memory
+		 * is unencrypted memory. DMA addresses returned for bounce
+		 * buffers must therefore have the C-bit cleared, even for
+		 * devices that can address encrypted memory. This also
+		 * preserves swiotlb=force for those devices.
+		 */
 		*attrs |= DMA_ATTR_CC_SHARED;
-	else
-		*attrs &= ~DMA_ATTR_CC_SHARED;
+	}
 
 	/*
 	 * The default swiotlb memory pool is allocated with PAGE_SIZE

