Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40B26C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 13:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Q04yNvKI1zqSt0It2wplsb0Bu1b6pcIh3IjlC7BDuA=; b=A2RrVdikBI6AlhmEZDz6YTJwgh
	J+IrwIRM38UL6Du3U3SFvN4rBl4Cu9HTeLlLhNe1Wit4Cnk7rsxWEc59bpSYxtJGhGi/P9fasYjgs
	zJKfzuSLIvFjGtn9pc8VqhdYqcaf9ntEJniVwlFXt8xXyfCESR+F07PTA9hbTdiugb3ApYFYyfwKL
	O4GkgMbUboMfphVX72P+0JLIOTz81LeiL2C/HIhhYNPLgFHo+73IzEEdIRezDjQJolHzYFTT9wSCo
	jFRftcI8nfDNu0pgVAi55UuneWMnLdYpejRC80+HHwMDeEhhGbdnh0ZeR4TkDE/hffYRrstSdY5h7
	/EF9/jAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsMDz-00000008a6Q-2MAM;
	Wed, 12 Mar 2025 13:34:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsLmL-00000008UkW-1Mj5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 13:05:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DD33B5C4427;
	Wed, 12 Mar 2025 13:03:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14095C4CEE3;
	Wed, 12 Mar 2025 13:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741784744;
	bh=tQxLHaC5IOJlSNyEQXOM0hkci8JPuwjdb8elPNaj8+w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jCKBd0Ii3zEWKe0hu2rFrehNCnSbNl7NHa4XzoYQbrTSXnQHxgRneTQPVxT5lRntP
	 TYorVyRqBbBmpKOzYQw5AX2an7nJvrOujEoWALPxjV1SEkrAhDFUl9v7ZEQsnFwwrx
	 mu2whHpwcubaL+8XLy6nnhjcSKYe6KnrxAE4LbGJ6DPAHQEyx4vE9aRK4pT3aRhU8H
	 jMH0e2soV0CDPRQ+eMcLA6kB0NgcdAY90mg6PmfzKgyAJUnU1EZZfMXVHL5frieL+F
	 NvvYKMhH46k2B/XcpfNkjXfzujhDquSqyLz+kTMOjOa07+B4DoaoQpcVUTxGX6wjtR
	 dnmVfrwUZy3QQ==
Date: Wed, 12 Mar 2025 13:05:38 +0000
From: Will Deacon <will@kernel.org>
To: Connor Abbott <cwabbott0@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>, Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	freedreno@lists.freedesktop.org
Subject: Re: [PATCH v4 1/5] iommu/arm-smmu: Save additional information on
 context fault
Message-ID: <20250312130525.GC6181@willie-the-truck>
References: <20250304-msm-gpu-fault-fixes-next-v4-0-be14be37f4c3@gmail.com>
 <20250304-msm-gpu-fault-fixes-next-v4-1-be14be37f4c3@gmail.com>
 <20250311180553.GB5216@willie-the-truck>
 <CACu1E7GzCiO2b7AFJSDC+pN2VD9VaD2aYz_GGymM3-xAUqd__A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACu1E7GzCiO2b7AFJSDC+pN2VD9VaD2aYz_GGymM3-xAUqd__A@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_060545_449004_D9ABD881 
X-CRM114-Status: GOOD (  30.18  )
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

On Tue, Mar 11, 2025 at 06:36:38PM -0400, Connor Abbott wrote:
> On Tue, Mar 11, 2025 at 2:06 PM Will Deacon <will@kernel.org> wrote:
> >
> > On Tue, Mar 04, 2025 at 11:56:47AM -0500, Connor Abbott wrote:
> > > This will be used by drm/msm for GPU page faults, replacing the manual
> > > register reading it does.
> > >
> > > Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> > > ---
> > >  drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c |  4 ++--
> > >  drivers/iommu/arm/arm-smmu/arm-smmu.c            | 27 +++++++++++++-----------
> > >  drivers/iommu/arm/arm-smmu/arm-smmu.h            |  5 ++++-
> > >  3 files changed, 21 insertions(+), 15 deletions(-)
> > >
> > > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
> > > index 548783f3f8e89fd978367afa65c473002f66e2e7..ae4fdbbce6ba80440f539557a39866a932360d4e 100644
> > > --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
> > > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
> > > @@ -400,7 +400,7 @@ irqreturn_t qcom_smmu_context_fault(int irq, void *dev)
> > >
> > >       if (list_empty(&tbu_list)) {
> > >               ret = report_iommu_fault(&smmu_domain->domain, NULL, cfi.iova,
> > > -                                      cfi.fsynr & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
> > > +                                      cfi.fsynr0 & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
> > >
> > >               if (ret == -ENOSYS)
> > >                       arm_smmu_print_context_fault_info(smmu, idx, &cfi);
> > > @@ -412,7 +412,7 @@ irqreturn_t qcom_smmu_context_fault(int irq, void *dev)
> > >       phys_soft = ops->iova_to_phys(ops, cfi.iova);
> > >
> > >       tmp = report_iommu_fault(&smmu_domain->domain, NULL, cfi.iova,
> > > -                              cfi.fsynr & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
> > > +                              cfi.fsynr0 & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
> > >       if (!tmp || tmp == -EBUSY) {
> > >               ret = IRQ_HANDLED;
> > >               resume = ARM_SMMU_RESUME_TERMINATE;
> > > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > index ade4684c14c9b2724a71e2457288dbfaf7562c83..a9213e0f1579d1e3be0bfba75eea1d5de23117de 100644
> > > --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > @@ -409,9 +409,12 @@ void arm_smmu_read_context_fault_info(struct arm_smmu_device *smmu, int idx,
> > >                                     struct arm_smmu_context_fault_info *cfi)
> > >  {
> > >       cfi->iova = arm_smmu_cb_readq(smmu, idx, ARM_SMMU_CB_FAR);
> > > +     cfi->ttbr0 = arm_smmu_cb_readq(smmu, idx, ARM_SMMU_CB_TTBR0);
> > >       cfi->fsr = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSR);
> > > -     cfi->fsynr = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR0);
> > > +     cfi->fsynr0 = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR0);
> > > +     cfi->fsynr1 = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR1);
> >
> > We already have an implementation hook (->get_fault_info()) which the
> > qcom SMMU driver can override with qcom_adreno_smmu_get_fault_info().
> > That thing dumps these registers already so if we're moving that into
> > the core SMMU driver, let's get rid of the hook and move everybody over
> > rather than having it done in both places.
> 
> As you probably saw, the next commit moves over
> qcom_adreno_smmu_get_fault_info() to use this. The current back door
> used by drm/msm to access these functions is specific to adreno_smmu
> and there isn't an equivalent interface to allow it to call a generic
> SMMU function so it isn't possible to move it entirely to the core. At
> least not without a bigger refactoring that isn't justified for this
> series that is just trying to fix things.

Ok :(

> > >       cfi->cbfrsynra = arm_smmu_gr1_read(smmu, ARM_SMMU_GR1_CBFRSYNRA(idx));
> > > +     cfi->contextidr = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_CONTEXTIDR);
> >
> > I think the CONTEXTIDR register is stage-1 only, so we shouldn't dump
> > it for stage-2 domains.
> >
> Does it matter if we read the register though, as long as users are
> aware of this and don't use its value for anything?

I think the contents are "UNKNOWN", so it could be hugely confusing even
if they just got logged someplace. Why is it difficult to avoid touching
it for stage-2?

Will

