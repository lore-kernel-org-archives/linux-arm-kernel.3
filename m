Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E5A2E64ABB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 15:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3axE8hWFEOAcBbBVlVC5J9i71o0iCzSmsJDKDt+tz5A=; b=gDtXVp4N9LYXeTZ4TLskmsa64V
	SBWIzLyiAQPUjWYpzpafI4pxraJw2yaJu/5z+lARj9PQUk+E1lTI4W2AhhDzGj+fPx6U8uEtcbZ1x
	oQW70On+cjTjQa0OFJgyECTmWrdL8r+DVOX/4d74LiztMZPKINE0i08ArjeTpOhgQTtox0UznJOkq
	pDYExK3PmoCfIBmEPsnTwrIfnAnkPD1kd0d9QPxtughKqovc12oBserhWE00QsZ+6F6J5d3f0irOl
	L47dpkBIb1lvVFyb6FF14CRBVleXLCis1V8h+OaD4o/n0m85wOIwNuiGJ191Uidrc8Gq5EHttKxGa
	ISLc8qSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIUkX-00000009uos-0xTZ;
	Tue, 03 Dec 2024 15:23:41 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIUjW-00000009ugy-3TJe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 15:22:40 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-72577d3b026so1842057b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Dec 2024 07:22:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733239357; x=1733844157; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3axE8hWFEOAcBbBVlVC5J9i71o0iCzSmsJDKDt+tz5A=;
        b=tR2/xHEIDuYlDTlzsvFkvYp1lsjmq/CWm+k9593LTBz5xVtwWnrjsWON0qUqlZ4NZ2
         hlSqhxkj26uXSphbdl4zMZMEPqZ7XnwdN9pwNcDzw77qGXLYdarsCLSwNREHi2o6hZqu
         NurjCGMW3e8Ya2/APyTbGtXlxKs2G//up6esWEetsYxHlNDMlcMFlArsZx/OZUpG9Xy7
         Is8PoDMcPQQoiwaxCja4mK28mkE1Rl5kzp6/nsBKAYtanUF6OsDTfUEkNMn3KPdMofts
         FdPQ3veHWUI7qKmnzXmxh4s31EzL3YOXAbsiyzKMxMMUkbz8TBzJGEMz4+vDUZhnvLJ0
         GDLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733239357; x=1733844157;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3axE8hWFEOAcBbBVlVC5J9i71o0iCzSmsJDKDt+tz5A=;
        b=Jn1ptthFicWxp+dHBk+uMZYhf+GivBWY0viHCc55fAV4+qZz8v5VGHTAlreSju4clD
         MpHDSMI+23eF0qmABZ9kAkzdMJLhQsBcLMnOag+erBlcogc475c+Gwl//Gm2tdaRaWT5
         Gfkt3gscXsXmwjL6s8nQXE2XsgDoE+XAhEff74zKlb6HMiXyZ1Cv2aH4N6GYTc7fboHJ
         vT3uu22rZB1E16JyfmMNucPwCjRebZXp7OqsmS1CPMGnzxNqYvcUWgSK050SikwyDnBa
         nNK8aQ0q1B3emZ5SNxvdz5vlQFc7nRqeNvPzMGNhcd6fzvPtB44+SHW6N0DARxbohfxf
         6a1Q==
X-Forwarded-Encrypted: i=1; AJvYcCV8ze/R1tlFmkU+NzKxU8UBAmSzrXfKJPxXEyRGSVF6Oo7IigPBabgvg0HdnJ1wlqPrIZE3lcs6ADG83wgZcXXE@lists.infradead.org
X-Gm-Message-State: AOJu0YyOGvQEaSfxMHIdG+4p8oOg2iEVU4EQf4U7f4rGrSVisoFg4iNp
	xBd1K5myBT6YFky7UN4yAgUpRM/H122VNXXBcK8sXa7q87j69kgkt4zvZjSisw==
X-Gm-Gg: ASbGncutcj0IbxX1RfYP0IJr6cdFR6DVekoAErNn3usLiBZQJb0C1CofgzLynMCxFSh
	L+dnHGkxDrHYtkU9hjNvHH2lbClUegn8sgmJ2pdsF/sWw9BtoH1oPJaH+MiQvL2JF13br39r2+X
	0lcXJAsGaBI0G6pny+oZ2SxUvxFukBgXBaSWJSfptpedkHE8vuI/uldjrrO6exeq6r5PQKXn0Rf
	O7sGH06pOy/zkRwxriRCsmLD+rJXJKmXpVmrSY4gtB6GVyrGVahMZha2TpB
X-Google-Smtp-Source: AGHT+IEZzaiAa/sDP0NIqy+9CcPtC9S0iqjWkUM0fW3/+Qg2jpqxzNaED37DXLoNtAbdVeskjdanNg==
X-Received: by 2002:a05:6a00:1826:b0:71e:74bf:6b1a with SMTP id d2e1a72fcca58-7257fcae158mr3814643b3a.16.1733239357479;
        Tue, 03 Dec 2024 07:22:37 -0800 (PST)
Received: from thinkpad ([120.60.48.217])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7254176f8f9sm10906738b3a.66.2024.12.03.07.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 07:22:37 -0800 (PST)
Date: Tue, 3 Dec 2024 20:52:30 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Christian Bruel <christian.bruel@foss.st.com>
Cc: lpieralisi@kernel.org, kw@linux.com, robh@kernel.org,
	bhelgaas@google.com, krzk+dt@kernel.org, conor+dt@kernel.org,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	p.zabel@pengutronix.de, cassel@kernel.org,
	quic_schintav@quicinc.com, fabrice.gasnier@foss.st.com,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/5] PCI: stm32: Add PCIe endpoint support for
 STM32MP25
Message-ID: <20241203152230.5mdrt27u5u5ecwcz@thinkpad>
References: <20241126155119.1574564-1-christian.bruel@foss.st.com>
 <20241126155119.1574564-5-christian.bruel@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241126155119.1574564-5-christian.bruel@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_072238_872767_22A18911 
X-CRM114-Status: GOOD (  19.00  )
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

On Tue, Nov 26, 2024 at 04:51:18PM +0100, Christian Bruel wrote:

[...]

> +static int stm32_pcie_start_link(struct dw_pcie *pci)
> +{
> +	struct stm32_pcie *stm32_pcie = to_stm32_pcie(pci);
> +	int ret;
> +
> +	if (stm32_pcie->link_status == STM32_PCIE_EP_LINK_ENABLED) {
> +		dev_dbg(pci->dev, "Link is already enabled\n");
> +		return 0;
> +	}
> +
> +	ret = stm32_pcie_enable_link(pci);
> +	if (ret) {
> +		dev_err(pci->dev, "PCIe cannot establish link: %d\n", ret);
> +		return ret;
> +	}

How the REFCLK is supplied to the endpoint? From host or generated locally?

> +
> +	stm32_pcie->link_status = STM32_PCIE_EP_LINK_ENABLED;
> +
> +	enable_irq(stm32_pcie->perst_irq);
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
> +	disable_irq(stm32_pcie->perst_irq);
> +
> +	stm32_pcie_disable_link(pci);
> +
> +	stm32_pcie->link_status = STM32_PCIE_EP_LINK_DISABLED;
> +}
> +
> +static int stm32_pcie_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
> +				unsigned int type, u16 interrupt_num)
> +{
> +	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> +
> +	switch (type) {
> +	case PCI_IRQ_INTX:
> +		return dw_pcie_ep_raise_intx_irq(ep, func_no);
> +	case PCI_IRQ_MSI:
> +		return dw_pcie_ep_raise_msi_irq(ep, func_no, interrupt_num);
> +	default:
> +		dev_err(pci->dev, "UNKNOWN IRQ type\n");
> +		return -EINVAL;
> +	}
> +}
> +
> +static const struct pci_epc_features stm32_pcie_epc_features = {
> +	.msi_capable = true,
> +	.align = 1 << 16,

Use SZ_64K

> +};
> +

[...]

> +static int stm32_add_pcie_ep(struct stm32_pcie *stm32_pcie,
> +			     struct platform_device *pdev)
> +{
> +	struct dw_pcie *pci = stm32_pcie->pci;
> +	struct dw_pcie_ep *ep = &pci->ep;
> +	struct device *dev = &pdev->dev;
> +	int ret;
> +
> +	ret = regmap_update_bits(stm32_pcie->regmap, SYSCFG_PCIECR,
> +				 STM32MP25_PCIECR_TYPE_MASK,
> +				 STM32MP25_PCIECR_EP);
> +	if (ret)
> +		return ret;
> +
> +	ret = pm_runtime_resume_and_get(dev);
> +	if (ret < 0) {
> +		dev_err(dev, "pm runtime resume failed: %d\n", ret);
> +		return ret;
> +	}

You might want to do runtime resume before accessing regmap.

> +
> +	reset_control_assert(stm32_pcie->rst);
> +	reset_control_deassert(stm32_pcie->rst);
> +
> +	ep->ops = &stm32_pcie_ep_ops;
> +
> +	ret = dw_pcie_ep_init(ep);
> +	if (ret) {
> +		dev_err(dev, "failed to initialize ep: %d\n", ret);
> +		goto err_init;
> +	}
> +
> +	ret = stm32_pcie_enable_resources(stm32_pcie);
> +	if (ret) {
> +		dev_err(dev, "failed to enable resources: %d\n", ret);
> +		goto err_clk;
> +	}
> +
> +	ret = dw_pcie_ep_init_registers(ep);
> +	if (ret) {
> +		dev_err(dev, "Failed to initialize DWC endpoint registers\n");
> +		goto err_init_regs;
> +	}
> +
> +	pci_epc_init_notify(ep->epc);
> +
> +	return 0;
> +
> +err_init_regs:
> +	stm32_pcie_disable_resources(stm32_pcie);
> +
> +err_clk:
> +	dw_pcie_ep_deinit(ep);
> +
> +err_init:
> +	pm_runtime_put_sync(dev);
> +	return ret;
> +}
> +
> +static int stm32_pcie_probe(struct platform_device *pdev)
> +{
> +	struct stm32_pcie *stm32_pcie;
> +	struct dw_pcie *dw;
> +	struct device *dev = &pdev->dev;
> +	int ret;
> +
> +	stm32_pcie = devm_kzalloc(dev, sizeof(*stm32_pcie), GFP_KERNEL);
> +	if (!stm32_pcie)
> +		return -ENOMEM;
> +
> +	dw = devm_kzalloc(dev, sizeof(*dw), GFP_KERNEL);
> +	if (!dw)
> +		return -ENOMEM;

Why can't you allocate it statically inside 'struct stm32_pcie'?

> +
> +	stm32_pcie->pci = dw;
> +
> +	dw->dev = dev;
> +	dw->ops = &dw_pcie_ops;
> +
> +	stm32_pcie->regmap = syscon_regmap_lookup_by_compatible("st,stm32mp25-syscfg");
> +	if (IS_ERR(stm32_pcie->regmap))
> +		return dev_err_probe(dev, PTR_ERR(stm32_pcie->regmap),
> +				     "No syscfg specified\n");
> +
> +	stm32_pcie->phy = devm_phy_get(dev, "pcie-phy");
> +	if (IS_ERR(stm32_pcie->phy))
> +		return dev_err_probe(dev, PTR_ERR(stm32_pcie->phy),
> +				     "failed to get pcie-phy\n");
> +
> +	stm32_pcie->clk = devm_clk_get(dev, NULL);
> +	if (IS_ERR(stm32_pcie->clk))
> +		return dev_err_probe(dev, PTR_ERR(stm32_pcie->clk),
> +				     "Failed to get PCIe clock source\n");
> +
> +	stm32_pcie->rst = devm_reset_control_get_exclusive(dev, NULL);
> +	if (IS_ERR(stm32_pcie->rst))
> +		return dev_err_probe(dev, PTR_ERR(stm32_pcie->rst),
> +				     "Failed to get PCIe reset\n");
> +
> +	stm32_pcie->perst_gpio = devm_gpiod_get(dev, "reset", GPIOD_IN);
> +	if (IS_ERR(stm32_pcie->perst_gpio))
> +		return dev_err_probe(dev, PTR_ERR(stm32_pcie->perst_gpio),
> +				     "Failed to get reset GPIO\n");
> +
> +	ret = phy_set_mode(stm32_pcie->phy, PHY_MODE_PCIE);

Hmm, so PHY mode is common for both endpoint and host?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

