Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09CA6C55179
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 12:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xSDgbFaMy9AXsq0EBdVcXih7ZqDA4mjZqd2Srs2jSzs=; b=vfpYAk7jDGcybHSi8nJQFBQ1HR
	7ZAZ0HSRxw5fmAKkHBbNHP/mQN4WDAisfbM8CBoj5M2sSEIu6mNUaDcYe0DN6XvMgzsOBgxG6gZ6Q
	Tn+wJO9ZmfVWQTNOfsEbzgrRqsPq63mdg6abUJHo7mc7PyWXr+IZIh8t80IHnrP4EIoNZyqx5m8+v
	3wDDoDHcCkYPHNmkQ1JPfwwekhbn7E7k/As7GPovteRIn6i3BkkxCOMfZRGtTsaqD+qHEYcF67Yyf
	wCnZXa4oCqv+cEIfbdFqy9psPtr+zzlP/hXXNe8Yo8XUfAkbVu42YMp9qKF6aDMdHEOEnXqxDp8Rx
	/4vrhsVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqrQT-0000000GzIB-1rb5;
	Mon, 03 Aug 2026 12:05:49 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqrQP-0000000GzHT-2SEB;
	Mon, 03 Aug 2026 12:05:47 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1785758736; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=e4Dg17uHVsTyri3KDQmTiF35rQEIwhN/SObt8mjMLC/qBj/2oQHwYaifQESbQno9BU6v8CzA+cPHNe/abqdCMlaUL0zktLduavpoJlZlt9qKTGFEfBC7pt8ez1JnI4E6I7mGVfT9LFeWYOVCbfq1ysbFGmHreVDsudpGrGNId50=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1785758736; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=xSDgbFaMy9AXsq0EBdVcXih7ZqDA4mjZqd2Srs2jSzs=; 
	b=QDuv/4zbvpdP/Tff9Cio3sMLgPONsSTbKzFh2qdtwENVREZYc8VfdUsirlCxuwiCxy39MBZE5IuVkHt4eJ5Myhol3Xcaih0QcqqceXYV6NUbKv1qX1MCKTp1w5wIJCT9oTyVes/ZvAY+8xBLv89DsQxkK/xgIWlneFtDEJKXkRA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=michael.riesch@collabora.com;
	dmarc=pass header.from=<michael.riesch@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785758736;
	s=zohomail; d=collabora.com; i=michael.riesch@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=xSDgbFaMy9AXsq0EBdVcXih7ZqDA4mjZqd2Srs2jSzs=;
	b=CS/CcCy4wG7nTYQZadcHHzZbxr14Z2aQuuuuGD8aPjufCphH2I+RBRJLXVQ5h6UM
	+8kOrjiJmIz4EukmjS6hzsb5nK44jzTemZy03ngbbp7t/45jfJt4eaSvXG2hPChrGJ+
	hYmNHa4zdxCAlIHCkLGucv3vZ5ws1jhWPhL4cUhY=
Received: by mx.zohomail.com with SMTPS id 1785758734039169.63352621996466;
	Mon, 3 Aug 2026 05:05:34 -0700 (PDT)
Message-ID: <7e55b8bc-d11d-4b25-99ee-d5d181be158f@collabora.com>
Date: Mon, 3 Aug 2026 14:05:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] phy: rockchip-samsung-dcphy: model TX and RX as
 separate PHYs
To: jason98166@gmail.com, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Guochun Huang <hero.huang@rock-chips.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260726-dcphy-rx-v1-v2-0-cf9cc34a412a@gmail.com>
 <20260726-dcphy-rx-v1-v2-3-cf9cc34a412a@gmail.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20260726-dcphy-rx-v1-v2-3-cf9cc34a412a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_050545_687235_7AF14C46 
X-CRM114-Status: GOOD (  35.92  )
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

Hi Jason,

Thanks for the patch!

On 7/26/26 16:55, Jason Yang via B4 Relay wrote:
> From: Jason Yang <jason98166@gmail.com>
> 
> The DC-PHY drives a MIPI DSI transmitter and a MIPI CSI receiver, and on
> RK3588 both can be wired to the same PHY as independent consumers. The
> PHY core reference-counts power_on() per struct phy, so a single struct
> phy cannot bring the two directions up independently.
> 
> Register one struct phy per direction and move the per-direction state
> (direction, PHY type, lane count and powered flag) into its own driver
> data. of_xlate() accepts the legacy single cell as the transmitter and
> an optional second cell that selects the direction, so existing
> single-cell DSI device trees keep resolving to the transmitter.
> configure() rejects the not yet supported receiver before touching any
> state, and each direction keeps its own lane count.
> 
> The PHY's common block contains a single BIAS block shared by both
> directions (RK3588 TRM section 22.2), so it must be programmed only
> once. Whichever direction powers on first enables it; each direction
> records its powered state under the per-provider mutex so that powering
> one direction on does not disturb an already running one. The APB reset
> is issued on the transmitter bring-up path.
> The receiver bring-up itself is added in a later change.
> 
> Signed-off-by: Jason Yang <jason98166@gmail.com>
> Assisted-by: Claude:claude-opus-4-8
> ---
>  drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c | 143 +++++++++++++++-------
>  1 file changed, 102 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
> index d0d77421bd4b..95eb1200cab4 100644
> --- a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
> +++ b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
> @@ -5,6 +5,7 @@
>   *      Guochun Huang <hero.huang@rock-chips.com>
>   */
>  
> +#include <dt-bindings/phy/rockchip,rk3588-mipi-dcphy.h>
>  #include <dt-bindings/phy/phy.h>
>  #include <linux/bitfield.h>
>  #include <linux/clk.h>
> @@ -13,6 +14,7 @@
>  #include <linux/kernel.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/module.h>
> +#include <linux/mutex.h>
>  #include <linux/of.h>
>  #include <linux/phy/phy.h>
>  #include <linux/platform_device.h>
> @@ -280,6 +282,19 @@ struct samsung_mipi_dcphy_plat_data {
>  	u32 dphy_tx_max_lane_kbps;
>  };
>  
> +struct samsung_mipi_dcphy;
> +
> +/* One PHY per direction: transmitter (DSI) and receiver (CSI). */
> +struct samsung_mipi_dcphy_dir {

This may be bike-shedding, but I am not a big fan of the notion of
"direction". This is a combo PHY that in essence contains different
PHYs, so why not call this "samsung_mipi_phy" or something?

> +	struct phy *phy;
> +	struct samsung_mipi_dcphy *parent;
> +	u8 dir;
> +	u8 type;
> +	unsigned int lanes;
> +	/* Written under the parent's lock. */
> +	bool powered;
> +};
> +
>  struct samsung_mipi_dcphy {
>  	struct device *dev;
>  	struct clk *ref_clk;
> @@ -290,9 +305,9 @@ struct samsung_mipi_dcphy {
>  	struct reset_control *s_phy_rst;
>  	struct reset_control *apb_rst;
>  	struct reset_control *grf_apb_rst;
> -	unsigned int lanes;
> -	struct phy *phy;
> -	u8 type;
> +	struct samsung_mipi_dcphy_dir phys[2];

This would look like this then:

	struct samsung_mipi_phy phys[2];

which seems clean and simple to me.

> +	/* Serialises the two directions' access to the shared PHY state. */
> +	struct mutex lock;
>  
>  	const struct samsung_mipi_dcphy_plat_data *pdata;
>  	struct {
> @@ -995,7 +1010,7 @@ static void samsung_mipi_dphy_lane_enable(struct samsung_mipi_dcphy *samsung)
>  	regmap_update_bits(samsung->regmap, DPHY_MC_GNR_CON0,
>  			   PHY_ENABLE, PHY_ENABLE);
>  
> -	switch (samsung->lanes) {
> +	switch (samsung->phys[RK_DCPHY_DIR_TX].lanes) {
>  	case 4:
>  		regmap_write(samsung->regmap, DPHY_MD3_GNR_CON1,
>  			     T_PHY_READY(0x2000));
> @@ -1026,7 +1041,7 @@ static void samsung_mipi_dphy_lane_enable(struct samsung_mipi_dcphy *samsung)
>  
>  static void samsung_mipi_dphy_lane_disable(struct samsung_mipi_dcphy *samsung)
>  {
> -	switch (samsung->lanes) {
> +	switch (samsung->phys[RK_DCPHY_DIR_TX].lanes) {
>  	case 4:
>  		regmap_update_bits(samsung->regmap, DPHY_MD3_GNR_CON0,
>  				   PHY_ENABLE, 0);
> @@ -1334,11 +1349,23 @@ samsung_mipi_dphy_data_lane_timing_init(struct samsung_mipi_dcphy *samsung)
>  
>  static int samsung_mipi_dphy_tx_power_on(struct samsung_mipi_dcphy *samsung)
>  {
> +	bool first = !samsung->phys[RK_DCPHY_DIR_RX].powered;

Note to myself: the lock is acquired in the calling method, all is well.

>  	int ret;
>  
> +	/*
> +	 * The shared BIAS block is brought up by whichever direction powers
> +	 * on first, leaving an already active peer undisturbed.
> +	 */
> +	if (first) {
> +		reset_control_assert(samsung->apb_rst);
> +		udelay(1);
> +		reset_control_deassert(samsung->apb_rst);
> +	}
> +
>  	reset_control_assert(samsung->m_phy_rst);
>  
> -	samsung_mipi_dcphy_bias_block_enable(samsung);
> +	if (first)
> +		samsung_mipi_dcphy_bias_block_enable(samsung);

This approach with the "first" variable seems unintuitive. If you need
reference counting on the BIAS block, then use a state variable
"bias_powered", use a mutex that protects it, and call
samsung_mipi_dcphy_bias_block_{en,dis}able (from
samsung_mipi_dcphy_power{on, off}) unconditionally. Those methods shall
acquire the mutex, check the state variable, {en,dis}able the BIAS
block, set the state variable accordingly, release the mutex.


>  	samsung_mipi_dcphy_pll_configure(samsung);
>  	samsung_mipi_dphy_clk_lane_timing_init(samsung);
>  	samsung_mipi_dphy_data_lane_timing_init(samsung);
> @@ -1368,34 +1395,44 @@ static int samsung_mipi_dphy_tx_power_off(struct samsung_mipi_dcphy *samsung)
>  
>  static int samsung_mipi_dcphy_power_on(struct phy *phy)
>  {
> -	struct samsung_mipi_dcphy *samsung = phy_get_drvdata(phy);
> -
> -	reset_control_assert(samsung->apb_rst);
> -	udelay(1);
> -	reset_control_deassert(samsung->apb_rst);
> +	struct samsung_mipi_dcphy_dir *pd = phy_get_drvdata(phy);

Again, this may be bike-shedding, but "pd" seems misleading to me.
Please reconsider the naming. Maybe "samsung_phy" for the individual PHY
and "samsung" for the complete combo PHY? Or "phy_data" and
"dcphy_data"? ...?

> +	struct samsung_mipi_dcphy *samsung = pd->parent;
> +	int ret;
>  
> -	switch (samsung->type) {
> -	case PHY_TYPE_DPHY:
> -		return samsung_mipi_dphy_tx_power_on(samsung);
> -	default:
> -		/* CPHY part to be implemented later */
> +	if (pd->type != PHY_TYPE_DPHY)
>  		return -EOPNOTSUPP;
> -	}
>  
> -	return 0;
> +	mutex_lock(&samsung->lock);
> +	if (pd->dir == RK_DCPHY_DIR_RX)
> +		ret = -EOPNOTSUPP;
> +	else
> +		ret = samsung_mipi_dphy_tx_power_on(samsung);
> +	if (!ret)
> +		pd->powered = true;

Not sure whether you actually need to track the power status of the
individual PHYs (maybe you actually need to track the BIAS block status
alone) but anyway I would appreciate if
"samsung_mipi_dphy_tx_power_{on,off}" would set the "pd->powered" variable.

Best regards,
Michael


> +	mutex_unlock(&samsung->lock);
> +
> +	return ret;
>  }
>  
>  static int samsung_mipi_dcphy_power_off(struct phy *phy)
>  {
> -	struct samsung_mipi_dcphy *samsung = phy_get_drvdata(phy);
> +	struct samsung_mipi_dcphy_dir *pd = phy_get_drvdata(phy);
> +	struct samsung_mipi_dcphy *samsung = pd->parent;
> +	int ret;
>  
> -	switch (samsung->type) {
> -	case PHY_TYPE_DPHY:
> -		return samsung_mipi_dphy_tx_power_off(samsung);
> -	default:
> -		/* CPHY part to be implemented later */
> +	if (pd->type != PHY_TYPE_DPHY)
>  		return -EOPNOTSUPP;
> -	}
> +
> +	if (pd->dir == RK_DCPHY_DIR_RX)
> +		return -EOPNOTSUPP;
> +
> +	mutex_lock(&samsung->lock);
> +	ret = samsung_mipi_dphy_tx_power_off(samsung);
> +	if (!ret)
> +		pd->powered = false;
> +	mutex_unlock(&samsung->lock);
> +
> +	return ret;
>  }
>  
>  static int
> @@ -1488,10 +1525,14 @@ samsung_mipi_dcphy_pll_calc_rate(struct samsung_mipi_dcphy *samsung,
>  static int samsung_mipi_dcphy_configure(struct phy *phy,
>  					union phy_configure_opts *opts)
>  {
> -	struct samsung_mipi_dcphy *samsung = phy_get_drvdata(phy);
> +	struct samsung_mipi_dcphy_dir *pd = phy_get_drvdata(phy);
> +	struct samsung_mipi_dcphy *samsung = pd->parent;
>  	unsigned long long target_rate = opts->mipi_dphy.hs_clk_rate;
>  
> -	samsung->lanes = opts->mipi_dphy.lanes > 4 ? 4 : opts->mipi_dphy.lanes;
> +	if (pd->dir == RK_DCPHY_DIR_RX)
> +		return -EOPNOTSUPP;
> +
> +	pd->lanes = opts->mipi_dphy.lanes > 4 ? 4 : opts->mipi_dphy.lanes;
>  
>  	samsung_mipi_dcphy_pll_calc_rate(samsung, target_rate);
>  	opts->mipi_dphy.hs_clk_rate = samsung->pll.rate;
> @@ -1501,16 +1542,16 @@ static int samsung_mipi_dcphy_configure(struct phy *phy,
>  
>  static int samsung_mipi_dcphy_init(struct phy *phy)
>  {
> -	struct samsung_mipi_dcphy *samsung = phy_get_drvdata(phy);
> +	struct samsung_mipi_dcphy_dir *pd = phy_get_drvdata(phy);
>  
> -	return pm_runtime_resume_and_get(samsung->dev);
> +	return pm_runtime_resume_and_get(pd->parent->dev);
>  }
>  
>  static int samsung_mipi_dcphy_exit(struct phy *phy)
>  {
> -	struct samsung_mipi_dcphy *samsung = phy_get_drvdata(phy);
> +	struct samsung_mipi_dcphy_dir *pd = phy_get_drvdata(phy);
>  
> -	pm_runtime_put(samsung->dev);
> +	pm_runtime_put(pd->parent->dev);
>  
>  	return 0;
>  }
> @@ -1536,19 +1577,29 @@ static struct phy *samsung_mipi_dcphy_xlate(struct device *dev,
>  					    const struct of_phandle_args *args)
>  {
>  	struct samsung_mipi_dcphy *samsung = dev_get_drvdata(dev);
> +	struct samsung_mipi_dcphy_dir *pd;
> +	u8 dir = RK_DCPHY_DIR_TX;
>  
> -	if (args->args_count != 1) {
> +	if (args->args_count < 1 || args->args_count > 2) {
>  		dev_err(dev, "invalid number of arguments\n");
>  		return ERR_PTR(-EINVAL);
>  	}
>  
> -	if (samsung->type != PHY_NONE && samsung->type != args->args[0])
> -		dev_warn(dev, "phy type select %d overwriting type %d\n",
> -			 args->args[0], samsung->type);
> +	if (args->args_count == 2) {
> +		if (args->args[1] > RK_DCPHY_DIR_RX) {
> +			dev_err(dev, "invalid direction %u\n", args->args[1]);
> +			return ERR_PTR(-EINVAL);
> +		}
> +		dir = args->args[1];
> +	}
>  
> -	samsung->type = args->args[0];
> +	pd = &samsung->phys[dir];
> +	if (pd->type != PHY_NONE && pd->type != args->args[0])
> +		dev_warn(dev, "phy type select %u overwriting type %u\n",
> +			 args->args[0], pd->type);
> +	pd->type = args->args[0];
>  
> -	return samsung->phy;
> +	return pd->phy;
>  }
>  
>  static int samsung_mipi_dcphy_probe(struct platform_device *pdev)
> @@ -1559,6 +1610,7 @@ static int samsung_mipi_dcphy_probe(struct platform_device *pdev)
>  	struct phy_provider *phy_provider;
>  	struct resource *res;
>  	void __iomem *regs;
> +	unsigned int i;
>  	int ret;
>  
>  	samsung = devm_kzalloc(dev, sizeof(*samsung), GFP_KERNEL);
> @@ -1568,6 +1620,7 @@ static int samsung_mipi_dcphy_probe(struct platform_device *pdev)
>  	samsung->dev = dev;
>  	samsung->pdata = device_get_match_data(dev);
>  	platform_set_drvdata(pdev, samsung);
> +	mutex_init(&samsung->lock);
>  
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	regs = devm_ioremap_resource(dev, res);
> @@ -1613,11 +1666,19 @@ static int samsung_mipi_dcphy_probe(struct platform_device *pdev)
>  		return dev_err_probe(dev, PTR_ERR(samsung->grf_apb_rst),
>  				     "Failed to get system grf_apb_rst control\n");
>  
> -	samsung->phy = devm_phy_create(dev, NULL, &samsung_mipi_dcphy_ops);
> -	if (IS_ERR(samsung->phy))
> -		return dev_err_probe(dev, PTR_ERR(samsung->phy), "Failed to create MIPI DC-PHY\n");
> +	for (i = 0; i < ARRAY_SIZE(samsung->phys); i++) {
> +		struct phy *phy = devm_phy_create(dev, NULL,
> +						  &samsung_mipi_dcphy_ops);
>  
> -	phy_set_drvdata(samsung->phy, samsung);
> +		if (IS_ERR(phy))
> +			return dev_err_probe(dev, PTR_ERR(phy),
> +					     "Failed to create MIPI DC-PHY\n");
> +
> +		samsung->phys[i].phy = phy;
> +		samsung->phys[i].parent = samsung;
> +		samsung->phys[i].dir = i;
> +		phy_set_drvdata(phy, &samsung->phys[i]);
> +	}
>  
>  	ret = devm_pm_runtime_enable(dev);
>  	if (ret)
> 


