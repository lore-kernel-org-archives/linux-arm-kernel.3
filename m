Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2595C02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 14:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OP+yLZsGZnxZl3XcQ+L57qZeoo+bUmeJesOySRXDb2M=; b=u23dxhky+rRAlcnTD9M8BeCaEk
	1pQ5p8iAj5LGNao0EAgfMYEMkozOv6r5+Rp+fRY4bDhBei/wMS7oJAPyZ8nTOzNuVahaDfAXx8OMN
	TWYYtVsaJluo5KUUNmWNCwBa6SMWAQGcIQ2XKJDRC/BfZ64w/d71baAWjQGtcz8UACwsrOSnH1Opb
	yRlIE2QHoF1pkK61OIXcNNby0mLn1u6nDXtFleBIwApeYpcO8ARCcLMH5+oIkn3syj3aa4c2RSZZ+
	oi1NiyPdrmfNbxXroqqWCIhfPBkvMyF5hwEOxtXokg7sHOA+yKFDekF2t3YJbA8G6JIawiA1tsCVT
	CqMd7s3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taFPM-000000085tK-2g82;
	Tue, 21 Jan 2025 14:39:12 +0000
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taFO3-000000085Sn-01L4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 14:37:52 +0000
Received: by mail-ej1-x644.google.com with SMTP id a640c23a62f3a-ab643063598so129803266b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jan 2025 06:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1737470269; x=1738075069; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OP+yLZsGZnxZl3XcQ+L57qZeoo+bUmeJesOySRXDb2M=;
        b=VQvlcPRmiAt6aIHhaqHehYg+8VhScGdpo8V6bTf10psEY7oDMbFekKKnjjr44dESzZ
         ED7JsHAD2fRsLb6GVxAcOeUArO/2FkiAClbBuhDnF1PsibH7ph6jGqENM7wMsbqeIlM1
         kCaK8HAXSYzCgAfeh7a+WvjHR33PDdFsyZtMGbQ/KVP0ENlYTD4B66nYCKObEMiRJQxF
         BivcBhuR2lVocVt0GlEKWKDHbyj4XhsIKOMcuTHWEYisxYXLEB1KcBiZVkdRmTWhJJxb
         pLlKUlSAnkqneacsY+ZZewviHk+PmcbvscLwWLkfoqiqexUmlIPoqInv8iVl3K35zdx5
         e/Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737470269; x=1738075069;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OP+yLZsGZnxZl3XcQ+L57qZeoo+bUmeJesOySRXDb2M=;
        b=uiIFc5gUn+xGzOkisrCajFrBcjsjDcL7pHB4L3Jm7b3g810WMheSa5Ing3MtQsGgvO
         7CMTVb8jfvnSx4+09QSI0CPOE/b6ffM158oW/12kFdCuTcbGAFtJ//LtQYCE1T2F1nH7
         JnGhMBpd3WYj0i/blMqqkL7flsQgE3QYAGjj0cDn7IVHExNqIFAxiRlrrvDrraikDrTS
         GWImOxeGG14mXKczKVsc8FI6DiNqwTDEeOT6YaULrq8A/NizmR8KGYsjXz6BjgfSswT6
         1lXBgX66ZJnFJ/w8fZrnX9+H7dXZgTitqFJUEm7cSeBI0FQg2YtkQt/Fwv8sPs5Nlhsp
         dO5w==
X-Forwarded-Encrypted: i=1; AJvYcCXALVKtk/D04WQ+sUcsVRZP71Rb32f1z3YuFKdk3VQqVOaNz8OboFjoL+aYTqWkO9wJjXcQDqRqHsWp+FTKNPWM@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6SqFd72g0nrWEiJfTjcV9AmXevSWTxl/eiS8khIs81yVUGRtu
	BNqk2fSNgIN+14a3vi5Tn+9YbjPJX16Ji876eQRaUxwZz02ObI+zLXl3IsCq5ik=
X-Gm-Gg: ASbGncuj6s62+DP1EwTF0bOLW7ObCtgxJ7EK/T0Y6uK6uf14o56JbmmETuTJVREqIB+
	MJRlUuW5YWRKMhnhHYb8TCQ5cKblwHWbwjpXPdIsbaYYy1gqih8xub02+nLw/zuVShJEIACaD6W
	38jZu0CYB+PtzUf7OcSpLYe0Iwszl/3fPvcLjMpApPCCgOLaYa9H8RocXeeZUlEUmhoE6alOwqG
	Eg7WXTWddPtOd40Mg/7Y1Mfh/w81am5ethDq8WchtnHBagcvDI4le/1cwYvZNmkKf0gA/xEMsGm
	vdD1tM0WbbnPLxw5ccGSIJcEgvH18B5Vhm2SR+Eh
X-Google-Smtp-Source: AGHT+IHrdKVrwSeMZy2lajXUFaaswl4BBAIMKjnMweMj9CE4d/aKkVXO5Bbtz0sEBeHig2196Qh7kg==
X-Received: by 2002:a05:6402:5106:b0:5d0:ced8:d22d with SMTP id 4fb4d7f45d1cf-5db7db07334mr41029714a12.22.1737470269436;
        Tue, 21 Jan 2025 06:37:49 -0800 (PST)
Received: from localhost (host-87-14-236-197.retail.telecomitalia.it. [87.14.236.197])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab64998511esm53461766b.68.2025.01.21.06.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 06:37:49 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Tue, 21 Jan 2025 15:38:42 +0100
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
Message-ID: <Z4-xcjov0HLivfVX@apocalypse>
References: <cover.1736776658.git.andrea.porta@suse.com>
 <550590a5a0b80dd8a0c655921ec0aa41a67c8148.1736776658.git.andrea.porta@suse.com>
 <2025011722-motocross-finally-e664@gregkh>
 <Z49eOdVvwknOoD3E@apocalypse>
 <2025012143-rippling-rehydrate-581b@gregkh>
 <Z4-oORWO4BgOqibB@apocalypse>
 <2025012157-bonsai-caddie-19b2@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025012157-bonsai-caddie-19b2@gregkh>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_063751_045565_96CB210F 
X-CRM114-Status: GOOD (  43.32  )
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

On 15:18 Tue 21 Jan     , Greg Kroah-Hartman wrote:
> On Tue, Jan 21, 2025 at 02:59:21PM +0100, Andrea della Porta wrote:
> > Hi Greg,
> > 
> > On 09:48 Tue 21 Jan     , Greg Kroah-Hartman wrote:
> > > On Tue, Jan 21, 2025 at 09:43:37AM +0100, Andrea della Porta wrote:
> > > > Hi Greg,
> > > > 
> > > > On 12:47 Fri 17 Jan     , Greg Kroah-Hartman wrote:
> > > > > On Mon, Jan 13, 2025 at 03:58:07PM +0100, Andrea della Porta wrote:
> > > > > > The RaspberryPi RP1 is a PCI multi function device containing
> > > > > > peripherals ranging from Ethernet to USB controller, I2C, SPI
> > > > > > and others.
> > > > > > 
> > > > > > Implement a bare minimum driver to operate the RP1, leveraging
> > > > > > actual OF based driver implementations for the on-board peripherals
> > > > > > by loading a devicetree overlay during driver probe.
> > > > > > 
> > > > > > The peripherals are accessed by mapping MMIO registers starting
> > > > > > from PCI BAR1 region.
> > > > > > 
> > > > > > With the overlay approach we can achieve more generic and agnostic
> > > > > > approach to managing this chipset, being that it is a PCI endpoint
> > > > > > and could possibly be reused in other hw implementations. The
> > > > > > presented approach is also used by Bootlin's Microchip LAN966x
> > > > > > patchset (see link) as well, for a similar chipset.
> > > > > > 
> > > > > > For reasons why this driver is contained in drivers/misc, please
> > > > > > check the links.
> > > > > 
> > > > > Links aren't always around all the time, please document it here why
> > > > > this is needed, and then links can "add to" that summary.
> > > > 
> > > > Ack.
> > > > 
> > > > > 
> > > > > > This driver is heavily based on downstream code from RaspberryPi
> > > > > > Foundation, and the original author is Phil Elwell.
> > > > > > 
> > > > > > Link: https://datasheets.raspberrypi.com/rp1/rp1-peripherals.pdf
> > > > 
> > > > ...
> > > > 
> > > > > > diff --git a/drivers/misc/rp1/rp1_pci.c b/drivers/misc/rp1/rp1_pci.c
> > > > > > new file mode 100644
> > > > > > index 000000000000..3e8ba3fa7fd5
> > > > > > --- /dev/null
> > > > > > +++ b/drivers/misc/rp1/rp1_pci.c
> > > > > > @@ -0,0 +1,305 @@
> > > > > > +// SPDX-License-Identifier: GPL-2.0
> > > > > > +/*
> > > > > > + * Copyright (c) 2018-24 Raspberry Pi Ltd.
> > > > > > + * All rights reserved.
> > > > > > + */
> > > > > > +
> > > > > > +#include <linux/err.h>
> > > > > > +#include <linux/interrupt.h>
> > > > > > +#include <linux/irq.h>
> > > > > > +#include <linux/irqchip/chained_irq.h>
> > > > > > +#include <linux/irqdomain.h>
> > > > > > +#include <linux/module.h>
> > > > > > +#include <linux/msi.h>
> > > > > > +#include <linux/of_platform.h>
> > > > > > +#include <linux/pci.h>
> > > > > > +#include <linux/platform_device.h>
> > > > > > +
> > > > > > +#include "rp1_pci.h"
> > > > > 
> > > > > Why does a self-contained .c file need a .h file?  Please put it all in
> > > > > here.
> > > > 
> > > > I agree with you. Indeed, the very first version of this patch had the header
> > > > file placed inside the .c, but I received concerns about it and some advice to
> > > > do it differently, as you can see here:
> > > > https://lore.kernel.org/all/ZtWDpaqUG9d9yPPf@apocalypse/
> > > > so I've changed it accordingly in V2. So right now I'm not sure what the
> > > > acceptable behaviour should be ...
> > > 
> > > It's a pretty simple rule:
> > > 	Only use a .h file if multiple .c files need to see the symbol.
> > > 
> > > So no .h file is needed here.
> > 
> > Perfect, I'll revert back that two lines to V1 then. Please be aware
> > though that this will trigger the following checkpatch warning:
> > 
> > WARNING: externs should be avoided in .c files
> 
> Well where are those externs defined at?  Shouldn't there be a .h file
> for them somewhere in the tree if they really are global?

Those symbols are deined in drivers/misc/rp1/rp1-pci.dtbo.S (added by
this patchset) and created by cmd_wrap_S_dtb in scripts/Makefile.lib.
They are just placeholders that contains rp1-pci.dtbo as
a binary blob, in order for the driver (rp1_pci.c) to be able to use
the binary buffer representing the overlay and address it from the
driver probe function.
So there's no other reference from outside rp1_pci.c to those two symbols.
In comparison, this is the very same approach used by a recently accepted
patch involving drivers/misc/lan966x_pci.c, which also has the two externs
in it and triggers the same checkpatch warning.

Many thanks,
Andrea

> 
> thanks,
> 
> greg k-h

