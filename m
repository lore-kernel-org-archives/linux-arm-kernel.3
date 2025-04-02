Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0D5FC28B20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 07:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zjR4lEGGyx3HdyMesa5h6gRayUig9bsMGHv5vZfbr1E=; b=bSvwl9bMUL9NbfbFtW+42p6YAp
	7gjpETg4xRaDFQi4DUAOYVdvB3wevVMu0IroEOaz4EMgguvMXUFhTDtxOv5IKM2Lc0HR/TOSnuCI2
	CB6IiJKRukiM/DHwFWzhY9T20mo3TKFicLvQToCytWdMT7oBp5JbxgAcyIxzWkJzhvyStfIlpyiSN
	TpWJ3zMA5u6Aqx8FwfdhxhhAJ6BY9TQDQnODTTTa1CzIgAT3NMEzaEw8cewwbTjwSdpshObHhmf43
	QhLJUsFUh5I7s3eU7MlIglXYamuRbzzrxvAABCbRc+9WswWm6MbiBYB7FPZ7MYHFitzuDEfDJ5OBc
	Hridxo2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzsap-00000005OLa-1528;
	Wed, 02 Apr 2025 07:32:59 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzsF4-00000005KE2-14X6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 07:10:31 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-225df540edcso11130245ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Apr 2025 00:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743577829; x=1744182629; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zjR4lEGGyx3HdyMesa5h6gRayUig9bsMGHv5vZfbr1E=;
        b=iglDu6fTXmf/85vnI2sx/p6OERWxeSgnXdgBj+0b1Z9NYfaJs1hCpxDPHaRX80Grtb
         ekjBDfaEeZLbJpjWEgHCdZmgm1/VSwNNY5WZF2IGI4HvotwX0O9QNe64ECdGC4pS+tFc
         IbUtjvp0MlzYJZHsIZIOoUJ3kJczzTVIIHhHs2X9Y+PPU0JpP9bSGDsz+8OOiZJ5Qt61
         KHFXdzXUFgdzLzUxPwxL8vVCeyKPP5g3dDk9H8s+IdUd4pLhaKfFred5hYBzWJpHYU5A
         AkUnL/qxKsO6coEn0tAaJqvvs2O64drl6WHdli7Zvgi7Xrzf9nQ7Sc094pLDy2kIvi0t
         2DJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743577829; x=1744182629;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zjR4lEGGyx3HdyMesa5h6gRayUig9bsMGHv5vZfbr1E=;
        b=epwCrfD3I5XgipgTzbHKNUE0Yx1mh76Xzf3lAa5kUIccrokn7aEKHPbmw/MAJEUP31
         jUQgO0gaxjnzN5QxfL9oXEfa6sFfqWaoG8KAasQbA9d3QokAtOVTpKupnkN/3nyNH/mI
         ajslkVScqabA1za3W1OGAgD0w8Wi7cYtqgpMP1irMKGCBVFllg7/fIUE1jv94YeJ7uI2
         +WFdeVH2K1HucQzpnlKyqgD474bJn7t5e6T3KnXN4qc/csewlzv9Clti+t5W+UN7UNXE
         6Pl7UuRIAhvu6H5a51MKFn2CmfqCABjvU9l6edHyiK1y0iQzUBeuRm+i70PD6uVA5tk3
         LXpA==
X-Forwarded-Encrypted: i=1; AJvYcCW1o/8QOmdPUJxu428yurgmpEYM9gMf3Q7kSjePHRvO6Y/3AdSVSAF76TMN6Yq4sB7zqfsGTbFQJ0sGLdc+5tLx@lists.infradead.org
X-Gm-Message-State: AOJu0YxhYOOhcjKpiycUJsBsd9g9fGdo1MYvujBa3IW5liYCFqxwAkNO
	5REE08eEDmPEUnEZp1edZAc+3q0rCL98IIQPFsromI9ZzoO3aWer6gKjXP2W3A==
X-Gm-Gg: ASbGnctsru4NDiAxQwyG9TBkgngr0akJWuIKDE+vLN/pTPzSwK2m4TJ6UZ5zOhX3j+h
	YkGmVpixUIajZyCV8fBAVG8gF5Brh7rExEOfynaXTrbHfI0N9VrqS9hz7JAkmgXL0LrgDi+ri4I
	Y6DQd4WJO+Iy+f9zKjjmXztMVVi/iKUQHGTckjR0BFC28XIyVyQsTEutBCR1JDnsTcycKOyNs2D
	iJtJsARzEYCMJKVuHBWFk6kEUUC1vHaQNSVFx3HB65EGBdCSxab1dZqXelKq/Y1tLSX+/t4zSoR
	r9qNXk+nQKObXGxTOGybu9L57rTxqY4dnJiEjlFpY40t/8g2Ydx/BXZN
X-Google-Smtp-Source: AGHT+IF2PkfJ6gvdatC+Ohrdk2DCIs4bJ4gvM262TiahqchaDp4ihwwIJoGbKxCJkUgJQO2cM8XLTw==
X-Received: by 2002:a05:6a00:130d:b0:737:cd8:2484 with SMTP id d2e1a72fcca58-739cac57712mr1314725b3a.6.1743577829272;
        Wed, 02 Apr 2025 00:10:29 -0700 (PDT)
Received: from thinkpad ([120.56.205.103])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739710cbd88sm10117652b3a.157.2025.04.02.00.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 00:10:28 -0700 (PDT)
Date: Wed, 2 Apr 2025 12:40:23 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org, 
	kw@linux.com, robh@kernel.org, bhelgaas@google.com, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/6] PCI: imx6: Add PLL clock lock check for i.MX95
 PCIe
Message-ID: <y3ys5ojt3cryklqibg4shznkjqije7bturs5ljkjyzbri5dhgu@jeo2mmyv7sci>
References: <20250328030213.1650990-1-hongxing.zhu@nxp.com>
 <20250328030213.1650990-6-hongxing.zhu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250328030213.1650990-6-hongxing.zhu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_001030_355726_CCB27109 
X-CRM114-Status: GOOD (  18.18  )
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

On Fri, Mar 28, 2025 at 11:02:12AM +0800, Richard Zhu wrote:
> Add PLL clock lock check for i.MX95 PCIe.
> 

What are the implications of not waiting for PLL lock? I guess clock
instability.

> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 28 +++++++++++++++++++++++++--
>  1 file changed, 26 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 35194b543551..40eeb02ffb5d 100644
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
> @@ -479,6 +482,23 @@ static void imx7d_pcie_wait_for_phy_pll_lock(struct imx_pcie *imx_pcie)
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
> +		return -ENODEV;

-ETIMEDOUT

- Mani

-- 
மணிவண்ணன் சதாசிவம்

