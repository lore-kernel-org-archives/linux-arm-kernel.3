Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF98AD60D17
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 09:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kZTawVyREwEbEOOkp3Rqm/v6gSKb/kMRQbLscX9yHuw=; b=w2tJvziF/lVj1IjHDcJpsk99TC
	lhsETNNbW3wwp/RuD60zZSI2XZ0wEttnlJR89VBVlB3sNy3AJiEnmhJ5mN9JDJ7Bq5274viarltSy
	fx105zgtEQc/MVulxgqSUJk/qf8iPaULcZMs19zYcttJuf1O+Gb3WuhaSkw18ohyYAlP7quxqEYoE
	4oHeu9NIPTkmx/JWykSSWG1v8lPtU4pKisHu6jX5/1+wIXvzJ+ZNURGUjoli8QZG60wuHMdO4xXSf
	DNinpjQHk3j5RnVRVpMwf+nA/gtGx5HDVH56BgVfuimAol84w9jqaGc63p7t0I689ttFALCPf9Qxd
	WWv+V6Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDhFy-0000000Ex6U-3D2g;
	Wed, 20 Nov 2024 09:44:18 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDhF1-0000000Ewxn-3PzT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 09:43:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=kZTawVyREwEbEOOkp3Rqm/v6gSKb/kMRQbLscX9yHuw=; b=igZMxffbTRUyD8L+1EoUfrdzky
	RSCaES81zeNcd2+z6BGEANUnUTKU4IfjdGt+u85jLekbR7U1rsHoncYLr4zg5cR1nKwjoKFdG6/ZC
	Qx1umwuHGU1wHui6vx5IHTK9UBcFgRWsI0n1SAEWTnn1X1jXAcTFRL0C5pnH9XXUKpIfyWrRfpzry
	66FUMXQBG2L1hvu0eYY+ZzUPvAe1h6j3tzVaDsT7lFo+FrDcVo3WgPrkzuiMEfWkTrd001NvRabRJ
	Ewjn/XKISUqt3m0EGepTbsEloWWyFSGQBTDbYsE57tavrghZxu5A4lu+kEOy8NcKfOSmKvCWETIyW
	oYTXeekg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:41692)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tDhEg-0005D4-0P;
	Wed, 20 Nov 2024 09:42:58 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tDhEb-0006zB-1H;
	Wed, 20 Nov 2024 09:42:53 +0000
Date: Wed, 20 Nov 2024 09:42:53 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	joel@jms.id.au, andrew@codeconstruct.com.au, f.fainelli@gmail.com,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2] net: mdio: aspeed: Add dummy read for fire control
Message-ID: <Zz2vHWLYTRKIG7GK@shell.armlinux.org.uk>
References: <20241119095141.1236414-1-jacky_chou@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241119095141.1236414-1-jacky_chou@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_014319_848687_437A7781 
X-CRM114-Status: GOOD (  18.75  )
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

On Tue, Nov 19, 2024 at 05:51:41PM +0800, Jacky Chou wrote:
> When the command bus is sometimes busy, it may cause the command is not
> arrived to MDIO controller immediately. On software, the driver issues a
> write command to the command bus does not wait for command complete and
> it returned back to code immediately. But a read command will wait for
> the data back, once a read command was back indicates the previous write
> command had arrived to controller.
> Add a dummy read to ensure triggering mdio controller before starting
> polling the status of mdio controller to avoid polling unexpected timeout.
> 
> Fixes: a9770eac511a ("net: mdio: Move MDIO drivers into a new subdirectory")
> Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
> ---
>  drivers/net/mdio/mdio-aspeed.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/net/mdio/mdio-aspeed.c b/drivers/net/mdio/mdio-aspeed.c
> index c2170650415c..373902d33b96 100644
> --- a/drivers/net/mdio/mdio-aspeed.c
> +++ b/drivers/net/mdio/mdio-aspeed.c
> @@ -62,6 +62,8 @@ static int aspeed_mdio_op(struct mii_bus *bus, u8 st, u8 op, u8 phyad, u8 regad,
>  		| FIELD_PREP(ASPEED_MDIO_DATA_MIIRDATA, data);
>  
>  	iowrite32(ctrl, ctx->base + ASPEED_MDIO_CTRL);
> +	/* Add dummy read to ensure triggering mdio controller */
> +	(void)ioread32(ctx->base + ASPEED_MDIO_CTRL);

I'd change that comment to:

	/* The above write could be posted, causing the timeout below to
	 * be inaccurate. Ensure the controller starts before we start the
	 * timeout.
	 */

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

