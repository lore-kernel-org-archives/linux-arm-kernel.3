Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6452CD5BC9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 01:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F5xpMV+AO1CKUrIiHxmrwoh1nrbemlBJIcVD/F1YUvI=; b=KW3gkAurjrY3phBsRj1rbN3riB
	+d5qSHRk8fcek4tiSpcK4mKqrbjH8BcBs8hdBhC9F/PDGo60DzRSHy6sMoShuIxKLcHJIKr7Rjvh/
	0ImePsEnTQ6w/4Y98MqIpeH8Q6AU5zcJ9jOOYVFm3yjQcPbG59Z10o7mcKm5bVVfkjicVmz/J6idk
	LYkJlxZRZbMTf/Aulevy+TA7izW+NvaahcVYRQoRf3M/uhYFjm1A1o4czsIZsNRtU9dH87YhpsY5v
	Wj6AhuTCt1XAKGcY5w6lNAJo98TI6P+kaDCJBrGdKagkXcJTtN/sko+eTbQqqKONa8612lbg0aKxV
	lCmH7MCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSQ18-00000004yEQ-1RKu;
	Thu, 28 May 2026 01:58:38 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSQ16-00000004yE4-1IIW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 01:58:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=F5xpMV+AO1CKUrIiHxmrwoh1nrbemlBJIcVD/F1YUvI=; b=UJv8Nm5WktK8TNlR51sdYFfnq4
	U5X45/lWKA9m5eQxfTd1jDw9F7MY4tI7XFQgWdqBgz/ZBUIJVdIWGGmsS6CtSdhZGYLLD9fEYcGyO
	D+7758T0EZKkB8iUO+KgIq15euwfq2ei8TlvkBGqAvjp+5P7Wkm4zK0EVXk3LalpOO6s=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wSQ0u-004q8p-CU; Thu, 28 May 2026 03:58:24 +0200
Date: Thu, 28 May 2026 03:58:24 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: muhammad.nazim.amirul.nazle.asmade@altera.com
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	rmk+kernel@armlinux.org.uk, maxime.chevallier@bootlin.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] net: stmmac: Improve Tx timer arm logic further
Message-ID: <a0cdbac8-c7b2-4dc2-b08c-7fae99a73e93@lunn.ch>
References: <20260527023359.18876-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260527023359.18876-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_185836_354316_7FB4130E 
X-CRM114-Status: GOOD (  15.62  )
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

> pre-patch behaviour. The meaning of tx_coal_timer is unchanged.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 3591755ea30b..35da51c26248 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -3341,12 +3341,14 @@ static void stmmac_tx_timer_arm(struct stmmac_priv *priv, u32 queue)
>  	 * Try to cancel any timer if napi is scheduled, timer will be armed
>  	 * again in the next scheduled napi.
>  	 */
> -	if (unlikely(!napi_is_scheduled(napi)))
> -		hrtimer_start(&tx_q->txtimer,
> -			      STMMAC_COAL_TIMER(tx_coal_timer),
> -			      HRTIMER_MODE_REL);
> -	else

With this code, the timer is always tx_coal_timer in the future.


> +	if (unlikely(!napi_is_scheduled(napi))) {
> +		if (unlikely(!(hrtimer_active(&tx_q->txtimer))))
> +			hrtimer_start(&tx_q->txtimer,
> +				      STMMAC_COAL_TIMER(tx_coal_timer),
> +				      HRTIMER_MODE_REL);

If the timer is not active, it is set to tx_coal_timer in the
future. However, if the timer is active, meaning it is already
counting down, it is left alone, so is less than tx_coal_timer in the
future.

Do i have this right?

Doesn't that change the meaning of the timer. It now actually goes off
sooner?

This is somewhat academic. The point of coalescence is to reduce
overheads. The increase in performance shows that this change does
reduce overheads.

	Andrew

