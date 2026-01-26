Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61973D19502
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 18:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7oNK4X/aQydXaXCW6a2pZgAKJHRFY11t3UiSIkrlWMk=; b=3y6F6k12hpXISWY/NXIctERs07
	2Lz4wLA+rBJofYqZqm1y2IKEf9txf6jUjLTgbQeTvfcAwK4KP/wAOo/awa8KOJt86/2svApuIP5NP
	vNrc7anoffeOcXshYlR/IR+tcHRTXjpR1h7NygXuJunrc6yt9vxHaN+6gv1OVNFGjknz+L/GYz1B2
	448kFqIQ7xDJW7s++Yj/4+nwROwsIq4+HDFz+xnW/BV2YHgdxauYb67Eg0bGaCpVRUo2xM56Sw+DU
	68R1Had+UccHYuY24gJGYdlXner0Oz3TvFNdwot/8/t7FhKt48cW9Q+ijFq+6pHVVMOxvNZ99b/Tt
	GY1h0RBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkRlS-0000000D6rO-3Em7;
	Mon, 26 Jan 2026 18:56:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkRlR-0000000D6rI-1YTZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 18:56:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 73B9F60097;
	Mon, 26 Jan 2026 18:56:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C4C6C116C6;
	Mon, 26 Jan 2026 18:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769453800;
	bh=RK0yLvS/H1dCapN7yhJ4VLO4e8zez9xvVOjncJv7jew=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dvM4iFxr+f/wFDXQSK8NT83OzplMeoeF4/k19OjEM06oT8+iQXYl7iJGwezwXkux7
	 QK9QLjeL96W/imrxoz8n28+EQ8f8XuPNr6fttDnG4TY42YtGSb9QawAX7sB2Mtbxzj
	 5/CLclzqbuAQWMa8QW3gv1sSLVDRik0j7OTj4rGyQbxPJkq7AQHX5djpeth2WNfuu3
	 smQVrp7XawN65z3ZtetJA9tH09cwKwBsBhrcoSAnWIDXnFwpZHXDCcGFQXQA7wQcxA
	 jmFWVX1w1YzMK8ozhl/s58H4RlaW+lhkbgdY7oSnBmoAIUCuzAEAe3K+U5Bk564X0/
	 ga1sWg732h4Ww==
Date: Mon, 26 Jan 2026 18:56:34 +0000
From: Will Deacon <will@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, jean-philippe@linaro.org,
	robin.murphy@arm.com, joro@8bytes.org, balbirs@nvidia.com,
	miko.lenczewski@arm.com, peterz@infradead.org, kevin.tian@intel.com,
	praan@google.com, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 6/7] iommu/arm-smmu-v3: Add arm_smmu_invs based
 arm_smmu_domain_inv_range()
Message-ID: <aXe44sLQ3yUYiS9H@willie-the-truck>
References: <cover.1766174731.git.nicolinc@nvidia.com>
 <06999367d001283744fd98eb7c1823afd516ce84.1766174731.git.nicolinc@nvidia.com>
 <aXOqVcX9YEC-Ikdt@willie-the-truck>
 <aXOrnMLLzZL9BtRT@willie-the-truck>
 <20260123200327.GF1134360@nvidia.com>
 <aXdlnLLFUBwjT0V5@willie-the-truck>
 <20260126152019.GK1134360@nvidia.com>
 <aXeQC3GjUgafuOi-@willie-the-truck>
 <20260126160940.GM1134360@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126160940.GM1134360@nvidia.com>
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

On Mon, Jan 26, 2026 at 12:09:40PM -0400, Jason Gunthorpe wrote:
> On Mon, Jan 26, 2026 at 04:02:19PM +0000, Will Deacon wrote:
> > On Mon, Jan 26, 2026 at 11:20:19AM -0400, Jason Gunthorpe wrote:
> > > On Mon, Jan 26, 2026 at 01:01:16PM +0000, Will Deacon wrote:
> > > > On Fri, Jan 23, 2026 at 04:03:27PM -0400, Jason Gunthorpe wrote:
> > > > > On Fri, Jan 23, 2026 at 05:10:52PM +0000, Will Deacon wrote:
> > > > > > On Fri, Jan 23, 2026 at 05:05:31PM +0000, Will Deacon wrote:
> > > > > > > On Fri, Dec 19, 2025 at 12:11:28PM -0800, Nicolin Chen wrote:
> > > > > > > > +	/*
> > > > > > > > +	 * We are committed to updating the STE. Ensure the invalidation array
> > > > > > > > +	 * is visible to concurrent map/unmap threads, and acquire any racing
> > > > > > > > +	 * IOPTE updates.
> > > > > > > > +	 *
> > > > > > > > +	 *  [CPU0]                        | [CPU1]
> > > > > > > > +	 *                                |
> > > > > > > > +	 *  change IOPTEs and TLB flush:  |
> > > > > > > > +	 *  arm_smmu_domain_inv_range() { | arm_smmu_install_old_domain_invs {
> > > > > > > > +	 *    ...                         |   rcu_assign_pointer(new_invs);
> > > > > > > > +	 *    smp_mb(); // ensure IOPTEs  |   smp_mb(); // ensure new_invs
> > > > > > > > +	 *    ...                         |   kfree_rcu(old_invs, rcu);
> > > > > > > > +	 *    // load invalidation array  | }
> > > > > > > > +	 *    invs = rcu_dereference();   | arm_smmu_install_ste_for_dev {
> > > > > > > > +	 *                                |   STE = TTB0 // read new IOPTEs
> > > > > > > > +	 */
> > > > > > > > +	smp_mb();
> 
> > If we do that, can we drop the smp_mb()s from
> > arm_smmu_install_{old,new}_domain_invs()?
> 
> I suppose so, but domain attach isn't a performance path so it depends
> on your preference for strict pairing of barriers. Currently the two
> smp_mbs() are paired. Can we reliably pair smp_mb() with dma_wmb()?
> Are you happy with that clarity?

Yeah, I think that's ok.

> My view is attach isn't a performance path, so having extra barriers
> is fine if it helps understandability.

I think that the more barriers we have, the harder the code is to
understand so I would prefer just to have the smp_mb() for the
write->read case in arm_smmu_domain_inv_range() along with a comment
explaining why it's needed.

I think that also means that my concern about the old comments on the
other patch largely disappears.

Will

