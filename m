Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B8B5CA100C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 23:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=da6TUBDYE6KQNjXkXNkmjGgzc2pXTxu6abiP0BqqvEw=; b=XzvhFvNWIP9liLIN172XpnVbWU
	R9DA3e2237N+Dw8s8mNbdkrCNAj02EnHbheOqqpWNz8Q4ZS6IXmmckSiw1BmLuAlOI9iFdbLhj+VK
	sT9iUPDQmRdmELYQEg4Ktf+6eJoWHcFxdG40a9xthFUV1ObeTViXL2hLOHnJ0ETwrELjFxRHnfLyF
	Y5Qc9p7znGcPTkVwRguk+ba05cBjf1xQeBm49/CNM+1kLUqcQdudgjlLUAPpS+j2IUlhcRK7F8nJM
	qS7b7VxA+VkBlzgC0GAR72Hot+3btQZdpZbUPIVMRjmTEwsmJkRdsnIo3iRUsB1sFiO1SDnfnO//r
	q/WiVKpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utDgw-0000000EDqQ-36by;
	Mon, 01 Sep 2025 23:12:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut6Nw-0000000D4Me-482K
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 15:23:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6E014601D9;
	Mon,  1 Sep 2025 15:23:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24263C4CEF0;
	Mon,  1 Sep 2025 15:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756740236;
	bh=Z6Bw+FcjIx5936FqSyasEITeMW7G2tVVJ6eaKgA8l4w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pnCxcj6hmR3kyzFGjXyzGmi+Ebjv1J9Oo9OIj93UmdWU9kULjfM4TSPiQHqD86GIg
	 gaBATn92CB4h6hY0lpJwhGxe0hmQ3bB9d71Ne5FVNdTn8/S/W+hUTtYRtTK1+iOmzm
	 aO8R9+mTGcbFwDiT2mAQ+KqbaOoIXKDFnxGJFGfcrdH3GU3lxXjNOY2UWRubiJIU0v
	 8SF3VlxhFs6iZFJdc/0Cbm53TpsPRhc5P2WhSrJrG59oX5sjXC0+Gf9QlPPhEd4UBm
	 j0gSyZ6ZIUbbAYz6bxqnpJCpQ5pUzHnouZ7L6Q24poIF1Hz5oFeWBoJWGjp/1D4EQ2
	 uuoluUILDgrSg==
Date: Mon, 1 Sep 2025 16:23:52 +0100
From: Simon Horman <horms@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: netdev@vger.kernel.org, Sunil Goutham <sgoutham@marvell.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	"moderated list:ARM/CAVIUM THUNDER NETWORK DRIVER" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] net: thunder_bgx: use OF loop instead of fwnode
Message-ID: <20250901152352.GG15473@horms.kernel.org>
References: <20250830214217.74801-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250830214217.74801-1-rosenp@gmail.com>
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

On Sat, Aug 30, 2025 at 02:42:17PM -0700, Rosen Penev wrote:
> The loop ends up converting fwnode to device_node anyway.
> 
> While at it, handle return value of of_get_mac_address in case of NVMEM.

I think that this part should be a separate patch.
Possibly targeted at net with a Fixes tag.

> 
> Simplify while loop iteration.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

...

> @@ -1514,14 +1510,13 @@ static int bgx_init_of_phy(struct bgx *bgx)
>  	/* We are bailing out, try not to leak device reference counts
>  	 * for phy devices we may have already found.
>  	 */
> -	while (lmac) {
> +	while (lmac--) {
>  		if (bgx->lmac[lmac].phydev) {
>  			put_device(&bgx->lmac[lmac].phydev->mdio.dev);
>  			bgx->lmac[lmac].phydev = NULL;
>  		}
> -		lmac--;
>  	}

The update to this look looks correct to me, even without the rest of
the patch separate. If so, I'm wondering if it should also be a separate
patch. Again, possibly for net with a Fixes tag.

> -	of_node_put(node);
> +	of_node_put(child);
>  	return -EPROBE_DEFER;
>  }

...

