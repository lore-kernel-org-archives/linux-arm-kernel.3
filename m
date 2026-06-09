Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8BBECD8CB2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 04:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7I5kMFjUfQLKS3kOHOooOjgfOrWOEd0p39OkS4SVB1k=; b=Kw0r1NNfSSFH3HkHtDQAfAaJde
	WqX0VdoFV5xKq1nDbTkcwpzFLt45zcaNRteEUjd0aWDdB14x7+BJ+NmNtUCwdSVIoEJRFyqhEWy/K
	MTswZYEDXOeda1Am6YHxeYMPtCnj96PfRbsDLK9aPLDGAGRAlvB3BgcEBurvA4F5Tg+FFaD7sLisz
	hfWWOXrajGnCay0V/htXQ/fUk0fFFKrcbRtiktMaQBcSgKAk0UWgP/kWk7hEFaXmVhHreKF+/Nk9m
	HSgGsFw7luWKPsud3gv7PKwME9fIq2yOZyTGjwCueuSTa02XOT5E3PSBXX0y8yqz4TTiOO9rBlb4t
	8QTMbH2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWnxU-00000004iTS-0VY8;
	Tue, 09 Jun 2026 04:21:00 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWnxR-00000004iT1-3JZd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 04:20:59 +0000
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-51765531803so2423811cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 21:20:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780978855; cv=none;
        d=google.com; s=arc-20240605;
        b=OZUa17FCQT0z+bFb86drWm+16p1RIeLT0E3MGZAw5NOq4cYf+x/PlSNXDW/GepMTE7
         l6+qyvcTWhXICY87gT/OtP07gP6hBPP6x4QCwtQEXQx24wphrJ2mgGVLxct1Cl7bRHQa
         oHuvQpkGlTYXkdrSgvrzU/oyWQOtBYRatfgHd6X84IGm0BKOsGDfefbk3w+9a0C2ZLGu
         96KQn9QtT2T6flCptgsNiy7QlnGJ6lJ4L4iBF+Q6WsD63rY2/p+IQxeuVLnChvS2ocne
         ONEbO30xQSNRuXgxcMIsTgGd5HPy1SSCC58dKsxud0uyiML4qUZjMH+QjK/DucH90ssu
         7Wvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7I5kMFjUfQLKS3kOHOooOjgfOrWOEd0p39OkS4SVB1k=;
        fh=kwIszNg5m5W+iCXoRy0mOpAE52qI4+5tp/ijBVCfLWU=;
        b=QjFWX/TSHnRJqm0yESesgKnilawNGw65PqFmiHTkNhRCk0OBKGFQBRJxUQslDaaOl4
         +MRrkRNR9qEyehFFBN+9Uc0fxspu4/fAeVHefpY9Bco8eukRcIUXYNvOQwTbH8bMDA7D
         aS/8fu+sxCOc04oYbpmLyz61gaeWlrx8DpoueDwNm/8t7a854KrFRiXrQb06VziqQxwn
         O7a16EHcvM4gbZ5zhAMFBMSnY/A3nnmaWrgPNuSNZ9k7+FySNFfONQpM7nydxlQwic2q
         chr10yyIWwRmYvVUIOa0CHTwNPchYP64099UMd2x10gORB1YHugtPdHX028qr578R3/x
         Tq+A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780978855; x=1781583655; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7I5kMFjUfQLKS3kOHOooOjgfOrWOEd0p39OkS4SVB1k=;
        b=KRBLCYKdJxdSYoNIf1nBC30F0Bxc01xS8v1P0kLXffooRrMvuwETo/hUM9yhx9tIaR
         h0RBTja9X4o7mAjCaF/hwP2rdL/lswgRR/9WDXaxDbImFPq5FQBY6eHKRllUKjjUvXJU
         bQw6TEVvyhlGGd+Ix54/JFE7R2b2PBZd+fnNV6L61qwQ3FqH4ZhNH7JYAgrMQQsvRywI
         j52fpBFnQLbXlPZhQEdqm7xL5+sMa3yXWFENuxdLCGOddV2mon8sLphblBFoai/Fsnh9
         vWiCobHrbm7W2z/7uYDSHJ4mmoGC0c5bKdvNSW7AUHB7Uz1WqvtvRcOQHIqBrZaYYSKG
         1jmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780978855; x=1781583655;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7I5kMFjUfQLKS3kOHOooOjgfOrWOEd0p39OkS4SVB1k=;
        b=JL/mMdbc0gkltX7/MgRsAyD2NaylZ1JZq5HD8zNON+PgJArLp0GDH0d/E+zYKtK4Kb
         Ss52k8uGPE4X3f1zyijr3+TEv3MQCnPkK7fkrWNAzmZvu/YgFv9/8euNH2iiklhSJLmb
         5L8XkUziQtOctKimSC8oY7a39lkNv1/VivELo/lKZsl86FDklzv7LQ9880fp8ay8YwZ1
         9hhis/ppDcCw2nb12TU3UZdvhVIPQmUDG7yIDp4SzzaPtned1ho0vSAMmvO/1p+0xa9K
         CTQyNylh9EoSBjFHpEtAOifp/aoDFN7fAYWIWxLy95AUmwZIIbDy8/M2FycLKjKCy5he
         0eUw==
X-Forwarded-Encrypted: i=1; AFNElJ8RCpoB3DjY9SOrx8Xs5fc/0t8QTHyxjBXlDwz6MB3kvCvMsZf9tw2q27LOSTB6mJIQhlC5+h/ZEitzNAs1fhv9@lists.infradead.org
X-Gm-Message-State: AOJu0Yy16+qvbOZcvR/iqBIfqdMjxbnYOUks/D8FUO5bSQ3dNWkYkYrd
	222deVmZq/WhyAQHQusJmg9tltJeQfl6wvs+0dxtbCod9SiJinWmsX38Tsnnu3ixMVNktv26NzA
	4y7voz+5oxq2GT+C4cVnSC02mvjlx91ohNOI5KMt1
X-Gm-Gg: Acq92OEvVnIgGrROK6kgNIAkWIBJaoeLRNUwlYoEGMt628KFpswK+9LPJyLHqhf1AK1
	2N92joK35RMA6ig5xFGDNLecZHGxKqr+50ChFOq3VvpODXLrNeaC9aWE+4BRAZL8VMLag2gC8f7
	1/PcY6J2dsoOMhKtLjupsSd1QNZooqDwFfpvFn7r6QrC4nzTdRSIzoN/deL4eJ46syDt9jyYE3U
	6dDDpMYR/zjLS61gJB7Ef1OyAa2npc0xU0pBw//R5gHdmb8Z04HeFjdUOIfEifOt3JRMwkNSa9t
	t4PwdLVR9Vc/e75SKf8+7fNJdA==
X-Received: by 2002:a05:622a:2cb:b0:517:5ac7:332e with SMTP id
 d75a77b69052e-51798069433mr36450171cf.6.1780978854584; Mon, 08 Jun 2026
 21:20:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260601215909.3958732-1-praan@google.com> <20260601215909.3958732-8-praan@google.com>
 <CAE2F3rDF5dVJip2gc+vaxtM-FRttnUEnAetUYz6qDCXRM=fNYg@mail.gmail.com> <aiZe97OkmvcUwCzS@google.com>
In-Reply-To: <aiZe97OkmvcUwCzS@google.com>
From: Daniel Mentz <danielmentz@google.com>
Date: Mon, 8 Jun 2026 21:20:42 -0700
X-Gm-Features: AVVi8CdrHIiMqoDE8c7fuS7HvynOrR6RKi0d9Z9EqIwtonGtr0ODV-o_ZMQl_cU
Message-ID: <CAE2F3rDZupDgq5tQrvpuixGi-kVs+oi-Tacqa=Rxtri03LBPHQ@mail.gmail.com>
Subject: Re: [PATCH v8 07/12] iommu/arm-smmu-v3: Add CMDQ_PROD_STOP_FLAG to
 gate CMDQ submissions
To: Pranjal Shrivastava <praan@google.com>
Cc: iommu@lists.linux.dev, Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, Ashish Mhetre <amhetre@nvidia.com>, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_212057_885323_73030420 
X-CRM114-Status: GOOD (  44.70  )
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

On Sun, Jun 7, 2026 at 11:19=E2=80=AFPM Pranjal Shrivastava <praan@google.c=
om> wrote:
> > >
> > >  static void queue_poll_init(struct arm_smmu_device *smmu,
> > > @@ -718,8 +719,25 @@ int arm_smmu_cmdq_issue_cmdlist(struct arm_smmu_=
device *smmu,
> > >         do {
> > >                 u64 old;
> > >
> > > +               /*
> > > +                * If the SMMU is suspended/suspending, any new CMDs =
are elided.
> > > +                * This loop is the Point of Commitment. If we haven'=
t cmpxchg'd
> > > +                * our new indices yet, we can safely bail. Once the =
indices are
> > > +                * committed, we MUST write valid commands to those s=
lots to
> > > +                * avoid indefinite polling in the drain function.
> > > +                */
> > > +               if (Q_STOP(llq.prod)) {
> > > +                       local_irq_restore(flags);
> > > +                       return 0;
> >
> > On second thought, I no longer believe that this is safe. I understand
> > that READ_ONCE(cmdq->q.llq.val) implies no ordering guarantees with
> > respect to any writes to translation tables. In the non-stopped case,
> > we can rely on the call to dma_wmb() further down in this function.
> > However, for the stopped case, I can't identify any barriers that
> > would ensure that the STOP flag is checked only after the writes are
> > visible to SMMU. Here is an example: Let's assume the following
> > program order:
> >
> >  * Write to invalidate PTE
> >  * Read from cmdq->q.llq.val, determine STOP flag is set, elide TLBI
> >
> > What prevents the CPU from reordering these operations as follows?
> >
> >  * Read from cmdq->q.llq.val, determine STOP flag is set, elide TLBI
> >  * Write to invalidate PTE

Now, I believe that the smp_mb() call in arm_smmu_domain_inv_range()
actually prevents this (if we remove arm_smmu_cmdq_can_elide or move
it to after the smp_mb() call)

> >
> > Can the following situation occur?
>
> Not really because:
>
> >
> >  * Read from cmdq->q.llq.val, determine STOP flag is set, elide TLBI
> >  * (Different CPU resumes SMMU)
>
> We do a full smp_mb() here to ensure all writes are seen before SMMUEN=3D=
1
> (note that the STOP_FLAG is already unset at that point, so we stop
> eliding commands much before the SMMU is physically able to access any
> config/xlation structures, I've explained everything below).
>
> >  * SMMU loads old PTE value into TLB
> >  * Write to invalidate PTE
> >  * (stale PTE remains in TLB)
> >
> > I propose the following: If you find the STOP flag set, run dma_mb()
> > and check again. I'm afraid that running dma_mb() unconditionally
> > might incur too much of a performance penalty.
>
> IMHO, I think this might be overcomplicating things here..
> Here's why the current version works according to me:
>
> Till SMMUEN=3D0, the SMMU is spec-guaranteed to never access translation
> or configuration structures (Section 6.3.9.6).
>
> Our runtime_suspend callback sets SMMUEN=3D0 before setting the STOP_FLAG=
.

Does "before" refer to program order or the order in which other
agents can observe the STOP_FLAG relative to when SMMUEN=3D0 is set?
Your program might read "Set SMMUEN=3D0 then set STOP_FLAG". However, my
question is whether other observers might see the STOP_FLAG before
SMMUEN is cleared. I couldn't identify any barriers in
arm_smmu_runtime_suspend() that would prevent this type of
re-ordering.

> Even if the worker CPU reorders the PTE write after the STOP_FLAG check,
> it is benign because the SMMU is incapable of fetching that (or any) PTE
> while the gate is closed. Because GATE_CLOSED =3D=3D SMMUEN =3D 0, implyi=
ng no
> access to any HW structures whatsoever.
>
> The real synchronization happens in the Resume Path:
>
> 1. arm_smmu_device_reset() clears all caches / TLBs.
>    (None of these can have entries before SMMUEN=3D1)
>
> 2. We execute a full smp_mb() before setting SMMUEN=3D1. (that's why we
>    need smp_mb before SMMUEN=3D1). This barrier ensures that any PTE
>    writes made by any thread=E2=80=94including those that were elided whi=
le the
>    gate was closed, are globally visible before the SMMU hardware starts
>    fetching into TLBs again. (This is why Jason suggested this in v6 [1])

A barrier on one CPU has no bearing on whether writes by any other CPU
can be observed by any particular agent in the system.

Let's compare this with the long comment in
arm_smmu_domain_inv_range() which is what I believe Jason was
referring to. In that example, you see smp_mb() in the code path on
CPU0 and dma_wmb() in the code path on CPU1. Hence, barriers exist on
both sides. If you compare the runtime PM design with
arm_smmu_domain_inv_range(), then smp_mb() belongs in the CPU thread
that performs the translation table updates not the one that performs
the suspend/resume operation.

Actually, now that I think of it: We could just piggy pack on the
existing smp_mb() in arm_smmu_domain_inv_range(). For your
arm_smmu_cmdq_can_elide() to work correctly, though, you would need to
move it to *after* the smp_mb() call. This being said, I would prefer
to remove arm_smmu_cmdq_can_elide() as I wrote on the other thread.
If we do take advantage of the existing smp_mb() in
arm_smmu_domain_inv_range(), then we should probably update that
comment to state that the runtime PM implementation now also depends
on it.

>
> Adding a dma_mb() to the elision path would be redundant given the
> SMMU can't access any structures and the resume barrier. We'd be
> needlessly injecting dma_mbs when no entity is actually accessing those
> structures while the STOP_FLAG is set.
> >
> > I have the same concerns with arm_smmu_cmdq_can_elide(): That
> > READ_ONCE in arm_smmu_cmdq_can_elide() provides no guarantees in
> > regards to ordering relative to PTE writes.
> >
>
> The same as above, No structures are accessed during SMMUEN=3D0 (spec) an=
d
> during resume before setting SMMUEN=3D1, we do a full smp_mb() to ensure
> all concurrent PTE writes are acquired in our resume thread before we
> enable SMMUEN=3D1

I think the definition of "all concurrent PTE writes" is a bit vague.
I don't think the architecture allows you to wait for writes performed
by other CPUs to be observable by all other agents. The only thing you
can do is to ensure that other agents can observe that the STOP_FLAG
has been cleared *before* SMMUEN is set. However, this is already
achieved by the existing dma_wmb() in arm_smmu_cmdq_issue_cmdlist().
Hence, the extra smp_mb() is not required.

>
> Thanks,
> Praan
>
> [1] https://lore.kernel.org/all/20260424151639.GE3611611@ziepe.ca/

