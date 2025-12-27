Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CBECE92710
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Dec 2025 20:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5T62/0s5EUYuxsChg+u7pOaZZD1x+HOnvFhd8Pawb68=; b=aJHF2jjPar9DQ/1S1sO22MTp4g
	iACs64zWMx5LCfjllkrJiTbrt1L3En1amv+pubehDY6tB7VyDMbfGY2ijzHutSeMQKo0WrC7JYmmJ
	Ii9sS9KX/4cabd2KZ4gzwW+8vGMrjGiBFUdvLZZC3UNjx0k9vn9ewDL/KaWO0SOWMDS9/dngxG7pb
	qOAXDKBJUkZP6gydGEWZotyLHRHqABQxNORt5DXCeMA61j5uPH4s4UJEDQeoUQK6vO0uYQiG8J4wz
	1dyCXDu1p69E1Cq290wOQfYDdm9XnRqzS+BCXsV2BRlRsOgYaoPI6ewR+2HVQvEM/Jyht3+jxFNxW
	LvI4Ep9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZaiY-00000002Bqy-37ha;
	Sat, 27 Dec 2025 20:16:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZaiW-00000002Bqp-3WpG
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Dec 2025 20:16:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 882B460010;
	Sat, 27 Dec 2025 20:16:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFEFAC4CEF1;
	Sat, 27 Dec 2025 20:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766866606;
	bh=YVbtQLZx9jfw9z6Q7qKoP3MRHyWD/+ZNiJGjIZfNTgg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uwKZl8KzwVtiip51+4heE0ashdbCeXp6U5OGLZVN5eA3XVOWJ7w0nu+JM1fdk1dvX
	 ZfbtAVStzxCNZU1JJKfXU2qcA4s2Zf/F+0PKbtzuf9B9+glwGNiVwxgC1bY3mVWDqt
	 x+OGDvSx4PZZI6McqMG+qakQtcWSE9+9tMu26q3QXTy1gMrTGcAo4CvA5PP9VpTn2Y
	 t+LQEj1YwktMsX15KqA9mAEHyv4WHQBDsuDqMqLw7BtRg6wMni6pYQYI3FZb8kWIWE
	 iFr0g/ZmzQ2XLCky+90/8NJrMcMB42KyHtG+QFBx2dI8aag00ktWTd4LyrTN8FnlYw
	 dWKdi+ikD9wGg==
Date: Sat, 27 Dec 2025 22:16:42 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Barry Song <21cnbao@gmail.com>
Subject: Re: [PATCH RFC v2 8/8] dma-iommu: Support DMA sync batch mode for
 iommu_dma_sync_sg_for_{cpu, device}
Message-ID: <20251227201642.GQ11869@unreal>
References: <20251226225254.46197-1-21cnbao@gmail.com>
 <20251226225254.46197-9-21cnbao@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251226225254.46197-9-21cnbao@gmail.com>
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
Cc: Tangquan Zheng <zhengtangquan@oppo.com>, Barry Song <baohua@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, will@kernel.org, Anshuman Khandual <anshuman.khandual@arm.com>, catalin.marinas@arm.com, Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>, iommu@lists.linux.dev, Marc Zyngier <maz@kernel.org>, xen-devel@lists.xenproject.org, robin.murphy@arm.com, Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Sat, Dec 27, 2025 at 11:52:48AM +1300, Barry Song wrote:
> From: Barry Song <baohua@kernel.org>
> 
> Apply batched DMA synchronization to iommu_dma_sync_sg_for_cpu() and
> iommu_dma_sync_sg_for_device(). For all buffers in an SG list, only
> a single flush operation is needed.
> 
> I do not have the hardware to test this, so the patch is marked as
> RFC. I would greatly appreciate any testing feedback.
> 
> Cc: Leon Romanovsky <leon@kernel.org>
> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Cc: Joerg Roedel <joro@8bytes.org>
> Cc: Tangquan Zheng <zhengtangquan@oppo.com>
> Signed-off-by: Barry Song <baohua@kernel.org>
> ---
>  drivers/iommu/dma-iommu.c | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
> index ffa940bdbbaf..b68dbfcb7846 100644
> --- a/drivers/iommu/dma-iommu.c
> +++ b/drivers/iommu/dma-iommu.c
> @@ -1131,10 +1131,9 @@ void iommu_dma_sync_sg_for_cpu(struct device *dev, struct scatterlist *sgl,
>  			iommu_dma_sync_single_for_cpu(dev, sg_dma_address(sg),
>  						      sg->length, dir);
>  	} else if (!dev_is_dma_coherent(dev)) {
> -		for_each_sg(sgl, sg, nelems, i) {
> +		for_each_sg(sgl, sg, nelems, i)
>  			arch_sync_dma_for_cpu(sg_phys(sg), sg->length, dir);
> -			arch_sync_dma_flush();
> -		}
> +		arch_sync_dma_flush();

This and previous patches should be squashed into the one which
introduced arch_sync_dma_flush().

Thanks

