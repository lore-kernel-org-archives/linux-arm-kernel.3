Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 342D8C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 10:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5RU9jyjDZ8CdKycZTW5Y3nd2HKxIX/CGf0uN/C8vm+s=; b=kA0Y4GJWFAjAUC95gTfZFYFNvP
	rgl+Ifsd7eswfawDHkeEF/VP5Qt2+VCfWqGRIEd4R6+73DSrpZHa2isvbgyYq/EEV++BumpruZD1M
	WMrILKYqwGna2I/B4mlzn3Uog8MXI0h/NDMI8bZnl+8W9LvYmRDuKqUGIeW8JbnIwsvVlhL8Tz+qy
	G2yQIXJUmYbnCSD30Ku1IQ25QKVSxU9dzlXuorKf+4ndQvDWdt0ui/v1znuh0OpYKyQR3Q8ROy/HG
	1M+X5JgJ6PW2F7A0+bxcTmNPLwLLEBKEl+4/9rlhYZyQvOmLSow0RhZI9qZDzU4TvMcjDWPEkQC3Q
	tuXOO1Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi8wt-00000004lN7-09qP;
	Fri, 10 Jul 2026 10:59:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi8wr-00000004lMx-27Aw;
	Fri, 10 Jul 2026 10:59:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A935660051;
	Fri, 10 Jul 2026 10:59:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1E151F000E9;
	Fri, 10 Jul 2026 10:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783681152;
	bh=5RU9jyjDZ8CdKycZTW5Y3nd2HKxIX/CGf0uN/C8vm+s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=P9g6X6+0ZpBoxkWrEIPnYP7a0wV0jlT9aNYx2hiN7f48ci5qgfUf/pmMKIB/RhAZz
	 x76HOdthYnWeGnTUFEl+ro1rVO91zyXkMcz8Bfc0tbz+LMO5eP8rqdt8vVzQSXdt9O
	 gVUet8ZrEBnk0eLUYMSZSUla4dpRkJwrRj1GKz7wvdfOHTp4xMb+fehqUEQI+DjDLi
	 PrXR9oSeqIjDPlC7+h+ic+ZLoPayy+GW5B1calYkaNSIfjfPlB1YD2Evuq0yXq/zmk
	 pCfYXxLIT8qQrgO/LgzHVbIlXNxVr53ykeAYX48q75LX3n1TMIwhXYX+ppJo8J/w77
	 QUgWiBsBD1PDQ==
Date: Fri, 10 Jul 2026 11:59:06 +0100
From: Will Deacon <will@kernel.org>
To: Jiaxing Hu <huhuvmb88@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Joerg Roedel <joro@8bytes.org>,
	Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	jgg@ziepe.ca
Subject: Re: [PATCH] iommu/rockchip: implement .flush_iotlb_all
Message-ID: <alDQevX58XvdRcWc@willie-the-truck>
References: <20260710060513.863714-1-huhuvmb88@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710060513.863714-1-huhuvmb88@gmail.com>
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

On Fri, Jul 10, 2026 at 06:05:13PM +1200, Jiaxing Hu wrote:
> rk_iommu invalidates the IOTLB synchronously in .unmap (via
> rk_iommu_zap_iova), so it stays consistent without a deferred .iotlb_sync
> and does not advertise IOMMU_CAP_DEFERRED_FLUSH.
> 
> It never implemented the optional .flush_iotlb_all op, though, and
> iommu_flush_iotlb_all() is a no-op when that op is absent -- so on Rockchip
> a driver that owns an rk_iommu domain and calls it to flush the whole
> domain's TLB (e.g. before reusing a mapping, without unmapping it) gets
> nothing, even though the hardware can do it: rk_iommu already issues
> ZAP_CACHE for range shootdowns.
> 
> Implement it with that same primitive: ZAP_CACHE every bank of every IOMMU
> on the domain, under the runtime-PM + clk guard already used by
> rk_iommu_zap_iova().
> 
> Found while bringing up an out-of-tree RK3576 NPU (accel/rocket) driver
> that flushes before each submit; on Rockchip that flush did nothing.
> 
> Signed-off-by: Jiaxing Hu <huhuvmb88@gmail.com>
> ---

We tried to get rid of iommu_flush_iotlb_all() in 69e5a17511f6
("iommu: Remove useless flush from iommu_create_device_direct_mappings()")
but we had to revert that in a33bf8d8ce7e ("iommu: Restore
iommu_flush_iotlb_all()") because of a user in the MSM driver.

So I think this is the wrong direction. We should try harder to remove
the function rather than add new implementations of it. I'm assuming
you're only adding it for some out-of-tree code that calls it?

Will

