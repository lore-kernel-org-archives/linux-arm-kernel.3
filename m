Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A0B4CA6015
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 22:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M9TqBZxaUzksUyOlcNYVIPYjBwH9t5EqBxtLbuk/h/s=; b=iQ8eqpk3jAHiOFs2cpOiWSK/S9
	jS1Y0kymG2PEAGSGerIpE+RTxFj6WNCrH3REqnIyj0CCb9gpYypWLhN7SGkm0qZG/Io/LlbQsz/8A
	8P3O0/4VL4ys4bBzsiBb81YNR/iJA1+7bH/F8Ht5xLV+jzdgm1sBe+kYywuD4FvHuBIZJS2Yi8Pz/
	JHOFrbbzuasWXEpqb/yD7OLL2Ov7Gsjy6HA7z2xUAoTu9rvlqazaHVYk7fmpj8FYczT4x8f9OpLQZ
	SzBdhvK8qTzsEyDYSNNF6qySTnPlCBDIKVG+H9PbAQh8wC1e095gA19RH4IuG+BuroDRfOpvT6J9Y
	Rk4S9+0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEwDQ-000000056uf-42ed;
	Thu, 08 Oct 2026 22:03:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEwDO-000000056uT-3mMI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 22:03:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0DB5660D9A;
	Thu,  8 Oct 2026 22:03:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C19631F000FF;
	Thu,  8 Oct 2026 22:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791497029;
	bh=M9TqBZxaUzksUyOlcNYVIPYjBwH9t5EqBxtLbuk/h/s=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=kJShRurTZI0qoySyHOdc5/xqt7gNcTAUv+p67pWEltQh1qgfwx2glUECgE8rYDvbH
	 i5Fu4DRx4MoXpvEANrncPzPsRn6SZBzDqjnSalIOyUad9FWuazlWAvaH7yd1uk5F9y
	 VOxR+bXfCInDdgiJDMwiYANHBrcs60yV6eWbg1oZsc+S64QONqnWQ/YTeLUU7qIuN0
	 JlwPGGAiqEjoQCop0d/ec5x1GVKtXAXi/Y8KUSxijPWMKMBjy6ihvjS0jxbF+OE7c7
	 t0sDjoPl829SrM87I+2f4MVFxXBYCRz8pGBEvSsH+K3LIzW5nOil6ZA6wScYiipdAo
	 kF2dbtEnkXEAw==
Subject: Re: [PATCH net-next v4 1/2] net: stmmac: take ownership of saved RX
 state at poll entry
From: netdev-bot+sashiko@kernel.org
To: lorenzo.bianconi@oss.qualcomm.com
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, ast@kernel.org,
 daniel@iogearbox.net, hawk@kernel.org, john.fastabend@gmail.com,
 sdf@fomichev.me, Jose.Abreu@synopsys.com, boon.leong.ong@intel.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org
Date: Thu, 08 Oct 2026 22:03:48 +0000
Message-ID: <179149702833.434549.9158656960490952093@kernel.org>
In-Reply-To: <20261006-stmmac-rx-mb-v4-1-efa4ca974e3d@oss.qualcomm.com>
References: <20261006-stmmac-rx-mb-v4-1-efa4ca974e3d@oss.qualcomm.com>
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 0 (2) · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] At this commit, stmmac_rx() handles an XDP non-PASS verdict
  (STMMAC_XDP_CONSUMED, plus TX/REDIRECT) with `goto next` even when the…
- [Low] The commit message suggests that releasing the saved partial skb
  at teardown already existed.

Pre-existing issues:
- [Medium] In stmmac_rx_zc(), the 'XSK pool expects RX frame 1:1 mapped
  to XSK buffer' branch handles a non-last descriptor (rx_not_ls) by…
- [Medium] In stmmac_rx() at this commit, if napi_build_skb() fails on a
  first descriptor that has rx_not_ls set, the code recycles the page,…

--

net: stmmac: take ownership of saved RX state at poll entry

This patch changes stmmac_rx() and stmmac_rx_zc() so that each poll takes
the saved partial-frame state at entry and clears it right away. The state
is saved again only if the frame is still incomplete. The saved skb is also
freed, and state_saved cleared, in stmmac_reset_rx_queue() and
__free_dma_rx_desc_resources().

> The saved state is also dropped when the queue parameters are reset, not
> only when the ring is destroyed: stmmac_reset_rx_queue() is reached from
> __stmmac_open(), stmmac_xdp_open(), stmmac_resume() and
> stmmac_enable_rx_queue(). Otherwise a partial frame saved before suspend
> (or before a queue is disabled and re-enabled) survives while cur_rx and
> dirty_rx are re-armed, and the first poll resumes that stale skb with
> descriptors from the freshly initialized ring. Teardown still releases it
> in __free_dma_rx_desc_resources().

[Severity: Low]
Is the last sentence accurate? Before this patch,
__free_dma_rx_desc_resources() did not free rx_q->state.skb or clear
rx_q->state_saved. Nothing outside stmmac_rx() referenced state.skb.

The first hunk of this patch is what adds the teardown release:

+	dev_kfree_skb_any(rx_q->state.skb);
+	rx_q->state.skb = NULL;
+	rx_q->state_saved = false;

That hunk seems to fix a separate problem. A partial skb leaked on close or
MTU change. A stale state_saved/state.skb also survived
stmmac_disable_rx_queue() and stmmac_enable_rx_queue() after the page_pool
had been destroyed.

Could the commit message describe this as part of the fix, rather than as
existing behaviour?

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 0cfd14d240022..28e9f8438f93f 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c

[ ... ]

> @@ -5665,6 +5672,7 @@ static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
>  
>  		if (unlikely(error && (status & rx_not_ls)))
>  			goto read_again;
> +
>  		if (unlikely(error)) {
>  			count++;
>  			continue;

[Severity: Medium]
This is a pre-existing issue, not one introduced by this patch. It is in
the continuation handling this patch reworks. Just below, a non-last
descriptor is handled like this:

		/* XSK pool expects RX frame 1:1 mapped to XSK buffer */
		if (likely(status & rx_not_ls)) {
			xsk_buff_free(buf->xdp);
			buf->xdp = NULL;
			dirty++;
			count++;
			goto read_again;
		}

This branch sets neither error nor len. Won't the last descriptor of the
frame then pass both error checks with len still 0?

In that case, stmmac_rx_buf1_len(priv, p, status, 0) returns
min(dma_buf_sz, plen). For a multi-descriptor frame that is dma_buf_sz.
The tail is then run through XDP and delivered as a complete frame,
either by XDP_PASS through stmmac_dispatch_skb_zc() or by redirect to the
XSK. That frame starts in the middle of the real frame and is padded with
stale UMEM bytes.

The same thing happens across polls. The save at the end of stmmac_rx_zc()
records state.error = 0 and state.len = 0 for this continuation.

Should the rest of this frame be marked for discard here?

[ ... ]

> @@ -5909,24 +5922,12 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
>  							   sync_len, true);
>  					buf->page = NULL;
>  					rx_dropped++;
> -
> -					/* Clear skb as it was set as
> -					 * status by XDP program.
> -					 */
> -					skb = NULL;
> -
> -					if (unlikely((status & rx_not_ls)))
> -						goto read_again;
> -
> -					count++;
> -					continue;
> +					goto next;

[Severity: High]
Before this change, an STMMAC_XDP_CONSUMED verdict on a descriptor with
rx_not_ls set went back to read_again and kept the running len. Now it
jumps to next:, which does this:

next:
		in_progress = false;
		skb = NULL;
		count++;

The top of the loop then resets the length:

		if (!in_progress) {
			skb = NULL;
			error = 0;
			len = 0;
		}

Doesn't this make the remaining descriptors of the same hardware frame get
parsed as a new frame? The STMMAC_XDP_TX/STMMAC_XDP_REDIRECT branch below
also reaches next: in the same state.

Here is an example on a core with buf2 (dwmac4/xgmac, dma_buf_sz = 1536,
order-0 sec_page). Jumbo frames are accepted there because GMAC_CORE_INIT
includes GMAC_CONFIG_JE. Take a 9000 byte frame whose first descriptor is
dropped by XDP:

  - The second descriptor is treated as a frame start, which leaves len at
    3072.
  - On the last descriptor, stmmac_rx_buf1_len() returns 1536.
  - stmmac_rx_buf2_len() then returns 9000 - 4608 = 4392 from this line:

	return plen > len ? plen - len : 0;

Would skb_add_rx_frag() on buf->sec_page with 4392 bytes then cover more
than the 4096 byte page? Only 1320 of those bytes are valid, so stale
page_pool data would reach the stack.

Mid-frame data would also go to XDP and to the stack as a separate frame.

The follow-up commit "net: stmmac: rework stmmac_rx to support XDP rx
multi-buff" seems to address this, since it runs XDP only after the last
descriptor. This patch has Fixes: tags and could be backported on its own.
Could the rx_not_ls continuation for the STMMAC_XDP_CONSUMED case be kept
in this patch?

[ ... ]

> @@ -5983,10 +5984,8 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
>  		/* Remove FCS if needed */
>  		if (!fcs_stripped && pskb_trim(skb, len)) {
>  			dev_kfree_skb_any(skb);
> -			skb = NULL;
>  			rx_dropped++;
> -			count++;
> -			continue;
> +			goto next;
>  		}
>  
>  		stmmac_get_rx_hwtstamp(priv, p, np, skb);

[Severity: Medium]
This isn't a bug introduced by this patch, but there is a related frame
boundary problem earlier in stmmac_rx(). Suppose napi_build_skb() fails on
the first descriptor of a frame that has rx_not_ls set:

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

When the code goes back to read_again, error is still 0 and skb is NULL.
Won't the next descriptor of the same frame take the !skb path again? That
would run XDP on mid-frame data and build a new skb from the remaining
fragments.

If that second allocation succeeds, a truncated frame is delivered. The
pskb_trim(skb, len) check above doesn't catch it, because pskb_trim()
returns 0 when len is larger than skb->len:

	return (len < skb->len) ? __pskb_trim(skb, len) : 0;

The follow-up commit "net: stmmac: rework stmmac_rx to support XDP rx
multi-buff" removes this path. It calls stmmac_build_skb() only after the
last descriptor and sends failures to error_free_frag.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261006-stmmac-rx-mb-v4-0-efa4ca974e3d%40oss.qualcomm.com

