Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9665C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 13:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C/2weULFbBA5WjQNefQq5BuV/1Zj1RfOROgOCTRVdjY=; b=iWx2Dm3ewzN8h95cBBuLXwkdzz
	G2CaDB5zv6iODXeLGfCIR8HexQoRPXr/nmYNoq9XhVGpST+IauSZ7EKSC0676898r7TJL4yFtnPL3
	wMC5AnICG1gD3umZBSEVzVUOndOalIPvR1aJdhKyhn0JnirodY3uDoRnWXNmfJDO0NYbtQb7/0wPB
	R9NSAt+H8UiDPJjURqFHYNHcxi/PLS+nPyGg4c+S1R2IZOARpgtPukE6DF03o4w8zj6rkr1dBbwKl
	ABCYSZ8zwwQPIuTd74QIo99/XuEXfHek0Nhxvjcl+qE05Q4gAiWJOC7d4f7UWhHLiIL3vEucm5B/+
	4tjRplWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsLpc-00000008WTQ-2Of2;
	Wed, 12 Mar 2025 13:09:08 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsLWN-00000008Sbw-0hNN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 12:49:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 577525C58AA;
	Wed, 12 Mar 2025 12:46:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F6B0C4CEE3;
	Wed, 12 Mar 2025 12:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741783753;
	bh=dfdp7jDZ0vczWicV98qL8t8i5nsr3pUJL41Jt9xcYb4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MzcrEexW1Uq5X9xFZ2C88IB2Rs845+641MspHD5X+o9/iTiqId8Fh8Zdzu7kJlgIc
	 v9gb0jSRb5RhF0TpHMEh3eHhTBsGF9kw+z9Yws/2xkLWYv6DViH1cDddLdiB/m0kIh
	 PhiKPtJwmg4BNhNR0RkoOs5GWGeKO1cjYkIor1eADvCbXu+33jjJya1SRrlsgkNRSp
	 ACVXvP5N64UjotAqZtNtFTbI/jT5f6d9rc5O5s1D/IW9tVHw6Cd+atdG6/3I1lF4eu
	 s2QmSPv575FX50LjaOJypuZsAHISeJeYl4oE18Cugq85bt5mDukqUNyGqhdNkHPbGk
	 zEYLeDhuxYIqg==
Date: Wed, 12 Mar 2025 12:49:08 +0000
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
Subject: Re: [PATCH v4 4/5] iommu/arm-smmu-qcom: Make set_stall work when the
 device is on
Message-ID: <20250312124907.GB6181@willie-the-truck>
References: <20250304-msm-gpu-fault-fixes-next-v4-0-be14be37f4c3@gmail.com>
 <20250304-msm-gpu-fault-fixes-next-v4-4-be14be37f4c3@gmail.com>
 <20250311181151.GD5216@willie-the-truck>
 <CACu1E7Gg3WpQASADAdediRzFz2wEXAnfD7tg05XkiXZQp=X8fQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACu1E7Gg3WpQASADAdediRzFz2wEXAnfD7tg05XkiXZQp=X8fQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_054915_295175_15F37B3E 
X-CRM114-Status: GOOD (  27.81  )
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

On Tue, Mar 11, 2025 at 04:01:00PM -0400, Connor Abbott wrote:
> On Tue, Mar 11, 2025 at 2:11 PM Will Deacon <will@kernel.org> wrote:
> >
> > On Tue, Mar 04, 2025 at 11:56:50AM -0500, Connor Abbott wrote:
> > > Up until now we have only called the set_stall callback during
> > > initialization when the device is off. But we will soon start calling it
> > > to temporarily disable stall-on-fault when the device is on, so handle
> > > that by checking if the device is on and writing SCTLR.
> > >
> > > Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> > > ---
> > >  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 30 +++++++++++++++++++++++++++---
> > >  1 file changed, 27 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> > > index a428e53add08d451fb2152e3ab80e0fba936e214..d34a0d917013bb3d5a24b3ce72f48e3b38474da2 100644
> > > --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> > > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> > > @@ -77,12 +77,36 @@ static void qcom_adreno_smmu_set_stall(const void *cookie, bool enabled)
> > >  {
> > >       struct arm_smmu_domain *smmu_domain = (void *)cookie;
> > >       struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
> > > -     struct qcom_smmu *qsmmu = to_qcom_smmu(smmu_domain->smmu);
> > > +     struct arm_smmu_device *smmu = smmu_domain->smmu;
> > > +     struct qcom_smmu *qsmmu = to_qcom_smmu(smmu);
> > > +     u32 mask = BIT(cfg->cbndx);
> > > +     bool stall_changed = !!(qsmmu->stall_enabled & mask) != enabled;
> > > +     unsigned long flags;
> > >
> > >       if (enabled)
> > > -             qsmmu->stall_enabled |= BIT(cfg->cbndx);
> > > +             qsmmu->stall_enabled |= mask;
> > >       else
> > > -             qsmmu->stall_enabled &= ~BIT(cfg->cbndx);
> > > +             qsmmu->stall_enabled &= ~mask;
> > > +
> > > +     /*
> > > +      * If the device is on and we changed the setting, update the register.
> > > +      */
> > > +     if (stall_changed && pm_runtime_get_if_active(smmu->dev) > 0) {
> > > +             spin_lock_irqsave(&smmu_domain->cb_lock, flags);
> > > +
> > > +             u32 reg = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_SCTLR);
> > > +
> > > +             if (enabled)
> > > +                     reg |= ARM_SMMU_SCTLR_CFCFG;
> > > +             else
> > > +                     reg &= ~ARM_SMMU_SCTLR_CFCFG;
> > > +
> > > +             arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_SCTLR, reg);
> >
> > Are you sure you don't need TLB invalidation for this to take effect? I
> > think some fields in the SCTLR can be cached in the TLB but you'll need
> > to check whether or not that applies to CFCFG.
> >
> 
> I think it should be fine because CFCFG only controls behavior when
> there's a context fault and there can't be TLB entries for entries
> that cause a context fault: "The architecture permits the caching of
> any translation table entry that has been returned from memory without
> a fault and that does not, as a result of that entry, cause a
> Translation Fault or an Access Flag fault."

Ok, but what about other types of fault? For example, a permission fault
or an address size fault?

Will

