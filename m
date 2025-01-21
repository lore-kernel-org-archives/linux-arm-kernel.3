Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2836FC02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 15:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X4Q4hJw5c+A/aS0RSQxPiCKAtW+pQN8zj4IF9YAn0J8=; b=siKtKO74m8QcjR7JQKomLN+SPs
	hb8RW6ZE5u++L3grrHTfSoxqdT0+MT3Dll4hmOBo5GqAjUtxb12hLs29P+7P9hBDUrhpbH9d6sbWS
	EZr03BZLuOG5XcueXX4po5ZtWSTV7XwD2CxQ3Siy4ImYTSYEg1BBjMOMgeZwhAkeeB1azu5W+s257
	AR8uBQiLMNECWtZaVkJm/ANjxz+BNzsA09LwVd+5vUfBbFXRrYAfwa2n8PYt5ub7KPIxptcI0MuXs
	D+y1JqBSdL1mPVD7FmZNdEJ4ds2e+SmG4IxY2AMtQatEWUrf7ou54dyMWdNrw5Ms6rEVwc1w942F5
	oOrhsRAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taG42-00000008Cgg-16Es;
	Tue, 21 Jan 2025 15:21:14 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taFyK-00000008BcH-2Ysx;
	Tue, 21 Jan 2025 15:15:22 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7025420013;
	Tue, 21 Jan 2025 15:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737472516;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X4Q4hJw5c+A/aS0RSQxPiCKAtW+pQN8zj4IF9YAn0J8=;
	b=S5VkIzWdwIvCY/+i6lnX+FglRqgvtroMLGFdMIXk4BB3QN6KHEDTA8glOOXknkPCEiDWpA
	4d4wAPAAzQ4hEdQBk83SsuarvVuDzc8lTIKBcwjbT7pv2XNIy2D41javnOdRc+xuzn2FPo
	7Q/61hfQ7ZMU3SmkR2f/PkjvDsKE3P5bkbxdDmsAFBEB1lYv0DVoZ5zYSULze92mmrc7r3
	y75Xr2sH0yYNnx2GwIhRvaEFVT7yRQA3TBVSgJMmq/fcCmnyKiwegMu/kL6SKQw1LqPlVS
	4g75aDVWjceQCeMejRE//Rufe+0QXXqItevCkqJ59nxCJBjhFY5wYgT8gPGU4g==
Date: Tue, 21 Jan 2025 16:15:12 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, Krzysztof Wilczynski <kw@linux.com>, Manivannan
 Sadhasivam <manivannan.sadhasivam@linaro.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Linus Walleij <linus.walleij@linaro.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Bartosz
 Golaszewski <brgl@bgdev.pl>, Derek Kiernan <derek.kiernan@amd.com>, Dragan
 Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, Saravana
 Kannan <saravanak@google.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org, Masahiro Yamada
 <masahiroy@kernel.org>, Stefan Wahren <wahrenst@gmx.net>, Luca Ceresoli
 <luca.ceresoli@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v6 08/10] misc: rp1: RaspberryPi RP1 misc driver
Message-ID: <20250121161512.2a3ac703@bootlin.com>
In-Reply-To: <2025012148-unused-winking-7d51@gregkh>
References: <cover.1736776658.git.andrea.porta@suse.com>
	<550590a5a0b80dd8a0c655921ec0aa41a67c8148.1736776658.git.andrea.porta@suse.com>
	<2025011722-motocross-finally-e664@gregkh>
	<Z49eOdVvwknOoD3E@apocalypse>
	<2025012143-rippling-rehydrate-581b@gregkh>
	<Z4-oORWO4BgOqibB@apocalypse>
	<2025012157-bonsai-caddie-19b2@gregkh>
	<Z4-xcjov0HLivfVX@apocalypse>
	<2025012148-unused-winking-7d51@gregkh>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_071520_919676_1D332923 
X-CRM114-Status: GOOD (  44.39  )
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

Hi Andrea,

On Tue, 21 Jan 2025 15:49:04 +0100
Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:

> On Tue, Jan 21, 2025 at 03:38:42PM +0100, Andrea della Porta wrote:
> > Hi Greg,
> > 
> > On 15:18 Tue 21 Jan     , Greg Kroah-Hartman wrote:  
> > > On Tue, Jan 21, 2025 at 02:59:21PM +0100, Andrea della Porta wrote:  
> > > > Hi Greg,
> > > > 
> > > > On 09:48 Tue 21 Jan     , Greg Kroah-Hartman wrote:  
> > > > > On Tue, Jan 21, 2025 at 09:43:37AM +0100, Andrea della Porta wrote:  
> > > > > > Hi Greg,
> > > > > > 
> > > > > > On 12:47 Fri 17 Jan     , Greg Kroah-Hartman wrote:  
> > > > > > > On Mon, Jan 13, 2025 at 03:58:07PM +0100, Andrea della Porta wrote:  
> > > > > > > > The RaspberryPi RP1 is a PCI multi function device containing
> > > > > > > > peripherals ranging from Ethernet to USB controller, I2C, SPI
> > > > > > > > and others.
> > > > > > > > 
> > > > > > > > Implement a bare minimum driver to operate the RP1, leveraging
> > > > > > > > actual OF based driver implementations for the on-board peripherals
> > > > > > > > by loading a devicetree overlay during driver probe.
> > > > > > > > 
> > > > > > > > The peripherals are accessed by mapping MMIO registers starting
> > > > > > > > from PCI BAR1 region.
> > > > > > > > 
> > > > > > > > With the overlay approach we can achieve more generic and agnostic
> > > > > > > > approach to managing this chipset, being that it is a PCI endpoint
> > > > > > > > and could possibly be reused in other hw implementations. The
> > > > > > > > presented approach is also used by Bootlin's Microchip LAN966x
> > > > > > > > patchset (see link) as well, for a similar chipset.
> > > > > > > > 
> > > > > > > > For reasons why this driver is contained in drivers/misc, please
> > > > > > > > check the links.  
> > > > > > > 
> > > > > > > Links aren't always around all the time, please document it here why
> > > > > > > this is needed, and then links can "add to" that summary.  
> > > > > > 
> > > > > > Ack.
> > > > > >   
> > > > > > >   
> > > > > > > > This driver is heavily based on downstream code from RaspberryPi
> > > > > > > > Foundation, and the original author is Phil Elwell.
> > > > > > > > 
> > > > > > > > Link: https://datasheets.raspberrypi.com/rp1/rp1-peripherals.pdf  
> > > > > > 
> > > > > > ...
> > > > > >   
> > > > > > > > diff --git a/drivers/misc/rp1/rp1_pci.c b/drivers/misc/rp1/rp1_pci.c
> > > > > > > > new file mode 100644
> > > > > > > > index 000000000000..3e8ba3fa7fd5
> > > > > > > > --- /dev/null
> > > > > > > > +++ b/drivers/misc/rp1/rp1_pci.c
> > > > > > > > @@ -0,0 +1,305 @@
> > > > > > > > +// SPDX-License-Identifier: GPL-2.0
> > > > > > > > +/*
> > > > > > > > + * Copyright (c) 2018-24 Raspberry Pi Ltd.
> > > > > > > > + * All rights reserved.
> > > > > > > > + */
> > > > > > > > +
> > > > > > > > +#include <linux/err.h>
> > > > > > > > +#include <linux/interrupt.h>
> > > > > > > > +#include <linux/irq.h>
> > > > > > > > +#include <linux/irqchip/chained_irq.h>
> > > > > > > > +#include <linux/irqdomain.h>
> > > > > > > > +#include <linux/module.h>
> > > > > > > > +#include <linux/msi.h>
> > > > > > > > +#include <linux/of_platform.h>
> > > > > > > > +#include <linux/pci.h>
> > > > > > > > +#include <linux/platform_device.h>
> > > > > > > > +
> > > > > > > > +#include "rp1_pci.h"  
> > > > > > > 
> > > > > > > Why does a self-contained .c file need a .h file?  Please put it all in
> > > > > > > here.  
> > > > > > 
> > > > > > I agree with you. Indeed, the very first version of this patch had the header
> > > > > > file placed inside the .c, but I received concerns about it and some advice to
> > > > > > do it differently, as you can see here:
> > > > > > https://lore.kernel.org/all/ZtWDpaqUG9d9yPPf@apocalypse/
> > > > > > so I've changed it accordingly in V2. So right now I'm not sure what the
> > > > > > acceptable behaviour should be ...  
> > > > > 
> > > > > It's a pretty simple rule:
> > > > > 	Only use a .h file if multiple .c files need to see the symbol.
> > > > > 
> > > > > So no .h file is needed here.  
> > > > 
> > > > Perfect, I'll revert back that two lines to V1 then. Please be aware
> > > > though that this will trigger the following checkpatch warning:
> > > > 
> > > > WARNING: externs should be avoided in .c files  
> > > 
> > > Well where are those externs defined at?  Shouldn't there be a .h file
> > > for them somewhere in the tree if they really are global?  
> > 
> > Those symbols are deined in drivers/misc/rp1/rp1-pci.dtbo.S (added by
> > this patchset) and created by cmd_wrap_S_dtb in scripts/Makefile.lib.
> > They are just placeholders that contains rp1-pci.dtbo as
> > a binary blob, in order for the driver (rp1_pci.c) to be able to use
> > the binary buffer representing the overlay and address it from the
> > driver probe function.
> > So there's no other reference from outside rp1_pci.c to those two symbols.
> > In comparison, this is the very same approach used by a recently accepted
> > patch involving drivers/misc/lan966x_pci.c, which also has the two externs
> > in it and triggers the same checkpatch warning.  
> 
> Ok, that's fine, checkpatch is just a hint, not a hard-and-fast-rule.
> 

Maybe just to avoid confusion for future readers, you can add a comment as I
did for the lan966x:
  https://elixir.bootlin.com/linux/v6.13-rc3/source/drivers/misc/lan966x_pci.c#L21

This will not avoid the warning but will give an explanation to people
looking closer at this checkpatch warning.

Best regards,
Hervé

