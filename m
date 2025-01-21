Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA029C02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 08:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WfyBwrVAKcG2iSXqbe+KfTaCoLpZROxE8VUSqF7vM6w=; b=eHmJZJpGXYqtT3thcgroUmSCUQ
	bOGyauns4wmkBUQ8WruWoQmTpGJGj1KwK25+WQAloRtYXyokbH5uwssq0CIq31sGas4Lm+e/cg3zw
	2IiKw5tq1gVt132p8iuIWzc0bJoq3O5tgovEUdgIbFbVI8lduec+6Dd+QIACYjffXII6xzR+ERRx+
	9y8V8146rZsRil48VYgbuTH0O5AW6MMS/Q07uWoFyutV1ZpHXGLQddkUhe+ZMn57H4ioWmT5MD/hT
	jJodzBZSFFrM3FI9W3OqsiUxEwZLXIj8Zn42ptUOh87PoOnAVJ/YsDwy9o+Qqp1mg/TKW7url7CAs
	w8OgTYqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ta9rj-00000007IGE-3Dgn;
	Tue, 21 Jan 2025 08:44:07 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ta9qR-00000007I3P-139N
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 08:42:48 +0000
Received: by mail-ed1-x542.google.com with SMTP id 4fb4d7f45d1cf-5d3ecae02beso7504568a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jan 2025 00:42:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1737448965; x=1738053765; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WfyBwrVAKcG2iSXqbe+KfTaCoLpZROxE8VUSqF7vM6w=;
        b=ckK3hE0AG3ceYDkrENH8EiS7A1pY4hInYjOTP1BOeSbaQS0ehyLhhmqfUkMLrQU9Xp
         VWukYjDZhuoNrLRTMNBqVRYfN0FjbDO64IQJUFdOnbD407jix8pZYrblcml7VwFFVGl4
         9vM+HEU3ERTbocF0dErX7FcLvR53gVMkQha72+y7mUS0SsFG3Kq6ZpTUDBCmqRV0bDOp
         c5uT+OI5rZg2SEi5s9bx5svIq6F2ZkbAOYoY9WKfdTCFbMPYhACPo+Cra/QeFw1+BnmM
         p1VAZP2UOEAIhDREch+gJp17OG3komyI5oWBPv13lBrKwv+OKi5hripjbE4SgpM/z8bS
         iVRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737448965; x=1738053765;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WfyBwrVAKcG2iSXqbe+KfTaCoLpZROxE8VUSqF7vM6w=;
        b=m3kOTUcjoOnC+0YXbBgRHmTaUNeddM5GCNIyWvDOEsX3W0Te/ZPD4POErxoxMuFuPL
         Rxirlt78Q/UahuG8cpqv/3VKWewfW4D5HdRHbEwEBwD1FhOSOrXOoDQihl/NxmX+L86X
         KNCVRH61Nv47rhjmlDoGi200429vxpnKuINFtQs4018ninUc5mNq3JTLSqCuIplC7i50
         TwutsB8xTWiktpIoK5QgjqDj1Y4KQ1a8wsVHVy2BTjeOq7r1xSMdfNPoqItHM89Fd4xQ
         ZBhCvRkjtmY/Wo8tpzSrtMSAfrYLOz0VPnFiXzvML2lldmJLAMuVm/fxbBr4eD7qXoJV
         KDKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbDgNTMyjoz8vGcmtxmExolH+LGlVFel8h7ceS9XwHZpYCfgMr8l6R++ERanrKGCC0DXFtsOrYzVNrRhgKwn8M@lists.infradead.org
X-Gm-Message-State: AOJu0YxhJ/7zW1nGyJWvFrS2KhfIt+GConXqnU12046uuXMw2Bztd+Ki
	kUzxwm4ObNj8PopgtRWTDCqEbryyRzM0Ivf2RZskjqVW4HFNqeGmlCwwiHxZPCU=
X-Gm-Gg: ASbGncvE3pH8i4bwxqh/2FHbcb4C0ItBFXbaQ5/ngFXIWB/T2NysPC48tTK0IkMUVn4
	iz8iWxCdu8SyPlSYjBNe5VsR19M7kwew13NI2CM9S5OkoW4eDZ/3D3HYcW5fo/av/TR4VuSlbKZ
	Wtl86Ri84i+j2acPj78k3fhFF5mSa56sdLHoSnyHGyKNI7AlVZHe26WDkiHfECPXaGd+d+DZmcZ
	OkL1VRZQIzR9JaF2sdAEfHlsLSjht8kmjh5Yer+jJpYEhEzPO/CMRorHlkR4SBtC85qBtwnHQVf
	I+WiYzv+jImtMfDXNqq46QnAbcJnCIsOtH3e1b7h
X-Google-Smtp-Source: AGHT+IHJoMEfBlMLvkr8KlEq8oWlxXFcL1m1dYtTgkFptyAjoAjldlyHkpeVawKUvQ8QmvdxpOWQWw==
X-Received: by 2002:a17:906:5617:b0:ab2:b8c3:be3c with SMTP id a640c23a62f3a-ab38b3fb0dcmr1352712066b.51.1737448964785;
        Tue, 21 Jan 2025 00:42:44 -0800 (PST)
Received: from localhost (host-87-14-236-197.retail.telecomitalia.it. [87.14.236.197])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384c75baesm719449966b.1.2025.01.21.00.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 00:42:44 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Tue, 21 Jan 2025 09:43:37 +0100
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
	Saravana Kannan <saravanak@google.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v6 08/10] misc: rp1: RaspberryPi RP1 misc driver
Message-ID: <Z49eOdVvwknOoD3E@apocalypse>
References: <cover.1736776658.git.andrea.porta@suse.com>
 <550590a5a0b80dd8a0c655921ec0aa41a67c8148.1736776658.git.andrea.porta@suse.com>
 <2025011722-motocross-finally-e664@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025011722-motocross-finally-e664@gregkh>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_004247_284924_4CD1DBC5 
X-CRM114-Status: GOOD (  35.57  )
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

Hi Greg,

On 12:47 Fri 17 Jan     , Greg Kroah-Hartman wrote:
> On Mon, Jan 13, 2025 at 03:58:07PM +0100, Andrea della Porta wrote:
> > The RaspberryPi RP1 is a PCI multi function device containing
> > peripherals ranging from Ethernet to USB controller, I2C, SPI
> > and others.
> > 
> > Implement a bare minimum driver to operate the RP1, leveraging
> > actual OF based driver implementations for the on-board peripherals
> > by loading a devicetree overlay during driver probe.
> > 
> > The peripherals are accessed by mapping MMIO registers starting
> > from PCI BAR1 region.
> > 
> > With the overlay approach we can achieve more generic and agnostic
> > approach to managing this chipset, being that it is a PCI endpoint
> > and could possibly be reused in other hw implementations. The
> > presented approach is also used by Bootlin's Microchip LAN966x
> > patchset (see link) as well, for a similar chipset.
> > 
> > For reasons why this driver is contained in drivers/misc, please
> > check the links.
> 
> Links aren't always around all the time, please document it here why
> this is needed, and then links can "add to" that summary.

Ack.

> 
> > This driver is heavily based on downstream code from RaspberryPi
> > Foundation, and the original author is Phil Elwell.
> > 
> > Link: https://datasheets.raspberrypi.com/rp1/rp1-peripherals.pdf

...

> > diff --git a/drivers/misc/rp1/rp1_pci.c b/drivers/misc/rp1/rp1_pci.c
> > new file mode 100644
> > index 000000000000..3e8ba3fa7fd5
> > --- /dev/null
> > +++ b/drivers/misc/rp1/rp1_pci.c
> > @@ -0,0 +1,305 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (c) 2018-24 Raspberry Pi Ltd.
> > + * All rights reserved.
> > + */
> > +
> > +#include <linux/err.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/irq.h>
> > +#include <linux/irqchip/chained_irq.h>
> > +#include <linux/irqdomain.h>
> > +#include <linux/module.h>
> > +#include <linux/msi.h>
> > +#include <linux/of_platform.h>
> > +#include <linux/pci.h>
> > +#include <linux/platform_device.h>
> > +
> > +#include "rp1_pci.h"
> 
> Why does a self-contained .c file need a .h file?  Please put it all in
> here.

I agree with you. Indeed, the very first version of this patch had the header
file placed inside the .c, but I received concerns about it and some advice to
do it differently, as you can see here:
https://lore.kernel.org/all/ZtWDpaqUG9d9yPPf@apocalypse/
so I've changed it accordingly in V2. So right now I'm not sure what the
acceptable behaviour should be ...

> 
> > +
> > +#define RP1_DRIVER_NAME		"rp1"
> 
> KBUILD_MODNAME?

Right. Thanks for pointing that out.

> 
> > +
> > +#define RP1_HW_IRQ_MASK		GENMASK(5, 0)
> > +
> > +#define REG_SET			0x800
> > +#define REG_CLR			0xc00
> > +
> > +/* MSI-X CFG registers start at 0x8 */
> > +#define MSIX_CFG(x) (0x8 + (4 * (x)))
> > +
> > +#define MSIX_CFG_IACK_EN        BIT(3)
> > +#define MSIX_CFG_IACK           BIT(2)
> > +#define MSIX_CFG_ENABLE         BIT(0)
> > +
> > +/* Address map */
> > +#define RP1_PCIE_APBS_BASE	0x108000
> > +
> > +/* Interrupts */
> > +#define RP1_INT_END		61
> 
> 
> 
> > +
> > +struct rp1_dev {
> > +	struct pci_dev *pdev;
> > +	struct irq_domain *domain;
> > +	struct irq_data *pcie_irqds[64];
> > +	void __iomem *bar1;
> > +	int ovcs_id;	/* overlay changeset id */
> > +	bool level_triggered_irq[RP1_INT_END];
> > +};
> > +
> > +static void msix_cfg_set(struct rp1_dev *rp1, unsigned int hwirq, u32 value)
> > +{
> > +	iowrite32(value, rp1->bar1 + RP1_PCIE_APBS_BASE + REG_SET + MSIX_CFG(hwirq));
> 
> Do your writes need a read to flush them properly?  Or can they handle
> this automatically?
>

I had some thoughts with RaspberryPi foundation folks to double check it, and it
seems that there should be no need to readback the value (unless we want to go
really paranoid), so I would avoid that since in case of level handled interrupt
we would end up reading the register on every triggering interrupts.

Many thanks,
Andrea
 
> thanks,
> 
> greg k-h

