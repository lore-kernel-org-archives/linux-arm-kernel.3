Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9038DCA0EF5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 18:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u1cCmSm/e+MRZhQY8TNslwLcTb5qXBORvRiaXPOs8+0=; b=tQ6fkUpYoGvTZdCWkzitWCGsSX
	/owtsgtwJIUoWlfjvVl++I1WiMslvReLktKQ6Vvl3p2LSkC2facljBGt/hoW2m32uyJSNHlwFTXPc
	KVhX2pWTelrM4XcJmHY3qMDCqnU/Q5RNnOq1afgAKAxVNkRghpB6PXEprOeUONwN7ueug3fFUtRWu
	HIl6IvSWonxQ2Lkl24j9WqZJL1zqj6Tdzlg1kb+pdIVf782CfUpx2/Qm+7Jf8Uz1LEpTbsm/sHxRd
	Ah0E5X3MQe+E00SLYwyEkTOeLyKxpspepPk+tHfagh2yqUMS21kz3GiYuNl2KthH5byj8Z97llwFf
	IkqwNpdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoQro-0000000BFCc-3HQ7;
	Tue, 19 Aug 2025 18:15:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoNJh-0000000AklK-2rOX;
	Tue, 19 Aug 2025 14:28:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 57A0543F38;
	Tue, 19 Aug 2025 14:28:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5961C4CEF1;
	Tue, 19 Aug 2025 14:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755613681;
	bh=Mfb/JnDJzyPSwOWfwKNljxJBiGU1tZif6yiH46BsXDc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gCTPkpq2+5osYcwBFB2fCOuFJgtRFhXn7gK+vWu2oN0FhoIghk4lWZVH2MX2OGHwi
	 U+6eOqzw8ylA1Re2jgD7G6hlL5q5+AQvzWKx2esSF8Fsb7YBmElbNC0KkPM/DBS2zI
	 RmCoxNjS4FQIagF2VXOjMe5NBSxBDlSY8WT/T/vs/WDutb+1PxDEtfqeIkJzKJ6Z2p
	 /FzeqxjxzIiqKIdW6Q+KFIOEB4ERtQ/cwuL/OINj2q+RXIzEz3nC9xrmOAbvXhBz6R
	 cxgGFvZt4aH58ZO8oej+NGEuTLLiIIeYH+FMUGyfzlHyX2Hhxx/NH18YnSxpP/vqK6
	 CPFdNeN2CRI7g==
Date: Tue, 19 Aug 2025 19:57:50 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: jianjun.wang@mediatek.com, ryder.lee@mediatek.com, bhelgaas@google.com, 
	lpieralisi@kernel.org, kwilczynski@kernel.org, manivannan.sadhasivam@linaro.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v2 1/3] PCI: mediatek-gen3: Implement sys clock ready
 time setting
Message-ID: <lwvp5j5okfc6sny2ypiljgq7hyshjyfiyczsglrq4ds75voqoa@mdwrbozqcinv>
References: <20250703120847.121826-1-angelogioacchino.delregno@collabora.com>
 <20250703120847.121826-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250703120847.121826-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_072801_760635_FFBA6351 
X-CRM114-Status: GOOD (  23.30  )
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

On Thu, Jul 03, 2025 at 02:08:45PM GMT, AngeloGioacchino Del Regno wrote:
> In preparation to add support for the PCI-Express Gen3 controller
> found in newer MediaTek SoCs, such as the Dimensity 9400 MT6991
> and the MT8196 Chromebook SoC, add the definition for the PCIE
> Resource Control register and a new sys_clk_rdy_time_us variable
> in platform data.
> 
> If sys_clk_rdy_time_us is found (> 0), set the new value in the
> aforementioned register only after configuring the controller to
> RC mode, as this may otherwise be reset.
> 
> Overriding the register defaults for SYS_CLK_RDY_TIME allows to
> work around sys_clk_rdy signal glitching in MT6991 and MT8196.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/pci/controller/pcie-mediatek-gen3.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
> index 5464b4ae5c20..8035f7f812aa 100644
> --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> @@ -101,6 +101,9 @@
>  #define PCIE_MSI_SET_ADDR_HI_BASE	0xc80
>  #define PCIE_MSI_SET_ADDR_HI_OFFSET	0x04
>  
> +#define PCIE_RESOURCE_CTRL_REG		0xd2c
> +#define PCIE_RSRC_SYS_CLK_RDY_TIME_MASK	GENMASK(7, 0)
> +
>  #define PCIE_ICMD_PM_REG		0x198
>  #define PCIE_TURN_OFF_LINK		BIT(4)
>  
> @@ -148,6 +151,7 @@ enum mtk_gen3_pcie_flags {
>   * struct mtk_gen3_pcie_pdata - differentiate between host generations
>   * @power_up: pcie power_up callback
>   * @phy_resets: phy reset lines SoC data.
> + * @sys_clk_rdy_time_us: System clock ready time override (microseconds)
>   * @flags: pcie device flags.
>   */
>  struct mtk_gen3_pcie_pdata {
> @@ -156,6 +160,7 @@ struct mtk_gen3_pcie_pdata {
>  		const char *id[MAX_NUM_PHY_RESETS];
>  		int num_resets;
>  	} phy_resets;
> +	u8 sys_clk_rdy_time_us;
>  	u32 flags;
>  };
>  
> @@ -436,6 +441,15 @@ static int mtk_pcie_startup_port(struct mtk_gen3_pcie *pcie)
>  		writel_relaxed(val, pcie->base + PCIE_CONF_LINK2_CTL_STS);
>  	}
>  
> +	/* If parameter is present, adjust SYS_CLK_RDY_TIME to avoid glitching */
> +	if (pcie->soc->sys_clk_rdy_time_us) {
> +		val = readl_relaxed(pcie->base + PCIE_RESOURCE_CTRL_REG);
> +		val &= ~PCIE_RSRC_SYS_CLK_RDY_TIME_MASK;
> +		val |= FIELD_PREP(PCIE_RSRC_SYS_CLK_RDY_TIME_MASK,
> +				  pcie->soc->sys_clk_rdy_time_us);

Nit: Mask and update could be simplified with:

		FIELD_MODIFY(PCIE_RSRC_SYS_CLK_RDY_TIME_MASK, &val,
			     pcie->soc->sys_clk_rdy_time_us);

I'll ammend it while applying.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

