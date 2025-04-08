Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0596C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 14:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wWC1t5C7Psv+WkhU4vEeLTJB5SiU/U5h01ZyvIxqatY=; b=VqIccrwleczQqXlnD6dag/d47g
	NgeTmCqwlvNZ2Ygxd7FSqdvTpqV1W1hCE/KfIqTlLB/CLLEIePwK56cZHKVw9JPjEJ5hVM+JX8665
	WFBmwh+HuKwZVJk1raQD6Uq2w6PMevnVEbfJ0vVI+lG8T9yh1wpfQqufsQJndLDucSLg46VoUJPi8
	7mFKH4oLQDQE87eCXkfCXGXy3rBzX8VuhRGo+yE/XxMwr2W5BDBPr7/MHuV3XMDC7Zbjb3cJBzBbT
	Wm3GnFJT7FdCRVaaZeHf8vE+i6fC/+HvH379wtI6XASIXTM5YD9u39y9OPqdf199hac9YRcoINobZ
	Ss1lwj0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u29vl-00000004NfP-1eGf;
	Tue, 08 Apr 2025 14:28:01 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u29ty-00000004NFq-2BpB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 14:26:11 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 89BA8442A2;
	Tue,  8 Apr 2025 14:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744122368;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wWC1t5C7Psv+WkhU4vEeLTJB5SiU/U5h01ZyvIxqatY=;
	b=G3cBy/zC21TopTZxsSm3Hm56tKYPMHyF3UnKgpMl87ahvIrG/PTDf1B88csRkMHc8tNK3d
	g1mXIvcrZtRIp1lcQFGenQXx3nOQ38o7Ze1Lq0GKYoBLYJEnMhRw9mKdZ90dV7TG0NHl0p
	c/mXwowQAoVeLJ/Ip6VxqiXyOYCJgtzR+n2yfcHPIYoMm7dwckguem0ir/jl3VU+0a/rTM
	VrHq1w8wPVMN80rnY/I7B+ErA2xHbUonBWik26u6aR2l+iXgIfgDtPK+xq204VkoHeJpJK
	5SWnj30FdxKPC68R1qOEm/mUoB/A+dWmLkGEnruusrKLgvo41ZX6VkN3legqAQ==
Date: Tue, 8 Apr 2025 16:26:03 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Peter Rosin <peda@axentia.se>, Derek
 Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>,
 Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, Saravana
 Kannan <saravanak@google.com>, Bjorn Helgaas <bhelgaas@google.com>, Mark
 Brown <broonie@kernel.org>, Len Brown <lenb@kernel.org>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Wolfram Sang <wsa@kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-acpi@vger.kernel.org, Allan Nielsen
 <allan.nielsen@microchip.com>, Horatiu Vultur
 <horatiu.vultur@microchip.com>, Steen Hegelund
 <steen.hegelund@microchip.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 15/16] misc: lan966x_pci: Add dtso nodes in order to
 support SFPs
Message-ID: <20250408162603.02d6c3a1@bootlin.com>
In-Reply-To: <19f1a382-1b6b-42bd-a548-a1a5644c9a1b@lunn.ch>
References: <20250407145546.270683-1-herve.codina@bootlin.com>
	<20250407145546.270683-16-herve.codina@bootlin.com>
	<19f1a382-1b6b-42bd-a548-a1a5644c9a1b@lunn.ch>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdeffedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtkeertdertdejnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveeiffefgeeitdelleeigefhjeelueeuveekveetgeffheeltdekgeduiefggfdvnecukfhppedvrgdtudemvgdtrgemvdegieemjeejledtmedviegtgeemvgdvvdemiedtfegumeehkegrnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmedvgeeimeejjeeltdemvdeitgegmegvvddvmeeitdefugemheekrgdphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeguddprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehrrghfrggvlheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrkhhrsehkvghrnhgvlhdrohhrghdprhgtp
 hhtthhopehshhgrfihnghhuoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshdrhhgruhgvrhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepkhgvrhhnvghlsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehfvghsthgvvhgrmhesghhmrghilhdrtghomh
X-GND-Sasl: herve.codina@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_072610_844003_6804C03A 
X-CRM114-Status: GOOD (  32.60  )
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

Hi Andrew,

On Mon, 7 Apr 2025 22:05:31 +0200
Andrew Lunn <andrew@lunn.ch> wrote:

> On Mon, Apr 07, 2025 at 04:55:44PM +0200, Herve Codina wrote:
> > Add device-tree nodes needed to support SFPs.
> > Those nodes are:
> >  - the clock controller
> >  - the i2c controller
> >  - the i2c mux
> >  - the SFPs themselves and their related ports in the switch
> > 
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > ---
> >  drivers/misc/lan966x_pci.dtso | 111 ++++++++++++++++++++++++++++++++++
> >  1 file changed, 111 insertions(+)
> > 
> > diff --git a/drivers/misc/lan966x_pci.dtso b/drivers/misc/lan966x_pci.dtso
> > index 94a967b384f3..a2015b46cd44 100644
> > --- a/drivers/misc/lan966x_pci.dtso
> > +++ b/drivers/misc/lan966x_pci.dtso  
> 
> What exactly does this DTSO file represent?

The dsto represents de board connected to the PCI slot and identified
by its PCI vendor/device IDs.

> 
> 
> > @@ -47,6 +47,47 @@ sys_clk: clock-15625000 {
> >  				clock-frequency = <15625000>;  /* System clock = 15.625MHz */
> >  			};
> >  
> > +			i2c0_emux: i2c0-emux {
> > +				compatible = "i2c-mux-pinctrl";
> > +				#address-cells = <1>;
> > +				#size-cells = <0>;
> > +				i2c-parent = <&i2c0>;
> > +				pinctrl-names = "i2c102", "i2c103", "idle";
> > +				pinctrl-0 = <&i2cmux_0>;
> > +				pinctrl-1 = <&i2cmux_1>;
> > +				pinctrl-2 = <&i2cmux_pins>;
> > +
> > +				i2c102: i2c@0 {
> > +					reg = <0>;
> > +					#address-cells = <1>;
> > +					#size-cells = <0>;
> > +				};
> > +
> > +				i2c103: i2c@1 {
> > +					reg = <1>;
> > +					#address-cells = <1>;
> > +					#size-cells = <0>;
> > +				};
> > +			};
> > +
> > +			sfp2: sfp2 {
> > +				compatible = "sff,sfp";
> > +				i2c-bus = <&i2c102>;
> > +				tx-disable-gpios = <&gpio 0 GPIO_ACTIVE_HIGH>;
> > +				los-gpios = <&gpio 25 GPIO_ACTIVE_HIGH>;
> > +				mod-def0-gpios = <&gpio 18 GPIO_ACTIVE_LOW>;
> > +				tx-fault-gpios = <&gpio 2 GPIO_ACTIVE_HIGH>;  
> 
> DT files are generally hierarchical. There is a soc .dtsi file which
> describes everything internal to the SoC.  And then we have .dts file
> which describes the board the SoC is placed on.
> 
> We have a slightly different setup here. A PCI chip instead of a SoC.
> And a PCI card in a slot, which could be seen as the board.
> 
> The SFP cage is on the board. How the GPIOs and i2c busses are wired
> to the SFP cage is a board property, not a SoC/PCI chip
> property. Different boards could wire them up differently. So to me,
> it seems wrong these nodes are here. They should be in a dtso file
> which represents the PCIe board in the slot, and that .dtso file
> imports the .dtso file which represents the PCIe chip.

The PCI vendor/device ID identifies the board. This is the PCI
peripheral connected to the PCI slot and enumerated. This dtso
describes the board.

The dtso in that case is the equivalent of the dts.

We can move the PCI chip in a dtsi included by this dtso but in the
end this leads to the exact same representation. Further more, moving
out the PCI chip description in its own dtsi out of this dtso can be
done in a second step when an other dtso uses the same chip.

This dtso, describing the board, is applied on the PCI device node.
SDP, i2c mux, ... are described at the same level as the fixed-clock
component for instance.

> 
> I suppose this comes down to, what do the PCIe IDs represent, since
> that is what is used for probing? The PCIe chip, or the board as a
> whole. When somebody purchases the chips from Microchip, and builds
> their own board, are they required to have their own PCIe IDs, and a
> .dtso file representing their board design? The PCIe chip part should
> be reusable, so we are talking about stacked dtso files, or at least
> included .dtso files.
> 

Staked dtso implies stacked overlays and I think is is not a correct
description. There is only one piece of hardware that can be plugged or
un-plugged: the PCI board. This piece of hardware should be fully
described by only one overlay (one dtso).

IMHO, the only reason I can see to have multiple overlay is to apply a
first overlay which help to identify the board connected. For instance,
an eeprom description where some ids are stored and needed to identify
the board. In the PCI case, this is not needed, the PCI vendor/device
IDs are here to identify the board.

Best regards,
Hervé

