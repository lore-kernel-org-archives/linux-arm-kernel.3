Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63C1ACA0FE8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 15:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gSgM5v5QN4mf4R9UjO3p9g49c5fElcblzx9rfuNpgCM=; b=kHf0/ALrvkFWQafT5GElTxHYQv
	uR31ByWFlMD+lHGLwK3N9ipox3rKHuAIWfIVjn3oJ0WVJgDMLedSB+FTI3Hmt5MTKXnZ4i1UDZ7KJ
	PDIR/qMcF8TxKDCwp6KxU7kfLSMiCeinmxL8qHmB2nljr3Zn0XjnHgoVEPMAAjV5T4QyVO0MNKSqn
	wYfG16/2TUYYZV5/Xeng4oEs2bCE8wK8UZQTx1BVlOgm/ccJY7uYDzwdq8nr4xDY2ZP6FXh4xkVM0
	8Ksczb5dIfia6558qz+2X/UT+pyqQTOK9eXKBuPUdNDx/IWmA0OZFp7VXBDA1uiIMHvLhf7n34+rF
	UjgTIC7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upTmW-000000032BY-2SQc;
	Fri, 22 Aug 2025 15:34:20 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upMvh-00000001uSy-06Jc;
	Fri, 22 Aug 2025 08:15:22 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250822081519euoutp01946853c37392c604dd0c3ef7d9f9864d~eCL6pnShX0804708047euoutp01V;
	Fri, 22 Aug 2025 08:15:19 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250822081519euoutp01946853c37392c604dd0c3ef7d9f9864d~eCL6pnShX0804708047euoutp01V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755850519;
	bh=gSgM5v5QN4mf4R9UjO3p9g49c5fElcblzx9rfuNpgCM=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=e4dvoXQdSu6m2XApKflo9WPmqpXymYx8peucZKWnnidxwTqyyGT6vyRmLSZhDupfy
	 UQS833Dv4xDvMpcINMnXzIPqm8717h4UDC2WHsJO8GSlXAIbIu/HM+EmSf5f03lk+1
	 DvviTyYYSXyxJn74yEGOVwAsfz9e64KnZWqZgVcw=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250822081519eucas1p173966299ee7e4ed7e44e5668490c5bb1~eCL6VCjyQ0206902069eucas1p1F;
	Fri, 22 Aug 2025 08:15:19 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250822081515eusmtip1e7bc345219f25d2646a53b4e40310c91~eCL2XTm3N1429714297eusmtip1U;
	Fri, 22 Aug 2025 08:15:14 +0000 (GMT)
Message-ID: <8c4b0068-92be-427b-8bfc-9926eea6aa09@samsung.com>
Date: Fri, 22 Aug 2025 10:15:14 +0200
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH RFC 23/35] scatterlist: disallow non-contigous page
 ranges in a single SG entry
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
Cc: Alexander Potapenko <glider@google.com>, Andrew Morton
	<akpm@linux-foundation.org>, Brendan Jackman <jackmanb@google.com>,
	Christoph Lameter <cl@gentwo.org>, Dennis Zhou <dennis@kernel.org>, Dmitry
	Vyukov <dvyukov@google.com>, dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org, iommu@lists.linux.dev,
	io-uring@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>, Jens Axboe
	<axboe@kernel.dk>, Johannes Weiner <hannes@cmpxchg.org>, John Hubbard
	<jhubbard@nvidia.com>, kasan-dev@googlegroups.com, kvm@vger.kernel.org,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Linus Torvalds
	<torvalds@linux-foundation.org>, linux-arm-kernel@axis.com,
	linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
	linux-ide@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mm@kvack.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Marco Elver <elver@google.com>, Michal Hocko <mhocko@suse.com>, Mike
	Rapoport <rppt@kernel.org>, Muchun Song <muchun.song@linux.dev>,
	netdev@vger.kernel.org, Oscar Salvador <osalvador@suse.de>, Peter Xu
	<peterx@redhat.com>, Robin Murphy <robin.murphy@arm.com>, Suren Baghdasaryan
	<surenb@google.com>, Tejun Heo <tj@kernel.org>,
	virtualization@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>,
	wireguard@lists.zx2c4.com, x86@kernel.org, Zi Yan <ziy@nvidia.com>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20250821200701.1329277-24-david@redhat.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20250822081519eucas1p173966299ee7e4ed7e44e5668490c5bb1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250821200818eucas1p2c3df1e12eeba86a68679743d2f5929a8
X-EPHeader: CA
X-CMS-RootMailID: 20250821200818eucas1p2c3df1e12eeba86a68679743d2f5929a8
References: <20250821200701.1329277-1-david@redhat.com>
	<CGME20250821200818eucas1p2c3df1e12eeba86a68679743d2f5929a8@eucas1p2.samsung.com>
	<20250821200701.1329277-24-david@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_011521_332979_BD127D69 
X-CRM114-Status: GOOD (  21.30  )
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

On 21.08.2025 22:06, David Hildenbrand wrote:
> The expectation is that there is currently no user that would pass in
> non-contigous page ranges: no allocator, not even VMA, will hand these
> out.
>
> The only problematic part would be if someone would provide a range
> obtained directly from memblock, or manually merge problematic ranges.
> If we find such cases, we should fix them to create separate
> SG entries.
>
> Let's check in sg_set_page() that this is really the case. No need to
> check in sg_set_folio(), as pages in a folio are guaranteed to be
> contiguous.
>
> We can now drop the nth_page() usage in sg_page_iter_page().
>
> Signed-off-by: David Hildenbrand <david@redhat.com>
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>   include/linux/scatterlist.h | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/include/linux/scatterlist.h b/include/linux/scatterlist.h
> index 6f8a4965f9b98..8196949dfc82c 100644
> --- a/include/linux/scatterlist.h
> +++ b/include/linux/scatterlist.h
> @@ -6,6 +6,7 @@
>   #include <linux/types.h>
>   #include <linux/bug.h>
>   #include <linux/mm.h>
> +#include <linux/mm_inline.h>
>   #include <asm/io.h>
>   
>   struct scatterlist {
> @@ -158,6 +159,7 @@ static inline void sg_assign_page(struct scatterlist *sg, struct page *page)
>   static inline void sg_set_page(struct scatterlist *sg, struct page *page,
>   			       unsigned int len, unsigned int offset)
>   {
> +	VM_WARN_ON_ONCE(!page_range_contiguous(page, ALIGN(len + offset, PAGE_SIZE) / PAGE_SIZE));
>   	sg_assign_page(sg, page);
>   	sg->offset = offset;
>   	sg->length = len;
> @@ -600,7 +602,7 @@ void __sg_page_iter_start(struct sg_page_iter *piter,
>    */
>   static inline struct page *sg_page_iter_page(struct sg_page_iter *piter)
>   {
> -	return nth_page(sg_page(piter->sg), piter->sg_pgoffset);
> +	return sg_page(piter->sg) + piter->sg_pgoffset;
>   }
>   
>   /**

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


