Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E84EC87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 18:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=40dRevb3+VbSqC7PTRUcFwY+Be9Qk1uzZ2DAmm4HBNw=; b=YYQo7Bc4jO8WgOfaFvqUbVdv8p
	fHvk2viEl88JZt1/aulx5a1KoQ4K576deN4VugTRNfRb347sdxmT/O5guZMBYfe1+AcEQxbtjy+/5
	Xd9K5RCnSq+3Tud8dDrEEPl24f5QDfVFrRHoUmHkT2543oA5L+fc4e6MA5CEVuOo/ssFC+He/rQUj
	nvFAtLiHZUueboeSkBGNSAtQD78GIf2w7fhTiv31wA66R5Ec4vUgFNuysJM1cIAWm04K+ubvY80dp
	UU6aMt6oETdh4RW2Eo0JeYICuSnD8f/pkUfWP1ERrlILkdO2NVtnDyqwFeMOrtYtmPi6Fm7SWPYwh
	0wED/VvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugohm-0000000HPsg-15gq;
	Tue, 29 Jul 2025 18:05:38 +0000
Received: from out-180.mta0.migadu.com ([2001:41d0:1004:224b::b4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugofH-0000000HPj6-1yFO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 18:03:06 +0000
Date: Tue, 29 Jul 2025 11:02:51 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1753812179;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=40dRevb3+VbSqC7PTRUcFwY+Be9Qk1uzZ2DAmm4HBNw=;
	b=GmGwuBcwRjVOq4k7VEaTkmwB4av+swJA7Ghf530CDjC3cjGYHKELbUrsUe5cNnN0x2nl8u
	crfORW5dyCulim6P3KozhWBhcHoTKE7BsYNr7i2eGyjitZ6rDF2Lw5vnNxVZxxelul6ht+
	VdArZIn5ZLyadHML5z3tqLhb03CgPcU=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Raghavendra Rao Ananta <rananta@google.com>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: Set/unset vGIC v4 forwarding if direct IRQs
 are supported
Message-ID: <aIkMy7YPbcf0jvHq@linux.dev>
References: <20250728223710.129440-1-rananta@google.com>
 <aIjcmquPNOdE5l4K@linux.dev>
 <CAJHc60xPKgVn96azWhP1NbfKioEZj68APQPf=zKRMuHB7-goqA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJHc60xPKgVn96azWhP1NbfKioEZj68APQPf=zKRMuHB7-goqA@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_110303_720262_F5B65C2E 
X-CRM114-Status: GOOD (  22.90  )
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

On Tue, Jul 29, 2025 at 09:56:12AM -0700, Raghavendra Rao Ananta wrote:
> On Tue, Jul 29, 2025 at 7:37 AM Oliver Upton <oliver.upton@linux.dev> wrote:
> >
> > Hi Raghu,
> >
> > Thanks for reporting this so quickly :)
> >
> > On Mon, Jul 28, 2025 at 10:37:10PM +0000, Raghavendra Rao Ananta wrote:
> > > diff --git a/arch/arm64/kvm/vgic/vgic-v4.c b/arch/arm64/kvm/vgic/vgic-v4.c
> > > index e7e284d47a77..873a190bcff7 100644
> > > --- a/arch/arm64/kvm/vgic/vgic-v4.c
> > > +++ b/arch/arm64/kvm/vgic/vgic-v4.c
> > > @@ -433,7 +433,7 @@ int kvm_vgic_v4_set_forwarding(struct kvm *kvm, int virq,
> > >       unsigned long flags;
> > >       int ret = 0;
> > >
> > > -     if (!vgic_supports_direct_msis(kvm))
> > > +     if (!vgic_supports_direct_irqs(kvm))
> > >               return 0;
> > >
> > >       /*
> > > @@ -533,7 +533,7 @@ int kvm_vgic_v4_unset_forwarding(struct kvm *kvm, int host_irq)
> > >       unsigned long flags;
> > >       int ret = 0;
> > >
> > > -     if (!vgic_supports_direct_msis(kvm))
> > > +     if (!vgic_supports_direct_irqs(kvm))
> > >               return 0;
> >
> > I'm not sure this is what we want, since a precondition of actually
> > doing vLPI injection is the guest having an ITS. Could you try the
> > following?
> >
> > Thanks,
> > Oliver
> >
> > diff --git a/arch/arm64/kvm/vgic/vgic-mmio-v3.c b/arch/arm64/kvm/vgic/vgic-mmio-v3.c
> > index a3ef185209e9..70d50c77e5dc 100644
> > --- a/arch/arm64/kvm/vgic/vgic-mmio-v3.c
> > +++ b/arch/arm64/kvm/vgic/vgic-mmio-v3.c
> > @@ -50,6 +50,14 @@ bool vgic_has_its(struct kvm *kvm)
> >
> >  bool vgic_supports_direct_msis(struct kvm *kvm)
> >  {
> > +       /*
> > +        * Deliberately conflate vLPI and vSGI support on GICv4.1 hardware,
> > +        * indirectly allowing userspace to control whether or not vPEs are
> > +        * allocated for the VM.
> > +        */
> > +       if (system_supports_direct_sgis() && !vgic_supports_direct_sgis(kvm))
> > +               return false;
> > +
> >         return kvm_vgic_global_state.has_gicv4 && vgic_has_its(kvm);
> >  }
> >
> > diff --git a/arch/arm64/kvm/vgic/vgic.h b/arch/arm64/kvm/vgic/vgic.h
> > index 1384a04c0784..de1c1d3261c3 100644
> > --- a/arch/arm64/kvm/vgic/vgic.h
> > +++ b/arch/arm64/kvm/vgic/vgic.h
> > @@ -396,15 +396,7 @@ bool vgic_supports_direct_sgis(struct kvm *kvm);
> >
> >  static inline bool vgic_supports_direct_irqs(struct kvm *kvm)
> >  {
> > -       /*
> > -        * Deliberately conflate vLPI and vSGI support on GICv4.1 hardware,
> > -        * indirectly allowing userspace to control whether or not vPEs are
> > -        * allocated for the VM.
> > -        */
> > -       if (system_supports_direct_sgis())
> > -               return vgic_supports_direct_sgis(kvm);
> > -
> > -       return vgic_supports_direct_msis(kvm);
> > +       return vgic_supports_direct_msis(kvm) || vgic_supports_direct_sgis(kvm);
> >  }
> >
> >  int vgic_v4_init(struct kvm *kvm);
> 
> Yes, the diff seems fine (tested as well). Would you be pushing a v2
> or do you want me to (on your behalf)?

Go ahead and respin this diff, thanks!

Oliver

