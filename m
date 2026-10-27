Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38AED606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 09:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1XxREmZm;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YsUzvWop
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mlggcwoG0DvfTCXP7ejSDYVRjRbl/qkcqpGTFuN6n2s=; b=1XxREmZmzhzpX0kbkuQYEID3Ft
	97lEOtOl0yRkYVtrWlRWsj0rVYSfUxTtQzU45lS+MzjH5MNAyN2NoOBHSY8+a5xf85DsxGmuYqjhX
	HhNFc+VjIS9+M1JoGTopL4KFqSbxfmI3YLmL71pKyBbSvCvKf/z9T/RziAARys3s1Xbyt+NydWkin
	/bwPGvjEkhQjN7iFU+AQ6WBou57BnxTqKflq+D7lhJMJR9Tp6lukInMnntoDyXEhmi6ZPiY5l1ALR
	Z8zZQLoaAtfVjE7oYeIzA/tOLoV8N3QkNGXF119aZblF9ZCoGEqB/Ix4lfRkXHJxv5+J2DCvl3sf6
	61Bcw+Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLdCw-000000047x0-000G;
	Tue, 27 Oct 2026 09:11:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLdCt-000000047un-0BzZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 09:10:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C89A240B97;
	Tue, 27 Oct 2026 09:10:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 953231F031E1;
	Tue, 27 Oct 2026 09:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793092258;
	bh=mlggcwoG0DvfTCXP7ejSDYVRjRbl/qkcqpGTFuN6n2s=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=YsUzvWopm3C/u14vd2Db/AOVOM0G0Qyw/Xz2nXXSUQgeLOjWiQqOCDJ0AVroBk6bP
	 ppvu0E+RoPeukmmAUh70/0DWFBh285VvP2xD88PwA0ZXejzaCMs1r8zfoDy/mh5FXO
	 i8CAqHmReZ0qAH48AWsmXV1iwJzUv/ZyFFolIyWn+ymenLABah90ekVv44jKGTPoVC
	 mrqLZm8pA6YjKFauaLH2ZRMaFUuSXOqGX1FkCUHvPywwniDfpIX6WA948vmSSlgNGH
	 qNWcqPFENOwxPOxIVINLQCYn2EvfgsbUhHwqWgdWBJLq5uxufSG3DqnmjtGlBbUPxX
	 v+pUdOQPQg+8g==
Subject: Re: [PATCH net 5/6] net: stmmac: fix VLAN tag stripping on short and
 non-linear RX frames
From: netdev-bot+sashiko@kernel.org
To: lorenzo.bianconi@oss.qualcomm.com
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, ast@kernel.org,
 daniel@iogearbox.net, hawk@kernel.org, john.fastabend@gmail.com,
 sdf@fomichev.me, Jose.Abreu@synopsys.com, boon.leong.ong@intel.com,
 o.rempel@pengutronix.de, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org
Date: Tue, 27 Oct 2026 09:10:57 +0000
Message-ID: <179309225715.3134.11251912403308890296@kernel.org>
In-Reply-To: <20261023-stmmac-xdp-fixes-v1-5-efb37e19f5bd@oss.qualcomm.com>
References: <20261023-stmmac-xdp-fixes-v1-5-efb37e19f5bd@oss.qualcomm.com>
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

- [Low] In stmmac_rx_vlan()
  (drivers/net/ethernet/stmicro/stmmac/stmmac_main.c), the patch adds an…

Pre-existing issues:
- [Medium] Only one of the two stmmac RX paths that call stmmac_rx_vlan()
  records XDP metadata in the skb.
- [Medium] The new VLAN-error drop branch in stmmac_dispatch_skb_zc()
  does a plain `priv->xstats.rx_dropped++` (line 5567).

--

net: stmmac: fix VLAN tag stripping on short and non-linear RX frames

This patch changes stmmac_rx_vlan() so that it pulls ETH_HLEN before
reading h_vlan_proto, and pulls VLAN_ETH_HLEN before reading the TCI. It
returns an error so callers can drop frames that claim a VLAN tag but lack
the full header. It also moves XDP metadata together with the MAC
addresses when the tag is popped.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 8a2faf50d6957..32b2c5834c340 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -5102,22 +5102,35 @@ static netdev_features_t stmmac_features_check(struct sk_buff *skb,
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
> +	if (!pskb_may_pull(skb, ETH_HLEN))
> +		return -EINVAL;

[Severity: Low]
This pull happens before the h_vlan_proto and dev->features checks. A frame
shorter than ETH_HLEN is now freed and counted in rx_dropped by both
stmmac_rx() and stmmac_dispatch_skb_zc(), even with CTAG/STAG RX stripping
disabled. The hw_vlan_en branch in those callers has no matching check.

Is that intended? The commit message says:

    untagged frames, including short ones, are left untouched.

That holds only for frames between ETH_HLEN and VLAN_ETH_HLEN in length.

XDP doesn't seem able to reach this case, because bpf_xdp_adjust_head()
and bpf_xdp_adjust_tail() both refuse to go below ETH_HLEN. Dropping such
a runt is also arguably safer than handing it to eth_type_trans().

Could the commit message mention that frames shorter than ETH_HLEN are now
dropped?

> +
> +	veth = skb_vlan_eth_hdr(skb);
> +	if ((veth->h_vlan_proto == htons(ETH_P_8021Q) &&
>  	     dev->features & NETIF_F_HW_VLAN_CTAG_RX) ||
> -	    (vlan_proto == htons(ETH_P_8021AD) &&
> +	    (veth->h_vlan_proto == htons(ETH_P_8021AD) &&
>  	     dev->features & NETIF_F_HW_VLAN_STAG_RX)) {
> +		__be16 vlan_proto = veth->h_vlan_proto;
> +		u8 meta_len = skb_metadata_len(skb);
> +		u16 vlanid;
> +
>  		/* pop the vlan tag */
> +		if (!pskb_may_pull(skb, VLAN_ETH_HLEN))
> +			return -EINVAL;
> +
> +		veth = skb_vlan_eth_hdr(skb);
>  		vlanid = ntohs(veth->h_vlan_TCI);
> -		memmove(skb->data + VLAN_HLEN, veth, ETH_ALEN * 2);
> +		memmove(skb->data - meta_len + VLAN_HLEN,
> +			skb->data - meta_len, meta_len + ETH_ALEN * 2);

[Severity: Medium]
This isn't a bug introduced by this patch, but skb_metadata_len() can only
be non-zero for skbs built by stmmac_construct_skb_zc() on the AF_XDP
zero-copy path:

stmmac_construct_skb_zc() {
    ...
	memcpy(skb->data - metasize, xdp->data_meta, datasize + metasize);
	if (metasize)
		skb_metadata_set(skb, metasize);
    ...
}

On the page_pool path, stmmac_rx() calls xdp_prepare_buff() with
meta_valid set to true, so bpf_xdp_adjust_meta() succeeds there. The
XDP_PASS skb is then built without recording the metadata length:

stmmac_rx() {
    ...
			/* XDP program may adjust header */
			head_pad_len = ctx.xdp.data - ctx.xdp.data_hard_start;
			skb_reserve(skb, head_pad_len);
			skb_put(skb, buf1_len);
			skb_mark_for_recycle(skb);
    ...
}

So skb_shinfo(skb)->meta_len stays 0 for these skbs. Doesn't that mean
metadata written by a non-ZC XDP program is lost before tc BPF can see it?
It would also mean this memmove only moves metadata for zero-copy skbs.

Should stmmac_rx() also call skb_metadata_set() with
ctx.xdp.data - ctx.xdp.data_meta?

This patch's own claim still holds on that path, since meta_len is 0
there and data_meta cannot end up pointing at the wrong bytes.

>  		skb_pull(skb, VLAN_HLEN);
>  		__vlan_hwaccel_put_tag(skb, vlan_proto, vlanid);
>  	}
> +
> +	return 0;
>  }

[ ... ]

> @@ -5546,12 +5559,15 @@ static void stmmac_dispatch_skb_zc(struct stmmac_priv *priv, u32 queue,
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
This is a pre-existing issue, but priv->xstats.rx_dropped is one
device-wide unsigned long in struct stmmac_extra_stats. Every channel's
NAPI poll updates it with a plain read-modify-write:

stmmac_dispatch_skb_zc()
    priv->xstats.rx_dropped++;

stmmac_rx_zc() and stmmac_rx()
    priv->xstats.rx_dropped += rx_dropped;

stmmac_napi_add() registers a separate rx_napi/rxtx_napi for each channel,
so these polls can run at the same time on different CPUs. No lock, atomic
or u64_stats_sync protects the counter.

Can drop increments be lost this way? stmmac_get_stats64() also reads the
field without READ_ONCE().

This patch only adds one more site that follows the existing pattern.

> +		return;
> +	}
> +
>  	skb->protocol = eth_type_trans(skb, priv->dev);

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261023-stmmac-xdp-fixes-v1-0-efb37e19f5bd%40oss.qualcomm.com

