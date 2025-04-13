Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1721C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Apr 2025 15:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y72/tqUmhTX4OF/q+yEQ8DxW/l3SBJIjmbILZthaGB8=; b=hZJzug3U8iEYLlp7l5noMFrFUB
	jAS0YcnAMdIELJirhecIiK+o+l1ox3qNQf+/uihrxghVah9dhSnqn6R8N7qfnf3bf2tKeB+6Ym6E0
	uwwbnoytbdNd4Ip8w/NRaXmi1A9pl3PYpaFGCHcArMsZLf1CPPiKawUrsAoi1CRWdcHhFGlWuLhoL
	DW++GG1xe9IXBAXgK/PCaJLMe9E4NfAWSV+iJP8jNG7s2zB6tlIezGS+J6l/Gt5cMGGIj1i9sW1A2
	EM85JRBFt4LR4lQ3NDOmEDQRfDKcI9WTiQYQW79UUc1rNHrSDZJErMdYcUCBKlxFGS0pZNbEPXTXX
	ExbjhJow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3zMo-0000000HKht-2U5b;
	Sun, 13 Apr 2025 15:35:30 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3zKy-0000000HKZf-1rdY
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Apr 2025 15:33:37 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-736b0c68092so2941214b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Apr 2025 08:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744558415; x=1745163215; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Y72/tqUmhTX4OF/q+yEQ8DxW/l3SBJIjmbILZthaGB8=;
        b=SYb1xZlSuz4YnugEBA17szzUlpSCTMOh2nEAez+5CbXlMGoZxjz1BI/hTbCiXC3xYl
         Wsev5LPsg3eeTYh9pWSEOmDmWpgQ4edXMJvTHY6M7Q1+IKqy3lJEbpU0W6KjODLRNWa6
         xcIWXlDAg5VRf7jRGlQfM/J10DYWUxRPsut0NDxyUtngfisQQToSVI9tQ+W/DMaqrRmL
         tRoSMaQZOgMiVpr3kGE+2AXIHfVPRrjCtkpvc5yserlX7Rcs8hVQB36m7dOes/zlLpS3
         uELUWvvo6cjbkxJtfsq13M/V6QFcVQyKJGTJp3dVUKMp7oRjEkJx/JKfTolaqAhpYcgM
         izfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744558415; x=1745163215;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y72/tqUmhTX4OF/q+yEQ8DxW/l3SBJIjmbILZthaGB8=;
        b=sds9kVT3xkKhaV1p2NcVdk1wyGQMCGQrAVIQ74DpoLFcK1/DJ4YRDqy1UgSH3Tcp02
         +juP4sRj0ZgDPJGlxluX67sc8fXeuSkAG8Prj4d8YHD8YheEQfGfi7q6ShUlbdg4FAPn
         5ET7LQZAbv9t5WzSY/HMnffxTZuMl4uRGjo78Wb9fU6wi6IJN32zDB+6NhEmYSlSYEe+
         vKprh8wxgNnYTWducw5XHnhpF5c8m4vmjz55Pc0A3SdXUf3yUY1mDc3EydGzJDsLUAGf
         t/Ue2Ws0LDCzQQFQcjt4+NjO0YyQUi+zoZrRXnm6IqBenOfRUtZEe/rVlJmkJvHsmbWb
         tVOw==
X-Forwarded-Encrypted: i=1; AJvYcCX/l+jnAcl0auAeJLr3CUHTKSYTZQ9VQvhtrOw6EIQ25yTwXP98Xq9HGF9gBsYm1qoMhmO8dAVMPML+NptVY5cM@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2pj7kAN554pMn7VYXquVjzYeKf07HHW4gEZAjOi4XjPZ5FmW6
	fkPO6Zj/Uo5EYqRuAXJ1nQgDIKm88WhKkV/iQKaJ8KV02sF+wbi0tfaNtW6oJg==
X-Gm-Gg: ASbGncvSHwzL4meZDDR8KrxTPzt+EG+TrW/i8mPkhkUBBSrRcn8RHToYoHnklZu4VOi
	AnXeooD4FKyL6INvINKUP5WALxFaymwYa56I9KD1BLve5TbSshbEeOeal/4PSBWlcxSCsqb944A
	S/vJvJtpZn4RHGFSab31sWD08g3dau/UTgRIaFXvbpT7SGsEk4ZCLUwLKwD7/89LiW/V2UmOTRk
	5REhet/mxLZd5tbVACBgh0ECxpNUn2P8Mg6+Z5IXw69/cif68kGmoBQb11tQ2LuURNTHBsnELO9
	wgoEnQaWtlwTtjLABkf1T4WnWDpIxzfLlYlV3XuazlsqksApyOh2
X-Google-Smtp-Source: AGHT+IGvabAafKDG9hWtMQ/mt33loVlPQcrjfAy+WuQVWFVLw+b1d0XyCzCWqgYy+BHZJDGXRxcaiA==
X-Received: by 2002:a05:6a00:a89:b0:730:4c55:4fdf with SMTP id d2e1a72fcca58-73bd11e6d55mr12724724b3a.7.1744558415257;
        Sun, 13 Apr 2025 08:33:35 -0700 (PDT)
Received: from thinkpad ([120.60.137.231])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd22f883asm5237044b3a.107.2025.04.13.08.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 08:33:34 -0700 (PDT)
Date: Sun, 13 Apr 2025 21:03:29 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org, 
	kw@linux.com, robh@kernel.org, bhelgaas@google.com, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 6/7] PCI: imx6: Add PLL clock lock check for i.MX95
 PCIe
Message-ID: <uqrhqkmtp4yudmt4ys635vg3gh5sibhevu7gjtbbbizuheuk45@lhxywqhtbpak>
References: <20250408025930.1863551-1-hongxing.zhu@nxp.com>
 <20250408025930.1863551-7-hongxing.zhu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250408025930.1863551-7-hongxing.zhu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250413_083336_490818_57F54BB3 
X-CRM114-Status: GOOD (  20.75  )
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

On Tue, Apr 08, 2025 at 10:59:29AM +0800, Richard Zhu wrote:
> Add PLL clock lock check for i.MX95 PCIe.
> 
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 28 +++++++++++++++++++++++++--
>  1 file changed, 26 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 7dcc9d88740d..c1d128ec255d 100644
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
> +		return -ETIMEDOUT;
> +	}
> +
> +	return 0;
> +}
> +
>  static int imx_setup_phy_mpll(struct imx_pcie *imx_pcie)
>  {
>  	unsigned long phy_rate = 0;
> @@ -824,6 +844,8 @@ static int imx95_pcie_core_reset(struct imx_pcie *imx_pcie, bool assert)
>  		regmap_read_bypassed(imx_pcie->iomuxc_gpr, IMX95_PCIE_RST_CTRL,
>  				     &val);
>  		udelay(10);
> +	} else {
> +		return imx95_pcie_wait_for_phy_pll_lock(imx_pcie);

Is this PLL lock related to COLD_RESET? It doesn't look like it. If unrelated,
it should be called wherever required. imx95_pcie_core_reset() is supposed to
only assert/deassert the COLD_RESET.

If related, please explain how.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

