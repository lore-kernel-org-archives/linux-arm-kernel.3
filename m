Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67CDACCA462
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 14:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BD0vTTmZbJbjWrHvwT4Prxm0MMYME1zVn1/sAV8HjfA=; b=nICXbUq7O4SVQVecfuXZ+rpDzB
	dX1n7j+VkmPN4292Pj8EN9/4ksXjaY7DGVh19auBWvCOlJbeV+YTFHx8cpygj3G8gfOv0a6V8JdOl
	Ydz+FiNkbHz75uqkDhbEe5hSc+DmTSCNLRRrooNCQ3h/A2zOE7MM4yEwqpGgMcecfNaGpEyyNcz1z
	x3et5XAt4SB8cl0O0wy0W6gV1KhSIB9ru58WV0NJ1jGDyZoDhPa1DZSEX87tqBQdnX0X5RmgFCSDJ
	QFT94hkC+Mlh2tGTnV/bvqXQ+IBp7g+lETHkB5y0askudbSIgJlALew+VGyxyl5Kk6YhxorYPSvOw
	Cs02OONg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHiaU-0000000368k-49a3;
	Fri, 16 Oct 2026 14:07:11 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHiaR-0000000368G-0wNU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 14:07:09 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B906CC62214;
	Fri, 16 Oct 2026 14:07:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BA34A6075D;
	Fri, 16 Oct 2026 14:07:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AA80010328528;
	Fri, 16 Oct 2026 16:06:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792159620; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=BD0vTTmZbJbjWrHvwT4Prxm0MMYME1zVn1/sAV8HjfA=;
	b=Aas02fFbKUmXUHNqndlu2XUd7+6W/U6dB1Tm27lr02R+A2qMN2O0R9v8ruxm2WNFvdsfLW
	l8yCQVtkBhorGhIVKGCNHnwBFVplaCyCBVnQ1ztThQha063N1ZrI0wmZMCEAJWXBj9Wp8C
	l2AeKN9K6Y0BKvV99m9tptTugLlFa9P0Gg9O/FhDnvCDUlyMAutb3EBvmDm3LPXDRCDn1L
	6hZPFGsMYg83E49JuSWEZY+liHemd3FhWVSe0OPiYF3ffXYfQI2QdEgJBzNOcwHdjWXLeP
	vOx4IvBKnSu6garwy/OXQPVhbh2FPHNgPaIgtxj56JwMk7PoRc0+7Cxk0/SNnA==
Message-ID: <60e0e45f-4bab-4cd1-9693-42db061c2aa2@bootlin.com>
Date: Fri, 16 Oct 2026 16:06:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2] net: stmmac: leave the datapath running for
 normal-size MTU changes
To: James Hilliard <james.hilliard1@gmail.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Christian Marangi <ansuelsmth@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Nicolai Buchwitz <nb@tipi-net.de>
References: <20261013-stmmac-mtu-fastpath-v2-1-1e4ce8137689@gmail.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20261013-stmmac-mtu-fastpath-v2-1-1e4ce8137689@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_070707_461731_ACE4484C 
X-CRM114-Status: GOOD (  21.12  )
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

Hi James,

On 10/13/26 19:54, James Hilliard wrote:
> When both MTUs are at most ETH_DATA_LEN, the receive buffer size and MAC
> receive limit do not change. Update the MTU without restarting the
> datapath.
> 
> This also avoids rebinding a live AF_XDP pool to a temporary RXQ. XDP
> rejects jumbo MTUs, so all supported XDP MTU changes take this path.
> Jumbo transitions still use the existing reopen path.
> 
> Found by source review while working on the stmmac MTU/resume recovery
> series. The fast path was tested on Allwinner H616 with sun8i EMAC1 and
> an AC300 PHY. The AF_XDP scenario was identified by inspection.
> 
> Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
> Changes in v2:
> - Target net-next and drop the Fixes tag as requested by Jakub Kicinski.
> - Clarify the standalone commit message and how the issue was found.
> - Add Nicolai Buchwitz's Reviewed-by.
> - No code changes.
> - Link to v1: https://patch.msgid.link/20260930-stmmac-mtu-fastpath-v1-1-fd73f378c071@gmail.com
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 56d89a696272..50eaee656cfb 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -6257,7 +6257,12 @@ static int stmmac_change_mtu(struct net_device *dev, int new_mtu)
>  	if ((txfifosz < new_mtu) || (new_mtu > BUF_SIZE_16KiB))
>  		return -EINVAL;
>  
> -	if (netif_running(dev)) {
> +	/* Normal-size frames use the same buffers and MAC receive limits.
> +	 * In particular, do not disturb a live AF_XDP pool: XDP does not
> +	 * support jumbo frames, so it never needs the ring replacement below.
> +	 */
> +	if (netif_running(dev) &&
> +	    (dev->mtu > ETH_DATA_LEN || mtu > ETH_DATA_LEN)) {
>  		netdev_dbg(priv->dev, "restarting interface to change its MTU\n");
>  		/* Try to allocate the new DMA conf with the new mtu */
>  		dma_conf = stmmac_setup_dma_desc(priv, mtu);
> 
> ---
> base-commit: 05b5019b01fb9443b09ae4ed34af1135a80a84c8
> change-id: 20260930-stmmac-mtu-fastpath-68813ead3b90
> 
> Best regards,
> --  
> James Hilliard <james.hilliard1@gmail.com>


