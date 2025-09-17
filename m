Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7004CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 19:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jUIJcVT/Ec3AwRa4wJ18smxL4fxzGF/Dm4hZdfMfRwI=; b=wRjTNn/u1oP088Epz6dwyqjIs5
	y0KvbVMGTlXS3A8+vwLZjruLpYdM1GoxbclDAxassqKW6/FPoXogzezGyNV8iaylVl9FsjtFAFhqC
	kbQNzvR8axeCfkF+afqbfjR2sJxjUKa6D47U8WA9sMFb1EJsr8uuTFPjhyskZgk92tI/94mlTH/jf
	UFgpYQZRFudMcmipTOmXo6kzTf+v6AwHBJela8FIEI09n+24UX63jL3yebnvgWcApV0hSqmu0IjrA
	vrXF9hVQTY320O/sodBemSb8PWcS5ZFxzgK6xafG1JhmrE6XNXMt4P9gWn90hIDyDDt8Boi9L5Bhp
	P7PDNQRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyy6k-0000000ENoP-2Zxq;
	Wed, 17 Sep 2025 19:46:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyy6i-0000000ENnA-49BA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 19:46:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D55F7408E0;
	Wed, 17 Sep 2025 19:46:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E866C4CEE7;
	Wed, 17 Sep 2025 19:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758138382;
	bh=nlmIOQC/VIb2m7wg0uPRuwlgDGUVlQnEQuPSzkaTTFM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rkrMcRDZdHdTGNjMH4Crcmt20fzR2339np4ZPNdTwitHH/orvZWQni6I50xBbpqkH
	 5zRQ1tedhIuRV0YkJ4apRCfHsjgS9k1AtEtXh/ZItVhHAJnVjMGTjxCcHp440xk1Q8
	 ISpIwvvgtQH769jGYNfBvClRYrrQuHRTLmMkXZvfsOw+SQSa+rtFEoJzSq8GMT0VjJ
	 yUCH9g3UXGtPcfi6DqmBL/9FtRjlDxSwplKJyfx+q6RL1t0vxkShfIvfwuoIdbLakc
	 DcwqaKYfV2GaSv7snc0R2mngQFoztdXYYA1XD04kggfItz5Y2F6Qnfnm23UXrR6NxQ
	 QrOWKbvF6edlQ==
Date: Wed, 17 Sep 2025 22:46:17 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>
Subject: Re: [PATCH v3 3/4] ARM: dma-mapping: Switch to physical address
 mapping callbacks
Message-ID: <20250917194617.GB10800@unreal>
References: <cover.1758006942.git.leon@kernel.org>
 <5f96e44b1fb5d92a6a5f25fc9148a733a1a53b9d.1758006942.git.leon@kernel.org>
 <20250916184617.GW1086830@nvidia.com>
 <20250917103644.GB6464@unreal>
 <20250917113248.GA1086830@nvidia.com>
 <20250917134128.GC6464@unreal>
 <20250917135819.GA1391379@nvidia.com>
 <20250917184625.GA10800@unreal>
 <20250917190846.GE1391379@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917190846.GE1391379@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_124625_064934_3DE929F2 
X-CRM114-Status: GOOD (  18.60  )
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

On Wed, Sep 17, 2025 at 04:08:46PM -0300, Jason Gunthorpe wrote:
> On Wed, Sep 17, 2025 at 09:46:25PM +0300, Leon Romanovsky wrote:
> > Let's take as an example MIPS/jazzdma, should we call to vdma_alloc()
> > in DMA_ATTR_MMIO case?
> 
> Yes, that is right, this is an iommu, so it has to be programmed.
> 
> > or directly return "phys" as it is done in other
> > architectures?
> 
> Which?

XEN does that.

https://git.kernel.org/pub/scm/linux/kernel/git/mszyprowski/linux.git/tree/drivers/xen/swiotlb-xen.c?h=dma-mapping-for-next#n395

static dma_addr_t xen_swiotlb_direct_map_resource(struct device *dev,
						  phys_addr_t paddr,
						  size_t size,
						  enum dma_data_direction dir,
						  unsigned long attrs)
{
	dma_addr_t dma_addr = paddr;

	if (unlikely(!dma_capable(dev, dma_addr, size, false))) {
		dev_err_once(dev,
			     "DMA addr %pad+%zu overflow (mask %llx, bus limit %llx).\n",
			     &dma_addr, size, *dev->dma_mask, dev->bus_dma_limit);
		WARN_ON_ONCE(1);
		return DMA_MAPPING_ERROR;
	}

	return dma_addr;
}

> 
> > > vdpa can support ATTR_MMIO with the same iommu prot MMIO adjustment,
> > > that would be a good additional patch.
> > 
> > There is "bounce page" in VDPA, it sounds like swiotlb to me, which
> > doesn't work with MMIO.
> 
> Oh OK, it eventually does call pfn_to_page().. This isn't the case I
> thought it was, there is another one that just routes to iommu_map
> 
> Jason
> 

