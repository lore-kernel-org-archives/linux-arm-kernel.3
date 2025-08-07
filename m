Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06951C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 18:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=f+dC5cIQUp7geGuLLAPnXmXUNugeLEjsXSMSsslTwt0=; b=QgwlHUaalbMcQY
	/Py0/9vf+0GNZFDz9Yh3BkoP05vrjqHfguKcC8/O+5lC66UFz3t+eyZE3qCZajsVRXePe2oFoLbru
	sxh98bBVoz+p1OtFV2YJhxXr2+YBnaVttSNvxPXF6VV0jav2ACrvr0ygqjwKnlXfPmWUqSoKpPGu1
	3v/LfnqZhVcsPbkd7xhB+xkGBU43NaNqLUUHyvQO4ysAnBGm7DNQd/Lba34d1xhEHYTa+WIbNWDtD
	dFaopLQF4HuZihva5OuR9jkvFwjp09CcxP2LRZ6vmOg0vG/EGol0o6//uJc94ckw26k4iRyZK6xFq
	nL6AcosXMeUMGglzl9sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk52o-00000001Iyy-1Nfz;
	Thu, 07 Aug 2025 18:08:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk4zR-00000001ITM-158H
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 18:05:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CC1D445429;
	Thu,  7 Aug 2025 18:05:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D6AFC4CEEB;
	Thu,  7 Aug 2025 18:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754589920;
	bh=xKpdGfGG9X89d+WYFfLmSef3z1eEJiPKsaCnJZfi//o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=c56iw94LMjfCTQ66ZGwvscHeQingtEi1BN5o2AVxTSaGSKTDiuQ6+ltUm7Jdakf0p
	 KJHhGzLT5y3/d1/pgUJee+oXgPAWU3BQuDWkmfluEH/+0xKhdpe/qHyf3SGc3JnUo7
	 Kzl5xxmGFv4fXuDQMYXaH6cNq5WDiLIZf5u6/Zczvv4og25ptx6G2py/u43Ti8RIlx
	 5TsyHim7Q5xI5qtrH8T0+53Wd4nQG/fNppMfQG7PRkTVwcbXXhh6oU1PJIxcJNdNPK
	 qvnZFc3aAGv2A9McbAffQmwJDw3f7eRRmRM6jO6olH4SeyB3SzyI+gwAvRnCbF3LgY
	 z8RTMlTWzR78Q==
Date: Thu, 7 Aug 2025 13:05:19 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Christian Bruel <christian.bruel@foss.st.com>
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
	robh@kernel.org, bhelgaas@google.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, linus.walleij@linaro.org,
	linux-pci@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [RESEND PATCH 2/2] PCI: stm32: use
 pinctrl_pm_select_init_state() in stm32_pcie_resume_noirq()
Message-ID: <20250807180519.GA56557@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250717063042.2236524-3-christian.bruel@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_110521_339186_05C01C04 
X-CRM114-Status: GOOD (  23.46  )
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

On Thu, Jul 17, 2025 at 08:30:42AM +0200, Christian Bruel wrote:
> Replace direct access to dev->pins->init_state with the new helper
> pinctrl_pm_select_init_state() to select the init pinctrl state.
> This fixes build issues when CONFIG_PINCTRL is not defined.
> 
> Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
> Reported-by: Bjorn Helgaas <bhelgaas@google.com>  
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202506260920.bmQ9hQ9s-lkp@intel.com/
> Fixes: 633f42f48af5 ("PCI: stm32: Add PCIe host support for STM32MP25")

633f42f48af5 is still on pci/controller/dwc-stm32, but only for
reference.  After v6.17-rc1, we will need to rebase to it and figure
out the merge strategy.

Part of that will be to restructure 633f42f48af5 and the material
below such that there is no build issue at any point in the series.

> ---
>  drivers/pci/controller/dwc/pcie-stm32.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-stm32.c b/drivers/pci/controller/dwc/pcie-stm32.c
> index 50fae5f5ced2..c1d803dc3778 100644
> --- a/drivers/pci/controller/dwc/pcie-stm32.c
> +++ b/drivers/pci/controller/dwc/pcie-stm32.c
> @@ -28,6 +28,7 @@ struct stm32_pcie {
>  	struct clk *clk;
>  	struct gpio_desc *perst_gpio;
>  	struct gpio_desc *wake_gpio;
> +	bool   have_pinctrl_init;
>  };
>  
>  static void stm32_pcie_deassert_perst(struct stm32_pcie *stm32_pcie)
> @@ -91,10 +92,10 @@ static int stm32_pcie_resume_noirq(struct device *dev)
>  	/*
>  	 * The core clock is gated with CLKREQ# from the COMBOPHY REFCLK,
>  	 * thus if no device is present, must force it low with an init pinmux
> -	 * to be able to access the DBI registers.
> +	 * if present to be able to access the DBI registers.
>  	 */
> -	if (!IS_ERR(dev->pins->init_state))
> -		ret = pinctrl_select_state(dev->pins->p, dev->pins->init_state);
> +	if (stm32_pcie->have_pinctrl_init)
> +		ret = pinctrl_pm_select_init_state(dev);
>  	else
>  		ret = pinctrl_pm_select_default_state(dev);
>  
> @@ -274,6 +275,9 @@ static int stm32_pcie_probe(struct platform_device *pdev)
>  		return dev_err_probe(dev, PTR_ERR(stm32_pcie->rst),
>  				     "Failed to get PCIe reset\n");
>  
> +	if (device_property_match_string(dev, "pinctrl-names", PINCTRL_STATE_INIT) >= 0)
> +		stm32_pcie->have_pinctrl_init = true;
> +
>  	ret = stm32_pcie_parse_port(stm32_pcie);
>  	if (ret)
>  		return ret;
> -- 
> 2.34.1
> 

