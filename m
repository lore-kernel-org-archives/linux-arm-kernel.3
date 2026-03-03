Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C29DEDA68E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 15:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yeiMrjlYgT8Sq2sT0++e4byZu4zYjMPFIcXYU5H2Ipg=; b=Qw1ZgQg86iO5jDU89QkVVFUjeA
	2BkeThfpZNZVys+uE2hotlAcUOe109rxr9gdRcAI9Ht/+1HAvx4x8sBTXfaYFQw1hJkIO2PSXvPkI
	TwW5GSK72Yhha6lH9VgKSQe+evOc/GomF/fDzhHIIP4GQk/PqEcdgbDqb+gP2dTZVAqyWe3v7nb0h
	34+I3RmYHWYL1Yy4R4txqshwa67uDfdIKGSWApnuHxoOsTp+01KTdRlmz8aVhpM+rVYHdoWy98E7I
	p6JvT83M3sHlg3teBR5BbC+sNv+XJ8iDewBsJ6bWq6igybh8NEAbs1v9z8RKgJt3RfNR+skBRiRPo
	WVsPRpIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxRw4-0000000FS0c-37jO;
	Tue, 03 Mar 2026 15:45:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxRw2-0000000FRzo-1AO3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 15:45:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 201F4339;
	Tue,  3 Mar 2026 07:45:14 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6EE8F3F73B;
	Tue,  3 Mar 2026 07:45:18 -0800 (PST)
Date: Tue, 3 Mar 2026 15:45:15 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Ankur Arora <ankur.a.arora@oracle.com>,
	David Hildenbrand <david@kernel.org>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	James Clark <james.clark2@arm.com>
Subject: Re: [PATCH] arm64: Implement clear_pages()
Message-ID: <aacCCwgvo2J8CCEI@arm.com>
References: <20260303-aarch64-clear-pages-v1-1-ad0c3ee9a555@kernel.org>
 <aab0SvA0dU0R0pnl@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aab0SvA0dU0R0pnl@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_074522_365054_E16EC1F5 
X-CRM114-Status: GOOD (  22.84  )
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

On Tue, Mar 03, 2026 at 02:46:34PM +0000, Will Deacon wrote:
> On Tue, Mar 03, 2026 at 11:06:13AM +0100, Linus Walleij wrote:
> > On QEMU:
> > 
> > Before this patch:     After this patch:
> > 2.38 GB/s              2.41 GB/s
> 
> I really don't think we should pay attention to performance under QEMU
> as it doesn't necessarily have any correlation with real hardware.

I agree.

> > diff --git a/arch/arm64/include/asm/page.h b/arch/arm64/include/asm/page.h
> > index b39cc1127e1f..916a3e7c9a19 100644
> > --- a/arch/arm64/include/asm/page.h
> > +++ b/arch/arm64/include/asm/page.h
> > @@ -20,7 +20,18 @@ struct page;
> >  struct vm_area_struct;
> >  
> >  extern void copy_page(void *to, const void *from);
> > -extern void clear_page(void *to);
> > +extern void clear_pages_asm(void *addr, unsigned int nbytes);
> > +
> > +static inline void clear_pages(void *addr, unsigned int npages)
> > +{
> > +	clear_pages_asm(addr, npages * PAGE_SIZE);
> > +}
> > +#define clear_pages clear_pages
> 
> Hmm. From what I can tell, this just turns a branch in C code into a
> branch in assembly, so it's hard to correlate that meaningfully with
> the performance improvement you see.
> 
> If we have CPUs that are this sensitive to branches, perhaps we'd be
> better off taking the opposite approach and moving more code into C
> so that the compiler can optimise the control flow for us?

I think it's more than the loop branch - the whole DCZID_EL0 read to
decide whether to use DC ZVA or STNP. I wonder why we didn't do that
with an alternative than always read the sysreg.

That said, I wouldn't mind rewriting this in C if the numbers don't get
worse. It is a bit more involved if we keep the DC ZVA use, though with
alternatives maybe not that bad (mte_set_mem_tag_range() is an example
of doing something similar in C but for clear page we don't need to deal
with unaligned boundaries).

-- 
Catalin

