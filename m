Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BE4DC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 15:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D6gQ0iOf/v4AHfEFcB/wPe/V8o5CcEN4WSOGct8jdq8=; b=fy2xlzyOH7d2NJqcgJZTxuBLEv
	eRA9cJCLrPPtCVqziXyIoWAqIb4MQ94hlVfvWs/Ksi6i4NdgCTelVVthdT2mvomiV1s9QjZTUAe7U
	1IhBU1mlgswFqO2ZIjxEZZ8fBsVcI06b4RyN57cS6YFb5unWbCa2vA/nrCJHfIoUbXq5qhlQyvScK
	X14f1fTH0eSNASloLCVBxtUgzG4NiBE6+HroB4fGcljTaPXUN0QgJ7irckCwZuUDqWURmPDP4z3V/
	PXTHCZEgn2vHAduJinIB9FjgQF48h+zeCltI1OY+WvAXvQON3V41/d8Mf4Dyhqv+aaUqWOg/EcudW
	nxzAzawQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsNeY-00000008moP-3EU6;
	Wed, 12 Mar 2025 15:05:50 +0000
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsNZ1-00000008m4Q-2tFA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 15:00:08 +0000
Received: by mail-il1-x12e.google.com with SMTP id e9e14a558f8ab-3d439dc0548so18089325ab.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Mar 2025 08:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741791605; x=1742396405; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D6gQ0iOf/v4AHfEFcB/wPe/V8o5CcEN4WSOGct8jdq8=;
        b=lLdK7Bwla+Tj5vVUuHysEeQjkYNQqKVOFZb+XqUI9gIxHqncU1heueIFD/JdQhdLTh
         cANkD3G72lDGDrrDEgdBjAfBxpUQSg7i3jFtiSsRO32vmdiy/XxEJaJuzxaYx8FK8aug
         GLo57H6KCiqJUw+8yyQbKBcInL0Ev5QD8O5UTm7iOc2p14pDan6QMnR0VdEL0dg/KKPH
         IgR2JGCC9uDeOMt/UeyrsjPfhv3Def5FQmQBjRlkHy90RWBSj0kBHFQmPpzfRtzEdu5T
         actjkeJ8zb4tqvUfxwAW1+/4gXw3oK5FbUIPI1ZziXAqdPgFaVH36AeIXgSyE9a25ZJ6
         kJTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741791605; x=1742396405;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D6gQ0iOf/v4AHfEFcB/wPe/V8o5CcEN4WSOGct8jdq8=;
        b=aAPPdGGVS0zpZuuRckshbn7Kfoaoy0ZU6m0MmV260BJS+zq3T6LASpDe4H1KUxGrbS
         vSxqtQ8AToV3DnLP12vgLYPicCBNuqxa2RW8pbf6SbpBR6BCT/NNi1Zq3HShL44gs7A1
         l35xRLd1dFt0B6Lm6VVvxV0gq2Gwaj+5iheHatOXQRLdS5F1fflp/t15DKJNWoX4TOyr
         7uUbX7pnFpdqgV0OevnGDhuWD68w5yQIew4zQk2Slj0oLF3knk0qiZqI6MtNpYL5fw0y
         yP9nIemnbPTO4PMANSmSKdIKrSmSHgPaOZyBtuoLYoSREJnMssdaZ5uAGFEQVmoKWmUs
         6lJA==
X-Forwarded-Encrypted: i=1; AJvYcCVflBZDkIAWCvPkcYmvwREpBFMSEYekoFLLwbwrno4y5m8JoVpH7cTDOxwGbD+rbaZ47wSGOqFXBfzG9DCkOoY9@lists.infradead.org
X-Gm-Message-State: AOJu0Yy66AkqLii3ow6uLykJ++pW/e5O/vwTezosoL/2GbVrCHmT0wBS
	lA0HOKDcJwvqk6srdtJe3hPT5hHnfQjbVpZxgIdnyi0hu6mNi0e+0mbf3Im5FNIh4fpH8IRe+Zt
	DWoPcZld7VjWhbfY/6wYukdA1v+o=
X-Gm-Gg: ASbGncueG6f/ANUu9KKygHWt8HvTkD0j6RlFM7N7k/E+DiJnX+Fpm2ZXgfdHwL02hTN
	61HIBPdYsnfZQESLeJmWsuOHhqq7Fu++ACxiR1ka+wRRsS7D7lYRmnV8PWJ7skGypLfEQCPYolN
	F7ltmRZ301NIV8BjZXS3ICJqfbvCVdryjyNBsK7+6nhVymKGiIrM+UtV2P
X-Google-Smtp-Source: AGHT+IG89CocD4yRKYNpZ9RLEOYRBeA78CpihMbt2tnLubfpVvKNjOKB0QgfM5gz+kA7p7liUlyqeFuRDen+lF6vWSw=
X-Received: by 2002:a05:6e02:3f89:b0:3d4:337f:121c with SMTP id
 e9e14a558f8ab-3d4419902e4mr241203255ab.10.1741791605230; Wed, 12 Mar 2025
 08:00:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250304-msm-gpu-fault-fixes-next-v4-0-be14be37f4c3@gmail.com>
 <20250304-msm-gpu-fault-fixes-next-v4-1-be14be37f4c3@gmail.com>
 <20250311180553.GB5216@willie-the-truck> <CACu1E7GzCiO2b7AFJSDC+pN2VD9VaD2aYz_GGymM3-xAUqd__A@mail.gmail.com>
 <20250312130525.GC6181@willie-the-truck>
In-Reply-To: <20250312130525.GC6181@willie-the-truck>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 12 Mar 2025 07:59:52 -0700
X-Gm-Features: AQ5f1JorVIrx8dg8nV8siCMmQzu9hAMvxaP2jgGpa2BA4UCWgNEK-jMOL9dUEzA
Message-ID: <CAF6AEGvqYithLFAKpfdkw35DEsUZ8rBt25-oWz3r=kaLt+RbQw@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] iommu/arm-smmu: Save additional information on
 context fault
To: Will Deacon <will@kernel.org>
Cc: Connor Abbott <cwabbott0@gmail.com>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, iommu@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_080007_731795_160DF871 
X-CRM114-Status: GOOD (  34.07  )
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

On Wed, Mar 12, 2025 at 6:05=E2=80=AFAM Will Deacon <will@kernel.org> wrote=
:
>
> On Tue, Mar 11, 2025 at 06:36:38PM -0400, Connor Abbott wrote:
> > On Tue, Mar 11, 2025 at 2:06=E2=80=AFPM Will Deacon <will@kernel.org> w=
rote:
> > >
> > > On Tue, Mar 04, 2025 at 11:56:47AM -0500, Connor Abbott wrote:
> > > > This will be used by drm/msm for GPU page faults, replacing the man=
ual
> > > > register reading it does.
> > > >
> > > > Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> > > > ---
> > > >  drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c |  4 ++--
> > > >  drivers/iommu/arm/arm-smmu/arm-smmu.c            | 27 ++++++++++++=
+-----------
> > > >  drivers/iommu/arm/arm-smmu/arm-smmu.h            |  5 ++++-
> > > >  3 files changed, 21 insertions(+), 15 deletions(-)
> > > >
> > > > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c b/dri=
vers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
> > > > index 548783f3f8e89fd978367afa65c473002f66e2e7..ae4fdbbce6ba80440f5=
39557a39866a932360d4e 100644
> > > > --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
> > > > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
> > > > @@ -400,7 +400,7 @@ irqreturn_t qcom_smmu_context_fault(int irq, vo=
id *dev)
> > > >
> > > >       if (list_empty(&tbu_list)) {
> > > >               ret =3D report_iommu_fault(&smmu_domain->domain, NULL=
, cfi.iova,
> > > > -                                      cfi.fsynr & ARM_SMMU_CB_FSYN=
R0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
> > > > +                                      cfi.fsynr0 & ARM_SMMU_CB_FSY=
NR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
> > > >
> > > >               if (ret =3D=3D -ENOSYS)
> > > >                       arm_smmu_print_context_fault_info(smmu, idx, =
&cfi);
> > > > @@ -412,7 +412,7 @@ irqreturn_t qcom_smmu_context_fault(int irq, vo=
id *dev)
> > > >       phys_soft =3D ops->iova_to_phys(ops, cfi.iova);
> > > >
> > > >       tmp =3D report_iommu_fault(&smmu_domain->domain, NULL, cfi.io=
va,
> > > > -                              cfi.fsynr & ARM_SMMU_CB_FSYNR0_WNR ?=
 IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
> > > > +                              cfi.fsynr0 & ARM_SMMU_CB_FSYNR0_WNR =
? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
> > > >       if (!tmp || tmp =3D=3D -EBUSY) {
> > > >               ret =3D IRQ_HANDLED;
> > > >               resume =3D ARM_SMMU_RESUME_TERMINATE;
> > > > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/=
arm/arm-smmu/arm-smmu.c
> > > > index ade4684c14c9b2724a71e2457288dbfaf7562c83..a9213e0f1579d1e3be0=
bfba75eea1d5de23117de 100644
> > > > --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > > @@ -409,9 +409,12 @@ void arm_smmu_read_context_fault_info(struct a=
rm_smmu_device *smmu, int idx,
> > > >                                     struct arm_smmu_context_fault_i=
nfo *cfi)
> > > >  {
> > > >       cfi->iova =3D arm_smmu_cb_readq(smmu, idx, ARM_SMMU_CB_FAR);
> > > > +     cfi->ttbr0 =3D arm_smmu_cb_readq(smmu, idx, ARM_SMMU_CB_TTBR0=
);
> > > >       cfi->fsr =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSR);
> > > > -     cfi->fsynr =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR0=
);
> > > > +     cfi->fsynr0 =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR=
0);
> > > > +     cfi->fsynr1 =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR=
1);
> > >
> > > We already have an implementation hook (->get_fault_info()) which the
> > > qcom SMMU driver can override with qcom_adreno_smmu_get_fault_info().
> > > That thing dumps these registers already so if we're moving that into
> > > the core SMMU driver, let's get rid of the hook and move everybody ov=
er
> > > rather than having it done in both places.
> >
> > As you probably saw, the next commit moves over
> > qcom_adreno_smmu_get_fault_info() to use this. The current back door
> > used by drm/msm to access these functions is specific to adreno_smmu
> > and there isn't an equivalent interface to allow it to call a generic
> > SMMU function so it isn't possible to move it entirely to the core. At
> > least not without a bigger refactoring that isn't justified for this
> > series that is just trying to fix things.
>
> Ok :(
>
> > > >       cfi->cbfrsynra =3D arm_smmu_gr1_read(smmu, ARM_SMMU_GR1_CBFRS=
YNRA(idx));
> > > > +     cfi->contextidr =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_C=
ONTEXTIDR);
> > >
> > > I think the CONTEXTIDR register is stage-1 only, so we shouldn't dump
> > > it for stage-2 domains.
> > >
> > Does it matter if we read the register though, as long as users are
> > aware of this and don't use its value for anything?
>
> I think the contents are "UNKNOWN", so it could be hugely confusing even
> if they just got logged someplace. Why is it difficult to avoid touching
> it for stage-2?
>
> Will

Fwiw, we are only ever using stage-1

BR,
-R

