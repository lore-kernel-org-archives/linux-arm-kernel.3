Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7FF4CA5FFE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 14:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O4ijsvRQBpFAt/TjBQaHW4rLo5nHlFdAIaOJaUcvaqQ=; b=Oq7FtQAHQS82PtnM0dS66xMzVc
	tuajINqY6H6rQZh6WVYAbapWCvO17RGj6BilaBZn52DMBbbPhi2BMbZjT/4vdEexlmmA7nt32P/xf
	bUjudhEuFLB09+WI/AjkJlV0FYJyaIxkx5R5P4IlYx4EyMqozWaxtVRy+BWcOLN2VTHh5ywvVYVQ4
	SbVOHW05A6410LXOxYQ+npk7gABB95PjaaM55Uh+E7cDBlcXPx+FBrvJgTkJ2NtlBaGT1WDsH7Pbz
	TnVHbq2S4cPIqOBjChn0rQZdaDxb5TnPFpFoQXbL1ZKAPspU6YjFZQ7a048T7Yc9fmDLUzME6Oc32
	IjcaQmtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE6Xw-00000000yzQ-1uZL;
	Tue, 06 Oct 2026 14:53:36 +0000
Received: from mail-m9336.xmail.ntesmail.com ([103.126.93.36])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE6Xs-00000000yyN-2Qvk;
	Tue, 06 Oct 2026 14:53:34 +0000
Received: from [172.16.12.48] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5017780f0;
	Tue, 6 Oct 2026 22:53:25 +0800 (GMT+08:00)
Message-ID: <08736f4d-a728-4b1e-a28e-882648a412e0@rock-chips.com>
Date: Tue, 6 Oct 2026 22:53:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com, Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v12 2/2] phy: rockchip: naneng-combphy: add SGMII MAC
 selection for RK3568
To: Coia Prant <coiaprant@gmail.com>
References: <20261006074749.2010233-1-coiaprant@gmail.com>
 <20261006074749.2010233-3-coiaprant@gmail.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20261006074749.2010233-3-coiaprant@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa111b4849d03a4kunm0891905cc46f12
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZSkwZVkxMGExPTklLHkhNH1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQkxVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=OfXO0jKzVK0ihQAAbN7TAM/2PrWg8O37gdbmTiejSIEvUUVX890S5dzDBItY9mVrD4P4xEdN2x2dwsucg/EcSmrrArDIIQxtuOWAKdEh6iaoXf5uEp03ixDehkjKCODIWzJ2J+i1+gVBDAz+NUtm4+wtU7JSlcPboDrUhcIedvI=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=O4ijsvRQBpFAt/TjBQaHW4rLo5nHlFdAIaOJaUcvaqQ=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_075333_253744_7A14A829 
X-CRM114-Status: GOOD (  22.79  )
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

Hi Coia

在 2026/10/06 星期二 15:47, Coia Prant 写道:
> On RK3568, the SGMII interface can be routed to either GMAC0 or
> GMAC1 via the GRF register pipe_sgmii_mac_sel.
> 
> Add support for this selection by introducing
> the "rockchip,sgmii-mac-sel" DT property.
> 
>  From the RK3568 TRM (Part1, Page 229), the PIPE_GRF_XPCS_CON0
> bit 1 (pipe_sgmii_mac_sel) is defined as:
> 
>      0: SGMII routed to GMAC0
>      1: SGMII routed to GMAC1
> 
> The hardware reset value is 1 (GMAC1). If the property is set to 0,
> the driver routes SGMII to GMAC0; if set to 1 (or omitted), it
> remains at GMAC1.
> 

Thanks for your patch. I have a question below, please have a look.

> This is necessary for boards such as the Ariaboard Photonicat, which
> uses the SGMII interface connected to GMAC0.
> 
> Out-of-range values are rejected by dtschema, so the driver does not
> duplicate the range check.
> 
> Link: https://dl.radxa.com/rock3/docs/hw/datasheet/Rockchip%20RK3568%20TRM%20Part1%20V1.1-20210301.pdf (Page 229)
> Signed-off-by: Coia Prant <coiaprant@gmail.com>
> ---
>   drivers/phy/rockchip/phy-rockchip-naneng-combphy.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
> index 7843356a4dd47..7b867e7520064 100644
> --- a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
> +++ b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
> @@ -186,6 +186,7 @@ struct rockchip_combphy_grfcfg {
>   	struct combphy_reg pipe_xpcs_phy_ready;
>   	struct combphy_reg pipe_pcie1l0_sel;
>   	struct combphy_reg pipe_pcie1l1_sel;
> +	struct combphy_reg pipe_sgmii_mac_sel;
>   	struct combphy_reg u3otg0_port_en;
>   	struct combphy_reg u3otg1_port_en;
>   };
> @@ -212,6 +213,7 @@ struct rockchip_combphy_priv {
>   	bool enable_ssc;
>   	bool ext_refclk;
>   	struct clk *refclk;
> +	u32 sgmii_mac_sel;
>   };
>   
>   static void rockchip_combphy_updatel(struct rockchip_combphy_priv *priv,
> @@ -375,6 +377,9 @@ static int rockchip_combphy_parse_dt(struct device *dev, struct rockchip_combphy
>   
>   	priv->ext_refclk = device_property_present(dev, "rockchip,ext-refclk");
>   
> +	priv->sgmii_mac_sel = 1;

Before this patch, SGMMI was routed to GMACX depends on bootloader(if
setting), or routed to GMAC1 by chip default. Without knowing any
potential candidates setting it via bootloader, you might not force any
DTS files without "rockchip,sgmii-mac-sel" to pick GMAC1 as fallback.

Maybe you could just keep the SGMII route as-it if the property is not
present. Meanwhile, should validate rockchip,sgmii-mac-sel is a valid
value passing from DT.


> +	device_property_read_u32(dev, "rockchip,sgmii-mac-sel", &priv->sgmii_mac_sel);
> +
>   	priv->phy_rst = devm_reset_control_get_exclusive(dev, "phy");
>   	/* fallback to old behaviour */
>   	if (PTR_ERR(priv->phy_rst) == -ENOENT)
> @@ -873,6 +878,8 @@ static int rk3568_combphy_cfg(struct rockchip_combphy_priv *priv)
>   		break;
>   
>   	case PHY_TYPE_SGMII:
> +		rockchip_combphy_param_write(priv->pipe_grf, &cfg->pipe_sgmii_mac_sel,
> +					     priv->sgmii_mac_sel > 0);
>   		rockchip_combphy_param_write(priv->pipe_grf, &cfg->pipe_xpcs_phy_ready, true);
>   		rockchip_combphy_param_write(priv->phy_grf, &cfg->pipe_phymode_sel, true);
>   		rockchip_combphy_param_write(priv->phy_grf, &cfg->pipe_sel_qsgmii, true);
> @@ -984,6 +991,7 @@ static const struct rockchip_combphy_grfcfg rk3568_combphy_grfcfgs = {
>   	.con3_for_sata		= { 0x000c, 15, 0, 0x00, 0x4407 },
>   	/* pipe-grf */
>   	.pipe_con0_for_sata	= { 0x0000, 15, 0, 0x00, 0x2220 },
> +	.pipe_sgmii_mac_sel	= { 0x0040, 1, 1, 0x00, 0x01 },
>   	.pipe_xpcs_phy_ready	= { 0x0040, 2, 2, 0x00, 0x01 },
>   	.u3otg0_port_en		= { 0x0104, 15, 0, 0x0181, 0x1100 },
>   	.u3otg1_port_en		= { 0x0144, 15, 0, 0x0181, 0x1100 },


