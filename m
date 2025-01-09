Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C42EAE77199
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 14:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LtaQCAfVpC5phcNBcjS77EwWPeSgl2U8pwTLOU1Od44=; b=UTTUro5qmo1P2CgEJO+jXeKKfV
	moKClas9jfJgKveX0KkbAHOv+BUrI3CKD1Hp2L1PgojJzeBjuFknXL6ikyrmqfkLBLDO4Mrt7q8KK
	7BXqpgvktJc9WJBgmHfOvx5g3LZ/c3v52yBqrjOE/8bfY7BXEAYMJg7OULvX9JzjgpuLR2fGhrpJM
	bgEEwAk+cUNGf5e+kpfZbGxjofYCXw/DPyPgfCxSONgS2IdQQZhJiXmTegy8LmY5lxi4Gdoujm3Gi
	BXcC+3l1rT86UlIYqDj2WeVtXISR1TBO4KouAZDHD0rF1YY/qbhO0VXnRm4DKiklJ7DgjDWsPokXK
	BYD4F/qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVttL-0000000CJae-2tLb;
	Thu, 09 Jan 2025 14:52:11 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVts2-0000000CJA0-0Q33;
	Thu, 09 Jan 2025 14:50:51 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 56A2120004;
	Thu,  9 Jan 2025 14:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736434244;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LtaQCAfVpC5phcNBcjS77EwWPeSgl2U8pwTLOU1Od44=;
	b=VqJhCfXkn2snSlj5/z0nn2AcrHXgyZX4rNHvQiWrN4h9FcGTraRiBwMOoW4O8dpw5kU7SC
	xbYftV1xMf2mjqaS6RboHuuvDzbNnJI8cCz/VA7pRB9mKgdTGI1uyv2H9FOFvMmLwHe/jd
	6gcEZ4JzMnzrqH2ZuK30m14KUPVjtjbjBAxdbWulUYa0vj4/TFwBDCAbY3aTQYxyOKQKxA
	yvQeHf3+zdTxGDFPG63dJ0S2oedHvZAb4UHoDg2LxEF87M41iYEfn53RyYG59hOxNjyDSg
	/XXgCua/sEe4IGTVRoLDO6rHPcXxasd0m+dT9nZDlq2nGODc/yi2hbZVdoxN6Q==
Date: Thu, 9 Jan 2025 15:50:36 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Rob Herring <robh@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Florian
 Fainelli <florian.fainelli@broadcom.com>, Broadcom internal kernel review
 list <bcm-kernel-feedback-list@broadcom.com>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, Krzysztof Wilczynski <kw@linux.com>, Manivannan
 Sadhasivam <manivannan.sadhasivam@linaro.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Linus Walleij <linus.walleij@linaro.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Bartosz
 Golaszewski <brgl@bgdev.pl>, Derek Kiernan <derek.kiernan@amd.com>, Dragan
 Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Saravana Kannan
 <saravanak@google.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org, Masahiro Yamada
 <masahiroy@kernel.org>, Stefan Wahren <wahrenst@gmx.net>, Luca Ceresoli
 <luca.ceresoli@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v5 08/10] misc: rp1: RaspberryPi RP1 misc driver
Message-ID: <20250109155036.27b82b7e@bootlin.com>
In-Reply-To: <Z3_ZlvbszezcanA4@apocalypse>
References: <cover.1733136811.git.andrea.porta@suse.com>
	<28fe72eec1c08781770cee65032bb10a6d5994a9.1733136811.git.andrea.porta@suse.com>
	<20241210224837.GA702616-robh@kernel.org>
	<Z2A0aAPotT0NvoCl@apocalypse>
	<Z3_ZlvbszezcanA4@apocalypse>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_065050_400428_8AA12C36 
X-CRM114-Status: GOOD (  23.39  )
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

On Thu, 9 Jan 2025 15:13:42 +0100
Andrea della Porta <andrea.porta@suse.com> wrote:

> Hi Rob,
> 
> On 15:08 Mon 16 Dec     , Andrea della Porta wrote:
> > Hi Rob,
> > 
> > On 16:48 Tue 10 Dec     , Rob Herring wrote:  
> > > On Mon, Dec 02, 2024 at 12:19:32PM +0100, Andrea della Porta wrote:  
> > > > The RaspberryPi RP1 is a PCI multi function device containing
> > > > peripherals ranging from Ethernet to USB controller, I2C, SPI
> > > > and others.  
> 
> ...
> 
> > > > +#define RP1_INT_ADC_FIFO	52
> > > > +#define RP1_INT_PCIE_OUT	53
> > > > +#define RP1_INT_SPI6		54
> > > > +#define RP1_INT_SPI7		55
> > > > +#define RP1_INT_SPI8		56
> > > > +#define RP1_INT_SYSCFG		58
> > > > +#define RP1_INT_CLOCKS_DEFAULT	59
> > > > +#define RP1_INT_VBUSCTRL	60
> > > > +#define RP1_INT_PROC_MISC	57  
> > > 
> > > Why all these defines which will never be used because they come from 
> > > DT?
> > >  
> > 
> > Right, those defines where originally designed to be included from dts, but
> > previous discussion deemed interrupt numbers to be hardcoded instead of being
> > specified as mnemonics. In the driver source code I just use RP1_INT_END as the
> > number of interrupts but I thought that the specific interrupt numbers should
> > be documented in some way or another. Since no one is currently referencing
> > those defines, would it be better to just turn those in a multiline comment
> > just to describe them in a more compact form?  
> 
> So, here's a couple of proposals about the interrupt defines:
> 
> - since they were banned from devicetree, and are not used anywhere in the code,
>   turn them into a (admittedly long) multiline comment, so they are still at
>   least documented
> 
> - since they were banned from devicetree, and are not use anywhere in the code,
>   just drop them, we don't currently need them after all
> 
> Not sure what's the best way here, anyone can advise?

Maybe in the #interrupt-cells description in the device-tree binding?

In your patch 4, you describe this interrupt controller and you have:
  '#interrupt-cells':
    const: 2
    description:
      Specifies respectively the interrupt number and flags as defined
      in include/dt-bindings/interrupt-controller/irq.h.

In this description, why not add the supported interrupt number values?
    description: |
      Specifies respectively the interrupt number and flags as defined
      in include/dt-bindings/interrupt-controller/irq.h.
      The supported values for the interrupt number are:
        - IO BANK0: 0
        - IO BANK1: 1
...

Or something similar.

This kind of description is already available. For instance:
  https://elixir.bootlin.com/linux/v6.13-rc1/source/Documentation/devicetree/bindings/dma/fsl,imx-sdma.yaml#L64

Does it make sense?

Best regards,
Hervé

