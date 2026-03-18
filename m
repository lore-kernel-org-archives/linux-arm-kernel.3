Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58FA9103E190
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 14:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1psZaN/gCJy0ECRd6dRbFqIWOzVDjGuIXtVAgkSorfQ=; b=xfTGUjRT3L9o4Ug1a6/5bHv9a+
	NegnH/6Ou54zDT5TsG4MtYQu6TFAzEQGubI7A0JpRpfadb/UJNy8N0KesD3GtovL64RHIQx/e7yRG
	ksLKqfJu6cUyMbta7zI0dGUHO03BA0lQsh+mXuHL11CdmzkJ9Mkf1hfeOVxyV19d/E/Bf/h8RmvBs
	cDkBxfJVFbk95yAUfVOALyICiOyF1H5erLatJlI5xa07T3tidMfJHhXi3Ibyw8QgHsBeh7qYdf44A
	2xJ28lCNtLRUy/cgyIfKmXAhWtkd8/qy6+i94AFTUrmTbjjOpqTfbfPa8XA0muudEUyBkDS/iPJzn
	WLIizbzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2s43-00000008boV-31sl;
	Wed, 18 Mar 2026 14:40:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2s42-00000008boP-3Cei
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 14:40:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id ADF4960053;
	Wed, 18 Mar 2026 14:40:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57A28C19421;
	Wed, 18 Mar 2026 14:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773844801;
	bh=lTmvcD4MKOhdnWf0ncRKcsBRvwfwpCt6pbrFgMkwmEk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ppPerBNKpDEGlFSD0eIGgFdqKHMmTNWGY3zGsy5tvajnPyn+rmcrcCvj5XUAyuQJt
	 MnV4m8ZgUmFgFeW3iEPmNoFfDdc1T2Gd3zgUWQ7ZXpwS36lRQmvuinvtNyRhUvKnck
	 ced/ZBisvBKL+YUxDrJDIur0GATS0eIAX/5JyWb2H2D6n2X3qOlWMrfem8eDJOeXqK
	 B/scLD2UWCuoNVrkyDGUPRJnqqGxmHu6puDaqtoJ8dcuo1qZWefKiBe0HIiyXQ3JY9
	 kr/foja6rZeHkdOqh8IPifayS5S+hZAHWlEqLLDOrd5degRj9o0qU5Fq2Wl9PBDPwa
	 ysnACeo7yK53w==
From: Simon Horman <horms@kernel.org>
To: wei.fang@nxp.com
Cc: Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	conor+dt@kernel.org,
	andrew+netdev@lunn.ch,
	edumazet@google.com,
	linux-kernel@vger.kernel.org,
	frank.li@nxp.com,
	vladimir.oltean@nxp.com,
	kuba@kernel.org,
	f.fainelli@gmail.com,
	krzk+dt@kernel.org,
	claudiu.manoil@nxp.com,
	robh@kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	xiaoning.wang@nxp.com,
	davem@davemloft.net,
	linux@armlinux.org.uk,
	chleroy@kernel.org,
	devicetree@vger.kernel.org,
	pabeni@redhat.com,
	imx@lists.linux.dev
Subject: Re: [net-next,10/14] net: dsa: netc: introduce NXP NETC switch driver for i.MX94
Date: Wed, 18 Mar 2026 14:39:30 +0000
Message-ID: <20260318143930.1890017-1-horms@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260316094152.1558671-11-wei.fang@nxp.com>
References: <20260316094152.1558671-11-wei.fang@nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
---
net: dsa: netc: introduce NXP NETC switch driver for i.MX94

This commit introduces the initial NETC switch driver for the i.MX94
series. The driver provides basic probe and remove functionality for
the NXP NETC Ethernet switch which has 3 user ports and 1 CPU port.

> diff --git a/drivers/net/dsa/netc/netc_main.c b/drivers/net/dsa/netc/netc_main.c
> --- /dev/null
> +++ b/drivers/net/dsa/netc/netc_main.c

[ ... ]

> @@ -0,0 +1,698 @@
> +static int netc_port_create_emdio_bus(struct netc_port *np,
> +				      struct device_node *node)
> +{
> +	struct netc_switch *priv = np->switch_priv;
> +	struct enetc_mdio_priv *mdio_priv;
> +	struct device *dev = priv->dev;
> +	struct enetc_hw *hw;
> +	struct mii_bus *bus;
> +	int err;
> +
> +	hw = enetc_hw_alloc(dev, np->iobase);
> +	if (IS_ERR(hw))
> +		return dev_err_probe(dev, PTR_ERR(hw),
> +				     "Failed to allocate enetc_hw\n");
> +
> +	bus = devm_mdiobus_alloc_size(dev, sizeof(*mdio_priv));
> +	if (!bus)
> +		return -ENOMEM;
> +
> +	bus->name = "NXP NETC switch external MDIO Bus";
> +	bus->read = enetc_mdio_read_c22;
> +	bus->write = enetc_mdio_write_c22;
> +	bus->read_c45 = enetc_mdio_read_c45;
> +	bus->write_c45 = enetc_mdio_write_c45;
> +	bus->parent = dev;
> +	mdio_priv = bus->priv;
> +	mdio_priv->hw = hw;
> +	mdio_priv->mdio_base = NETC_EMDIO_BASE;
> +	snprintf(bus->id, MII_BUS_ID_SIZE, "%s-p%d-emdio",
> +		 dev_name(dev), np->dp->index);
> +
> +	err = devm_of_mdiobus_register(dev, bus, node);
> +	if (err)
> +		return dev_err_probe(dev, err,
> +				     "Cannot register EMDIO bus\n");
> +
> +	np->emdio = bus;
> +
> +	return 0;
> +}
> +
> +static int netc_port_create_mdio_bus(struct netc_port *np,
> +				     struct device_node *node)
> +{
> +	struct device_node *mdio_node;
> +	int err;
> +
> +	mdio_node = of_get_child_by_name(node, "mdio");
> +	if (mdio_node) {
> +		err = netc_port_create_emdio_bus(np, mdio_node);
> +		of_node_put(mdio_node);
> +		if (err)
> +			return err;
> +	}
> +
> +	return 0;
> +}
> +
> +static void netc_port_free_mdio_bus(struct netc_port *np)
> +{
> +	if (np->emdio)
> +		mdiobus_unregister(np->emdio);
                         ^^^^

Does this cause a double unregister? The MDIO bus is registered with
devm_of_mdiobus_register() in netc_port_create_emdio_bus(), which
installs a devres action that automatically calls mdiobus_unregister()
during device removal.

However, netc_port_free_mdio_bus() also explicitly calls
mdiobus_unregister(np->emdio).

During device removal:

  netc_switch_remove()
    -> dsa_unregister_switch()
      -> dsa_switch_teardown()
        -> netc_teardown()
          -> netc_free_mdio_bus()
            -> netc_port_free_mdio_bus()
              -> mdiobus_unregister()  // first call

Then devres cleanup fires:

  devm_mdiobus_unregister()
    -> mdiobus_unregister()  // second call
      -> WARN_ON_ONCE(bus->state != MDIOBUS_REGISTERED)

The second call triggers a warning at drivers/net/phy/mdio_bus_provider.c:675
because the bus state is already MDIOBUS_UNREGISTERED. With
panic_on_warn=1, this causes a kernel panic.

The same double-unregister occurs on the error path of
netc_init_all_ports(), where netc_free_mdio_bus() is called, but devres
will also fire during device teardown.

> +}

[ ... ]

> +static int netc_switch_pci_init(struct pci_dev *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct netc_switch_regs *regs;
> +	struct netc_switch *priv;
> +	int err;
> +
> +	pcie_flr(pdev);
> +	err = pci_enable_device_mem(pdev);
> +	if (err)
> +		return dev_err_probe(dev, err, "Failed to enable device\n");
> +
> +	/* The command BD rings and NTMP tables need DMA */
> +	dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64));
                                       ^^^^

Is the return value being checked? The comment states "command BD rings
and NTMP tables need DMA", confirming DMA is essential for this driver.

The function can fail with -EIO when dma_supported() returns false for
the 64-bit mask (from dma_set_mask() in kernel/dma/mapping.c:902).

The sibling enetc driver from the same NXP NETC subsystem checks this
return value in enetc.c:

  err = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
  if (err) {
      ...
      goto err_dma;
  }

If the 64-bit DMA mask setup fails, the DMA mask remains at the default,
and subsequent DMA operations for NTMP table management (added in later
commits) may silently fail or produce incorrect results on systems with
memory above 4GB.

> +	err = pci_request_mem_regions(pdev, KBUILD_MODNAME);
> +	if (err) {
> +		dev_err(dev, "Failed to request memory regions, err: %pe\n",
> +			ERR_PTR(err));
> +		goto disable_pci_device;
> +	}
> +
> +	pci_set_master(pdev);
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv) {
> +		err = -ENOMEM;
> +		goto release_mem_regions;
> +	}
> +
> +	priv->pdev = pdev;
> +	priv->dev = dev;
> +
> +	regs = &priv->regs;
> +	regs->base = pci_ioremap_bar(pdev, NETC_REGS_BAR);
> +	if (!regs->base) {
> +		err = -ENXIO;
> +		dev_err(dev, "pci_ioremap_bar() failed\n");
> +		goto release_mem_regions;
> +	}
> +
> +	regs->port = regs->base + NETC_REGS_PORT_BASE;
> +	regs->global = regs->base + NETC_REGS_GLOBAL_BASE;
> +	pci_set_drvdata(pdev, priv);
> +
> +	return 0;
> +
> +release_mem_regions:
> +	pci_release_mem_regions(pdev);
> +disable_pci_device:
> +	pci_disable_device(pdev);
> +
> +	return err;
> +}

[ ... ]

