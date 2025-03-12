Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9994DC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 17:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dGBwm8qMS+2GJaCafUPU+5noYTI4wXrs3yJkKVtCLXM=; b=jEDQnh5M7GDvXhaiUR6EXCldaa
	E7vumYekkNPnf0I0wYyGgBqjXF9YkE07LkFxDl3tDOIBC7dITJYkoMNwnDmRz8FxGqhu3phNZzzvs
	lwcboX0JazfyfUPlmkygqdfdkFJjd4XK0pB1B7tiS3wLXSGqzcis4ro8luCKldNAziBdlMB4LT2M1
	hX4l6aOphthq4BwhHJTJCrB9BUa/AZpXrE7c6SnMPTm786iRDSZOy7JbFX30kEFghYzf7UaVdV8my
	b2uzWZuHLF9Ut5mvtWVItq9Lb6w2cJp/lyaBkqWJ13a1NBLIMyStTd2pP4AInWnBkWYFVZY0M/8IE
	kfbjG5tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsPpn-0000000981T-0rvr;
	Wed, 12 Mar 2025 17:25:35 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsPo8-000000097gZ-1Za7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 17:23:53 +0000
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-3d4496a34cdso170335ab.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Mar 2025 10:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741800231; x=1742405031; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dGBwm8qMS+2GJaCafUPU+5noYTI4wXrs3yJkKVtCLXM=;
        b=DW6tGob0n80sSiZfqmFBMkyjs0mN84fKqi75UJUDhMEI+gQPYVHsXW9fGLwgWXSKFt
         WULC8knJqrJU2J0uO1U9R6xBD2nz3Ig8DTz076cf2tGNKMH0dhenJJiqnOOom6V5WhXM
         UiRf67WIj88HnwUfVi5pn4hjJJUcwTkb7iZT5tJw2TMw3IP541x8MCQvC6znjceI2nYb
         I9j3Jv/AGoAhVSjaUdBfUIY2w3wtpbll4f0oKRoRleJizPaPTJTw4ibAq3ihw5jjizzz
         z4c0VxuAHQTCdrwz97h15a41s3Wj0uIV02jV/4nMLzQs0wJRgLVcazzBMfFrqlERiAV/
         cPqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741800231; x=1742405031;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dGBwm8qMS+2GJaCafUPU+5noYTI4wXrs3yJkKVtCLXM=;
        b=Sc9GzB5rr1LqhuiJu8RGEiEr2kS0MaFvD6EAikVj5+dGv33PORCkN1tqTd0L96soDu
         Hnom9dDR61Xnk2BimGT3exyqvq/R9yCfxEqjUWwad073INwTjM9E6JsHV5+++70NpEYM
         +xdiH6PxXX6K0vIdiA+oqzv6hhneIvHdIg7ZHKZTLlcH3f2VkL6sHsGEEPofNi0fDQ48
         xjEcoMVQYJ87Tas8YE/tzmnFTY4WM1TUL2jbfJFD+SE1bKCOyS9YgZ027OKyb20bHzCU
         mo9VwlswXCmKv6MdvhqaxxSb5V2cHRU5+WoLNUgZiIH+YOAlOoYBmzmmuJSnYEaZNaRM
         bWYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWB+wWVnVUk9HFrMbajZdJpS6w2yFbq6O8dcWGvBQgtniHPklsYj2unuzp8YK6eshEcHhTeGcwkc0I3dYUP4fpZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yxijnv4KgkouEeu4WfOTFH93M/cv9TVsghWjj9MwX4orNT39BrG
	Y1s80GuJZfsiGgtMUmOPNXA4h+OD5s9DOZkmzPihR/qXElrc5lOj4gM77pdRoTxffVat9pUfvD9
	rlrMat+0yjKvDGDWHOBdWTwWFBrQ=
X-Gm-Gg: ASbGncvQna2WR0hJIGqx8vxI6WIuE3p6AcHcofPV/hApCOelV0/E9WPDrhAPjYxxs6n
	KKwzimcOAl2Vj/R38ShP+g66kScEHDQAPEwuYLSuwuNu/UCYoEKI6SNaD4ZEY3fjI/FMwafhXFV
	a3PfN/bmsh546uNptbNDXDcJZKqn+vwIZ2O5x1Xt281Ou/DCEGODRxQw1zVLI9n8MIjrM=
X-Google-Smtp-Source: AGHT+IGcOjBT5pnQnFzsB43flH0b/lHGboYrzDRZ8j3X26uAhwiB1vx8sBVrCRaRim73zA8BO7Uy4425SARrON6xCxo=
X-Received: by 2002:a05:6e02:1a84:b0:3d4:2362:98d8 with SMTP id
 e9e14a558f8ab-3d4419576dbmr239903965ab.2.1741800231340; Wed, 12 Mar 2025
 10:23:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250304-msm-gpu-fault-fixes-next-v4-0-be14be37f4c3@gmail.com>
 <20250304-msm-gpu-fault-fixes-next-v4-1-be14be37f4c3@gmail.com>
 <20250311180553.GB5216@willie-the-truck> <CACu1E7GzCiO2b7AFJSDC+pN2VD9VaD2aYz_GGymM3-xAUqd__A@mail.gmail.com>
 <20250312130525.GC6181@willie-the-truck> <CAF6AEGvqYithLFAKpfdkw35DEsUZ8rBt25-oWz3r=kaLt+RbQw@mail.gmail.com>
 <20250312164735.GA6561@willie-the-truck>
In-Reply-To: <20250312164735.GA6561@willie-the-truck>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 12 Mar 2025 10:23:36 -0700
X-Gm-Features: AQ5f1JpoGELyygSS0E-6GUOCTc5ufPPqVKk2sRxHePqLfAbRabP5NvXjW3XjOTE
Message-ID: <CAF6AEGskyoemQDrTXh=ewf61e-hVzWMjmqe=nX2J-65W5-M6Zw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250312_102352_429790_3839021E 
X-CRM114-Status: GOOD (  32.39  )
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

On Wed, Mar 12, 2025 at 9:47=E2=80=AFAM Will Deacon <will@kernel.org> wrote=
:
>
> On Wed, Mar 12, 2025 at 07:59:52AM -0700, Rob Clark wrote:
> > On Wed, Mar 12, 2025 at 6:05=E2=80=AFAM Will Deacon <will@kernel.org> w=
rote:
> > > On Tue, Mar 11, 2025 at 06:36:38PM -0400, Connor Abbott wrote:
> > > > On Tue, Mar 11, 2025 at 2:06=E2=80=AFPM Will Deacon <will@kernel.or=
g> wrote:
> > > > > On Tue, Mar 04, 2025 at 11:56:47AM -0500, Connor Abbott wrote:
> > > > > > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/io=
mmu/arm/arm-smmu/arm-smmu.c
> > > > > > index ade4684c14c9b2724a71e2457288dbfaf7562c83..a9213e0f1579d1e=
3be0bfba75eea1d5de23117de 100644
> > > > > > --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > > > > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > > > > @@ -409,9 +409,12 @@ void arm_smmu_read_context_fault_info(stru=
ct arm_smmu_device *smmu, int idx,
> > > > > >                                     struct arm_smmu_context_fau=
lt_info *cfi)
> > > > > >  {
> > > > > >       cfi->iova =3D arm_smmu_cb_readq(smmu, idx, ARM_SMMU_CB_FA=
R);
> > > > > > +     cfi->ttbr0 =3D arm_smmu_cb_readq(smmu, idx, ARM_SMMU_CB_T=
TBR0);
> > > > > >       cfi->fsr =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSR)=
;
> > > > > > -     cfi->fsynr =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FS=
YNR0);
> > > > > > +     cfi->fsynr0 =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_F=
SYNR0);
> > > > > > +     cfi->fsynr1 =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_F=
SYNR1);
> > > > >
> > > > > We already have an implementation hook (->get_fault_info()) which=
 the
> > > > > qcom SMMU driver can override with qcom_adreno_smmu_get_fault_inf=
o().
> > > > > That thing dumps these registers already so if we're moving that =
into
> > > > > the core SMMU driver, let's get rid of the hook and move everybod=
y over
> > > > > rather than having it done in both places.
> > > >
> > > > As you probably saw, the next commit moves over
> > > > qcom_adreno_smmu_get_fault_info() to use this. The current back doo=
r
> > > > used by drm/msm to access these functions is specific to adreno_smm=
u
> > > > and there isn't an equivalent interface to allow it to call a gener=
ic
> > > > SMMU function so it isn't possible to move it entirely to the core.=
 At
> > > > least not without a bigger refactoring that isn't justified for thi=
s
> > > > series that is just trying to fix things.
> > >
> > > Ok :(
> > >
> > > > > >       cfi->cbfrsynra =3D arm_smmu_gr1_read(smmu, ARM_SMMU_GR1_C=
BFRSYNRA(idx));
> > > > > > +     cfi->contextidr =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_=
CB_CONTEXTIDR);
> > > > >
> > > > > I think the CONTEXTIDR register is stage-1 only, so we shouldn't =
dump
> > > > > it for stage-2 domains.
> > > > >
> > > > Does it matter if we read the register though, as long as users are
> > > > aware of this and don't use its value for anything?
> > >
> > > I think the contents are "UNKNOWN", so it could be hugely confusing e=
ven
> > > if they just got logged someplace. Why is it difficult to avoid touch=
ing
> > > it for stage-2?
> > >
> > Fwiw, we are only ever using stage-1
>
> Sure, but this is in arm-smmu.c which is used by other people and support=
s
> both stages.

Sure, but no one else is using this field in the fault-info.  So maybe
the addition of a comment in the struct would be enough if it isn't
going to cause an SError/etc to read it for S2 cb?

BR,
-R

