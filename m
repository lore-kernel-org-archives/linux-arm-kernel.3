Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31C17C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 22:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dV4SgXTKPQRxhmfsW6BVI1ffsVoZlfX/2pdna3rupKY=; b=N7y6TqvclyNPJw2dwUDNoFvBIh
	Hk17GwLmr+zR4NbrP3rhy7iwbIU53xtSviPfYFCS1OVKo5npPCev1y2gQglx3u8bVgi2nfdkvxmE1
	tRFeywxqrbss+A6elPCBAJiuLvqqi72+LdJ/DtXfNdgvA0HHnzsXOYlUqt9sTRpiNtqmzBAIDvuLB
	YZwnEuXvQ6YMvfRlYGdinnsQV4WtfjlIiekMbOFScMFAjA4BEPPIffRKFN1A0zZOjfumQtBVlfgT/
	At5P0CvD+lPIDGiv5rzT2c3NmJBmPk+thL+AzDrQHp3bVYe/eTX2UXUIlYi2YyaeW2d4WTQRbSEjo
	1eWHM0HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqJsG-0000000COTe-1amY;
	Thu, 06 Mar 2025 22:39:28 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqJqU-0000000COG0-18Es;
	Thu, 06 Mar 2025 22:37:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=dV4SgXTKPQRxhmfsW6BVI1ffsVoZlfX/2pdna3rupKY=; b=IRzhDcZxrjSQpHJrI0vOG307PI
	4Q3zFT2Lm7742/6V+Zy28VNBTQDyPbga72V/f058fDc2wie/b+PEhFuwl65zKZkyMo5cctlbL8LJY
	ehLYgxrxr1RmotX+87e2e13mIu3sITEu8+lf19srPgserUr4akQURsT8UKxhccoLO+lI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tqJqJ-002wLx-Da; Thu, 06 Mar 2025 23:37:27 +0100
Date: Thu, 6 Mar 2025 23:37:27 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Heiko Stuebner <heiko@sntech.de>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 2/2] net: stmmac: dwmac-rk: Validate rockchip,grf and
 php-grf during probe
Message-ID: <bab793bb-1cbe-4df6-ba6b-7ac8bfef989d@lunn.ch>
References: <20250306210950.1686713-1-jonas@kwiboo.se>
 <20250306210950.1686713-3-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306210950.1686713-3-jonas@kwiboo.se>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_143738_308140_DB1A0E33 
X-CRM114-Status: GOOD (  11.06  )
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

On Thu, Mar 06, 2025 at 09:09:46PM +0000, Jonas Karlman wrote:
> All Rockchip GMAC variants require writing to GRF to configure e.g.
> interface mode and MAC rx/tx delay. The GRF syscon regmap is located
> with help of a rockchip,grf and rockchip,php-grf phandle.

> @@ -1813,8 +1564,24 @@ static struct rk_priv_data *rk_gmac_setup(struct platform_device *pdev,
>  
>  	bsp_priv->grf = syscon_regmap_lookup_by_phandle(dev->of_node,
>  							"rockchip,grf");
> -	bsp_priv->php_grf = syscon_regmap_lookup_by_phandle(dev->of_node,
> -							    "rockchip,php-grf");
> +	if (IS_ERR(bsp_priv->grf)) {
> +		ret = PTR_ERR(bsp_priv->grf);
> +		dev_err_probe(dev, ret, "failed to lookup rockchip,grf\n");
> +		return ERR_PTR(ret);
> +	}
> +
> +	bsp_priv->php_grf =
> +		syscon_regmap_lookup_by_phandle_optional(dev->of_node,
> +							 "rockchip,php-grf");
> +	if ((of_device_is_compatible(dev->of_node, "rockchip,rk3588-gmac") ||
> +	     of_device_is_compatible(dev->of_node, "rockchip,rk3576-gmac")) &&
> +	    !bsp_priv->php_grf)
> +		bsp_priv->php_grf = ERR_PTR(-ENODEV);

It seems odd you say all variants need this property, and then you
look for two specific variants here and do something different? Why
are these two special?

	Andrew

