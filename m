Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3331C5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 14:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9oIKk6YNq2Rqd91/MJYNEf5wAqPlINb6VhTKN9sJyJ4=; b=izfX4hkrVuLRWYkTXrSwgmSbEJ
	dmqHM9Zxy4yrU288WP9KDK+ndoiDWoW4Wug1a/fPYm+9EQATunJdplqiZgAE4FrBb4iCQOZeSR/D1
	g1CMMVpE4RAvS/4Ul2CHuiFUZR/3XWRTIA+6KpXwA+wW5S9eQVopdGMOCmTes/sUW+KwMkjFisJLe
	XujAgqnGLaEgjK5ZhmFc/fDR+WASeN4yyfoqe7ZMGb1cwEyCqKSQdRW8hcufE8ubw9GTr7D94gJKu
	FfMs+q28JMRlY2SUhrJe3TrspKMpZ7AchFEEPWckxtBF4ObVTu0CFdPBEoKjaJ0IU//yicG5faRWZ
	tHX6AUFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsLTQ-00000008GAd-10Le;
	Fri, 07 Aug 2026 14:23:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsLTN-00000008G9k-1zDB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 14:22:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B3F841516;
	Fri,  7 Aug 2026 07:22:51 -0700 (PDT)
Received: from thinkpad-e142931.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 234DA3F9A2;
	Fri,  7 Aug 2026 07:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786112575; bh=r9kab6txueHD+ZYfKgqlHdXTySwAoOlw+inr3Z5s1SU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qJs8kBaDFR6MWXa+CS6fHTFVvNkkQHTJgpAr4AUK2RDB/CA9G+9dyjIhXQe94nNKQ
	 mNUDX8eweNIxD9im8vzt8gH36N/IzgEemCIijw4EFGjtlYADmbuNfvZ0uy10bmXK80
	 tY6yTq1cVpgR+G9I99+L+KENdTXVESVAbGikcOmQ=
Date: Fri, 7 Aug 2026 15:22:23 +0100
From: Wei-Lin Chang <weilin.chang@arm.com>
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	"David Hildenbrand (Arm)" <david@kernel.org>, Matt Fleming <matt@codeblueprint.co.uk>, 
	Ard Biesheuvel <ardb@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Sebastian Ene <sebastianene@google.com>, Vincent Donnefort <vdonnefort@google.com>
Subject: Re: [PATCH v2 1/2] arm64: ptdump: Make note_page_flush() range aware
Message-ID: <6psvlhoi727cullfgafzjjtih24setwhm3pfbyeakliytw6ft7@lfk3to4l7huv>
References: <20260724185431.2990395-1-weilin.chang@arm.com>
 <20260724185431.2990395-2-weilin.chang@arm.com>
 <anXFo-igVdqrCogQ@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anXFo-igVdqrCogQ@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_072257_591147_1B758377 
X-CRM114-Status: GOOD (  27.77  )
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

Hi Will,

On Fri, Aug 07, 2026 at 12:46:43PM +0100, Will Deacon wrote:
> On Fri, Jul 24, 2026 at 07:54:30PM +0100, Wei-Lin Chang wrote:
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
> > To fix this, use ptdump_state.range[] to figure out where the address
> > space ends, and call note_page() with that.
> > 
> > Fixes: 9d80448ac92b ("efi/arm64: Add debugfs node to dump UEFI runtime page tables")
> > Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>
> > ---
> >  arch/arm64/mm/ptdump.c | 17 ++++++++++++++++-
> >  1 file changed, 16 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/mm/ptdump.c b/arch/arm64/mm/ptdump.c
> > index 1c20144700d7..5b34060ceb96 100644
> > --- a/arch/arm64/mm/ptdump.c
> > +++ b/arch/arm64/mm/ptdump.c
> > @@ -278,9 +278,24 @@ void note_page_pgd(struct ptdump_state *pt_st, unsigned long addr, pgd_t pgd)
> >  
> >  void note_page_flush(struct ptdump_state *pt_st)
> >  {
> > +	const struct ptdump_range *range = pt_st->range;
> > +	unsigned long end = 0;
> >  	pte_t pte_zero = {0};
> >  
> > -	note_page(pt_st, 0, -1, pte_val(pte_zero));
> > +	while (range->start != range->end) {
> > +		end = range->end;
> > +		range++;
> > +	}
> 
> This seems to be duplicating some of what the core code does already in
> ptdump_walk_pgd(). Can we retrieve the information we need from the
> containing 'struct ptdump_pg_state' structure instead of recomputing
> the address?

I can add a member end_address in ptdump_pg_state, and initialize it
with the last range->end when users initialize ptdump_pg_state
(ptdump_walk() and ptdump_check_wx()). Is that what you had in mind?

Thanks,
Wei-Lin Chang

> 
> Will

