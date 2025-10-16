Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DA40CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 07:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7zOUzik5MyvROjRAqeUBJc8fQpkR6r5Z9zOCmYjzSrI=; b=NLFzjKzx6aLxL72myXEPzlbDJO
	bcqiqMKaAbaNWGBfwzt4nLESi6tCG+8I/dlmMvQ7JNTQKK8zD47bHzVTLT0a/yFuaqmmb7rW0EntM
	4hJArPlnrc96iMW/DH1Yxoogo3EY5g1ZGUYbvvcUX9ab8b/u9SDJSBHpHXwSE13pZRSJqykhh29NQ
	zeNHSDynML1QwMuZmhUAW4MjuVdgJyFJ59CuH3AirkzkGZpffstwhlNvHM0ZX2tuMgJyee3ddWQ4F
	lNawOm7jRjI7Lofc8/2dH/XCh6qrfVNj774m0C7k3RIuIj8arT2hlnFngzjpCLXuVEMMSgQO8T/mN
	FeLcwzwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9IKB-00000003kJq-0K7C;
	Thu, 16 Oct 2025 07:22:59 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9IK8-00000003kIo-271c
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 07:22:58 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 740D11A1410;
	Thu, 16 Oct 2025 07:22:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3F1A56062C;
	Thu, 16 Oct 2025 07:22:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 90A44102F22EB;
	Thu, 16 Oct 2025 09:22:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760599373; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=7zOUzik5MyvROjRAqeUBJc8fQpkR6r5Z9zOCmYjzSrI=;
	b=vpGWNdROx4mJa+kYUKCWf/ZKPABe5NrTWaC34G6w96sxkDyFCDXq6sg5uKoVPB7Djx8+Bv
	eZgWrS6i7SEr26izkqJKdZEgm6kJ7yeGzl07WTlAlhYdB/GpuvNWdURxhefN2t2s8pEG/U
	vhSdK+mePRkg12GEg3pgX/Iywy1BQhOW1wF3atE8/Lr51xWIRTsnyWksUrRaUbNJufoP1x
	9ixcsKgT/u6qgRmcmAHAxNIrdDTdsWkW1usH+Od3ORZMb2lvl7nh68Jy3F1s/SAcjW999C
	bTO3HzVg9oK0na+KnHrtjsH9Zk4UOzRnGYAimcwJ+mR2esioHsRLRKgq5YAY+Q==
Message-ID: <c1b019e6-1463-400f-b421-91ae8fa63c3b@bootlin.com>
Date: Thu, 16 Oct 2025 09:22:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 3/5] net: stmmac: avoid PHY speed change when
 configuring MTU
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>
References: <aO_HIwT_YvxkDS8D@shell.armlinux.org.uk>
 <E1v945T-0000000AmeV-2BvU@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1v945T-0000000AmeV-2BvU@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_002256_699248_15033F79 
X-CRM114-Status: GOOD (  18.91  )
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


On 15/10/2025 18:10, Russell King (Oracle) wrote:
> There is no need to do the speed-down, speed-up dance when changing
> the MTU as there is little power saving that can be gained from such
> a brief interval between these, and the autonegotiation they cause
> takes much longer.
> 
> Move the calls to phylink_speed_up() and phylink_speed_down() into
> stmmac_open() and stmmac_release() respectively, reducing the work
> done in the __-variants of these functions.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

> ---
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 3728afa701c6..500cfd19e6b5 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -3963,8 +3963,6 @@ static int __stmmac_open(struct net_device *dev,
>  	stmmac_init_coalesce(priv);
>  
>  	phylink_start(priv->phylink);
> -	/* We may have called phylink_speed_down before */
> -	phylink_speed_up(priv->phylink);
>  
>  	ret = stmmac_request_irq(dev);
>  	if (ret)
> @@ -4015,6 +4013,9 @@ static int stmmac_open(struct net_device *dev)
>  
>  	kfree(dma_conf);
>  
> +	/* We may have called phylink_speed_down before */
> +	phylink_speed_up(priv->phylink);
> +
>  	return ret;
>  
>  err_disconnect_phy:
> @@ -4032,13 +4033,6 @@ static void __stmmac_release(struct net_device *dev)
>  	struct stmmac_priv *priv = netdev_priv(dev);
>  	u32 chan;
>  
> -	/* If the PHY or MAC has WoL enabled, then the PHY will not be
> -	 * suspended when phylink_stop() is called below. Set the PHY
> -	 * to its slowest speed to save power.
> -	 */
> -	if (device_may_wakeup(priv->device))
> -		phylink_speed_down(priv->phylink, false);
> -
>  	/* Stop and disconnect the PHY */
>  	phylink_stop(priv->phylink);
>  
> @@ -4078,6 +4072,13 @@ static int stmmac_release(struct net_device *dev)
>  {
>  	struct stmmac_priv *priv = netdev_priv(dev);
>  
> +	/* If the PHY or MAC has WoL enabled, then the PHY will not be
> +	 * suspended when phylink_stop() is called below. Set the PHY
> +	 * to its slowest speed to save power.
> +	 */
> +	if (device_may_wakeup(priv->device))
> +		phylink_speed_down(priv->phylink, false);
> +
>  	__stmmac_release(dev);
>  
>  	phylink_disconnect_phy(priv->phylink);


