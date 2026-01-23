Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9B42D7788E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 17:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d2NVwvwSi35pArDDlEu6pzDU1jdP7XXQibZm4KpstCg=; b=vhu2Z/IEyuQLesZpClZs1fJUgf
	f2DA1ZCSLvmC5X30PtmrvIu2mV1vXvXNgD08AbEzSTW42fKIgG7Mxf5uWVfztPEKImbx5H+HhXRaZ
	BlsUewBgpKVzJL0WlXBFOH6Z6HaTQBy/neNdSWq7l5iQBHhX7NIHcxf2mJ3WbZ/EzEExg12DUDKbS
	OA4uOMHed/DquG22OcBOT4wMwIedhWmB0DkJw9avG9Rt0j3DMLOHdOA6gi2QgmNGx7Oht2KmLl4cK
	CBf8ZblRafjAhOxcsBnWjbSgS+J53eQtEtSZ+tiwFudxPYc29K7TO1qQXati/ZOspsh4T8pIwJ5w/
	3xMsztpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjKgW-00000009GL7-3sST;
	Fri, 23 Jan 2026 17:11:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjKgV-00000009GKy-1b5M
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 17:10:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 81CB160018;
	Fri, 23 Jan 2026 17:10:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8FEAC19422;
	Fri, 23 Jan 2026 17:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769188258;
	bh=lO0XoMvaSm4zmRJXg0BjRuB2G9xf1KKNimz3m5o3Otk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Omjz6D4ZpCbXYm6LHQszcy7YdAn4FZwmhBSVgTULkdCLbyJ5+hiz3M0nO9ghSZQLw
	 wwGIlwsMxs9/S2JlTYEwCHUUHyrKllIPaF69bGdAslFwoRKd/tMkGMq6cZhEnL7qTg
	 QnknNLuoGvFwWY4WJAsQrRffIXke1VG0SRcH3/+j2Q5NIgu/tJXOoZrcY2um6/3l1+
	 /puP1oGW/c87h9I6rv6cWG1RZnM4Um8QGAkpA180f9DDLJtFM6VdKAgUvGnUp0+VI+
	 Xm/f02uK0UQhgD9c3wfID5CkwPLuYNUb1ohUh4VJZFYmNRZvohlhjKfglFnm70+9c9
	 WtWElzomfp5VA==
Date: Fri, 23 Jan 2026 17:10:52 +0000
From: Will Deacon <will@kernel.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jean-philippe@linaro.org, robin.murphy@arm.com, joro@8bytes.org,
	jgg@nvidia.com, balbirs@nvidia.com, miko.lenczewski@arm.com,
	peterz@infradead.org, kevin.tian@intel.com, praan@google.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 6/7] iommu/arm-smmu-v3: Add arm_smmu_invs based
 arm_smmu_domain_inv_range()
Message-ID: <aXOrnMLLzZL9BtRT@willie-the-truck>
References: <cover.1766174731.git.nicolinc@nvidia.com>
 <06999367d001283744fd98eb7c1823afd516ce84.1766174731.git.nicolinc@nvidia.com>
 <aXOqVcX9YEC-Ikdt@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXOqVcX9YEC-Ikdt@willie-the-truck>
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

On Fri, Jan 23, 2026 at 05:05:31PM +0000, Will Deacon wrote:
> On Fri, Dec 19, 2025 at 12:11:28PM -0800, Nicolin Chen wrote:
> > +	/*
> > +	 * We are committed to updating the STE. Ensure the invalidation array
> > +	 * is visible to concurrent map/unmap threads, and acquire any racing
> > +	 * IOPTE updates.
> > +	 *
> > +	 *  [CPU0]                        | [CPU1]
> > +	 *                                |
> > +	 *  change IOPTEs and TLB flush:  |
> > +	 *  arm_smmu_domain_inv_range() { | arm_smmu_install_old_domain_invs {
> > +	 *    ...                         |   rcu_assign_pointer(new_invs);
> > +	 *    smp_mb(); // ensure IOPTEs  |   smp_mb(); // ensure new_invs
> > +	 *    ...                         |   kfree_rcu(old_invs, rcu);
> > +	 *    // load invalidation array  | }
> > +	 *    invs = rcu_dereference();   | arm_smmu_install_ste_for_dev {
> > +	 *                                |   STE = TTB0 // read new IOPTEs
> > +	 */
> > +	smp_mb();
> 
> I don't think we need to duplicate this comment three times, you can just
> refer to the first function (e.g. "See ordering comment in
> arm_smmu_domain_inv_range()").
> 
> However, isn't the comment above misleading for this case?
> arm_smmu_install_old_domain_invs() has the sequencing the other way
> around on CPU 1: we should update the STE first.

I also think we probably want a dma_mb() instead of an smp_mb() for all
of these examples? It won't make any practical difference but I think it
helps readability given that one of the readers is the PTW.

Will

