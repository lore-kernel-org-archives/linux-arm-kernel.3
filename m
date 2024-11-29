Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E906AD72A18
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Nov 2024 20:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=oOl+grshixk4RnR6bSGIJ6tAX1LjTsd8KQ8J/FG9Ut8=; b=zRZz13pqRWsNCB
	lhPjkZsPOnew9eWGNG9wQsSk5DqzMya8+PZL9MmmRm/Xi50ZlCPmtP75F0QoCHhb36C0UEMoMLLnb
	CIrfdVCYLlCymmC8L8mT5Tj8JyltEmG/6ZJPs+1jnzF3JdaKCRn0+il0tOQBHFsv5hQ3Fn5bl2rfu
	/21I7NHDk6fVZmbmx8Y/BAaOIi0tBhWfHmfMlKl89fQ/MA25JKXBNacOOjepSU4u2K5S81lj/Mt13
	TfRImr5BbO+McJSghW+DjEqheNj7+djBChYzoE5frVjMBR3ZISJObYfSDTeepyVqFV592mfWZrDRV
	cW0m2L03GUf/NSoXlFbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tH85I-00000000x2N-1NWa;
	Fri, 29 Nov 2024 20:59:28 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tH84I-00000000wwl-1VXl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Nov 2024 20:58:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9F35AA412FE;
	Fri, 29 Nov 2024 20:56:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B75BDC4CECF;
	Fri, 29 Nov 2024 20:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732913905;
	bh=zZKblG1oW6ilUbzaYkY0HepGVylQVjpGP80Xxjdr6Pk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=KQiVBSEXjNg3lOwoGvXRCuJjrm7xatbZwYoYfv8aYFd2HC0x5IJwKuqgoADK5cx9K
	 +KX+jmQbgvhKJQM5fpzL2YlJNdEYoFU52WttObfeKoS51O5ro2RHnsjH0sbHk9v4jY
	 mZ01idn5tzWZJrtgbtOuJnR9QciqUf3vbKpMkiMsrzTUEVedYbbKlXa+qwBpRIpc7o
	 j+JCVS5cVlgBCevSGvuoEVGWDx9TIVWsyegp2YjjAfCfT4NCKKbPs/KphT0mSysSZW
	 8jgaVREpqN7BRnHS8uFMKh7fbOU8g8VMxSepgeHdPF4OoFOGbZAZqPDYvxd+5nR92a
	 F2eJxFgKs3hvQ==
Date: Fri, 29 Nov 2024 14:58:22 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Christian Bruel <christian.bruel@foss.st.com>,
	Rob Herring <robh+dt@kernel.org>
Cc: lpieralisi@kernel.org, kw@linux.com, manivannan.sadhasivam@linaro.org,
	robh@kernel.org, bhelgaas@google.com, krzk+dt@kernel.org,
	conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, p.zabel@pengutronix.de,
	cassel@kernel.org, quic_schintav@quicinc.com,
	fabrice.gasnier@foss.st.com, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] PCI: stm32: Add PCIe host support for STM32MP25
Message-ID: <20241129205822.GA2772018@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241126155119.1574564-3-christian.bruel@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241129_125826_460662_04F168DA 
X-CRM114-Status: GOOD (  18.01  )
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

[+to Rob, DMA mask question]

On Tue, Nov 26, 2024 at 04:51:16PM +0100, Christian Bruel wrote:
> Add driver for the STM32MP25 SoC PCIe Gen2 controller based on the
> DesignWare PCIe core.

Can you include the numeric rate, not just "gen2", so we don't have to
search for it?

> +static int stm32_pcie_resume_noirq(struct device *dev)
> +{
> +	struct stm32_pcie *stm32_pcie = dev_get_drvdata(dev);
> +	struct dw_pcie *pci = stm32_pcie->pci;
> +	struct dw_pcie_rp *pp = &pci->pp;
> +	int ret;
> +
> +	/* init_state must be called first to force clk_req# gpio when no
> +	 * device is plugged.
> +	 */

Use drivers/pci/ conventional comment style:

  /*
   * text ...
   */

> +static bool is_stm32_pcie_driver(struct device *dev)
> +{
> +	/* PCI bridge */
> +	dev = get_device(dev);
> +
> +	/* Platform driver */
> +	dev = get_device(dev->parent);
> +
> +	return (dev->driver == &stm32_pcie_driver.driver);
> +}
> +
> +/*
> + * DMA masters can only access the first 4GB of memory space,
> + * so we setup the bus DMA limit accordingly.
> + */
> +static int stm32_dma_limit(struct pci_dev *pdev, void *data)
> +{
> +	dev_dbg(&pdev->dev, "disabling DMA DAC for device");
> +
> +	pdev->dev.bus_dma_limit = DMA_BIT_MASK(32);

I don't think this is the right way to do this.  Surely there's a way
to describe the DMA capability of the bridge once instead of iterating
over all the downstream devices?  This quirk can't work for hot-added
devices anyway.

> +	return 0;
> +}
> +
> +static void quirk_stm32_dma_mask(struct pci_dev *pci)
> +{
> +	struct pci_dev *root_port;
> +
> +	root_port = pcie_find_root_port(pci);
> +
> +	if (root_port && is_stm32_pcie_driver(root_port->dev.parent))
> +		pci_walk_bus(pci->bus, stm32_dma_limit, NULL);
> +}
> +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_SYNOPSYS, 0x0550, quirk_stm32_dma_mask);

