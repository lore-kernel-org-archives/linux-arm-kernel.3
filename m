Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F597C87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 20:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DmPvL1G/SJkTVSbv717HV7syA+sbLMTJb+XLtvOZDRs=; b=K6lzIZZyGL+2wlXH432FIV7ktz
	E9Z9k7DDG8jJFE+xOsFEOYDDemGEmF0HVXVaVUkxDgiNoXQ/kEj+TiY4GmjxIqpn5QgJjKvP8aYep
	rtMyXKAvScKptciuLnnIXP1IaaWN0AuuV6YHv63KYZXcnADaFPo/U0qLRn9GigsZRbzed2FNzbCRi
	fc/PqbCDqEidBHDGCw//YVoUZYAPh04ci0gax3FuUoEL0YUj3QnAGaEXVWejsDkIP55zhLwU/NZHg
	Mz4FGLqteZ8wQr95fApDrpCGo/1Rc1Gts0BjZUYaNzilo9sAHh3zQ45Cm/B/K57onbPYjf2bg+KLl
	w6faFCRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujOQ1-0000000Dlej-3vQi;
	Tue, 05 Aug 2025 20:37:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujONS-0000000DlWR-31hI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 20:35:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C9BE0601D1;
	Tue,  5 Aug 2025 20:35:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09ED3C4CEF0;
	Tue,  5 Aug 2025 20:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754426117;
	bh=H7XBzeHOQOWgEm/QZ/dcl/A1X93j8DES9QPGT5ycjQQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jguyKfFRngCsfxtTBVg9jfUJEm7kC1fyxOpx391NO16IENeqSaSB52VWkQwixQ957
	 Ae1WShk034ikx8OFnD2Emzk3b/Q2CJPLPqyzEYhHVOBJHz3QxVGbflkz5TnOJRe/jT
	 4Rh9cXIUYqKx9wukGjT9PdpQT3nEvSpVs1dyMV0V2UhyGFL0y6OegzKqu+wz2kIfzR
	 SwMmsRXLpPOa9ahHaieVdoQgkV7a49vPoX088Nftf8/67r5V4bESpwWeh1jVqkfh0r
	 43dLfk6+VcU0PZEuv+MuhtOrDazwrKKMmC7hImcMFNpM4PVZuUBGuBDNgBcHu2peT0
	 03GAlKSL/uVng==
Date: Tue, 5 Aug 2025 21:35:12 +0100
From: Simon Horman <horms@kernel.org>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michal Simek <michal.simek@amd.com>,
	Leon Romanovsky <leon@kernel.org>
Subject: Re: [PATCH net-next v4 4/7] net: axienet: Simplify axienet_mdio_setup
Message-ID: <20250805203512.GD61519@horms.kernel.org>
References: <20250805153456.1313661-1-sean.anderson@linux.dev>
 <20250805153456.1313661-5-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250805153456.1313661-5-sean.anderson@linux.dev>
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

On Tue, Aug 05, 2025 at 11:34:53AM -0400, Sean Anderson wrote:
> We always put the mdio_node and disable the bus after probing, so
> perform these steps unconditionally.
> 
> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
> ---
> 
> (no changes since v1)
> 
>  drivers/net/ethernet/xilinx/xilinx_axienet_mdio.c | 15 +++++----------
>  1 file changed, 5 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_mdio.c b/drivers/net/ethernet/xilinx/xilinx_axienet_mdio.c
> index dd5f961801dc..1903a1d50b05 100644
> --- a/drivers/net/ethernet/xilinx/xilinx_axienet_mdio.c
> +++ b/drivers/net/ethernet/xilinx/xilinx_axienet_mdio.c
> @@ -302,19 +302,14 @@ int axienet_mdio_setup(struct axienet_local *lp)
>  	ret = axienet_mdio_enable(bus, mdio_node);
>  	if (ret < 0)
>  		goto unregister;
> +
>  	ret = of_mdiobus_register(bus, mdio_node);
> -	if (ret)
> -		goto unregister_mdio_enabled;
>  	of_node_put(mdio_node);
>  	axienet_mdio_mdc_disable(lp);
> -	return 0;
> -
> -unregister_mdio_enabled:
> -	axienet_mdio_mdc_disable(lp);
> -unregister:

Hi Sean,

This function still has code that jumps to unregister.
So this causes a compile error.

This does appear to be addressed in patch 6/7.
So I guess it is just an artefact of refactoring the patches
or something like that.

> -	of_node_put(mdio_node);
> -	mdiobus_free(bus);
> -	lp->mii_bus = NULL;
> +	if (ret) {
> +		mdiobus_free(bus);
> +		lp->mii_bus = NULL;
> +	}
>  	return ret;
>  }

## Form letter - net-next-closed

The merge window for v6.17 has begun and therefore net-next is closed
for new drivers, features, code refactoring and optimizations. We are
currently accepting bug fixes only.

Please repost when net-next reopens after 11th August.

RFC patches sent for review only are obviously welcome at any time.

See: https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#development-cycle

-- 
pw-bot: defer

