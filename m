Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1305FCA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 19:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gSPPx0yOsje6DTXv5XBIUBjgHbNjvexdVftG1MuMAaY=; b=IevHfnnLyV1E5KvFznMqxk6w1B
	+9grmjLmmRZcN3Db9ubtcZJLafzNZf/HMw1xepRxuhLZFUE4PltSWeEC+D+MopOdtoAiJbPsDgfpP
	rv6U4fCT1k5sUaYsw68X9PjzP1dvHAm9rsL0QzcqpscJ5wuoNnjs+PD+f97dF7L9KXIZPv8/R/Gvi
	zRXjZO+SbNV39PafAIsrPSCuKajXkkvIIeS7s71rcbRzYeKoZ0TzsaEHjhJxkgdGjdUw4kyQjTo+v
	ZMUZtBDjJWqal61HkYJfrFu5+Oan3k5A/B8odWESsSwEEba8FuOLYnZeEi1pY/YMYKHCqrvN2fNnx
	y+HhjDiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uluar-0000000Bn8z-0oaF;
	Tue, 12 Aug 2025 19:23:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulrGF-0000000BCSA-2hm0;
	Tue, 12 Aug 2025 15:50:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5FB7C43B0A;
	Tue, 12 Aug 2025 15:50:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9241C4CEF0;
	Tue, 12 Aug 2025 15:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755013803;
	bh=HwhqQwzGO1qGIgkNPS0Hm6Pz/bIg4cXLfWxME1eW6DA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pf523yqH3E1fYrrsu7V7bVhWKcl8DBUAGY2Oh3RRT7n3TYiqLyvX8fX2SL9Vvmm5S
	 vXZ50h8aiGUoKva2uQeg9ieO5OyD+bviuXljW8VQfnqVkBZspiTW9I5+NfL0xlx2Bw
	 sJ7tF/ILi5PJ+JcVynjjoxF/icPstfohU033kbp+YUeNY12jipFVuOvMJr1pD8+ACF
	 A3lg9NDH7pQxFkf4hS6tIOR82PPZsRHDF1dHF+K/rZVwTXIyjuh8swiDH5qWj1R7P5
	 FZK6CK8PS8jLwYNWDq9itSB4yFnthozpx29Ob4FIVwcPpB9LB4JtWA8zM3PLTl69ZL
	 /qhst9utTf9uw==
Date: Tue, 12 Aug 2025 21:19:59 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Yao Zi <ziyao@disroot.org>, Chukun Pan <amadeus@jmu.edu.cn>,
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jianwei Zheng <jianwei.zheng@rock-chips.com>
Subject: Re: [PATCH 05/11] phy: rockchip: inno-usb2: Add support for RK3528
Message-ID: <aJtip49r8R3-2XXi@vaman>
References: <20250723122323.2344916-1-jonas@kwiboo.se>
 <20250723122323.2344916-6-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250723122323.2344916-6-jonas@kwiboo.se>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_085003_705076_39A63887 
X-CRM114-Status: GOOD (  19.56  )
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

On 23-07-25, 12:23, Jonas Karlman wrote:
> From: Jianwei Zheng <jianwei.zheng@rock-chips.com>

Please do not send encrypted emails over public mail lists

> 
> The RK3528 has a single USB2PHY with a otg and host port.
> 
> Add support for the RK3528 variant of USB2PHY.
> 
> PHY tuning for RK3528:
> 
> - Turn off differential receiver in suspend mode to save power
>   consumption.
> 
> - Set HS eye-height to 400mV instead of default 450mV.
> 
> - Choose the Tx fs/ls data as linestate from TX driver for otg port
>   which uses dwc3 controller to improve fs/ls devices compatibility with
>   long cables.
> 
> This is based on vendor kernel linux-stan-6.1-rkr5 tag.
> 
> Signed-off-by: Jianwei Zheng <jianwei.zheng@rock-chips.com>
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> ---
>  drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 74 +++++++++++++++++++
>  1 file changed, 74 insertions(+)
> 
> diff --git a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
> index cd1a02b990ef..b8950d9f9e97 100644
> --- a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
> +++ b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
> @@ -1507,6 +1507,28 @@ static int rk3128_usb2phy_tuning(struct rockchip_usb2phy *rphy)
>  				BIT(2) << BIT_WRITEABLE_SHIFT | 0);
>  }
>  
> +static int rk3528_usb2phy_tuning(struct rockchip_usb2phy *rphy)
> +{
> +	int ret = 0;

Superfluous init

> +
> +	/* Turn off otg port differential receiver in suspend mode */
> +	ret |= regmap_write(rphy->phy_base, 0x30, BIT(18) | 0x0000);
> +
> +	/* Turn off host port differential receiver in suspend mode */
> +	ret |= regmap_write(rphy->phy_base, 0x430, BIT(18) | 0x0000);
> +
> +	/* Set otg port HS eye height to 400mv (default is 450mv) */
> +	ret |= regmap_write(rphy->phy_base, 0x30, GENMASK(22, 20) | 0x0000);
> +
> +	/* Set host port HS eye height to 400mv (default is 450mv) */
> +	ret |= regmap_write(rphy->phy_base, 0x430, GENMASK(22, 20) | 0x0000);
> +
> +	/* Choose the Tx fs/ls data as linestate from TX driver for otg port */
> +	ret |= regmap_write(rphy->phy_base, 0x94, GENMASK(22, 19) | 0x0018);

No error checking?

-- 
~Vinod

