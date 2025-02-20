Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A5D2C021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 17:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ANYY81S4UUbSzxGp9vX0hw/u/obOtXq2bTCgGH3coGw=; b=Zql2qmYNirSl/38Uid8/LhJSKD
	zMbwO0is0jilyqXCp1NDRjDuYOdipQXcRaTByV5Z7nfxnJE37zyF3sBkBmD4NUvJmofJGtos0ZqeW
	a+m1K50oEdy6piL1x+L2ghnipReA0mvRINQHdSEdVUPxqjbWxQi8gsWF8tz++HmrYwv/K7ijkXogR
	R4hlGwthBzS6mBwxJbpbBOtpHs/oVHBYJ6yUji699gMnScMj0nn20lLG8QplstyfD2O/rnydX2Nf0
	AYFoKQ57QTDx24RnoBHHYuJJFSkXnuGFODy/xu1ewqUYB/LzlasT/gn7xrr7RnIM+SLfNIga5zNmQ
	G3zzpBkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlAaI-00000002CLN-0nTv;
	Thu, 20 Feb 2025 17:43:38 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlAQJ-00000002A1V-0jgW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 17:33:21 +0000
Received: by mail-ed1-x542.google.com with SMTP id 4fb4d7f45d1cf-5e050b1491eso4081687a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Feb 2025 09:33:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740072797; x=1740677597; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ANYY81S4UUbSzxGp9vX0hw/u/obOtXq2bTCgGH3coGw=;
        b=RGdWur0EAYTIgaTOVokXP4knZ8O37fjtAv1i4iuTt05QZcNnJQoxAS9qBkiXhJl9X2
         Cmnsaj7O8fsDJOmdUd9e4nTm42UaMPrJVkl33+E2tpPtFNXZVZeFwLsdlEm7vZp4Buzt
         2LR7sOa5lGrPVegW2RRflLsjw8+mq7td2AdQF2a2PJwhfv9DX2Ff2zV+z0DDPHcAvTUm
         LDaDM5yzIrFFrFVNN8WtMjHQ+uoaj9Vcr1sHwtTh6CTUNTaFL8O/NtDa0GcUQvTk09Wh
         p33XHbddDuOVzTK28N+vDa60r+oLRoquy9xV11oFRDu/bsmlpGoyzQy7i+b11DrpDzqC
         8sxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740072797; x=1740677597;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ANYY81S4UUbSzxGp9vX0hw/u/obOtXq2bTCgGH3coGw=;
        b=Azf47X0xm9GAX9qJvxYfzvtUXWWh5EOqtDGJS+T6w0bRzzpFZ5prSTt1/5KiHBQcdz
         Eu/BqxurMLVN0YsLP+CzGt5Yloer0Mf3CtRxQLbMABbFBwfy7lGeVpj4AHjkdzcSyZzX
         uYUKkMqBT6V59BAy0Ikz+2fXycyGxIaUdY4ZaS5Sp52v3bIzHtgMyN+yebLeqJfCuv6J
         s7H7ZbLFz+MjK8naQIANgXyj4pf2SUwU1VPj2te1rUsblbSeCEIuzMmrvSCx6G8cPadQ
         MD0zqmAEDzQu47oWNkVKcfeKRlYsjTcQf8NDQrRcZbe+W7WnWNW6nQZgtXuJyrANGyZX
         vT/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUV9onOSsCqol/t8kM8MjtLBzkXQ4wEpiIz0LmHgOsBP+Mive5Lwn0hysUUa0TcuG0ONcGpgen/y8L0cpc8TLgh@lists.infradead.org
X-Gm-Message-State: AOJu0YyAjk3tq5Che/YjLcSsin1/0ivW+YQV3uNSwpg+PKbCIWEsgGfK
	v9MFk1vg5YM2DdfdSsUKYdWJTx2mBXjD6myUFbTC/zkbkBULxnlwbQJdV5xZc4E=
X-Gm-Gg: ASbGncscCjKPMCQq+mJCVEQuxBhIkjX8AKBuwYrERKmdf+CXgUfG5g2da2Te8zIo7E4
	onjr73ZiDIPpJMn1Kh++xQmKNdNOctsKdrneFZp40eDeVjmQk2hlRgvdyPGyCql97/XG5xbbK07
	/mUGhIBq1VgND8wpZVWNt9z7PbDeQq+vvNyAWyGkyj0pr4ud5TSDlKZUpwjiWMljHXlIl5wkJgB
	6IDJeMq0quUuXi738CzuICGrH4u3teb7I7T0fHZZC65GVxCGNTH5EP4jJZLoDs3zzEXnpZ3nw48
	a3JNj6u+wxJFotMkzVM75ZYA0MbIXGmjJvA7hszIXkgXdburfBAKCl82N9I=
X-Google-Smtp-Source: AGHT+IFcZuFtypbIC0ocwrn0UjtnE5zIzW4WQOLazDAdOMAwrDA8BDnjnnZ6hgx+i5rr6QtaeBrAFg==
X-Received: by 2002:a05:6402:524b:b0:5de:50b4:b71f with SMTP id 4fb4d7f45d1cf-5e0a12baa86mr3394933a12.12.1740072797358;
        Thu, 20 Feb 2025 09:33:17 -0800 (PST)
Received: from localhost (host-79-41-239-37.retail.telecomitalia.it. [79.41.239.37])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e076048c05sm5023923a12.35.2025.02.20.09.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 09:33:16 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 20 Feb 2025 18:34:21 +0100
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
Subject: Re: [PATCH v7 08/11] misc: rp1: RaspberryPi RP1 misc driver
Message-ID: <Z7dnnW4npJmfOVE0@apocalypse>
References: <cover.1738963156.git.andrea.porta@suse.com>
 <d1362766e3e966f78591129de918046a4b892c18.1738963156.git.andrea.porta@suse.com>
 <87525350-b432-40b3-927c-60cd74228ea4@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87525350-b432-40b3-927c-60cd74228ea4@gmx.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_093319_213399_140AA89A 
X-CRM114-Status: GOOD (  24.64  )
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

On 15:21 Sat 08 Feb     , Stefan Wahren wrote:
> Hi Andrea,
> 
> Am 07.02.25 um 22:31 schrieb Andrea della Porta:
> > The RaspberryPi RP1 is a PCI multi function device containing
> > peripherals ranging from Ethernet to USB controller, I2C, SPI
> > and others.

...

> > +static int rp1_irq_set_type(struct irq_data *irqd, unsigned int type)
> > +{
> > +	struct rp1_dev *rp1 = irqd->domain->host_data;
> > +	unsigned int hwirq = (unsigned int)irqd->hwirq;
> > +
> > +	switch (type) {
> > +	case IRQ_TYPE_LEVEL_HIGH:
> > +		dev_dbg(&rp1->pdev->dev, "MSIX IACK EN for irq %d\n", hwirq);
> This looks a little bit inconsistent. Only this type has a debug
> message. So either we drop this or add at least a message for

I think that this is indeed asymmetric. That warning says
that the 'special' IACK management is engaged for level triggered
interrupt, which is mandatory in order to avoid missing further
interrupts without the performance loss of busy-polling for 
active interrupts. This is explained in par. 6.2 of:

https://datasheets.raspberrypi.com/rp1/rp1-peripherals.pdf

The point is that we're not stating the type of the interrupt
(edge/level triggered), but we warn that we're enabling a mechanism
useful for one type only (level triggered).

> IRQ_TYPE_EDGE_RISING, too. Btw the format specifier looks wrong
> (unsigned int vs %d).

Ack.

> > +		msix_cfg_set(rp1, hwirq, MSIX_CFG_IACK_EN);
> > +		rp1->level_triggered_irq[hwirq] = true;
> > +	break;
> > +	case IRQ_TYPE_EDGE_RISING:
> > +		msix_cfg_clr(rp1, hwirq, MSIX_CFG_IACK_EN);
> > +		rp1->level_triggered_irq[hwirq] = false;
> > +		break;
> > +	default:
> > +		return -EINVAL;
> It would be nice to document why only IRQ_TYPE_LEVEL_HIGH and
> IRQ_TYPE_EDGE_RISING are supported. In case it's a software limitation,
> this function would be a good place. In case this is a hardware
> limitation this should be in the binding.

All ints are level-triggered. I guess I should add a short comment in
the bindings.

> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static struct irq_chip rp1_irq_chip = {
> > +	.name		= "rp1_irq_chip",
> > +	.irq_mask	= rp1_mask_irq,
> > +	.irq_unmask	= rp1_unmask_irq,
> > +	.irq_set_type	= rp1_irq_set_type,
> > +};

...

> > +		irq_set_chip_and_handler(irq, &rp1_irq_chip, handle_level_irq);
> > +		irq_set_probe(irq);
> > +		irq_set_chained_handler_and_data(pci_irq_vector(pdev, i),
> > +						 rp1_chained_handle_irq, rp1);
> > +	}
> > +
> > +	err = of_overlay_fdt_apply(dtbo_start, dtbo_size, &rp1->ovcs_id, rp1_node);
> > +	if (err)
> > +		goto err_unregister_interrupts;
> > +
> > +	err = of_platform_default_populate(rp1_node, NULL, dev);
> > +	if (err)
> > +		goto err_unload_overlay;
> I think in this case it's worth to add a suitable dev_err() here.

Ack.

Many thanks,
Andrea

> 
> Thanks

