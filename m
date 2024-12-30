Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72054E77194
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Dec 2024 12:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tYYedohEc9vf/SRWvXYMUw8vyrAayil4GiZBetI0DRQ=; b=LBimHKW+vMeao7gP3BZ4V8NjUI
	jQtLXrZzsxH2pfFVHIr92CLAMPWzk0M1uBktargtrNSFhV9vure36YPf9tM2ZFsWpKsnwIJU/7Mje
	cmiuXZRgDw4PzabHQZh6eevhL2HSXbnO5FMLG5Rde6KCQN/zG1pighDwrVnEsUPnlVCNYdR+Mjaxw
	AXHWUyVEzzAbBhvlNnmrgFsKMW3GQoSsTdfspns7i1U6gsKz/7rHQGxdM3X1wDmfPczyXUrEfAa2b
	d2Q63OgTL/pL1W1HbhX98yfyEKv6V37I9cMGfrl7Ll7Rwx8kRkENlvXXwE3TzGN7IBRrtBXZ/YxPm
	nThpbg/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSFAV-00000005CwG-1ROA;
	Mon, 30 Dec 2024 12:46:47 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSF9I-00000005Ccv-4A3h
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Dec 2024 12:45:34 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-3043e84c687so80710021fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Dec 2024 04:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735562731; x=1736167531; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tYYedohEc9vf/SRWvXYMUw8vyrAayil4GiZBetI0DRQ=;
        b=ucbxV3dGwUgmc1U00T3Q3qpH4vnUG6zzaIXq+AOzV77SelYRY12Yo2opzuOQoE3+5u
         JTpgZaxM+zoO9EozAjE+JLIsNAxropz22CKrCJPRtNDUq/02vptvOfcaL0Z52r4S/Dey
         1Eo+sGmFwE7GdJzMqKzfwFCk8Hm6J5x5LXbc8SD7Wq9rILUNcfGINTkZ9+jMn38TtV85
         /Y1sisUuCrc8VjCTzoKrSoACStVbznok11Pa/5KiUuRhgf8UbHAYExjQw9y+lPwACWJZ
         nmV58NcfChkX8HlQLjHSwGtA+heWOyMplOzgWboWCYhYfh8SdHumAEFnWPhZ5e4CMMbQ
         DhSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735562731; x=1736167531;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tYYedohEc9vf/SRWvXYMUw8vyrAayil4GiZBetI0DRQ=;
        b=clIsgdA3Q6TszgBoYD/bXCk54EtvRDI4afqz3XCfcB9tMIstiSUNcz/G0lFcgY3jlZ
         E3CvLUBwtjvt5SCILaQhnQE44eawe0w6IagHELl2WaYdX9l9/exMBV2XhXoHwdP4MIzW
         bRxVu5WUQtpxs3tYgmR9okM6cYIRMrHlJpu43oloOjIk3wcFmQZUhqN1G4assI7zOybi
         doikk2NuWOf+bLLej6dur36LB/Pkemy3hnemNvS4XpnkLmSRw0SCO66qbbok1pEIfxGq
         DLlHZ904CO0drtckRCgplf5c4Lobkebx7PCdTf6WI3e1ypn1O979PP0PX9mXrGbEXHAl
         zoTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVp963p6Y/67cnQOelD/Rs5CYyChjctjD+NxRV8xv61oR7WTsEOTXqF3YOUWpODnPiZmX4GCENy83D/DH0XRmVI@lists.infradead.org
X-Gm-Message-State: AOJu0Yxzl3nJAORZPCpHSxOXGaBLTmL7P26XF1PeoPhwwixN1bq7t5GD
	JzRpa7HxegxNbdsE+tkkUJFBVr7mqJkwfAVItGL8IKzncZxVQkxgEpPRD/p87VE=
X-Gm-Gg: ASbGncvd0UKJmoPRhwgTRJmhAzljI4URa1Y+ITHQN/2rqbCK9zTDLc+/gFFYcQf92oT
	raBzd/dSGuLKeLDTK4NBP41FcOiE1u/Z8qndRMTGXK8EvfO/ok1HJ7i4Rsh/Rj7gbfisEqh87yx
	5A1sKDYLFXm7kkL2cvGHdlksyMAoH4UE0qhxnex9o4530dTOQhED99LXlxdEn/c2BxCcoOl7id/
	g/qMQHGVGW8u9rbENZathLR2wuf/VKwqhl9/zzHOaxsLf5PDYLx/yAhEaLGynXhghWL9MVyDtm+
	0ZcR7KpcKhooaebRnzE77zPYRVyZqKtjH0iu
X-Google-Smtp-Source: AGHT+IFHlYAccbO2U+l1/+qdqnOJIZ9pmRBeI/fEyYOfTMJsxs8AYRAGyUUI0bNMBdlPg6thA6H6QQ==
X-Received: by 2002:a05:651c:2223:b0:302:4130:e19d with SMTP id 38308e7fff4ca-30468535947mr120605401fa.9.1735562731167;
        Mon, 30 Dec 2024 04:45:31 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045ad6cae6sm34594261fa.23.2024.12.30.04.45.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 04:45:30 -0800 (PST)
Date: Mon, 30 Dec 2024 14:45:27 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org, 
	sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com, l.stach@pengutronix.de, 
	andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com, 
	kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org
Subject: Re: [PATCH v4 07/17] phy: phy-rockchip-samsung-hdptx: Add support
 for eDP mode
Message-ID: <shr7ak7keqza3gw6wra2zra35qht2cxlzkvtuhzl3swzf2fwxy@i2v4o53lhese>
References: <20241226063313.3267515-1-damon.ding@rock-chips.com>
 <20241226063313.3267515-8-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241226063313.3267515-8-damon.ding@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_044533_029870_93EAB773 
X-CRM114-Status: GOOD (  26.49  )
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

On Thu, Dec 26, 2024 at 02:33:03PM +0800, Damon Ding wrote:
> Add basic support for RBR/HBR/HBR2 link rates, and the voltage swing and
> pre-emphasis configurations of each link rate have been verified according
> to the eDP 1.3 requirements.

Well... Please describe what's happening here. That the HDMI PHY on your
platform also provides support for DP / eDP. Please document any design
decisions that you had to make.

> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> 
> ---
> 
> Changes in v2:
> - Add the module author
> 
> Changes in v3:
> - Split this patch into two, one for correction and the other for
>   extension
> 
> Changes in v4:
> - Add link_rate and lanes parameters in struct rk_hdptx_phy to store the
>   phy_configure() result for &phy_configure_opts.dp.link_rate and
>   &phy_configure_opts.dp.lanes
> ---
>  .../phy/rockchip/phy-rockchip-samsung-hdptx.c | 896 +++++++++++++++++-
>  1 file changed, 889 insertions(+), 7 deletions(-)
> 
> @@ -933,9 +1484,339 @@ static int rk_hdptx_phy_power_off(struct phy *phy)
>  	return rk_hdptx_phy_consumer_put(hdptx, false);
>  }
>  
> +static int rk_hdptx_phy_set_mode(struct phy *phy, enum phy_mode mode,
> +				 int submode)
> +{
> +	return 0;
> +}

No need for the stub, please drop it. The host controller driver can
still call phy_set_mode() / _ext(), the call will return 0.

> +
> +static int rk_hdptx_phy_verify_config(struct rk_hdptx_phy *hdptx,
> +				      struct phy_configure_opts_dp *dp)
> +{
> +	int i;
> +
> +	if (dp->set_rate) {
> +		switch (dp->link_rate) {
> +		case 1620:
> +		case 2700:
> +		case 5400:
> +			break;
> +		default:
> +			return -EINVAL;
> +		}
> +	}
> +
> +	if (dp->set_lanes) {
> +		switch (dp->lanes) {
> +		case 0:

Is it really a valid config to have 0 lanes?

> +		case 1:
> +		case 2:
> +		case 4:
> +			break;
> +		default:
> +			return -EINVAL;
> +		}
> +	}
> +
> +	if (dp->set_voltages) {
> +		for (i = 0; i < hdptx->lanes; i++) {
> +			if (dp->voltage[i] > 3 || dp->pre[i] > 3)
> +				return -EINVAL;
> +
> +			if (dp->voltage[i] + dp->pre[i] > 3)
> +				return -EINVAL;
> +		}
> +	}
> +
> +	return 0;
> +}
> +

[..]

> +
> +static int rk_hdptx_phy_configure(struct phy *phy, union phy_configure_opts *opts)
> +{
> +	struct rk_hdptx_phy *hdptx = phy_get_drvdata(phy);
> +	enum phy_mode mode = phy_get_mode(phy);
> +	int ret;
> +
> +	if (mode != PHY_MODE_DP)
> +		return -EINVAL;

I'd say, return 0;

> +
> +	ret = rk_hdptx_phy_verify_config(hdptx, &opts->dp);
> +	if (ret) {
> +		dev_err(hdptx->dev, "invalid params for phy configure\n");
> +		return ret;
> +	}
> +
> +	if (opts->dp.set_rate) {
> +		ret = rk_hdptx_phy_set_rate(hdptx, &opts->dp);
> +		if (ret) {
> +			dev_err(hdptx->dev, "failed to set rate: %d\n", ret);
> +			return ret;
> +		}
> +	}
> +
> +	if (opts->dp.set_lanes) {
> +		ret = rk_hdptx_phy_set_lanes(hdptx, &opts->dp);
> +		if (ret) {
> +			dev_err(hdptx->dev, "failed to set lanes: %d\n", ret);
> +			return ret;
> +		}
> +	}
> +
> +	if (opts->dp.set_voltages) {
> +		ret = rk_hdptx_phy_set_voltages(hdptx, &opts->dp);
> +		if (ret) {
> +			dev_err(hdptx->dev, "failed to set voltages: %d\n",
> +				ret);
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>  static const struct phy_ops rk_hdptx_phy_ops = {
>  	.power_on  = rk_hdptx_phy_power_on,
>  	.power_off = rk_hdptx_phy_power_off,
> +	.set_mode  = rk_hdptx_phy_set_mode,
> +	.configure = rk_hdptx_phy_configure,
>  	.owner	   = THIS_MODULE,
>  };
>  
> @@ -1149,5 +2030,6 @@ module_platform_driver(rk_hdptx_phy_driver);
>  
>  MODULE_AUTHOR("Algea Cao <algea.cao@rock-chips.com>");
>  MODULE_AUTHOR("Cristian Ciocaltea <cristian.ciocaltea@collabora.com>");
> +MODULE_AUTHOR("Damon Ding <damon.ding@rock-chips.com>");
>  MODULE_DESCRIPTION("Samsung HDMI/eDP Transmitter Combo PHY Driver");
>  MODULE_LICENSE("GPL");
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

