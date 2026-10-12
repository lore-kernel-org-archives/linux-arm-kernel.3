Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E23D5CA9EDC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 21:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IbKQHaL15IUAgz6gMc8xEIM/r+aSlaz4R8KarTD/aas=; b=cdmSXChq7HliY/WJ4PU21atDpU
	Jn0CEuoEt8OIaWfOcZQqKzaApVdYfj7RoWzJQi28cCvYTj/2eC0yboFxKvXEjrzQJMUgo/oqjD2fO
	OUsjGsnezg30NnSpjZQIhjOAUb0/Pzy8qNrfyq1atgtZj2l+VsNbRkFRpayu5P4YXsMfaduW66HnU
	DkzDyVQApx3/KtNEisYBCWtp3Md/7u4LuloSdZEeNxtLlgwB/GVP0wnaKLDw+W8x43dzE0BiENUAl
	qtBM4/HzHXU4ESzvYW5C8nRLHGrSC/dp0sa65w2FnnVjH8nOGGRYdJYRwPGgYpcZOO1ZAKV5xWeWb
	EEzeURnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGNI9-0000000BWiL-1wSC;
	Mon, 12 Oct 2026 21:10:41 +0000
Received: from mail.tipi-net.de ([194.13.80.246])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGNI6-0000000BWhx-3Oww
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 21:10:40 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 60030A1552;
	Mon, 12 Oct 2026 23:10:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1791839435; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=IbKQHaL15IUAgz6gMc8xEIM/r+aSlaz4R8KarTD/aas=;
	b=exsQC4Fz62WtG3a/PE/+jGyO1V/xpDMuZusuTaHMGUHVgP0hxZqAX+pQ1+2cALZuZdAZ3K
	zAq2XQaWU/4wq0QVFVJTajOO+zkhol+rVkJMYkclagjWTTmkfGlTv6SgurqyPPj2c/Jcc5
	5dzaIs9d8p1N5Xh2iqjlbafIq5iJJxDSWq2Joci+7gCn7KN80rXT8RcKiGySIYPJWNnX9C
	deqEZU12zDht7G6VHfAGpnT1hNbL1w1SD74DdaOB7W3OQ9xU7sX4ubCPJaTgIswNnr/dHc
	/moY5t52JcC0sp+ivSdYEuqDV7AG5CSNsfgQRLxjo8fLsGmp2JFYGE9AGpu9Vw==
MIME-Version: 1.0
Date: Mon, 12 Oct 2026 23:10:30 +0200
From: Nicolai Buchwitz <nb@tipi-net.de>
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer
 <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, Stanislav
 Fomichev <sdf@fomichev.me>, Jose Abreu <Jose.Abreu@synopsys.com>, Ong Boon
 Leong <boon.leong.ong@intel.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org
Subject: Re: [PATCH net-next v6 4/4] net: stmmac: rework stmmac_rx to support
 XDP rx multi-buff
In-Reply-To: <20261012-stmmac-rx-mb-v6-4-2225050915c1@oss.qualcomm.com>
References: <20261012-stmmac-rx-mb-v6-0-2225050915c1@oss.qualcomm.com>
 <20261012-stmmac-rx-mb-v6-4-2225050915c1@oss.qualcomm.com>
Message-ID: <9bf19616bc6fd8680e65272f45d14239@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_141039_174605_481735AA 
X-CRM114-Status: GOOD (  31.67  )
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

Hi Lorenzo

On 12.10.2026 18:44, Lorenzo Bianconi wrote:
> Build the xdp_buff by accumulating all the descriptors that make up a
> frame, so the XDP program runs on the full (possibly fragmented) packet
> instead of just the first buffer. When the frame is not consumed by the
> program, assemble the skb from the head buffer and the collected
> fragments via napi_build_skb()/xdp_update_skb_frags_info().
> 
> Note that XDP still rejects an MTU larger than ETH_DATA_LEN
> (stmmac_xdp_set_prog(), stmmac_change_mtu()) and disables SPH, so an
> ordinary frame fits in a single buffer. This path is therefore 
> exercised
> by frames that do span several descriptors (for example jumbo frames 
> the
> MAC admits through its jumbo-enable bit) and is groundwork for 
> extending
> XDP to jumbo/SPH; it does not enable XDP jumbo support by itself.
> 
> For those multi-descriptor frames the old code was buggy as well: it 
> ran
> the XDP program once per descriptor buffer, so for a multi-descriptor
> frame the program was also invoked on continuation buffers holding
> mid-frame payload. It also subtracted ETH_FCS_LEN from the first buffer
> even when it was not the last descriptor (its second buffer empty),
> dropping four bytes from the middle of the frame while marking the FCS 
> as
> already stripped and skipping the final pskb_trim(). Accumulating the
> whole frame before running XDP fixes both.

With patch 3/4 applied, these frames are already dropped in XDP mode,
so this paragraph no longer matches the code this patch changes?

> 
> To do so, store the in-progress xdp_buff in rx_q->state instead of the
> partially built skb, so the accumulated head and fragments survive a
> NAPI poll boundary (mid-frame dma_own or dirty_rx break). The state is
> saved only while a frame is in progress and cleared once it completes,
> leaving it untouched when the poll does not process anything (e.g.
> netpoll invoked with a zero budget).
> 
> In addition:
> - advertise NETDEV_XDP_ACT_RX_SG, since the RX path can now deliver
>   non-linear buffers to XDP;
> - drop multi-buffer frames when the attached program was not loaded 
> with
>   BPF_F_XDP_HAS_FRAGS, since a single-buffer program must not be handed 
> a
>   non-linear xdp_buff;
> - build the skb head with napi_build_skb() passing xdp->frame_sz, so
>   skb_shinfo() lands on the same shared_info the fragments were
>   accumulated into;
> - carry the XDP metadata written with bpf_xdp_adjust_meta() into the 
> skb
>   via skb_metadata_set(), so it is no longer dropped and TC/BPF 
> programs
>   can read it through data_meta;
> - attach fragments with xdp_buff_add_frag(), which initializes all the
>   shared_info fields and takes care of the pfmemalloc bit;
> - release the buffers collected in the xdp_buff when a frame is dropped
>   on RX errors; the previous code relied on dev_kfree_skb() recycling 
> the
>   skb frags, which no longer applies now that the head and fragments 
> live
>   in an xdp_buff rather than a partially built skb;
> - drop the whole frame when it would exceed MAX_SKB_FRAGS, where the
>   previous skb_add_rx_frag() calls were unbounded;
> - strip the Ethernet FCS from the accumulated xdp_buff with a
>   driver-local tail shrink (stmmac_xdp_shrink_tail()) for both linear
>   and fragmented frames, instead of trimming the skb or the first
>   descriptor length.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
> ---

> [...]

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c 
> b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c

> [...]

> +static void
> +stmmac_xdp_put_buff(struct stmmac_rx_queue *rx_q, struct xdp_buff 
> *xdp,
> +		    int sync_len, bool allow_direct)

This looks like xdp_return_buff(), apart from the sync length of the
first buffer. Could the NAPI paths (XDP_CONSUMED and error_free_frag)
use xdp_return_buff() instead? The teardown paths need allow_direct =
false, so they would still need something local.

> +{
> +	struct skb_shared_info *sinfo = xdp_get_shared_info_from_buff(xdp);
> +	int i;
> +
> +	if (likely(!xdp_buff_has_frags(xdp)))
> +		goto out;
> +
> +	for (i = 0; i < sinfo->nr_frags; i++)
> +		page_pool_put_full_page(rx_q->page_pool,
> +					skb_frag_page(&sinfo->frags[i]),
> +					allow_direct);
> +out:
> +	page_pool_put_page(rx_q->page_pool, virt_to_head_page(xdp->data),
> +			   sync_len, allow_direct);
> +}
> +
> +static struct sk_buff *stmmac_build_skb(struct xdp_buff *xdp)
> +{

This is very close to xdp_build_skb_from_buff(). Have you checked if 
this might
be a fit?

> +	struct skb_shared_info *sinfo = xdp_get_shared_info_from_buff(xdp);
> +	u32 metasize = xdp->data - xdp->data_meta;
> +	struct sk_buff *skb;
> +	u8 num_frags = 0;
> +
> +	if (unlikely(xdp_buff_has_frags(xdp)))
> +		num_frags = sinfo->nr_frags;
> +
> +	skb = napi_build_skb(xdp->data_hard_start, xdp->frame_sz);
> +	if (!skb)
> +		return NULL;
> +
> +	skb_mark_for_recycle(skb);
> +	skb_reserve(skb, xdp->data - xdp->data_hard_start);
> +	skb_put(skb, xdp->data_end - xdp->data);
> +	if (metasize)
> +		skb_metadata_set(skb, metasize);
> +
> +	if (unlikely(xdp_buff_has_frags(xdp)))
> +		xdp_update_skb_frags_info(skb, num_frags, sinfo->xdp_frags_size,
> +					  num_frags * xdp->frame_sz,
> +					  xdp_buff_get_skb_flags(xdp));
> +	return skb;
> +}

> [...]

> +static int stmmac_xdp_shrink_tail(struct stmmac_rx_queue *rx_q,
> +				  struct xdp_buff *xdp, int offset)

This is only used to drop the FCS. On the last descriptor we already
know the frame length, so could the 4 bytes be taken off buf1_len /
buf2_len before the buffers are added? Then only the rare case where
the last buffer has fewer than 4 bytes would need to trim the previous
frag, and this helper could go away.

> [...]

Thanks,
Nicolai

