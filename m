Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2A81D6DDD7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 06:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VpIhQ9mb9ycFkMd8PQ/S0ZDiIrP7seI2TZz9r3I3eW0=; b=YYklppKrXwEBNl77mgYxxTapAh
	2IkjDrDBT6MwBNZ3LyuBNU5KZodgS0GUoC22phhHTIoUVmXQbLIJi5nVbw9hnLly/YWg5vFjJIfkj
	djgOQqBY41beHfiW6rlZ/WOHvRpuJusWMtvodcRe6/OrJKs9TYwMIwRstsSjAsr+/UXeM+qkzqgKT
	hNdoLCrPDCVdVWEjBwCXSTddIhZBVvGR7lNpsYcHtxG1O8DRAxP3iYpeILBFG6aQF//2iqDw8kytc
	Rw8/1CIuN4IlQKITmAtu5S6sxuvHdAyyBVZzTcZLSe5J6cwXknu06Zg/Ob5vTfwnD5xlaq9BQJ+hZ
	8e98Dofw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBqEj-00000001qll-0IKF;
	Fri, 15 Nov 2024 06:55:21 +0000
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBqDn-00000001qZz-3dCK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 06:54:24 +0000
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-288d70788d6so620213fac.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Nov 2024 22:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731653663; x=1732258463; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VpIhQ9mb9ycFkMd8PQ/S0ZDiIrP7seI2TZz9r3I3eW0=;
        b=NHDhx+lUbVO1jJYhwl/wbEthM3o1aFmBGB+Lb+HlQKNeBJKmSAt4eZSCJJayQWPd84
         cWw1ww+B0wE6gaknQ/MpDLaCct3dNow2h+ReWd89S4bCTnzppdAqk+3YW4ypnB5U9BkP
         nnILHoRYqhpjL//QN0X/GGvuBKFM18Mz3+p1Qowpzujyaj6AvZ9iEoWZk19IAjqMV4vY
         l84D6uQ7nZH+Yg0sdXszsxLWe9cbhXyUdsLrK3sxnDaaWRzmVLMoNbYkCe3iOAa4+k0R
         mpPJEMo3tVTdLHkvh27WYeB3mqSsV1cu//yid6nxNmi9/mBEDjt3sj0MjP9e1l0gjTEI
         mSkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731653663; x=1732258463;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VpIhQ9mb9ycFkMd8PQ/S0ZDiIrP7seI2TZz9r3I3eW0=;
        b=YcwonV4PDVmytC9Rtr86F70NEgikAaIGfRH6pT6+j5oUFvaH8t1Yzvp+CjzrXJEEVv
         PO7PLeHezG7gMQcQ/h3sXkrfG3esX0cC6JEzvUEXe3OGprjZbAN0u5Nl/My57whv1F+1
         FipWjxjQsExWmNKC291rJilIbp3/46RngGhpPRbcPZk3+i75mOWGMwJM8UdNOBx1Of/n
         rAdvGgHRa1UWFNumpadXGkrc8YuTV5zQwKZl++EhK3nGf8z91mTFVe8nmubseHogKU4F
         E6gUxdDcVlDJ6wpLwWbGvutL5GGQwOgq12ZIY8/MfvqDcQMQt/4ZGWtUuTrVpA5g/p2H
         7iiw==
X-Forwarded-Encrypted: i=1; AJvYcCXCGCeFiFrGFz1KQyxulgupcL9oLZ1qmOtiUurO8dsXK1PXFp+mQ2uzGA7EL5aisov6Un9mn/8ryVBpjNRB8Yqt@lists.infradead.org
X-Gm-Message-State: AOJu0YwAg1MHFSuny1YpbhGKbl/aDLCblsJCu2I0Kuea/m8ewHTIkNqS
	CIkzxv8DtHcN5fRASsqfZeJ24QPy/0oyrvISezxrLGrluPOTPUCaLnrDh92uiA==
X-Google-Smtp-Source: AGHT+IGA2wP5EZO//DczjdnLKwXL89OrzkosGXPzS/O5S6Z8HF8QEOaPag4uwMWdG7hB0NyuZCDjFw==
X-Received: by 2002:a05:6871:691:b0:270:27e6:6f1a with SMTP id 586e51a60fabf-2962e2a0d04mr1279132fac.41.1731653662715;
        Thu, 14 Nov 2024 22:54:22 -0800 (PST)
Received: from thinkpad ([117.193.208.47])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f8c1c3224asm650735a12.29.2024.11.14.22.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 22:54:22 -0800 (PST)
Date: Fri, 15 Nov 2024 12:24:12 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: l.stach@pengutronix.de, bhelgaas@google.com, lpieralisi@kernel.org,
	kw@linux.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, frank.li@nxp.com,
	s.hauer@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
	kernel@pengutronix.de, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 06/10] PCI: imx6: Fix the missing reference clock
 disable logic
Message-ID: <20241115065412.l2r5vmqaw3ufcjo3@thinkpad>
References: <20241101070610.1267391-1-hongxing.zhu@nxp.com>
 <20241101070610.1267391-7-hongxing.zhu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241101070610.1267391-7-hongxing.zhu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_225423_904126_2D3A05E6 
X-CRM114-Status: GOOD (  18.27  )
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

On Fri, Nov 01, 2024 at 03:06:06PM +0800, Richard Zhu wrote:
> Ensure the *_enable_ref_clk() function is symmetric by addressing missing
> disable parts on some platforms.
> 
> Fixes: d0a75c791f98 ("PCI: imx6: Factor out ref clock disable to match enable")
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 54039d2760d5..bb130c84c016 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -595,10 +595,9 @@ static int imx_pcie_attach_pd(struct device *dev)
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
> @@ -627,19 +626,20 @@ static int imx8mm_pcie_enable_ref_clk(struct imx_pcie *imx_pcie, bool enable)
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

-- 
மணிவண்ணன் சதாசிவம்

