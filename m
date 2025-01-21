Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39BB6C02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 08:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HKpawEtYU/AOdMXultJRsujaUW1vOhAtC8newPqFvao=; b=IbXOWkgMQ4SuuvTzZH0yoWAugB
	a4HI1xVj5fIdfmtxH95jz4N2rMsd25EZfZh5p1glitpcKufcx91R80gFvIZK3rPjHhk3xXKC/Y3jv
	Cvk8OrQZ0/WuVs/APQVsjTMDRK80lwWdJ2+VVcgYoWx8NVw3rkV8gkwVtVYx8nBUuC8k1IouztZ9+
	JWPkpa5/SDvi90ZpnCVjBtvNCR+KVJLXl8I/h3aDEhyk6g8r8liMYChVMIbUnNrcknmEd+EjkmmjT
	yGqaYgngRWywnjDZK28UH2kqR4J/jBDbYdIAH61+6FwMUCj964hc7Ti6FXeTOCUW3LycJ2cjQLCzT
	hbomA/HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taA1S-00000007K9B-1d3c;
	Tue, 21 Jan 2025 08:54:10 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ta9vY-00000007IuG-2LkI;
	Tue, 21 Jan 2025 08:48:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0EA7AA410E7;
	Tue, 21 Jan 2025 08:46:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B97C5C4CEDF;
	Tue, 21 Jan 2025 08:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1737449283;
	bh=PsH0RbnSJR1t5DhFUKCC+uHt3DiuAQqDmYt2pnrP8AI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M5Xa5p4kghr5it6pXe4nWwurjJYNja7mNvUgyNBEbchbR4Vp2YpVDbUsgDtf8T8tb
	 QLTkPCHaWdAB34g2a21A0rLEtfU4cPHP95aZjS65bQaQOpjPUlKZYFqy53P6djLtpt
	 DiZp+HlPJhKh61ys32dZgj+uMvN7cL/2xJ8heF/c=
Date: Tue, 21 Jan 2025 09:48:00 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
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
Message-ID: <2025012143-rippling-rehydrate-581b@gregkh>
References: <cover.1736776658.git.andrea.porta@suse.com>
 <550590a5a0b80dd8a0c655921ec0aa41a67c8148.1736776658.git.andrea.porta@suse.com>
 <2025011722-motocross-finally-e664@gregkh>
 <Z49eOdVvwknOoD3E@apocalypse>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z49eOdVvwknOoD3E@apocalypse>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_004804_941391_DF7488E6 
X-CRM114-Status: GOOD (  37.66  )
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

On Tue, Jan 21, 2025 at 09:43:37AM +0100, Andrea della Porta wrote:
> Hi Greg,
> 
> On 12:47 Fri 17 Jan     , Greg Kroah-Hartman wrote:
> > On Mon, Jan 13, 2025 at 03:58:07PM +0100, Andrea della Porta wrote:
> > > The RaspberryPi RP1 is a PCI multi function device containing
> > > peripherals ranging from Ethernet to USB controller, I2C, SPI
> > > and others.
> > > 
> > > Implement a bare minimum driver to operate the RP1, leveraging
> > > actual OF based driver implementations for the on-board peripherals
> > > by loading a devicetree overlay during driver probe.
> > > 
> > > The peripherals are accessed by mapping MMIO registers starting
> > > from PCI BAR1 region.
> > > 
> > > With the overlay approach we can achieve more generic and agnostic
> > > approach to managing this chipset, being that it is a PCI endpoint
> > > and could possibly be reused in other hw implementations. The
> > > presented approach is also used by Bootlin's Microchip LAN966x
> > > patchset (see link) as well, for a similar chipset.
> > > 
> > > For reasons why this driver is contained in drivers/misc, please
> > > check the links.
> > 
> > Links aren't always around all the time, please document it here why
> > this is needed, and then links can "add to" that summary.
> 
> Ack.
> 
> > 
> > > This driver is heavily based on downstream code from RaspberryPi
> > > Foundation, and the original author is Phil Elwell.
> > > 
> > > Link: https://datasheets.raspberrypi.com/rp1/rp1-peripherals.pdf
> 
> ...
> 
> > > diff --git a/drivers/misc/rp1/rp1_pci.c b/drivers/misc/rp1/rp1_pci.c
> > > new file mode 100644
> > > index 000000000000..3e8ba3fa7fd5
> > > --- /dev/null
> > > +++ b/drivers/misc/rp1/rp1_pci.c
> > > @@ -0,0 +1,305 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Copyright (c) 2018-24 Raspberry Pi Ltd.
> > > + * All rights reserved.
> > > + */
> > > +
> > > +#include <linux/err.h>
> > > +#include <linux/interrupt.h>
> > > +#include <linux/irq.h>
> > > +#include <linux/irqchip/chained_irq.h>
> > > +#include <linux/irqdomain.h>
> > > +#include <linux/module.h>
> > > +#include <linux/msi.h>
> > > +#include <linux/of_platform.h>
> > > +#include <linux/pci.h>
> > > +#include <linux/platform_device.h>
> > > +
> > > +#include "rp1_pci.h"
> > 
> > Why does a self-contained .c file need a .h file?  Please put it all in
> > here.
> 
> I agree with you. Indeed, the very first version of this patch had the header
> file placed inside the .c, but I received concerns about it and some advice to
> do it differently, as you can see here:
> https://lore.kernel.org/all/ZtWDpaqUG9d9yPPf@apocalypse/
> so I've changed it accordingly in V2. So right now I'm not sure what the
> acceptable behaviour should be ...

It's a pretty simple rule:
	Only use a .h file if multiple .c files need to see the symbol.

So no .h file is needed here.

> > > +struct rp1_dev {
> > > +	struct pci_dev *pdev;
> > > +	struct irq_domain *domain;
> > > +	struct irq_data *pcie_irqds[64];
> > > +	void __iomem *bar1;
> > > +	int ovcs_id;	/* overlay changeset id */
> > > +	bool level_triggered_irq[RP1_INT_END];
> > > +};
> > > +
> > > +static void msix_cfg_set(struct rp1_dev *rp1, unsigned int hwirq, u32 value)
> > > +{
> > > +	iowrite32(value, rp1->bar1 + RP1_PCIE_APBS_BASE + REG_SET + MSIX_CFG(hwirq));
> > 
> > Do your writes need a read to flush them properly?  Or can they handle
> > this automatically?
> >
> 
> I had some thoughts with RaspberryPi foundation folks to double check it, and it
> seems that there should be no need to readback the value (unless we want to go
> really paranoid), so I would avoid that since in case of level handled interrupt
> we would end up reading the register on every triggering interrupts.

Ok, if it passes testing, that's fine, hopefully it works properly, but
if not, you now have a trail to go and fix it in the future :)

thanks,

greg k-h

