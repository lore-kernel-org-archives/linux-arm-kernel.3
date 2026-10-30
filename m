Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA921606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 07:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Mxd6tEKE;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=egwcX+8X
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=V5bEb14IbCY961eMOmldfCaSm0KVSkWAONGvshKpwVE=; b=Mxd6tEKE1Vhf+SLFHzpSvzeL46
	ruFEaE6a2WtUmKhPQ74eOkstcWROtiqKsBSa5ftaE9exrs3T6PTSQV2Yz5MeJ6oqHdD0dz1dRVLEd
	sfMwCt4pAay+SUAMYx4u5SpHcgrQuXNy6QB20ekqVCUKrgpGGZ+KFQAAVLpLHFa2/Q+6Js0eniOeo
	IGAP5ygf9Z/u6C+ilgpN/m4fYw/yah2vwHv4uaIb1IW7hSXydAXJp8PeD9DmOUzIwY+XNRjFExdPM
	A7t+PxRamo+VNhjZsPTFjRGqX2ww15I7P82j4rOxk0dXCocLCm6zhLisISBEELMSPgVl17kw4owe8
	Rqi7Jm8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMhNb-0000000B2fk-0wb2;
	Fri, 30 Oct 2026 07:50:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMhNa-0000000B2fc-0FwS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 07:50:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7F49960617;
	Fri, 30 Oct 2026 07:50:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 395491F000C1;
	Fri, 30 Oct 2026 07:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793346625;
	bh=V5bEb14IbCY961eMOmldfCaSm0KVSkWAONGvshKpwVE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=egwcX+8Xqhtiv3+N/J9yEFZ5Jaqh5yz73/qLNz8TPdmGycr17VEc41fpz+RSamVLA
	 aYo58M7iwJc+AlAlrYmi4bdwuvhjeSEiuZX2ygyB+l0QS4ybkDfKRT7omcobjlqHe5
	 vZ1e+RF0J0/P9Xro1cK47ERo8khbRuQz24JV2zji498bHdGKUX9aZa7uCNvzpjfkeh
	 YLKcmaQKBTisGbteeTIZx9I83bd59etctdl7ZknvL69KVZh7T6TjlU0dY/jmOzOCiU
	 sWJ+0Iu8wLgQDvfIgT2M2MZxWDoNRkW0JhAI1/4TZ47T6Buf7IhzS36yxZBs+RN/ZJ
	 VBsgk5g11Ulvw==
Subject: Re: [PATCH net v2 1/6] net: stmmac: take ownership of saved RX state
 at poll entry
From: netdev-bot+sashiko@kernel.org
To: lorenzo.bianconi@oss.qualcomm.com
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, ast@kernel.org,
 daniel@iogearbox.net, hawk@kernel.org, john.fastabend@gmail.com,
 sdf@fomichev.me, Jose.Abreu@synopsys.com, boon.leong.ong@intel.com,
 o.rempel@pengutronix.de, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org
Date: Fri, 30 Oct 2026 07:50:23 +0000
Message-ID: <179334662373.3134.1104093737847451563@kernel.org>
In-Reply-To: <20261027-stmmac-xdp-fixes-v2-1-10eae8a093a8@oss.qualcomm.com>
References: <20261027-stmmac-xdp-fixes-v2-1-10eae8a093a8@oss.qualcomm.com>
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The commit message gives the trigger as a saved partial packet
  completing "with a poll budget of one".

Pre-existing issues:
- [High] In stmmac_rx(), if napi_build_skb() fails on a non-last
  descriptor, the code recycles the page, does rx_dropped++ and count++,…
- [High] On resume, the RX ring is handed back to the DMA without its
  buffers being refilled or their addresses rewritten, and this patch…

--

net: stmmac: take ownership of saved RX state at poll entry

This patch makes stmmac_rx() and stmmac_rx_zc() take the saved
partial-frame state at poll entry, clear it right away, and save it again
only if the frame is still incomplete when the loop exits. The in-progress
flag is now tracked separately from the status of the last descriptor
read. The saved skb is also dropped in stmmac_reset_rx_queue() and
__free_dma_rx_desc_resources().

> When a saved partial packet completes with a poll budget of one, the
> old loop can leave state_saved and state.skb pointing at an skb that
> has already been delivered or freed. The next poll then reuses that
> pointer, causing a use-after-free or double free.

[Severity: Low]
Could the commit message say how a budget of one happens on a running
system?

With limit > 1, the old else branch cleared state_saved on the second loop
iteration. So the stale pointer only survives when limit == 1. Normal
net_rx_action() polling passes the NAPI weight.

stmmac_napi_poll_rx() passes its budget straight through:

    work_done = stmmac_rx(priv, budget, chan);

Busy polling can supply a budget of 1. In ep_eventpoll_ioctl(), EPIOCSPARAMS
only asks for CAP_NET_ADMIN above NAPI_POLL_WEIGHT:

    if (epoll_params.busy_poll_budget > NAPI_POLL_WEIGHT &&
        !capable(CAP_NET_ADMIN))
            return -EPERM;

SO_BUSY_POLL_BUDGET in sk_setsockopt() can also be lowered without
privilege.

So an unprivileged local user who receives multi-descriptor frames can
reach the use-after-free. Would it be worth saying so in the changelog, so
stable reviewers can see this is a user-triggerable memory-safety fix?

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 9ded31150fbe6..fa7108919e90d 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c

[ ... ]

> @@ -6041,10 +6051,8 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
>  		/* Remove FCS if needed */
>  		if (!fcs_stripped && pskb_trim(skb, len)) {
>  			dev_kfree_skb_any(skb);
> -			skb = NULL;
>  			rx_dropped++;
> -			count++;
> -			continue;
> +			goto next;
>  		}

[Severity: High]
This is a pre-existing issue, but what happens in stmmac_rx() when
napi_build_skb() fails on a descriptor that is not the last one in the
frame?

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

error stays 0 and skb stays NULL, and drain_data jumps back to read_again
because rx_not_ls is set. The next descriptor of the same hardware frame
passes the error checks and takes the if (!skb) frame-start path. A new
skb is then built from only the tail of the frame.

len still counts the dropped prefix, so the pskb_trim(skb, len) above does
nothing and the FCS is not removed. The trailing payload bytes are then
delivered as a standalone Ethernet frame.

With Split Header active, stmmac_rx_buf1_len() returns 0 for any
descriptor after the first:

    if (priv->sph_active && len)
            return 0;

That leaves the rebuilt skb with no linear data, only the buf2 frag.
Wouldn't eth_type_trans() then hit the BUG() in __skb_pull()?

    eth_type_trans()
      eth_skb_pull_mac()
        skb_pull_inline(skb, ETH_HLEN)
          __skb_pull()
            skb->len < skb->data_len -> BUG()

If the stale page bytes look like a VLAN header, stmmac_rx_vlan() can hit
the same BUG() through skb_pull(skb, VLAN_HLEN).

An on-link peer sending a frame that spans several descriptors, plus a
GFP_ATOMIC allocation failure, is enough to trigger this. With this patch,
the in_progress tracking also carries this skb == NULL, error == 0 state
across a poll boundary. Nothing else in the series seems to address it.

Should the napi_build_skb() failure path set error = 1, so the rest of the
frame is thrown away?

[ ... ]

> @@ -8421,6 +8430,9 @@ static void stmmac_reset_rx_queue(struct stmmac_priv *priv, u32 queue)
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
This is a pre-existing issue, but this new free happens just before
stmmac_resume() re-arms the RX ring in place:

stmmac_resume()
    stmmac_reset_queues_param()
        stmmac_reset_rx_queue()    <- frees state.skb, rewinds cur/dirty
    stmmac_free_tx_skbufs()
    stmmac_clear_descriptors()
        stmmac_clear_rx_descriptors()
            stmmac_init_rx_desc()  <- sets OWN only
    stmmac_hw_setup()
        stmmac_init_dma_engine()   <- restores the tail pointer

No refill and no stmmac_set_desc_addr() runs before the DMA restarts. That
means two kinds of descriptors get re-armed with a bad buffer address:

  - slots stmmac_rx() consumed whose refill failed. stmmac_rx_refill()
    uses GFP_ATOMIC and stops at the first page_pool_alloc_pages()
    failure, so buf->page is left NULL.

  - descriptors the DMA wrote back after napi_disable() in
    stmmac_suspend() and before stmmac_stop_all_dma().

On dwmac4/xgmac, write-back overwrites des0/des1, which hold the buffer
address in read format (dwmac4_wrback_get_rx_vlan_tci() reads des0 as the
VLAN tag). dwmac4_rd_init_rx_desc() only sets OWN/BUF1V/IOC in RDES3. The
DMA would then write to whatever status data is left in those words.

On norm/enh descriptors, the old address stays in des2. The slots most
likely to have failed refill are the ones whose pages went into the saved
partial skb. The dev_kfree_skb_any() above now returns those pages, still
DMA-mapped, to the page_pool just before the hardware is re-armed to write
into them.

Can this lead to DMA into pages the pool has already handed to another
descriptor or released?

Also, if DMA completes into a slot with buf->page == NULL, stmmac_rx()
calls page_address(NULL) and napi_build_skb() on it, which would oops.

The commit message notes that "the RX buffer addresses are not
reprogrammed" on this path. Would a full fix need stmmac_resume() to
refill and reprogram every RX descriptor before setting OWN?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261027-stmmac-xdp-fixes-v2-0-10eae8a093a8%40oss.qualcomm.com

