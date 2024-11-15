Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1801FD6DDD7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 06:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3ASYot59pnFaxW/GHMyz8Y0KBxe3S70/tiXkzx5jQ+Y=; b=iSfSLSMiYYA5SbazDMGssH6iqe
	ByC4HfqMJAepyVsMQ9eugGExG067AOZc2M2QG9fKBnuhNs+HASx8l5zbJpqY9mz0EKMMeAkEJ6yNg
	g6FJ630hiZ5MnCqi83a4G/scg8RfhSHOnI+ZB0gL0TmnLhDunadocykjjNH6wtj9g+ypk9pOrLJ7h
	5D/pZ56lgFpA4KW44GHH7I2agAXr+2f++d8JXvGCGn1/yAoSaQXn00yrkhTpKUCUQJcg2aDr2Na9+
	LqNekBYvUKACTPVKHkVSwR+PkOkd60JaeoC9aHbNgsA6FtSFVQU7wiqIG17mPzG1VQsIIzNbGx7Z7
	pHzR3dgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBpzK-00000001oJq-17X3;
	Fri, 15 Nov 2024 06:39:26 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBpyO-00000001o7M-0fxA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 06:38:29 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-20caccadbeeso4093475ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Nov 2024 22:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731652707; x=1732257507; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3ASYot59pnFaxW/GHMyz8Y0KBxe3S70/tiXkzx5jQ+Y=;
        b=fqrk/zWe1skddyEM7xX9Do4Q1p7+mTaThzdtBlaiUu0BNlUh4iw92dsBBGkzgvc4Tl
         HAD9NW4zTreWGMuyTWL+xLjLbv/Javu2QmilV/LRxNII4CKGjkmtShCjDtXlt+E1oqZS
         qyb/gPPOdVPewNjHyB3r3uXQd64/8JrQWPiPvwYdMgES1bQ7Z6Bh+NrRPoS5KtBh+4PC
         uF1cCSmlYJiPoLWF7+g5uIXcupJ5hlMOKdbjACreelykAaa5cpDEZzeGGXubdCXHdGcf
         ojbqIXeJVvbEBSjQ8jfhgBr+YVziJfZWJX91UM3DSQEZlPvNRUUhj5plLXIePR7cbQgW
         ebcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731652707; x=1732257507;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3ASYot59pnFaxW/GHMyz8Y0KBxe3S70/tiXkzx5jQ+Y=;
        b=WRTtaZ5aBRbH7QD8+4cGHWM77uZY/GmAbqGuW69VES+wThdqKPjhhJcOoMjSGuwTVm
         ndNxLK5NDXPdXmtwNc9Kk6IHJD4MjYbCQPfpgn904Zgom5Jo8Z26ELFafrc2gRFfD+57
         WL+cXSCkoI+HHJufUiSmV5P/9wUv+rQ3ewuTfBcFd0NVOPWyPcwpYw/SeAR+PpDv0mRt
         m55mLk4mV/pDE+xQny7PvURy8xCFDZS1uy5wNSU3k3IEOrabeGCScA5rDzkPaU/7DlIc
         /a8AhZB+CEuzKCm+y6/G5l9X74FPVU9G49ZwHbDHpp/JTLuuYih+rOAVBb8pJYGVtJ4y
         F1ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkp+q/B8c0N7Z10ImVmxji+ETzSHTUwHQhLsQau6rFq1nyjKZ/3SJM7ZeJrprlJaKBoYtUG18rNTWa+B4PGxdN@lists.infradead.org
X-Gm-Message-State: AOJu0Ywgd4syLzm1v7gIK2AFtIWDUCoHo5cM/JgmGSYSwXzOqhuALAZs
	Ul8Zu/vFKsqvquh9pwn2d+TbFNOO9mYSZQLch5P9IYhUqozZbrT/V9rBXyNvuw==
X-Google-Smtp-Source: AGHT+IHmK/K9KtNXF8MAKgzWlqq1Xbvw08TMatRS4xdoCN6jQH4adnR3wRNRA42mwN6r478Ju/K5qw==
X-Received: by 2002:a17:902:ecc1:b0:20c:c631:d81f with SMTP id d9443c01a7336-211d0d71690mr17005295ad.21.1731652707497;
        Thu, 14 Nov 2024 22:38:27 -0800 (PST)
Received: from thinkpad ([117.193.208.47])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211d0ec7bc7sm6089015ad.68.2024.11.14.22.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 22:38:27 -0800 (PST)
Date: Fri, 15 Nov 2024 12:08:16 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: l.stach@pengutronix.de, bhelgaas@google.com, lpieralisi@kernel.org,
	kw@linux.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, frank.li@nxp.com,
	s.hauer@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
	kernel@pengutronix.de, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 02/10] PCI: imx6: Add ref clock for i.MX95 PCIe
Message-ID: <20241115063816.xpjqgm2j34enhe7s@thinkpad>
References: <20241101070610.1267391-1-hongxing.zhu@nxp.com>
 <20241101070610.1267391-3-hongxing.zhu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241101070610.1267391-3-hongxing.zhu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_223828_207406_E91D00B9 
X-CRM114-Status: GOOD (  22.72  )
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

On Fri, Nov 01, 2024 at 03:06:02PM +0800, Richard Zhu wrote:
> Add "ref" clock to enable reference clock. To avoid the DT
> compatibility, i.MX95 REF clock might be optional.

Your wording is not correct. Perhaps you wanted to say, "To avoid breaking DT
backwards compatibility"?

> Replace the
> devm_clk_bulk_get() by devm_clk_bulk_get_optional() to fetch
> i.MX95 PCIe optional clocks in driver.
> 
> If use external clock, ref clock should point to external reference.
> 
> If use internal clock, CREF_EN in LAST_TO_REG controls reference output,
> which implement in drivers/clk/imx/clk-imx95-blk-ctl.c.
> 
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 808d1f105417..bc8567677a67 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -82,6 +82,7 @@ enum imx_pcie_variants {
>  #define IMX_PCIE_FLAG_HAS_SERDES		BIT(6)
>  #define IMX_PCIE_FLAG_SUPPORT_64BIT		BIT(7)
>  #define IMX_PCIE_FLAG_CPU_ADDR_FIXUP		BIT(8)
> +#define IMX_PCIE_FLAG_CUSTOM_PME_TURNOFF	BIT(9)
>  
>  #define imx_check_flag(pci, val)	(pci->drvdata->flags & val)
>  
> @@ -98,6 +99,7 @@ struct imx_pcie_drvdata {
>  	const char *gpr;
>  	const char * const *clk_names;
>  	const u32 clks_cnt;
> +	const u32 clks_optional_cnt;
>  	const u32 ltssm_off;
>  	const u32 ltssm_mask;
>  	const u32 mode_off[IMX_PCIE_MAX_INSTANCES];
> @@ -1278,9 +1280,8 @@ static int imx_pcie_probe(struct platform_device *pdev)
>  	struct device_node *np;
>  	struct resource *dbi_base;
>  	struct device_node *node = dev->of_node;
> -	int ret;
> +	int ret, i, req_cnt;
>  	u16 val;
> -	int i;
>  
>  	imx_pcie = devm_kzalloc(dev, sizeof(*imx_pcie), GFP_KERNEL);
>  	if (!imx_pcie)
> @@ -1330,7 +1331,10 @@ static int imx_pcie_probe(struct platform_device *pdev)
>  		imx_pcie->clks[i].id = imx_pcie->drvdata->clk_names[i];
>  
>  	/* Fetch clocks */
> -	ret = devm_clk_bulk_get(dev, imx_pcie->drvdata->clks_cnt, imx_pcie->clks);
> +	req_cnt = imx_pcie->drvdata->clks_cnt - imx_pcie->drvdata->clks_optional_cnt;
> +	ret = devm_clk_bulk_get(dev, req_cnt, imx_pcie->clks);
> +	ret |= devm_clk_bulk_get_optional(dev, imx_pcie->drvdata->clks_optional_cnt,
> +					  imx_pcie->clks + req_cnt);

Why do you need to use 'clk_bulk' API to get a single reference clock? Just use
devm_clk_get_optional(dev, "ref")

And who is going to supply the reference clock in the absence of this clockn in
DT?

- Mani

>  	if (ret)
>  		return ret;
>  
> @@ -1480,6 +1484,7 @@ static const char * const imx8mm_clks[] = {"pcie_bus", "pcie", "pcie_aux"};
>  static const char * const imx8mq_clks[] = {"pcie_bus", "pcie", "pcie_phy", "pcie_aux"};
>  static const char * const imx6sx_clks[] = {"pcie_bus", "pcie", "pcie_phy", "pcie_inbound_axi"};
>  static const char * const imx8q_clks[] = {"mstr", "slv", "dbi"};
> +static const char * const imx95_clks[] = {"pcie_bus", "pcie", "pcie_phy", "pcie_aux", "ref"};
>  
>  static const struct imx_pcie_drvdata drvdata[] = {
>  	[IMX6Q] = {
> @@ -1592,9 +1597,11 @@ static const struct imx_pcie_drvdata drvdata[] = {
>  	},
>  	[IMX95] = {
>  		.variant = IMX95,
> -		.flags = IMX_PCIE_FLAG_HAS_SERDES,
> -		.clk_names = imx8mq_clks,
> -		.clks_cnt = ARRAY_SIZE(imx8mq_clks),
> +		.flags = IMX_PCIE_FLAG_HAS_SERDES |
> +			 IMX_PCIE_FLAG_SUPPORTS_SUSPEND,
> +		.clk_names = imx95_clks,
> +		.clks_cnt = ARRAY_SIZE(imx95_clks),
> +		.clks_optional_cnt = 1,
>  		.ltssm_off = IMX95_PE0_GEN_CTRL_3,
>  		.ltssm_mask = IMX95_PCIE_LTSSM_EN,
>  		.mode_off[0]  = IMX95_PE0_GEN_CTRL_1,
> -- 
> 2.37.1
> 

-- 
மணிவண்ணன் சதாசிவம்

