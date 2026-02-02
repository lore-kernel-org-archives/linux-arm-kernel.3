Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D57FE7DF19
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 18:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/qEQYWsSx8Q7/0bHl07emI6DeSqa7zmHvysvb3pOmXM=; b=1J5CEw36hdQy8ptLhOIPpqHShO
	WTPBR3djsn00voB6yEMfPXPOFV/VdzQah1+RjVd2971bRwhHVbcikKLVf1Gjctb3nYAmGUg2UcFji
	XjOyTEAkGfKQ1p1W4/Z5OP0IrQPLZ4XSjxELz7lNpaOwI7URiS2uudaoY0e37XNimarzj3k/haAFB
	x6sivViWxvkrx4PGqbi3Lr1RvoIJHsiapEhtcahsMqt7GZulf2S5ItLwrlxZKifPE/VLxInqJ82gm
	cOxU8xnoWqdNZAibDq50KQpvNWRyn5c6iffNv961H+nTJZY0y0ebpGtXA1+jh29q08X4U/dCwXPZa
	4a0qT7Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmysl-00000005Qtb-2qcy;
	Mon, 02 Feb 2026 18:42:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmysi-00000005Qsn-2drz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 18:42:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ACBCC339;
	Mon,  2 Feb 2026 10:42:30 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9F3B03F778;
	Mon,  2 Feb 2026 10:42:36 -0800 (PST)
Date: Mon, 2 Feb 2026 18:42:34 +0000
From: Leo Yan <leo.yan@arm.com>
To: Will Deacon <will@kernel.org>
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
Message-ID: <20260202184234.GC3481290@e132581.arm.com>
References: <20260123-james-spe-relaxation-v1-1-4ccb88fa7bc5@linaro.org>
 <20260130202437.GB3481290@e132581.arm.com>
 <aYDWpc8Jh4SqMcD5@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aYDWpc8Jh4SqMcD5@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_104240_787912_2D6E9F19 
X-CRM114-Status: GOOD (  25.45  )
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

On Mon, Feb 02, 2026 at 04:53:57PM +0000, Will Deacon wrote:

[...]

> > > To avoid redundant isb()s in the IRQ handler, remove the isb() between
> > > the PMBLIMITR_EL1 write and SYS_PMBSR_EL1 as it doesn't matter which
> > > order these happen in now that all the previous configuration is covered
> > > by the new isb().
> > 
> > The isb() in the interrupt handler is useful and should not be removed.
> > 
> > See the sequence in the interrupt handler:
> > 
> >     arm_spe_perf_aux_output_begin() {
> >         write_sysreg_s(base, SYS_PMBPTR_EL1);
> > 
> >         // Ensure the write pointer is ordered
> >         isb();
> > 
> >         write_sysreg_s(limit, SYS_PMBLIMITR_EL1);
> >     }
> > 
> >     // Ensure the limit pointer is ordered
> >     isb();
> > 
> >     // Profiling is enabled:
> >     //   (PMBLIMITR_EL1.E==1) && (PMBSR_EL1.S==0) && (not discard mode)
> >     write_sysreg_s(0, SYS_PMBSR_EL1);
> > 
> > The first isb() ensures that the write pointer update is ordered.  The
> > second isb() ensures that the limit pointer is visible before profiling
> > is enabled by clearing the PMBSR_EL1.S bit.  When handling a normal
> > maintenance interrupt, PMBSR_EL1.S is set by the SPE to stop tracing,
> > while PMBLIMITR_EL1.E remains set.  Clearing PMBSR_EL1.S therefore
> > effectively re-enables profiling.
> > 
> > Since the second isb() is a synchronization for both the write pointer
> > and the limit pointer before profiling is enabled, it could be argued
> > that the first isb() is redundant in the interrupt handling.  However,
> > the first isb() is crucial for the arm_spe_pmu_start() case, and keeping
> > it in the interrupt handler does no harm and simplifies code maintenance.
> > 
> > In short, if preserves the second isb() instead of removing it, the
> > change looks good to me.
> 
> I'm not sure I follow your logic as to why both ISBs are required, but
> I'd have thought that if perf_aux_output_begin() fails when called from
> arm_spe_perf_aux_output_begin() in the irqhandler, we need the ISB
> because we're going to clear pmblimitr_el1 to 0 and that surely has
> to be ordered before clearing pmbsr?

I think the ISB after arm_spe_perf_aux_output_begin() in the irq
handler is required for both the failure and success cases.

For a normal maintenance interrupt, an ISB is inserted between writing
PMBLIMITR_EL1 and PMBSR_EL1 to ensure that a valid limit write is
visible before tracing restarts.  This ensures that the following
conditions are safely met:

  "While the Proﬁling Buﬀer is enabled, proﬁling is not stopped, and
   Discard mode is not enabled, all of the following must be true:

   The current write pointer must be at least one sample record below
   the write limit pointer.

   PMBPTR_EL1.PTR[63:56] must equal PMBLIMITR_EL1.LIMIT[63:56],
   regardless of the value of the applicable TBI bit."

Thanks,
Leo

