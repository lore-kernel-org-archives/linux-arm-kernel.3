Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBDCDC36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 13:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Z/P0CPp4Wyk9Y9pljrYeXYyD77+BeU3yy6/CkSnjI4=; b=tw2imIP/MNOK/4Q0C8CPpFwB3o
	ZsVJa/pBqa7RiPEG0Y6LJ+9V/pw2AXOnqhVGq4q332wWUbpXGq5G32RhyKWX86OTzWt+Q0hJf5KI2
	SvpKe7mARFdwE5tMhWjcISRDEg766RJjf0SS2GoFlKrEOUT0wEjWvRtn6CN83sxvR9G7B1AuUpuVl
	PWv82zbnOOc9u+wjZKElFnedRIfYTyQlX7fHJDnGzKXb/7PjvfRvb0yrUH6JRrrhrig9VCKTm4gjM
	KU7H0Yq0lRF7RqkqL/kkcUzeS1QRny5O0Mpt79unYsaKIaR5+hQ7yBiciQxOJ/miaAsmE0dnuoy+Y
	xyDOsIeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twheZ-00000003DVl-40Dy;
	Mon, 24 Mar 2025 13:15:43 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twhV0-00000003CHx-2mLm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 13:05:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742821551; x=1774357551;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=vJfBDHCxyVQns/5+3y7fqVp7wz/PXkviSSt+13f9mwU=;
  b=V7Az1ZBsT7N2lSf6YbaD75X1G8YSfNsvGLqO5+E8KXwnMXnGxBjP24jp
   V+mXuIncHtvJrxuD+eRkpA3gPhDSu+KvnWBRoWehWI6IjAorvbyq4KYQm
   8g7HW/dZ2nmYnAgZ3omJ5kt28sEei6gCzD/ySRsLNKzk3y0xGFYkzVYzS
   NKADIo5zm+u6qyuUaXF+7f/6c1qe01adlB7cXS8adJ1AYYbivVRNUTMdr
   C0+NcIsgvfyTa9/c93Mo6pfK0kByovq/4B5e2KhuaY2cEx6L/Fgww6Vnh
   dSCTc4mrMzNWvjUcMkip2fIfKBQ35UvhRWBrl0aStRHwXotjqD0dBU7xm
   A==;
X-CSE-ConnectionGUID: X2sAYTSuRCa4iDuaNdOJ7g==
X-CSE-MsgGUID: tndrKGsgTHCz6nXiUx9iHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="54229798"
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; 
   d="scan'208";a="54229798"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2025 06:05:50 -0700
X-CSE-ConnectionGUID: hPJMrlbWRneuwdv8CFBM3g==
X-CSE-MsgGUID: mLbWTvKnSjK5/IiIFlZfFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; 
   d="scan'208";a="129107999"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.251])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2025 06:05:44 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 24 Mar 2025 15:05:41 +0200 (EET)
To: Richard Zhu <hongxing.zhu@nxp.com>
cc: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org, 
    kw@linux.com, manivannan.sadhasivam@linaro.org, robh@kernel.org, 
    bhelgaas@google.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
    kernel@pengutronix.de, festevam@gmail.com, linux-pci@vger.kernel.org, 
    linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 1/5] PCI: imx6: Start link directly when workaround
 is not required
In-Reply-To: <20250324062647.1891896-2-hongxing.zhu@nxp.com>
Message-ID: <73205114-bdb5-2995-e00a-7df7046ea91d@linux.intel.com>
References: <20250324062647.1891896-1-hongxing.zhu@nxp.com> <20250324062647.1891896-2-hongxing.zhu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_060550_735749_76CAA99D 
X-CRM114-Status: GOOD (  25.50  )
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

On Mon, 24 Mar 2025, Richard Zhu wrote:

> The current link setup procedure is more like one workaround to detect
> the device behind PCIe switches on some i.MX6 platforms.
> 
> To describe more accurately, change the flag name from
> IMX_PCIE_FLAG_IMX_SPEED_CHANGE to IMX_PCIE_FLAG_SPEED_CHANGE_WORKAROUND.
> 
> Then, start PCIe link directly when this flag is not set on i.MX7 or
> later paltforms to simple and speed up link training.
> 
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 34 +++++++++++----------------
>  1 file changed, 14 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index c1f7904e3600..aa5c3f235995 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -91,7 +91,7 @@ enum imx_pcie_variants {
>  };
>  
>  #define IMX_PCIE_FLAG_IMX_PHY			BIT(0)
> -#define IMX_PCIE_FLAG_IMX_SPEED_CHANGE		BIT(1)
> +#define IMX_PCIE_FLAG_SPEED_CHANGE_WORDAROUND	BIT(1)

WORDaround ?? :-)

-- 
 i.

>  #define IMX_PCIE_FLAG_SUPPORTS_SUSPEND		BIT(2)
>  #define IMX_PCIE_FLAG_HAS_PHYDRV		BIT(3)
>  #define IMX_PCIE_FLAG_HAS_APP_RESET		BIT(4)
> @@ -860,6 +860,12 @@ static int imx_pcie_start_link(struct dw_pcie *pci)
>  	u32 tmp;
>  	int ret;
>  
> +	if (!(imx_pcie->drvdata->flags &
> +	    IMX_PCIE_FLAG_SPEED_CHANGE_WORDAROUND)) {
> +		imx_pcie_ltssm_enable(dev);
> +		return 0;
> +	}
> +
>  	/*
>  	 * Force Gen1 operation when starting the link.  In case the link is
>  	 * started in Gen2 mode, there is a possibility the devices on the
> @@ -896,22 +902,10 @@ static int imx_pcie_start_link(struct dw_pcie *pci)
>  		dw_pcie_writel_dbi(pci, PCIE_LINK_WIDTH_SPEED_CONTROL, tmp);
>  		dw_pcie_dbi_ro_wr_dis(pci);
>  
> -		if (imx_pcie->drvdata->flags &
> -		    IMX_PCIE_FLAG_IMX_SPEED_CHANGE) {
> -
> -			/*
> -			 * On i.MX7, DIRECT_SPEED_CHANGE behaves differently
> -			 * from i.MX6 family when no link speed transition
> -			 * occurs and we go Gen1 -> yep, Gen1. The difference
> -			 * is that, in such case, it will not be cleared by HW
> -			 * which will cause the following code to report false
> -			 * failure.
> -			 */
> -			ret = imx_pcie_wait_for_speed_change(imx_pcie);
> -			if (ret) {
> -				dev_err(dev, "Failed to bring link up!\n");
> -				goto err_reset_phy;
> -			}
> +		ret = imx_pcie_wait_for_speed_change(imx_pcie);
> +		if (ret) {
> +			dev_err(dev, "Failed to bring link up!\n");
> +			goto err_reset_phy;
>  		}
>  
>  		/* Make sure link training is finished as well! */
> @@ -1665,7 +1659,7 @@ static const struct imx_pcie_drvdata drvdata[] = {
>  	[IMX6Q] = {
>  		.variant = IMX6Q,
>  		.flags = IMX_PCIE_FLAG_IMX_PHY |
> -			 IMX_PCIE_FLAG_IMX_SPEED_CHANGE |
> +			 IMX_PCIE_FLAG_SPEED_CHANGE_WORDAROUND |
>  			 IMX_PCIE_FLAG_BROKEN_SUSPEND |
>  			 IMX_PCIE_FLAG_SUPPORTS_SUSPEND,
>  		.dbi_length = 0x200,
> @@ -1681,7 +1675,7 @@ static const struct imx_pcie_drvdata drvdata[] = {
>  	[IMX6SX] = {
>  		.variant = IMX6SX,
>  		.flags = IMX_PCIE_FLAG_IMX_PHY |
> -			 IMX_PCIE_FLAG_IMX_SPEED_CHANGE |
> +			 IMX_PCIE_FLAG_SPEED_CHANGE_WORDAROUND |
>  			 IMX_PCIE_FLAG_SUPPORTS_SUSPEND,
>  		.gpr = "fsl,imx6q-iomuxc-gpr",
>  		.ltssm_off = IOMUXC_GPR12,
> @@ -1696,7 +1690,7 @@ static const struct imx_pcie_drvdata drvdata[] = {
>  	[IMX6QP] = {
>  		.variant = IMX6QP,
>  		.flags = IMX_PCIE_FLAG_IMX_PHY |
> -			 IMX_PCIE_FLAG_IMX_SPEED_CHANGE |
> +			 IMX_PCIE_FLAG_SPEED_CHANGE_WORDAROUND |
>  			 IMX_PCIE_FLAG_SUPPORTS_SUSPEND,
>  		.dbi_length = 0x200,
>  		.gpr = "fsl,imx6q-iomuxc-gpr",
> 

