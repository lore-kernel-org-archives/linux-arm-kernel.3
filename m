Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CEBFCA0FE7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 13:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1O/zM1zKzZOQIR19miejrCk4D8ib53PTjy+21WtrmDk=; b=ioR0obhlX1sd11m+Oiqx5AyeUG
	nZ88g3Ofsge8FuLuJfA3lGtZvbRQvDUSAeK2HSIXNYtFt5viGPqQ7zPb4Jg4ZE4xjlXEBcqxnMoe+
	leNn5OHLK+iaddDRS2luxEONLV5cyfFUSNpTKLhd7FBaEjnXYtanHEyyN4Ws81iGaNOmH06G7QaOy
	q0kjl96MI8ty/SQTPju+8cSLH12/ECM0yFQjUO14LTvGh11cGk75Q1I06qF3hh/wbmq/x8lROUJhO
	lRp45srXQyvaUqdfYUPUs0KH/S35O71dkp00TvG0LrkxKAz8kQS/BQ8mix369zQboPATWUcaPcAFp
	irZ7tLjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqtNP-0000000C290-3Onr;
	Tue, 26 Aug 2025 13:06:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqtKh-0000000C1jj-1QJL;
	Tue, 26 Aug 2025 13:03:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 025E02C23;
	Tue, 26 Aug 2025 06:03:18 -0700 (PDT)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A5B423F63F;
	Tue, 26 Aug 2025 06:03:19 -0700 (PDT)
Date: Tue, 26 Aug 2025 14:03:16 +0100
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, Alexander Potapenko <glider@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Brendan Jackman <jackmanb@google.com>,
	Christoph Lameter <cl@gentwo.org>, Dennis Zhou <dennis@kernel.org>,
	Dmitry Vyukov <dvyukov@google.com>, dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org, iommu@lists.linux.dev,
	io-uring@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>,
	Jens Axboe <axboe@kernel.dk>, Johannes Weiner <hannes@cmpxchg.org>,
	John Hubbard <jhubbard@nvidia.com>, kasan-dev@googlegroups.com,
	kvm@vger.kernel.org, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-arm-kernel@axis.com, linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org, linux-ide@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-mm@kvack.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Marco Elver <elver@google.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>,
	Muchun Song <muchun.song@linux.dev>, netdev@vger.kernel.org,
	Oscar Salvador <osalvador@suse.de>, Peter Xu <peterx@redhat.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Suren Baghdasaryan <surenb@google.com>, Tejun Heo <tj@kernel.org>,
	virtualization@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>,
	wireguard@lists.zx2c4.com, x86@kernel.org, Zi Yan <ziy@nvidia.com>
Subject: Re: [PATCH RFC 21/35] mm/cma: refuse handing out non-contiguous page
 ranges
Message-ID: <aK2wlGYvCaFQXzBm@raptor>
References: <20250821200701.1329277-1-david@redhat.com>
 <20250821200701.1329277-22-david@redhat.com>
 <aK2QZnzS1ErHK5tP@raptor>
 <ad521f4f-47aa-4728-916f-3704bf01f770@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad521f4f-47aa-4728-916f-3704bf01f770@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_060327_421136_4941519B 
X-CRM114-Status: GOOD (  18.26  )
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

Hi David,

On Tue, Aug 26, 2025 at 01:04:33PM +0200, David Hildenbrand wrote:
..
> > Just so I can better understand the problem being fixed, I guess you can have
> > two consecutive pfns with non-consecutive associated struct page if you have two
> > adjacent memory sections spanning the same physical memory region, is that
> > correct?
> 
> Exactly. Essentially on SPARSEMEM without SPARSEMEM_VMEMMAP it is not
> guaranteed that
> 
> 	pfn_to_page(pfn + 1) == pfn_to_page(pfn) + 1
> 
> when we cross memory section boundaries.
> 
> It can be the case for early boot memory if we allocated consecutive areas
> from memblock when allocating the memmap (struct pages) per memory section,
> but it's not guaranteed.

Thank you for the explanation, but I'm a bit confused by the last paragraph. I
think what you're saying is that we can also have the reverse problem, where
consecutive struct page * represent non-consecutive pfns, because memmap
allocations happened to return consecutive virtual addresses, is that right?

If that's correct, I don't think that's the case for CMA, which deals out
contiguous physical memory. Or were you just trying to explain the other side of
the problem, and I'm just overthinking it?

Thanks,
Alex

