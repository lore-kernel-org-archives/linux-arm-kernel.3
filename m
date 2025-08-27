Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 561D8CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 20:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=yntmuVGaAUD7FMoB4VchU3lG+O0y26hUt9lpXEF7Q7k=; b=f9bFpy+x/ulRny
	TM+h+MdKDEBD8WFOu6nG5Ob5eNJmOzvu12SaA3X0XQhth28XNohybwFFO+KtjiAaPHFMcHzuvKLdD
	zlSlJysjt1wF7ktF5UFY1K1QOZvHmtXKep4gwSxO/05BX4rF0uLTlMw5gdVXOsbeXOPdG59fiUbYO
	tvo88gnU8vI1Nosap5SQk/pioxDOzimJ5IE6uFtKnESb3T/09xd2UF7SL3c/A8SVuKZYJH0KoGY4g
	lGCQSOOD8EQgsVha5/N83zL/PBlubPj1y1Cjm8KzMA9qgcZoPTD2lGH8zTxkIow76+gwKVSbsErAy
	PMx7+2qggNLMaSbxHp0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urMlY-0000000Gm0X-2CsC;
	Wed, 27 Aug 2025 20:29:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urLLo-0000000GX0V-0ZZw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 18:58:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 33F3B60266;
	Wed, 27 Aug 2025 18:58:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8403C4CEEB;
	Wed, 27 Aug 2025 18:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756321106;
	bh=k/tPNcfJ/qdnWRcsE6nXClRCEZmBAkB4S98CVmbWffE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=p/A4hCuXnw78K2/C7/7U2ep3c3mB0WH5FKsFfvMkA9XgZ3H7LOX8UCUSWJNoafOwu
	 VJwzEpoV0FLpzBZU2Gw77yR4FhTSim9ud/WuydhPXNXtF/rGRXGfd+YK3F5on9j3m1
	 BS5UCJTAZLWfEiDJLhUiXABrbbSP1hTFOC4xOKq0sIZR+fCLsoqZpQlzLmgFotwXwP
	 JttlA+091dVHUkpQgd8HOqDX2sV3jjLpIwqXnPEyTY1NeHt8YuYy8Rg6HWDtPSKuuJ
	 jW3ADEJW9Z1TzPtmOWkaj5LY0S4P5ZnFSbOb2JCD/SeOL3yUWwPQSTKjtiQSTch1dj
	 WebNWWgPMD0CA==
Date: Wed, 27 Aug 2025 13:58:25 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Christian Bruel <christian.bruel@foss.st.com>
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
	robh@kernel.org, bhelgaas@google.com, krzk+dt@kernel.org,
	conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, linus.walleij@linaro.org,
	corbet@lwn.net, p.zabel@pengutronix.de, shradha.t@samsung.com,
	mayank.rana@oss.qualcomm.com, namcao@linutronix.de,
	qiang.yu@oss.qualcomm.com, thippeswamy.havalige@amd.com,
	inochiama@gmail.com, quic_schintav@quicinc.com,
	johan+linaro@kernel.org, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v13 06/11] PCI: stm32: Add PCIe Endpoint support for
 STM32MP25
Message-ID: <20250827185825.GA894342@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820075411.1178729-7-christian.bruel@foss.st.com>
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

On Wed, Aug 20, 2025 at 09:54:06AM +0200, Christian Bruel wrote:
> Add driver to configure the STM32MP25 SoC PCIe Gen1 2.5GT/s or Gen2 5GT/s
> controller based on the DesignWare PCIe core in endpoint mode.

> +static void stm32_pcie_perst_deassert(struct dw_pcie *pci)
> +{
> +	struct stm32_pcie *stm32_pcie = to_stm32_pcie(pci);
> +	struct device *dev = pci->dev;
> +	struct dw_pcie_ep *ep = &pci->ep;
> +	int ret;
> +
> +	dev_dbg(dev, "PERST de-asserted by host\n");
> +
> +	ret = pm_runtime_resume_and_get(dev);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to resume runtime PM: %d\n", ret);
> +		return;
> +	}
> +
> +	ret = stm32_pcie_enable_resources(stm32_pcie);
> +	if (ret) {
> +		dev_err(dev, "Failed to enable resources: %d\n", ret);
> +		goto err_pm_put_sync;
> +	}
> +
> +	/*
> +	 * Need to reprogram the configuration space registers here because the
> +	 * DBI registers were incorrectly reset by the PHY RCC during phy_init().

Is this incorrect reset of DBI registers a software issue or some kind
of hardware erratum that might be fixed someday?  Or maybe it's just a
characteristic of the hardware and thus not really "incorrect"?

I do see that qcom_pcie_perst_deassert() in pcie-qcom-ep.c also calls
dw_pcie_ep_init_registers() in the qcom_pcie_ep_perst_irq_thread()
path.

So does pex_ep_event_pex_rst_deassert() (pcie-tegra194.c) in the
tegra_pcie_ep_pex_rst_irq() path.

But as far as I can tell, none of the other dwc drivers need this, so
maybe it's something to do with the glue around the DWC core?

> +	 */
> +	ret = dw_pcie_ep_init_registers(ep);
> +	if (ret) {
> +		dev_err(dev, "Failed to complete initialization: %d\n", ret);
> +		goto err_disable_resources;
> +	}

