Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C043C3601B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 07:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sBLznZWhA5X82bZqkVVLBxnwT0YwdGpBuJ1F1bT4V+o=; b=SQ97uhnmpnMoOGEHS/53EFp12z
	cX/DnjVEXVKylIhp1GADb2tK7ejJrbJPkCNNw540yu70ByhS9VsozXuLyshN2XeCCgLILtI88nXzh
	DFDhpE2aDuAtgmp2kR/7/hu0FYRTDv7sn31riKchQbNGiT1PV0r/jBJUUm9QDfYDEkKnxqTeFXsTP
	uGGnW7bBD+lNhiRLejHek4aR64OnPVkch3IDOyTcPcQbkWO6vBrwPDmi2wjI7oAjT/0847IBX3jms
	vsEFd/afego79DMaNb4Sv/tz0cg6gWAvNX92sbjYiMZ6CA+06urRXultVV8XWWgYSeO80925yigCw
	aAq/9Ugw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzsYu-00000005NAs-0rTd;
	Wed, 02 Apr 2025 07:31:00 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzsDL-00000005JmN-1mRh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 07:08:44 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-227b828de00so111641595ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Apr 2025 00:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743577722; x=1744182522; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sBLznZWhA5X82bZqkVVLBxnwT0YwdGpBuJ1F1bT4V+o=;
        b=TZs78L29hc+HsNPd+lqpbb6e/7Rf1yziIijQPtwQb8lNks7dH45/JthVc8uo1BLDjG
         CUcgXyT6RNSV7Ew28Wh4FRDS3UR3mfqKmGjj5JWD9OhaSPD7H9Our9s6pSxLLTfdu9Ug
         lvE7+fDNzCiLrnXG10xeQHizuO6/fHcKZuZQV3tSTE7mMv8Uh/rnttPHoLww+fu1cU8E
         xBDMtjE5I42nItaGISPkfnw+KRyDTzN7f47/etZ1jPA7Z4Nm75WO/Wl/wkcsJNKn07Qr
         yB3Kc2kHDwjtI+5TN6T4Z2UHfG01vGNriKLqx4OZmVl4J+9xh7wMeEOfw4loOdGJvSXc
         E05Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743577722; x=1744182522;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sBLznZWhA5X82bZqkVVLBxnwT0YwdGpBuJ1F1bT4V+o=;
        b=aDv/v8VmL3DA5ZwwZCzq37X2JlUXMwmiO/H9FMvjgwJfpy1L/ZFPlaWhXz8jjHtGLh
         ICYv0jrDkxAkvD4uMuxVfRjTDdaXLpUxhV7OWDYobWA8F5+rM7mcBFQYm6NGJWYtnxE7
         PZFiDS+dqFkvNSD1emlWuPdyZFXy6xzSAQigR5UR+x0sji0/gY5Xtwol8jMHf2K8xNJT
         jQr/V6Vf38GQagvQFOO8BrR4w7/Ghdf0spTGyHSlMqfSkNyfn5+itkWCzcfz54XLYB0Q
         zYTU2wlqJ1/vtqmX62fku93wShhRrTyHh0Ht+BtpDDzBzsthVErDCBhxRdggOGFl9/ef
         3nDA==
X-Forwarded-Encrypted: i=1; AJvYcCWSbFhUV1PZREoSduZoOboFHnatctedVVTzNtQVb6yaXicWLs5OqxYFcaC6AGqr1sognWyJFoSbZ3qSz2DIDOyu@lists.infradead.org
X-Gm-Message-State: AOJu0Yzc7lcefyd0KSgiarnTB9p6fPsDdei1JJHd0zEye1E4ZUqi1Btd
	r814X24s9fzL+oEbJRay+LiegT+da4osUDvqOdeZweuS3YyK5lS5F8ZzMgVfRA==
X-Gm-Gg: ASbGnctHxjTpB/7jGxsOSiGc3MI5EkZH4nCNyFWZaMoMrsol9+2wi1vXXmdROxdUrqM
	wsuPxQGycMBpQvsQ2xokH+Z3c1ExcA46djD2IVqkdXEOMazjpVT70Ii+TwJT9dJp1IGpPlucAX1
	VAt84o5irqihqSiysoTx3irRYiRyWoZAyBoWs0ICyWxgDA6YoYqsLot64eyQ2NmH0G2RAWMagbL
	uAEn1+wZBdfMcBNJt2KO8r4W5IpEosIgTC6HJdHfC9UX3WetA036bhMfv8nlZK6pZkLhL84zXCM
	KFs9oS5TuLyRakOYq+EVLLVVbvjIiH6P9SW7FTXeTPDLQdTCeb9C9RVM
X-Google-Smtp-Source: AGHT+IESAdavvdZhZEPYi8YmhJREn3GzNckInuKrjE2kz7qwPxEfQH3XTifLJZjh/3yYARxtAKubSg==
X-Received: by 2002:a05:6a00:398f:b0:736:ab48:5b0 with SMTP id d2e1a72fcca58-739c78430demr1761550b3a.2.1743577722481;
        Wed, 02 Apr 2025 00:08:42 -0700 (PDT)
Received: from thinkpad ([120.56.205.103])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73970def428sm10236829b3a.32.2025.04.02.00.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 00:08:42 -0700 (PDT)
Date: Wed, 2 Apr 2025 12:38:35 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org, 
	kw@linux.com, robh@kernel.org, bhelgaas@google.com, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/6] PCI: imx6: Let i.MX95 PCIe compliance with 8GT/s
 Receiver Impedance ECN
Message-ID: <u2doi5nksovsxf75ahwdr3c3uixjk555mbwouvtblf5rruoicv@uvsdytcwoish>
References: <20250328030213.1650990-1-hongxing.zhu@nxp.com>
 <20250328030213.1650990-5-hongxing.zhu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250328030213.1650990-5-hongxing.zhu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_000843_503390_9A4EB534 
X-CRM114-Status: GOOD (  23.97  )
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

On Fri, Mar 28, 2025 at 11:02:11AM +0800, Richard Zhu wrote:
> ERR051586: Compliance with 8GT/s Receiver Impedance ECN.
> 
> The default value of GEN3_RELATED_OFF[GEN3_ZRXDC_NONCOMPL] is 1 which
> makes receiver non-compliant with the ZRX-DC parameter for 2.5 GT/s when
> operating at 8 GT/s or higher. It causes unnecessary timeout in L1.
> 
> Workaround: Program GEN3_RELATED_OFF[GEN3_ZRXDC_NONCOMPL] to 0.
> 
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 31 +++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 82402e52eff2..35194b543551 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -110,6 +110,7 @@ enum imx_pcie_variants {
>   */
>  #define IMX_PCIE_FLAG_BROKEN_SUSPEND		BIT(9)
>  #define IMX_PCIE_FLAG_HAS_LUT			BIT(10)
> +#define IMX_PCIE_FLAG_8GT_ECN_ERR051586		BIT(11)
>  
>  #define imx_check_flag(pci, val)	(pci->drvdata->flags & val)
>  
> @@ -1263,6 +1264,32 @@ static void imx_pcie_host_exit(struct dw_pcie_rp *pp)
>  		regulator_disable(imx_pcie->vpcie);
>  }
>  
> +static void imx_pcie_host_post_init(struct dw_pcie_rp *pp)
> +{
> +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> +	struct imx_pcie *imx_pcie = to_imx_pcie(pci);
> +	u32 val;
> +
> +	if (imx_pcie->drvdata->flags & IMX_PCIE_FLAG_8GT_ECN_ERR051586) {
> +		/*
> +		 * ERR051586: Compliance with 8GT/s Receiver Impedance ECN
> +		 *
> +		 * The default value of GEN3_RELATED_OFF[GEN3_ZRXDC_NONCOMPL]
> +		 * is 1 which makes receiver non-compliant with the ZRX-DC
> +		 * parameter for 2.5 GT/s when operating at 8 GT/s or higher.
> +		 * It causes unnecessary timeout in L1.
> +		 *
> +		 * Workaround: Program GEN3_RELATED_OFF[GEN3_ZRXDC_NONCOMPL]
> +		 * to 0.
> +		 */
> +		dw_pcie_dbi_ro_wr_en(pci);
> +		val = dw_pcie_readl_dbi(pci, GEN3_RELATED_OFF);
> +		val &= ~GEN3_RELATED_OFF_GEN3_ZRXDC_NONCOMPL;
> +		dw_pcie_writel_dbi(pci, GEN3_RELATED_OFF, val);
> +		dw_pcie_dbi_ro_wr_dis(pci);
> +	}
> +}
> +
>  static u64 imx_pcie_cpu_addr_fixup(struct dw_pcie *pcie, u64 cpu_addr)
>  {
>  	struct imx_pcie *imx_pcie = to_imx_pcie(pcie);
> @@ -1304,6 +1331,7 @@ static const struct dw_pcie_host_ops imx_pcie_host_ops = {
>  static const struct dw_pcie_host_ops imx_pcie_host_dw_pme_ops = {
>  	.init = imx_pcie_host_init,
>  	.deinit = imx_pcie_host_exit,
> +	.post_init = imx_pcie_host_post_init,
>  };
>  
>  static const struct dw_pcie_ops dw_pcie_ops = {
> @@ -1403,6 +1431,7 @@ static int imx_add_pcie_ep(struct imx_pcie *imx_pcie,
>  	struct device *dev = pci->dev;
>  
>  	imx_pcie_host_init(pp);
> +	imx_pcie_host_post_init(pp);
>  	ep = &pci->ep;
>  	ep->ops = &pcie_ep_ops;
>  
> @@ -1812,6 +1841,7 @@ static const struct imx_pcie_drvdata drvdata[] = {
>  		.variant = IMX95,
>  		.flags = IMX_PCIE_FLAG_HAS_SERDES |
>  			 IMX_PCIE_FLAG_HAS_LUT |
> +			 IMX_PCIE_FLAG_8GT_ECN_ERR051586 |
>  			 IMX_PCIE_FLAG_SUPPORTS_SUSPEND,
>  		.ltssm_off = IMX95_PE0_GEN_CTRL_3,
>  		.ltssm_mask = IMX95_PCIE_LTSSM_EN,
> @@ -1865,6 +1895,7 @@ static const struct imx_pcie_drvdata drvdata[] = {
>  	[IMX95_EP] = {
>  		.variant = IMX95_EP,
>  		.flags = IMX_PCIE_FLAG_HAS_SERDES |
> +			 IMX_PCIE_FLAG_8GT_ECN_ERR051586 |
>  			 IMX_PCIE_FLAG_SUPPORT_64BIT,
>  		.ltssm_off = IMX95_PE0_GEN_CTRL_3,
>  		.ltssm_mask = IMX95_PCIE_LTSSM_EN,
> -- 
> 2.37.1
> 

-- 
மணிவண்ணன் சதாசிவம்

