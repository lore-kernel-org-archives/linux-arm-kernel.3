Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20E4EC02196
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 14:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a6qovICTGPEEjhTN07umz778RBWf4L4gwOU9re+tr4g=; b=IxcqJVhPmaR8dlyABgAM0cDuh1
	xJOdgjE2jxSNVr/2aonR1iEaoSC2AScUFlOkX0e89cPQSQxt4l38ByIUot4tnlN6/c3gXQFoqR2bX
	jwP8t7Spg74gMWLKKwtjLYdaiJLeoAnyQoRRZD0YxokOnRHBAaSxNmzHzCWR9wJ65Yatco0nPjCv0
	lzwniZc2Uyq3dEKczbRf0okgnaHyZOnLtWIfveCn03i5/VucCtyWv0gV3ssc59cKc6bYb1sHOtcnT
	Uwu6exXmG9Fiv+vqSX70DUgj0f3W5tiE5QrROvO6bylYwCistYgdZntJ4R4AaOkmXN5ePelQfwja3
	hbv6Q71Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfKGy-00000000iSS-2pW9;
	Tue, 04 Feb 2025 14:51:32 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfKFc-00000000iEm-2jzI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 14:50:10 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-30613802a59so62637751fa.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Feb 2025 06:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738680606; x=1739285406; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a6qovICTGPEEjhTN07umz778RBWf4L4gwOU9re+tr4g=;
        b=eI7RdI8UXqQ0wGDRArleC9vlbR/fdxhhIdhtcdK1jcvMkjCynCRcEdF0GDgHShK/B3
         oIDgsgCBJacCshbzoQ3PhH9nqDi+NNQAwmGcKzg/dVvNmZmGMMiHss4QmA1bKKIqk+LB
         GQbmrwz9wUbHYEdOuCOWlEVWvJMPqYmb8A+3P2fUZE3YNG0MU54RuY32qeAQtKtyMExi
         VGXyLifzsPW25qUnJLxxxu4vuDKEufs06yzNy11KjVbhvc4UhZWG/IaolgeQf9Y2sKTE
         AOgvGXWRMryeaUnui/7EVJVLbU4tw0dKtKj6Fp6SvMGve5lJ+7V0IDvj2p/8nJM0raAY
         zQIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738680606; x=1739285406;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a6qovICTGPEEjhTN07umz778RBWf4L4gwOU9re+tr4g=;
        b=SWsrSaJNwkgWCgn4lrdVVxnPCdf50mhDBs5ym05B7MESfFrhopzUlqejKEGVG5Y1jz
         5Lw62ZnmjeDuBtrD94xNnID6Ch8E+D2GJjO9BC/Bmn7HVFA538GrrraR29G4IfBfyOEP
         QNy7k7L4lILnJus5t2o4+x0Dc1OsHvWTVjn5gxRB7LCpLkI6Rl/iuADxncUO+aArdvFM
         dQf4mStVyqEG/oaJq6U+JRVNKETeMDPFke71fOlilRF5oX2PB03oJjjCgmNsQh8sz8Vt
         OdLXhd3h3b1aWL6mUysgu3NHgNssJdIzBvw5YhERnWNofo2MhxJlu/7+pF2bpkQpS6yf
         5OpA==
X-Forwarded-Encrypted: i=1; AJvYcCWdVrsB5C78Pf+C2dAH6YXhq2hCniWuvZ2CucSwRHEFkzUOhAvyBsmxQTtGuOAqypFpbTuv/eEMS8N8N1d3JkxD@lists.infradead.org
X-Gm-Message-State: AOJu0Yxr0pOgZku01Me0PExVqVpEr89+OmrcLoLb5YRy+Utzecg3a2C3
	SDXn6wr6gXdbFqm5rcbVqc4fOHv59chI5r1Nbp81qK26fC17ZTPUlao4iJ0l3V+1jGbZ7U8HAmh
	x+HfDp6RJz2ZaJnJ5jzm1GxU88JmPatgU+K8yJg==
X-Gm-Gg: ASbGncs0SYrlUO3Y8sECFvmfeONhk16Jw9Y1HcutZ5jEX2YBZGO2OqVdAg39VqtiZxe
	az+a/NpNy1GkRng9Sf4EhWg5aauedDoM5p0SHFizajzencX256FUQ5kx6FUZN/ut5Vd5L2gQDqQ
	==
X-Google-Smtp-Source: AGHT+IHDEbsYQipfejXqFohjxLWs79QcoPD2kP+1yrW9qYk9n/SN/qyoP+wLyuKonmtT1FmQCmqnzeGwlD2OFASKWU0=
X-Received: by 2002:a05:651c:2115:b0:302:3a28:76cf with SMTP id
 38308e7fff4ca-307968e725emr115509751fa.25.1738680606043; Tue, 04 Feb 2025
 06:50:06 -0800 (PST)
MIME-Version: 1.0
References: <20250204075405.824721-1-apatel@ventanamicro.com>
 <20250204075405.824721-11-apatel@ventanamicro.com> <87o6zinl5o.ffs@tglx>
In-Reply-To: <87o6zinl5o.ffs@tglx>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 4 Feb 2025 20:19:53 +0530
X-Gm-Features: AWEUYZnsP5bIEqfYtAEgSHeeevhnHrIfy83h-jtA8at0gwbWoWLEsA0X1oOoSQI
Message-ID: <CAK9=C2VgOnSVBRPh+bJBQnGreVYcUh6HWVg1MEzDtfYsuT0s-g@mail.gmail.com>
Subject: Re: [PATCH v3 10/10] irqchip/riscv-imsic: Use IRQCHIP_MOVE_DEFERRED
 flag for PCI devices
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Marc Zyngier <maz@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Atish Patra <atishp@atishpatra.org>, 
	Andrew Jones <ajones@ventanamicro.com>, Sunil V L <sunilvl@ventanamicro.com>, 
	Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_065008_684705_9803F2B3 
X-CRM114-Status: GOOD (  32.72  )
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

On Tue, Feb 4, 2025 at 2:26=E2=80=AFPM Thomas Gleixner <tglx@linutronix.de>=
 wrote:
>
> On Tue, Feb 04 2025 at 13:24, Anup Patel wrote:
> > Devices (such as PCI) which have non-atomic MSI update should
> > migrate irq in the interrupt-context so use IRQCHIP_MOVE_DEFERRED
> > flag for corresponding irqchips.
> >
> > The use of IRQCHIP_MOVE_DEFERRED further simplifies IMSIC vector
> > movement as follows:
> >
> > 1) No need to handle the intermediate state seen by devices with
> >    non-atomic MSI update because imsic_irq_set_affinity() is called
> >    in the interrupt-context with interrupt masked.
> > 2) No need to check temporary vector when completing vector movement
> >    on the old CPU in __imsic_local_sync().
> > 3) No need to call imsic_local_sync_all() from imsic_handle_irq()
>
> I have no idea how you came to that delusion.
>
> IRQCHIP_MOVE_DEFERRED is part of the mechanism to handle this insanity
> correctly. It does not prevent the device from observing and actually
> using the intermediate state. All it does is to ensure that the kernel
> can observe this case and act on it.
>
> The fact that the kernel executes the interrupt handler on the original
> target CPU does not prevent the device from firing another interrupt.
> PCI/MSI interrupts are strictly edge. i.e. fire and forget.
>
> IRQCHIP_MOVE_DEFERRED solely ensures that the racy affinity update in
> the PCI device happens in the context of the original target CPU, which
> is required to handle all possible cases correctly.
>
> Let's assume the interrupt is affine to CPU0, vector A and a move to
> CPU1, vector B is pending. So we have three possible scenarios:
>
> CPU0                            Device
> interrupt
>                                 1) Raises interrupt on CPU0, vector A
>   ...
>
>     write_msg()
>         write_address(CPU1)
>                                 2) Raises interrupt on CPU1, vector A
>         write_data(vector B)
>                                 3) Raises interrupt on CPU1, vector B
>
> #1 is handled correctly because the interrupt is retriggered on CPU0,
>    vector A, which still has the interrupt associated (it's cleaned up
>    _after_ the first interrupt arrives on CPU1, vector B).
>
> #2 cannot be handled because CPU1, vector A is either not in use or
>    associated to a completely unrelated interrupt, which means if that
>    happens the interrupt is lost and the device might become stale.
>
> #3 is handled correctly for obvious reasons.
>
> The only way to handle #2 properly is to do the intermediate update to
> CPU0, vector B and checking for a pending interrupt on that. The
> important role IRQCHIP_MOVE_DEFERRED plays here is that it guarantees
> that the update happens on CPU0 (original target). Which in turn is
> required to observe that CPU0, vector B has been raised.
>
> The same could be achieved by executing that intermediate transition on
> CPU0 with interrupts disabled by affining the calling context (thread)
> to CPU0 or by issuing an IPI on CPU0 and doing it in that context. I
> looked into that, but that has it's own pile of issues. So at the end
> moving it in the context of the interrupt on the original CPU/vector
> turned out to be the simplest way to achieve it.

I got confused because IRQCHIP_MOVE_DEFERRED updates affinity
with the interrupt masked which I interpreted as masked at the device
level. Also, PCI MSI mask/unmask is an optional feature of PCI devices
which I totally missed.

I will keep the intermediate transition in the next revision. Thanks for
the clarification.

Regards,
Anup

