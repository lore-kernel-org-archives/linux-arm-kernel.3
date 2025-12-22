Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1AD9E6748D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 08:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mxl35py0J3JTlMBp5RKNGQiItfwgmonFGTg3aOOOyIk=; b=b63oOwV2RIZI43BbE3AntU4SuM
	k790bVtZFQoJ37wQMJmPIi78MBV9wDLa0RYoe87LGpDxniYH3x5hAsnvXmGu5zbngN4EAHF1nJWZa
	cz5yg9EBXZdHYuthspzAibatE4j7dBdAbETh0Yi4TgsjQDFORZo866TOHDB+mlMOK7WuAvUdsbwIc
	IVE5dp+fFhVqFCBaO0n4sxnmDWoys2LUjHOB8ZgHZ+Hy1asBV0Mu5qc2wH2Lh/8FN5PNMvYQeGzZ6
	hhYK9bdyxdfBQi3wDFp0VYMnTgrBWhpYzoXmxbsRaUsMZA5oRggiTc/BEyQcKotPRtsJNvhRwhSVE
	VVLnP10A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXbbb-0000000DTdB-39tD;
	Mon, 22 Dec 2025 08:49:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXbba-0000000DTd1-1PmC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 08:49:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 60F796001D;
	Mon, 22 Dec 2025 08:49:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7C8AC4CEF1;
	Mon, 22 Dec 2025 08:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766393365;
	bh=oWca8sld6uaR00gnqz5NRm6geqCm1R+PSwh673eaF+0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eebXp7SCur2PVnqDo7vLANpRKY+zTW6tc/OHAoL0XAgL5cTLODN2c/6tItcWna9s4
	 98TAewGbtPY/uRxAta8TwhLJ3Xppunxdn3QKeqK8HoUZiFQezmAuGFNOp5S+XynC16
	 eanK2PxZe8tD78F5Eti1ttx4nimf4/mL84+8z0R7p/N8D9WQzu3ZPyoB2IGmXcSL2w
	 wP/0ucfmYDQU1D36uYCFJ1cA9ztygMOz59U2DvLysafGLDYDJTj02riBX517iyp7nZ
	 PduYm7iLWqmmrb5uPmVcN1V3iD1WJ8m7GaSog8lduZckQHyR3qEfJaIFxswHwq5r0e
	 OEKJuMo1iuauA==
Date: Mon, 22 Dec 2025 10:49:21 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Barry Song <21cnbao@gmail.com>
Subject: Re: [PATCH 5/6] dma-mapping: Allow batched DMA sync operations if
 supported by the arch
Message-ID: <20251222084921.GA13529@unreal>
References: <20251221115523.GI13030@unreal>
 <20251221192458.1320-1-21cnbao@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251221192458.1320-1-21cnbao@gmail.com>
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

On Mon, Dec 22, 2025 at 03:24:58AM +0800, Barry Song wrote:
> On Sun, Dec 21, 2025 at 7:55 PM Leon Romanovsky <leon@kernel.org> wrote:
> [...]
> > > +
> >
> > I'm wondering why you don't implement this batch‑sync support inside the
> > arch_sync_dma_*() functions. Doing so would minimize changes to the generic
> > kernel/dma/* code and reduce the amount of #ifdef‑based spaghetti.
> >
> 
> There are two cases: mapping an sg list and mapping a single
> buffer. The former can be batched with
> arch_sync_dma_*_batch_add() and flushed via
> arch_sync_dma_batch_flush(), while the latter requires all work to
> be done inside arch_sync_dma_*(). Therefore,
> arch_sync_dma_*() cannot always batch and flush.

Probably in all cases you can call the _batch_ variant, followed by _flush_,  
even when handling a single page. This keeps the code consistent across all  
paths. On platforms that do not support _batch_, the _flush_ operation will be  
a NOP anyway.

I would also rename arch_sync_dma_batch_flush() to arch_sync_dma_flush().

You can also minimize changes in dma_direct_map_phys() too, by extending
it's signature to provide if flush is needed or not.

dma_direct_map_phys(....) -> dma_direct_map_phys(...., bool flush):

static inline dma_addr_t dma_direct_map_phys(...., bool flush)
{
	....

	if (dma_addr != DMA_MAPPING_ERROR && !dev_is_dma_coherent(dev) &&
	    !(attrs & (DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_MMIO)))
        {
	    	arch_sync_dma_for_device(phys, size, dir);
		if (flush)
			arch_sync_dma_flush();
	}
}

Thanks

