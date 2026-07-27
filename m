Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CCCFC531FC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 07:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/3z8MnPosRttYFJu2KNr+MMSKCxn2GoCqgHGcPTcAk0=; b=0OC5NfiNQ6bbSkv8XBzG7luBRo
	2BoR6grOzRLZD6e961YLZe2YehhBXu1HO773W3CMZ2HBijQwBN0lTTnYtQYPn2htwUu4QPO2RGWEY
	M8r246+zW7PbitQC3H3imtgUdZNZ6hmaMZtZo/FDGn6W39LkYXW1Pwk+A3xh/mcLgnwZiBGmVoJeX
	O6o88iH9FXnIxfkZMo4ki5qhHRBQDfkyyECZgm20zZV8/DryflSk6eOF+iNzNxWmzmo3vNwXKFUrM
	7e5HRNd9w53x+baRoMJCdfe8qNXhsTaO9YljZtDgSIolZOh27zjlARVSIgqItPoxNon+PImUhm+Q7
	7chyXpSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woFUS-000000025N5-2A1A;
	Mon, 27 Jul 2026 07:11:08 +0000
Received: from mail-m158180.netease.com ([47.251.158.180])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woFUL-000000025MA-4BHJ;
	Mon, 27 Jul 2026 07:11:07 +0000
Received: from [172.16.12.90] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 47ade751f;
	Mon, 27 Jul 2026 15:10:53 +0800 (GMT+08:00)
Message-ID: <1335c136-bcde-4579-8fa2-6979cc2498b5@rock-chips.com>
Date: Mon, 27 Jul 2026 15:10:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] drm/rockchip: lvds: add RK3568 support
To: Rok Markovic <rok@kanardia.eu>
Cc: Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Alibek Omarov <a1ba.omarov@gmail.com>
References: <20260724080824.115260-1-rok@kanardia.eu>
 <20260724080824.115260-4-rok@kanardia.eu>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <20260724080824.115260-4-rok@kanardia.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9fa269892b03a7kunmea15989b23663d
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCH05DVh9IQk5OT08eGBkaGlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=UGPjU0mZLwQmWtEeNDT4RhEkykdrjrvZY6r5dUhEAFYb5QcCPYVL28oKtlmGILTWwVk0qk8hqodCoX6kbxgwTD6Gp5nmKbET7LeXfTDJLMgFztGJlzy+5YskAiGninN0yo38TlILrHQahnPykchuOH0t0iYCOU7PLA4PxRQJKvs=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=/3z8MnPosRttYFJu2KNr+MMSKCxn2GoCqgHGcPTcAk0=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_001104_478813_2DCF63BF 
X-CRM114-Status: GOOD (  43.10  )
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

On 7/24/2026 4:08 PM, Rok Markovic wrote:
> The RK3568 LVDS transmitter has no register block of its own. It is
> driven entirely through the GRF and re-uses the MIPI DSI0 D-PHY in
> PHY_MODE_LVDS, which phy-rockchip-inno-dsidphy already supports.
> 
> Based on Alibek Omarov's earlier posting [1], with the changes below.
> 
> Power the D-PHY from the encoder enable path rather than from probe.
> phy_power_on() runs the phy driver's whole LVDS bring-up: PLL and
> bandgap power-on, a settle, PLL mode select, then a reset pulse of the
> serializer and the lane enables. None of that is safe at probe time -
> the GRF has not yet switched the block to LVDS mode (LVDS0_MODE_EN is
> set from rk3568_lvds_poweron(), i.e. the enable path) and the VOP is
> not driving dclk. The serializer is clocked from dclk and latches its
> state coming out of that reset, so it comes up dead and stays dead.
> The failure is silent: every register in the phy, the GRF and the VOP
> reads back exactly as on a working system while the lanes sit at
> common mode and never toggle.
> 
> Program RK3568_LVDS0_DCLK_INV_SEL from the CRTC state's bus_flags so
> the panel's declared pixelclk-active is honoured on the LVDS block as
> well as on the VOP pin polarity. Both have to agree with the edge the
> panel samples on.
> 
> Re-assert RK3568_LVDS0_P2S_EN in rk3568_lvds_poweron().
> rk3568_lvds_poweroff() clears MODE_EN and P2S_EN together, so setting
> P2S_EN once at probe would leave the parallel-to-serial converter off
> after the first disable/enable cycle.
> 
> Use regmap_write() rather than regmap_update_bits() for the GRF. These
> registers are write-masked - the upper 16 bits select which of the
> lower 16 a write may change - so there is nothing to preserve and no
> reason to read first. Passing a FIELD_PREP_WM16() value as both the
> mask and the value of an update_bits() applies the masking twice and
> only works by accident.
> 
> Take no clock. The block exposes no MMIO of its own, so there is
> nothing for the DSI controller's APB clock to reach; the vendor BSP
> scans out LVDS with PCLK_DSITX_0's gate off, and so does this driver.
> 
> Between the above, nothing needs programming at probe at all: the GRF
> is written entirely from the enable path, so px30_lvds_probe() is left
> alone rather than being refactored into a shared phy helper.
> 
> Track the enabled state so that a .enable() that bails out unwinds
> itself and the .disable() that the atomic helpers still call afterwards
> becomes a no-op, rather than underflowing the phy power count and the
> runtime-PM count of an encoder that never came up.
> 
> [1] https://lore.kernel.org/all/20230119184807.171132-1-a1ba.omarov@gmail.com/
> 
> Co-developed-by: Alibek Omarov <a1ba.omarov@gmail.com>
> Signed-off-by: Alibek Omarov <a1ba.omarov@gmail.com>
> Signed-off-by: Rok Markovic <rok@kanardia.eu>
> Assisted-by: Claude:claude-opus-4-8
> ---
> Changes in v2:
>   - Drop the clock. rk3568_lvds_poweron() no longer enables a pclk;
>     the block has no MMIO for the DSI APB clock to reach, and the
>     vendor BSP scans out with PCLK_DSITX_0 gated off.
>   - Merge rk3568_lvds_grf_config() into rk3568_lvds_poweron(): a
>     single masked write to VO_CON2 instead of two, and check the
>     output type before resuming runtime PM.
>   - Balance the enable/disable teardown so a .enable() that fails
>     partway does not underflow the phy power and runtime-PM counts
>     when the atomic helpers then call .disable().
>   - Use pm_runtime_resume_and_get(), matching the rk3288/px30 paths.
>   - Drop the in-code comments restating phy_set_mode() internals and
>     the write-masked GRF convention; the ordering rationale is in the
>     commit message.
> 
>  drivers/gpu/drm/rockchip/rockchip_lvds.c | 124 +++++++++++++++++++++++
>  drivers/gpu/drm/rockchip/rockchip_lvds.h |  10 ++
>  2 files changed, 134 insertions(+)
> 
> diff --git a/drivers/gpu/drm/rockchip/rockchip_lvds.c b/drivers/gpu/drm/rockchip/rockchip_lvds.c
> index 95fa0a9..9af21fc 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_lvds.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_lvds.c
> @@ -51,6 +51,7 @@ struct rockchip_lvds {
>  	struct regmap *grf;
>  	struct clk *pclk;
>  	struct phy *dphy;
> +	bool enabled;
>  	const struct rockchip_lvds_soc_data *soc_data;
>  	int output; /* rgb lvds or dual lvds output */
>  	int format; /* vesa or jeida format */
> @@ -435,6 +436,100 @@ static void px30_lvds_encoder_disable(struct drm_encoder *encoder)
>  	drm_panel_unprepare(lvds->panel);
>  }
>  
> +static int rk3568_lvds_poweron(struct drm_encoder *encoder)
> +{
> +	struct rockchip_lvds *lvds = encoder_to_lvds(encoder);
> +	struct rockchip_crtc_state *s =
> +		to_rockchip_crtc_state(encoder->crtc->state);
> +	bool negedge = !!(s->bus_flags & DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE);
> +	int ret;
> +
> +	if (lvds->output != DISPLAY_OUTPUT_LVDS) {
> +		DRM_DEV_ERROR(lvds->dev, "Unsupported display output %d\n",
> +			      lvds->output);
> +		return -EINVAL;
> +	}
> +
> +	ret = pm_runtime_resume_and_get(lvds->dev);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(lvds->dev, "failed to get pm runtime: %d\n", ret);
> +		return ret;
> +	}
> +
> +	regmap_write(lvds->grf, RK3568_GRF_VO_CON2,
> +		     RK3568_LVDS0_MODE_EN(1) | RK3568_LVDS0_P2S_EN(1) |
> +		     RK3568_LVDS0_DCLK_INV_SEL(negedge));
> +	regmap_write(lvds->grf, RK3568_GRF_VO_CON0,
> +		     RK3568_LVDS0_SELECT(lvds->format) |
> +		     RK3568_LVDS0_MSBSEL(1));
> +
> +	return 0;
> +}
> +
> +static void rk3568_lvds_poweroff(struct rockchip_lvds *lvds)
> +{
> +	regmap_write(lvds->grf, RK3568_GRF_VO_CON2,
> +		     RK3568_LVDS0_MODE_EN(0) | RK3568_LVDS0_P2S_EN(0));
> +
> +	pm_runtime_put(lvds->dev);
> +}
> +
> +static void rk3568_lvds_encoder_enable(struct drm_encoder *encoder)
> +{
> +	struct rockchip_lvds *lvds = encoder_to_lvds(encoder);
> +	int ret;
> +
> +	drm_panel_prepare(lvds->panel);
> +
> +	ret = rk3568_lvds_poweron(encoder);
> +	if (ret) {
> +		DRM_DEV_ERROR(lvds->dev, "failed to power on LVDS: %d\n", ret);
> +		goto err_unprepare;
> +	}
> +
> +	/* The GRF must be in LVDS mode with dclk running before the phy. */
> +	ret = phy_set_mode(lvds->dphy, PHY_MODE_LVDS);
> +	if (ret) {
> +		DRM_DEV_ERROR(lvds->dev, "failed to set phy mode: %d\n", ret);
> +		goto err_poweroff;
> +	}
> +
> +	ret = phy_power_on(lvds->dphy);
> +	if (ret) {
> +		DRM_DEV_ERROR(lvds->dev, "failed to power on phy: %d\n", ret);
> +		goto err_poweroff;
> +	}
> +
> +	lvds->enabled = true;
> +	drm_panel_enable(lvds->panel);
> +	return;
> +
> +err_poweroff:
> +	rk3568_lvds_poweroff(lvds);
> +err_unprepare:
> +	drm_panel_unprepare(lvds->panel);
> +}
> +
> +static void rk3568_lvds_encoder_disable(struct drm_encoder *encoder)
> +{
> +	struct rockchip_lvds *lvds = encoder_to_lvds(encoder);
> +
> +	/*
> +	 * .enable() cannot report failure, so the atomic helpers call this even
> +	 * when it bailed out and already unwound itself. Tear down only what an
> +	 * enable that ran to completion left behind, or the phy power count and
> +	 * the runtime-PM count of a half-enabled encoder underflow.
> +	 */
> +	if (!lvds->enabled)
> +		return;
> +
> +	drm_panel_disable(lvds->panel);
> +	phy_power_off(lvds->dphy);
> +	rk3568_lvds_poweroff(lvds);
> +	drm_panel_unprepare(lvds->panel);
> +	lvds->enabled = false;
> +}
> +
>  static const
>  struct drm_encoder_helper_funcs rk3288_lvds_encoder_helper_funcs = {
>  	.enable = rk3288_lvds_encoder_enable,
> @@ -449,6 +544,13 @@ struct drm_encoder_helper_funcs px30_lvds_encoder_helper_funcs = {
>  	.atomic_check = rockchip_lvds_encoder_atomic_check,
>  };
>  
> +static const
> +struct drm_encoder_helper_funcs rk3568_lvds_encoder_helper_funcs = {
> +	.enable = rk3568_lvds_encoder_enable,
> +	.disable = rk3568_lvds_encoder_disable,
> +	.atomic_check = rockchip_lvds_encoder_atomic_check,
> +};
> +
>  static int rk3288_lvds_probe(struct platform_device *pdev,
>  			     struct rockchip_lvds *lvds)
>  {
> @@ -512,6 +614,17 @@ static int px30_lvds_probe(struct platform_device *pdev,
>  	return phy_power_on(lvds->dphy);
>  }
>  
> +static int rk3568_lvds_probe(struct platform_device *pdev,
> +			     struct rockchip_lvds *lvds)
> +{
> +	/* The phy is powered on from the encoder enable path, not here. */
> +	lvds->dphy = devm_phy_get(&pdev->dev, "dphy");
> +	if (IS_ERR(lvds->dphy))
> +		return PTR_ERR(lvds->dphy);
> +
> +	return phy_init(lvds->dphy);
> +}
> +
>  static const struct rockchip_lvds_soc_data rk3288_lvds_data = {
>  	.probe = rk3288_lvds_probe,
>  	.helper_funcs = &rk3288_lvds_encoder_helper_funcs,
> @@ -522,6 +635,11 @@ static const struct rockchip_lvds_soc_data px30_lvds_data = {
>  	.helper_funcs = &px30_lvds_encoder_helper_funcs,
>  };
>  
> +static const struct rockchip_lvds_soc_data rk3568_lvds_data = {
> +	.probe = rk3568_lvds_probe,
> +	.helper_funcs = &rk3568_lvds_encoder_helper_funcs,
> +};
> +
>  static const struct of_device_id rockchip_lvds_dt_ids[] = {
>  	{
>  		.compatible = "rockchip,rk3288-lvds",
> @@ -531,6 +649,10 @@ static const struct of_device_id rockchip_lvds_dt_ids[] = {
>  		.compatible = "rockchip,px30-lvds",
>  		.data = &px30_lvds_data
>  	},
> +	{
> +		.compatible = "rockchip,rk3568-lvds",
> +		.data = &rk3568_lvds_data
> +	},
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, rockchip_lvds_dt_ids);
> @@ -601,6 +723,8 @@ static int rockchip_lvds_bind(struct device *dev, struct device *master,
>  	encoder = &lvds->encoder.encoder;
>  	encoder->possible_crtcs = drm_of_find_possible_crtcs(drm_dev,
>  							     dev->of_node);
> +	rockchip_drm_encoder_set_crtc_endpoint_id(&lvds->encoder,
> +						  dev->of_node, 0, 0);
>  
>  	ret = drm_simple_encoder_init(drm_dev, encoder, DRM_MODE_ENCODER_LVDS);
>  	if (ret < 0) {
> diff --git a/drivers/gpu/drm/rockchip/rockchip_lvds.h b/drivers/gpu/drm/rockchip/rockchip_lvds.h
> index 2d92447..93d3415 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_lvds.h
> +++ b/drivers/gpu/drm/rockchip/rockchip_lvds.h
> @@ -121,4 +121,14 @@
>  #define   PX30_LVDS_P2S_EN(val)			FIELD_PREP_WM16(BIT(6), (val))
>  #define   PX30_LVDS_VOP_SEL(val)		FIELD_PREP_WM16(BIT(1), (val))
>  
> +#define RK3568_GRF_VO_CON0			0x0360
> +#define   RK3568_LVDS0_SELECT(val)		FIELD_PREP_WM16(GENMASK(5, 4), (val))
> +#define   RK3568_LVDS0_MSBSEL(val)		FIELD_PREP_WM16(BIT(3), (val))
> +
> +#define RK3568_GRF_VO_CON2			0x0368
> +#define   RK3568_LVDS0_DCLK_INV_SEL(val)	FIELD_PREP_WM16(BIT(9), (val))
> +#define   RK3568_LVDS0_DCLK_DIV2_SEL(val)	FIELD_PREP_WM16(BIT(8), (val))
> +#define   RK3568_LVDS0_MODE_EN(val)		FIELD_PREP_WM16(BIT(1), (val))
> +#define   RK3568_LVDS0_P2S_EN(val)		FIELD_PREP_WM16(BIT(0), (val))
> +
>  #endif /* _ROCKCHIP_LVDS_ */

Reviewed-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>

-- 
Best, 
Chaoyi

