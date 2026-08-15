Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6889EC5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Aug 2026 23:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=phQQweboIUAOOs9PEHhe34EaG2AogRnvGk+lUjHue6M=; b=I8ibHl5Dq35yoV/IbammICFF5f
	MWlSEmOX3p63PXrtI2KQkHpCYyqvvzOPoemRHMfyV0jkaT5JrTyjhntCJ7iTsmmIejpwWx0PsOVLn
	42J2b3l61fO3pZHgvtzS4hnsRPNWrRFJyaS0jItZTxCHbKo+5vPWxfobcM5PmMj8vGa5Gc85LuI16
	3K5h0kqiJ/xyAh1aUiMR7lOZymKcYjfH2YoNnxO8AA0J7+TR29/Ck3G+1mdCcfR9SJ9UJt2hGvOnU
	SEJqiqxSSRtbxj5wU+ELc0Frdc8xvMcjOtLtDgMaud/Kdxy7LDqKGsrLOfCvjSWno3I2dje0yfttD
	lOE3KqAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvNcn-00000004Gt4-1yM0;
	Sat, 15 Aug 2026 23:17:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvNcj-00000004GsR-3z9R
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Aug 2026 23:17:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 213651595;
	Sat, 15 Aug 2026 16:17:02 -0700 (PDT)
Received: from thinkpad-e142931.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C18A43F673;
	Sat, 15 Aug 2026 16:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786835826; bh=8dWFzPEwXCfNlKd3ulXMUiGewYd3drmAMj2AVyB9dYo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tWeP6ApFsjQbYHNW6x9y5vNOgax43IVyUpT5YwZYDhYczO1rD7fXPTo3n8CREyrQ5
	 TOpbC2Y3eQhvzUqVr+b2SGN2NpEreZxIiLjj2mxUwrxDsoZVUKQB9KM9qzHgK86/Lu
	 7vpN9Ng4l+cR7ZL7s0WfNIS8CtZOdomtehs0aR5k=
Date: Sun, 16 Aug 2026 00:16:54 +0100
From: Wei-Lin Chang <weilin.chang@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Oliver Upton <oupton@kernel.org>, Fuad Tabba <tabba@google.com>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	"David Hildenbrand (Arm)" <david@kernel.org>, Anshuman Khandual <anshuman.khandual@arm.com>, 
	Dev Jain <dev.jain@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Matt Fleming <matt@codeblueprint.co.uk>, 
	Vincent Donnefort <vdonnefort@google.com>, Sebastian Ene <sebastianene@google.com>
Subject: Re: [PATCH v3 1/2] arm64: ptdump: Make note_page_flush() range aware
Message-ID: <nuba4no4mrqwswozt6sesavtzqupg3z5z5icjs5a22etbwnb35@cdqbdvbg2w4a>
References: <20260814222458.584906-1-weilin.chang@arm.com>
 <20260814222458.584906-2-weilin.chang@arm.com>
 <86v79bzkq0.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86v79bzkq0.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260815_161710_182079_08CD337C 
X-CRM114-Status: GOOD (  32.43  )
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

On Sat, Aug 15, 2026 at 12:28:23PM +0100, Marc Zyngier wrote:
> On Fri, 14 Aug 2026 23:24:57 +0100,
> Wei-Lin Chang <weilin.chang@arm.com> wrote:
> > 
> > note_page_flush() calls note_page() with addr == 0 and level == -1 to
> > dump the last row of a ptdump. addr == 0 (1 << 64 wrapped around)
> > renders a huge region with enormous size for address spaces with
> > IA bits < 64. For example the stage-2 page tables and the EFI runtime
> > page table.
> > 
> > More importantly, the last region of the address space and everything
> > after the address space up to 1 << 64 are merged into one row of
> > output. If the last region within the address space is valid, it will
> > appear to remain valid up to 1 << 64 with the same attributes.
> > 
> > Currently only the EFI runtime ptdump is affected by this, but KVM will
> > soon fix its stage-2 ptdump by using note_page_flush(). Here is an
> > example of an EFI runtime ptdump (last row):
> > 
> > 0x0000008000000000-0x0000000000000000   17179868672G PGD
> > 
> > With this patch:
> > 
> > 0x0000008000000000-0x0001000000000000      261632G PGD
> > 
> > To fix this, cache the end address of a ptdump in ptdump_pg_state so
> > note_page_flush() can call the final note_page() with the correct end
> > address.
> > 
> > Fixes: 9d80448ac92b ("efi/arm64: Add debugfs node to dump UEFI runtime page tables")
> > Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>
> > ---
> >  arch/arm64/include/asm/ptdump.h |  2 ++
> >  arch/arm64/mm/ptdump.c          | 14 +++++++++++++-
> >  2 files changed, 15 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/include/asm/ptdump.h b/arch/arm64/include/asm/ptdump.h
> > index 5b374a6ab34a..1b743de7d89e 100644
> > --- a/arch/arm64/include/asm/ptdump.h
> > +++ b/arch/arm64/include/asm/ptdump.h
> > @@ -52,6 +52,8 @@ struct ptdump_pg_state {
> >  	const struct addr_marker *marker;
> >  	const struct mm_struct *mm;
> >  	unsigned long start_address;
> > +	/* exclusive end, ULONG_MAX represents an end at 1 << 64 */
> > +	unsigned long end_address;
> >  	int level;
> >  	ptval_t current_prot;
> >  	bool check_wx;
> > diff --git a/arch/arm64/mm/ptdump.c b/arch/arm64/mm/ptdump.c
> > index 1c20144700d7..eab400e744d9 100644
> > --- a/arch/arm64/mm/ptdump.c
> > +++ b/arch/arm64/mm/ptdump.c
> > @@ -278,9 +278,19 @@ void note_page_pgd(struct ptdump_state *pt_st, unsigned long addr, pgd_t pgd)
> >  
> >  void note_page_flush(struct ptdump_state *pt_st)
> >  {
> > +	struct ptdump_pg_state *st = container_of(pt_st, struct ptdump_pg_state, ptdump);
> > +	unsigned long end = st->end_address;
> >  	pte_t pte_zero = {0};
> >  
> > -	note_page(pt_st, 0, -1, pte_val(pte_zero));
> > +	/*
> > +	 * Address spaces that end at 1 << 64 have end_address == ULONG_MAX,
> > +	 * but note_page() expects the exclusive end. In this case adjust end
> > +	 * to the wraparound value 0.
> > +	 */
> > +	if (end == ULONG_MAX)
> > +		end = 0;
> > +
> > +	note_page(pt_st, end, -1, pte_val(pte_zero));
> >  }
> >  
> >  static void arm64_ptdump_walk_pgd(struct ptdump_state *st, struct mm_struct *mm)
> > @@ -303,6 +313,7 @@ void ptdump_walk(struct seq_file *s, struct ptdump_info *info)
> >  		.marker = info->markers,
> >  		.mm = info->mm,
> >  		.pg_level = &kernel_pg_levels[0],
> > +		.end_address = end,
> >  		.level = -1,
> >  		.ptdump = {
> >  			.note_page_pte = note_page_pte,
> > @@ -344,6 +355,7 @@ bool ptdump_check_wx(void)
> >  			{ -1, NULL},
> >  		},
> >  		.pg_level = &kernel_pg_levels[0],
> > +		.end_address = ~0UL,
> 
> nit: shouldn't this be ULONG_MAX instead? Yes, this is the same thing,
> but it doesn't hurt to match the documentation.

I wrote ~0UL because the range[] initialization was using ~0UL so I did
the same for consistency. I think changing them both to ULONG_MAX is the
better approach. I'll do that if a v4 is required.

Thanks,
Wei-Lin Chang

> 
> Thanks,
> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.

