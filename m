Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37A60C36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 06:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JyLHBKKtBdcGeGPsMw3f6Qv4QssdQHR7Pid6EQwgQ8w=; b=v1OpT+7SPxkH2S2/AhfnAXWKVH
	/Z77NnuE/oxa3J2Z3Cuy9Moy3LgCXmNh58ZwQv2yWz1aJrg4rt5A0AYcNuPRurVkbtfwk5DdMBrgB
	jsWjt6YAFEHYz/QCRR/fBxvEnilBejzxRcTd/yj51lT/EL1TFOybXSi/wc4c7frKxHhvD6ZI01PSW
	ISGXnH9W0KxmKWrw/GDFtieh6OydNeBJE+3KBqLmutH/217au9t0E2gsvvYnlRgVCC61m5KYPDP+W
	9nuBnw4hpXWioHfPYvnoPKJK7AvbZkRaEP766CBQAS1hBkMW+Po0av5+4xugzCQDP4+ODwIQzb2tc
	x65IdNFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2P9Z-00000006JIr-3uXW;
	Wed, 09 Apr 2025 06:43:17 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2P3C-00000006IDA-0y7r
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 06:36:43 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-736e52948ebso7459440b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Apr 2025 23:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744180601; x=1744785401; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JyLHBKKtBdcGeGPsMw3f6Qv4QssdQHR7Pid6EQwgQ8w=;
        b=wodYQ9n6bqOjvt9T//OHfhcN5o1QvmE7sP+f1hCmyRSEefVzjpw2FGYFWVn1vu85hJ
         IwwcxpctK34NHDS4KwcVD3brCmxwFQ/tw8Mo/ltdiSn6vQzuYTv9/Hg2DNCjrFNZdkZs
         pk6yg5hgUte+a4474ietDVBg/HaBN8N3whm4OWfsVfl0vOdZ6wik5Z1ASVXINjI1l75O
         L5xPsU1rn6g7v5sq11DpJziuCI+0V2sp72r87P27ax9TiM0kBuf7/NuiOk/KRANYE0t1
         Ptq65kq+2akYCI3k3VD19nLj0tKo2xCn9hIAT9GI/yNFTVl4TuORAiLxLnI853txVH0F
         D/9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744180601; x=1744785401;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JyLHBKKtBdcGeGPsMw3f6Qv4QssdQHR7Pid6EQwgQ8w=;
        b=au6zFomNc5l9LAUefFsS9XG6A5VcMlf3sYjfm72087fyBEt53RQT2G6++b/RH7D9oA
         r22lvxuOtYPxiXa3C2R258DZHnkdSwXIVtTAIQ5sS+lMyMgW0jb1R/Nx3tHDkw0LlVZ9
         lxd+ov+q7Dy1a1A5IoU8vLXQxUoBmgPqIz/IyZ8YCRQSXZmXptRRzNDtaeApg09Thofv
         EIU0q8KSxaYLrQOoC6jhsIappkQKzlRQz4WRVAgZ968ivUmYsH1VuoxNP6c/KumPfHrF
         g48NkgwkfLc93uL40VB+wIDhOaBljiG9addPKz6L1SN5DrLY/jwBqQ8Bgx5GVPBvya+A
         IJDw==
X-Forwarded-Encrypted: i=1; AJvYcCX0UTUk27Gz43MKSdOMyUIjsz/EfyOw/AtJdL5kMEKyJgEPySOMK0qJMwydb2PoX6MwwpZTwbNbl9VUe5/rKCks@lists.infradead.org
X-Gm-Message-State: AOJu0YwybU9a4nu5XnvuRQ7m7ip9P/NZHOrpYRRM0zAZrL1Z/US9o27e
	M0nQLLgHZcBaLlEVg6UD/HQBgf729QXEu1OlvnQAMy7OiSJ1YXiK20VhiT0myg==
X-Gm-Gg: ASbGncu5DwMWtMveJS7zB2S4VKGNbsv+1mnlFyGYlaio0jfJGzOXEP7hWyd1hgEpjOT
	u9z9BQji128Ftl2S/U9XpVYp6mgy8rhFqiMB6Vxv47AxmkQNuAyAp/yeZCSxzL01HtByJ1Jc3aI
	KO2/6YpFIYgx38V18tFcezFZPNE4zTm/tC5XhkThiHoDRrkXjHOucwZZiztKCcU1u+YZI25+f8F
	aYKN6dItunhxd2BltZSooUS8CstJCnijm8iXzVp35bW05GXzh30aRpaBid+X9wruJH+8tHd1LZA
	rZKQz1zC1TdrxcMmzKxhNdgDjeSxmsMlah6SR7rgYtYcHpXzBWc=
X-Google-Smtp-Source: AGHT+IHsJVrpDdInYLAhJaCNmHpq2veRp8h4bN1zX1HiVkJrECPermHzrundQFT6RfXaFpJfsW7aQw==
X-Received: by 2002:a05:6a20:9f8e:b0:1f5:7eee:bb10 with SMTP id adf61e73a8af0-201591580c4mr2941076637.8.1744180601350;
        Tue, 08 Apr 2025 23:36:41 -0700 (PDT)
Received: from thinkpad ([120.56.198.53])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1e382a4sm510787b3a.96.2025.04.08.23.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 23:36:40 -0700 (PDT)
Date: Wed, 9 Apr 2025 12:06:35 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: lpieralisi@kernel.org, kw@linux.com, robh@kernel.org, 
	bhelgaas@google.com, vigneshr@ti.com, kishon@kernel.org, 18255117159@163.com, 
	cassel@kernel.org, wojciech.jasko-EXT@continental-corporation.com, 
	thomas.richard@bootlin.com, bwawrzyn@cisco.com, linux-pci@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, srk@ti.com
Subject: Re: [PATCH v2 4/4] PCI: j721e: Add support to build as a loadable
 module
Message-ID: <zsxnx7biwogov5dw5yiafkgk6tsrtspac75bjbrca5uevweaim@ly67hwfyk7qh>
References: <20250330083914.529222-1-s-vadapalli@ti.com>
 <20250330083914.529222-5-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250330083914.529222-5-s-vadapalli@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_233642_305479_4C0DC306 
X-CRM114-Status: GOOD (  25.19  )
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

On Sun, Mar 30, 2025 at 02:09:14PM +0530, Siddharth Vadapalli wrote:
> The 'pci-j721e.c' driver is the application/glue/wrapper driver for the
> Cadence PCIe Controllers on TI SoCs. Implement support for building it as a
> loadable module.
> 
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> ---
> 
> v1:
> https://lore.kernel.org/r/20250307103128.3287497-5-s-vadapalli@ti.com/
> Changes since v1:
> - Based on feedback from Thomas at:
>   https://lore.kernel.org/r/88b3ecbe-32b6-4310-afb9-da19a2d0506a@bootlin.com/
>   the "check" for a non-NULL "pcie-refclk" in j721e_pcie_remove() has been
>   dropped.
> 
> Regards,
> Siddharth.
> 
>  drivers/pci/controller/cadence/Kconfig     |  6 ++--
>  drivers/pci/controller/cadence/pci-j721e.c | 33 +++++++++++++++++++++-
>  2 files changed, 35 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pci/controller/cadence/Kconfig b/drivers/pci/controller/cadence/Kconfig
> index 82b58096eea0..72d7d264d6c3 100644
> --- a/drivers/pci/controller/cadence/Kconfig
> +++ b/drivers/pci/controller/cadence/Kconfig
> @@ -43,10 +43,10 @@ config PCIE_CADENCE_PLAT_EP
>  	  different vendors SoCs.
>  
>  config PCI_J721E
> -	bool
> +	tristate
>  
>  config PCI_J721E_HOST
> -	bool "TI J721E PCIe controller (host mode)"
> +	tristate "TI J721E PCIe controller (host mode)"
>  	depends on ARCH_K3 || COMPILE_TEST
>  	depends on OF
>  	select PCIE_CADENCE_HOST
> @@ -57,7 +57,7 @@ config PCI_J721E_HOST
>  	  core.
>  
>  config PCI_J721E_EP
> -	bool "TI J721E PCIe controller (endpoint mode)"
> +	tristate "TI J721E PCIe controller (endpoint mode)"
>  	depends on ARCH_K3 || COMPILE_TEST
>  	depends on OF
>  	depends on PCI_ENDPOINT
> diff --git a/drivers/pci/controller/cadence/pci-j721e.c b/drivers/pci/controller/cadence/pci-j721e.c
> index ef1cfdae33bb..8bffcd31729c 100644
> --- a/drivers/pci/controller/cadence/pci-j721e.c
> +++ b/drivers/pci/controller/cadence/pci-j721e.c
> @@ -15,6 +15,7 @@
>  #include <linux/irqchip/chained_irq.h>
>  #include <linux/irqdomain.h>
>  #include <linux/mfd/syscon.h>
> +#include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/pci.h>
>  #include <linux/platform_device.h>
> @@ -27,6 +28,7 @@
>  #define cdns_pcie_to_rc(p) container_of(p, struct cdns_pcie_rc, pcie)
>  
>  #define ENABLE_REG_SYS_2	0x108
> +#define ENABLE_CLR_REG_SYS_2	0x308
>  #define STATUS_REG_SYS_2	0x508
>  #define STATUS_CLR_REG_SYS_2	0x708
>  #define LINK_DOWN		BIT(1)
> @@ -116,6 +118,15 @@ static irqreturn_t j721e_pcie_link_irq_handler(int irq, void *priv)
>  	return IRQ_HANDLED;
>  }
>  
> +static void j721e_pcie_disable_link_irq(struct j721e_pcie *pcie)
> +{
> +	u32 reg;
> +
> +	reg = j721e_pcie_intd_readl(pcie, ENABLE_CLR_REG_SYS_2);
> +	reg |= pcie->linkdown_irq_regfield;
> +	j721e_pcie_intd_writel(pcie, ENABLE_CLR_REG_SYS_2, reg);
> +}
> +
>  static void j721e_pcie_config_link_irq(struct j721e_pcie *pcie)
>  {
>  	u32 reg;
> @@ -633,9 +644,25 @@ static void j721e_pcie_remove(struct platform_device *pdev)
>  	struct j721e_pcie *pcie = platform_get_drvdata(pdev);
>  	struct cdns_pcie *cdns_pcie = pcie->cdns_pcie;
>  	struct device *dev = &pdev->dev;
> +	struct cdns_pcie_ep *ep;
> +	struct cdns_pcie_rc *rc;
> +
> +	if (pcie->mode == PCI_MODE_RC) {
> +		rc = container_of(cdns_pcie, struct cdns_pcie_rc, pcie);
> +		cdns_pcie_host_disable(rc);
> +	} else {
> +		ep = container_of(cdns_pcie, struct cdns_pcie_ep, pcie);
> +		cdns_pcie_ep_disable(ep);
> +	}
> +
> +	if (pcie->reset_gpio) {
> +		msleep(PCIE_T_PVPERL_MS);

There is no point in adding a delay before PERST# assertion.

> +		gpiod_set_value_cansleep(pcie->reset_gpio, 1);

This is not PERST# assert, isn't it? Typo?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

