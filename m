Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 250B1C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 15:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NWKt11fIsoIIrCyQG6SzXtGXYwdoo6CSAzMZiNAYnp0=; b=OOWkj7F7ByK0wnwyi8+JypoEj0
	rfC59//AUZfveLvJWgSdJGs83UmyzceilCTirtjMQxGPuLCOYmG/Li49qmMP7Fb+40xEb2P1C+oBu
	uSm58oMQ+Q62s/mINVJ82SI0OTrQql1K80igoxw9o1L9+sXM+b1E3zixBhz+Ixt3A8joWTwN6yBGB
	G4lZT6pkOYaCn5x1UcTPukYrD6V6J2kYRzSdDeF84bvmOuxIDc3fMY5WISBqVtzqY8HFbGGMEIrr6
	/CU+UtMb3pQJG0CbmN7tyFWf3xWwG24U9Cx63dCuhiaX/Zn3DVeHiDxtFOKU6fFzzuaiAYm8ErZ3/
	4Wd0bQMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlV22-00000005zWW-1rYm;
	Fri, 21 Feb 2025 15:33:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlV0Z-00000005zFh-2D8y
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 15:32:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8527D613E9;
	Fri, 21 Feb 2025 15:32:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51861C4CED6;
	Fri, 21 Feb 2025 15:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740151926;
	bh=2XaCu9je9IA765r/EB4HdTVXelllIRMjNPyGsqdE/Ic=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=syu33c5FDQHVtMcEcWdynEHBHHQzJPgLhyfB++zvelhIsmLJ2XmDlU7oMDTLeMVwc
	 RV3Z30p9d0YCTA15XIqmfev+ds6Gzy0+nboSXX1xyuUQDxIqnlxxNAGbVbYCpTfG6/
	 nyskhslJCl5e9kDaO9HoUtZAIcdJJhBdE1hMld+VMc3YNW5pZcqQEpGd9LraPAKYIm
	 GggZVSa1UN4kMkRbcNlO7jkTys4qzvFW3RSZdWaOpnC70Pw9uiJbR6HnQKS2wIfLtK
	 CiEwckQny+xGxD9LpTWSz6M7XtTTJFkuX34BXhlP04kE28YPDHGtiBgP2fV6SWXo4H
	 UJa/7XqpMI+Xg==
Date: Fri, 21 Feb 2025 15:31:56 +0000
From: Will Deacon <will@kernel.org>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Arnd Bergmann <arnd@arndb.de>, Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	David Hildenbrand <david@redhat.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Dev Jain <dev.jain@arm.com>, Kevin Brodsky <kevin.brodsky@arm.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 2/4] arm64: hugetlb: Fix huge_ptep_get_and_clear() for
 non-present ptes
Message-ID: <20250221153156.GC20567@willie-the-truck>
References: <20250217140419.1702389-1-ryan.roberts@arm.com>
 <20250217140419.1702389-3-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217140419.1702389-3-ryan.roberts@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

On Mon, Feb 17, 2025 at 02:04:15PM +0000, Ryan Roberts wrote:
> arm64 supports multiple huge_pte sizes. Some of the sizes are covered by
> a single pte entry at a particular level (PMD_SIZE, PUD_SIZE), and some
> are covered by multiple ptes at a particular level (CONT_PTE_SIZE,
> CONT_PMD_SIZE). So the function has to figure out the size from the
> huge_pte pointer. This was previously done by walking the pgtable to
> determine the level and by using the PTE_CONT bit to determine the
> number of ptes at the level.
> 
> But the PTE_CONT bit is only valid when the pte is present. For
> non-present pte values (e.g. markers, migration entries), the previous
> implementation was therefore erroniously determining the size. There is
> at least one known caller in core-mm, move_huge_pte(), which may call
> huge_ptep_get_and_clear() for a non-present pte. So we must be robust to
> this case. Additionally the "regular" ptep_get_and_clear() is robust to
> being called for non-present ptes so it makes sense to follow the
> behaviour.
> 
> Fix this by using the new sz parameter which is now provided to the
> function. Additionally when clearing each pte in a contig range, don't
> gather the access and dirty bits if the pte is not present.
> 
> An alternative approach that would not require API changes would be to
> store the PTE_CONT bit in a spare bit in the swap entry pte for the
> non-present case. But it felt cleaner to follow other APIs' lead and
> just pass in the size.
> 
> As an aside, PTE_CONT is bit 52, which corresponds to bit 40 in the swap
> entry offset field (layout of non-present pte). Since hugetlb is never
> swapped to disk, this field will only be populated for markers, which
> always set this bit to 0 and hwpoison swap entries, which set the offset
> field to a PFN; So it would only ever be 1 for a 52-bit PVA system where
> memory in that high half was poisoned (I think!). So in practice, this
> bit would almost always be zero for non-present ptes and we would only
> clear the first entry if it was actually a contiguous block. That's
> probably a less severe symptom than if it was always interpretted as 1
> and cleared out potentially-present neighboring PTEs.
> 
> Cc: stable@vger.kernel.org
> Fixes: 66b3923a1a0f ("arm64: hugetlb: add support for PTE contiguous bit")
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---
>  arch/arm64/mm/hugetlbpage.c | 40 ++++++++++++++++---------------------
>  1 file changed, 17 insertions(+), 23 deletions(-)
> 
> diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
> index 06db4649af91..614b2feddba2 100644
> --- a/arch/arm64/mm/hugetlbpage.c
> +++ b/arch/arm64/mm/hugetlbpage.c
> @@ -163,24 +163,23 @@ static pte_t get_clear_contig(struct mm_struct *mm,
>  			     unsigned long pgsize,
>  			     unsigned long ncontig)
>  {
> -	pte_t orig_pte = __ptep_get(ptep);
> -	unsigned long i;
> -
> -	for (i = 0; i < ncontig; i++, addr += pgsize, ptep++) {
> -		pte_t pte = __ptep_get_and_clear(mm, addr, ptep);
> -
> -		/*
> -		 * If HW_AFDBM is enabled, then the HW could turn on
> -		 * the dirty or accessed bit for any page in the set,
> -		 * so check them all.
> -		 */
> -		if (pte_dirty(pte))
> -			orig_pte = pte_mkdirty(orig_pte);
> -
> -		if (pte_young(pte))
> -			orig_pte = pte_mkyoung(orig_pte);
> +	pte_t pte, tmp_pte;
> +	bool present;
> +
> +	pte = __ptep_get_and_clear(mm, addr, ptep);
> +	present = pte_present(pte);
> +	while (--ncontig) {
> +		ptep++;
> +		addr += pgsize;
> +		tmp_pte = __ptep_get_and_clear(mm, addr, ptep);
> +		if (present) {
> +			if (pte_dirty(tmp_pte))
> +				pte = pte_mkdirty(pte);
> +			if (pte_young(tmp_pte))
> +				pte = pte_mkyoung(pte);
> +		}
>  	}

nit: With the loop now structured like this, we really can't handle
num_contig_ptes() returning 0 if it gets an unknown size. Granted, that
really shouldn't happen, but perhaps it would be better to add a 'default'
case with a WARN() to num_contig_ptes() and then add an early return here?

Will

