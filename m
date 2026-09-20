Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69182C982D0
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 07:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JykXcVLQ+SODnQl6eDwSo0pjarUst5H1xKMW2Gg1dG0=; b=x2OOBYUZHTQipxB45pT3VVlxuK
	e1NsYHW4PxfqgRlcpnTF+3IPnWYmzI5s0djGC8+OIjHMPjlmhoXi8uzoUdchdwnfys3cq9Ryij3IL
	qV3+Z0NfFdgrHXC+ilnVBDhAJ1COuxHN8BXLMEWcr2sI6Jc3+MyFeLyTS1+F8FInMDDCX8P7AgcGv
	DBDgsOhe/+ZsBzSqcafzQ+10txkr1Zfm5aFFl9186ox3kPsHhuDRJrmHC7yUVOEk7cvi2lfztcEdY
	WyPILjKPS+WrYnJZJ/jkruTpmw5tN/Q6aiSswBq8Ls3oRPqpeWHvFH1RbovrPzrubWuPXtmN/COe8
	zVpuAufA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Bus-0000000H2G1-2rtF;
	Sun, 20 Sep 2026 07:24:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Buq-0000000H2Fu-49k4
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 07:24:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1BAEB60136;
	Sun, 20 Sep 2026 07:24:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 395D11F000FF;
	Sun, 20 Sep 2026 07:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789889087;
	bh=JykXcVLQ+SODnQl6eDwSo0pjarUst5H1xKMW2Gg1dG0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=H7lGpA8oxCwUoMdVQLZKlRanbrT2e3x3tiI2Lv/9D2mNfO7SsqLrfSgi9mj5cwr4l
	 p/4S240ofW0LQ/NXHEvBfaWJi8OayARjZWNnird0Y+O2aaUwfXpcQWE5mO42NMEVTe
	 yo6Y+i71T0oRF/zB7055vZvPJ3YFrVP1wXaCHGKiREh3L3Q9S80Jn8MvJplBWtkvWt
	 pEWj19lkvepnBXtCbeLK6jiB5c9mMO2VJaFTTc18K22kHyz5VVz+S2uP0IbcxE5lUd
	 gK6IbamepYGVCW0X/R6kr1+rM/esDudpV4pxveg4hCltq1t23VXK3R+K0+ibmPWLTz
	 XeoqLo1F/STZg==
X-Mailer: emacs 31.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-coco@lists.linux.dev, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	Marc Zyngier <maz@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Will Deacon <will@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	"T.J. Mercier" <tjmercier@google.com>
Subject: Re: [PATCH v6 7/9] dma-buf: system_heap: Enforce shared-granule
 alignment for cc-shared buffers
In-Reply-To: <20260919213531.GI11599@ziepe.ca>
References: <aq1V3oeDdvXobt8J@arm.com>
 <97c30fce-9bda-4c61-b1b9-10297b89c8d9@amd.com>
 <20260918153642.GD11599@ziepe.ca> <yq5atsnl47c6.fsf@kernel.org>
 <20260919213531.GI11599@ziepe.ca>
Date: Sun, 20 Sep 2026 12:54:38 +0530
Message-ID: <yq5a8q4ws7ux.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
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

Jason Gunthorpe <jgg@ziepe.ca> writes:

> On Sat, Sep 19, 2026 at 08:27:29PM +0530, Aneesh Kumar K.V wrote:
>  
>> +static struct page *system_heap_alloc_order(unsigned int order, gfp_t flags,
>> +					    bool cc_shared)
>> +{
>> +	struct cc_shared_pages mem;
>> +
>> +	if (!cc_shared)
>> +		return alloc_pages(flags, order);
>> +
>> +	/* The shared granule can raise the actual allocation order. */
>> +	flags |= __GFP_COMP;
>> +	if (alloc_cc_shared_pages(flags, PAGE_SIZE << order, &mem))
>> +		return NULL;
>
> Oh yeah that's surprisingly easy because of how this loop works with
> order
>
> Makes sense to me
>
>> int alloc_cc_shared_pages_node(int nid, gfp_t gfp, size_t requested,
>> 			       struct cc_shared_pages *mem)
>
> This argument order is a little weird from mm norms?
>

That is similar to

static inline struct page *alloc_pages_node_noprof(int nid, gfp_t gfp_mask,
						   unsigned int order)

-aneesh

