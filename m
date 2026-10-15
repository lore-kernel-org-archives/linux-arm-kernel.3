Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FF95CCA463
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 15:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g+la5oRry/ejNEDlylEClTFnvYZE1MGV2kYV0bWmL7E=; b=FMnhP7QW2QKg9hx10f0SFV6Jkl
	GbfPFyDzYQRlq5ZfmOO0nZcpgZmKKqb0F15sS/kEZwMvPYO6Ftlp0mwNCha335uAjSFGy1QKRyNin
	BeC7/Alg41v2rkyXYXqogHlZyVn+RhDZjyPgc9RpGOMtYDiXfDdwxWG7BPteF2S3dm83kp69VxZin
	gB14e82PQz3KOX9KAmUk0Vk+qZA9eosxY+d5tHlH96nizT+t0GszxhR4WwjwmvTfkBmZuWqQwWtn9
	NYIWNUM3AMl4I02U7udrBiONfFPb+ci5LEXLiJmQM5xNbXiH/JnkITU0lrxWBrExc0Z2Z5xx5xXrm
	72PCbpSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHN5B-00000000WU0-2rD8;
	Thu, 15 Oct 2026 15:09:25 +0000
Received: from mail-vs1-xe2a.google.com ([2607:f8b0:4864:20::e2a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHN58-00000000WSv-3zxI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 15:09:24 +0000
Received: by mail-vs1-xe2a.google.com with SMTP id ada2fe7eead31-7c2f48f3a96so792808137.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 08:09:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792076962; cv=none;
        d=google.com; s=arc-20260327;
        b=eJCr+QZX6ak3BZF6E4PfCx5nJgprPngrsSgzR6oTgh+mfFeqZABIIYfARpIET9msYZ
         A1ObWtFCEXaekgNIwzShnclMWGO4CEaJBNnRcQhoC+NvK1dWPFFi4JubHgXOZvSqplZP
         vSzY7iSIbKvxzUiGCUyl2xFaWWNLnQhqbk+jcJ6kj3hTruj2ARYm6M2hW99WWImlbicq
         Vabdhg3LH2TLt6E+rlMgqLMSsksm1Q3xJq0B2vk3JLIjT58YjmpZND4jYVKjbK1Zj0T9
         t/mwFx2Ljar2W4rw2EEC/4XYc08VaaaNLBj+qWKn3fseT5SKTOhLFYb5LB/WnoodgXSt
         zAmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g+la5oRry/ejNEDlylEClTFnvYZE1MGV2kYV0bWmL7E=;
        fh=w6uL9X8zFCOjg0kaMyz89WZTPcO1tgYxwDDBFSeWq5c=;
        b=jT9HpaiDMlM4kVvjQJglNs4Dh50kRgBmEoorp4/u4qKkppeqdqqETlc630mi45M2F3
         NBPKESQInR169X55NecNbNGPCJMgWP30MiMCf2eAZm2QTpjMFNBHRdWqMXmOqwIOQbQK
         rwudWVbYN4Xv2TDLGFvObDSrE1ZI/t9lyi8P6fmcl5thQPvTZ8bjqG2GuHjI4H52nHlG
         ta2FAS8Ib/isjXRo2m3+7r7pc4+U+Icisl21HL31hgWFVe0WfW0xd5rR5f6hw+Hbgscl
         m0VcJH816GluzpcbC8BPs9avQ/zG5cyI8K3JIRy+qr8vRKykWGCLxYSeDFXZpwQs4Gpg
         XE1A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792076962; x=1792681762; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g+la5oRry/ejNEDlylEClTFnvYZE1MGV2kYV0bWmL7E=;
        b=fRmX2i7+Fy1JcIEWBDvXaNJMocYdaY9QZ/hHVe1Cr9dlFm97OwBgIGBn8rxQhyfz1k
         k9SWu1AzNMrd2EsXUa69lUKIUe0SDAHyVLHh5vV3d0BPIXKJaX19cm7kXMLmvxOqUi9D
         sBJmBtgtQHkybo/LWBaLkzW5BTN7yYGuE9+drBJwx6SJwz2Eoh1OCNlTrWQMkfEovqyn
         QsdaFBxk7fO2SAEL83Lnv0VzkIPZ6z6nKtedpueDsB+PQ0jrUhJMOH6dKahak7Ibnatx
         u17KjZDblHuEnOxtQsFeFpqXTAM6KSNgt+N1uZyYYUuoA/zwRFl7KIE+m2WtwNLKBptr
         6y6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792076962; x=1792681762;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g+la5oRry/ejNEDlylEClTFnvYZE1MGV2kYV0bWmL7E=;
        b=hztv2som3ZIfQUVu/dUoHZBbOjj9qm+VQITowuZjfCe177VPMArMbuLSOUmxxawm+l
         KJ36PgYkBf8PVbX4iCjlH60kyxz67yHo/RRfW3QEnpBHaOLz+qtJ/QZLotPsDJQh12iq
         FMh0EthxrqDRvdNHhFoHliveuC87NiDOnq5UTXkcDZ5tUs3K22u33+Uob2XinmvsmSxE
         1EbjOBZXCzLa/eRFUGIAd6DA07Je27DHugeP/hIy46vODs6jTATE5QzGk+m6M2sCwazN
         aIwcgoG09A38yFEdApLS7PziyotTmlNbx1PKKGAJNT2/aNvC/M9dv0lePVu1Rs+Qvehr
         lUVQ==
X-Forwarded-Encrypted: i=1; AKwUvByU7CXin05UMsqV88KRYEd4osRUGbJCry14Ea8LgQcUnUoy5/ks61DR658sbM5Fi4dw8TO+r2u4GbRfZrd++Agd@lists.infradead.org
X-Gm-Message-State: AFq9FYKnZr0+4GO4lOIKolz6gXE2HlRN/5cbCMO9peEcm4trqDuT3HVJ
	m4O9U7bNFzVbXJgj2Q0bsh/SBHsxBSIguhj/X64jSIUAsTNrdqCl7Ajjl2lqL5QMa2dvd2dzqhG
	ycKk30nE8iHcmaNERPBDGlGNnOIom+RI=
X-Gm-Gg: AYBFou3nuXkNhKCf8buco3TqnQq7rBc6pgUErcesae1vI78OF3vBJixXg4Hd5Uy1nny
	On9w9S2Bh8wQONN5gCibKxIMqWuxVzEripgfAgIQ00/d2KrMAIH4AThc3uft/G4G3gse+yMX/E5
	oVSM7rsyQftscinodhiav7urdA7Sh5GhdrdFxWFwDTLZqG0/iJTlZvqSdvmJfZzw7pOtysPafMR
	zD5HVHBA3vW6sGhD7Dk5Rm7SonU9PIWC9bAzXk26ARsxwmnpuB6apnFWkfI3W/awT3oQc3eiBA6
	LR1rRD4Zvd+gtNREjHoPsLnPq6JKc0b07sebVMwx/v1ccmVCzK605k73KrvJaG9uk+ocyZDfc+S
	KGwfnkIOfCluCW8ffoOwKnxYx66GeLaWFTGPQMR2GiVd4Ninp5R5Z66B88Aq2W7gF3ii6niustE
	qew8KjgXxux+KE+7vCPrRNnRrkgmSrcUDHwYvzdVTvDePg
X-Received: by 2002:a67:e713:0:b0:7b4:bdf5:9307 with SMTP id
 ada2fe7eead31-7cb3a17c668mr4997492137.30.1792076961441; Thu, 15 Oct 2026
 08:09:21 -0700 (PDT)
MIME-Version: 1.0
References: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-0-5d3fc6ad2da1@gmail.com>
 <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-4-5d3fc6ad2da1@gmail.com> <20261015071943.7OihPadq@linutronix.de>
In-Reply-To: <20261015071943.7OihPadq@linutronix.de>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 15 Oct 2026 09:09:08 -0600
X-Gm-Features: AclHuK-qAIJ8Ws5pW7BZAdTu8Nckn4yY6BNzqqth23CDA7sDTjbDwYfiY-Jvt6s
Message-ID: <CADvTj4q9cqLY5fB=u+ZdS4K18V3T-AuQ=_6aMNOgcMyXC8yYeg@mail.gmail.com>
Subject: Re: [PATCH v7 04/16] mtd: rawnand: sunxi: drain interrupts before
 reusing the completion
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Clark Williams <clrkwllms@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Ripard <mripard@kernel.org>, Richard Genoud <richard.genoud@bootlin.com>, 
	Boris Brezillon <bbrezillon@kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, 
	Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_080923_502114_D4070DF2 
X-CRM114-Status: GOOD (  22.73  )
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

On Thu, Oct 15, 2026 at 1:19=E2=80=AFAM Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
>
> On 2026-10-14 19:33:51 [-0600], James Hilliard wrote:
> > --- a/drivers/mtd/nand/raw/sunxi_nand.c
> > +++ b/drivers/mtd/nand/raw/sunxi_nand.c
> > @@ -454,16 +457,19 @@ static int sunxi_nfc_wait_events(struct sunxi_nfc=
 *nfc, u32 events,
> >               timeout_ms =3D NFC_DEFAULT_TIMEOUT_MS;
> >
> >       if (!use_polling) {
> > -             init_completion(&nfc->complete);
> > +             reinit_completion(&nfc->complete);
> >
> >               writel(events, nfc->regs + NFC_REG_INT);
> >
> >               ret =3D wait_for_completion_timeout(&nfc->complete,
> >                                               msecs_to_jiffies(timeout_=
ms));
> > -             if (!ret)
> > +             if (!ret) {
> > +                     /* Drain the handler before it can restore an old=
 IRQ mask. */
> > +                     disable_irq(nfc->irq);
> >                       ret =3D -ETIMEDOUT;
> > -             else
> > +             } else {
> >                       ret =3D 0;
> > +             }
> >
> >               writel(0, nfc->regs + NFC_REG_INT);
> >       } else {
> > @@ -476,6 +482,12 @@ static int sunxi_nfc_wait_events(struct sunxi_nfc =
*nfc, u32 events,
> >
> >       writel(events & NFC_INT_MASK, nfc->regs + NFC_REG_ST);
> >
> > +     if (!use_polling && ret) {
> > +             /* Flush the mask and acknowledgment before re-enabling t=
he IRQ. */
> > +             readl(nfc->regs + NFC_REG_INT);
> > +             enable_irq(nfc->irq);
>
> Shouldn't you re-read NFC_REG_ST, checking if the event became true even
> in the case of a timeout?
> Say the interrupt wake the thread but the thread never had a chance
> to run. The timer (on another CPU) had a chance to run and did wake this
> thread. Checking the event in the timeout case would help to prevent
> that.

Yes. I've folded a recheck into the IRQ fix for v8, after draining the
handler but before masking and acknowledging the controller events.

One detail is that the handler acknowledges each event and removes it
from NFC_REG_INT. For transfers waiting for both command and DMA
completion, one event may therefore have been consumed already.
Checking status against the original event mask would miss that case.

The timeout path now checks only the remaining enabled events:

      if (!ret) {
              u32 pending, status;

              disable_irq(nfc->irq);
              irq_disabled =3D true;

              pending =3D readl(nfc->regs + NFC_REG_INT) & events;
              status =3D readl(nfc->regs + NFC_REG_ST);
              ret =3D (status & pending) =3D=3D pending ? 0 : -ETIMEDOUT;
      } else {
              ret =3D 0;
      }

An empty remaining mask also counts as success: it means the handler
processed all requested events while the timeout path was draining it.

irq_disabled is initialized to false at function entry. After masking
and acknowledging the events, cleanup uses that flag rather than ret:

      if (irq_disabled) {
              readl(nfc->regs + NFC_REG_INT);
              enable_irq(nfc->irq);
      }

That preserves the write flush and ensures the IRQ is re-enabled even
when the recheck changes the timeout result to success. Successful
waits and polling are otherwise unchanged.

>
> > +     }
> > +
> >       if (ret)
> >               dev_err(nfc->dev, "wait interrupt timedout\n");
> >
>
> Sebastian

