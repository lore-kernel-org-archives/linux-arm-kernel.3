Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F66EC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 21:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bHwsh6TluptXdzXqvVPP4F+V7q9r/42AAgM1LmiztSc=; b=NCfxNm+mqYh33UFfXPEW6bA1Sr
	pmXfI47n0EhCjbb0ncbyF6YG0Pvp4TJaoD8WUeiO0xYL1Z8o/vD+ErRnaDv3KPTD/NV80E4X61QHN
	NT4WMZU5xdWDKlWYU6MP466zhX8GOIu9LvgSewA8Gq3OmNv6XL4eaM0HccQJfwZ4lQLT5OG+zYlL2
	0FiPTYCRWl55NAOk27R1TWGDd+HBwfQt8wdmngwWjyXkQebzj2QaOpmuKpJtMFNz8NwtLzljtZGm5
	pbppdHEaGNqoW2nTHM75x8l3Ii3rSNGWwf1KUpgdV8yyoSqQfqsBcowJQvoPpI3O7Hj9coUs3OgYW
	wJ48xeJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqIry-0000000CHjP-2LbQ;
	Thu, 06 Mar 2025 21:35:06 +0000
Received: from mail.manjaro.org ([2a01:4f8:c0c:51f3::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqIqL-0000000CHSZ-295B;
	Thu, 06 Mar 2025 21:33:26 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1741296803;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bHwsh6TluptXdzXqvVPP4F+V7q9r/42AAgM1LmiztSc=;
	b=Es9lFAUDceJGTlL8uwJGkGhN6jng+5C9geSl/63qijoK8req07NEpWF2sjyhqA+CSA4yYb
	tKRSDYSkeqhLLNo89bQsXKhsbFuglD25mfvkKZREmCvLYhnSqnGQ7c7oSxdSlYvR+3CVn7
	vVbZxiegGV6EwG4RmqlNfixKp8yxuzMDb4J15DbwE0DI0v36iL57M3Deh8PSa74vmSD2m8
	8zpaRnjvCSZaMn6A6BjmJxi5v3p7f5v38VZd9KSbvAaP7sHjxcaav5LWMZ+Vug5alcjt5n
	XBZwvOj2sE5+SPtzfwD6BLRslXVIfKeicrSnPhP/ny2lVUQBpRxo+lAwemcGog==
Date: Thu, 06 Mar 2025 22:33:23 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Heiko Stuebner <heiko@sntech.de>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, David Wu <david.wu@rock-chips.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>, netdev@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 3/3] net: stmmac: dwmac-rk: Use DELAY_ENABLE macro for
 RK3588
In-Reply-To: <20250306203858.1677595-4-jonas@kwiboo.se>
References: <20250306203858.1677595-1-jonas@kwiboo.se>
 <20250306203858.1677595-4-jonas@kwiboo.se>
Message-ID: <8323ba9aba1155004bcd201b4fd7b2fa@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_133325_702525_BA7580AA 
X-CRM114-Status: GOOD (  14.23  )
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
> Support for Rockchip RK3588 GMAC was added without use of the
> DELAY_ENABLE macro to assist with enable/disable use of MAC rx/tx 
> delay.
> 
> Change to use a variant of the DELAY_ENABLE macro to help disable MAC
> delay when RGMII_ID/RXID/TXID is used.
> 
> Fixes: 2f2b60a0ec28 ("net: ethernet: stmmac: dwmac-rk: Add gmac
> support for rk3588")
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> index 37eb86e4e325..79db81d68afd 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> @@ -91,6 +91,10 @@ struct rk_priv_data {
>  	(((tx) ? soc##_GMAC_TXCLK_DLY_ENABLE : soc##_GMAC_TXCLK_DLY_DISABLE) 
> | \
>  	 ((rx) ? soc##_GMAC_RXCLK_DLY_ENABLE : soc##_GMAC_RXCLK_DLY_DISABLE))
> 
> +#define DELAY_ENABLE_BY_ID(soc, tx, rx, id) \
> +	(((tx) ? soc##_GMAC_TXCLK_DLY_ENABLE(id) : 
> soc##_GMAC_TXCLK_DLY_DISABLE(id)) | \
> +	 ((rx) ? soc##_GMAC_RXCLK_DLY_ENABLE(id) : 
> soc##_GMAC_RXCLK_DLY_DISABLE(id)))
> +
>  #define PX30_GRF_GMAC_CON1		0x0904
> 
>  /* PX30_GRF_GMAC_CON1 */
> @@ -1322,8 +1326,7 @@ static void rk3588_set_to_rgmii(struct
> rk_priv_data *bsp_priv,
>  		     RK3588_GMAC_CLK_RGMII_MODE(id));
> 
>  	regmap_write(bsp_priv->grf, RK3588_GRF_GMAC_CON7,
> -		     RK3588_GMAC_RXCLK_DLY_ENABLE(id) |
> -		     RK3588_GMAC_TXCLK_DLY_ENABLE(id));
> +		     DELAY_ENABLE_BY_ID(RK3588, tx_delay, rx_delay, id));
> 
>  	regmap_write(bsp_priv->grf, offset_con,
>  		     RK3588_GMAC_CLK_RX_DL_CFG(rx_delay) |

Thanks for this patch...  It's looking good to me, and good job
spotting this issue!  Please, free to include:

Reviewed-by: Dragan Simic <dsimic@manjaro.org>

