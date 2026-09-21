Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D45FC982E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 09:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8X/5deMM6cMfCPfio5kUdEFewo5cSW2r2DWxfpdO5fk=; b=shnNZLIBZoXQ46Te9JL7fSnv4x
	FZNsgyOxLK6bbJWPjk137Tu7u9wT0ppCMeXrtrGAz6coB8mE7CDcb9c2qSehhRtnsAw+cghGJRunR
	SG6tLYw+boA7IbaMyS/+Yvfix8lMfBPKsWKZ0ewyHwffP5b5GLUxHiSu08VT4wlO5Xo2L0uoRJrJr
	XKkPXCK+4lZIrjXKRgeLoGC7vEuXOQriSgvnuaoq5U24h4TPI70QYhjmJu83nHs2zgajiYaTMGZVh
	uK1gh2hEOclAEMfNcqwhbKA6Rmirx5T8R1G1NSPL09Luf4OhbqGLL8OiP+3YokLAoLGgYvH8ptpR5
	WuHn1l+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Zxr-00000001RmB-2rvA;
	Mon, 21 Sep 2026 09:05:31 +0000
Received: from mail-pz2-x0d.google.com ([2607:f8b0:4864:3b::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Zxg-00000001Riy-3f5s
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 09:05:29 +0000
Received: by mail-pz2-x0d.google.com with SMTP id d2e1a72fcca58-8686f46e4adso2286214b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 02:05:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789981519; cv=none;
        d=google.com; s=arc-20260327;
        b=oHXDWtyHZuOYtY40l4VRvDo1pSHO5iw+3p6ncv0LCn2hdk8icc3Fmty2zXtwH0hb1S
         IWrwaljEGGJrJ/1YT148F5RgF3620xuJeTLpYNpJFikIzhnoAqu4cv4hsnYCKX+ebDtw
         wkpZACmEa7mAEMHV3YId/HR6Z2kTqNJLsJmTFqDgngSEOmVZUipBaoEjgbMVsEgAUwWM
         mmxzY6FU5hUwD8Ltjk2wuchlxUS6XCEs6/fvVJh7w8Nk3qoF/sqfCia20LnNKqxBh2jc
         eNbTWwYljzRlBsS+950u1ZScSNHg67oLwvS0Mvgwqdr/fajLbMG8j8SqIqPOgC0bgNlA
         I0oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8X/5deMM6cMfCPfio5kUdEFewo5cSW2r2DWxfpdO5fk=;
        fh=mW8gar/rwAJJFLRfBU3ohnlV6r/sSJOZDnjo0qQxfVU=;
        b=SvuS0DBuIFHG8Gf8aeUoDIHriEmq9F1qki11P9I79PCQMy8nS5apztDYtbzA0LqOpQ
         0k6SGkKk5e3mKBIpfhwtuXvd/Q4xLyugZpk9hXZTwYeQicOqaoKM4DpornGVD2boOw8q
         LgRORgEZ7yyDT+kYNGSLQHPd0laQcouMhvA2LElXtkL9aXq/8v2KqJOZ+kBqJtNeuKn9
         TSbr6kfNXWc0tWTPIhRlWwc4P1b8qPEEl0lpvZ464jO6g0yYQQCnFO3z4/xB2z0e6zdN
         G9vqWt+2G32dAZyz1pep6GNSk1knGa3IWtg6JCYeA7QWurox1GJ7vYLQscYzYtW3Ftm5
         YZnA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nearthlab.com; s=google; t=1789981519; x=1790586319; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8X/5deMM6cMfCPfio5kUdEFewo5cSW2r2DWxfpdO5fk=;
        b=P24WaFL6JaSev3mpf8p/1unPjkxl45AFR5SiTsJV2grzDaWQoljVnd+GRplm328qlV
         ax6Oj7iGZdLLBL33JNHqsXAXuetGNQATUxw/Y2XhvMqYKVdXi5X4OyXqyNJe4uDWJVwM
         CI7D7CqDMWdWtZ/xlGA9Tp7gBX+jOu1aRLFWo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789981519; x=1790586319;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8X/5deMM6cMfCPfio5kUdEFewo5cSW2r2DWxfpdO5fk=;
        b=mNJZ52LHG9ytFUd3xbYTd5g0KLpIIf+UvjAk5bU5e6cvjJtkIHHfzOoehU7l0vFg4z
         ZKCC4RDgS0QPp3W3lmuht4QYtdSSZxkSZLNzQqwWEe8t0Hw6K6QcuB47k4byZCPIQjq5
         P0qb1wKvPZKDTEym3/pZe/nhPSCUnYMLvu7eoUufzDmnRKR1MJwRiK3FCqQcvcdxcZEQ
         q/gi2OTfuxGbj4EbbRzKJ0TfUbuUtgvFp8eMx3huwXgvZDDzF2LWa+4LeB5H9JjJHVaQ
         8OJFpVqLJNTRT4haO4Rh2AlB59YVM97noj8LuwUbe8ewfdTBmil5oJdQ3yCgDjwkgR84
         7jng==
X-Forwarded-Encrypted: i=1; AKwUvBzRBbB2GzCR6Wn53GgtXJcSRZ5vc1Po8lLU33o1vvuTyjdF/ezDpQaYTYuZRUIvtuv4keaaLki0xg3txsjQ5LaR@lists.infradead.org
X-Gm-Message-State: AFuF++mDWlug+7vN0Y1EQdbz2yF3kiUIevXKq76aSxXyU2Ow8XKEeDwn
	ssdv16J6w3SdKBMhkmGe688ZNz5tu5NzDvV9tASK0DOXwZEKngzyliOPYXZHHFduip4Yoh8lri+
	mOLLOtfzILCPqI8c1oci5asWaGQ8dof95i1YdTtnLdQ==
X-Gm-Gg: AYBFou0PXtM/dpDB4y7pCdOtPLmbefFYH489cAruhPdF6rwjdhHjhcyYwSSRqUczbCH
	z+5i3BHyKnFt4AR2mI4TdDOFy/FPRb6Hg8slvc1HE6AIm7drkQsXp5zCmllE7AIyiTFhuz5GhbC
	9qdFNbNyeJc25kqEfaxknTsfDHOcQpbqK/hQNCl85ld79ATjvq72w7NIfcTJ3U4kVZIIhr7muIA
	Voeo74Js9aooNI89UdFMwGy3A7w3F0bL33G6K4ofOKza8/tmd9IqPi+nzBIUVWci1lzjLN9Lonf
	3aR5WUQ5gXyLZVVmno0gQ8ww/+9F34kZx5XFz7jX4uNugOjnXHAK4RYc
X-Received: by 2002:aa7:8883:0:b0:84e:d5e6:a085 with SMTP id
 d2e1a72fcca58-874d84a92bemr14325682b3a.0.1789981519125; Mon, 21 Sep 2026
 02:05:19 -0700 (PDT)
MIME-Version: 1.0
References: <87cxuo3fl9.ffs@fw13> <20260916231029.GA988000@bhelgaas>
In-Reply-To: <20260916231029.GA988000@bhelgaas>
From: =?UTF-8?B?SGFuIC8g7ZWc7IOB7JqwU2FuZ3dvbw==?= <sangwoo.han@nearthlab.com>
Date: Mon, 21 Sep 2026 18:05:07 +0900
X-Gm-Features: AcwNN1UY_p08SHSW4zqTzU8BM9IzyWZV-P37VhRnSz8vgq1qfIqIDCSUy-MEUFs
Message-ID: <CAFg7d9bJJjR7JEMXanttGVcGisa4x3uLYPR43Te4+JKMzHBkfQ@mail.gmail.com>
Subject: Re: [PATCH] PCI: brcmstb: Reserve only the MSI vectors that are
 handed out
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, jim2101024@gmail.com, florian.fainelli@broadcom.com, 
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org, 
	bhelgaas@google.com, bcm-kernel-feedback-list@broadcom.com, robh@kernel.org, 
	linux-pci@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Inochi Amaoto <inochiama@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_020524_903932_03316F11 
X-CRM114-Status: GOOD (  55.48  )
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

Hi Bjorn,

Sorry for the delay in testing this.

I tested Thomas's patch on the same hardware setup with the 5-vector
MSI endpoint. The patch was applied as posted on top of 6.12.93
(rpi-6.12.y).

With the patch applied:

- The MSI base hwirq remained at 0x8 across 200 driver reload cycles.
- The driver got all 5 requested vectors on every cycle, with no
single-MSI fallback. Multiple Message Enable remained at 8.
- The brcmstb inner-domain mapping returned to baseline after each
unload/reload, with 12 mapped while the driver was loaded and 4 after
unload.
- A kprobe showed one allocation of 8 vectors followed by eight
single-vector frees, with nothing left over.

The MSI vector exhaustion issue I originally observed no longer
reproduces with the patch.

I also observed a KASAN report with managed affinity. Using a small
out-of-tree test module bound to the same endpoint and requesting 1..3
vectors with PCI_IRQ_MSI | PCI_IRQ_AFFINITY, a request for 3 vectors
resulted in:

BUG: KASAN: slab-out-of-bounds in __irq_alloc_descs+0x158/0x460

Requests for 5 and 7 vectors were capped to 4 on this 4-CPU system and
did not trigger the report. I have not checked this against the
unpatched kernel yet, so I cannot tell whether it is related to the
patch.

Best regards,
Sangwoo


2026=EB=85=84 9=EC=9B=94 17=EC=9D=BC (=EB=AA=A9) =EC=98=A4=EC=A0=84 8:10, B=
jorn Helgaas <helgaas@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Mon, Sep 07, 2026 at 11:40:34PM +0200, Thomas Gleixner wrote:
> > On Mon, Sep 07 2026 at 11:34, Bjorn Helgaas wrote:
> > > [+cc Thomas, Inochi for MSI expertise]
> > >
> > > I want to revive this thread because I think there's a real problem
> > > here, and we should solve it for all the PCI controller drivers.
> > >
> > > There's nothing brcm-specific about the bitmap alloc/free except the
> > > size of the msi->used bitmap, so I don't want to copy/paste this sort
> > > of fix in all the affected drivers.
> > >
> > > I'd also like to avoid the extra align_mask and
> > > bitmap_find_next_zero_area() followed by manual bitmap_set().
> > > bitmap_find_free_region() already takes care of the alignment and
> > > setting the allocated bits.
> > >
> > > The MSI Multiple Message Enable situation of enabling more vectors in
> > > the device than the driver wants is generic to all devices that
> > > advertise Multiple Message Capable, and I don't think we should have
> > > to deal with this in every host controller driver.
> >
> > Correct.
> >
> > > If a driver requests 3 vectors, we have to enable 4 because MSI only
> > > supports power-of-two number of vectors.  This tells the device it is
> > > allowed to use all 4 vectors, and I think the PCI MSI core should
> > > assume they all *will* be used instead of relying on the driver's
> > > claim that it will only use 3.
> >
> > That's not really a good idea because e.g. the irq affinity stuff relie=
s
> > on the accurate number of interrupts the driver requested with the
> > minvec/maxvec range. We can't magically spread more interrupts than the
> > driver is able/willing to handle.
> >
> > But we can fix that without changing the consumer side (device drivers)
> > visible behaviour and handle it solely in the core code.
> >
> >  1) MSI interrupts are special because they have msi_desc::nvec_used >
> >     1, so the allocation and the free path can take care of the power o=
f
> >     two requirement. That just allocates more resources than the driver
> >     wants but they are just memory.
> >
> >  2) All MSI parent domain implementations should be able to handle
> >     domain_ops::free() with nr_irqs > 1. That's something which can be
> >     trivialy audited.
> >
> >     I really have no memories why the bulk remove function iterates the
> >     interrupts one by one instead of doing in one go, but this is also
> >     used by non MSI domains, which might have issues with a bulk remove=
.
> >
> >     If we establish that all MSI parent domain implementations can
> >     handle the free() callback with nr_irqs > 1, then
> >     irq_domain_free_irqs_hierarchy can check whether
> >     IRQ_DOMAIN_FLAG_MSI_PARENT is set in the domain_flags and avoid the
> >     loop for that case.
> >
> > Something like the completely untested below.
>
> Sangwoo, is there any chance you can test this and see whether it
> fixes the issue?
>
> If it does, I guess we'll have to ask Thomas to post it with the
> appropriate Signed-off-by, etc.
>
> > ---
> > diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
> > index 4fdcb6df5306..b3f6cc6ae2ce 100644
> > --- a/kernel/irq/irqdomain.c
> > +++ b/kernel/irq/irqdomain.c
> > @@ -1611,6 +1611,13 @@ static void irq_domain_free_irqs_hierarchy(struc=
t irq_domain *domain,
> >       if (!domain->ops->free)
> >               return;
> >
> > +     /* CHECKME: Are all MSI parent domains capable ? */
> > +     if (domain->flags & IRQ_DOMAIN_FLAG_MSI_PARENT) {
> > +             if (irq_domain_get_irq_data(domain, irq_base))
> > +                     domain->ops->free(domain, irq_base, nr_irqs);
> > +             return;
> > +     }
> > +
> >       for (i =3D 0; i < nr_irqs; i++) {
> >               if (irq_domain_get_irq_data(domain, irq_base + i))
> >                       domain->ops->free(domain, irq_base + i, 1);
> > diff --git a/kernel/irq/msi.c b/kernel/irq/msi.c
> > index fb5f372215bf..2835b09899ea 100644
> > --- a/kernel/irq/msi.c
> > +++ b/kernel/irq/msi.c
> > @@ -1333,20 +1333,28 @@ static int __msi_domain_alloc_irqs(struct devic=
e *dev, struct irq_domain *domain
> >
> >               ops->set_desc(&arg, desc);
> >
> > -             virq =3D __irq_domain_alloc_irqs(domain, -1, desc->nvec_u=
sed,
> > +             /* Make sure a MULTI-MSI allocation is power of two */
> > +             unsigned int nvec_aligned =3D roundup_pow_of_two(desc->nv=
ec_used);
> > +
> > +             virq =3D __irq_domain_alloc_irqs(domain, -1, nvec_aligned=
,
> >                                              dev_to_node(dev), &arg, fa=
lse,
> >                                              desc->affinity);
> >               if (virq < 0)
> >                       return msi_handle_pci_fail(domain, desc, allocate=
d);
> >
> > -             for (i =3D 0; i < desc->nvec_used; i++) {
> > +             for (i =3D 0; i < nvec_aligned; i++) {
> >                       irq_set_msi_desc_off(virq, i, desc);
> >                       irq_debugfs_copy_devname(virq + i, dev);
> >                       ret =3D msi_init_virq(domain, virq + i, vflags);
> >                       if (ret)
> >                               return ret;
> >               }
> > +
> >               if (info->flags & MSI_FLAG_DEV_SYSFS) {
> > +                     /*
> > +                      * This only exposes desc->nvec_used and ignores =
the
> > +                      * overallocated MULTI-MSI ones.
> > +                      */
> >                       ret =3D msi_sysfs_populate_desc(dev, desc);
> >                       if (ret)
> >                               return ret;
> > @@ -1610,13 +1618,15 @@ static void __msi_domain_free_irqs(struct devic=
e *dev, struct irq_domain *domain
> >                       continue;
> >
> >               /* Make sure all interrupts are deactivated */
> > -             for (i =3D 0; i < desc->nvec_used; i++) {
> > +             unsigned int nvec_aligned =3D roundup_pow_of_two(desc->nv=
ec_used);
> > +
> > +             for (i =3D 0; i < nvec_aligned; i++) {
> >                       irqd =3D irq_domain_get_irq_data(domain, desc->ir=
q + i);
> >                       if (irqd && irqd_is_activated(irqd))
> >                               irq_domain_deactivate_irq(irqd);
> >               }
> >
> > -             irq_domain_free_irqs(desc->irq, desc->nvec_used);
> > +             irq_domain_free_irqs(desc->irq, nvec_aligned);
> >               if (info->flags & MSI_FLAG_DEV_SYSFS)
> >                       msi_sysfs_remove_desc(dev, desc);
> >               desc->irq =3D 0;

