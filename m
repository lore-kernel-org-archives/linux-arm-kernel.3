Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51503D2D107
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 14:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qtQk3v4rRJM84t9rEVAB0irnBh63oX5nb6UzSl4ai5M=; b=lBjOrrAWOi2/FfabT05XzUuSEa
	6f1vaitlr+U1S8gjF95HEcJzCcAMEpyvOU+O9XLHXg/Cpi45bKOOwzvyBfNw4uOOGrguUiy6sH26/
	QLrIKYWsokZKugjmzrlX74poeGEn6qgyTaXdxdgLGqNh39F1+TBIMWzT9qioFngL3fAqWxksn1AGX
	8bGTn6Pn1bxmxbsLNIt/eflTsl0FOHZR8+Af8AJA6RHm2H/KH/8390SZIb/h4yxEJRUTEn/ezjCPR
	1ot7InqZS9BDOFVTRKZKE9Crp7O4cONumOhRak+VEvStDAmRoEqOS5rusP0jnZpHsuAKb0b99hgEo
	d0roEnqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfex1-00000007BxS-4BX2;
	Tue, 13 Jan 2026 14:00:52 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfeww-00000007Bvl-0cG9;
	Tue, 13 Jan 2026 14:00:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=qtQk3v4rRJM84t9rEVAB0irnBh63oX5nb6UzSl4ai5M=; b=bRljttlMN6p/FhKzIi3t2+Y3A2
	0kufUrccpgBgtpX+47gYxWFn6P7ssntYAqerRB73LWJgOHLLJ74W4e2Qre9PNJwFUgA7EqEy9UY5W
	V1Qh2PykgaElvxKqVIMy4GKVAR+2c0p94JX56K3bpTWig7zvZUw2vhh0g5s6zlPj+dpM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vfewU-002dZq-3P; Tue, 13 Jan 2026 15:00:18 +0100
Date: Tue, 13 Jan 2026 15:00:18 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Bc-bocun Chen <bc-bocun.chen@mediatek.com>,
	Rex Lu <rex.lu@mediatek.com>,
	Mason-cw Chang <Mason-cw.Chang@mediatek.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Vladimir Oltean <olteanv@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next RFC] net: ethernet: mtk_eth_soc: support using
 non-MediaTek DSA switches
Message-ID: <252d6877-d966-4d19-a38c-cc83ba908494@lunn.ch>
References: <34647edacab660b4cabed9733d2d3ef22bc041ac.1768273593.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <34647edacab660b4cabed9733d2d3ef22bc041ac.1768273593.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_060046_286733_1AD43B20 
X-CRM114-Status: GOOD (  25.82  )
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

On Tue, Jan 13, 2026 at 03:11:54AM +0000, Daniel Golle wrote:
> MediaTek's Ethernet Frame Engine is tailored for use with their
> switches. This broke checksum and VLAN offloading when attaching a
> DSA switch which does not use MediaTek special tag format.

This has been seen before. The Freescale FEC has similar problems when
combined with a Marvell switch, it cannot find the IP header, and so
checksum offloading does not work.

I thought we solved this be modifying the ndev->feature of the conduit
interface to disable such offloads. But i don't see such code. So i
must be remembering wrongly.

This is assuming the frame engine respects these flags:

/usr/sbin/ethtool -k enp2s0
Features for enp2s0:
rx-checksumming: on
tx-checksumming: on
	tx-checksum-ipv4: on
	tx-checksum-ip-generic: off [fixed]
	tx-checksum-ipv6: on
	tx-checksum-fcoe-crc: off [fixed]
	tx-checksum-sctp: off [fixed]

When you combine a Marvell Ethernet interface with a Marvell switch
offloading works of course. So it probably does require some logic in
the MAC driver to determine if the switch is of the same vendor or
not.

> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> index e68997a29191b..654b707ee27a1 100644
> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> @@ -1459,6 +1459,26 @@ static void setup_tx_buf(struct mtk_eth *eth, struct mtk_tx_buf *tx_buf,
>  	}
>  }
>  
> +static bool mtk_uses_dsa(struct net_device *dev)
> +{
> +#if IS_ENABLED(CONFIG_NET_DSA)
> +	return netdev_uses_dsa(dev) &&
> +	       dev->dsa_ptr->tag_ops->proto == DSA_TAG_PROTO_MTK;
> +#else
> +	return false;
> +#endif

I think the concept of determining if the switch is using a specific
tag in order to enable/disable acceleration should be generic. So i
would try to make this an helper in include/next/dsa.h. Any MAC driver
can then use it.

> @@ -1531,7 +1551,7 @@ static void mtk_tx_set_dma_desc_v2(struct net_device *dev, void *txd,
>  		/* tx checksum offload */
>  		if (info->csum)
>  			data |= TX_DMA_CHKSUM_V2;
> -		if (mtk_is_netsys_v3_or_greater(eth) && netdev_uses_dsa(dev))
> +		if (mtk_is_netsys_v3_or_greater(eth) && mtk_uses_dsa(dev))
>  			data |= TX_DMA_SPTAG_V3;

This looks to be in the hot path. Do you really want to do this
evaluation on every frame? You can change the tag protocol via sysfs,
however, dsa_tree_change_tag_proto() will only allow you to change the
tag while the conduit interface is down. So it should be safe to look
at the tag protocol once during open, and cache the result somewhere
local, struct mtk_eth? That should avoid a few cache misses.

> @@ -3192,6 +3212,14 @@ static netdev_features_t mtk_fix_features(struct net_device *dev,
>  		}
>  	}
>  
> +	if ((features & NETIF_F_IP_CSUM) &&
> +	    non_mtk_uses_dsa(dev))
> +		features &= ~NETIF_F_IP_CSUM;
> +
> +	if ((features & NETIF_F_IPV6_CSUM) &&
> +	    non_mtk_uses_dsa(dev))
> +		features &= ~NETIF_F_IPV6_CSUM;
> +


When is mtk_fix_features() actually called? I don't know without
looking at the core. You will want it when open is called, when the
tagging protocol is fixed.

	Andrew

