Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11D55D58B36
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 05:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=52tPQhwVT3lRdPgXfFHBBBQXrWo9StX9rpwre4td7a0=; b=RRH/GzdXUr9CHXpFgs4ZWyZdpU
	VOoTPKFfXixKsFXbw/r1CXu0JuP1oULzWWCW2EDMe3xpAG95Az9oCT9tJBOd875cJjsEkGwjKkkWF
	kSUiKa3wREpIrA4+qXs3RZXdh606LDpnIYSDS1fZGx45cBDjGUvupZIF9ZD9ECxgKnEvpXDmHsJp7
	4Yjf8uYIQx+iD9skJ97jc8Qa3G5KuL/BStAYznZhWjGEg3SpHDHB6JPHXQlbld76D3ryb4s0G4yeP
	rcB70dHrQxfDF/vPUDdxy6mXW96G6+ObgpiJgfwNsYkyr3RuslGgMj0fSibAZLnh61juRfOFRqRjp
	4wnw0wHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w20hC-00000003MLI-12f5;
	Mon, 16 Mar 2026 05:40:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w20hA-00000003MKs-0ML2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 05:40:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 79CF040850;
	Mon, 16 Mar 2026 05:40:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B5C8C19425;
	Mon, 16 Mar 2026 05:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773639651;
	bh=EOcJg2rpMZmxLxL/nNrRabAiSunwZmxsgympFKG+XVs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uGHy4Pr0PmUsDIgPv4FBqyIqU2K4MeQ9n5w8oZaHRMBKLskR6ENL7+AIZfjPvOfZ5
	 sI68ch2mCPD+Sx5vXoS4Bdw0bgOaeTO2MVOhGSyUxLqE9O+h+fCwRdHv6NVSlyKVXh
	 wWhoTMSLLrtp+cGs4FFPjq3OP2vNUlyDIEyIQTJQAm9YID70+Ls8DQQGqXjUtWsxMz
	 QtVBU8VRHBzkf2sadpYGKxgLMn2KZYraktuuGp0aKSyHwJIoHSYUYA0WL6oYjieVyD
	 9n9uG9UNwMc+iuM7wirF01zTxp92zpHg0xZEcrLsgZGHQIW0uaWnR2O9jygB84smcP
	 zOlULZMRWVqHQ==
Date: Mon, 16 Mar 2026 11:10:42 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sherry Sun <sherry.sun@nxp.com>
Cc: hongxing.zhu@nxp.com, l.stach@pengutronix.de, Frank.Li@nxp.com, 
	bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com, 
	imx@lists.linux.dev, kernel@pengutronix.de, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V8 02/13] PCI: host-generic: Add common helpers for
 parsing Root Port properties
Message-ID: <phrbp7ypfsilv75dh723l5hekjfm7hn7wetihibjqgix7czyyf@rq3sgaqsvu2s>
References: <20260313020823.1592389-1-sherry.sun@nxp.com>
 <20260313020823.1592389-3-sherry.sun@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260313020823.1592389-3-sherry.sun@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_224052_260284_EBAFD610 
X-CRM114-Status: GOOD (  21.85  )
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

On Fri, Mar 13, 2026 at 10:08:12AM +0800, Sherry Sun wrote:
> Introduce generic helper functions to parse Root Port device tree nodes
> and extract common properties like reset GPIOs. This allows multiple
> PCI host controller drivers to share the same parsing logic.
> 
> Define struct pci_host_port to hold common Root Port properties
> (currently only reset GPIO descriptor) and add
> pci_host_common_parse_ports() to parse Root Port nodes from device tree.
> 
> Also add the 'ports' list to struct pci_host_bridge for better maintain
> parsed Root Port information.
> 
> Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> ---
>  drivers/pci/controller/pci-host-common.c | 78 ++++++++++++++++++++++++
>  drivers/pci/controller/pci-host-common.h | 15 +++++
>  drivers/pci/probe.c                      |  1 +
>  include/linux/pci.h                      |  1 +
>  4 files changed, 95 insertions(+)
> 
> diff --git a/drivers/pci/controller/pci-host-common.c b/drivers/pci/controller/pci-host-common.c
> index d6258c1cffe5..2f012cf80463 100644
> --- a/drivers/pci/controller/pci-host-common.c
> +++ b/drivers/pci/controller/pci-host-common.c
> @@ -9,6 +9,7 @@
>  
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> +#include <linux/gpio/consumer.h>
>  #include <linux/of.h>
>  #include <linux/of_address.h>
>  #include <linux/of_pci.h>
> @@ -17,6 +18,83 @@
>  
>  #include "pci-host-common.h"
>  
> +/**
> + * pci_host_common_delete_ports - Cleanup function for port list
> + * @data: Pointer to the port list head
> + */
> +static void pci_host_common_delete_ports(void *data)
> +{
> +	struct list_head *ports = data;
> +	struct pci_host_port *port, *tmp;
> +
> +	list_for_each_entry_safe(port, tmp, ports, list)
> +		list_del(&port->list);
> +}
> +
> +/**
> + * pci_host_common_parse_port - Parse a single Root Port node
> + * @dev: Device pointer
> + * @bridge: PCI host bridge
> + * @node: Device tree node of the Root Port
> + *
> + * Returns: 0 on success, negative error code on failure
> + */
> +static int pci_host_common_parse_port(struct device *dev,
> +				      struct pci_host_bridge *bridge,
> +				      struct device_node *node)
> +{
> +	struct pci_host_port *port;
> +	struct gpio_desc *reset;
> +
> +	reset = devm_fwnode_gpiod_get(dev, of_fwnode_handle(node),
> +				      "reset", GPIOD_ASIS, "PERST#");
> +	if (IS_ERR(reset))
> +		return PTR_ERR(reset);
> +
> +	port = devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);
> +	if (!port)
> +		return -ENOMEM;
> +
> +	port->reset = reset;
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
> + * Root Port properties (currently only reset GPIO).
> + *
> + * Returns: 0 on success, -ENOENT if no ports found, other negative error codes
> + * on failure
> + */
> +int pci_host_common_parse_ports(struct device *dev, struct pci_host_bridge *bridge)
> +{
> +	int ret = -ENOENT;
> +	int err;
> +
> +	for_each_available_child_of_node_scoped(dev->of_node, of_port) {
> +		if (!of_node_is_type(of_port, "pci"))
> +			continue;
> +		ret = pci_host_common_parse_port(dev, bridge, of_port);
> +		if (ret)
> +			return ret;
> +	}
> +

I think you should just do:

	if (ret)
		return ret;

and get rid of 'err'.

> +	err = devm_add_action_or_reset(dev, pci_host_common_delete_ports,
> +				       &bridge->ports);
> +	if (err)
> +		return err;
> +
> +	return ret;

return 0;

- Mani

-- 
மணிவண்ணன் சதாசிவம்

