Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F200C4451C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 16:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IJoXRdywqN2DaaAN/lfg1M4EsGj3RKn7SLFFiZ5LcSQ=; b=CrPrnDFMmcTLssIbUEUKgZYM/A
	X+S8Y25lh7SExL0wPQCYjTDdl67M38f6oTuN2rhRxn+uQoI0AzNGx6zCkbQX/j/W5zlEcDmUqslK+
	+PRxyYyZsP63owAV9oAGTrTgSa89QJB1uPdUG3aHwMvCFVTlC7lKrEhiliDjguLeqPzyw14zHgNq2
	Mw97idQQHbw3N961WP7FuZXPpH+/w0Eo4yek07iEeWo8b1fvTwVHIHCP/KghEYdVWthxgJ/ouYFFI
	GxjGYAbpNc+b0xpB9NIFRK7+6WFi48d0UF0cskykX2l66bD/evafqXlgkZjVkOxSahRtlOd5S9/wu
	UpAtPYuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmD2h-00000009r8O-170A;
	Tue, 21 Jul 2026 16:10:03 +0000
Received: from mail-oo1-f43.google.com ([209.85.161.43])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmD2f-00000009r7v-1cIK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 16:10:02 +0000
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6a397db52c1so6613712eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 09:10:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784650200; x=1785255000;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IJoXRdywqN2DaaAN/lfg1M4EsGj3RKn7SLFFiZ5LcSQ=;
        b=AST7wy4/x7E5Apsygu3gxT+KfR1hnD8vLcrrKl8fgi4G6UNrUGpwfVvxEFgS9CzbyS
         mlWlSOGm/foLZaKEif9VhVKndvwR/omskWkfp9LqGLinQEK+Uwc0cfwZT0W4mZam+/vc
         uDyf9xkRTG0rX+h72K8WGjWx2tifeuhs0gjVrPV1SF0waCIQdXnYSD/FLqmmNkGEvFJb
         ZkH/JVtr5uX3nFUvpXokBpvcJvPxkinBG78ZAEP9k/wOT4NZN4QlSEeTMhTqT9QjzYhB
         glqaprKt3jftQx7BUX7H2YQdvFmMlzeRWh1OogKSoXJq3gYocNdVZJu0UxNe8Ir853jF
         apTg==
X-Forwarded-Encrypted: i=1; AHgh+RoyvofXj+VOcqqrMXGwtFsYZ9dEfSZI1X3Trwn6DDwPrNRH7mFvlmnP15dH4fK9frLkNXTdIC/OCT16ovKGodx9@lists.infradead.org
X-Gm-Message-State: AOJu0Yxs1WK7lmAWpWyD7Ds1PPsjRZbbeOA97Q+gIi/sJu+oOceRV1fQ
	u/RQhE3LDQDn6JAhmxXGRQCTy7DyoIeIvt/Cf1+eoZjF/BBiAyARji760wI0ZgSASw==
X-Gm-Gg: AfdE7ckaOMISzhofx7qwMgmBcebvFzj/vxXQ2kYmQlQrWeueksl/FNXt0LZJMi+vekx
	6xIQ+Bp2utTlk0NoHozU+81WQN37bouCNL8k+wDSAOeWIPaMcqJPYviZjDFNz1qJsF9GcuGg5bJ
	wY6hOGaz8QoQHjmade6mbDSwksdw0dxXZ7os4EtdlFEtb/WnfasxBduQJ+hHFSl2YpVvzzB7Y4P
	NuP1ULfe1B503QfGAtSSIeQnKabYfESzZYGwQUzrlSFJb4Q3ily12Zf16JLv3D4Czv4s/sVFbQE
	JvpXovGuPkuZFPslCMs7ChHYn1k7Z00pxAgXvdWYQQbXWzOe+mzsKa/Ac1iJeYGi5PEakFJyCzZ
	E/NnDU+ovzDZvKxDpcrt7LEMigDCXxBA0WgecUhsSc3xVJM4dlxYYBC1Qxpt0MG376j8F1M1zOr
	jkmP26dsZ9uzN1WyuoZECEs1q51z+uCvS+dVUKG5EwwVhHkNDip3pVqO40P98LXwKX1I639sgvS
	Z3NR4/Gly8=
X-Received: by 2002:a05:6820:1507:b0:6a3:8611:8ef5 with SMTP id 006d021491bc7-6a53668e887mr9914976eaf.1.1784650199950;
        Tue, 21 Jul 2026 09:09:59 -0700 (PDT)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com. [209.85.160.48])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4568da4ab47sm11474297fac.0.2026.07.21.09.09.57
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 09:09:58 -0700 (PDT)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-448b89f700fso6642525fac.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 09:09:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Roa9moc6g1sQzFhbcuhPmUvypnFtZ2+4O2GWWj8TGkDLAnkOYIH1n19gPhosghJbvbIN76r3KadT7U3DOSXYeoG@lists.infradead.org
X-Received: by 2002:a05:6871:b09:b0:456:1b93:abfd with SMTP id
 586e51a60fabf-45690474565mr9621422fac.22.1784650197151; Tue, 21 Jul 2026
 09:09:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260720162117.32304-1-fourdollars@debian.org>
 <20260720162117.32304-6-fourdollars@debian.org> <al81PmK1UMr2g8p-@wunner.de>
 <CAAT15mPuO71WbbS2ZpWjceCVj3FUTqHLi3wbbeV7B33JHbPRsQ@mail.gmail.com>
 <CAAT15mPrwAqLmFVF730G+iJugzNzaT=HDj_7G5-wXbhBNU7ANg@mail.gmail.com>
 <f7449a69-98e3-41c0-b535-847b8c520e10@sirena.org.uk> <CAAT15mNppZ6nPQ9a8Hp54XK4BXndfv+G24n4VeQ1X8GOk6fSyQ@mail.gmail.com>
In-Reply-To: <CAAT15mNppZ6nPQ9a8Hp54XK4BXndfv+G24n4VeQ1X8GOk6fSyQ@mail.gmail.com>
From: "Shih-Yuan Lee (FourDollars)" <fourdollars@debian.org>
Date: Wed, 22 Jul 2026 00:09:44 +0800
X-Gmail-Original-Message-ID: <CAAT15mMc73=cnqx7jvPXWjVUuzr-E54qh5+BR3d_G6m3NoXrng@mail.gmail.com>
X-Gm-Features: AUfX_mwDAN5Hdj4ikCE3U0XJJmrKdOPGNrEtPHZTpEhNWKCHoX6RdF9b0NfuO7U
Message-ID: <CAAT15mMc73=cnqx7jvPXWjVUuzr-E54qh5+BR3d_G6m3NoXrng@mail.gmail.com>
Subject: Re: [PATCH v16 5/7] spi: pxa2xx: disable DMA for Apple MacBook8,1
To: Mark Brown <broonie@debian.org>
Cc: Lukas Wunner <lukas@wunner.de>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_091001_467067_07C6F60E 
X-CRM114-Status: GOOD (  33.63  )
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

On Tue, Jul 21, 2026 at 11:26=E2=80=AFPM Shih-Yuan Lee (FourDollars)
<fourdollars@debian.org> wrote:
>
> On Tue, Jul 21, 2026 at 11:05=E2=80=AFPM Mark Brown <broonie@debian.org> =
wrote:
> >
> > On Tue, Jul 21, 2026 at 10:34:20PM +0800, Shih-Yuan Lee (FourDollars) w=
rote:
> > > On Tue, Jul 21, 2026 at 5:26=E2=80=AFPM Shih-Yuan Lee (FourDollars)
> > > > On Tue, Jul 21, 2026 at 5:18=E2=80=AFPM Lukas Wunner <lukas@wunner.=
de> wrote:
> >
> > > > > It would seem better to fix up the incorrect interrupt number in =
a quirk,
> > > > > rather than disabling DMA wholesale.
> >
> > > > I appreciate the comment. Based on the Bugzilla feedback regarding =
the
> > > > incorrect interrupt assignment, it seems fixing the IRQ value via a
> > > > quirk is indeed a better approach than disabling DMA wholesale. Whi=
le
> > > > I am not certain this will resolve the issue entirely, it looks ver=
y
> > > > promising. I will investigate the IRQ mis-assignment problem furthe=
r.
> >
> > > 1. DMAR/IOMMU Validation Failure (Error -22)
> > > On modern kernels with Interrupt Remapping (DMAR) enabled, overriding
> > > pdev->irq to 21 causes the dw_dmac_pci driver probe to fail with
> > > -EINVAL (-22) during request_irq(). This is because the
> > > DMAR/IOMMU strictly validates the PCI Requester ID (source ID) agains=
t
> > > the GSI mapping defined in the ACPI _PRT table. Forcing a device
> > > mapped to GSI 20 (00:15.0) to register on GSI 21 triggers a
> > > source ID mismatch check, which the kernel rejects.
> >
> > That really seems like something we ought to be able to do, though I
> > think the idiom here is to patch the ACPI tables so they are correct
> > rather than quirk things in C code.  ICBW about the preferred approach
> > there.
> >
> > BTW, if you're using a LLM to assist with analysis please don't just
> > paste the output into mail.  Instead make sure you understand what the
> > LLM is saying and write up the salient bits.
> Hi Mark,
>
> You are absolutely correct. The standard idiom for correcting firmware
> bugs in ACPI tables is indeed using the Initrd ACPI Table Override
> mechanism (compiling a modified DSDT with corrected _PRT routing and
> prepending it to the initramfs).
>
> Actually, I was just following Lukas's suggestion to modify
> drivers/dma/dw/pci.c to do a quick proof-of-concept test, and I used
> an AI assistant to help me write and deploy the driver quirk code.
>
> I have previous experience with the Initrd ACPI Table Override
> mechanism, so I can definitely try that on my machine next to see if
> we can get DMA working properly by aligning the PCI routing and DMAR
> mapping correctly).
>
> Also, I will keep your advice in mind regarding LLM usage, and will
> make sure to write up the key points myself rather than pasting raw
> output.

Hi Mark,

I just tested the Initrd ACPI Table Override on the machine. Here is
what I found.

I patched the _PRT table in the DSDT to remap device 00:15.0 (Pin 0
and Pin 1) from GSI 20 to GSI 21 to match the SPI controller's
interrupt line, bumped the OEM Revision from 0x00080001 to 0x00080002
so the kernel would accept the override, and prepended it to the
initramfs.

The override was successfully applied:

  ACPI: Table Upgrade: override [DSDT-APPLE - MacBook]
  ACPI: DSDT ... 007EB5 (v03 APPLE  MacBook  00080002 INTL 20251212)

After rebooting, the DMA controller loaded without errors and both
dw:dmac168 and the SPI controller 0000:00:15.4 now correctly share IRQ
21:

  21: 0  0  0  0  IR-IO-APIC  21-fasteoi  dw:dmac168, 0000:00:15.4

However, SPI transfers still timed out with -ETIMEDOUT (-110) and the
IRQ 21 counter remained at zero =E2=80=94 no interrupts were actually recei=
ved
from the DMA hardware, despite the corrected ACPI routing.

This confirms the root cause is not a software IRQ routing issue but
rather that the DMA controller's interrupt line is physically
non-functional on this motherboard. macOS also does not use DMA for
this device, which is consistent with that conclusion.

It is also worth noting that Apple may have intentionally mapped the
DMA controller to GSI 20 =E2=80=94 an otherwise unused interrupt =E2=80=94 =
precisely
because the interrupt line is not physically connected. On macOS and
Windows, no DMA driver is ever loaded for this device, so the bogus
GSI 20 entry is harmless. It effectively acts as a silent signal to
the OS that interrupt-driven DMA should not be used on this platform.
Since the DMA interrupt line is physically unconnected, no completion
interrupt ever fires, causing all SPI transfers to time out with
-ETIMEDOUT (-110) and ultimately deadlocking the applespi driver.

Therefore, forcing PIO mode via a DMI quirk in spi-pxa2xx-pci remains
the only viable out-of-the-box solution for this platform.

Thanks,

Shih-Yuan

