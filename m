Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DDE6F31E21
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 14:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9C+NpEKos04qPELYWWqTjo60xTv/UJSaxtWUp97Wxog=; b=g6JSFi7NGMpKLQg7o+6RT6WhrY
	xk9vkteKa0a9aPMmiASyixmhpk/zynnQBpxj4PkAmSLikyrV4CYUdDirAYx6+YWg1YvqVYjMzrHi1
	AGPqVsZ/1qPY4RYLmFvHradX9qYJyO6CjEqR986RtVmBVanJMNKdl5O7/U/vntoNQl7tRBu8gnQq4
	aeEpu5A7hOxEIGDuhgjijFJknQvFUIXiD6kihO5j4qPp7II8/9aH5C15B0bc12tbIQIHWo3zgx5XH
	JXUU15KH6rcIsCUphl6RCPokdmLjqrrOuWQfUUNmxHYTHAl1sJEaekMxtErEEATik1ZhTCAIhwZhW
	RS7KJKXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAqGI-0000000AgKv-3qqN;
	Thu, 09 Apr 2026 14:21:39 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAqFs-0000000AgDG-06to
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 14:21:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=9C+NpEKos04qPELYWWqTjo60xTv/UJSaxtWUp97Wxog=; b=RrhOlAbwPvZR/LsA2IHp9I2pnU
	ItnDtGi8y4npn4wzlm+PE6o+cCwWsHI3L9Rumy/YjLsyuHrzYgH1lUsknw4HHJceXjJPcnxdvb4Ih
	7pbSsiYsB2EuHWmkdEVHjvvzm5ffw66zipyN4Km86ifUbMsQj9qGRP0GXQkuJ800qNbwbuT9UT//V
	qkmcEhpRfjFdUBqFNfgZRfhsI/bipGMbri/9KGyDoJM/M6kMNnXnH6ooizs/vDPJ3ei1tNJqMusYx
	6vUUCW1KzJ/kT++/V+O69VXv+eIctNGVZ0AYxRciHenNG2k6E3qnIanH5KB7p+wgs5z5UqpEj2EcM
	wN0CPBZg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:60924)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1wAqFo-000000003hw-0TBl;
	Thu, 09 Apr 2026 15:21:08 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1wAqFm-000000004Sy-2bp8;
	Thu, 09 Apr 2026 15:21:06 +0100
Date: Thu, 9 Apr 2026 15:21:06 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Will Deacon <will@kernel.org>
Cc: Brian Ruley <brian.ruley@gehealthcare.com>,
	Steve Capper <steve.capper@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/arm: pgtable: remove young bit check for
 pte_valid_user
Message-ID: <ade10izJR3YocPr0@shell.armlinux.org.uk>
References: <20260409125446.981747-1-brian.ruley@gehealthcare.com>
 <adewJetUv6wMiz9o@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adewJetUv6wMiz9o@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_072112_460107_A394462A 
X-CRM114-Status: GOOD (  36.59  )
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

On Thu, Apr 09, 2026 at 02:56:53PM +0100, Will Deacon wrote:
> On Thu, Apr 09, 2026 at 03:54:45PM +0300, Brian Ruley wrote:
> > Fixes cache desync, which can cause undefined instruction,
> > translation and permission faults under heavy memory use.
> > 
> > This is an old bug introduced in commit 1971188aa196 ("ARM: 7985/1: mm:
> > implement pte_accessible for faulting mappings"), which included a check
> > for the young bit of a PTE. The underlying assumption was that old pages
> > are not cached, therefore, `__sync_icache_dcache' could be skipped
> > entirely.
> > 
> > However, under extreme memory pressure, page migrations happen
> > frequently and the assumption of uncached "old" pages does not hold.
> > Especially for systems that do not have swap, the migrated pages are
> > unequivocally marked old. This presents a problem, as it is possible
> > for the original page to be immediately mapped to another VA that
> > happens to share the same cache index in VIPT I-cache (we found this
> > bug on Cortex-A9). Without cache invalidation, the CPU will see the
> > old mapping whose physical page can now be used for a different
> > purpose, as illustrated below:
> > 
> >                 Core                      Physical Memory
> >   +-------------------------------+     +------------------+
> >   | TLB                           |     |                  |
> >   |  VA_A 0xb6e6f -> pfn_q        |     | pfn_q: code      |
> >   +-------------------------------+     +------------------+
> >   | I-cache                       |
> >   |  set[VA_A bits] | tag=pfn_q   |
> >   +-------------------------------+
> > 
> > migrate (kcompactd):
> >   1. copy pfn_q --> pfn_r
> >   2. free pfn_q
> >   3. pte: VA_a -> pfn_r
> >   4. pte_mkold(pte) --> !young
> >   5. ICIALLUIS skipped (because !young)
> > 
> > pfn_src reused (OOM pressure):
> >   pte: VA_B -> pfn_q (different code)
> > 
> > bug:
> >                 Core                      Physical Memory
> >   +-------------------------------+     +------------------+
> >   | TLB (empty)                   |     | pfn_r: old code  |
> >   +-------------------------------+     | pfn_q: new code  |
> >   | I-cache                       |     +------------------+
> >   |  set[VA_A bits] | tag=pfn_q   |<--- wrong instructions
> >   +-------------------------------+
> 
> (nit: Do you have pfn_r and pfn_q mixed up in the "Physical Memory" box?)
> 
> > This was verified on ba16-based board (i.MX6Quad/Dual, Cortex-A9) by
> > instrumenting the migration code to track recently migrated pages in a
> > ring buffer and then dumping them in the undefined instruction fault
> > handler. The bug can be triggered with `stress-ng':
> > 
> >   stress-ng --vm 4 --vm-bytes 2G --vm-method zero-one --verify
> > 
> > Note that the system we tested on has only 2G of memory, so the test
> > triggered the OOM-killer in our case.
> > 
> > Fixes: 1971188aa196 ("ARM: 7985/1: mm: implement pte_accessible for faulting mappings")
> > Signed-off-by: Brian Ruley <brian.ruley@gehealthcare.com>
> > ---
> >  arch/arm/include/asm/pgtable.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm/include/asm/pgtable.h b/arch/arm/include/asm/pgtable.h
> > index 6fa9acd6a7f5..e3a5b4a9a65f 100644
> > --- a/arch/arm/include/asm/pgtable.h
> > +++ b/arch/arm/include/asm/pgtable.h
> > @@ -185,7 +185,7 @@ static inline pte_t *pmd_page_vaddr(pmd_t pmd)
> >  #define pte_exec(pte)		(pte_isclear((pte), L_PTE_XN))
> >  
> >  #define pte_valid_user(pte)	\
> > -	(pte_valid(pte) && pte_isset((pte), L_PTE_USER) && pte_young(pte))
> > +	(pte_valid(pte) && pte_isset((pte), L_PTE_USER))
> 
> This patch is from twelve years ago, so please forgive me for having
> forgotten all of the details. However, my recollection is that when using
> the classic/!lpae format (as you will be on Cortex-A9), page aging is
> implemented by using invalid (translation faulting) ptes for 'old'
> mappings.

It is.

> So in the case you describe, we may well elide the I-cache maintenance,
> but won't we also put down an invalid pte?

Correct.

> If we later take a fault
> on that, we should then perform the cache maintenance when installing
> the young entry (via ptep_set_access_flags()).

Correct again.

> The more interesting part
> is probably when the mapping for 'VA_B' is installed to map 'pfn_q' but,
> again, I would've expected the cache maintenance to happen just prior to
> installing the valid (young) mapping.

Also correct - for the new PTE to become accessible in userspace, we
would need to establish a young PTE, which will result in set_ptes()
being called, and that should trigger __flush_icache_all() which will
flush the _entire_ instruction cache, which will remove any stale
entries for the old mapping that is no longer accessible.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

