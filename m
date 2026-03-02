Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1FC7EB3624
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 19:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8MDNbjTixOfa0GTM9nILFTTji9y/2YCrVQk64vFZ2cs=; b=ilVvt0DLUZwLYgR9i2Mz6Rkx9Z
	RmXHehsuAIr77ZHEN0KDng5i+sRAQkoKp6yxnYLnsnHiXL7UXuqS8NCj/UeAEFLxe5uPE/swk5xtq
	UDh9gqRxKgCWhhIw2OiOQLByWDUzp19GZ+Jx9pTXijAU9dYx5RGdfwq/eqe7V6PpS8KRd1yudddyW
	NZINlngL19UYOLqh1cZQh8UOmKjj57rM+psm3JepefxD7ATETlslZUytZ1ziE1nOMlUiOnrXJsYHS
	uDpydtifFoOcSgX8O2yBHwZ/n+skEOV0lO6WT6rPvoyCP317tGsZ+pCED2hNZ7rW22MbKAxULhT3f
	LbqO8Qpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx9Kl-0000000DlMZ-3yXN;
	Mon, 02 Mar 2026 19:53:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx9Kj-0000000DlMD-2Huy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 19:53:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2F40440558;
	Mon,  2 Mar 2026 19:53:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 633BEC19423;
	Mon,  2 Mar 2026 19:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772481216;
	bh=iHd9xTb08uobwrAOBK6bO4QNR4IAuCt806zIdYOX5us=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S/dJT0zySAqwi8FaZNed1bZHgZoUCgkvtEoN8t/qyxZFp4cdB5l4QCVShqLeQMGVe
	 rRPW0Y3cs4dBSlhGNTkgQg/LYvrMJYcaWCCWfoOUveyHYK9JvZQGSYvyb702arb/ea
	 mbb3qgrBoqHQHfWLA8bq5WvBMzRmeNSQ8woJOAhXYpaXIvvhpUM1npi9Clw4oTIdA0
	 YcoCj5pjyU5NRwaWwqatyon0UBxknUprtI9HCyltId6WEljYAa6ne6Sr5pLHyPMo3q
	 khGXgG+xXggQ6qmt1ilyq3HDMADuB/j+MgYxCkEX2+8kWdr8QjQM9CzSEetoFBMZa2
	 LUQYeASDCnoZg==
Date: Mon, 2 Mar 2026 21:53:32 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Barry Song <21cnbao@gmail.com>
Subject: Re: [PATCH v3 4/5] dma-mapping: Separate DMA sync issuing and
 completion waiting
Message-ID: <20260302195332.GV12611@unreal>
References: <20260228221316.59934-1-21cnbao@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260228221316.59934-1-21cnbao@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_115337_625320_3A2FE4A1 
X-CRM114-Status: GOOD (  15.25  )
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
Cc: Juergen Gross <jgross@suse.com>, Tangquan Zheng <zhengtangquan@oppo.com>, Barry Song <baohua@kernel.org>, Stefano Stabellini <sstabellini@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, will@kernel.org, Anshuman Khandual <anshuman.khandual@arm.com>, catalin.marinas@arm.com, Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>, iommu@lists.linux.dev, Xueyuan Chen <xueyuan.chen21@gmail.com>, Marc Zyngier <maz@kernel.org>, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, robin.murphy@arm.com, Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Sun, Mar 01, 2026 at 06:13:16AM +0800, Barry Song wrote:
> From: Barry Song <baohua@kernel.org>
> 
> Currently, arch_sync_dma_for_cpu and arch_sync_dma_for_device
> always wait for the completion of each DMA buffer. That is,
> issuing the DMA sync and waiting for completion is done in a
> single API call.
> 
> For scatter-gather lists with multiple entries, this means
> issuing and waiting is repeated for each entry, which can hurt
> performance. Architectures like ARM64 may be able to issue all
> DMA sync operations for all entries first and then wait for
> completion together.
> 
> To address this, arch_sync_dma_for_* now batches DMA operations
> and performs a flush afterward. On ARM64, the flush is implemented
> with a dsb instruction in arch_sync_dma_flush(). On other
> architectures, arch_sync_dma_flush() is currently a nop.
> 
> Cc: Leon Romanovsky <leon@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Joerg Roedel <joro@8bytes.org>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Cc: Tangquan Zheng <zhengtangquan@oppo.com>
> Reviewed-by: Juergen Gross <jgross@suse.com> # drivers/xen/swiotlb-xen.c
> Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> Signed-off-by: Barry Song <baohua@kernel.org>
> ---
>  arch/arm64/Kconfig             |  1 +
>  arch/arm64/include/asm/cache.h |  5 +++++
>  arch/arm64/mm/dma-mapping.c    |  4 ++--
>  drivers/iommu/dma-iommu.c      | 35 ++++++++++++++++++++++++++--------
>  drivers/xen/swiotlb-xen.c      | 24 +++++++++++++++--------
>  include/linux/dma-map-ops.h    |  6 ++++++
>  kernel/dma/Kconfig             |  3 +++
>  kernel/dma/direct.c            |  6 +++++-
>  kernel/dma/direct.h            |  9 +++++++--
>  kernel/dma/swiotlb.c           |  7 ++++++-
>  10 files changed, 78 insertions(+), 22 deletions(-)
> 

Thanks,
Reviewed-by: Leon Romanovsky <leonro@nvidia.com>

