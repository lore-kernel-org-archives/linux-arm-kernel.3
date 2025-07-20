Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFA49C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Jul 2025 22:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dy3ph5LeZ3K3tRPIlbLysXDL6/dfRRaBQzPEoQMbemU=; b=t+vWxUqYOoBoglYhGjRh2N5die
	FFgL63PnzNh/7rcXW+v+YN20twe7ZrZrbsupJ423/1TE1fr+/5K3zp7PrHHePMYJ4FVP3RGSiFkQa
	H+CaZu1mUOENUFWW9/yWJwDS3FB8yaF5yUSZRU6woILI6Zhc78QmJZCwO8tht9WNpSYJQ2y2F69wK
	gp6WZocAHZhYP1+O7yVvK2Y5sE7ie7THzJhqNIYlo9y8cgpmDz6X62TZt0IA1NzuFMivjPYgvDF7j
	jdVqb3EJEnqUMqOnLokMOIXtzjEJjgAqddm13ErZtIB/BkajKgGJiVizs296ilMygMqHDqpCo1/nd
	YuWPZ7aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udcSs-0000000FlXU-1NwH;
	Sun, 20 Jul 2025 22:25:02 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udcQS-0000000FlLz-2FyA
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Jul 2025 22:22:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BAC12A5276C;
	Sun, 20 Jul 2025 22:22:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49802C4CEE7;
	Sun, 20 Jul 2025 22:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753050151;
	bh=bM5zL7tOJogVkxC/dBJDYgKh+3nVk9kFwkbmG9c9IYc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X4vBWyG5vYZwDD4v2i65ZI4jQq15qc+dO83q2BtBhpT8khyJea2edi80gvwCjdceK
	 rVvzMuoo5dguYkK7l33e59cKcnmQnmwC3cLPs8NEx/EwhpPwlGjhlHU1f49uuSuaGw
	 Y9zyAoOUeZ4oruAML2zbIcz1nQwCmW530rt0I/Y7bZkT3y6/I8Q4Gw8Ax7SzTf2nRD
	 uoltJpkQZcGDywtPuKMPvKQZaryHCNXQNy1siQfPmiEypjDkTSFZna8idcQLfh64Wl
	 w7th2aSsgrAX6dzEtrww2rquC1AaugyP6S2V6tHsuk5SPMlPY1TBdVwom3UQ67WxNi
	 6p+5Yv/wbVEMA==
Date: Sun, 20 Jul 2025 17:22:30 -0500
From: Rob Herring <robh@kernel.org>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: "bhelgaas@google.com" <bhelgaas@google.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"kwilczynski@kernel.org" <kwilczynski@kernel.org>,
	"mani@kernel.org" <mani@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"joel@jms.id.au" <joel@jms.id.au>,
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linus.walleij@linaro.org" <linus.walleij@linaro.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	BMC-SW <BMC-SW@aspeedtech.com>
Subject: Re: [PATCH v2 06/10] ARM: dts: aspeed-g6: Add PCIe RC node
Message-ID: <20250720222230.GA2842356-robh@kernel.org>
References: <20250715034320.2553837-1-jacky_chou@aspeedtech.com>
 <20250715034320.2553837-7-jacky_chou@aspeedtech.com>
 <CAL_JsqJ4yeYGAyCwHi=4CBurxGOc5oAqTQqun+5+Ps4hxwDU9Q@mail.gmail.com>
 <SEYPR06MB5134EB5D018F8518E88495FF9D56A@SEYPR06MB5134.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SEYPR06MB5134EB5D018F8518E88495FF9D56A@SEYPR06MB5134.apcprd06.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_152232_713194_48161EE4 
X-CRM114-Status: GOOD (  25.27  )
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

On Wed, Jul 16, 2025 at 03:51:11AM +0000, Jacky Chou wrote:
> Hi Rob,
> 
> Thank you for your reply.
> 
> > >                                 quality = <100>;
> > >                         };
> > >
> > > +                       pcie_phy1: syscon@1e6ed200 {
> > > +                               compatible = "aspeed,pcie-phy",
> > "syscon";
> > > +                               reg = <0x1e6ed200 0x100>;
> > 
> > This looks like part of something else? It should be a child of that.
> > 
> > If this is the controls for the PCIe PHY, then use the PHY binding instead of your
> > own custom phandle property.
> > 
> 
> Our PCIe design has multiple functions. And the series of patches are submitted for
> PCIe RC. The other PCIe functions also use this phy node.
> I traced the PHY driver interface, it cannot meet our usage.

Why not?

There is also no requirement that using the DT PHY binding means you 
have to use the Linux PHY subsystem.

> Therefore, the RC driver uses the phandle property to configure.
> And this syscon also is used by the other PCIe functions.

Like what?

> > > +                       };
> > > +
> > > +                       pcie_cfg: syscon@1e770000 {
> > > +                               compatible = "aspeed,pcie-cfg",
> > "syscon";
> > > +                               reg = <0x1e770000 0x80>;
> > 
> > Looks like this is really part of the PCIe block as a h/w block isn't going to start
> > at offset 0xc0.
> > 
> > 
> 
> Actually.
> There are two PCIe bus in AST2600
> We use the other one PCIe to EP mode, here I call PCIe A.
> I call the pcie0 node as PCIe B.
> We do not provide PCIe A to RC mode for usage, just EP mode.
> But, when PCIe A is used as RC, it reg mapping is starting from 0x1e770080.
> I list there mapping.
> 
> 0x1e77_0000 ~ 0x1e77_007f : common usage
> 0x1e77_0080 ~ 0x1e77_00bf : PCIE A
> 0x1e77_00C0 ~ 0x1e77_00ff : PCIE B
> 
> So, it is why we create one node to describe common usage for PCIe A and B.
> And, why the pcie0 reg mapping is starting from 0x1e77_00c0.

In that case, maybe you need a common parent node with 2 child nodes for 
each bus.

Rob

> 
> > > +                       };
> > > +
> > > +                       pcie0: pcie@1e7700c0 {
> > > +                               compatible = "aspeed,ast2600-pcie";
> > > +                               device_type = "pci";
> > > +                               reg = <0x1e7700c0 0x40>;
> > > +                               linux,pci-domain = <0>;
> > 
> > No need for this. You only have 1 PCI host.
> > 
> 
> Agreed.
> We only provide one RC.
> 
> > > +                               #address-cells = <3>;
> > > +                               #size-cells = <2>;
> > > +                               interrupts = <GIC_SPI 168
> > IRQ_TYPE_LEVEL_HIGH>;
> > > +                               bus-range = <0x80 0xff>;
> > 
> > Does this h/w not support bus 0-0x7f for some reason?
> > 
> 
> List:
> PCIE A: 0-0x7f
> PCIE B: 0x80-0xff
> 
> It is our design on PCIe B to use bus-range 0x80-0xff.

That's a policy or h/w limitation?

Rob

