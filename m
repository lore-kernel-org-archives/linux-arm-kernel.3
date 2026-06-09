Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A022CD8CAD
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 18:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RxRV+giO3XkJijo1vRcVAE46LXSC1XwSsC6Fxr10BXY=; b=hY8UM7scEk53bcYNQoZoS+/XZR
	Zkh7mTylMp/JCcDrWG8bTLSlTtU3PS5FLZ9k0oRjMH4XgRhis729XaUxeL4J1on4PbkKm+WYRRxcb
	eNPAUVkzjAAxQzdbBfUhpUu9mtRvTP3KUMj9U4jM5jz121Of9n4/qQRSxBKFXaL2UbOKdVECeeP4S
	o5U/o2c8LorA94HGyF72VqJuG2buttXmeS7Bj9Yg/MCZ78H2QbwxHLvGfGTJjRjJYetGK0eKYsIMe
	v2umOLhR/4SiytBcKgcCyOdFDbZzks8l6IrxtbNvJx79eXs20rAE5GndCDWYBTscdx3u13dv7l5yD
	t78k0R5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX14a-00000006BiS-0OZ6;
	Tue, 09 Jun 2026 18:21:12 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX14W-00000006Bho-2jEy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 18:21:10 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-68ced08613aso47621a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 11:21:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781029267; cv=none;
        d=google.com; s=arc-20240605;
        b=SROsTRDoklw0qvD4ikk2FaBFhdhi9cZD3RV2VyVwm8BkurzIO2/gp+kq+S/YmvOCUA
         D8OOe3k3CO2Nczhi2n/wlJEqJouXhrXV3AQqpccum7GuCeaoNM4bhEpZI7t7PXBcMhBf
         SNKKKbXoTkvHl3aMxA58TE4E0Cwn1/Yhj5koS9HCuPRdM1QJbX7LlTLOfyVfXFeMO5qx
         mbmqjd1UPl0GPibO3a2QbF9uXhG7ymK+gOz9Eg5vPq3Zz9PXIvxcK687KGH8MQDpEXY6
         rxp8j1gAROJkl9yg5PyKUIBBrvJv+FJYmARHn2WuLBzxQCdhZAQBKQOIVPbCIWYdw6q4
         4UAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RxRV+giO3XkJijo1vRcVAE46LXSC1XwSsC6Fxr10BXY=;
        fh=dhwYiYqaXnDlcYtmPSpOQ1w8tPFudJ/rzzXVZ8zoKyo=;
        b=gY2tjYkqsx4aO37/+FDy8z5rjLbCiRY2iMuMN11ECc+uRhzLNAHrePkHOkXmCInv0/
         /kM/2jk8yaDdnFncYcGPYpb1WE/Rzb6+A9wV1HPIWs8Qd9roUj/lMWSdxKSr8eGFOVsu
         A+kKsze/+16DqrQcom7fPsQFD3l7PG+ACuHhvskk7tngpYWRM0sQxTSfys7d4kSfAHWr
         5VBvhl2tdpcia4igtJXX+GUsyK9/aN2rQGBEyai+sV2LaZE/Rxtm+y4F2FM63RphNB3f
         47KbpcIY7abBdIOXGMJZXp4zjmAyfzeiffbFp3ndS+dDDH1AN1Iq8iUM/hVJOWWuEfkv
         HvmA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781029267; x=1781634067; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RxRV+giO3XkJijo1vRcVAE46LXSC1XwSsC6Fxr10BXY=;
        b=k49c0Lsos0d0QVQK6hRIzT+GnjHuLVgR7/vdPS0ZQs3WwFQaas9G2st5eMnIdHZga+
         JrANUUpwKfNPkASoYiDD1SNPxH+N/lZn8z2GfGi/LIUmKndY3G/gkozNGIPHjvt20ehZ
         GxdbmEc7t4gV8ZdeOUVeh7sPT9vLvzqgjYT6HRhHjK9hXKlmVC70YW+WS5gLVS/0EGDC
         TXkfDKyTSYX3TrVul3Inxe1Ol2AZO8LX33Ggd+Z3g7R90dOVSpuiEY1vsfew5wdSSc+d
         1y5h1aPF4uQvhOMXpP/avfw1gCK87qeWqglUd+kWf4CUCRycTd9xQjS8+8rJd+xUw19d
         /n+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781029267; x=1781634067;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RxRV+giO3XkJijo1vRcVAE46LXSC1XwSsC6Fxr10BXY=;
        b=rEzucqvTOFLbTeelp4xaka6Qdaj6dNv55S0vBVYxetblfHf4jjPojXORGRZOECcY8y
         ScqT/VipZe2/jUEl/6z+ZBn5prMz3tz12ZwyhhjWHli8SEMFLXDdsdl06e6VqzRdxgaG
         PDPcz5hdd3EP0o+oW+buCzD/hfTcHAH+asyjSHTq1lKbaSM6z3wJhNn9cCNzerE1zAdz
         HHdePvPdEvwxS6J+MAGs8UFyDs5vuTM+gShVVEMSR0bLkStf4qnYVyiqUEXsptboxYbl
         P2UY9fQND9RGFWmmU3Y0sei7o8QOUFjPqO6te7a1MboKLG0KmaOreMVrfE3qOmEn+Icg
         S13w==
X-Forwarded-Encrypted: i=1; AFNElJ89CEu71v4N4LGnIh/rwDRVxpI3YFDXThJ6im3yb2s5BndI/V6mVkfd7RToyAydknrGv317hezoOj5pSwxjbvto@lists.infradead.org
X-Gm-Message-State: AOJu0YxA3izOOvJFvvWURS7koXNn2379QVXs59a4HhYO0yvV+exAd6sB
	02dHSbP/2FLicd/mn/XTZ6afZE+e8bz844xdPXt/KkyD/C8lxDlHmsyoADYzaOLQ83/LE8z2t2f
	3wToNbfHdVRsogoUrXjRoPDacZ1UX8NDvcfF2NMqX
X-Gm-Gg: Acq92OEn+pnEjq/vBUT1+L/d+qafSCAqMNF5iPyFnpwLO3tGXMh9Z51i7cpOwbK5WUO
	PpyM2Pq5q+qdNy9d6UWVRAgw3CKotEbUpiQyZ/foFXffD4bUsI6l+/3d3o4wxz3vCEaKcRv0pwl
	EeEmnNreBekQo+MFK1s3mh7k+S8ryuXYhoWCJYlFXQBqr1SbNYf14ZpDxoI3Hg/wUqrxYtAVYlg
	DOpIWhk9HqU6jejs+9FCMzrVnxNk1P1hwqHBc1NnoFEqvtsXhBKIGYw/iipypfndUBtf7vtjtYD
	agMdqZ/OYVqXPgPq5uiTvz/TtafTKc0A2z+RZUf4HNHPNNkG
X-Received: by 2002:a05:6402:31ec:b0:68f:d45f:e495 with SMTP id
 4fb4d7f45d1cf-68fe9382c98mr232792a12.12.1781029265990; Tue, 09 Jun 2026
 11:21:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260601215909.3958732-1-praan@google.com> <20260601215909.3958732-8-praan@google.com>
 <CAE2F3rDF5dVJip2gc+vaxtM-FRttnUEnAetUYz6qDCXRM=fNYg@mail.gmail.com>
 <aiZe97OkmvcUwCzS@google.com> <CAE2F3rDZupDgq5tQrvpuixGi-kVs+oi-Tacqa=Rxtri03LBPHQ@mail.gmail.com>
 <aiflaI4svEJvZbsC@google.com>
In-Reply-To: <aiflaI4svEJvZbsC@google.com>
From: Daniel Mentz <danielmentz@google.com>
Date: Tue, 9 Jun 2026 11:20:52 -0700
X-Gm-Features: AVVi8CeTKRxbhFjrttlZsJY9AQdiqj4OtT4AHceLLJ3_VrIG10WtubU1Iu-Bo5A
Message-ID: <CAE2F3rDgXxAhJFUX6=xars9H92t8NBDqcFRxU7d5wJQ7buUbNA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260609_112108_856031_19B648AA 
X-CRM114-Status: GOOD (  37.47  )
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

On Tue, Jun 9, 2026 at 3:05=E2=80=AFAM Pranjal Shrivastava <praan@google.co=
m> wrote:
> >
> > > Even if the worker CPU reorders the PTE write after the STOP_FLAG che=
ck,
> > > it is benign because the SMMU is incapable of fetching that (or any) =
PTE
> > > while the gate is closed. Because GATE_CLOSED =3D=3D SMMUEN =3D 0, im=
plying no
> > > access to any HW structures whatsoever.
> > >
> > > The real synchronization happens in the Resume Path:
> > >
> > > 1. arm_smmu_device_reset() clears all caches / TLBs.
> > >    (None of these can have entries before SMMUEN=3D1)
> > >
> > > 2. We execute a full smp_mb() before setting SMMUEN=3D1. (that's why =
we
> > >    need smp_mb before SMMUEN=3D1). This barrier ensures that any PTE
> > >    writes made by any thread=E2=80=94including those that were elided=
 while the
> > >    gate was closed, are globally visible before the SMMU hardware sta=
rts
> > >    fetching into TLBs again. (This is why Jason suggested this in v6 =
[1])
> >
> > A barrier on one CPU has no bearing on whether writes by any other CPU
> > can be observed by any particular agent in the system.
> >
> > Let's compare this with the long comment in
> > arm_smmu_domain_inv_range() which is what I believe Jason was
> > referring to. In that example, you see smp_mb() in the code path on
> > CPU0 and dma_wmb() in the code path on CPU1. Hence, barriers exist on
> > both sides. If you compare the runtime PM design with
> > arm_smmu_domain_inv_range(), then smp_mb() belongs in the CPU thread
> > that performs the translation table updates not the one that performs
> > the suspend/resume operation.
> >
>
> I might be missing something here, so please bear with me. My
> understanding it that's needed because the IOMMU is live & actively
> caching, which is not true for our case.

I think the "invs" design (Per-domain invalidation array) is more
similar than you think! An SMMU being absent from invs is equivalent
to the STOP flag, and the STE pointing to TTB0 is roughly the
equivalent of SMMEN=3D1 i.e. the IOMMU is not actively caching a
particular translation domain until an STE (or CD) points to it.

> [Assuming we use non-relaxed semantics & ordering for the STOP flag,
> i.e. set STOP_FLAG + barrier & clear STOP_FLAG (implicit dma_wmb())]
>
> In our case, during the resume op, we first clear the STOP_FLAG before
> setting SMMUEN=3D1 in program order. Thus, any PTE invalidations occurrin=
g
> before SMMUEN=3D1 are executed, i.e. EVEN when the SMMU is guaranteed not
> to access any structures, we've resumed invalidations.

"[...] we first clear the STOP_FLAG before setting SMMUEN=3D1 in program
order." I think this should be modified to "we first clear the
STOP_FLAG and ensure that the cleared STOP_FLAG is observable by all
other CPUs before setting SMMUEN=3D1"

Re "Thus, any PTE invalidations occurring before SMMUEN=3D1 are
executed,": I think that "a PTE invalidation occurring" is not clearly
defined. Also, it's not clear to me what this statement implies. It's
paramount that invalidations are performed when SMMUEN=3D1. The fact
that we perform invalidations before SMMUEN=3D1 is more of a side effect
of our methodology.

I would define a set of invariants:

 * If an agent observes the STOP flag, it is guaranteed that SMMUEN=3D0
(with ABORT set) at the time of observation.
 * Any transition from a set STOP flag to SMMUEN=3D1 involves an
invalidate-all operation prior to setting SMMUEN=3D1

Hence, if a CPU observes the STOP flag, it is assured that (a)
transactions are blocked and (b) if the SMMU is ever re-enabled, an
invalidate-all is performed prior to it being enabled.

I would then argue that all operations support these invariants. For
example, we need proper barriers in the iommu_unmap path to ensure
that the STOP flag is only checked *after* the translation table
update is made. Hence, we need a memory barrier.

I look at it this way: Every elided invalidation creates an
"invalidation deficit", and this deficit is tolerable for two reasons:
(a) SMMU blocks all transactions while there is a deficit. (b) An
invalidate-all eliminates any deficit accrued while the STOP flag was
set.

> Let's consider a few examples:
>
> 1. SUSPEND (say CPU0 is suspending)
>
> [CPU0] SMMUEN =3D 0 =3D=3D> SMMU stops accessing HW structures (ABORT NOT=
 set)

I thought we never disable the SMMU unless ABORT is set.


>                       HW structures not accessed means no TLB / CFG
>                       cache accesses as well according to the spec.
>
> [CPU1] =3D=3D> PTE update =3D> Invalidate =3D> Succeeds (although SMMUEN =
=3D 0)
>
> [CPU0] GBPA.Abort set =3D=3D> Txns are blocked
>
> [CPU2] =3D> PTE update =3D> Invalidate =3D> Succeeds [Txns blocked + SMMU=
EN=3D0]
>
> [CPU0] =3D=3D> SET STOP_FLAG =3D=3D> Elision begins
>
> [CPU3] =3D=3D> PTE update =3D=3D> Invalidation =3D=3D> Elided [Txns block=
ed + SMMUEN=3D0]
>
> Hence, the races in the suspend sequence are handled correctly.

I'm not sure if this description demonstrates that every possible race
is handled correctly. If I compare this with Nicolin's presentation in
arm_smmu_domain_inv_range, I like that presentation, as it explicitly
mentions loads and barriers. For example, it has an smp_mb() followed
by "// load the updated invs". I think you should make have something
like "smp_mb() ; CHECK STOP_FLAG" in your presentation. Currently, the
STOP_FLAG checking is somehow implicit in "Invalidation".

>
> 2. RESUME (say CPU0 is resuming)
>
> [CPU1] =3D=3D> Update PTE =3D=3D> Invalidate =3D=3D> Elided [Txns blocked=
 + SMMUEN=3D0]
>
> [CPU0] =3D=3D> Clear STOP_FLAGs [Txns still blocked + SMMUEN=3D0]
>
> [CPU2] =3D=3D> Update PTE =3D=3D> Invalidate =3D=3D> Succeeds [Txns block=
ed + SMMUEN=3D0]
>
> [CPU0] =3D=3D> Invalidate all TLB =3D=3D> Succeeds [Txns still blocked + =
SMMUEN=3D0]
> [CPU0] =3D=3D> Invalidate all CFG =3D=3D> Succeeds [Txns still blocked + =
SMMUEN=3D0]
>
> [CPU2] =3D=3D> Update PTE =3D=3D> Invalidate =3D=3D> Succeeds [Txns still=
 blocked + SMMUEN=3D0]
>
> [CPU0] =3D=3D> Set SMMUEN =3D 1 [SMMU can now access in memory structures=
]
>            However, the TLBs and CFG caches are clean because everything
>            until this point couldn't have cached anything anyway.

My concern with this diagram is that it appears sequential, suggesting
operations happen in a specific order across CPUs when they, in fact,
occur in parallel. I find these diagrams more useful for describing
failure cases than for proving that every race is handled correctly.

>
> Hence, right after clearing the STOP_FLAG, we're taking in invalidations
> as normal in the resume, much before the real caching can begin.
>
> Thus, by resuming invalidations before SMMUEN=3D1, we guarantee a
> consistent state before the very first translation is performed.
>
> Apart from this, I guess I'll drop the can_elide check from all
> invalidation paths.
>
> Does that sound fine?

Dropping can_elide sounds fine. However, if you still use this
function, for example in the gerror handler, then you might consider
renaming it.

