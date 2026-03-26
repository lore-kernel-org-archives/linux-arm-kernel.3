Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 545AC10A88F6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 17:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ti7ZwaJ+oZnya6rqiSsqWfcUMtAp2b39yBmGbBFvlt0=; b=mAVnvAVy82eU7xPKWHlFzaaI32
	oVQGzq07+gfmIvBzLqD5T+guzGadYqVFdzGqb4AtVik030JRjHBCzCxBJfkFPNJcICaKi9fKUmvp0
	wo6G426Eai4TLTrOvW8x7HzRNAPcHE7V1SFeVHvAaGv9kqfQ3BlhOQGR3Gv/slFW627M/F0t7FD13
	oBZbxqKMchPBGIzh+DV2tPodhar2SrwVbI/Im5gcUDVSHEGKBxD9cNQh8JrXquGW+kdIdy+sCR9c9
	PLTBRJvf0OX+2IStSyD424eJIwycKMldj7rbKe1dKvYuAzNOATMuhpviOsIbc/6EdU2ZB8m5cKYNL
	JUO6sBBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5ohp-00000005yTJ-1f1s;
	Thu, 26 Mar 2026 17:41:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5ohm-00000005ySd-2lAX;
	Thu, 26 Mar 2026 17:41:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E626A42A3E;
	Thu, 26 Mar 2026 17:41:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70CBCC116C6;
	Thu, 26 Mar 2026 17:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774546873;
	bh=y2HmnRcLJJ8HS4kuIm9lQr9tyMPyTUtfBDwLVFKrKqU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GEIe77U6Ip02xX+b0iJGz2iUhHFHIUBzkDmC77AYhSoc8RUWXJnpJr/hV4bVuFzyY
	 xBphxVhSjCjJSE015JYnDTx4sZRgkTNPRY1iC9DTpwLSqhcJQEizXYP5p3Yt7a3Kaw
	 R9qitskxyCRoNFJzme8kGbxp887C9poIjnYH/uJc824LxCdw+UlqTd5Miw1sr2rjtz
	 Gtf3NFPxVRdJEJ2jZFRlQqS9SwoiJBNQALjzWe+6a4xGC0PrhJgth12/kaYjzcKIzr
	 qo19TB6oWmdIHQDgfnRaBN5jea+y88y6UPVCesH1xceAtkOQCB/CcpOm9W4em68pHj
	 WUrCs72uILyCQ==
Date: Thu, 26 Mar 2026 23:10:58 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Hans Zhang <18255117159@163.com>, bhelgaas@google.com, 
	helgaas@kernel.org
Cc: lpieralisi@kernel.org, jingoohan1@gmail.com, kwilczynski@kernel.org, 
	florian.fainelli@broadcom.com, jim2101024@gmail.com, robh@kernel.org, 
	ilpo.jarvinen@linux.intel.com, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	claudiu.beznea.uj@bp.renesas.com, linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org, 
	linux-omap@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, shawn.lin@rock-chips.com
Subject: Re: [PATCH v9 1/5] PCI: Add pcie_get_link_speed() helper for safe
 array access
Message-ID: <yxtwt2gwwasccsfrymnfahn3ruimnpa3noctqbdurei5yzi233@6j5wzkudjrb7>
References: <20260313165522.123518-1-18255117159@163.com>
 <20260313165522.123518-2-18255117159@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260313165522.123518-2-18255117159@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_104114_731337_419F85DE 
X-CRM114-Status: GOOD (  20.36  )
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

On Sat, Mar 14, 2026 at 12:55:18AM +0800, Hans Zhang wrote:
> The pcie_link_speed[] array is indexed by PCIe generation numbers
> (1 = 2.5 GT/s, 2 = 5 GT/s, ...).  Several drivers use it directly,
> which can lead to out-of-bounds accesses if an invalid generation
> number is used.
> 
> Introduce a helper function pcie_get_link_speed() that returns the
> corresponding enum pci_bus_speed value for a given generation number,
> or PCI_SPEED_UNKNOWN if the generation is out of range.  This will
> allow us to safely handle invalid values after the range check is
> removed from of_pci_get_max_link_speed().
> 

Bjorn: Could you please take a look at this patch and ack if looks good? Rest of
the patches look good to me (I might squash patch 5 with 4 while applying).

- Mani

> Signed-off-by: Hans Zhang <18255117159@163.com>
> ---
>  drivers/pci/pci.h   |  2 ++
>  drivers/pci/probe.c | 16 ++++++++++++++++
>  2 files changed, 18 insertions(+)
> 
> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> index 13d998fbacce..409aca7d737a 100644
> --- a/drivers/pci/pci.h
> +++ b/drivers/pci/pci.h
> @@ -108,6 +108,8 @@ struct pcie_tlp_log;
>  				 PCI_EXP_DEVCTL_FERE | PCI_EXP_DEVCTL_URRE)
>  
>  extern const unsigned char pcie_link_speed[];
> +unsigned char pcie_get_link_speed(unsigned int speed);
> +
>  extern bool pci_early_dump;
>  
>  extern struct mutex pci_rescan_remove_lock;
> diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
> index bccc7a4bdd79..d6592898330c 100644
> --- a/drivers/pci/probe.c
> +++ b/drivers/pci/probe.c
> @@ -783,6 +783,22 @@ const unsigned char pcie_link_speed[] = {
>  };
>  EXPORT_SYMBOL_GPL(pcie_link_speed);
>  
> +/**
> + * pcie_link_speed_value - Get speed value from PCIe generation number
> + * @speed: PCIe speed (1-based: 1 = 2.5GT, 2 = 5GT, ...)
> + *
> + * Returns the speed value (e.g., PCIE_SPEED_2_5GT) if @speed is valid,
> + * otherwise returns PCI_SPEED_UNKNOWN.
> + */
> +unsigned char pcie_get_link_speed(unsigned int speed)
> +{
> +	if (speed >= ARRAY_SIZE(pcie_link_speed))
> +		return PCI_SPEED_UNKNOWN;
> +
> +	return pcie_link_speed[speed];
> +}
> +EXPORT_SYMBOL_GPL(pcie_get_link_speed);
> +
>  const char *pci_speed_string(enum pci_bus_speed speed)
>  {
>  	/* Indexed by the pci_bus_speed enum */
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

