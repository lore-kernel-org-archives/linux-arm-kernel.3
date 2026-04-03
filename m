Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1774DD6AB1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 01:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pPkUfoHrBUjyOkKwEgFHSDNbZTIKiOhveRpXV2NZ8KY=; b=BVpR6d7od0xJxkUDEVakGrhAoJ
	OkNlZSD/c51IYjpsopwjQ8LY0nuCAP+kH9vCDEfVE3EJt3ePEicIw0GIonDOmzKbQcoC9hLAklr7x
	oWaC5RtFKTc7He6T6CRlfK9Z+PG6z1DFSg11jcbhKvN1iPzx75fu8cSSx28Xg+9TAzhAa5m2+i5nA
	15qvgIwneBxdyf4zf8gn2OvfezbKoKEJ903CaRxucGpTdDDMSxaAeHoq5lsmz/xg/r5Vxqcm4hCkn
	O9O0qIabRQngoJ5/zOlugmzi9rRORHzVZWAAwdFG4VAMmze9v4uV68E3Q7wE+S93CTEqKIqLFIoxi
	4nfWtHAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8TAN-000000011qS-03mO;
	Fri, 03 Apr 2026 01:17:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8TAK-000000011oV-427H
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 01:17:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A4804441B5;
	Fri,  3 Apr 2026 01:17:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A65CC116C6;
	Fri,  3 Apr 2026 01:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775179060;
	bh=Qo5WYyKMeV7hp8RN7S6hSeBu5J+1l7VvgvLybc0R8cI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MeW8Fp7eYP/CuVWuq7dX7B7pzgPFmvM6dhFAaKmM3gWLSO5f10MO+Ya+UeyMCy2YF
	 RRZQYOk8eN60TuEF8jSk08eoCCq/3IF0kk/7O61DqFW67UypRKbQbISlfYAWNZr7E9
	 nr3FvErd9D8PQ7uME3Uq6cvez2SrwAIjs3uKBuu3XKk0pNJXhhNjkfJT7LgS3l0haC
	 RMhTu+dCGe2kSF15x7CnfeRL2plx6wC8AsMMZ+VXNq4RFhDgBl8teFOTqGYOD39298
	 xiNAmGPb/zcB/kITk2cuLUWYuMvQm0RaehPff/7mLMgao/b+Sc/RykYvKTArOyNW+U
	 l48zSk6T+aIMw==
From: Jakub Kicinski <kuba@kernel.org>
To: wei.fang@nxp.com
Cc: Jakub Kicinski <kuba@kernel.org>,
	claudiu.manoil@nxp.com,
	vladimir.oltean@nxp.com,
	xiaoning.wang@nxp.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	f.fainelli@gmail.com,
	frank.li@nxp.com,
	chleroy@kernel.org,
	horms@kernel.org,
	linux@armlinux.org.uk,
	andrew@lunn.ch,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev
Subject: Re: [PATCH v4 net-next 10/14] net: dsa: netc: introduce NXP NETC switch driver for i.MX94
Date: Thu,  2 Apr 2026 18:17:38 -0700
Message-ID: <20260403011738.1795644-1-kuba@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331113025.1566878-11-wei.fang@nxp.com>
References: <20260331113025.1566878-11-wei.fang@nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_181741_044639_CD6E95A9 
X-CRM114-Status: GOOD (  33.48  )
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

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
---
net: dsa: netc: introduce NXP NETC switch driver for i.MX94
    
This commit introduces the initial NXP NETC switch driver for the i.MX94
series. It supports basic probe and remove functionality for the integrated
802.1Q Ethernet switch. The switch includes 3 user ports and 1 CPU port
connected to an internal ENETC.

> diff --git a/drivers/net/dsa/netc/netc_main.c b/drivers/net/dsa/netc/netc_main.c
> new file mode 100644
> index 000000000000..5828fd3e342e
> --- /dev/null
> +++ b/drivers/net/dsa/netc/netc_main.c
[ ... ]
> +static int netc_port_create_emdio_bus(struct netc_port *np,
> +				      struct device_node *node)
> +{
[ ... ]
> +	err = devm_of_mdiobus_register(dev, bus, node);
> +	if (err)
> +		return dev_err_probe(dev, err,
> +				     "Cannot register EMDIO bus\n");
> +
> +	np->emdio = bus;
> +
> +	return 0;
> +}
[ ... ]
> +static int netc_init_switch_id(struct netc_switch *priv)
> +{
> +	struct netc_switch_regs *regs = &priv->regs;
> +	struct dsa_switch *ds = priv->ds;
> +
> +	/* The value of 0 is reserved for the VEPA switch and cannot
> +	 * be used.
> +	 */
> +	if (ds->index > SWCR_SWID || !ds->index) {
> +		dev_err(priv->dev, "Switch index %d out of range\n",
> +			ds->index);
> +		return -ERANGE;
> +	}

Does this check cause the probe to fail unconditionally for standard
single-switch topologies?

The DSA core typically assigns ds->index = 0 by default for the first switch.
Because !ds->index evaluates to true for index 0, this setup function will
always fail unless the dsa,member property is explicitly overridden in the
device tree.

Could the driver translate the hardware ID internally, for example by writing
ds->index + 1 to NETC_SWCR, rather than forcing this hardware-specific
restriction onto the software DSA index?

> +
> +	netc_base_wr(regs, NETC_SWCR, ds->index);
> +
> +	return 0;
> +}
[ ... ]
> +static bool netc_port_is_emdio_consumer(struct device_node *node)
> +{
> +	struct device_node *mdio_node;
> +
> +	/* If the port node has phy-handle property and it does
> +	 * not contain a mdio child node, then the port is the
> +	 * EMDIO consumer.
> +	 */
> +	mdio_node = of_get_child_by_name(node, "mdio");
> +	if (!mdio_node)
> +		return true;
> +
> +	of_node_put(mdio_node);
> +
> +	return false;
> +}
> +
> +/* Currently, phylink_of_phy_connect() is called by dsa_user_create(),
> + * so if the switch uses the external MDIO controller (like the EMDIO
> + * function) to manage the external PHYs. The MDIO bus may not be
> + * created when phylink_of_phy_connect() is called, so it will return
> + * an error and cause the switch driver to fail to probe.
> + * This workaround can be removed when DSA phylink_of_phy_connect()
> + * calls are moved from probe() to ndo_open().
> + */
> +static int netc_switch_check_emdio_is_ready(struct device *dev)
> +{
[ ... ]
> +	for_each_available_child_of_node_scoped(ports, child) {
> +		/* If the node does not have phy-handle property, then
> +		 * the port does not connect to a PHY, so the port is
> +		 * not the EMDIO consumer.
> +		 */
> +		phy_node = of_parse_phandle(child, "phy-handle", 0);
> +		if (!phy_node)
> +			continue;
> +
> +		if (!netc_port_is_emdio_consumer(child)) {
> +			of_node_put(phy_node);
> +			continue;
> +		}
> +
> +		phydev = of_phy_find_device(phy_node);
> +		of_node_put(phy_node);
> +		if (!phydev) {
> +			err = -EPROBE_DEFER;
> +			goto out;
> +		}

Could this logic cause an infinite probe deferral loop for ports sharing an
internal MDIO bus?

The netc_port_is_emdio_consumer() function assumes any port node without an
mdio child is an EMDIO consumer waiting for an external controller. However,
if multiple sibling ports on the same switch share a single internal MDIO bus
defined under one port, the other ports will lack an mdio child node.

This would cause those ports to be mistakenly treated as external EMDIO
consumers, calling of_phy_find_device(). Because the internal MDIO bus is not
registered until later in netc_setup(), the PHY device cannot be found, and
the driver returns -EPROBE_DEFER.

Since netc_setup() is never reached, the MDIO bus is never registered,
causing an infinite deferral loop. Could the driver more accurately identify
whether the PHY belongs to its own switch before deferring?

> +
> +		put_device(&phydev->mdio.dev);
> +	}
> +
> +out:
> +	of_node_put(ports);
> +
> +	return err;
> +}
> +
> +static int netc_switch_pci_init(struct pci_dev *pdev)
> +{
[ ... ]
> +	regs->base = pci_ioremap_bar(pdev, NETC_REGS_BAR);
> +	if (!regs->base) {
> +		err = -ENXIO;
> +		dev_err(dev, "pci_ioremap_bar() failed\n");
> +		goto release_mem_regions;
> +	}
[ ... ]
> +static void netc_switch_pci_destroy(struct pci_dev *pdev)
> +{
> +	struct netc_switch *priv = pci_get_drvdata(pdev);
> +
> +	iounmap(priv->regs.base);
> +	pci_release_mem_regions(pdev);
> +	pci_disable_device(pdev);
> +}

Does unmapping the memory here introduce a use-after-unmap issue when the
MDIO bus is unregistered?

The driver registers the MDIO bus using devm_of_mdiobus_register(), meaning
devres cleans it up asynchronously after the remove function returns or when
probe fails.

However, in netc_switch_pci_destroy(), the driver explicitly unmaps the PCI
I/O memory via iounmap(). Since netc_switch_pci_destroy() is called
synchronously inside the remove function and probe error paths, the memory is
unmapped before the MDIO bus is unregistered by devres.

When devres eventually unregisters the MDIO bus, it detaches PHY devices,
which often perform MDIO transactions during removal. Because the underlying
memory priv->regs.base is already unmapped, these MDIO read/write callbacks
could trigger a synchronous external abort or kernel panic.

Would it be better to use pcim_iomap() to tie the memory mapping lifecycle to
devres, ensuring it outlives the MDIO bus?

