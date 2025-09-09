Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13566CAC58C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aUR6MINaLidc228Y3Pe9b39dkm5f/0k4vAkzvBNsg4Y=; b=eLd29QMUzqZqnQCrSIX58ufmel
	dPDfiHlp5wWOneRkeH6CEA8c32D2pUPnXGh17+p+al+mFxegIAr+HyeNwYijCKiTKjYacXE8XoQro
	pTZzWXu/S+F/+xo3PQ3HFAsZCA7T229R4uEg8Av65mR3tETTGxn7Nqs0xGD9Uw1OqInZQQgsCZ7m8
	2gmPtKSVCe41WCDclTGRB4KqWB+l+LRgf/FY0FBbwO8/uF478JuZ65LkwLvcfDCeHmGJf4k9uk+jL
	hHavge1X78vJKhiWiLoyZL6RuoBC3ntRGfD/GBN4nmGiq/v3Z2xRdEMPH7C2VlZO9e2v3ND4FFYPu
	BO+kDNag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1yj-00000008sDC-1t7q;
	Tue, 09 Sep 2025 17:18:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvy3T-00000007Ggj-2WzP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 13:06:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5A80F40522;
	Tue,  9 Sep 2025 13:06:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB552C4CEF5;
	Tue,  9 Sep 2025 13:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757423199;
	bh=qD3qU9O4hlrWhqMeW5jgxqVBElkWJH2c2E7/Z1BSu6M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rot2GEcQCJuw19L4oJjHHEmn/gp9gGTbjsbZB15G3pfXwHp2rhi+7dwYum6IPmC88
	 H4+LtAugy5wda6Ay31wKIZFcNznjpD+4lAIlsH7f2MgUBBjmiDvn0DzpydQmoxxqHj
	 9cgknz8DROKFqNQeUjCok2xacqJRa/ip9fuHHipB/rthodIAgM7JruLmjUrgv7bbzC
	 oRvZ9yraynZUF/e5ihhvklsZT2gw7sHZ8QV9TKkJVq8xNOZwH3HfuHtp0G4doHG/tZ
	 akpgbgcMPbQ71HQZUCD0LWST4W747Js1bAV9ZF89mIzPmDsn+OwANl9PQK218ef64j
	 FBvO0AKp0XcgQ==
Date: Tue, 9 Sep 2025 14:06:33 +0100
From: Will Deacon <will@kernel.org>
To: Qinxin Xia <xiaqinxin@huawei.com>
Cc: robin.murphy@arm.com, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	yangyicong@huawei.com, wangzhou1@hisilicon.com,
	prime.zeng@hisilicon.com, xuwei5@huawei.com, fanghao11@huawei.com,
	jonathan.cameron@huawei.com, linuxarm@huawei.com
Subject: Re: [PATCH 1/2] iommu/debug: Add IOMMU page table dump debug facility
Message-ID: <aMAmWQJy_G50xoBf@willie-the-truck>
References: <20250814093005.2040511-1-xiaqinxin@huawei.com>
 <20250814093005.2040511-2-xiaqinxin@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814093005.2040511-2-xiaqinxin@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_060639_662174_6E39556E 
X-CRM114-Status: GOOD (  15.06  )
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

On Thu, Aug 14, 2025 at 05:30:04PM +0800, Qinxin Xia wrote:
> +/**
> + * iova_info_dump - dump iova alloced
> + * @s - file structure used to generate serialized output
> + * @iovad: - iova domain in question.
> + */
> +static int iommu_iova_info_dump(struct seq_file *s, struct iommu_domain *domain)
> +{
> +	struct iova_domain *iovad;
> +	unsigned long long pfn;
> +	unsigned long i_shift;
> +	struct rb_node *node;
> +	unsigned long flags;
> +	size_t prot_size;
> +
> +	iovad = iommu_domain_to_iovad(domain);
> +	if (!iovad)
> +		return -ENOMEM;
> +
> +	i_shift = iova_shift(iovad);
> +
> +	/* Take the lock so that no other thread is manipulating the rbtree */
> +	spin_lock_irqsave(&iovad->iova_rbtree_lock, flags);
> +	assert_spin_locked(&iovad->iova_rbtree_lock);
> +
> +	for (node = rb_first(&iovad->rbroot); node; node = rb_next(node)) {
> +		struct iova *iova = rb_entry(node, struct iova, node);
> +
> +		if (iova->pfn_hi <= iova->pfn_lo)
> +			continue;
> +
> +		for (pfn = iova->pfn_lo; pfn <= iova->pfn_hi; ) {
> +			prot_size = domain->ops->dump_iova_prot(s, domain, pfn << i_shift);
> +			pfn = ((pfn << i_shift) + prot_size) >> i_shift;
> +		}
> +	}
> +
> +	spin_unlock_irqrestore(&iovad->iova_rbtree_lock, flags);

Why is the IOVA rbtree lock sufficient for serialising the page-table
accesses made by ->dump_iova_prot()? I don't see anything here that
prevents the walker walking into page-table pages that are e.g. being
freed or manipulated concurrently.

Will

