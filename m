Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAC39CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 09:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C/ANFx3kf0wMfFc5R1URmz8Ocwilk+HSnrCEmJkxhAc=; b=XB/RcV1tqbpwfg0L60WL16KPcj
	oqtuOUvJ378pjqSZEgFVqRlxgdiNVXfjDRpooIugy7UzrGww0/9onASAUQ/1mgx8xKBCxFqC4WYXD
	s0ETzZ2A7c7xWDp2mepk0q7yTNU1+Jyw6IzPI2KDFoh316P5PlkmAjMB6myOqK0I9kPCWBx0lLvwT
	/sKMag/61AfN0s4yAKv+56NV3Cab+zhSeq0XiKTt2158S4KHnAfnpSLZy3Ubel+YPeYDHPzyBOONd
	KHqI+0SF8s3cqA7NooOdNFO9SJlhCpn9V9m65/zMH5DcllsaiskwclnwMe81Xlj+j49trLtAmaR+B
	c7jdfXVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoIdv-00000009xbb-25Mz;
	Tue, 19 Aug 2025 09:28:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoI4r-00000009rFb-1Kba
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 08:52:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 79E6E601DE;
	Tue, 19 Aug 2025 08:52:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CD24C4CEF1;
	Tue, 19 Aug 2025 08:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755593540;
	bh=yzUkQzaP8F8D4nlS0lE6qnZ/t2S0zQtHX8F4G8zhxvA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Owd2CS/tHxduX/DRfTXQQ6NLQfGPqcoWJ0ErrWILlOh6P2+vTaCCEvr9K4XA7Tl8R
	 JS87cjbZFpr1Xk5rneTmVQ/jXCmFghpCuNzmBHKs4aXWBLKkhav2REL5xQ7Gv0knS2
	 PWe6iZFPj/yUDzPLcBDVp0MR7IbpcVzq2uAV3WxgP1P3A56FQsTUAmeJdF/CNe/NEa
	 dJdSoH2g2dN+p6eFqDgfpkunRVS7Vb5Wn8vT0i27mG7nNFaldi9J5Q9MT4lhQ0Hv7+
	 ud8eJVzDjQi5yuFCcFwyI6oGy2J5unLCnZJEo4XDDWibZxNRBUgkxcnSC4XmxDJHn8
	 ofODF2P7as1/g==
Date: Tue, 19 Aug 2025 14:22:09 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	bhelgaas@google.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] PCI: imx6: Enable the vaux regulator when fetch it
Message-ID: <kvvluy56sdg6khv33cowseog4ujuebxzotlxm3hvm35slbenc5@rf3wttsd2niz>
References: <20250819071630.1813134-1-hongxing.zhu@nxp.com>
 <20250819071630.1813134-3-hongxing.zhu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250819071630.1813134-3-hongxing.zhu@nxp.com>
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

On Tue, Aug 19, 2025 at 03:16:30PM GMT, Richard Zhu wrote:
> Enable the vaux regulator at probe time and keep it enabled for the
> entire PCIe controller lifecycle. This ensures support for outbound
> wake-up mechanism such as WAKE# signaling.
> 
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 5a38cfaf989b1..1c1dce2d87e44 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -159,6 +159,7 @@ struct imx_pcie {
>  	u32			tx_deemph_gen2_6db;
>  	u32			tx_swing_full;
>  	u32			tx_swing_low;
> +	struct regulator	*vaux;
>  	struct regulator	*vpcie;
>  	struct regulator	*vph;
>  	void __iomem		*phy_base;
> @@ -1739,6 +1740,20 @@ static int imx_pcie_probe(struct platform_device *pdev)
>  	pci->max_link_speed = 1;
>  	of_property_read_u32(node, "fsl,max-link-speed", &pci->max_link_speed);
>  
> +	/*
> +	 * Refer to PCIe CEM r6.0, sec 2.3 WAKE# Signal, WAKE# signal is only
> +	 * asserted by the Add-in Card when all its functions are in D3Cold
> +	 * state and at least one of its functions is enabled for wakeup
> +	 * generation. The 3.3V auxiliary power (+3.3Vaux) must be present and
> +	 * used for wakeup process. Since the main power supply would be gated
> +	 * off to let Add-in Card to be in D3Cold, get the vaux and keep it
> +	 * enabled to power up WAKE# circuit for the entire PCIe controller
> +	 * lifecycle when WAKE# is supported.
> +	 */

This comment implies that the presence of Vaux is dependent on WAKE#. But there
is no such check present in the code. Maybe you are referring to the fact that
the platform will only supply Vaux if it intends to support WAKE#?

But I guess you can just drop the comment altogether and move it to patch
description.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

