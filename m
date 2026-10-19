Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2410B606A33E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 17:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1KcPQ63w;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ec+TTAVM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l/5je6k7rCChD+zg8W/wKE+SGiPLHXlmUObVm64cOV8=; b=1KcPQ63wWEdsUT506dBRwtagUt
	+PAzXmsSsyOftRS3wzeXJKQiVvJrrZs72XdZM3wOXeOA/BTyuVvpTm66JaFuY7qQS8rOW2mI4W9v8
	Ak1jyaled/j4shgoOQlqC6Fe1XeV18VQ+kdKWPmbuivjE1Rd5H2oSQKFgvfzwcOKfd01OadTmyrqn
	EKiV/CqmMhRQ/p8DgIB1icR4g8lFwiKV606AnISWa5gkk3VQIFihyphTfNZi9+c0W6L2BJSVaFQp2
	XUZY0cB6n0eEsaYOnzjen5wOru5UjIiqXOXU2E2Whohngmc43KzKgnALwUELT+pB4RLqa3HVFYQak
	nHU0Rk5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIrJq-000000085xO-3StI;
	Mon, 19 Oct 2026 17:38:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIrJn-000000085vs-0LBk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 17:38:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 850EC60220;
	Mon, 19 Oct 2026 17:38:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EB011F000C6;
	Mon, 19 Oct 2026 17:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792431518;
	bh=l/5je6k7rCChD+zg8W/wKE+SGiPLHXlmUObVm64cOV8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Ec+TTAVMpIXnFvD3nnTuDnPrPed7rwt5u8bfmSlR8IOnUSHLngT9RYARtt2t4nrbL
	 LQoXxFhwLOkwulgWgarnktUCn6GpT1Tzp1CpkEgMn35qU90OeBhOE2WVgoZb5hGt0d
	 C7Gq8DVAmV89ixvQSkgdjP3gE/QpCg+NUDTr4M8LvCZHtLYM4e2+bxgPWNZvKFeFiO
	 m8yOYkvZzAlqdeGPDiOnbFMigbsHAy/aSQnfcM/82KPVN7JyYrb6ZtGpQB35C7et0g
	 a7kdrttnaeX4+2Vet0T8g5Q4XFtq+FhHC2oL4PZfPZRDMTiRnK55T3uhLmHG3YYxy2
	 W4vaWUPvoV4ZQ==
Subject: Re: [PATCH net-next v8 3/5] net: stmmac: drop multi-buffer frames in XDP mode
From: netdev-bot+sashiko@kernel.org
To: lorenzo.bianconi@oss.qualcomm.com
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, ast@kernel.org,
 daniel@iogearbox.net, hawk@kernel.org, john.fastabend@gmail.com,
 sdf@fomichev.me, Jose.Abreu@synopsys.com, boon.leong.ong@intel.com,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 bpf@vger.kernel.org
Date: Mon, 19 Oct 2026 17:38:36 +0000
Message-ID: <179243151663.3135.5003290847659035107@kernel.org>
In-Reply-To: <20261018-stmmac-rx-mb-v8-3-5f58c0b25849@oss.qualcomm.com>
References: <20261018-stmmac-rx-mb-v8-3-5f58c0b25849@oss.qualcomm.com>
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

- [Low] The commit message does not describe what the patch actually
  does, and it hides changes to the non-XDP RX path.

--

net: stmmac: drop multi-buffer frames in XDP mode

When an XDP program is attached, stmmac_rx() now drops any frame that
spans more than one descriptor, or that uses the second buffer of a
descriptor. This prevents the XDP program from running on partial
frames. Both XDP_CONSUMED and XDP_TX/XDP_REDIRECT now finish the packet
via next instead of re-parsing the following descriptor.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index efa88cd359dac..e929cc0f23125 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -5888,18 +5888,23 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
>  		if (priv->extend_desc)
>  			stmmac_rx_extended_status(priv, &priv->xstats, rx_q->dma_erx + entry);
>  
> -		if (unlikely(status & discard_frame)) {
> -			page_pool_put_page(rx_q->page_pool, buf->page, 0, true);
> -			buf->page = NULL;
> +		if (unlikely(!error && (status & discard_frame))) {
>  			error = 1;
>  			if (!priv->hwts_rx_en)
>  				rx_errors++;
>  		}

[Severity: Low]
The commit message says the patch will:

  "mark it as errored as soon as a non-last descriptor, or a descriptor
  using its second buffer, is seen while an XDP program is attached,
  drain and release every descriptor - including the last."

Is this description accurate? This hunk removes the only
page_pool_put_page() call on the error path in stmmac_rx(). After the
patch, none of the drop paths returns a page to the page_pool. That
covers the hardware discard_frame drop, the new XDP SG drop and the new
buf2 drop.

The dropped buffers stay in rx_q->buf_pool[], and stmmac_rx_refill()
reuses them in place because it only allocates when the slot is empty:

stmmac_rx_refill() {
    ...
		if (!buf->page) {
			buf->page = page_pool_alloc_pages(rx_q->page_pool, gfp);
    ...
}

The reuse itself looks safe. All three drop checks run before any
dma_sync_single_for_cpu() or net_prefetch() on the buffer.

The new !error guard also changes rx_errors from once per descriptor
carrying discard_frame to once per frame. Both changes apply whether or
not an XDP program is attached, but the subject says "in XDP mode".

On dwmac100/dwmac1000, the previous patch in this series makes non-last
descriptors report discard_frame | rx_not_ls. So an errored frame
spread over N descriptors used to add N-1 or N to rx_errors, and now
adds 1.

Separately, the new buf2 drop in the later hunk doesn't set error, even
though the message says the frame is marked as errored:

	if (unlikely(stmmac_xdp_is_enabled(priv) && buf2_len)) {
		rx_dropped++;
		goto next;
	}

It only behaves the same way because, in XDP mode, that descriptor is
always the last one.

This patch carries a Fixes: tag for net/stable. Could the commit message
describe the in-place buffer reuse and the rx_errors accounting change
for the non-XDP path? The later "net: stmmac: rework stmmac_rx to
support XDP rx multi-buff" patch keeps both the !error guard and the
in-place reuse, so it doesn't change the picture here.

> -		if (unlikely(error && (status & rx_not_ls)))
> -			goto read_again;
> +		/* We do not support SG in XDP mode */
> +		if (unlikely(!error && (status & rx_not_ls) &&
> +			     stmmac_xdp_is_enabled(priv))) {
> +			rx_dropped++;
> +			error = 1;
> +		}

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261018-stmmac-rx-mb-v8-0-5f58c0b25849%40oss.qualcomm.com

