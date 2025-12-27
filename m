Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07D83E9270E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Dec 2025 20:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dJI+itfzR+DUQL+LO5VFlATKlV5lYSA4VEe1u916sdk=; b=LZWS7me8+wmcyprG2h37ay51Mg
	7T3O6mYGZTOk0nOxlFdvOUSM6sPYgRyqYkBrgmU9uttDXlX1xxBN0pT+cjAnO1OdVPKmpXLIvYomo
	THdSUycQw0CgdFB8DYMzP7mN5L6Th+Bbv5Ynj1A9pU/bpHsoedM9kiFSx9z5eSFXgIP4+Evy1Ni/N
	OAh1THCaPSNF5KVJ9oNGhpcBG2NzSOYS0/QxRwEU51Y42vuqWJ5vMle1rY/NvGFP2Uc1FmqCeF/RD
	V9Odq5LBOljTrPyi6fdbpw2+4xpvBvvZzp9GzI2rk2kIe2xs7cMCuhyJ4MrQ9c4hYat4xnu4SDYr4
	WK4RgySQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZaZI-00000002BPa-05Bj;
	Sat, 27 Dec 2025 20:07:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZaZF-00000002BPF-1PcH
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Dec 2025 20:07:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D93F243922;
	Sat, 27 Dec 2025 20:07:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8DB3C4CEF1;
	Sat, 27 Dec 2025 20:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766866031;
	bh=lH6Wqea3wfifSQZGhdMqsJ7bOl+AJwlkVM2iS90xz1k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S07xCoEAxobIYaBiV02L02bERdk0nmuGN+hFMXu5vrWuTP0EPXqj8aOiLirY/XSdI
	 hUxIfJKJxQwjEDf0cGJIE06esOvlyDzQZ6VVCU/XpJsQ+cPWzdco1dnfE+T0l6+FTy
	 Z2/1CSf3BiRqj8dt9aICAM5XJ05mm2CcfJWEP0XBNvwwasMfQqxa7wnz+aNmb4d5in
	 BrpW1mFFc8LnJZ2BxbHSkZt6MmcWRZfo9YGSkyb+kpl/KFt04NW0Tpiwp6VdFNnp6U
	 FdejPb3ayq/IL4kPtLQVDuEHA5EEs/rnzDON++8ec2joqb9vADZmaIG04lvTKhRmDr
	 059bfB7LX6s1A==
Date: Sat, 27 Dec 2025 22:07:06 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Barry Song <21cnbao@gmail.com>
Subject: Re: [PATCH v2 4/8] dma-mapping: Separate DMA sync issuing and
 completion waiting
Message-ID: <20251227200706.GN11869@unreal>
References: <20251226225254.46197-1-21cnbao@gmail.com>
 <20251226225254.46197-5-21cnbao@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251226225254.46197-5-21cnbao@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251227_120713_556518_3CC9E9F4 
X-CRM114-Status: GOOD (  16.85  )
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
Cc: Juergen Gross <jgross@suse.com>, Tangquan Zheng <zhengtangquan@oppo.com>, Barry Song <baohua@kernel.org>, Stefano Stabellini <sstabellini@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, will@kernel.org, Anshuman Khandual <anshuman.khandual@arm.com>, catalin.marinas@arm.com, Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>, iommu@lists.linux.dev, Marc Zyngier <maz@kernel.org>, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, xen-devel@lists.xenproject.org, robin.murphy@arm.com, Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Sat, Dec 27, 2025 at 11:52:44AM +1300, Barry Song wrote:
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
> To address this, arch_sync_dma_for_* now issues DMA operations in
> batch, followed by a flush. On ARM64, the flush is implemented
> using a dsb instruction within arch_sync_dma_flush().
> 
> For now, add arch_sync_dma_flush() after each
> arch_sync_dma_for_*() call. arch_sync_dma_flush() is defined as a
> no-op on all architectures except arm64, so this patch does not
> change existing behavior. Subsequent patches will introduce true
> batching for SG DMA buffers.
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
> Cc: Juergen Gross <jgross@suse.com>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Cc: Tangquan Zheng <zhengtangquan@oppo.com>
> Signed-off-by: Barry Song <baohua@kernel.org>
> ---
>  arch/arm64/include/asm/cache.h |  6 ++++++
>  arch/arm64/mm/dma-mapping.c    |  4 ++--
>  drivers/iommu/dma-iommu.c      | 37 +++++++++++++++++++++++++---------
>  drivers/xen/swiotlb-xen.c      | 24 ++++++++++++++--------
>  include/linux/dma-map-ops.h    |  6 ++++++
>  kernel/dma/direct.c            |  8 ++++++--
>  kernel/dma/direct.h            |  9 +++++++--
>  kernel/dma/swiotlb.c           |  4 +++-
>  8 files changed, 73 insertions(+), 25 deletions(-)

<...>

> +#ifndef arch_sync_dma_flush
> +static inline void arch_sync_dma_flush(void)
> +{
> +}
> +#endif

Over the weekend I realized a useful advantage of the ARCH_HAVE_* config
options: they make it straightforward to inspect the entire DMA path simply
by looking at the .config.

Thanks,
Reviewed-by: Leon Romanovsky <leonro@nvidia.com>

