Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1540D13C3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 16:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MU/Kiq4psb2xarotDV6fAvUix51cGezrrQKgkCLFyng=; b=yInwjIFoKN4VqgRMEU0hwjIjmi
	24DxNo1bUKIAe96+5bIP0Dbhn6rElmTYl5d71o72o/v9ZUfkcUsyznjyCV0ylJq+x4kf39T4kYDoK
	sgjbhu1s/04b486wws3aGbeenV56XWTvjIwjM+pQX3wTu673IWaOca8I2BpwXw+sDEFG8Qqe+2qL/
	fR0ulxzOeBzLk5guPVDVkMESBjN3m46uPIc8FLNfLrvK9b/CeqHfIQkvPwje3i5Cfi+4QMK/e/p1T
	JBnQJwqMwO+etGBifqHZaobnCSyX4vXYvsqVnV6sQwZEgqGT2vlndHQD1pXDS8hJoTuQx6AQHmfaP
	QxpLRH8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkP2q-0000000CoU0-201l;
	Mon, 26 Jan 2026 16:02:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkP2o-0000000CoTn-3nFg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 16:02:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BDB8060097;
	Mon, 26 Jan 2026 16:02:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAFDCC116C6;
	Mon, 26 Jan 2026 16:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769443345;
	bh=EgFkyoJbsDSFh6qX7Hv4uyf8awBGZ88hYYx/LfvFSGA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j48shhaltmH3/WbsngSKV9s1t05sKxtWovpjZEEIw529kVpOBfyCGFLG4tuyVTD1C
	 QL6hAFG9ETT9TaZZm72CJbEq4ef8ESIvgzJB+HtEgq90FMnxl3KnE5zM/6+910yZeP
	 KltuX6Ez5FFwUrJ+H4dv8pluaX644hIPEDVqAhEpl0FuseYS/THSddtFwawUcSROqx
	 YnEMHSzpFExqHblKcorGz6MWatW/gIcTGNNYB9rIObb5L5t1Ld0Vjm0lGHxkFu/2cn
	 9kBur7+e7tAPdhqhnexNPWx5XLAMSFaI+Hk6JZRlfMKhobqOegFEb8BO027nlLpbjY
	 /DRDY1C3lt0PA==
Date: Mon, 26 Jan 2026 16:02:19 +0000
From: Will Deacon <will@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, jean-philippe@linaro.org,
	robin.murphy@arm.com, joro@8bytes.org, balbirs@nvidia.com,
	miko.lenczewski@arm.com, peterz@infradead.org, kevin.tian@intel.com,
	praan@google.com, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 6/7] iommu/arm-smmu-v3: Add arm_smmu_invs based
 arm_smmu_domain_inv_range()
Message-ID: <aXeQC3GjUgafuOi-@willie-the-truck>
References: <cover.1766174731.git.nicolinc@nvidia.com>
 <06999367d001283744fd98eb7c1823afd516ce84.1766174731.git.nicolinc@nvidia.com>
 <aXOqVcX9YEC-Ikdt@willie-the-truck>
 <aXOrnMLLzZL9BtRT@willie-the-truck>
 <20260123200327.GF1134360@nvidia.com>
 <aXdlnLLFUBwjT0V5@willie-the-truck>
 <20260126152019.GK1134360@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126152019.GK1134360@nvidia.com>
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

On Mon, Jan 26, 2026 at 11:20:19AM -0400, Jason Gunthorpe wrote:
> On Mon, Jan 26, 2026 at 01:01:16PM +0000, Will Deacon wrote:
> > On Fri, Jan 23, 2026 at 04:03:27PM -0400, Jason Gunthorpe wrote:
> > > On Fri, Jan 23, 2026 at 05:10:52PM +0000, Will Deacon wrote:
> > > > On Fri, Jan 23, 2026 at 05:05:31PM +0000, Will Deacon wrote:
> > > > > On Fri, Dec 19, 2025 at 12:11:28PM -0800, Nicolin Chen wrote:
> > > > > > +	/*
> > > > > > +	 * We are committed to updating the STE. Ensure the invalidation array
> > > > > > +	 * is visible to concurrent map/unmap threads, and acquire any racing
> > > > > > +	 * IOPTE updates.
> > > > > > +	 *
> > > > > > +	 *  [CPU0]                        | [CPU1]
> > > > > > +	 *                                |
> > > > > > +	 *  change IOPTEs and TLB flush:  |
> > > > > > +	 *  arm_smmu_domain_inv_range() { | arm_smmu_install_old_domain_invs {
> > > > > > +	 *    ...                         |   rcu_assign_pointer(new_invs);
> > > > > > +	 *    smp_mb(); // ensure IOPTEs  |   smp_mb(); // ensure new_invs
> > > > > > +	 *    ...                         |   kfree_rcu(old_invs, rcu);
> > > > > > +	 *    // load invalidation array  | }
> > > > > > +	 *    invs = rcu_dereference();   | arm_smmu_install_ste_for_dev {
> > > > > > +	 *                                |   STE = TTB0 // read new IOPTEs
> > > > > > +	 */
> > > > > > +	smp_mb();
> > > > > 
> > > > > I don't think we need to duplicate this comment three times, you can just
> > > > > refer to the first function (e.g. "See ordering comment in
> > > > > arm_smmu_domain_inv_range()").
> > > > > 
> > > > > However, isn't the comment above misleading for this case?
> > > > > arm_smmu_install_old_domain_invs() has the sequencing the other way
> > > > > around on CPU 1: we should update the STE first.
> > > > 
> > > > I also think we probably want a dma_mb() instead of an smp_mb() for all
> > > > of these examples? It won't make any practical difference but I think it
> > > > helps readability given that one of the readers is the PTW.
> > > 
> > > The only actual dma_wmb() is inside arm_smmu_install_ste_for_dev()
> > > after updating the STE. Adding that line explicitly would help as that
> > > is the only point where we must have the writes actually visible to
> > > the DMA HW.
> > > 
> > > The ones written here as smp_mb() are not required to be DMA ones and
> > > could all be NOP's on UP..
> > 
> > Hmm, I'm not sure about that.
> > 
> > If we've written a new (i.e. previously invalid) valid PTE to a
> > page-table and then we install that page-table into an STE hitlessly
> > (let's say we write the S2TTB field) then isn't there a window before we
> > do the STE invalidation where the page-table might be accessible to the
> > SMMU but the new PTE is still sitting in the CPU?
> 
> Hmm! Yes seems like it.
> 
> However, that's seems like a general bug, if we allocate an
> iommu_domain and immediately hitlessly install it, then there would be
> no dma_wmb() for the page table memory prior to the earliest point the
> HW is able to read the STE.
> 
> What I wrote is is how things are intended to work, so lets fix it
> with this?
> 
> @@ -1173,6 +1173,13 @@ void arm_smmu_write_entry(struct arm_smmu_entry_writer *writer, __le64 *entry,
>         __le64 unused_update[NUM_ENTRY_QWORDS];
>         u8 used_qword_diff;
>  
> +       /*
> +        * Many of the entry structures have pointers to other structures that
> +        * need to have their updates be visible before any writes of the entry
> +        * happen.
> +        */
> +       dma_wmb();

If we do that, can we drop the smp_mb()s from
arm_smmu_install_{old,new}_domain_invs()?

Then the barrier in arm_smmu_domain_inv_range() is kind of irritating
but it demonstrates the need for additional ordering (beyond what we
get from the pgtable code) to ensure that a prior update to the
page-table is ordered before the RCU-protected read of the invalidation
array pointer. So that becomes the special case, with everybody else
relying on a dma_wmb() from either the cmdq insertion or the CD/STE
update.

Will

