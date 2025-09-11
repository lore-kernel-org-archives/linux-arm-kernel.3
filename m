Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8E21CAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 14:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OVYfwvyEDWOmpr9aFfCMjfBeWdD2UHdp2oHYmW+oJNM=; b=KYAn2yZ8iHB/AVcnehvk1sGU00
	ot0qXUFoNKRyEEMts0Lc3QvLpYUhXt5NAjuLX862SWdoQkUAPRW58NyoGUs39wauqBUqVSNtFDfhq
	VOZd//Yqg4Pdz6LVwa39zwvKELCzl37ja0zGVbWtMqs/Uhjasis/KzzfGop4L/1KXvYZv3tL7kw0a
	rjxCo3ODGc9ihVh8XS1Y77Y0x1ZvunfQHh3l+Nf/YcKGciAt2Th2iIbz8h8d+I7Ma3KhqBb+UN4zT
	qPGlcGjVrT6zO1h10KnCo7EZfOJw+ISh0vjtchsvZ09pW71pSUX0G6CgiuB9VeiZ9VNq2p6zBXwLm
	QKyXZRCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwikp-00000003ieM-0Pnw;
	Thu, 11 Sep 2025 14:58:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwikm-00000003icF-2sUB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 14:58:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F2A1F40787;
	Thu, 11 Sep 2025 14:58:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0211C4CEF0;
	Thu, 11 Sep 2025 14:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757602707;
	bh=HeodYYa2ARM+3jXZTHDptckWgA9wcPV5Pp4/+zghwa0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N4ppPzU/92e5jZEtYxQNnLuvVF4YdjiL4YbwnvjtjiIycgyZYLN5zlWHBq8nJVmqF
	 SOxopzS4DbaUTOTh0oiaJgH5oQa+1/6RNfyYdFs2eexO3SOTRBBZinG1/pxHmQXNp6
	 nwcQ8xqMeu2KACfIyIuaI18EDltZX6IOC9wPpnFJj1X88p8d4g9Zipamjb7jIDjQIl
	 WuyN8unPafOXY3SDoPZDNj0Yb8VEZ0RVar3YwXdirG3i2T2SAm8bA4c45KJMjN5N8M
	 toG6ci2Kl/h83ydrEq0j7Uifr3Kh+qCygXA8weT7KpgViBiNHB7lkHcuHUC/BIRgrj
	 3UgtRHcMT2SBQ==
Date: Thu, 11 Sep 2025 15:58:22 +0100
From: Will Deacon <will@kernel.org>
To: Qinxin Xia <xiaqinxin@huawei.com>
Cc: robin.murphy@arm.com, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	yangyicong@huawei.com, wangzhou1@hisilicon.com,
	prime.zeng@hisilicon.com, xuwei5@huawei.com, fanghao11@huawei.com,
	jonathan.cameron@huawei.com, linuxarm@huawei.com
Subject: Re: [PATCH 1/2] iommu/debug: Add IOMMU page table dump debug facility
Message-ID: <aMLjjl4nsBuQML3Y@willie-the-truck>
References: <20250814093005.2040511-1-xiaqinxin@huawei.com>
 <20250814093005.2040511-2-xiaqinxin@huawei.com>
 <aMAmWQJy_G50xoBf@willie-the-truck>
 <534119b8-8221-4991-b308-05e8d5918aca@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <534119b8-8221-4991-b308-05e8d5918aca@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_075828_743150_35C3AB2E 
X-CRM114-Status: GOOD (  21.09  )
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

On Wed, Sep 10, 2025 at 10:58:09AM +0800, Qinxin Xia wrote:
> 
> 
> On 2025/9/9 21:06:33, Will Deacon <will@kernel.org> wrote:
> > On Thu, Aug 14, 2025 at 05:30:04PM +0800, Qinxin Xia wrote:
> > > +/**
> > > + * iova_info_dump - dump iova alloced
> > > + * @s - file structure used to generate serialized output
> > > + * @iovad: - iova domain in question.
> > > + */
> > > +static int iommu_iova_info_dump(struct seq_file *s, struct iommu_domain *domain)
> > > +{
> > > +	struct iova_domain *iovad;
> > > +	unsigned long long pfn;
> > > +	unsigned long i_shift;
> > > +	struct rb_node *node;
> > > +	unsigned long flags;
> > > +	size_t prot_size;
> > > +
> > > +	iovad = iommu_domain_to_iovad(domain);
> > > +	if (!iovad)
> > > +		return -ENOMEM;
> > > +
> > > +	i_shift = iova_shift(iovad);
> > > +
> > > +	/* Take the lock so that no other thread is manipulating the rbtree */
> > > +	spin_lock_irqsave(&iovad->iova_rbtree_lock, flags);
> > > +	assert_spin_locked(&iovad->iova_rbtree_lock);
> > > +
> > > +	for (node = rb_first(&iovad->rbroot); node; node = rb_next(node)) {
> > > +		struct iova *iova = rb_entry(node, struct iova, node);
> > > +
> > > +		if (iova->pfn_hi <= iova->pfn_lo)
> > > +			continue;
> > > +
> > > +		for (pfn = iova->pfn_lo; pfn <= iova->pfn_hi; ) {
> > > +			prot_size = domain->ops->dump_iova_prot(s, domain, pfn << i_shift);
> > > +			pfn = ((pfn << i_shift) + prot_size) >> i_shift;
> > > +		}
> > > +	}
> > > +
> > > +	spin_unlock_irqrestore(&iovad->iova_rbtree_lock, flags);
> > 
> > Why is the IOVA rbtree lock sufficient for serialising the page-table
> > accesses made by ->dump_iova_prot()? I don't see anything here that
> > prevents the walker walking into page-table pages that are e.g. being
> > freed or manipulated concurrently.
> > 
>  Thank you for catching this critical race condition.I will fix this in
>  next version. And,Jason suggests putting io_ptdump on top of iommu pt.
>  What do you think?

I guess it depends on whether or not you want to tie this debug feature
to drivers that support the new page-table stuff.

Will

