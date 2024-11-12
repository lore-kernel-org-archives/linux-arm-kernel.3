Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73D3DD41D4E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 03:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4z306/5tuG2l03Ei8VaLJo5265ji9YS3yh7bt9hEGdI=; b=ed7Xf0Df2KeB2OBr9cwKqFsqIL
	Nit7S+PkY82FT/L98z/FGqUVqX6BTb/D2B5KknOKZ5pX4aGtXsyHRXnhHhnAZBlNMx7v5URomyD33
	HMipE1fpY2RYlkxYjZumZccV8kBhzZHaUo5dYqH7Ri22BePUcKLpVo1D+M6YtKZGTy9dikPLTMn6A
	EnIX7Co0HoyoUcj7VhkMEEKT5X6zI/yD59A/z2aQi49XSf2K+MX8KCzAncESXVs01OvUUsydwNAJ2
	URSUZ1XII7CDgY0FgT0t0V5f0KnnnSshIZit3jMxwO59BZt/0Nd0GHFA7AxxHl5uWyTXBbePFK85t
	uLyuxN3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAhfV-000000025CX-0eEr;
	Tue, 12 Nov 2024 03:34:17 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAhdi-0000000254f-0nSo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 03:32:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0C9E7A40297;
	Tue, 12 Nov 2024 03:30:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8CC2C4CECD;
	Tue, 12 Nov 2024 03:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731382345;
	bh=CRaC5wjfbFfQA5LdfDrUsa3MI7ETN4OH4NFZVHy3LZ4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qPHS1LaRS738ZEdxN0SIOOejrDNeR3mIZxf8FoqvHVzE+3P3HSDY/j89/4CNJY/Yf
	 8hhjNmzYPFoAGbat558J4jia9L6DHohhw0myhq/FXq5DCXErxtsPeIeOtlclyDs4tR
	 LfkjrG0cQozV0elK6PBJl7JWLZP514f7/Y3EWaSRIJmk9w4wF+9bgZ52aUjfiJMbcB
	 N/ITfrxNiOAELhQo9fW15NPfJJq2o9RZ25mV2R+apxtOA0SrGqeurIZ9SvEQLUNYNo
	 TmkKiKJ3HtXv96XDD6L6cva4MvyIkSREmIoMo3a0fij2iRWm9tbbDpNfMAzK1xkj99
	 4cbvrSuUZL8ng==
Date: Mon, 11 Nov 2024 19:32:22 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: netdev@vger.kernel.org, Marc Kleine-Budde <mkl@pengutronix.de>, Vincent
 Mailhol <mailhol.vincent@wanadoo.fr>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Florian Fainelli
 <florian.fainelli@broadcom.com>, Vladimir Oltean <olteanv@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Pantelis Antoniou
 <pantelis.antoniou@gmail.com>, Marcin Wojtas <marcin.s.wojtas@gmail.com>,
 Byungho An <bh74.an@samsung.com>, Kevin Brace
 <kevinbrace@bracecomputerlab.com>, Francois Romieu <romieu@fr.zoreil.com>,
 Michal Simek <michal.simek@amd.com>, Heiner Kallweit
 <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, Zhao Qiang
 <qiang.zhao@nxp.com>, linux-can@vger.kernel.org (open list:CAN NETWORK
 DRIVERS), linux-kernel@vger.kernel.org (open list),
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/Allwinner sunXi
 SoC support), linux-sunxi@lists.linux.dev (open list:ARM/Allwinner sunXi
 SoC support), linuxppc-dev@lists.ozlabs.org (open list:FREESCALE SOC
 FS_ENET DRIVER)
Subject: Re: [PATCHv2 net-next] net: use pdev instead of OF funcs
Message-ID: <20241111193222.00ae2f3e@kernel.org>
In-Reply-To: <20241111210316.15357-1-rosenp@gmail.com>
References: <20241111210316.15357-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_193226_513651_1BF75B37 
X-CRM114-Status: GOOD (  13.65  )
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

On Mon, 11 Nov 2024 13:03:16 -0800 Rosen Penev wrote:
> --- a/drivers/net/ethernet/samsung/sxgbe/sxgbe_platform.c
> +++ b/drivers/net/ethernet/samsung/sxgbe/sxgbe_platform.c
> @@ -111,7 +111,7 @@ static int sxgbe_platform_probe(struct platform_device *pdev)
>  	}
>  
>  	/* Get the SXGBE common INT information */
> -	priv->irq  = irq_of_parse_and_map(node, 0);
> +	priv->irq = platform_get_irq(pdev, 0);
>  	if (priv->irq <= 0) {
>  		dev_err(dev, "sxgbe common irq parsing failed\n");
>  		goto err_drv_remove;
> @@ -122,7 +122,7 @@ static int sxgbe_platform_probe(struct platform_device *pdev)
>  
>  	/* Get the TX/RX IRQ numbers */
>  	for (i = 0, chan = 1; i < SXGBE_TX_QUEUES; i++) {
> -		priv->txq[i]->irq_no = irq_of_parse_and_map(node, chan++);
> +		priv->txq[i]->irq_no = platform_get_irq(pdev, chan++);
>  		if (priv->txq[i]->irq_no <= 0) {
>  			dev_err(dev, "sxgbe tx irq parsing failed\n");
>  			goto err_tx_irq_unmap;
> @@ -130,14 +130,14 @@ static int sxgbe_platform_probe(struct platform_device *pdev)
>  	}
>  
>  	for (i = 0; i < SXGBE_RX_QUEUES; i++) {
> -		priv->rxq[i]->irq_no = irq_of_parse_and_map(node, chan++);
> +		priv->rxq[i]->irq_no = platform_get_irq(pdev, chan++);
>  		if (priv->rxq[i]->irq_no <= 0) {
>  			dev_err(dev, "sxgbe rx irq parsing failed\n");
>  			goto err_rx_irq_unmap;
>  		}
>  	}
>  
> -	priv->lpi_irq = irq_of_parse_and_map(node, chan);
> +	priv->lpi_irq = platform_get_irq(pdev, chan);
>  	if (priv->lpi_irq <= 0) {
>  		dev_err(dev, "sxgbe lpi irq parsing failed\n");
>  		goto err_rx_irq_unmap;

Coccicheck wants you to drop the errors:

drivers/net/ethernet/samsung/sxgbe/sxgbe_platform.c:116:2-9: line 116 is redundant because platform_get_irq() already prints an error
drivers/net/ethernet/samsung/sxgbe/sxgbe_platform.c:127:3-10: line 127 is redundant because platform_get_irq() already prints an error
drivers/net/ethernet/samsung/sxgbe/sxgbe_platform.c:135:3-10: line 135 is redundant because platform_get_irq() already prints an error
drivers/net/ethernet/samsung/sxgbe/sxgbe_platform.c:142:2-9: line 142 is redundant because platform_get_irq() already prints an error

You can make it a separate patch in a series, for clarity.
-- 
pw-bot: cr

