Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00081C36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 21:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nl5JULT9PoC4C0/72HEzW8Mzovg/wHI2O7mxt7leeac=; b=myHXuLxg/pHV78hGQcFkDzYkkC
	GrORdRx8a2gA6eHNpBOb2zZ+g8aCkU9asqaSCSrL42qqVOJmQjOgSCo4KGtDc8W9jf41C5YEIycCa
	WtGRmF8XHDcPvtA/1+M372qiyKtLZQvJx7K+TzqINUnoWqXuAZWMLvvlKMhD6g30y3XRq6wMj0X5w
	lrf5UXIAP1MAaeqvrsW3PidrBMxlPrX6heL5eF+V0rY4tsRqfl2jfVZqMrqx5n1Hf+BCZT0Ltd+mc
	INKxvZJ9PmP3X4b9vsMJVsn731m5sAjqbISKVO3AXtEdzSBoKmVKRF5aAuiN8yqhcayiSAha97pkR
	SX76S61w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1uKU-0000000277Q-3Zw2;
	Mon, 07 Apr 2025 21:48:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1sjF-00000001utI-3TmP
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 07 Apr 2025 20:05:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=nl5JULT9PoC4C0/72HEzW8Mzovg/wHI2O7mxt7leeac=; b=oGzAt25y2I1HSmwprHy7yc+DKn
	vD5le80du510KN+poD4/iubBdS9nYFiUriPAIPBht4ld15eYk7u2DpMQF5aij1V4c5PKse+GcErtx
	wla6boXKTnrKBYPuR0VEsLbc8YDqxpPEOKslOU9Gp49VgiVQfqfIZz2sJYsg2IbPe/LDRoQ+AK0nN
	cudMmyEPbiLAccrDOdQEWnrbPFhx03kRab+DNzPKAlFXKWynoaMnQtezGYIZbUl60Tcx+mdQJo9M1
	A2bwBlfk4J6h14m45/hPC+yB2IQk6znoUcqXKtGFRmCAAXtR66nOC/SxJeNK01Q80TndUED59s2ZK
	zOxnyIVw==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1sjC-000000088uS-3On5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 20:05:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=nl5JULT9PoC4C0/72HEzW8Mzovg/wHI2O7mxt7leeac=; b=qxWeMnezbVGyFUZ5BOqEZBMjTK
	4viXQQ3adWeVMFtj8DWC62nPkKxNP3JRzHmTYRUWNXDWfiC9zspf3TzS6xn3/qt+/aH7SogayZXAf
	9FfUvh72FV/sVaQ9VxcIoxpCx6DEvrtYWOUpWwVcdeWwajTvujFf2v2Ta/AVHazNifO0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u1sip-008Igt-Tz; Mon, 07 Apr 2025 22:05:31 +0200
Date: Mon, 7 Apr 2025 22:05:31 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Peter Rosin <peda@axentia.se>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Mark Brown <broonie@kernel.org>, Len Brown <lenb@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Wolfram Sang <wsa@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	Allan Nielsen <allan.nielsen@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Steen Hegelund <steen.hegelund@microchip.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 15/16] misc: lan966x_pci: Add dtso nodes in order to
 support SFPs
Message-ID: <19f1a382-1b6b-42bd-a548-a1a5644c9a1b@lunn.ch>
References: <20250407145546.270683-1-herve.codina@bootlin.com>
 <20250407145546.270683-16-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407145546.270683-16-herve.codina@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_210555_053333_ACDA1F96 
X-CRM114-Status: GOOD (  21.50  )
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

On Mon, Apr 07, 2025 at 04:55:44PM +0200, Herve Codina wrote:
> Add device-tree nodes needed to support SFPs.
> Those nodes are:
>  - the clock controller
>  - the i2c controller
>  - the i2c mux
>  - the SFPs themselves and their related ports in the switch
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  drivers/misc/lan966x_pci.dtso | 111 ++++++++++++++++++++++++++++++++++
>  1 file changed, 111 insertions(+)
> 
> diff --git a/drivers/misc/lan966x_pci.dtso b/drivers/misc/lan966x_pci.dtso
> index 94a967b384f3..a2015b46cd44 100644
> --- a/drivers/misc/lan966x_pci.dtso
> +++ b/drivers/misc/lan966x_pci.dtso

What exactly does this DTSO file represent?


> @@ -47,6 +47,47 @@ sys_clk: clock-15625000 {
>  				clock-frequency = <15625000>;  /* System clock = 15.625MHz */
>  			};
>  
> +			i2c0_emux: i2c0-emux {
> +				compatible = "i2c-mux-pinctrl";
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				i2c-parent = <&i2c0>;
> +				pinctrl-names = "i2c102", "i2c103", "idle";
> +				pinctrl-0 = <&i2cmux_0>;
> +				pinctrl-1 = <&i2cmux_1>;
> +				pinctrl-2 = <&i2cmux_pins>;
> +
> +				i2c102: i2c@0 {
> +					reg = <0>;
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +				};
> +
> +				i2c103: i2c@1 {
> +					reg = <1>;
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +				};
> +			};
> +
> +			sfp2: sfp2 {
> +				compatible = "sff,sfp";
> +				i2c-bus = <&i2c102>;
> +				tx-disable-gpios = <&gpio 0 GPIO_ACTIVE_HIGH>;
> +				los-gpios = <&gpio 25 GPIO_ACTIVE_HIGH>;
> +				mod-def0-gpios = <&gpio 18 GPIO_ACTIVE_LOW>;
> +				tx-fault-gpios = <&gpio 2 GPIO_ACTIVE_HIGH>;

DT files are generally hierarchical. There is a soc .dtsi file which
describes everything internal to the SoC.  And then we have .dts file
which describes the board the SoC is placed on.

We have a slightly different setup here. A PCI chip instead of a SoC.
And a PCI card in a slot, which could be seen as the board.

The SFP cage is on the board. How the GPIOs and i2c busses are wired
to the SFP cage is a board property, not a SoC/PCI chip
property. Different boards could wire them up differently. So to me,
it seems wrong these nodes are here. They should be in a dtso file
which represents the PCIe board in the slot, and that .dtso file
imports the .dtso file which represents the PCIe chip.

I suppose this comes down to, what do the PCIe IDs represent, since
that is what is used for probing? The PCIe chip, or the board as a
whole. When somebody purchases the chips from Microchip, and builds
their own board, are they required to have their own PCIe IDs, and a
.dtso file representing their board design? The PCIe chip part should
be reusable, so we are talking about stacked dtso files, or at least
included .dtso files.

      Andrew

