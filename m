Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0CF5C8303F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 19:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=cJYDe5P2CzeUJGxhbSB2YeYWIWxzbfD0Nnw9v8/ymJ0=; b=OIAWkUXtsQHGY/
	wc58UzCAOGxyh1EM6tIkDq3l39/jFuoOhmiZnr6JK1OMOLs1qfvL/xkwchDKSbhc7UPA8CiwTCu7g
	7guY1GUJmYKRr2OD855Ivwh77C5zoXwsASfabHLgP68SEuWM30okEHEf9A7B9rphK0BGI5SFvTh25
	D40GErVhQ/Vx0zpPV5Frp37qJwjGC2hTAw8v22IV2AH61oqnW0Fj4j9iaJGR2427YE21v7VhSUX79
	MZwm/2mm8N7CBauV/hcl7ImRcWtoaUJvwY52o9oQP9eC7UQLhyuRXo3yO2kF4RXA2/XM+ACG9wKqN
	Rs3xIcJhiJJPHd9qy5sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uriac-000000034cK-2Inn;
	Thu, 28 Aug 2025 19:47:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urgKt-00000002PXu-2gH3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 17:22:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 49BAC45017;
	Thu, 28 Aug 2025 17:22:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7B7EC4CEF5;
	Thu, 28 Aug 2025 17:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756401775;
	bh=D64Dcw+3Q7Bhw7cRL3Mx51sKXxd32kG6A6P2l/nGXPI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=NniPVCL70CJLdBOdxQoW1jaUw3KHNNjTpnByZBXqpMVCAZP6eWtTCp1uK0XEEB00u
	 kuHZ0awF3fnjhHf6IH6lJMdKgqVDcRh42ivtIHDLmJRs8ttBqcFf87Jy2jplZeLM3o
	 zV9PXCeb/dnaMbPIH0VPYOJ5JKvIpMI2uV6RRVexO3ZmIZaS4mStzp7Wgt12uDwPOi
	 Z6/VxNFYcJG2ZtfnAevv1gZT+T0kUpAtm+74fTBX9TXUh7C6HM99sp/lHozeiLbFng
	 gEsXq5bQHE6s2jopMhGWOQsPuHfUhZtsa+Fmx1U8CkEtQcw9dUK3tYt6YoW7TAwc35
	 /2mMgE9BOicQg==
Date: Thu, 28 Aug 2025 12:22:53 -0500
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
Message-ID: <20250828172253.GA949714@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820075411.1178729-7-christian.bruel@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_102255_696188_842D5B1F 
X-CRM114-Status: GOOD (  14.26  )
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
> ...

> +static int stm32_pcie_start_link(struct dw_pcie *pci)
> +{
> +	struct stm32_pcie *stm32_pcie = to_stm32_pcie(pci);
> +	int ret;
> +
> +	if (stm32_pcie->link_status == STM32_PCIE_EP_LINK_ENABLED) {
> +		dev_dbg(pci->dev, "Link is already enabled\n");
> +		return 0;
> +	}

While looking at the "incorrectly reset" comment, I noticed
stm32_pcie->link_status and wondered why it exists.  It looks like
it's only used in stm32_pcie_start_link() and stm32_pcie_stop_link(),
and I don't see similar tracking in other drivers.

It feels a little racy because the link might go down for reasons
other than calling stm32_pcie_stop_link().

> +	dev_dbg(pci->dev, "Enable link\n");
> +
> +	ret = stm32_pcie_enable_link(pci);
> +	if (ret) {
> +		dev_err(pci->dev, "PCIe cannot establish link: %d\n", ret);
> +		return ret;
> +	}
> +
> +	enable_irq(stm32_pcie->perst_irq);
> +
> +	stm32_pcie->link_status = STM32_PCIE_EP_LINK_ENABLED;
> +
> +	return 0;
> +}
> +
> +static void stm32_pcie_stop_link(struct dw_pcie *pci)
> +{
> +	struct stm32_pcie *stm32_pcie = to_stm32_pcie(pci);
> +
> +	if (stm32_pcie->link_status == STM32_PCIE_EP_LINK_DISABLED) {
> +		dev_dbg(pci->dev, "Link is already disabled\n");
> +		return;
> +	}
> +
> +	dev_dbg(pci->dev, "Disable link\n");
> +
> +	disable_irq(stm32_pcie->perst_irq);
> +
> +	stm32_pcie_disable_link(pci);
> +
> +	stm32_pcie->link_status = STM32_PCIE_EP_LINK_DISABLED;
> +}

