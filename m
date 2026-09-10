Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0290C79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 08:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N2SURyTcbduKJLk+a5NWhlHR0NrFlRiMGnI7Q6438/M=; b=oMyUAhZ02s4OGcMOxDJoeyYzY9
	B6GdQDb/AgqrxHqHnQCC9B31MxfK9EEHirI9bMxA3EovuE7rwTx2/DoL+Gm+Zl5YzVfcJMlrNPWtO
	qS+i1PcIc9Kx/zkOrGtRwg5ML5fXHg/M/ixKXYxkrDKGPdpYtYKbk02It2ofJaGN1kVseD86ZgtWx
	dT4u6wzNfdqU7TSVWIc6fY0d0fSrFqfXy4fyvpuKMYN80+ixnIaazb3H15ZIp0bIPAa8pvjMQXXa+
	wLFPM2uIUP5KiDo11J3l31vFpwQIMlSREAQWke97Em2bTt3pQBrQ8kjiHjDRGKnP9b3BJEzRSbVCp
	qmM3DNDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4a5c-0000000Djbi-1IEV;
	Thu, 10 Sep 2026 08:25:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4a5b-0000000DjbP-1SYc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 08:24:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CCBF543A9C;
	Thu, 10 Sep 2026 08:24:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE8B41F000FF;
	Thu, 10 Sep 2026 08:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789028698;
	bh=N2SURyTcbduKJLk+a5NWhlHR0NrFlRiMGnI7Q6438/M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hX5Yl2YNobLqEoQGyfzkEC3/pXkCXYI1wPtA3nQRL90+U2tsjl585qPkt2jJeYlqR
	 r9+BLuQ7nyuawukphAupVDlLTa3wei1BP4VCCAUHNdvw8kXsXcmmvGchTQoPDBrtFD
	 mKv39Bwq/YCJv6IONs7Rll0waiH9WdLTHkXtV566YbpD0TYUOmLfVIfnyooheTo6ie
	 p+izrXrqrW62my+otdagP4QucslAmrJ61ClZT1fGkJp5DDzma+CnOf1tOeIfkN6a44
	 7DbDUNtkgPRsmmhRxjFlD0e/O2a4JzedQWdEKRu1Q5GqZG2x3Ktg8y9EcXkhMcy1Rr
	 ic9Wp2U5bnphA==
Date: Thu, 10 Sep 2026 10:24:50 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Rudi Heitbaum <rudi@heitbaum.com>
Cc: Richard Zhu <hongxing.zhu@nxp.com>, 
	Lucas Stach <l.stach@pengutronix.de>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] PCI: imx6: Avoid dereferencing a NULL clock name
Message-ID: <v5xbens6xr63smpdm4qugj6vtstd2efvezhbic2j3vctxcdbme@lh42pxcn7qp2>
References: <am8iBwJSEhYhWTqk@6cfee64030a6>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <am8iBwJSEhYhWTqk@6cfee64030a6>
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

On Sun, Aug 02, 2026 at 10:55:03AM +0000, Rudi Heitbaum wrote:
> of_clk_bulk_get() leaves clk_bulk_data::id as NULL for every clock that
> has no matching entry in "clock-names", which is legal: a node may list
> more "clocks" phandles than it names. The extref scan dereferences that
> id unconditionally, so such a node oopses during probe.
> 
> Check clk_bulk_data::id before dereferencing it.
> 
> Fixes: d8574ce57d76 ("PCI: imx6: Add external reference clock input mode support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index f7389b5437df..dcdeba1856f7 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -1831,7 +1831,8 @@ static int imx_pcie_probe(struct platform_device *pdev)
>  		return dev_err_probe(dev, imx_pcie->num_clks,
>  				     "failed to get clocks\n");
>  	for (i = 0; i < imx_pcie->num_clks; i++)
> -		if (strncmp(imx_pcie->clks[i].id, "extref", 6) == 0)
> +		if (imx_pcie->clks[i].id &&
> +		    strncmp(imx_pcie->clks[i].id, "extref", 6) == 0)

As Sashiko mentioned, there are other places in this driver without the check.
Please fix all of them in a single patch.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

