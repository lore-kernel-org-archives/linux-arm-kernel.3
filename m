Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35FCBC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 10:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uQ5JYntVPCplUTY3sEfB1TwWkLv13hCX8Prz1WJTkWY=; b=ThkYwFjbSCNPfD4XY4s9hGPFWd
	7639zcf7cITRhK6rdLRQn/YNb22QhWYRyVUmJ0nEBLTTeu7/YHcFKtzBpPwDOhdyNsaTz6dOnOsEZ
	X2+5slpg66KEZRCjjpNr/g8IIXsoyX/MNvc198iXtpXvB5KDWBbDM0W3Ta8rtoyGsJ2mlqDFePfeF
	t9AQkuYoS9YjLsfQZisIKedg3DVyxzlRus3KGtiSXnKy3YSYBR5rs2Mn7s+iryfrDsqQb9LiPHKnV
	gV0iUdjNTSwkWtk50Lfl1qEgsmcocgNxJv+yWXwii2SQSe6hy7iV1FpfigG3s78ndpqf2LRtlCjAJ
	PswJPwag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9KP9-00000007vPO-2dq7;
	Wed, 23 Sep 2026 10:40:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9KP5-00000007vOh-37vV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 10:40:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 074E7143D;
	Wed, 23 Sep 2026 03:40:39 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 789533F86C;
	Wed, 23 Sep 2026 03:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790160042; bh=M87HFnkQVfHN19+6QwqoNSTVdvNLwPr786eNk6QJp9k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hd5V7b2lJCRJq/Ms8s/d8tR11f/qhMBk7Oe4j58RXcp6qt6aQwikHkHXDqQsG6y9I
	 WrsMl87aoacM9e9KjV+HavYIIvBZEd/CGC6r/SsKz0KRi08xCTqHV7X/fKTG0AIXAW
	 zPWUJE30Iut++MHgK+DBrex+Gg1pDcKlkP4p7uMQ=
Date: Wed, 23 Sep 2026 11:40:36 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
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
Message-ID: <arOspFxWZ1DjgcAr@arm.com>
References: <20260921144847.501151-1-aneesh.kumar@kernel.org>
 <20260921144847.501151-3-aneesh.kumar@kernel.org>
 <arKsFofudnTYpXj1@arm.com>
 <yq5aik3w344o.fsf@kernel.org>
 <arOfD6syXOgQhZYA@arm.com>
 <yq5a5wzw2ree.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5a5wzw2ree.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_034043_880619_B747536C 
X-CRM114-Status: GOOD (  30.20  )
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

On Wed, Sep 23, 2026 at 03:58:25PM +0530, Aneesh Kumar K.V wrote:
> Catalin Marinas <catalin.marinas@arm.com> writes:
> > On Wed, Sep 23, 2026 at 11:23:27AM +0530, Aneesh Kumar K.V wrote:
> >> Catalin Marinas <catalin.marinas@arm.com> writes:
> >> > On Mon, Sep 21, 2026 at 08:18:36PM +0530, Aneesh Kumar K.V (Arm) wrote:
> >> >> +int alloc_cc_shared_pages_node(int nid, gfp_t gfp,
> >> >> +		size_t requested, struct cc_shared_pages *mem)
> >> >> +{
> >> >> +	struct cc_shared_layout layout;
> >> >> +	struct page *page;
> >> >> +	unsigned int order;
> >> >> +	bool zero = gfp & __GFP_ZERO;
> >> >> +	int ret;
> >> >> +
> >> >> +	if (!mem)
> >> >> +		return -EINVAL;
> >> >> +
> >> >> +	ret = cc_shared_calc_layout(requested, &layout);
> >> >> +	if (ret)
> >> >> +		return ret;
> >> >> +
> >> >> +	order = get_order(layout.shared_size);
> >> >> +	if (order > MAX_PAGE_ORDER)
> >> >> +		return -EINVAL;
> >> >> +
> >> >> +	/*
> >> >> +	 * State transitions require a linear-map address and may modify memory.
> >> >> +	 * Allocate from low memory and defer requested zeroing until afterwards.
> >> >> +	 */
> >> >> +	gfp &= ~(__GFP_HIGHMEM | __GFP_ZERO);
> >> >> +	if (nid == NUMA_NO_NODE)
> >> >> +		page = alloc_pages(gfp, order);
> >> >> +	else
> >> >> +		page = alloc_pages_node(nid, gfp, order);
> >> >> +	if (!page)
> >> >> +		return -ENOMEM;
> >> >> +
> >> >> +	ret = cc_make_shared(page_address(page), layout.shared_size);
> >> >> +	if (ret) {
> >> >> +		if (!cc_make_private(page_address(page), layout.shared_size))
> >> >> +			__free_pages(page, order);
> >> >> +		else
> >> >> +			pr_warn_ratelimited("leaking %zu bytes with uncertain shared state\n",
> >> >> +					    layout.shared_size);
> >> >> +		return ret;
> >> >> +	}
> >> >> +
> >> >> +	if (zero)
> >> >> +		memset(page_address(page), 0, layout.shared_size);
> >> >
> >> > Does the memset() post sharing logic work for pKVM as well? If nothing
> >> > clears it, we have a small window where guest data is leaked to the
> >> > host.
> >> >
> >> > Is there a case where we *do not* need the memory cleared? If not, maybe
> >> > we can move the logic in the arch set_memory_decrypted().
> >> >
> >> 
> >> I don't think every architecture or platform can unconditionally zero
> >> memory in set_memory_decrypted(). Some callers may need to share valid
> >> contents with the host.
> >
> > Is there any? That would be a bad assumptions in the caller. Most
> > set_memory_* backends don't preserve the content as they change the
> > encryption key. So properly written code shouldn't rely on this unless
> > it knows specifically it's only running on pKVM for example. The only
> > use-case I see to avoid explicit zeroing is when the caller doesn't care
> > about the page initialisation and wants to save some cycles. The
> > encryption key change would take care of the security aspect.
> >
> 
> I checked this, and you are right. We cannot expect the contents to
> remain valid across sharing; set_memory_decrypted() is destructive in
> that sense. Since pKVM does not rely on memory encryption, it needs to
> zero the memory unconditionally in set_memory_decrypted() to avoid
> exposing existing guest data. Other CoCo implementations may omit the
> memset(0). We still need to zero the memory when the caller requests
> __GFP_ZERO, where the memory location is expected to be zero.
> 
> We could either zero the memory unconditionally or pass a flag to allow
> this micro-optimization. We would also need to audit all call paths to
> avoid redundant zeroing after set_memory_decrypted(). Let me know if you
> have a preference for either approach.

The simplest is probably to always zero in the backend and ignore
__GFP_ZERO to the allocator. But it's probably only marginally smaller
than passing a CC_SHARED_ZERO flag down. Get codex to try this as well
and compare the diffstat.

There's an argument for the flag approach from a performance perspective
(avoid zeroing unnecessarily) but not sure how much it matters in
practice.

-- 
Catalin

