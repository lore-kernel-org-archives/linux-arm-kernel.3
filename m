Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C53EACAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 22:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hYd/TAIPDLGCaoiYJkaP/m3jdjV6QQ0vaOxxHa0ZY9Q=; b=Zx6wR9XbU/vYCTZEgxNr4Bniyz
	qquIbkDwYBz2haWWrkG4iFHw1Z2cFptLlk30c8YbWt7iz50rhob5/EkdIS3CYy98xs7h3lka9qrpW
	Jjc0wgNjd3IRPokOal3d3UftSCql6PXbonIL5NAQONHSBD2Ksx1EJtiVbCQyCARi6ppGKkn8O/lQ/
	IDrqPJeX7svAamxPt2mA99JIlRQO/A2ChYZfjpYa/csCgqA8/corgNEfb0YE502PmiljVf7qCkt9Y
	ZIKCnW6krdUGfWebgNbOc7gibjsLhZYt/heWBzboRmjq0PhQBnl9rUGgUndb37aJIYBxUHYt4dFK8
	IoLXALeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz12X-0000000FNRU-1T2w;
	Wed, 17 Sep 2025 22:54:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz12U-0000000FNOs-3DxT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 22:54:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CFD8A40871;
	Wed, 17 Sep 2025 22:54:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18268C4CEE7;
	Wed, 17 Sep 2025 22:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758149653;
	bh=z5aUyn8esdedtU49mhVPTZw8U7IDxTGO/BUaAI/eVc0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=sDDhwxbk05spzhEuUTjELdBpi/vcVfTquXJ0xQRksKIGXbGBQeo8hef4TMeDoMDGU
	 BIpdgHAv8ULGeXAyb0p+7+bEV1Tf2NzDoUjJdbXXZU1OW1PwC76E62ALG8dHeg4FJH
	 5weCZ5b/4Pl3wIMyMdwq4hpEwTVlP6kvgdsKoY+abl76cnVM17bmqgbTGKn5BRTTRf
	 KyLv35rP+AxIajSR3Tl/rP4zxk4GELQYoQtSwyZz6KTVXvucSMSiS31t10zwWgtXBD
	 YElcaWl/dAYvBZnF2wpsTBlMctgMm/0t1KVjZ6b+qkgXPH9wdSqj5gXNfQYEcqFfZi
	 PhBbeDAFr/auw==
Date: Wed, 17 Sep 2025 15:54:12 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Rohan G Thomas via B4 Relay
 <devnull+rohan.g.thomas.altera.com@kernel.org>
Cc: rohan.g.thomas@altera.com, Andrew Lunn <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu
 <Jose.Abreu@synopsys.com>, Rohan G Thomas <rohan.g.thomas@intel.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Matthew
 Gerlach <matthew.gerlach@altera.com>, "Ng, Boon Khai"
 <boon.khai.ng@altera.com>
Subject: Re: [PATCH net v2 2/2] net: stmmac: Consider Tx VLAN offload tag
 length for maxSDU
Message-ID: <20250917155412.7b2af4f1@kernel.org>
In-Reply-To: <20250917154920.7925a20d@kernel.org>
References: <20250915-qbv-fixes-v2-0-ec90673bb7d4@altera.com>
	<20250915-qbv-fixes-v2-2-ec90673bb7d4@altera.com>
	<20250917154920.7925a20d@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_155414_851390_FE97649C 
X-CRM114-Status: GOOD (  24.31  )
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

On Wed, 17 Sep 2025 15:49:20 -0700 Jakub Kicinski wrote:
> On Mon, 15 Sep 2025 16:17:19 +0800 Rohan G Thomas via B4 Relay wrote:
> > From: Rohan G Thomas <rohan.g.thomas@altera.com>
> > 
> > On hardware with Tx VLAN offload enabled, add the VLAN tag
> > length to the skb length before checking the Qbv maxSDU.
> > Add 4 bytes for 802.1Q an add 8 bytes for 802.1AD tagging.
> > 
> > Fixes: c5c3e1bfc9e0 ("net: stmmac: Offload queueMaxSDU from tc-taprio")
> > Signed-off-by: Rohan G Thomas <rohan.g.thomas@altera.com>
> > Reviewed-by: Matthew Gerlach <matthew.gerlach@altera.com>
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 25 ++++++++++++++++-------
> >  1 file changed, 18 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index 8c8ca5999bd8ad369eafa0cd8448a15da55be86b..c06c947ef7764bf40291a556984651f4edd7cb74 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -4537,6 +4537,7 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
> >  	bool has_vlan, set_ic;
> >  	int entry, first_tx;
> >  	dma_addr_t des;
> > +	u32 sdu_len;
> >  
> >  	tx_q = &priv->dma_conf.tx_queue[queue];
> >  	txq_stats = &priv->xstats.txq_stats[queue];
> > @@ -4553,13 +4554,6 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
> >  			return stmmac_tso_xmit(skb, dev);
> >  	}
> >  
> > -	if (priv->est && priv->est->enable &&
> > -	    priv->est->max_sdu[queue] &&
> > -	    skb->len > priv->est->max_sdu[queue]){
> > -		priv->xstats.max_sdu_txq_drop[queue]++;
> > -		goto max_sdu_err;
> > -	}
> > -
> >  	if (unlikely(stmmac_tx_avail(priv, queue) < nfrags + 1)) {
> >  		if (!netif_tx_queue_stopped(netdev_get_tx_queue(dev, queue))) {
> >  			netif_tx_stop_queue(netdev_get_tx_queue(priv->dev,
> > @@ -4575,6 +4569,23 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
> >  	/* Check if VLAN can be inserted by HW */
> >  	has_vlan = stmmac_vlan_insert(priv, skb, tx_q);
> >  
> > +	sdu_len = skb->len;
> > +	if (has_vlan) {
> > +		/* Add VLAN tag length to sdu length in case of txvlan offload */
> > +		if (priv->dev->features & NETIF_F_HW_VLAN_CTAG_TX)
> > +			sdu_len += VLAN_HLEN;
> > +		if (skb->vlan_proto == htons(ETH_P_8021AD) &&
> > +		    priv->dev->features & NETIF_F_HW_VLAN_STAG_TX)
> > +			sdu_len += VLAN_HLEN;  
> 
> Is the device adding the same VLAN tag twice if the proto is 8021AD?
> It looks like it from the code, but how every strange..
> 
> In any case, it doesn't look like the driver is doing anything with 
> the NETIF_F_HW_VLAN_* flags right? stmmac_vlan_insert() works purely
> off of vlan proto. So I think we should do the same thing here?

I suppose the double tagging depends on the exact SKU but first check
looks unnecessary. Maybe stmmac_vlan_insert() should return the number
of vlans it decided to insert?

> > +	}
> > +
> > +	if (priv->est && priv->est->enable &&
> > +	    priv->est->max_sdu[queue] &&
> > +	    sdu_len > priv->est->max_sdu[queue]) {
> > +		priv->xstats.max_sdu_txq_drop[queue]++;
> > +		goto max_sdu_err;
> > +	}
> > +
> >  	entry = tx_q->cur_tx;
> >  	first_entry = entry;
> >  	WARN_ON(tx_q->tx_skbuff[first_entry]);
> >   
> 


