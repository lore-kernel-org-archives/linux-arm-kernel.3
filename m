Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BE36D2F7EF
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 13:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=45fevIuzzwdxiIaiuDVXIFaxf4ZsoS1h5rOMT7+v7qs=; b=M9uBopEQOrxNu3H5bsfD0S4pHL
	MbE6WAj2UN1k0P1HgvtP3l0hP18Mde5R0r9gOCZr6LFF4UZ/9PwaxSdi7o8aFYnVW96Eb3BOR7tzT
	8kfF4GQMboKMS5wOTjwfnyePeMg+A8i034kngMHWfrA6JzsjfjfvS9X9Ddfd17soY6rppfKwz7YsY
	YyKu4CyRuZinKFX2zDz+Ce9dPc4QpS4W5g2O86dXpdUQzwSF7fiI6nwwCj27H0MRHxWSkn35eIPdc
	e9EsWkmd+Wi9sRcV7Li+E7pwR4qGCaSadxicp/bgsK/4f5LsQul8ZrlcAqxFn+QLSp+6FNiBjTyUC
	5fodLO9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRWEe-00000009Y2i-2Eun;
	Fri, 05 Dec 2025 13:52:36 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRWEc-00000009Y23-3FE7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 13:52:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=45fevIuzzwdxiIaiuDVXIFaxf4ZsoS1h5rOMT7+v7qs=; b=dlqjxq1oVt9Er6eo9vth9vX0gR
	eztKjUHcbALGVrKoPeu0Vvd/09R/aNtIbQtbYNm9rPcjYBV68HyB0YxkIGbjpEoMqNbls4/tE3p8y
	ifODQ2BErblRzyYv9e/ZaWvhI6CnU/FWJBZWquJc0kvSq9VWaRwl2eUEBXudw8IYLYh0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vRWEG-00G5sa-09; Fri, 05 Dec 2025 14:52:12 +0100
Date: Fri, 5 Dec 2025 14:52:11 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] net: mdio: aspeed: add dummy read to avoid
 read-after-write issue
Message-ID: <230147e8-e27b-48e1-9a62-7aa8abc3f492@lunn.ch>
References: <20251205-aspeed_mdio_add_dummy_read-v1-1-60145ae20ea7@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251205-aspeed_mdio_add_dummy_read-v1-1-60145ae20ea7@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_055234_829915_5F89DBD3 
X-CRM114-Status: GOOD (  18.06  )
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

On Fri, Dec 05, 2025 at 09:37:22AM +0800, Jacky Chou wrote:
> The Aspeed MDIO controller may return incorrect data when a read operation
> follows immediately after a write. Due to a controller bug, the subsequent
> read can latch stale data, causing the polling logic to terminate earlier
> than expected.
> 
> To work around this hardware issue, insert a dummy read after each write
> operation. This ensures that the next actual read returns the correct
> data and prevents premature polling exit.
> 
> This workaround has been verified to stabilize MDIO transactions on
> affected Aspeed platforms.
> 
> Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>

This seems like a bug fix. Please add a Fixes: tag, for base it on
net, not net-next.

> ---
>  drivers/net/mdio/mdio-aspeed.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/net/mdio/mdio-aspeed.c b/drivers/net/mdio/mdio-aspeed.c
> index e55be6dc9ae7..00e61b922876 100644
> --- a/drivers/net/mdio/mdio-aspeed.c
> +++ b/drivers/net/mdio/mdio-aspeed.c
> @@ -62,6 +62,12 @@ static int aspeed_mdio_op(struct mii_bus *bus, u8 st, u8 op, u8 phyad, u8 regad,
>  		| FIELD_PREP(ASPEED_MDIO_DATA_MIIRDATA, data);
>  
>  	iowrite32(ctrl, ctx->base + ASPEED_MDIO_CTRL);
> +	/* Workaround for read-after-write issue.

Blank line before the comment please.

    Andrew

---
pw-bot: cr



