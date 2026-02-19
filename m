Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 615B6E9A052
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 17:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KaK0sntCMoSLZMQ6Q8ttvFUYVC/oQ1rIAiyZUvLuAWw=; b=ObMzM485i5V3VzilW4eWbDRLTK
	CGaDtQ/HP3bAHnJpGXGtNGpVDVpQJVWPT4VSvJftwEFa0ySN0DWnq2QJFKbk6HYOqSIQ9FhbaFins
	fORduLsbS0M9/4GaZO7nfxsrbdcUgSy2VP9ZNauuaDni/h48ZwiT1aBRzuGAU2t51xVBhslR/+DMA
	EUzj0MNGrBoQ0Ver6svx8Y/EsJRM5/8Z2JooLJB2eiQa+k2ICngPrODy+xE+E1FPrzzfmzlSuHFYW
	2FRy1oyQHfop4N1RLgVzEu/v6cxmv1ZokEzKeiGzEwv84taGljFqCo3b/dLQid89vglzbayUKSmGb
	zBq2QN+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt7TU-0000000Bfvv-1GFI;
	Thu, 19 Feb 2026 17:06:00 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt7TQ-0000000BfvZ-0qC5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 17:05:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=KaK0sntCMoSLZMQ6Q8ttvFUYVC/oQ1rIAiyZUvLuAWw=; b=ohJ69X4zchPR/hJgdat23qs4x9
	je1AI0NgCjI2+3lu3xdGlfDMgX23MfUDaOLEv5YKpOKWkQ/ANoMWJMjKGdSXzN6UeHdIqbzhTqKo+
	QkRPiygkNlBJSn9WcMtsgMHUdvXkTlN7BXWQCmTB7GHUtdJGFct+gYUJ4SJqYwUaqhJY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vt7TI-007wb9-0N; Thu, 19 Feb 2026 18:05:48 +0100
Date: Thu, 19 Feb 2026 18:05:47 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Srinivas Neeli <srinivas.neeli@amd.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, michal.simek@amd.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	richardcochran@gmail.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, git@amd.com
Subject: Re: [RFC PATCH 4/8] xilinx: tsn: Add Ethernet MAC (EMAC) and MDIO
 support to the TSN driver
Message-ID: <b408cad2-90de-44df-85a6-64a028216290@lunn.ch>
References: <20260219054911.2017362-1-srinivas.neeli@amd.com>
 <20260219054911.2017362-5-srinivas.neeli@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260219054911.2017362-5-srinivas.neeli@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_090557_923396_CAE5DFAE 
X-CRM114-Status: GOOD (  14.44  )
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

> +static int tsn_mdio_read(struct mii_bus *bus, int phy_id, int reg)
> +{
> +	u32 rc;
> +	int ret;
> +	struct tsn_emac *emac = bus->priv;
> +	struct tsn_priv *common = emac->common;
> +
> +	scoped_guard(mutex, &common->mdio_lock) {

What is this mutex protecting?

> +		tsn_mdio_mdc_enable(emac);

It is unusual to stop MDC. I suspect some PHYs will not like this.
What is your reason for doing this.

> +/**
> + * tsn_mdio_setup - Setup MDIO bus for TSN EMAC
> + * @emac: Pointer to TSN EMAC structure
> + * @mac_np: Device tree node for MAC
> + *
> + * This function initializes the MDIO bus for the TSN EMAC interface.
> + * It allocates an MII bus structure, configures MDIO timing, finds
> + * the MDIO device tree node, and registers the MDIO bus with the kernel.
> + *
> + * Return: 0 on success, negative error code on failure
> + */
> +int tsn_mdio_setup(struct tsn_emac *emac, struct device_node *mac_np)
> +{
> +	struct tsn_priv *common = emac->common;
> +	struct device_node *mdio_node;
> +	struct mii_bus *bus;
> +	int ret;
> +
> +	bus = mdiobus_alloc();
> +	if (!bus)
> +		return -ENOMEM;
> +
> +	snprintf(bus->id, MII_BUS_ID_SIZE, "tsn-mac-%.8llx",
> +		 (unsigned long long)emac->regs_start);
> +
> +	bus->priv = emac;
> +	bus->name = "Xilinx TSN Ethernet MDIO";
> +	bus->read = tsn_mdio_read;
> +	bus->write = tsn_mdio_write;
> +	bus->parent = common->dev;
> +	emac->mii_bus = bus;
> +
> +	mdio_node = of_get_child_by_name(mac_np, "mdio");
> +	if (!mdio_node) {
> +		dev_err(common->dev, "MAC%d: missing 'mdio' child node\n",
> +			emac->emac_num);
> +		ret = -ENODEV;
> +		goto unregister;
> +	}

I forget, does the binding have a required: for the MDIO node?

> +	ret = tsn_mdio_enable(emac);
> +	if (ret < 0)
> +		goto unregister;
> +	ret = of_mdiobus_register(bus, mdio_node);

Having a node in DT is generally optional. You can pass NULL to
of_mdiobus_register() and it will do the right thing.

	Andrew

