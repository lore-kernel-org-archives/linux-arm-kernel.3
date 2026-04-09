Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 035D3F31E21
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 14:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=86+orXd7CoLqu8Hi6VtL3nrx22y6AG/qCp5X8VhqJn8=; b=SfmRArU/AVnXlkgpvmzyGpFXo3
	c5ze36r+HrxGqD0ZN3l86AlCpiaogiRjOeEyF52GcYXgjB8Ut9aBY7kCbMT85xeN8Tc4ODlqEu5L5
	oZ+74B83C7AESR8LIGwj5LMPj5gWFwLmkwxw9eAV7zJgYKlF9plykoDHmc5npFbr4YQfDkszbcZR6
	UEXSn6kNPm80YHAZVVzykNOifioD9M9ENzXYN8FLeOxc+8J0/SwuHklAYJbZVULu0HGZRuG3PymOS
	jsqbFQuS8yh94DrlIkl39SIfchxlMhsh9NHvT6UwA8u1BSM0s1IZ73ebGBTtEW4LDuwcwSBWoiWdv
	lX8ODQfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAqbv-0000000Aix7-238L;
	Thu, 09 Apr 2026 14:43:59 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAqbt-0000000Aiwi-26kg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 14:43:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=86+orXd7CoLqu8Hi6VtL3nrx22y6AG/qCp5X8VhqJn8=; b=OGEuqDdvF578vL1xPD3wkEmAgG
	oRwRZPV8vDa6ngCt8p6VsJj2W61bvsGG8MyKKE1X57soiOwQdKBKnrbZlZgk8Vrz8ZBr5a0GLptKP
	jIrdvEykloDtNoPxySRd5AdbwEqxEzbicHBrJ4BZ6cZoHgjbROZKRmMwvIbKCQaG8JYqtkJLp/+1n
	RdB2TxcAQDqW9jpHZCMsfESSBy5BaPyhS8uXDxS8Si/d+T84lbMNgZsnVbAfDnvcy//BJ54eX1fjv
	onLUEafVIpYfH5INh7ONRCecAzY0WY0rlIqXp59LRvFR8hnZmCX5tHmu5RSmdDYBhjXjMUlImNo0n
	3bp85VXg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:60330)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1wAqbp-000000003jL-0RXl;
	Thu, 09 Apr 2026 15:43:53 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1wAqbn-000000004U3-1etB;
	Thu, 09 Apr 2026 15:43:51 +0100
Date: Thu, 9 Apr 2026 15:43:51 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Will Deacon <will@kernel.org>
Cc: Brian Ruley <brian.ruley@gehealthcare.com>,
	Steve Capper <steve.capper@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/arm: pgtable: remove young bit check for
 pte_valid_user
Message-ID: <ade7JxU0V2RV3F2r@shell.armlinux.org.uk>
References: <20260409125446.981747-1-brian.ruley@gehealthcare.com>
 <adewJetUv6wMiz9o@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adewJetUv6wMiz9o@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_074357_542731_E0B45240 
X-CRM114-Status: GOOD (  25.95  )
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

I don't think so. pfn_r contains the code that _was_ in pfn_q before
the migration happened (the migration copied pfn_q to pfn_r).

Then, a short time later, the page for pfn_r is reallocated, with new
code placed into it, and then a new PTE is established for pfn_q -
however, this should be a young PTE (which will be necessary for the
mapping to be visible to userspace), and thus should cause
__sync_icache_dcache() to be called, resulting in __flush_icache_all()
if it is an executable mapping.

If it isn't an executable mapping (because pfn_q isn't code) then we
will skip the __flush_icache_all() for the new mapping.

However, the I-cache for the old PTE that was pfn_r and now is pfn_q
will not be present in the physical page tables. An attempt to execute
code from that mapping should fault, causing the MM to mark that PTE
young, and, as it's executable, it should result in
__flush_icache_all() being called.

Like you, I can't see any issue here.

I think we need to know exactly what happened to the old PTE entry
and the newer PTE entry that was subsequently established on the
lead-up to the undefined instruction exception.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

