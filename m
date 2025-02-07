Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D51DC0219B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 18:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DkwAJF68ddKYCYzSotu3EQrgC/afwa7x23RU3wj1Lu4=; b=pHS2UyL+z3RSgpZKBg1nwm9bf+
	n/VPWKTl85yKeECfraO9T/F5cTxK0kQ5HR9QDBnGlD+ulMp4epxyxaKqBqzF8bEb9xu7RluJ2b45/
	1bPdOaez3jAjnR59nV6FVPuHw2JJb/JRKUqknk9qHrIUbLvvB9AZxYHKQF9eqtmyChn7OYbSRjOR1
	c1Jq8KeaBHVbnIEZ0HVHXQJTIWAGUdGRTf9MLRkIpcHixZGOWIgWOJizlGWyneVkB9HEIQtAzQmmR
	sAO1l60dkHaL+1WqGM7BaBcXFC2TLn4M8ma3l1cIQ4uDz2lb7MFCa5xuSodZ1Cr/1CoqAXLGWrFs1
	Yas8cWPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgT4L-0000000AhN3-3Ne6;
	Fri, 07 Feb 2025 18:27:13 +0000
Received: from mail-pl1-f181.google.com ([209.85.214.181])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgT1U-0000000AgYM-0F6u
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 18:24:17 +0000
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21f3c119fe6so50222725ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Feb 2025 10:24:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738952655; x=1739557455; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DkwAJF68ddKYCYzSotu3EQrgC/afwa7x23RU3wj1Lu4=;
        b=qC9yTajlpWOxtSaFR0v5/YWzqImx2xKU+F0iDM8iKzzEtjsJQyj9RIOQLtLS0zOZCv
         bAhRxa43K0OHkpdhT8whWDd/eQDHzWAfYVA15xSIqAfXexc0NXTQnm6QhAJgciGbHfna
         YFr7ofEmZLKTf5UbdpQm3ucrIBdM9dspfEyERPG4lOgjNO9s/qdXvXvD8jFo+nrJe4mk
         /tElkRDh9TO7+QQ/97jJPgPINN1GAiVDCfIB2awykB/coAjlh8aNfrMoaUUsA9G6To2j
         Rfl3c7q8PIs8WXrFW94jrSxXjfLnKa80boD1Is7WIVneX6+IsWW1SOnI8YZjm3Y5Yy1b
         fCYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738952655; x=1739557455;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DkwAJF68ddKYCYzSotu3EQrgC/afwa7x23RU3wj1Lu4=;
        b=G5aYh8qIZ+XY+ON74Z0c4ZuPoy7r9Uq/6r++0FAmnDcS5d9n0OVGZe6Ta0gLAlDsXx
         CGoH8Nb3hdR9miIoF7m+PyLVZmYp8IOHFq7YpmlZ7nLNIioDsnS2zD0naejWaBb8spMH
         dY25EZNaF+6gcXoPU5mrrJ5jTA+wgxN9GryE024ewOfJc4niowdjR9Czswx2RhiBil4z
         umkmeaAJtUbCbsYxniJXb7Tsm32KNEc1XfLp8r0x7u2+vqgbZ1kUsGbRGr9fFrzvtIJs
         2xnLopn0GqMO6FEuNruQSYM29PHgRQ41QvfEgnmalVG4PkWSCq6C59w1u52KqNK7EDUF
         5HiA==
X-Forwarded-Encrypted: i=1; AJvYcCW21qGZsIbvKkfptSgrmOLv71+wD6jH9Ob0fILDl2llMzYzCR0b8sPM50N9Vzimm/JdSE6XAhH89ekbVsLZkoSK@lists.infradead.org
X-Gm-Message-State: AOJu0YyF2d1sDi+qj5PphPy01s1UKFr3dn64OWiJQ6iCLtwQPR/wUFdi
	UV03pBOSuJdWE6djRRTD6DflMqzAPQB18yUiAjv71ctF2DINWa0jVGc3fHM3QQ==
X-Gm-Gg: ASbGncskk0VBq2IdtDKguJvehTAXHMLFWOh/6U37hoSCsx0Iig4ILUxdo390gBEBmL6
	oJUl+UM5xitlhzOIGz6DACiSvfM538bdR7h+Unmq7IPa0+rnRHxIX7tfM9SW2TrkCb9x53r7H2Q
	xeGwH2nk6VC3g6P4GJUXJOgv+8/HbyHbrgL3T74hIWh7rLqG5ihI96sS019OVW4IodgNRjKVxRy
	8gtE4GzmkHJroeVnXNi3WqdKJgTgyuJoZGmvRsnOPhO8nmeEJNhUl+vxkFud2bDeHKHwH69JPBn
	SFtri7V4mY5QgUYysBzjMv8afw==
X-Google-Smtp-Source: AGHT+IGA7rR64+8iuyium8I0L5YN9X5M5xr/Pbcn8VKunOXV0dz9WjvNVRMuT/szkavIDCp3qlMBoA==
X-Received: by 2002:a17:903:987:b0:215:a964:e680 with SMTP id d9443c01a7336-21f4e6ce779mr71018085ad.25.1738952655067;
        Fri, 07 Feb 2025 10:24:15 -0800 (PST)
Received: from thinkpad ([120.60.76.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3650e6c0sm33523025ad.22.2025.02.07.10.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 10:24:14 -0800 (PST)
Date: Fri, 7 Feb 2025 23:54:08 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Christian Bruel <christian.bruel@foss.st.com>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kw@linux.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	jingoohan1@gmail.com, p.zabel@pengutronix.de,
	johan+linaro@kernel.org, quic_schintav@quicinc.com,
	cassel@kernel.org, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	fabrice.gasnier@foss.st.com
Subject: Re: [PATCH v4 03/10] PCI: stm32: Add PCIe host support for STM32MP25
Message-ID: <20250207182408.ila3lng3el4s7kf6@thinkpad>
References: <20250128120745.334377-1-christian.bruel@foss.st.com>
 <20250128120745.334377-4-christian.bruel@foss.st.com>
 <20250202130657.zcnvnnwclxup6y7i@thinkpad>
 <f4be9537-5631-4d11-9237-0cc421891669@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f4be9537-5631-4d11-9237-0cc421891669@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_102416_115131_CE612CC4 
X-CRM114-Status: GOOD (  43.31  )
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

On Tue, Feb 04, 2025 at 05:23:05PM +0100, Christian Bruel wrote:

[...]

> > > +static int stm32_pcie_suspend_noirq(struct device *dev)
> > > +{
> > 
> > Can you consider making use of dw_pcie_{suspend/resume}_noirq()?
> 
> I considered this, but dw_pcie_suspend_noirq needs to be tweaked as it
> checks both the pme_turn_off hook and whether we are entering into L2, which
> we don't support.
> 
> For the former, I can check the PCI_EXP_DEVSTAT_AUXPD capability before
> polling for L2 LTSSM. It looks like only the Layerscape platform uses this.
> I will need a Tested-by for this new dw_pcie_suspend_noirq.
> 
> Do you advise keeping stm32_pcie_suspend_noirq or modifying
> dw_pcie_suspend_noirq to this effect?
> 

Please modify dw_pcie_suspend_noirq() to fit your needs. We will review the
change.

For testing the change, you can CC the Layerscape maintainer and request for
testing.

> Thanks,
> 
> > 
> > > +	struct stm32_pcie *stm32_pcie = dev_get_drvdata(dev);
> > > +
> > > +	stm32_pcie_stop_link(&stm32_pcie->pci);
> > > +
> > > +	stm32_pcie_assert_perst(stm32_pcie);
> > > +
> > > +	clk_disable_unprepare(stm32_pcie->clk);
> > > +
> > > +	if (!device_may_wakeup(dev))
> > > +		phy_exit(stm32_pcie->phy);
> > > +
> > > +	return pinctrl_pm_select_sleep_state(dev);
> > > +}
> > > +
> > > +static int stm32_pcie_resume_noirq(struct device *dev)
> > > +{
> > > +	struct stm32_pcie *stm32_pcie = dev_get_drvdata(dev);
> > > +	struct dw_pcie_rp *pp = &stm32_pcie->pci.pp;
> > > +	int ret;
> > > +
> > > +	/*
> > > +	 * The core clock is gated with CLKREQ# from the COMBOPHY REFCLK,
> > > +	 * thus if no device is present, must force it low with an init pinmux
> > > +	 * to be able to access the DBI registers.
> > > +	 */
> > > +	if (!IS_ERR(dev->pins->init_state))
> > > +		ret = pinctrl_select_state(dev->pins->p, dev->pins->init_state);
> > > +	else
> > > +		ret = pinctrl_pm_select_default_state(dev);
> > > +
> > > +	if (ret) {
> > > +		dev_err(dev, "Failed to activate pinctrl pm state: %d\n", ret);
> > > +		return ret;
> > > +	}
> > > +
> > > +	if (!device_may_wakeup(dev)) {
> > > +		ret = phy_init(stm32_pcie->phy);
> > > +		if (ret) {
> > > +			pinctrl_pm_select_default_state(dev);
> > > +			return ret;
> > > +		}
> > > +	}
> > > +
> > > +	ret = clk_prepare_enable(stm32_pcie->clk);
> > > +	if (ret)
> > > +		goto err_phy_exit;
> > > +
> > > +	stm32_pcie_deassert_perst(stm32_pcie);
> > > +
> > > +	ret = dw_pcie_setup_rc(pp);
> > > +	if (ret)
> > > +		goto err_disable_clk;
> > > +
> > > +	ret = stm32_pcie_start_link(&stm32_pcie->pci);
> > > +	if (ret)
> > > +		goto err_disable_clk;
> > > +
> > > +	/* Ignore errors, the link may come up later */
> > > +	dw_pcie_wait_for_link(&stm32_pcie->pci);
> > 
> > These can be dropped when using dw_pcie_resume_noirq().
> 
> OK for dw_pcie_resume_noirq if we can keep it balanced with
> dw_pcie_suspend_noirq
> 
> > 
> > > +
> > > +	pinctrl_pm_select_default_state(dev);
> > > +
> > > +	return 0;
> > > +
> > > +err_disable_clk:
> > > +	stm32_pcie_assert_perst(stm32_pcie);
> > > +	clk_disable_unprepare(stm32_pcie->clk);
> > > +
> > > +err_phy_exit:
> > > +	phy_exit(stm32_pcie->phy);
> > > +	pinctrl_pm_select_default_state(dev);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static const struct dev_pm_ops stm32_pcie_pm_ops = {
> > > +	NOIRQ_SYSTEM_SLEEP_PM_OPS(stm32_pcie_suspend_noirq,
> > > +				  stm32_pcie_resume_noirq)
> > > +	SYSTEM_SLEEP_PM_OPS(stm32_pcie_suspend, stm32_pcie_resume)
> > > +};
> > > +
> > > +static const struct dw_pcie_host_ops stm32_pcie_host_ops = {
> > > +};
> > > +
> > > +static const struct dw_pcie_ops dw_pcie_ops = {
> > > +	.start_link = stm32_pcie_start_link,
> > > +	.stop_link = stm32_pcie_stop_link
> > > +};
> > > +
> > > +static int stm32_add_pcie_port(struct stm32_pcie *stm32_pcie,
> > > +			       struct platform_device *pdev)
> > > +{
> > > +	struct device *dev = stm32_pcie->pci.dev;
> > > +	struct dw_pcie_rp *pp = &stm32_pcie->pci.pp;
> > > +	int ret;
> > > +
> > 
> > You need to assert PERST# before configuring the resources.
> 
> It is already initialized to GPIOD_OUT_HIGH in gpiod_get, I can have an
> explicit stm32_pcie_assert_perst but is it necessary ?
> 

Ok, not necessary. Although, I would recommend to keep a comment here so that if
someone refactors the code, they would notice it.

> > 
> > > +	ret = phy_set_mode(stm32_pcie->phy, PHY_MODE_PCIE);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	ret = phy_init(stm32_pcie->phy);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	ret = regmap_update_bits(stm32_pcie->regmap, SYSCFG_PCIECR,
> > > +				 STM32MP25_PCIECR_TYPE_MASK,
> > > +				 STM32MP25_PCIECR_RC);
> > > +	if (ret)
> > > +		goto err_phy_exit;
> > > +
> > > +	reset_control_assert(stm32_pcie->rst);
> > > +	reset_control_deassert(stm32_pcie->rst);
> > > +
> > > +	ret = clk_prepare_enable(stm32_pcie->clk);
> > > +	if (ret) {
> > > +		dev_err(dev, "Core clock enable failed %d\n", ret);
> > > +		goto err_phy_exit;
> > > +	}
> > > +
> > > +	stm32_pcie_deassert_perst(stm32_pcie);
> > > +
> > > +	pp->ops = &stm32_pcie_host_ops;
> > > +	ret = dw_pcie_host_init(pp);
> > > +	if (ret) {
> > > +		dev_err(dev, "Failed to initialize host: %d\n", ret);
> > > +		goto err_disable_clk;
> > > +	}
> > 
> > Technically, dw_pcie_host_init() is not related to root port. So please move it
> > to probe() instead.
> 
> OK will move, thanks
> 
> > 
> > > +
> > > +	return 0;
> > > +
> > > +err_disable_clk:
> > > +	clk_disable_unprepare(stm32_pcie->clk);
> > > +	stm32_pcie_assert_perst(stm32_pcie);
> > > +
> > > +err_phy_exit:
> > > +	phy_exit(stm32_pcie->phy);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static int stm32_pcie_parse_port(struct stm32_pcie *stm32_pcie)
> > > +{
> > > +	struct device *dev = stm32_pcie->pci.dev;
> > > +	struct device_node *root_port;
> > > +
> > > +	root_port = of_get_next_available_child(dev->of_node, NULL);
> > > +
> > > +	stm32_pcie->phy = devm_of_phy_get(dev, root_port, NULL);
> > > +	if (IS_ERR(stm32_pcie->phy))
> > > +		return dev_err_probe(dev, PTR_ERR(stm32_pcie->phy),
> > > +				     "Failed to get pcie-phy\n");
> > 
> > OF refcount not decremented in both the error and success case.
> 
> I don't understand your point, isn't devm_of_phy_get managed to decrement
> the phy resources ?
> 

You should drop the refcount of the root_port using of_node_put().

> > 
> > > +
> > > +	stm32_pcie->perst_gpio = devm_fwnode_gpiod_get(dev, of_fwnode_handle(root_port),
> > > +						       "reset", GPIOD_OUT_HIGH, NULL);
> > > +	if (IS_ERR(stm32_pcie->perst_gpio)) {
> > > +		if (PTR_ERR(stm32_pcie->perst_gpio) != -ENOENT)
> > > +			return dev_err_probe(dev, PTR_ERR(stm32_pcie->perst_gpio),
> > > +					     "Failed to get reset GPIO\n");
> > > +		stm32_pcie->perst_gpio = NULL;
> > > +	}
> > > +
> > > +	if (device_property_read_bool(dev, "wakeup-source")) {
> > 
> > As per the current logic, 'wakeup-source' is applicable even without WAKE# GPIO,
> > which doesn't make sense.
> 
> Agree, wakeup-source is not needed
> 
> > 
> > > +		stm32_pcie->wake_gpio = devm_fwnode_gpiod_get(dev, of_fwnode_handle(root_port),
> > > +							      "wake", GPIOD_IN, NULL);
> > > +
> > > +		if (IS_ERR(stm32_pcie->wake_gpio)) {
> > > +			if (PTR_ERR(stm32_pcie->wake_gpio) != -ENOENT)
> > > +				return dev_err_probe(dev, PTR_ERR(stm32_pcie->wake_gpio),
> > > +						     "Failed to get wake GPIO\n");
> > > +			stm32_pcie->wake_gpio = NULL;
> > > +		}
> > 
> > Hmm. I think we need to move WAKE# handling inside drivers/pci/pcie/portdrv.c
> > since that is responsible for the root port. While other root port properties
> > have some dependency with the RC (like PERST#, PHY etc...), WAKE# handling could
> > be moved safel >
> > And once done, it can benefit all platforms.
> 
> OK I'll check if there is a convenient way to do this through a port_service
> 

You can drop the WAKE# support altogether and add it in the subsequent patches
once this initial driver gets merged. It is up to you.

> > 
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +

[...]

> > You can just move these definitions inside the driver itself.
> > 
> 
> Some definitions will be duplicated with the ep driver, but on the other
> side this file is very small... is it OK to duplicate definitions instead of
> having the bitfields together ?
> 

I didn't notice that these are reused by the ep driver. Fine with me.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

