Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93E22C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 13:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rkKA5JFXkaqeIgKnZeTRvq/H+eMfFQ7tSAFHadzv+i4=; b=vaQJzAe0qTfxLASnPGx8XLXfur
	TpAAl4OwThYsb4IHFKu+xpPMdzT4WafsZo9if87RFinIQltBvQD5Vrf0yz1iCuu3wI7asJxuD7PmJ
	3J0Gt/lBDDsqEOnbrkj/m4zN5bspTQycliwn75ubMcSB4a+uwI6P5FtVqODQauVqAKHeJv34fHOg1
	MOa2HFOfnqhtxZiJFxVICJzarykBEsT6amvMpqnRkAWKe3cZl5/zQjqpYnSfDQlvemTvIz8GKWIwX
	CE6uaHXE5j7INFC9zwXALkeUyNpbeMYlrr6EZathUUKL2SQB+pNvuo96S0/cO09fv7SylunJ4alG9
	jvwzp1YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubJQc-00000002L0g-0DQU;
	Mon, 14 Jul 2025 13:41:10 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubJKc-00000002JgS-0iRN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 13:34:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=rkKA5JFXkaqeIgKnZeTRvq/H+eMfFQ7tSAFHadzv+i4=; b=qPYqJaoStTW6WZY8E3xsfppAcV
	GciwfhUoAIxtaUx5hRVyOQZL595Nutl12IeZGQ+2QwMLot/GFSllOAsMkFzzwfSJiTKTwqNREFIWM
	u1tdKdG9gNKJ9cvGzr99Z+DlXIe3rzBruOF4Hcro7UHi3k4oDscE48rIsYpUmNuaWcqU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1ubJKR-001SkI-Ao; Mon, 14 Jul 2025 15:34:47 +0200
Date: Mon, 14 Jul 2025 15:34:47 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: rohan.g.thomas@altera.com
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Romain Gantois <romain.gantois@bootlin.com>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Matthew Gerlach <matthew.gerlach@altera.com>
Subject: Re: [PATCH net-next 1/3] net: stmmac: xgmac: Disable RX FIFO
 Overflow interrupts
Message-ID: <bef4d761-8909-4f90-8822-8c344291cb93@lunn.ch>
References: <20250714-xgmac-minor-fixes-v1-0-c34092a88a72@altera.com>
 <20250714-xgmac-minor-fixes-v1-1-c34092a88a72@altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250714-xgmac-minor-fixes-v1-1-c34092a88a72@altera.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_063458_209452_EB806899 
X-CRM114-Status: GOOD (  19.00  )
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

On Mon, Jul 14, 2025 at 03:59:17PM +0800, Rohan G Thomas via B4 Relay wrote:
> From: Rohan G Thomas <rohan.g.thomas@altera.com>
> 
> Enabling RX FIFO Overflow interrupts is counterproductive
> and causes an interrupt storm when RX FIFO overflows.
> Disabling this interrupt has no side effect and eliminates
> interrupt storms when the RX FIFO overflows.
> 
> Commit 8a7cb245cf28 ("net: stmmac: Do not enable RX FIFO
> overflow interrupts") disables RX FIFO overflow interrupts
> for DWMAC4 IP and removes the corresponding handling of
> this interrupt. This patch is doing the same thing for
> XGMAC IP.
> 
> Signed-off-by: Rohan G Thomas <rohan.g.thomas@altera.com>
> Reviewed-by: Matthew Gerlach <matthew.gerlach@altera.com>

Please take a read of:

https://www.kernel.org/doc/html/latest/process/maintainer-netdev.html

This appears to be a fixed, so the Subject: line should indicate this.
Please also include a Fixes: tag, and Cc: stable.

> ---
>  drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
> index 5dcc95bc0ad28b756accf9670c5fa00aa94fcfe3..7201a38842651a865493fce0cefe757d6ae9bafa 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
> @@ -203,10 +203,6 @@ static void dwxgmac2_dma_rx_mode(struct stmmac_priv *priv, void __iomem *ioaddr,
>  	}
>  
>  	writel(value, ioaddr + XGMAC_MTL_RXQ_OPMODE(channel));
> -
> -	/* Enable MTL RX overflow */
> -	value = readl(ioaddr + XGMAC_MTL_QINTEN(channel));
> -	writel(value | XGMAC_RXOIE, ioaddr + XGMAC_MTL_QINTEN(channel));

What is the reset default? Would it make sense to explicitly disable
it, rather than never enable it? What does 8a7cb245cf28 do?

    Andrew

---
pw-bot: cr



