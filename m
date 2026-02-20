Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3528C5ACD3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 16:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dpC/1J12n3U/xVvfBCM+9w6WNNRPc5gPuNn/8ZjY3r8=; b=eZbE5jJkBvtOmNzh2NMw6q2gby
	G8e2JO87iMZ4+Wod/fIESeURkAyK7lUpBdpWpc9bKTQXu204uCvLp9QRsTIBqFokRK0VkonHUDnqX
	5O0ZDlVqI/IItL+3dw1Nf6d7WAtJfJev56yRvXa7+86Jilj8Jmwil1j7uP7fcCFwhf46i/czqmlwR
	73ROjdJyE4tNZUvYrXaWIX19fi7I/TRyRPsnlkTxCscUV05sRqjRpR3A+ljUJJbI2XLjJS3+JDba/
	F/OF8kGkVrCAmz45vi9//x4b5KteS8nStafyQUT2bg/fK5VLzppWcO1XQyVfR9M251N2CI7eFIGk+
	1ExDuSmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtTd1-0000000FJN2-1WOW;
	Fri, 20 Feb 2026 16:45:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtTcz-0000000FJMY-2obw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 16:45:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 40CFC339;
	Fri, 20 Feb 2026 08:45:09 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 843283F62B;
	Fri, 20 Feb 2026 08:45:14 -0800 (PST)
Date: Fri, 20 Feb 2026 16:45:11 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, Mark Brown <broonie@kernel.org>,
	Will Deacon <will@kernel.org>,
	Emanuele Rocca <emanuele.rocca@arm.com>,
	Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 1/3] arm64: gcs: Do not set PTE_SHARED on GCS mappings if
 FEAT_LPA2 is enabled
Message-ID: <aZiPl4fQUuU00uJl@arm.com>
References: <20260220140532.285011-1-catalin.marinas@arm.com>
 <20260220140532.285011-2-catalin.marinas@arm.com>
 <42e1608b-5a01-4f9c-992f-a1d3a3e54f99@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <42e1608b-5a01-4f9c-992f-a1d3a3e54f99@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_084517_836619_83F5B226 
X-CRM114-Status: GOOD (  25.72  )
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

On Fri, Feb 20, 2026 at 04:56:26PM +0100, David Hildenbrand wrote:
> On 2/20/26 15:05, Catalin Marinas wrote:
> > When FEAT_LPA2 is enabled, bits 8-9 of the PTE replace the
> > shareability attribute with bits 50-51 of the output address. The
> > _PAGE_GCS{,_RO} definitions include the PTE_SHARED bits as 0b11 and they
> > match the other user _PAGE_* prot macros.
> 
> I assume that comes from _PAGE_DEFAULT -> _PROT_DEFAULT

Yes.

> > However, the difference is
> > that all the classic prot values are accessed via protection_map[] and
> > have the PTE_SHARED bits removed when LPA2 is enabled.
> > 
> > Ensure that PAGE_GCS{,RO} use the dynamic PTE_MAYBE_SHARED instead of
> > the static PTE_SHARED.
> 
> I expected here a quick description of the symptom: "Leaving PTE_SHARED set
> results in kernel panics." etc. :)

Ah, yes, I forgot to give the details of the fault - a lot worse with
THP, unhandled page fault, or bad page warning with small pages. I'll
respin with some better comment.

> > diff --git a/arch/arm64/include/asm/pgtable-prot.h b/arch/arm64/include/asm/pgtable-prot.h
> > index 161e8660eddd..a65f2c50e9ca 100644
> > --- a/arch/arm64/include/asm/pgtable-prot.h
> > +++ b/arch/arm64/include/asm/pgtable-prot.h
> > @@ -164,8 +164,8 @@ static inline bool __pure lpa2_is_enabled(void)
> >   #define _PAGE_GCS	(_PAGE_DEFAULT | PTE_NG | PTE_UXN | PTE_WRITE | PTE_USER)
> >   #define _PAGE_GCS_RO	(_PAGE_DEFAULT | PTE_NG | PTE_UXN | PTE_USER)
> > -#define PAGE_GCS	__pgprot(_PAGE_GCS)
> > -#define PAGE_GCS_RO	__pgprot(_PAGE_GCS_RO)
> > +#define PAGE_GCS	__pgprot((_PAGE_GCS & ~PTE_SHARED) | PTE_MAYBE_SHARED)
> > +#define PAGE_GCS_RO	__pgprot((_PAGE_GCS_RO & ~PTE_SHARED) | PTE_MAYBE_SHARED)
> >   #define PIE_E0	( \
> >   	PIRx_ELx_PERM_PREP(pte_pi_index(_PAGE_GCS),           PIE_GCS)  | \
> > diff --git a/arch/arm64/mm/mmap.c b/arch/arm64/mm/mmap.c
> > index 08ee177432c2..2e404441063b 100644
> > --- a/arch/arm64/mm/mmap.c
> > +++ b/arch/arm64/mm/mmap.c
> > @@ -87,7 +87,7 @@ pgprot_t vm_get_page_prot(vm_flags_t vm_flags)
> >   	/* Short circuit GCS to avoid bloating the table. */
> >   	if (system_supports_gcs() && (vm_flags & VM_SHADOW_STACK)) {
> > -		prot = _PAGE_GCS_RO;
> > +		prot = pgprot_val(PAGE_GCS_RO);
> >   	} else {
> >   		prot = pgprot_val(protection_map[vm_flags &
> >   				   (VM_READ|VM_WRITE|VM_EXEC|VM_SHARED)]);
> 
> The only confusion I have is why we don't update _PAGE_GCS/_PAGE_GCS_RO,
> consequently leaving PTE_SHARED set for the other users of
> _PAGE_GCS/_PAGE_GCS_RO in arch/arm64/include/asm/pgtable-prot.h.
> 
> Staring at pte_pi_index() (and the definitions of PTE_PI_IDX_0), I assume it
> doesn't matter.
> 
> Just curious why we don't fixup _PAGE_GCS / _PAGE_GCS_RO instead.

_PAGE_GCS needs to be constant as it ends up in asm, so we can't add
the dynamic PTE_MAYBE_SHARED. There are other ways to solve this but it
is somewhat more consistent with the other _PAGE_* definitions which all
have PTE_SHARED.

Well, that's for a quick fix that can be easily backported. We could
overhaul these macros to make them clearer.

-- 
Catalin

