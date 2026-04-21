Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B887F8FA90
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 16:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=43mYyWiat7v885iAzEWNjeU/q6bxzCyydXdek4jSpzY=; b=fuCi1lOYvWWunWD/oA8M0LCQsm
	SLYCs+/pA9ECkGpDLRuYgxM0fp6XcjD8OF87rSZxD4kMGhN1wznPMQv1K9VfoDu1fgY8Lv49AHnHG
	dcQhRA/5aWjTFBE33sdbsD0kmbzl7ZHEZUOtr511AbUSmrqUmDaJeRbwb4xc/1tZG0rstHg1hjZex
	3huDDUAUJZcrjrnYnf1vvbiIQt9no2D74Hb2gzaMpv5J2UinuFMdQspRRojqExfIHvmXvPTpHoeFg
	YaSQYe8EUG76JXYRlW0OY7aJiqT1N/fbd3BV9dehXKNkOGYhYavwVtvFWjDPmos8DeFYx6ekbQ/C7
	imhHCyeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFE7c-00000008vCo-2Fq5;
	Tue, 21 Apr 2026 16:38:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFE7a-00000008vBn-1q1E
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 16:38:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 35831437BA;
	Tue, 21 Apr 2026 16:38:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7AF8C2BCB0;
	Tue, 21 Apr 2026 16:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776789525;
	bh=cNH70jj6roLIqiFmeg0hHrGoomIMGMcjiS/OFfPnRsM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Egro2/lrsv4ELOi0wXo+a9TJvYGxntQgC0M3JjmHcb7nxIOhwkyLlLSOPxiZxSik8
	 3Vz80YPce4PNdos8Pqk1NhqJ62YVd8lWbQk1Gz45K5YPNzaaA1XsLvZldCbibaZ5jz
	 KRn77oI4I0vwVmYrnsYZLiGBPRA+O3/UydZ9XkNWmXDoTsnd5GwU4MRbkK9Y0Ttua/
	 3crFam3yge6+dh3FeVVrcTtYRzWjwTk8Xr6uLxLgdjxqWQAS/nhpXA4PzJadfjLG80
	 bUnMKkpYLBjYEvUMg7loA4GSaNZlMRJTOiZ3ZHd80Sdhw40uT2m1GruG3vMn5vz7Je
	 cZHYGPsz93Smg==
Date: Tue, 21 Apr 2026 17:38:40 +0100
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: leo.jiang1224@foxmail.com, joro@8bytes.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] iommu/arm-smmu-v3: Stop queue allocation retry at
 PAGE_SIZE
Message-ID: <aeeoEHHNKPo32H9R@willie-the-truck>
References: <tencent_F6E384A40D990A279B460A0CDE1927FDF509@qq.com>
 <0fdf4b1f-90f2-4f69-9d2b-dc5f608e9c1c@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0fdf4b1f-90f2-4f69-9d2b-dc5f608e9c1c@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_093846_499739_AE46AEE4 
X-CRM114-Status: GOOD (  19.38  )
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

On Tue, Apr 21, 2026 at 04:56:47PM +0100, Robin Murphy wrote:
> On 18/04/2026 6:31 am, leo.jiang1224@foxmail.com wrote:
> > From: LoserJL <leo.jiang1224@foxmail.com>
> > 
> > In arm_smmu_init_one_queue(), the loop reduces max_n_shift if
> > dmam_alloc_coherent() fails. However, since dmam_alloc_coherent()
> > allocates at least PAGE_SIZE, retrying with a smaller size after
> > a PAGE_SIZE failure is logically redundant.
> 
> Says who? It's certainly not a guarantee offered by the DMA API itself, and
> indeed some allocation paths can definitely still allocate less than a page
> - e.g. anything which hits a per-device or global coherent pool.
> 
> > Moreover, if a sub-page retry were to succeed due to concurrent memory
> > release, the hardware would be configured with a smaller queue depth
> > despite a full page being allocated. This leads to inefficient memory
> > usage and unnecessary hardware performance limitation.
> > 
> > Terminate the loop once qsz reaches PAGE_SIZE to ensure logical
> > consistency and optimal hardware configuration.
> 
> That's really not an argument - even if an allocator does happen to
> over-allocate for the requested size, that is hardly the caller's concern;
> and as far as "optimal" queue sizes go in this case, those very much depend
> on the number of CPUs issuing commands and volume of expected stall/PRI
> events - in many cases PAGE_SIZE would already be far too small to really
> work well.
> 
> Also note that if we _were_ to fail to allocate a PAGE_SIZE or smaller
> queue, there would be very little chance of the subsequent allocation(s) for
> the stream table succeeding, so realistically the driver is probably going
> to end up failing to probe in such circumstances anyway.

That's all true, but tbf I think I just fscked up the comparison in
d25f6ead162e ("iommu/arm-smmu-v3: Increase maximum size of queues") so
I'm not against fixing that up even though the "rationale" given by
Loser doesn't make a whole lot of sense.

Will

