Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A348C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 21:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0cniJTIAMdIpdeQmR2BhsRWVUgh641WfBYMvCtapTXs=; b=Fuqul9ZwEwKilhSKy9peBrqcsL
	YvosIHBo2SYvkMP7di7fA0/ove+vd4LbOGWJPrOnHgKP21ztrm4M1EtCr/azLb3Y42bug0XPyQYAx
	DII8+3pajeQwXJL7gzhblrbL/3CSS6e3qzyc1EHArqFPYV8RkgEH0P+p64m8Q5vHF0JEmQfym9a7z
	EU4JCWLwLIzk5XCBB0BvRwQybzj7cqSh95jo5bgxo0GxlKkTwkFCM6QIoGEIppAoPFbVa8z98gzrS
	RZBQWPGLsVlwc5BBRlP5e8bKP2lgjFnZ4I2syk4KE3ayZYgtcnj3DANBKkenT1wgI5VHKcoY64FIn
	0bVIqnlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqInN-0000000CH1v-13Mw;
	Thu, 06 Mar 2025 21:30:21 +0000
Received: from mail.manjaro.org ([2a01:4f8:c0c:51f3::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqIjw-0000000CGVf-3EvV;
	Thu, 06 Mar 2025 21:26:50 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1741296406;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0cniJTIAMdIpdeQmR2BhsRWVUgh641WfBYMvCtapTXs=;
	b=WQFx1oxYMJEnrSFTAQ0UbkBpVyh0nQAgIwQEIXxuZrxgDTGBlVo43SGsVKMZ2CuuVaFS4I
	sKegnKlrteJk2c0RFwHqlW1CXBvObg64lnLfmmeOOavHBwgqmuknkFtzGQTLiFYomE2ul+
	Kcj+8Rrs9qPnuIHs5Zpx0ktxl2fRwxZ4ND/TLNIkFbiYdhsX/esaaBDyBNBRiimZ0RzF3a
	ukmnvwn1RF3g/pSw+jf8W+JrTM6BAYLrk+wjBRSdR/TmkctJHlNPwMM/TI/s4aAjRYAN6e
	CaqyoPGmG895fskrCqOIb4CwY1YC6gbpJg1UhXAefv9dcHPQH84Ou7Tegiln8g==
Date: Thu, 06 Mar 2025 22:26:45 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Heiko Stuebner <heiko@sntech.de>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>, David Wu <david.wu@rock-chips.com>,
 netdev@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 2/3] net: stmmac: dwmac-rk: Use DELAY_ENABLE macro for
 RK3566/RK3568
In-Reply-To: <20250306203858.1677595-3-jonas@kwiboo.se>
References: <20250306203858.1677595-1-jonas@kwiboo.se>
 <20250306203858.1677595-3-jonas@kwiboo.se>
Message-ID: <73ac54350ee3e42dee2b886403f003de@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_132649_106514_4301D3DB 
X-CRM114-Status: GOOD (  12.72  )
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

Hello Jonas,

On 2025-03-06 21:38, Jonas Karlman wrote:
> Support for Rockchip RK3566/RK3568 GMAC was added without use of the
> DELAY_ENABLE macro to assist with enable/disable use of MAC rx/tx 
> delay.
> 
> Change to use the DELAY_ENABLE macro to help disable MAC delay when
> RGMII_ID/RXID/TXID is used. This also re-order to enable/disable before

s/re-order/re-orders/

> the delay is written to match all other GMAC and vendor kernel.

s/GMAC/GMACs/

> Fixes: 3bb3d6b1c195 ("net: stmmac: Add RK3566/RK3568 SoC support")
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> index 297fa93e4a39..37eb86e4e325 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> @@ -1049,14 +1049,13 @@ static void rk3568_set_to_rgmii(struct
> rk_priv_data *bsp_priv,
>  	con1 = (bsp_priv->id == 1) ? RK3568_GRF_GMAC1_CON1 :
>  				     RK3568_GRF_GMAC0_CON1;
> 
> +	regmap_write(bsp_priv->grf, con1,
> +		     RK3568_GMAC_PHY_INTF_SEL_RGMII |
> +		     DELAY_ENABLE(RK3568, tx_delay, rx_delay));
> +
>  	regmap_write(bsp_priv->grf, con0,
>  		     RK3568_GMAC_CLK_RX_DL_CFG(rx_delay) |
>  		     RK3568_GMAC_CLK_TX_DL_CFG(tx_delay));
> -
> -	regmap_write(bsp_priv->grf, con1,
> -		     RK3568_GMAC_PHY_INTF_SEL_RGMII |
> -		     RK3568_GMAC_RXCLK_DLY_ENABLE |
> -		     RK3568_GMAC_TXCLK_DLY_ENABLE);
>  }
> 
>  static void rk3568_set_to_rmii(struct rk_priv_data *bsp_priv)

Thanks for this patch...  It's looking good to me, and good job
spotting this issue!  Please, free to include:

Reviewed-by: Dragan Simic <dsimic@manjaro.org>

