Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC2C60A2600
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 17:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0Z9EiL0j;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OGHeF0po
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d3YgZ6rFjSF640oAE6K1esSmJ69BZZKZXyF8UF8PDV8=; b=0Z9EiL0jWfQYCknFTckitcGUDv
	AvaN0bYoPHu/IxUEGSU9xJ5rUolrH6YPokdwG3U7xSGiZ39kvJBzKX4bDLZ1Gn2hwxK/R8m9AULOc
	mf+8YN80P0ufoksFYGk5Dliwr3mvLGlPV96TyXlzEUANgIkZnHQdRLhAQ/lpBI0+l3N1yCwrz7Gbe
	cj2iIqgezHBXdJCK1B+Nsi7Vanf8S6zWR0EJLMS1hLdBeOPYBWuRr+cuYi/z86QVXEt1pCig8ObIc
	usiRkVGGdctJ+V6BQFwT0utn6Ed1aXrkj3X6PBOyE2943qFrhxxBGSuq3+K3f4iKR701VfMV3QpcJ
	PHNu1E8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIrJq-000000085xi-3zxD;
	Mon, 19 Oct 2026 17:38:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIrJp-000000085wO-0jBN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 17:38:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 52355601FD;
	Mon, 19 Oct 2026 17:38:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD1581F000CA;
	Mon, 19 Oct 2026 17:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792431520;
	bh=d3YgZ6rFjSF640oAE6K1esSmJ69BZZKZXyF8UF8PDV8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=OGHeF0pozEU603615+FPvY7N67oa1EM2SWddXg5nBTC1lyYAXI5EuQfwk9LHShwNx
	 3Qtm8ih59KhxxfknnlFsSSdo46Tl0zEsC5ScyjYBodIBd8eShsSKXXbJgoFmxNetSi
	 4GHICW02PACle9bt6Lg/VJUsCij5q0g6wES5uj0IcN46b/oBkBtw9ideIQ5Y94IGt2
	 BRL2TkFSwSluaO63rY5PenSzggMzEh5p5ZHVfpf3sA6lX7sWhCOCqaYjNCxc9e+c4a
	 L49Dj3opw8IKHYlXejnw0RC0FhSfjL5qU3PMgm80Uh7tq22hjS3zEPqIxwx9zK3e4b
	 83fPjUJpYVgrA==
Subject: Re: [PATCH net-next v8 4/5] net: stmmac: fix VLAN tag stripping on
 non-linear RX frames
From: netdev-bot+sashiko@kernel.org
To: lorenzo.bianconi@oss.qualcomm.com
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, ast@kernel.org,
 daniel@iogearbox.net, hawk@kernel.org, john.fastabend@gmail.com,
 sdf@fomichev.me, Jose.Abreu@synopsys.com, boon.leong.ong@intel.com,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 bpf@vger.kernel.org
Date: Mon, 19 Oct 2026 17:38:38 +0000
Message-ID: <179243151841.3135.10232947668205235199@kernel.org>
In-Reply-To: <20261018-stmmac-rx-mb-v8-4-5f58c0b25849@oss.qualcomm.com>
References: <20261018-stmmac-rx-mb-v8-4-5f58c0b25849@oss.qualcomm.com>
X-sashiko-severity: Medium
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 2 (1) · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The commit message and Fixes: tag describe a crash that cannot
  happen in any tree this patch would be backported to.
- [Medium] The commit message says that moving meta_len bytes together
  with the MAC addresses in stmmac_rx_vlan() keeps data_meta pointing at…
- [Low] stmmac_rx_vlan() now calls pskb_may_pull(skb, VLAN_ETH_HLEN)
  before checking h_vlan_proto or dev->features.

Pre-existing issues:
- [Medium] This problem wasn't introduced by this patch, but
  priv->xstats.rx_dropped is a plain 'unsigned long' (common.h:241)…

--

net: stmmac: fix VLAN tag stripping on non-linear RX frames

This patch makes stmmac_rx_vlan() call pskb_may_pull(skb, VLAN_ETH_HLEN)
before it reads the VLAN header. When the tag is popped, any XDP metadata
is now moved along with the MAC addresses. If the pull fails, both RX
callers drop the frame.

> stmmac_rx_vlan() reads the VLAN header straight from skb->data and
> removes it with skb_pull(), assuming the header is always in the linear
> part of the skb. That is not true once non-linear skbs can reach it: a
> program loaded with BPF_F_XDP_HAS_FRAGS can pass up a fragmented frame
> whose linear head has been shortened to as little as ETH_HLEN by
> bpf_xdp_adjust_head(), and the unguarded skb_pull() then drives skb->len
> below skb->data_len, tripping BUG() in __skb_pull().

[Severity: Medium]
Can this scenario happen in a tree that matches the Fixes: tag?

On the AF_XDP zero-copy path from bba2556efad6, stmmac_construct_skb_zc()
always builds a linear skb:

	skb = napi_alloc_skb(&ch->rxtx_napi,
			     xdp->data_end - xdp->data_hard_start);
	...
	memcpy(__skb_put(skb, datasize), xdp->data, datasize);

On the regular stmmac_rx() path with XDP enabled, multi-descriptor frames
and buf2 frames are both dropped:

		/* We do not support SG in XDP mode */
		if (unlikely(!error && (status & rx_not_ls) &&
			     stmmac_xdp_is_enabled(priv))) {
		...
		if (unlikely(stmmac_xdp_is_enabled(priv) && buf2_len)) {
			rx_dropped++;
			goto next;
		}

The XDP_PASS skb there is built with napi_build_skb() plus
skb_put(buf1_len) and has no frags. XDP_PASS skbs with frags seem to
appear only with the later "net: stmmac: rework stmmac_rx to support XDP
rx multi-buff" patch in this series.

Even with a 14 byte linear head, skb_pull(skb, VLAN_HLEN) here would leave
10 bytes of headlen and would not BUG. Wouldn't the BUG() come from
eth_type_trans()->eth_skb_pull_mac()->skb_pull_inline(skb, ETH_HLEN)
instead?

On current trees, the patch fixes a different case. An XDP program can
use bpf_xdp_adjust_tail() to shrink a linear frame to 14..17 bytes while
bytes 12-13 still hold a VLAN ethertype. The old code then reads
h_vlan_TCI past skb->len and pops the tag. That leaves skb->len below
ETH_HLEN, and eth_type_trans() passes a malformed skb up the stack.

Could the commit message describe that case, and could the Fixes: tag be
rechecked? As written, stable maintainers may conclude that 5.13+ kernels
hit a BUG() they do not have.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index e929cc0f23125..04dc6dcaa435d 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -5095,22 +5095,30 @@ static netdev_features_t stmmac_features_check(struct sk_buff *skb,
>  	return vlan_features_check(skb, features);
>  }
>  
> -static void stmmac_rx_vlan(struct net_device *dev, struct sk_buff *skb)
> +static int stmmac_rx_vlan(struct net_device *dev, struct sk_buff *skb)
>  {
> -	struct vlan_ethhdr *veth = skb_vlan_eth_hdr(skb);
> -	__be16 vlan_proto = veth->h_vlan_proto;
> -	u16 vlanid;
> +	struct vlan_ethhdr *veth;
>  
> -	if ((vlan_proto == htons(ETH_P_8021Q) &&
> +	if (!pskb_may_pull(skb, VLAN_ETH_HLEN))
> +		return -EINVAL;

[Severity: Low]
Does this drop every 14..17 byte frame, including untagged ones?

The pull happens before h_vlan_proto and dev->features are checked. Any
skb with skb->len < VLAN_ETH_HLEN now fails here, and both stmmac_rx()
and stmmac_dispatch_skb_zc() free it and count it in rx_dropped.

This also covers interfaces set with "ethtool -K rxvlan off". There,
stmmac_set_features() clears hw_vlan_en, so stmmac_rx_vlan() runs for
every frame. It also covers non-xmac cores, where hw_vlan_en is never
set.

Such frames can come from an XDP program that shrinks a frame with
bpf_xdp_adjust_tail(), which allows lengths down to ETH_HLEN, and then
returns XDP_PASS. Before this patch they went through eth_type_trans()
unchanged.

Would it work to check the ethertype and features first? ETH_HLEN is
enough to read h_vlan_proto, and VLAN_ETH_HLEN would only be needed
when the tag is about to be popped.

> +
> +	veth = skb_vlan_eth_hdr(skb);
> +	if ((veth->h_vlan_proto == htons(ETH_P_8021Q) &&
>  	     dev->features & NETIF_F_HW_VLAN_CTAG_RX) ||
> -	    (vlan_proto == htons(ETH_P_8021AD) &&
> +	    (veth->h_vlan_proto == htons(ETH_P_8021AD) &&
>  	     dev->features & NETIF_F_HW_VLAN_STAG_RX)) {
> +		__be16 vlan_proto = veth->h_vlan_proto;
> +		u16 vlanid = ntohs(veth->h_vlan_TCI);
> +		u8 meta_len = skb_metadata_len(skb);
> +
>  		/* pop the vlan tag */
> -		vlanid = ntohs(veth->h_vlan_TCI);
> -		memmove(skb->data + VLAN_HLEN, veth, ETH_ALEN * 2);
> +		memmove(skb->data - meta_len + VLAN_HLEN,
> +			skb->data - meta_len, meta_len + ETH_ALEN * 2);

[Severity: Medium]
On the AF_XDP zero-copy path, do the meta_len bytes before skb->data
actually hold the XDP metadata?

stmmac_construct_skb_zc() records the metadata length but never copies
the metadata bytes:

	skb_reserve(skb, xdp->data - xdp->data_hard_start);
	memcpy(__skb_put(skb, datasize), xdp->data, datasize);
	if (metasize)
		skb_metadata_set(skb, metasize);

The skb comes from napi_alloc_skb(), which does not zero the headroom,
so the bytes in front of skb->data are stale. This memmove() moves those
stale bytes in front of the relocated MAC header.

After eth_type_trans(), bpf_compute_data_pointers() sets data_meta to
skb->data - skb_metadata_len(skb). TC BPF programs would then read
uninitialized headroom instead of what the XDP program wrote.

On the regular stmmac_rx() path, skb_metadata_set() is never called at
this commit. meta_len is therefore always 0 there, and this part of the
change does nothing until the later rework patch adds the call in
stmmac_build_skb(). stmmac_construct_skb_zc() is still unchanged at the
end of the series.

Peer drivers such as igc_construct_skb_zc() copy starting at
xdp->data_meta and then call __skb_pull(skb, metasize). Should
stmmac_construct_skb_zc() do the same, or should the metadata claim come
out of the commit message?

>  		skb_pull(skb, VLAN_HLEN);
>  		__vlan_hwaccel_put_tag(skb, vlan_proto, vlanid);
>  	}

[ ... ]

> @@ -5530,12 +5538,15 @@ static void stmmac_dispatch_skb_zc(struct stmmac_priv *priv, u32 queue,
>  	}
>  
>  	stmmac_get_rx_hwtstamp(priv, p, np, skb);
> -	if (priv->hw->hw_vlan_en)
> +	if (priv->hw->hw_vlan_en) {
>  		/* MAC level stripping. */
>  		stmmac_rx_hw_vlan(priv, priv->hw, p, skb);
> -	else
> -		/* Driver level stripping. */
> -		stmmac_rx_vlan(priv->dev, skb);
> +	} else if (stmmac_rx_vlan(priv->dev, skb)) {
> +		dev_kfree_skb_any(skb);
> +		priv->xstats.rx_dropped++;

[Severity: Medium]
This isn't a bug introduced by this patch, but priv->xstats.rx_dropped is
a plain unsigned long shared by all RX queues. Per-queue NAPI contexts,
which can run at the same time on different CPUs, update it with
unsynchronized read-modify-write:

stmmac_dispatch_skb_zc():
	priv->xstats.rx_dropped++;

stmmac_rx_zc() and stmmac_rx():
	priv->xstats.rx_dropped += rx_dropped;

stmmac_get_stats64() also reads it without READ_ONCE().

Can concurrent updates from two queues lose increments here? The new
error path adds one more writer that follows the existing pattern.

> +		return;
> +	}

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261018-stmmac-rx-mb-v8-0-5f58c0b25849%40oss.qualcomm.com

