Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0716AE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 17:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2dQoNlSLU0HPpFMCspBWlxi64Lg9FL6brLFfxEcaxG8=; b=QjA9I7b2PPil1kxlC49O2f8bmX
	DIEjRGYlaK2kEvg4ILQYnJBNgyrOsMBIdQaVWV846mlesX0qQAuP0rluLxJbg5U0xyhQp46AAnZyA
	jRUceICZJ860d9NZJR9JP2256ccKyTEQA3/QH4o6NAG83W6OauVHc6jWkCsvjKk/ikXHCRfK3uD/r
	NxCe5Q8ppZdiCkoJVKIhvAU+ySh1lgiOLh5XweOPgd+MkqGMo0eD//Mh2Ms2H41QsJrybl2VoB1EF
	s7ZbA7NbmPA0Avs5t+2hkJ8G/GkfS5boIZj6CftjgTt9p4cZJtlV+60iylv74iNVZmswOcfjqoh1e
	SqcE8X8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKhI7-00000008gNh-2ol0;
	Mon, 09 Dec 2024 17:11:27 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKhGD-00000008fzZ-3LnV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 17:09:30 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-53e3a37ae07so2384196e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Dec 2024 09:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1733764167; x=1734368967; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2dQoNlSLU0HPpFMCspBWlxi64Lg9FL6brLFfxEcaxG8=;
        b=Ek/0EOM9qurHo9zXAW59ikeV5jWk0vZmYDTFA6E/tZpxuPaWuVety1cFAOciuNd/go
         WoE1b9wyK+qc1GPOLJgMecjS3kx4gDGR0OHVYN1oNSTVCCrZputFf7ZTqQwjEEZqTnSA
         btZZact9WNDYWW7PAejSIWWPVFmnQX7PAQr2Al/j7k3QBm4saIpviiRjeGMPaOkTS/pH
         CCjXWOw90SqLQJPmgqBTvcDDZ21R1nJEAT33B2OYssjM902DfLD9dzkrx1A90UUnAHjz
         tcwv25vkcC9emt9C4jxtOI2G7EGRPwBQiGN5wIXe2/RFMsE/aZFxpYeTjwfaErK5MhpT
         P/jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733764167; x=1734368967;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2dQoNlSLU0HPpFMCspBWlxi64Lg9FL6brLFfxEcaxG8=;
        b=bwqNQTxmdmfMKzJxVJqf27MZzfdspwjXdYih3sshfbCYUAhbWb8WvMjE15jdH5jdLo
         IVZS7BpBeWEuvibseaNuehlFUFYBQJHVHbC0elef11jtBVDOPJh6RxwUsNl2XDQfloJK
         jsTzjhbFcm45IflXBiJZ+hDTv6K7QTra+ECJTeifkMeh9UNEFo1jFKb/JoxGS7vv4kM6
         gUscdjwq697mXuBEUJwGjEGqJA3ruEDIE1OTloZvF0hr278TOfF/00JWATsopDwK98UB
         4oH69mG7ci8xXYVcJB8oBkzpc8gTFXACvgEV/I0vgOD8zR9UnHM6x0O/0vQZl0f6Ze8t
         C+zg==
X-Forwarded-Encrypted: i=1; AJvYcCUef9fUXVYO1HrHSdI1LF+jgvCCJrGCfoxg8usmWA0s1ZVGH6bKAThqpSQtQ80p7qAvE8+TqJ4Ql7G5haM0FPwT@lists.infradead.org
X-Gm-Message-State: AOJu0YzirpiYk+5/1OarhFyVG4ilhvdwNI6LaqoKsL2z0oTtXhaYx77P
	eFP+it0adKRPaNVZY8Z6wmW49TcQ8p7FWdxvVecszGJT+zSiuYMSFv7+FnQzbg8ueGtE6HjeXQo
	V6Cl+TG07fu0c7t3iKv+nOeq+CJRsH9BK7DnsdA==
X-Gm-Gg: ASbGncuJEs83mj4PHTRIoxmYZkYsfJ2lC+PYWpUeRNYIl5YgAzNkUMpbo2R3Xmqs12r
	OLeZY+1RgIIU2MWhN74Pc/aFS8YLPVDGjCg==
X-Google-Smtp-Source: AGHT+IG6uSRDfPHJzHiWWjwtpQy8M4+4XudoroPlj5CXYPC49kBjcmD0V2caDVBsCTaJa23u6C6/4BVZxa5RJ8VB4hc=
X-Received: by 2002:a05:6512:acc:b0:53e:3740:4a8d with SMTP id
 2adb3069b0e04-53e37404c0emr3635765e87.3.1733764167141; Mon, 09 Dec 2024
 09:09:27 -0800 (PST)
MIME-Version: 1.0
References: <20241208150711.297624-1-apatel@ventanamicro.com>
 <20241208150711.297624-2-apatel@ventanamicro.com> <875xnuq6dc.ffs@tglx>
 <CAK9=C2VqU2mdLL-R20bdgvDHi0WcuNyUSqRo7Pztsu-8X1wVvw@mail.gmail.com> <87r06gq2di.ffs@tglx>
In-Reply-To: <87r06gq2di.ffs@tglx>
From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 9 Dec 2024 22:39:16 +0530
Message-ID: <CAK9=C2UZKgkA_xZPs2=RBo7bUDKpeY2gBA2j3+S4i4xSLqC5BQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] irqchip/riscv-imsic: Handle non-atomic MSI updates
 for device
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
X-CRM114-CacheID: sfid-20241209_090929_839198_61919870 
X-CRM114-Status: GOOD (  41.16  )
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

On Mon, Dec 9, 2024 at 9:23=E2=80=AFPM Thomas Gleixner <tglx@linutronix.de>=
 wrote:
>
> Anup!
>
> On Mon, Dec 09 2024 at 17:38, Anup Patel wrote:
> > On Mon, Dec 9, 2024 at 1:44=E2=80=AFAM Thomas Gleixner <tglx@linutronix=
.de> wrote:
> >> There is no guarantee that set_affinity() runs on the original target
> >> CPU (CPU 1). Your scheme only works, when CPU1 vector 0x20 is not used
> >> by some other device. If it's used, you lost as CPU1 will consume the
> >> vector and your pending check is not seeing anything.
> >>
> >> x86 ensures CPU locality by deferring the affinity move to the next
> >> device interrupt on the original target CPU (CPU1 in the above
> >> example). See CONFIG_GENERIC_IRQ_PENDING.
> >
> > I agree with you.
> >
> > The IMSIC driver must do the affinity move upon the next device
> > interrupt on the old CPU. I will update this patch in the next revision=
.
> >
> > BTW, I did not find CONFIG_GENERIC_IRQ_PENDING. Is the
> > name correct ?
>
> CONFIG_GENERIC_PENDING_IRQ is close enough :)
>
> >> The interrupt domains which are not affected (remap) set the
> >> IRQ_MOVE_PCNTXT flag to avoid that dance and don't use that affinity
> >> setter code path at all.
> >
> > Yes, setting the IRQ_MOVE_PCNTXT flag in the remap domain
> > makes perfect sense.
> >
> > I suggest adding IRQ_MOVE_PCNTXT usage as part of Drew's
> > irqbypass series which adds a remap domain in the IOMMU
> > driver. Unless you insist on having it as part of this series ?
>
> You need to look at the other RISC-V controllers. Those which do not
> need this should set it. That's historically backwards.

I will update the RISC-V APLIC MSI-mode driver in the next revision.
This driver is a good candidate to use IRQ_MOVE_PCNTXT and
IRQCHIP_MOVE_DEFERRED.

>
> I think we can reverse the logic here. As this needs backporting, I
> can't make a full cleanup of this, but for your problem the patch below
> should just work.
>
> Select GENERIC_PENDING_IRQ and GENERIC_PENDING_IRQ_CHIPFLAGS and set the
> IRQCHIP_MOVE_DEFERRED flag on your interrrupt chip and the core logic
> takes care of the PCNTXT bits.

Sure, I will update.

Thanks,
Anup


>
> I'll convert x86 in a seperate step and remove the PCNTXT leftovers and
> the new config knob once the dust has settled.
>
> Thanks,
>
>         tglx
> ---
> --- a/include/linux/irq.h
> +++ b/include/linux/irq.h
> @@ -567,6 +567,7 @@ struct irq_chip {
>   *                                    in the suspend path if they are in=
 disabled state
>   * IRQCHIP_AFFINITY_PRE_STARTUP:      Default affinity update before sta=
rtup
>   * IRQCHIP_IMMUTABLE:                Don't ever change anything in this =
chip
> + * IRQCHIP_MOVE_DEFERRED:            Move the interrupt in actual interr=
upt context
>   */
>  enum {
>         IRQCHIP_SET_TYPE_MASKED                 =3D (1 <<  0),
> @@ -581,6 +582,7 @@ enum {
>         IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND        =3D (1 <<  9),
>         IRQCHIP_AFFINITY_PRE_STARTUP            =3D (1 << 10),
>         IRQCHIP_IMMUTABLE                       =3D (1 << 11),
> +       IRQCHIP_MOVE_DEFERRED                   =3D (1 << 12),
>  };
>
>  #include <linux/irqdesc.h>
> --- a/kernel/irq/Kconfig
> +++ b/kernel/irq/Kconfig
> @@ -31,6 +31,10 @@ config GENERIC_IRQ_EFFECTIVE_AFF_MASK
>  config GENERIC_PENDING_IRQ
>         bool
>
> +# Deduce delayed migration from top-level interrupt chip flags
> +config GENERIC_PENDING_IRQ_CHIPFLAGS
> +       bool
> +
>  # Support for generic irq migrating off cpu before the cpu is offline.
>  config GENERIC_IRQ_MIGRATION
>         bool
> --- a/kernel/irq/chip.c
> +++ b/kernel/irq/chip.c
> @@ -47,6 +47,13 @@ int irq_set_chip(unsigned int irq, const
>                 return -EINVAL;
>
>         desc->irq_data.chip =3D (struct irq_chip *)(chip ?: &no_irq_chip)=
;
> +
> +       if (IS_ENABLED(CONFIG_GENERIC_PENDING_IRQ_CHIPFLAGS) && chip) {
> +               if (chip->flags & IRQCHIP_MOVE_DEFERRED)
> +                       irqd_clear(&desc->irq_data, IRQD_MOVE_PCNTXT);
> +               else
> +                       irqd_set(&desc->irq_data, IRQD_MOVE_PCNTXT);
> +       }
>         irq_put_desc_unlock(desc, flags);
>         /*
>          * For !CONFIG_SPARSE_IRQ make the irq show up in
> @@ -1114,16 +1121,21 @@ void irq_modify_status(unsigned int irq,
>         trigger =3D irqd_get_trigger_type(&desc->irq_data);
>
>         irqd_clear(&desc->irq_data, IRQD_NO_BALANCING | IRQD_PER_CPU |
> -                  IRQD_TRIGGER_MASK | IRQD_LEVEL | IRQD_MOVE_PCNTXT);
> +                  IRQD_TRIGGER_MASK | IRQD_LEVEL);
>         if (irq_settings_has_no_balance_set(desc))
>                 irqd_set(&desc->irq_data, IRQD_NO_BALANCING);
>         if (irq_settings_is_per_cpu(desc))
>                 irqd_set(&desc->irq_data, IRQD_PER_CPU);
> -       if (irq_settings_can_move_pcntxt(desc))
> -               irqd_set(&desc->irq_data, IRQD_MOVE_PCNTXT);
>         if (irq_settings_is_level(desc))
>                 irqd_set(&desc->irq_data, IRQD_LEVEL);
>
> +       /* Keep this around until x86 is converted over */
> +       if (!IS_ENABLED(CONFIG_GENERIC_PENDING_IRQ_CHIPFLAGS)) {
> +               irqd_clear(&desc->irq_data, IRQD_MOVE_PCNTXT);
> +               if (irq_settings_can_move_pcntxt(desc))
> +                       irqd_set(&desc->irq_data, IRQD_MOVE_PCNTXT);
> +       }
> +
>         tmp =3D irq_settings_get_trigger_mask(desc);
>         if (tmp !=3D IRQ_TYPE_NONE)
>                 trigger =3D tmp;
>
>
>

