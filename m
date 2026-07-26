Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0FC1C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 18:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MaEQKMeEjvfpA5VB/sHKsrGgnnBG0BlVfrQAWBNdC64=; b=P7q2XIDMeCrzz17V3Z1Ekw+htX
	qGq/mhjhxf/0L741nUGe48kRd79XYaZV4N2R4bQtEzd37syPF4/t8SqgauRZ+1ZbMpL5FNaqK9as+
	MpnpRInxtyVcbpBJZXAwq7piGRTrHCpmebnVLnOVS7mOx27QuBt0ieZzlOZrVNqWh1FDhOwcr0RwE
	AdCZnLHv1Y9aGPbqAWUSlAAkO/1nF7P9kqDyveD9h457PqzbtTNBQ0bmZKyWLGJpdhjou4svH4wnC
	DjBJ9PsesubVlFYDUJZi85eKQYzrMxW+TUfmxQ0ofavDjJjgcUxhO1T0TreiLeLC0WSmBVlATgiSA
	7x1AMOSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo3Nj-00000001T9g-1doT;
	Sun, 26 Jul 2026 18:15:23 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo3Nh-00000001T7s-2amP
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jul 2026 18:15:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=MaEQKMeEjvfpA5VB/sHKsrGgnnBG0BlVfrQAWBNdC64=; b=IvDW9TsUa3rEoKYK2ssfe1XfcZ
	Z81q9POuAvYV/TeQHVOGEVPdZdB8vCujEEQPoTA+E3+pLsyfLLyJOT8y4vo1rLnCnsxtT+BhMQuKe
	7OEqGaULT9viDXcyNr/DK9AMFE7B3LARmTUHTk5kMWFCztjVErfXyW071tBM4+HeLC1M=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wo3NT-00EK83-Na; Sun, 26 Jul 2026 20:15:07 +0200
Date: Sun, 26 Jul 2026 20:15:07 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: dev.taqnialabs@gmail.com
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: stmmac: enable MAC rx/tx after DMA start
Message-ID: <ee639271-60dd-49f7-9e77-0ae47841754d@lunn.ch>
References: <20260726-stmmac-rx-fifo-block-v1-1-45ab094b6c02@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260726-stmmac-rx-fifo-block-v1-1-45ab094b6c02@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_111521_658627_26020AE9 
X-CRM114-Status: GOOD (  12.83  )
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

> @@ -3692,9 +3692,6 @@ static int stmmac_hw_setup(struct net_device *dev)
>  		priv->hw->rx_csum = 0;
>  	}
>  
> -	/* Enable the MAC Rx/Tx */
> -	stmmac_mac_set(priv, priv->ioaddr, true);
> -
>  	/* Set the HW DMA mode and the COE */
>  	stmmac_dma_operation_mode(priv);
>  
> @@ -3750,6 +3747,9 @@ static int stmmac_hw_setup(struct net_device *dev)
>  	/* Start the ball rolling... */
>  	stmmac_start_all_dma(priv);
>  
> +	/* Enable the MAC Rx/Tx */
> +	stmmac_mac_set(priv, priv->ioaddr, true);
> +

There should be a function which is the opposite of stmmac_hw_setup(),
which tears it down. What order are things done there? tear down is
generally done in the opposite order to setup, so does the "Disable
the MAC Rx/Tx" also need to move?

> @@ -7189,12 +7189,12 @@ int stmmac_xdp_open(struct net_device *dev)
>  		hrtimer_setup(&tx_q->txtimer, stmmac_tx_timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
>  	}
>  
> -	/* Enable the MAC Rx/Tx */
> -	stmmac_mac_set(priv, priv->ioaddr, true);
> -
>  	/* Start Rx & Tx DMA Channels */
>  	stmmac_start_all_dma(priv);
>  
> +	/* Enable the MAC Rx/Tx */
> +	stmmac_mac_set(priv, priv->ioaddr, true);
> +
>  	ret = stmmac_request_irq(dev);
>  	if (ret)
>  		goto irq_error;

Same comment for the opposite of stmmac_xdp_open().

     Andrew

