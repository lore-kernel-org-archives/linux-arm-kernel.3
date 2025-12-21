Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE2F4E66886
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Dec 2025 11:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k+9LOPwtDodnuj5YlAOUGBs5In8ZHAMmbKljbsIw5Hw=; b=iPKay3/6Xq2wK7Y8fURPvSlqsM
	0YtP2/eor3C5fr1PDvo9bhUbEafLLBBo3R423SPNyPXvBbBz6Hj7xGDFpO5wwB5aX5+C6KU9oJ1ja
	yWFq69Oq/+YwJJiEAcUeA8SP4BS/2821hlgxpQAzm8JHFOE+McuaPROoZuihBdul6y5RCryONfy42
	LeRH+bwrFg9Yx9zFgK/5FJQJhwhIdYzL2mBqNrqTnjoXNQIG6hmomy3xlidMFYJOr/w8b62iVgAlx
	nlMsXZKsu7Pk761XV9rLfeof2wHREj3At8xKt2hq1q/BimOLmM/d5UxGbduETSI8+6p/dHLjMrNvD
	Qa2ixzrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXI2A-0000000CPfl-2YqR;
	Sun, 21 Dec 2025 11:55:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXI26-0000000CPfK-2RvU
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Dec 2025 11:55:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5EDC04099E;
	Sun, 21 Dec 2025 11:55:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4BB9C4CEFB;
	Sun, 21 Dec 2025 11:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766318127;
	bh=cl0Pp9gIMy9qgGyo+31RVCvJ8tyH3yPUScmFvHzlmzo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m4PYcanKwIXIAkG+coVrKkljBDifB1QabUlFnQ3ypVg0NVtQmBnB/6oN9x7PYRhIN
	 0sVLieQfV0c237oif8izgVL1JTccjIUrFLcqvp/rJkxoXihijgtCOoqM2wpqE+j1aA
	 4QHvF2jDFuv9hzwc824cIqpLcrP9LDmLWgBb4GY6bvymBDeY4DW131179tHLfTOKVe
	 CnyfUFUdje3+Tr0xR7jKzeHBVsptHeHCmcyUdYOSig3bJ8LweSk0ZGUOrmPz1VWPP6
	 y6PzTrm9GUKr2OhwTd9GLn0uRJbfLf0pr2+a/MwsAOClEIQwARj/A89uJ0ZJMJbyVC
	 rO7K1fA0KE4hg==
Date: Sun, 21 Dec 2025 13:55:23 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Barry Song <21cnbao@gmail.com>
Subject: Re: [PATCH 5/6] dma-mapping: Allow batched DMA sync operations if
 supported by the arch
Message-ID: <20251221115523.GI13030@unreal>
References: <20251219053658.84978-1-21cnbao@gmail.com>
 <20251219053658.84978-6-21cnbao@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251219053658.84978-6-21cnbao@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251221_035530_687026_5B55E7C5 
X-CRM114-Status: GOOD (  14.25  )
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
Cc: v-songbaohua@oppo.com, zhengtangquan@oppo.com, ryan.roberts@arm.com, will@kernel.org, anshuman.khandual@arm.com, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, surenb@google.com, iommu@lists.linux.dev, maz@kernel.org, robin.murphy@arm.com, ardb@kernel.org, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Dec 19, 2025 at 01:36:57PM +0800, Barry Song wrote:
> From: Barry Song <v-songbaohua@oppo.com>
> 
> This enables dma_direct_sync_sg_for_device, dma_direct_sync_sg_for_cpu,
> dma_direct_map_sg, and dma_direct_unmap_sg to use batched DMA sync
> operations when possible. This significantly improves performance on
> devices without hardware cache coherence.
> 
> Tangquan's initial results show that batched synchronization can reduce
> dma_map_sg() time by 64.61% and dma_unmap_sg() time by 66.60% on an MTK
> phone platform (MediaTek Dimensity 9500). The tests were performed by
> pinning the task to CPU7 and fixing the CPU frequency at 2.6 GHz,
> running dma_map_sg() and dma_unmap_sg() on 10 MB buffers (10 MB / 4 KB
> sg entries per buffer) for 200 iterations and then averaging the
> results.
> 
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
> Cc: Tangquan Zheng <zhengtangquan@oppo.com>
> Signed-off-by: Barry Song <v-songbaohua@oppo.com>
> ---
>  kernel/dma/direct.c | 28 ++++++++++-----
>  kernel/dma/direct.h | 86 +++++++++++++++++++++++++++++++++++++++------
>  2 files changed, 95 insertions(+), 19 deletions(-)

<...>

>  		if (!dev_is_dma_coherent(dev))
> -			arch_sync_dma_for_device(paddr, sg->length,
> -					dir);
> +			arch_sync_dma_for_device_batch_add(paddr, sg->length, dir);

<...>

> -static inline dma_addr_t dma_direct_map_phys(struct device *dev,
> +#ifdef CONFIG_ARCH_WANT_BATCHED_DMA_SYNC
> +static inline void dma_direct_sync_single_for_cpu_batch_add(struct device *dev,
> +		dma_addr_t addr, size_t size, enum dma_data_direction dir)
> +{
> +	phys_addr_t paddr = dma_to_phys(dev, addr);
> +
> +	if (!dev_is_dma_coherent(dev))
> +		arch_sync_dma_for_cpu_batch_add(paddr, size, dir);
> +
> +	__dma_direct_sync_single_for_cpu(dev, paddr, size, dir);
> +}
> +#endif
> +
> +static inline void dma_direct_sync_single_for_cpu(struct device *dev,
> +		dma_addr_t addr, size_t size, enum dma_data_direction dir)
> +{
> +	phys_addr_t paddr = dma_to_phys(dev, addr);
> +
> +	if (!dev_is_dma_coherent(dev))
> +		arch_sync_dma_for_cpu(paddr, size, dir);
> +
> +	__dma_direct_sync_single_for_cpu(dev, paddr, size, dir);
> +}
> +

I'm wondering why you don't implement this batch‑sync support inside the
arch_sync_dma_*() functions. Doing so would minimize changes to the generic
kernel/dma/* code and reduce the amount of #ifdef‑based spaghetti.

Thanks."

