Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF19BC021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 10:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cgj0SsAf7s17wTdss/DKIZ3z1NXE7e8Hhk/xnWXEDfM=; b=2xI0iaPL9fKqC/YZzlxNYNMgzA
	A157ha8klB53f4qibIKQg0HNUqi0QVwIUaQwqiQ98VHVpNSKoJlnnsFTJ5/Zl16Vs+VtWk2w9Y8yK
	LYlZWSno9rUn2UumkA8OsjPPq7TOm/Z5cyiQKlMAhZpz2dR7vgjsGnIzEkaRkMNVD/n2ZqukHnEkW
	PZ/ficDY1PcqL5wkThzN1wKtgH4jszg4VJt/0Ge5KHO7DEQA3XcoBPLGJt5TANWanPg/fdfHkJTD/
	am7hnsyv1HLcGDQtUB6MCvDF+RNGRQrZiEOSv/s2EpeKSd+lpwZ5gXt2EbZY6ZCAa/bVEld0fzJad
	4GH2n2lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlQ7b-000000059U6-3ijE;
	Fri, 21 Feb 2025 10:19:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlPkg-000000052F2-4AZm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 09:55:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 026596112D;
	Fri, 21 Feb 2025 09:55:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8DF8C4CED6;
	Fri, 21 Feb 2025 09:55:15 +0000 (UTC)
Date: Fri, 21 Feb 2025 09:55:13 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>, Will Deacon <will@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
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
	Mark Rutland <mark.rutland@arm.com>, Dev Jain <dev.jain@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 2/4] arm64: hugetlb: Fix huge_ptep_get_and_clear() for
 non-present ptes
Message-ID: <Z7hNgSBw6lfwwcch@arm.com>
References: <20250217140419.1702389-1-ryan.roberts@arm.com>
 <20250217140419.1702389-3-ryan.roberts@arm.com>
 <e26a59a1-ff9a-49c7-b10a-c3f5c096a2c4@arm.com>
 <5477d161-12e7-4475-a6e9-ff3921989673@arm.com>
 <50f48574-241d-42d8-b811-3e422c41e21a@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <50f48574-241d-42d8-b811-3e422c41e21a@arm.com>
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

On Thu, Feb 20, 2025 at 12:07:35PM +0530, Anshuman Khandual wrote:
> On 2/19/25 14:28, Ryan Roberts wrote:
> > On 19/02/2025 08:45, Anshuman Khandual wrote:
> >> On 2/17/25 19:34, Ryan Roberts wrote:
> >>> +	while (--ncontig) {
> >>
> >> Should this be converted into a for loop instead just to be in sync with other
> >> similar iterators in this file.
> >>
> >> for (i = 1; i < ncontig; i++, addr += pgsize, ptep++)
> >> {
> >> 	tmp_pte = __ptep_get_and_clear(mm, addr, ptep);
> >> 	if (present) {
> >> 		if (pte_dirty(tmp_pte))
> >> 			pte = pte_mkdirty(pte);
> >> 		if (pte_young(tmp_pte))
> >> 			pte = pte_mkyoung(pte);
> >> 	}
> >> }
> > 
> > I think the way you have written this it's incorrect. Let's say we have 16 ptes
> > in the block. We want to iterate over the last 15 of them (we have already read
> > pte 0). But you're iterating over the first 15 because you don't increment addr
> > and ptep until after you've been around the loop the first time. So we would
> > need to explicitly increment those 2 before entering the loop. But that is only
> > neccessary if ncontig > 1. Personally I think my approach is neater...
> 
> Thinking about this again. Just wondering should not a pte_present()
> check on each entries being cleared along with (ncontig > 1) in this
> existing loop before transferring over the dirty and accessed bits -
> also work as intended with less code churn ?

Shouldn't all the ptes in a contig block be either all present or all
not-present? Is there any point in checking each individually?

-- 
Catalin

