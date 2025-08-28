Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17421C8303F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 12:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qNeXcIbDUNVZCQgqMueGfXIPkpDwNju3n2hcsJpviO8=; b=19ueigqKHhdOddcYmhCPgPnQBi
	/J3qY8d8PYlqmvik7T4YPxSlu6nqZxvw9FxyYCfxxZo7WAPDWlQhXRXCqzrFKhxUS5LEFZs5XfJyh
	/xuwA/C1mhTelsrw0PUl1B1C6RfUBtAG/AS8chRBFdifEmtei/7tPjjKUXS8EjfPUIK9EY4SlkXa7
	mis/IiBdLIzqbWfU0cavB93qoilRpBdvrIPNHfb0lwqhMV71GuV7l0C0pboDAD92107DaSxMaNz4J
	9WqH2FAD4aH7eF1dad2M7qfTWbenpwCBwe07D+6fLq7rgfmgzM6TE1xCbqPyGMGHrFUwJhaYepRW3
	4qn+5YpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urbL1-00000001QoL-24gO;
	Thu, 28 Aug 2025 12:02:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urY8q-00000000p83-3syi;
	Thu, 28 Aug 2025 08:37:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E943C601D3;
	Thu, 28 Aug 2025 08:37:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 836CFC4CEEB;
	Thu, 28 Aug 2025 08:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756370275;
	bh=IVLnXXvrcuUFj2BZziSgUB2XoLuFxUupzbzqW/5G2yk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u4Kv9tb0W5HJY1z7Kha4RAxr/UDU+cy25InJtGEnO3JiyN+nbkHyw+9MpLitEOa5G
	 0pSV+hVfSXm9giRO4saHh0FNbPWIN8sA2oA/bVZ8ebErMJIoJf5LF4hfU+XC82WOgd
	 o5Dgh+w2lF46YEB0ubeKLXGmDFSIt276UaYMpIYsyodQH72bNpUaPHECThHiReLcwu
	 lbXv5EztKdkS391yu76bPtHOGB6uXK2NxrE3bcXs03h3uWTI0l2Znk0+rahaBHO1Pt
	 hHaVxoPeO8aKdT7uTaRf2Ck2cSXP3LlsqOYOEOuwJLFl7J5jwbm5nIR+gc/gZJcMeT
	 tq+aaMu2hoX5A==
Date: Thu, 28 Aug 2025 11:37:37 +0300
From: Mike Rapoport <rppt@kernel.org>
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
	Michal Hocko <mhocko@suse.com>, Muchun Song <muchun.song@linux.dev>,
	netdev@vger.kernel.org, Oscar Salvador <osalvador@suse.de>,
	Peter Xu <peterx@redhat.com>, Robin Murphy <robin.murphy@arm.com>,
	Suren Baghdasaryan <surenb@google.com>, Tejun Heo <tj@kernel.org>,
	virtualization@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>,
	wireguard@lists.zx2c4.com, x86@kernel.org, Zi Yan <ziy@nvidia.com>
Subject: Re: [PATCH v1 13/36] mm/hugetlb: cleanup
 hugetlb_folio_init_tail_vmemmap()
Message-ID: <aLAVUePBQuz9D89T@kernel.org>
References: <20250827220141.262669-1-david@redhat.com>
 <20250827220141.262669-14-david@redhat.com>
 <aLADXP89cp6hAq0q@kernel.org>
 <377449bd-3c06-4a09-8647-e41354e64b30@redhat.com>
 <aLAN7xS4WQsN6Hpm@kernel.org>
 <6880f125-803d-4eea-88ac-b67fdcc5995d@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6880f125-803d-4eea-88ac-b67fdcc5995d@redhat.com>
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

On Thu, Aug 28, 2025 at 10:18:23AM +0200, David Hildenbrand wrote:
> On 28.08.25 10:06, Mike Rapoport wrote:
> > On Thu, Aug 28, 2025 at 09:44:27AM +0200, David Hildenbrand wrote:
> > > On 28.08.25 09:21, Mike Rapoport wrote:
> > > > On Thu, Aug 28, 2025 at 12:01:17AM +0200, David Hildenbrand wrote:
> > > > > +	/*
> > > > > +	 * We mark all tail pages with memblock_reserved_mark_noinit(),
> > > > > +	 * so these pages are completely uninitialized.
> > > > 
> > > >                                ^ not? ;-)
> > > 
> > > Can you elaborate?
> > 
> > Oh, sorry, I misread "uninitialized".
> > Still, I'd phrase it as
> > 
> > 	/*
> > 	 * We marked all tail pages with memblock_reserved_mark_noinit(),
> > 	 * so we must initialize them here.
> > 	 */
> 
> I prefer what I currently have, but thanks for the review.

No strong feelings, feel free to add

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

-- 
Sincerely yours,
Mike.

