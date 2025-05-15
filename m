Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 115F8C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 11:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E6YcWQUS/krFSoVF5ePsfXGO+e5W0vWFl3MyrWAJnzQ=; b=IurKo8gK0EkbP4GWmG38QJ2Wst
	b8DV2m7GxKjizIDcokNMXAp5I/YFgOTlavVAeCzzk+axOJ7sAje4R/55Pp+dsrloWVCKSiHdts1rz
	pf7reeBY412Kw1/6E1oCGCOqjzWgFAqZT9LvfyLU+vIHLTzYpZREsLFJ0ZjzQNmNk32Acl3St/uw5
	etH+dBuPUu99ehGyxCefpGoK8LlP0IxAwxDLLLKr6984gH0kukS8xQI+vfM62kUfLYj8GTFgL2VWU
	mCpWa1kX74vvqsBkWKNkJE6mFuNESCdwS5b4LdyBINKbubJGJliEaZsnS7tmbKKFHPQ97LEQybaDs
	ei9vXe9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFWlU-00000000OuF-2Rzd;
	Thu, 15 May 2025 11:28:40 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFWjR-00000000OZS-3K51
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 11:26:34 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-442d146a1aaso7530405e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 May 2025 04:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747308392; x=1747913192; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E6YcWQUS/krFSoVF5ePsfXGO+e5W0vWFl3MyrWAJnzQ=;
        b=MilJvy6xqGeoyI66nVEKyr3RYnUvols6PBcAqGhpIlo4/pEDhaMgC0W7xVi4xl44bM
         as2MlVwHLaf4FmeCJZeMHucmIrsoftmM14NOVFKe8s4vEQp2Kqn5tywY5tka2U7mQmtC
         IVUP1AasGHI3Qo6kY2+kRLC9/5kBRk+iCPpYYeTPU028wbXc5FRSVL6c9YlX6iJ8Nw/x
         u5rz02o87TTVeSURsc2M0IW7Vna6KG7hhZFi6zVkklujAzDpMmm8yuDjDTIbu82CycXt
         TazvLD1A04sBBvtoO9nTja5YXQMpPRczYQ8NFGFOc96hJFPekCaqfDd/jC4I+wFNVy/k
         meuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747308392; x=1747913192;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E6YcWQUS/krFSoVF5ePsfXGO+e5W0vWFl3MyrWAJnzQ=;
        b=IwwekhvKedj9ovTzepoTZhjWAjRD1AMaGS441wssawv8X9mJPSdmh7UD09xcByZ1ta
         XAe40mRqSr4ZkySAXBbQaPn8AstkMxBG2bS9DtkeKpq4sF0TE2wwWeTckEnKkqk9svxH
         e7K4jpTObnrl4mOt2omMQYZCpR27X+UPMj1l9FGnsX9k7LeZ91/jIhDjQwmgaO/8yty8
         2suklSz3wLZsY7FATFfyjLU0I/tj9TCnlA2xT6yB7uSeWfd/cH+9kVO/yfzrqZfXLvQZ
         Z0lKa/LkyRD4/vgnFS3TXVPbGLe6m23zfAxrtQ+6bq8zhLxmMom7ej6zTw4TtdiqtQET
         WuQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmXuvSMe2cW1OXs6oQJN1sSLetWbUdqXPMSD9JnibV18CHj28Yoy/tH3JoeVSW8ohu/RiQ62asdw1Wtl1jxL6q@lists.infradead.org
X-Gm-Message-State: AOJu0YwQUOAVjov+ZU8WecHNAz7Z+rpL/DzyjBIJZMelDhcFxgrngbF4
	szv0gUP4NRnKqgpGLD3GfqEAoGYNDL/vy1cjNfBUemx+1kF4UX3W/sIe8qmWSA==
X-Gm-Gg: ASbGnctaRiJEPCp2DtawlDfiQQnMbVewJ8E6YNnHhecSZgw/ZFtQSynmn7kn21huS3e
	05UvKXf8JrVDCxcH41er3V0Jv7p6eaWx/RlSDN2TdH7pBwDmEftNlnYhHwaEisR/FAxnA2L7bYj
	srrE+2YDn9lRpb3IuXDeII6nKCH/Nc6jStArND4tHbRe5XYa5JRbY/ywN5Iukb5MkDthBQKLEzR
	Gls0Ugcs5oi0AlHHXShdJj3DkqcTEljgNljqcFPDvnMSu2CQgTKdy2eqnqA7fo4oi8sX80mO70z
	hrykSS685w7WewUy+c0Wsgtxj9K9ORCfaFiJ++fjKjjRnvccvbrhLPjKlBVT38j1o3u+w5Hmgxo
	q96o56LPRxpa0sQ==
X-Google-Smtp-Source: AGHT+IEkCceAOB29/pB9CUmVZ8C8Si1ZbNqMfWkWxFcEkinM5zQ7dz5OaP8iyatRAtCIbSSJ7O2kkw==
X-Received: by 2002:a05:600c:3e12:b0:442:dcdc:41c8 with SMTP id 5b1f17b1804b1-442f96ecf1amr18446915e9.19.1747308392065;
        Thu, 15 May 2025 04:26:32 -0700 (PDT)
Received: from thinkpad (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f3979355sm67419385e9.37.2025.05.15.04.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 04:26:31 -0700 (PDT)
Date: Thu, 15 May 2025 12:26:27 +0100
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Christian Bruel <christian.bruel@foss.st.com>
Cc: lpieralisi@kernel.org, kw@linux.com, robh@kernel.org, 
	bhelgaas@google.com, krzk+dt@kernel.org, conor+dt@kernel.org, 
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, p.zabel@pengutronix.de, 
	thippeswamy.havalige@amd.com, shradha.t@samsung.com, quic_schintav@quicinc.com, 
	cassel@kernel.org, johan+linaro@kernel.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 4/9] PCI: stm32: Add PCIe Endpoint support for
 STM32MP25
Message-ID: <b5x4fayqm242xqm3rgwvrz3jywlixedhhxwo7lft2y3tnuszxr@3oy2kzj2of5l>
References: <20250423090119.4003700-1-christian.bruel@foss.st.com>
 <20250423090119.4003700-5-christian.bruel@foss.st.com>
 <tdgyva6qyn6qwzvft4f7r3tgp5qswuv4q5swoaeomnnbxtmz5j@zo3gvevx2skp>
 <619756c5-1a61-4aa9-b7fb-6be65175ded2@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <619756c5-1a61-4aa9-b7fb-6be65175ded2@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_042633_843778_EDF6B14A 
X-CRM114-Status: GOOD (  38.98  )
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

On Mon, May 12, 2025 at 06:06:16PM +0200, Christian Bruel wrote:
> Hello Manivannan,
> 
> On 4/30/25 09:50, Manivannan Sadhasivam wrote:
> > On Wed, Apr 23, 2025 at 11:01:14AM +0200, Christian Bruel wrote:
> > > Add driver to configure the STM32MP25 SoC PCIe Gen1 2.5GT/s or Gen2 5GT/s
> > > controller based on the DesignWare PCIe core in endpoint mode.
> > > 
> > > Uses the common reference clock provided by the host.
> > > 
> > > The PCIe core_clk receives the pipe0_clk from the ComboPHY as input,
> > > and the ComboPHY PLL must be locked for pipe0_clk to be ready.
> > > Consequently, PCIe core registers cannot be accessed until the ComboPHY is
> > > fully initialised and refclk is enabled and ready.
> > > 
> > > Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
> > > ---
> > >   drivers/pci/controller/dwc/Kconfig         |  12 +
> > >   drivers/pci/controller/dwc/Makefile        |   1 +
> > >   drivers/pci/controller/dwc/pcie-stm32-ep.c | 414 +++++++++++++++++++++
> > >   drivers/pci/controller/dwc/pcie-stm32.h    |   1 +
> > >   4 files changed, 428 insertions(+)
> > >   create mode 100644 drivers/pci/controller/dwc/pcie-stm32-ep.c
> > > 
> > > diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
> > > index 2aec5d2f9a46..aceff7d1ef33 100644
> > > --- a/drivers/pci/controller/dwc/Kconfig
> > > +++ b/drivers/pci/controller/dwc/Kconfig
> > > @@ -422,6 +422,18 @@ config PCIE_STM32_HOST
> > >   	  This driver can also be built as a module. If so, the module
> > >   	  will be called pcie-stm32.
> > > +config PCIE_STM32_EP
> > > +	tristate "STMicroelectronics STM32MP25 PCIe Controller (endpoint mode)"
> > > +	depends on ARCH_STM32 || COMPILE_TEST
> > > +	depends on PCI_ENDPOINT
> > > +	select PCIE_DW_EP
> > > +	help
> > > +	  Enables endpoint support for DesignWare core based PCIe controller
> > > +	  found in STM32MP25 SoC.
> > 
> > Can you please use similar description for the RC driver also?
> > 
> > "Enables Root Complex (RC) support for the DesignWare core based PCIe host
> > controller found in STM32MP25 SoC."
> 
> Yes, will align the messages
> 
> > > +
> > > +	  This driver can also be built as a module. If so, the module
> > > +	  will be called pcie-stm32-ep.
> > > +
> > >   config PCI_DRA7XX
> > >   	tristate
> > 
> > [...]
> > 
> > > +static int stm32_add_pcie_ep(struct stm32_pcie *stm32_pcie,
> > > +			     struct platform_device *pdev)
> > > +{
> > > +	struct dw_pcie_ep *ep = &stm32_pcie->pci.ep;
> > > +	struct device *dev = &pdev->dev;
> > > +	int ret;
> > > +
> > > +	ret = pm_runtime_resume_and_get(dev);
> > 
> > This needs to be called before devm_pm_runtime_enable().
> 
> OK. Also and we must use pm_runtime_get_noresume() here.
> 

Yes!

> > 
> > > +	if (ret < 0) {
> > > +		dev_err(dev, "pm runtime resume failed: %d\n", ret);
> > > +		return ret;
> > > +	}
> > > +
> > > +	ret = regmap_update_bits(stm32_pcie->regmap, SYSCFG_PCIECR,
> > > +				 STM32MP25_PCIECR_TYPE_MASK,
> > > +				 STM32MP25_PCIECR_EP);
> > > +	if (ret) {
> > > +		goto err_pm_put_sync;
> > > +		return ret;
> > > +	}
> > > +
> > > +	reset_control_assert(stm32_pcie->rst);
> > > +	reset_control_deassert(stm32_pcie->rst);
> > > +
> > > +	ep->ops = &stm32_pcie_ep_ops;
> > > +
> > > +	ret = dw_pcie_ep_init(ep);
> > > +	if (ret) {
> > > +		dev_err(dev, "failed to initialize ep: %d\n", ret);
> > > +		goto err_pm_put_sync;
> > > +	}
> > > +
> > > +	ret = stm32_pcie_enable_resources(stm32_pcie);
> > > +	if (ret) {
> > > +		dev_err(dev, "failed to enable resources: %d\n", ret);
> > > +		goto err_ep_deinit;
> > > +	}
> > > +
> > > +	ret = dw_pcie_ep_init_registers(ep);
> > > +	if (ret) {
> > > +		dev_err(dev, "Failed to initialize DWC endpoint registers\n");
> > > +		goto err_disable_resources;
> > > +	}
> > > +
> > > +	pci_epc_init_notify(ep->epc);
> > > +
> > 
> > Hmm, looks like you need to duplicate dw_pcie_ep_init_registers() and
> > pci_epc_init_notify() in stm32_pcie_perst_deassert() for hw specific reasons.
> > So can you drop these from there?
> 
> We cannot remove dw_pcie_ep_init_registers() and dw_pcie_ep_init_registers()
> here because the PCIe registers need to be ready at the end of
> pcie_stm32_probe, as the host might already be running. In that case the
> host enumerates with /sys/bus/pci/rescan rather than asserting/deasserting
> PERST#.
> Therefore, we do not need to reboot the host after initializing the EP."
> 

Since PERST# is level triggered, the endpoint should still receive the PERST#
deassert interrupt if the host was already booted. In that case, these will be
called by the stm32_pcie_perst_deassert() function.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

