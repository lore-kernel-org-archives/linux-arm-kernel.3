Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57A5AC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Jun 2025 13:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6dFmZYMvFnPKz7ElX5mkKo2Zv+TMRgVK23txlUfoVfY=; b=H16G9Q0fyreW0W/PjhibNRJxZV
	IBM9brPY5dxwjCI9xdt4oPRidSrl2ZBCaJuwFaygQn7lxOAtVWIE4Jg5feiYvoxJ5YE8JgqEX13U+
	A0To0Qzo0IGoAs7+qBIS+enoY2+1nnPEEomiAul9AFKG/py9VR9QrgrhQsDuGZkECAZqjU9cpCg5m
	Pfv78aWDmUjCvfjIKX8isnbAN+OhfVHoMKoLwknrW922k51h0wyE/17uRj03WXimWoAQ/nIwnnEXh
	0jgD5dj9SZjXZLqQsl9gu4gYYoj5O1ASF6XMHtTTE06bP9lErMYEFlNVe7ILNi9/ydEnOlp88h1yl
	NshatsoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNXa1-00000000OEU-3yFe;
	Fri, 06 Jun 2025 13:57:57 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNXXu-00000000Nqs-2SCh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Jun 2025 13:55:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=6dFmZYMvFnPKz7ElX5mkKo2Zv+TMRgVK23txlUfoVfY=; b=T5NhYSjd2nnhmPpsffbFUfP6uC
	eAPdvN5/SN0+W8vn/INqTew/+ATLDf1rR3/RBPDbaRm6mjXIyOyP8HLGEvFR+3FQV+Vo9iFNGWN/h
	QJmBgqQOEOoBeJ+/6okvzyJNd9Gu+bHs4IM1KDGCQ0ncCsGduFLMHl54xvqJ7OEgqzrM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uNXXZ-00EuDg-89; Fri, 06 Jun 2025 15:55:25 +0200
Date: Fri, 6 Jun 2025 15:55:25 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Bartlomiej Dziag <bartlomiejdziag@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	Wojciech Drewek <wojciech.drewek@intel.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Alexis =?iso-8859-1?Q?Lothor=E9?= <alexis.lothore@bootlin.com>,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: stmmac: Change the busy-wait loops timing
Message-ID: <9f5f87d6-c7c2-4288-8c02-e57b0d943881@lunn.ch>
References: <20250606102100.12576-1-bartlomiejdziag@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250606102100.12576-1-bartlomiejdziag@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_065546_625014_4C5DF3C9 
X-CRM114-Status: GOOD (  19.19  )
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

On Fri, Jun 06, 2025 at 12:19:49PM +0200, Bartlomiej Dziag wrote:
> After writing a new value to the PTP_TAR or PTP_STSUR registers,
> the driver waits for the addend/adjust operations to complete.
> Sometimes, the first check operation fails, resulting in
> a 10 milliseconds busy-loop before performing the next check.
> Since updating the registers takes much less than 10 milliseconds,
> the kernel gets stuck unnecessarily. This may increase the CPU usage.
> Fix that with changing the busy-loop interval to 5 microseconds.
> The registers will be checked more often.
> 
> Signed-off-by: Bartlomiej Dziag <bartlomiejdziag@gmail.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
> index e2840fa241f2..f8e1278a1837 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
> @@ -144,11 +144,11 @@ static int config_addend(void __iomem *ioaddr, u32 addend)
>  	writel(value, ioaddr + PTP_TCR);
>  
>  	/* wait for present addend update to complete */
> -	limit = 10;
> +	limit = 10000;
>  	while (limit--) {
>  		if (!(readl(ioaddr + PTP_TCR) & PTP_TCR_TSADDREG))
>  			break;
> -		mdelay(10);
> +		udelay(5);

I would actually suggest rewriting this using the macros from iopoll.h.

    Andrew

---
pw-bot: cr

