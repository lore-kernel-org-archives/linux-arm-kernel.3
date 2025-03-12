Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 117D4C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 20:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=leDzS7eIFvtHXIQQ9eglVb87YCz9EMBQq+7ox6gc9Qk=; b=K2EVq9aO6en0J/iom4t9PIPvQJ
	AwUybhPpd5Ejdmroe5zPjQbRTC+XFfGtzqwtO2Td3ZSN5f4jVSttSVNLPGBsB11u+OYcj7855RDZS
	2x8zJ4ttLGlDYngFbsZWRFDTGOl/bum1yaeI8QfxXbwc8eGoW5I9GgHqnrJibkCQTi1RVbLlmF+u+
	7U4DlKrbueZDqgUW2oB/g+lFADEKrN6OYJb06wdbc2rlq5dUoYzuoKvfISvRERsPXbiDK2kg1NMvi
	MMY6hHcNFScClEnGaKs6CE/ntE+3iF87KzkiGlgf5Rh0yAA88r9vQi0ktsoZOxOC0N2xajulMd09x
	jNG69fpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsSbB-00000009Q2H-1vpR;
	Wed, 12 Mar 2025 20:22:41 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsSZX-00000009Pwm-0fnI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 20:21:00 +0000
Received: by mail-il1-x130.google.com with SMTP id e9e14a558f8ab-3d3db3b68a7so1840335ab.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Mar 2025 13:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741810858; x=1742415658; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=leDzS7eIFvtHXIQQ9eglVb87YCz9EMBQq+7ox6gc9Qk=;
        b=GTmr7kGj9pGWpTp/J9yvD8qphgaLVn4SGVP3evWKCwThJggsbeZYULW8r9QhN4jYRQ
         STg64vKZQsXhEeqICplUOBPD3wrNSfXRzR9Sq6VE90gYvtT/5B/p2SV3OR20BrvQwPUY
         07LNDuRNXL4f1FwRqKdYGXmOI8ctWrwTJ0nB8bO1wURt+GYy6vqNtbpGDvECbQKdEu7y
         I+mvBIY438M/Dr25MSNMPcA2K4ukudbOeKsOyN7AfGPsrwbt7iIGn4ybp1U4Dox6DYFr
         7eEq07lEGMuSPbMKI0HzIpEJJ86xiY2UU+9T3tj/AZGK4vvnQPbH9ca8LYczFTuH/YUw
         gKZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741810858; x=1742415658;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=leDzS7eIFvtHXIQQ9eglVb87YCz9EMBQq+7ox6gc9Qk=;
        b=Xs65MABt5bFoJTPT6N4DnovnftJUrBZqfj7CwMteMVsDC2tCvZ4o1dcsXeHIBUzTzY
         U1LG9aT2qiCJqtNwfmu30refPs4FI/C2E1cPUdPr32qes5iXc3QSYpt35DSP1uNKw4RW
         cttciZQvzgifmriJ0hOjQi3yBY4BBjYoYBEQHmH1Bu3MH5grJZ546ETwJxKGYb78mOO+
         OErPqQBO5IPbN/1e3nfkAdKxLRgjpa8RqsKY2K2GwN2mZi7e6JfNMpo36yxriw+Z7obL
         KO/5aI8joGynFdLNB4mVtEkPy5BIQSGvthCSyIldoO0igUjqaObe5mRiArTdetqFo5XK
         cDPQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+cskNespy96rvOVJOZGOXKO44gn4LzB5wxvN9nCESmNKgYTQav22IscUj7Y3dAVqax7xmVxGqeA0OkENaF6CG@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7m7d/WaJNlp4cRydMT0oVkSRTLjWC+/eoT/rZwA9y9fNkrTfi
	szLYw7PAmqiwmw6CGZjA1Qg30D0gzXCsCOqbk+a+vfKzeijx2PumAYCMzQveBorALQa+7lHNGsQ
	M4GL+Osj5U6oE8A9kLv1rSz34FD4=
X-Gm-Gg: ASbGnctEVv/83pw1YW93MSxlbR2S8qcCohgT9tnLVR4unf8+GPYo0hkmUfOeXEetmY8
	IqvFoxJ8p1ai28UYVtUho9teBY0wi1PCKkpYQgbTjrL4AD7HUjvd2reusqo0U0ZB+41agPTXtzk
	mEfDck6pJ7QAnptspbob6kw6kg0FweXHGyY79BSzg0lswhaieVO2Q1aWs=
X-Google-Smtp-Source: AGHT+IED4T6DLDIo3SmEhvYjhrVEJRweu80/CkvzBfXjIoBQfKIpAoBxfGcLmBmU9mYcxJ7671LtEDQ7s45JySuNKLY=
X-Received: by 2002:a05:6e02:5a1:b0:3d4:700f:67e7 with SMTP id
 e9e14a558f8ab-3d4700f6b02mr43315405ab.17.1741810857983; Wed, 12 Mar 2025
 13:20:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250304-msm-gpu-fault-fixes-next-v4-0-be14be37f4c3@gmail.com>
 <20250304-msm-gpu-fault-fixes-next-v4-1-be14be37f4c3@gmail.com>
 <20250311180553.GB5216@willie-the-truck> <CACu1E7GzCiO2b7AFJSDC+pN2VD9VaD2aYz_GGymM3-xAUqd__A@mail.gmail.com>
 <20250312130525.GC6181@willie-the-truck> <CAF6AEGvqYithLFAKpfdkw35DEsUZ8rBt25-oWz3r=kaLt+RbQw@mail.gmail.com>
 <20250312164735.GA6561@willie-the-truck> <CAF6AEGskyoemQDrTXh=ewf61e-hVzWMjmqe=nX2J-65W5-M6Zw@mail.gmail.com>
 <2d47815d-6bee-4d1f-8b60-854763794bf6@arm.com>
In-Reply-To: <2d47815d-6bee-4d1f-8b60-854763794bf6@arm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 12 Mar 2025 13:20:45 -0700
X-Gm-Features: AQ5f1Jr0TpL3RJwurfnQxJV3DndqXaN2cYc9nQyOJQLHZCc7asLNsX0jHJOoZ20
Message-ID: <CAF6AEGvhixYvXghvD+itnSDjr7bO4i3Ls0Y-kXC-ohFN=CS0PQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] iommu/arm-smmu: Save additional information on
 context fault
To: Robin Murphy <robin.murphy@arm.com>
Cc: Will Deacon <will@kernel.org>, Connor Abbott <cwabbott0@gmail.com>, Joerg Roedel <joro@8bytes.org>, 
	Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, iommu@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_132059_202946_6F388541 
X-CRM114-Status: GOOD (  33.20  )
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

On Wed, Mar 12, 2025 at 11:01=E2=80=AFAM Robin Murphy <robin.murphy@arm.com=
> wrote:
>
> On 12/03/2025 5:23 pm, Rob Clark wrote:
> > On Wed, Mar 12, 2025 at 9:47=E2=80=AFAM Will Deacon <will@kernel.org> w=
rote:
> >>
> >> On Wed, Mar 12, 2025 at 07:59:52AM -0700, Rob Clark wrote:
> >>> On Wed, Mar 12, 2025 at 6:05=E2=80=AFAM Will Deacon <will@kernel.org>=
 wrote:
> >>>> On Tue, Mar 11, 2025 at 06:36:38PM -0400, Connor Abbott wrote:
> >>>>> On Tue, Mar 11, 2025 at 2:06=E2=80=AFPM Will Deacon <will@kernel.or=
g> wrote:
> >>>>>> On Tue, Mar 04, 2025 at 11:56:47AM -0500, Connor Abbott wrote:
> >>>>>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iomm=
u/arm/arm-smmu/arm-smmu.c
> >>>>>>> index ade4684c14c9b2724a71e2457288dbfaf7562c83..a9213e0f1579d1e3b=
e0bfba75eea1d5de23117de 100644
> >>>>>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> >>>>>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> >>>>>>> @@ -409,9 +409,12 @@ void arm_smmu_read_context_fault_info(struct=
 arm_smmu_device *smmu, int idx,
> >>>>>>>                                      struct arm_smmu_context_faul=
t_info *cfi)
> >>>>>>>   {
> >>>>>>>        cfi->iova =3D arm_smmu_cb_readq(smmu, idx, ARM_SMMU_CB_FAR=
);
> >>>>>>> +     cfi->ttbr0 =3D arm_smmu_cb_readq(smmu, idx, ARM_SMMU_CB_TTB=
R0);
> >>>>>>>        cfi->fsr =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSR);
> >>>>>>> -     cfi->fsynr =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYN=
R0);
> >>>>>>> +     cfi->fsynr0 =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSY=
NR0);
> >>>>>>> +     cfi->fsynr1 =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSY=
NR1);
> >>>>>>
> >>>>>> We already have an implementation hook (->get_fault_info()) which =
the
> >>>>>> qcom SMMU driver can override with qcom_adreno_smmu_get_fault_info=
().
> >>>>>> That thing dumps these registers already so if we're moving that i=
nto
> >>>>>> the core SMMU driver, let's get rid of the hook and move everybody=
 over
> >>>>>> rather than having it done in both places.
> >>>>>
> >>>>> As you probably saw, the next commit moves over
> >>>>> qcom_adreno_smmu_get_fault_info() to use this. The current back doo=
r
> >>>>> used by drm/msm to access these functions is specific to adreno_smm=
u
> >>>>> and there isn't an equivalent interface to allow it to call a gener=
ic
> >>>>> SMMU function so it isn't possible to move it entirely to the core.=
 At
> >>>>> least not without a bigger refactoring that isn't justified for thi=
s
> >>>>> series that is just trying to fix things.
> >>>>
> >>>> Ok :(
> >>>>
> >>>>>>>        cfi->cbfrsynra =3D arm_smmu_gr1_read(smmu, ARM_SMMU_GR1_CB=
FRSYNRA(idx));
> >>>>>>> +     cfi->contextidr =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB=
_CONTEXTIDR);
> >>>>>>
> >>>>>> I think the CONTEXTIDR register is stage-1 only, so we shouldn't d=
ump
> >>>>>> it for stage-2 domains.
> >>>>>>
> >>>>> Does it matter if we read the register though, as long as users are
> >>>>> aware of this and don't use its value for anything?
> >>>>
> >>>> I think the contents are "UNKNOWN", so it could be hugely confusing =
even
> >>>> if they just got logged someplace. Why is it difficult to avoid touc=
hing
> >>>> it for stage-2?
> >>>>
> >>> Fwiw, we are only ever using stage-1
> >>
> >> Sure, but this is in arm-smmu.c which is used by other people and supp=
orts
> >> both stages.
> >
> > Sure, but no one else is using this field in the fault-info.  So maybe
> > the addition of a comment in the struct would be enough if it isn't
> > going to cause an SError/etc to read it for S2 cb?
>
> Any worthwhile comment isn't going to be significantly shorter or
> clearer than 1 extra line of "if (smmu_domain->stage =3D=3D
> ARM_SMMU_DOMAIN_S1)"...

Just that smmu_domain isn't passed to
arm_smmu_read_context_fault_info(), so it would add some extra churn
on top of that one extra line

> TBH it's the Qualcomm register-middle-man firmware I'd be more worried
> about than real hardware, given how touchy it can be even with register
> accesses which *should* be well defined. But then I guess it also has
> the habit of killing the system if anything other than the GPU dares
> cause a fault in the first place, so maybe it OK?

If we have qc hyp, then we don't get S2 in the first place ;-)

BR,
-R

> If anyone still uses Arm Fast Models SMMUv1/2 components it'll probably
> squawk an annoying warning there too - ISTR I had at least one patch
> motivated by that in the past.
>
> Thanks,
> Robin.

