Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAB81CD4846
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 01:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RI1LKPQBSFQGNx/RTpgPitop3o0KUtZZu7uLCufWIB0=; b=iMNBBgQall0TQwuyEQgXGbHBKN
	xIWJZWuJRF4eyzg4sUp7wDeWZ4TUrlEf4xXdiGQFr0E8b9oFZld9tSEpnwH8iPqhKPMNikbbjHhdI
	FhOo3qo/6chEaoJml+G2OPfP3cCpEO3OJQcmH2RFuuz5Uny3wJ7dfN9BdiP+Pf302qIUz59YL7jud
	9cJDPBQIuTdwAunLkxDm6PamxQTNixN9Onl3cVT8/Y2oUCSnKtZmHLfqCgOIvpzALi/55wooCfUup
	Ve7jRPa8W2NJ2DgGDRKUcFpisLONzFH77Jr6vyyOxbiy8sRvZmpdnu6mOCIY8tjkkUES0zaC6Lhs/
	N3RT5MHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMbcR-0000000F916-0c96;
	Tue, 12 May 2026 01:09:07 +0000
Received: from smtpbgbr1.qq.com ([54.207.19.206])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMbcN-0000000F8yx-1ixH;
	Tue, 12 May 2026 01:09:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1778548078;
	bh=RI1LKPQBSFQGNx/RTpgPitop3o0KUtZZu7uLCufWIB0=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=S7A2YmsA6fEl5C3RBQpGxMay4ow2yaS4xbRCSOgVLwOvjdC6xKdiAXhtJPRpmhLK/
	 kLC8mXrPexkxCAVV8/weIrTfyuxe1XfeRkV5eYOyPNYaWnrhf2Zez8lRlFfg+8Sjyy
	 rpyOJZI+zkbwpteo/edngd/MLjgz3llCPIZybGC4=
X-QQ-mid: zesmtpgz6t1778548076ta5496fac
X-QQ-Originating-IP: VqDSdyIt6ayYF87ktnGO0QYcuHE+i5xXTIoANh/OHyk=
Received: from [172.16.12.51] ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 12 May 2026 09:07:54 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 628164798136935440
EX-QQ-RecipientCnt: 14
Message-ID: <90EB6258578AF9E7+a9f8705d-48dc-4a3f-809a-fef9c8a5674e@airkyi.com>
Date: Tue, 12 May 2026 09:07:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/rockchip: dsi: Add maximum per lane bit rate
 calculation
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Chaoyi Chen <kernel@airkyi.com>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Guochun Huang <hero.huang@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260324085838.90-1-kernel@airkyi.com>
Content-Language: en-US
From: Chaoyi Chen <kernel@airkyi.com>
In-Reply-To: <20260324085838.90-1-kernel@airkyi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: Ma4CB9LXNscG/qoZMz1+xRUpjQmuWBwkmEd1e5BhyZgZasHwpQcL3CCd
	Bp6JEOT9t0EBSUdRKsJaxI6S9Xx77aG+4tvSbXW3aRf4gsno0L61YSL9d+XLUIYgfkhgmI5
	0cuFF752v/L7YVrJypVxQ22aGLbRp/WNyRLQQhRT7+OKgEpdZotP1TH1pxDmJatUwVyfGie
	lCv+i9du/4s3fKjQvGt7TD+qqGzDNQUsMLMmkQXSzXboq41qTXqi9BPxvwZxhd+ioEdXbvK
	qCm0Y/mvg0OGKyeTXFbXmITlZnI3He+IcgluGz3x95xsrCOjqz5NAfaMqbfdKXKh+c74KBu
	Pw41phwa2qKPMcyQ4ZSB9/mQ0zRBzQzMI8Oy+1T8jTp5bxT8VhxG+IBD+ZHLpM59dl5UJJD
	MKFB+Vn/tZEzpun2tcZ+DcexTpWYHBNeAiSdQSjV3AKngJyeh6ZtkVd7tijibmKwAKTZg9y
	DkmO04sb85SNvLIyoxVjxual7KLLLYYl6uwFnP6VSqFiPnaNQ1Ay+IjXTLDqRgTg1ejN3Jq
	GiwuKP7zylRsRZbEIl+l9auDjCPtgDpZCVhyiNtPhg1IXSBOtZ/PH2s6YeJAK/57SJ7RGbb
	ak0SpGrhIw0Kzx9QxTgpSdwMOyfW7RYUapU6MRHeCfvd/2e5QQNswNUah58Ig7AK3WVy9Mv
	b2hQgVmHiTTP6wlSjC79h+2KElMR06GinKZJh19x8STZSnX9fRE2DsxaI6bOd++/RHYnZSs
	08rz0ZRh+uFueKGZkL1jfOxpv/CFL5O6Jlbf6mHqmU5Z7r8Si4Lg9CYvV43lA7RaT40wq8t
	MkTSiWl3xLh5rKTHHCQgQ/eYFZPd/CmN9s1eLIVY4RDivxeqfkoBLVI4xNjVXt5Mm5mzmUZ
	r9Ukv70kTzMR+r6HDe1KhOrbmy+2MRJ8UtOdUbwVfiy8+4mGNfD5qq8zhDtES7MLmkRPnvH
	46Q3uYLs4gAOIcXZBBPGBQM6bRF1yvspCUk5VFzYWJE1mPhYrXU4IUA6S1YXnV9Tst5cmKb
	T4RXiVmEQXPOaQaJ4a
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_180904_282294_8168266D 
X-CRM114-Status: GOOD (  18.90  )
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

Hi,

On 3/24/2026 4:58 PM, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> Different chips have varying support for the maximum bit rate per lane.
> 
> Add calculation for the maximum per lane bit rate for various chip
> platforms, and relax the bandwidth margin requirements.
> 
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> ---
>  .../gpu/drm/rockchip/dw-mipi-dsi-rockchip.c   | 21 +++++++++++++++----
>  1 file changed, 17 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
> index 3547d91b25d3..d3bacfae174e 100644
> --- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
> @@ -268,6 +268,7 @@ struct rockchip_dw_dsi_chip_data {
>  
>  	unsigned int flags;
>  	unsigned int max_data_lanes;
> +	unsigned long max_bit_rate_per_lane;
>  };
>  
>  struct dw_mipi_dsi_rockchip {
> @@ -565,7 +566,7 @@ dw_mipi_dsi_get_lane_mbps(void *priv_data, const struct drm_display_mode *mode,
>  	int bpp;
>  	unsigned long mpclk, tmp;
>  	unsigned int target_mbps = 1000;
> -	unsigned int max_mbps = dppa_map[ARRAY_SIZE(dppa_map) - 1].max_mbps;
> +	unsigned int max_mbps;
>  	unsigned long best_freq = 0;
>  	unsigned long fvco_min, fvco_max, fin, fout;
>  	unsigned int min_prediv, max_prediv;
> @@ -573,6 +574,7 @@ dw_mipi_dsi_get_lane_mbps(void *priv_data, const struct drm_display_mode *mode,
>  	unsigned long _fbdiv, best_fbdiv;
>  	unsigned long min_delta = ULONG_MAX;
>  
> +	max_mbps = dsi->cdata->max_bit_rate_per_lane;
>  	dsi->format = format;
>  	bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
>  	if (bpp < 0) {
> @@ -584,8 +586,8 @@ dw_mipi_dsi_get_lane_mbps(void *priv_data, const struct drm_display_mode *mode,
>  
>  	mpclk = DIV_ROUND_UP(mode->clock, MSEC_PER_SEC);
>  	if (mpclk) {
> -		/* take 1 / 0.8, since mbps must big than bandwidth of RGB */
> -		tmp = mpclk * (bpp / lanes) * 10 / 8;
> +		/* take 1 / 0.9, since mbps must big than bandwidth of RGB */
> +		tmp = mpclk * (bpp / lanes) * 10 / 9;
>  		if (tmp < max_mbps)
>  			target_mbps = tmp;
>  		else
> @@ -595,7 +597,7 @@ dw_mipi_dsi_get_lane_mbps(void *priv_data, const struct drm_display_mode *mode,
>  
>  	/* for external phy only a the mipi_dphy_config is necessary */
>  	if (dsi->phy) {
> -		phy_mipi_dphy_get_default_config(mode->clock * 1000 * 10 / 8,
> +		phy_mipi_dphy_get_default_config(mode->clock * 1000 * 10 / 9,
>  						 bpp, lanes,
>  						 &dsi->phy_opts.mipi_dphy);
>  		dsi->lane_mbps = target_mbps;
> @@ -1503,6 +1505,7 @@ static const struct rockchip_dw_dsi_chip_data px30_chip_data[] = {
>  						PX30_DSI_FORCETXSTOPMODE), 0),
>  
>  		.max_data_lanes = 4,
> +		.max_bit_rate_per_lane = 1000000000UL,
>  	},
>  	{ /* sentinel */ }
>  };
> @@ -1515,6 +1518,7 @@ static const struct rockchip_dw_dsi_chip_data rk3128_chip_data[] = {
>  						RK3128_DSI_FORCERXMODE |
>  						RK3128_DSI_FORCETXSTOPMODE), 0),
>  		.max_data_lanes = 4,
> +		.max_bit_rate_per_lane = 1000000000UL,
>  	},
>  	{ /* sentinel */ }
>  };
> @@ -1527,6 +1531,7 @@ static const struct rockchip_dw_dsi_chip_data rk3288_chip_data[] = {
>  		.lcdsel_lit = FIELD_PREP_WM16_CONST(RK3288_DSI0_LCDC_SEL, 1),
>  
>  		.max_data_lanes = 4,
> +		.max_bit_rate_per_lane = 1500000000UL,
>  	},
>  	{
>  		.reg = 0xff964000,
> @@ -1535,6 +1540,7 @@ static const struct rockchip_dw_dsi_chip_data rk3288_chip_data[] = {
>  		.lcdsel_lit = FIELD_PREP_WM16_CONST(RK3288_DSI1_LCDC_SEL, 1),
>  
>  		.max_data_lanes = 4,
> +		.max_bit_rate_per_lane = 1500000000UL,
>  	},
>  	{ /* sentinel */ }
>  };
> @@ -1547,6 +1553,7 @@ static const struct rockchip_dw_dsi_chip_data rk3368_chip_data[] = {
>  						RK3368_DSI_FORCETXSTOPMODE |
>  						RK3368_DSI_FORCERXMODE), 0),
>  		.max_data_lanes = 4,
> +		.max_bit_rate_per_lane = 1500000000UL,
>  	},
>  	{ /* sentinel */ }
>  };
> @@ -1634,6 +1641,7 @@ static const struct rockchip_dw_dsi_chip_data rk3399_chip_data[] = {
>  
>  		.flags = DW_MIPI_NEEDS_PHY_CFG_CLK | DW_MIPI_NEEDS_GRF_CLK,
>  		.max_data_lanes = 4,
> +		.max_bit_rate_per_lane = 1500000000UL,
>  	},
>  	{
>  		.reg = 0xff968000,
> @@ -1658,6 +1666,7 @@ static const struct rockchip_dw_dsi_chip_data rk3399_chip_data[] = {
>  
>  		.flags = DW_MIPI_NEEDS_PHY_CFG_CLK | DW_MIPI_NEEDS_GRF_CLK,
>  		.max_data_lanes = 4,
> +		.max_bit_rate_per_lane = 1500000000UL,
>  
>  		.dphy_rx_init = rk3399_dphy_tx1rx1_init,
>  		.dphy_rx_power_on = rk3399_dphy_tx1rx1_power_on,
> @@ -1674,6 +1683,7 @@ static const struct rockchip_dw_dsi_chip_data rk3506_chip_data[] = {
>  			     FIELD_PREP_WM16_CONST(RK3506_DSI_FORCERXMODE, 0) |
>  			     FIELD_PREP_WM16_CONST(RK3506_DSI_FORCETXSTOPMODE, 0)),
>  		.max_data_lanes = 2,
> +		.max_bit_rate_per_lane = 1500000000UL,
>  	},
>  	{ /* sentinel */ }
>  };
> @@ -1687,6 +1697,7 @@ static const struct rockchip_dw_dsi_chip_data rk3568_chip_data[] = {
>  			     FIELD_PREP_WM16_CONST(RK3568_DSI0_TURNDISABLE, 0) |
>  			     FIELD_PREP_WM16_CONST(RK3568_DSI0_FORCERXMODE, 0)),
>  		.max_data_lanes = 4,
> +		.max_bit_rate_per_lane = 1200000000UL,
>  	},
>  	{
>  		.reg = 0xfe070000,
> @@ -1696,6 +1707,7 @@ static const struct rockchip_dw_dsi_chip_data rk3568_chip_data[] = {
>  			     FIELD_PREP_WM16_CONST(RK3568_DSI1_TURNDISABLE, 0) |
>  			     FIELD_PREP_WM16_CONST(RK3568_DSI1_FORCERXMODE, 0)),
>  		.max_data_lanes = 4,
> +		.max_bit_rate_per_lane = 1200000000UL,
>  	},
>  	{ /* sentinel */ }
>  };
> @@ -1708,6 +1720,7 @@ static const struct rockchip_dw_dsi_chip_data rv1126_chip_data[] = {
>  			     FIELD_PREP_WM16_CONST(RV1126_DSI_FORCERXMODE, 0) |
>  			     FIELD_PREP_WM16_CONST(RV1126_DSI_FORCETXSTOPMODE, 0)),
>  		.max_data_lanes = 4,
> +		.max_bit_rate_per_lane = 1000000000UL,
>  	},
>  	{ /* sentinel */ }
>  };

Gentle ping about this.

Thanks!

-- 
Best, 
Chaoyi



