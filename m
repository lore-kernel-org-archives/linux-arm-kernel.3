Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD3B9C3ABB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 16:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aMIwKd+O/GHBQqcJ5mnIhsfryp/aQETLmWwvdLeg/48=; b=pU5m1KiNX6S76W4L0ulyDicApX
	poXmMmcHrldQDLa6TwBgtMbcD6b2jrHR5aDkFMW6clsQ4HINlcQquVMuoxp4xaBGqlYSekIBDdb78
	JiWyGR3qVMR5vMYLZNq2hmXGlKkajkn/QHyIsVCYVAbdG/xX3A9zxZBHVxsk4zFhEIBLuPOrHMnz3
	IlxVVkrG9lyz+xyP2BIYjtHEwPxX0tFmJn2ikEeVmwJIsBTgT4SbYySMCDVMqBYY+3ENkbWMxNaHY
	utW6yO+H5/A0mPeUd4qgzC+NjUoCNNKOEX0PdzwsvcVpMQQArWvBT593hHgLMaboGt1zKiwZPKptW
	3m4zWj6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKJeM-0000000DgSZ-0LOR;
	Wed, 28 May 2025 16:29:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKJOk-0000000DcyN-39Gq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 16:12:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E82BA61F1B;
	Wed, 28 May 2025 16:12:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C52AC4CEE3;
	Wed, 28 May 2025 16:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748448776;
	bh=fpi71ToKhzI4Ih0RsP1jwKepkejd8JqAFlfm4lSaG00=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rHml+0HaqUcY9UrUHjk+viHrLfRKcPDgWPT5GKYfY3635zzgS4jydPVsZ3YIk4vsu
	 OxwZDw9XNvoW5fIhEPZ7OpVLSKaxF0AkY70oHc/tdtbcmW/SVAd/agOb+tGeVaauVU
	 oZfW1h1OAyBHt/ScLR4+SOj2bv8TyKYsaAEbR97TXQu3Ak/htIc3iMcOol4h3upiuj
	 sq8zzSGeyujGxUqFI8Irqn7+RzWLrEuZW22criHBa3uiE+hfg8zHBdCYkjPxfhDN0H
	 9u+rB+GdOLELUr7J3ovntiXCYTlNDcZm9eBK7FKO9oRw196ml3AuUhZG5YSliJ+39M
	 gaTpVE4liakIA==
Date: Wed, 28 May 2025 17:12:50 +0100
From: Simon Horman <horms@kernel.org>
To: Meghana Malladi <m-malladi@ti.com>
Cc: saikrishnag@marvell.com, pabeni@redhat.com, kuba@kernel.org,
	edumazet@google.com, davem@davemloft.net, andrew+netdev@lunn.ch,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, srk@ti.com,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Roger Quadros <rogerq@kernel.org>, danishanwar@ti.com
Subject: Re: [PATCH net] net: ti: icssg-prueth: Fix swapped TX stats for MII
 interfaces.
Message-ID: <20250528161250.GE1484967@horms.kernel.org>
References: <20250527121325.479334-1-m-malladi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527121325.479334-1-m-malladi@ti.com>
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

On Tue, May 27, 2025 at 05:43:25PM +0530, Meghana Malladi wrote:
> In MII mode, Tx lines are swapped for port0 and port1, which means
> Tx port0 receives data from PRU1 and the Tx port1 receives data from
> PRU0. This is an expected hardware behavior and reading the Tx stats
> needs to be handled accordingly in the driver. Update the driver to
> read Tx stats from the PRU1 for port0 and PRU0 for port1.
> 
> Fixes: c1e10d5dc7a1 ("net: ti: icssg-prueth: Add ICSSG Stats")
> Signed-off-by: Meghana Malladi <m-malladi@ti.com>
> ---
>  drivers/net/ethernet/ti/icssg/icssg_stats.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/net/ethernet/ti/icssg/icssg_stats.c b/drivers/net/ethernet/ti/icssg/icssg_stats.c
> index 6f0edae38ea2..0b77930b2f08 100644
> --- a/drivers/net/ethernet/ti/icssg/icssg_stats.c
> +++ b/drivers/net/ethernet/ti/icssg/icssg_stats.c
> @@ -29,6 +29,10 @@ void emac_update_hardware_stats(struct prueth_emac *emac)
>  	spin_lock(&prueth->stats_lock);
>  
>  	for (i = 0; i < ARRAY_SIZE(icssg_all_miig_stats); i++) {

Hi Meghana,

Perhaps it would be nice to include a comment here.

> +		if (emac->phy_if == PHY_INTERFACE_MODE_MII &&
> +		    icssg_all_miig_stats[i].offset >= ICSSG_TX_PACKET_OFFSET &&
> +		    icssg_all_miig_stats[i].offset <= ICSSG_TX_BYTE_OFFSET)
> +			base = stats_base[slice ^ 1];
>  		regmap_read(prueth->miig_rt,
>  			    base + icssg_all_miig_stats[i].offset,
>  			    &val);
> 
> base-commit: 32374234ab0101881e7d0c6a8ef7ebce566c46c9
> -- 
> 2.43.0
> 
> 

