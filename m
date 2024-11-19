Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9F16D44160
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 13:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8phBlKnPGyquZpUR4CtoI5JKyG39N4jtaX8T9/dhoVE=; b=VsThKWR5xV0UGGUXz2mlthNRhN
	0TC4dP2EDzrrt60zV2ZvubeIb8/qy4riAuWerSuzZYYbxndvWoU0Rf2mJVm0jP6BRJf5+gFSdTlsa
	s6ZwcjeZanHoa9/G5VsgpWjQ7pZqbjBZlOYeCUuhJ5rg2PyCYIzYOO3g4xOw5AHtrv7H/gN6mS11+
	/2tDuoXRGRLMpoAknIdvP4C1GS5qt3atWmk9spVKOgm8I4ZPQ3RXlIONjUUaUe/tbDTXWwLvnVDBJ
	hRIjSTh9pFItnbEsdglhg/9pgxTJqSkLH/ertY/f6TVEMNQyft6ZPV7BL2xvKjp+B4DzFD2ZoFg03
	ujecLYXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDOjm-0000000CbUu-23Bt;
	Tue, 19 Nov 2024 13:57:50 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDOi7-0000000Cb8Z-1G1O
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 13:56:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=8phBlKnPGyquZpUR4CtoI5JKyG39N4jtaX8T9/dhoVE=; b=Omq3yR3iFFtSeRX03YohOOeDTb
	Gvg7+hksVB7P1htaGtkk6FzzVzmP3tupywqmcA63m9N43s5GhqyReBJQnh+N+x8nqk6ke8y8ERILN
	argxdK/h76qHrS1QPe1K5JU3+NV5pjuvjo9SR+lXP9m3Hg667DTYA97EPvWt2iA9tWFc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tDOhu-00DoDg-Nf; Tue, 19 Nov 2024 14:55:54 +0100
Date: Tue, 19 Nov 2024 14:55:54 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: hkallweit1@gmail.com, linux@armlinux.org.uk, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	joel@jms.id.au, andrew@codeconstruct.com.au, f.fainelli@gmail.com,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2] net: mdio: aspeed: Add dummy read for fire control
Message-ID: <27a39b05-3029-4b31-ada7-542e23e4de8b@lunn.ch>
References: <20241119095141.1236414-1-jacky_chou@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241119095141.1236414-1-jacky_chou@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_055607_333693_B2D1D4A7 
X-CRM114-Status: GOOD (  18.86  )
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

Please have another attempt at writing the commit message.

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

Maybe: /* Dummy read to flush previous write to controller */


    Andrew

---
pw-bot: cr

