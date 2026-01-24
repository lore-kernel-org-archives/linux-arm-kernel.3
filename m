Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 268BED715F3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Jan 2026 20:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=k2a2ku10YAyIKnc7mb8BCfoDLvRSneJlNx1wUf3oAcc=; b=W9rexdYh3Rdn12
	V+nZDMe/lUf+yr7iVACWiWTN9pbPdv5NsuDLpIpr62FOJLuFp6jpOXbZ9wrBA22FpU5HnW/U/ZF+R
	mNDR7HlP6itrFgoF7b/r0T8UEFee0nSnYAVOl44+Ziz2hBXemgMN9w6ljC5PW/ZbQYI89zn18V26r
	FWqiYqKT73RuGOQ1DqDZl2eFOTvRdsm641UyzwAgA8qIbYbw8NLxkVaC9Fuwq+LjeqddqigbWC4ZW
	kV5/TPU0/sQFaBCXfIaOpBPcF+bOPqJQRkqQ9iGTLHCNeNRZhM4/o8FB2OGe7pqeLjPLtF5M+ki4P
	cD8Q+RlmiJZO/BXTeDnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjkB4-0000000AVTn-3H14;
	Sat, 24 Jan 2026 20:24:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjkB2-0000000AVTK-0yKG
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Jan 2026 20:24:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 60516442B6;
	Sat, 24 Jan 2026 20:24:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FCFFC116D0;
	Sat, 24 Jan 2026 20:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769286248;
	bh=LZT2FX9gel15TTuzcvgNnRsgxoL3KHhIFCm4WDGiUgg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=NPrFXTkUxmm6z2SJt7Zk0xpvA4Isr1XZNZDuEnXOZ4AM62/fxCWGIGqtcfW4n5SSU
	 popSQ1aV52CVGz8I/KTa+rbaaExX50emjo3sEmDqnhnu8pHRuIZZA+/OcmV9OCkXGS
	 3tkjiBe+O/vwOuywv367gvk4wqfcWArTKO47Nbv1Mj/bNewITWpI0a+HnokwY5U7DO
	 o6CAO6qtPE3X34EMxvGez32L+asROsPOvICwz2yBzDYXitQvgFnMIpwUsGpiAZ8SzY
	 fSW2nimQXr+Pf4YGb1Z9twJNoJI4ncqPEv8YIqNHJ0bOgolTFtpVsFDa1CknQajsUb
	 m5BECGosE3DfQ==
Date: Sat, 24 Jan 2026 14:24:06 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Felix Gu <ustc.gu@gmail.com>
Cc: Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Trent Piepho <tpiepho@impinj.com>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] PCI: imx6: Fix device node reference leak in
 imx_pcie_probe()
Message-ID: <20260124202406.GA175382@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260124-pci_imx6-v2-1-acb8d5187683@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260124_122412_302979_8A055CA2 
X-CRM114-Status: GOOD (  21.39  )
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

On Sat, Jan 24, 2026 at 11:42:45PM +0800, Felix Gu wrote:
> In imx_pcie_probe, np is obtained by of_parse_phandle() and must be
> released when it's no longer needed. However, it doesn't release the
> reference, which cuases a reference leak.
> Fix this by using the __free(device_node) cleanup handler to release the
> reference when it goes out of scope.

Mani, if you apply this, can you add a blank line between paragraphs
and:

  s/imx_pcie_probe,/imx_pcie_probe(),/
  s/cuases/causes/

Felix, if you repost this for other reasons, please incorporate those.

> Fixes: 1df82ec46600 ("PCI: imx: Add workaround for e10728, IMX7d PCIe PLL failure")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> ---
> Changes in v2:
> - Use __free(device_node) clean handler to fix the leak.
> - Link to v1: https://lore.kernel.org/r/20260124-pci_imx6-v1-1-6f4379fc5160@gmail.com
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 1d8677d7de04..f459d05ecd7d 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -1643,7 +1643,6 @@ static int imx_pcie_probe(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	struct dw_pcie *pci;
>  	struct imx_pcie *imx_pcie;
> -	struct device_node *np;
>  	struct device_node *node = dev->of_node;
>  	int i, ret, domain;
>  	u16 val;
> @@ -1670,7 +1669,8 @@ static int imx_pcie_probe(struct platform_device *pdev)
>  		pci->pp.ops = &imx_pcie_host_dw_pme_ops;
>  
>  	/* Find the PHY if one is defined, only imx7d uses it */
> -	np = of_parse_phandle(node, "fsl,imx7d-pcie-phy", 0);
> +	struct device_node *np __free(device_node) =
> +		of_parse_phandle(node, "fsl,imx7d-pcie-phy", 0);
>  	if (np) {
>  		struct resource res;
>  
> 
> ---
> base-commit: a0c666c25aeefd16f4b088c6549a6fb6b65a8a1d
> change-id: 20260124-pci_imx6-f97d70887dfc
> 
> Best regards,
> -- 
> Felix Gu <ustc.gu@gmail.com>
> 
> 

