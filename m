Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC63606A33D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 17:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QfEKgRcT;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XFVPcxTB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jxLzr0WgWnW5NX5VbKd/AKKIcWzJwAW/qePwa3/vqSE=; b=QfEKgRcTevWpXGNFX0ldxOVL2D
	c1z08XanML0QHKW10apt4q87xUP3PZX8ev4ev+1iAHdW48JYJ3XjiyJfviO4HKuD1KUsiR4rIvzCh
	sxf+m9MQ5ko0tIKf3X+E5z7M5wSN8MWMEnS83G1hEtLWJ1VGr7EnG6/FhbeIcHxj7HvnZv/e17pkh
	IPFSrL7EkTKE4eqC2psWTi5ZG+Q7Ky0vxOIovgkerIFIY3u2sgcqfC+5aqCm5ScT0iq382RE0nlcq
	6cg6y07kqJsJp73EwirxKB0lUWXsjJOCEXlwFuZaWmVcUieCEoZ0jRPyGDJMWM4A0+aD4KH86AnTg
	iXPTOuFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIrJq-000000085wo-2ePs;
	Mon, 19 Oct 2026 17:38:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIrJl-000000085v4-0vPZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 17:38:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9BDEA60534;
	Mon, 19 Oct 2026 17:38:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 560881F000CC;
	Mon, 19 Oct 2026 17:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792431516;
	bh=jxLzr0WgWnW5NX5VbKd/AKKIcWzJwAW/qePwa3/vqSE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=XFVPcxTBBVAMSXbo6YHTCdp9Ti4e3FTz0KD/Zq9VxbAYfRAvGx0FEHPRxb6Gqqw6e
	 d6RQHTNs0PKRUCvTXAIKXt8AlEqiAVKlbEDdqmloe6wDKQbX9nvLXSCotd4BIFwkTg
	 dyOLR1Cyuz68lRa36wAHS8b/cp0V0kfUrhFARqZZSTKI7l6J0uDgVzjnsRH8N8hzva
	 p9Wcz5vM3tx/ZS+TdHVUsJe2DfQ2NbEqH/WRpqrMR6R8bS+RvwevpDF1cijJheX9uj
	 KNF7EpOSTwQkOnNmUqRW1kipY57HIYLpXQoSVWjQNePW0ppWYvsBI3B3L9flJ80QzX
	 xWb77+R15QCCA==
Subject: Re: [PATCH net-next v8 2/5] net: stmmac: drop split frames on AF_XDP
 zero-copy RX
From: netdev-bot+sashiko@kernel.org
To: lorenzo.bianconi@oss.qualcomm.com
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, ast@kernel.org,
 daniel@iogearbox.net, hawk@kernel.org, john.fastabend@gmail.com,
 sdf@fomichev.me, Jose.Abreu@synopsys.com, boon.leong.ong@intel.com,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 bpf@vger.kernel.org
Date: Mon, 19 Oct 2026 17:38:34 +0000
Message-ID: <179243151485.3135.12311252292585825@kernel.org>
In-Reply-To: <20261018-stmmac-rx-mb-v8-2-5f58c0b25849@oss.qualcomm.com>
References: <20261018-stmmac-rx-mb-v8-2-5f58c0b25849@oss.qualcomm.com>
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

- [Low] The patch changes the discard test from `status == discard_frame`
  to `status & discard_frame` in both stmmac_rx() and stmmac_rx_zc().
- [Low] After this patch, stmmac_rx_zc() counts the same event (a frame
  split across RX descriptors on an AF_XDP zero-copy queue) differently…
- [Low] In stmmac_rx_zc() on dwmac4/XGMAC, a split frame can now be
  counted in both rx_dropped and rx_errors.

Pre-existing issues:
- [High] At this commit, stmmac_rx() (non-ZC, XDP attached, GMAC4/XGMAC
  whose non-last descriptors report bare rx_not_ls) still drops a non-…
- [Medium] stmmac_rx_zc() and stmmac_rx() add their local
  rx_dropped/rx_errors into the device-wide `priv->xstats.rx_dropped`…

--

net: stmmac: drop split frames on AF_XDP zero-copy RX

In stmmac_rx_zc(), when the 1:1 XSK mapping check drops a non-last
descriptor, this patch now marks the frame as errored. The rest of the
split frame is then drained, and its tail is no longer handled as a new
frame. The patch also makes the legacy enhanced and normal descriptor
callbacks report rx_not_ls together with discard_frame, and changes the
discard test in stmmac_rx_zc() and stmmac_rx() from == to &.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/enh_desc.c b/drivers/net/ethernet/stmicro/stmmac/enh_desc.c
> index 0512536012251..297e2428a8f9b 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/enh_desc.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/enh_desc.c
> @@ -184,7 +184,7 @@ static int enh_desc_get_rx_status(struct stmmac_extra_stats *x,
>  
>  	if (unlikely(!(rdes0 & RDES0_LAST_DESCRIPTOR))) {
>  		x->rx_length++;
> -		return discard_frame;
> +		return discard_frame | rx_not_ls;
>  	}

[Severity: Low]

With this change and the matching one in ndesc_get_rx_status(), does
stmmac_rx_zc() now count the same split frame differently depending on
the descriptor format?

On dwmac4 and xgmac, dwmac4_wrback_get_rx_status() and
dwxgmac2_get_rx_status() return a bare rx_not_ls for a non-last
descriptor:

	if (likely(!(rdes3 & RDES3_LAST_DESCRIPTOR)))
		return rx_not_ls;

So the frame reaches the new 1:1 mapping drop and rx_dropped is
incremented once.

On dwmac100/dwmac1000, non-last descriptors now carry discard_frame. The
status & discard_frame block in stmmac_rx_zc() runs first and increments
rx_errors for each non-last descriptor (when hwts_rx_en is off). The new
rx_dropped++ in the 1:1 path is never reached on these cores.

An N-descriptor jumbo frame would then show up as 1 rx_dropped on
GMAC4/XGMAC, but as N-1 rx_errors on dwmac1000. Both counters are
exported through stmmac_get_stats64(). Is this asymmetry intended?

The legacy cores already counted rx_errors per descriptor before this
patch; what is new is the different rx_dropped accounting. Later in the
series, "net: stmmac: rework stmmac_rx to support XDP rx multi-buff"
changes stmmac_rx() to test !error && (status & discard_frame), so it
counts once per frame. stmmac_rx_zc() still counts per descriptor at the
end of the series.

[ ... ]

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 8fd2acb25fb60..efa88cd359dac 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c

[ ... ]

> @@ -5715,8 +5718,9 @@ static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
>  		if (likely(status & rx_not_ls)) {
>  			xsk_buff_free(buf->xdp);
>  			buf->xdp = NULL;
> +			rx_dropped++;
> +			error = 1;
>  			dirty++;
> -			count++;
>  			goto read_again;
>  		}
>  

[Severity: Low]

Can one split frame on dwmac4/XGMAC now be counted in both rx_dropped and
rx_errors?

The first non-last descriptor takes this path, which increments
rx_dropped and sets error = 1. Suppose the last descriptor of the same
frame then reports discard_frame (RDES3_ERROR_SUMMARY, for example a CRC
or giant error on an oversized frame). The earlier block in
stmmac_rx_zc() still runs:

		if (unlikely(status & discard_frame)) {
			error = 1;
			if (!priv->hwts_rx_en)
				rx_errors++;
		}

This happens even though error is already set for this frame.
stmmac_get_stats64() exports both totals as rx_dropped and rx_errors.

Later in the series, "net: stmmac: rework stmmac_rx to support XDP rx
multi-buff" avoids this in stmmac_rx() by testing !error && (status &
discard_frame). stmmac_rx_zc() is not changed, so the double count is
still there at the end of the series.

[Severity: Medium]

This is a pre-existing issue and was not introduced by this patch. The
new rx_dropped++ feeds this accumulation at the end of stmmac_rx_zc():

	priv->xstats.rx_dropped += rx_dropped;
	priv->xstats.rx_errors += rx_errors;

These are plain unsigned long fields in struct stmmac_extra_stats,
shared by the whole device. Each RX channel has its own NAPI instance,
so stmmac_rx_zc() and stmmac_rx() can run at the same time for different
queues on different CPUs.

Can these non-atomic read-modify-writes lose updates?
stmmac_get_stats64() also reads the fields without any synchronization.

stmmac_rx() does the same accumulation, and it is unchanged at the end
of the series.

> @@ -5883,7 +5887,8 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
>  
>  		if (priv->extend_desc)
>  			stmmac_rx_extended_status(priv, &priv->xstats, rx_q->dma_erx + entry);
> -		if (unlikely(status == discard_frame)) {
> +
> +		if (unlikely(status & discard_frame)) {

[Severity: Low]

Changing == to & here and in stmmac_rx_zc() also changes the normal RX
path on dwmac4/GMAC4/GMAC5. Should the commit message mention this?

dwmac4_wrback_get_rx_status() sets ret = discard_frame when
RDES3_ERROR_SUMMARY is set. It then ORs in csum_none for IP header or
payload errors:

	if (rdes1 & RDES1_IP_HDR_ERROR) {
		x->ip_hdr_err++;
		ret |= csum_none;
	}

So a frame with both an L2 error and an IP checksum error reports
discard_frame | csum_none.

Before this patch, such a frame failed the == test. It was run through
XDP and passed to napi_gro_receive() with CHECKSUM_NONE. Now it is
dropped and counted in rx_errors.

The new behaviour looks correct. It stops errored frames from reaching
the stack, which has been possible since commit 644b8437ccef9e ("net:
stmmac: dwmac4: report Rx checksum errors in status").

However, the commit message presents the operator change only as a
result of the enh_desc/norm_desc normalization, and limits the scope to
AF_XDP zero-copy. Could it describe this GMAC4 change and reference
644b8437ccef9e?

>  			page_pool_put_page(rx_q->page_pool, buf->page, 0, true);
>  			buf->page = NULL;
>  			error = 1;

[Severity: High]

This isn't a bug introduced by this patch. The commit message says the
change lets stmmac_rx() drain split frames, which holds for
dwmac100/dwmac1000.

GMAC4/XGMAC report non-last descriptors as a bare rx_not_ls. On those
cores, with an XDP program attached, are there still paths in
stmmac_rx() that drop a non-last descriptor without setting error?

When the XDP verdict is STMMAC_XDP_CONSUMED:

				if (xdp_res & STMMAC_XDP_CONSUMED) {
					...
					skb = NULL;

					if (unlikely((status & rx_not_ls)))
						goto read_again;

error is still 0 here, so the next fragment goes through XDP as a new
frame. With a 1-3 byte tail, wouldn't buf1_len -= ETH_FCS_LEN underflow?

For XDP_TX/XDP_REDIRECT:

				} else if (xdp_res & (STMMAC_XDP_TX |
						      STMMAC_XDP_REDIRECT)) {
					xdp_status |= xdp_res;
					buf->page = NULL;
					goto next;
				}

goto next clears in_progress even when rx_not_ls is set. The loop head
then resets error and len, and the tail is reparsed with len == 0.

When napi_build_skb() fails:

				rx_dropped++;
				count++;
				goto drain_data;

error is not set here either, so a later descriptor can build an skb from
only the end of the frame.

This is the same class of bug the patch fixes in stmmac_rx_zc(). An
on-link peer can trigger it, since GMAC_CONFIG_JE is always set on
GMAC4.

It looks like later patches in the same series fix it: "net: stmmac:
drop multi-buffer frames in XDP mode" and "net: stmmac: rework stmmac_rx
to support XDP rx multi-buff". After those, XDP and stmmac_build_skb()
only run on the last descriptor, and failures go to error_free_frag.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261018-stmmac-rx-mb-v8-0-5f58c0b25849%40oss.qualcomm.com

