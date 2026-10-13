Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A14AACC6B03
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 08:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rzNVaT90GYZEug/T1ZLZlSqiBeontwDSLfIxns+H/So=; b=Wdv5OX60r+cp2cmdmQAQSTA85A
	xbcE9goBKfj+Yk1FTMmqClJetpHR+fkPCtpMvVldTmf2PlvzUfd5yjcrXpIX8F+iQ9aV5qsS2n8WG
	6HDygNDJiBYf1x7ORULZdATRQj8kiZ6coWTy+2bOUA78Pqx4wXM38G6ao2xnh0SO64dq/mFyJKZ3x
	2+IDYezYaQfn0zw3+KTtaGC30zFbVotMELwYVH0VG47ilP6dbdMJ436g81AaAJbW69GWZhQlOxBLF
	fVFRiZ7lEcq7bJga+n/OIcyMJQnnsQUIE5exCAn9kWc5FYM4Hv/u6Y+P8PicWv6pg7SEeedl7q33W
	OOgdjAKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGYB7-0000000CN0K-2uAs;
	Tue, 13 Oct 2026 08:48:09 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGYB1-0000000CMya-1ChB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 08:48:07 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-3a80d1c98f5so1531164a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 01:48:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791881281; cv=none;
        d=google.com; s=arc-20260327;
        b=srrkt9Qbe01PtL6cAxkoyYouHTskn7lz5h5lAjwZTnBxqoT1EqIJvdgiNmgRKkjLxG
         FY6QNaR0MicZKcaFuEbgussE7rgcn5wNM0UsePWTnxh3Scpnw9kRNhNXGfeWvMWsXlH0
         DAL75X0ZoG3+fwr4gx941q25tO4V9rci1ZbVMbg2VYaMi12x8FukS2gaijGkqey8ihJk
         XRvRGTBxE/nkeXv93rz+pyVzfa9D3woldGLYcy+uU5XPAlLJgFrj9Jn4Zbyn+7G18g4f
         Q8wzomOKLrogAy5s6z5HeUOLhZ1d7Vd4y+NMgAS/z9XLVnzNEgWFkSVWagRkn/Y2eB6S
         SkNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rzNVaT90GYZEug/T1ZLZlSqiBeontwDSLfIxns+H/So=;
        fh=00ChoXyhHgK3Z4hcNOoxebJ+b7x7fUrkw3mXdy/+0Q8=;
        b=lv+nso9svA1iU2gafdToaQ4UxODqNTomsB6LINcsfpzvxO1ry8r4sYw/7Loh+x98Ig
         XTv2GQ3wIhotFKhcmsBVlc5oKNEILl8MpIeV6M3M+FRMD63zL42Zw2Hk4D0OY7Hc4VJP
         aMJtNLDzh9k4lwDYLtL1P1UFztRVtJ/nkuWUjB4akCHlhWPkclVpAfGgVWHcX2oG7Mat
         ITosH1ToG3vyerWQPB5H6urXue6uIY7V+7cEHgXfGE+K+JHF16GwUmdgEwwIzrK4wENm
         4ffZkQ4b+FAODWPe03liNECMlH3OFUmXRcCXKcqZfRuhYX5fIXPhyXgef6AuwU6u7mN6
         TApA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nearthlab.com; s=google; t=1791881281; x=1792486081; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rzNVaT90GYZEug/T1ZLZlSqiBeontwDSLfIxns+H/So=;
        b=CNaxtYq4xP5NNOrt5hF9dNxanOEySwntHbQH7njAzfHmuCHm3HsQBF3kN9t/87IzjF
         XhhAZPqo/0WnKFbZ0L6A9fCPApXOK04sHph3akBtF0LY1AlmQzTABz5V44CLk96dDd0f
         8Sx2kDq7KniLlzf+9tn3Fh/zVyS01TBIpBhW4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791881281; x=1792486081;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rzNVaT90GYZEug/T1ZLZlSqiBeontwDSLfIxns+H/So=;
        b=QLHVQa0mZ+6yNxQodpwKWGW7uIHukrXxGeE6q0wEzT254hA2rN3LkgmR8xMx1v+6WQ
         5Ahh6QfISaGQNQFVufEgiEW9088gOPG8rQ2M4wXFIJ4Lw8xCflvO/+Rx7kuW7h2IArYy
         uZDSn7c37fc66RmzPhnPHHA+etyrSPANKxfm16ygeZBje601d1Dfke4/oCDfe74Ydb2g
         haowaf6dPoGA4WM4lHGIPHSV5I3Jp7so/g3ZpFv4s25D9B5s2a77u7hqs+UOrOV+foRV
         zvzHwEL/vmeO9eQum6/Qg3ESsyh+06ZDgaqi9J7+sjfpbkg9vkrQSCcCwbRHQJ8Xo0gK
         UO+A==
X-Forwarded-Encrypted: i=1; AKwUvBzgwVESO/ZHJiIKyImC2hue80TGuBRtBQfj8bLW7oWinKxQhMHNNpjIn1r5cqiJrIAkF9l60OgGQdf3saVecee+@lists.infradead.org
X-Gm-Message-State: AFq9FYI5g6yFU+KvlK99AcItFHdZXZDQJbO91JPMSJAaw2WdkQNAsMfF
	qtD1VU8WMT5dA6VKy+zI6fuYnZ3UQb5k0Ct0EeSxruu7rhOZ6p8K4RQiEJGj3PaaM8PaulrdGV7
	4Y7pJ4N7wSffHua6ks17K3HsZnmMf7KgxWltid8B+hKcUnC0CgRFtzn6qqw==
X-Gm-Gg: AYBFou1hyvCXr7+KTalFpvJvqI+7SuHkZHdGyBdfc9gUEvbGpdlcL0hNCNYxdGnCBRL
	EoBenom7+vJre/xaXoLxKQHKWnTkl4kgQ5aQZ/GbEEad5Qf56aI0oS1BmhPcuTErqAdbgdSnvgc
	V9w+jSoBuLco8P/Fw8W5bRWJiTmLxOmgZBOYlrq8Rz6zfW+NGVjNEIYJ22kRCgGldBMjUht4dHD
	tlXm1JcKtyx+MhOazh4XyGn6LEL/NH/eQxkDfsBjJaVBaCOwkmqvN7UhK8PVUL815CEKdRISOmI
	ioGdVI3BI9vc8OJTG9yrMGC+kBr5R4nA/JwC9K/kAfpu1Zcyxn+BLmhq
X-Received: by 2002:a17:90a:d006:b0:3a7:bf13:6007 with SMTP id
 98e67ed59e1d1-3ab3a9128c8mr9969201a91.14.1791881281048; Tue, 13 Oct 2026
 01:48:01 -0700 (PDT)
MIME-Version: 1.0
References: <871pa9gqy0.ffs@fw13> <20261012214737.GA1400495@bhelgaas>
In-Reply-To: <20261012214737.GA1400495@bhelgaas>
From: =?UTF-8?B?SGFuIC8g7ZWc7IOB7JqwU2FuZ3dvbw==?= <sangwoo.han@nearthlab.com>
Date: Tue, 13 Oct 2026 17:47:49 +0900
X-Gm-Features: AclHuK_m5ccTa8frqqq3Xr7dirm-kMGsCwAMeH37wK9ea3ERtMGi0K_ixLEeTqU
Message-ID: <CAFg7d9becn9_=ZzNwQ7bSBBNid28t_RnofL-Vb1cZVHVHxS9fw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20261013_014803_325968_9B631F22 
X-CRM114-Status: GOOD (  40.44  )
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

Hi Bjorn, Thomas,

> > Good. Can you please retest with the updated patch?
>
> Sangwoo, any update on this?

Sorry for the silence.

I have not been able to retest yet. I have several work items on a
tight schedule right now, and I am currently working on a different
board for another project, so I cannot get to this at the moment.

For the KASAN slab-out-of-bounds report, I will follow up within
October.

For the retest with the updated patch, I cannot give a date right now.
I am sorry about that.

Thanks,
Sangwoo

2026=EB=85=84 10=EC=9B=94 13=EC=9D=BC (=ED=99=94) =EC=98=A4=EC=A0=84 6:47, =
Bjorn Helgaas <helgaas@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Thu, Oct 01, 2026 at 09:29:27PM +0200, Thomas Gleixner wrote:
> > On Mon, Sep 21 2026 at 18:05, Han / =ED=95=9C=EC=83=81=EC=9A=B0Sangwoo =
wrote:
> > > I tested Thomas's patch on the same hardware setup with the 5-vector
> > > MSI endpoint. The patch was applied as posted on top of 6.12.93
> > > (rpi-6.12.y).
> > >
> > > With the patch applied:
> > >
> > > - The MSI base hwirq remained at 0x8 across 200 driver reload cycles.
> > > - The driver got all 5 requested vectors on every cycle, with no
> > > single-MSI fallback. Multiple Message Enable remained at 8.
> > > - The brcmstb inner-domain mapping returned to baseline after each
> > > unload/reload, with 12 mapped while the driver was loaded and 4 after
> > > unload.
> > > - A kprobe showed one allocation of 8 vectors followed by eight
> > > single-vector frees, with nothing left over.
> >
> > 8 single vector frees?
> >
> > Seems I got something wrong there verus the bulk free. Updated patch
> > below.
> >
> > > The MSI vector exhaustion issue I originally observed no longer
> > > reproduces with the patch.
> >
> > Good. Can you please retest with the updated patch?
>
> Sangwoo, any update on this?
>
> I don't see this patch in linux-next (next-20261012), so I don't think
> this will be fixed for v7.4 unless something moves it ahead.
>
> > > I also observed a KASAN report with managed affinity. Using a small
> > > out-of-tree test module bound to the same endpoint and requesting 1..=
3
> > > vectors with PCI_IRQ_MSI | PCI_IRQ_AFFINITY, a request for 3 vectors
> > > resulted in:
> > >
> > > BUG: KASAN: slab-out-of-bounds in __irq_alloc_descs+0x158/0x460
> > >
> > > Requests for 5 and 7 vectors were capped to 4 on this 4-CPU system an=
d
> > > did not trigger the report. I have not checked this against the
> > > unpatched kernel yet, so I cannot tell whether it is related to the
> > > patch.
> >
> > Any updates on that? Also please provide the source for that test.
> >
> > Thanks,
> >
> >         tglx
> > ---
> > --- a/kernel/irq/irqdomain.c
> > +++ b/kernel/irq/irqdomain.c
> > @@ -1610,6 +1610,17 @@ static void irq_domain_free_irqs_hierarc
> >       if (!domain->ops->free)
> >               return;
> >
> > +     /*
> > +      * MSI device domains are capable of bulk free.
> > +      *
> > +      * CHECKME: Are all MSI parent domains capable?
> > +      */
> > +     if (domain->flags & (IRQ_DOMAIN_FLAG_MSI_DEVICE | IRQ_DOMAIN_FLAG=
_MSI_PARENT)) {
> > +             if (irq_domain_get_irq_data(domain, irq_base))
> > +                     domain->ops->free(domain, irq_base, nr_irqs);
> > +             return;
> > +     }
> > +
> >       for (i =3D 0; i < nr_irqs; i++) {
> >               if (irq_domain_get_irq_data(domain, irq_base + i))
> >                       domain->ops->free(domain, irq_base + i, 1);
> > --- a/kernel/irq/msi.c
> > +++ b/kernel/irq/msi.c
> > @@ -1333,20 +1333,28 @@ static int __msi_domain_alloc_irqs(struc
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
> > @@ -1610,13 +1618,15 @@ static void __msi_domain_free_irqs(struc
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

