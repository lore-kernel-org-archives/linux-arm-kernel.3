Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68125C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 05:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dbNB1414tw2pkY8ByusDx34b92xB0hoFImvdap6Tt+c=; b=qQTR9/TwrX84n2d7HOWfUIGvq/
	D+BBH8S/bGdKwNoYc7DyK514kafpx9DPC1hW3mFR5amaqe78X1Quch2RqU3XJBX7lNTAK7FanTQzV
	kR1LWqvhFoQlYF1/KjBNhDemJB/OWmRr+V9uWuA6Has2gh0dTukbZ20cGs4uT2Q4QsRHIbKHywtb2
	jGrZ3rCruZbOerNNmlHiHjKusa3eY23gVfyV0JHR3fRS+pyovXYgMqwrmVBkP3seqHbBrxzsvAHsX
	PW/5hjFvTz5ghAONT2g5NUGTO9B4z1a2t/r7sariSZcjm8B20WJn1jPayUj4kwZdZ3BEqeZvv2Z4r
	iJjwsqQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueoTt-00000006VF8-3Mkl;
	Thu, 24 Jul 2025 05:27:01 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueoRR-00000006V5x-0EhU;
	Thu, 24 Jul 2025 05:24:31 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 8322A20E4F;
	Thu, 24 Jul 2025 07:24:24 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5DFJ1MI43x0K; Thu, 24 Jul 2025 07:24:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1753334662; bh=r1LO7zNuqvNeqzo4vTqtN0YoQhEqVRxw4VlweKdkvoQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SWkPTjds8+DpTNDSbJjZbO1kvx/lUtM3GPh5QSFVVHetzWK4LjJAzxk6YxsrQ6H3+
	 sqKhRsoSFz9HjHuuzl8p/nydm4BTm3AHEQzfs8Ku7ONP043g7Czwu18geKr5BsmI9m
	 Ngbl2wFzfJ4ptvgE1wUR4UORdC3cc5qzMHKaFg9tgi/mfgRF3pe540hCl0FxGbnVWR
	 g/a9orwCLiTy6B59UGuCNRp36seF1TMjXmdJjLrzElKXP+WlqsZSNTQ+cGuq5mRbNY
	 +RtuwTtnBTepXrs/TE3+4MU1Cac2/Kx2C1V4CL7/t/JUNu8MRWzytqiPbbdnhao4Gd
	 Fn1scoPBlhdIQ==
Date: Thu, 24 Jul 2025 05:23:55 +0000
From: Yao Zi <ziyao@disroot.org>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Frank Wang <frank.wang@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Shresth Prasad <shresthprasad7@gmail.com>,
	Chukun Pan <amadeus@jmu.edu.cn>, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 5/6] phy: rockchip: naneng-combphy: Add RK3528 support
Message-ID: <aIHDSW0XO9BCfch3@pie.lan>
References: <20250624033733.50197-1-ziyao@disroot.org>
 <20250624033733.50197-6-ziyao@disroot.org>
 <eb7c9e40-3c17-488f-98a2-17b972f61e75@kwiboo.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eb7c9e40-3c17-488f-98a2-17b972f61e75@kwiboo.se>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_222429_639994_FB82A06B 
X-CRM114-Status: GOOD (  35.33  )
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

On Wed, Jul 23, 2025 at 04:51:15PM +0200, Jonas Karlman wrote:
> Hi Yao Zi,
> 
> On 6/24/2025 5:37 AM, Yao Zi wrote:
> > Rockchip RK3528 integrates one naneng-combphy that is able to operate in
> > PCIe and USB3 mode. The control logic is similar to previous variants of
> > naneng-combphy but the register layout is apperantly different from the
> > RK3568 one.
> > 
> > Signed-off-by: Yao Zi <ziyao@disroot.org>
> > Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> > Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> > ---
> >  .../rockchip/phy-rockchip-naneng-combphy.c    | 186 +++++++++++++++++-
> >  1 file changed, 185 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
> > index 1d1c7723584b..bf00a85a113b 100644
> > --- a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
> > +++ b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
> > @@ -20,7 +20,46 @@
> >  #define REF_CLOCK_25MHz			(25 * HZ_PER_MHZ)
> >  #define REF_CLOCK_100MHz		(100 * HZ_PER_MHZ)
> >  
> > -/* COMBO PHY REG */
> > +/* RK3528 COMBO PHY REG */
> > +#define RK3528_PHYREG6				0x18
> > +#define RK3528_PHYREG6_PLL_KVCO			GENMASK(12, 10)
> > +#define RK3528_PHYREG6_PLL_KVCO_VALUE		0x2
> > +#define RK3528_PHYREG6_SSC_DIR			GENMASK(5, 4)
> > +#define RK3528_PHYREG6_SSC_UPWARD		0
> > +#define RK3528_PHYREG6_SSC_DOWNWARD		1
> > +
> > +#define RK3528_PHYREG40				0x100
> > +#define RK3528_PHYREG40_SSC_EN			BIT(20)
> > +#define RK3528_PHYREG40_SSC_CNT			GENMASK(10, 0)
> > +#define RK3528_PHYREG40_SSC_CNT_VALUE		0x17d
> > +
> > +#define RK3528_PHYREG42				0x108
> > +#define RK3528_PHYREG42_CKDRV_CLK_SEL		BIT(29)
> > +#define RK3528_PHYREG42_CKDRV_CLK_PLL		0
> > +#define RK3528_PHYREG42_CKDRV_CLK_CKRCV		1
> > +#define RK3528_PHYREG42_PLL_LPF_R1_ADJ		GENMASK(10, 7)
> > +#define RK3528_PHYREG42_PLL_LPF_R1_ADJ_VALUE	0x9
> > +#define RK3528_PHYREG42_PLL_CHGPUMP_CUR_ADJ	GENMASK(6, 4)
> > +#define RK3528_PHYREG42_PLL_CHGPUMP_CUR_ADJ_VALUE 0x7
> > +#define RK3528_PHYREG42_PLL_KVCO_ADJ		GENMASK(2, 0)
> > +#define RK3528_PHYREG42_PLL_KVCO_ADJ_VALUE	0x0
> > +
> > +#define RK3528_PHYREG80				0x200
> > +#define RK3528_PHYREG80_CTLE_EN			BIT(17)
> > +
> > +#define RK3528_PHYREG81				0x204
> > +#define RK3528_PHYREG81_CDR_PHASE_PATH_GAIN_2X	BIT(5)
> > +#define RK3528_PHYREG81_SLEW_RATE_CTRL		GENMASK(2, 0)
> > +#define RK3528_PHYREG81_SLEW_RATE_CTRL_SLOW	0x7
> > +
> > +#define RK3528_PHYREG83				0x20c
> > +#define RK3528_PHYREG83_RX_SQUELCH		GENMASK(2, 0)
> > +#define RK3528_PHYREG83_RX_SQUELCH_VALUE	0x6
> > +
> > +#define RK3528_PHYREG86				0x218
> > +#define RK3528_PHYREG86_RTERM_DET_CLK_EN	BIT(14)
> > +
> > +/* RK3568 COMBO PHY REG */
> >  #define RK3568_PHYREG6				0x14
> >  #define RK3568_PHYREG6_PLL_DIV_MASK		GENMASK(7, 6)
> >  #define RK3568_PHYREG6_PLL_DIV_SHIFT		6
> > @@ -398,6 +437,147 @@ static int rockchip_combphy_probe(struct platform_device *pdev)
> >  	return PTR_ERR_OR_ZERO(phy_provider);
> >  }
> >  
> > +static int rk3528_combphy_cfg(struct rockchip_combphy_priv *priv)
> > +{
> > +	const struct rockchip_combphy_grfcfg *cfg = priv->cfg->grfcfg;
> > +	unsigned long rate;
> > +	u32 val;
> > +
> > +	/* Set SSC downward spread spectrum */
> > +	val = FIELD_PREP(RK3528_PHYREG6_SSC_DIR, RK3528_PHYREG6_SSC_DOWNWARD);
> > +	rockchip_combphy_updatel(priv, RK3528_PHYREG6_SSC_DIR, val, RK3528_PHYREG6);
> > +
> > +	switch (priv->type) {
> > +	case PHY_TYPE_PCIE:
> > +		rockchip_combphy_param_write(priv->phy_grf, &cfg->con0_for_pcie, true);
> > +		rockchip_combphy_param_write(priv->phy_grf, &cfg->con1_for_pcie, true);
> > +		rockchip_combphy_param_write(priv->phy_grf, &cfg->con2_for_pcie, true);
> > +		rockchip_combphy_param_write(priv->phy_grf, &cfg->con3_for_pcie, true);
> > +		break;
> > +	case PHY_TYPE_USB3:
> > +		/* Enable adaptive CTLE for USB3.0 Rx */
> > +		rockchip_combphy_updatel(priv, RK3528_PHYREG80_CTLE_EN, RK3528_PHYREG80_CTLE_EN,
> > +					 RK3528_PHYREG80);
> > +
> > +		/* Set slow slew rate control for PI */
> > +		val = FIELD_PREP(RK3528_PHYREG81_SLEW_RATE_CTRL,
> > +				 RK3528_PHYREG81_SLEW_RATE_CTRL_SLOW);
> > +		rockchip_combphy_updatel(priv, RK3528_PHYREG81_SLEW_RATE_CTRL, val,
> > +					 RK3528_PHYREG81);
> > +
> > +		/* Set CDR phase path with 2x gain */
> > +		rockchip_combphy_updatel(priv, RK3528_PHYREG81_CDR_PHASE_PATH_GAIN_2X,
> > +					 RK3528_PHYREG81_CDR_PHASE_PATH_GAIN_2X, RK3528_PHYREG81);
> > +
> > +		/* Set Rx squelch input filler bandwidth */
> > +		val = FIELD_PREP(RK3528_PHYREG83_RX_SQUELCH, RK3528_PHYREG83_RX_SQUELCH_VALUE);
> > +		rockchip_combphy_updatel(priv, RK3528_PHYREG83_RX_SQUELCH, val, RK3528_PHYREG83);
> > +
> > +		rockchip_combphy_param_write(priv->phy_grf, &cfg->pipe_txcomp_sel, false);
> > +		rockchip_combphy_param_write(priv->phy_grf, &cfg->pipe_txelec_sel, false);
> > +		rockchip_combphy_param_write(priv->phy_grf, &cfg->usb_mode_set, true);
> 
> I suggest we add something like following here:
> 
> 		rockchip_combphy_param_write(priv->pipe_grf, &cfg->u3otg0_port_en, true);
> 
> to ensure that U3 is enabled in case boot firmware disable the U3 port.

Thanks for the hint, I'm willing to adapt it. Should we handle the case
that USB is enabled by firmware but PCIe is going to be used in kernel,
too? It's desirable to make fewer assumptions about the state set by
firmware.

P.S., I'm assuming the register should be written as "disabled" value
whenever PCIe is used, and "enabled" whenever USB is used, as
the LSB of USB_GRF_USB3OTG0_CON1 is said to be "USB 3.0 SS Port Disable
control" according to RK3588's TRM, which doesn't look like something
compatible with PCIe mode when setting to 1'b0 (port enabled). Please
correct me if I'm wrong.

Regards,
Yao Zi

> > +		break;
> > +	default:
> > +		dev_err(priv->dev, "incompatible PHY type\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	rate = clk_get_rate(priv->refclk);
> > +
> > +	switch (rate) {
> > +	case REF_CLOCK_24MHz:
> > +		rockchip_combphy_param_write(priv->phy_grf, &cfg->pipe_clk_24m, true);
> > +		if (priv->type == PHY_TYPE_USB3) {
> > +			/* Set ssc_cnt[10:0]=00101111101 & 31.5KHz */
> > +			val = FIELD_PREP(RK3528_PHYREG40_SSC_CNT, RK3528_PHYREG40_SSC_CNT_VALUE);
> > +			rockchip_combphy_updatel(priv, RK3528_PHYREG40_SSC_CNT, val,
> > +						 RK3528_PHYREG40);
> > +		} else if (priv->type == PHY_TYPE_PCIE) {
> > +			/* tx_trim[14]=1, Enable the counting clock of the rterm detect */
> > +			rockchip_combphy_updatel(priv, RK3528_PHYREG86_RTERM_DET_CLK_EN,
> > +						 RK3528_PHYREG86_RTERM_DET_CLK_EN, RK3528_PHYREG86);
> > +		}
> > +		break;
> > +	case REF_CLOCK_100MHz:
> > +		rockchip_combphy_param_write(priv->phy_grf, &cfg->pipe_clk_100m, true);
> > +		if (priv->type == PHY_TYPE_PCIE) {
> > +			/* PLL KVCO tuning fine */
> > +			val = FIELD_PREP(RK3528_PHYREG6_PLL_KVCO, RK3528_PHYREG6_PLL_KVCO_VALUE);
> > +			rockchip_combphy_updatel(priv, RK3528_PHYREG6_PLL_KVCO, val,
> > +						 RK3528_PHYREG6);
> > +
> > +			/* su_trim[6:4]=111, [10:7]=1001, [2:0]=000, swing 650mv */
> > +			writel(0x570804f0, priv->mmio + RK3528_PHYREG42);
> > +		}
> > +		break;
> > +	default:
> > +		dev_err(priv->dev, "Unsupported rate: %lu\n", rate);
> > +		return -EINVAL;
> > +	}
> > +
> > +	if (device_property_read_bool(priv->dev, "rockchip,ext-refclk")) {
> > +		rockchip_combphy_param_write(priv->phy_grf, &cfg->pipe_clk_ext, true);
> > +
> > +		if (priv->type == PHY_TYPE_PCIE && rate == REF_CLOCK_100MHz) {
> > +			val = FIELD_PREP(RK3528_PHYREG42_CKDRV_CLK_SEL,
> > +					 RK3528_PHYREG42_CKDRV_CLK_CKRCV);
> > +			val |= FIELD_PREP(RK3528_PHYREG42_PLL_LPF_R1_ADJ,
> > +					  RK3528_PHYREG42_PLL_LPF_R1_ADJ_VALUE);
> > +			val |= FIELD_PREP(RK3528_PHYREG42_PLL_CHGPUMP_CUR_ADJ,
> > +					  RK3528_PHYREG42_PLL_CHGPUMP_CUR_ADJ_VALUE);
> > +			val |= FIELD_PREP(RK3528_PHYREG42_PLL_KVCO_ADJ,
> > +					  RK3528_PHYREG42_PLL_KVCO_ADJ_VALUE);
> > +			rockchip_combphy_updatel(priv,
> > +						 RK3528_PHYREG42_CKDRV_CLK_SEL		|
> > +						 RK3528_PHYREG42_PLL_LPF_R1_ADJ		|
> > +						 RK3528_PHYREG42_PLL_CHGPUMP_CUR_ADJ	|
> > +						 RK3528_PHYREG42_PLL_KVCO_ADJ,
> > +						 val, RK3528_PHYREG42);
> > +
> > +			val = FIELD_PREP(RK3528_PHYREG6_PLL_KVCO, RK3528_PHYREG6_PLL_KVCO_VALUE);
> > +			rockchip_combphy_updatel(priv, RK3528_PHYREG6_PLL_KVCO, val,
> > +						 RK3528_PHYREG6);
> > +		}
> > +	}
> > +
> > +	if (priv->type == PHY_TYPE_PCIE) {
> > +		if (device_property_read_bool(priv->dev, "rockchip,enable-ssc"))
> > +			rockchip_combphy_updatel(priv, RK3528_PHYREG40_SSC_EN,
> > +						 RK3528_PHYREG40_SSC_EN, RK3528_PHYREG40);
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct rockchip_combphy_grfcfg rk3528_combphy_grfcfgs = {
> > +	/* pipe-phy-grf */
> > +	.pcie_mode_set		= { 0x0000, 5, 0, 0x00, 0x11 },
> > +	.usb_mode_set		= { 0x0000, 5, 0, 0x00, 0x04 },
> > +	.pipe_rxterm_set	= { 0x0000, 12, 12, 0x00, 0x01 },
> > +	.pipe_txelec_set	= { 0x0004, 1, 1, 0x00, 0x01 },
> > +	.pipe_txcomp_set	= { 0x0004, 4, 4, 0x00, 0x01 },
> > +	.pipe_clk_24m		= { 0x0004, 14, 13, 0x00, 0x00 },
> > +	.pipe_clk_100m		= { 0x0004, 14, 13, 0x00, 0x02 },
> > +	.pipe_rxterm_sel	= { 0x0008, 8, 8, 0x00, 0x01 },
> > +	.pipe_txelec_sel	= { 0x0008, 12, 12, 0x00, 0x01 },
> > +	.pipe_txcomp_sel	= { 0x0008, 15, 15, 0x00, 0x01 },
> > +	.pipe_clk_ext		= { 0x000c, 9, 8, 0x02, 0x01 },
> > +	.pipe_phy_status	= { 0x0034, 6, 6, 0x01, 0x00 },
> > +	.con0_for_pcie		= { 0x0000, 15, 0, 0x00, 0x110 },
> > +	.con1_for_pcie		= { 0x0004, 15, 0, 0x00, 0x00 },
> > +	.con2_for_pcie		= { 0x0008, 15, 0, 0x00, 0x101 },
> > +	.con3_for_pcie		= { 0x000c, 15, 0, 0x00, 0x0200 },
> 
> And adding something like this:
> 
> 	/* pipe-grf */
> 	.u3otg0_port_en		= { 0x0044, 15, 0, 0x0181, 0x1100 },
> 
> Should be possible with ("phy: rockchip: naneng-combphy: Enable U3 OTG
> port for RK3568") [1].
> 
> Most RK3528 boards I have come across this far seem to use PCIe instead
> of USB3, so having boot firmware disable U3 early (to help support USB
> gadget in boot firmware) and instead having this PHY driver re-enable U3
> when needed seem most logical to me.
> 
> I will push an updated U-Boot rk3528 branch [2] where I include such
> early U3 port disable once source.denx.de is back online again.
> 
> [1] https://lore.kernel.org/r/20250723072324.2246498-1-jonas@kwiboo.se
> [2] https://source.denx.de/u-boot/contributors/kwiboo/u-boot/-/commits/rk3528
> 
> Regards,
> Jonas
> 
> > +};
> > +
> > +static const struct rockchip_combphy_cfg rk3528_combphy_cfgs = {
> > +	.num_phys	= 1,
> > +	.phy_ids	= {
> > +		0xffdc0000,
> > +	},
> > +	.grfcfg		= &rk3528_combphy_grfcfgs,
> > +	.combphy_cfg	= rk3528_combphy_cfg,
> > +};
> > +
> >  static int rk3562_combphy_cfg(struct rockchip_combphy_priv *priv)
> >  {
> >  	const struct rockchip_combphy_grfcfg *cfg = priv->cfg->grfcfg;
> > @@ -1213,6 +1393,10 @@ static const struct rockchip_combphy_cfg rk3588_combphy_cfgs = {
> >  };
> >  
> >  static const struct of_device_id rockchip_combphy_of_match[] = {
> > +	{
> > +		.compatible = "rockchip,rk3528-naneng-combphy",
> > +		.data = &rk3528_combphy_cfgs,
> > +	},
> >  	{
> >  		.compatible = "rockchip,rk3562-naneng-combphy",
> >  		.data = &rk3562_combphy_cfgs,
> 

