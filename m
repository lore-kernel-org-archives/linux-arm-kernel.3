Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B48C3C02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 17:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=AvVZShatq7HA1nb3s6RyMdwsfQl//jiDhZ9Lb2mz/4U=; b=3wZpnvjY9smqiW
	WCh+3LpGFmwLuIV9J2hVkIKsjVgCduA0fib/A1HGJ4avtTNlVQ+p1yUbBVbPcHTHMEXx2tfzKRmYN
	eCrogawOJvm5p5CGg4XOHPRdvB+9JOLc2Q/RyZw6Vvk6nP7G1/6xpivJabP9v4G/Nu9XIsOYOtTn/
	qwpfpRh/2DzwxWbnokjoD4vAMYMSWOU16fCrKIIg/KjzZRy7N/y6E85YmupTiHOMoQyh+P5HNN3sy
	7pmS8YSndT8oyzcYCAkAc1Trkm1JsxXpU2F/OQGFEFs0wM7gDb4RRzXrcmjvE//Zk+xYlqsZlfiu2
	mWu0TKmvuAhpC6S3Q1uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYTGN-0000000Fbbg-3Rl0;
	Thu, 16 Jan 2025 17:02:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYTF6-0000000FbR6-3sbj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 17:01:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AFD975C4BC2;
	Thu, 16 Jan 2025 17:00:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2839C4CED6;
	Thu, 16 Jan 2025 17:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737046876;
	bh=sIyEpcILKU6HkN+pcB5rrY1Ix3OJNrYy21QuDNq+2IQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=aihW9zUS9HxRQsQOKMKJdhyogOtZ88U61HA5vehb8BNQHBNOkxW5Gq7CxpGbq7NGl
	 wpUJTNDfKWCN0LABS5YhiT7jBJj3qD7q28Y7Rsny2FHg3EUi5VPkRWsgDYjijsv5Eq
	 UEAmtqWoH8s7QtSFljoMe0T0gXKw+F2xFCAj3L3Iv8SboyG6cdPxfvwEmzLddxr3HX
	 1vdFC/9NFNb0kj02O7ELPYxlydm1WKgg5BLtkaQe5UJQh6OO+ZFA9iI2KcRM32/9T0
	 soQmWnGKaQURbLuJiSrZ0aL5WWP/GOAHf7hN9mB+66cbjG3HedpzL3d8BYibnCpAl+
	 nUZw1VNynBg6w==
Date: Thu, 16 Jan 2025 11:01:14 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: l.stach@pengutronix.de, bhelgaas@google.com, lpieralisi@kernel.org,
	kw@linux.com, manivannan.sadhasivam@linaro.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	frank.li@nxp.com, s.hauer@pengutronix.de, festevam@gmail.com,
	imx@lists.linux.dev, kernel@pengutronix.de,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 06/10] PCI: imx6: Fix the missing reference clock
 disable logic
Message-ID: <20250116170114.GA561930@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241126075702.4099164-7-hongxing.zhu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_090117_046825_C10E3231 
X-CRM114-Status: GOOD (  19.58  )
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

On Tue, Nov 26, 2024 at 03:56:58PM +0800, Richard Zhu wrote:
> Ensure the *_enable_ref_clk() function is symmetric by addressing missing
> disable parts on some platforms.
> 
> Fixes: d0a75c791f98 ("PCI: imx6: Factor out ref clock disable to match enable")

The patch below looks fine to me, and I guess it's more than just
making the code prettier; it also actually *fixes* something, right?

It looks like a functional change because imx_pcie_clk_enable() will
now enable the IMX7D refclk when it didn't before, and
imx_pcie_clk_disable() will disable the IMX6SX and IMX8M* refclk when
it didn't before?

But I don't think the Fixes: tag is correct.  I looked at uses of
these symbols:

  IMX6SX_GPR12_PCIE_TEST_POWERDOWN
    enabled by imx6_pcie_enable_ref_clk()
    disabled by imx6_pcie_assert_core_reset()

  IMX7D_GPR12_PCIE_PHY_REFCLK_SEL
    enabled by imx6_pcie_init_phy()
    disabled by imx6_pcie_clk_disable()

  IMX8MQ_GPR_PCIE_CLK_REQ_OVERRIDE
    enabled by imx6_pcie_enable_ref_clk()

As far as I can tell, these uses are identical before and after
d0a75c791f98 ("PCI: imx6: Factor out ref clock disable to match
enable").

> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 413db182ce9f..ab2c97a8c327 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -599,10 +599,9 @@ static int imx_pcie_attach_pd(struct device *dev)
>  
>  static int imx6sx_pcie_enable_ref_clk(struct imx_pcie *imx_pcie, bool enable)
>  {
> -	if (enable)
> -		regmap_clear_bits(imx_pcie->iomuxc_gpr, IOMUXC_GPR12,
> -				  IMX6SX_GPR12_PCIE_TEST_POWERDOWN);
> -
> +	regmap_update_bits(imx_pcie->iomuxc_gpr, IOMUXC_GPR12,
> +			   IMX6SX_GPR12_PCIE_TEST_POWERDOWN,
> +			   enable ? 0 : IMX6SX_GPR12_PCIE_TEST_POWERDOWN);
>  	return 0;
>  }
>  
> @@ -631,19 +630,20 @@ static int imx8mm_pcie_enable_ref_clk(struct imx_pcie *imx_pcie, bool enable)
>  {
>  	int offset = imx_pcie_grp_offset(imx_pcie);
>  
> -	if (enable) {
> -		regmap_clear_bits(imx_pcie->iomuxc_gpr, offset, IMX8MQ_GPR_PCIE_CLK_REQ_OVERRIDE);
> -		regmap_set_bits(imx_pcie->iomuxc_gpr, offset, IMX8MQ_GPR_PCIE_CLK_REQ_OVERRIDE_EN);
> -	}
> -
> +	regmap_update_bits(imx_pcie->iomuxc_gpr, offset,
> +			   IMX8MQ_GPR_PCIE_CLK_REQ_OVERRIDE,
> +			   enable ? 0 : IMX8MQ_GPR_PCIE_CLK_REQ_OVERRIDE);
> +	regmap_update_bits(imx_pcie->iomuxc_gpr, offset,
> +			   IMX8MQ_GPR_PCIE_CLK_REQ_OVERRIDE_EN,
> +			   enable ? IMX8MQ_GPR_PCIE_CLK_REQ_OVERRIDE_EN : 0);
>  	return 0;
>  }
>  
>  static int imx7d_pcie_enable_ref_clk(struct imx_pcie *imx_pcie, bool enable)
>  {
> -	if (!enable)
> -		regmap_set_bits(imx_pcie->iomuxc_gpr, IOMUXC_GPR12,
> -				IMX7D_GPR12_PCIE_PHY_REFCLK_SEL);
> +	regmap_update_bits(imx_pcie->iomuxc_gpr, IOMUXC_GPR12,
> +			   IMX7D_GPR12_PCIE_PHY_REFCLK_SEL,
> +			   enable ? 0 : IMX7D_GPR12_PCIE_PHY_REFCLK_SEL);
>  	return 0;
>  }
>  
> -- 
> 2.37.1
> 

