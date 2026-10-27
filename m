Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52CAA606A320
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 09:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PfAYSj/+;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KbNMM3s5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=uGJBMOzeGvE2Nb+TZ2KRWS5LM8HfN0Oo/8rnIRB4zSs=; b=PfAYSj/+PiztaBAiEUFiWW+QHd
	V+Tm+SdL/kr24fJn4j7BcCMSJr0uXwn8zY4FdSBB3e9f1005gLRLGxFV56pUJ1Xz6WnkrrAZG0bVU
	Px7vF9vAJpYTR1AxBCtiRv+g16a2eiXUqxm9kGxUMiUXSumqABoLho0iefDiLj6JlQPVgI00vFPf+
	DqN0mb9ZlzUOsEJcSdCRbnnWsPBvwQVKSUbJLWoTLBKa514fef4DTOc3z2RBTtU4llaZs9t64RWVD
	l4MdOmgLRrHYMkloelg8i/ucwd1Ck2gVKGoRpgXVlRYPewtLVixN0TyllkYwcKurx73Fb5roFnBmt
	yRF2chCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLdCv-000000047vw-2NWq;
	Tue, 27 Oct 2026 09:11:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLdCq-000000047tH-0M5q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 09:10:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 88EA6434BD;
	Tue, 27 Oct 2026 09:10:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70AEC1F031E1;
	Tue, 27 Oct 2026 09:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793092255;
	bh=uGJBMOzeGvE2Nb+TZ2KRWS5LM8HfN0Oo/8rnIRB4zSs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=KbNMM3s58kunelRF3V/7PEtxaciElEGQUR4fCSgo9Uzw7Qvj/y7mze/HfbTb7dAWL
	 9tSY5hNQGCNDR3QfNL5KiCdD7Wj/Q1VZN/bHjwufVZO9K2he3lpcs3gmSGxiQ4JpV7
	 n1d0IkKPps2yxzyOv8MVhiNhdfWF1rE94IuXfSs9WLvU5Ts0PLUgbrtSffMwYsUa9N
	 If2VqsBU31BRRuhKZ8AQGqPw0laFcOU54J2hObG6eMpzKNHJs0bs1Z2qsYxMUJHoC+
	 ffzBeUlXTXFep45t5iY7mpE/pWbxYWRhmZvSbaElcO79TpDccbJ0IGJeLxrhtELnfo
	 rcXv2e8NiTSNA==
Subject: Re: [PATCH net 3/6] net: stmmac: drop multi-buffer frames in XDP mode
From: netdev-bot+sashiko@kernel.org
To: lorenzo.bianconi@oss.qualcomm.com
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, ast@kernel.org,
 daniel@iogearbox.net, hawk@kernel.org, john.fastabend@gmail.com,
 sdf@fomichev.me, Jose.Abreu@synopsys.com, boon.leong.ong@intel.com,
 o.rempel@pengutronix.de, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org
Date: Tue, 27 Oct 2026 09:10:54 +0000
Message-ID: <179309225404.3134.13890305235467768199@kernel.org>
In-Reply-To: <20261023-stmmac-xdp-fixes-v1-3-efb37e19f5bd@oss.qualcomm.com>
References: <20261023-stmmac-xdp-fixes-v1-3-efb37e19f5bd@oss.qualcomm.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The patch cites only `Fixes: 5fabb01207a2` ("net: stmmac: Add
  initial XDP support").

Pre-existing issues:
- [High] Without an XDP program, stmmac_rx() still re-parses the rest of
  a frame as a new frame when napi_build_skb() fails on a non-last…
- [Medium] stmmac_rx() adds its per-poll local counters to the device-
  wide `priv->xstats.rx_dropped` and `priv->xstats.rx_errors` (plain…

--

net: stmmac: drop multi-buffer frames in XDP mode

This patch makes stmmac_rx() drop frames that span more than one
descriptor, or that use the second buffer of a descriptor, while an XDP
program is attached. Discarded buffers are no longer returned to the page
pool, so stmmac_rx_refill() can reuse them in place. The re-parse of the
remaining descriptors after an XDP_CONSUMED verdict is also removed.

> Fixes: 5fabb01207a2 ("net: stmmac: Add initial XDP support")

[Severity: Low]
Should this also carry a Fixes tag for 88095728511e ("net: stmmac: fix rx
Scatter-Gather support")? Two of the failures described in the commit
message seem to come from that commit, not from the initial XDP support.

First, the buf1_len underflow. Before 88095728511e, stmmac_rx_buf1_len()
returned min_t(unsigned int, dma_buf_sz, plen) for the last descriptor. A
tail re-parsed after XDP_CONSUMED therefore got dma_buf_sz bytes.

88095728511e changed the return to:

	return min_t(unsigned int, priv->dma_conf.dma_buf_sz, plen - len);

It also moved the XDP-mode FCS strip into the if (!skb) block:

	if (stmmac_xdp_is_enabled(priv) && !buf2_len) {
		buf1_len -= ETH_FCS_LEN;

Together, these two changes let a 0-3 byte buf1_len underflow.

Second, the second-buffer case. Before 88095728511e, stmmac_rx_buf2_len()
started with:

	if (!priv->sph_active)
		return 0;

stmmac_xdp_set_prog() clears sph_active while XDP is enabled, so buf2_len
was always 0 in XDP mode. That check is now:

	if (!stmmac_rx_check_buf2_cap(priv))
		return 0;

So "GMAC4/XGMAC always provide a second data buffer per descriptor" has
only been true since 88095728511e. The new buf2_len drop fixes a condition
that commit introduced.

The last patch in this series ("net: stmmac: fix XDP RX buffer DMA sync
length") already carries Fixes: 88095728511e.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 3fa2c15222d88..30a2774d722b7 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -5903,18 +5903,23 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)

[ ... ]

> -		if (unlikely(error && (status & rx_not_ls)))
> -			goto read_again;
> +		/* We do not support SG in XDP mode */
> +		if (unlikely(!error && (status & rx_not_ls) &&
> +			     stmmac_xdp_is_enabled(priv))) {
> +			rx_dropped++;
> +			error = 1;
> +		}
>  
>  		if (unlikely(error)) {
> +			if (status & rx_not_ls)
> +				goto read_again;
> +
>  			dev_kfree_skb(skb);
>  			goto next;
>  		}

[Severity: High]
This is a pre-existing issue, and this patch did not introduce it. The new
error-and-drain handling only runs when stmmac_xdp_is_enabled() is true.
Without an XDP program, can the same re-parse still happen when
napi_build_skb() fails on a non-last descriptor?

The failure branch in stmmac_rx() leaves skb == NULL and error == 0:

	skb = napi_build_skb(page_address(buf->page),
			     rx_q->napi_skb_frag_size);
	if (!skb) {
		page_pool_recycle_direct(rx_q->page_pool,
					 buf->page);
		buf->page = NULL;
		rx_dropped++;
		count++;
		goto drain_data;
	}
	...
drain_data:
	if (likely(status & rx_not_ls))
		goto read_again;

The next descriptor of the same hardware frame then passes the error check
and is handled as the start of a new frame.

SPH is active by default on SPH-capable GMAC4/XGMAC when no XDP program is
attached. In that case stmmac_rx_buf1_len() returns 0 for this descriptor:

	if (priv->sph_active && len)
		return 0;

napi_build_skb() then builds an skb with an empty linear area, and the
payload is only in a buf2 frag. pskb_trim(skb, len) does nothing, because
the stale len is larger than skb->len.

With the default hw_vlan_en, nothing pulls the header into the linear area
before this call chain:

	eth_type_trans()
	  eth_skb_pull_mac()
	    skb_pull_inline(skb, ETH_HLEN)
	      __skb_pull()
	        BUG()

Under memory pressure, could an on-link peer panic the machine this way by
sending a frame larger than one buffer? GMAC_CONFIG_JE is set in
GMAC_CORE_INIT, so such frames are accepted even at MTU 1500.

Without SPH, the stack instead gets a frame whose Ethernet header comes
from the middle of the peer's payload.

This path is still unchanged at the end of the series. The VLAN rework in
"net: stmmac: fix VLAN tag stripping on short and non-linear RX frames"
adds pskb_may_pull() only to the software stmmac_rx_vlan() path.

Would it drain the frame correctly to set error = 1 in the
napi_build_skb() failure branch, as this patch does for XDP mode?

> @@ -5926,6 +5931,14 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
>  		buf2_len = stmmac_rx_buf2_len(priv, p, status, len);
>  		len += buf2_len;
>  
> +		/* Drop the packet if it is split over buf1 and buf2 on a
> +		 * single descriptor if the interface is running in XDP mode.
> +		 */
> +		if (unlikely(stmmac_xdp_is_enabled(priv) && buf2_len)) {
> +			rx_dropped++;
> +			goto next;
> +		}

[Severity: Medium]
This isn't a bug introduced by this patch. The new drop paths add to
rx_dropped, which stmmac_rx() folds into a device-wide counter at the end:

	priv->xstats.rx_dropped += rx_dropped;
	priv->xstats.rx_errors += rx_errors;

These are plain unsigned long fields in struct stmmac_extra_stats. They
are updated with a non-atomic read-modify-write, and no shared lock is
held.

Each RX queue has its own NAPI instance. Can two queues polled on
different CPUs lose each other's increments here? The napi_syncp section
just before this only protects the per-queue rxq_stats.

The race goes back to 133466c3bbe171 ("net: stmmac: use per-queue 64 bit
statistics where necessary").

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261023-stmmac-xdp-fixes-v1-0-efb37e19f5bd%40oss.qualcomm.com

