Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 740EDD68BCE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 18:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s9XJvqo1TjVxClmTuPUa2mnZBMZRL0LlNGR2vRqPsWA=; b=jxwNSqKOP7S8SP2HtSNY1euZo0
	Kdr4pIqh4rdiKKkTRjATlySmcp+VZBcmTkDlYbR62XRA5R3cZRQxoS71x4OmhJVZtbNZorJOSoM1T
	AYHurqObwmoie/KcFgOvESYFUOjFW6mQCWc9VO9K054gn/rS5FpleXmX/rc55J8ssxdeJ49t70MpO
	qKcHsFDwrp1rY4b6ZQz2DWDx+qmZto/u8dW5cWMljo2uYqZScHpHnAQ+Q+0yHsCKWrzmnR/W7wxPU
	2rqSVs6hg2SFgZ/y3fhjXoHE9Kgnv4Uof4rmV3UDFdb2ZH7bEDRqs6BsGRxmE+2nQDxrx9eMRL9kh
	EL1QltSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tC11O-00000003h5H-3QH2;
	Fri, 15 Nov 2024 18:26:18 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tC10R-00000003gpp-3zH4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 18:25:21 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-20cdb889222so10689185ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Nov 2024 10:25:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731695119; x=1732299919; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s9XJvqo1TjVxClmTuPUa2mnZBMZRL0LlNGR2vRqPsWA=;
        b=mwtAn/j3JmM9Jus+l4VPzz8zgErurCrO6vz1iYH9XVG2gY0+hi6oRiaF31RmQjLZvc
         pAaRudiDrAuGgLIzV5zyYKDrFQo7vYbXlJPOKCWKyHaEbZhDyItI6WVnYGUHFd4cwCvA
         NTdYhZ2wmvKwI4bM7RZxCiq7/gpiFd6trKBM1awEy0hetsGooPcEXgJARGNml57FNDbT
         i0UUif3Q2Ox3t2ELrEwyjS4vFQb8jZMpQTrj28kqP5Ez5WJ7HdVQM0kXHujK4p0AQwWu
         IOe8Y8oVaZnsMV+htgnsXW5BxnK6DIDU8aJpcMu2KN3CL1/yLrcRk0YDGaJFwDsx2HvH
         ZRxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731695119; x=1732299919;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s9XJvqo1TjVxClmTuPUa2mnZBMZRL0LlNGR2vRqPsWA=;
        b=Wk91zUrIMpGGk9bQ3vuNQUYPNnUUFfrxxi30cQ/ew8nkPXAzEqxoaqhwLUpJvv/Ilq
         Olt5ePOp3OYCvp0dr0m66NkwSuRQ7H4cPn1p7karopq5PRsPwPBp1E9CfbOqDIfXKqtQ
         +y9WCq+0/Th11MfJ2udTN1LQw5+/CO6frqGv4bMT45cjn/OgKbiRdLgWzKifSj/v5ghZ
         DZyr3viQq2bE8XAFfbMvYydxikNfXxicUVMZobnfpwLKw+pEsy4iUpOy+R9iPbL3EdSn
         eL/hs+A3vSfFSywFUxfpOizExJdVpJji3VVwZn4DkUWGmiJaMc08u9l8cBq6BoW8OqE9
         fPxg==
X-Forwarded-Encrypted: i=1; AJvYcCXDoHko3+vqwKBmC+K3lxWOsnj/YTZ/TMu+cZgef18e8Uohl1ACZNEXyQtYeXH0Tl0y/49ycgTuCN0vYPfCqyp9@lists.infradead.org
X-Gm-Message-State: AOJu0YzS+upKi1Niu4/IKlq+aMWGJ1/rVk9MSEyosbv+z6jH9acU4rp/
	wMgTs1erRrPkHZJZeVUcjNXU82eE5Ab8yPT3BbvrbJGJV8RgvlZrIqOsA6csxg==
X-Google-Smtp-Source: AGHT+IG8xYEUyxbkvzwvpJ9n8KCZIy6/ye3xoYrVPeMJNXB6RnHN6free7fMoWUZKt6qptIgJECrgA==
X-Received: by 2002:a17:902:dacd:b0:20e:986a:6e72 with SMTP id d9443c01a7336-211d0d92195mr50180975ad.30.1731695118780;
        Fri, 15 Nov 2024 10:25:18 -0800 (PST)
Received: from thinkpad ([117.193.215.93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211d0f61670sm14893285ad.281.2024.11.15.10.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 10:25:18 -0800 (PST)
Date: Fri, 15 Nov 2024 23:55:10 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
Subject: Re: [PATCH v7 4/7] PCI: imx6: Remove cpu_addr_fixup()
Message-ID: <20241115182510.zyaopwz4phl2szzi@thinkpad>
References: <20241029-pci_fixup_addr-v7-0-8310dc24fb7c@nxp.com>
 <20241029-pci_fixup_addr-v7-4-8310dc24fb7c@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241029-pci_fixup_addr-v7-4-8310dc24fb7c@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_102519_991924_09A067C8 
X-CRM114-Status: GOOD (  20.76  )
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

On Tue, Oct 29, 2024 at 12:36:37PM -0400, Frank Li wrote:
> Remove cpu_addr_fixup() because dwc common driver already handle address
> translate.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Great work!

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
> Change from v2 to v7
> - none
> Change from v1 to v2
> - set using_dtbus_info true
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 22 ++--------------------
>  1 file changed, 2 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 808d1f1054173..533905b3942a1 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -81,7 +81,6 @@ enum imx_pcie_variants {
>  #define IMX_PCIE_FLAG_HAS_PHY_RESET		BIT(5)
>  #define IMX_PCIE_FLAG_HAS_SERDES		BIT(6)
>  #define IMX_PCIE_FLAG_SUPPORT_64BIT		BIT(7)
> -#define IMX_PCIE_FLAG_CPU_ADDR_FIXUP		BIT(8)
>  
>  #define imx_check_flag(pci, val)	(pci->drvdata->flags & val)
>  
> @@ -1012,22 +1011,6 @@ static void imx_pcie_host_exit(struct dw_pcie_rp *pp)
>  		regulator_disable(imx_pcie->vpcie);
>  }
>  
> -static u64 imx_pcie_cpu_addr_fixup(struct dw_pcie *pcie, u64 cpu_addr)
> -{
> -	struct imx_pcie *imx_pcie = to_imx_pcie(pcie);
> -	struct dw_pcie_rp *pp = &pcie->pp;
> -	struct resource_entry *entry;
> -
> -	if (!(imx_pcie->drvdata->flags & IMX_PCIE_FLAG_CPU_ADDR_FIXUP))
> -		return cpu_addr;
> -
> -	entry = resource_list_first_type(&pp->bridge->windows, IORESOURCE_MEM);
> -	if (!entry)
> -		return cpu_addr;
> -
> -	return cpu_addr - entry->offset;
> -}
> -
>  static const struct dw_pcie_host_ops imx_pcie_host_ops = {
>  	.init = imx_pcie_host_init,
>  	.deinit = imx_pcie_host_exit,
> @@ -1036,7 +1019,6 @@ static const struct dw_pcie_host_ops imx_pcie_host_ops = {
>  static const struct dw_pcie_ops dw_pcie_ops = {
>  	.start_link = imx_pcie_start_link,
>  	.stop_link = imx_pcie_stop_link,
> -	.cpu_addr_fixup = imx_pcie_cpu_addr_fixup,
>  };
>  
>  static void imx_pcie_ep_init(struct dw_pcie_ep *ep)
> @@ -1446,6 +1428,7 @@ static int imx_pcie_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> +	pci->using_dtbus_info = true;
>  	if (imx_pcie->drvdata->mode == DW_PCIE_EP_TYPE) {
>  		ret = imx_add_pcie_ep(imx_pcie, pdev);
>  		if (ret < 0)
> @@ -1585,8 +1568,7 @@ static const struct imx_pcie_drvdata drvdata[] = {
>  	},
>  	[IMX8Q] = {
>  		.variant = IMX8Q,
> -		.flags = IMX_PCIE_FLAG_HAS_PHYDRV |
> -			 IMX_PCIE_FLAG_CPU_ADDR_FIXUP,
> +		.flags = IMX_PCIE_FLAG_HAS_PHYDRV,
>  		.clk_names = imx8q_clks,
>  		.clks_cnt = ARRAY_SIZE(imx8q_clks),
>  	},
> 
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

