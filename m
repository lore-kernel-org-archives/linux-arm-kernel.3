Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43E80CDE001
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 15:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yHAPNcQ5EKyi7n1ik7WzWF+RwYT1Afv+h7uAsSVT37U=; b=cz2+e/rRDhBHur1MC9piCACNUJ
	p6uXbPl/aHjLY+AtBQvSeO85sqVWCW9Br0065lzaUhP16c7O+YAFBFhNlKxBmpp3WRiTH7dslxw4t
	QxWWa0JDllDRqXaTRno69H/X9tK+ENuXwhhWhaJhMr4jYMnM/eRJInAMJlSq/BgdRwGPmw2S0BepS
	LiDEcL/M/LnAXEVOUiHF9zkO/GP9e7dW4QLrJYb4+pVwHsFcYgiJGPV6fmKHCpjvKifealHYSpks6
	DHnKVt0UuqCuxmcZMN6GypUrZr1OyLlYmpXBsZKwC/K2jclBwovf7vVb1XowENXfh6lICOxv9+6BP
	Pt80mrGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcPhj-000000081Fl-3Ilw;
	Wed, 24 Jun 2026 15:39:55 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcPhh-000000081EY-1S5O;
	Wed, 24 Jun 2026 15:39:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=yHAPNcQ5EKyi7n1ik7WzWF+RwYT1Afv+h7uAsSVT37U=; b=ePY2ywc1fQl0LEsKtNKvYMHLoq
	puhjGDFNEGFC4FwqspAIfys1IPAcHKK1DeRyboD+Jd/8E1mWjL4XTkueom1bn3nUD7DhacZv31AUP
	SWTDPYLfX5jLbXN2TpZKB6UrFPgcqZ9o6tWnkQkEb29+dbQgSnS5omx9mK9GPQBqAr8I=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wcPhP-0096s7-BA; Wed, 24 Jun 2026 17:39:35 +0200
Date: Wed, 24 Jun 2026 17:39:35 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Yanan He <grumpycat921013@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	David Wu <david.wu@rock-chips.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 4/7] net: stmmac: dwmac-rk: Enable refout clock for RGMII
Message-ID: <bb50eb6a-561b-4e48-b8ed-2ed5a17b6a1c@lunn.ch>
References: <20260624-rv1126-alientek-dlrv1126-v1-0-5aef608a3f64@gmail.com>
 <20260624-rv1126-alientek-dlrv1126-v1-4-5aef608a3f64@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260624-rv1126-alientek-dlrv1126-v1-4-5aef608a3f64@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_083953_385878_D595BB45 
X-CRM114-Status: GOOD (  18.09  )
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

On Wed, Jun 24, 2026 at 04:44:41PM +0800, Yanan He wrote:
> Some Rockchip GMAC integrations use clk_mac_refout as an external PHY
> reference clock even when the MAC is configured for RGMII.
> 
> RV1126 boards can route CLK_GMAC_ETHERNET_OUT to the external PHY as a
> 25 MHz reference clock. If the driver does not acquire and enable this
> clock in RGMII mode, the common clock framework may disable it as unused
> and the PHY can lose its reference clock.
> 
> Enable the refout clock handling for RGMII in addition to RMII.
> 
> Signed-off-by: Yanan He <grumpycat921013@gmail.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> index 8d7042e68926..f6fdc0c5b475 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> @@ -1112,7 +1112,8 @@ static int rk_gmac_clk_init(struct plat_stmmacenet_data *plat)
>  	bsp_priv->clk_enabled = false;
>  
>  	bsp_priv->num_clks = ARRAY_SIZE(rk_clocks);
> -	if (phy_iface == PHY_INTERFACE_MODE_RMII)
> +	if (phy_iface == PHY_INTERFACE_MODE_RMII ||
> +	    phy_iface == PHY_INTERFACE_MODE_RGMII)

Apart from Heiko commenting that this patch is completely wrong, there
are 4 RGMII modes, not one. You should of used
phy_interface_mode_is_rgmii().

    Andrew

---
pw-bot: cr
 

