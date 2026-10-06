Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB8EECA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 07:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y687D0b0XnsGS0sPqnJmnJK0mFwzbLcgaZ8E4hwXOuY=; b=eqX5mtZ3uctSOPhTI4q4381hyK
	xai4Jpp0cgAF1DG8lnlRQDcW3CjXBzv/TwBgfX4/BlnucxaklcnB7Zx3az9gO32set2EuTTdKL7rp
	lpSL7OaWTfQnunUapu4QL1SkzrayZ2q9JP2z+al33dAfyKkah8KJwocBpFK3zrKnOrBLzfd57td/L
	j3kCUAps9BKg/5SkjZNR4zZrOHvXAIEGU8ORkGTHyPxw8h4k4Kl/DWYQzRYdtmDvaw6anQDb5vaB9
	unuw4EfFq+59UKLgIwRi/nyeeefzxef2IA9D9y4pFArkwBgARAvCFYCSQ4Kenvxrj35/jT7jcMUER
	drDnwHWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDzwo-00000000Dx7-0cQO;
	Tue, 06 Oct 2026 07:50:50 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDzwk-00000000Dwg-3cfS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 07:50:49 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id AE9B61A1185;
	Tue,  6 Oct 2026 07:50:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 80B4960553;
	Tue,  6 Oct 2026 07:50:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 205751033069A;
	Tue,  6 Oct 2026 09:50:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791273040; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=Y687D0b0XnsGS0sPqnJmnJK0mFwzbLcgaZ8E4hwXOuY=;
	b=h71LLACy3ly81f+yP0sA5gGlPiCBQERPnJDVMokgcAb93p+b9EO5xXEdmclFfV0U6Md1el
	jWjZpD+A8b0T32+Pbgm1kDLNW06sJ+TbWD6L1a2fJvWRVD4gfcKWDFek2uBBx9azHk0oFG
	OfE7pK6l/J40SOqBQodwpvZL7bhCbXwTVO7LjbJzULy0guEOTGTWG99HQJ8W+ipxpRkExv
	WbFya2BD16PAqkfJqCVdqOp/bbMuAjWxIGjvHz1uH9hO8T6ssuQPDs8fKgKemHbF4fYXQx
	eS653ptxuAIE6w/Y9j3ntM6wUkZo+PS9KQRay+ztt0McNJreGxxdiupfySZRUw==
Message-ID: <97bc7b37-0c21-4182-9d1d-075287cd0fde@bootlin.com>
Date: Tue, 6 Oct 2026 09:50:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2] net: stmmac: unwind the WoL IRQ after a safety IRQ
 request failure
To: James Hilliard <james.hilliard1@gmail.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Serge Semin <fancer.lancer@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, Nicolai Buchwitz
 <nb@tipi-net.de>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261006-stmmac-irq-unwind-v2-1-194591c87460@gmail.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20261006-stmmac-irq-unwind-v2-1-194591c87460@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_005047_067230_09E72A10 
X-CRM114-Status: GOOD (  15.94  )
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

Hi,

On 10/6/26 09:06, James Hilliard wrote:
> The safety IRQ is requested after the MAC and optional WoL IRQs. If its
> request fails, stmmac_free_irq() frees the unregistered safety IRQ and
> leaks the WoL handler. This can warn about an already-free IRQ and make
> the next open fail.
> 
> Move the safety and WoL cleanup labels into reverse acquisition order.
> 
> Fixes: 5c2215167d12 ("net: stmmac: Add driver support for common safety IRQ")
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
> Changes in v2:
> - Drop the claim that later per-queue IRQ failures also had broken
>   cleanup; those paths already released both IRQs.
> - Add Nicolai Buchwitz's Reviewed-by.
> - Link to v1: https://patch.msgid.link/20260930-stmmac-irq-unwind-v1-1-0c8a053761c7@gmail.com
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index b837e8e27a35..0403d434c9b9 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -3799,13 +3799,13 @@ static void stmmac_free_irq(struct net_device *dev,
>  			free_irq(msi->sfty_ce_irq, dev);
>  		fallthrough;
>  	case REQ_IRQ_ERR_SFTY_CE:
> -		if (priv->wol_irq > 0 && priv->wol_irq != dev->irq)
> -			free_irq(priv->wol_irq, dev);
> -		fallthrough;
> -	case REQ_IRQ_ERR_SFTY:
>  		if (priv->sfty_irq > 0 && priv->sfty_irq != dev->irq)
>  			free_irq(priv->sfty_irq, dev);
>  		fallthrough;
> +	case REQ_IRQ_ERR_SFTY:
> +		if (priv->wol_irq > 0 && priv->wol_irq != dev->irq)
> +			free_irq(priv->wol_irq, dev);
> +		fallthrough;
>  	case REQ_IRQ_ERR_WOL:
>  		free_irq(dev->irq, dev);
>  		fallthrough;
> 
> ---
> base-commit: d5a007b9b457c915ab1a53227e8939e4018aa97a
> change-id: 20260930-stmmac-irq-unwind-0be86901638d
> 
> Best regards,
> --  
> James Hilliard <james.hilliard1@gmail.com>


