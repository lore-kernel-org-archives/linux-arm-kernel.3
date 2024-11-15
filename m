Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C774D6DDDA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 07:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+1Dz/OYJenLwT42NvbYgc5y6jl1Qc/DY1ubS7Ysj0ds=; b=UX83fsJi43UN3Z3Z+jKNmSupgo
	1x6047a3HVpa6UpnjjAO2wx+wBD5q2XZRnsVZc0NQB9YVXlSiYlAsAL3IbgI3ruatIJoJcqsxHDSG
	ls2IGuCU+Pc20pu7pKjkb5zpjvHNvx0MtsbAVCi760hvGo2pPCl96XS01VQ8reo4HMkmwlCKEZ8g5
	uKTzyEhwXBUnC+rTjAV3av+TuN/5WkT6TIVvK9A4BBazZZ741RIkBD8Rc3gR8dX20F2qr8D7bFTa1
	+XiNbB2Nya+xVwqhm38E5oLr0s1ukS4XT6FQ4ZG26clyDjKoYFGwpiEy2qzsdBqw41lOezlGoL5tT
	+mhpPN+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBqWs-00000001tH4-3Mz5;
	Fri, 15 Nov 2024 07:14:06 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBqVx-00000001t9u-1wNR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 07:13:10 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-211c1c144f5so12147375ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Nov 2024 23:13:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731654788; x=1732259588; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+1Dz/OYJenLwT42NvbYgc5y6jl1Qc/DY1ubS7Ysj0ds=;
        b=tLbFLJphrvu4K1b3y9PFh6+oUkdVGsTqDnWJflSfbzUfYxrPaAHoFyNcXztwC3WaIZ
         kDzBq9Ee1r7uTzsjmlQueWAO6L8mrOIvsh2YlULzqbV1cwLW3o38lRaGsyZBQTcnalT9
         6FpTypepm3tqWznvk4fyHcsh4hcoMhDUw/lYPTV9nY5sgTX8NYRUtn+3Q4wjIu+2v5bd
         LHieA16piCx7u0bxNq6nzAT2/uQJQiD5drrMrou6FFBsByjwXVGJJml3aj+swdy7Wf/E
         4xgPWEm4pJXiw2a4ye22DPamZkZ8iucBoheWsDvmw8E+UNLJNRpDU1I06e4w3S6BWRA6
         L5iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731654788; x=1732259588;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+1Dz/OYJenLwT42NvbYgc5y6jl1Qc/DY1ubS7Ysj0ds=;
        b=NbvzwgnMm2YBHEHOVtQ8jb1sE3fjJyk3FWcgupGAjG2hesnzzX0D01Qifo5U6Z+I2z
         qLU7hbK92I4CxVZMThMKEAE7P8WLsqgRaFrUbc8/grN8TkIlg1zf0lVOsYcDpTw7mUJ7
         Muuak6n3H7Ieth0YeDDghukYPEMh8exM2nIqGNwZPcI4xuT9YiCGvRg/KXyO+3eA2XDb
         aP0XJI7RhaVnDwUvEfG5LKbY3p6gB7SschGrcc7Y4W5YBcPD4GwpdUhGOeaF3Dzi5Ed8
         C4RkuwgMjst33EvnaeTTdDnCitaX5TnlRCou+Z2zlR5/a/fLGOHo+nno7M2DgIsPmnjR
         7hFA==
X-Forwarded-Encrypted: i=1; AJvYcCX2P/w6KqbpyGcwelMXkkd/cPmH2o1Ah+HrAj5M+/oO/Caiq9YhWjFuSrADyunDomrbpPgi8NzuGvpcJ+Hfhmtx@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5reH/Ic1JulOf7nFF9puPstw9Hu4cKr5BGY6lb2BtsuuqBFZa
	RfO+FH8heBSuV2BSxKvwo/0x/EosihxOkmWfCbq2iX9LsRXeiQdO33XrYvr02A==
X-Google-Smtp-Source: AGHT+IGXzZZGlt+G0O4qFrwjzRuyPJCE0eMc4484n4Is2j1zfs167pZc2pf+Scw0xdwwWEA3jG14tw==
X-Received: by 2002:a17:903:2282:b0:20c:7196:a1e9 with SMTP id d9443c01a7336-211d06f44acmr34058055ad.13.1731654788551;
        Thu, 14 Nov 2024 23:13:08 -0800 (PST)
Received: from thinkpad ([117.193.208.47])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211d0f56dd3sm6529845ad.263.2024.11.14.23.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 23:13:08 -0800 (PST)
Date: Fri, 15 Nov 2024 12:42:57 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: l.stach@pengutronix.de, bhelgaas@google.com, lpieralisi@kernel.org,
	kw@linux.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, frank.li@nxp.com,
	s.hauer@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
	kernel@pengutronix.de, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 09/10] PCI: imx6: Add i.MX8MQ i.MX8Q and i.MX95 PCIe
 PM support
Message-ID: <20241115071257.ihticiqzmyn5c3lu@thinkpad>
References: <20241101070610.1267391-1-hongxing.zhu@nxp.com>
 <20241101070610.1267391-10-hongxing.zhu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241101070610.1267391-10-hongxing.zhu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_231309_511734_4B41817A 
X-CRM114-Status: GOOD (  16.29  )
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

On Fri, Nov 01, 2024 at 03:06:09PM +0800, Richard Zhu wrote:

In subject, do not use "PCIe PM" as it could imply "PCI-PM". Just use "PM"
instead. Prefix already mentioned that it is a PCIe driver.

> Add iMX8MQ i.MX8Q and i.MX95 PCIe suspend/resume support.
> 
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 3c074cc2605f..cf2a9918537e 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -1498,7 +1498,8 @@ static const struct imx_pcie_drvdata drvdata[] = {
>  	[IMX8MQ] = {
>  		.variant = IMX8MQ,
>  		.flags = IMX_PCIE_FLAG_HAS_APP_RESET |
> -			 IMX_PCIE_FLAG_HAS_PHY_RESET,
> +			 IMX_PCIE_FLAG_HAS_PHY_RESET |
> +			 IMX_PCIE_FLAG_SUPPORTS_SUSPEND,
>  		.gpr = "fsl,imx8mq-iomuxc-gpr",
>  		.clk_names = imx8mq_clks,
>  		.clks_cnt = ARRAY_SIZE(imx8mq_clks),
> @@ -1536,7 +1537,8 @@ static const struct imx_pcie_drvdata drvdata[] = {
>  	[IMX8Q] = {
>  		.variant = IMX8Q,
>  		.flags = IMX_PCIE_FLAG_HAS_PHYDRV |
> -			 IMX_PCIE_FLAG_CPU_ADDR_FIXUP,
> +			 IMX_PCIE_FLAG_CPU_ADDR_FIXUP |
> +			 IMX_PCIE_FLAG_SUPPORTS_SUSPEND,
>  		.clk_names = imx8q_clks,
>  		.clks_cnt = ARRAY_SIZE(imx8q_clks),
>  	},
> -- 
> 2.37.1
> 

-- 
மணிவண்ணன் சதாசிவம்

