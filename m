Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A43A9C02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 15:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1vDXJK4KbYxcZJlt3fw7FKxfRAL1QGGnOoRjEgA9o2w=; b=JRhNVx7VuF6OX5VssxUYTraldt
	XoqOfI4ESKPy876/pqTuvhWa+ucGEwXMgcginMTYQCOgB8fTMoVOt8TTAjaIAhK4J0niQxLxvGESo
	SvGNA2mnZXebFhsDD7Cr6P+rYSjrG4x4Jjqzr1vo90Nfc6RssLWfanERm6IFwf0yzzBOL55vnNiH0
	2J818cB4aMgXnFa+Axu2kl2UK7qh9P5vkUN1dzX88zT/gNZ0QCbLzY/y336fughJPWskiO2kLX8vM
	eAdUAFM005H/F94QxdMBwAz7/X+UbTwcXnadvBVN866td59rpZJ7AQoWvOdlmV2GC2e0RrmjzoOzB
	gF5uIegw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taG7s-00000008DC9-3E2E;
	Tue, 21 Jan 2025 15:25:12 +0000
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taG1O-00000008CGX-3mcE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 15:18:32 +0000
Received: by mail-ej1-x641.google.com with SMTP id a640c23a62f3a-aaec111762bso1082195966b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jan 2025 07:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1737472709; x=1738077509; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1vDXJK4KbYxcZJlt3fw7FKxfRAL1QGGnOoRjEgA9o2w=;
        b=dygI333GgdFe/PX8x8qApql0VHb+6oyu7cbpmbuDLw/g/A0c4dCRxc0HEwopKD5awj
         KoUgHp4X20WKc1NI1kcpOrAjpqoRjLj1WPpbGGTVm0Fcn8EDTvsaXegr1UB3IEqqcf/k
         OhC8VrmuXhELMSxZma4zbmCAnpsk+YGnA0X53P3p5C4TR5ArQvGtHnAr9+u3r9QuWxC6
         LO3lP+ivqObdgA35fcJYgU1T3KB3Bpr2CSxY09NWzsfxOEe6Gl7J6/6XohF2YVwGYhYg
         lFKFLjZf0FqfTsioxBJe+RUx9BsLxB49KhTZmYfU7qOlJxFSyN8aRgcOEJyndO7xri+w
         2pOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737472709; x=1738077509;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1vDXJK4KbYxcZJlt3fw7FKxfRAL1QGGnOoRjEgA9o2w=;
        b=Knjbv60mXsswC4j4KEEtJGMXzCHk3XwvUcGT7S5oQmYkTp4VSnnEeCoJ81U3XthGDK
         4d41q3IQ4D8iSPho41hKCqlVcnrVhuaZex2bzUW28F5nHOTDrm2CaFj8yvl+mO2qUZ0y
         mDulIhFUIUDrib298sFbmYxrDRwCMRuMeb3INtuy0kdKOEg3wGdSzSiSGla5XFCEv29X
         vcT6kCRdOuxrGX9qLnLUIOOUayc5F/goyo/FAQUD262uPW8h/b8tO2IDbbaVM6tLug9V
         7YnbiP5sjdKjbrMvulaATvQWT/3rHTGWMcq2SmM6vFFtmbmHPCib/LovRPjLaOT5KxUb
         3FpQ==
X-Forwarded-Encrypted: i=1; AJvYcCV14Jl8tFjgpFsLGw+cC5P89A4UvhDisoxy/06JeXS2v0wDzrirKzLDLgB+m9zKlZPP2u9A3Yhyo5roP3PWym9d@lists.infradead.org
X-Gm-Message-State: AOJu0Ywl+XAb1kFCMs6uDD0qtEdh/m0aDQjsEvX7RUmDdfjX+C0j7kiU
	3fPppWh7GAAPFBurE+u3W5xTW3PRRyxH1kajJ9CKLhEOu+nWbN76SC0mhK+DCw4=
X-Gm-Gg: ASbGncvWkQg0HyC+1QOMtm9dqb7U+r9BAhk/fK9Pszsvy2yG8jjw3Y6aQTkZ/xlsXoE
	pNQm+o1wkbkPCX1gwXgdmoQwfvHr7CV/8EXQ/shZZLmKuTbIwB32CLLXvHKbN/n7ZggJv8N2jDN
	huxxKfmsGQNMpgWcuSzOXyit/BF1adA8ZXFLItEpIliqO5tf2homO5OPyiQPA/SwXBzHA/XJQuc
	j2xppBtMVmCqwla3aCaAltLU+tQzDqFbFUM7FlIIxHvH5hOCyl4oJJ+7Lg48KEKG17rkpbB9Sin
	xhlZFDZ19QK3qG72jPeF6rYioBL2FeeXIz9PX6oH
X-Google-Smtp-Source: AGHT+IEAYrB4ZnhRxgxUfTTRbx252YKxI33JmIyfaSG0E9U1Xt61QWphw76hL6w5A49qZMtALYAPDg==
X-Received: by 2002:a17:907:1b1c:b0:ab2:c0ba:519e with SMTP id a640c23a62f3a-ab38b3701d1mr1506057866b.35.1737472709292;
        Tue, 21 Jan 2025 07:18:29 -0800 (PST)
Received: from localhost (host-87-14-236-197.retail.telecomitalia.it. [87.14.236.197])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384fcb5desm755070666b.165.2025.01.21.07.18.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 07:18:28 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Tue, 21 Jan 2025 16:19:22 +0100
To: Herve Codina <herve.codina@bootlin.com>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v6 08/10] misc: rp1: RaspberryPi RP1 misc driver
Message-ID: <Z4-6-ifsuuKMHimq@apocalypse>
References: <cover.1736776658.git.andrea.porta@suse.com>
 <550590a5a0b80dd8a0c655921ec0aa41a67c8148.1736776658.git.andrea.porta@suse.com>
 <2025011722-motocross-finally-e664@gregkh>
 <Z49eOdVvwknOoD3E@apocalypse>
 <2025012143-rippling-rehydrate-581b@gregkh>
 <Z4-oORWO4BgOqibB@apocalypse>
 <2025012157-bonsai-caddie-19b2@gregkh>
 <Z4-xcjov0HLivfVX@apocalypse>
 <2025012148-unused-winking-7d51@gregkh>
 <20250121161512.2a3ac703@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250121161512.2a3ac703@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_071830_955171_206393F8 
X-CRM114-Status: GOOD (  48.66  )
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

Hi Herve,

On 16:15 Tue 21 Jan     , Herve Codina wrote:
> Hi Andrea,
> 
> On Tue, 21 Jan 2025 15:49:04 +0100
> Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:
> 
> > On Tue, Jan 21, 2025 at 03:38:42PM +0100, Andrea della Porta wrote:
> > > Hi Greg,
> > > 
> > > On 15:18 Tue 21 Jan     , Greg Kroah-Hartman wrote:  
> > > > On Tue, Jan 21, 2025 at 02:59:21PM +0100, Andrea della Porta wrote:  
> > > > > Hi Greg,
> > > > > 
> > > > > On 09:48 Tue 21 Jan     , Greg Kroah-Hartman wrote:  
> > > > > > On Tue, Jan 21, 2025 at 09:43:37AM +0100, Andrea della Porta wrote:  
> > > > > > > Hi Greg,
> > > > > > > 
> > > > > > > On 12:47 Fri 17 Jan     , Greg Kroah-Hartman wrote:  
> > > > > > > > On Mon, Jan 13, 2025 at 03:58:07PM +0100, Andrea della Porta wrote:  
> > > > > > > > > The RaspberryPi RP1 is a PCI multi function device containing
> > > > > > > > > peripherals ranging from Ethernet to USB controller, I2C, SPI
> > > > > > > > > and others.
> > > > > > > > > 
> > > > > > > > > Implement a bare minimum driver to operate the RP1, leveraging
> > > > > > > > > actual OF based driver implementations for the on-board peripherals
> > > > > > > > > by loading a devicetree overlay during driver probe.
> > > > > > > > > 
> > > > > > > > > The peripherals are accessed by mapping MMIO registers starting
> > > > > > > > > from PCI BAR1 region.
> > > > > > > > > 
> > > > > > > > > With the overlay approach we can achieve more generic and agnostic
> > > > > > > > > approach to managing this chipset, being that it is a PCI endpoint
> > > > > > > > > and could possibly be reused in other hw implementations. The
> > > > > > > > > presented approach is also used by Bootlin's Microchip LAN966x
> > > > > > > > > patchset (see link) as well, for a similar chipset.
> > > > > > > > > 
> > > > > > > > > For reasons why this driver is contained in drivers/misc, please
> > > > > > > > > check the links.  
> > > > > > > > 
> > > > > > > > Links aren't always around all the time, please document it here why
> > > > > > > > this is needed, and then links can "add to" that summary.  
> > > > > > > 
> > > > > > > Ack.
> > > > > > >   
> > > > > > > >   
> > > > > > > > > This driver is heavily based on downstream code from RaspberryPi
> > > > > > > > > Foundation, and the original author is Phil Elwell.
> > > > > > > > > 
> > > > > > > > > Link: https://datasheets.raspberrypi.com/rp1/rp1-peripherals.pdf  
> > > > > > > 
> > > > > > > ...
> > > > > > >   
> > > > > > > > > diff --git a/drivers/misc/rp1/rp1_pci.c b/drivers/misc/rp1/rp1_pci.c
> > > > > > > > > new file mode 100644
> > > > > > > > > index 000000000000..3e8ba3fa7fd5
> > > > > > > > > --- /dev/null
> > > > > > > > > +++ b/drivers/misc/rp1/rp1_pci.c
> > > > > > > > > @@ -0,0 +1,305 @@
> > > > > > > > > +// SPDX-License-Identifier: GPL-2.0
> > > > > > > > > +/*
> > > > > > > > > + * Copyright (c) 2018-24 Raspberry Pi Ltd.
> > > > > > > > > + * All rights reserved.
> > > > > > > > > + */
> > > > > > > > > +
> > > > > > > > > +#include <linux/err.h>
> > > > > > > > > +#include <linux/interrupt.h>
> > > > > > > > > +#include <linux/irq.h>
> > > > > > > > > +#include <linux/irqchip/chained_irq.h>
> > > > > > > > > +#include <linux/irqdomain.h>
> > > > > > > > > +#include <linux/module.h>
> > > > > > > > > +#include <linux/msi.h>
> > > > > > > > > +#include <linux/of_platform.h>
> > > > > > > > > +#include <linux/pci.h>
> > > > > > > > > +#include <linux/platform_device.h>
> > > > > > > > > +
> > > > > > > > > +#include "rp1_pci.h"  
> > > > > > > > 
> > > > > > > > Why does a self-contained .c file need a .h file?  Please put it all in
> > > > > > > > here.  
> > > > > > > 
> > > > > > > I agree with you. Indeed, the very first version of this patch had the header
> > > > > > > file placed inside the .c, but I received concerns about it and some advice to
> > > > > > > do it differently, as you can see here:
> > > > > > > https://lore.kernel.org/all/ZtWDpaqUG9d9yPPf@apocalypse/
> > > > > > > so I've changed it accordingly in V2. So right now I'm not sure what the
> > > > > > > acceptable behaviour should be ...  
> > > > > > 
> > > > > > It's a pretty simple rule:
> > > > > > 	Only use a .h file if multiple .c files need to see the symbol.
> > > > > > 
> > > > > > So no .h file is needed here.  
> > > > > 
> > > > > Perfect, I'll revert back that two lines to V1 then. Please be aware
> > > > > though that this will trigger the following checkpatch warning:
> > > > > 
> > > > > WARNING: externs should be avoided in .c files  
> > > > 
> > > > Well where are those externs defined at?  Shouldn't there be a .h file
> > > > for them somewhere in the tree if they really are global?  
> > > 
> > > Those symbols are deined in drivers/misc/rp1/rp1-pci.dtbo.S (added by
> > > this patchset) and created by cmd_wrap_S_dtb in scripts/Makefile.lib.
> > > They are just placeholders that contains rp1-pci.dtbo as
> > > a binary blob, in order for the driver (rp1_pci.c) to be able to use
> > > the binary buffer representing the overlay and address it from the
> > > driver probe function.
> > > So there's no other reference from outside rp1_pci.c to those two symbols.
> > > In comparison, this is the very same approach used by a recently accepted
> > > patch involving drivers/misc/lan966x_pci.c, which also has the two externs
> > > in it and triggers the same checkpatch warning.  
> > 
> > Ok, that's fine, checkpatch is just a hint, not a hard-and-fast-rule.
> > 
> 
> Maybe just to avoid confusion for future readers, you can add a comment as I
> did for the lan966x:
>   https://elixir.bootlin.com/linux/v6.13-rc3/source/drivers/misc/lan966x_pci.c#L21
> 
> This will not avoid the warning but will give an explanation to people
> looking closer at this checkpatch warning.

Good advice, thanks Herve! Added...

Regards,
Andrea

> 
> Best regards,
> Hervé

