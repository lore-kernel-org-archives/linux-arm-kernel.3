Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0390CC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 20:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=04K7qpGW9FL5H3SBXr9eIZQaPIR5P3eQdW5+QDqDR0c=; b=kFwA9xfA+cFpwO
	/IFKk774R+dAM3/GVJtE/Q7iLXok0fAiBOhrT+FAvZc3qsqHxFhd+3swNMk8E/2l/5KgH0MEj+s6K
	sghxWLwefbrtvrVjbYKH2kUwCbOMBBtXtB+yDSpmmims8nxATGS4Xu0989wmdJdvIhNdTzpCHpPF3
	baeMgHY0WZNSYQ1Sklb7INnL05KPWXj5OmYlh9R2TdlApOXdnxnF8f94p4C2ZrARfbF7GhAhFfqtq
	CLVqrrjP8V/VIbiOXgDcd17H88TxGezRG3BXdUm0yKwEJHM3xsNbUqep5HQafv1t9QOg0WG2FxKgX
	a7sbN51b7EXg61Xxw0hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAaIN-0000000GYOt-1bZi;
	Thu, 01 May 2025 20:14:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAaGU-0000000GYFb-23q7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 20:12:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6CE7268443;
	Thu,  1 May 2025 20:11:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA570C4CEE3;
	Thu,  1 May 2025 20:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746130333;
	bh=XrRb459uroJoO9qEw2VwUdS7OlcuUspffa1aqenJIr8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=fcOCIuvYhbjkl/+lgLFp5OGgG0YvjQEfAtvUn915QhEXPUMBXB8aM++rwEKASptE5
	 uGJIiQYjsqamlV8SLulKKtb78CF3px6090vR9sxIT0GbSeF5kWN8oGpUle7XtEnZGb
	 AJe7aTnwZdqzi+V3399cZ0b8pM9pQxqrOkR/1FYbDCYtS5zIr33dTcosxvJu5CuZWt
	 vuMbOhxm//sUvv5cHuWBD9qupNA5nIZfqelS6ole8CbwHWQgjBQ5hKIff+kTVIjjfU
	 FZXo9yv3zl5rC7CNOhVHEgbPXrMkls2X3Kb05n7SSFD4PLrN+ZpeWj5rs4JC+bcI1Y
	 8My5ij7AunGKw==
Date: Thu, 1 May 2025 15:12:11 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kw@linux.com,
	manivannan.sadhasivam@linaro.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be,
	magnus.damm@gmail.com, mturquette@baylibre.com, sboyd@kernel.org,
	saravanak@google.com, p.zabel@pengutronix.de,
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH 5/8] PCI: rzg3s-host: Add Initial PCIe Host Driver for
 Renesas RZ/G3S SoC
Message-ID: <20250501201211.GA768334@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430103236.3511989-6-claudiu.beznea.uj@bp.renesas.com>
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

On Wed, Apr 30, 2025 at 01:32:33PM +0300, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> The Renesas RZ/G3S features a PCIe IP that complies with the PCI Express
> Base Specification 4.0 and supports speeds of up to 5 GT/s. It functions
> only as a root complex, with a single-lane (x1) configuration. The
> controller includes Type 1 configuration registers, as well as IP
> specific registers (called AXI registers) required for various adjustments.
> 
> Other Renesas RZ SoCs (e.g., RZ/G3E, RZ/V2H) share the same AXI registers
> but have both Root Complex and Endpoint capabilities. As a result, the PCIe
> host driver can be reused for these variants with minimal adjustments.

I guess this current driver only supports RZ/GS3 in Root Complex mode?
If so, I don't think this paragraph is necessary or really relevant.

> +++ b/drivers/pci/controller/pcie-rzg3s-host.c
> @@ -0,0 +1,1561 @@

I can't figure out the line width you're using.  Generally code in
drivers/pci/ is formatted to fit in 80 columns.  Much of this file is
formatted for that, but there are many cases that seem to use 90 or
100 columns.

For single-line comments that are not a sentence or are a single
sentence, it's typical to omit the period at end.

> +static void rzg3s_pcie_update_bits(void __iomem *base, u32 offset, u32 mask, u32 val)
> +{
> +	u32 tmp;
> +
> +	tmp = readl(base + offset);
> +	tmp &= ~mask;
> +	tmp |= val & mask;
> +	writel(tmp, base + offset);
> +}

Nothing rzg3s-specific here.

I think u32p_replace_bits() (include/linux/bitfield.h) is basically this.

> +static int rzg3s_pcie_config_access(struct rzg3s_pcie_host *host, struct pci_bus *bus,
> +				    unsigned int devfn, int where, u32 *data,
> +				    enum rzg3s_pcie_cfg_access_type access_type)
> +{
> +	bool type0 = pci_is_root_bus(bus->parent) ? true : false;
> +	unsigned int dev, func, reg, tr_type;
> +	int ret;
> +
> +	dev = PCI_SLOT(devfn);
> +	func = PCI_FUNC(devfn);
> +	reg = where & ~0x3;

This obviously has to be serialized with other config accesses.  Can
you add a comment about what provides that serialization?  I assume
it's probably pci_lock via pci_lock_config()?

> +	/* Set the destination. */
> +	writel(FIELD_PREP(RZG3S_PCI_REQADR1_BUS, bus->number) |
> +	       FIELD_PREP(RZG3S_PCI_REQADR1_DEV, dev) |
> +	       FIELD_PREP(RZG3S_PCI_REQADR1_FUNC, func) |
> +	       FIELD_PREP(RZG3S_PCI_REQADR1_REG, reg),
> +	       host->axi + RZG3S_PCI_REQADR1);
> +
> +	/* Set byte enable. */
> +	writel(RZG3S_PCI_REQBE_BYTE_EN, host->axi + RZG3S_PCI_REQBE);
> +
> +	if (access_type == RZG3S_PCIE_CFG_ACCESS_RD) {
> +		tr_type = type0 ? RZG3S_PCI_REQISS_TR_TP0_RD : RZG3S_PCI_REQISS_TR_TP1_RD;
> +	} else {
> +		tr_type = type0 ? RZG3S_PCI_REQISS_TR_TP0_WR : RZG3S_PCI_REQISS_TR_TP1_WR;
> +
> +		/* Set the write data.  */
> +		writel(0, host->axi + RZG3S_PCI_REQDATA(0));
> +		writel(0, host->axi + RZG3S_PCI_REQDATA(1));
> +		writel(*data, host->axi + RZG3S_PCI_REQDATA(2));
> +	}
> +
> +	/* Set the type of request. */
> +	writel(tr_type, host->axi + RZG3S_PCI_REQISS);
> +
> +	/* Issue the request and wait to finish. */
> +	ret = rzg3s_pcie_issue_request(host);
> +	if (ret) {
> +		if (access_type == RZG3S_PCIE_CFG_ACCESS_RD)
> +			PCI_SET_ERROR_RESPONSE(data);
> +
> +		return PCIBIOS_SET_FAILED;
> +	}
> +
> +	/* Read the data. */
> +	if (access_type == RZG3S_PCIE_CFG_ACCESS_RD)
> +		*data = readl(host->axi + RZG3S_PCI_REQRCVDAT);
> +
> +	return PCIBIOS_SUCCESSFUL;
> +}

> +static int rzg3s_pcie_read_conf(struct pci_bus *bus, unsigned int devfn, int where, int size,
> +				u32 *val)
> +{
> +	struct rzg3s_pcie_host *host = bus->sysdata;
> +	int ret;
> +
> +	/*
> +	 * Bus number for root complex is set to zero. 

A root bus is not always bus number zero.  It sounds like the bus
number is configurable on this hardware?  I don't see a dependency on
the bus number, so I'm wondering why this sentence is here.

> +	   ... Skip other requests for
> +	 * vendor and device ID (where = 0x00).

Why do we need to avoid config reads for root bus devices other than
00.0?  Does the hardware not fabricate ~0 read data when a PCI error
occurs?

It looks like you allow reads for other root bus devices at non-zero
offsets?  E.g., we could read the Device ID at offset 0x02?

> +	 */
> +	if (pci_is_root_bus(bus) && PCI_SLOT(devfn) && !where)
> +		return PCIBIOS_DEVICE_NOT_FOUND;
> +
> +	ret = rzg3s_pcie_read_config_access(host, bus, devfn, where, val);
> +	if (ret != PCIBIOS_SUCCESSFUL)
> +		return ret;
> +
> +	if (size == 1)
> +		*val = (*val >> (BITS_PER_BYTE * (where & 3))) & 0xff;
> +	else if (size == 2)
> +		*val = (*val >> (BITS_PER_BYTE * (where & 2))) & 0xffff;
> +
> +	dev_dbg(&bus->dev, "%s(): bus=%3d devfn=0x%04x where=0x%04x size=%d val=0x%08x\n",
> +		__func__, bus->number, devfn, where, size, *val);
> +
> +	return PCIBIOS_SUCCESSFUL;
> +}

> +static int rzg3s_pcie_write_conf(struct pci_bus *bus, unsigned int devfn, int where, int size,
> +				 u32 val)
> +{
> +	struct rzg3s_pcie_host *host = bus->sysdata;
> +	u32 shift, data;
> +	int ret;
> +
> +	ret = rzg3s_pcie_read_config_access(host, bus, devfn, where, &data);
> +	if (ret != PCIBIOS_SUCCESSFUL)
> +		return ret;

I guess this controller can't do an atomic config write, so you have
to do a read/modify/write?  That's broken in some corner cases, e.g.,
it can corrupt RW1C bits in adjacent registers.

We emit a warning about this in pci_generic_config_write32().  I don't
think we've been consistent about similar warnings in driver-specific
code like this, but I would like to have a dmesg hint so that if we
ever trip over this, it might be easier to debug.

> +	dev_dbg(&bus->dev, "%s(): bus=%3d devfn=0x%04x where=0x%04x size=%d val=0x%08x\n",
> +		__func__, bus->number, devfn, where, size, val);
> +
> +	if (size == 1) {
> +		shift = BITS_PER_BYTE * (where & 3);
> +		data &= ~(0xff << shift);
> +		data |= ((val & 0xff) << shift);
> +	} else if (size == 2) {
> +		shift = BITS_PER_BYTE * (where & 2);
> +		data &= ~(0xffff << shift);
> +		data |= ((val & 0xffff) << shift);
> +	} else {
> +		data = val;
> +	}
> +
> +	return rzg3s_pcie_write_config_access(host, bus, devfn, where, data);
> +}

> +static struct irq_chip rzg3s_pcie_msi_bottom_chip = {
> +	.name			= "rz-pcie-msi",
> +	.irq_ack		= rzg3s_pcie_msi_irq_ack,
> +	.irq_mask		= rzg3s_pcie_msi_irq_mask,
> +	.irq_unmask		= rzg3s_pcie_msi_irq_unmask,
> +	.irq_compose_msi_msg	= rzg3s_pcie_msi_compose_msg,

s/msi_compose_msg/compose_msi_msg/
to match .irq_compose_msi_msg, which doesn't quite match the others
but makes it easier to grep and compare .irq_compose_msi_msg
implementations.

> +	 * According to the RZ/G3S HW manual (section 34.4.5.2 Setting the MSI Window)
> +	 * the MSI window need to be within any AXI window. Find an AXI window to setup
> +	 * the MSI window.

There may be several revisions of the RZ/G3S spec and they might not
preserve section numbers, so it might be worth including "r1.0" or
whatever to make the citation unambiguous.

> +static struct irq_chip rzg3s_pcie_intx_irq_chip = {
> +	.name = "PCIe INTx",
> +	.irq_ack = rzg3s_pcie_intx_ack,
> +	.irq_mask = rzg3s_pcie_intx_mask,
> +	.irq_unmask = rzg3s_pcie_intx_unmask,

Would prefer *_irq_ack, *_irq_mask, *_irq_unmask similar to MSI ops
above.

> +static int rzg3s_pcie_intx_setup(struct rzg3s_pcie_host *host)
> +{
> +	struct device *dev = host->dev;
> +	struct device_node *np = dev->of_node;
> +	struct device_node *intc_np __free(device_node) = of_get_child_by_name(np,
> +								"legacy-interrupt-controller");
> +	int irq_count;
> +
> +	if (!intc_np) {
> +		dev_warn(dev, "legacy-interrupt-controller node is absent\n");
> +		return 0;
> +	}
> +
> +	irq_count = of_irq_count(intc_np);
> +	if (irq_count != PCI_NUM_INTX)
> +		return dev_err_probe(dev, -EINVAL,
> +				     "Invalid IRQ entries in legacy-interrupt-controller\n");

We now know the value of irq_count, so why not just use PCI_NUM_INTX
below?

> +	for (int i = 0; i < irq_count; i++) {
> +		int irq = irq_of_parse_and_map(intc_np, i);
> +
> +		if (!irq)
> +			return dev_err_probe(dev, -EINVAL, "Failed to parse and map INTx IRQ\n");

Could say which one?

> +
> +		host->intx_irqs[i] = irq;
> +		irq_set_chained_handler_and_data(irq, rzg3s_pcie_intx_irq_handler, host);
> +	}
> +
> +	host->intx_domain = irq_domain_add_linear(intc_np, irq_count,
> +						  &rzg3s_pcie_intx_domain_ops, host);
> +	if (!host->intx_domain)
> +		return dev_err_probe(dev, -EINVAL, "Failed to add irq domain for INTX irqs\n");

s/INTX/INTx/ to match above.
s/irqs/IRQs/ to match above.

> +static int rzg3s_pcie_set_max_link_speed(struct rzg3s_pcie_host *host)
> +{
> +	u32 lcs, cs2, link_speed, remote_supported_link_speeds, tmp;
> +	u8 ltssm_state_l0 = 0xc;
> +	int ret;
> +
> +	/*
> +	 * According to the RZ/G3S HW manual (section 34.6.3 Caution when Changing
> +	 * the Speed Spontaneously) link speed change can be done only when the
> +	 * link training and status state machine in the PCIe Core Link is L0.
> +	 */
> +	ret = readl_poll_timeout(host->axi + RZG3S_PCI_PCSTAT1, tmp,
> +				 FIELD_GET(RZG3S_PCI_PCSTAT1_LTSSM_STATE, tmp) == ltssm_state_l0,
> +				 100, 1000);

Where do these timeout values come from?  Is there or should there be
a #define for them?

> +static void rzg3s_pcie_cfg_init(struct rzg3s_pcie_host *host)
> +{
> +	/* Enable access control to the CFGU. */
> +	writel(RZG3S_PCI_PERM_CFG_HWINIT_EN, host->axi + RZG3S_PCI_PERM);
> +
> +	/* Update vendor ID and device ID. */
> +	writel(FIELD_PREP(RZG3S_PCI_CFG_VID_VENDOR, host->vendor_id) |
> +	       FIELD_PREP(RZG3S_PCI_CFG_VID_DEVICE, host->device_id),
> +	       host->pcie + RZG3S_PCI_CFG_VID);
> +
> +	/* HW manual recommends to write 0xffffffff on initialization. */
> +	writel(0xffffffff, host->pcie + RZG3S_PCI_CFG_BARMSK00L);
> +	writel(0xffffffff, host->pcie + RZG3S_PCI_CFG_BARMSK00U);
> +
> +	/* Primary bus = 0, secondary bus = 1, subordinate bus = 1. */
> +	writel(FIELD_PREP(RZG3S_PCI_CFG_BNR_SUBORDINATE_BUS, 1) |
> +	       FIELD_PREP(RZG3S_PCI_CFG_BNR_SECONDARY_BUS, 1),
> +	       host->pcie + RZG3S_PCI_CFG_BNR);

I assume this configures a Root Port.  Is the primary bus hardwired to
zero?  There's no PCIe requirement that a root bus be bus 0.  This
looks like it limits the subordinate bus unnecessarily.  The PCI core
can program the secondary and subordinate bus numbers to accommodate
the attached hierarchy.

> +static void rzg3s_pcie_irqs_init(struct rzg3s_pcie_host *host)

This and many of the following functions have names that don't
correspond to anything in other drivers, which makes it harder to
transfer knowledge between the drivers.  If you can find a pattern
somewhere to follow, it will make it easier for others to read the
driver.

> +static int rzg3s_pcie_hw_init(struct rzg3s_pcie_host *host, bool probe)
> +{
> +	u32 val;
> +	int ret;
> +
> +	/* Set the PCIe related registers. */
> +	rzg3s_pcie_cfg_init(host);
> +
> +	/* Set the interrupts. */
> +	rzg3s_pcie_irqs_init(host);
> +
> +	ret = rzg3s_pcie_resets_bulk_set(reset_control_bulk_deassert, host->cfg_resets,
> +					 host->num_cfg_resets);
> +	if (ret)
> +		return ret;
> +
> +	/* Wait for link up. */
> +	ret = readl_poll_timeout(host->axi + RZG3S_PCI_PCSTAT1, val,
> +				 !(val & RZG3S_PCI_PCSTAT1_DL_DOWN_STS), 5000, 500000);

Ditto (source of timeout values).

> +static int rzg3s_pcie_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	void *devres_group_id;
> +	int ret;
> +
> +	devres_group_id = devres_open_group(dev, NULL, GFP_KERNEL);
> +	if (!devres_group_id)
> +		return -ENOMEM;

What's the benefit of using devres_open_group()?  No other PCI
controller drivers use it.

> +	ret = rzg3s_pcie_probe_helper(pdev, devres_group_id);

This is the only driver that uses a *_pcie_probe_helper() function.

> +static DEFINE_NOIRQ_DEV_PM_OPS(rzg3s_pcie_pm_ops, rzg3s_pcie_suspend, rzg3s_pcie_resume);

Adding "_noirq" to the function names would be a good hint.

Only a dozen drivers in the whole tree use DEFINE_NOIRQ_DEV_PM_OPS(),
which makes me wonder why this one is different.  There are a dozen or
so PCI drivers that use NOIRQ_SYSTEM_SLEEP_PM_OPS().

Bjorn

