Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A3D2E77180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 17:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o5kF3A0mcCtzDysahXl4uMuj8y+benJqJoE125oESxI=; b=bxCpHuaOyeogR0iJk4NcHrVQhr
	O65ZQxnzpwCdsfr/xnLf+TE6qwL9YqVq1tMf8G53t9v0u5o0Y4XfyoTHDLnvmToum1JzmgK8VDsaM
	wBHwiXgX1W9LLK1cNsVmPMtRQ/jDjEPDaXcQFyMGHmf3s3pdzLcno5NvxhfP2HImYOX4AJ8eFa3D/
	m1b6NZmK7PHFs1POVnKWkVOfde3cMTQ8Mu1uLl5yTi+8ECvSbJgUQdkb0iUn+Hl8+vw0LlQ7ug/pa
	xBQt5RqEfGbCPvhRPkMK1lAkOiobKx3O6J83VzkE9AliKH9tZzEOcRQD6zXC+iHRFy1fGCFAnaOLw
	CjwVqDlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLn20-00000001Bxd-1Hg1;
	Thu, 12 Dec 2024 17:31:20 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLmFY-0000000117s-046q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 16:41:17 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-5401ab97206so842009e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 08:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1734021673; x=1734626473; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o5kF3A0mcCtzDysahXl4uMuj8y+benJqJoE125oESxI=;
        b=VZzxUFdm2wrB4h+XYz/8NxJdGOYM1LgvA/iRr//+SbP6AJolcAuvpuVhcCkCZrIPhe
         giQo8uxaVSuGIl7xkWFW2BYomfhaDyD6slU2zFKLiUuj9rBF0w6FiImYxOx1uJerM1E8
         RZry8IUuquoos5kJ/hIKJLDrdk7Pp007rC8a4UU4fZAQlNVV4BojaHH8pXIwcV4lPMMZ
         EwT2HTINrSXArUzZCKxBlh0a/UNttgHALn+knhwvV1/i9ZrWGLg/Vvybpt+FNBRsqp89
         0o6ciLyvLMbB+xXG8W6fF02ScCz4r94HYnobZTGLGWrSuX98mV12/Hj2t4sbgm0yqniK
         EZBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734021673; x=1734626473;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o5kF3A0mcCtzDysahXl4uMuj8y+benJqJoE125oESxI=;
        b=IBXt2VahYEv3aVP8Vniyii3/76pmTotfuAdoFwWwug97yuCnnay4bDqijZ50EqaGXm
         PbnK+RtM6THPFdSDdJRHt5ZwiC6gkC20CwfLxipvMwD4MHEb4JR6EdiVDqlikFBzZnWe
         b0OhypXTpYo6m+ngOkl6dnrrSXgZpREXg79D7PaDGqI5aSr1hTMkI108qhgmxKsxZSYe
         jbinav9zNUdPmxlkekupgafmb8WjCh4bStLpz64QsDr2HD3Sma6SEdZXVBtRmgWYe8Ds
         +FfbfBkaoAS5r7Zf1TCXvpqNg3WYpJauijCC2zVSS0Avdy6QPNNib0qYPsoxW+lk6rWG
         fnSg==
X-Forwarded-Encrypted: i=1; AJvYcCU7ol74SyxbaEb5UFScqLq6FkDuAc8LjhL/Oga/RvjqharvGhi1UpPLJG5qdEzQk47Gz2yhveY0NITFjludL0HF@lists.infradead.org
X-Gm-Message-State: AOJu0YxK6WhZ4mnE3rzOSabuR+9+IdnR3qY68uCRDKXVqUuSPlTA2tlP
	pA2FiXlwyky8B+T67lUGbv4Ex6v1XNnN5GLUuUyg9E8+g9KamB3NF6RC8juw4IgvMa0P2iUp5/2
	dzmbkUcJbs8YH4O074D55aYeEhvaz6YwM/NxawA==
X-Gm-Gg: ASbGnctmt4BGDMNXmi79QTx5NA5gOSQ0zSY5XqWGC3x87pV+AfTfeB1JYEavi8FLwm2
	OuBSi9Bk9SzWxz5/My5pBpnTzTG0yhNQG6YaXCZ+O
X-Google-Smtp-Source: AGHT+IFcKdSrqT7xgQwrQlOlaQ2f5WNANwnYfOWWoePQcrKU9KH6N2PbU7UTt7twJeYpTYL40SC+Ctc9RsAiiKycytg=
X-Received: by 2002:a2e:7809:0:b0:300:1bf1:df23 with SMTP id
 38308e7fff4ca-30251e0df39mr2768441fa.12.1734021673243; Thu, 12 Dec 2024
 08:41:13 -0800 (PST)
MIME-Version: 1.0
References: <20241208150711.297624-1-apatel@ventanamicro.com>
 <20241208150711.297624-2-apatel@ventanamicro.com> <875xnuq6dc.ffs@tglx>
 <CAK9=C2VqU2mdLL-R20bdgvDHi0WcuNyUSqRo7Pztsu-8X1wVvw@mail.gmail.com> <87r06gq2di.ffs@tglx>
In-Reply-To: <87r06gq2di.ffs@tglx>
From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 12 Dec 2024 22:11:01 +0530
Message-ID: <CAK9=C2XEhtB00y6WTMaO0X=7K820T_BSCLA5bw6hJbfvQAD+Pw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20241212_084116_057658_3D00565F 
X-CRM114-Status: GOOD (  43.14  )
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

Hi Thomas,

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
>
> I think we can reverse the logic here. As this needs backporting, I
> can't make a full cleanup of this, but for your problem the patch below
> should just work.
>
> Select GENERIC_PENDING_IRQ and GENERIC_PENDING_IRQ_CHIPFLAGS and set the
> IRQCHIP_MOVE_DEFERRED flag on your interrrupt chip and the core logic
> takes care of the PCNTXT bits.
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

We need similar changes in irq_domain_set_hwirq_and_chip()
because we use IRQ_DOMAIN_HIERARCHY in RISC-V.

--- a/kernel/irq/irqdomain.c
+++ b/kernel/irq/irqdomain.c
@@ -1509,6 +1509,13 @@ int irq_domain_set_hwirq_and_chip(struct
irq_domain *domain, unsigned int virq,
        irq_data->chip =3D (struct irq_chip *)(chip ? chip : &no_irq_chip);
        irq_data->chip_data =3D chip_data;

+       if (IS_ENABLED(CONFIG_GENERIC_PENDING_IRQ_CHIPFLAGS) && chip) {
+               if (chip->flags & IRQCHIP_MOVE_DEFERRED)
+                       irq_clear_status_flags(virq, IRQ_MOVE_PCNTXT);
+               else
+                       irq_set_status_flags(virq, IRQ_MOVE_PCNTXT);
+       }
+
        return 0;
 }
 EXPORT_SYMBOL_GPL(irq_domain_set_hwirq_and_chip);


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

These changes in irq_modify_status() need to be dropped to support
the above changes in irq_domain_set_hwirq_and_chip().

>         tmp =3D irq_settings_get_trigger_mask(desc);
>         if (tmp !=3D IRQ_TYPE_NONE)
>                 trigger =3D tmp;
>
>
>

Let me know if you have alternate suggestions instead of the above changes.

Regards,
Anup

