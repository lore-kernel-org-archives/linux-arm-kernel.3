Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 880FBC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 14:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ourIdY24m+JkE4EAiHrRtpPWyVkLrtudd1tQA6x/ysM=; b=keCu84I4iacleVA6ZqYBOjqKKD
	ZFnylJjqjnGLTTuKSFjDcl6HRh/iyIC/nqq7ivRX0jwYefEp3BXOTvsRd4WMQ/0UtLn9rXPlKEbJz
	wKOZt8AH0qEUtQk1AtPyLKiiVm8oFWN2wurLVWuCQBzCGB7DaAHknBLZHOyIUY9qAnFNAxeZr2gUL
	STPXAo/jf8YXBXSP2hE8x+oKzVy+75Tfl5GZY48EBTlpo6WuO2/y/ZyCHMQs0CcsJ6oKxr0AQRUHG
	ODIqklRbIUbtIolywhHEZTFGuIGMepJ0q5LwIV93mlDX5QS+J/JYW4a1OEXSZFLls38d2peA3kQ/a
	Pz+45DBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFZxv-00000000x6o-2IBo;
	Thu, 15 May 2025 14:53:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFZrS-00000000vz7-23tR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 14:47:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8EA055C563F;
	Thu, 15 May 2025 14:44:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26FC8C4CEE7;
	Thu, 15 May 2025 14:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747320421;
	bh=iF+js4BBt+dLaStQ/POI5wyD5ubyMTtYNLC8o9vroH8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YYpYyWdwrt+f9YnMLuNgTFAl3ivW6cEUiWNHBS/7LDc/3eBf1Uptx2po9ABYU9/Rj
	 fScf8zR93phvR+Qpxf4iOGOF3g4f2QBA++Tbz7O4c7Uv077ekrYxJcj0nAUkn1vAY1
	 K4Qj87AbwzMuiekhWRcSuIF76y9KtH8HXu3ftZv78K6zNSHbrxK4Qp3Wo4reTcYtLs
	 wFhTKb6r8PoXDzMlpYSgRGYB2PkPbdj4mr8IsDbOi6y8Heu6hBeegqDZqDL2MeN4Su
	 JpFM5zeyNKhLE6ofif2/AbqmyQeeFN6Jun31OlxsbSxf74PF95nj9c1ar/wOYVtQQi
	 Zo9w2FUQ0XVQg==
Date: Thu, 15 May 2025 15:46:56 +0100
From: Will Deacon <will@kernel.org>
To: Connor Abbott <cwabbott0@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>, Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	freedreno@lists.freedesktop.org, quic_c_gdjako@quicinc.com
Subject: Re: [PATCH v5 3/5] iommu/arm-smmu: Fix spurious interrupts with
 stall-on-fault
Message-ID: <20250515144653.GC12165@willie-the-truck>
References: <20250319-msm-gpu-fault-fixes-next-v5-0-97561209dd8c@gmail.com>
 <20250319-msm-gpu-fault-fixes-next-v5-3-97561209dd8c@gmail.com>
 <20250506122449.GB723@willie-the-truck>
 <CACu1E7FA0M_0Un3qPRNtqy4R_NbaMks6FSkpQZBuyqJpuT-p7w@mail.gmail.com>
 <20250506145324.GA1246@willie-the-truck>
 <CACu1E7FcQU3NXro8uYxzEJ1pvfYG5WLvY8BscbF9Sj+P3Wh_2A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACu1E7FcQU3NXro8uYxzEJ1pvfYG5WLvY8BscbF9Sj+P3Wh_2A@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_074702_616425_C9979C43 
X-CRM114-Status: GOOD (  44.04  )
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

On Tue, May 06, 2025 at 11:18:44AM -0400, Connor Abbott wrote:
> On Tue, May 6, 2025 at 10:53 AM Will Deacon <will@kernel.org> wrote:
> >
> > On Tue, May 06, 2025 at 10:08:05AM -0400, Connor Abbott wrote:
> > > On Tue, May 6, 2025 at 8:24 AM Will Deacon <will@kernel.org> wrote:
> > > > On Wed, Mar 19, 2025 at 10:44:02AM -0400, Connor Abbott wrote:
> > > > > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > > > index c7b5d7c093e71050d29a834c8d33125e96b04d81..9927f3431a2eab913750e6079edc6393d1938c98 100644
> > > > > --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > > > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > > > @@ -470,13 +470,52 @@ static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
> > > > >       if (!(cfi->fsr & ARM_SMMU_CB_FSR_FAULT))
> > > > >               return IRQ_NONE;
> > > > >
> > > > > +     /*
> > > > > +      * On some implementations FSR.SS asserts a context fault
> > > > > +      * interrupt. We do not want this behavior, because resolving the
> > > > > +      * original context fault typically requires operations that cannot be
> > > > > +      * performed in IRQ context but leaving the stall unacknowledged will
> > > > > +      * immediately lead to another spurious interrupt as FSR.SS is still
> > > > > +      * set. Work around this by disabling interrupts for this context bank.
> > > > > +      * It's expected that interrupts are re-enabled after resuming the
> > > > > +      * translation.
> > > >
> > > > s/translation/transaction/
> > > >
> > > > > +      *
> > > > > +      * We have to do this before report_iommu_fault() so that we don't
> > > > > +      * leave interrupts disabled in case the downstream user decides the
> > > > > +      * fault can be resolved inside its fault handler.
> > > > > +      *
> > > > > +      * There is a possible race if there are multiple context banks sharing
> > > > > +      * the same interrupt and both signal an interrupt in between writing
> > > > > +      * RESUME and SCTLR. We could disable interrupts here before we
> > > > > +      * re-enable them in the resume handler, leaving interrupts enabled.
> > > > > +      * Lock the write to serialize it with the resume handler.
> > > > > +      */
> > > >
> > > > I'm struggling to understand this last part. If the resume handler runs
> > > > synchronously from report_iommu_fault(), then there's no need for
> > > > locking because we're in interrupt context. If the resume handler can
> > > > run asynchronously from report_iommu_fault(), then the locking doesn't
> > > > help because the code below could clear CFIE right after the resume
> > > > handler has set it.
> > >
> > > The problem is indeed when the resume handler runs asynchronously.
> > > Clearing CFIE right after the resume handler has set it is normal and
> > > expected. The issue is the opposite, i.e. something like:
> > >
> > > - Resume handler writes RESUME and stalls for some reason
> > > - The interrupt handler runs through and clears CFIE while it's already cleared
> > > - Resume handler sets CFIE, assuming that the handler hasn't run yet
> > > but it actually has
> > >
> > > This wouldn't happen with only one context bank, because we wouldn't
> > > get an interrupt until the resume handler sets CFIE, but with multiple
> > > context banks and a shared interrupt line we could get a "spurious"
> > > interrupt due to a fault in an earlier context bank that becomes not
> > > spurious if the resume handler writes RESUME before the context fault
> > > handler for this bank reads FSR above.
> >
> > Ah, gotcha. Thanks for the explanation.
> >
> > If we moved the RESUME+CFIE into the interrupt handler after the call
> > to report_iommu_fault(), would it be possible to run the handler as a
> > threaded irq (see 'context_fault_needs_threaded_irq') and handle the
> > callback synchronously? In that case, I think we could avoid taking the
> > lock if we wrote CFIE _before_ RESUME.
> >
> 
> We need the lock anyway due to the parallel manipulation of CFCFG in
> the same register introduced in the next patch. Expanding it to also
> cover the write to RESUME is not a huge deal. Also, doing it
> synchronously would require rewriting the fault handling in drm/msm
> and again I'm trying to fix this serious stability problem now as soon
> as possible without getting dragged into rewriting the whole thing.

This has never worked though, right? In which case, we should fix it
properly rather than papering over the mess.

Georgi (CC'd) added support for threaded interrupts specifically to
permit sleeping operations in the fault handler. You should be able to
use that and I don't understand why that would require "rewriting the
whole thing". You can kick the async work and then wait for it to
complete, no?

That would then open the door to handling the RESUME in the core driver
in future based on the return value from report_iommu_fault().

You also need to fix qcom_tbu_halt() as I mentioned before.

Will

