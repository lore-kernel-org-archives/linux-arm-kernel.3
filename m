Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8935CD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 16:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FuIFAb/j5kmAeyE9TmnhDBgZeinevwGy2iljgd56C7Y=; b=heXhW1WEvoCy5waMNX3VlonB3D
	REC7qBQkcFSiDtY1O8WwpXkBrf6/f9tuUELP7/2hV+W13sSeXcjPRxd9AGknJ0JoojecUehC9v0Vh
	E3cYzLEAu9PVDFSOZrJupPk9mBtQcBLdERnxIvBNy+nSSJCaSn/5woNWwIkSuGacwOpcWvzhnyFy+
	ppOY8s3aZBT927ozWIHoNnultvn48MzIfvXvGCdHZLgIzhxrY199MTDgv2gAVVkeRhXCVJNbi09fU
	06VVhNm2NQWUXmbu+1EhtOfosy8olorz9zQvfAJwTvldgFnZJnHyY3Jz/wJX5k17gTnPzV+IQsyww
	TU9JDf+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKeii-00000001RFt-40Na;
	Wed, 06 May 2026 16:03:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKeii-00000001RFd-0aHd;
	Wed, 06 May 2026 16:03:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 30EDE6014B;
	Wed,  6 May 2026 16:03:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04DA5C2BCB0;
	Wed,  6 May 2026 16:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778083410;
	bh=D7wD6AzQrfQznPONV9GRM3q9KpiebSKEPsnKHA4ZTg0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rErI/Xa/Sz0vIh+pL7XfyNJMZYTiQrj/hBdSpM4Tz7W6bsYY6WwTXAlSV+KHa7b0F
	 KGnevHCvYPNuBWT8voXSIYzlkTEoNi6zB/PKxDq+4xKYo4TIDAOyG4KLGOVkY2EGcp
	 PYxctxHRTEIqJiH/YmgF14GoBiiRWYCdoVTdb6q8ZUDqvruBa9xMWnaQ30Wff3gLNn
	 YejsgZua3jATErmQAkcK+i9TIBk95Gtjyd/rb8Sbj4HHroO2CnEWrbarj0CfiHd6B+
	 TO5al7zrda2resDqCebdMiDvkkSGV/kUTsqbnmPAJV3JTAP0TI4XUIyPIpHx8X/M7E
	 0EAnbDC1Jk+0g==
Date: Wed, 6 May 2026 21:33:21 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Hans Zhang <18255117159@163.com>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org, 
	vigneshr@ti.com, jingoohan1@gmail.com, thomas.petazzoni@bootlin.com, 
	pali@kernel.org, ryder.lee@mediatek.com, jianjun.wang@mediatek.com, 
	claudiu.beznea.uj@bp.renesas.com, mpillai@cadence.com, robh@kernel.org, s-vadapalli@ti.com, 
	linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/8] PCI: cadence: LGA: Add max_link_speed field and
 100 ms delay after link training
Message-ID: <jmqw5tmgbpou5lanjcnolrpmipgnny6chm53wqybtqg4epfuql@cxqryplrmylk>
References: <20260506152346.166056-1-18255117159@163.com>
 <20260506152346.166056-3-18255117159@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260506152346.166056-3-18255117159@163.com>
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

On Wed, May 06, 2026 at 11:23:40PM +0800, Hans Zhang wrote:
> The Cadence LGA (Legacy Architecture IP) PCIe host controller currently
> lacks the mandatory 100 ms delay after link training completes for speeds
> > 5.0 GT/s, as required by PCIe r6.0 sec 6.6.1.
> 
> Add a 'max_link_speed' field to struct cdns_pcie to record the maximum
> supported link speed (or the currently configured speed). In the common
> host layer function cdns_pcie_host_start_link(), after the link has been
> successfully established, call pcie_wait_after_link_train() to insert the
> required delay if max_link_speed > 2.
> 
> Glue drivers must set max_link_speed appropriately (e.g., from the device
> tree property "max-link-speed") to enable the delay.
> 

You need to club those glue driver patches into this one. Otherwise, you'll end
up breaking bisectability.

- Mani

> Signed-off-by: Hans Zhang <18255117159@163.com>
> ---
>  drivers/pci/controller/cadence/pcie-cadence-host-common.c | 4 ++++
>  drivers/pci/controller/cadence/pcie-cadence.h             | 2 ++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/drivers/pci/controller/cadence/pcie-cadence-host-common.c b/drivers/pci/controller/cadence/pcie-cadence-host-common.c
> index 2b0211870f02..51376f69d007 100644
> --- a/drivers/pci/controller/cadence/pcie-cadence-host-common.c
> +++ b/drivers/pci/controller/cadence/pcie-cadence-host-common.c
> @@ -14,6 +14,7 @@
>  
>  #include "pcie-cadence.h"
>  #include "pcie-cadence-host-common.h"
> +#include "../../pci.h"
>  
>  #define LINK_RETRAIN_TIMEOUT HZ
>  
> @@ -115,6 +116,9 @@ int cdns_pcie_host_start_link(struct cdns_pcie_rc *rc,
>  	if (!ret && rc->quirk_retrain_flag)
>  		ret = cdns_pcie_retrain(pcie, pcie_link_up);
>  
> +	if (!ret)
> +		pcie_wait_after_link_train(pcie->max_link_speed);
> +
>  	return ret;
>  }
>  EXPORT_SYMBOL_GPL(cdns_pcie_host_start_link);
> diff --git a/drivers/pci/controller/cadence/pcie-cadence.h b/drivers/pci/controller/cadence/pcie-cadence.h
> index 574e9cf4d003..e222b095d2b6 100644
> --- a/drivers/pci/controller/cadence/pcie-cadence.h
> +++ b/drivers/pci/controller/cadence/pcie-cadence.h
> @@ -86,6 +86,7 @@ struct cdns_plat_pcie_of_data {
>   * @ops: Platform-specific ops to control various inputs from Cadence PCIe
>   *       wrapper
>   * @cdns_pcie_reg_offsets: Register bank offsets for different SoC
> + * @max_link_speed: maximum supported link speed
>   */
>  struct cdns_pcie {
>  	void __iomem		             *reg_base;
> @@ -98,6 +99,7 @@ struct cdns_pcie {
>  	struct device_link	             **link;
>  	const  struct cdns_pcie_ops          *ops;
>  	const  struct cdns_plat_pcie_of_data *cdns_pcie_reg_offsets;
> +	int				     max_link_speed;
>  };
>  
>  /**
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

