Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 771E6C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 13:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BBctFsjmeN6VVslMSX3ZvqdK0/Rk8ae8uumPF0NJ1/s=; b=U9GeA3BRWvgiPiLh8d8Ek68pho
	dCIfccmUnVmKyj0cPdlKQqwFy35oQgPsrktqIfmP2EXYdwtYAASkg0DN2NHVSg5+tl9gm2DBBeCbn
	nXbKLoWZkSbhXuvyXT3Qpl7/mracyrQPLAxKokQf0863G3XhcPAf/V2ASBCamsCjH9LEAlT06S3dG
	OSZnPgdgbXw94IrPqhldmUCE9dFkXa3ml+XfXYW6Zu263eqoEKJGw3JhdnpJr5Nbn3/p1Q9COGJLN
	VxXT1o8C9yTBJaEM5AC+kfhm0xpLBlOwaetB3cm6rlwts7RUrmQ7z92HnaY8d26XuUZ4thz+bhrW8
	FuYCZx6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsMVu-00000008ckV-1qRh;
	Wed, 12 Mar 2025 13:52:50 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsMA7-00000008Zbs-3J2f
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 13:30:20 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-224172f32b3so11071995ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Mar 2025 06:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741786219; x=1742391019; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BBctFsjmeN6VVslMSX3ZvqdK0/Rk8ae8uumPF0NJ1/s=;
        b=ByxSFIFjaOl9G2DbAyhgL4Vv3p+Y13Zk5eGe0pzvrvDB6CSR4oCp20pe65MoELqLha
         J3WG4n33YCr5dDC9NTiCD/Z1ak9pgnGZiBdjSTc0elM111uMdIy912XjzqA6mbJr7aiB
         R0gVjOegy3w8TOWVcVqqnqQtyxv7060RzYn+aiNsDHo30U1K7I5t8Qr2ukWGFu9RECk4
         aMmF0T+8tlQIeIujo5CykoGOb/Y3IIpCG5WljXrr/Ii2sJOAKAk0S3ciuvP77UYVKj0J
         +xY7McT0Kw5PbAFDQ1J8MDj/EspvS3fUGGbKwxnyFb4jnbbopYvxDVfl78Tyqw7yjrmU
         SgMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741786219; x=1742391019;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BBctFsjmeN6VVslMSX3ZvqdK0/Rk8ae8uumPF0NJ1/s=;
        b=paDZkedtB8sEXqDVJ561xFnzmt9FwTR0pz17ZUR1D3SA2qb+meKOeC23C1JvB1Zes2
         676T0jXxJbKIq/hzIiqKpf0/QcV1nLtu7gYlAEiXZNbqSlxMsZUcnCYkepGeOyk0i7en
         L9TGR3QfxC+GH42rEG83iYlth2olFPBSzLE3fXqiAqBXrCXr/7Uusb8ou0zdNnX6kA+s
         t6wL44bi23Axx/ImNjOchuR3SWJR6jRd8/LL/FcyehdOJFt+oOZ+n2qA2/VPyXU42bhp
         e7vPC48Eh2jp1/xHBzRH6g6n6JTgLKM3YnTZIV770ykUA7twHXxrma7JfrI3SfEaE4E0
         iGrg==
X-Forwarded-Encrypted: i=1; AJvYcCXgW+Sc78ZzX7hlyNBGQrgH7I8gHaux65vzSWh+a48cu2p0KyqBNF/rhibg/JL7RculFh1wubzpmeZ67JtzJ3oL@lists.infradead.org
X-Gm-Message-State: AOJu0Yzs1KcuzptqWs2aIPl9E3bfAifBSXVUVIwETI06936s4Y7deFQ+
	cyhmXY78LeNAt3+nhQ5/y7rVGYQVWuNEpGo7AR7Vc5lCAIlYjCE8Cf7iv4PF5J16NvyF5fSmEP+
	EyhrHT9+ruPl0HGtzArCpq4cQ4FA=
X-Gm-Gg: ASbGncuSK6g1VHWseHqAZWvJyltI6oBnEA8Wvkx7Q4sZFN+7yDSJoGBaxbyqIzZfj43
	C5pdoLsnDsEpPi59BoqdQx/kFmW6ZVRPbcNAEinWJdnJiTQqUOdW3BPABrGMIIYd3RYP972EhW/
	kc32DBvwz2jE+m83ubO4u1rpVfsQ==
X-Google-Smtp-Source: AGHT+IHNI8mdn86Q0gIcolu7qp1NQiSCr9Mpiw/QLXiMzo4X0s/wK63ODT6l7NpH3nsyJT/iynSTv/X8C6Q/+ji18QU=
X-Received: by 2002:a05:6a00:2d9f:b0:730:9467:b4b8 with SMTP id
 d2e1a72fcca58-736eba6ca4cmr3642332b3a.4.1741786218878; Wed, 12 Mar 2025
 06:30:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250304-msm-gpu-fault-fixes-next-v4-0-be14be37f4c3@gmail.com>
 <20250304-msm-gpu-fault-fixes-next-v4-4-be14be37f4c3@gmail.com>
 <20250311181151.GD5216@willie-the-truck> <CACu1E7Gg3WpQASADAdediRzFz2wEXAnfD7tg05XkiXZQp=X8fQ@mail.gmail.com>
 <20250312124907.GB6181@willie-the-truck>
In-Reply-To: <20250312124907.GB6181@willie-the-truck>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Wed, 12 Mar 2025 09:30:07 -0400
X-Gm-Features: AQ5f1JqWM8ID_E8sPNheprXCY9CSTKUwdJFoTdyL5levhUnxGmDxSGFVnmiAz6I
Message-ID: <CACu1E7Hm=DWDC2aFdBRkT8f=8gKXJPpif_uEOA9iFZcyT-uCfQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] iommu/arm-smmu-qcom: Make set_stall work when the
 device is on
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
X-CRM114-CacheID: sfid-20250312_063019_831492_7FA4733A 
X-CRM114-Status: GOOD (  33.02  )
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

On Wed, Mar 12, 2025 at 8:49=E2=80=AFAM Will Deacon <will@kernel.org> wrote=
:
>
> On Tue, Mar 11, 2025 at 04:01:00PM -0400, Connor Abbott wrote:
> > On Tue, Mar 11, 2025 at 2:11=E2=80=AFPM Will Deacon <will@kernel.org> w=
rote:
> > >
> > > On Tue, Mar 04, 2025 at 11:56:50AM -0500, Connor Abbott wrote:
> > > > Up until now we have only called the set_stall callback during
> > > > initialization when the device is off. But we will soon start calli=
ng it
> > > > to temporarily disable stall-on-fault when the device is on, so han=
dle
> > > > that by checking if the device is on and writing SCTLR.
> > > >
> > > > Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> > > > ---
> > > >  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 30 ++++++++++++++++++=
+++++++++---
> > > >  1 file changed, 27 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/i=
ommu/arm/arm-smmu/arm-smmu-qcom.c
> > > > index a428e53add08d451fb2152e3ab80e0fba936e214..d34a0d917013bb3d5a2=
4b3ce72f48e3b38474da2 100644
> > > > --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> > > > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> > > > @@ -77,12 +77,36 @@ static void qcom_adreno_smmu_set_stall(const vo=
id *cookie, bool enabled)
> > > >  {
> > > >       struct arm_smmu_domain *smmu_domain =3D (void *)cookie;
> > > >       struct arm_smmu_cfg *cfg =3D &smmu_domain->cfg;
> > > > -     struct qcom_smmu *qsmmu =3D to_qcom_smmu(smmu_domain->smmu);
> > > > +     struct arm_smmu_device *smmu =3D smmu_domain->smmu;
> > > > +     struct qcom_smmu *qsmmu =3D to_qcom_smmu(smmu);
> > > > +     u32 mask =3D BIT(cfg->cbndx);
> > > > +     bool stall_changed =3D !!(qsmmu->stall_enabled & mask) !=3D e=
nabled;
> > > > +     unsigned long flags;
> > > >
> > > >       if (enabled)
> > > > -             qsmmu->stall_enabled |=3D BIT(cfg->cbndx);
> > > > +             qsmmu->stall_enabled |=3D mask;
> > > >       else
> > > > -             qsmmu->stall_enabled &=3D ~BIT(cfg->cbndx);
> > > > +             qsmmu->stall_enabled &=3D ~mask;
> > > > +
> > > > +     /*
> > > > +      * If the device is on and we changed the setting, update the=
 register.
> > > > +      */
> > > > +     if (stall_changed && pm_runtime_get_if_active(smmu->dev) > 0)=
 {
> > > > +             spin_lock_irqsave(&smmu_domain->cb_lock, flags);
> > > > +
> > > > +             u32 reg =3D arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SM=
MU_CB_SCTLR);
> > > > +
> > > > +             if (enabled)
> > > > +                     reg |=3D ARM_SMMU_SCTLR_CFCFG;
> > > > +             else
> > > > +                     reg &=3D ~ARM_SMMU_SCTLR_CFCFG;
> > > > +
> > > > +             arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_SCTLR=
, reg);
> > >
> > > Are you sure you don't need TLB invalidation for this to take effect?=
 I
> > > think some fields in the SCTLR can be cached in the TLB but you'll ne=
ed
> > > to check whether or not that applies to CFCFG.
> > >
> >
> > I think it should be fine because CFCFG only controls behavior when
> > there's a context fault and there can't be TLB entries for entries
> > that cause a context fault: "The architecture permits the caching of
> > any translation table entry that has been returned from memory without
> > a fault and that does not, as a result of that entry, cause a
> > Translation Fault or an Access Flag fault."
>
> Ok, but what about other types of fault? For example, a permission fault
> or an address size fault?
>
> Will

I'm not sure, but the pseudocode for context faults mentions
resampling CFCFG after a fault happens ("We have a fault and must
resample FSR, CFCFG and HUPCF") so I don't think it would be legal to
cache it. Also in practice this does seem to work. Does that answer
it?

Connor

