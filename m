Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6361AC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 17:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nL6dqOeouWGje3PfIFhRZYZKH+4zhi7g+fExpzSbfis=; b=sbFAfG1A7mVsk5H36t4/dG1Xpn
	yNJYvDh7WgWE9TxeQKqv9t/4C874b164pabTtB1s5zlewQHBt3ji3rc3I5thtGASXXD17azirNuxk
	S8GKwP1F76HbTByo2KSyuMVKP2cBRLSoCjP+GdOCqfOFRqiX4iIouoJ9sz58kzs2npNFAvrqNdeAa
	D5PHOmYevgFe8iJKqUAaJqoPFpfBS3OYT5wtodp91ukDkC+6FdrzYXpuLO7P7ZjpTUEzPWPYeg9aC
	DwMxVrcdhoYrP3ZyGqTExSSlvRWCpQSNfK/WL790Ugit+kPoo7I7SJawr5u+r5yW1dSD9tUFWAJfl
	jt7UIF0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5pKQ-0000000HBug-00yb;
	Fri, 18 Apr 2025 17:16:38 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5pBe-0000000H9V9-0qUm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 17:07:35 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-7399838db7fso2100343b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Apr 2025 10:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744996053; x=1745600853; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nL6dqOeouWGje3PfIFhRZYZKH+4zhi7g+fExpzSbfis=;
        b=WrCzV8zvOBWatkX+QiWy0pSG8Vf4fV2ky89FXOd55lE9MiKs6kPKokdguMaYoauejs
         8ntklrodAMBQr2YPDyf/XwWD+4+Ak6tCj9a0spfCe/MzH52vobwF6mOdedwIIGHqKsLj
         KuYxzqYKzjSj1dXdcy/W7y5NNAz2ORb1cfhmjSHK8pEUwf8GZcDKXt/pmKz8BCd4L99K
         2OLc6Md7zHcUWeQDByzu+nfOIQO8ye4Kq27q/AG+HXOlvIBiIFYXhpdvun/2/c3IdXqE
         431zITIJDZLIK8Zj8bTPJ4H8cU3L6AR794sTtFE5TINo4Z10upg7axIV1DOaLGA3WRiU
         EOUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744996053; x=1745600853;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nL6dqOeouWGje3PfIFhRZYZKH+4zhi7g+fExpzSbfis=;
        b=FSBjBFtt6aR6KNudfyNHmhMm52v3L57ge735wbvRPFkCpLL2xTdTQJSx6Wl4FWDO3Y
         oHQ7PRG5gSrvYu3r9eTJPRPpJbUpL29CVwHAmTSUqXW88ujRjCS8uFlsJAgPlOVIeA+7
         1Dm+AHphcO7iRzemhP126arrmnxtvmFTXzwOhNm458LWUagEMJFSbZ/95CbhwSj7s8wh
         lnor7KJU9fZ8vwadjHwC0WxjgGwO9AiOMX5iT80WNHQb8D7FdH4loTxKzpLOCa0M3T1U
         ztyOwDcWvEx+3ZDxxcdTxWUwteVqs1jnckW9WhlVEx/mOiauDRSvNveVd6ePFG5f3q6p
         x18w==
X-Forwarded-Encrypted: i=1; AJvYcCWmNCSYWCeqZhkOaKFX1jIU0+u8JCa7Y4WR96EZDPFdPgFmxOMfeolIipkZqFR9os78iaiR4M1wyzKc+MwCQAv7@lists.infradead.org
X-Gm-Message-State: AOJu0Yzso7oKvT4clvWl04K7FqRnEJVjI/nikY39FIWGc/U33+7HVDb1
	PLV41vndp0xRc6IZeDWZXUAdBE6hJHjZeC4iSChByk6Hwl2udkSEQB1JcAhNYg==
X-Gm-Gg: ASbGncvC+ovBaXlUEgvKpXXf42IZ/1rVE+zEdIMe7kHwR4AV5eH8HevkMi4ezSl6rWT
	yx7GYfKL3PDIhReS6TbFuCmP16Wi52Rh3moPyPpDLFikFjgUgLr1lII+1bgaMX3oih+oIReQ7hm
	/AfW8EAsiN27PZe5IdDbMlluMrVteRAKuazkt3eBIUxl4gZVEDX4EoDHPAO2gI2os2Rkl9GqcZu
	9/t9JCZIG5yQ7ViEuMMuKbii/39DDPDRqBmgk117tFQ0qwDNVHOvR0mNCd+UMKUgh/zv4UuSl0y
	bIf1cGqB7lXxQJQ/IpxQ0BWaLIOgOumrb1Sjl+S9u7glubGYryA=
X-Google-Smtp-Source: AGHT+IFd8ioW+E3Ktz8zI+ikNBXvvgjozvxKBov9f/KWyoLC0PTaG7crTd+nou7TAO4V0w0FxgrPdg==
X-Received: by 2002:a05:6a00:3c76:b0:732:706c:c4ff with SMTP id d2e1a72fcca58-73dbe601c73mr4561736b3a.7.1744996052724;
        Fri, 18 Apr 2025 10:07:32 -0700 (PDT)
Received: from thinkpad ([36.255.17.199])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfaee68bsm1880459b3a.175.2025.04.18.10.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 10:07:32 -0700 (PDT)
Date: Fri, 18 Apr 2025 22:37:26 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: lpieralisi@kernel.org, kw@linux.com, robh@kernel.org, 
	bhelgaas@google.com, vigneshr@ti.com, kishon@kernel.org, 18255117159@163.com, 
	cassel@kernel.org, wojciech.jasko-EXT@continental-corporation.com, 
	thomas.richard@bootlin.com, bwawrzyn@cisco.com, linux-pci@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, srk@ti.com
Subject: Re: [PATCH v4 4/4] PCI: j721e: Add support to build as a loadable
 module
Message-ID: <gqeraipycu4blfye77oyaysxatz757r7lsw72kq26smj4dwxoj@cytxxhqjrnno>
References: <20250417124408.2752248-1-s-vadapalli@ti.com>
 <20250417124408.2752248-5-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250417124408.2752248-5-s-vadapalli@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_100734_252288_1D0F9B45 
X-CRM114-Status: GOOD (  24.83  )
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

On Thu, Apr 17, 2025 at 06:14:08PM +0530, Siddharth Vadapalli wrote:
> The 'pci-j721e.c' driver is the application/glue/wrapper driver for the
> Cadence PCIe Controllers on TI SoCs. Implement support for building it as a
> loadable module.
> 
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>

One nitpick below. But no need to respin just for this. Hopefully, this can be
changed while applying the series.

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

> ---
> 
> v3 patch is at:
> https://lore.kernel.org/r/20250410104426.463453-5-s-vadapalli@ti.com/
> Changes since v3:
> - In the fourth patch of this series, the polarity for PERST# assert in
>   the driver's .remove callback has been fixed based on Mani's feedback at
>   https://lore.kernel.org/r/6bi5gul3sqvycmkf6cwokkvownjffaf2tkonjlefo2d7cautwx@uhfexzgz3okp/
> 
> Regards,
> Siddharth.
> 
>  drivers/pci/controller/cadence/Kconfig     |  6 ++---
>  drivers/pci/controller/cadence/pci-j721e.c | 31 +++++++++++++++++++++-
>  2 files changed, 33 insertions(+), 4 deletions(-)
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
> index ef1cfdae33bb..8a73a4d382d1 100644
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
> @@ -633,9 +644,23 @@ static void j721e_pcie_remove(struct platform_device *pdev)
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
> +	if (pcie->reset_gpio)

All 'gpiod_*' APIs accept NULL descriptors. So you don't necessarily need the
check here.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

