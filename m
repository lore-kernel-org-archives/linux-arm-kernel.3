Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F941C677C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 05:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DoYbi3JELt9emY7SA7bGng9kPhfQuex7MkdinZ5Sc+4=; b=MY2JAfe335mIpG6+kqQocx4uPG
	uhY3skX/GiQr3Nzzl/GhvyJtZvXd7rkTppnBS5wTZnofWo8eeH7U9IYyx/VKwWCvsNioKlvHPJTZP
	hULjUfd3XUqu3FbA6It5tDG24tV613U2zVBFabelJKSt8Zgs5anz4uoFsdY0AXZ5KHBSzGS55rI3y
	yZLEuwdVxTHmGIkljj4yWVENm8+R/FlUvaf8/P5B50xQXoE3QpYb+LMII7NTsyP9/X7XkfpmTMOhY
	upUWhWVPofIlUYCw+WSyoJ+K1jbUZ7ZjhZjC8LqoH11HBj9IZjmzJneTojVP/cyohjTQS6U1MTPz0
	8S9PB+6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPDmK-00000008rvu-3pjZ;
	Wed, 11 Jun 2025 05:13:36 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPDkA-00000008rlF-2Eqr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 05:11:24 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id DD38C43B0F;
	Wed, 11 Jun 2025 05:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749618677;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DoYbi3JELt9emY7SA7bGng9kPhfQuex7MkdinZ5Sc+4=;
	b=Bmw3YhiKxOb3FffWRz1dwPZ6w587I+OLRgWmx4cZDpJz7xFfOSSdn3e+4WhHC4GsFAF9g4
	pS7KaubaItkavkYVFNOArnEz8Wo7HvHADyDMdGtoJtWgCd2xbpSeBLBh5h40J/kRvLqHiI
	istm7ikbbTOK1RHnWuqPCJ/qnoSLo5klrleLUAqMAQincYEvi3pubEtDWZtHRcw0HgEvN5
	fskxm0hsz2HYtfpJ6oWwDa++w9OllXw2yYqz38T87aNa+T0SmHhgXqoHsu+/gyjrr3iR64
	Wry1A2WXf4ltsDkdhoP7u8kpkIcvd82zQGeYcJOjpEuycaDnCJ+8gxh9qtV+4w==
Date: Wed, 11 Jun 2025 07:11:14 +0200
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, "David S .
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Russell King
 <linux@armlinux.org.uk>, Vineeth Karumanchi <vineeth.karumanchi@amd.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, linux-kernel@vger.kernel.org, Kory
 Maincent <kory.maincent@bootlin.com>, Daniel Golle <daniel@makrotopia.org>,
 Simon Horman <horms@kernel.org>, Christian Marangi <ansuelsmth@gmail.com>,
 Lei Wei <quic_leiwei@quicinc.com>, Michal Simek <michal.simek@amd.com>,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, Robert Hancock
 <robert.hancock@calian.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [net-next PATCH v6 06/10] net: pcs: Add Xilinx PCS driver
Message-ID: <20250611071114.325fb630@fedora.home>
In-Reply-To: <20250610233134.3588011-7-sean.anderson@linux.dev>
References: <20250610233134.3588011-1-sean.anderson@linux.dev>
	<20250610233134.3588011-7-sean.anderson@linux.dev>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdduudejgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepofgrgihimhgvucevhhgvvhgrlhhlihgvrhcuoehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegveeltddvveeuhefhvefhlefhkeevfedtgfeiudefffeiledttdfgfeeuhfeukeenucfkphepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejpdhhvghlohepfhgvughorhgrrdhhohhmvgdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvtddprhgtphhtthhopehsvggrnhdrrghnuggvrhhsohhnsehlihhnuhigrdguvghvpdhrtghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnughrvgifodhnvghtuggvvhesl
 hhunhhnrdgthhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepvgguuhhmrgiivghtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopehlihhnuhigsegrrhhmlhhinhhugidrohhrghdruhhk
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_221123_235861_67622682 
X-CRM114-Status: GOOD (  39.44  )
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

Hi Sean,

I only 

On Tue, 10 Jun 2025 19:31:30 -0400
Sean Anderson <sean.anderson@linux.dev> wrote:

> This adds support for the Xilinx 1G/2.5G Ethernet PCS/PMA or SGMII device.
> This is a soft device which converts between GMII and either SGMII,
> 1000Base-X, or 2500Base-X. If configured correctly, it can also switch
> between SGMII and 1000BASE-X at runtime. Thoretically this is also possible
> for 2500Base-X, but that requires reconfiguring the serdes. The exact
> capabilities depend on synthesis parameters, so they are read from the
> devicetree.
> 
> This device has a c22-compliant PHY interface, so for the most part we can
> just use the phylink helpers. This device supports an interrupt which is
> triggered on autonegotiation completion. I'm not sure how useful this is,
> since we can never detect a link down (in the PCS).
> 
> This device supports sharing some logic between different implementations
> of the device. In this case, one device contains the "shared logic" and the
> clocks are connected to other devices. To coordinate this, one device
> registers a clock that the other devices can request.  The clock is enabled
> in the probe function by releasing the device from reset. There are no othe
> software controls, so the clock ops are empty.
> 
> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
> ---
> 
> Changes in v6:
> - Move axienet_pcs_fixup to AXI Ethernet commit
> - Use an empty statement for next label
> 
> Changes in v5:
> - Export get_phy_c22_id when it is used
> - Expose bind attributes, since there is no issue in doing so
> - Use MDIO_BUS instead of MDIO_DEVICE
> 
> Changes in v4:
> - Re-add documentation for axienet_xilinx_pcs_get that was accidentally
>   removed
> 
> Changes in v3:
> - Adjust axienet_xilinx_pcs_get for changes to pcs_find_fwnode API
> - Call devm_pcs_register instead of devm_pcs_register_provider
> 
> Changes in v2:
> - Add support for #pcs-cells
> - Change compatible to just xlnx,pcs
> - Drop PCS_ALTERA_TSE which was accidentally added while rebasing
> - Rework xilinx_pcs_validate to just clear out half-duplex modes instead
>   of constraining modes based on the interface.
> 
>  MAINTAINERS                  |   6 +
>  drivers/net/pcs/Kconfig      |  22 ++
>  drivers/net/pcs/Makefile     |   2 +
>  drivers/net/pcs/pcs-xilinx.c | 427 +++++++++++++++++++++++++++++++++++
>  drivers/net/phy/phy_device.c |   3 +-
>  include/linux/phy.h          |   1 +
>  6 files changed, 460 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/net/pcs/pcs-xilinx.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0ac6ba5c40cb..496513837921 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -27060,6 +27060,12 @@ L:	netdev@vger.kernel.org
>  S:	Orphan
>  F:	drivers/net/ethernet/xilinx/ll_temac*
>  
> +XILINX PCS DRIVER
> +M:	Sean Anderson <sean.anderson@linux.dev>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/net/xilinx,pcs.yaml
> +F:	drivers/net/pcs/pcs-xilinx.c
> +
>  XILINX PWM DRIVER
>  M:	Sean Anderson <sean.anderson@seco.com>
>  S:	Maintained
> diff --git a/drivers/net/pcs/Kconfig b/drivers/net/pcs/Kconfig
> index f42839a0c332..e0223914362b 100644
> --- a/drivers/net/pcs/Kconfig
> +++ b/drivers/net/pcs/Kconfig
> @@ -52,4 +52,26 @@ config PCS_RZN1_MIIC
>  	  on RZ/N1 SoCs. This PCS converts MII to RMII/RGMII or can be set in
>  	  pass-through mode for MII.
>  
> +config PCS_XILINX
> +	tristate "Xilinx PCS driver"
> +	default XILINX_AXI_EMAC
> +	select COMMON_CLK
> +	select GPIOLIB
> +	select MDIO_BUS
> +	select OF
> +	select PCS
> +	select PHYLINK
> +	help
> +	  PCS driver for the Xilinx 1G/2.5G Ethernet PCS/PMA or SGMII device.
> +	  This device can either act as a PCS+PMA for 1000BASE-X or 2500BASE-X,
> +	  or as a GMII-to-SGMII bridge. It can also switch between 1000BASE-X
> +	  and SGMII dynamically if configured correctly when synthesized.
> +	  Typical applications use this device on an FPGA connected to a GEM or
> +	  TEMAC on the GMII side. The other side is typically connected to
> +	  on-device gigabit transceivers, off-device SERDES devices using TBI,
> +	  or LVDS IO resources directly.
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called pcs-xilinx.
> +
>  endmenu
> diff --git a/drivers/net/pcs/Makefile b/drivers/net/pcs/Makefile
> index 35e3324fc26e..347afd91f034 100644
> --- a/drivers/net/pcs/Makefile
> +++ b/drivers/net/pcs/Makefile
> @@ -10,3 +10,5 @@ obj-$(CONFIG_PCS_XPCS)		+= pcs_xpcs.o
>  obj-$(CONFIG_PCS_LYNX)		+= pcs-lynx.o
>  obj-$(CONFIG_PCS_MTK_LYNXI)	+= pcs-mtk-lynxi.o
>  obj-$(CONFIG_PCS_RZN1_MIIC)	+= pcs-rzn1-miic.o
> +obj-$(CONFIG_PCS_ALTERA_TSE)	+= pcs-altera-tse.o

There's something strange going-on here, as pcs-altera-tse was removed
in v6.4 :)

> +obj-$(CONFIG_PCS_XILINX)	+= pcs-xilinx.o

Maxime

