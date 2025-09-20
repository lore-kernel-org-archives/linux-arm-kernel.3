Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC9CECAC5A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Sep 2025 06:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9R84PBVJ1OLE2GY9tEFdt2gyV/oh1M3yZDTid1z1RwE=; b=t4Aku2v18MbVagJWtGJyK//XIA
	s93qwejVxN5NIGDFAxgIDfZ8+ymyy7fJLYIbYxDtc1IXuIErfQRXY7AeUkXvppwJSYUuGGEIqdLMm
	Z2FPv+xQpRcVyXraCvWOpJyn97dJAaa/1X3BRThzWIeZZB0rJeVgogkaL3my8o1Jt40WiWhg7VKfU
	MEJaVtkL98JFQwHPD2Wc4P7hHuFmyrsyIw13z5qkzAyL2XNtmxd3fRAtviWFE4Je3iTt4bQoV4HZ0
	pe+cVmLBWneR00RIeqpSO5SVr5PQNigdnIucv9WE51QAOaZpujIEvNrKlBylW39QSeizhrZFhj8qS
	drVrkZeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzrAA-00000004tJT-1rBL;
	Sat, 20 Sep 2025 06:33:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzrA8-00000004tJ8-1PG5
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Sep 2025 06:33:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BFBE94418F;
	Sat, 20 Sep 2025 06:33:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DD6DC4CEEB;
	Sat, 20 Sep 2025 06:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758350015;
	bh=/hfRLVAeokLS0Eaci1siv6XXPrGjW6em2vhHoSS4P1w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aXEh1rNTPXo0CvHjqmIIik0cDV6bJzExvo1c6+UV7IQS3EmwygQBhV/5atHDtFIiB
	 hkIb8NaRAO1NEEbdxnjdqDRK6PG10UTtnVs1XgrR+NllqukfloO8i/IWJvfMwANPuC
	 z1uAut/qwgYeiY/lKrk2diq4CLnlOLVPHLGmjm5VkBk4Epb4YcN2mDUa23xQhvZYZT
	 tbClM3VJJV1Pa5WvG87kLBBt7nwYD5eJvlDka6ruwKDSZeTV4Kh+og/OB+VowVkCt+
	 GOicLbBGId/gWgj/+OsCC9yoWGmi/ENssyQCFjsYu+K0ZftjVEzk5dOzAOTSmtLsdI
	 hJr3oyJKBRgLA==
Date: Sat, 20 Sep 2025 12:03:26 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: frank.li@nxp.com, jingoohan1@gmail.com, l.stach@pengutronix.de, 
	lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org, bhelgaas@google.com, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 5/6] PCI: dwc: Skip PME_Turn_Off message if there is
 no endpoint connected
Message-ID: <7imm2xtisu5vlogdf3k2xb6phh4qfaaruwdafzfvl6xm3byfdu@iyjmvo2cyxjf>
References: <20250902080151.3748965-1-hongxing.zhu@nxp.com>
 <20250902080151.3748965-6-hongxing.zhu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250902080151.3748965-6-hongxing.zhu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_233336_395856_CBFE7EAF 
X-CRM114-Status: GOOD (  18.82  )
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

On Tue, Sep 02, 2025 at 04:01:50PM +0800, Richard Zhu wrote:
> A chip freeze is observed on i.MX7D when PCIe RC kicks off the PM_PME
> message and no any devices are connected on the port.
> 

Is it because the controller waits indefinitely for the arrival of the
PME_To_Ack response?

> To workaroud such kind of issue, skip PME_Turn_Off message if there is
> no endpoint connected.
> 
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>

Fixes tag is needed and stable list should be CCed.

- Mani

> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/pci/controller/dwc/pcie-designware-host.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> index 57a1ba08c427..b303a74b0fd7 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> @@ -1008,12 +1008,15 @@ int dw_pcie_suspend_noirq(struct dw_pcie *pci)
>  	u32 val;
>  	int ret;
>  
> -	if (pci->pp.ops->pme_turn_off) {
> -		pci->pp.ops->pme_turn_off(&pci->pp);
> -	} else {
> -		ret = dw_pcie_pme_turn_off(pci);
> -		if (ret)
> -			return ret;
> +	/* Skip PME_Turn_Off message if there is no endpoint connected */
> +	if (dw_pcie_get_ltssm(pci) > DW_PCIE_LTSSM_DETECT_WAIT) {
> +		if (pci->pp.ops->pme_turn_off) {
> +			pci->pp.ops->pme_turn_off(&pci->pp);
> +		} else {
> +			ret = dw_pcie_pme_turn_off(pci);
> +			if (ret)
> +				return ret;
> +		}
>  	}
>  
>  	if (dwc_quirk(pci, QUIRK_NOL2POLL_IN_PM)) {
> -- 
> 2.37.1
> 

-- 
மணிவண்ணன் சதாசிவம்

