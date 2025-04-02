Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80F79C36014
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 07:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wrj4V9MRgCpu2LtNWMLFim5E/d/HPPAOJpXxZxDZGfU=; b=FhXOd2e6xM22eP2qa1yHXLR46O
	JMLXq/MKMSNhU252Cna6C8c4C7hNTYpMbMteAkP50B3n2HgpPxB71+DEZqfBiw3N5THHUgpJ3Fr8l
	aPsMHBvNWKI1rO8kTvFp1QZPr2VSAu6OUqad7xmJ8RwMf8125neKUEIGiYo5L9QbHI7m/zJaA6E/I
	B478fgbcG5SnQ/v2JPGYX+LtMAaOKihXLW2DTBWO4fUchsNf3gVcqQKII2j4KJPqY/Pmn/+NQyh9r
	vAkxNs7xIRmNpdJrSaB42COAX2mSCif6Ygob1siTXUuOfW7b4KgKN3RkcEmlqmSKcjKBzPFhEaAKl
	qjOORnHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzscY-00000005OWp-1v5i;
	Wed, 02 Apr 2025 07:34:46 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzsH1-00000005KpO-42E4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 07:12:33 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-227d6b530d8so116422745ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Apr 2025 00:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743577951; x=1744182751; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wrj4V9MRgCpu2LtNWMLFim5E/d/HPPAOJpXxZxDZGfU=;
        b=QhsP6EYEOdQg4gXsC9ylOHiisXu6RgbW81/YQnRcZW9/63ecVLDvpHPLRm9O4dMzuI
         5yBADpaMr6YaGe/UsHv4Fcyf5g46tFCzEMzfBAH5FcC5jfuFU+VFbuTAmNyEohG4sRve
         tdZE+/i41oJgUiXImJZUoGEnuQ1YhCIxtHT43uUXJZN7mAo9/VufVORj3+AOfwRuE2wj
         19fzWM5MmB84TjEDo1N5lgx/MTP+mfWW5vtaplDsXcz7zHiupN8l3PkrNBDKzFl+o5TO
         oDSdAuGzg6fAbaET+vfYSQGvudDemrvUfjX67vQsH9x5DzfkidBKuUNHvWlBeZxCRL65
         OQ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743577951; x=1744182751;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wrj4V9MRgCpu2LtNWMLFim5E/d/HPPAOJpXxZxDZGfU=;
        b=Y+/KAvMlHeWsHdLnHo2kM+JcmOOaXMBzE1wbpx/fpd9SuEKq814p1bAXVw8G19jksZ
         +lttbMFoeLus2VVHwUY0nIS5+eWZ/beWQw3lde5FpzRGBvZ6FAdKmp3Z9nL3gj3UR4L4
         GyaxGEdA17ROSToRZu3IqPYZnZCavFlWNUaP9DpM5SKQ7zc1ixKBpPAtyTfBeFQLNXGH
         P6L1iPaANeDTERYEeqC0bQ40mm0FfNu8B4O9rcHuvJx4V4WPq1oKV+2aqaR33eE5TvJW
         0hR9v2tT8IkuOWXNULhPkr64q/yZmsa/EypiwGbs5gslE14rzDF50jKlDReXYctFrVNn
         HwYg==
X-Forwarded-Encrypted: i=1; AJvYcCXr4NJQWz+hPoTz6nWWjDKyiebqA5BlfcPR6ldAAkWLsJU+wKKXdMZvEWwMoEghcI/HqXwLsv47hFuI2rV/2fjw@lists.infradead.org
X-Gm-Message-State: AOJu0YxnPYb47CO3vUF12gkg3VsMaQ7H1eMMoFUvusetyCRDml0jn2c8
	TMZv2Kbsa2UTUKF62MQD+iQ+m/Jkmcx3/Foa+ovQ1WxT5pTp4IZBjoT/l1sxHA==
X-Gm-Gg: ASbGnct52uRiTjuU55Pi8xNlacnMHwf8MCMKrO3l2OAEKAVIbIwvmYatLMkSv7qflmj
	z/JXowFaAz65Tdq1f2+arSA5W6MPccKbpm7UFyCgGoXlhHFZgRQy6AxT/kmOg/07GCmgq8i1OIj
	nfIjU4Vv696q6sFazreSGKpfR6PkFb2H9c4oPEwGJUYNvKYURRyHHNUdzw8YhKlIKGOWc7bYesm
	Ac4/bK5fglzcUHNHsf+PO9P9wBZcyK/Bz0GgTTDI0MQegfqbVVYojjRpxsNJl2j5DhIY5LfB4/x
	/HZrJWf1m0yc1oah5Kh2LoyQIOjlKWhherjLro9aunP3THsiU6iskB7r
X-Google-Smtp-Source: AGHT+IH7HVyfhbJgscLZlWHcx6unjJnhNHPt1Oe80QN8jshmi6OTB4pxtx/6rlu6wrrrxDY+b7sOkw==
X-Received: by 2002:a17:903:228e:b0:224:fa0:36d2 with SMTP id d9443c01a7336-2295bea09cbmr81844005ad.26.1743577950936;
        Wed, 02 Apr 2025 00:12:30 -0700 (PDT)
Received: from thinkpad ([120.56.205.103])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eec6f91sm101088425ad.17.2025.04.02.00.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 00:12:30 -0700 (PDT)
Date: Wed, 2 Apr 2025 12:42:23 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org, 
	kw@linux.com, robh@kernel.org, bhelgaas@google.com, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 6/6] PCI: imx6: Save and restore the LUT setting for
 i.MX95 PCIe
Message-ID: <ifq673ok4bel3qe2rsaiblmhnsfbevogrvgnuceewkq6vi6625@7ug7d64bvizc>
References: <20250328030213.1650990-1-hongxing.zhu@nxp.com>
 <20250328030213.1650990-7-hongxing.zhu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250328030213.1650990-7-hongxing.zhu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_001231_998149_E7E6A7F1 
X-CRM114-Status: GOOD (  26.50  )
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

On Fri, Mar 28, 2025 at 11:02:13AM +0800, Richard Zhu wrote:
> The look up table(LUT) setting would be lost during PCIe suspend on i.MX95.
> 
> To ensure proper functionality after resume, save and restore the LUT
> setting in suspend and resume operations.
> 

There should be a fixes tag pointing to the commit added suspend/resume support.

> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 47 +++++++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 40eeb02ffb5d..d8f4608eb7da 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -138,6 +138,11 @@ struct imx_pcie_drvdata {
>  	const struct dw_pcie_host_ops *ops;
>  };
>  
> +struct imx_lut_data {
> +	u32 data1;
> +	u32 data2;
> +};
> +
>  struct imx_pcie {
>  	struct dw_pcie		*pci;
>  	struct gpio_desc	*reset_gpiod;
> @@ -157,6 +162,8 @@ struct imx_pcie {
>  	struct regulator	*vph;
>  	void __iomem		*phy_base;
>  
> +	/* LUT data for pcie */
> +	struct imx_lut_data	luts[IMX95_MAX_LUT];
>  	/* power domain for pcie */
>  	struct device		*pd_pcie;
>  	/* power domain for pcie phy */
> @@ -1505,6 +1512,42 @@ static void imx_pcie_msi_save_restore(struct imx_pcie *imx_pcie, bool save)
>  	}
>  }
>  
> +static void imx_pcie_lut_save(struct imx_pcie *imx_pcie)
> +{
> +	u32 data1, data2;
> +	int i;
> +
> +	for (i = 0; i < IMX95_MAX_LUT; i++) {
> +		regmap_write(imx_pcie->iomuxc_gpr, IMX95_PE0_LUT_ACSCTRL,
> +			     IMX95_PEO_LUT_RWA | i);
> +		regmap_read(imx_pcie->iomuxc_gpr, IMX95_PE0_LUT_DATA1, &data1);
> +		regmap_read(imx_pcie->iomuxc_gpr, IMX95_PE0_LUT_DATA2, &data2);
> +		if (data1 & IMX95_PE0_LUT_VLD) {
> +			imx_pcie->luts[i].data1 = data1;
> +			imx_pcie->luts[i].data2 = data2;
> +		} else {
> +			imx_pcie->luts[i].data1 = 0;
> +			imx_pcie->luts[i].data2 = 0;
> +		}
> +	}
> +}
> +
> +static void imx_pcie_lut_restore(struct imx_pcie *imx_pcie)
> +{
> +	int i;
> +
> +	for (i = 0; i < IMX95_MAX_LUT; i++) {
> +		if ((imx_pcie->luts[i].data1 & IMX95_PE0_LUT_VLD) == 0)
> +			continue;
> +
> +		regmap_write(imx_pcie->iomuxc_gpr, IMX95_PE0_LUT_DATA1,
> +			     imx_pcie->luts[i].data1);
> +		regmap_write(imx_pcie->iomuxc_gpr, IMX95_PE0_LUT_DATA2,
> +			     imx_pcie->luts[i].data2);
> +		regmap_write(imx_pcie->iomuxc_gpr, IMX95_PE0_LUT_ACSCTRL, i);
> +	}
> +}
> +
>  static int imx_pcie_suspend_noirq(struct device *dev)
>  {
>  	struct imx_pcie *imx_pcie = dev_get_drvdata(dev);
> @@ -1513,6 +1556,8 @@ static int imx_pcie_suspend_noirq(struct device *dev)
>  		return 0;
>  
>  	imx_pcie_msi_save_restore(imx_pcie, true);
> +	if (imx_check_flag(imx_pcie, IMX_PCIE_FLAG_HAS_LUT))
> +		imx_pcie_lut_save(imx_pcie);
>  	if (imx_check_flag(imx_pcie, IMX_PCIE_FLAG_BROKEN_SUSPEND)) {
>  		/*
>  		 * The minimum for a workaround would be to set PERST# and to
> @@ -1557,6 +1602,8 @@ static int imx_pcie_resume_noirq(struct device *dev)
>  		if (ret)
>  			return ret;
>  	}
> +	if (imx_check_flag(imx_pcie, IMX_PCIE_FLAG_HAS_LUT))
> +		imx_pcie_lut_restore(imx_pcie);
>  	imx_pcie_msi_save_restore(imx_pcie, false);
>  
>  	return 0;
> -- 
> 2.37.1
> 

-- 
மணிவண்ணன் சதாசிவம்

