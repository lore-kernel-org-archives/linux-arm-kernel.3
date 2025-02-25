Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCE61C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 22:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zc7ajnGXiA3almaxHMo8OLZGvnOOFig+wycZzMIPAvc=; b=Cihsu1n1t+yAMjnOC5+g2wxWcd
	7szYe4FGfK69Dd7Q+84PsfMVmVqSbW0194WSk1cNyscnFuqYG4IU5cnY+DKLVOka1vJJr53k9ArIx
	HvHyB6qcvUEsLe9hgzm32RexC+eSBcCB0pC8j3fWsTkZzn7xiFoNEitMxJr24kAMXswRcO1QuDv/x
	flDeH0HgZ1StpzzncUHsGQF/ye19vhO/9evkopYrBejXeeyzzR6idjh5RTCuf8IW0ekP0EoopRPIb
	13AfLhtTdwv/NWOKnQ9dhL3nHfloSa1DE8KVOnMY57QjFTQvZz97UbdMGniykzvtTN36GLLioyEGC
	cVjX/zaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn3HU-00000001f8x-24kv;
	Tue, 25 Feb 2025 22:20:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn3Fw-00000001euA-38Hb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 22:18:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A4C765C58C9;
	Tue, 25 Feb 2025 22:17:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C835EC4CEDD;
	Tue, 25 Feb 2025 22:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740521903;
	bh=viw/irv5FYM22IZHK1n8uTxMVClyAZnRSx0477w/Koc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gCbcoe1FnWAkKkuivz0Ld9lqqBS4AgOIa9ysfvtOoCndfjUBbAIznfzW4O+zRQ53X
	 7i9jwLmsvP3bPXO3GhN01JEwreGc+tMywVAe75sYEs9e2EedPocFDz+peOGPBXXnbV
	 TdRuf1qo+Q4tdG4WGlSOOSVn10dyWdYDMPWIizqrIgob/NFWIzpmadvVZ0DhRK+3z2
	 46QE4El0fvJpbEAohIyW2HetDWLTxPTgirKpKIya72I5N3cHvHQ/tzKaGqT+H5eR+a
	 slzjYb3AlhpaPXDiqa+UzwCCbelVHxPePg0al6q6kQCAheTaao/TjccKU36K2E0FB7
	 iu9j+Fj87Pe4w==
Date: Tue, 25 Feb 2025 22:18:13 +0000
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
Message-ID: <20250225221812.GA23870@willie-the-truck>
References: <20250217140419.1702389-1-ryan.roberts@arm.com>
 <20250217140419.1702389-3-ryan.roberts@arm.com>
 <20250221153156.GC20567@willie-the-truck>
 <6ebf36f2-2e55-49b2-8764-90fd972d6e66@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6ebf36f2-2e55-49b2-8764-90fd972d6e66@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_141824_897721_A8925A82 
X-CRM114-Status: GOOD (  20.18  )
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

On Mon, Feb 24, 2025 at 12:11:19PM +0000, Ryan Roberts wrote:
> On 21/02/2025 15:31, Will Deacon wrote:
> > On Mon, Feb 17, 2025 at 02:04:15PM +0000, Ryan Roberts wrote:
> >> +	pte = __ptep_get_and_clear(mm, addr, ptep);
> >> +	present = pte_present(pte);
> >> +	while (--ncontig) {
> >> +		ptep++;
> >> +		addr += pgsize;
> >> +		tmp_pte = __ptep_get_and_clear(mm, addr, ptep);
> >> +		if (present) {
> >> +			if (pte_dirty(tmp_pte))
> >> +				pte = pte_mkdirty(pte);
> >> +			if (pte_young(tmp_pte))
> >> +				pte = pte_mkyoung(pte);
> >> +		}
> >>  	}
> > 
> > nit: With the loop now structured like this, we really can't handle
> > num_contig_ptes() returning 0 if it gets an unknown size. Granted, that
> > really shouldn't happen, but perhaps it would be better to add a 'default'
> > case with a WARN() to num_contig_ptes() and then add an early return here?
> 
> Looking at other users of num_contig_ptes() it looks like huge_ptep_get()
> already assumes at least 1 pte (it calls __ptep_get() before calling
> num_contig_ptes()) and set_huge_pte_at() assumes 1 pte for the "present and
> non-contig" case. So num_contig_ptes() returning 0 is already not really
> consumed consistently.
> 
> How about we change the default num_contig_ptes() return value to 1 and add a
> warning if size is invalid:

Fine by me!

I assume you'll fold that in and send a new version, along with the typo
fixes?

Cheers,

Will

