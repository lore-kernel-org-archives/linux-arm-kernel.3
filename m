Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9CBAC5AD44
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 19:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PGLFx20OJkATeaOnfq8BynVGC6dZ8C1J46R9FCi/LBo=; b=soQd1j3LVO8dy5pLpHqm8y47X3
	A0g+7yNmpyd0QF++tGbbdgn3uSHq4WOTea3R66iWOlPfED2wZ87ZnsKwBr3jyXgoSpvR7kdMPuFde
	R/CzRWXB6J3frb88cBvskemqAupiur7t7MeTEuu7iK1EWyUQjxvuwrfhtAJIQdcFhi1FHojOhdit/
	J+6G6sqEfmmVy5Fzkn4WKJQzG1LpL5kwJVSQqVTaFQGPNsb1Jp7+0BHVxEAUlb+T8cqocrwfRXPsP
	6loYgStU4bZCx6P1rZBC/qOqH295zxzO2x5x81yI5vULGQBe7AOWcSuTRJFZ97+OAPhKAV6oEdPob
	I5Bk0S6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsn1y-00000009fRG-1r1D;
	Sat, 08 Aug 2026 19:48:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsn1u-00000009fOc-3KKH
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Aug 2026 19:48:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8BEB443DC9;
	Sat,  8 Aug 2026 19:48:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD4D11F00A3A;
	Sat,  8 Aug 2026 19:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786218506;
	bh=PGLFx20OJkATeaOnfq8BynVGC6dZ8C1J46R9FCi/LBo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LNv6l3dyn2JhxoNffxFzH5N7/HO6kRQ1XMVBhjGzG23WKCuAE9H0e94GzE7ddXkZL
	 EzgSDKWIqOH2Rv8mgRhTTJGK6UBRSPlXg5nLqOzaV9GdF06LIZLBzSIqok4n5w1/eB
	 XdBCow7G8i22cSyUKEUBjrSk5VaRMlj6Nz6UHcOQieaMoEmdi9ystqgoUT9H0SoMTh
	 XOYH9psBi8Pc6PPJ49P1ltzTqcS0mC3rSEOfWlaaRFc4qe/xOFz6/YQhlqtJL3YEiQ
	 RqnLW0j3P9JN5iekVpEI0qWiTUPVoFidiEKPqYk+MAN+J6/9An1QEilMP+0c5d0UEP
	 33ffWB3wCRXqg==
From: Jakub Kicinski <kuba@kernel.org>
To: nagadheeraj.rottela@amd.com
Cc: Jakub Kicinski <kuba@kernel.org>,
	srinivas.neeli@amd.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	richardcochran@gmail.com,
	michal.simek@amd.com,
	andrew@lunn.ch,
	olteanv@gmail.com,
	horms@kernel.org,
	linux@armlinux.org.uk,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	git-dev@amd.com
Subject: Re: [PATCH 08/20] net: xilinx: tsn: deliver endpoint RX frames to DSA user ports
Date: Sat,  8 Aug 2026 12:48:25 -0700
Message-ID: <20260808194825.132892-1-kuba@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260807104431.157230-9-nagadheeraj.rottela@amd.com>
References: <20260807104431.157230-9-nagadheeraj.rottela@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
---
net: xilinx: tsn: deliver endpoint RX frames to DSA user ports

The endpoint driver now allocates one METADATA_HW_PORT_MUX metadata_dst
per MAC port at probe time and attaches the matching entry to each RX
frame based on the TUSER port_id, so the DSA core can route frames to
the correct swpN user netdev.

> diff --git a/drivers/net/ethernet/xilinx/tsn/xilinx_tsn_ep.c b/drivers/net/ethernet/xilinx/tsn/xilinx_tsn_ep.c
> index 7615d27f3b36..051285b47ddb 100644
> --- a/drivers/net/ethernet/xilinx/tsn/xilinx_tsn_ep.c
> +++ b/drivers/net/ethernet/xilinx/tsn/xilinx_tsn_ep.c

[ ... ]

> @@ -254,6 +262,7 @@ static void ep_dma_rx_cb(void *data, const struct dmaengine_result *result)
>  	}
>  
>  	skb_put(skb, rx_len);
> +	skb_dst_set_noref(skb, &ep->port_md[port_id]->dst);
>  	skb->dev = ndev;
>  	skb->protocol = eth_type_trans(skb, ndev);
>  	skb->ip_summed = CHECKSUM_NONE;

[Severity: Medium]
Should this attach be gated on the ep netdev actually being a DSA conduit?

The only in-tree receive-side consumer that interprets and then drops this
dst is dsa_switch_rcv() in net/dsa/tag.c:

	if (md_dst && md_dst->type == METADATA_HW_PORT_MUX) {
		unsigned int port = md_dst->u.port_info.port_id;

		skb_dst_drop(skb);
		if (!skb_has_extensions(skb))
			skb->slow_gro = 0;

and that path is only reached for ETH_P_XDSA, which eth_type_trans() returns
only when netdev_uses_dsa(dev) is true.

NET_DSA_XILINX_TSN is a separate tristate from XILINX_TSN, so the ep netdev
can be up and receiving with no switch bound (switch driver not built, no
switch node in DT, switch probe failure, or the window between the ep
register_netdev() and dsa_register_switch()). In that configuration nothing
drops the metadata dst, and every received frame carries a dev-less
DST_METADATA into the generic stack: skb->slow_gro is forced on for all
traffic, IPv4 early demux is skipped because ip_rcv_finish_core() requires
!skb_dst(skb), and the stale port_id 1/2 stays readable through
skb_metadata_dst() by tc/BPF/netfilter ingress, AF_PACKET taps, bridging and
clones.

Both existing users of this mechanism gate the attach. mtk_poll_rx() in
drivers/net/ethernet/mediatek/mtk_eth_soc.c:

		if (mtk_is_netsys_v1(eth) && (trxd.rxd2 & RX_DMA_VTAG) &&
		    netdev_uses_dsa(netdev)) {
			...
				skb_dst_set_noref(skb, &eth->dsa_meta[port]->dst);

and airoha_qdma_rx_process() in drivers/net/ethernet/airoha/airoha_eth.c:

		if (netdev_uses_dsa(netdev)) {
			...
				skb_dst_set_noref(q->skb,
						  &port->dsa_meta[sptag]->dst);

[Severity: Medium]
Is the noref dst still valid by the time it is dereferenced?

skb_dst_set_noref() stores an unreferenced pointer that must either be
consumed inside the same RCU read-side section or upgraded with
skb_dst_force().  Neither happens here: __netif_rx() does not process the
frame inline, netif_rx_internal() enqueues it on a softnet backlog queue
(possibly a remote CPU's under RPS) and returns, so the DMA completion
callback's BH section ends while the skb still holds the raw pointer:

ep_dma_rx_cb()
  skb_dst_set_noref()
  __netif_rx() -> netif_rx_internal() -> enqueue_to_backlog()

later NET_RX softirq:
  process_backlog() -> __netif_receive_skb_core() -> dsa_switch_rcv()
    skb_metadata_dst() / skb_dst()

The two existing users consume the metadata in the same BH section via
napi_gro_receive().  The one core call site that queues a dst-carrying skb
to the backlog, dev_loopback_xmit(), upgrades first:

	DEBUG_NET_WARN_ON_ONCE(!skb_dst(skb));
	skb_dst_force(skb);
	netif_rx(skb);

Would napi_gro_receive()/netif_receive_skb(), or an skb_dst_force() before
the handoff, be more appropriate here?

> @@ -771,6 +780,37 @@ static int ep_count_dma_queues(struct device *dev, u32 *out_tx, u32 *out_rx)
>  	return 0;
>  }
>  
> +static void ep_free_port_md(struct xlnx_tsn_ep *ep)
> +{
> +	int i;
> +
> +	for (i = 0; i < XLNX_TSN_EP_PORT_MD_SLOTS; i++) {
> +		if (ep->port_md[i]) {
> +			metadata_dst_free(ep->port_md[i]);
> +			ep->port_md[i] = NULL;
> +		}
> +	}
> +}

[Severity: High]
Can this free a metadata_dst that skbs still point at?

metadata_dst_free() in net/core/dst.c is an unconditional kfree():

void metadata_dst_free(struct metadata_dst *md_dst)
{
	...
	kfree(md_dst);
}

It ignores dst->__rcuref (dst_init() starts it at 1) and skips the
call_rcu_hurry(&dst->rcu_head, dst_destroy_rcu) deferral that dst_release()
performs.  Meanwhile ep_dma_rx_cb() published the raw pointer to the stack
with skb_dst_set_noref().

Two paths look reachable:

(a) xlnx_tsn_ep_remove() frees right after unregister_netdev() with no
    synchronize_net() of its own.  flush_all_backlogs() only purges skbs
    still sitting on a backlog queue, not an skb already dequeued and in
    flight in __netif_receive_skb_core() on another CPU, nor a clone that
    already left the netdev-scoped backlog.  Such an skb then reads
    md_dst->type / md_dst->u.port_info.port_id out of freed memory in
    net/dsa/tag.c or the flow dissector.

(b) If anything upgrades the noref dst with skb_dst_force() (for instance
    __dev_queue_xmit() when the frame is bridged or forwarded to a device
    without IFF_XMIT_DST_RELEASE, which is reachable in the ungated
    non-DSA case above), dst_hold_safe() succeeds because rcuref starts at
    1 and the skb owns a reference.  The kfree() here then frees a
    still-referenced object, and the skb's later skb_dst_drop() ->
    dst_release() does a rcuref_put() write on freed memory and may queue
    dst_destroy_rcu() on it.

Would dst_release(&ep->port_md[i]->dst) be the right teardown, matching
mtk_free_dev():

		dst_release(&eth->dsa_meta[i]->dst);

and the equivalent dst_release(&port->dsa_meta[i]->dst) in the airoha
driver?

[ ... ]

> @@ -858,6 +906,7 @@ static void xlnx_tsn_ep_remove(struct platform_device *pdev)
>  		return;
>  
>  	unregister_netdev(ep->ndev);
> +	ep_free_port_md(ep);
>  	free_netdev(ep->ndev);
>  }

[Severity: High]
Same concern as above, at the call site: the metadata_dst objects are
kfree()d here immediately after unregister_netdev(), with no RCU grace
period and no refcount check, while skbs or clones referencing them may
still be in flight in the receive stack or queued in a qdisc after an
skb_dst_force() upgrade.

