Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1DD0C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 15:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wEVxSyjeIdld2jm3kmxNAHduiX5gYsx/+SXdaDpe998=; b=2/N4H2iHIH8fT9D3nZfWg+d5lT
	RQnWqVWAxMPm7OXjby/m5tT52PzyF1LjbWNan4deXtOg/ha0A9eJdWaXMPDL3+AOzN3e+C07HJ3yc
	vrffkCQpyFyJM5K4xFit8rONZOtU0gLT+LmvLr+z9E0yRE0T6RSGp+ywuwG1+gAZQVNJGFvUbjZn+
	qqY8V0oIqh4tlSQ2tDkX54dUkrdi31E2obW5RIdirqkhVKmS2YWrmjkveB/hnlkite+v7N0gXVFq6
	47wjbN8BpXXCNzkvDZkgFVgdotyaySMxxSR6Qrpd+YQI7XyWwf7RmaQvu8SOlYgaXwyHpLeJtPKGO
	dNFp22ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uixWx-0000000AtlG-2SES;
	Mon, 04 Aug 2025 15:55:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uix0s-0000000AmCk-12SQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 15:22:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3034D1E4D;
	Mon,  4 Aug 2025 08:22:01 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F071F3F673;
	Mon,  4 Aug 2025 08:22:06 -0700 (PDT)
Date: Mon, 4 Aug 2025 16:22:04 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Wei-Lin Chang <r09922117@csie.ntu.edu.tw>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Sebastian Ene <sebastianene@google.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH] KVM: arm64: ptdump: Fix exec attribute printing
Message-ID: <aJDQHMbiNVToTbum@J2N7QTR9R3>
References: <20250802104021.3076621-1-r09922117@csie.ntu.edu.tw>
 <d72b7928-8646-4616-a8f0-96b9d9bbaf09@arm.com>
 <z2hmwwmtgbrio2wv3sj2pc4zhxdjioorlhnm45o2arcsjahjni@xod435q26jqq>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <z2hmwwmtgbrio2wv3sj2pc4zhxdjioorlhnm45o2arcsjahjni@xod435q26jqq>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_082210_377681_328F957D 
X-CRM114-Status: GOOD (  28.64  )
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

On Mon, Aug 04, 2025 at 08:41:35PM +0800, Wei-Lin Chang wrote:
> Hi Anshuman,
> 
> On Sun, Aug 03, 2025 at 07:33:04PM +0530, Anshuman Khandual wrote:
> > 
> > 
> > On 02/08/25 4:10 PM, Wei-Lin Chang wrote:
> > > Currently the guest stage-2 page table dump has the executable attribute
> > > printed in reverse, showing "X" for a non-executable region and showing
> > > " " for an executable one. This is caused by misjudgement of which
> > > string gets printed for the executable and non-executable case. Fix it
> > > by swapping the two strings.
> > > 
> > > Signed-off-by: Wei-Lin Chang <r09922117@csie.ntu.edu.tw>
> > > ---
> > >  arch/arm64/kvm/ptdump.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/arch/arm64/kvm/ptdump.c b/arch/arm64/kvm/ptdump.c
> > > index 098416d7e5c25..99fc13f1c11fb 100644
> > > --- a/arch/arm64/kvm/ptdump.c
> > > +++ b/arch/arm64/kvm/ptdump.c
> > > @@ -44,8 +44,8 @@ static const struct ptdump_prot_bits stage2_pte_bits[] = {
> > >  	}, {
> > >  		.mask	= KVM_PTE_LEAF_ATTR_HI_S2_XN | PTE_VALID,
> > >  		.val	= PTE_VALID,
> > > -		.set	= " ",
> > > -		.clear	= "X",
> > > +		.set	= "X",
> > > +		.clear	= " ",
> > >  	}, {

I think the big problem here is that we've included the 'PTE_VALID' bit
in the mask. We don't bother with that for the Stage-1 ptdump code, e.g.

        {
                .mask   = PTE_PXN,
                .val    = PTE_PXN,
                .set    = "NX",
                .clear  = "x ",
        },

.... so do we actually need to take the PTE_VALID bit into account here? Do
invalid Stage-2 entries have anything we don't want to report?

... or can we change the Stage-2 ptdump code to have:

	{
		.mask	= KVM_PTE_LEAF_ATTR_HI_S2_XN,
		.val	= KVM_PTE_LEAF_ATTR_HI_S2_XN,
		.set	= "NX",
		.clear	= "x ",
	},

... and match the Stage-1 code?

Otherwise, maybe we can add a separate valid-only filter.

> > >  		.mask	= KVM_PTE_LEAF_ATTR_LO_S2_AF | PTE_VALID,
> > >  		.val	= KVM_PTE_LEAF_ATTR_LO_S2_AF | PTE_VALID,
> > 
> > Is not KVM_PTE_LEAF_ATTR_HI_S2_XN already in the reverse semantics aka
> > XN (Execute Never). Hence when KVM_PTE_LEAF_ATTR_HI_S2_XN macro is set
> > that means the entry is not executable and vice versa.
> 
> Yes you are correct. However in dump_prot() we have:
> 
> if ((st->current_prot & bits->mask) == bits->val)
> 	s = bits->set;
> else
> 	s = bits->clear;
> 
> Analysis:
> 
> 1. region is executable:
>     - st->current_prot == PTE_VALID (ignore other bits)
>     - st->current_prot & bits->mask gets PTE_VALID
>     - if condition is true (.val is PTE_VALID)
>     - prints bits->set
> 
> 2. region is not executable:
>     - st->current_prot == KVM_PTE_LEAF_ATTR_HI_S2_XN | PTE_VALID
>     - st->current_prot & bits->mask gets (KVM_PTE_LEAF_ATTR_HI_S2_XN | PTE_VALID)
>     - if condition is false
>     - prints bits->clear

As above, this is because the PTE_VALID bit has been placed into the
mask, and that's not how the ptdump code was intended to be used.

> Therefore we want .set = "X", and .clear = " ".

That'll work around the problem, but I'm not sure that's the right fix.
If nothing else, it's *very* confusing.

Mark.

