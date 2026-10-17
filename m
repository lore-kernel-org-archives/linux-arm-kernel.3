Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 417ADCCF2C6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 01:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S4QWG8iL9mfl/dhfo2RsR4M7cwNDRqdBeBp9keTXYPE=; b=N9WrQ+JF1ftvorLNiXdg0bC1Hx
	GvQyjTrE4EGVoDTtISv68XmlCtJzCMKobBTSy2nf+yfmr5vHeM4hlPOjz4BG5Y9QWRsFTEoxGHkEh
	VBv7BYFcifhu4lcc10fVIR5oapvfYSEAf33lH0/Pa+5JImgiubcCrW0LV7iYY9o2/0aFvQgqpdUQP
	LWVcMOLNcrWnBQ7DSovHNonDrxNfetzJ3QYyOExWk9BmxEGgKDD1WOmWmS3Kh5dVSkUrWRf9UojVq
	nHiORAmhg3nfL9yim1Z5pc3ZrjpxEjpIIRDQGZsWIVf7HYHtiixcrQPaixXl4y9OQDda7A8koeJ+T
	2eDuMGlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHsn5-00000004HjG-0uNW;
	Sat, 17 Oct 2026 01:00:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHsmz-00000004Hhe-3Jgy;
	Sat, 17 Oct 2026 01:00:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 766A844512;
	Sat, 17 Oct 2026 01:00:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A77801F000C4;
	Sat, 17 Oct 2026 01:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792198845;
	bh=S4QWG8iL9mfl/dhfo2RsR4M7cwNDRqdBeBp9keTXYPE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Sggz42U+vvkvhddKw1jnhpFRzpbHV5ovSzaKRxOPwG2B3o/+mk3l5Z+PxKbE0Dp2E
	 UTkXifp811PubD9ZlmQ2OgS3SDUPhjHfZwJrD5Ed5qrW5kKPW51wI4E3jaRCBZ9rCR
	 HTjpFfEKFKpFxMRMkssI4+uCEegoibs3qUC0BPw5VBxt3iHHxzUlnD/k2JnlzlG6vc
	 vVzw+cwyDaUSa+wRhcWzVL5ukGoGNO8LveVrkb5na3T6NBxyneFr6Juf1l0+L4FbEb
	 AAsjkq0qpQYXbpruOze+Vu2z7+dGUsf4a50t3ZBz+d2S4eyABJG+ps21XVYxRbgIlV
	 LVX1roSf9+66w==
Subject: Re: [PATCH net v5 5/6] can: rockchip_canfd: serialize TX with bus-off
 and restart
From: netdev-bot+sashiko@kernel.org
To: 1579567540@qq.com
Cc: mkl@pengutronix.de, mailhol@kernel.org, heiko@sntech.de,
 davem@davemloft.net, wg@grandegger.com, socketcan@hartkopp.net,
 kernel@pengutronix.de, linux-can@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, stable@vger.kernel.org, kuba@kernel.org
Date: Sat, 17 Oct 2026 01:00:44 +0000
Message-ID: <179219884425.1406898.18319979032484933416@kernel.org>
In-Reply-To: <20261015-rockchip-canfd-restart-close-v5-5-ae77327037c9@qq.com>
References: <20261015-rockchip-canfd-restart-close-v5-5-ae77327037c9@qq.com>
X-sashiko-severity: Low
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

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] This patch takes spin_lock_irqsave(&priv->tx_lock, flags) near
  the top of rkcanfd_start_xmit()…

Pre-existing issues:
- [Medium] This problem wasn't introduced by this patch, but
  rkcanfd_start_xmit() does not handle a can_put_echo_skb() failure.

--

can: rockchip_canfd: serialize TX with bus-off and restart

This adds a private tx_lock and tx_enabled flag. They serialize
rkcanfd_start_xmit() and the RX-side echo completion and retry against
bus-off handling and CAN restart. TX is disabled before CAN_STATE_BUS_OFF
is published, and carrier, TX, IRQs and the queue are re-enabled together
under the lock after the controller has been reinitialized.

> diff --git a/drivers/net/can/rockchip/rockchip_canfd-tx.c b/drivers/net/can/rockchip/rockchip_canfd-tx.c
> index 12200dcfd3389..f49ed6d2266d9 100644
> --- a/drivers/net/can/rockchip/rockchip_canfd-tx.c
> +++ b/drivers/net/can/rockchip/rockchip_canfd-tx.c
> @@ -69,12 +69,19 @@ netdev_tx_t rkcanfd_start_xmit(struct sk_buff *skb, struct net_device *ndev)

[ ... ]

>  	if (can_dev_dropped_skb(ndev, skb))
>  		return NETDEV_TX_OK;
>  
> +	spin_lock_irqsave(&priv->tx_lock, flags);
> +	if (unlikely(!priv->tx_enabled)) {
> +		netif_stop_queue(ndev);
> +		goto out_busy;
> +	}
> +

[Severity: Low]
This lock stays held with hard IRQs disabled until the end of
rkcanfd_start_xmit(). The locked region includes the echo skb handling:

drivers/net/can/rockchip/rockchip_canfd-tx.c:rkcanfd_start_xmit() {
    ...
	frame_len = can_skb_get_frame_len(skb);
	err = can_put_echo_skb(skb, ndev, tx_head, frame_len);
	if (!err)
		netdev_sent_queue(priv->ndev, frame_len);
    ...
}

can_put_echo_skb()->can_create_echo_skb() clones the skb and then calls
consume_skb() on the original. If the clone fails, it calls kfree_skb()
instead. can_put_echo_skb() also calls kfree_skb() in three cases: IFF_ECHO
is clear, the protocol check fails, or the echo slot is still occupied.

Freeing the original skb runs the socket destructor (sock_wfree()). If this
is the last TX skb of a closed socket, that can continue into __sk_free().

The comment above dev_kfree_skb_irq() in include/linux/netdevice.h says
kfree_skb() and consume_skb() must not be called with hardware interrupts
disabled. Before this patch, ndo_start_xmit() ran with only BH disabled.

Nothing seems to fail visibly today. skb_release_head_state() only warns
on in_hardirq(), not on irqs_disabled(), and peak_canfd uses a similar
pattern. Even so, should the clone and the free of the original skb happen
outside tx_lock, with only the echo slot pointer and tx_head published
under the lock?

[ ... ]

> @@ -137,7 +144,14 @@ netdev_tx_t rkcanfd_start_xmit(struct sk_buff *skb, struct net_device *ndev)
>  				  RKCANFD_TX_STOP_THRESHOLD,
>  				  RKCANFD_TX_START_THRESHOLD);
>  
> +	spin_unlock_irqrestore(&priv->tx_lock, flags);
> +
>  	return NETDEV_TX_OK;

[Severity: Medium]
This is a pre-existing issue that this patch did not introduce. What
happens when can_put_echo_skb() fails earlier in this function?

If the GFP_ATOMIC clone in can_create_echo_skb() fails, can_put_echo_skb()
frees the original skb and returns -ENOMEM. That leaves
priv->can.echo_skb[tx_head] set to NULL. In that case rkcanfd_start_xmit()
only skips netdev_sent_queue():

	err = can_put_echo_skb(skb, ndev, tx_head, frame_len);
	if (!err)
		netdev_sent_queue(priv->ndev, frame_len);

	WRITE_ONCE(priv->tx_head, priv->tx_head + 1);

	rkcanfd_start_xmit_write_cmd(priv, reg_cmd);

When the self-received frame comes back, rkcanfd_handle_rx_int_one() sees
tx_pending != 0 and calls rkcanfd_rxstx_filter(). That function then hits
the NULL slot:

drivers/net/can/rockchip/rockchip_canfd-rx.c:rkcanfd_rxstx_filter() {
    ...
	skb = priv->can.echo_skb[tx_tail];
	if (!skb) {
		netdev_err(priv->ndev, ...);

		return -ENOMSG;
	}
    ...
}

tx_tail never advances, because the only normal advance happens after a
successful echo match. rkcanfd_handle_rx_int() also stops draining the
FIFO when it gets the error.

After that, does every RX IRQ consume and drop one FIFO entry with another
-ENOMSG? TX would then stall once the ring is full, until a bus-off
restart or an interface down/up reinitializes the controller.

This patch keeps the same error propagation in rkcanfd_handle_rx_int_one().

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261015-rockchip-canfd-restart-close-v5-0-ae77327037c9%40qq.com

