Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD3C3E8306E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 09:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TZgaVLCY9fez33b8STeKxleWhUne5wE+uD78HDyFgeY=; b=Gtu1Tl6cAIM1s4eagn5Gjvj6nm
	bHapDYq//F7dcBekicGe7AP6QTKfwr7cDJ1WNs9hYphKbRLgpBZeOmOFtGCLdUgDHeUuFt7JNNpel
	LphDOIGgmBgeKwXKrt9guunFPmBscqyvY6gJ3OfvdjJxTD8ZEvFaRrPgihOoM16P5QBqNs37RMI8M
	6ykkZbPOwclZ8vkhl6QowxU1wcMHIQ25baJdbX218kB9uICYIwcQ53LF34fI7FMicENjM2Lqf4wZ1
	ycozdpIbOYTJ8wDrbpSJvQDJgnhJGDSYC0xv28Q6hh+afxyuS4zQI2J9SYDYLyfDhgVxfMGuaC4B6
	9miIjPjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnCmJ-00000006NWy-0exz;
	Tue, 03 Feb 2026 09:32:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnCmH-00000006NWk-2lg9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 09:32:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7D620601DF;
	Tue,  3 Feb 2026 09:32:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68AF6C116D0;
	Tue,  3 Feb 2026 09:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770111174;
	bh=/utzMXOJX5gCDjWBkQ9yLfbWbERk4i8hccxVrPhrXIo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=buR04DwtD+g+x2F6ZRj1C5RLxfU9c8QZktPUJ+cm22izdpXmynFsPMobDv5eHnrwq
	 HtdFJefGpvwcb9noF5iglW23NuNQYRRT221DCpT702LV1TEsFa+88qZd5CRkRk3GL1
	 ngR3OJ6A6270bfDuNffHp3CdOn7/KdR7yfYLlfgy14sKzS089fim3cjzpXjRUAOQgO
	 ucri0wlmxFOrBW09QQV/Zt/eupjA+WgSd53NKyGZWYCOLbUxwx4FC6Dax6ggn8lR9G
	 MkLUhbKPAxdalB5HCdDeybnr6rrKWcQr07o85sGVAandnqXVSIA6BfKIZVD+voGJZ8
	 7UBenwbBYDt5w==
Date: Tue, 3 Feb 2026 09:32:49 +0000
From: Will Deacon <will@kernel.org>
To: James Clark <james.clark@linaro.org>
Cc: Leo Yan <leo.yan@arm.com>, Mark Rutland <mark.rutland@arm.com>,
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
Message-ID: <aYHAwakKuoXturtV@willie-the-truck>
References: <20260123-james-spe-relaxation-v1-1-4ccb88fa7bc5@linaro.org>
 <20260130202437.GB3481290@e132581.arm.com>
 <aYDWpc8Jh4SqMcD5@willie-the-truck>
 <20260202184234.GC3481290@e132581.arm.com>
 <aYDzh1B9Cnr_expJ@willie-the-truck>
 <20260202191402.GD3481290@e132581.arm.com>
 <95e205af-3dec-48c7-8a0d-293629f1551b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <95e205af-3dec-48c7-8a0d-293629f1551b@linaro.org>
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

On Tue, Feb 03, 2026 at 09:29:56AM +0000, James Clark wrote:
> 
> 
> On 02/02/2026 7:14 pm, Leo Yan wrote:
> > On Mon, Feb 02, 2026 at 06:57:11PM +0000, Will Deacon wrote:
> > 
> > [...]
> > 
> > 
> > > > > I'm not sure I follow your logic as to why both ISBs are required, but
> > > > > I'd have thought that if perf_aux_output_begin() fails when called from
> > > > > arm_spe_perf_aux_output_begin() in the irqhandler, we need the ISB
> > > > > because we're going to clear pmblimitr_el1 to 0 and that surely has
> > > > > to be ordered before clearing pmbsr?
> > > > 
> > > > I think the ISB after arm_spe_perf_aux_output_begin() in the irq
> > > > handler is required for both the failure and success cases.
> > > > 
> > > > For a normal maintenance interrupt, an ISB is inserted between writing
> > > > PMBLIMITR_EL1 and PMBSR_EL1 to ensure that a valid limit write is
> > > > visible before tracing restarts.  This ensures that the following
> > > > conditions are safely met:
> > > > 
> > > >    "While the Proﬁling Buﬀer is enabled, proﬁling is not stopped, and
> > > >     Discard mode is not enabled, all of the following must be true:
> > > > 
> > > >     The current write pointer must be at least one sample record below
> > > >     the write limit pointer.
> > > > 
> > > >     PMBPTR_EL1.PTR[63:56] must equal PMBLIMITR_EL1.LIMIT[63:56],
> > > >     regardless of the value of the applicable TBI bit."
> > > 
> > > Hmm, so let's say we've executed the first ISB. At that point, the
> > > Profiling Buffer is disabled (PMBLIMITR_EL1.E = 0) and profiling is
> > > stopped (PMBSR_EL1.S = 1).
> > 
> > This is not true.  PMBLIMITR_EL1.E is always 1 during interrupt
> > handling.

Ah, yes, thank you for correcting me here.

> > > If we *don't* have the second ISB then either
> > > PMBLIMITR_EL1 is written first or PMBSR_EL1 is written first. But the
> > > text you quoted will only come into effect once they've both happened,
> > > right? In which case, why does the order matter for the success case?
> > 
> > Yes, both PMBLIMITR_EL1.E == 1 and PMBSR_EL1.S == 0 must be true to
> > enable tracing.
> > 
> > However, the tricky part is that PMBLIMITR_EL1.E remains 1 throughout
> > the sequence.  Writing PMBLIMITR_EL1 effectively only sets the limit,
> > while clearing PMBSR_EL1 is the distinct step that enables tracing.
> > 
> > Thanks,
> > Leo
> 
> I think Leo is correct that the old isb() is still needed. I removed it
> under the assumption that PMBLIMITR_EL1.E was unset in the interrupt
> handler. Possibly because the previous version re-arranged the handler to do
> that.
> 
> If PMBLIMITR_EL1.E is set, we have to make sure clearing PMBSR_EL1 comes
> last as it's the thing that defines the point where both pointers must be
> correct by.

Agreed that we can't remove the existing isb, but please see my other
reply as I'm not entirely sure we need to add an extra isb to handle the
arch relaxation.

Will

