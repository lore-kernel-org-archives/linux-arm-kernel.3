Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DB1CC79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 17:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ufuh8rHe8RzDWREZVOB5iC/Zr56vWlipFdG7yg5JHjw=; b=h39SH1/0IkRKhjnD1KBj1gd9OH
	C9364OmLvsDtga+iv+jmjt0zor38+KNQV/isv4pbpGEq+ud4NSbPjqOl6TYalWl1a9OpdZTHgBk1G
	iPXHN5xJvzGgicfmoPFkloAVZwe3pMw+l18g9gCOLedu9A1XB0lUdnRr3AJ4V5aZNL+vR7dEvREEu
	bBK61ZR2NgFu0x14dqfh6e1Bh1QJXoLmm+qU/RBTkQ0jQQzFzK8fivNPGXalt5pC9MzJzlcpK2JNm
	Ef99aMDDS9znWDmbz5s23+YVM/TljEWkM7htYsXDu5Tp8eiPuHzzFtCKdFYV6L9VdFn9PjP7PC4SY
	b5jA8vXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4LrG-0000000CRgR-25wB;
	Wed, 09 Sep 2026 17:13:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4LrF-0000000CRg2-0HSK;
	Wed, 09 Sep 2026 17:13:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 590C94368E;
	Wed,  9 Sep 2026 17:13:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9E4E1F000FF;
	Wed,  9 Sep 2026 17:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788973992;
	bh=Ufuh8rHe8RzDWREZVOB5iC/Zr56vWlipFdG7yg5JHjw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GKOoGJXkIXdtEkoH8v22EkCC9f7VeSkTOqIvgxY5y+FryZ0ErUlrWtG3z4kwXWhBL
	 sl6pQ7mxbKA+D/7GdWzuINNHi6XXFlNlmLAEfwQjuZ1YVGupC41GCQMQIiNyda762l
	 YLNkpRPx8BbByXoSyENmsVVbLCb9q9ntzh5ty6l381mX/OcmUn8iQnyB+Xi3mmHMsV
	 VHxGUuRtjczB5xoW+nphOxpzA84U58F+NruTp7SoliIfUTSLE486bTMyoEWU69a6Th
	 pr71TsinuVKccKsy+oYwAoDMXrRxdotH0rZFyJFA10PuVVqecsRIC3NpzNXOFNR+dv
	 bnVgXyavOmjnw==
Date: Wed, 9 Sep 2026 19:13:02 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunfeng.yun@mediatek.com, vkoul@kernel.org, neil.armstrong@linaro.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	chunkuang.hu@kernel.org, p.zabel@pengutronix.de, justin.yeh@mediatek.com, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCH v3 05/12] phy: phy-mtk-dp: Implement power_on and
 power_off PHY callbacks
Message-ID: <qi7ond5pdug5o56qi2i3btqbp6quljanei3v27kbbrbebcquxi@g7kfqgjc3s76>
References: <20260707154245.198361-1-angelogioacchino.delregno@collabora.com>
 <20260707154245.198361-6-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260707154245.198361-6-angelogioacchino.delregno@collabora.com>
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

On Tue, Jul 07, 2026 at 05:42:38PM +0200, AngeloGioacchino Del Regno wrote:
> Add .power_on() and .power_off() callbacks to mtk_dp_phy_dev_ops
> to be able to call those with phy_power_on() and phy_power_off()
> API in the DisplayPort driver to be able to stop using all of
> those hardcoded register writes in that external driver.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/phy/mediatek/phy-mtk-dp.c | 88 +++++++++++++++++++++++++++++++
>  1 file changed, 88 insertions(+)
> 
> diff --git a/drivers/phy/mediatek/phy-mtk-dp.c b/drivers/phy/mediatek/phy-mtk-dp.c
> index 20974650d940..f6b0e83d4833 100644
> --- a/drivers/phy/mediatek/phy-mtk-dp.c
> +++ b/drivers/phy/mediatek/phy-mtk-dp.c
> @@ -21,6 +21,9 @@
>  
>  #define MTK_DP_PHY_MAX_LANES		4
>  
> +/* DP_PHYA_GLB_FORCE_CTRL_1 */
> +#define CKM_CKTX0_EN_FORCE_MODE		BIT(10)
> +
>  /* DP_PHYD_PLL_CTL_1 */
>  #define TPLL_SSC_EN			BIT(3)
>  
> @@ -38,6 +41,11 @@
>  #  define DP_GLB_SW_RST_XTAL_CLK	BIT(2)
>  #  define DP_GLB_SW_RST_MAIN_LINK	BIT(3)
>  
> +/* DP_PHYD_AUX_RX_CTL */
> +#define PHYD_DIG_DPAUX_RX_EN		BIT(0)
> +#define PHYD_DIG_XTP_GLB_CKDET_EN	BIT(1)
> +#define PHYD_DIG_DPAUX_RX_DEGLITCH_EN	BIT(2)
> +
>  #define DRIVING_PARAM_0_DEFAULT	0x0
>  #define DRIVING_PARAM_1_DEFAULT	0x0
>  #define DRIVING_PARAM_2_DEFAULT	0x0
> @@ -88,6 +96,12 @@
>  #define DRIVING_PARAM_8_DEFAULT	(XTP_LN_TX_LCTXCP1_SW2_PRE1_DEFAULT | \
>  				 XTP_LN_TX_LCTXCP1_SW3_PRE0_DEFAULT)
>  
> +enum mtk_dp_phya_ana_glb_regidx {
> +	DP_PHYA_GLB_FORCE_CTRL_0,
> +	DP_PHYA_GLB_FORCE_CTRL_1,
> +	DP_PHYA_GLOBAL_MAX
> +};
> +
>  enum mtk_dp_phyd_dig_lane_regidx {
>  	DP_PHYD_LAN_DRIVING_PARAM_0,
>  	DP_PHYD_LAN_MAX
> @@ -98,9 +112,15 @@ enum mtk_dp_phyd_dig_glb_regidx {
>  	DP_PHYD_PLL_CTL_1,
>  	DP_PHYD_SW_RST,
>  	DP_PHYD_BIT_RATE,
> +	DP_PHYD_AUX_RX_CTL,
>  	DP_PHYD_GLOBAL_MAX
>  };
>  
> +static const u8 mt8195_phy_ana_glb_regs[DP_PHYA_GLOBAL_MAX] = {
> +	[DP_PHYA_GLB_FORCE_CTRL_0] = 0x30,
> +	[DP_PHYA_GLB_FORCE_CTRL_1] = 0x34,
> +};
> +
>  static const u8 mt8195_phy_dig_lane_regs[DP_PHYD_LAN_MAX] = {
>  	[DP_PHYD_LAN_DRIVING_PARAM_0] = 0x2c,
>  };
> @@ -110,21 +130,26 @@ static const u8 mt8195_phy_dig_glb_regs[DP_PHYD_GLOBAL_MAX] = {
>  	[DP_PHYD_PLL_CTL_1] = 0x14,
>  	[DP_PHYD_SW_RST] = 0x38,
>  	[DP_PHYD_BIT_RATE] = 0x3c,
> +	[DP_PHYD_AUX_RX_CTL] = 0x40,
>  };
>  
>  /**
>   * struct mtk_dp_phy_pdata - Platform data and defaults for MediaTek DP/eDP PHY
> + * @off_ana_glb:    Base offset for dptx_phyd_sifslv_ana_glb
>   * @off_dig_glb:    Base offset for dptx_phyd_sifslv_dig_glb
>   * @off_dig_lane:   Base offsets for dptx_phyd_sifslv_dig_lan (for each lane)
> + * @regs_ana_glb:   Register (layout) offsets for ana_glb
>   * @regs_dig_glb:   Register (layout) offsets for dig_glb
>   * @regs_dig_lane:  Register (layout) offsets for dig_lan
>   */
>  struct mtk_dp_phy_pdata {
>  	/* Register offsets */
> +	u16 off_ana_glb;
>  	u16 off_dig_glb;
>  	u16 off_dig_lane[MTK_DP_PHY_MAX_LANES];
>  
>  	/* Register maps */
> +	const u8 *regs_ana_glb;
>  	const u8 *regs_dig_glb;
>  	const u8 *regs_dig_lane;
>  };
> @@ -208,6 +233,65 @@ static int mtk_dp_phy_configure(struct phy *phy, union phy_configure_opts *opts)
>  	return 0;
>  }
>  
> +static int mtk_dp_phy_power_on(struct phy *phy)
> +{
> +	struct mtk_dp_phy *dp_phy = phy_get_drvdata(phy);
> +	const struct mtk_dp_phy_pdata *pdata = dp_phy->pdata;
> +	const u8 *regs_dig = pdata->regs_dig_glb;
> +	const u8 *regs_ana = pdata->regs_ana_glb;
> +	int ret;
> +
> +	/* Enable AUX Channel with RX De-Glitch and input clock detection */
> +	ret = regmap_write(dp_phy->regmap,
> +			   pdata->off_dig_glb + regs_dig[DP_PHYD_AUX_RX_CTL],
> +			   PHYD_DIG_DPAUX_RX_EN |
> +			   PHYD_DIG_XTP_GLB_CKDET_EN |
> +			   PHYD_DIG_DPAUX_RX_DEGLITCH_EN);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_clear_bits(dp_phy->regmap,
> +				pdata->off_ana_glb + regs_ana[DP_PHYA_GLB_FORCE_CTRL_1],
> +				CKM_CKTX0_EN_FORCE_MODE);
> +	if (ret) {
> +		/* Shut down AUX channel */
> +		regmap_write(dp_phy->regmap,
> +			     pdata->off_dig_glb + regs_dig[DP_PHYD_AUX_RX_CTL], 0);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int mtk_dp_phy_power_off(struct phy *phy)
> +{
> +	struct mtk_dp_phy *dp_phy = phy_get_drvdata(phy);
> +	const struct mtk_dp_phy_pdata *pdata = dp_phy->pdata;
> +	const u8 *regs_dig = pdata->regs_dig_glb;
> +	const u8 *regs_ana = pdata->regs_ana_glb;
> +	int ret_cktx, ret_aux;
> +
> +	ret_cktx = regmap_set_bits(dp_phy->regmap,
> +				   pdata->off_ana_glb + regs_ana[DP_PHYA_GLB_FORCE_CTRL_1],
> +				   CKM_CKTX0_EN_FORCE_MODE);
> +
> +	/* Disable RX unconditionally */
> +	ret_aux = regmap_write(dp_phy->regmap,
> +			       pdata->off_dig_glb + regs_dig[DP_PHYD_AUX_RX_CTL], 0);
> +	if (ret_aux) {
> +		dev_err(&phy->dev, "Could not disable AUX RX: %d\n", ret_aux);

Since the regmap is MMIO based, I don't think you'll hit these failures.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

