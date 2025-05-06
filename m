Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 139CCC3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 18:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bQqLQovPURlogwQaxmtA36avWPpHjeihXkbRVzxAkBU=; b=MB/f5uoogAzrA+dcVgZm5e4zMV
	/BPC0rZ28biLculEyg8/TM+QB6olkeQ3I+6WwWJVINdti+iaqraIPmGBnHTwuScCEY2hZl3qKnjhI
	z76TkZef8xTCUs3WM8w5f3CJP28lWWHIMA+mefdow3CrYENYYPKbl/teCEpTj5ofIS9+5Lsglblvy
	R1WZ4IPLiMr7uU73yUIORG9/8HEfyvEldwQPSy3YaVe17ZDhLNmqNvGQXMu7OSUFB2rYxNVXdC21w
	Jnw+tgN6cdrTHCR8qvT5wwZfPA92jiSWcu2heYW/rKcDs4IGJ/p+vBH15+gbHTQEMQjY6tkdyUhIK
	jXlB2XYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCNKa-0000000D9NG-2pqq;
	Tue, 06 May 2025 18:47:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCJfo-0000000COuD-3DVg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 14:53:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EB822615F2;
	Tue,  6 May 2025 14:53:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55D1AC4CEE4;
	Tue,  6 May 2025 14:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746543210;
	bh=mlHA7oTENsJhkBEE9KRVlu9szOgOr4t+vxxALv3XDvw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fG3F/80PyNXqPQAIHuUmfOxwo+KV7sFiP01r2zWkIdAfSWR9DxkeJEJmrTQHZDJpV
	 8+kz8AF/iMG1dCY6nio+8ziCbFpytdvNiSrbgeGez7+1KiCOW0fs6uSkMUxzpsFfBS
	 gqR6FiUsaFOgZaWx+l4Drydtcm+TkwghRjcXhciegpLrcrF11m3Y3AGn0s5LA06YV0
	 XCeNvl1DQQD9V/oWCsK8GigyGdtLyN5avNJs92JfQuhZUWossF8cQMA6Yfkh43Opim
	 R3sSmM2Vz4buzMxmeVeQGlYcc+Nxx3i+iXkpTsG+radUofEaj8YTyf5G6W5oqyFJ8I
	 4ExAyIfVeY3Gg==
Date: Tue, 6 May 2025 15:53:25 +0100
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
	freedreno@lists.freedesktop.org
Subject: Re: [PATCH v5 3/5] iommu/arm-smmu: Fix spurious interrupts with
 stall-on-fault
Message-ID: <20250506145324.GA1246@willie-the-truck>
References: <20250319-msm-gpu-fault-fixes-next-v5-0-97561209dd8c@gmail.com>
 <20250319-msm-gpu-fault-fixes-next-v5-3-97561209dd8c@gmail.com>
 <20250506122449.GB723@willie-the-truck>
 <CACu1E7FA0M_0Un3qPRNtqy4R_NbaMks6FSkpQZBuyqJpuT-p7w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACu1E7FA0M_0Un3qPRNtqy4R_NbaMks6FSkpQZBuyqJpuT-p7w@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

On Tue, May 06, 2025 at 10:08:05AM -0400, Connor Abbott wrote:
> On Tue, May 6, 2025 at 8:24 AM Will Deacon <will@kernel.org> wrote:
> > On Wed, Mar 19, 2025 at 10:44:02AM -0400, Connor Abbott wrote:
> > > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > index c7b5d7c093e71050d29a834c8d33125e96b04d81..9927f3431a2eab913750e6079edc6393d1938c98 100644
> > > --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > @@ -470,13 +470,52 @@ static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
> > >       if (!(cfi->fsr & ARM_SMMU_CB_FSR_FAULT))
> > >               return IRQ_NONE;
> > >
> > > +     /*
> > > +      * On some implementations FSR.SS asserts a context fault
> > > +      * interrupt. We do not want this behavior, because resolving the
> > > +      * original context fault typically requires operations that cannot be
> > > +      * performed in IRQ context but leaving the stall unacknowledged will
> > > +      * immediately lead to another spurious interrupt as FSR.SS is still
> > > +      * set. Work around this by disabling interrupts for this context bank.
> > > +      * It's expected that interrupts are re-enabled after resuming the
> > > +      * translation.
> >
> > s/translation/transaction/
> >
> > > +      *
> > > +      * We have to do this before report_iommu_fault() so that we don't
> > > +      * leave interrupts disabled in case the downstream user decides the
> > > +      * fault can be resolved inside its fault handler.
> > > +      *
> > > +      * There is a possible race if there are multiple context banks sharing
> > > +      * the same interrupt and both signal an interrupt in between writing
> > > +      * RESUME and SCTLR. We could disable interrupts here before we
> > > +      * re-enable them in the resume handler, leaving interrupts enabled.
> > > +      * Lock the write to serialize it with the resume handler.
> > > +      */
> >
> > I'm struggling to understand this last part. If the resume handler runs
> > synchronously from report_iommu_fault(), then there's no need for
> > locking because we're in interrupt context. If the resume handler can
> > run asynchronously from report_iommu_fault(), then the locking doesn't
> > help because the code below could clear CFIE right after the resume
> > handler has set it.
> 
> The problem is indeed when the resume handler runs asynchronously.
> Clearing CFIE right after the resume handler has set it is normal and
> expected. The issue is the opposite, i.e. something like:
> 
> - Resume handler writes RESUME and stalls for some reason
> - The interrupt handler runs through and clears CFIE while it's already cleared
> - Resume handler sets CFIE, assuming that the handler hasn't run yet
> but it actually has
> 
> This wouldn't happen with only one context bank, because we wouldn't
> get an interrupt until the resume handler sets CFIE, but with multiple
> context banks and a shared interrupt line we could get a "spurious"
> interrupt due to a fault in an earlier context bank that becomes not
> spurious if the resume handler writes RESUME before the context fault
> handler for this bank reads FSR above.

Ah, gotcha. Thanks for the explanation.

If we moved the RESUME+CFIE into the interrupt handler after the call
to report_iommu_fault(), would it be possible to run the handler as a
threaded irq (see 'context_fault_needs_threaded_irq') and handle the
callback synchronously? In that case, I think we could avoid taking the
lock if we wrote CFIE _before_ RESUME.

Will

