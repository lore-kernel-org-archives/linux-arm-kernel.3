Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 259FFC79F99
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 11:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cC9s+xjh/N6rSZarsENmP07faEM7u9hQPQhDsNCtyb0=; b=QPoyFBLrW7XWlU6mRzTYB9wVOa
	RZUvTl91WHxbIqhosNvnZagkxcZvQXbmYrjGJYlYuaY0g6yXyUckMfKalsX0OJcQha0/J6MlrR1jT
	sL/zSr1hPR7QAgt61JelftVknBYcNz5OLN54Vs2CLb+OSuv+h2m9qdlJT6JzVdEu1ppk2PXHPrIUS
	yPHwZWK7a0kJlvd7xsZTQZiCdRvcRSxtUi3QX+11+bA3htgF7a8AQAv4BDQuNeYUvHVgkWb/JhH5O
	dtlef6hX0Uun66pmjtEk+AsX8UJlDS6XG23FV2XTKKuu6GGtmVqo7AnXq4Wfv6npTi2WMKlIKJRCk
	MwQ5ancg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3X7I-00000006bDT-3XMe;
	Mon, 07 Sep 2026 11:02:24 +0000
Received: from sender6-pp-f112.zoho.com ([165.173.180.112])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3X7G-00000006bCx-1UbP;
	Mon, 07 Sep 2026 11:02:23 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1788778937; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cEkx9n2gZuP37kraYeyo8ckYdvOQw3Bks6OBB3ybxuaeCa9v2srFeNcZe3RspQphrarocYxCysSzUQTmaWLTO8qJyH8CHJdIAIN9mDB334Zi7RAqvL9QtWpullrdkw/FRLGnQK1iku1WExCBmy/PDM99t8s2yB+MJqlhJGjcr3Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788778937; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=cC9s+xjh/N6rSZarsENmP07faEM7u9hQPQhDsNCtyb0=; 
	b=nokuVz3EzgMlIDAQQD0EyZ/sgynSKqUBe1CtThToD87q8rWS1oqPeTjTeos41lM5gE58dvkaWBn2gUQUMBYHVYncglSkyxBw0j2VOFFhT2WWTlN9LPIiYToFbq2SH7uZPfWx8CdhTubspYR5Y5hoaA4/IpQXPQ2YSQU4/Yy3tCw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=michael.riesch@collabora.com;
	dmarc=pass header.from=<michael.riesch@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788778937;
	s=zohomail; d=collabora.com; i=michael.riesch@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=cC9s+xjh/N6rSZarsENmP07faEM7u9hQPQhDsNCtyb0=;
	b=OfTx4OYBkz+3DmyYt2yyy3sr1yA5iGgH6LnzNJFIqlMOPD+1y9nrk0MGJ8Dvvy8E
	2ntbXswE9cxAu1B1JMFu9iBBekfkhKsqXoQ7NlixIR89DMKl4/IqqxJDKIy8ZKzDZTN
	UmUfVJW8XldqdvY1VzKB6OWAC5JWccpXdWCVPl48=
Received: by mx.zohomail.com with SMTPS id 1788778934224927.534650195504;
	Mon, 7 Sep 2026 04:02:14 -0700 (PDT)
Message-ID: <0ab0b4f4-ab5d-413b-9446-5d747c59a32a@collabora.com>
Date: Mon, 7 Sep 2026 13:02:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] phy: rockchip: phy-rockchip-inno-csidphy: add support
 for rk3576 variant
To: Amin Gattout <amin.gattout@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org
References: <20260820-rk3576-dphy-v1-0-70e25e8d5e78@gmail.com>
 <20260820-rk3576-dphy-v1-3-70e25e8d5e78@gmail.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20260820-rk3576-dphy-v1-3-70e25e8d5e78@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_040222_430438_66C475A4 
X-CRM114-Status: GOOD (  16.77  )
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

Hi Amin,

Thanks for your patches!

On 8/20/26 16:01, Amin Gattout wrote:
> The two RK3576 MIPI CSI-2 DPHYs can be supported using the existing
> phy-rockchip-inno-csidphy driver, the notable difference with the
> RK3588 variant being that each PHY instance only has an APB reset
> line.
> 
> Signed-off-by: Amin Gattout <amin.gattout@gmail.com>
> ---
>  drivers/phy/rockchip/phy-rockchip-inno-csidphy.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c b/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
> index c79fb53d8ee5..24aefdcd6361 100644
> --- a/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
> +++ b/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
> @@ -30,6 +30,7 @@
>  #define RK3568_GRF_VI_CON0		0x0340
>  #define RK3568_GRF_VI_CON1		0x0344
>  
> +#define RK3576_CSIDPHY_GRF_CON0		0x0000

This, ...

>  #define RK3588_CSIDPHY_GRF_CON0		0x0000
>  
>  /* PHY */
> @@ -119,6 +120,12 @@ static const struct dphy_reg rk3568_grf_dphy_regs[] = {
>  	[GRF_DPHY_CSIPHY_CLKLANE_EN] = PHY_REG(RK3568_GRF_VI_CON0, 1, 8),
>  };
>  
> +static const struct dphy_reg rk3576_grf_dphy_regs[] = {
> +	[GRF_DPHY_CSIPHY_FORCERXMODE] = PHY_REG(RK3576_CSIDPHY_GRF_CON0, 4, 0),
> +	[GRF_DPHY_CSIPHY_DATALANE_EN] = PHY_REG(RK3576_CSIDPHY_GRF_CON0, 4, 4),
> +	[GRF_DPHY_CSIPHY_CLKLANE_EN] = PHY_REG(RK3576_CSIDPHY_GRF_CON0, 1, 8),
> +};
> +

and this look pretty identical to RK3588, can't we just drop these two
and ...

>  static const struct dphy_reg rk3588_grf_dphy_regs[] = {
>  	[GRF_DPHY_CSIPHY_FORCERXMODE] = PHY_REG(RK3588_CSIDPHY_GRF_CON0, 4, 0),
>  	[GRF_DPHY_CSIPHY_DATALANE_EN] = PHY_REG(RK3588_CSIDPHY_GRF_CON0, 4, 4),
> @@ -403,6 +410,17 @@ static const struct dphy_drv_data rk3568_mipidphy_drv_data = {
>  	.resets_num = ARRAY_SIZE(rk3368_reset_names),
>  };
>  
> +static const struct dphy_drv_data rk3576_mipidphy_drv_data = {
> +	.pwrctl_offset = -1,
> +	.ths_settle_offset = RK3568_CSIDPHY_CLK_WR_THS_SETTLE,
> +	.calib_offset = RK3568_CSIDPHY_CLK_CALIB_EN,
> +	.hsfreq_ranges = rk1808_mipidphy_hsfreq_ranges,
> +	.num_hsfreq_ranges = ARRAY_SIZE(rk1808_mipidphy_hsfreq_ranges),
> +	.grf_regs = rk3576_grf_dphy_regs,

... use rk3588_grf_dphy_regs here?

> +	.resets = rk3368_reset_names,

So that the reset names are the only difference to RK3588 (which seems
to be the case as per commit message)?

> +	.resets_num = ARRAY_SIZE(rk3368_reset_names),
> +};
> +
>  static const struct dphy_drv_data rk3588_mipidphy_drv_data = {
>  	.pwrctl_offset = -1,
>  	.ths_settle_offset = RK3568_CSIDPHY_CLK_WR_THS_SETTLE,
> @@ -435,6 +453,10 @@ static const struct of_device_id rockchip_inno_csidphy_match_id[] = {
>  		.compatible = "rockchip,rk3568-csi-dphy",
>  		.data = &rk3568_mipidphy_drv_data,
>  	},
> +	{
> +		.compatible = "rockchip,rk3576-csi-dphy",
> +		.data = &rk3576_mipidphy_drv_data,
> +	},
>  	{
>  		.compatible = "rockchip,rk3588-csi-dphy",
>  		.data = &rk3588_mipidphy_drv_data,
> 

Apart from that LGTM!

Best regards,
Michael


