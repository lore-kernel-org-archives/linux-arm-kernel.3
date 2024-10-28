Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CC0ED13570
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 10:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PkxBuoVPqj0OfiHh/mFn83XdlLQoFKmbAZ+ZKZ6JhHA=; b=W8+tuYh/gZB8yYvLhZFFLilz57
	YkGQv+1C0Ka9JCdt/I3y1Z6KyGgLKwdQYs7rMEVfr89A1zwi3QzaqtRPAqnGUUIFf01GdX/SUJDqo
	XficasVav1BB5TkW4kpehGWFUAB0j7xg7ARrObKtGsjwpx/gzvi4gMpwMlVA9GI9kiC+aN50J1reL
	WptA17UTtLJ+SgqxdPjXRNjuCgpNuV0PU3hCkZ4qgTw1Ky4HR8ZyjxJ0GgObQtaYyd8Jn2R+BrgPx
	Xk/Jifeo14+Wn/MiEc5lnnXFWcNVL3h//BVsZyFzzrQbANC1tBbr3VADl4+hHQZvG1ej+AjfoGMPg
	RaR7hZGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5MdT-0000000ALJW-0Qrg;
	Mon, 28 Oct 2024 10:06:07 +0000
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5MUy-0000000AK2Z-45sy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 09:57:22 +0000
Received: by mail-ej1-x642.google.com with SMTP id a640c23a62f3a-a9a628b68a7so636432366b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 02:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730109439; x=1730714239; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PkxBuoVPqj0OfiHh/mFn83XdlLQoFKmbAZ+ZKZ6JhHA=;
        b=f12z6umjHqXUruKSOmXdB493m2coni9ds73dv3H9YvB+VolpzjgP1Ia3YA1gHlWjPL
         ys7btFMneBzbJtecV7PA8Nmjs93Ze+qSYgfvSTpZsxGcrPTki2fto5pjeWegN5+hB3X1
         CeWmW5oa5zTOLKXs2NX8AZDXRpJHfz+y0uAnmtdW5jbvYJj56r55SEfwHjc1lOXxNEnI
         gO8/VXGgazLSi5RFl/yd8BZRpNByR2bsMcBAd5YL1mSRcTEPnXCkflFdZ4wt7VX+vatM
         hGVq0lI0QQ88keqCiCTHFboQcDBIZV6IUruIUbBnr6SkXQCJ/7ExVXLHifhJOMoam3r8
         12aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730109439; x=1730714239;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PkxBuoVPqj0OfiHh/mFn83XdlLQoFKmbAZ+ZKZ6JhHA=;
        b=jl446M35eZyz5xJ4ODV5JfVxQ8heeOOd04KGaZ6zpx0D/5IOxQ1GGxn+o9kW6sXC51
         qRqKJlJFfn2T+fNzRm7WS2Kci/ahSBpxSRpcUAT34Ff6om0Jpe8GB8640TBg8B5Obf75
         VONcyWL6azG6DFOW71Y5CGyWY/cgMQQbB/mOYGJjK/lzcVzXXY7UHjE1OCs+jsmW267d
         BLtTQ9+hdgsQevKpPsk0atn25yY2XoFCManDTmUV7yUDWrvja7IoeQg9MJESV8jhODp/
         m/cWn8w2q2vTXfUmwE+RqV35jxgGMXJhrfXO/zCE479nTm5XSeADCgdjnihx+9t6dlmY
         vDJg==
X-Forwarded-Encrypted: i=1; AJvYcCUO+xRZlOUJAd9kK3iwgYHVzzPN+6TAdQePbr4QNqeWnbgWw4AHBfEEXasmMRnkmwWuXaDajEBcQEgiBHTkVRPI@lists.infradead.org
X-Gm-Message-State: AOJu0YzG2wWmKcSBcn4WBOaqmpO2qmlH8KdS8IvwBdTzmMQmk+6gnoqr
	I1NjIU+kEA6AXiE1UIYHzAVtfsb2VpBjxXqADQjugG20/mubneqLeHcxT+QinzA=
X-Google-Smtp-Source: AGHT+IFotamnLiSYsC5Q56j0LUhyeU0liHMjWSjtW4QU8pUEQOmpkk4Bl6W6TMCdmj6CG056zWIhuQ==
X-Received: by 2002:a17:907:97d4:b0:a9a:a7fd:d840 with SMTP id a640c23a62f3a-a9de5cfea5emr627872766b.1.1730109438690;
        Mon, 28 Oct 2024 02:57:18 -0700 (PDT)
Received: from localhost (host-79-35-211-193.retail.telecomitalia.it. [79.35.211.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1e1a6bfesm363431566b.19.2024.10.28.02.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 02:57:18 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Mon, 28 Oct 2024 10:57:41 +0100
To: Herve Codina <herve.codina@bootlin.com>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
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
	Stefan Wahren <wahrenst@gmx.net>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v2 11/14] misc: rp1: RaspberryPi RP1 misc driver
Message-ID: <Zx9gFahEv4tq_YVl@apocalypse>
References: <cover.1728300189.git.andrea.porta@suse.com>
 <c5b072393d2dc157d34f6dbeff6261d142d4de69.1728300190.git.andrea.porta@suse.com>
 <20241007174127.13a901cd@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241007174127.13a901cd@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_025721_040342_69A8A6E7 
X-CRM114-Status: GOOD (  50.33  )
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

On 17:41 Mon 07 Oct     , Herve Codina wrote:
> Hi Andrea,
> 
> Nice to see that other PCI drivers will use the DT overlay over PCI feature!
> 
> On Mon,  7 Oct 2024 14:39:54 +0200
> Andrea della Porta <andrea.porta@suse.com> wrote:
> 
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
> > Since the gpio line names should be provided by the user, there
> > is an interface through configfs that allows the userspace to
> > load a DT overlay that will provide gpio-line-names property.
> > The interface can be invoked like this:
> > 
> > cat rpi-rp1-gpios-5-b.dtbo > /sys/kernel/config/rp1-cfg/gpio_set_names
> > 
> > and is designed to be similar to what users are already used to
> > from distro with downstream kernel.
> > 
> > For reasons why this driver is contained in drivers/misc, please
> > check the links.
> > 
> > This driver is heavily based on downstream code from RaspberryPi
> > Foundation, and the original author is Phil Elwell.
> > 
> > Link: https://datasheets.raspberrypi.com/rp1/rp1-peripherals.pdf
> > Link: https://lore.kernel.org/all/20240612140208.GC1504919@google.com/
> > Link: https://lore.kernel.org/all/83f7fa09-d0e6-4f36-a27d-cee08979be2a@app.fastmail.com/
> > Link: https://lore.kernel.org/all/2024081356-mutable-everyday-6f9d@gregkh/
> > Link: https://lore.kernel.org/all/20240808154658.247873-1-herve.codina@bootlin.com/
> > 
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> 
> ...
> > --- /dev/null
> > +++ b/drivers/misc/rp1/Makefile
> > @@ -0,0 +1,5 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +obj-$(CONFIG_MISC_RP1)		+= rp1-pci.o
> > +rp1-pci-objs			:= rp1_pci.o rp1-pci.dtbo.o
> > +
> > +DTC_FLAGS_rp1-pci += -@
> Why do you need to add the symbol table (-@ option) in your dtbo ?

This was needed for loading the dtbo for gpio-line-names over the dtbo for
RP1, but now that I've dropped that patch it is not needed anymore, so I'll
remove that.

> 
> ...
> > diff --git a/drivers/misc/rp1/rp1_pci.c b/drivers/misc/rp1/rp1_pci.c
> > new file mode 100644
> > index 000000000000..a1f7bf1804c0
> > --- /dev/null
> > +++ b/drivers/misc/rp1/rp1_pci.c
> > @@ -0,0 +1,365 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (c) 2018-24 Raspberry Pi Ltd.
> > + * All rights reserved.
> > + */
> > +
> > +#include <linux/clk.h>
> > +#include <linux/clkdev.h>
> > +#include <linux/clk-provider.h>
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
> > +#include <linux/reset.h>
> > +
> > +#include "rp1_pci.h"
> > +
> > +#define RP1_DRIVER_NAME		"rp1"
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
> > +#define RP1_INT_IO_BANK0	0
> > +#define RP1_INT_IO_BANK1	1
> > +#define RP1_INT_IO_BANK2	2
> > +#define RP1_INT_AUDIO_IN	3
> > +#define RP1_INT_AUDIO_OUT	4
> > +#define RP1_INT_PWM0		5
> > +#define RP1_INT_ETH		6
> > +#define RP1_INT_I2C0		7
> > +#define RP1_INT_I2C1		8
> > +#define RP1_INT_I2C2		9
> > +#define RP1_INT_I2C3		10
> > +#define RP1_INT_I2C4		11
> > +#define RP1_INT_I2C5		12
> > +#define RP1_INT_I2C6		13
> > +#define RP1_INT_I2S0		14
> > +#define RP1_INT_I2S1		15
> > +#define RP1_INT_I2S2		16
> > +#define RP1_INT_SDIO0		17
> > +#define RP1_INT_SDIO1		18
> > +#define RP1_INT_SPI0		19
> > +#define RP1_INT_SPI1		20
> > +#define RP1_INT_SPI2		21
> > +#define RP1_INT_SPI3		22
> > +#define RP1_INT_SPI4		23
> > +#define RP1_INT_SPI5		24
> > +#define RP1_INT_UART0		25
> > +#define RP1_INT_TIMER_0		26
> > +#define RP1_INT_TIMER_1		27
> > +#define RP1_INT_TIMER_2		28
> > +#define RP1_INT_TIMER_3		29
> > +#define RP1_INT_USBHOST0	30
> > +#define RP1_INT_USBHOST0_0	31
> > +#define RP1_INT_USBHOST0_1	32
> > +#define RP1_INT_USBHOST0_2	33
> > +#define RP1_INT_USBHOST0_3	34
> > +#define RP1_INT_USBHOST1	35
> > +#define RP1_INT_USBHOST1_0	36
> > +#define RP1_INT_USBHOST1_1	37
> > +#define RP1_INT_USBHOST1_2	38
> > +#define RP1_INT_USBHOST1_3	39
> > +#define RP1_INT_DMA		40
> > +#define RP1_INT_PWM1		41
> > +#define RP1_INT_UART1		42
> > +#define RP1_INT_UART2		43
> > +#define RP1_INT_UART3		44
> > +#define RP1_INT_UART4		45
> > +#define RP1_INT_UART5		46
> > +#define RP1_INT_MIPI0		47
> > +#define RP1_INT_MIPI1		48
> > +#define RP1_INT_VIDEO_OUT	49
> > +#define RP1_INT_PIO_0		50
> > +#define RP1_INT_PIO_1		51
> > +#define RP1_INT_ADC_FIFO	52
> > +#define RP1_INT_PCIE_OUT	53
> > +#define RP1_INT_SPI6		54
> > +#define RP1_INT_SPI7		55
> > +#define RP1_INT_SPI8		56
> > +#define RP1_INT_SYSCFG		58
> > +#define RP1_INT_CLOCKS_DEFAULT	59
> > +#define RP1_INT_VBUSCTRL	60
> > +#define RP1_INT_PROC_MISC	57
> > +#define RP1_INT_END		61
> > +
> > +struct rp1_dev {
> > +	struct pci_dev *pdev;
> > +	struct device *dev;
> > +	struct clk *sys_clk;
> > +	struct irq_domain *domain;
> > +	struct irq_data *pcie_irqds[64];
> > +	void __iomem *bar1;
> > +	int ovcs_id;
> > +	bool level_triggered_irq[RP1_INT_END];
> > +};
> > +
> > +static void dump_bar(struct pci_dev *pdev, unsigned int bar)
> > +{
> > +	dev_info(&pdev->dev,
> > +		 "bar%d %pR\n",
> > +		 bar,
> > +		 pci_resource_n(pdev, bar));
> > +}
> 
> Is this dump_bar() really needed ?

Nope. Removed.

> 
> ...
> > +static int rp1_probe(struct pci_dev *pdev, const struct pci_device_id *id)
> > +{
> > +	struct device *dev = &pdev->dev;
> > +	struct device_node *rp1_node;
> > +	struct reset_control *reset;
> > +	struct rp1_dev *rp1;
> > +	int err  = 0;
> > +	int i;
> > +
> > +	rp1_node = dev_of_node(dev);
> > +	if (!rp1_node) {
> > +		dev_err(dev, "Missing of_node for device\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	rp1 = devm_kzalloc(&pdev->dev, sizeof(*rp1), GFP_KERNEL);
> > +	if (!rp1)
> > +		return -ENOMEM;
> > +
> > +	rp1->pdev = pdev;
> > +	rp1->dev = &pdev->dev;
> > +
> > +	reset = devm_reset_control_get_optional_exclusive(&pdev->dev, NULL);
> > +	if (IS_ERR(reset))
> > +		return PTR_ERR(reset);
> > +	reset_control_reset(reset);
> 
> This device is a PCI device.
> Seems strange to get the reset control line for a PCI device.

And it isn't declared in teh node either, so right now seems a no-op.
Removed.

> 
> > +
> > +	dump_bar(pdev, 0);
> > +	dump_bar(pdev, 1);
> No sure those 2 dump_bar() calls are really needed.

Removed as well.

> > +
> > +	if (pci_resource_len(pdev, 1) <= 0x10000) {
> > +		dev_err(&pdev->dev,
> > +			"Not initialised - is the firmware running?\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	err = pcim_enable_device(pdev);
> > +	if (err < 0) {
> > +		dev_err(&pdev->dev, "Enabling PCI device has failed: %d",
> > +			err);
> > +		return err;
> > +	}
> > +
> > +	rp1->bar1 = pcim_iomap(pdev, 1, 0);
> > +	if (!rp1->bar1) {
> > +		dev_err(&pdev->dev, "Cannot map PCI BAR\n");
> > +		return -EIO;
> > +	}
> > +
> > +	u32 dtbo_size = __dtbo_rp1_pci_end - __dtbo_rp1_pci_begin;
> > +	void *dtbo_start = __dtbo_rp1_pci_begin;
> 
> Those declarations should be move at the beginning of the function.

Ack.

> 
> > +
> > +	err = of_overlay_fdt_apply(dtbo_start, dtbo_size, &rp1->ovcs_id, rp1_node);
> > +	if (err)
> > +		return err;
> > +
> 
> Maybe applying the overlay should be done after the interrupt controller
> is ready.

Right.

> 
> > +	pci_set_master(pdev);
> > +
> > +	err = pci_alloc_irq_vectors(pdev, RP1_INT_END, RP1_INT_END,
> > +				    PCI_IRQ_MSIX);
> > +	if (err != RP1_INT_END) {
> > +		dev_err(&pdev->dev, "pci_alloc_irq_vectors failed - %d\n", err);
> > +		goto err_unload_overlay;
> > +	}
> > +
> > +	pci_set_drvdata(pdev, rp1);
> > +	rp1->domain = irq_domain_add_linear(of_find_node_by_name(NULL, "pci-ep-bus"), RP1_INT_END,
> > +					    &rp1_domain_ops, rp1);
> > +
> > +	for (i = 0; i < RP1_INT_END; i++) {
> > +		int irq = irq_create_mapping(rp1->domain, i);
> > +
> > +		if (irq < 0) {
> > +			dev_err(&pdev->dev, "failed to create irq mapping\n");
> > +			err = irq;
> > +			goto err_unload_overlay;
> > +		}
> > +		irq_set_chip_and_handler(irq, &rp1_irq_chip, handle_level_irq);
> > +		irq_set_probe(irq);
> > +		irq_set_chained_handler_and_data(pci_irq_vector(pdev, i),
> > +						 rp1_chained_handle_irq, rp1);
> > +	}
> > +
> > +	err = of_platform_default_populate(rp1_node, NULL, dev);
> > +	if (err)
> > +		goto err_unload_overlay;
> > +
> > +	return 0;
> > +
> > +err_unload_overlay:
> > +	of_overlay_remove(&rp1->ovcs_id);
> > +
> > +	return err;
> > +}
> > +
> > +static void rp1_remove(struct pci_dev *pdev)
> > +{
> > +	struct rp1_dev *rp1 = pci_get_drvdata(pdev);
> > +	struct device *dev = &pdev->dev;
> > +
> > +	of_platform_depopulate(dev);
> > +	of_overlay_remove(&rp1->ovcs_id);
> > +
> > +	clk_unregister(rp1->sys_clk);
> 
> Unless I missed something, rp1->sys_clk is never set in probe().
> If this is correct, clk_unregister() should be removed and also
> the related clk header files.

Ack.

> 
> The interrupt controller created at probe() should be destroyed at remove().

Ack.

> 
> > +}
> > +
> 
> ...
> > diff --git a/drivers/misc/rp1/rp1_pci.h b/drivers/misc/rp1/rp1_pci.h
> > new file mode 100644
> > index 000000000000..7982f13bad9b
> > --- /dev/null
> > +++ b/drivers/misc/rp1/rp1_pci.h
> > @@ -0,0 +1,14 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +
> > +/*
> > + * Copyright (c) 2018-24 Raspberry Pi Ltd.
> > + * All rights reserved.
> > + */
> > +
> > +#ifndef _RP1_EXTERN_H_
> > +#define _RP1_EXTERN_H_
> > +
> > +extern char __dtbo_rp1_pci_begin[];
> > +extern char __dtbo_rp1_pci_end[];
> > +
> > +#endif
> 
> These two symbols are only used by the rp1_pci.c file.
> Not sure that the rp1_pci.h is needed.
> Simply declare the symbols in the rp1_pci.c file.

I agree with you, and I did exactly as you suggest in the very first submission
of this patch, but I received a couple of comments against it, so I've created
the new header file.

Many thanks,
Andrea


> 
> 
> Best regards,
> Hervé

