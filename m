Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AA77C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 22:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=75JlrEnI8tdqw5rkhyab++osfwTd4EpAvf26QJsRa+Q=; b=ahT+8XMdCMFko+uOd1Qzovif69
	E8FRou/vQ8/7NIwfn3HUzlOHCfZzVFIRNi+/HkkynsHIcuBp0iEJak2oJSb9jgmtGzozmWzeyaJAi
	jDMhBBUzobivqI7euGNWLyhz+mgMLt+UJQat/dXNShx2siQaOYQO2AWr6t6cOy5P8svmmQoNuC06K
	aOxwxiV930c1AXHQCiUclWLmTkV2txqITWI1QzSSmwgCAs48RShe2YZplkTMFGyhSCGFIOxEV0l8E
	o/6JIncL2Z3paWIdHPbyj3fhYZ01EVNDnz27XRyF+zet5+bKUX6JfxSBQeJzm1UXYL16tkPqsuQWb
	Fw/f9xuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts8F7-000000077GV-1DeE;
	Tue, 11 Mar 2025 22:38:33 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts8DS-00000007781-3HPQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 22:36:51 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2f9b8ef4261so1577768a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Mar 2025 15:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741732610; x=1742337410; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=75JlrEnI8tdqw5rkhyab++osfwTd4EpAvf26QJsRa+Q=;
        b=ksi3nWEVOuKpH6NREofC+YyOLcaEW0M4GWd1vmKBwRi125undFMRviJoZdoVD5ECes
         OlmUQoAQg6t4A+y6x7QMLO9YN+xn1yTgdKx6yn3c26H+lJ9HxjDVvv38tpKV1+Uhzu6r
         Uto7V8JeGHavrqtBrlEla4TUPinmdVMTxXoAnW7Bnc+sKOQL56LKLnkfRzehYUKO5CVr
         kScNU83qgfM31/xXIDWHdp4gsDFEXlfM+ie+kPdbUXcuVtOotqtLqrTvRMSzNld1Kagc
         t380FTfoHlnjTDJvmjjr2F4X80Z4E/1f2jxqrVLdQSM8zeo+jYiTOkQNf4n9Q9W18eAZ
         7rBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741732610; x=1742337410;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=75JlrEnI8tdqw5rkhyab++osfwTd4EpAvf26QJsRa+Q=;
        b=BBn7GI/4O1DWpj4LsYGhMt85iTR2OhFH4WqyQh39cDxrD8FfbvRMthJO1y6LUlpISr
         rx1b2p6NHIxFvUGLfUbiTEwydZBC0azo09fyI/EfMGEoNU2dpas7jnKWZ1c8KSxG9MEC
         lSMfJv80u/8fhAiC7zb557p4Q4DCNg9pddLRJRpQlrrdOv/LLNAqUoLzSsxlrEuA7CYh
         2/kYyIQaECdVOr9KF4OdYXc2w/7QK3/X0ro0/0ac/z9lCR4nAi1jMdnW/kx3ujOhuCi1
         B68ct9binpvMmNGNduay9aiiXgmm9LwGGL+akgnEUJ1r7VtgttPiBJhpA9piSxexDAbW
         OJoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgFnaraApGrEdgwz+Yn0leGsZaLJrR8ZmtdMtBH5OmAJcpgiPBuxFoVHsJUOQOn9eEoZ9tCCMyHwSDYTh3TvCl@lists.infradead.org
X-Gm-Message-State: AOJu0YwOe1KkGWBIgzyKK6kqs2pLgqDMRPGd/G1K4pyQaf9ZGxKdsnbD
	DmPnrGiwhpftp1ia2ziIdGLwDDIx+BJWWB8rnu8a4xyZeVKCyHnCcjB/FVljEyezIDcj83/d1N+
	dN7333XHpL8RwXjQcNtz929c3dX0=
X-Gm-Gg: ASbGncsvX9MT+BswHH4pBGytGhypSK0EiZIgPvCTXQ8nu6SqHU2bo+/AeoT72E+x6fU
	F/ZzZA0yqijcqnALCb7YFCCS5kbJ8ffs/jHKw8CkaMgZ/RpsSg51mKSzBhpJGcARKlom4JGhiPg
	8ABZEq19DDxPkxIC+OHuOyhy6k7w==
X-Google-Smtp-Source: AGHT+IE2yP0Oqp5icApOYEeT5S9ryMzCphdSruIQb+pyZ1tL48mZ6lOK0AKajCd16hcESy+fMFtcVCe/Z6YypMdt4rI=
X-Received: by 2002:a17:90b:4a81:b0:2ee:f59a:94d3 with SMTP id
 98e67ed59e1d1-300a2891c23mr8155406a91.0.1741732609220; Tue, 11 Mar 2025
 15:36:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250304-msm-gpu-fault-fixes-next-v4-0-be14be37f4c3@gmail.com>
 <20250304-msm-gpu-fault-fixes-next-v4-1-be14be37f4c3@gmail.com> <20250311180553.GB5216@willie-the-truck>
In-Reply-To: <20250311180553.GB5216@willie-the-truck>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 11 Mar 2025 18:36:38 -0400
X-Gm-Features: AQ5f1Jpps08fowB20qui8teO0kCK3_0sMgX__rQse3av3tUA4enIqUvNjCSXypk
Message-ID: <CACu1E7GzCiO2b7AFJSDC+pN2VD9VaD2aYz_GGymM3-xAUqd__A@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] iommu/arm-smmu: Save additional information on
 context fault
To: Will Deacon <will@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, iommu@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_153650_818972_3562BAA3 
X-CRM114-Status: GOOD (  25.05  )
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

On Tue, Mar 11, 2025 at 2:06=E2=80=AFPM Will Deacon <will@kernel.org> wrote=
:
>
> On Tue, Mar 04, 2025 at 11:56:47AM -0500, Connor Abbott wrote:
> > This will be used by drm/msm for GPU page faults, replacing the manual
> > register reading it does.
> >
> > Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> > ---
> >  drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c |  4 ++--
> >  drivers/iommu/arm/arm-smmu/arm-smmu.c            | 27 +++++++++++++---=
--------
> >  drivers/iommu/arm/arm-smmu/arm-smmu.h            |  5 ++++-
> >  3 files changed, 21 insertions(+), 15 deletions(-)
> >
> > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c b/drivers=
/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
> > index 548783f3f8e89fd978367afa65c473002f66e2e7..ae4fdbbce6ba80440f53955=
7a39866a932360d4e 100644
> > --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
> > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
> > @@ -400,7 +400,7 @@ irqreturn_t qcom_smmu_context_fault(int irq, void *=
dev)
> >
> >       if (list_empty(&tbu_list)) {
> >               ret =3D report_iommu_fault(&smmu_domain->domain, NULL, cf=
i.iova,
> > -                                      cfi.fsynr & ARM_SMMU_CB_FSYNR0_W=
NR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
> > +                                      cfi.fsynr0 & ARM_SMMU_CB_FSYNR0_=
WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
> >
> >               if (ret =3D=3D -ENOSYS)
> >                       arm_smmu_print_context_fault_info(smmu, idx, &cfi=
);
> > @@ -412,7 +412,7 @@ irqreturn_t qcom_smmu_context_fault(int irq, void *=
dev)
> >       phys_soft =3D ops->iova_to_phys(ops, cfi.iova);
> >
> >       tmp =3D report_iommu_fault(&smmu_domain->domain, NULL, cfi.iova,
> > -                              cfi.fsynr & ARM_SMMU_CB_FSYNR0_WNR ? IOM=
MU_FAULT_WRITE : IOMMU_FAULT_READ);
> > +                              cfi.fsynr0 & ARM_SMMU_CB_FSYNR0_WNR ? IO=
MMU_FAULT_WRITE : IOMMU_FAULT_READ);
> >       if (!tmp || tmp =3D=3D -EBUSY) {
> >               ret =3D IRQ_HANDLED;
> >               resume =3D ARM_SMMU_RESUME_TERMINATE;
> > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/=
arm-smmu/arm-smmu.c
> > index ade4684c14c9b2724a71e2457288dbfaf7562c83..a9213e0f1579d1e3be0bfba=
75eea1d5de23117de 100644
> > --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > @@ -409,9 +409,12 @@ void arm_smmu_read_context_fault_info(struct arm_s=
mmu_device *smmu, int idx,
> >                                     struct arm_smmu_context_fault_info =
*cfi)
> >  {
> >       cfi->iova =3D arm_smmu_cb_readq(smmu, idx, ARM_SMMU_CB_FAR);
> > +     cfi->ttbr0 =3D arm_smmu_cb_readq(smmu, idx, ARM_SMMU_CB_TTBR0);
> >       cfi->fsr =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSR);
> > -     cfi->fsynr =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR0);
> > +     cfi->fsynr0 =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR0);
> > +     cfi->fsynr1 =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR1);
>
> We already have an implementation hook (->get_fault_info()) which the
> qcom SMMU driver can override with qcom_adreno_smmu_get_fault_info().
> That thing dumps these registers already so if we're moving that into
> the core SMMU driver, let's get rid of the hook and move everybody over
> rather than having it done in both places.

As you probably saw, the next commit moves over
qcom_adreno_smmu_get_fault_info() to use this. The current back door
used by drm/msm to access these functions is specific to adreno_smmu
and there isn't an equivalent interface to allow it to call a generic
SMMU function so it isn't possible to move it entirely to the core. At
least not without a bigger refactoring that isn't justified for this
series that is just trying to fix things.

>
> >       cfi->cbfrsynra =3D arm_smmu_gr1_read(smmu, ARM_SMMU_GR1_CBFRSYNRA=
(idx));
> > +     cfi->contextidr =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_CONTE=
XTIDR);
>
> I think the CONTEXTIDR register is stage-1 only, so we shouldn't dump
> it for stage-2 domains.
>
> Will

Does it matter if we read the register though, as long as users are
aware of this and don't use its value for anything?

Connor

