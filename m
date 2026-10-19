Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD740606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 17:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vVmIMQNc;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KLxwrvaA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OhYDrX64R6g4NIIcUmBdVZ5TPioNZZovMeTZXST8PaY=; b=vVmIMQNc9QvEgfCc586Mdinxy3
	2nFHxAlR4xUtG95k6M7Of9tp27JmBLl6ii+uoIkUP2hFUu4khbBfLp3+L+UwQ4XdvSa9prTCGEDn6
	p3xP0a8lzolf4gnXJyW5T15pE/XQZMiFgZ6rnyQ2yheMpfA7zFKaSOKyfmg+DNbfS+XW6yikiN3F4
	qgIJjJXuDGThN44TO1KIHkg5Vp2lRZzlmcx4BzoAuMwQLP84ut0PryeFF080Dc+hd7DOlQXenILB4
	KR0F+92RvXVyjH72AA1p50KU5ovNkh5tURWC1kw6NdqeKk8/D/W5G8v0q/Ut3IzJxfGPkgMc+FPdd
	7/6CZgzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIrJl-000000085v5-1Xyc;
	Mon, 19 Oct 2026 17:38:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIrJk-000000085uh-07yx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 17:38:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F12BA602A8;
	Mon, 19 Oct 2026 17:38:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96FBF1F000C6;
	Mon, 19 Oct 2026 17:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792431514;
	bh=OhYDrX64R6g4NIIcUmBdVZ5TPioNZZovMeTZXST8PaY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=KLxwrvaA/6JqtvkzyPD62LRueq9U06zH6SLQPLcJlwxWipwfTi4c21FsVPgskv9Vd
	 FtKWGNSFJMYlON/T0yUFBCakXmsJVbolPfxGMitXwloWJ+hB5N36QTub7/gmQ+tiVG
	 gHGW+cimBUZwCVuTR/mEousnLGNpTHA1M1FjiP8O2m8N6dyjilhNGr5PChbb+UAI+Q
	 e2Sewrcz/mcmXqjDPF4ZcoOUUq1S9i9bPUG03gnce6rmpJTQMjnkCQOWVYc954e4q5
	 cKTO1c67kKsZtmWt7NJ6aZcZTA+Yfe8Yh30XzglmdhB9DZZSJ37b2J+n3+GMJZes/V
	 YFsW0xUaSRK6Q==
Subject: Re: [PATCH net-next v8 1/5] net: stmmac: take ownership of saved RX
 state at poll entry
From: netdev-bot+sashiko@kernel.org
To: lorenzo.bianconi@oss.qualcomm.com
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, ast@kernel.org,
 daniel@iogearbox.net, hawk@kernel.org, john.fastabend@gmail.com,
 sdf@fomichev.me, Jose.Abreu@synopsys.com, boon.leong.ong@intel.com,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 bpf@vger.kernel.org
Date: Mon, 19 Oct 2026 17:38:33 +0000
Message-ID: <179243151310.3135.16032115262445521338@kernel.org>
In-Reply-To: <20261018-stmmac-rx-mb-v8-1-5f58c0b25849@oss.qualcomm.com>
References: <20261018-stmmac-rx-mb-v8-1-5f58c0b25849@oss.qualcomm.com>
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
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The authorship and Signed-off-by chain disagree.

Pre-existing issues:
- [High] At this commit, stmmac_rx() still uses `skb == NULL` to decide
  that a descriptor starts a new frame.
- [High] This problem wasn't introduced by this patch, but the commit
  message relies on it being absent.

--

net: stmmac: take ownership of saved RX state at poll entry

This commit makes stmmac_rx() and stmmac_rx_zc() take the saved
partial-frame state at poll entry. A new in_progress flag tracks whether
a frame is still incomplete, and the state is saved again only in that
case. It also frees the saved skb in stmmac_reset_rx_queue() and in
__free_dma_rx_desc_resources().

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>
> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

[Severity: Low]
This isn't a bug, but the author field and the Signed-off-by chain don't
match. The commit author is Lorenzo Bianconi. The first Signed-off-by is
James Hilliard, and there is no Co-developed-by tag.

If James wrote the patch, should it carry a "From: James Hilliard
<james.hilliard1@gmail.com>" line so git credits him as the author? If
Lorenzo is the author, does James's sign-off need a matching
Co-developed-by tag?

The other patches in the series carry only Lorenzo's sign-off. That
suggests this patch was written by James and picked into the series.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 53782ab55e125..8fd2acb25fb60 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c

[ ... ]

> @@ -5958,9 +5970,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
>  						      STMMAC_XDP_REDIRECT)) {
>  					xdp_status |= xdp_res;
>  					buf->page = NULL;
> -					skb = NULL;
> -					count++;
> -					continue;
> +					goto next;
>  				}
>  			}
>  		}

[Severity: High]
This is a pre-existing issue, and this patch doesn't change how it
behaves. What happens here when the XDP verdict is taken on a descriptor
that still has rx_not_ls set?

stmmac_rx() uses skb == NULL to mean a new frame is starting. The goto
next now also clears in_progress, and error stays 0. The remaining
descriptors of the same hardware frame would then each be handled as the
first descriptor of a new frame.

The XDP_CONSUMED branch just above has the same shape:

	skb = NULL;

	if (unlikely((status & rx_not_ls)))
		goto read_again;

So does the napi_build_skb() failure path:

	if (!skb) {
		page_pool_recycle_direct(rx_q->page_pool,
					 buf->page);
		buf->page = NULL;
		rx_dropped++;
		count++;
		goto drain_data;
	}

In each of these three cases, could the middle and tail descriptors be
passed to XDP and built into an skb with a stale or zero len? Could
buf1_len then underflow and produce an skb length near 4G?

An on-link peer can reach this by sending a frame that spans several
descriptors while an XDP program returns a non-PASS verdict. A
napi_build_skb() failure on such a frame reaches it too.

Later patches in this series seem to fix it. "net: stmmac: drop
multi-buffer frames in XDP mode" sets error on non-last descriptors when
XDP is attached. "net: stmmac: rework stmmac_rx to support XDP rx
multi-buff" runs XDP and stmmac_build_skb() only on the last descriptor
and sends build failures to error_free_frag.

[ ... ]

> @@ -8399,6 +8408,9 @@ static void stmmac_reset_rx_queue(struct stmmac_priv *priv, u32 queue)
>  {
>  	struct stmmac_rx_queue *rx_q = &priv->dma_conf.rx_queue[queue];
>  
> +	dev_kfree_skb_any(rx_q->state.skb);
> +	rx_q->state.skb = NULL;
> +	rx_q->state_saved = false;
>  	rx_q->cur_rx = 0;
>  	rx_q->dirty_rx = 0;
>  }

[Severity: High]
This isn't a bug introduced by this patch, but the commit message says
that, without this change, the first poll "resumes that stale skb with
descriptors from the freshly initialized ring". Is the ring actually
re-initialized on the stmmac_resume() path?

stmmac_resume() does:

	stmmac_reset_queues_param(priv);

	stmmac_free_tx_skbufs(priv);
	stmmac_clear_descriptors(priv, &priv->dma_conf);

	ret = stmmac_hw_setup(ndev);

None of these calls refills buf_pool or rewrites the descriptor buffer
addresses. stmmac_clear_rx_descriptors() calls stmmac_init_rx_desc() on
every entry. On dwmac4 that only sets the owner bits:

static void dwmac4_rd_init_rx_desc(struct dma_desc *p, int disable_rx_ic,
				   u8 descriptor_mode, int end, int bfsize)
{
	dwmac4_set_rx_owner(p, disable_rx_ic);
}

Suppose stmmac_rx_refill() hit a page_pool allocation failure before
suspend:

		if (!buf->page) {
			buf->page = page_pool_alloc_pages(rx_q->page_pool, gfp);
			if (!buf->page)
				break;
		}

Then the entries between dirty_rx and cur_rx still have buf->page ==
NULL. On resume, cur_rx and dirty_rx are reset to 0 and every descriptor
goes back to the DMA. When one of those entries completes, can
stmmac_rx() call page_address(buf->page) and napi_build_skb() on a NULL
page?

There is a similar problem on dwmac4/xgmac. Descriptors that the hardware
writes back between napi_disable() in stmmac_suspend() and
stmmac_stop_all_dma() have RDES0/RDES1 overwritten with status words.
If those descriptors are given back to the DMA, would it write to a
bogus buffer address?

The resume sequence is the same at the end of the series.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261018-stmmac-rx-mb-v8-0-5f58c0b25849%40oss.qualcomm.com

