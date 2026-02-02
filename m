Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B900E7DF1F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 19:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bVkcYxAVhufuef/ENcEvNyW+zIlFMV8++eatl6zfTVs=; b=EUlinspzlCRWL3wrK+BAHqJkAT
	Mm5tLg5uKwRtqyUhfw7AVMyxSQvlFBqKThgSCoQ8cHGjxICpVRMZ+sO2g85w1yt2NRuaJ4oL5duEI
	hFz+p2UQguaC4HK99yFFKT8S84VpPMEgWUD9ubz3sRlTd3vVdFn6Ik+JDclKQwnr0CCL613GdgkfH
	YLqpdjziJHbA1dq5wPASKSIB1dgtetuZRUadaDhDE3EyrgsPC8x5hbxWGm9n+qJCbJOrY6ZDi2Kpc
	Q0SLD/zEI+uife/XF5dLF91hKl5hjSDh59LgrYePRmiZusNjrXtD8JFyPMvYxdVBA10Km/O+kqCWy
	UodgB8cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmzNA-00000005UcE-0HdF;
	Mon, 02 Feb 2026 19:14:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmzN7-00000005UbX-44dh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 19:14:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 972C5339;
	Mon,  2 Feb 2026 11:13:58 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8BFBC3F740;
	Mon,  2 Feb 2026 11:14:04 -0800 (PST)
Date: Mon, 2 Feb 2026 19:14:02 +0000
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
Message-ID: <20260202191402.GD3481290@e132581.arm.com>
References: <20260123-james-spe-relaxation-v1-1-4ccb88fa7bc5@linaro.org>
 <20260130202437.GB3481290@e132581.arm.com>
 <aYDWpc8Jh4SqMcD5@willie-the-truck>
 <20260202184234.GC3481290@e132581.arm.com>
 <aYDzh1B9Cnr_expJ@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aYDzh1B9Cnr_expJ@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_111406_058544_6E2D1A61 
X-CRM114-Status: GOOD (  24.46  )
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

On Mon, Feb 02, 2026 at 06:57:11PM +0000, Will Deacon wrote:

[...]


> > > I'm not sure I follow your logic as to why both ISBs are required, but
> > > I'd have thought that if perf_aux_output_begin() fails when called from
> > > arm_spe_perf_aux_output_begin() in the irqhandler, we need the ISB
> > > because we're going to clear pmblimitr_el1 to 0 and that surely has
> > > to be ordered before clearing pmbsr?
> > 
> > I think the ISB after arm_spe_perf_aux_output_begin() in the irq
> > handler is required for both the failure and success cases.
> > 
> > For a normal maintenance interrupt, an ISB is inserted between writing
> > PMBLIMITR_EL1 and PMBSR_EL1 to ensure that a valid limit write is
> > visible before tracing restarts.  This ensures that the following
> > conditions are safely met:
> > 
> >   "While the Proﬁling Buﬀer is enabled, proﬁling is not stopped, and
> >    Discard mode is not enabled, all of the following must be true:
> > 
> >    The current write pointer must be at least one sample record below
> >    the write limit pointer.
> > 
> >    PMBPTR_EL1.PTR[63:56] must equal PMBLIMITR_EL1.LIMIT[63:56],
> >    regardless of the value of the applicable TBI bit."
> 
> Hmm, so let's say we've executed the first ISB. At that point, the
> Profiling Buffer is disabled (PMBLIMITR_EL1.E = 0) and profiling is
> stopped (PMBSR_EL1.S = 1).

This is not true.  PMBLIMITR_EL1.E is always 1 during interrupt
handling.

> If we *don't* have the second ISB then either
> PMBLIMITR_EL1 is written first or PMBSR_EL1 is written first. But the
> text you quoted will only come into effect once they've both happened,
> right? In which case, why does the order matter for the success case?

Yes, both PMBLIMITR_EL1.E == 1 and PMBSR_EL1.S == 0 must be true to
enable tracing.

However, the tricky part is that PMBLIMITR_EL1.E remains 1 throughout
the sequence.  Writing PMBLIMITR_EL1 effectively only sets the limit,
while clearing PMBSR_EL1 is the distinct step that enables tracing.

Thanks,
Leo

