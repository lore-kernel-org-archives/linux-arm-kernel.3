Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F188DC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 07:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OFURKWJ8c+0j+WDISntGYO02sBoZ1fscCFecE790ZO4=; b=QkhiIxbibQTMBCof/9M1LPNJZT
	owmqJ7kZG5QzIL7p97BqLLZoXyPThhFHK0rRr8ql0ikhprigquFTMjBC/dD8nkLpZkn1bpBRovLtF
	TU8CvlVygT8t77SVxsFt6mVfiMw7ajHRTaamtRBjkFtlY29sRUAelC503YAaR3KdRAH3SavvavghZ
	RzewQqguahyW6/bcTxzVfv7zSlJlS3OjKyAmhppa1xhedKGpwrfqSFHK6U+724CXw8fKq2IGBWYd3
	2nZrkuJ5+W3tblKyA/nwLU0qRsDDUdOd+Uvy6mKloWDL4VHvkK8DQBPFQHzzNgzVFk/Fo+rwkDBdC
	uQpj69Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trXcc-00000001lGu-3yk5;
	Mon, 10 Mar 2025 07:32:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trXXL-00000001kSS-2ViK;
	Mon, 10 Mar 2025 07:26:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 13F485C574F;
	Mon, 10 Mar 2025 07:24:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCFD5C4CEE5;
	Mon, 10 Mar 2025 07:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741591614;
	bh=7wBfnmZleX7Y85tYsTskYok1c1ngfWy+JcWmAk0PEZQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zs65k6cPyITwlw4q7+nFyQLTJ+9cSdxFo2+sEvOpPBWysAq7W331LPGSq6AKxj85j
	 CbHaN6iZOmqT0H/aRFAWEqIvVQo4f91FP3pXcP7WYdCGQZl9N8YSivakG5dY1DXB4C
	 NEC+XQ/m2cGiHjBv/ZSq/8d18XrWFbYhSp5aWeltzsLb7qFU4KeSd9VSZwWzcG9a4K
	 9DlUpDQzhoOV+QliJQwjhLQjMbZ1eZol3ztJl6gPd5YDTXhk1Juznlw3vJBcKe9Uvj
	 eO4a84IOxLQ+/B3fGsukNS/m2G68aM7JjXEi+0jPDwwMqAfukaEL2eaNi4KJU5j9L4
	 9qftv9+ALTn5w==
Date: Mon, 10 Mar 2025 12:56:50 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Andy Yan <andyshrk@163.com>
Cc: heiko@sntech.de, kishon@kernel.org, sebastian.reichel@collabora.com,
	yubing.zhang@rock-chips.com, dmitry.baryshkov@linaro.org,
	frank.wang@rock-chips.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH] phy: rockchip: usbdp: Check these parameters only when
 the corresponding set flags are set
Message-ID: <Z86UOmPg/UDSBajZ@vaman>
References: <20250306065952.485809-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306065952.485809-1-andyshrk@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_002655_795388_6FC71FBA 
X-CRM114-Status: GOOD (  24.22  )
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

On 06-03-25, 14:59, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> According documentation of phy_configure_opts_dp, at the configure
> stage, we should only verify/configure the link_rate when set_rate
> flag is set, the same applies to lanes and voltage.
> 
> So we do it as the documentation says, also record the link rate
> and lanes in phy internal for set_voltate stage.

Whenever you say also, that is a sign that it should be another patch!

> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> ---
> 
>  drivers/phy/rockchip/phy-rockchip-usbdp.c | 63 +++++++++++------------
>  1 file changed, 31 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> index c04cf64f8a35..d1bbdf382aa2 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> @@ -187,6 +187,8 @@ struct rk_udphy {
>  	u32 dp_aux_din_sel;
>  	bool dp_sink_hpd_sel;
>  	bool dp_sink_hpd_cfg;
> +	unsigned int link_rate;
> +	unsigned int lanes;
>  	u8 bw;
>  	int id;
>  
> @@ -1102,42 +1104,39 @@ static int rk_udphy_dp_phy_power_off(struct phy *phy)
>  	return 0;
>  }
>  
> -static int rk_udphy_dp_phy_verify_link_rate(unsigned int link_rate)
> -{
> -	switch (link_rate) {
> -	case 1620:
> -	case 2700:
> -	case 5400:
> -	case 8100:
> -		break;
> -
> -	default:
> -		return -EINVAL;
> -	}
> -
> -	return 0;
> -}
> -
>  static int rk_udphy_dp_phy_verify_config(struct rk_udphy *udphy,
>  					 struct phy_configure_opts_dp *dp)
>  {
> -	int i, ret;
> +	int i;
>  
> -	/* If changing link rate was required, verify it's supported. */
> -	ret = rk_udphy_dp_phy_verify_link_rate(dp->link_rate);
> -	if (ret)
> -		return ret;
> +	/* Verify link rate. */
> +	if (dp->set_rate) {
> +		switch (dp->link_rate) {
> +		case 1620:
> +		case 2700:
> +		case 5400:
> +		case 8100:
> +			udphy->link_rate = dp->link_rate;
> +			break;
> +
> +		default:
> +			return -EINVAL;
> +		}

why drop helper? Why not set the rate on success?

> +	}
>  
>  	/* Verify lane count. */
> -	switch (dp->lanes) {
> -	case 1:
> -	case 2:
> -	case 4:
> -		/* valid lane count. */
> -		break;
> +	if (dp->set_lanes) {
> +		switch (dp->lanes) {
> +		case 1:
> +		case 2:
> +		case 4:
> +			/* valid lane count. */
> +			udphy->lanes = dp->lanes;
> +			break;
>  
> -	default:
> -		return -EINVAL;
> +		default:
> +			return -EINVAL;
> +		}

another change where helper would have made this look better

>  	}
>  
>  	/*
> @@ -1146,7 +1145,7 @@ static int rk_udphy_dp_phy_verify_config(struct rk_udphy *udphy,
>  	 */
>  	if (dp->set_voltages) {
>  		/* Lane count verified previously. */
> -		for (i = 0; i < dp->lanes; i++) {
> +		for (i = 0; i < udphy->lanes; i++) {
>  			if (dp->voltage[i] > 3 || dp->pre[i] > 3)
>  				return -EINVAL;
>  
> @@ -1243,9 +1242,9 @@ static int rk_udphy_dp_phy_configure(struct phy *phy,
>  	}
>  
>  	if (dp->set_voltages) {
> -		for (i = 0; i < dp->lanes; i++) {
> +		for (i = 0; i < udphy->lanes; i++) {
>  			lane = udphy->dp_lane_sel[i];
> -			switch (dp->link_rate) {
> +			switch (udphy->link_rate) {
>  			case 1620:
>  			case 2700:
>  				regmap_update_bits(udphy->pma_regmap,
> -- 
> 2.34.1

-- 
~Vinod

