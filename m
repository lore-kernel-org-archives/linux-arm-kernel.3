Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D4F6F55425
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 01:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q+XZV4PVmhXKUAZfnSeiklsKq3wCUqaGeGIKLJr8HAE=; b=uH6V2NN85KvJ5Y5iTpAjBbUapC
	8F2zV1+GDUrOLMD0pmSyFNstt5ykrAhL7+IDPa9cOaPSTqUvCgcpU5XxACmUhNFwOkdwWP7YhUsde
	w+yBP87Pahfo3a8qiCJ4iHyoJ3b+QxjRmKIEboSpDsguir/9WBqQjH5YVH+NH3irl3ADI5/ODnZUr
	pbZjIfZORmmFnAPMBT4/zwxqR7O+w185pTA4pUKgSo1V3HXOruR8n/C5nDumdTXSI60TOLUSQ72HG
	PNx+/38EG0cEzMig4HUqTR+I2Y1PJV9fYlporNZB7wLysuvv9WqnmaLz90ypqt3puqtmAYuhvytbh
	maDlUqFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv3je-000000032TK-0qzr;
	Wed, 25 Feb 2026 01:30:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv3jb-000000032Sn-3nuz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 01:30:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2D39D43B5F;
	Wed, 25 Feb 2026 01:30:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A24D8C116D0;
	Wed, 25 Feb 2026 01:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771983039;
	bh=FeIjheyt5MmH5rpuQ0+djNBSvwaQ02Enb/aIau7gkDY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=kODmGJYar3MTni9jjDWPzYHy/PytDnxrowEmORjHxlxhQX/6T3MC745La6yA0Efwm
	 2hXIruanyX6gNfpv+m+E19IgDs+utybH8SBL1Td3Gf2FO85RSU8dXYLvEYapKfNphW
	 Ozs9GzQDHy3SEdVOK1zWyX+3y/Lps46l+/y5aTMk9qW73zgpKHL81L35218usFnkEU
	 HOq2WNma3wYglNyaT+cxQ8QX463M4UZ1gNeOR3u1E5myGyXhmQ1fp3z4Q+YKhMOnAO
	 ctesddf4Lp+wDaY1KRGXVOXF1Eifm1lUVypxwBi+f1fb/f6k0rV5hKuqNWITmyV629
	 WuK9HN8JKxI9w==
Date: Tue, 24 Feb 2026 17:30:37 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org, Paolo
 Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next] net: stmmac: fix .ndo_fix_features()
Message-ID: <20260224173037.7871e5ac@kernel.org>
In-Reply-To: <E1vuU3X-0000000Ae9G-1Er8@rmk-PC.armlinux.org.uk>
References: <E1vuU3X-0000000Ae9G-1Er8@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_173040_004955_FEC9DFDA 
X-CRM114-Status: GOOD (  21.89  )
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

On Mon, 23 Feb 2026 11:24:51 +0000 Russell King (Oracle) wrote:
> netdev features documentation requires that .ndo_fix_features() is
> stateless: it shouldn't modify driver state. Yet, stmmac_fix_features()
> does exactly that, changing whether GSO frames are processed by the
> driver.
> 
> Move this code to stmmac_set_features() instead, which is the correct
> place for it. We don't need to check whether TSO is supported; this
> is already handled via the setup of netdev->hw_features, and we are
> guaranteed that if netdev->hw_features indicates that a feature is
> not supported, .ndo_set_features() won't be called with it set.

No lies detected, but is this enough? The whole TSO enablement 
looks quite wobbly (as you mentioned in another email IIRC). 

Only stmmac_hw_setup() actually calls stmmac_enable_tso(). 
And stmmac_set_features() does not call stmmac_hw_setup().

IDK what the cost of having TSO enabled is for this IP, it's 
entirely possible that there is no cost. So maybe we should set
the TSO feature in features but not in hw_features which will
make it "fixed" to be always enabled? And not bother with handling 
the changes?

> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 82375d34ad57..a2a0985e8c37 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -6105,14 +6105,6 @@ static netdev_features_t stmmac_fix_features(struct net_device *dev,
>  	if (priv->plat->bugged_jumbo && (dev->mtu > ETH_DATA_LEN))
>  		features &= ~NETIF_F_CSUM_MASK;
>  
> -	/* Disable tso if asked by ethtool */
> -	if ((priv->plat->flags & STMMAC_FLAG_TSO_EN) && (priv->dma_cap.tsoen)) {
> -		if (features & NETIF_F_TSO)
> -			priv->tso = true;
> -		else
> -			priv->tso = false;
> -	}
> -
>  	return features;
>  }
>  
> @@ -6144,6 +6136,8 @@ static int stmmac_set_features(struct net_device *netdev,
>  	else
>  		priv->hw->hw_vlan_en = false;
>  
> +	priv->tso = !!(features & NETIF_F_TSO);

extra nit, I think you're inserting this in the middle of a section of
code handling vlan config.

>  	phylink_rx_clk_stop_block(priv->phylink);
>  	stmmac_set_hw_vlan_mode(priv, priv->hw);
>  	phylink_rx_clk_stop_unblock(priv->phylink);
-- 
pw-bot: cr

