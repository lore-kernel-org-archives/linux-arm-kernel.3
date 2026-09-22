Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0E21C98302
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 16:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=58sXfyb0nX377cUR/X5f1yC05yxG1FkjjSAo7vPwMXU=; b=COaaZU8jWMLtnFvCkmOanR/B2J
	98FfthYaSPFKRRGqhfk/ZrTtaTKVqlQLeiOhGMCn0nvclbDzSGFBjQPCwMaoQeWQG19C4iwpM1ksp
	gEQXo0UD20X2Ln7juSDu7vj6afIzCeCw2gqSs8ZNJ9Rz5JtyVvVh08pxKwHWVnTnQ8cjJSuDZ9I1x
	nJViCz9dyLIt5+9+2YMcOmga1XOclZLFujXxdxR+EiDiS+GCutZFdNMIetbJ3izHKj8TygsyikQfD
	/jJFXyzVvl5w/EKJaGRVPF5bzb7gTzGTAfponUwbaBuTdXyyVh99Eb4fYtvqA5c+PLAAm+P52IeQX
	JJNb7eJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x93Jm-000000062qI-3y46;
	Tue, 22 Sep 2026 16:26:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x93Jk-000000062pQ-2N8i
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 16:26:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 177FF1576;
	Tue, 22 Sep 2026 09:26:00 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 06CF23F632;
	Tue, 22 Sep 2026 09:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790094363; bh=ayic+nVzRT7jF2h19D33qb2NxY0nfyFpS1c2IauCEkw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vLKpHlXy9TeAxplzn8LuOxnhs+NZZT08I8jSb7+j1I6L64gZFqCGnchXfZ3Dqibh8
	 eQMv80pCWNlnv73z0GmxiYSywlJm2UuyVrhWN9MyheshF5MMnKprwZkReiNsEO3hTc
	 KddnGGEGanHe0MFeVvE3aGvk5G7QNuyyTWu9q8xw=
Date: Tue, 22 Sep 2026 17:25:58 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>,
	christian.koenig@amd.com, Jason Gunthorpe <jgg@ziepe.ca>,
	Joerg Roedel <joro@8bytes.org>, Marc Zyngier <maz@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Steven Price <steven.price@arm.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thomas Gleixner <tglx@kernel.org>, Will Deacon <will@kernel.org>,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	linux-media@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [RFC PATCH v7 02/13] mm: Add an allocator for CoCo shared memory
Message-ID: <arKsFofudnTYpXj1@arm.com>
References: <20260921144847.501151-1-aneesh.kumar@kernel.org>
 <20260921144847.501151-3-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921144847.501151-3-aneesh.kumar@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_092604_648476_E59E0E19 
X-CRM114-Status: GOOD (  14.86  )
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

On Mon, Sep 21, 2026 at 08:18:36PM +0530, Aneesh Kumar K.V (Arm) wrote:
> +int alloc_cc_shared_pages_node(int nid, gfp_t gfp,
> +		size_t requested, struct cc_shared_pages *mem)
> +{
> +	struct cc_shared_layout layout;
> +	struct page *page;
> +	unsigned int order;
> +	bool zero = gfp & __GFP_ZERO;
> +	int ret;
> +
> +	if (!mem)
> +		return -EINVAL;
> +
> +	ret = cc_shared_calc_layout(requested, &layout);
> +	if (ret)
> +		return ret;
> +
> +	order = get_order(layout.shared_size);
> +	if (order > MAX_PAGE_ORDER)
> +		return -EINVAL;
> +
> +	/*
> +	 * State transitions require a linear-map address and may modify memory.
> +	 * Allocate from low memory and defer requested zeroing until afterwards.
> +	 */
> +	gfp &= ~(__GFP_HIGHMEM | __GFP_ZERO);
> +	if (nid == NUMA_NO_NODE)
> +		page = alloc_pages(gfp, order);
> +	else
> +		page = alloc_pages_node(nid, gfp, order);
> +	if (!page)
> +		return -ENOMEM;
> +
> +	ret = cc_make_shared(page_address(page), layout.shared_size);
> +	if (ret) {
> +		if (!cc_make_private(page_address(page), layout.shared_size))
> +			__free_pages(page, order);
> +		else
> +			pr_warn_ratelimited("leaking %zu bytes with uncertain shared state\n",
> +					    layout.shared_size);
> +		return ret;
> +	}
> +
> +	if (zero)
> +		memset(page_address(page), 0, layout.shared_size);

Does the memset() post sharing logic work for pKVM as well? If nothing
clears it, we have a small window where guest data is leaked to the
host.

Is there a case where we *do not* need the memory cleared? If not, maybe
we can move the logic in the arch set_memory_decrypted().

-- 
Catalin

