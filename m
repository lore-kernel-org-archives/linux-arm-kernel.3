Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67591CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 22:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=O+NK9mT5enXcji2dbK6ZJnbu3hPEVucGNtXFe1GUSAA=; b=1pVHnV6FG9rQIB
	BS4JDua/ko57hLaUTcsww4hKRld9SDzUP0u8SnfZRy42Kk8mbbfWn2ViIDeOdCqlAha0pcpareaOn
	60W1+z4sTuC7+Mp4j+moF3or4ndjWPDTbAZgQBIlthEUlnvUIm8Xy6pbXLhU8AtirKkkYTjB71aYs
	ndgiOnvspD6p2AM2nItOuwzEHYi+OGxx17Z5x9za6Vk8QVjiDG6Pl+piXGl3Uv2ZqEQwtFZRKfl3B
	KaKL+BHbvlOhBRzi5BtJVnWxV5cHcqI8fyQho41h1ygN2Wf3NkfxzaliOnxFzizM1jNKBvwXEwUnk
	u9FHcOkXQfDemELOLQcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNIOj-00000003xF7-253r;
	Wed, 13 May 2026 22:49:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNIOh-00000003xEf-04zy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 22:49:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5BFAD43E43;
	Wed, 13 May 2026 22:49:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C486C19425;
	Wed, 13 May 2026 22:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778712586;
	bh=snh8WWtSZOtloR9okUSICXDPd2H7ALbfL83v/F8Bo2Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=bjmIuJTwY1BMTbWxZgy5E1RLotWmdjlWb4Era4sodpTMdDSUZG+wOiZ5l8E+6rw/T
	 XFMwHr1rg6CI2uqQIENLsuWQqiApwllx8sKB/ykGHmBQWqnT7wGIWGvKdN9L7FKsx6
	 ALFn3lCDY6CyvkkJ4w0zpjTqwRCReRDf0mH/Mk+4PsCjofzyQ36oNmnrIqNov4p4EV
	 xpAtzSk6mThryFkS+xtkdEsEFIMaasqag0Bmv776QtvXuxRYlW0qN7ju/QiHuDZyyT
	 IRlTz4nhu6y58ItFD2KzKZHgwPv1KHgSpLSFvb0PNDo5w/m1fioqNjt+44kJka34ki
	 /QKfDYaZH8w5g==
Date: Wed, 13 May 2026 17:49:44 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Sherry Sun <sherry.sun@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
	mani@kernel.org, bhelgaas@google.com, hongxing.zhu@nxp.com,
	l.stach@pengutronix.de, imx@lists.linux.dev,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V14 02/12] PCI: host-generic: Add common helpers for
 parsing Root Port properties
Message-ID: <20260513224944.GA341451@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260422093549.407022-3-sherry.sun@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_154947_103168_003ABAD2 
X-CRM114-Status: GOOD (  28.38  )
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

On Wed, Apr 22, 2026 at 05:35:39PM +0800, Sherry Sun wrote:
> Introduce generic helper functions to parse Root Port device tree nodes
> and extract common properties like reset GPIOs. This allows multiple
> PCI host controller drivers to share the same parsing logic.
> 
> Define struct pci_host_port to hold common Root Port properties
> (currently only list of PERST# GPIO descriptors) and add
> pci_host_common_parse_ports() to parse Root Port nodes from device tree.
> 
> Also add the 'ports' list to struct pci_host_bridge for better maintain
> parsed Root Port information.
> ...

> +static int pci_host_common_parse_port(struct device *dev,
> +				      struct pci_host_bridge *bridge,
> +				      struct device_node *node)
> +{
> +	struct pci_host_port *port;
> +	int ret;
> +
> +	port = devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);
> +	if (!port)
> +		return -ENOMEM;
> +
> +	INIT_LIST_HEAD(&port->perst);
> +
> +	ret = pci_host_common_parse_perst(dev, port, node);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * 1. PERST# found in RP or its child nodes - list is not empty, continue
> +	 * 2. PERST# not found in RP/children, but found in RC node - return -ENODEV
> +	 *    to fallback legacy binding
> +	 * 3. PERST# not found anywhere - list is empty, continue (optional PERST#)
> +	 */
> +	if (list_empty(&port->perst)) {
> +		if (of_property_present(dev->of_node, "reset-gpios") ||
> +		    of_property_present(dev->of_node, "reset-gpio"))
> +			return -ENODEV;

This doesn't seem right to me.  The parser of per-Root Port properties
should not be responsible for deciding whether legacy methods are
valid, i.e., whether a property is in the Root Complex node.  I think
it's up to the caller to decide whether it needs to look elsewhere.

I don't think this even needs to return a "success/failure" value
because there may be more properties in the future, and not all will
be required.  This function can't tell which properties a specific
driver requires and which are optional.

The caller can check whether we found what it needs and fall back to a
legacy method as needed.

> +	}
> +
> +	INIT_LIST_HEAD(&port->list);
> +	list_add_tail(&port->list, &bridge->ports);
> +
> +	return 0;
> +}
> +
> +/**
> + * pci_host_common_parse_ports - Parse Root Port nodes from device tree
> + * @dev: Device pointer
> + * @bridge: PCI host bridge
> + *
> + * This function iterates through child nodes of the host bridge and parses
> + * Root Port properties (currently only reset GPIOs).
> + *
> + * Returns: 0 on success, -ENODEV if no ports found or PERST# found in RC node
> + * (legacy binding should be used), Other negative error codes on failure.
> + */
> +int pci_host_common_parse_ports(struct device *dev, struct pci_host_bridge *bridge)
> +{
> +	int ret = -ENODEV;
> +
> +	for_each_available_child_of_node_scoped(dev->of_node, of_port) {
> +		if (!of_node_is_type(of_port, "pci"))
> +			continue;
> +		ret = pci_host_common_parse_port(dev, bridge, of_port);
> +		if (ret)
> +			goto err_cleanup;
> +	}

I think we should export pci_host_common_parse_port() itself and drop
this so we deal with a single Root Port, and drivers that support
multiple RPs should include their own loop similar to this.  That way
the driver can do several things at once in each iteration of that
loop, e.g., get resources, power up, configure, etc.

I see that would require some rework of the devm_add_action_or_reset()
cleanup.

> +	if (ret)
> +		return ret;
> +
> +	return devm_add_action_or_reset(dev, pci_host_common_delete_ports,
> +					&bridge->ports);
> +
> +err_cleanup:
> +	pci_host_common_delete_ports(&bridge->ports);
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(pci_host_common_parse_ports);
> ...

> + * struct pci_host_perst - PERST# GPIO descriptor
> + * @list: List node for linking multiple PERST# GPIOs
> + * @desc: GPIO descriptor for PERST# signal
> + *
> + * This structure holds a single PERST# GPIO descriptor.
> + */
> +struct pci_host_perst {
> +	struct list_head	list;
> +	struct gpio_desc	*desc;
> +};

How do we associate an element of this list with something?

Based on the imx6 changes, I guess we don't; we don't even associate
the pci_host_port with an RP.  We just assert/deassert PERST# for
every RP at once, and we do it for every GPIO associated with each RP.

There's no way to assert PERST# for a single RP.  I guess we don't
need that?

> +/**
> + * struct pci_host_port - Generic Root Port properties
> + * @list: List node for linking multiple ports
> + * @perst: List of PERST# GPIO descriptors for this port and its children
> + *
> + * This structure contains common properties that can be parsed from
> + * Root Port device tree nodes.
> + */
> +struct pci_host_port {

"host_port" is not really a standard term.  And despite the comments
above and below, I don't think the list is restricted to Root Ports
because we traverse the whole hierarchy below the RP.

> +	struct list_head	list;
> +	struct list_head	perst;
> +};

> +	struct list_head ports;		/* Root Port list (pci_host_port) */

