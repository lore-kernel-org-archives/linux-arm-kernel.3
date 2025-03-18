Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52618C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 15:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VxbzKraClaTFrRzQSEPz8b03iRr+XTuiYJ3jiE+lJK0=; b=UfGIv8Cqf84m8GSgzXmFGsFetr
	sVOh//Uiows94Wo+bhCjo7ndtypY0vv9t8Yg8e8crE4/T2Y9tO2E80x/BEk4yYsZDNPaeJ/uCzb0o
	Lst4MoWsas/omvWzMFxMqaPlmmuEv8/t2GjG16uZm7h7OS+V9an78Rqna1Qfm1Fi6oK7TXfQ6AOl0
	vlgxfBUPOphr0FnJ1zGZYYzwbfIuezSB9kXlJ0O88Id1BwfEiO7oYnFx8MxBPgoSrh2xDXi5h7D1r
	TNX7eDYNJW8znAN1qn0xnr+SQ8YSb8htfVA+Z2sB0J6vQbTQrB06XTptjsSOgJun2AcrA/6BG7BfL
	rAN6uAww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuZAu-00000006PBq-36b6;
	Tue, 18 Mar 2025 15:48:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuZ9C-00000006Oqr-3i8O
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 15:46:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0B0D35C58BF;
	Tue, 18 Mar 2025 15:44:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DFE2C4CEDD;
	Tue, 18 Mar 2025 15:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742312788;
	bh=JnY/ZKE/gr3SlMwGWRDFKvd5Yy5TdFOI6fug+T1XPi8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KavZQkFgOk09Jw4FXDndLh0E2IgQB0RgcPfNcjgeajLCMBIpmVU7G0mi0i5yPg1eB
	 n60klv1ZVpIHY50jAbD9urEfZAhYp5mx6q8MQoIgdYlNWI5L1eB4XmPdLNvKAaAI2f
	 loiTcD60OhvtpDwY5w13YIaxrkxlP8oqIRPZMu/CCDyg/hf8NyOY435TTbSSw/wCUy
	 eE66wwC7ieU9ZuIDzRQzfR0SJSozicIELOMaSrSRyimZVsXFc/E60JpmvJgDhP68bX
	 GEcEYpkiHr8yNAyLXqSNbFRvlJV+JTvbFk/qiB5nmxaiHMkF3lgNrRH3HZ6HSan2iL
	 8JmYSzomY3qcA==
Date: Tue, 18 Mar 2025 15:46:22 +0000
From: Will Deacon <will@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Cc: Robin Murphy <robin.murphy@arm.com>,
	Connor Abbott <cwabbott0@gmail.com>, Joerg Roedel <joro@8bytes.org>,
	Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	freedreno@lists.freedesktop.org
Subject: Re: [PATCH v4 1/5] iommu/arm-smmu: Save additional information on
 context fault
Message-ID: <20250318154622.GA13829@willie-the-truck>
References: <20250304-msm-gpu-fault-fixes-next-v4-0-be14be37f4c3@gmail.com>
 <20250304-msm-gpu-fault-fixes-next-v4-1-be14be37f4c3@gmail.com>
 <20250311180553.GB5216@willie-the-truck>
 <CACu1E7GzCiO2b7AFJSDC+pN2VD9VaD2aYz_GGymM3-xAUqd__A@mail.gmail.com>
 <20250312130525.GC6181@willie-the-truck>
 <CAF6AEGvqYithLFAKpfdkw35DEsUZ8rBt25-oWz3r=kaLt+RbQw@mail.gmail.com>
 <20250312164735.GA6561@willie-the-truck>
 <CAF6AEGskyoemQDrTXh=ewf61e-hVzWMjmqe=nX2J-65W5-M6Zw@mail.gmail.com>
 <2d47815d-6bee-4d1f-8b60-854763794bf6@arm.com>
 <CAF6AEGvhixYvXghvD+itnSDjr7bO4i3Ls0Y-kXC-ohFN=CS0PQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGvhixYvXghvD+itnSDjr7bO4i3Ls0Y-kXC-ohFN=CS0PQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_084631_006566_3EE09072 
X-CRM114-Status: GOOD (  32.77  )
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

On Wed, Mar 12, 2025 at 01:20:45PM -0700, Rob Clark wrote:
> On Wed, Mar 12, 2025 at 11:01 AM Robin Murphy <robin.murphy@arm.com> wrote:
> >
> > On 12/03/2025 5:23 pm, Rob Clark wrote:
> > > On Wed, Mar 12, 2025 at 9:47 AM Will Deacon <will@kernel.org> wrote:
> > >>
> > >> On Wed, Mar 12, 2025 at 07:59:52AM -0700, Rob Clark wrote:
> > >>> On Wed, Mar 12, 2025 at 6:05 AM Will Deacon <will@kernel.org> wrote:
> > >>>> On Tue, Mar 11, 2025 at 06:36:38PM -0400, Connor Abbott wrote:
> > >>>>> On Tue, Mar 11, 2025 at 2:06 PM Will Deacon <will@kernel.org> wrote:
> > >>>>>> On Tue, Mar 04, 2025 at 11:56:47AM -0500, Connor Abbott wrote:
> > >>>>>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > >>>>>>> index ade4684c14c9b2724a71e2457288dbfaf7562c83..a9213e0f1579d1e3be0bfba75eea1d5de23117de 100644
> > >>>>>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > >>>>>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > >>>>>>> @@ -409,9 +409,12 @@ void arm_smmu_read_context_fault_info(struct arm_smmu_device *smmu, int idx,
> > >>>>>>>                                      struct arm_smmu_context_fault_info *cfi)
> > >>>>>>>   {
> > >>>>>>>        cfi->iova = arm_smmu_cb_readq(smmu, idx, ARM_SMMU_CB_FAR);
> > >>>>>>> +     cfi->ttbr0 = arm_smmu_cb_readq(smmu, idx, ARM_SMMU_CB_TTBR0);
> > >>>>>>>        cfi->fsr = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSR);
> > >>>>>>> -     cfi->fsynr = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR0);
> > >>>>>>> +     cfi->fsynr0 = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR0);
> > >>>>>>> +     cfi->fsynr1 = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR1);
> > >>>>>>
> > >>>>>> We already have an implementation hook (->get_fault_info()) which the
> > >>>>>> qcom SMMU driver can override with qcom_adreno_smmu_get_fault_info().
> > >>>>>> That thing dumps these registers already so if we're moving that into
> > >>>>>> the core SMMU driver, let's get rid of the hook and move everybody over
> > >>>>>> rather than having it done in both places.
> > >>>>>
> > >>>>> As you probably saw, the next commit moves over
> > >>>>> qcom_adreno_smmu_get_fault_info() to use this. The current back door
> > >>>>> used by drm/msm to access these functions is specific to adreno_smmu
> > >>>>> and there isn't an equivalent interface to allow it to call a generic
> > >>>>> SMMU function so it isn't possible to move it entirely to the core. At
> > >>>>> least not without a bigger refactoring that isn't justified for this
> > >>>>> series that is just trying to fix things.
> > >>>>
> > >>>> Ok :(
> > >>>>
> > >>>>>>>        cfi->cbfrsynra = arm_smmu_gr1_read(smmu, ARM_SMMU_GR1_CBFRSYNRA(idx));
> > >>>>>>> +     cfi->contextidr = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_CONTEXTIDR);
> > >>>>>>
> > >>>>>> I think the CONTEXTIDR register is stage-1 only, so we shouldn't dump
> > >>>>>> it for stage-2 domains.
> > >>>>>>
> > >>>>> Does it matter if we read the register though, as long as users are
> > >>>>> aware of this and don't use its value for anything?
> > >>>>
> > >>>> I think the contents are "UNKNOWN", so it could be hugely confusing even
> > >>>> if they just got logged someplace. Why is it difficult to avoid touching
> > >>>> it for stage-2?
> > >>>>
> > >>> Fwiw, we are only ever using stage-1
> > >>
> > >> Sure, but this is in arm-smmu.c which is used by other people and supports
> > >> both stages.
> > >
> > > Sure, but no one else is using this field in the fault-info.  So maybe
> > > the addition of a comment in the struct would be enough if it isn't
> > > going to cause an SError/etc to read it for S2 cb?
> >
> > Any worthwhile comment isn't going to be significantly shorter or
> > clearer than 1 extra line of "if (smmu_domain->stage ==
> > ARM_SMMU_DOMAIN_S1)"...
> 
> Just that smmu_domain isn't passed to
> arm_smmu_read_context_fault_info(), so it would add some extra churn
> on top of that one extra line

Churn is what we do best in this driver :)

Will

