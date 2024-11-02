Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B949E67807
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 17:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aTkV1XhxJ09OcLM/uZ+nNnIbHFyaFXru4on3d7CL7wo=; b=YfNOL5Vj96Fk+uLxuCVojHDkZU
	uxssB0OV562Gtqow4j8RXPdlVSOUgV+CszR5tLyGgH35n7WMM/nwQvjss5QyuD+X528jQwOK0fa98
	OEkJypy6mlSP6AhaJX+VGqPw/mdnFItwIgMVHpRHY5CYALthy2HU33tsq4l7yD4jrMpgOfSCDcNAy
	ZJEdi6HvB28L2ijPnkQUsUdRllawnyNbqsP3/K8piXkZVOb/AwHJMrQA6ac1ViAiiWBoaF5Dpnb2A
	h60kvbCvYueyz+xc51OyuvgKcT5rhwXB36WQrn0oV9rN3yKY2nOIRnaSyd//psJUZc+xcrOGFwYuu
	qcaQ3QcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7HoH-0000000A6Yx-2H7v;
	Sat, 02 Nov 2024 17:21:13 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7Hmb-0000000A6PH-1H7O
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 Nov 2024 17:19:30 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-71e5a1c9071so2571974b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Nov 2024 10:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730567967; x=1731172767; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aTkV1XhxJ09OcLM/uZ+nNnIbHFyaFXru4on3d7CL7wo=;
        b=FJBEHS/uX5TgWU0bWKScayl+DKiRIywgWJIz7G+cB5WjG3S70wpRjx2GJ6lExqmpS2
         IOqUsQhQ2YhLI/yF/jjbbNLZT50WsgH31LtHrFvIijO0ClVageNcbRMzEpUj80waR6CR
         n4UxGVpSy89r4gixww+c4rM+a96ZYM7Gbob860wm1TZyekERifYAzFYmNqL9v4jk3+xD
         EltqU60/qkvztsiSeeIg9cq8Ew99VziU0fqPOUdBdfjfr8XKDygw6knu37zSYsKpEJcV
         DvOQSwDKCCFaAnPjS5rISfa1vF/DQfUnXixqFtNP1abK40jOwONDgbfLbJ6mPy1b60kC
         xFSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730567967; x=1731172767;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aTkV1XhxJ09OcLM/uZ+nNnIbHFyaFXru4on3d7CL7wo=;
        b=XelvtTwN2DAvd2ixKc8fv4K0PAnenSQCd7Yg3nxkn6CBHxB+27XoabbRiEPhOfQ/Mo
         aNHCfU43F2k54eRodVvuee30Vg4pA4J4gZzy0upSHIV1loBeTI5kMRZ2T7GFOE4GQfFv
         Da4DHSsUoQMgA/hKUcHeJSS6mg5v6BY2F0Xd7oL/yJcSClCK/W4blVo9IcqFTDgz09Gt
         4FV0KfBWzR92Cu3IOwfaDOWnC54IejiyeL2OXPKv2gHwTXE+K+qUwH7K4namd8sYUwcM
         MJNuNUTHH6GZSeBJCgzM58H4SNrVLAEJFFHfCL8t7eG1nzFgQ1IZxMawnTKzdfUFelFy
         AFAg==
X-Forwarded-Encrypted: i=1; AJvYcCVhxrZIlRUysiyDw0WDYOlsxb6T/NUku1HSXkAovJjYMwnG353k1Vn4xH4/ZQzl3kyWwzn/R5lhh4CCx47Up/MD@lists.infradead.org
X-Gm-Message-State: AOJu0YyzjpjSZn8/7TwoI496pOuYaORpkkpKC9nFwzFzjZu7ry/jFy43
	dQbnDENrvdW9uS6a6CUEwWMFGqdMR3vBgQ3/y/hWVUrnphu6x1b5Y9YIWmz0kQ==
X-Google-Smtp-Source: AGHT+IFi1cxAsGDs0F8dOgqbrOdXX0s1cA0y/1pfvpYVJz1F9v26FArl0PbmywggQPgDHROhLbLBZA==
X-Received: by 2002:a05:6a00:811:b0:71e:50ef:20f3 with SMTP id d2e1a72fcca58-720ab4c705fmr20397800b3a.28.1730567967567;
        Sat, 02 Nov 2024 10:19:27 -0700 (PDT)
Received: from thinkpad ([220.158.156.209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc1e5722sm4335321b3a.71.2024.11.02.10.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Nov 2024 10:19:27 -0700 (PDT)
Date: Sat, 2 Nov 2024 22:49:20 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pci@vger.kernel.org, ryder.lee@mediatek.com,
	jianjun.wang@mediatek.com, lpieralisi@kernel.org, kw@linux.com,
	robh@kernel.org, bhelgaas@google.com, matthias.bgg@gmail.com,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
	fshao@chromium.org
Subject: Re: [PATCH v3 1/2] PCI: mediatek-gen3: Add support for setting
 max-link-speed limit
Message-ID: <20241102171920.epjf3j4pkbb5u4xq@thinkpad>
References: <20240918081307.51264-1-angelogioacchino.delregno@collabora.com>
 <20240918081307.51264-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240918081307.51264-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_101929_397774_05F5E1CE 
X-CRM114-Status: GOOD (  29.47  )
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

On Wed, Sep 18, 2024 at 10:13:06AM +0200, AngeloGioacchino Del Regno wrote:
> Add support for respecting the max-link-speed devicetree property,
> forcing a maximum speed (Gen) for a PCI-Express port.
> 
> Since the MediaTek PCIe Gen3 controllers also expose the maximum
> supported link speed in the PCIE_BASE_CFG register, if property
> max-link-speed is specified in devicetree, validate it against the
> controller capabilities and proceed setting the limitations only
> if the wanted Gen is lower than the maximum one that is supported
> by the controller itself (otherwise it makes no sense!).
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/pci/controller/pcie-mediatek-gen3.c | 55 ++++++++++++++++++++-
>  1 file changed, 53 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
> index 66ce4b5d309b..8d4b045633da 100644
> --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> @@ -28,7 +28,11 @@
>  
>  #include "../pci.h"
>  
> +#define PCIE_BASE_CFG_REG		0x14
> +#define PCIE_BASE_CFG_SPEED		GENMASK(15, 8)
> +
>  #define PCIE_SETTING_REG		0x80
> +#define PCIE_SETTING_GEN_SUPPORT	GENMASK(14, 12)
>  #define PCIE_PCI_IDS_1			0x9c
>  #define PCI_CLASS(class)		(class << 8)
>  #define PCIE_RC_MODE			BIT(0)
> @@ -125,6 +129,9 @@
>  
>  struct mtk_gen3_pcie;
>  
> +#define PCIE_CONF_LINK2_CTL_STS		0x10b0
> +#define PCIE_CONF_LINK2_LCR2_LINK_SPEED	GENMASK(3, 0)
> +
>  /**
>   * struct mtk_gen3_pcie_pdata - differentiate between host generations
>   * @power_up: pcie power_up callback
> @@ -160,6 +167,7 @@ struct mtk_msi_set {
>   * @phy: PHY controller block
>   * @clks: PCIe clocks
>   * @num_clks: PCIe clocks count for this port
> + * @max_link_speed: Maximum link speed (PCIe Gen) for this port
>   * @irq: PCIe controller interrupt number
>   * @saved_irq_state: IRQ enable state saved at suspend time
>   * @irq_lock: lock protecting IRQ register access
> @@ -180,6 +188,7 @@ struct mtk_gen3_pcie {
>  	struct phy *phy;
>  	struct clk_bulk_data *clks;
>  	int num_clks;
> +	u8 max_link_speed;
>  
>  	int irq;
>  	u32 saved_irq_state;
> @@ -381,11 +390,27 @@ static int mtk_pcie_startup_port(struct mtk_gen3_pcie *pcie)
>  	int err;
>  	u32 val;
>  
> -	/* Set as RC mode */
> +	/* Set as RC mode and set controller PCIe Gen speed restriction, if any */
>  	val = readl_relaxed(pcie->base + PCIE_SETTING_REG);
>  	val |= PCIE_RC_MODE;
> +	if (pcie->max_link_speed) {
> +		val &= ~PCIE_SETTING_GEN_SUPPORT;
> +
> +		/* Can enable link speed support only from Gen2 onwards */
> +		if (pcie->max_link_speed >= 2)
> +			val |= FIELD_PREP(PCIE_SETTING_GEN_SUPPORT,
> +					  GENMASK(pcie->max_link_speed - 2, 0));
> +	}
>  	writel_relaxed(val, pcie->base + PCIE_SETTING_REG);
>  
> +	/* Set Link Control 2 (LNKCTL2) speed restriction, if any */
> +	if (pcie->max_link_speed) {
> +		val = readl_relaxed(pcie->base + PCIE_CONF_LINK2_CTL_STS);
> +		val &= ~PCIE_CONF_LINK2_LCR2_LINK_SPEED;
> +		val |= FIELD_PREP(PCIE_CONF_LINK2_LCR2_LINK_SPEED, pcie->max_link_speed);
> +		writel_relaxed(val, pcie->base + PCIE_CONF_LINK2_CTL_STS);
> +	}
> +
>  	/* Set class code */
>  	val = readl_relaxed(pcie->base + PCIE_PCI_IDS_1);
>  	val &= ~GENMASK(31, 8);
> @@ -1004,9 +1029,21 @@ static void mtk_pcie_power_down(struct mtk_gen3_pcie *pcie)
>  	reset_control_bulk_assert(pcie->soc->phy_resets.num_resets, pcie->phy_resets);
>  }
>  
> +static int mtk_pcie_get_controller_max_link_speed(struct mtk_gen3_pcie *pcie)
> +{
> +	u32 val;
> +	int ret;
> +
> +	val = readl_relaxed(pcie->base + PCIE_BASE_CFG_REG);
> +	val = FIELD_GET(PCIE_BASE_CFG_SPEED, val);
> +	ret = fls(val);
> +
> +	return ret > 0 ? ret : -EINVAL;
> +}
> +
>  static int mtk_pcie_setup(struct mtk_gen3_pcie *pcie)
>  {
> -	int err;
> +	int err, max_speed;
>  
>  	err = mtk_pcie_parse_port(pcie);
>  	if (err)
> @@ -1031,6 +1068,20 @@ static int mtk_pcie_setup(struct mtk_gen3_pcie *pcie)
>  	if (err)
>  		return err;
>  
> +	err = of_pci_get_max_link_speed(pcie->dev->of_node);
> +	if (err > 0) {
> +		/* Get the maximum speed supported by the controller */
> +		max_speed = mtk_pcie_get_controller_max_link_speed(pcie);
> +
> +		/* Set max_link_speed only if the controller supports it */
> +		if (max_speed >= 0 && max_speed <= err) {
> +			pcie->max_link_speed = err;
> +			dev_dbg(pcie->dev,
> +				"Max controller link speed Gen%d, override to Gen%u",
> +				max_speed, pcie->max_link_speed);
> +		}
> +	}
> +
>  	/* Try link up */
>  	err = mtk_pcie_startup_port(pcie);
>  	if (err)
> -- 
> 2.46.0
> 
> 

-- 
மணிவண்ணன் சதாசிவம்

