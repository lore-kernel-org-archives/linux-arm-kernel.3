Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D17BEC982D8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 14:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hwMYKiZPm2y3OBoj9z4kIBVQqZuXs87GFGfojHIy3GI=; b=CFNrJHiddQt5ObyeEvEPnYq9l6
	xg9fRgA7tlMVlWXmHwRjWSZ5eISL1CYE4Lxb3M+LP3Fe4JFrG5y64575z+tMeRCGbWhQB/n9VxQIL
	fcdwHwX+1RJONfaw19+31sbopvc4UUTm1J35/v0vl8ntfHJUne1VcfCTF/jMEK9d9alzNC3JpwK4g
	6bfGmOXH/wulikBpLqK5iPHF30mQ/GmQmLeey2duQ1pI/XGDXQpntASDanAD0xj89EycJnAaPdtPm
	Ii3M8T7hO/RmIPtzQjHRGZ+/Gc3CsudVl0xhMUGbRbip0txilGeQHZVsCkv8laZJ+f0HJympjN+h/
	NSk98vTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7wVa-0000000GPJW-0jC0;
	Sat, 19 Sep 2026 14:57:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7wVX-0000000GPJJ-3qs8
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Sep 2026 14:57:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0A34960AA4;
	Sat, 19 Sep 2026 14:57:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 625771F000FF;
	Sat, 19 Sep 2026 14:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789829858;
	bh=hwMYKiZPm2y3OBoj9z4kIBVQqZuXs87GFGfojHIy3GI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=UBShnuzNZLY5og2swhM4JcZuGUbhPH621d//TSqzd2LqOAKbXceBslQVOOgg8miXi
	 zdz+Y5QD+3s7s2Fs1KrPH3/QXoactcKBWC5ACpGPxZb8CQ16JfU6wGGR06sSjXryeg
	 wwh4ijWHZolW5VujXMK+b8lwaC86kFlNficqje1oRsYLXNZQ89AqY5ppFc8RNoPnQO
	 3qZaGA3VE/rpzlRAsvtuTOcJskD1lONFY2tmQMpwPOxmNg3aONxm53/ef2NcoZyAcI
	 A8gpYWaej6HgpdnU0VZtcKQFzTjivjVP+dZP/yiadqBmUZYuApvepJ6NreVJ/fcaVm
	 a5i1GjcIAVf0Q==
X-Mailer: emacs 31.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>,
	Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
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
In-Reply-To: <20260918153642.GD11599@ziepe.ca>
References: <aq1V3oeDdvXobt8J@arm.com>
 <97c30fce-9bda-4c61-b1b9-10297b89c8d9@amd.com>
 <20260918153642.GD11599@ziepe.ca>
Date: Sat, 19 Sep 2026 20:27:29 +0530
Message-ID: <yq5atsnl47c6.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

> On Fri, Sep 18, 2026 at 05:23:32PM +0200, Christian K=C3=B6nig wrote:
>> On 9/18/26 17:16, Catalin Marinas wrote:
>> > First, none of the DMA-BUF maintainers have been cc'ed. It might be fi=
ne
>> > for an RFC but this series got to version 6. We need their feedback.
>>=20
>> Yeah, thanks for doing this.
>> > On Fri, Sep 04, 2026 at 04:04:50PM +0530, Aneesh Kumar K.V (Arm) wrote:
>> >> The system heap can allocate buffers that are decrypted and shared wi=
th the
>> >> host. For confidential-computing guests, those shared buffers must co=
ver
>> >> whole shared-buffer granule; otherwise a userspace mmap of the dma-bu=
f may
>> >> expose only part of a host-managed granule and allow unintended acces=
s to
>> >> adjacent private memory.
>> >>
>> >> Require cc-shared system-heap allocations to have a size aligned to
>> >> mem_cc_shared_granule_size(), and allocate pages at least as large as=
 the
>> >> required granule. Keep the allocation bounded by the existing heap or=
ders,
>> >> but fall back to an exact minimum-order allocation when the required
>> >> granule is not one of the preferred heap orders.
>>=20
>> Uff, I don't think we can do that.
>>=20
>> That is massively platform specific behavior in a non platform
>> specific code.
>
> What we really need is an allocator API that does all this for the caller.
>
> It has been pointed out a few times, Aneesh maybe you need to try to
> tackle that?
>
> dmabuf heap just wants
>
> 'allocate me an array of shared folios totaling XX bytes'
>
> Arch code can figure out how to do it. If some ARM configs only give
> order 4 folios or whatever then dmabuf heap doesn't care.
>
> And solve the double/triple zeroing problem.
>

Agreed. Moving all the CoCo shared-allocation rules into one place makes
this easier to follow.

+static struct page *system_heap_alloc_order(unsigned int order, gfp_t flag=
s,
+					    bool cc_shared)
+{
+	struct cc_shared_pages mem;
+
+	if (!cc_shared)
+		return alloc_pages(flags, order);
+
+	/* The shared granule can raise the actual allocation order. */
+	flags |=3D __GFP_COMP;
+	if (alloc_cc_shared_pages(flags, PAGE_SIZE << order, &mem))
+		return NULL;
+
+	return mem.page;
+}
+
 static struct page *alloc_largest_available(unsigned long size,
-					    unsigned int max_order)
+					    unsigned int max_order,
+					    bool cc_shared)
 {
 	struct page *page;
	int i;
 	gfp_t flags;
=20
 	for (i =3D 0; i < NUM_ORDERS; i++) {
 		if (size <  (PAGE_SIZE << orders[i]))
 			continue;
 		if (max_order < orders[i])
 			continue;
 		flags =3D order_flags[i];
 		if (mem_accounting)
 			flags |=3D __GFP_ACCOUNT;
-		page =3D alloc_pages(flags, orders[i]);
+		page =3D system_heap_alloc_order(orders[i], flags, cc_shared);
 		if (!page)
 			continue;
 		return page;


with mm/cc_shared.c having

int alloc_cc_shared_pages_node(int nid, gfp_t gfp, size_t requested,
			       struct cc_shared_pages *mem)
{
	struct cc_shared_layout layout;
	struct page *page;
	unsigned int order;
	bool zero =3D gfp & __GFP_ZERO;
	int ret;

	if (!mem)
		return -EINVAL;

	ret =3D cc_shared_calc_layout(requested, &layout);
	if (ret)
		return ret;

	order =3D get_order(layout.shared_size);
	if (order > MAX_PAGE_ORDER)
		return -EINVAL;

	/*
	 * State transitions require a linear-map address and may modify memory.
	 * Allocate from low memory and defer requested zeroing until afterwards.
	 */
	gfp &=3D ~(__GFP_HIGHMEM | __GFP_ZERO);
	if (nid =3D=3D NUMA_NO_NODE)
		page =3D alloc_pages(gfp, order);
	else
		page =3D alloc_pages_node(nid, gfp, order);
	if (!page)
		return -ENOMEM;

	ret =3D cc_make_shared(page_address(page), layout.shared_size);
	if (ret) {
		if (!cc_make_private(page_address(page), layout.shared_size))
			__free_pages(page, order);
		else
			pr_warn_ratelimited("leaking %zu bytes with uncertain shared state\n",
					    layout.shared_size);
		return ret;
	}

	if (zero)
		memset(page_address(page), 0, layout.shared_size);

	mem->page =3D page;
	mem->shared_size =3D layout.shared_size;
	return 0;
}

-aneesh

