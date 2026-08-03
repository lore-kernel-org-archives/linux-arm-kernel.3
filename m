Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E67ACC55184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 11:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vEjfuOOqjt4DKH+Agnkv8+PSzwehlSi9y606REMac8k=; b=nSkEofTWit7RZViNMnE0/9TU4a
	pf+vxWRdV/g9rFl20vgxRej8l6sSEknOaMPnf382w3eXFcFbBCn6u9vp/pshNRo8GwLj5maBuK6m1
	Zu9cYL17HN77+CoWFCB/SL4PxmvAF0kurdXuvEhaXV8vdJGWxG9J+OhxuEfQA44k1ShGIBbpWyDLX
	Gofer8O2qVVSRqMDoLzTRNNgVIYdIDc/fxmkWbltmbdPfQME8iK1sXUzpT6GPbXZxQ8RbTuo+2PJg
	zlUuwiww3IZCSLqlGDi3XDlFGOCHgT/ldV9RncH2zPcfvZ98s8TfL4wN135j2ZdtJLhkDFCHx4rz5
	3YrucGbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqqT2-0000000GuZn-1sbM;
	Mon, 03 Aug 2026 11:04:24 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqqSz-0000000GuYz-3Ga5;
	Mon, 03 Aug 2026 11:04:22 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1785755053; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=hQ0MpJ9A3P3+L5VntZJclLcy7Kg4rETAnyVcG02PM4ZKRrVXL4rNykvlj6OzZPNmIzaKpouofqSulkfv/pCciGwPBoQogvAIhYYDU4mFsbakFPtAXx8X57YZR8GDuYG8uBzy9GGOD9kX/6SBUh2kecXQDTnMO8y4As8xwv8HBRo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1785755053; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=vEjfuOOqjt4DKH+Agnkv8+PSzwehlSi9y606REMac8k=; 
	b=NN0GW/XzKfqszrKUbUDODRNhjmkKYzUOyB1MmRzDhmAQwU7nDT9RiGGccv/lgfr1fuocuK+GpfIX217hiEtoyLXUpyjuB7M6+/u2ZPsMS2BQtl6YWR9F08aykeOOrDl/M5syiQAufm+AbVqDHDRh+Moyt5+6MqJOWdejZhglgzE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=michael.riesch@collabora.com;
	dmarc=pass header.from=<michael.riesch@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785755053;
	s=zohomail; d=collabora.com; i=michael.riesch@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=vEjfuOOqjt4DKH+Agnkv8+PSzwehlSi9y606REMac8k=;
	b=YmslsaxG4pGR0uRF+wFiDwdG+68+XDpe+xbWRA4G5/fEC/yC73+yew9Z3yc40h1r
	7fiV9ZV8CoN5NjdzRpZOupXOJ4zRUOr4w5BpzlxMnGvxFPQJfxPac1ySZ3QVXg/zasg
	peZnfCqRls+GmQbtS0GojJ4U75BGM13gKde5pvfU=
Received: by mx.zohomail.com with SMTPS id 1785755051075901.122732738344;
	Mon, 3 Aug 2026 04:04:11 -0700 (PDT)
Message-ID: <e4a4eef8-3c42-407b-a6b7-e2f9a32da29e@collabora.com>
Date: Mon, 3 Aug 2026 13:04:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] phy: rockchip: phy-rockchip-inno-csidphy: add
 clock lane phase tuning
To: Gerald Loacker <gerald.loacker@wolfvision.net>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260725-feature-mipi-csi-dphy-4k60-v4-0-5b2c4626d31e@wolfvision.net>
 <20260725-feature-mipi-csi-dphy-4k60-v4-3-5b2c4626d31e@wolfvision.net>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20260725-feature-mipi-csi-dphy-4k60-v4-3-5b2c4626d31e@wolfvision.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_040421_891411_ED3E5D00 
X-CRM114-Status: GOOD (  20.31  )
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

Hi Gerald,

On 7/25/26 18:56, Gerald Loacker wrote:
> At high data rates like 4K60 (2500 Mbps), such as when using an
> LT6911GXD bridge chip on an RK3588 board, fixed default timing parameters
> can cause signal integrity issues and clock-data recovery failures.
> The driver currently lacks a mechanism to adjust the clock lane sampling
> phase to compensate for board-specific trace variations.
> 
> Resolve this by parsing and applying the optional 'rockchip,clk-lane-phase'
> device tree property. This enables board-specific tuning of the clock
> lane sampling phase in ~40 ps steps (range 0-7) to optimize link
> stability. If the property is absent, the driver falls back to the
> hardware default.
> 
> Signed-off-by: Gerald Loacker <gerald.loacker@wolfvision.net>

Reviewed-by: Michael Riesch <michael.riesch@collabora.com>

Thanks and best regards,
Michael

> ---
>  drivers/phy/rockchip/phy-rockchip-inno-csidphy.c | 25 ++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c b/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
> index 5281f8dea0ad3..d989f1649b0e4 100644
> --- a/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
> +++ b/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
> @@ -69,6 +69,10 @@
>  #define RK1808_CSIDPHY_CLK_CALIB_EN		0x168
>  #define RK3568_CSIDPHY_CLK_CALIB_EN		0x168
>  
> +#define CSIDPHY_LANE_CLK_3_PHASE		0x38
> +#define CSIDPHY_CLK_PHASE_MASK			GENMASK(6, 4)
> +#define CSIDPHY_CLK_PHASE_DEFAULT		3
> +
>  #define RESETS_MAX				2
>  
>  /*
> @@ -151,6 +155,7 @@ struct rockchip_inno_csidphy {
>  	const struct dphy_drv_data *drv_data;
>  	struct phy_configure_opts_mipi_dphy config;
>  	u8 hsfreq;
> +	int clk_phase;
>  };
>  
>  static inline void write_grf_reg(struct rockchip_inno_csidphy *priv,
> @@ -304,6 +309,13 @@ static int rockchip_inno_csidphy_power_on(struct phy *phy)
>  		rockchip_inno_csidphy_ths_settle(priv, priv->hsfreq,
>  						 CSIDPHY_LANE_THS_SETTLE(i));
>  
> +	if (priv->clk_phase >= 0) {
> +		val = readl(priv->phy_base + CSIDPHY_LANE_CLK_3_PHASE);
> +		val &= ~CSIDPHY_CLK_PHASE_MASK;
> +		val |= FIELD_PREP(CSIDPHY_CLK_PHASE_MASK, priv->clk_phase);
> +		writel(val, priv->phy_base + CSIDPHY_LANE_CLK_3_PHASE);
> +	}
> +
>  	write_grf_reg(priv, GRF_DPHY_CSIPHY_CLKLANE_EN, 0x1);
>  	write_grf_reg(priv, GRF_DPHY_CSIPHY_DATALANE_EN,
>  		      GENMASK(priv->config.lanes - 1, 0));
> @@ -449,6 +461,7 @@ static int rockchip_inno_csidphy_probe(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	struct phy_provider *phy_provider;
>  	struct phy *phy;
> +	u32 phase;
>  	int ret;
>  
>  	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> @@ -464,6 +477,18 @@ static int rockchip_inno_csidphy_probe(struct platform_device *pdev)
>  		return -ENODEV;
>  	}
>  
> +	priv->clk_phase = -1;
> +	if (device_property_read_u32(dev, "rockchip,clk-lane-phase",
> +				     &phase) == 0) {
> +		if (phase > 7) {
> +			dev_warn(dev,
> +				 "invalid rockchip,clk-lane-phase %u, using default %u\n",
> +				 phase, CSIDPHY_CLK_PHASE_DEFAULT);
> +			phase = CSIDPHY_CLK_PHASE_DEFAULT;
> +		}
> +		priv->clk_phase = phase;
> +	}
> +
>  	priv->grf = syscon_regmap_lookup_by_phandle(dev->of_node,
>  						    "rockchip,grf");
>  	if (IS_ERR(priv->grf)) {
> 


