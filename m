Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C1A3C369D1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 11:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U8PIzBYTDnuUJNOzFhZUf8k7SMLmkkalf0cCtjYXloU=; b=Ubcc0YeT1yN6ej6HmdGk9hO9kY
	SRyLDew38fFavoJxzJc4+yNzxZ1rwEl9Uo5BkOXAEoJErkOgvT76UqbWLK2P+bYAHXwMTbAOxTKcT
	aw/Hl2CV9PHdcYN4dZU7i9T6LMoiKa5xi3oBrLCXAwuXXQs5geRrgZfpjFK/KZFUCXswQ95JivJvA
	ZgW70MCryIF8qeroPJNM3Cj5h2ho2jnKrCyIun785d26dhnDuZmXuuyR8wcFTz29GoD/qNstEoW9d
	/9Y9eR/7aXpmcA5OK19TvwBWrtstIKbqRdUo/St3oyF1DbqEx6Jbmp9CNDYUUJtHtSxF3ToWQJk/w
	MFCF46+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u905k-00000003P66-3eHc;
	Sun, 27 Apr 2025 11:22:36 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u903S-00000003OvZ-38Vs
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Apr 2025 11:20:15 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-739be717eddso3078081b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Apr 2025 04:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745752814; x=1746357614; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U8PIzBYTDnuUJNOzFhZUf8k7SMLmkkalf0cCtjYXloU=;
        b=AjUfnSrhGwiiGzI+8apCpZIwvLSyX/NkrNNM6LOfayh6ViB5JFteft39kLl9eRfNFj
         fOkxLODZqkZz8OoGFDBpH+gFnRLYPeegDM0tHtA3vm/VJ2nAFdxXjKOTn6J4+/RJ8JE2
         csBtGshH0LV0+OZueK1sfkzzl6/sZTKoIy9jTST/CHqcu8wnLBXRbvZCXzEkFXl+RHUL
         47B8aOoal+OmJrZpkXkE8NSerML8dO3EKT3pgoi/fdVFcbUbhMzGlu3S7Mj1dETbvEkZ
         9uTD6HNTgE9mjKY6TInIRBInQUt1sj8u4ZarT+5GifRW7/O9mU8t9ZwB1H4JB+Qbj2as
         z4kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745752814; x=1746357614;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U8PIzBYTDnuUJNOzFhZUf8k7SMLmkkalf0cCtjYXloU=;
        b=D9xlLX0Hy8GLRmFo03ttZOqcS2uqneYDKP2IiRFDYstkIQhuYZo6HH7ydH/O88Lm0e
         P0XaZSSYJ5OzzTU23POh1L2pKjufBzwoYahbG0OJ70kds2Mh4uM4sAxdjlURJIldmWwd
         4HzmAvJcSVPoNFqbnRh77k4xH5hjNXL3rQaUUTFKwrTFKfJh9BLvRweVcyNQ6vnRu2V6
         CH7bXyHnvARlA9dJotKOn9arL3IKa/3dfqybZJeEWjajVznPffaDyx/U12KJkrzYDxLK
         XB/jfMcoFfpobJ5kz3DpOtir2sOU9i74b/vm6p73h0BVdfPDfcs4tpFRWf5Q4WUFOtVf
         7qsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVXYo9VkyzNRj6GAs4NDUNm6EtS6Ph8EIk4dZvhuz67n/LLY25SVi1qT0nbmknemTYxzRh1DkJjsbjfof0sgIF@lists.infradead.org
X-Gm-Message-State: AOJu0YwmEfZmKusAgB9J/9E/m/hzXsb6uRaLC86yg1X43Fn48lp1ZEBW
	DkprA9pT+TrwA8TYc+WT7ChjZcU7HwvyhC63LFXagg/jc3B6vZK051tcHnPBBQ==
X-Gm-Gg: ASbGncsQupZ0X/BHVLINZB/197y2hl2y9S8fKGBElmK5/qYzCeGoiCf+6Z/690vvArp
	PyA7Ew2HQmRnz8mTlKDC2rJrySYigEke/ypia+67ViSwRoWcm4nwS4d44eaZureuw3EQhir7lI6
	mGsLpmRpxbcE03Z2jUCSWh/glHhWa5koEhzeDVS3NsP/jgh4p+j6Majnx1o1rjAlvehWCzRlPxn
	259VSvILDvVlyStGAXO+8F12W8l8PEuOTUl62Z5BQch7+8loPM3ONbxvhMkAj9Ff+laa7eJtX+m
	loi+fH1k+5sBSeHaFaSP2+CcoHKuiHjfSKs8qrCANtvKYHievubm
X-Google-Smtp-Source: AGHT+IFv79IfZh1GxCFHYniWlVSDWEu/6IbqRbKPw+om4ozt3ytyq0VaNeh7LhP4FfVYP6Dn5aHP7g==
X-Received: by 2002:a05:6a00:2da6:b0:73c:3060:d53 with SMTP id d2e1a72fcca58-73fd8b6bc26mr10692158b3a.18.1745752813817;
        Sun, 27 Apr 2025 04:20:13 -0700 (PDT)
Received: from thinkpad ([120.60.143.241])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25a6a17csm6054959b3a.111.2025.04.27.04.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 04:20:13 -0700 (PDT)
Date: Sun, 27 Apr 2025 16:50:06 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org, 
	kw@linux.com, robh@kernel.org, bhelgaas@google.com, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v6 6/7] PCI: imx6: Add PLL clock lock check for
 i.MX95 PCIe
Message-ID: <fnaivdfzjrzcivpegdozhp5i4cjqehze5smp23xiwktce7x4a2@2ryfqsuyvfec>
References: <20250416081314.3929794-1-hongxing.zhu@nxp.com>
 <20250416081314.3929794-7-hongxing.zhu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250416081314.3929794-7-hongxing.zhu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_042014_799934_4AA8213B 
X-CRM114-Status: GOOD (  20.38  )
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

On Wed, Apr 16, 2025 at 04:13:13PM +0800, Richard Zhu wrote:
> Add PLL clock lock check for i.MX95 PCIe.
> 
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

One comment below. But I'll fix it up while applying.

> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 29 +++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 7dcc9d88740d..4cff66794990 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -45,6 +45,9 @@
>  #define IMX95_PCIE_PHY_GEN_CTRL			0x0
>  #define IMX95_PCIE_REF_USE_PAD			BIT(17)
>  
> +#define IMX95_PCIE_PHY_MPLLA_CTRL		0x10
> +#define IMX95_PCIE_PHY_MPLL_STATE		BIT(30)
> +
>  #define IMX95_PCIE_SS_RW_REG_0			0xf0
>  #define IMX95_PCIE_REF_CLKEN			BIT(23)
>  #define IMX95_PCIE_PHY_CR_PARA_SEL		BIT(9)
> @@ -132,6 +135,7 @@ struct imx_pcie_drvdata {
>  	int (*init_phy)(struct imx_pcie *pcie);
>  	int (*enable_ref_clk)(struct imx_pcie *pcie, bool enable);
>  	int (*core_reset)(struct imx_pcie *pcie, bool assert);
> +	int (*wait_pll_lock)(struct imx_pcie *pcie);
>  	const struct dw_pcie_host_ops *ops;
>  };
>  
> @@ -479,6 +483,23 @@ static void imx7d_pcie_wait_for_phy_pll_lock(struct imx_pcie *imx_pcie)
>  		dev_err(dev, "PCIe PLL lock timeout\n");
>  }
>  
> +static int imx95_pcie_wait_for_phy_pll_lock(struct imx_pcie *imx_pcie)
> +{
> +	u32 val;
> +	struct device *dev = imx_pcie->pci->dev;
> +
> +	if (regmap_read_poll_timeout(imx_pcie->iomuxc_gpr,
> +				     IMX95_PCIE_PHY_MPLLA_CTRL, val,
> +				     val & IMX95_PCIE_PHY_MPLL_STATE,
> +				     PHY_PLL_LOCK_WAIT_USLEEP_MAX,
> +				     PHY_PLL_LOCK_WAIT_TIMEOUT)) {
> +		dev_err(dev, "PCIe PLL lock timeout\n");
> +		return -ETIMEDOUT;
> +	}
> +
> +	return 0;
> +}
> +
>  static int imx_setup_phy_mpll(struct imx_pcie *imx_pcie)
>  {
>  	unsigned long phy_rate = 0;
> @@ -1225,6 +1246,12 @@ static int imx_pcie_host_init(struct dw_pcie_rp *pp)
>  		goto err_phy_off;
>  	}
>  
> +	if (imx_pcie->drvdata->wait_pll_lock) {
> +		ret = imx_pcie->drvdata->wait_pll_lock(imx_pcie);
> +		if (ret < 0)
> +			goto err_phy_off;

You should also assert core reset in the error path.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

