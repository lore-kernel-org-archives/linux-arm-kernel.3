Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5ED0C9830D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 23:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mZkTQxLM1mRpMtzeS62GXQXKm1uy6ytUM4PmRu4+RWs=; b=hoOH5wXE4tN9Ga/LXBsRX3ttLK
	cEXpAQ6ABELrYCbp9v5tSxTnpQUfHTC36+Rf/22gvjfYPeXez80awDEYTOKeyVv78kx9Viw8Uf6E4
	9P42FwcP76cOy5iK4vSsw+3P+JbxI60zOs3RUR13ldAClNpf6k/KzM0yEI9Rdw0f9Y2X6q8025HAl
	XNkaWlsBaqfzmTr62FNMCjT2t5kLsK0GEMY4HotBi02zhrKJiGnqg3kT9wfcQb+eOkSCRXCfgL1Pd
	uHY+/T83cix/NTnJbE8whvUReLlTLs8K5ch/2kMAZRWpeJH7xt/m1HEZQXVPvUbs6H7XTPUXWGtrY
	2ZezRFYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Wru-00000009jOc-2suN;
	Wed, 23 Sep 2026 23:59:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Wrs-00000009jON-3p1n
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 23:59:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 490D4429C9;
	Wed, 23 Sep 2026 23:59:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DDFD1F000FF;
	Wed, 23 Sep 2026 23:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790207956;
	bh=mZkTQxLM1mRpMtzeS62GXQXKm1uy6ytUM4PmRu4+RWs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=WqxCfztC5t/kGUTwiGznDAMUbXSpzQ760Tx6sHKUDM6kt7/LhdQ05kDLAp77mrTjy
	 AfZYRZHM+aRMEejWl9jxn+0fVe2GFV1cdg4pmbvwC4TBveQ1kt0SlaRytCXdBH7TYp
	 /GS+ZhNOGBflVD+Li8u35po3hdr5t/wbwN18rt12ulmRT1teevsxGGnieICJXYlS9c
	 cHEz7t3BzJqdY1Xitlm7DJYuQW2KGykP03aIH2MZp5PqtUzAF+IhsqeuXRACKpc1XE
	 tvwnC5bSSMCWId+kHdqMx9J/S0UgPhAWDY/t+eJNM6/dpmqM34BrVcrSnakzj6hvT/
	 6SzvdV3ecri1g==
Subject: Re: [PATCH net-next v2] net: stmmac: rework stmmac_rx to support XDP
 rx multi-buff
From: netdev-bot+sashiko@kernel.org
To: lorenzo.bianconi@oss.qualcomm.com
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, ast@kernel.org,
 daniel@iogearbox.net, hawk@kernel.org, john.fastabend@gmail.com,
 sdf@fomichev.me, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org
Date: Wed, 23 Sep 2026 23:59:14 +0000
Message-ID: <179020795465.2160803.12418467576383825118@kernel.org>
In-Reply-To: <20260921-stmmac-rx-mb-v2-1-6e826e1ff306@oss.qualcomm.com>
References: <20260921-stmmac-rx-mb-v2-1-6e826e1ff306@oss.qualcomm.com>
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

Thank you for your contribution! Sashiko AI review found 6 potential
issue(s) to consider.

Critical: 0 · High: 3 (2) · Medium: 1 (2) · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] stmmac_rx() now assembles multi-buffer (non-linear) xdp_buffs
  and runs the XDP program on them, but (a) ndev->xdp_features in…
- [High] rx_q->state_saved is now overloaded: in stmmac_rx() it means
  'rx_q->state.xdp holds a valid partially assembled xdp_buff whose…
- [High] An in-progress xdp_buff parked in rx_q->state.xdp is the sole
  owner of its head and fragment pages (stmmac_rx() sets buf->page =…
- [Medium] The new error_free_frag label in stmmac_rx() releases the
  accumulated xdp_buff and increments count but never increments…
- [Low] ASSESSED FALSE POSITIVE: the claim that multi-buffer XDP is
  unreachable because stmmac_xdp_set_prog() rejects MTU > ETH_DATA_LEN…
- [Low] The patch silently changes where the hardware DMAs the split-
  header (SPH) secondary buffer: buf->sec_addr becomes…

Pre-existing issues:
- [High] stmmac_rx_buf1_len() returns min(dma_buf_sz, plen) for the last
  descriptor without subtracting the already-accumulated length, so for…
- [High] The manual FCS strip in stmmac_rx() only checks that the last
  descriptor's buffer length is non-zero before subtracting ETH_FCS_LEN,…
- [Medium] The RX error test uses exact equality ('if (unlikely(status ==
  discard_frame))'), but dwmac4_wrback_get_rx_status() sets 'ret =…
- [Medium] stmmac_rx() consumes descriptor write-back fields
  (packet/header length, error and checksum bits) immediately after…

--

net: stmmac: rework stmmac_rx to support XDP rx multi-buff

This reworks stmmac_rx() so that all descriptors of a frame are accumulated
into a single xdp_buff before the XDP program runs, with the in-progress
xdp_buff parked in rx_q->state across NAPI poll boundaries.  The skb is then
assembled with napi_build_skb() plus xdp_update_skb_frags_info().

Link: https://lore.kernel.org/r/20260918-stmmac-rx-mb-v1-1-0b4517d404af@oss.qualcomm.com

A few questions below.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> index 4fc96b317d79..69bdbbf4b920 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> @@ -132,7 +132,7 @@ struct stmmac_rx_queue {
>  	dma_addr_t dma_rx_phy;
>  	unsigned int state_saved;
>  	struct {
> -		struct sk_buff *skb;
> +		struct xdp_buff xdp;
>  		unsigned int len;
>  		unsigned int error;
>  	} state;

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index bf9e7e4cb1c3..7d1149511c55 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -1695,7 +1695,8 @@ static int stmmac_init_rx_buffers(struct stmmac_priv *priv,
>  		if (!buf->sec_page)
>  			return -ENOMEM;
>  
> -		buf->sec_addr = page_pool_get_dma_addr(buf->sec_page);
> +		buf->sec_addr = page_pool_get_dma_addr(buf->sec_page) +
> +				buf->page_offset;
>  		stmmac_set_desc_sec_addr(priv, p, buf->sec_addr, true);
>  	} else {
>  		buf->sec_page = NULL;
> @@ -5140,7 +5141,8 @@ static inline void stmmac_rx_refill(struct stmmac_priv *priv, u32 queue)
>  			if (!buf->sec_page)
>  				break;
>  
> -			buf->sec_addr = page_pool_get_dma_addr(buf->sec_page);
> +			buf->sec_addr = page_pool_get_dma_addr(buf->sec_page) +
> +					buf->page_offset;
>  		}

[Severity: Low]
These two hunks change where the hardware DMAs the split-header secondary
buffer, from offset 0 to buf->page_offset, in both stmmac_init_rx_buffers()
and stmmac_rx_refill().  The matching change is in stmmac_rx(), which now
passes buf->page_offset instead of 0 when adding the buf2 fragment.

The commit message enumerates five specific "In addition" items but does not
mention this one.  Could it be listed too?  It affects hardware addressing
for every split-header RX frame, XDP attached or not.

> @@ -5735,6 +5737,70 @@ static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
>  	return failure ? limit : (int)count;
>  }
>  
> +static void
> +stmmac_xdp_put_buff(struct stmmac_rx_queue *rx_q, struct xdp_buff *xdp,
> +		    int sync_len)
> +{
> +	struct skb_shared_info *sinfo = xdp_get_shared_info_from_buff(xdp);
> +	int i;
> +
> +	if (likely(!xdp_buff_has_frags(xdp)))
> +		goto out;
> +
> +	for (i = 0; i < sinfo->nr_frags; i++)
> +		page_pool_put_full_page(rx_q->page_pool,
> +					skb_frag_page(&sinfo->frags[i]), true);
> +out:
> +	page_pool_put_page(rx_q->page_pool, virt_to_head_page(xdp->data),
> +			   sync_len, true);
> +}

[Severity: High]
Does anything release the pages owned by rx_q->state.xdp when the RX
resources are torn down?

Once a descriptor is consumed stmmac_rx() does buf->page = NULL and
buf->sec_page = NULL, so the parked xdp_buff is the only owner of those
pages.  The teardown path only walks buf_pool:

stmmac_disable_rx_queue()
  stmmac_stop_rx_dma()
  __free_dma_rx_desc_resources()
     dma_free_rx_skbufs()        /* buf_pool entries only */
     page_pool_destroy()

so page_pool_destroy() runs with the saved frame's head and fragment pages
still inflight, and the pool shutdown never completes.

Also, stmmac_enable_rx_queue() installs a fresh page_pool but leaves
state_saved set, so a later poll can restore the old xdp_buff and hand
its pages to this function:

	page_pool_put_full_page(rx_q->page_pool, ...)

which would return pages allocated from the destroyed pool into the new
one.  Should state.xdp be drained and state_saved cleared everywhere RX
resources are freed or re-initialized (ethtool ring resize, MTU change,
stmmac_release(), stmmac_xdp_disable_pool())?

[ ... ]

> +static bool stmmac_build_xdp_frags(struct stmmac_priv *priv,
> +				   struct stmmac_rx_queue *rx_q,
> +				   unsigned int len, struct page *page,
> +				   unsigned int offset,
> +				   enum dma_data_direction dma_dir,
> +				   struct xdp_buff *xdp)
> +{
> +	dma_addr_t dma_addr = page_pool_get_dma_addr(page) + offset;
> +
> +	dma_sync_single_for_cpu(priv->device, dma_addr, len, dma_dir);
> +	if (!xdp_buff_add_frag(xdp, page_to_netmem(page), offset, len,
> +			       xdp->frame_sz)) {
> +		page_pool_put_full_page(rx_q->page_pool, page, true);
> +		return false;
> +	}
> +
> +	return true;
> +}

[ ... ]

> @@ -5780,9 +5847,10 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
>  		u32 hash;
>  
>  		if (!count && rx_q->state_saved) {
> -			skb = rx_q->state.skb;
> +			ctx.xdp = rx_q->state.xdp;
>  			error = rx_q->state.error;
>  			len = rx_q->state.len;
> +			first_desc = false;
>  		} else {
>  			rx_q->state_saved = false;
>  			skb = NULL;

[Severity: High]
Can rx_q->state.xdp be restored here without ever having been written?

state_saved is shared with stmmac_rx_zc(), which still sets it while only
writing error and len:

	if (status & rx_not_ls) {
		rx_q->state_saved = true;
		rx_q->state.error = error;
		rx_q->state.len = len;
	}

Nothing outside the two RX loops clears state_saved, so it survives an
AF_XDP pool detach:

stmmac_xdp_disable_pool()
  stmmac_disable_rx_queue()
  stmmac_enable_rx_queue()
     stmmac_reset_rx_queue()    /* cur_rx/dirty_rx only */

The next non-ZC poll then takes this branch with a zeroed (or stale)
xdp_buff and first_desc = false, and the first descriptor goes through
stmmac_build_xdp_frags() -> xdp_buff_add_frag(), where
xdp_get_shared_info_from_buff() computes:

	xdp->data_hard_start + xdp->frame_sz - SKB_DATA_ALIGN(sizeof(*sinfo))

With data_hard_start == NULL and frame_sz == 0 that write lands at a small
negative address.  If instead the restored frame terminates on the first
descriptor, stmmac_xdp_run_prog() and napi_build_skb() are called with a
NULL buffer.

The same flag also survives stmmac_resume() -> stmmac_reset_queues_param(),
which re-arms every descriptor while leaving state_saved set, so the first
post-resume poll would append unrelated descriptors to the pre-suspend
buff with the stale len and error.

Would it make sense for stmmac_rx_zc() to stop sharing this flag, and for
the teardown/resume paths to clear it?

[ ... ]

> @@ -5820,21 +5888,21 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
>  
>  		if (priv->extend_desc)
>  			stmmac_rx_extended_status(priv, &priv->xstats, rx_q->dma_erx + entry);
> +
>  		if (unlikely(status == discard_frame)) {
> -			page_pool_put_page(rx_q->page_pool, buf->page, 0, true);
> -			buf->page = NULL;
>  			error = 1;
>  			if (!priv->hwts_rx_en)
>  				rx_errors++;
>  		}

[Severity: Medium]
This is a pre-existing issue and was not introduced by this patch, but
should this be a bitwise test rather than an equality test?

dwmac4_wrback_get_rx_status() can return a composite value:

	ret = discard_frame;
	...
	if (rdes1 & RDES1_IP_HDR_ERROR) {
		x->ip_hdr_err++;
		ret |= csum_none;
	}

A descriptor reporting both gives discard_frame | csum_none, the equality
fails, error stays 0, and the errored frame is assembled and passed up with
CHECKSUM_NONE while rx_errors is not counted.  Would
"status & discard_frame" cover the combined case?

[Severity: Medium]
This isn't introduced by this patch either, but is a barrier missing
between the OWN-bit test earlier in this loop and the consumption of the
write-back fields?

	status = stmmac_rx_status(priv, &priv->xstats, p);
	/* check if managed by the DMA otherwise go ahead */
	if (unlikely(status & dma_own))
		break;

dwmac4_wrback_get_rx_status() even loads des1/des2 before testing
RDES3_OWN, and there is no dma_rmb() before stmmac_rx_buf1_len() /
stmmac_rx_buf2_len() re-read the descriptor.  The TX clean path in this
file has the corresponding barrier with the comment "Make sure descriptor
fields are read after reading the own bit".  This patch makes those
lengths drive xdp_buff_add_frag() sizes, so a stale length would size a
fragment over bytes the DMA has not delivered yet.

[ ... ]

> @@ -5855,9 +5923,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
>  			}
>  		}
>  
> -		if (!skb) {
> -			unsigned int pre_len, sync_len;
> -
> +		if (first_desc) {
>  			dma_sync_single_for_cpu(priv->device, buf->addr,
>  						buf1_len, dma_dir);
>  			net_prefetch(page_address(buf->page) +

[Severity: High]
This problem wasn't introduced by this patch, but the fragment lengths it
now feeds to xdp_buff_add_frag() come from stmmac_rx_buf1_len(), which does
not subtract the accumulated length on the last descriptor:

	plen = stmmac_get_rx_frame_len(priv, p, coe);

	/* First descriptor and last descriptor and not split header */
	return min_t(unsigned int, priv->dma_conf.dma_buf_sz, plen);

Compare stmmac_rx_buf2_len(), which documents the requirement:

	/* Thus 'plen - len' always gives the correct length of buf2. */

At MTU 1500 dma_buf_sz is 1536 while the MAC accepts much larger frames
(dwmac4 sets GMAC_CONFIG_JE unconditionally, XGMAC programs GPSL to 16368),
so a 3000-byte frame arrives as 1536 bytes with rx_not_ls plus 1464 bytes
on the last descriptor, yet the helper returns min(1536, 3000) = 1536.

Does that make stmmac_build_xdp_frags() attach a 1532-byte fragment (after
the FCS strip) and stmmac_build_skb() deliver a 3068-byte skb, whose
trailing bytes are the previous contents of the recycled page_pool page?
len and rx_bytes would be off by the same amount.

[Severity: High]
Also pre-existing rather than new here, but the manual FCS strip just above
only checks for a non-zero length before subtracting:

		if (buf2_len) {
			buf2_len -= ETH_FCS_LEN;
			len -= ETH_FCS_LEN;
		} else if (buf1_len) {
			buf1_len -= ETH_FCS_LEN;

With split-header active the last descriptor's payload length is computed
as "plen - len", which a remote peer can make 1, 2 or 3 by choosing the
frame length.  Does the unsigned subtraction then wrap to roughly 4 GiB,
and does that value reach:

	dma_sync_single_for_cpu(priv->device, dma_addr, len, dma_dir);
	if (!xdp_buff_add_frag(xdp, page_to_netmem(page), offset, len,
			       xdp->frame_sz)) {

xdp_buff_add_frag() validates the fragment count but not that the size
fits the allocation, so the huge value would also be recorded in
xdp_frags_size.

> @@ -5866,6 +5932,33 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
>  			xdp_init_buff(&ctx.xdp, bufsz, &rx_q->xdp_rxq);
>  			xdp_prepare_buff(&ctx.xdp, page_address(buf->page),
>  					 buf->page_offset, buf1_len, true);
> +			first_desc = false;
> +			buf->page = NULL;
> +		} else if (buf1_len) {
> +			error |= !stmmac_build_xdp_frags(priv, rx_q, buf1_len,
> +							 buf->page,
> +							 buf->page_offset,
> +							 dma_dir, &ctx.xdp);
> +			buf->page = NULL;
> +		}
> +
> +		if (buf2_len) {
> +			error |= !stmmac_build_xdp_frags(priv, rx_q, buf2_len,
> +							 buf->sec_page,
> +							 buf->page_offset,
> +							 dma_dir, &ctx.xdp);
> +			buf->sec_page = NULL;
> +		}

[Severity: High]
Two things look out of sync with the multi-buffer contract now that
fragments are attached before stmmac_xdp_run_prog() runs.

stmmac_dvr_probe() still advertises:

	ndev->xdp_features = NETDEV_XDP_ACT_BASIC | NETDEV_XDP_ACT_REDIRECT |
			     NETDEV_XDP_ACT_XSK_ZEROCOPY;

so NETDEV_XDP_ACT_RX_SG is missing while the driver does deliver
scatter-gather xdp_buffs.  Should it be added?

stmmac_xdp_set_prog() also only gates on the MTU:

	if (prog && dev->mtu > ETH_DATA_LEN) {
		...
		return -EOPNOTSUPP;
	}

There is no prog->aux->xdp_has_frags check, so a program built without
multi-buffer support is now invoked on an xdp_buff with
XDP_FLAGS_HAS_FRAGS set whose data_end only covers the first descriptor.
Since dwmac4 accepts frames well above dma_buf_sz even at MTU 1500, is
that reachable with the currently allowed MTU?

[ ... ]

> @@ -5989,13 +6036,24 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
>  		rx_packets++;
>  		rx_bytes += len;
>  		count++;
> +		continue;
> +error_free_frag:
> +		if (!first_desc) {
> +			stmmac_xdp_put_buff(rx_q, &ctx.xdp, -1);
> +			first_desc = true;
> +		}
> +		dev_kfree_skb(skb);
> +		skb = NULL;
> +		count++;
>  	}

[Severity: Medium]
Should this label also bump rx_dropped or rx_errors?

For the newly added drop reason -- stmmac_build_xdp_frags() returning false
because the frame needs more than MAX_SKB_FRAGS fragments -- the path is:

	error |= !stmmac_build_xdp_frags(...);
	...
	if (unlikely(error))
		goto error_free_frag;

and the label only does stmmac_xdp_put_buff() + dev_kfree_skb() + count++.
The frame then disappears with only rx_pkt_n moving, whereas the other
software drops in this function (the XDP_CONSUMED verdict and the
stmmac_build_skb() failure) both increment rx_dropped.

>  
> -	if (status & rx_not_ls || skb) {
> -		rx_q->state_saved = true;
> -		rx_q->state.skb = skb;
> -		rx_q->state.error = error;
> -		rx_q->state.len = len;
> +	if (count || !first_desc) {
> +		rx_q->state_saved = !first_desc;
> +		if (!first_desc) {
> +			rx_q->state.xdp = ctx.xdp;
> +			rx_q->state.error = error;
> +			rx_q->state.len = len;
> +		}
>  	}
>  
>  	stmmac_finalize_xdp_rx(priv, xdp_status);

Thanks for looking at these.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260921-stmmac-rx-mb-v2-1-6e826e1ff306%40oss.qualcomm.com

