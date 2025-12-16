Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BD53D5E15A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 14:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ecQwlIPIEEMHq+TlA0ByuO477sNp6SzZcL6O+91ZGv0=; b=IuYMLY0LxT8n6H8eDrYSaTLueM
	ZClK8MXmtm0N9KKiKVjEJcL5JDwHVhaOXlOe2mwXfjt5osNu+mn2qb0xG0iTW1B/gufVcZidCadHC
	NuiU4WsBUqGNvXael60JPYFc9ovAMiQYWE9btlpUXw+MDIIwM5poh8vGFGZaxOal/9/VVt6nCSU1Q
	TJL5JBgdjw1OZu60CP2G4Fj7hH/rOGp8eCv5BFtg7Cm1n01jFgOxmkOl+7MZgn5rhoaIxfMYO5eg9
	CJse2oWQAbEtRYDcvzlkcNkuPSKpDFNo+cQQp1j1oGxv1YTa/rGnP+6eg5azS6BjNC0CSIhdDVpOM
	Q+AL2cyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVVew-00000005Jaz-0xYP;
	Tue, 16 Dec 2025 14:04:14 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVVev-00000005Jar-0rgT
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 16 Dec 2025 14:04:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ecQwlIPIEEMHq+TlA0ByuO477sNp6SzZcL6O+91ZGv0=; b=E14EAKwpFV46Ri2BNWch58rp31
	+CkrtrYgr/Oxignf0HxEnkl4iUCkeiaV4cHipWFGGU3Y2VDoh1GvyJ88doAjm0gXGbVybwztUs84X
	oQftqBtzNrUvImpopFHagTLMhbDVn7cD1WpmV2Xw+dUWBsRdIYJIWmkX5d38BeAHPhRJ8z0InsL0u
	jpEHxFK/7QBu8WMkPVrYi+H+dtFand8+uqyrvaIj6t+JrJK92pmSkkWAnnuHJ3rDTiB1bKco2hUH4
	xhhIck1d5HEf+dre2Q9JqAuthY4I0od4/pnP/4raIJfCW0j61G3ME822342HmH6nPMmmMGiU13sQ9
	xXRV/30w==;
Received: from 2001-1c00-8d85-5700-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:5700:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVVet-00000003Msn-0Fmj;
	Tue, 16 Dec 2025 14:04:11 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 947A2300339; Tue, 16 Dec 2025 15:04:10 +0100 (CET)
Date: Tue, 16 Dec 2025 15:04:10 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, will@kernel.org,
	jean-philippe@linaro.org, robin.murphy@arm.com, joro@8bytes.org,
	balbirs@nvidia.com, miko.lenczewski@arm.com, kevin.tian@intel.com,
	praan@google.com, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 6/7] iommu/arm-smmu-v3: Add arm_smmu_invs based
 arm_smmu_domain_inv_range()
Message-ID: <20251216140410.GV3707837@noisy.programming.kicks-ass.net>
References: <cover.1765850465.git.nicolinc@nvidia.com>
 <f4261c5b30ce3c6942470433033d4933ec5eef3e.1765850465.git.nicolinc@nvidia.com>
 <20251216090926.GR3707837@noisy.programming.kicks-ass.net>
 <20251216135613.GB6079@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251216135613.GB6079@nvidia.com>
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

On Tue, Dec 16, 2025 at 09:56:13AM -0400, Jason Gunthorpe wrote:
> On Tue, Dec 16, 2025 at 10:09:26AM +0100, Peter Zijlstra wrote:
> > Anyway, if I understand the above correctly, the smb_mb() is for:
> > 
> >   arm_smmu_domain_inv_range() 		arm_smmu_install_new_domain_invs()
> > 
> >     [W] IOPTE				  [Wrel] smmu_domain->invs
> >     smp_mb()				  smp_mb()
> >     [Lacq] smmu_domain->invs		  [L] IOPTE
> > 
> > Right? But I'm not sure about your 'HW sees the new IOPTEs' claim;
> 
> Yes, the '[L] IOPTE' would be a DMA from HW.
> 
> > that very much depend on what coherency domain the relevant hardware
> > plays in. For smp_mb() to work, the hardware must be in the ISH
> > domain, while typically devices are (if I remember my arrrrgh64
> > correctly) in the OSH.
> 
> The '[W] IOPTE' sequence already includes a cache flush if the
> inner/outer sharable are not coherent. If a cache flush was required
> then the smp_mb() must also order it, otherwise it just has to order
> the store.
> 
> The page table table code has always relied on this kind of ordering
> with respect to DMA working, it would be completely broken if the DMA
> does not order with the barriers.
> 
> For example:
> 
>             CPU0                         CPU1
>    store PMD
>                                         read PMD
>    store PTE 1                          store PTE 2
>    	     				dma memory barrier
>                                         device reads 2
>    dma memory barrier
>    device reads 1

But here you have dma_mb(), which is dmb(osh).

> The 'device reads 2' thread must be guarenteed that the HW DMA
> observes the PMD stored by CPU0. It relies on the same kind of
> explicit cache flushing and barriers as this patch does.

OK, but then please include that in the comment, because using smp_*()
barriers and talking about devices sets of alarm bells.

