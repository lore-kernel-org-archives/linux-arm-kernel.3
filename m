Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A303CA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 Aug 2025 04:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oe+j17a62BLHAQWV/HOy9bmgDAunNGboGUOEQ4so8yE=; b=lRSLPIIRkgBrw7Z98mNiebd5vA
	bkMF0QnqT/bnmq0tsgW2i2Cq7/Ku0/7odQ4y60DGhxNY7n+MhaK/OdGfN+Fk18nWohXspoAs51rXc
	N0juLRO5/5LKMCdkaoQ1oJlQwKajFZpD7PUTRk1+4P5NeExszHaBON4O/2u9QvPAjA5OlpMsJegDx
	sYe5jyqFe2Ekzz9p5rOQiDh/rmEIZrnoJYj0448nF1RCDjY6FzV82sguQv0AurGVX3DKxhRWC/+V5
	fye6aTscUljROBtdTvVHZTQhoAwsXFL/IFZuijXV3Qyme6ABHf/aVI46MhJgsQFqobGP3Ht30MYlc
	rIui6U9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usZOV-000000096co-1oV6;
	Sun, 31 Aug 2025 04:10:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usZLl-000000095rX-3YwR
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 Aug 2025 04:07:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9250B601A7;
	Sun, 31 Aug 2025 04:07:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BFE8C4CEED;
	Sun, 31 Aug 2025 04:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756613247;
	bh=LptXLD1zwFlWZSHFVxFcX1U/UXwMN65+JMNh3/oeSoI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LbFk+MFWyECQgwWN/R2B7l0hcZN7hA2vUQVDt1Z3vI+4xJ3whKk9FXHuOSLrhh68P
	 HgDKzytxI9JEgGTqLShXuxO5gzSXveAhj/0L+tAk3KhXz+RWTt4YyXJeDE3WTswKVQ
	 AqyW+cv2P79nBkjorkKxY8lhHwuLTsXTNYrIOvJWNTT8hLKaVaG/JT0Buj1ZluwEGZ
	 0T9Z0g99KxMdPVAJcY7C+z1Oy0MCGyqXkXjNLTAsLMbeJ2bxsyknjvLi81LciN82+c
	 uFx/JoVnTWTTtlvAqGEvpG+08cvISOMgCy7Y7MTumCDyV7Fg+QKPdRJyqiN3KXtr1Q
	 QzC86xUv46DfQ==
Date: Sun, 31 Aug 2025 09:37:17 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be, 
	magnus.damm@gmail.com, catalin.marinas@arm.com, will@kernel.org, 
	mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de, lizhi.hou@amd.com, 
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v3 5/9] PCI: rzg3s-host: Add Initial PCIe Host Driver for
 Renesas RZ/G3S SoC
Message-ID: <zsgncwvhykw4ja3bbqaxwupppjsqq4pcrdgrsduahokmt72xsm@twekpse6uzzh>
References: <20250704161410.3931884-1-claudiu.beznea.uj@bp.renesas.com>
 <20250704161410.3931884-6-claudiu.beznea.uj@bp.renesas.com>
 <ddxayjj5wcuuish4kvyluzrujkes5seo7zlusmomyjfjcgzcyj@xe3zzzmy2zaj>
 <8ef466aa-b470-4dcb-9024-0a9c36eb9a6a@tuxon.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8ef466aa-b470-4dcb-9024-0a9c36eb9a6a@tuxon.dev>
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

On Sat, Aug 30, 2025 at 02:22:45PM GMT, Claudiu Beznea wrote:
> 
> 
> On 30.08.2025 09:59, Manivannan Sadhasivam wrote:
> > On Fri, Jul 04, 2025 at 07:14:05PM GMT, Claudiu wrote:
> >> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >>
> >> The Renesas RZ/G3S features a PCIe IP that complies with the PCI Express
> >> Base Specification 4.0 and supports speeds of up to 5 GT/s. It functions
> >> only as a root complex, with a single-lane (x1) configuration. The
> >> controller includes Type 1 configuration registers, as well as IP
> >> specific registers (called AXI registers) required for various adjustments.
> >>
> >> Hardware manual can be downloaded from the address in the "Link" section.
> >> The following steps should be followed to access the manual:
> >> 1/ Click the "User Manual" button
> >> 2/ Click "Confirm"; this will start downloading an archive
> >> 3/ Open the downloaded archive
> >> 4/ Navigate to r01uh1014ej*-rzg3s-users-manual-hardware -> Deliverables
> >> 5/ Open the file r01uh1014ej*-rzg3s.pdf
> >>
> >> Link: https://www.renesas.com/en/products/rz-g3s?queryID=695cc067c2d89e3f271d43656ede4d12
> >> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> >> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >> ---
> >>
> > 
> > [...]
> > 
> >> +static bool rzg3s_pcie_child_issue_request(struct rzg3s_pcie_host *host)
> >> +{
> >> +	u32 val;
> >> +	int ret;
> >> +
> >> +	rzg3s_pcie_update_bits(host->axi, RZG3S_PCI_REQISS,
> >> +			       RZG3S_PCI_REQISS_REQ_ISSUE,
> >> +			       RZG3S_PCI_REQISS_REQ_ISSUE);
> >> +	ret = readl_poll_timeout_atomic(host->axi + RZG3S_PCI_REQISS, val,
> >> +					!(val & RZG3S_PCI_REQISS_REQ_ISSUE),
> >> +					5, RZG3S_REQ_ISSUE_TIMEOUT_US);
> >> +
> >> +	return !!ret || (val & RZG3S_PCI_REQISS_MOR_STATUS);
> > 
> > You don't need to do !!ret as the C11 standard guarantees that any scalar type
> > stored as bool will have the value of 0 or 1.
> 
> OK, will drop it anyway as suggested in another thread.
> 
> > 
> >> +}
> >> +
> > 
> > [...]
> > 
> >> +static void __iomem *rzg3s_pcie_root_map_bus(struct pci_bus *bus,
> >> +					     unsigned int devfn,
> >> +					     int where)
> >> +{
> >> +	struct rzg3s_pcie_host *host = bus->sysdata;
> >> +
> >> +	if (devfn)
> >> +		return NULL;
> > 
> > Is it really possible to have devfn as non-zero for a root bus?
> 
> I will drop it.
> 
> > 
> >> +
> >> +	return host->pcie + where;
> >> +}
> >> +
> > 
> > [...]
> > 
> >> +static int rzg3s_pcie_msi_setup(struct rzg3s_pcie_host *host)
> >> +{
> >> +	size_t size = RZG3S_PCI_MSI_INT_NR * sizeof(u32);
> >> +	struct rzg3s_pcie_msi *msi = &host->msi;
> >> +	struct device *dev = host->dev;
> >> +	int id, ret;
> >> +
> >> +	msi->pages = __get_free_pages(GFP_KERNEL | GFP_DMA, 0);
> >> +	if (!msi->pages)
> >> +		return -ENOMEM;
> >> +
> >> +	msi->dma_addr = dma_map_single(dev, (void *)msi->pages, size * 2,
> >> +				       DMA_BIDIRECTIONAL);
> >> +	if (dma_mapping_error(dev, msi->dma_addr)) {
> >> +		ret = -ENOMEM;
> >> +		goto free_pages;
> >> +	}
> >> +
> >> +	/*
> >> +	 * According to the RZ/G3S HW manual (Rev.1.10, section 34.4.5.2 Setting
> >> +	 * the MSI Window) the MSI window need to be within any AXI window. Find
> >> +	 * an AXI window to setup the MSI window.
> > 
> > Are you really finding the AXI window or just making sure that the MSI window
> > falls into one of the AXI window?
> 
> I'm making sure the MSI windows falls into one of the enabled AXI windows.
> 

Then you need to reword the comment as such. Currently, it is not clear.

> > 
> > And I believe it is OK to have more than one MSI window within an AXI window.
> 
> This IP supports a single MSI window that need to fit into one of the
> enabled AXI windows.
> 

[...]

> >> +
> >> +	/* Update vendor ID and device ID */
> > 
> > Are you really updating it or setting it? If you are updating it, are the
> > default IDs invalid?
> 
> Default IDs are valid (at least on RZ/G3S) but Renesas specific. Renesas
> wants to let individual users to set their own IDs.
> 

So they are optional then? But the binding treats them as required, which should
be changed if the default IDs are valid.

> > 
> >> +	writew(host->vendor_id, host->pcie + PCI_VENDOR_ID);
> >> +	writew(host->device_id, host->pcie + PCI_DEVICE_ID);
> >> +
> >> +	/* HW manual recommends to write 0xffffffff on initialization */
> >> +	writel(0xffffffff, host->pcie + RZG3S_PCI_CFG_BARMSK00L);
> >> +	writel(0xffffffff, host->pcie + RZG3S_PCI_CFG_BARMSK00U);
> >> +
> >> +	/* Update bus info. */
> >> +	writeb(primary_bus, host->pcie + PCI_PRIMARY_BUS);
> >> +	writeb(secondary_bus, host->pcie + PCI_SECONDARY_BUS);
> >> +	writeb(subordinate_bus, host->pcie + PCI_SUBORDINATE_BUS);
> >> +
> >> +	/* Disable access control to the CFGU */
> >> +	writel(0, host->axi + RZG3S_PCI_PERM);
> >> +
> >> +	return 0;
> >> +}
> >> +
> > 
> > [...]
> > 
> >> +static int rzg3s_pcie_host_init(struct rzg3s_pcie_host *host, bool probe)
> >> +{
> >> +	u32 val;
> >> +	int ret;
> >> +
> >> +	/* Initialize the PCIe related registers */
> >> +	ret = rzg3s_pcie_config_init(host);
> >> +	if (ret)
> >> +		return ret;
> >> +
> >> +	/* Initialize the interrupts */
> >> +	rzg3s_pcie_irq_init(host);
> >> +
> >> +	ret = reset_control_bulk_deassert(host->data->num_cfg_resets,
> >> +					  host->cfg_resets);
> >> +	if (ret)
> >> +		return ret;
> >> +
> >> +	/* Wait for link up */
> >> +	ret = readl_poll_timeout(host->axi + RZG3S_PCI_PCSTAT1, val,
> >> +				 !(val & RZG3S_PCI_PCSTAT1_DL_DOWN_STS),
> >> +				 PCIE_LINK_WAIT_SLEEP_MS,
> >> +				 PCIE_LINK_WAIT_SLEEP_MS *
> >> +				 PCIE_LINK_WAIT_MAX_RETRIES * MILLI);
> >> +	if (ret) {
> >> +		reset_control_bulk_assert(host->data->num_cfg_resets,
> >> +					  host->cfg_resets);
> >> +		return ret;
> >> +	}
> >> +
> >> +	val = readl(host->axi + RZG3S_PCI_PCSTAT2);
> >> +	dev_info(host->dev, "PCIe link status [0x%x]\n", val);
> >> +
> >> +	val = FIELD_GET(RZG3S_PCI_PCSTAT2_STATE_RX_DETECT, val);
> >> +	dev_info(host->dev, "PCIe x%d: link up\n", hweight32(val));
> >> +
> >> +	if (probe) {
> >> +		ret = devm_add_action_or_reset(host->dev,
> >> +					       rzg3s_pcie_cfg_resets_action,
> >> +					       host);
> > 
> > Oh well, this gets ugly. Now the devm_add_action_or_reset() is sprinkled
> > throughout the driver :/
> > 
> > As I said earlier, there are concerns in unloading the driver if it implements
> > an irqchip. So if you change the module_platform_driver() to
> > builtin_platform_driver() for this driver, these devm_add_action_or_reset()
> > calls become unused.
> 
> They can still be useful in case the probe fails. As the initialization
> path is complicated, having actions or resets looks to me that makes the
> code cleaner as the rest of devm_* helpers.
> 
> I can drop it and replace with gotos and dedicated functions but this will
> complicate the code, AFAICT.
> 
> Please let me know how would you like me to proceed.
> 

It is generally preferred to cleanup the resources in err path using goto
labels.

> > 
> >> +	}
> >> +
> >> +	return ret;
> >> +}
> >> +

[...]

> >> +	ret = pm_runtime_resume_and_get(dev);
> >> +	if (ret)
> >> +		return ret;
> >> +
> > 
> > Do you really need to do resume_and_get()? If not, you should do:
> 
> It it's needed to enable the clock PM domain the device is part of.
> 

I've replied below.

> > 
> > 	pm_runtime_set_active()
> > 	pm_runtime_no_callbacks()
> > 	devm_pm_runtime_enable()
> > 
> >> +	ret = devm_add_action_or_reset(dev, rzg3s_pcie_pm_runtime_put, dev);
> >> +	if (ret)
> >> +		return ret;
> >> +
> >> +	raw_spin_lock_init(&host->hw_lock);
> >> +
> >> +	ret = rzg3s_pcie_host_setup(host, rzg3s_pcie_intx_setup,
> >> +				    rzg3s_pcie_msi_enable, true);
> >> +	if (ret)
> >> +		return ret;
> >> +
> >> +	msleep(PCIE_RESET_CONFIG_WAIT_MS);
> >> +
> >> +	bridge->sysdata = host;
> >> +	bridge->ops = &rzg3s_pcie_root_ops;
> >> +	bridge->child_ops = &rzg3s_pcie_child_ops;
> >> +	ret = pci_host_probe(bridge);
> >> +	if (ret)
> >> +		return ret;
> >> +
> >> +	return devm_add_action_or_reset(dev, rzg3s_pcie_host_remove_action,
> >> +					host);
> >> +}
> >> +
> >> +static int rzg3s_pcie_suspend_noirq(struct device *dev)
> >> +{
> >> +	struct rzg3s_pcie_host *host = dev_get_drvdata(dev);
> >> +	const struct rzg3s_pcie_soc_data *data = host->data;
> >> +	struct regmap *sysc = host->sysc;
> >> +	int ret;
> >> +
> >> +	ret = pm_runtime_put_sync(dev);
> >> +	if (ret)
> >> +		return ret;
> > 
> > Since there are no runtime callbacks present, managing runtime PM in the driver
> > makes no sense.
> 
> The PCIe device is part of a clock power domain. Dropping
> pm_runtime_enable()/pm_runtime_put_sync() in this driver will lead to this
> IP failing to work as its clocks will not be enabled/disabled. If you don't
> like the pm_runtime_* approach that could be replaced with:
> 
> devm_clk_get_enabled() in probe and clk_disable()/clk_enable() on
> suspend/resume. W/o clocks the IP can't work.
> 

Yes, you should explicitly handle clocks in the driver. Runtime PM makes sense
if you have a power domain attached to the IP, which you also do as I see now.
So to conclude, you should enable/disable the clocks explicitly for managing
clocks and use runtime PM APIs for managing the power domain associated with
clock controller.

But please add a comment above pm_runtime_resume_and_get() to make it clear as
most of the controller drivers are calling it for no reason.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

