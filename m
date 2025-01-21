Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ADD8C0218B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 14:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qR12sR9qaXoq01ZrlnxFSVY+MDy8Y3UW/cxNrGivdj8=; b=RZSHT7bh051zm89mumUrLRyawz
	dZ9h1oLcuHB97P/846Aa8kAJMzbi8pmD6EphPtvcHoKr34Wo5/RFgthpZ6mHjFlXsw78VKFEQgR9I
	gmgnoR0xkQkg9vUtAgOYtU1gcUPUdDYXca5+iLotBriIq/jqqwOF98QpFNG3lqvg3vAP5pqGjBilH
	UJqViKiTku5NwBKmm+OwJwql1vudL/SY3N8txS7dqATRtiXUEys5Yh/hgeAMFy5mFDPYo43iAHl6C
	1jAMLd6Pj8AavQ3Y829jTMxLQfBgtQgY1stgQ/HrwOIP+SYy3hW0E8e7F5shq+L6pLsBuhGq7QPCA
	UYAEst8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taFaG-000000087l5-2wnl;
	Tue, 21 Jan 2025 14:50:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taFYy-000000087VV-3w35;
	Tue, 21 Jan 2025 14:49:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2B23A5C592E;
	Tue, 21 Jan 2025 14:48:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFA0FC4CEDF;
	Tue, 21 Jan 2025 14:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1737470947;
	bh=JaVOHlnuKUu3Jtd9M7MfS455HzeaXiu9v2fTq47w+5o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m5bSzT3LEINGO/bt7wArei2Pz4uI8jrMy4yPmmRyuLyCcP2RTA6+UVqB/oB+jyUoL
	 6K9NSBEmVCt5IanxxENFx2NSs75rwF2zKJekXqCFfWR976qcAm2+n21b9mwcS9FCFe
	 Flsz5OEiW+giJ2PkIUdyNX91Rl0TCTtPkNfvcFgw=
Date: Tue, 21 Jan 2025 15:49:04 +0100
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
Message-ID: <2025012148-unused-winking-7d51@gregkh>
References: <cover.1736776658.git.andrea.porta@suse.com>
 <550590a5a0b80dd8a0c655921ec0aa41a67c8148.1736776658.git.andrea.porta@suse.com>
 <2025011722-motocross-finally-e664@gregkh>
 <Z49eOdVvwknOoD3E@apocalypse>
 <2025012143-rippling-rehydrate-581b@gregkh>
 <Z4-oORWO4BgOqibB@apocalypse>
 <2025012157-bonsai-caddie-19b2@gregkh>
 <Z4-xcjov0HLivfVX@apocalypse>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z4-xcjov0HLivfVX@apocalypse>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_064909_059739_557B3E64 
X-CRM114-Status: GOOD (  42.53  )
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

On Tue, Jan 21, 2025 at 03:38:42PM +0100, Andrea della Porta wrote:
> Hi Greg,
> 
> On 15:18 Tue 21 Jan     , Greg Kroah-Hartman wrote:
> > On Tue, Jan 21, 2025 at 02:59:21PM +0100, Andrea della Porta wrote:
> > > Hi Greg,
> > > 
> > > On 09:48 Tue 21 Jan     , Greg Kroah-Hartman wrote:
> > > > On Tue, Jan 21, 2025 at 09:43:37AM +0100, Andrea della Porta wrote:
> > > > > Hi Greg,
> > > > > 
> > > > > On 12:47 Fri 17 Jan     , Greg Kroah-Hartman wrote:
> > > > > > On Mon, Jan 13, 2025 at 03:58:07PM +0100, Andrea della Porta wrote:
> > > > > > > The RaspberryPi RP1 is a PCI multi function device containing
> > > > > > > peripherals ranging from Ethernet to USB controller, I2C, SPI
> > > > > > > and others.
> > > > > > > 
> > > > > > > Implement a bare minimum driver to operate the RP1, leveraging
> > > > > > > actual OF based driver implementations for the on-board peripherals
> > > > > > > by loading a devicetree overlay during driver probe.
> > > > > > > 
> > > > > > > The peripherals are accessed by mapping MMIO registers starting
> > > > > > > from PCI BAR1 region.
> > > > > > > 
> > > > > > > With the overlay approach we can achieve more generic and agnostic
> > > > > > > approach to managing this chipset, being that it is a PCI endpoint
> > > > > > > and could possibly be reused in other hw implementations. The
> > > > > > > presented approach is also used by Bootlin's Microchip LAN966x
> > > > > > > patchset (see link) as well, for a similar chipset.
> > > > > > > 
> > > > > > > For reasons why this driver is contained in drivers/misc, please
> > > > > > > check the links.
> > > > > > 
> > > > > > Links aren't always around all the time, please document it here why
> > > > > > this is needed, and then links can "add to" that summary.
> > > > > 
> > > > > Ack.
> > > > > 
> > > > > > 
> > > > > > > This driver is heavily based on downstream code from RaspberryPi
> > > > > > > Foundation, and the original author is Phil Elwell.
> > > > > > > 
> > > > > > > Link: https://datasheets.raspberrypi.com/rp1/rp1-peripherals.pdf
> > > > > 
> > > > > ...
> > > > > 
> > > > > > > diff --git a/drivers/misc/rp1/rp1_pci.c b/drivers/misc/rp1/rp1_pci.c
> > > > > > > new file mode 100644
> > > > > > > index 000000000000..3e8ba3fa7fd5
> > > > > > > --- /dev/null
> > > > > > > +++ b/drivers/misc/rp1/rp1_pci.c
> > > > > > > @@ -0,0 +1,305 @@
> > > > > > > +// SPDX-License-Identifier: GPL-2.0
> > > > > > > +/*
> > > > > > > + * Copyright (c) 2018-24 Raspberry Pi Ltd.
> > > > > > > + * All rights reserved.
> > > > > > > + */
> > > > > > > +
> > > > > > > +#include <linux/err.h>
> > > > > > > +#include <linux/interrupt.h>
> > > > > > > +#include <linux/irq.h>
> > > > > > > +#include <linux/irqchip/chained_irq.h>
> > > > > > > +#include <linux/irqdomain.h>
> > > > > > > +#include <linux/module.h>
> > > > > > > +#include <linux/msi.h>
> > > > > > > +#include <linux/of_platform.h>
> > > > > > > +#include <linux/pci.h>
> > > > > > > +#include <linux/platform_device.h>
> > > > > > > +
> > > > > > > +#include "rp1_pci.h"
> > > > > > 
> > > > > > Why does a self-contained .c file need a .h file?  Please put it all in
> > > > > > here.
> > > > > 
> > > > > I agree with you. Indeed, the very first version of this patch had the header
> > > > > file placed inside the .c, but I received concerns about it and some advice to
> > > > > do it differently, as you can see here:
> > > > > https://lore.kernel.org/all/ZtWDpaqUG9d9yPPf@apocalypse/
> > > > > so I've changed it accordingly in V2. So right now I'm not sure what the
> > > > > acceptable behaviour should be ...
> > > > 
> > > > It's a pretty simple rule:
> > > > 	Only use a .h file if multiple .c files need to see the symbol.
> > > > 
> > > > So no .h file is needed here.
> > > 
> > > Perfect, I'll revert back that two lines to V1 then. Please be aware
> > > though that this will trigger the following checkpatch warning:
> > > 
> > > WARNING: externs should be avoided in .c files
> > 
> > Well where are those externs defined at?  Shouldn't there be a .h file
> > for them somewhere in the tree if they really are global?
> 
> Those symbols are deined in drivers/misc/rp1/rp1-pci.dtbo.S (added by
> this patchset) and created by cmd_wrap_S_dtb in scripts/Makefile.lib.
> They are just placeholders that contains rp1-pci.dtbo as
> a binary blob, in order for the driver (rp1_pci.c) to be able to use
> the binary buffer representing the overlay and address it from the
> driver probe function.
> So there's no other reference from outside rp1_pci.c to those two symbols.
> In comparison, this is the very same approach used by a recently accepted
> patch involving drivers/misc/lan966x_pci.c, which also has the two externs
> in it and triggers the same checkpatch warning.

Ok, that's fine, checkpatch is just a hint, not a hard-and-fast-rule.

thanks,

greg k-h

