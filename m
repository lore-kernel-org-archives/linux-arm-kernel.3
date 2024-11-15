Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 302A9D6DDD9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 06:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UUnANkLZ+cRlOTdO0AUsRhtlxHbXsgSkLLst9mQNAEg=; b=Ibk8UO26VaZgHEtRtsYt3jIfzO
	tZiN1EnKXLjv5KyNHRMsM9lJQCjXMyAt/w7iYqEKQVXbDSYicjNpSoWq7wulvb/u+fzuszRyvseDJ
	66nb9apTv74GXAuEAZV4aubXRqNGSNHZseTH5EIn2/vy/s96LRZWQwIkooxgzLOvDm06D7ZBPEUyU
	d7L0ln3l6MugDPzy0TqQeaUPZoxXudvuHNkAw6EswoKZQ6eaI5iNR6FN6whjX0US4SvnTTf/SRJvz
	Td9ioU0su3cM1bCqPH/yptvpSJZ9h+955lYIitlmBp6jeA5NkM7LnfW2OiHYB0g/I8SFncVQ4Oxxr
	MGVWraFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBqHQ-00000001rBr-1x8Z;
	Fri, 15 Nov 2024 06:58:08 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBqGU-00000001r2C-2vP7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 06:57:11 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-20c7ee8fe6bso16042805ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Nov 2024 22:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731653829; x=1732258629; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UUnANkLZ+cRlOTdO0AUsRhtlxHbXsgSkLLst9mQNAEg=;
        b=x52Hcu4CUkqhPmtGrPSmT6Pvx6XuYbNPhaCYZG5x7ZbE6JKKGbttBU2D6/ez7VfW12
         E1ZZHG3KpnJYrdURPpg2/3ZXln07i7ncNndLI8FrnWS6W+Oios/9DiQGxKNM3GhLMNOo
         7TbcapCxjZAqrqivfSBqqVGs0jiuqqiLR4yE1qWgWquw9UbzHmW//iKpMBRem1GPDx7w
         ImosgCc5ek8Buu0zLCIdofLiKm6nz86H+513QsTIwvbSuEi6yofio6G12dVTRB1/kgtP
         DZY/KD7uAAvArjWCvfkBdFDflq5yTa0LMuyY51UgsgYqwEPHxcvk5wvRL25h75LydAKo
         z55w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731653829; x=1732258629;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UUnANkLZ+cRlOTdO0AUsRhtlxHbXsgSkLLst9mQNAEg=;
        b=o6bmu2GK0PW8ei6q/DM3zbLpfYAvO/psqAelGb9vodTouC6fXdWa/0e6Yu5aTRIUd5
         brPY3M2CUsKrG9p2qtDIdlVMc8eojE9E64ytUU8VvVql5SYhvUBk5u5QMJYkcvvLF4Ij
         AJgE7NY5IuCRTicj2ywzEzclz6FYPYTS/4v87kDOlwFxAaQyml4+TvVUEX1tyVI8xAFW
         chKYaM7iAhJ61TItf/u9IILo7Fce4PielU4bYCfhzLb773OlgdxQXzweVD4RkG1+4J5q
         1k71EVoQwwX+tmczPwsLJnbCAIv5TUJB5bxrXLgcuwhPxYEOowYqB9kAcnoTzNrwBiZ4
         fdmw==
X-Forwarded-Encrypted: i=1; AJvYcCUeNrlaPOmpgrTr60LDSIYvonPc6FrrxzmfFyLVhQrujubQRX+S9qr/hgDkguproxOjizRb5gM0zdVi82iwP0NW@lists.infradead.org
X-Gm-Message-State: AOJu0Yxds8qKjhh3u1xEz//uC5h6cpfoTg2pA88gDInh5PkHowgzt3zy
	+MEmZdrJR8w0rZzKTIHH8PdxbBew1uOm73czB5nzB+baHndCmuSWA/2QDO19hQ==
X-Google-Smtp-Source: AGHT+IGyxlQ3XKDLt3Kpg+bOwQr2O6U0ym9WxGmFcCu7LdeG9Tf0de/64JRmH23hKPfODvd+Dxxf8w==
X-Received: by 2002:a17:902:d48c:b0:20c:94f6:3e03 with SMTP id d9443c01a7336-211d0ed2e36mr24090375ad.47.1731653829586;
        Thu, 14 Nov 2024 22:57:09 -0800 (PST)
Received: from thinkpad ([117.193.208.47])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211d0f34698sm6210935ad.133.2024.11.14.22.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 22:57:08 -0800 (PST)
Date: Fri, 15 Nov 2024 12:27:00 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: l.stach@pengutronix.de, bhelgaas@google.com, lpieralisi@kernel.org,
	kw@linux.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, frank.li@nxp.com,
	s.hauer@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
	kernel@pengutronix.de, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 07/10] PCI: imx6: Clean up codes by removing
 imx7d_pcie_init_phy()
Message-ID: <20241115065700.gfz7dmoijhh43lhd@thinkpad>
References: <20241101070610.1267391-1-hongxing.zhu@nxp.com>
 <20241101070610.1267391-8-hongxing.zhu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241101070610.1267391-8-hongxing.zhu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_225710_792237_CA365029 
X-CRM114-Status: GOOD (  17.18  )
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

On Fri, Nov 01, 2024 at 03:06:07PM +0800, Richard Zhu wrote:

> Remove the duplicate imx7d_pcie_init_phy() function as it is the same as
> imx7d_pcie_enable_ref_clk().
> 

How about.

"PCI: imx6: Remove imx7d_pcie_init_phy() function"

This function essentially duplicates imx7d_pcie_enable_ref_clk(). So remove it."

> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>

With above change,

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index bb130c84c016..fde2f4eaf804 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -390,13 +390,6 @@ static int imx8mq_pcie_init_phy(struct imx_pcie *imx_pcie)
>  	return 0;
>  }
>  
> -static int imx7d_pcie_init_phy(struct imx_pcie *imx_pcie)
> -{
> -	regmap_update_bits(imx_pcie->iomuxc_gpr, IOMUXC_GPR12, IMX7D_GPR12_PCIE_PHY_REFCLK_SEL, 0);
> -
> -	return 0;
> -}
> -
>  static int imx_pcie_init_phy(struct imx_pcie *imx_pcie)
>  {
>  	regmap_update_bits(imx_pcie->iomuxc_gpr, IOMUXC_GPR12,
> @@ -1526,7 +1519,6 @@ static const struct imx_pcie_drvdata drvdata[] = {
>  		.clks_cnt = ARRAY_SIZE(imx6q_clks),
>  		.mode_off[0] = IOMUXC_GPR12,
>  		.mode_mask[0] = IMX6Q_GPR12_DEVICE_TYPE,
> -		.init_phy = imx7d_pcie_init_phy,
>  		.enable_ref_clk = imx7d_pcie_enable_ref_clk,
>  		.core_reset = imx7d_pcie_core_reset,
>  	},
> -- 
> 2.37.1
> 

-- 
மணிவண்ணன் சதாசிவம்

