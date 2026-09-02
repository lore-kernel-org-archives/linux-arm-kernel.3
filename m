Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85224C624D4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 18:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6/co2BbiwEGthBShXRC0EiM5pB4H/+cNPoBpHcBMo+g=; b=1sjQ+TB//6aq7hq5hJREHmc9Nr
	oNbr32hSZpru/f2Qqcp3JjL15ZUnfuTvTssaXsj3IcjMldKs2FDipv/LETUDR3cjJY1fZIabh4Q2x
	LJKkXElqjXMmvCEjkcPXbKto3nbTBmyNBLjamumampOv6YMLQDH02WVrD4XJXU++O+4KfH66WO1Gy
	aya50tfRh+XHxwynD+1JN5rYei4n61LaV5tuEcyIVU9+/MR+woHnBCeH0zHjt08W6VSR+NAMhBI5V
	csniA8iL9vRLfDk9HrhqhTLaqvZGEuOAMcghIBi16kQlAjmsJSNdE9dv/6ZdTWCoeaMSHTCqJyPCP
	MaMTKLwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1q0s-0000000FcSC-0ne6;
	Wed, 02 Sep 2026 18:48:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1q0q-0000000FcRn-3HKP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 18:48:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C09FB600C8;
	Wed,  2 Sep 2026 18:48:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2D071F000E9;
	Wed,  2 Sep 2026 18:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788374923;
	bh=6/co2BbiwEGthBShXRC0EiM5pB4H/+cNPoBpHcBMo+g=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=cQkfPuCbiJJPEZfGHPRJjRakvmDBMzsYExiVJGi56VhwuS1Cq763RmqeLf9X3HPuS
	 wUA5G1GLYNvfgWlVYO/7UzlD+slDzsOdVil5La4cJVLX+txLYdB9wbBvTDhQsupL9G
	 kMeL0dkQw2iRWxvoT44gzpIxAM+IX6S00HuyfAQXk/ifidiOCyHxdPp73NgzFW/uGJ
	 30flVx9b+RJT/HMGFLv0vJvl9087rnu4M2bq3NHRDEVEE8UdRCGCG71nG5oaS3rJs6
	 MH0jU/iEuoiy8t0++/eeXtQ+5t5mhybtoINbFXu4asB363JYOHf8kkr9AMfHgWbgPA
	 RS6Ko9nEByatg==
Subject: Re: [net-next,v3] net: stmmac: drop the queue-0 pinning for GSO frames
From: netdev-bot+sashiko@kernel.org
To: lorenzo.bianconi@oss.qualcomm.com
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Date: Wed, 02 Sep 2026 18:48:42 +0000
Message-ID: <178837492226.3394541.13110256562881802796@kernel.org>
In-Reply-To: <20260831-stmmac_select_queue-tso-fix-v3-1-d9c215fe7a85@oss.qualcomm.com>
References: <20260831-stmmac_select_queue-tso-fix-v3-1-d9c215fe7a85@oss.qualcomm.com>
X-sashiko-severity: High
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
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

Thank you for your contribution! Sashiko AI review found 4 potential
issue(s) to consider:

Critical: 0 · High: 1 · Medium: 2 · Low: 1

- [High] Removing .ndo_select_queue silently disables hardware TSO/USO
  for most GSO flows on all in-tree stmmac platforms that mark every TX…
- [Medium] The patch's stated safety property — 'stmmac_features_check()
  already validates each GSO frame against the capabilities of the queue…
- [Medium] The patch deletes the hardware fact that the removed comment
  carried ('There is no way to determine the number of TSO/USO capable…
- [Low] The commit claims to fix a real user-visible offload defect
  ('This also fixes the case where queue 0 is not TSO-capable while…

--

net: stmmac: drop the queue-0 pinning for GSO frames

This drops stmmac_select_queue() and its .ndo_select_queue entry so GSO
frames are no longer pinned to TX queue 0. The changelog argues the pinning
is redundant because stmmac_features_check() already validates each GSO
frame against the capabilities of the queue it is mapped to. Non-GSO
traffic keeps going through netdev_pick_tx().

Link: https://lore.kernel.org/r/20260808-stmmac_select_queue-tso-fix-v2-1-67175b29772e@oss.qualcomm.com
Link: https://lore.kernel.org/r/20260807-stmmac_select_queue-tso-fix-v1-1-4c4787bad02b@oss.qualcomm.com

>From the changelog:

> This also fixes the case where queue 0 is not TSO-capable while other
> queues are, which previously forced all TSO traffic into software GSO.

[Severity: Low]
Since this is described as a fix, should it carry a Fixes tag? The queue-0
pinning being removed came in with commit 4993e5b37e8b ("net: stmmac:
Re-work the queue selection for TSO packets"), which in turn fixed
c5acdbee22a1 ("net: stmmac: Send TSO packets always from Queue 0").

The removal also depends on the per-queue checks in
stmmac_features_check() added by commit b55dfb173ce8 ("net: stmmac: move
check for hardware checksum supported") and the surrounding series. Without
those, backporting this alone removes the only thing that steered GSO
frames to a capable queue.

Could the changelog name those prerequisites so stable triage has
something to work from?

The claimed defect itself looks describable from DT, via
stmmac_mtl_setup():

	plat->tx_queues_cfg[queue].coe_unsupported =
		of_property_read_bool(q_node, "snps,coe-unsupported");

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 66ae365e1c89f..25121d6d84995 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -6428,24 +6428,6 @@ static int stmmac_setup_tc(struct net_device *ndev, enum tc_setup_type type,
>  	}
>  }
>  
> -static u16 stmmac_select_queue(struct net_device *dev, struct sk_buff *skb,
> -			       struct net_device *sb_dev)
> -{
> -	int gso = skb_shinfo(skb)->gso_type;
> -
> -	if (gso & (SKB_GSO_TCPV4 | SKB_GSO_TCPV6 | SKB_GSO_UDP_L4)) {
> -		/*
> -		 * There is no way to determine the number of TSO/USO
> -		 * capable Queues. Let's use always the Queue 0
> -		 * because if TSO/USO is supported then at least this
> -		 * one will be capable.
> -		 */
> -		return 0;
> -	}

[Severity: High]
Does this lose hardware TSO/USO for most GSO flows on the in-tree
platforms that mark every TX queue above queue 0 as TBS?

dwmac-intel.c, dwmac-imx.c, dwmac-mediatek.c, dwmac-qcom-ethqos.c and
stmmac_pci.c all do the equivalent of intel_mgbe_common_data():

	/* Default TX Q0 to use TSO and rest TXQ for TBS */
	if (i > 0)
		plat->tx_queues_cfg[i].tbs_en = 1;

That becomes STMMAC_TBS_AVAIL at open time in __stmmac_setup_dma_desc(),
with no ETF qdisc involved:

	int tbs_en = priv->plat->tx_queues_cfg[chan].tbs_en;

	/* Setup per-TXQ tbs flag before TX descriptor alloc */
	tx_q->tbs |= tbs_en ? STMMAC_TBS_AVAIL : 0;

and stmmac_tso_channel_permitted() then returns false for those channels:

	/* TSO and TBS cannot co-exist */
	return !(priv->dma_conf.tx_queue[chan].tbs & STMMAC_TBS_AVAIL);

The commit message says stmmac_features_check() "validates each GSO frame
against the capabilities of the queue it is mapped to", but the check only
demotes the frame, it does not move it:

	if (skb_is_gso(skb)) {
		if (!stmmac_tso_channel_permitted(priv, queue) ||
		    !stmmac_tso_valid_packet(skb))
			features &= ~NETIF_F_GSO_MASK;

So with the selector gone, netdev_pick_tx() hashes GSO flows over all N
queues and roughly (N-1)/N of TCP/UDP-GSO flows on these boards end up
segmented in software by validate_xmit_skb() rather than by the MAC. Is
that intended, and if so could the changelog mention the throughput and
CPU cost instead of describing the change as removing something that is
"no longer needed"?

Would a capability-aware queue selection (or a per-queue TSO map consulted
by the selector) be needed to keep the "Q0 is the TSO queue" contract those
platforms document?

> -
> -	return netdev_pick_tx(dev, skb, NULL) % dev->real_num_tx_queues;
> -}
> -

[Severity: Medium]
The deleted comment records a hardware fact: there is no way to determine
which TX DMA channels were synthesized with the TSO data path. DWMAC and
XGMAC only expose a single global TSOEN bit, surfaced as
priv->dma_cap.tsoen, and stmmac_hw_setup() programs TSE from it for every
non-TBS channel without any readback:

	if (priv->dma_cap.tsoen && priv->plat->flags & STMMAC_FLAG_TSO_EN) {
		for (chan = 0; chan < tx_cnt; chan++) {
			if (!stmmac_tso_channel_permitted(priv, chan))
				continue;

			stmmac_enable_tso(priv, priv->ioaddr, 1, chan);
		}
	}

stmmac_features_check() only knows about tx_queues_cfg[queue].coe_unsupported
and TBS, so on a part where only a subset of channels implement TSO it
cannot clear NETIF_F_GSO_MASK, and stmmac_xmit() then hands the frame to
stmmac_tso_xmit() on a channel whose DMA does not implement TSE. That
programs an MSS context descriptor plus TDES3 in TSE/THL/payload-length
form on a channel that decodes those bits as CIC and frame length.

Is there evidence that all channels are TSO-capable on the supported parts?
If not, would a per-queue tso capability consulted by
stmmac_features_check() be the replacement for the removed workaround?

>  static int stmmac_set_mac_address(struct net_device *ndev, void *addr)
>  {
>  	struct stmmac_priv *priv = netdev_priv(ndev);
> @@ -7302,7 +7284,6 @@ static const struct net_device_ops stmmac_netdev_ops = {
>  	.ndo_eth_ioctl = stmmac_ioctl,
>  	.ndo_get_stats64 = stmmac_get_stats64,
>  	.ndo_setup_tc = stmmac_setup_tc,
> -	.ndo_select_queue = stmmac_select_queue,

[Severity: Medium]
Does the "features_check validates the queue it is mapped to" argument hold
on the AF_PACKET PACKET_QDISC_BYPASS path? __dev_direct_xmit() runs the
feature validation before assigning the real queue:

net/core/dev.c:__dev_direct_xmit() {
	...
	skb = validate_xmit_skb_list(skb, dev, &again);
	if (skb != orig_skb)
		goto drop;

	skb_set_queue_mapping(skb, queue_id);
	...
}

and with .ndo_select_queue gone, packet_pick_tx_queue() takes the else
branch, so queue_id can be any queue:

net/packet/af_packet.c:packet_pick_tx_queue() {
	...
	skb_record_rx_queue(skb, cpu % dev->real_num_tx_queues);
	if (ops->ndo_select_queue) {
		queue_index = ops->ndo_select_queue(dev, skb, NULL);
		queue_index = netdev_cap_txqueue(dev, queue_index);
	} else {
		queue_index = netdev_pick_tx(dev, skb, NULL);
	}
	...
}

The mapping stmmac_features_check() reads via skb_get_queue_mapping() is
therefore (cpu % real_num_tx_queues) + 1, not queue_id. When the evaluated
queue is TSO-permitted but the queue actually used is not, NETIF_F_GSO_MASK
survives and stmmac_xmit() dispatches unconditionally:

	if (skb_is_gso(skb))
		return stmmac_tso_xmit(skb, dev);

Before this patch the same ordering existed but was harmless, because
packet_pick_tx_queue() consulted ndo_select_queue and GSO frames always
went out on queue 0. Is something needed to close that now?

Separately, that mapping can be real_num_tx_queues itself when
cpu % real_num_tx_queues == real_num_tx_queues - 1. Can this read past
priv->plat->tx_queues_cfg[] and priv->dma_conf.tx_queue[] in
stmmac_features_check() when real_num_tx_queues == MTL_MAX_TX_QUEUES?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260831-stmmac_select_queue-tso-fix-v3-1-d9c215fe7a85%40oss.qualcomm.com

