Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72794EA3C48
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 10:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uq24EilmIdS76nXGDAwJu8G3CVqetL9sNwY4U4OjvNI=; b=G6IC+z2mlmf0KlG4UM84AbWArf
	Wsd2JJhuvEH7fCDTvVAKyd4TUtrOfQLzPRK/nAPI8MpC9H+Z1afdxs//IelEy6tDyjNbiBNW2dJvO
	a94Jh7HqVhLvrFK4u6G0aqocyzqxssJff7YM73tO3uQ9BRGZOSLo1qjLN4VxDr2/jJ35tyiui/7gD
	HkODjnFmYdf2uZqlR6dARmDYuxJ5mV9feIDvZkRf4hUXYeinHhEi5+O2yx/7rQd7OILTcf9/WhoZH
	uIB3kRfCBzgqMDkTIuQrx3t6Bm6UqCV7o5G1BJ5yY3o3WcR4U6uHeMzLLI3agYo7acppWM7xmC/+7
	RP1b333Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAmlz-0000000AAqm-2C4R;
	Thu, 09 Apr 2026 10:38:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAmlw-0000000AAq4-26ji
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 10:38:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 914B641851;
	Thu,  9 Apr 2026 10:38:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93843C4CEF7;
	Thu,  9 Apr 2026 10:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775731082;
	bh=976DNqeQEs7Pl86bSQIumgGXPxpOrVddLnDDmQWOHVQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QmNCOPRP43UhzksR5XQpFQQoocT2bmpB7xLiO8PisbEJ+AXcLEkykvdo55fWP3r+n
	 dsZssJP/kYRRyzIhHvcVafJaWpGsgo9h6GFwGgr0oap6IlXPbfNbqvQKIVIUpBTqb5
	 VwxcYF9KUnhIpRqTf8ZO5MIu/NxSPZFVMadq5ELnHLLcGRsGat01tlsqwV1uAtGoPo
	 n5vPo1Pv0g/MOsD/d/7Qb9RIXa8H6jK+kD5jSd+ijK3Mgts74y6z8x42c/muXrOQjL
	 p8BOJGYMNnkMiTzYr2CH2yTi2aHvRDh+mYu2d4n4BEYrwgD8AjaOqiVPeKDrRLEhYO
	 VSf+/+rUX3yfQ==
Date: Thu, 9 Apr 2026 13:37:55 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Linu Cherian <linu.cherian@arm.com>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [RFC V1 02/16] mm: Add read-write accessors for vm_page_prot
Message-ID: <adeBg_eZvmz-ST67@kernel.org>
References: <20260224051153.3150613-1-anshuman.khandual@arm.com>
 <20260224051153.3150613-3-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224051153.3150613-3-anshuman.khandual@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_033804_565027_EF2D148E 
X-CRM114-Status: GOOD (  18.97  )
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

Hi Anshuman,

On Tue, Feb 24, 2026 at 10:41:39AM +0530, Anshuman Khandual wrote:
> Currently vma->vm_page_prot is safely read from and written to, without any
> locks with READ_ONCE() and WRITE_ONCE(). But with introduction of D128 page
> tables on arm64 platform, vm_page_prot grows to 128 bits which can't safely
> be handled with READ_ONCE() and WRITE_ONCE().
> 
> Add read and write accessors for vm_page_prot like pgprot_read/write_once()
> which any platform can override when required, although still defaulting as
> READ_ONCE() and WRITE_ONCE(), thus preserving the functionality for others.
> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: David Hildenbrand <david@kernel.org>
> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: linux-mm@kvack.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
>  include/linux/pgtable.h | 14 ++++++++++++++
>  mm/huge_memory.c        |  4 ++--
>  mm/memory.c             |  2 +-
>  mm/migrate.c            |  2 +-
>  mm/mmap.c               |  2 +-
>  5 files changed, 19 insertions(+), 5 deletions(-)
> 
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index da17139a1279..8858b8b03a02 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -495,6 +495,20 @@ static inline pgd_t pgdp_get(pgd_t *pgdp)
>  }
>  #endif
>  
> +#ifndef pgprot_read_once
> +static inline pgprot_t pgprot_read_once(pgprot_t *prot)

I don't think we need _once in the helper name. Presence of the helper
already implies that pointer should not be just dereferenced from one side
and that using the helper will do The Right Thing from the other side.


-- 
Sincerely yours,
Mike.

