Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D75BE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 15:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y0ijAsgfcCAkYLFOhSL209z2mytAy3LE8Gke6LPHkUA=; b=2aBNg3z/xfQnLg9QxfVPxduBek
	mnpVjHSCsr4eBgP3wwZ9GtX0Clfo/NYArmysRZlEhQskiifHG+CqbQipIvqSE1lRztPdc29hF0h4/
	lTSIz6HcYeLibQCDFV4LfzXBLoeNMp0Z3bOc9sE/p8SJLNYQRvzLEIkR2I4WmKLl1in2O0CUoXKQ8
	JRji8dZSB/E1d2L29aQctTlZ8sm18LRBQLIZVysm7YeoLfTYn0stY/MRUX9es6r4aq/HnTIpHj5O4
	enKrV+K1t+HTjoxQFrxt+0z8d8J95/WQHWdLQWZZQstKB7qY21s6TXKDRGn0WKV3xr92po8qDde+V
	P/ohmI7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM7qt-00000004JGO-0CuN;
	Fri, 13 Dec 2024 15:45:15 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM7pm-00000004Iz6-0oii
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 15:44:07 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-53e3778bffdso2038469e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Dec 2024 07:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1734104644; x=1734709444; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y0ijAsgfcCAkYLFOhSL209z2mytAy3LE8Gke6LPHkUA=;
        b=ORO1mgCe/AGB4DqVuqUPWQeB+Oo/E111CahmsxFdTCKYGQj2hQGPjVKBY1rFlMW92u
         SrbRFT3ZhAXdZCUnMiW4F+RyOhKR2ifVZlDx2ctLAw5lE6aEWUmDd73ccqK5fHkPY5Mu
         vV7hwloglj+V2LMD+schN3c5g2mcb84jxq3voYwucw5IYWUFrE0Yc7ifw/rB7p2nPTFN
         hi+DNIGuDrLlw2ym1/h/MemchbTXgtyBPnq4Hk3+BpAX5Hs8cUov7fCah9dP0r6fhTTi
         NZWOBm9JIIs348+xLvk1YqRUyjDAjg/jBAxV4gbhh/n+NtS2HfzWBOUmy6Dpmm1AnK7q
         Gj3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734104644; x=1734709444;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y0ijAsgfcCAkYLFOhSL209z2mytAy3LE8Gke6LPHkUA=;
        b=f2AQ9h+xzaGi3DEnjO0gjwVZ+TRj4cZmqCFw8pUh+znMEwYg4NBdj7Yd5VDKa1iygm
         DIQ6uKgQ4yFSh1Q0YNMXiVx8dehGtEirBL39iZ8fzTxps5uJS+tExx0Ckbc/A7paucdr
         Q53S9XsF5cXwQpugK4863cF++WN7iZJFFu8MFHvI6vpWSQhF3zJ4Q9UL3pX0u5auMSd5
         OR6frkrrWBJnX5GkhOEcObLg8KAPa1+D0Rhus9d6iYX3kcPlK1t/gxR0zfw8NtL286Nx
         2jmjrKzEk6hL3T/WyIMmoc+yXvd5ut5caXowiXD3rscHGrVxB0MPzrLlhWk/Ut2Clu+O
         QtWg==
X-Forwarded-Encrypted: i=1; AJvYcCUJIBOJJ9EtVrZpJjauJRsHjx316VTNRBUMXvj+yrOtLNl/ysHyK1aOMEZuyqRleUmq/P+vHtOPeF82Z5K0QnHF@lists.infradead.org
X-Gm-Message-State: AOJu0Yxbz3/C3Tz+pwePQwNmUJLXo29gVUOSVLI1o/WmpA2AkVXqAyS3
	ooy+U5GmQNhI3mDdgKEcEVsi8zak2cwOJqmfW5SrzKTNcrPmqriSjXcL/KMJNTFVoDLTZDm7SnH
	KXj/DnH+S4ZMgcTY9AOPHs6sTFb7fMHf781xA8EEwjeIXyrU3
X-Gm-Gg: ASbGncuywP8YnyjfFeq8cfHpW3VNRxTJwZkROac2SRyYfs7GLEivvzeyM21TUvAdLhf
	W8AtIyeKAnd7rNGhhIUdLLXiYURkP89kbgEueVfU=
X-Google-Smtp-Source: AGHT+IFTUSDlblXeHlfVDe8niGAxTlpQ6jMgiT9dHwTwMbW1zIwAk0PUlMzR2hff1vm/DrjTiJgiQiYP2mI3M++ExsU=
X-Received: by 2002:a05:6512:39cc:b0:540:2f59:7561 with SMTP id
 2adb3069b0e04-54099b699d2mr968768e87.50.1734104644176; Fri, 13 Dec 2024
 07:44:04 -0800 (PST)
MIME-Version: 1.0
References: <20241208150711.297624-1-apatel@ventanamicro.com>
 <20241208150711.297624-2-apatel@ventanamicro.com> <875xnuq6dc.ffs@tglx>
 <CAK9=C2VqU2mdLL-R20bdgvDHi0WcuNyUSqRo7Pztsu-8X1wVvw@mail.gmail.com>
 <87r06gq2di.ffs@tglx> <CAK9=C2XEhtB00y6WTMaO0X=7K820T_BSCLA5bw6hJbfvQAD+Pw@mail.gmail.com>
 <877c84ade6.ffs@tglx>
In-Reply-To: <877c84ade6.ffs@tglx>
From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 13 Dec 2024 21:13:52 +0530
Message-ID: <CAK9=C2Xyqk1WRHTXa_74s1uWuuMP5d=RBpnoSREvuF=C3OWW_A@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20241213_074406_233473_70161AD2 
X-CRM114-Status: GOOD (  21.18  )
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

On Fri, Dec 13, 2024 at 1:21=E2=80=AFAM Thomas Gleixner <tglx@linutronix.de=
> wrote:
>
> On Thu, Dec 12 2024 at 22:11, Anup Patel wrote:
> >> --- a/kernel/irq/chip.c
> >> +++ b/kernel/irq/chip.c
> >> @@ -47,6 +47,13 @@ int irq_set_chip(unsigned int irq, const
> >>                 return -EINVAL;
> >>
> >>         desc->irq_data.chip =3D (struct irq_chip *)(chip ?: &no_irq_ch=
ip);
> >> +
> >> +       if (IS_ENABLED(CONFIG_GENERIC_PENDING_IRQ_CHIPFLAGS) && chip) =
{
> >> +               if (chip->flags & IRQCHIP_MOVE_DEFERRED)
> >> +                       irqd_clear(&desc->irq_data, IRQD_MOVE_PCNTXT);
> >> +               else
> >> +                       irqd_set(&desc->irq_data, IRQD_MOVE_PCNTXT);
> >> +       }
> >
> > We need similar changes in irq_domain_set_hwirq_and_chip()
> > because we use IRQ_DOMAIN_HIERARCHY in RISC-V.
>
> Grr, you are right. Let me add that to the base patch.
>
> >>         irq_put_desc_unlock(desc, flags);
> >>         /*
> >>          * For !CONFIG_SPARSE_IRQ make the irq show up in
> >> @@ -1114,16 +1121,21 @@ void irq_modify_status(unsigned int irq,
> >>         trigger =3D irqd_get_trigger_type(&desc->irq_data);
> >>
> >>         irqd_clear(&desc->irq_data, IRQD_NO_BALANCING | IRQD_PER_CPU |
> >> -                  IRQD_TRIGGER_MASK | IRQD_LEVEL | IRQD_MOVE_PCNTXT);
> >> +                  IRQD_TRIGGER_MASK | IRQD_LEVEL);
> >>         if (irq_settings_has_no_balance_set(desc))
> >>                 irqd_set(&desc->irq_data, IRQD_NO_BALANCING);
> >>         if (irq_settings_is_per_cpu(desc))
> >>                 irqd_set(&desc->irq_data, IRQD_PER_CPU);
> >> -       if (irq_settings_can_move_pcntxt(desc))
> >> -               irqd_set(&desc->irq_data, IRQD_MOVE_PCNTXT);
> >>         if (irq_settings_is_level(desc))
> >>                 irqd_set(&desc->irq_data, IRQD_LEVEL);
> >>
> >> +       /* Keep this around until x86 is converted over */
> >> +       if (!IS_ENABLED(CONFIG_GENERIC_PENDING_IRQ_CHIPFLAGS)) {
> >> +               irqd_clear(&desc->irq_data, IRQD_MOVE_PCNTXT);
> >> +               if (irq_settings_can_move_pcntxt(desc))
> >> +                       irqd_set(&desc->irq_data, IRQD_MOVE_PCNTXT);
> >> +       }
> >> +
> >
> > These changes in irq_modify_status() need to be dropped to support
> > the above changes in irq_domain_set_hwirq_and_chip().
>
> Why? With CONFIG_GENERIC_PENDING_IRQ_CHIPFLAGS enabled this hunk is
> compiled out. So nothing is modifying PCNTXT here. That's the whole
> point.
>

Understood, please ignore my previous comment.

I was using irq_set_status_flags() in irq_domain_set_hwirq_and_chip()
which did not work because irq_modify_status() did not modify PCNTXT.

Regards,
Anup

