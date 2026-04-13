Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CCCAEBFD37
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 10:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rkyT/xGrfdYxKkf7+s31EPSjJ+5OwLJoWVHiWNEDXa8=; b=hSBFeS3f4YHWgibWpXWr8UZJ5M
	m0rIRDN9OIlGJr2LfZtPq4LVmhhr+/syCu/0XFAvwGkFCWk53AsCwXtUEBZ8wg4xJZvjyJfTlSFmi
	SST7tFv+rcvZ9qTOacSUZo6xX8ITiTvf8HXQx2evY5IcjcI2sDb5wx0M02Z4xUrt3lPykI8Z0RSEA
	NQxit1440VnsXEO90uqPswkbdvcLw7E1dxCg7yeM8f03QG62lLnr8VWikRjycLEOwehZGPi6Jipat
	OsJURcrOtPHpdhZ1vp3ANyc3miEDJyF7T6/RuQctmRMowGDRWAJoIT22wxmjBMHjXKD40mxXRUw/b
	0VdnfjiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCEzY-0000000FXRZ-2vjW;
	Mon, 13 Apr 2026 10:58:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCEzW-0000000FXQp-4260
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 10:58:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 26F42439FC;
	Mon, 13 Apr 2026 10:58:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B091CC116C6;
	Mon, 13 Apr 2026 10:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776077886;
	bh=1q8mMSzFfHFD4VJxv75XPl+1LHtJHSntvdrBWaamK5c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XM0tJ4BQ3t30qOb7FA4VzH7ObrudEH9GhfUbWZbfYH1/fouIPCLSM2Z37TzrmS3ue
	 0ZiU/5wVph6pj+OCq5G4EVlpX1SNki/Wps76v/wHK9gMOElOFfIt97ere+CXD0j5dH
	 /cTvfQ76OvZlz8QBf0o8k6k43WLQ1LM5U9dN3nxUdcwgCS+CQHC110Tc4MlrClfGwk
	 FdGqXftdZ1KweKurn7W9BBMcHMoj1KeqKzSBqsIxcWWvxzIF3pvz+Avt08OEvr6ACf
	 3apR73LdL2wbyl8JpJb2Y2a89YudKwIuzcODz0P5B+k9JAcCf+XUP/7bLRgGtcBMbw
	 Ad1O5XEFJwkKw==
Date: Mon, 13 Apr 2026 11:58:01 +0100
From: Will Deacon <will@kernel.org>
To: Brian Ruley <brian.ruley@gehealthcare.com>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
	Steve Capper <steve.capper@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	catalin.marinas@arm.com
Subject: Re: [PATCH] mm/arm: pgtable: remove young bit check for
 pte_valid_user
Message-ID: <adzMOdySgMIePcue@willie-the-truck>
References: <20260409125446.981747-1-brian.ruley@gehealthcare.com>
 <adewJetUv6wMiz9o@willie-the-truck>
 <adfDEMK8EbIjPu3J@zoo11.fihel.lab.ge-healthcare.net>
 <adfNN33QIOP3VfDm@shell.armlinux.org.uk>
 <adjYlUk8_JjPivNi@zoo11.fihel.lab.ge-healthcare.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adjYlUk8_JjPivNi@zoo11.fihel.lab.ge-healthcare.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_035807_037533_F1B30DA0 
X-CRM114-Status: GOOD (  37.77  )
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

On Fri, Apr 10, 2026 at 02:01:41PM +0300, Brian Ruley wrote:
> On Apr 09, Russell King (Oracle) wrote:
> > 
> > On Thu, Apr 09, 2026 at 06:17:36PM +0300, Brian Ruley wrote:
> > > However, in the case I describe, if VA_B is mapped immediately to pfn_q
> > > after it been has unmapped and freed for VA_A, then it's quite possible
> > > that the page is still indexed in the cache.
> > 
> > True.
> > 
> > > The hypothesis is that if
> > > VA_A and VA_B land in the same I-cache set and VA_A old cache entry
> > > still exists (tagged with pfn_q), then the CPU can fetch stale
> > > instructions because the tag will match. That's one reason why we need
> > > to invalidate the cache, but that will be skipped in the path:
> > >
> > >     migrate_pages
> > >      migrate_pages_batch
> > >       migrate_folio_move
> > >        remove_migration_ptes
> > >         remove_migration_pte
> > >          set_pte_at
> > >           set_ptes
> > >            __sync_icache_dcache  (skipped if !young)
> > >             set_pte_ext
> > 
> > In this case, if the old PTE was marked !young, then the new PTE will
> > have:
> >         pte = pte_mkold(pte);
> > 
> > on it, which marks it !young. As you say, __sync_icache_dcache() will
> > be skipped. While a PTE entry will be set for the kernel, the code in
> > set_pte_ext() will *not* establish a hardware PTE entry. For the
> > 2-level pte code:
> > 
> >         tst     r1, #L_PTE_YOUNG        @ <- results in Z being set
> >         tstne   r1, #L_PTE_VALID        @ <- not executed
> >         eorne   r1, r1, #L_PTE_NONE     @ <- not executed
> >         tstne   r1, #L_PTE_NONE         @ <- not executed
> >         moveq   r3, #0                  @ <- hardware PTE value
> >  ARM(   str     r3, [r0, #2048]! )      @ <- writes hardware PTE
> > 
> > So, for a !young PTE, the hardware PTE entry is written as zero,
> > which means accesses should fault, which will then cause the PTE to
> > be marked young.
> > 
> > For the 3-level case, the L_PTE_YOUNG bit corresponds with the AF bit
> > in the PTE, and there aren't split Linux / hardware PTE entries. AF
> > being clear should result in a page fault being generated for the
> > kernel to handle making the PTE young.
> > 
> > In both of these cases, set_ptes() will need to be called with the
> > updated PTE which will now be marked young, and that will result in
> > the I-cache being flushed.
> 
> Hi Russell,
> 
> Thank you for the clarification, this is very educational for me.
> I understand your scepticism, and I can't explain what's going on based
> on what you replied. However, I do honestly believe there is a problem
> here. I'll share the exact testing details and the instrumentation
> we added that convinced us to reach out at the end. One idea we also
> had was that could cache aliasing be happening here.

I thought a bit more about this over the weekend and started to wonder
if there's a potential race where multiple CPUs try to write the same
PTE and don't synchronise properly on the cache-maintenance.

In particular, PG_dcache_clean is manipulated with a test_and_set_bit()
operation _before_ the cache maintenance is performed, so there's a
small window where the flag is set but the page is _not_ clean. I don't
think that matters with regards to invalid migration entries, but
perhaps the migration just means that we end up putting down a bunch of
'old' entries and are then more likely to see concurrent faults trying
to make the thing young again, potentially hitting this race.

Looking at arm64 this morning, I noticed that we split the flag
manipulation so that it's set with a set_bit() after the maintenance has
been performed. Git then points to 588a513d3425 ("arm64: Fix race
condition on PG_dcache_clean in __sync_icache_dcache()") which seems to
talk about the same race. In fact, the mailing list posting:

  https://lore.kernel.org/all/20210514095001.13236-1-catalin.marinas@arm.com/

points out that arch/arm/ is also affected but we forgot to CC Russell
because I think this all came out of the MTE-enablement work [1] and it
sounds like Catalin was trying to fix it in the core mprotect() code.

Brian, can you try something like 588a513d3425?

Will

[1] https://lore.kernel.org/all/YJGHApOCXl811VK3@arm.com/

