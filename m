Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E2D0C02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 14:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ndX+bS7mfcHIUz3eSPCBChEUR/+D/+QHPhUMGbWKkjw=; b=vnizzdsGer+LKX7R7bTZjsE2e3
	+F4a2ym9yNlgUWbtVPdJfZgjkQwRsve9L31Y7X+SeggR4F/mcgyiUDvEvuC2zQOk7//CE6ESzBV8r
	Z79ZGXyu4O+X4n4F8rKAq/Mrc9XP2AVZ10Kru/Eo0kB/vWyJy3napJMz4SW1iTU41BetiNLg8VaLQ
	QPl0d3qjLpSmL9T9zXf6Ljac20++9LO0o9ytouLR05VWOJmzQS+vRFvBMyOikSmz3NMXVRlNFP76u
	Zd78nP0U57HgZB0kFBnjhN31i8CJIzJ0AkDAXJeaJfktuLIrL7/vU2/8O1L43r+T3QKBFAucBGgV7
	gOWLRfMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taEnG-000000081Ez-3Kyt;
	Tue, 21 Jan 2025 13:59:50 +0000
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taEly-0000000817m-00CJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 13:58:32 +0000
Received: by mail-ej1-x644.google.com with SMTP id a640c23a62f3a-aae81f4fdc4so1120775466b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jan 2025 05:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1737467908; x=1738072708; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ndX+bS7mfcHIUz3eSPCBChEUR/+D/+QHPhUMGbWKkjw=;
        b=AzY5pcmpIc8LqzxYGXtEBUMH8yXMuwpl7/xYaqIlDX7woEgHxB2+uNCK1pSrjAiEIK
         xMd946TDLtsuwZJHJjb9ZE0nbl8hxmW6yeuHJPlhL8szo/9wsZtredfoS7hrgr/S/3De
         ZYcka/iREV/ojKjgOJ8qmVqjMMCiGVXpfFMT8V2fc9QseMX0q4D/7xyLDsjTH91ICCxP
         ObL/jSnGsOY0GoGf8hq+6Jw4SUFP5H5vBaEeai6A3dUkVetDdJbKNcB2axM8m7+Y2dxT
         yFYiGsuce8PF/vUCpuVXZYp4pizv9sscuwK8wKY3pFYMbR1X6RyYboSsY14uR37zuCEX
         lCtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737467908; x=1738072708;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ndX+bS7mfcHIUz3eSPCBChEUR/+D/+QHPhUMGbWKkjw=;
        b=e6mbhVFVV+ggZJPE71dAf7I1UnvPhw9SmKfkjQ22Opg3YhS/4UcRl+R3RefiXxOsvf
         tJA98bfQoAjAWua2aikAdqrsn1335YOOPXk7aKKwdyNZTrLRqDHKuSnphiNJi4yL90vm
         8HxghlJT2yVAw4Ub6E7Wg9CVusKql3hkBYd2Zl8KCg5ZghoKHzVMuxp9UPHqyyBUcfP1
         uSKd56GxiqUNE3ygrBCxOIIj9N5OkkiL5VAEuPM0X9/M2i/oB+xTNvFrLe+TKuVdvXKE
         Q0YYsjhKbDhHYoCxETGDDmOTZf6gabNTOqOBiCmOjf/iG75lkEPOcUK3o0egU4h3zG5m
         OX0g==
X-Forwarded-Encrypted: i=1; AJvYcCXqjluH+TRJ/vIaGQ0TBkGD5t8r+e+ul5FKkmgYZq5v+u4rFPtmx1Xd6OUYLrAzXhqoSdpLPa+LXwfBuXncgZao@lists.infradead.org
X-Gm-Message-State: AOJu0YzTaW6PfDBmtWo4ggbk2BDVFhlpGpUTyB9c+tpksRwt2FWnI9mE
	ipFp87XA70asxRjRtFazL/JdDz0kHyrYQNIBwY8yopMCWv8ncN1oi+HHSRV6Y7g=
X-Gm-Gg: ASbGncuu1CXFLqunjeYt1aMUKGrWKT0meGd5t0YGui69m87soo/iBv7WUb7WE1E6GBt
	+usmRLdxPHidl5UX3eAhwXvVQtrWKvpp3iRNndEwtBfT+1NbG5iwasumREvr8BzE5KTFgmfGZTC
	EfrWcj6KJD7NJZamLANjCaBs3HgA/7A/99kCO/QO1PposaS+stg0qdkr9H+yAgECEYZuPRzjCmY
	JItC0pgMGi+806Z40NbjXQjqLlp0sn74DTpb5SeMqyvC1NUriFUbtLECK2+6ujYy/XfoS8xJgTv
	PvZ0JheeSoNN8vvALH3Hipcqpatin9VHXwMzoxbN
X-Google-Smtp-Source: AGHT+IGUuk+xvGmbiQD3bRfCbckgBF2RVH3B6tetIFWqVCQnsVutS7iL+mu2n84MUq9YEhicZgprHw==
X-Received: by 2002:a17:906:f58e:b0:ab2:f816:c5e0 with SMTP id a640c23a62f3a-ab38b1e569cmr1477479066b.12.1737467908253;
        Tue, 21 Jan 2025 05:58:28 -0800 (PST)
Received: from localhost (host-87-14-236-197.retail.telecomitalia.it. [87.14.236.197])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384c5ad98sm753624766b.28.2025.01.21.05.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 05:58:27 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Tue, 21 Jan 2025 14:59:21 +0100
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
Message-ID: <Z4-oORWO4BgOqibB@apocalypse>
References: <cover.1736776658.git.andrea.porta@suse.com>
 <550590a5a0b80dd8a0c655921ec0aa41a67c8148.1736776658.git.andrea.porta@suse.com>
 <2025011722-motocross-finally-e664@gregkh>
 <Z49eOdVvwknOoD3E@apocalypse>
 <2025012143-rippling-rehydrate-581b@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025012143-rippling-rehydrate-581b@gregkh>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_055830_042845_ED362E7B 
X-CRM114-Status: GOOD (  44.94  )
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

On 09:48 Tue 21 Jan     , Greg Kroah-Hartman wrote:
> On Tue, Jan 21, 2025 at 09:43:37AM +0100, Andrea della Porta wrote:
> > Hi Greg,
> > 
> > On 12:47 Fri 17 Jan     , Greg Kroah-Hartman wrote:
> > > On Mon, Jan 13, 2025 at 03:58:07PM +0100, Andrea della Porta wrote:
> > > > The RaspberryPi RP1 is a PCI multi function device containing
> > > > peripherals ranging from Ethernet to USB controller, I2C, SPI
> > > > and others.
> > > > 
> > > > Implement a bare minimum driver to operate the RP1, leveraging
> > > > actual OF based driver implementations for the on-board peripherals
> > > > by loading a devicetree overlay during driver probe.
> > > > 
> > > > The peripherals are accessed by mapping MMIO registers starting
> > > > from PCI BAR1 region.
> > > > 
> > > > With the overlay approach we can achieve more generic and agnostic
> > > > approach to managing this chipset, being that it is a PCI endpoint
> > > > and could possibly be reused in other hw implementations. The
> > > > presented approach is also used by Bootlin's Microchip LAN966x
> > > > patchset (see link) as well, for a similar chipset.
> > > > 
> > > > For reasons why this driver is contained in drivers/misc, please
> > > > check the links.
> > > 
> > > Links aren't always around all the time, please document it here why
> > > this is needed, and then links can "add to" that summary.
> > 
> > Ack.
> > 
> > > 
> > > > This driver is heavily based on downstream code from RaspberryPi
> > > > Foundation, and the original author is Phil Elwell.
> > > > 
> > > > Link: https://datasheets.raspberrypi.com/rp1/rp1-peripherals.pdf
> > 
> > ...
> > 
> > > > diff --git a/drivers/misc/rp1/rp1_pci.c b/drivers/misc/rp1/rp1_pci.c
> > > > new file mode 100644
> > > > index 000000000000..3e8ba3fa7fd5
> > > > --- /dev/null
> > > > +++ b/drivers/misc/rp1/rp1_pci.c
> > > > @@ -0,0 +1,305 @@
> > > > +// SPDX-License-Identifier: GPL-2.0
> > > > +/*
> > > > + * Copyright (c) 2018-24 Raspberry Pi Ltd.
> > > > + * All rights reserved.
> > > > + */
> > > > +
> > > > +#include <linux/err.h>
> > > > +#include <linux/interrupt.h>
> > > > +#include <linux/irq.h>
> > > > +#include <linux/irqchip/chained_irq.h>
> > > > +#include <linux/irqdomain.h>
> > > > +#include <linux/module.h>
> > > > +#include <linux/msi.h>
> > > > +#include <linux/of_platform.h>
> > > > +#include <linux/pci.h>
> > > > +#include <linux/platform_device.h>
> > > > +
> > > > +#include "rp1_pci.h"
> > > 
> > > Why does a self-contained .c file need a .h file?  Please put it all in
> > > here.
> > 
> > I agree with you. Indeed, the very first version of this patch had the header
> > file placed inside the .c, but I received concerns about it and some advice to
> > do it differently, as you can see here:
> > https://lore.kernel.org/all/ZtWDpaqUG9d9yPPf@apocalypse/
> > so I've changed it accordingly in V2. So right now I'm not sure what the
> > acceptable behaviour should be ...
> 
> It's a pretty simple rule:
> 	Only use a .h file if multiple .c files need to see the symbol.
> 
> So no .h file is needed here.

Perfect, I'll revert back that two lines to V1 then. Please be aware
though that this will trigger the following checkpatch warning:

WARNING: externs should be avoided in .c files

> 
> > > > +struct rp1_dev {
> > > > +	struct pci_dev *pdev;
> > > > +	struct irq_domain *domain;
> > > > +	struct irq_data *pcie_irqds[64];
> > > > +	void __iomem *bar1;
> > > > +	int ovcs_id;	/* overlay changeset id */
> > > > +	bool level_triggered_irq[RP1_INT_END];
> > > > +};
> > > > +
> > > > +static void msix_cfg_set(struct rp1_dev *rp1, unsigned int hwirq, u32 value)
> > > > +{
> > > > +	iowrite32(value, rp1->bar1 + RP1_PCIE_APBS_BASE + REG_SET + MSIX_CFG(hwirq));
> > > 
> > > Do your writes need a read to flush them properly?  Or can they handle
> > > this automatically?
> > >
> > 
> > I had some thoughts with RaspberryPi foundation folks to double check it, and it
> > seems that there should be no need to readback the value (unless we want to go
> > really paranoid), so I would avoid that since in case of level handled interrupt
> > we would end up reading the register on every triggering interrupts.
> 
> Ok, if it passes testing, that's fine, hopefully it works properly, but
> if not, you now have a trail to go and fix it in the future :)

Sure :)

Many thanks,
Andrea

> 
> thanks,
> 
> greg k-h

