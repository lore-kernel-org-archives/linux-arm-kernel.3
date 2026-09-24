Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED440C9830D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 03:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GnL12Vnum1RDeStFlpQsv96wIifa5ytBlttslMHCaew=; b=TPZ/4LpKq20ns2JqdHfkpxURGf
	yo0OKNnh0XcfT7ZoTbbg/LJM9CKaPVzWxkvM2eKcV7NDDyO0/HmM7XZOnolP4OWRbxm40PNc9U98x
	YR0EisNJ3An0om8GcZV0AmLMeqSkn8PyJUtU+WRgnH3YfEOmgphNjHRUyeeHlMFwWX2BF0v6cQKAJ
	PtokqSsNSVPoEBtACsXEuaspedOx3e2yTc9Ik2nJfA3BO1SX/cJAoUHtE8EPl4fRkDKptin1YFJqP
	o1MLd+zdtXZsyhqAUQQZzQ/hKgDkUO5ZQLK0d/r99M+er0yxpdPS1w+0ft/fFLyJwoSTdXWY679N5
	i2Z7kl5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9a4W-00000009vqc-1iME;
	Thu, 24 Sep 2026 03:24:32 +0000
Received: from mail-m128202.netease.com ([103.209.128.202])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9a4S-00000009vpi-29UG;
	Thu, 24 Sep 2026 03:24:31 +0000
Received: from [172.16.12.74] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4ef5e07a0;
	Thu, 24 Sep 2026 11:24:13 +0800 (GMT+08:00)
Message-ID: <0ef54850-6919-4a29-a8df-586a3dc2de5f@rock-chips.com>
Date: Thu, 24 Sep 2026 11:24:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RSEND] drm/bridge: analogix_dp: use
 devm_phy_optional_get() for the DP PHY
To: Jun Yan <jerrysteve1101@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Heiko Stuebner <heiko@sntech.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
References: <20260924020417.868588-1-jerrysteve1101@gmail.com>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <20260924020417.868588-1-jerrysteve1101@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0aa0d17137df03a8kunma7ac608b17ff1d
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaSE0eVh4YTE5DGEpITU9DQ1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=S7TGv+sarLalZd+G1aldyflaBCPFJ/ccsGyJ1o7TbseyJqzgBAmed4IpDZ8RkxRwit1P2Tcveh1nWdsQO5Do+H0YIVY3p5ZFYQIm8HVHJoek7D3BXK8RLRXX/OHgp0FmwCe/Suw5h1IgqztLmiKoMNCcsXU5e5Tj/9l3hEGOI4c=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=GnL12Vnum1RDeStFlpQsv96wIifa5ytBlttslMHCaew=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_202429_539957_7CC5FC0F 
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

Hi Jun,

On 9/24/2026 10:04 AM, Jun Yan wrote:
> The DP PHY is optional: the Rockchip RK3399 eDP controller (used as the
> internal eDP port) has no separate PHY device and relies on its built-in
> PHY, which is programmed directly through the GRF registers, so its DT
> node carries no "phys"/"phy-names" property.
> 
> Requesting the PHY with devm_phy_get() therefore returns -ENODEV (or
> -ENOSYS when CONFIG_GENERIC_PHY is disabled) and the driver logs a
> misleading "no DP phy configured" error at probe time before falling back
> to a NULL phy.
> 
> Use devm_phy_optional_get() instead, which returns NULL when the PHY is
> absent and otherwise behaves identically, and drop the manual -ENODEV/
> -ENOSYS handling. This also removes the spurious error message.
> 
> Assisted-by: Claude:deepseek-v4-flash
> Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
> ---
>   .../gpu/drm/bridge/analogix/analogix_dp_core.c | 18 +++---------------
>   1 file changed, 3 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> index 18e76d1e78e1..28eb668d3e3f 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -1427,21 +1427,9 @@ analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
>   	if (ret)
>   		return ERR_PTR(ret);
>   
> -	dp->phy = devm_phy_get(dp->dev, "dp");
> -	if (IS_ERR(dp->phy)) {
> -		dev_err(dp->dev, "no DP phy configured\n");
> -		ret = PTR_ERR(dp->phy);
> -		if (ret) {
> -			/*
> -			 * phy itself is not enabled, so we can move forward
> -			 * assigning NULL to phy pointer.
> -			 */
> -			if (ret == -ENOSYS || ret == -ENODEV)
> -				dp->phy = NULL;
> -			else
> -				return ERR_PTR(ret);
> -		}
> -	}

It should be better to add some comments here:

/*
  * Exynos5/RK3288/RK3399 use Analogix DP controller built-in PHY,
  * no separate PHY configuration is needed.
  */

> +	dp->phy = devm_phy_optional_get(dp->dev, "dp");
> +	if (IS_ERR(dp->phy))
> +		return ERR_CAST(dp->phy);
>   
>   	dp->clock = devm_clk_get(&pdev->dev, "dp");
>   	if (IS_ERR(dp->clock)) {

With the comment added:
Reviewed-by: Damon Ding <damon.ding@rock-chips.com>

Best regards,
Damon


