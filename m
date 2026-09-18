Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6FC9C982D7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 23:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=ODTQrY0Jnry0Dfu3UICCoe8mZrLfiMVB8y8nz6T8EQE=; b=fJ6jHF+pxbiW+U
	gezN5654gxO/DYkMjy79LqGDRBFflGPNsr7jZhVkhD7G56judgrGgXU6lyZPb6uvZ8jFeBeXgoV9y
	BUXF9uWKwBprgFdczVSIqTvRKAaSvnzwkB3Y5+/gkJk6W9eN1qOgQIikyvZkHUZpk6IJl0K5DRIkr
	EggjnqJoFkNtlBvYwac0GE9HP1NJJyxvsfpoCjK+XsxLiOaFGJS+NeVj8JCtWnVS13LYamVFAGnxm
	b5RBDJAk1plbJ8a2o8c1spnA9Uq7KDoFRLLuO7j84MJoSvLrAsprBRr6ZSk1LEJUg6GGx0vb95nN7
	AxcKvxgQsVfH5aDbBBZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7hZ4-0000000Fg7X-3Yhv;
	Fri, 18 Sep 2026 23:00:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7hZ3-0000000Fg7Q-429Z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 23:00:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5FEBF40384;
	Fri, 18 Sep 2026 23:00:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1276C1F000FF;
	Fri, 18 Sep 2026 23:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789772417;
	bh=ODTQrY0Jnry0Dfu3UICCoe8mZrLfiMVB8y8nz6T8EQE=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=oLTy+OD6g/37bVTLXaNX0EZiObFu59/4XeOqEG62ekDkw/ztpvQkkogMu189UZa7A
	 mGAad6qFw8J/sUBL9JZHnmtiLhuTzCDdPozJbGAVl7PiUaz4gWMCu7JiMlVKkTSCaw
	 +YfAVpn4M2CC19X1EXCEgBJ2RMIa3bPCqaWnXUHfb8r05WrHiq67rxJmMA5R1quXqf
	 htus6gV7Jv7wOGz27XSMw+2vCB5eEI1b0CDjDKwE5vcn+GBLvq6Y16oHmM/JMM0Hn/
	 1twk7jc9DlL+zhdgbFzx11yGaXOz6Lws0Pjj3ixaVzWTLEIHLJqmucY6rMEhuWPfGE
	 mpNZFawkau82Q==
Date: Fri, 18 Sep 2026 18:00:15 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Soeren Moch <smoch@web.de>
Cc: Richard Zhu <hongxing.zhu@nxp.com>, stable@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lucas Stach <l.stach@pengutronix.de>,
	Bjorn Helgaas <bhelgaas@google.com>, Frank Li <Frank.Li@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Re: [PATCH] PCI: imx6: Keep Root Port MSI capability also for i.MX6Q
Message-ID: <20260918230015.GA1205610@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427115804.134231-1-smoch@web.de>
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

[+cc Thorsten, possible regzbot confusion?]

On Mon, Apr 27, 2026 at 01:58:04PM +0200, Soeren Moch wrote:
> Also on the NXP i.MX6Q chipset MSIs from the endpoints won't be received by
> the iMSI-RX MSI controller if the Root Port MSI capability is disabled.
> 
> Even though the Root Port MSIs won't be received by the iMSI-RX controller
> due to design, this chipset has some weird hardware bug that prevents
> the endpoint MSIs from reaching when the Root Port MSI capability is
> disabled.
> 
> Hence, always keep the Root Port MSI capability for this chipset.
> 
> Note that by keeping Root Port MSI capability, Root Port MSIs such as AER,
> PME and others won't be received by default. So users need to use
> workarounds such as passing 'pcie_pme=nomsi' cmdline param.
> 
> Fixes: 3a4e8302e72f ("PCI: imx6: Keep Root Port MSI capability with iMSI-RX to work around hardware bug")
> Cc: <stable@vger.kernel.org> # 7.0.x
> Signed-off-by: Soeren Moch <smoch@web.de>

This thread is still listed as a regression:
https://linux-regtracking.leemhuis.info/regzbot/regression/lore/20260427115804.134231-1-smoch@web.de/

But I *think* it's been resolved by:

  b4bee12ebecc ("PCI: imx6: Keep i.MX6 Root Port MSI/MSI-X Capabilities with iMSI-RX to work around hardware bug")

Can you confirm?

Maybe regzbot is confused by the fact that the regression was first
attributed to 3a4e8302e72f, and then later attributed to
f5cd8a929c825?

> ---
> Cc: Manivannan Sadhasivam <mani@kernel.org>
> Cc: Richard Zhu <hongxing.zhu@nxp.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Frank Li <Frank.Li@nxp.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: linux-pci@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: imx@lists.linux.dev
> Cc: linux-kernel@vger.kernel.org
> 
> Tested on a tbs2910 board [1]
> [1] arch/arm/boot/dts/nxp/imx/imx6q-tbs2910.dts
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 6d6a1688e7eb..3d461bdef967 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -1865,7 +1865,8 @@ static const struct imx_pcie_drvdata drvdata[] = {
>  		.flags = IMX_PCIE_FLAG_IMX_PHY |
>  			 IMX_PCIE_FLAG_SPEED_CHANGE_WORKAROUND |
>  			 IMX_PCIE_FLAG_BROKEN_SUSPEND |
> -			 IMX_PCIE_FLAG_SUPPORTS_SUSPEND,
> +			 IMX_PCIE_FLAG_SUPPORTS_SUSPEND |
> +			 IMX_PCIE_FLAG_KEEP_MSI_CAP,
>  		.dbi_length = 0x200,
>  		.gpr = "fsl,imx6q-iomuxc-gpr",
>  		.ltssm_off = IOMUXC_GPR12,
> -- 
> 2.43.0
> 

