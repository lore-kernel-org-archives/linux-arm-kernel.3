Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50FC0CD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 17:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XyBpgIHJYC6qNDN+qiLyuZatTXuIQOHHRiSfq6TIKQ0=; b=plKM/VtWG1SfWH+qjQ3jolYzTk
	UK5F8ELL3fJMSVCZTOsZ3QoxiR9dqrhJkkX4EFTFgLlEBB37bbg9ze/opEA0uuCn3eD4KE/LfVwqG
	M5PsIc2p8/glEkGa7Blc1ymjcg9wngNak/L9yfNtSOwz0w4/6wPJ4y5FJKOMwrarecTA3Tlzqzr+O
	SPp/nKuukrylwJnZHcF/A8iSJP/GZ3+cPfLPzzddVtcdXvKULSHeHghaq65ntyVE8R68ppsHyGg08
	O1hLmvItkAau9BD07pJ8yeWParyak0Ud6Y2NZmv6T9mDkHV7j+CHrfjQkig9xfBjWcNsRaEUjSIPA
	mZg0uw6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXMsN-00000008CDS-24bh;
	Wed, 10 Jun 2026 17:38:03 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXMsJ-00000008CD5-44re
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 17:38:01 +0000
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-51765531803so45141cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 10:37:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781113079; cv=none;
        d=google.com; s=arc-20240605;
        b=LHeN/hhturf0DjkpwWd2ktlgvFDVjaYslbmL63S2xUx9AFa8ff9vHT85T1iI/eB5eI
         wP4lzALfsDF+Cy8xDhlAf5zWugjGs01QJXnDX6xNAgaXbctZh9X77/0+0/j9V8q+FYGh
         vFplsHFNuzD8fvgi8G26kQI4Z2FihzI58Ho4wH0bWzIoS/zaD01t+IspxCDow8IGWYb9
         p+q6RCer6uFe3uaDSZ9nLqVgjvSunbhxZHyHPLWyoWebl88uQ5WTN7vTd6id/wihglG0
         RdBQT2Tz6SR4hNLdO8NPG5UGPXSniytBBM5BQxjSukPVb/ttCTeBd9/Gt1bQGu0D53Jl
         JbZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XyBpgIHJYC6qNDN+qiLyuZatTXuIQOHHRiSfq6TIKQ0=;
        fh=QScFnuL6e1lgkEJBhFPAeBUbiwXO5HrHOeenwut5kjA=;
        b=DYEuDh8KieqFDfdK1KIxVeVBKGdvKtW6CRkJMS6JIJcHwAmnyAD934ZhlHO0cakgH/
         p7KDcARCF2go0CnMiM/sHoHVOVZ0ZvGJMCMsVMUol7/PWxIg1efMLSV77GawGbiQo02Q
         AmWUjVbcjk0hHv6MEr6ICX0GjiZIBECfeUPKvoV3YbHYTUOSmsJK4K4/6lnSSn/OzULf
         djcRSllVR3TQXHIwwWQParPvbyP+177aFcQ286vc+wzrz/vuwZDC0qL4f46RICXqjXEI
         AX5ZVNolgfC1Uh+HB/qnFxnCYungwxq/pt9kJ26j8LBgK5F8Ptveq3kapWveXZ9f4o33
         N9VQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781113079; x=1781717879; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XyBpgIHJYC6qNDN+qiLyuZatTXuIQOHHRiSfq6TIKQ0=;
        b=bCc/Sf9nlYcZ1N5d+B7AnhiPZ8LjJxrrZumyq/1unaWJK4MYa3gSKygxqOAhBRwIVP
         snZaKrp4kLvrOtEUMzLHdVNO9ONQy0DWwNdWxxht4PZuqUbg9qSwv3ZQXUwelo4Ur5Kl
         sIzyHR7GVe1WfkIOj+A+rZgbZfABZoZhhSPDOwqw2xA7lYbqmep1/cRhu8yBY2vhlQDk
         tI8SsDV8SMu4i4YUHgnuk1oMngzY5b4GhM8hgMB+9VA/j277VN58tNOc3o5x/+MAr8tt
         WibD4k96XJjwO/tjCxinc9t3b0CNuM6Am/MIppgBROiBWF1pQPfzUkINY+rlRebeaFQg
         hV0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781113079; x=1781717879;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XyBpgIHJYC6qNDN+qiLyuZatTXuIQOHHRiSfq6TIKQ0=;
        b=QNrs2cN4u1HneX/QFm+JONzhjO7Rzn233on2VezrBIifi+wSh33rxd9c1E49KZoXhR
         VlPeyNKRHiLU5hPdy3w961RTWlqIE2YSyvqX8e3lf4XeHoVOD0u6lNU07DeNIdqBn7Kg
         kpV9n8V0ZCPLcRB0V8gu8tKBDSNFA0y9/E/+QDD4Vj5OWqRYVRxZHYNZ0UZgl8+LPZCz
         hzrM8GYwuED2vhm7j42nFEdUztUgL6evX/Bhvs6b5t+xCInZIlyibXOeslwaK63tk0Io
         KeWPg7yo0I8rIVRlqBA4e9V3BUTAQ52pPm50eBpDxYOwInZXGlrjlrB/1FWMdERgdahP
         TcBw==
X-Forwarded-Encrypted: i=1; AFNElJ9Bkuu7nt/m/Ezk+aZnVFgrQPp5QsDunIJHn3zuPnaKHkHR/6rdclFd2yE+s+iE8HESB9GzcuX0kKZ3hZUaTwcO@lists.infradead.org
X-Gm-Message-State: AOJu0YxNBc6M8ABgDSYFtBN6h73gjLsoBPe+I6n1hBzPRMno0qZoIls6
	RD2xRlDohgopw9ilLHEALTWdoWJmHI6NFXqLLxboNESkeOv6ixF9pgnx8ohVY6KhXb564RxtD1/
	+8hlfV3brjGc4Nvn4COFsOvNQViPFjSoxQldeC2dT
X-Gm-Gg: Acq92OGQqL2jqUyQeA5KMLWrzCefAGHKocauxqqkj5Dn0Iog5SjOuwRnZPsWO9101NZ
	XGOnZ48QOpsG5MKEvd0MTyl1bp4rhphsWkS/0xv4kcE1sawGdwfXF3HNWzTcYiluRtzJl4F15yG
	JuzsutRIm/la+n9GW/tB7ThwIHdqhietrMO8GVw8jfgYW3SwMBBNEFRrIZOSH5huj22FOu86lc2
	bHzKsGLaqytOZ5m32cYZyOxO0WLTMh1ZBzAkPIifkYGEQAao6kVZLvZDQL9bFl1NVoq+rwi4uwU
	p/obHAsgXtlR3as=
X-Received: by 2002:ac8:5a42:0:b0:517:6dc0:698d with SMTP id
 d75a77b69052e-517e94e8f60mr1704361cf.0.1781113077976; Wed, 10 Jun 2026
 10:37:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260601215909.3958732-1-praan@google.com> <20260601215909.3958732-8-praan@google.com>
 <CAE2F3rDF5dVJip2gc+vaxtM-FRttnUEnAetUYz6qDCXRM=fNYg@mail.gmail.com>
 <aiZe97OkmvcUwCzS@google.com> <CAE2F3rDZupDgq5tQrvpuixGi-kVs+oi-Tacqa=Rxtri03LBPHQ@mail.gmail.com>
 <aiflaI4svEJvZbsC@google.com> <CAE2F3rDgXxAhJFUX6=xars9H92t8NBDqcFRxU7d5wJQ7buUbNA@mail.gmail.com>
 <aihiPQ2mdqMm13Cd@google.com>
In-Reply-To: <aihiPQ2mdqMm13Cd@google.com>
From: Daniel Mentz <danielmentz@google.com>
Date: Wed, 10 Jun 2026 10:37:46 -0700
X-Gm-Features: AVVi8CcAGj-U1U1VJtTLOSHtsGjVCqeBFBsJkoKPWbr0SCZSqb6AOoPaOEeCfko
Message-ID: <CAE2F3rCdzBwcLtVWPLnx-==QodXWJv_OYi9meRp9M=+8PPqrDA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260610_103800_046660_7BDDE12B 
X-CRM114-Status: GOOD (  49.84  )
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

On Tue, Jun 9, 2026 at 11:58=E2=80=AFAM Pranjal Shrivastava <praan@google.c=
om> wrote:
>
> On Tue, Jun 09, 2026 at 11:20:52AM -0700, Daniel Mentz wrote:
> > On Tue, Jun 9, 2026 at 3:05=E2=80=AFAM Pranjal Shrivastava <praan@googl=
e.com> wrote:
> > > >
> > > > > Even if the worker CPU reorders the PTE write after the STOP_FLAG=
 check,
> > > > > it is benign because the SMMU is incapable of fetching that (or a=
ny) PTE
> > > > > while the gate is closed. Because GATE_CLOSED =3D=3D SMMUEN =3D 0=
, implying no
> > > > > access to any HW structures whatsoever.
> > > > >
> > > > > The real synchronization happens in the Resume Path:
> > > > >
> > > > > 1. arm_smmu_device_reset() clears all caches / TLBs.
> > > > >    (None of these can have entries before SMMUEN=3D1)
> > > > >
> > > > > 2. We execute a full smp_mb() before setting SMMUEN=3D1. (that's =
why we
> > > > >    need smp_mb before SMMUEN=3D1). This barrier ensures that any =
PTE
> > > > >    writes made by any thread=E2=80=94including those that were el=
ided while the
> > > > >    gate was closed, are globally visible before the SMMU hardware=
 starts
> > > > >    fetching into TLBs again. (This is why Jason suggested this in=
 v6 [1])
> > > >
> > > > A barrier on one CPU has no bearing on whether writes by any other =
CPU
> > > > can be observed by any particular agent in the system.
> > > >
> > > > Let's compare this with the long comment in
> > > > arm_smmu_domain_inv_range() which is what I believe Jason was
> > > > referring to. In that example, you see smp_mb() in the code path on
> > > > CPU0 and dma_wmb() in the code path on CPU1. Hence, barriers exist =
on
> > > > both sides. If you compare the runtime PM design with
> > > > arm_smmu_domain_inv_range(), then smp_mb() belongs in the CPU threa=
d
> > > > that performs the translation table updates not the one that perfor=
ms
> > > > the suspend/resume operation.
> > > >
> > >
> > > I might be missing something here, so please bear with me. My
> > > understanding it that's needed because the IOMMU is live & actively
> > > caching, which is not true for our case.
> >
> > I think the "invs" design (Per-domain invalidation array) is more
> > similar than you think! An SMMU being absent from invs is equivalent
> > to the STOP flag, and the STE pointing to TTB0 is roughly the
> > equivalent of SMMEN=3D1 i.e. the IOMMU is not actively caching a
> > particular translation domain until an STE (or CD) points to it.
> >
> > > [Assuming we use non-relaxed semantics & ordering for the STOP flag,
> > > i.e. set STOP_FLAG + barrier & clear STOP_FLAG (implicit dma_wmb())]
> > >
> > > In our case, during the resume op, we first clear the STOP_FLAG befor=
e
> > > setting SMMUEN=3D1 in program order. Thus, any PTE invalidations occu=
rring
> > > before SMMUEN=3D1 are executed, i.e. EVEN when the SMMU is guaranteed=
 not
> > > to access any structures, we've resumed invalidations.
> >
> > "[...] we first clear the STOP_FLAG before setting SMMUEN=3D1 in progra=
m
> > order." I think this should be modified to "we first clear the
> > STOP_FLAG and ensure that the cleared STOP_FLAG is observable by all
> > other CPUs before setting SMMUEN=3D1"
> >
>
> Ack. The goal was to explain the algorithm for this thread, I won't be
> commenting it in code. Are you suggesting I should convert my
> explaination of the algorithm above into in-line comments and make sure
> to include the STOP_FLAG observability part?

I believe there would be a benefit to having a comment in the code
that states the requirements for the STOP_FLAG observability.
Something along the lines of either of the following:

* SMMU must be disabled any time another CPU can observe the STOP_FLAG
* Other CPUs must (a) observe the STOP flag only after the SMMU is
disabled, and (b) observe the cleared STOP flag before the SMMU is
re-enabled.

> >
> > I would define a set of invariants:
> >
> >  * If an agent observes the STOP flag, it is guaranteed that SMMUEN=3D0
> > (with ABORT set) at the time of observation.
> >  * Any transition from a set STOP flag to SMMUEN=3D1 involves an
> > invalidate-all operation prior to setting SMMUEN=3D1
> >
> > Hence, if a CPU observes the STOP flag, it is assured that (a)
> > transactions are blocked and (b) if the SMMU is ever re-enabled, an
> > invalidate-all is performed prior to it being enabled.
> >
> > I would then argue that all operations support these invariants. For
> > example, we need proper barriers in the iommu_unmap path to ensure
> > that the STOP flag is only checked *after* the translation table
> > update is made. Hence, we need a memory barrier.
> >
> > I look at it this way: Every elided invalidation creates an
> > "invalidation deficit", and this deficit is tolerable for two reasons:
> > (a) SMMU blocks all transactions while there is a deficit. (b) An
> > invalidate-all eliminates any deficit accrued while the STOP flag was
> > set.
>
> Ack, which means you agree with the design proposed in my last reply.
> I'll document these invariants in line if that's what you're suggesting
> here?

Yes, I believe we are in agreement, and yes, I think documenting these
invariants would be beneficial.

[...]
> >
> >
> > >                       HW structures not accessed means no TLB / CFG
> > >                       cache accesses as well according to the spec.
> > >
> > > [CPU1] =3D=3D> PTE update =3D> Invalidate =3D> Succeeds (although SMM=
UEN =3D 0)
> > >
> > > [CPU0] GBPA.Abort set =3D=3D> Txns are blocked
> > >
> > > [CPU2] =3D> PTE update =3D> Invalidate =3D> Succeeds [Txns blocked + =
SMMUEN=3D0]
> > >
> > > [CPU0] =3D=3D> SET STOP_FLAG =3D=3D> Elision begins
> > >
> > > [CPU3] =3D=3D> PTE update =3D=3D> Invalidation =3D=3D> Elided [Txns b=
locked + SMMUEN=3D0]
> > >
> > > Hence, the races in the suspend sequence are handled correctly.
> >
> > I'm not sure if this description demonstrates that every possible race
> > is handled correctly. If I compare this with Nicolin's presentation in
> > arm_smmu_domain_inv_range, I like that presentation, as it explicitly
> > mentions loads and barriers. For example, it has an smp_mb() followed
> > by "// load the updated invs". I think you should make have something
> > like "smp_mb() ; CHECK STOP_FLAG" in your presentation. Currently, the
> > STOP_FLAG checking is somehow implicit in "Invalidation".
>
> Ack. The goal of this diagram was to explain the working of the design,
> this is NOT the comment/document I plan to include in code.
>
> I'll add this as an in-line comment if that's what you're suggesting? OR
> are you also suggesting I should have this in my cover letter?

In arm_smmu_domain_inv_range(), there's Nicolin's sequence diagram
that describes how installing a new domain is synchronized with PTE
updates and subsequent TLBIs. I would recommend adding a similar
diagram that shows how suspend and resume are synchronized with PTE
updates and TLBIs.

Thanks
 Daniel

