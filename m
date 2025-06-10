Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64825C61DB2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 22:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=E9/39JC4raX8ApSL5L/jQxZJOux67e4sxXTfBoaqRf8=; b=x3EnNeW7gWxs1E
	1W/u2JGj+kqY1n71TUp9SyBbcg6WUba7KknWZWG/3nBpHpBK21CbTYLbsVzzrtQBJXgiBMyeuZelp
	GE74175YckrDioJylwRDsJSsb6wzJXIE/zpjUFw6cxCKly9SH482eGDR/LtYA0OqbUkRLe6tOC1Pw
	mOlwedMbfMCcTbhX4cfF+khG0pNjwXZzfKKJVNM1rEaB3OOO5dAoNYJxTBgI9GHZKyouBSZDCvXY4
	Q0OccC7y3CMRrHkgBdElkjEcsmTesYDH44M6r5zKdjs1CyE93eV3Morg57fQkPYbNO32LadJpIbM9
	yufmWaV3Awk7r7WZiYbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP7mG-00000008GWp-3UDK;
	Tue, 10 Jun 2025 22:49:08 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP4Je-00000007srV-1hdL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 19:07:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 84B1AA50AF7;
	Tue, 10 Jun 2025 19:07:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3EE7C4CEED;
	Tue, 10 Jun 2025 19:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749582440;
	bh=AIvP26P9xWUqLZxFjmwu8G6XBOhcEd6iXdkzctN/muI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=PBpHdltkX2oPZwR7aSMe5LjC6PDQ1XOhKgDblLfhZnX8RMczs+FiviOhjYb/f+tVj
	 2CMjcuBLbDn4SJkHn0jrUPTVJ7X3Uj8EUYziJtLB1PRn1Kq1ilG/ONHdN2TTBiNFEM
	 s+jFUhX/io9IMEqUMfHz+vZiyx9/Yv2x+bx6g8RjUXG1zhmHUbYNu0JbCzfOSKojdv
	 flMEos1Fn4hq46QhT04z1cBUVYCm7GJicTEuSk8aUF2X1kSYmpltcchTiYgPWyCSfC
	 dvdA2QSXIxlDw4NzdwG/d53nGBrLmYi6gvFo42TD3RRwLu93G89nrriARar4mkpWqF
	 Y3UyVfTvo2H9g==
Date: Tue, 10 Jun 2025 14:07:18 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] PCI: xilinx: Support reset GPIO for PERST#
Message-ID: <20250610190718.GA819844@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610143919.393168-2-mike.looijmans@topic.nl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_120722_508617_C7A2B005 
X-CRM114-Status: GOOD (  17.84  )
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

On Tue, Jun 10, 2025 at 04:39:04PM +0200, Mike Looijmans wrote:
> Support providing the PERST# reset signal through a devicetree binding.
> Thus the system no longer relies on external components to perform the
> bus reset.

> @@ -576,11 +577,17 @@ static int xilinx_pcie_probe(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	struct xilinx_pcie *pcie;
>  	struct pci_host_bridge *bridge;
> +	struct gpio_desc *perst_gpio;
>  	int err;
>  
>  	if (!dev->of_node)
>  		return -ENODEV;
>  
> +	perst_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(perst_gpio))
> +		return dev_err_probe(dev, PTR_ERR(perst_gpio),
> +				     "Failed to request reset GPIO\n");
> +
>  	bridge = devm_pci_alloc_host_bridge(dev, sizeof(*pcie));
>  	if (!bridge)
>  		return -ENODEV;
> @@ -595,6 +602,13 @@ static int xilinx_pcie_probe(struct platform_device *pdev)
>  		return err;
>  	}
>  
> +	if (perst_gpio) {
> +		msleep(PCIE_T_PVPERL_MS); /* Minimum assertion time */
> +		gpiod_set_value_cansleep(perst_gpio, 0);

Are we assured that PERST# was already asserted when we entered
xilinx_pcie_probe()?

> +		/* Initial delay to provide endpoint time to initialize */
> +		msleep(PCIE_T_RRS_READY_MS);

I don't think this is the right spot for PCIE_T_RRS_READY_MS, details
in https://lore.kernel.org/r/20250610185734.GA819344@bhelgaas

I guess the spec assumes that for ports that don't support speeds
greater than 5.0 GT/s, 100ms is enough for the link to come up *and*
the endpoint to initialize.  But since you're going to wait for the
link to come up immediately *after* this PCIE_T_RRS_READY_MS sleep, I
would think you could extend the timeout in xilinx_pci_wait_link_up()
and then do the PCIE_T_RRS_READY_MS sleep.

