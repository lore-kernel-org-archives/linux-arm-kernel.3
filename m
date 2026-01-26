Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8A31E63C8C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 13:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MC23xdaoojkuKtEVxqoiQbpxK48MCVbaGQaUivOcrKU=; b=c961ftKWeHrtP7wtnplXUzRKfV
	NA62q0lpY8a8y08iJuLABs8lix8DRR9f5qYelKpU90Mj82+hyCjaqNeeOBae/mly/3eN2oyg0C8zA
	68i6AD27yM/1995p5awacE1W56F5eoBpspZ2wjX2CFK6P8NyefDpTinPEcPkdb/7rjPyp+BtIr0yR
	yZ0AKXmuiUURY/kYDTjipkkpaeX/l/gPvyNjzjBErXnVuKoQBSUrbcG4MQZEM2UOgbPwRgRZzrR/N
	GsU6aj25bMktWsyE1Mo3uk000jUIVh+Xcy+UCcS69IYaq9hH7XXHqBFC3cYCIDxflEnn6NyI6wwlZ
	zgoyKhdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkMDe-0000000CaRh-1Q8J;
	Mon, 26 Jan 2026 13:01:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkMDc-0000000CaRM-09d2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 13:01:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CDE7B40458;
	Mon, 26 Jan 2026 13:01:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3100BC16AAE;
	Mon, 26 Jan 2026 13:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769432482;
	bh=Xd/THcuRvy2RSO+rSHGNKmY7CloZ2FTMBlhUWMAkVEY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oV3MfgYkjwLHxbQ1rbJwpCxTtGFEQ0kl+4zNojjSerWZvNfYgt/8Kow5f942gxDRG
	 xzTRA4kmjJcK/fcT6XAV1xINY3ph9SRmk4aR2uHWGaTvSkvGW8ADi5ZpkP5FLo/MQI
	 MdQsxZ5uEn+BNS1rScetfi9jONT0FNZka5cCSqOADtVY+t+mng8DxEFXtUXT6XfKVD
	 5xzyPNBZtXsxONYZ30/H58abvczWfXv1kf1aVXMD4peXWM/I/qImaqgHa2VaJlCAem
	 EADMuNJQOOvSXBvH8YrtOM3Na3jto/aJt8MrmpGkCqZ1Q9HqiMMFvVWWbJoPkHqBZ2
	 OoIjrEGbaPmsw==
Date: Mon, 26 Jan 2026 13:01:16 +0000
From: Will Deacon <will@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, jean-philippe@linaro.org,
	robin.murphy@arm.com, joro@8bytes.org, balbirs@nvidia.com,
	miko.lenczewski@arm.com, peterz@infradead.org, kevin.tian@intel.com,
	praan@google.com, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 6/7] iommu/arm-smmu-v3: Add arm_smmu_invs based
 arm_smmu_domain_inv_range()
Message-ID: <aXdlnLLFUBwjT0V5@willie-the-truck>
References: <cover.1766174731.git.nicolinc@nvidia.com>
 <06999367d001283744fd98eb7c1823afd516ce84.1766174731.git.nicolinc@nvidia.com>
 <aXOqVcX9YEC-Ikdt@willie-the-truck>
 <aXOrnMLLzZL9BtRT@willie-the-truck>
 <20260123200327.GF1134360@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123200327.GF1134360@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_050124_122357_7F45FAFC 
X-CRM114-Status: GOOD (  26.68  )
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

On Fri, Jan 23, 2026 at 04:03:27PM -0400, Jason Gunthorpe wrote:
> On Fri, Jan 23, 2026 at 05:10:52PM +0000, Will Deacon wrote:
> > On Fri, Jan 23, 2026 at 05:05:31PM +0000, Will Deacon wrote:
> > > On Fri, Dec 19, 2025 at 12:11:28PM -0800, Nicolin Chen wrote:
> > > > +	/*
> > > > +	 * We are committed to updating the STE. Ensure the invalidation array
> > > > +	 * is visible to concurrent map/unmap threads, and acquire any racing
> > > > +	 * IOPTE updates.
> > > > +	 *
> > > > +	 *  [CPU0]                        | [CPU1]
> > > > +	 *                                |
> > > > +	 *  change IOPTEs and TLB flush:  |
> > > > +	 *  arm_smmu_domain_inv_range() { | arm_smmu_install_old_domain_invs {
> > > > +	 *    ...                         |   rcu_assign_pointer(new_invs);
> > > > +	 *    smp_mb(); // ensure IOPTEs  |   smp_mb(); // ensure new_invs
> > > > +	 *    ...                         |   kfree_rcu(old_invs, rcu);
> > > > +	 *    // load invalidation array  | }
> > > > +	 *    invs = rcu_dereference();   | arm_smmu_install_ste_for_dev {
> > > > +	 *                                |   STE = TTB0 // read new IOPTEs
> > > > +	 */
> > > > +	smp_mb();
> > > 
> > > I don't think we need to duplicate this comment three times, you can just
> > > refer to the first function (e.g. "See ordering comment in
> > > arm_smmu_domain_inv_range()").
> > > 
> > > However, isn't the comment above misleading for this case?
> > > arm_smmu_install_old_domain_invs() has the sequencing the other way
> > > around on CPU 1: we should update the STE first.
> > 
> > I also think we probably want a dma_mb() instead of an smp_mb() for all
> > of these examples? It won't make any practical difference but I think it
> > helps readability given that one of the readers is the PTW.
> 
> The only actual dma_wmb() is inside arm_smmu_install_ste_for_dev()
> after updating the STE. Adding that line explicitly would help as that
> is the only point where we must have the writes actually visible to
> the DMA HW.
> 
> The ones written here as smp_mb() are not required to be DMA ones and
> could all be NOP's on UP..

Hmm, I'm not sure about that.

If we've written a new (i.e. previously invalid) valid PTE to a
page-table and then we install that page-table into an STE hitlessly
(let's say we write the S2TTB field) then isn't there a window before we
do the STE invalidation where the page-table might be accessible to the
SMMU but the new PTE is still sitting in the CPU?

i.e. we can't rely on the command insertion barrier for that.

Will

