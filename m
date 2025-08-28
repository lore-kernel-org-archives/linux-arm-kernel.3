Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D6B9CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 19:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=QkKuQmdsIfBFWSlaZCVIjUrsV0+5DYAn3FLonAIfiAs=; b=VykOymxgPjV9N/
	kkBfZW78iJoF53Gk3pK05w7zK2sUQ7OYBZIteq4xGhbv8pVcUVqYyYfE6yDLtT6uCVr4I76dXC1wc
	Rsv+fyxSSi52R7n3Z0gfPs6fJDFJch1g2O0BunSJ4oLcFRDfcpGkvh0fthtgjlzeeR3uOicKUX/ps
	2nzgr5PDAQFf/3mBqbgcvPZWDsiVAkvx5CSEoxmjUqlyKAjDIJBmeD7B4ojiez9CPX2JeC2EeikJf
	A8nfCjN8ub+mDQsLKapuq4p8ej/xfSFOWBqK0A1hNVByyfQI0XZNz/FbwpWl3xebgT+nXNbvzsVce
	pC49bL0/WXEmvLfcGzeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uriSV-000000033QJ-2qAe;
	Thu, 28 Aug 2025 19:38:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urgEa-00000002OCx-2gej
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 17:16:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EF31F443CD;
	Thu, 28 Aug 2025 17:16:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DE76C4CEF4;
	Thu, 28 Aug 2025 17:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756401383;
	bh=Kmt4M/Z2w+PlibUTUari/qi5WTPoz/7V3tEAWMttjcs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=lXMjNa1OLazCVKdubqEGCO/lXhyt1mqLJQfntrNgnF2MeIfopD2JSL24bzM3r9g9r
	 2FQ23qtLYZLlOH1o3RU26+tDTfmBIwux0hZ2dKZe/xQpgbAQud8uJWbM0fsG+dMUdm
	 vuO8pvW/zTg9XPl2CMq9Z8VxXu5j9D0/OjmzDW/WoUCZae0+h9u1t6E1C5SEkwh5S6
	 NiPEA3+OmmoeyhCYFFjVSDB0YGXiGktNmSWf4gX+mqBVSG5R/MRlGpN6c5OR5n+hbw
	 y4YzH8G2J8JZrbEx1Ub9PxBMWtap5lkFUZqod4nTSCoJBR5XHfFeXcOEwGeXkdFT2B
	 CJQt+pQ4f0P9g==
Date: Thu, 28 Aug 2025 12:16:22 -0500
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
Message-ID: <20250828171622.GA945192@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9133348a-f6a4-4425-98e2-a784a7620b3a@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_101624_718934_EE95A9CA 
X-CRM114-Status: GOOD (  25.07  )
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

On Thu, Aug 28, 2025 at 02:12:57PM +0200, Christian Bruel wrote:
> On 8/27/25 20:58, Bjorn Helgaas wrote:
> > On Wed, Aug 20, 2025 at 09:54:06AM +0200, Christian Bruel wrote:
> > > Add driver to configure the STM32MP25 SoC PCIe Gen1 2.5GT/s or Gen2 5GT/s
> > > controller based on the DesignWare PCIe core in endpoint mode.
> > 
> > > +static void stm32_pcie_perst_deassert(struct dw_pcie *pci)
> > > +{
> > > +	struct stm32_pcie *stm32_pcie = to_stm32_pcie(pci);
> > > +	struct device *dev = pci->dev;
> > > +	struct dw_pcie_ep *ep = &pci->ep;
> > > +	int ret;
> > > +
> > > +	dev_dbg(dev, "PERST de-asserted by host\n");
> > > +
> > > +	ret = pm_runtime_resume_and_get(dev);
> > > +	if (ret < 0) {
> > > +		dev_err(dev, "Failed to resume runtime PM: %d\n", ret);
> > > +		return;
> > > +	}
> > > +
> > > +	ret = stm32_pcie_enable_resources(stm32_pcie);
> > > +	if (ret) {
> > > +		dev_err(dev, "Failed to enable resources: %d\n", ret);
> > > +		goto err_pm_put_sync;
> > > +	}
> > > +
> > > +	/*
> > > +	 * Need to reprogram the configuration space registers here because the
> > > +	 * DBI registers were incorrectly reset by the PHY RCC during phy_init().
> > 
> > Is this incorrect reset of DBI registers a software issue or some kind
> > of hardware erratum that might be fixed someday?  Or maybe it's just a
> > characteristic of the hardware and thus not really "incorrect"?
> > 
> > I do see that qcom_pcie_perst_deassert() in pcie-qcom-ep.c also calls
> > dw_pcie_ep_init_registers() in the qcom_pcie_ep_perst_irq_thread()
> > path.
> > 
> > So does pex_ep_event_pex_rst_deassert() (pcie-tegra194.c) in the
> > tegra_pcie_ep_pex_rst_irq() path.
> > 
> > But as far as I can tell, none of the other dwc drivers need this, so
> > maybe it's something to do with the glue around the DWC core?
> 
> The RCC PHY reset is connected to the Synopsys cold reset logic, which
> explains why the registers need to be restored. This point has been
> addressed in the reference manual.

OK.  I dropped "incorrectly" from the comment because I think future
readers will wonder about whether or how this could be fixed, and it
sounds like it's just a feature of the hardware that we need to deal
with.

> > > +	 */
> > > +	ret = dw_pcie_ep_init_registers(ep);
> > > +	if (ret) {
> > > +		dev_err(dev, "Failed to complete initialization: %d\n", ret);
> > > +		goto err_disable_resources;
> > > +	}
> 

