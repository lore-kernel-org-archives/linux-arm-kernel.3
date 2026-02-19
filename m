Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49F60E9A04A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 14:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WUvV7WRMkBOQwPfKTSrk+JMWI7wklCFII++7Y72/pjU=; b=kM8mKM3KFoJi+Zr93v3Plub6pF
	h2mga02hDUVxrHXbd5fc9ax+p9tunYlC4loAHiXnyIT2pHrJkotbY5uhWStKQ+5V8zSiOqLmuY9J6
	rBhxFq9+EAZkvctmd4I3ApMcgYm59tj5glCmhXgaiyItOX1UGE4eysf2+vv4JVygo3nrZ4vHIKS3e
	H18/1ppsbHv8y3DssC7e5tTcB9TvUdcBk+E5huQx4SIxMAE6coVsuiCDZ/VtlDXng59Z2DfBab0pp
	PTBW0TKV80vtDfRd156d/M0TYvJyrG/qhV8NECu0ju+Q/qg4XA1mPpDyEZhwrPki8DSWbkbzSbC5k
	r6Y0gy7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt53N-0000000BS2F-0Lfv;
	Thu, 19 Feb 2026 14:30:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt53K-0000000BS0Z-1WMB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 14:30:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 53503339;
	Thu, 19 Feb 2026 06:30:39 -0800 (PST)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 928143F62B;
	Thu, 19 Feb 2026 06:30:43 -0800 (PST)
Date: Thu, 19 Feb 2026 14:30:41 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Anshuman Khandual <Anshuman.Khandual@arm.com>,
	Rob Herring <Rob.Herring@arm.com>,
	Suzuki Poulose <Suzuki.Poulose@arm.com>,
	Robin Murphy <Robin.Murphy@arm.com>, Leo Yan <leo.yan@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	Michael Williams <Michael.Williams@arm.com>,
	Alexandru Elisei <Alexandru.Elisei@arm.com>
Subject: Re: [PATCH] perf: arm_spe: Add barrier before enabling profiling
 buffer
Message-ID: <aZcekSK5fGEkw_1P@J2N7QTR9R3.cambridge.arm.com>
References: <20260123-james-spe-relaxation-v1-1-4ccb88fa7bc5@linaro.org>
 <aYD08d42SewAAQCB@willie-the-truck>
 <aebe99ad-1189-4372-83e3-385f33829bd2@linaro.org>
 <aYHXCkFZcVm1L_25@willie-the-truck>
 <e7d53952-59f6-4990-83fb-1182641af29f@linaro.org>
 <705acb39-2eef-4e61-aec1-b9503e788299@linaro.org>
 <aZcIy1Or4c5-i7Tm@willie-the-truck>
 <7b692e5c-d376-4023-80e0-76c9d9c0604f@linaro.org>
 <aZcYLZ9wETnRDJ7P@willie-the-truck>
 <2d5f6207-afa2-4880-b34d-f03b5ebf3b5f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2d5f6207-afa2-4880-b34d-f03b5ebf3b5f@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_063050_484124_D48F7B35 
X-CRM114-Status: GOOD (  40.52  )
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

On Thu, Feb 19, 2026 at 02:15:22PM +0000, James Clark wrote:
> On 19/02/2026 2:03 pm, Will Deacon wrote:
> > On Thu, Feb 19, 2026 at 01:51:26PM +0000, James Clark wrote:
> > > On 19/02/2026 12:57 pm, Will Deacon wrote:
> > > > On Thu, Feb 19, 2026 at 12:08:27PM +0000, James Clark wrote:
> > > > > I'm back to drag this up again. So I think all of the above discussion
> > > > > relies on the ordering given by the indirect read needed for the "might
> > > > > ignore a direct write..." part. But it's _might_ ignore a direct write, it's
> > > > > possible for an implementation to not do that, so there are two possible
> > > > > implementations:
> > > > > 
> > > > > #1 Where there is an indirect read to give the write ignore outcome
> > > > > #2 Where there is no write ignore outcome so it doesn't require an
> > > > >      indirect read
> > > > > 
> > > > > For #2 there's nothing to force the ordering. We're writing to two different
> > > > > registers (PMBPTR_EL1 and PMBLIMITR_EL1) and we have to have the
> > > > > PMBLIMITR_EL1 write come second for the buffer to be considered configured
> > > > > correctly. For example if the old value of PMBPTR_EL1 is higher than the new
> > > > > PMBLIMITR_EL1 and the write to PMBLIMITR_EL1 happens first then it's
> > > > > misconfigured. That's why we think we need the isb() here.
> > > > 
> > > > I thought profiling was disabled in these cases, so why is it
> > > > misconfigured?
> > > > 
> > > > If it is misconfigured, what can go wrong given that we're either stopped
> > > > or pmscr is clear?
> > > > 
> > > > Will
> > > 
> > > It is stopped in the interrupt handler because PMBSR_EL1.S = 1. But in
> > > arm_spe_pmu_start(), PMBSR_EL1.S = 0 so it's not stopped. And with
> > > PMBPTR_EL1 still being set to the value from the last session it could be
> > > higher than PMBLIMITR_EL1.
> > > 
> > > PMSCR_EL1 doesn't affect SPEProfilingStopped(), it's only:
> > > 
> > >    boolean stopped = (PMBSR_EL1.S == '1');
> > > 
> > > The conditions for when the buffer needs to be configured correctly from
> > > R24557 are:
> > > 
> > >    ProfilingBufferEnabled() && !SPEProfilingStopped() &&
> > >      PMBLIMITR_EL1.FM != DISCARD
> > > 
> > > I think even if PMSCR_EL1 is clear you can still get a buffer management
> > > error, even if no samples were going to be written into the buffer. It just
> > > says:
> > > 
> > >    While the Profiling Buffer is enabled, profiling is not stopped, and
> > >    Discard mode is not enabled, all of the following must be true:
> > > 
> > >    * The current write pointer must be at least one sample record below
> > >      the write limit pointer.
> > 
> > ... but doesn't that mean that R24557 is a breaking change to the
> > architecture? The current Arm ARM doesn't appear to require this,
> > existing software doesn't honour it so why should we hack extra barriers
> > into Linux?
> > 
> > Will
> 
> Yes I suppose it is. The current Arm ARM doesn't require it, but R24577 is
> in the "known issues" document for the Arm ARM, so it's saying the ARM is
> incorrect here and you shouldn't trust what it says.
> 
>   Arm Architecture Reference Manual for A-profile architecture: Known
>   issues
> 
>   This document includes the Known Issues for the following documents:
> 
>     Arm Architecture Reference Manual for A-profile architecture
>     (DDI0487)
> 
> Presumably the fix will make it into the Arm ARM eventually. 

While that document is called "Known issues" it really means "Key
changes since the last ARM ARM". The items in that are not all bug
fixes.

In this case, R24577 is intended to be a relaxation (that's what the "R"
stands for), which breaks existing widely-deployed SW. It fails to meet
the usual acceptability requirements for a relaxation.

IMO this should not have made it into the architecture as-is.

> I suppose there is a chance that this could be deleted from the known issues
> and not make it into a future Arm ARM. TBH I have no experience or feeling
> to say how likely that would be.

Broken changes have made it into the architecture before, and have been
subsequently reverted. In general, we try to avoid that in the first
place.

I will raise this internally within Arm.

Mark.

