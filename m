Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 356CDCA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 14:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8D7LpAOoviBYk7WIQ6GdtJERZ5Q8as878mTjAUnE/1s=; b=yvacYbwtD2HKIifijXr3xyF21V
	txHItgKVChB9XD9VschjmrjXKvD9N8TL9ePdZIzUkLQnTjl27pg8gz9yoYribWIFOuPD+EqHOxrYK
	EUwi7gWeKC7w07RALdkLNmkybssN0N07kB6xqwEZyhSZsvhJs5eKYN1p2PwlQJud8AK3Wp0T8+fJd
	KV+z/W0W0+TW1dX/uAGePtdJosMReimA4k2Wp4FlaU9GrVtq/s7xb8F6c5oELGpLLS9T/G4Bsgjzv
	6M8S80DSwq/l/IDZ+s/gtPI/e5/27j1eahNYVdk3+sN36yxmbqG8BQMJMhxYXPwHjd9mfJZSmOpIH
	0/mcKFJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upScj-00000002mna-2Zms;
	Fri, 22 Aug 2025 14:20:09 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upMvY-00000001uQV-1Rnp;
	Fri, 22 Aug 2025 08:15:14 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250822081507euoutp011eb6e04748c75467354f864a5b13dcb2~eCLvKXWHt0802008020euoutp01T;
	Fri, 22 Aug 2025 08:15:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250822081507euoutp011eb6e04748c75467354f864a5b13dcb2~eCLvKXWHt0802008020euoutp01T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755850507;
	bh=8D7LpAOoviBYk7WIQ6GdtJERZ5Q8as878mTjAUnE/1s=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=XKfzn3o3WVKTQX9bE3/cpVfy9yW+H778T92W7lBVbU6kRm4mXQcKAfiloG9SVAIl1
	 DBMfdB7LnCnsIfysL99KcFBB0FogAV6kQBHI3K43plBR35f6vTvEXBvPziUq5zs0kR
	 Az18+L1Qjna/KGD88qj7IvZXFIdKHX7QWAyUJp50=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250822081507eucas1p2f6977174baf330e1c895de7ac7b91cc1~eCLu2KEdp1444414444eucas1p2a;
	Fri, 22 Aug 2025 08:15:07 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250822081502eusmtip2e6ed6d47d5194e587353269471a8bda2~eCLqth-G50411104111eusmtip2L;
	Fri, 22 Aug 2025 08:15:02 +0000 (GMT)
Message-ID: <debc61e1-683c-4fcc-9040-d55324f096f7@samsung.com>
Date: Fri, 22 Aug 2025 10:15:01 +0200
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH RFC 22/35] dma-remap: drop nth_page() in
 dma_common_contiguous_remap()
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
Cc: Robin Murphy <robin.murphy@arm.com>, Alexander Potapenko
	<glider@google.com>, Andrew Morton <akpm@linux-foundation.org>, Brendan
	Jackman <jackmanb@google.com>, Christoph Lameter <cl@gentwo.org>, Dennis
	Zhou <dennis@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
	iommu@lists.linux.dev, io-uring@vger.kernel.org, Jason Gunthorpe
	<jgg@nvidia.com>, Jens Axboe <axboe@kernel.dk>, Johannes Weiner
	<hannes@cmpxchg.org>, John Hubbard <jhubbard@nvidia.com>,
	kasan-dev@googlegroups.com, kvm@vger.kernel.org, "Liam R. Howlett"
	<Liam.Howlett@oracle.com>, Linus Torvalds <torvalds@linux-foundation.org>,
	linux-arm-kernel@axis.com, linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org, linux-ide@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-mm@kvack.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Marco Elver <elver@google.com>, Michal Hocko <mhocko@suse.com>, Mike
	Rapoport <rppt@kernel.org>, Muchun Song <muchun.song@linux.dev>,
	netdev@vger.kernel.org, Oscar Salvador <osalvador@suse.de>, Peter Xu
	<peterx@redhat.com>, Suren Baghdasaryan <surenb@google.com>, Tejun Heo
	<tj@kernel.org>, virtualization@lists.linux.dev, Vlastimil Babka
	<vbabka@suse.cz>, wireguard@lists.zx2c4.com, x86@kernel.org, Zi Yan
	<ziy@nvidia.com>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20250821200701.1329277-23-david@redhat.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20250822081507eucas1p2f6977174baf330e1c895de7ac7b91cc1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250821200816eucas1p1924e60579da49c1dfed300c945894d83
X-EPHeader: CA
X-CMS-RootMailID: 20250821200816eucas1p1924e60579da49c1dfed300c945894d83
References: <20250821200701.1329277-1-david@redhat.com>
	<CGME20250821200816eucas1p1924e60579da49c1dfed300c945894d83@eucas1p1.samsung.com>
	<20250821200701.1329277-23-david@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_011512_947176_77EE015D 
X-CRM114-Status: GOOD (  15.57  )
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
> dma_common_contiguous_remap() is used to remap an "allocated contiguous
> region". Within a single allocation, there is no need to use nth_page()
> anymore.
>
> Neither the buddy, nor hugetlb, nor CMA will hand out problematic page
> ranges.
>
> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>   kernel/dma/remap.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/kernel/dma/remap.c b/kernel/dma/remap.c
> index 9e2afad1c6152..b7c1c0c92d0c8 100644
> --- a/kernel/dma/remap.c
> +++ b/kernel/dma/remap.c
> @@ -49,7 +49,7 @@ void *dma_common_contiguous_remap(struct page *page, size_t size,
>   	if (!pages)
>   		return NULL;
>   	for (i = 0; i < count; i++)
> -		pages[i] = nth_page(page, i);
> +		pages[i] = page++;
>   	vaddr = vmap(pages, count, VM_DMA_COHERENT, prot);
>   	kvfree(pages);
>   

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


