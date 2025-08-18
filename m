Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB74CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 23:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=nkybdGtj/ZWJPXHTsfdM1pEPGbVI0ZPxIxaUB6Jh5Wc=; b=V5UkkRMRhee4Xj
	u63WgPwWRWKNEVGth0GZ9TbEsAYRbGNPKKv8smgWu5I9RV3nKYyY/3JyrjlCilKzp2hicvyT3KvqQ
	1acH74N3O2nG1he7s0yVDTodWv17BEkKaRjlEg1dJDb4UOcgHNhgvzqWQ6yFhJMrqzGUbvfd4Zqof
	PAP/3dkKrMDDO4YSPMDv8tYS4FoWLQvDg+AP/yjhOlAodeG/zsrrcvEK3qfiUN7fCkc3+c9lt27CL
	0VD3t/IrZRJbjqLQ1MfC26PNoMJsZsxF3IlO2Sa7HaNoMm0Ega+6re2jA0DLHdwCp2onZeL7/gXvm
	tVEevuIPCDhczKy0u/VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo8yl-00000008sgA-1fAH;
	Mon, 18 Aug 2025 23:09:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo8wB-00000008sVg-1UVf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 23:06:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BDE5844AA3;
	Mon, 18 Aug 2025 23:06:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7603C4CEEB;
	Mon, 18 Aug 2025 23:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755558402;
	bh=FEJffBBO1GLCjVFd+vVCwbbTg5k2KIInXnhfagOBwMs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=blwLuBx1g4adfeKGLh3pBnCLg9iEbXEvSOMPLrSmWNuooAFkAtZyO4IB66/G79Emr
	 wFY5JUW6IO22P30f9reCRQEXOScadGZpvELaHJl6J1ddMfYSHZRKHfv9VbTCeMxxPM
	 nhEj2d7FoAD9WuQzpAP2IZQvBLDdFtUCJ/e1SrahHsiUy4sZ3W2Pr8DoilPM6xwng8
	 xPFcMmmcfF4gY0Br1MYl0yFfp2Io+lTINebmUgCaQcADnEb5OO3UjgXQd5sKlbSS2a
	 jULfiSAnXYHHpuP+IxZwKm5kY0/lzMO7fDd2FEIHgHZhLWt4kt7AspAopU7vjB3N3u
	 CkqzjyqjPGZKw==
Date: Mon, 18 Aug 2025 18:06:40 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Christian Bruel <christian.bruel@foss.st.com>
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
	robh@kernel.org, bhelgaas@google.com, krzk+dt@kernel.org,
	conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, p.zabel@pengutronix.de,
	johan+linaro@kernel.org, cassel@kernel.org, shradha.t@samsung.com,
	thippeswamy.havalige@amd.com, quic_schintav@quicinc.com,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v12 2/9] PCI: stm32: Add PCIe host support for STM32MP25
Message-ID: <20250818230640.GA560877@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <917c9323-9c0c-406f-a314-a6e4a5511b45@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_160647_438610_3715B2F2 
X-CRM114-Status: GOOD (  32.28  )
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

[+cc Linus]

On Mon, Aug 18, 2025 at 12:50:19PM +0200, Christian Bruel wrote:
> On 8/13/25 21:29, Bjorn Helgaas wrote:
> > On Tue, Jun 10, 2025 at 11:07:07AM +0200, Christian Bruel wrote:
> > > Add driver for the STM32MP25 SoC PCIe Gen1 2.5 GT/s and Gen2 5GT/s
> > > controller based on the DesignWare PCIe core.
> > > ...

> > > +static int stm32_pcie_resume_noirq(struct device *dev)
> > > +{
> > > +	struct stm32_pcie *stm32_pcie = dev_get_drvdata(dev);
> > > +	int ret;
> > > +
> > > +	/*
> > > +	 * The core clock is gated with CLKREQ# from the COMBOPHY REFCLK,
> > > +	 * thus if no device is present, must force it low with an init pinmux
> > > +	 * to be able to access the DBI registers.
> > 
> > What happens on initial probe if no device is present?  I assume we
> > access DBI registers in the dw_pcie_host_init() path, and it seems
> > like we'd have the same issue with DBI not being accessible when no
> > device is present.
> 
> Correct, same issue. The magic happens with the PINCTRL init state that is
> automatically called before probe. As I tried to explain in the
> Documentation in the pinctrl patch:
> 
> - if ``init`` and ``default`` are defined in the device tree, the "init"
>   state is selected before the driver probe and the "default" state is
>   selected after the driver probe.

OK, thanks for that reminder!

The fact that the pinctrl init state is set implicitly before .probe(),
but we have to do it explicitly in .stm32_pcie_resume_noirq() seems a
*little* bit weird and makes the driver harder to review.  But ... I
guess that's out of scope for this series.

I see that Linus has given his approval to merge the new
pinctrl_pm_select_init_state() along with this series.  Would you mind
pulling those changes [1] and the use [2] into a v13 of this series?
That way I won't have to collect up all the pieces and risk missing
something.

BTW, I noticed a s/platformm/platform/ typo in the "[PATCH v1 2/2]
pinctrl: Add pinctrl_pm_select_init_state helper function" patch.

> > > +	if (!IS_ERR(dev->pins->init_state))
> > > +		ret = pinctrl_select_state(dev->pins->p, dev->pins->init_state);
> > > +	else
> > > +		ret = pinctrl_pm_select_default_state(dev);
> > > +
> > > +	if (ret) {
> > > +		dev_err(dev, "Failed to activate pinctrl pm state: %d\n", ret);
> > > +		return ret;
> > > +	}

> > > +static int stm32_add_pcie_port(struct stm32_pcie *stm32_pcie)
> > > +{
> > > +	struct device *dev = stm32_pcie->pci.dev;
> > > +	unsigned int wake_irq;
> > > +	int ret;
> > > +
> > > +	/* Start to enable resources with PERST# asserted */
> > 
> > I guess if device tree doesn't describe PERST#, we assume PERST# is
> > actually *deasserted* already at this point (because
> > stm32_pcie_deassert_perst() does nothing other than the delay)?
> 
> yes, this also implies that PV is stable

Maybe we could update the comment somehow?  Or maybe even just remove
it, since we actually don't know the state of PERST# at this point?

It sounds like we don't know the PERST# state until after we call
stm32_pcie_deassert_perst() below.

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
> > > +	stm32_pcie_deassert_perst(stm32_pcie);

Bjorn

[1] https://lore.kernel.org/r/20250813081139.93201-1-christian.bruel@foss.st.com
[2] https://lore.kernel.org/r/20250813115319.212721-1-christian.bruel@foss.st.com


