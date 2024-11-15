Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39B61D6DDD5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 06:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+9X/wxgCiPevQR8azxljXcXglwxyvUBHBH4k0NcW95s=; b=UEB12y4Ycz9TfYGVtrXc4YXU6/
	2/h7wFAUoFKDijQbLfXXEaH1nmVhnut9FAULLVfd1mnSVuBUlxGAZSU7oYUPq2c0pJ18TMYsCaeJU
	ObPYzUYuSGa189Eml+cJiuv0XFm9FOnVNQc4g3SQb8P4bNXKjRBfelAD+U5DDhAiuEDjbAQcaAVQx
	iL1tTTjN61YBXpna/vqeboEcroBZIUxBGbRp/ySQeptpvsXyXOwhFoowj6IqiiAkp7rFf+91f9ujF
	Ax2a5QvAnYaXpIZNfgmEXqYmqhwinHE9Nz0gyspvj5u5l7/cRbOwtp3BhSnN0Ei1sJcxFtLjRyvOu
	ZJpwgi0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBq23-00000001orl-0BZg;
	Fri, 15 Nov 2024 06:42:15 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBq17-00000001ogT-49zU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 06:41:19 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-20c9978a221so16734185ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Nov 2024 22:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731652877; x=1732257677; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+9X/wxgCiPevQR8azxljXcXglwxyvUBHBH4k0NcW95s=;
        b=LnbCqoEJT/GutKHSdRGO8pq1/k5ctMXVvcchG+reexAHZW+emKM/y7JnyGBExsRL/+
         wKADbsEuIKi6qfuUch+VzZJoVHKnl1eTm+uGT7HarZmFjWjK7scdgQWUiacIngWI0ztc
         cwHIcueipKC8gm3OCCp1oDej9W45APUR2IahTdB6HWkm/HitcHSpUpK+jxGbXSRKPqY8
         tFcK+sE/iJJcMQis5jlkpemq3KipY+YI8FgLnGUe5up0Heew/Cfw7Mhamvmn0XCDTgtb
         l7H2sVYxy2ySObTESdeLPQsmfWsPwBAsBHKar7MIJ/l4Nw14g3dcnJvMl4mH9vQkSQxR
         lsbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731652877; x=1732257677;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+9X/wxgCiPevQR8azxljXcXglwxyvUBHBH4k0NcW95s=;
        b=AUAhtFdH+3Y0TaF5PeJSmnCO4SrzhUTSuyMZxm79fh+83QVuRgpc9qklGXyiBNmhHU
         CpPGHA1debPx2Ho3txXZU8wyNvfOUUoi+BAKyL6fLH4TcIThd0iJhW0qS74XUlMg58m0
         D2u2jBlRhfrK3gj6vOSYj+h9/j3ijf7wT5uQ0FH3SeyOrIDdTdumXWGQNxhlGqCqIYZx
         NczMyU7E/DpnGLDPWkUfI7H+XIelea23eZefYzTg1BMAdkn1vxso/CKTyn8c/1EIhr7u
         DpyfdvSVNcu/t6xHJJjo9jAl37V6P96fF61OBrtmsGJ2DHn02UWZgOAhHkPfayesRe3g
         F8PA==
X-Forwarded-Encrypted: i=1; AJvYcCU6+F1+vhglVN7S4A83HLB8H9/fINziI05r0FGV46Rp5LJQEPokKpxc0qIB2A4UwA++qmBlP7SXywwFP91bbBhz@lists.infradead.org
X-Gm-Message-State: AOJu0Yyhh638tylrBK3GxmOeGapATQKhY5yuEPmUFHG0l2ZkUchK0PRb
	mQ8gl1nhdJSiC3dCdnlR1/ZSqb0FmgYQjHxsJ2YejRGNMEzb6jgFraMDVr8NaQ==
X-Google-Smtp-Source: AGHT+IGabkTqfzJ7F61xnkcjI95zLPKfJGfkK+pvHWTH/TvMDmJ1L9QNKaKVIJTm7qh/u3tDNf6Mrw==
X-Received: by 2002:a17:902:f544:b0:20c:f27f:fbf with SMTP id d9443c01a7336-211d0d7687fmr23670135ad.25.1731652877101;
        Thu, 14 Nov 2024 22:41:17 -0800 (PST)
Received: from thinkpad ([117.193.208.47])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211d0f56e10sm6129835ad.242.2024.11.14.22.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 22:41:16 -0800 (PST)
Date: Fri, 15 Nov 2024 12:11:06 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: l.stach@pengutronix.de, bhelgaas@google.com, lpieralisi@kernel.org,
	kw@linux.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, frank.li@nxp.com,
	s.hauer@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
	kernel@pengutronix.de, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 03/10] PCI: imx6: Fetch dbi2 and iATU base addesses
 from DT
Message-ID: <20241115064106.iwrorgimt6yenalx@thinkpad>
References: <20241101070610.1267391-1-hongxing.zhu@nxp.com>
 <20241101070610.1267391-4-hongxing.zhu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241101070610.1267391-4-hongxing.zhu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_224118_033171_F71E8270 
X-CRM114-Status: GOOD (  20.92  )
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

On Fri, Nov 01, 2024 at 03:06:03PM +0800, Richard Zhu wrote:
> Since dbi2 and atu regs are added for i.MX8M PCIes. Fetch the dbi2 and
> iATU base addresses from DT directly, and remove the useless codes.
> 

It'd be useful to mention where the base addresses were extraced. Like by the
DWC common driver.

> Upsteam dts's have not enabled EP function. So no function broken for
> old upsteam's dtb.
> 
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 20 --------------------
>  1 file changed, 20 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index bc8567677a67..462decd1d589 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -1115,7 +1115,6 @@ static int imx_add_pcie_ep(struct imx_pcie *imx_pcie,
>  			   struct platform_device *pdev)
>  {
>  	int ret;
> -	unsigned int pcie_dbi2_offset;
>  	struct dw_pcie_ep *ep;
>  	struct dw_pcie *pci = imx_pcie->pci;
>  	struct dw_pcie_rp *pp = &pci->pp;
> @@ -1125,25 +1124,6 @@ static int imx_add_pcie_ep(struct imx_pcie *imx_pcie,
>  	ep = &pci->ep;
>  	ep->ops = &pcie_ep_ops;
>  
> -	switch (imx_pcie->drvdata->variant) {
> -	case IMX8MQ_EP:
> -	case IMX8MM_EP:
> -	case IMX8MP_EP:
> -		pcie_dbi2_offset = SZ_1M;
> -		break;
> -	default:
> -		pcie_dbi2_offset = SZ_4K;
> -		break;
> -	}
> -
> -	pci->dbi_base2 = pci->dbi_base + pcie_dbi2_offset;
> -
> -	/*
> -	 * FIXME: Ideally, dbi2 base address should come from DT. But since only IMX95 is defining
> -	 * "dbi2" in DT, "dbi_base2" is set to NULL here for that platform alone so that the DWC
> -	 * core code can fetch that from DT. But once all platform DTs were fixed, this and the
> -	 * above "dbi_base2" setting should be removed.
> -	 */
>  	if (device_property_match_string(dev, "reg-names", "dbi2") >= 0)
>  		pci->dbi_base2 = NULL;
>  
> -- 
> 2.37.1
> 

-- 
மணிவண்ணன் சதாசிவம்

