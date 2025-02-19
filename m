Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE5C5C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 19:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9N8uhomNrvqZSlje3nDu3cVu6aGtjAz3Suivv3MB7Dg=; b=tklUkNRsiIZnX6kD7JyT0Byzb1
	KPTt/Ct638KgGaqi3bdUaoUBu7jBvGjAl5ucceST4jpjxJmnWpCGvuf2ZbJJoW52SkK0NGf2rvv2H
	moK66onaSc7v1bxUtZLAx6ira7O0d1Ra+oCNsNXP8aaWMbk9iGB5MGcQNncxTp1+PFyQrWmtF6T8V
	MkVvYkOci6gS+Sw+1g16AR9NPs7PsZaenvp98BK2bdcuwMXMv/qw35QmIhD5jCqOYaUy5kfkSO6Vu
	WjvNULr9xJZi7NJ8iOOuSf6chPPnajhkTNxd2liM7sBScd7bt5IwKeCfZY4kFgrMioInFQXZ0gX5j
	l0LDsBOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkpVy-0000000EYxh-3XHv;
	Wed, 19 Feb 2025 19:13:46 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkpMN-0000000EWDL-2X1A
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 19:03:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 022446114B;
	Wed, 19 Feb 2025 19:03:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13436C4CED1;
	Wed, 19 Feb 2025 19:03:43 +0000 (UTC)
Date: Wed, 19 Feb 2025 19:03:41 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
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
Message-ID: <Z7YrDQry8zo2jS53@arm.com>
References: <20250217140419.1702389-1-ryan.roberts@arm.com>
 <20250217140419.1702389-3-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217140419.1702389-3-ryan.roberts@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_110351_691718_567ADBC6 
X-CRM114-Status: GOOD (  17.20  )
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

A 'for' loop may be more consistent with the rest of the file but I
really don't mind the 'while' loop.

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

