Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21829C5DF66
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 20:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LzDo4tCip7tML0cOu39bcJDTCn2tQGOUfV7WiNPRYwQ=; b=HTPhRC8ds00LizpIlp63PHAkwj
	JbLxjsP72xzm47uBQTgFnlSxAsXo9dlvIdpxj2Nm+bbA57cK2qXRwD7+hZweoj4knraPa6fG5j18t
	3XigNVTlOL867pY3OoYqLeAXLi3gyW7TfrdVQlkgdbHRAsfCo9A9MdAUzCuDecI2VHxVMwFZAqmyN
	rKaYd5iyOwiYEDiU+xo5vmLEqt84GwRK1Gy/hsG232GK3OfHJ3JAvT+FJxRjUEpxV4rCyYBnqbVLy
	6ST53LFSEWKE2AGm4dChfRTQ0GAUsqIGcSEfN1vMLj7nJQGmqhnVZxnmad/TihUvh1X/MHftbno5C
	I5DE54fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww3it-00000006lky-1aBZ;
	Mon, 17 Aug 2026 20:14:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww3is-00000006lkh-09ma
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 20:14:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7085043CC3;
	Mon, 17 Aug 2026 20:14:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3EA01F000E9;
	Mon, 17 Aug 2026 20:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786997657;
	bh=LzDo4tCip7tML0cOu39bcJDTCn2tQGOUfV7WiNPRYwQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=RlF9qY+1mkQtzswGYaVaeetdd3Yn0Bb8KP+3jj04RD3M5/I1r+reUT7OnViAjSLYZ
	 56DeVM4GTu8eKILOcJEkE2/zB1sKe8y5RVSccGxVl/3pgq7Qn+lYGgz2l1zq+U0RWp
	 v1AyrLVvm6eNc8dRy6tFMbjwT2oVLhksronzmSTB51EpTSwp+rop+q2BKivp2LT8gG
	 eM+wwCLpQ/w6aescpANkRdOn+SO5qU8qUOsyTa1Dyn1dZpgSJCYMqTc6a/ruFaf+jS
	 jYSiMFKfJqcyJM98ok/H5Iwh1DeVBKS7rwdR9Y/eXPyyh258/tI71jgmvjAJy7o+NT
	 4WD4jZ5kkGM8w==
Date: Mon, 17 Aug 2026 13:14:16 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, "Russell King (Oracle)"
 <rmk+kernel@armlinux.org.uk>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net v2] net: stmmac: keep gso_enabled_types in sync with
 netdev features
Message-ID: <20260817131416.409fc7fc@kernel.org>
In-Reply-To: <20260812-stmmac-fix-tso6-features-v2-1-72c3b06eb8d4@oss.qualcomm.com>
References: <20260812-stmmac-fix-tso6-features-v2-1-72c3b06eb8d4@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Wed, 12 Aug 2026 06:38:13 +0200 Lorenzo Bianconi wrote:
> stmmac_set_gso_types() derives priv->gso_enabled_types all-or-nothing
> from NETIF_F_TSO, but stmmac_set_gso_features() advertises NETIF_F_TSO,
> NETIF_F_TSO6 and (on GMAC4) NETIF_F_GSO_UDP_L4 as independently
> toggleable features. Since netdev_fix_features() only ties TSO6 to the
> checksum features, disabling TSO (ethtool -K ethX tx-tcp-segmentation
> off) leaves TSO6 enabled in dev->features while gso_enabled_types
> becomes 0.
> 
> For a TCPv6 GSO skb the stack then keeps the frame unsegmented
> (NETIF_F_TSO6 is still set), stmmac_features_check() does not clear the
> GSO mask, and the stmmac_xmit() gate (gso_type & gso_enabled_types) is
> false, so the multi-MSS skb is transmitted through the ordinary
> descriptor path as a single oversized frame.
> 
> Derive each GSO type from its own feature bit instead, so the mask stays
> in sync with dev->features and TCPv6 (or UDP L4 on GMAC4) segmentation
> keeps working when only TSO is disabled.
> 
> Fixes: 9edfa7dab811 ("net: stmmac: enable TSO for IPv6")
> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
> ---
> Changes in v2:
> - Fix possible race between stmmac_set_gso_types() and stmmac_xmit().
> - Fix fixes tag.
> - Link to v1: https://lore.kernel.org/r/20260808-stmmac-fix-tso6-features-v1-1-f82b17595052@oss.qualcomm.com
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 28 +++++++++++++----------
>  1 file changed, 16 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index a71f0df26378..df3549f55741 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -4371,16 +4371,20 @@ static void stmmac_flush_tx_descriptors(struct stmmac_priv *priv, int queue)
>  	stmmac_set_queue_tx_tail_ptr(priv, tx_q, queue, tx_q->cur_tx);
>  }
>  
> -static void stmmac_set_gso_types(struct stmmac_priv *priv, bool tso)
> +static void stmmac_set_gso_types(struct stmmac_priv *priv,
> +				 netdev_features_t features)
>  {
> -	if (!tso) {
> -		priv->gso_enabled_types = 0;
> -	} else {
> -		/* Manage oversized TCP frames for GMAC4 device */
> -		priv->gso_enabled_types = SKB_GSO_TCPV4 | SKB_GSO_TCPV6;
> -		if (priv->plat->core_type == DWMAC_CORE_GMAC4)
> -			priv->gso_enabled_types |= SKB_GSO_UDP_L4;
> -	}
> +	unsigned int gso_types = 0;
> +
> +	if (features & NETIF_F_TSO)
> +		gso_types |= SKB_GSO_TCPV4;
> +	if (features & NETIF_F_TSO6)
> +		gso_types |= SKB_GSO_TCPV6;
> +	/* Manage oversized UDP frames for GMAC4 devices */
> +	if (features & NETIF_F_GSO_UDP_L4)
> +		gso_types |= SKB_GSO_UDP_L4;
> +
> +	WRITE_ONCE(priv->gso_enabled_types, gso_types);
>  }
>  
>  static void stmmac_set_gso_features(struct net_device *ndev)
> @@ -4416,7 +4420,7 @@ static void stmmac_set_gso_features(struct net_device *ndev)
>  	if (priv->plat->core_type == DWMAC_CORE_GMAC4)
>  		ndev->hw_features |= NETIF_F_GSO_UDP_L4;
>  
> -	stmmac_set_gso_types(priv, true);
> +	stmmac_set_gso_types(priv, ndev->hw_features);
>  
>  	dev_info(priv->device, "TSO feature enabled\n");
>  }
> @@ -4766,7 +4770,7 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
>  		stmmac_stop_sw_lpi(priv);
>  
>  	if (skb_is_gso(skb) &&
> -	    skb_shinfo(skb)->gso_type & priv->gso_enabled_types)
> +	    (skb_shinfo(skb)->gso_type & READ_ONCE(priv->gso_enabled_types)))

Maybe I'm missing something but I don't see any device configuration
based on gso_enabled_types. Why does this mask exist in the first place?

Right now AFAICT packets which miss the mask check get chucked on the
wire as one giant frame, without segmentation.

Can we just delete gso_enabled_types completely? Stack should obey the
features for future frames, and avoiding races here may be hard.

>  		return stmmac_tso_xmit(skb, dev);
>  
>  	if (priv->est && priv->est->enable &&
> @@ -6198,7 +6202,7 @@ static int stmmac_set_features(struct net_device *netdev,
>  			stmmac_enable_sph(priv, priv->ioaddr, sph_en, chan);
>  	}
>  
> -	stmmac_set_gso_types(priv, features & NETIF_F_TSO);
> +	stmmac_set_gso_types(priv, features);
>  
>  	if (features & NETIF_F_HW_VLAN_CTAG_RX)
>  		priv->hw->hw_vlan_en = true;
-- 
pw-bot: cr

