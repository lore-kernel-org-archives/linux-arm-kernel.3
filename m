Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80B95CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 11:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mhOJii7SYuw+AMQe29JURQFVtzesQcEr/6Sv+5/6gXA=; b=w2ecBjfR0Eo7NjgfkF1p2YFu9G
	VWTPnoWFOxRnVq0jWXaNMkEdLo/FibhW4NHfyhVyeVtBx6WlINn+YpVxOPOdTzTrNERfpy7t1D8JM
	wSW/wba1RyPKX36M1bBKUP2BrOJp+V90H06u0whvnwfLA/J8pvGBsO2ZVysX0yxRqaBy197Lwlsqa
	DQ5o81bSUFVPYCPDWEReVQSIByEgP3kixqOPOGvEbq6ejvb+OqIJ/B4Puf3GFIJ6/w+HQ8LomxJtO
	6L0xta2YD/uAy3HpxsddsLd0svx7v+0wgNmFpm1NDXME3A4DOhnHopgnXmx+lniRHIqlG7Vi7h92n
	e9gr3A1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRTsU-0000000H8ZB-1Ccy;
	Mon, 25 May 2026 11:53:50 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRTsR-0000000H8Y0-2fqB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 11:53:49 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 19F621A36B5;
	Mon, 25 May 2026 11:53:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D43E9603DC;
	Mon, 25 May 2026 11:53:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5061010810F8B;
	Mon, 25 May 2026 13:53:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779710022; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=mhOJii7SYuw+AMQe29JURQFVtzesQcEr/6Sv+5/6gXA=;
	b=R2XQuj5GH0+oY+cgBYrGvs4mf8Y+hw5/1fxLkDRsH6HXtM0bSonYk3aIBV2M6x4mUGbYVB
	vOK7DwTn9NOMoWRAYzujbAXTY0a05fVQif1B/fOglR4aX1Hg+91SHkbHB51VJ41EcX9+op
	fn3krBHQYWEEmWn732MeI2VZf5EUlTXPRzm69Pw04SN+ptvdcmiyC5+8B6giexqcQ/kNfq
	m6ySmO4s4B8vgNl2XNLgEG84ERmBGpnECJAc/vrc6/u6Ki0sgyc5x3kUOR42EyWFGp9vky
	euYxmlHQaGRd519dyX7MzhWEV228BAaGGCxhfpn7T8sDMVx0FWWX6hZM8oprRw==
Message-ID: <771efc7b-c49b-49cc-af18-af31d6cbbf5a@bootlin.com>
Date: Mon, 25 May 2026 13:53:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: stmmac: Improve Tx timer arm logic further
To: muhammad.nazim.amirul.nazle.asmade@altera.com, netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, rmk+kernel@armlinux.org.uk,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260525061653.22548-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20260525061653.22548-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_045347_826584_2B18049D 
X-CRM114-Status: GOOD (  15.49  )
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

On 5/25/26 08:16, muhammad.nazim.amirul.nazle.asmade@altera.com wrote:
> From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
> 
> Currently hrtimer_start is called even if hrtimer is
> active. This is unnecessary and expensive in some targets.
> This patch avoids calling hrtimer_start unnecessarily.

This description is a bit lacking on details wrt. the expensiveness
and perf impacts, but I've tested with and without this patch on a
cyclone V with dwmac-socfpga, and I cansee a diff when sending
small UDP packets with :

iperf3 -c <srv> -u -b 0 -l 64

Before this patch, around 45200 pps sent,
after this patch, around 52300 pps sent !

Nice improvement :)

So from my perspective,

Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime


> 
> Signed-off-by: Rohan G Thomas <rohan.g.thomas@intel.com>
> Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
> ---
>   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 12 +++++++-----
>   1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 3591755ea30b..35da51c26248 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -3341,12 +3341,14 @@ static void stmmac_tx_timer_arm(struct stmmac_priv *priv, u32 queue)
>   	 * Try to cancel any timer if napi is scheduled, timer will be armed
>   	 * again in the next scheduled napi.
>   	 */
> -	if (unlikely(!napi_is_scheduled(napi)))
> -		hrtimer_start(&tx_q->txtimer,
> -			      STMMAC_COAL_TIMER(tx_coal_timer),
> -			      HRTIMER_MODE_REL);
> -	else
> +	if (unlikely(!napi_is_scheduled(napi))) {
> +		if (unlikely(!(hrtimer_active(&tx_q->txtimer))))
> +			hrtimer_start(&tx_q->txtimer,
> +				      STMMAC_COAL_TIMER(tx_coal_timer),
> +				      HRTIMER_MODE_REL);
> +	} else {
>   		hrtimer_try_to_cancel(&tx_q->txtimer);
> +	}
>   }
>   
>   /**


