Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4BA4C35FF1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 20:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=52OV000Ss02HywoZBmMaH6saPDX3ZD7R+9jkTkZmirw=; b=yUF1QpmzvU2eoT1kFeUpQlrxP/
	uFaBtS7Kbh0yJda6sOiCn6GoelF8HldesaWwFIe5/a120Pg95AlQ1A1OBBDli96ogd653UDTuwJPT
	VTf4h7nTG3UPb2H5t1Tz9jHqUsxiG7+HGxpWjZb3qS0RDSqORJwpgZULaqRtk9HWDgVtBC1kRmGmW
	uvoY74mh9P7dVHx9/w4zg3i7bujGSNizhX0fQj0za9E1ASjo6qoOWLPpgY4OIMgYpoUoIA3mb6ku6
	bQFBV9wtzznuJ/qrsmvr+LdRe/sugVg6RK9mdbjIr3eKRkVuN5l08CWq+n5Cg0sghf4InKeeS+5TE
	RYOKHQXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts6Ip-00000006vkV-3CRA;
	Tue, 11 Mar 2025 20:34:15 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts5mp-00000006rmc-3ay0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 20:01:12 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2217875d103so12885405ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Mar 2025 13:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741723271; x=1742328071; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=52OV000Ss02HywoZBmMaH6saPDX3ZD7R+9jkTkZmirw=;
        b=QcxW7Qga47TzJ6UWhNpxRZP4Htghz2AP3bYrmtNMJvWsgETDXbzqUmo6+bFIWq2YCr
         DX2iIYylY9nbyvEpR19FnY5qOsc7alixPR0c/rQjkaM14dcIFNZloLSpuHtK482TX9w5
         48Zidhg8IeVqSSZPKrBMcsfPptxE6pFaAURmRcjiadgq+XAx+B078K2Uhi0651a0LAsX
         OWj6K/TafpO6Nuyl5KnssjxbnLRU8pbqCKPsxU4IXuTm4lG1Pxl9Rg/L6b4uXho4SaFQ
         +1J+fUfEbbf5ZkVx7kOuQ26ISNq9oWgqzPJLYIULFfo6sMIhMAIQS226hGucsjb0cYqc
         ioFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741723271; x=1742328071;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=52OV000Ss02HywoZBmMaH6saPDX3ZD7R+9jkTkZmirw=;
        b=YGJiikRJHef1xNA5kS43/phhBQxUU3t5/zXRuFsMSKyzIXoPeyfPHiLdBksCuidLt3
         XWST5lCHa6UPFEfEOSmIT3TN6R2esHDnVp8V7LWWi5oJzfc8U7El47Wvhry1Lac9KCWu
         45wwKAGSURWO6qqQSh1yP6rOBhlP4fDXKH5pNhaZKfkjsLkYGn5BQve2zCn47SUYwh3l
         6j1bUpodzhQJUrJV0mb+BJU7pwbaUnyRrbrYp3ABFA7s4QAEh7igIYb01g3iV9ttEtXJ
         EVVpVhCqUi0tQDHwrkannl+uMLQY60nTIwI3O6UyXZQPR7fHvkXaHlWhCqW0WD3Sh8Pa
         QV7w==
X-Forwarded-Encrypted: i=1; AJvYcCWo0najJij7kp9rzsOip03ZF3i+bmqT2H4DLqtg0AxXVvD2XdwePW9LfOi4SWfzTc9QIca3YQnpAABIR1Chq+o8@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+iCPY0CZKHvmUT0YDDTF/+XxfftKJrrDof2AUzYAkvXmU1uBC
	y1a8hVL5TNDXWDVv4ob41GtEDH2zD67+OKMg/ldGCmiS+bN/lNhqvVe+uEZx2Cn/9vHL7/455FI
	gPFnFsF7aEHOBZ6xclHAUnS4jDDQ=
X-Gm-Gg: ASbGnctSjOxqskLSULu0n8NJz30cE3cHwTCr4fnkCdnLUS6x7CK5pRRp+tm/pvX9Jqz
	UZElTCv79n6NX/ZL1CzY4K9Tjcfw3I/J+DM1yefun4MOgyifu/uluawjCrCxj3NoAwUhAI2ARjP
	xGzhrn5Fz/Wz4kRGOlVHtbTH8OpA==
X-Google-Smtp-Source: AGHT+IEZes+rPRA7sKIj+77k/pMBCMpcY3PJgbIkDYPW+Vp6cHzjHEMWL9jx7sEj0huuFiLemUSLs1dnWAE9qx1ILMs=
X-Received: by 2002:a05:6a00:3d01:b0:730:915c:b70 with SMTP id
 d2e1a72fcca58-736eb884cd6mr2575318b3a.0.1741723270852; Tue, 11 Mar 2025
 13:01:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250304-msm-gpu-fault-fixes-next-v4-0-be14be37f4c3@gmail.com>
 <20250304-msm-gpu-fault-fixes-next-v4-4-be14be37f4c3@gmail.com> <20250311181151.GD5216@willie-the-truck>
In-Reply-To: <20250311181151.GD5216@willie-the-truck>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 11 Mar 2025 16:01:00 -0400
X-Gm-Features: AQ5f1JoexqrwePJhk6DD8zjGJRAEALzPtqaGXwA5Wf6vdtHsWziKMQ-PaQeJdxI
Message-ID: <CACu1E7Gg3WpQASADAdediRzFz2wEXAnfD7tg05XkiXZQp=X8fQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250311_130111_899515_1CAD5458 
X-CRM114-Status: GOOD (  24.54  )
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

On Tue, Mar 11, 2025 at 2:11=E2=80=AFPM Will Deacon <will@kernel.org> wrote=
:
>
> On Tue, Mar 04, 2025 at 11:56:50AM -0500, Connor Abbott wrote:
> > Up until now we have only called the set_stall callback during
> > initialization when the device is off. But we will soon start calling i=
t
> > to temporarily disable stall-on-fault when the device is on, so handle
> > that by checking if the device is on and writing SCTLR.
> >
> > Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> > ---
> >  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 30 ++++++++++++++++++++++=
+++++---
> >  1 file changed, 27 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu=
/arm/arm-smmu/arm-smmu-qcom.c
> > index a428e53add08d451fb2152e3ab80e0fba936e214..d34a0d917013bb3d5a24b3c=
e72f48e3b38474da2 100644
> > --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> > @@ -77,12 +77,36 @@ static void qcom_adreno_smmu_set_stall(const void *=
cookie, bool enabled)
> >  {
> >       struct arm_smmu_domain *smmu_domain =3D (void *)cookie;
> >       struct arm_smmu_cfg *cfg =3D &smmu_domain->cfg;
> > -     struct qcom_smmu *qsmmu =3D to_qcom_smmu(smmu_domain->smmu);
> > +     struct arm_smmu_device *smmu =3D smmu_domain->smmu;
> > +     struct qcom_smmu *qsmmu =3D to_qcom_smmu(smmu);
> > +     u32 mask =3D BIT(cfg->cbndx);
> > +     bool stall_changed =3D !!(qsmmu->stall_enabled & mask) !=3D enabl=
ed;
> > +     unsigned long flags;
> >
> >       if (enabled)
> > -             qsmmu->stall_enabled |=3D BIT(cfg->cbndx);
> > +             qsmmu->stall_enabled |=3D mask;
> >       else
> > -             qsmmu->stall_enabled &=3D ~BIT(cfg->cbndx);
> > +             qsmmu->stall_enabled &=3D ~mask;
> > +
> > +     /*
> > +      * If the device is on and we changed the setting, update the reg=
ister.
> > +      */
> > +     if (stall_changed && pm_runtime_get_if_active(smmu->dev) > 0) {
> > +             spin_lock_irqsave(&smmu_domain->cb_lock, flags);
> > +
> > +             u32 reg =3D arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_C=
B_SCTLR);
> > +
> > +             if (enabled)
> > +                     reg |=3D ARM_SMMU_SCTLR_CFCFG;
> > +             else
> > +                     reg &=3D ~ARM_SMMU_SCTLR_CFCFG;
> > +
> > +             arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_SCTLR, re=
g);
>
> Are you sure you don't need TLB invalidation for this to take effect? I
> think some fields in the SCTLR can be cached in the TLB but you'll need
> to check whether or not that applies to CFCFG.
>
> Will

I think it should be fine because CFCFG only controls behavior when
there's a context fault and there can't be TLB entries for entries
that cause a context fault: "The architecture permits the caching of
any translation table entry that has been returned from memory without
a fault and that does not, as a result of that entry, cause a
Translation Fault or an Access Flag fault."

Connor

