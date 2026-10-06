Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97DA5CA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 06:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QEqiKEHKarFBBNj7EInhCi1Qac+F8ajzAZ5Uck5ighE=; b=YifIz+SLA+WKiq8544+7f1InWC
	gU3zsB/WOwMjjfKVnQcDF8NuvWUZS6dNS4is90wUajRxpu6AvWgHMcE5beCZYYqnWzTTBufBQY7kI
	bIfw1AX/xyTQuRuBAQSWhC+XuG/Si3z4T5lMeWqjhR+BxB3lhAEfk5c6Jhv6B2IWuos0IW4kOJOuQ
	wWpffnZ2m1lOLESIgBPF2Wk/ZNAm95Srs/gw8rb3xNwT/RoBO6QjNC4/bNm/eB1mkxuq9RN3EBj6W
	p1j37yP7x+EaSjJLe+oqsXi9wltOsX3Xur2BMXWnLsUjznmYwx+8NwBRYe4+fkJnjjLlnifT6CpFU
	egiAJ/Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDyOd-000000006jU-0Y5a;
	Tue, 06 Oct 2026 06:11:27 +0000
Received: from mail.tipi-net.de ([194.13.80.246])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDyOa-000000006iN-0eaU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 06:11:25 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 68368A012B;
	Tue,  6 Oct 2026 08:11:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1791267073; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=QEqiKEHKarFBBNj7EInhCi1Qac+F8ajzAZ5Uck5ighE=;
	b=Ie5wANbwdKEGXszo8EQjyZgNwM1u745GFqrntFnuP7l+Yz7JEb0hGCv/uycRvxYKMoIRZz
	khoIhFvpMCPrLAbYmCe/YBv7qcNRzMN+VUe2yAIny4KBZ0+flg6y8EBNVnzz3lYNfhiI5c
	CtHeIfb55a7rArfJ+Ud1pan81doBUoQOqNWXIPMWxN0F9/EHLdVwLvEsjpwkx3H++AkavQ
	fTv5hYlMUJQvTEpR1UuP4gggaGP/TLjYnnk8dPymZurry6fuAXNzAzq+BAld5ure9T5CO6
	zftsrhjIGkjxYzJyCtdbsnt7TcOJAsc2RiIZCizacET5pEgkiQCf2g6Ot0TFng==
MIME-Version: 1.0
Date: Tue, 06 Oct 2026 08:11:11 +0200
From: Nicolai Buchwitz <nb@tipi-net.de>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski
 <kuba@kernel.org>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew
 Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@kernel.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Christian Marangi <ansuelsmth@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: stmmac: leave the datapath running for
 normal-size MTU changes
In-Reply-To: <20260930-stmmac-mtu-fastpath-v1-1-fd73f378c071@gmail.com>
References: <20260930-stmmac-mtu-fastpath-v1-1-fd73f378c071@gmail.com>
Message-ID: <f0cbb31213093859821d467971d604a9@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_231124_356966_005B5C01 
X-CRM114-Status: GOOD (  18.84  )
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

Hi James

On 1.10.2026 06:39, James Hilliard wrote:
> When both MTUs are at most ETH_DATA_LEN, the receive buffer size and 
> MAC
> receive limit do not change. Update the MTU without restarting the
> datapath.
> 
> This also avoids rebinding a live AF_XDP pool to a temporary RXQ. XDP
> rejects jumbo MTUs, so all supported XDP MTU changes take this path.
> Jumbo transitions remain on the reopen path until the rollback change.
> 
> Fixes: 3470079687448 ("net: ethernet: stmicro: stmmac: permit MTU 
> change with interface up")
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c 
> b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 3f34d491c959..03cd14d10356 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -6161,7 +6161,12 @@ static int stmmac_change_mtu(struct net_device 
> *dev, int new_mtu)
>  	if ((txfifosz < new_mtu) || (new_mtu > BUF_SIZE_16KiB))
>  		return -EINVAL;
> 
> -	if (netif_running(dev)) {
> +	/* Normal-size frames use the same buffers and MAC receive limits.
> +	 * In particular, do not disturb a live AF_XDP pool: XDP does not
> +	 * support jumbo frames, so it never needs the ring replacement 
> below.
> +	 */
> +	if (netif_running(dev) &&
> +	    (dev->mtu > ETH_DATA_LEN || mtu > ETH_DATA_LEN)) {
>  		netdev_dbg(priv->dev, "restarting interface to change its MTU\n");
>  		/* Try to allocate the new DMA conf with the new mtu */
>  		dma_conf = stmmac_setup_dma_desc(priv, mtu);
> 
> ---
> base-commit: a7bfaba4823e3c165bb2004c74eff7c096672bc7
> change-id: 20260930-stmmac-mtu-fastpath-68813ead3b90
> 
> Best regards,
> --
> James Hilliard <james.hilliard1@gmail.com>

Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>

Thanks,
Nicolai

