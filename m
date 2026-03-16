Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75BA3F46456
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 11:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NWuMfeb2/4fn9JWrO+GHwtoIDUvcuX2oMLSAsprenVc=; b=Vo8F6SSrRFVTXH0roIssPlQC94
	u4NYIMSNPV4yFiBuqN9gHgR57cle8uStnjKrvBb4y6UsR08ObJzzeWixueNuzc1+L08s/lPeVCvVy
	B3U2QQ1+iqh4Vsft1q0gwWlLVArCLc3QWVM79GwxG0OosRM79Mt6lGEv9g/7jg6g81zsS5Mnhd8pz
	oGLP5WAfhzffI84pzTCCxsqLO/yzHNZzMHrWtFAz3sMybLKma/DMWZsgtDCysh7oIHEphEDjc2Pq6
	so0ljthIT9OqT20GBeHIBDDS+TnaYfULIKlUXvrEBRGMa/+NQwJIAEuXSJSJYtlnMDdKOE8t0lzmo
	lw0zwBjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w26Ev-00000003pyW-38Qh;
	Mon, 16 Mar 2026 11:36:05 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w26Es-00000003pwo-1miE;
	Mon, 16 Mar 2026 11:36:03 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1773660934; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=G3xW+OBU2n1UtF7tIuvVvbRZftYRL3d52z3iM+YrUlgdad53aBJWdVMNDN3iY3hTJp/ZotQwruNnnpJy+6g3KNyL3xIBPaN2z93euUPehLwfewjaJ2HXAMq102tJUaRTZoX4Rsz9htqj9vQFFfr8+Rd89tZR7xEq4cCKJeZo9Vc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1773660934; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=NWuMfeb2/4fn9JWrO+GHwtoIDUvcuX2oMLSAsprenVc=; 
	b=BAS/iMv0vMb/He6HewFGGyg6r9uJwMbRuGBZcX+qGRE6z1BQGre+30WsGZpegoUqm6xnd0z+TfdRZqjUBj9ZV35cSbWU6tlaurmGr+wgUcgw+ia37MSJwfDQabNIpWGBQUySS1vqYQUems0QAVUl8yCSDyZpUIOjG/VqI7SxV+I=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773660934;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=NWuMfeb2/4fn9JWrO+GHwtoIDUvcuX2oMLSAsprenVc=;
	b=D/NZ4Sa6LRtelzMRTiiO8lwaBxltSKv99C1UyuCki6/3zq0Lomt6SHpWfdGgTkip
	6qvCzOQLfJLafBBOzQLwVR9BIEDszjCvfKkXG2gQvyrJNEQKgT5UESUCsNzJrL5Ivze
	DFgljv3NAsymuaU9/44F4sJmX7+yolFrWahGpUZY=
Received: by mx.zohomail.com with SMTPS id 1773660933750222.17226611988713;
	Mon, 16 Mar 2026 04:35:33 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, Damon Ding <damon.ding@rock-chips.com>
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, alchark@gmail.com,
 cristian.ciocaltea@collabora.com, sebastian.reichel@collabora.com,
 kever.yang@rock-chips.com, dmitry.baryshkov@oss.qualcomm.com,
 luca.ceresoli@bootlin.com, dianders@chromium.org, m.szyprowski@samsung.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Damon Ding <damon.ding@rock-chips.com>
Subject: Re: [PATCH v1 4/4] drm/rockchip: analogix_dp: Add support for RK3576
Date: Mon, 16 Mar 2026 12:35:24 +0100
Message-ID: <6140062.MhkbZ0Pkbq@workhorse>
In-Reply-To: <20260310105307.309765-5-damon.ding@rock-chips.com>
References: <20260310105307.309765-1-damon.ding@rock-chips.com>
 <20260310105307.309765-5-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_043602_755848_E173C6A1 
X-CRM114-Status: GOOD (  20.92  )
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

On Tuesday, 10 March 2026 11:53:07 Central European Standard Time Damon Ding wrote:
> RK3576 integrates the Analogix eDP 1.3 TX controller IP and the HDMI/eDP
> TX Combo PHY based on a Samsung IP block - both of which are the same as
> those on RK3588.
> 
> The patch currently adds only the basic support, specifically RGB output
> up to 4K@60Hz, without the tests for audio, PSR and other eDP 1.3 specific
> features.
> 
> In additon, the newly added clock 'hclk' is the video datapath clock,
> which must be enabled during probing for RK3576 eDP controller.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  drivers/gpu/drm/rockchip/analogix_dp-rockchip.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> index 832e9766bef0..4f8511636cdf 100644
> --- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> @@ -71,6 +71,7 @@ struct rockchip_dp_device {
>  
>  	struct clk               *pclk;
>  	struct clk               *grfclk;
> +	struct clk               *hclk;
>  	struct regmap            *grf;
>  	struct reset_control     *rst;
>  	struct reset_control     *apbrst;
> @@ -327,6 +328,11 @@ static int rockchip_dp_of_probe(struct rockchip_dp_device *dp)
>  		return dev_err_probe(dev, PTR_ERR(dp->pclk),
>  				     "failed to get pclk property\n");
>  
> +	dp->hclk = devm_clk_get_optional_enabled(dev, "hclk");
> +	if (IS_ERR(dp->hclk))
> +		return dev_err_probe(dev, PTR_ERR(dp->hclk),
> +				     "failed to get hclk property\n");
> +
>  	dp->rst = devm_reset_control_get(dev, "dp");
>  	if (IS_ERR(dp->rst))
>  		return dev_err_probe(dev, PTR_ERR(dp->rst),
> @@ -514,6 +520,14 @@ static const struct rockchip_dp_chip_data rk3288_dp[] = {
>  	{ /* sentinel */ }
>  };
>  
> +static const struct rockchip_dp_chip_data rk3576_edp[] = {
> +	{
> +		.chip_type = RK3576_EDP,
> +		.reg = 0x27dc0000,
> +	},
> +	{ /* sentinel */ }
> +};
> +
>  static const struct rockchip_dp_chip_data rk3588_edp[] = {
>  	{
>  		.edp_mode = GRF_REG_FIELD(0x0000, 0, 0),
> @@ -531,6 +545,7 @@ static const struct rockchip_dp_chip_data rk3588_edp[] = {
>  static const struct of_device_id rockchip_dp_dt_ids[] = {
>  	{.compatible = "rockchip,rk3288-dp", .data = &rk3288_dp },
>  	{.compatible = "rockchip,rk3399-edp", .data = &rk3399_edp },
> +	{.compatible = "rockchip,rk3576-edp", .data = &rk3576_edp },
>  	{.compatible = "rockchip,rk3588-edp", .data = &rk3588_edp },
>  	{}
>  };
> 

Reviewed-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Kind regards,
Nicolas Frattaroli




