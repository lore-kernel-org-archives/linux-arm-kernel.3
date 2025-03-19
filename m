Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F421CC35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 22:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jTG3WnDFAfRFQDs0cUx1kwKiOP6BmpOLg7RMMJcqr7s=; b=gN837f6gByvsGXo47DZSZZaPdH
	HWAlgdBBJg9lHFvhFkwC8GGSAqZBAdJI5Q4y6fr/KG3h0lsEEgJmyVoXtEUbbyrdhQPvkYyZM+n8l
	+R35i3vcYlrhFNhVv6IA88Hir9qMrStY625q1B5aVf/0EEqdKJShu75JVj4Yo9UTTPi72SCIVZ/X1
	6PXOVdpFADF+PSbFG7xYGNW1YTrGXWBHzVU5xU7SafUXhxn/J1xT8PlxcB/65ztss68xFNs15D5hf
	kEz1kmIt9qkkYkFN11nJEfJWd1tRXWBTLBImqbVpuNcWcZtQi2xZSwoya55akEB3qfURzwP5kE2LH
	3y2DaTzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tv26i-0000000AJUv-0JpG;
	Wed, 19 Mar 2025 22:41:52 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tv250-0000000AJIm-08Vf;
	Wed, 19 Mar 2025 22:40:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=jTG3WnDFAfRFQDs0cUx1kwKiOP6BmpOLg7RMMJcqr7s=; b=awaNfGbpagVPUyFCmBEgPJBmul
	e9tPJGuvyQX/cvhie0Gzen6w0UIqucPHwRQq7lqNasTTazFhe+DK60szAbKolzU3XYaHFyzt0or44
	01eTmdmeu014tYZJcfTanw14k5yoqvo9Fh+IUWcXPUAuQyz34EHR/nWevIkioAIety70=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tv24e-006Q5Z-KP; Wed, 19 Mar 2025 23:39:44 +0100
Date: Wed, 19 Mar 2025 23:39:44 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Heiko Stuebner <heiko@sntech.de>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Wu <david.wu@rock-chips.com>, Yao Zi <ziyao@disroot.org>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH net-next v3 3/5] net: stmmac: dwmac-rk: Move
 integrated_phy_powerup/down functions
Message-ID: <d7b3ec5c-2d74-4409-9894-8f2cb3e055f6@lunn.ch>
References: <20250319214415.3086027-1-jonas@kwiboo.se>
 <20250319214415.3086027-4-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250319214415.3086027-4-jonas@kwiboo.se>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_154006_074564_87798B90 
X-CRM114-Status: GOOD (  12.96  )
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

On Wed, Mar 19, 2025 at 09:44:07PM +0000, Jonas Karlman wrote:
> Rockchip RK3528 (and RV1106) has a different integrated PHY compared to
> the integrated PHY on RK3228/RK3328. Current powerup/down operation is
> not compatible with the integrated PHY found in these SoCs.
> 
> Move the rk_gmac_integrated_phy_powerup/down functions to top of the
> file to prepare for them to be called directly by a GMAC variant
> specific powerup/down operation.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

> +#define RK_GRF_CON2_MACPHY_ID		HIWORD_UPDATE(0x1234, 0xffff, 0)
> +#define RK_GRF_CON3_MACPHY_ID		HIWORD_UPDATE(0x35, 0x3f, 0)
> +
> +static void rk_gmac_integrated_phy_powerup(struct rk_priv_data *priv)
> +{
> +	if (priv->ops->integrated_phy_powerup)
> +		priv->ops->integrated_phy_powerup(priv);
> +
> +	regmap_write(priv->grf, RK_GRF_MACPHY_CON0, RK_MACPHY_CFG_CLK_50M);
> +	regmap_write(priv->grf, RK_GRF_MACPHY_CON0, RK_GMAC2PHY_RMII_MODE);
> +
> +	regmap_write(priv->grf, RK_GRF_MACPHY_CON2, RK_GRF_CON2_MACPHY_ID);
> +	regmap_write(priv->grf, RK_GRF_MACPHY_CON3, RK_GRF_CON3_MACPHY_ID);

I know you are just moving code around....

Do you know what these MACPHY_ID are? I hope it is not what you get
when you read PHY registers 2 and 3?

	Andrew

