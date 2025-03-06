Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D29A3C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 21:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L2c81lklMsWoewbTrDLPjzFIwtetRMhEGhB4+GnHcqo=; b=crRgbhzbSlUm7gG5Trzdl6kQXM
	R0TqmlGqLRF0udoNrA2H47elACIiFOgYmSYXvdpPck5gFzaJwyT7jTljpq4DHcTjv9p6TPcvkEqBE
	OngxQXS5pcv0cNdtwJ8VAHtmWWyEG0en5MLWb5GERwv3htVwRowyMnCCbzcxtPNKBYrq4QuNvFJcv
	26LaqaiSQzycPw4SlntDjT23Xy/IW4bqqgyGQdbLIBIdaZmZT2n/mQH5aLVACl+b7D2VUZGeSnpZW
	y7+bfVO6DxcNuWSfMVDca1LfnkbiSnPsiwrppX16BtPqMg3atbGPMZava+VCqEaf+NFXzzS/by6rq
	tNayWFnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqIUY-0000000CE2V-2VxZ;
	Thu, 06 Mar 2025 21:10:54 +0000
Received: from mail.manjaro.org ([2a01:4f8:c0c:51f3::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqISu-0000000CDkQ-1zvH;
	Thu, 06 Mar 2025 21:09:13 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1741295347;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L2c81lklMsWoewbTrDLPjzFIwtetRMhEGhB4+GnHcqo=;
	b=WiSqWs276XwmL6ya8O18OlaDotyFuFbRKOpfqddTDFGjegQF7yrFJ/fjZqymvfCuHegLIW
	HidnrhNz9DXyySlOqdgziypXpdovMd53ofUUCHADRAqZkUQUPdGWCoT5QwgqyhForVQcaS
	SLy+g0SDLLq6eKdiqA6beA27hQuYi3YHLH8XpvNpLeVyKuDz15NKBPDyQJ8NRaObqvesP5
	H9nB8siyzS1lzqkqpfAsqgBKH871WqOw+loSNYZ1Nd6isC6x9WdSxTufdr7kj4JfcLX5Sy
	0zdnbY4+vqADaC/N/SxFzkqHCoQHzOeX6cJc7+IpxSPj0pC/0zQrSGWPz25dUg==
Date: Thu, 06 Mar 2025 22:09:06 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Heiko Stuebner <heiko@sntech.de>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, Wadim Egorov <w.egorov@phytec.de>,
 netdev@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 1/3] net: stmmac: dwmac-rk: Use DELAY_ENABLE macro for
 RK3328
In-Reply-To: <20250306203858.1677595-2-jonas@kwiboo.se>
References: <20250306203858.1677595-1-jonas@kwiboo.se>
 <20250306203858.1677595-2-jonas@kwiboo.se>
Message-ID: <427cbfc8c6b71bf70804a0d535ff9d18@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_130912_678590_93662FF0 
X-CRM114-Status: GOOD (  13.47  )
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
> Support for Rockchip RK3328 GMAC and addition of the DELAY_ENABLE macro
> was merged in the same merge window. This resulted in RK3328 not being
> converted to use the new DELAY_ENABLE macro.
> 
> Change to use the DELAY_ENABLE macro to help disable MAC delay when
> RGMII_ID/RXID/TXID is used.
> 
> Fixes: eaf70ad14cbb ("net: stmmac: dwmac-rk: Add handling for
> RGMII_ID/RXID/TXID")
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> index 003fa5cf42c3..297fa93e4a39 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> @@ -593,8 +593,7 @@ static void rk3328_set_to_rgmii(struct
> rk_priv_data *bsp_priv,
>  	regmap_write(bsp_priv->grf, RK3328_GRF_MAC_CON1,
>  		     RK3328_GMAC_PHY_INTF_SEL_RGMII |
>  		     RK3328_GMAC_RMII_MODE_CLR |
> -		     RK3328_GMAC_RXCLK_DLY_ENABLE |
> -		     RK3328_GMAC_TXCLK_DLY_ENABLE);
> +		     DELAY_ENABLE(RK3328, tx_delay, rx_delay));
> 
>  	regmap_write(bsp_priv->grf, RK3328_GRF_MAC_CON0,
>  		     RK3328_GMAC_CLK_RX_DL_CFG(rx_delay) |

Thanks for this patch...  It's looking good to me, and good job
spotting this issue!  Please, feel free to include:

Reviewed-by: Dragan Simic <dsimic@manjaro.org>

