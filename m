Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4C30CA0FF1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 19:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r72jr2fb8G7h/yyetD/U7kOQIEeXffCRdNoOrm+lHkk=; b=LFqFJXbOG4s8nTOeX3j87JuJlU
	Ljws7aiP6VD6IL4A5bGAzUapeEROfmpk1o4hg2Ru6qUtl4og2SpQKnyfMJTLcM1CSiFVC6HsuSNai
	es/Q5it9q0K6JqWWRTUG2hQmLs3DP2fYHp+j1TWil5SbRuojbiKu7//yOMQsMq6fV+f3k4gsy1dna
	dmKpiTuJ7gkf+Sn1KG6u+bs/KwjIRzYDixbW+P6X+R4Bvc8YQcEx2eC+gGbV1hzGZBYU7GKIJe8lB
	Ev6cow4CJH2uOD1T/8I/AKf1c73BySOiY3vP+QVXV0QuEJI+QbF1Aje6Wcfl3rW7/0p7z/U2gJPaM
	m2w1tpzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqcYE-00000009Aq8-2qqK;
	Mon, 25 Aug 2025 19:08:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqaWa-00000008jmG-0dua;
	Mon, 25 Aug 2025 16:58:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C4B8D43E7E;
	Mon, 25 Aug 2025 16:58:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF37AC4CEED;
	Mon, 25 Aug 2025 16:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756141107;
	bh=5Xs4ClQrBNPUK24yQ8tvJo62CGzQ+OUCbyk/7pv7K6g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K8EPeL9rFMK2+nBscZ78BHN9AXOnwLlio8wCQA9T4HPI2M7JTseek460vnzI7LqJC
	 TDu4NzXeMpXS8jhUa/iSAcIvRfHFDSrWxcvq7/PwB+bucaEQsHAodSxeBqU3oHbYQw
	 JfnmUaXpTgDVr5GNOQRbyvPuO31dhRIGQUncZS3uv95CJi5KIRjBjS37ASsfqMbjJV
	 FaVoAzebuKQA21fTHdob2rVKAkh6oJNsI5NIl49si6OGRBanVCOrvFPYRUxz3E2h7U
	 H5t70EO0n4A9bkEljsMG6VtFtoS+dKBxf5ZFl9Bmc3Iax0SvbwLHZzXF+Oj3qlKigt
	 vsahqKXPodl2Q==
Date: Mon, 25 Aug 2025 19:58:10 +0300
From: Mike Rapoport <rppt@kernel.org>
To: David Hildenbrand <david@redhat.com>
Cc: Mika =?iso-8859-1?Q?Penttil=E4?= <mpenttil@redhat.com>,
	linux-kernel@vger.kernel.org,
	Alexander Potapenko <glider@google.com>,
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
	Michal Hocko <mhocko@suse.com>, Muchun Song <muchun.song@linux.dev>,
	netdev@vger.kernel.org, Oscar Salvador <osalvador@suse.de>,
	Peter Xu <peterx@redhat.com>, Robin Murphy <robin.murphy@arm.com>,
	Suren Baghdasaryan <surenb@google.com>, Tejun Heo <tj@kernel.org>,
	virtualization@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>,
	wireguard@lists.zx2c4.com, x86@kernel.org, Zi Yan <ziy@nvidia.com>
Subject: update kernel-doc for MEMBLOCK_RSRV_NOINIT (was: Re: [PATCH RFC
 10/35] mm/hugetlb: cleanup hugetlb_folio_init_tail_vmemmap())
Message-ID: <aKyWIriZ1bmnIrBW@kernel.org>
References: <9156d191-9ec4-4422-bae9-2e8ce66f9d5e@redhat.com>
 <7077e09f-6ce9-43ba-8f87-47a290680141@redhat.com>
 <aKmDBobyvEX7ZUWL@kernel.org>
 <a90cf9a3-d662-4239-ad54-7ea917c802a5@redhat.com>
 <aKxz9HLQTflFNYEu@kernel.org>
 <a72080b4-5156-4add-ac7c-1160b44e0dfe@redhat.com>
 <aKx6SlYrj_hiPXBB@kernel.org>
 <f8140a17-c4ec-489b-b314-d45abe48bf36@redhat.com>
 <aKyMfvWe8JetkbRL@kernel.org>
 <dbd2ec55-0e7f-407a-a8bd-e1ac83ac2a0a@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dbd2ec55-0e7f-407a-a8bd-e1ac83ac2a0a@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_095828_232184_3508E715 
X-CRM114-Status: GOOD (  18.56  )
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

On Mon, Aug 25, 2025 at 06:23:48PM +0200, David Hildenbrand wrote:
> 
> I don't quite understand the interaction with PG_Reserved and why anybody
> using this function should care.
> 
> So maybe you can rephrase in a way that is easier to digest, and rather
> focuses on what callers of this function are supposed to do vs. have the
> liberty of not doing?

How about
 
diff --git a/include/linux/memblock.h b/include/linux/memblock.h
index b96746376e17..fcda8481de9a 100644
--- a/include/linux/memblock.h
+++ b/include/linux/memblock.h
@@ -40,8 +40,9 @@ extern unsigned long long max_possible_pfn;
  * via a driver, and never indicated in the firmware-provided memory map as
  * system RAM. This corresponds to IORESOURCE_SYSRAM_DRIVER_MANAGED in the
  * kernel resource tree.
- * @MEMBLOCK_RSRV_NOINIT: memory region for which struct pages are
- * not initialized (only for reserved regions).
+ * @MEMBLOCK_RSRV_NOINIT: reserved memory region for which struct pages are not
+ * fully initialized. Users of this flag are responsible to properly initialize
+ * struct pages of this region
  * @MEMBLOCK_RSRV_KERN: memory region that is reserved for kernel use,
  * either explictitly with memblock_reserve_kern() or via memblock
  * allocation APIs. All memblock allocations set this flag.
diff --git a/mm/memblock.c b/mm/memblock.c
index 154f1d73b61f..46b411fb3630 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -1091,13 +1091,20 @@ int __init_memblock memblock_clear_nomap(phys_addr_t base, phys_addr_t size)
 
 /**
  * memblock_reserved_mark_noinit - Mark a reserved memory region with flag
- * MEMBLOCK_RSRV_NOINIT which results in the struct pages not being initialized
- * for this region.
+ * MEMBLOCK_RSRV_NOINIT
+ *
  * @base: the base phys addr of the region
  * @size: the size of the region
  *
- * struct pages will not be initialized for reserved memory regions marked with
- * %MEMBLOCK_RSRV_NOINIT.
+ * The struct pages for the reserved regions marked %MEMBLOCK_RSRV_NOINIT will
+ * not be fully initialized to allow the caller optimize their initialization.
+ *
+ * When %CONFIG_DEFERRED_STRUCT_PAGE_INIT is enabled, setting this flag
+ * completely bypasses the initialization of struct pages for such region.
+ *
+ * When %CONFIG_DEFERRED_STRUCT_PAGE_INIT is disabled, struct pages in this
+ * region will be initialized with default values but won't be marked as
+ * reserved.
  *
  * Return: 0 on success, -errno on failure.
  */

> -- 
> Cheers
> 
> David / dhildenb
> 

-- 
Sincerely yours,
Mike.

