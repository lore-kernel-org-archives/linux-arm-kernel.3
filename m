Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B6D6C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jul 2026 07:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hkeoESYmG7m48wiu7DFgnzkgoaFnDkiRgmmBzEi4GuA=; b=o8G43OZmRNwKH1SVvOXuCkhONx
	WaoQ839rGzsyOBjhXOnEYYuFYY4b0RvzTTRwPQQDY0UCocwNNoPlrA1xzbdpLx8BlgL4E6MpnGwdh
	GG0gURjBTQa/xPqYVTUf7s0EtMjMxfFeGCk418p3rf6UwxrjB/mqcRxKS48Ea221NrTc8ECieOn4D
	y6UZCExmc7tWUGNj7KLqHX+N7f10VZc4xsRi+aILu8n8t1V7vGqA7CoeUJXBMz3tETvDz81hpSCmZ
	y5r7H1sXkz8ptBg0EH/HzK6TpcdlzjoAzxB4NLqOhO/OgHniJG+mF0yrb8ZgWW0NK4feUKQu0vDH/
	n9YJZI0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnWVj-000000008ho-1RTh;
	Sat, 25 Jul 2026 07:09:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnWVi-000000008hi-0Wr9
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Jul 2026 07:09:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3F26B600AD;
	Sat, 25 Jul 2026 07:09:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4FF01F000E9;
	Sat, 25 Jul 2026 07:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784963364;
	bh=hkeoESYmG7m48wiu7DFgnzkgoaFnDkiRgmmBzEi4GuA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=UViRD/vP1cLupXloQti86AXEHd5Oqhs081layDqXo6b+RZ4Y82x9x4afggJK229+a
	 Z+Yh1HMf6iUyBzHMniRMzOJOjGgX8/rmQVSfmwkUgXZ+kWSvMa1Sgpcojx9SrWMcgB
	 KcPws98KPcszn5zlm+ZGjTfjdG2IbmfOXkGuIIKxYOCQZnC1J+O/zd6xcvj+NvctrH
	 GOhr4BGexYASpkNSEDhYVdp4wzEoZLqqAAI00JxT4ZGJQliwuyn0a/tF1jAsMRBUQF
	 GXMAh2heA1Axq+PkzXqbXUf+5yjbzncmCve2s3LU0TkmEGx25k+AGhlZEcH1i8rD/X
	 k2xKELi60Uw9w==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev
Cc: Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Mostafa Saleh <smostafa@google.com>,
	Petr Tesarik <ptesarik@suse.com>,
	Alexey Kardashevskiy <aik@amd.com>,
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
Subject: Re: [PATCH v8 00/23] dma-mapping: Track shared DMA state through
 direct, pool and swiotlb paths
In-Reply-To: <20260717180442.110954-1-aneesh.kumar@kernel.org>
References: <20260717180442.110954-1-aneesh.kumar@kernel.org>
Date: Sat, 25 Jul 2026 12:39:10 +0530
Message-ID: <yq5azezfeeax.fsf@kernel.org>
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

"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org> writes:

> This series tracks confidential-computing shared DMA state through the
> dma-direct, dma-pool, and swiotlb paths so that encrypted and decrypted
> DMA buffers are handled consistently.
>
> Today, the direct DMA path mostly relies on force_dma_unencrypted() for
> shared/decrypted buffer handling. This series consolidates the
> force_dma_unencrypted() checks in the top-level functions and ensures
> that the remaining DMA interfaces use DMA attributes to make the correct
> decisions.
>
> The series separates mapping and allocation state:
> - DMA_ATTR_CC_SHARED describes the DMA address attribute requested for a
>   mapping. It tells the DMA mapping path that the DMA address must target
>   shared/decrypted memory.
> - __DMA_ATTR_ALLOC_CC_SHARED is an internal DMA-mapping attribute used only
>   by allocation paths after the DMA core decides that the backing pages
>   must be allocated as shared/decrypted memory.
>
> The series:
> - moves swiotlb-backed allocations out of __dma_direct_alloc_pages(),
> - uses __DMA_ATTR_ALLOC_CC_SHARED through the dma-direct alloc/free paths
> - teaches the atomic DMA pools to track encrypted versus decrypted
>   state
> - tracks swiotlb pool encryption state and enforces strict pool
>   selection
> - centralizes encrypted/decrypted pgprot handling in dma_pgprot() using
>   DMA attributes
> - passes DMA attributes down to dma_capable() so capability checks can
>   validate whether the selected DMA address encoding matches
>   DMA_ATTR_CC_SHARED
> - makes dma_direct_map_phys() choose the DMA address encoding from
>   DMA_ATTR_CC_SHARED and fall back to swiotlb when a shared DMA request
>   cannot use the direct mapping, which lets arm64 and x86 CCA guests stop
>   relying on SWIOTLB_FORCE for DMA mappings
> - use the selected swiotlb pool state to derive the returned DMA
>   address
> - reports CC_ATTR_GUEST_MEM_ENCRYPT for arm64 Realms, powerpc secure
>   guests, and s390 protected virtualization guests.
>
> Dependency:
> This series depends on the pKVM changes posted at:
> https://lore.kernel.org/all/20260603110522.3331819-1-smostafa@google.com
>
> Please merge this series only after the pKVM changes above are merged.
> Otherwise pKVM will be broken.
>

pKVM topic branch is now available 

https://lore.kernel.org/all/178467286876.125042.12010461715645610054.b4-ty@kernel.org/

https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/coco

-aneesh


