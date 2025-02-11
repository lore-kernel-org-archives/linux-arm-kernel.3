Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B782C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 14:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RkP+VyXyd2LDTq1dE/e/+i0gFwY3obdySQr3wdtK8hs=; b=jdVlc56Q9NLLlMMy4bVBLyMnCc
	o+SBLqzHKc+UzzOmBaIl/We+WAUN11MX+V9Ppc7S+ZWRt7tC+KYOzkMx4911xk6AWpvD0lqWmatuV
	HKj2iFs/Jzx9Z2i/WTp4FMzdfSMre+R54HSWL4A+nY/12RGTn0pOp5cdfQAW269h7oQwODm2w0muJ
	9ap3eq0WK8Zzaf28UhjCye9a5gmTkZIsx1JIkVNdK5s3IeHXD4IIa+BNW3ms0yNgs7Ff38qJiAk9E
	AeIuD9ObP5U2/3LLzvgpvnbpCWVD1TPcjFnPu5IfEf5MpbZtVlZJyutuQemFGQWEOcLypP4mNP4qd
	qbt/U2gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thrg6-00000004CdD-0gyv;
	Tue, 11 Feb 2025 14:55:58 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thqaK-000000040EO-3JTA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 13:45:58 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-ab7d583d2afso236292566b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Feb 2025 05:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739281555; x=1739886355; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RkP+VyXyd2LDTq1dE/e/+i0gFwY3obdySQr3wdtK8hs=;
        b=UJFRNdh4TEPICDOFQs+BU2nSKtV9uz6cBLM7kG/ZBmqlwAq229py0ssrbnsOFKeF8T
         XowB8BoHABhpjA0BEQbNrh2pnes37ejx67n97SGgCr4FF49Y4o7lbBq392dFVpgsgJtB
         tPv2/AEI4b0lwp65Lo0DehjMOo/LP3FnJxVGKR+HGsVyNuLd+6T4V9FNFT9yYLzCHlRO
         mxJ8FMWBzpjDADnoFRcirfpiit9bP9X1Fy3I6o9xoPUh5MSN924w2FrvI6zHHpV/X5NS
         aQs9BJkbRQgjMxgTtpb3XVWIsST2UA8T93Rn1aESHhhfIPDJFG/Uw/0DnXjBmnDmOBkO
         86Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739281555; x=1739886355;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RkP+VyXyd2LDTq1dE/e/+i0gFwY3obdySQr3wdtK8hs=;
        b=BDYDjSnIG6vaa/Nsm3kpY6Zoeu/t4HaT+NUyt9RIn71qLlhU18YzJfVv8icWao2PW+
         8VSCaNAZJtVo+ZJf/QWwud8KpZgDMcDTZgFDukX0tV+rzeZxYjOMaT+MoX9Rlzaj+SQV
         R6YwkVXUOiLRBhpUDKiXiunPg3cdRLYKmqRp7aACLpuO7px7KafjdTSfr3ixFkmSVa3u
         hyAlAm9n7oRETvY1X5owcJ1fuj/pl3/b9GnYYRapzVVn4g8t/A/omnV7hPpZkgnkpIyc
         pnderM8niah2lxBz4zNhayFL1Eef+aa4K4/7qsysawVrs3bYqFyccPLosdYBsN0apLDL
         Xl7g==
X-Forwarded-Encrypted: i=1; AJvYcCXBii3hRqaeDIQ8vy10ydg1q2HugrOlIemJbDBG+9TUvPz62/wTI+n/5xIzuTyOzCxIgnCYSJ78e7IgWNn5gdCE@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3mzS8mEVKWJT086kJEsTWHiiK1nsaInOZyNTd8s67+SRoBRA1
	6Qagm787GYgouhQSuXaIohX+B9WXdA0lPQepKiICD8NpbBuvBOsVqoTnqS/y9w4=
X-Gm-Gg: ASbGnctxRJWb7S8k3pk7IDJg5Q+OuvucRefuIQmkiLfoBCm+a+GtfpRM/Rf26VECk5b
	hHOP/NUVvoP04/BHdtPNPDRl6VKR89MMeMC0pD+aa1aYsbFIBCtKWed89zntMqmiviRFpz8/Ryk
	OgiERPB6so3UH63+TC4TUSypmFUWEQh0HQDDdrNx1jwcdLhjvN6++y9Qc2bV+13Alwu4cuENzjj
	HdLLuIUru58kF7mIRj962Ug8P6uCHMgyJemknYpO2q+EGuQ3TcW0Kxv1tJnKUmt/EQsCDf252Ng
	k6hBDESLuJE7ioMUSIoMOyNT1zzNMqCCURaU1QBAuX35q9Ms7L4Yg/hiojU=
X-Google-Smtp-Source: AGHT+IG51KR7uQClui5T80GFu03wGjZtCbiNcOn2c2quAcoJxfpyu2MvcnnQYDV8Nd/6UX7Ol8OjhA==
X-Received: by 2002:a17:907:6ea0:b0:ab7:c11:a980 with SMTP id a640c23a62f3a-ab7db544773mr282512766b.17.1739281554584;
        Tue, 11 Feb 2025 05:45:54 -0800 (PST)
Received: from localhost (host-79-41-239-37.retail.telecomitalia.it. [79.41.239.37])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7b43ee08asm522714066b.88.2025.02.11.05.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 05:45:54 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Tue, 11 Feb 2025 14:46:53 +0100
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v7 06/11] pinctrl: rp1: Implement RaspberryPi RP1 gpio
 support
Message-ID: <Z6tUzcCqI2xdKSQ5@apocalypse>
References: <cover.1738963156.git.andrea.porta@suse.com>
 <c4b60fda4b9c87a5efaf5103507fb568413c841a.1738963156.git.andrea.porta@suse.com>
 <8e2b0e05-cd60-4b79-8763-005c3f72a64d@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8e2b0e05-cd60-4b79-8763-005c3f72a64d@gmx.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_054556_829869_0AC36E97 
X-CRM114-Status: GOOD (  29.26  )
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

Hi Stefan,

On 15:36 Sat 08 Feb     , Stefan Wahren wrote:
> Hi Andrea,
> 
> Am 07.02.25 um 22:31 schrieb Andrea della Porta:
> > The RP1 is an MFD supporting a gpio controller and /pinmux/pinctrl.
> > Add minimum support for the gpio only portion. The driver is in
> > pinctrl folder since upcoming patches will add the pinmux/pinctrl
> > support where the gpio part can be seen as an addition.
> > 
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> > Reviewed-by: Stefan Wahren <wahrenst@gmx.net>
> > ---
> >   MAINTAINERS                   |   1 +
> >   drivers/pinctrl/Kconfig       |  11 +
> >   drivers/pinctrl/Makefile      |   1 +
> >   drivers/pinctrl/pinctrl-rp1.c | 789 ++++++++++++++++++++++++++++++++++
> >   4 files changed, 802 insertions(+)
> >   create mode 100644 drivers/pinctrl/pinctrl-rp1.c
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index a4a9555c07c5..f2ba6f565d30 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -19756,6 +19756,7 @@ F:	Documentation/devicetree/bindings/misc/pci1de4,1.yaml
> >   F:	Documentation/devicetree/bindings/pci/pci-ep-bus.yaml
> >   F:	Documentation/devicetree/bindings/pinctrl/raspberrypi,rp1-gpio.yaml
> >   F:	drivers/clk/clk-rp1.c
> > +F:	drivers/pinctrl/pinctrl-rp1.c
> >   F:	include/dt-bindings/clock/rp1.h
> >   F:	include/dt-bindings/misc/rp1.h
> > 
> > diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
> > index 95a8e2b9a614..53b265cabc26 100644
> > --- a/drivers/pinctrl/Kconfig
> > +++ b/drivers/pinctrl/Kconfig
> > @@ -612,6 +612,17 @@ config PINCTRL_MLXBF3
> >   	  each pin. This driver can also be built as a module called
> >   	  pinctrl-mlxbf3.
> > 
> > +config PINCTRL_RP1
> > +	tristate "Pinctrl driver for RP1"
> > +	depends on MISC_RP1
> > +	default MISC_RP1
> > +	select PINMUX
> > +	select PINCONF
> > +	select GENERIC_PINCONF
> > +	help
> > +	  Enable the gpio and pinctrl/mux driver for RaspberryPi RP1
> > +	  multi function device.
> > +
> >   source "drivers/pinctrl/actions/Kconfig"
> >   source "drivers/pinctrl/aspeed/Kconfig"
> >   source "drivers/pinctrl/bcm/Kconfig"
> > diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
> > index fba1c56624c0..6fb77de58545 100644
> > --- a/drivers/pinctrl/Makefile
> > +++ b/drivers/pinctrl/Makefile
> > @@ -48,6 +48,7 @@ obj-$(CONFIG_PINCTRL_PIC32)	+= pinctrl-pic32.o
> >   obj-$(CONFIG_PINCTRL_PISTACHIO)	+= pinctrl-pistachio.o
> >   obj-$(CONFIG_PINCTRL_RK805)	+= pinctrl-rk805.o
> >   obj-$(CONFIG_PINCTRL_ROCKCHIP)	+= pinctrl-rockchip.o
> > +obj-$(CONFIG_PINCTRL_RP1)       += pinctrl-rp1.o
> >   obj-$(CONFIG_PINCTRL_SCMI)	+= pinctrl-scmi.o
> >   obj-$(CONFIG_PINCTRL_SINGLE)	+= pinctrl-single.o
> >   obj-$(CONFIG_PINCTRL_ST) 	+= pinctrl-st.o
> > diff --git a/drivers/pinctrl/pinctrl-rp1.c b/drivers/pinctrl/pinctrl-rp1.c
> > new file mode 100644
> > index 000000000000..0d081f75d2ec
> > --- /dev/null
> > +++ b/drivers/pinctrl/pinctrl-rp1.c
> > @@ -0,0 +1,789 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Driver for Raspberry Pi RP1 GPIO unit
> > + *
> > + * Copyright (C) 2023 Raspberry Pi Ltd.
> > + *
> > + * This driver is inspired by:
> > + * pinctrl-bcm2835.c, please see original file for copyright information
> > + */
> > +
> ...
> > +
> > +static struct irq_chip rp1_gpio_irq_chip = {
> > +	.name = MODULE_NAME,
> > +	.irq_enable = rp1_gpio_irq_enable,
> > +	.irq_disable = rp1_gpio_irq_disable,
> > +	.irq_set_type = rp1_gpio_irq_set_type,
> > +	.irq_ack = rp1_gpio_irq_ack,
> > +	.irq_mask = rp1_gpio_irq_disable,
> > +	.irq_unmask = rp1_gpio_irq_enable,
> > +	.flags = IRQCHIP_IMMUTABLE,
> Sorry not sure, but doesn't this miss GPIOCHIP_IRQ_RESOURCE_HELPERS here?

Right. Added.

Thanks,
Andrea

> 
> Thanks

