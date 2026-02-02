Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5736E7DF0F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 18:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KHBzlOOyF5s6+cu+XKXm5Mopl5YU7IKiZnMZgC4hhUw=; b=XV7iM4nr9zt9akT964HE4bNcxZ
	zj94kyfzOZBnYYNcSuPnK5nJhnkjXTJvQX4jjAqEu8iXarL3WH9SGYXiqhtC/FVKAIfPepi2dZPV7
	bPwOwvumODd5FnGlpS8d++YPsU8Q+n8I8BDfdfU4Eam1kVs2Weo4dLBZ1RtthJrO245QTtK619MEd
	qY0k2UZ/alkJ7ac0GH+SADFh+PH57NgzoVT8t3Dz2YL2e58eIxqztyjyAjyoezJTaxy7hzSx//Hgr
	9arBzax2XHz4WmO97IILRysGMlqUZ1xjZEZtBymAtBHMpWKgHflqPmQ87To9cL0WluHwuEu4w8Eek
	tZBycwpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmz6x-00000005Tf3-0DrF;
	Mon, 02 Feb 2026 18:57:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmz6v-00000005Tev-2Oco
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 18:57:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9781060010;
	Mon,  2 Feb 2026 18:57:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A3EFC116C6;
	Mon,  2 Feb 2026 18:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770058640;
	bh=EvH/CRh1Q3JQ5wjxo+wP7sP09MLf4rqLjdI4TQq0KoU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ga6Zn9SivhZuz8tmObUtlHGj6iFM4IL8Xqca4R39VAaaHtCu+ksRZv43YcSIKZwI7
	 B2fRg7mbsctSCIbGyXIUyFmwGTEFY2PhrwpDRsv2k99j1E3vELTz6uwVwCpcNgPdKF
	 h3BrqcS58DnEknVos06bsH6gtdxAFkfk/xDwcWtoeGrp+/aZyFOGwBt1MxjdBDYJRx
	 gXtg9l58EIrJE/PfS48MiIRLIiP+wkEirjsdApIhkvSoC3d1gNTMaHsjcHMBw6PNs/
	 flOfVE0xI2oVvROU3yz2t5g8og+p/Y0x184gftOkVB5vJh1xMLlANhi0OLNvCK0iVn
	 dtMGyNpxElZYQ==
Date: Mon, 2 Feb 2026 18:57:11 +0000
From: Will Deacon <will@kernel.org>
To: Leo Yan <leo.yan@arm.com>
Cc: James Clark <james.clark@linaro.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Alexandru Elisei <Alexandru.Elisei@arm.com>,
	Anshuman Khandual <Anshuman.Khandual@arm.com>,
	Rob Herring <Rob.Herring@arm.com>,
	Suzuki Poulose <Suzuki.Poulose@arm.com>,
	Robin Murphy <Robin.Murphy@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] perf: arm_spe: Add barrier before enabling profiling
 buffer
Message-ID: <aYDzh1B9Cnr_expJ@willie-the-truck>
References: <20260123-james-spe-relaxation-v1-1-4ccb88fa7bc5@linaro.org>
 <20260130202437.GB3481290@e132581.arm.com>
 <aYDWpc8Jh4SqMcD5@willie-the-truck>
 <20260202184234.GC3481290@e132581.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260202184234.GC3481290@e132581.arm.com>
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

On Mon, Feb 02, 2026 at 06:42:34PM +0000, Leo Yan wrote:
> On Mon, Feb 02, 2026 at 04:53:57PM +0000, Will Deacon wrote:
> 
> [...]
> 
> > > > To avoid redundant isb()s in the IRQ handler, remove the isb() between
> > > > the PMBLIMITR_EL1 write and SYS_PMBSR_EL1 as it doesn't matter which
> > > > order these happen in now that all the previous configuration is covered
> > > > by the new isb().
> > > 
> > > The isb() in the interrupt handler is useful and should not be removed.
> > > 
> > > See the sequence in the interrupt handler:
> > > 
> > >     arm_spe_perf_aux_output_begin() {
> > >         write_sysreg_s(base, SYS_PMBPTR_EL1);
> > > 
> > >         // Ensure the write pointer is ordered
> > >         isb();
> > > 
> > >         write_sysreg_s(limit, SYS_PMBLIMITR_EL1);
> > >     }
> > > 
> > >     // Ensure the limit pointer is ordered
> > >     isb();
> > > 
> > >     // Profiling is enabled:
> > >     //   (PMBLIMITR_EL1.E==1) && (PMBSR_EL1.S==0) && (not discard mode)
> > >     write_sysreg_s(0, SYS_PMBSR_EL1);
> > > 
> > > The first isb() ensures that the write pointer update is ordered.  The
> > > second isb() ensures that the limit pointer is visible before profiling
> > > is enabled by clearing the PMBSR_EL1.S bit.  When handling a normal
> > > maintenance interrupt, PMBSR_EL1.S is set by the SPE to stop tracing,
> > > while PMBLIMITR_EL1.E remains set.  Clearing PMBSR_EL1.S therefore
> > > effectively re-enables profiling.
> > > 
> > > Since the second isb() is a synchronization for both the write pointer
> > > and the limit pointer before profiling is enabled, it could be argued
> > > that the first isb() is redundant in the interrupt handling.  However,
> > > the first isb() is crucial for the arm_spe_pmu_start() case, and keeping
> > > it in the interrupt handler does no harm and simplifies code maintenance.
> > > 
> > > In short, if preserves the second isb() instead of removing it, the
> > > change looks good to me.
> > 
> > I'm not sure I follow your logic as to why both ISBs are required, but
> > I'd have thought that if perf_aux_output_begin() fails when called from
> > arm_spe_perf_aux_output_begin() in the irqhandler, we need the ISB
> > because we're going to clear pmblimitr_el1 to 0 and that surely has
> > to be ordered before clearing pmbsr?
> 
> I think the ISB after arm_spe_perf_aux_output_begin() in the irq
> handler is required for both the failure and success cases.
> 
> For a normal maintenance interrupt, an ISB is inserted between writing
> PMBLIMITR_EL1 and PMBSR_EL1 to ensure that a valid limit write is
> visible before tracing restarts.  This ensures that the following
> conditions are safely met:
> 
>   "While the Proﬁling Buﬀer is enabled, proﬁling is not stopped, and
>    Discard mode is not enabled, all of the following must be true:
> 
>    The current write pointer must be at least one sample record below
>    the write limit pointer.
> 
>    PMBPTR_EL1.PTR[63:56] must equal PMBLIMITR_EL1.LIMIT[63:56],
>    regardless of the value of the applicable TBI bit."

Hmm, so let's say we've executed the first ISB. At that point, the
Profiling Buffer is disabled (PMBLIMITR_EL1.E = 0) and profiling is
stopped (PMBSR_EL1.S = 1). If we *don't* have the second ISB then either
PMBLIMITR_EL1 is written first or PMBSR_EL1 is written first. But the
text you quoted will only come into effect once they've both happened,
right? In which case, why does the order matter for the success case?

Will

