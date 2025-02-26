Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58BA1C021BC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 17:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jvvD8VmtA028dfmpfoqe4awku57v1pGyKkk2EdLcK5A=; b=OUhHulrdeNdGlfGVyVnmBU5J/B
	a3PIOhBSIBvGY/gWXQI/NQT0bC9Is7j0BkVrtwrO9B1ugsmDDGLDmdhHsjqiDuIFYYE28KFNF93Gs
	dUSe1ZW50ZDPas0QCbijHbcxpTA2i5ddqZNaSsVNuv1MHmA5p21lA6eQ6KOY4eSH1g8cEBhopHzt6
	iasjxX1lfdo5W12ZKyJXCb6XwE4ytTjOTMSv2tTzbVGqEiL6A1DyJdg4uh5zgCmqthd0OMAQOxX9+
	ZbiOTtmqvRHWSwhDR7Mqhe7R2PN2SiPzikACCM4RYzu4Tr+ENDNsBG+hpF0CFcaEFJ93YzvyyUSTI
	AwJ4/cjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnLSa-00000004ldl-1FHp;
	Wed, 26 Feb 2025 17:44:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnLPc-00000004l1U-3B66
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 17:41:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 22ADC6125B;
	Wed, 26 Feb 2025 17:41:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C9E5C4CEE2;
	Wed, 26 Feb 2025 17:41:29 +0000 (UTC)
Date: Wed, 26 Feb 2025 17:41:27 +0000
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
Subject: Re: [PATCH v3 2/3] arm64: hugetlb: Fix huge_ptep_get_and_clear() for
 non-present ptes
Message-ID: <Z79SR77ml5ckIzUv@arm.com>
References: <20250226120656.2400136-1-ryan.roberts@arm.com>
 <20250226120656.2400136-3-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226120656.2400136-3-ryan.roberts@arm.com>
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

On Wed, Feb 26, 2025 at 12:06:52PM +0000, Ryan Roberts wrote:
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
> implementation was therefore erroneously determining the size. There is
> at least one known caller in core-mm, move_huge_pte(), which may call
> huge_ptep_get_and_clear() for a non-present pte. So we must be robust to
> this case. Additionally the "regular" ptep_get_and_clear() is robust to
> being called for non-present ptes so it makes sense to follow the
> behavior.
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
> probably a less severe symptom than if it was always interpreted as 1
> and cleared out potentially-present neighboring PTEs.
> 
> Cc: stable@vger.kernel.org
> Fixes: 66b3923a1a0f ("arm64: hugetlb: add support for PTE contiguous bit")
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> 
> tmp
> ---

Random "tmp" here, otherwise the patch looks fine (can be removed when
applying).

-- 
Catalin

